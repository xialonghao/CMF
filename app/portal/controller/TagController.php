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
use app\portal\model\PortalTagModel;
use think\Db;

class TagController extends HomeBaseController
{
    /**
     * 标签
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $id             = $this->request->param('id');

        $portalTagModel = new PortalTagModel();
        $res_one = Db::table('cmf_portal_category_post')->where('category_id="'.$id.'"')->select()->toArray();
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

        if(is_numeric($id)){
            $tag = $portalTagModel->where('id', $id)->where('status', 1)->find();
        }else{
            $tag = $portalTagModel->where('name', $id)->where('status', 1)->find();
        }


        if (empty($tag)) {
            abort(404, '标签不存在!');
        }
        $this->assign('labellist',$label_one);
        $this->assign('tag', $tag);

        return $this->fetch('/tag');
    }

}
