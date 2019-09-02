<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2019 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 小夏 < 449134904@qq.com>
// +----------------------------------------------------------------------
namespace app\portal\controller;

use cmf\controller\AdminBaseController;
use app\portal\model\PortalPostModel;
use app\portal\service\PostService;
use app\portal\model\PortalCategoryModel;
use think\Db;
use app\admin\model\ThemeModel;

class AdminArticleController extends AdminBaseController
{
    /**
     * 文章列表
     * @adminMenu(
     *     'name'   => '文章管理',
     *     'parent' => 'portal/AdminIndex/default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '文章列表',
     *     'param'  => ''
     * )
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $content = hook_one('portal_admin_article_index_view');
        if (!empty($content)) {
            return $content;
        }
        $param = $this->request->param();
        $categoryId = $this->request->param('category', 0, 'intval');
        $postService = new PostService();
        $data        = $postService->adminArticleList($param);
        $data->appends($param);
//        echo"<pre>";
//        print_r($categoryId);die;
        $portalCategoryModel = new PortalCategoryModel();
        $categoryTree        = $portalCategoryModel->adminCategoryTree($categoryId);
        $this->assign('start_time', isset($param['start_time']) ? $param['start_time'] : '');
        $this->assign('end_time', isset($param['end_time']) ? $param['end_time'] : '');
        $this->assign('keyword', isset($param['keyword']) ? $param['keyword'] : '');
        $this->assign('articles', $data->items());
        $this->assign('category_tree', $categoryTree);
        $this->assign('category', $categoryId);
        $this->assign('page', $data->render());
        return $this->fetch();
    }

    /**
     * 添加文章
     * @adminMenu(
     *     'name'   => '添加文章',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加文章',
     *     'param'  => ''
     * )
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function add()
    {
        $content = hook_one('portal_admin_article_add_view');

        if (!empty($content)) {
            return $content;
        }

        $themeModel        = new ThemeModel();
        $articleThemeFiles = $themeModel->getActionThemeFiles('portal/Article/index');
        $this->assign('article_theme_files', $articleThemeFiles);
        return $this->fetch();
    }

    /**
     * 添加文章提交
     * @adminMenu(
     *     'name'   => '添加文章提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加文章提交',
     *     'param'  => ''
     * )
     */
    public function addPost()
    {
        if ($this->request->isPost()) {
            $data = $this->request->param();
//            $bbas = $data['post']['more']['bannes'];

            $homethumb = $data['post']['more']['homethumb'];
//            $res = Db::table('cmf_portal_post')->insert(['bannes'=>$bbas]);
            //状态只能设置默认值。未发布、未置顶、未推荐
            $data['post']['post_status'] = 0;
            $data['post']['is_top'] = 0;
            $data['post']['recommended'] = 0;

            $post = $data['post'];

            $result = $this->validate($post, 'AdminArticle');
            if ($result !== true) {
                $this->error($result);
            }

            $portalPostModel = new PortalPostModel();

            if (!empty($data['photo_names']) && !empty($data['photo_urls'])) {
                $data['post']['more']['photos'] = [];
                foreach ($data['photo_urls'] as $key => $url) {
                    $photoUrl = cmf_asset_relative_url($url);
                    array_push($data['post']['more']['photos'], ["url" => $photoUrl, "name" => $data['photo_names'][$key]]);
                }
            }

            if (!empty($data['file_names']) && !empty($data['file_urls'])) {
                $data['post']['more']['files'] = [];
                foreach ($data['file_urls'] as $key => $url) {
                    $fileUrl = cmf_asset_relative_url($url);
                    array_push($data['post']['more']['files'], ["url" => $fileUrl, "name" => $data['file_names'][$key]]);
                }
            }


            $portalPostModel->adminAddArticle($data['post'], $data['post']['categories']);

            $data['post']['id'] = $portalPostModel->id;
            $data['posts']['post_id'] = $data['post']['id'];
            $data['posts']['category_id'] = $data['post']['categories'];
            if (empty($data['posts']['biao'])) {
                Db::table('cmf_portal_post')->where('id="' . $data['post']['id'] . '"')->update(['homethumb' => $homethumb]);
                $hookParam = [
                    'is_add' => true,
                    'article' => $data['post']
                ];
                hook('portal_admin_after_save_article', $hookParam);
                $this->success('添加成功!', url('AdminArticle/edit', ['id' => $portalPostModel->id]));
            } else {

                Db::table($data['posts']['biao'])->insert($data['posts']);
                Db::table('cmf_portal_post')->where('id="' . $data['post']['id'] . '"')->update(['homethumb' => $homethumb]);
                $hookParam = [
                    'is_add' => true,
                    'article' => $data['post']
                ];
                hook('portal_admin_after_save_article', $hookParam);

                $this->success('添加成功!', url('AdminArticle/edit', ['id' => $portalPostModel->id]));
            }

        }


    }

    /**
     * 编辑文章
     * @adminMenu(
     *     'name'   => '编辑文章',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑文章',
     *     'param'  => ''
     * )
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function edit()
    {
//        $PHP_SELF=$_SERVER['PHP_SELF'];
//        $url_one='http://'.$_SERVER['HTTP_HOST'].substr($PHP_SELF,0,strrpos($PHP_SELF,'/')+1);die;
        $content = hook_one('portal_admin_article_edit_view');

        if (!empty($content)) {
            return $content;
        }

        $id = $this->request->param('id', 0, 'intval');

        $portalPostModel = new PortalPostModel();
        $post            = $portalPostModel->where('id', $id)->find();
        $postCategories      = $post->categories()->alias('a')->column('a.name', 'a.id');
        $postCategoryIds = implode(',', array_keys($postCategories));

        $res = Db::table('cmf_createrecords')->where('category_id like "%'.$postCategoryIds.'%"')->field('surface')->find();

        if(empty($res['surface'])){
            $new=[];
            $campos = $this->request->param();
            //SELECT * FROM `cmf_createrecords` WHERE category_id LIKE '%6%' AND `ziduan` IS NOT NULL;
            $themeModel         = new ThemeModel();
            $articleThemeFiles = $themeModel->getActionThemeFiles('portal/Article/index');
            $this->assign('article_theme_files', $articleThemeFiles);
            $this->assign('mobanone', $new);
            $this->assign('post', $post);
            $this->assign('post_categories', $postCategories);
            $this->assign('post_category_ids', $postCategoryIds);
            return $this->fetch();
        }else{
            $res_one = Db::table($res['surface'])->where('category_id="'.$postCategoryIds.'" and post_id="'.$post['id'].'"')->find();
            $post = array_merge($post->toArray(),$res_one);

            $campos = $this->request->param();
//        print_r(5);die;
//SELECT * FROM `cmf_createrecords` WHERE category_id LIKE '%6%' AND `ziduan` IS NOT NULL;
            $moban_one = Db::table('cmf_createrecords')
                ->where('category_id like "%'.$postCategoryIds.'%"')
                ->where('ziduan','not null')
                ->field('edittemplates')
                ->select();
//        dump($moban_one);die;
            unset($res_one['model_id']);
            unset($res_one['post_id']);
            unset($res_one['biao']);
            unset($res_one['category_id']);
            $new = [];
//dump($moban_one);die;
            foreach ($moban_one as $key=>$val){

//            if(strpos($val['edittemplates'],' name="posts['.$k.']""') != false){
//                $new[] = $val['edittemplates'];continue;
//            }
//            if(strpos($val['edittemplates'],'posts[radios]') != false){
//                $new[] = $val['edittemplates'];continue;
//            }
//            if(strpos($val['edittemplates'],'type="checkbox"') != false){
//                $new[] = $val['edittemplates'];continue;
//            }
                $i = 0;
                foreach($res_one as $k=>$v){

                    $w = str_replace('<option value="'.$v.'">'.$v.'</option>','<option selected value="'.$v.'">'.$v.'</option>',$val['edittemplates']);
                    $e = str_replace('<input type="radio" name="posts[redios]" value="'.$v.'" >'.$v.'','<input type="radio" name="posts[redios]" value="'.$v.'"  checked>'.$v.'',$w);
                    $q = str_replace('<input type="checkbox" name="post[chekebok]"  value="'.$v.'">'.$v.'','<input type="checkbox" name="post[chekebok]"  value="'.$v.'" checked>'.$v.'',$e);
                    $s = str_replace('<img src="http://www.zhihuocms.com/upload/'.$k.'"
                            id="thumbnail-preview"
                            width="135" style="cursor: pointer"/>','<img src="http://www.zhihuocms.com/upload/'.$v.'"
                            id="thumbnail-preview"
                            width="135" style="cursor: pointer"/>',$q);
                    $a = str_replace('<input type="text" class="form-control" name="posts['.$k.']" value="'.$k.'">','<input type="text" class="form-control" name="posts['.$k.']" value="'.$v.'">',$s);
                    $g = str_replace('<script type="text/plain" id="contents" name="posts['.$k.']"></script>','<script type="text/plain" id="contents" name="posts['.$k.']">'.$v.'</script>',$a);
                    $r = str_replace('pos['.$k.']', $v,$g);

                    if($r != $val['edittemplates']){
                        $new[] = $r;
                    }
                    $i++;
                }


            }

            $themeModel         = new ThemeModel();
            $articleThemeFiles = $themeModel->getActionThemeFiles('portal/Article/index');
            $this->assign('mobanone', $new);
            $this->assign('article_theme_files', $articleThemeFiles);
            $this->assign('post', $post);
            $this->assign('post_categories', $postCategories);
            $this->assign('post_category_ids', $postCategoryIds);

            return $this->fetch();
        }

    }

    /**
     * 编辑文章提交
     * @adminMenu(
     *     'name'   => '编辑文章提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑文章提交',
     *     'param'  => ''
     * )
     * @throws \think\Exception
     */
    public function editPost()
    {

        if ($this->request->isPost()) {
            $data = $this->request->param();

            $res = Db::table('cmf_createrecords')->where('category_id="'.$data['post']['categories'].'"')->find();
            if(empty($data['posts'])){
                $iids = $data['post']['id'];
//            print_r($iids);die;
                $homethumb = $data['post']['more']['homethumb'];
//            print_r($homethumb);die;
                Db::table('cmf_portal_post')->where('id="'.$iids.'"')->update(['homethumb'=>$homethumb]);
                //需要抹除发布、置顶、推荐的修改。
                unset($data['post']['post_status']);
                unset($data['post']['is_top']);
                unset($data['post']['recommended']);

                $post   = $data['post'];
                $result = $this->validate($post, 'AdminArticle');
                if ($result !== true) {
                    $this->error($result);
                }

                $portalPostModel = new PortalPostModel();

                if (!empty($data['photo_names']) && !empty($data['photo_urls'])) {
                    $data['post']['more']['photos'] = [];
                    foreach ($data['photo_urls'] as $key => $url) {
                        $photoUrl = cmf_asset_relative_url($url);
                        array_push($data['post']['more']['photos'], ["url" => $photoUrl, "name" => $data['photo_names'][$key]]);
                    }
                }

                if (!empty($data['file_names']) && !empty($data['file_urls'])) {
                    $data['post']['more']['files'] = [];
                    foreach ($data['file_urls'] as $key => $url) {
                        $fileUrl = cmf_asset_relative_url($url);
                        array_push($data['post']['more']['files'], ["url" => $fileUrl, "name" => $data['file_names'][$key]]);
                    }
                }

                $portalPostModel->adminEditArticle($data['post'], $data['post']['categories']);

                $hookParam = [
                    'is_add'  => false,
                    'article' => $data['post']
                ];
                hook('portal_admin_after_save_article', $hookParam);

                $this->success('保存成功!');
            }else{
                $res_one = Db::table($res['surface'])->where('post_id="'.$data['post']['id'].'"')->update($data['posts']);
                $iids = $data['post']['id'];
//            print_r($iids);die;
                $homethumb = $data['post']['more']['homethumb'];
//            print_r($homethumb);die;
                Db::table('cmf_portal_post')->where('id="'.$iids.'"')->update(['homethumb'=>$homethumb]);
                //需要抹除发布、置顶、推荐的修改。
                unset($data['post']['post_status']);
                unset($data['post']['is_top']);
                unset($data['post']['recommended']);

                $post   = $data['post'];
                $result = $this->validate($post, 'AdminArticle');
                if ($result !== true) {
                    $this->error($result);
                }

                $portalPostModel = new PortalPostModel();

                if (!empty($data['photo_names']) && !empty($data['photo_urls'])) {
                    $data['post']['more']['photos'] = [];
                    foreach ($data['photo_urls'] as $key => $url) {
                        $photoUrl = cmf_asset_relative_url($url);
                        array_push($data['post']['more']['photos'], ["url" => $photoUrl, "name" => $data['photo_names'][$key]]);
                    }
                }

                if (!empty($data['file_names']) && !empty($data['file_urls'])) {
                    $data['post']['more']['files'] = [];
                    foreach ($data['file_urls'] as $key => $url) {
                        $fileUrl = cmf_asset_relative_url($url);
                        array_push($data['post']['more']['files'], ["url" => $fileUrl, "name" => $data['file_names'][$key]]);
                    }
                }

                $portalPostModel->adminEditArticle($data['post'], $data['post']['categories']);

                $hookParam = [
                    'is_add'  => false,
                    'article' => $data['post']
                ];
                hook('portal_admin_after_save_article', $hookParam);

                $this->success('保存成功!');
            }


        }
    }

    /**
     * 文章删除
     * @adminMenu(
     *     'name'   => '文章删除',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '文章删除',
     *     'param'  => ''
     * )
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function delete()
    {
        $param           = $this->request->param();
        $portalPostModel = new PortalPostModel();

        if (isset($param['id'])) {
            $id           = $this->request->param('id', 0, 'intval');
            $result       = $portalPostModel->where('id', $id)->find();
            $data         = [
                'object_id'   => $result['id'],
                'create_time' => time(),
                'table_name'  => 'portal_post',
                'name'        => $result['post_title'],
                'user_id'     => cmf_get_current_admin_id()
            ];
            $resultPortal = $portalPostModel
                ->where('id', $id)
                ->update(['delete_time' => time()]);
            if ($resultPortal) {
                Db::name('portal_category_post')->where('post_id', $id)->update(['status' => 0]);

                Db::name('portal_tag_post')->where('post_id', $id)->update(['status' => 0]);

                Db::name('recycleBin')->insert($data);
            }
            $this->success("删除成功！", '');

        }

        if (isset($param['ids'])) {
            $ids     = $this->request->param('ids/a');
            $recycle = $portalPostModel->where('id', 'in', $ids)->select();
            $result  = $portalPostModel->where('id', 'in', $ids)->update(['delete_time' => time()]);
            if ($result) {
                Db::name('portal_category_post')->where('post_id', 'in', $ids)->update(['status' => 0]);


                Db::name('portal_tag_post')->where('post_id', 'in', $ids)->update(['status' => 0]);
                foreach ($recycle as $value) {
                    $data = [
                        'object_id'   => $value['id'],
                        'create_time' => time(),
                        'table_name'  => 'portal_post',
                        'name'        => $value['post_title'],
                        'user_id'     => cmf_get_current_admin_id()
                    ];
                    Db::name('recycleBin')->insert($data);
                }
                $this->success("删除成功！", '');
            }
        }
    }

    /**
     * 文章发布
     * @adminMenu(
     *     'name'   => '文章发布',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '文章发布',
     *     'param'  => ''
     * )
     */
    public function publish()
    {
        $param           = $this->request->param();
        $portalPostModel = new PortalPostModel();

        if (isset($param['ids']) && isset($param["yes"])) {
            $ids = $this->request->param('ids/a');
            $portalPostModel->where('id', 'in', $ids)->update(['post_status' => 1, 'published_time' => time()]);
            $this->success("发布成功！", '');
        }

        if (isset($param['ids']) && isset($param["no"])) {
            $ids = $this->request->param('ids/a');
            $portalPostModel->where('id', 'in', $ids)->update(['post_status' => 0]);
            $this->success("取消发布成功！", '');
        }

    }

    /**
     * 文章置顶
     * @adminMenu(
     *     'name'   => '文章置顶',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '文章置顶',
     *     'param'  => ''
     * )
     */
    public function top()
    {
        $param           = $this->request->param();
        $portalPostModel = new PortalPostModel();

        if (isset($param['ids']) && isset($param["yes"])) {
            $ids = $this->request->param('ids/a');

            $portalPostModel->where('id', 'in', $ids)->update(['is_top' => 1]);

            $this->success("置顶成功！", '');

        }

        if (isset($_POST['ids']) && isset($param["no"])) {
            $ids = $this->request->param('ids/a');

            $portalPostModel->where('id', 'in', $ids)->update(['is_top' => 0]);

            $this->success("取消置顶成功！", '');
        }
    }

    /**
     * 文章推荐
     * @adminMenu(
     *     'name'   => '文章推荐',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '文章推荐',
     *     'param'  => ''
     * )
     */
    public function recommend()
    {
        $param           = $this->request->param();
        $portalPostModel = new PortalPostModel();

        if (isset($param['ids']) && isset($param["yes"])) {
            $ids = $this->request->param('ids/a');

            $portalPostModel->where('id', 'in', $ids)->update(['recommended' => 1]);

            $this->success("推荐成功！", '');

        }
        if (isset($param['ids']) && isset($param["no"])) {
            $ids = $this->request->param('ids/a');
            $portalPostModel->where('id', 'in', $ids)->update(['recommended' => 0]);
            $this->success("取消推荐成功！", '');

        }
    }

    /**
     * 文章排序
     * @adminMenu(
     *     'name'   => '文章排序',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '文章排序',
     *     'param'  => ''
     * )
     */
    public function listOrder()
    {
        parent::listOrders(Db::name('portal_category_post'));
        $this->success("排序更新成功！", '');
    }


    /**
     * 文章添加字段
     */
//    public function alteradd(){
//        $campos = $this->request->param();
//
//       if(empty($campos['portal_id'])){
//           return json(array(
//               'code'=>500,
//               'msg'=>'请选择分类',
//               'data'=>0,
//           ));
//        }
//        $addcolumn =  Db::table('cmf_zdbs')->where('portal_id="'.$campos['portal_id'].'"')->find();
//        if(empty($addcolumn)){
//            $data=array(
//                'ziduan'=>$campos['campos'],
//                'portal_id'=>$campos['portal_id'],
//                'columnname'=>$campos['columnname'],
//            );
//            Db::table('cmf_zdbs')->insert($data);
//        }
//        if(!empty($addcolumn)){
//            $shuzu =  explode(",",$addcolumn['ziduan']);
//            $columname_one = explode(",",$addcolumn['columnname']);
//            array_push($columname_one,$campos['columnname']);
//            array_push($shuzu,$campos['campos']);
//            $columname_two = implode(",",$columname_one);
//            $recombination = implode(",", $shuzu);
//            Db::table('cmf_zdbs')->where('portal_id="'.$campos['portal_id'].'"')->update(['ziduan'=>$recombination,'columnname'=>$columname_two]);
//            $table = 'cmf_portal_post';
//        }
//        $campo= $campos['campos'];
//        $generc = $campos['generc'];
//        $ret = Db::query("show columns from cmf_portal_post");
//        foreach ($ret as $k=>$v){
//            if($v['Field']==$campo){
//                return json(array(
//                    'code'=>500,
//                    'msg'=>'字段已存在',
//                    'data'=>0,
//                ));
//            }
//        }
//
//        $sql="alter table `cmf_portal_post` add `$campo` varchar(".$generc.") ";
//        $res = Db::execute($sql);
//        $res = Db::table('cmf_portal_post')->select();
//
//        if($res){
//            return json(array(
//                'code'=>200,
//                'msg'=>'添加成功',
//                'data'=>1,
//            ));
//        }else{
//            return json(array(
//                'code'=>500,
//                'msg'=>'添加失败',
//                'data'=>0,
//            ));
//        }
//    }
    /**
     * 后台分类显示字段
     */
    public function addshow(){
        $campos = $this->request->param();
//        print_r($campos);die;
//SELECT * FROM `cmf_createrecords` WHERE category_id LIKE '%6%' AND `ziduan` IS NOT NULL;
        $res = Db::table('cmf_createrecords')
            ->where('category_id like "%'.$campos['portal_id'].'%"')
            ->where('ziduan','not null')
            ->select();
//        $res = Db::table('cmf_createrecords')
//            ->where('category_id="'.$campos['portal_id'].'"')
//            ->where('ziduan','not null')
//            ->select();
//        print_r($res);die;
//        $res = Db::table('cmf_zdbs')->where('portal_id="'.$campos['portal_id'].'"')->find();
//        $res_one = [$res['yiji'],$res['erji'],$res['sanji']];

        if($res){
            return json(array(
                'code'=>500,
                'msg'=>'成功获取',
                'data'=>$res,
            ));
        }
//        if($res){
//            return json(array(
//                'code'=>500,
//                'msg'=>'成功获取',
//                'data'=>$res,
//                'res'=>$res_one,
//            ));
//        }

    }
    /**
     * 后台分类显示字段
     */
//    public function columnadd(){
//        $res = Db::table('cmf_zdbs')->alias('a')
//            ->join('cmf_portal_category b','a.portal_id=b.id')
//            ->field('a.id,b.name,a.ziduan,a.columnname,a.yiji,a.erji,a.sanji')
//            ->select();
//        $this->assign('res',$res);
//        return $this->fetch();
//
//    }
//    public function zdbsedit(){
//        $id = $this->request->param();
//        $res = Db::table('cmf_zdbs')->alias('a')
//            ->join('cmf_portal_category b','a.portal_id=b.id')
//            ->field('a.id,b.name,a.ziduan,a.columnname,a.yiji,a.erji,a.sanji')
//            ->where('a.id="'.$id['id'].'"')
//            ->find();
//        $this->assign('res',$res);
//        return $this->fetch();
//
//    }
//    public function zdbseditPost(){
//        $info = $this->request->param();
//        $data=[
//            'yiji'=>$info['post']['yiji'],
//            'erji'=>$info['post']['erji'],
//            'sanji'=>$info['post']['sanji'],
//        ];
//        $res = Db::table('cmf_zdbs')->where('id="'.$info['post']['id'].'"')->update($data);
//        if($res){
//            return $this->success('修改成功');
//        }else{
//            return $this->error();
//        }
//
//    }
//    public function zdbsdels(){
//        $id = $this->request->param();
//        $res =Db::table('cmf_zdbs')->where('id="'.$id['id'].'"')->delete();
//        if($res){
//            return $this->success('删除成功');
//        }else{
//            return $this->error();
//        }
//
//    }




}
