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
use think\Db;
class ListController extends HomeBaseController
{
    /***
     * 文章列表
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $id = $this->request->param('id', 0, 'intval');
        $options = $this->request->param();
        $new = session('options');
        if(empty($options['house'])){
            if(empty($new['house'])){
                $new['house'] = '全部';
            }
        }else{
            $new['house'] = $options['house'];
        }
        if(empty($options['sty'])){
            if(empty($new['sty'])){
                $new['sty'] = '全部';
            }
        }else{
            $new['sty'] = $options['sty'];
        }

        session('options', $new);

        $this->assign('options',$new);

        $portalCategoryModel = new PortalCategoryModel();
        $currenttime= date('Y-m-d h:i:s',time());
        $guanggao_one = Db::table('cmf_advertisement')->fetchSql()->where('category_id="'.$id.'" and endtime>"'.$currenttime.'"')->select();

        $category = $portalCategoryModel->where('id', $id)->where('status', 1)->find();
        $a ='2019-07-16 14:13:59';
        $currenttime= date('Y-m-d h:i:s',time());


//        $li_one = Db::table('cmf_createrecords')->where('category_id like "%'.$id.'%"')->find();
//        if(empty($li_one)){
        $res = Db::table('cmf_createrecords')->group('surface')->select()->toarray();
        if(empty($res)){

            $res_one = Db::table('cmf_portal_category_post')->where('category_id="'.$id.'"')->select()->toArray();
            if(empty($res_one)){

                $this->assign('category', $category);
                $listTpl = empty($category['list_tpl']) ? 'list' : $category['list_tpl'];

                return $this->fetch('/'.$listTpl);

            }else{
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

                $res = Db::table('cmf_portal_tag_post')->alias('a')
                    ->join('cmf_portal_tag b','a.tag_id=b.id')
                    ->where(array('a.post_id'=>['in',$postid]))
                    ->field('b.name,a.post_id')
                    ->Distinct(true)
                    ->select()
                    ->toArray();
                $this->assign('advertising',$guanggao_one);
                $this->assign('labellist',$label_one);
                $this->assign('label',$res);
                $this->assign('category', $category);
                $listTpl = empty($category['list_tpl']) ? 'list' : $category['list_tpl'];

                return $this->fetch('/'.$listTpl);
            }
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
            $sel = Db::table('cmf_createrecords')->field('vdefault,ziduan')->where(['formtype'=>'select'])->select()->toarray();

//            dump($sel);die;
            $new = array();
            foreach($sel as $key=>$val){
                $sel[$key]= explode(',',$val['vdefault']);
                $new[$val['ziduan']] = $sel[$key];

            }
//            foreach($new as $key=>$val){
//               foreach($val as $k=>$v){
//                   $ne[$key] = $v;
//
//               }
//            }

            $this->assign('sel',$new);
            $res_one = Db::table('cmf_portal_category_post')->where('category_id="'.$id.'"')->select()->toArray();
            if(empty($res_one)){

                $this->assign('category', $category);
                $listTpl = empty($category['list_tpl']) ? 'list' : $category['list_tpl'];

                return $this->fetch('/'.$listTpl);

            }else{
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

                $res = Db::table('cmf_portal_tag_post')->alias('a')
                    ->join('cmf_portal_tag b','a.tag_id=b.id')
                    ->where(array('a.post_id'=>['in',$postid]))
                    ->field('b.name,a.post_id')
                    ->Distinct(true)
                    ->select()
                    ->toArray();
                $this->assign('advertising',$guanggao_one);
                $this->assign('labellist',$label_one);
                $this->assign('label',$res);
                $this->assign('category', $category);
                $listTpl = empty($category['list_tpl']) ? 'list' : $category['list_tpl'];

                return $this->fetch('/'.$listTpl);
            }

        }


//        }else{

//            $li_two = Db::table($li_one['surface'])->where('category_id like "%'.$id.'%"')->where('biao','not null')->select();
//
//            $this->assign('lists',$li_two);
//            $res_one = Db::table('cmf_portal_category_post')->where('category_id="'.$id.'"')->select()->toArray();
//            $post_id='';
//            foreach ($res_one as $key=>$val){
//                $post_id .= $val['post_id'].',';
//            }
//            $postid = substr($post_id,0,-1);
//            $labels = Db::table('cmf_portal_post')->order('post_hits desc')->limit(2)->select();
//            $labels_one = json_decode(json_encode($labels,true),true);
//            $post_id = '';
//            foreach($labels as $key=>$val){
//                $post_id .=$val['id'].',';
//            }
//            $postid_one = substr($post_id,0,-1);
//
//            $label_one = Db::table('cmf_portal_tag')->alias('a')
//                ->join('cmf_portal_tag_post b','a.id=b.tag_id')
//                ->where('b.post_id in('.$postid_one.')')
//                ->field('b.tag_id,a.name')
//                ->group('a.name')
//                ->select();
//
//            $res = Db::table('cmf_portal_tag_post')->alias('a')
//                ->join('cmf_portal_tag b','a.tag_id=b.id')
//                ->where(array('a.post_id'=>['in',$postid]))
//                ->field('b.name,a.post_id')
//                ->Distinct(true)
//                ->select()
//                ->toArray();
//            $this->assign('advertising',$guanggao_one);
//            $this->assign('labellist',$label_one);
//            $this->assign('label',$res);
//            $this->assign('category', $category);
//
//            $listTpl = empty($category['list_tpl']) ? 'list' : $category['list_tpl'];
//
//            return $this->fetch('/' . $listTpl);
//
//        }
    }

}
