<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2019 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 老猫 <thinkcmf@126.com>
// +----------------------------------------------------------------------
namespace app\portal\controller;

use cmf\controller\HomeBaseController;
use app\portal\model\PortalCategoryModel;
use app\portal\service\PostService;
use app\portal\model\PortalPostModel;
use think\Db;

class ArticleController extends HomeBaseController
{
    /**
     * 文章详情
     * @return mixed
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function index()
    {

        $portalCategoryModel = new PortalCategoryModel();
        $postService         = new PostService();
        $articleId  = $this->request->param('id', 0, 'intval');
//        print_r($articleId);
        $categoryId = $this->request->param('cid', 0, 'intval');
//        print_r($categoryId);
        $article    = $postService->publishedArticle($articleId, $categoryId);
        $article_one =$postService->publishedArticle($articleId, $categoryId);
        $res_one = Db::table('cmf_keyword')->select()->toArray();

        $keysworder = $article['post_content'];

        $guanggao = Db::table('cmf_portal_category_post')->where('post_id="'.$articleId.'"')->find();
        $guanggao_one = Db::table('cmf_advertisement')->where('category_id="'.$guanggao['category_id'].'"')->select()->toArray();
        $fenku = Db::table('cmf_portal_category_post')->where('post_id="'.$articleId.'"')->find();

        $fenku_one = Db::table('cmf_createrecords')->where('category_id like "%'.$fenku['category_id'].'%"')->find();

//        print_r($fenku_one['surface']);die;
        if(empty($fenku_one['surface'])){
//        print_r($fenku_two);die;
//        Db::table()
//        echo"<pre>";
//        print_r($fenku);die;
//        foreach($res_one as $key=>$val){
//
//                for($i=0;$i<=$val['frequency'];$i++){
//                    $key = array($val['keyworder']=>'<a href="'.$val['url'].'">'.$val['keyworder'].'</a>');
//                    $keysworder = str_replace(array_keys($key),array_values($key),$keysworder,);
//                    continue;
//                }
//
//        }
            $res = Db::table('cmf_createrecords')->group('surface')->select()->toarray();
            if(empty($res)){
                return $this->fetch(':index');
            }else{
                $array = '';
                foreach($res as $key=>$val){
                    $array[]=  DB::table($val['surface'])->where('biao','not null')->select()->toArray();
                }
                $fenzu ='';
                foreach($array as $k=>$v){
                    foreach($v as $ky=>$ve){
                        $fenzu[] = $ve;
                    }
                }
                $this->assign('customfield',$fenzu);

            }
            foreach($res_one as $key=>$val){
                $keysworder =  preg_replace('/'.$val['keyworder'].'/', '<a style="color:#ff0000" href="' .$val['url'].'">'.$val['keyworder'].'</a>',$keysworder,$val['frequency']);
//            $key = array($val['keyworder']=>'<a href="'.$val['url'].'">'.$val['keyworder'].'</a>');
//            $keysworder = str_replace(array_keys($key),array_values($key),$keysworder);
            }

            $article['post_content']=$keysworder;
            if (empty($article_one)) {
                abort(404, '文章不存在!');
            }


            $prevArticle = $postService->publishedPrevArticle($articleId, $categoryId);
            $nextArticle = $postService->publishedNextArticle($articleId, $categoryId);

            $tplName = 'article';

            if (empty($categoryId)) {
                $categories = $article['categories'];

                if (count($categories) > 0) {
                    $this->assign('category', $categories[0]);
                } else {
                    abort(404, '文章未指定分类!');
                }

            } else {
                $category = $portalCategoryModel->where('id', $categoryId)->where('status', 1)->find();

                if (empty($category)) {
                    abort(404, '文章不存在!');
                }

                $this->assign('category', $category);

                $tplName = empty($category["one_tpl"]) ? $tplName : $category["one_tpl"];
            }

            Db::name('portal_post')->where('id', $articleId)->setInc('post_hits');
            $res = Db::table('cmf_portal_tag_post')->alias('a')
                ->join('cmf_portal_tag b','a.tag_id=b.id')
                ->where(array('a.post_id'=>$articleId))
                ->field('b.name,a.post_id')
                ->Distinct(true)
                ->select()
                ->toArray();
            hook('portal_before_assign_article', $article);
//热门文章
            $res_one = Db::table('cmf_portal_category_post')->where('category_id="'.$articleId.'"')->select()->toArray();
            $post_id='';
            foreach ($res_one as $key=>$val){
                $post_id .= $val['post_id'].',';
            }
            $postid = substr($post_id,0,-1);
            $labels = Db::table('cmf_portal_post')->order('post_hits desc')->limit(2)->select();
            $labels_one = json_decode(json_encode($labels,true),true);
            $post_id = '';
            foreach($labels as $key=>$val){
                $post_id .=$val['id'].',';
            }
            $postid_one = substr($post_id,0,-1);
            $label_one = Db::table('cmf_portal_tag')->alias('a')
                ->join('cmf_portal_tag_post b','a.id=b.tag_id')
                ->where('b.post_id in('.$postid_one.')')
                ->field('b.tag_id,a.name')
                ->group('a.name')
                ->select();

//        print_r($fenku_two);die;
//            $this->assign('twoarticle',$fenku_two);
            $this->assign('advertising',$guanggao_one);
            $this->assign('labellist',$label_one);
            $this->assign('label',$res);
            $this->assign('article', $article);
            $this->assign('prev_article', $prevArticle);
            $this->assign('next_article', $nextArticle);

            $tplName = empty($article['more']['template']) ? $tplName : $article['more']['template'];

            return $this->fetch("/$tplName");

        }else{
            $res = Db::table('cmf_createrecords')->group('surface')->select()->toarray();
            if(empty($res)){
                return $this->fetch(':index');
            }else{
                $array = '';
                foreach($res as $key=>$val){
                    $array[]=  DB::table($val['surface'])->where('biao','not null')->select()->toArray();
                }
                $fenzu ='';
                foreach($array as $k=>$v){
                    foreach($v as $ky=>$ve){
                        $fenzu[] = $ve;
                    }
                }
                $this->assign('customfield',$fenzu);

            }
            //        print_r($fenku_two);die;
//        Db::table()
//        echo"<pre>";
//        print_r($fenku);die;
//        foreach($res_one as $key=>$val){
//
//                for($i=0;$i<=$val['frequency'];$i++){
//                    $key = array($val['keyworder']=>'<a href="'.$val['url'].'">'.$val['keyworder'].'</a>');
//                    $keysworder = str_replace(array_keys($key),array_values($key),$keysworder,);
//                    continue;
//                }
//
//        }
            $fenku_two = Db::table($fenku_one['surface'])->where('post_id="'.$articleId.'"')->find();

            foreach($res_one as $key=>$val){
                $keysworder =  preg_replace('/'.$val['keyworder'].'/', '<a style="color:#ff0000" href="' .$val['url'].'">'.$val['keyworder'].'</a>',$keysworder,$val['frequency']);
//            $key = array($val['keyworder']=>'<a href="'.$val['url'].'">'.$val['keyworder'].'</a>');
//            $keysworder = str_replace(array_keys($key),array_values($key),$keysworder);
            }
            $article['post_content']=$keysworder;
            if (empty($article)) {
                abort(404, '文章不存在!');
            }


            $prevArticle = $postService->publishedPrevArticle($articleId, $categoryId);
            $nextArticle = $postService->publishedNextArticle($articleId, $categoryId);

            $tplName = 'article';

            if (empty($categoryId)) {
                $categories = $article['categories'];

                if (count($categories) > 0) {
                    $this->assign('category', $categories[0]);
                } else {
                    abort(404, '文章未指定分类!');
                }

            } else {
                $category = $portalCategoryModel->where('id', $categoryId)->where('status', 1)->find();

                if (empty($category)) {
                    abort(404, '文章不存在!');
                }

                $this->assign('category', $category);

                $tplName = empty($category["one_tpl"]) ? $tplName : $category["one_tpl"];
            }

            Db::name('portal_post')->where('id', $articleId)->setInc('post_hits');
            $res = Db::table('cmf_portal_tag_post')->alias('a')
                ->join('cmf_portal_tag b','a.tag_id=b.id')
                ->where(array('a.post_id'=>$articleId))
                ->field('b.name,a.post_id')
                ->Distinct(true)
                ->select()
                ->toArray();
            hook('portal_before_assign_article', $article);
//热门文章
            $res_one = Db::table('cmf_portal_category_post')->where('category_id="'.$articleId.'"')->select()->toArray();
            $post_id='';
            foreach ($res_one as $key=>$val){
                $post_id .= $val['post_id'].',';
            }
            $postid = substr($post_id,0,-1);
            $labels = Db::table('cmf_portal_post')->order('post_hits desc')->limit(2)->select();
            $labels_one = json_decode(json_encode($labels,true),true);
            $post_id = '';
            foreach($labels as $key=>$val){
                $post_id .=$val['id'].',';
            }
            $postid_one = substr($post_id,0,-1);
            $label_one = Db::table('cmf_portal_tag')->alias('a')
                ->join('cmf_portal_tag_post b','a.id=b.tag_id')
                ->where('b.post_id in('.$postid_one.')')
                ->field('b.tag_id,a.name')
                ->group('a.name')
                ->select();

//            dump($fenku_two);
//            dump($article);die;
            $this->assign('twoarticle',$fenku_two);
            $this->assign('advertising',$guanggao_one);
            $this->assign('labellist',$label_one);
            $this->assign('label',$res);
            $this->assign('article', $article);
            $this->assign('prev_article', $prevArticle);
            $this->assign('next_article', $nextArticle);

            $tplName = empty($article['more']['template']) ? $tplName : $article['more']['template'];
//            dump($tplName);die;
            return $this->fetch("/$tplName");
        }

    }

    // 文章点赞
    public function doLike()
    {
        $this->checkUserLogin();
        $articleId = $this->request->param('id', 0, 'intval');


        $canLike = cmf_check_user_action("posts$articleId", 1);

        if ($canLike) {
            Db::name('portal_post')->where('id', $articleId)->setInc('post_like');

            $this->success("赞好啦！");
        } else {
            $this->error("您已赞过啦！");
        }
    }

}
