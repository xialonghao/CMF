<?php
namespace app\keyworder\controller;
use cmf\controller\AdminBaseController;
use think\Db;
use think\db\Query;
class KeyWorderController extends AdminBaseController{
    public function index(){
        $keyworder = $this->request->param('keyworder');
        $list = DB::table('cmf_keyword')
            ->where(function (Query $query) use ($keyworder) {
                if ($keyworder) {
                    $query->where('keyworder', 'like', "%$keyworder%");
                }
            })
            ->order("id asc")
            ->paginate(10);
        // 获取分页显示
        $page = $list->render();
        $this->assign('page',$page);
        $this->assign('list',$list);
        return $this->fetch();
    }
    public function addlist(){

        return $this->fetch();
    }
    public function addPost(){
        $info = $this->request->param();
        $info['post']['creation_time']=time();
        $res = Db::table('cmf_keyword')->insert($info['post']);
        if($res){
            return $this->Success('添加成功');
        }else{
            return $this->error('添加失败');
        }

    }
    /**
     * 批量删除
     */
    public function delete()
    {
        $ids     = $this->request->param('ids');
        $res = Db::table('cmf_keyword')->where('id','in',$ids)->delete();
        if($res){
            return $this->success('删除成功！','');
        }else{
            return $this->error('删除失败！','');
        }
    }
    public function dels(){
        $id = $this->request->param('id');
        $res = Db::table('cmf_keyword')->delete($id);
        if($res){
            return $this->success('删除成功！','');
        }else{
            return $this->error('删除失败！','');

        }
    }
    /**
     * 编辑
     */
    public function edit(){
        $id = $this->request->param();
        $res = Db::table('cmf_keyword')->where('id="'.$id['id'].'"')->find();
        $this->assign('res',$res);
        return $this->fetch();
    }
    public function addUpdate(){
        $id =  $this->request->param();
        $res = Db::table('cmf_keyword')->where('id="'.$id['post']['Id'].'"')->update($id['post']);
        if($res){
            return $this->success('修改成功！','');
        }else{
            return $this->error('修改失败！','');
        }
    }

}
?>