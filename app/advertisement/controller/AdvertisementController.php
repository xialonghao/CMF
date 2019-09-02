<?php
namespace app\advertisement\controller;

use cmf\controller\AdminBaseController;
use app\portal\model\PortalPostModel;
use app\portal\service\PostService;
use app\portal\model\PortalCategoryModel;
use think\Db;
use app\admin\model\ThemeModel;
use think\db\Query;
class AdvertisementController extends AdminBaseController{
    public function index(){
        $username = $this->request->param('username');
        $list = Db::table('cmf_advertisement')
            ->where(function (Query $query) use ($username) {
                if ($username) {
                    $query->where('username', 'like', "%$username%");
                }
            })
            ->order("id asc")
            ->paginate(10);
        $page = $list->render();
        $this->assign('page',$page);
        $this->assign('list',$list);
        return $this->fetch();
    }
    public function addlist()
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
    public function addPost(){
        $data = $this->request->param();
        $data_one = $data['post'];
        $date=[
            'category_id'=>$data_one['category_id'],
            'image'=>$data['post']['more']['image'],
            'url_image'=>$data_one['url_image'],
            'character'=>$data_one['character'],
            'url_character'=>$data_one['url_character'],
            'endtime'=>$data_one['endtime'],
            'starttime'=>$data_one['starttime'],
            'username'=>$data_one['username'],
        ];

        $res = Db::table('cmf_advertisement')->insert($date);

        if($res){
            return $this->success('添加成功');
        }else{
            return $this->error('添加失败');
        }
    }
    public function editlist(){
        $id = $this->request->param();
        $res = Db::table('cmf_advertisement')->where('id="'.$id['id'].'"')->find();
        $this->assign('res',$res);
        return $this->fetch();
    }
    public function editPost(){
        $data = $this->request->param();
        $data_one = $data['post'];
        $date=[
            'Id'=>$data_one['Id'],
            'category_id'=>$data_one['category_id'],
            'image'=>$data['post']['more']['image'],
            'url_image'=>$data_one['url_image'],
            'character'=>$data_one['character'],
            'url_character'=>$data_one['url_character'],
            'endtime'=>$data_one['endtime'],
            'starttime'=>$data_one['starttime'],
            'username'=>$data_one['username'],
        ];
        $res = Db::table('cmf_advertisement')->where('Id="'.$data_one['Id'].'"')->update($date);
        if($res){
            return $this->success('修改成功');
        }else{
            return $this->error('修改失败');
        }
    }
    public function delete(){
        $id = $this->request->param();
        $res = Db::table('cmf_advertisement')->where('id="'.$id['id'].'"')->delete();
        if($res){
            return $this->success('删除成功');
        }else{
            return $this->error('删除失败');
        }
    }
    public function del(){
        $id = $this->request->param();

        $res = Db::table('cmf_advertisement')->where(array('id'=>$id['ids']))->delete();
        if($res){
            return $this->success('删除成功');
        }else{
            return $this->error('删除失败');
        }

    }

}
?>