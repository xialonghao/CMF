<?php
namespace app\modular\controller;
use app\admin\model\RouteModel;
use cmf\controller\AdminBaseController;
use app\portal\model\PortalCategoryModel;
use think\Db;
use think\db\Query;
use app\admin\model\ThemeModel;

class ModularController extends AdminBaseController{

    public function what(){
        echo strpos("Hello world!","world");
    }
    public function index(){
        $biao = $this->request->param('surface');
        $list = Db::table('cmf_createrecords')
            ->where(function (Query $query) use ($biao) {
                if ($biao) {
                    $query->where('surface', 'like', "%$biao%");
                }
            })
            ->order("id DESC")
            ->where('ziduan',null)
            ->paginate(10);
        $page = $list->render();
        $post =Db::table('cmf_portal_category')->select();
        $this->assign('posts',$post);
        $this->assign('page',$page);
        $this->assign('list',$list);
        return $this->fetch();
    }
    public function add(){
        return $this->fetch();
    }
    public function dletes(){
        $id = $this->request->param();
        $res = Db::table('cmf_createrecords')->where('surface="'.$id['surface'].'"')->delete();
        $tab = "DROP TABLE `".$id['surface']."` ";
        $res_one = Db::query($tab);

        if(empty($res_one)){
            if($res){
                return $this->success('删除成功');
            }else{
                return $this->error('删除失败');
            }
            return $this->success('删除成功');
        }else{
            return $this->error('删除失败');
        }
    }
    public function delone(){
        $id = $this->request->param();
        $ids = implode(',',$id['ids']);
        $res = Db::table('cmf_createrecords')->where('id in('.$ids.')')->delete();
        if($res){ return $this->success('删除成功');}else{ return $this->error('删除失败');}
    }
    public function del(){
        $id = $this->request->param();
        $res = Db::table('cmf_createrecords')->where('id="'.$id['id'].'"')->delete();
        if($res){ return $this->success('删除成功');}else{ return $this->error('删除失败');}
    }
    public function addlist(){
        $content = hook_one('portal_admin_article_add_view');
        if (!empty($content)) {
            return $content;
        }
        $themeModel        = new ThemeModel();
        $articleThemeFiles = $themeModel->getActionThemeFiles('portal/Article/index');
        $this->assign('article_theme_files', $articleThemeFiles);
        return $this->fetch();
    }
    public function addPost()
    {
        $data = $this->request->param();

        $cateid = explode(',',$data['post']['category_id']);

        $res_one = Db::table('cmf_createrecords')->where('ziduan',null)->select();

        if(empty($res_one->toArray())){

            $res = Db::query('show tables');

            foreach($res as $key=>$val){

                //这里会根据不同的服务器会不同的表展示
                if($val['Tables_in_zhihuocms']==$data['post']['surface']){
                    return $this->error('已创建此表');
                }
            }
            $tabl ='create table '.$data["post"]["surface"].'(
             `model_id` INT PRIMARY KEY AUTO_INCREMENT,
             `post_id` INT NOT NULL,
             `biao` varchar(255),
             `category_id` varchar(255) NOT NULL
        )';
            if(empty(Db::execute($tabl))){
                $biao = $data["post"]["surface"];
                Db::table(''.$biao.'')->insert(['category_id'=>$data['post']['category_id']]);
                Db::table('cmf_createrecords')->insert(['category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface']]);
                return $this->success('创建成功');
            }else{
                return $this->error('创建失败');
            }

        }else{

            $array='';
            foreach($res_one as $k=>$v){
                $array[] =explode(',',$v['category_id']);
            }
            foreach($array as $key=>$val){
                foreach($val as $a=>$v){
                    foreach($cateid as $q=>$w){
                        if($w==$v){
                            return $this->success('该栏目已归属其他栏目请重新选择');
                        }
                    }
                }
            }

            $res = Db::query('show tables');
            foreach($res as $key=>$val){
                if($val['Tables_in_zhihuocms']==$data['post']['surface']){
                    return $this->error('已创建此表');
                }
            }
            $tabl ='create table '.$data["post"]["surface"].'(
             `model_id` INT PRIMARY KEY AUTO_INCREMENT,
             `post_id` INT NOT NULL,
             `biao` varchar(255),
             `category_id` varchar(255) NOT NULL
        )';
            if(empty(Db::execute($tabl))){
                $biao = $data["post"]["surface"];
                Db::table(''.$biao.'')->insert(['category_id'=>$data['post']['category_id']]);
                Db::table('cmf_createrecords')->insert(['category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface']]);
                return $this->success('创建成功');
            }else{
                return $this->error('创建失败');
            }
        }
        $array='';
        foreach($res_one as $k=>$v){
            $array[] =explode(',',$v['category_id']);
        }
        foreach($array as $key=>$val){
            foreach($val as $a=>$v){
                foreach($cateid as $q=>$w){
                    if($w==$v){
                       return $this->success('该栏目已归属其他栏目请重新选择');
                    }
                }
            }
        }

        $res = Db::query('show tables');
        foreach($res as $key=>$val){
            if($val['Tables_in_zhihuocms']==$data['post']['surface']){
                return $this->error('已创建此表');
            }
        }
        $tabl ='create table '.$data["post"]["surface"].'(
             `model_id` INT PRIMARY KEY AUTO_INCREMENT,
             `post_id` INT NOT NULL,
             `biao` varchar(255),
             `category_id` varchar(255) NOT NULL
        )';
        if(empty(Db::execute($tabl))){
            $biao = $data["post"]["surface"];
            Db::table(''.$biao.'')->insert(['category_id'=>$data['post']['category_id']]);
            Db::table('cmf_createrecords')->insert(['category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface']]);
            return $this->success('创建成功');
        }else{
            return $this->error('创建失败');
        }
    }
    public function editlist(){
        $data = $this->request->param();
        $ret = Db::table('cmf_createrecords')->where('id="'.$data['id'].'"')->find();
        $this->assign('res',$ret);
        $this->assign('list',$ret);
        $this->assign('posts',$ret);
        return $this->fetch();
    }
    public function editPost(){
        $data = $this->request->param();
        $res =Db::table($data['post']['surface'])->where('post_id=0')->update(['category_id'=>$data['post']['category_id']]);

        if($res){
            $res_two = Db::table('cmf_createrecords')->where('surface="'.$data['post']['surface'].'"')->update(['category_id'=>$data['post']['category_id']]);
            if($res_two){
                return $this->success('修改成功');
            }else{
                return $this->error('修改');
            }
            return $this->success('修改成功');
        }else{
            return $this->error('修改失败');
        }
    }
    public function fieldmanage(){
        $data = $this->request->param();
        $array = array(
            'Id'=>$data['id'],
            'category_id'=>$data['category_id'],
            'surface'=>$data['surface'],
        );
        $data_one = Db::table('cmf_createrecords')->where('ziduan','not null')->where('surface="'.$data['surface'].'"')->select();

        $this->assign('va',$data_one);
        $this->assign('res',$array);
        return $this->fetch();
    }
    public function addfiled(){
        $data = $this->request->param();
        $array = array(
            'Id'=>$data['id'],
            'category_id'=>$data['category_id'],
            'surface'=>$data['surface'],
        );
        $this->assign('res',$array);
        return $this->fetch();
    }
    public function addtemplate(){
        $data = $this->request->param();
        $tab ="alter table `".$data['post']['surface']."` add ".$data['post']['ziduan']." varchar(".$data['post']['length'].")";

        $addfiled = Db::query($tab);
        $PHP_SELF=$_SERVER['PHP_SELF'];
        $url_one='http://'.$_SERVER['HTTP_HOST'].substr($PHP_SELF,0,strrpos($PHP_SELF,'/')+1);
        if(empty($addfiled)){
        //附件
        //img图片
        if($data['dtype']=='img'){
            $image_info = Db::table('cmf_createrecords')->where('id="'.$data['post']['id'].'"')->find();
            $content_one = '
                            <tr style="display: none">
                            <th>隐藏<span class="form-required">*</span></th>
                            <td>
                            <input class="form-control" type="text" name="posts[biao]"
                            value="'.$data['post']['surface'].'" placeholder="请输入不作为标题"/>
                            </td>
                            <tr>
                                <th><b>'.$data['post']['biaodan'].'</b></th>
                                <td>
                                    <div style="text-align: center;">
                                        <input type="hidden" name="posts['.$data['post']['ziduan'].']" id="'.$data['post']['ziduan'].'" value="">
                                        <a href="javascript:uploadOneImage(\'图片上传\',\'#'.$data['post']['ziduan'].'\');">
                                             <img src="/themes/admin_simpleboot3/public/assets/images/default-thumbnail.png"
                                                 id="'.$data['post']['ziduan'].'-preview"
                                                 width="135" style="cursor: pointer;cursor: pointer;"/>
                                        </a>
                                        <input type="button" class="btn btn-sm btn-cancel-thumbnail" value="取消图片">
                                    </div>
                                </td>
                            </tr>
                     
                            ';
            $content_two ='
                            <tr>
                             <th>'.$data['post']['biaodan'].'</th>
                            <td>
                            <div style="text-align: center;">
                            <input type="hidden" name="posts['.$data['post']['ziduan'].']" id="thumbnail"
                            value="{$post.'.$data['post']['ziduan'].'|default=""}">
                            <a href="javascript:uploadOneImage("图片上传","#'.$data['post']['ziduan'].'");">
           
                            <img src="'.$url_one.'upload/'.$data['post']['ziduan'].'"
                            id="thumbnail-preview"
                            width="135" style="cursor: pointer"/>
                        
                            </a>
                            <input type="button" class="btn btn-sm btn-cancel-thumbnail" value="取消图片">
                            </div>
                            </td>
                            </tr>';
            $image_add  = Db::table('cmf_createrecords')
                ->insertGetId(['addtemplates'=>$content_one,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
            if($image_add){
                $image_addtwo = Db::table('cmf_createrecords')
                    ->where('id="'.$image_add.'"')
                    ->update(['edittemplates'=>$content_two,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                if($image_addtwo){
                    return $this->success('添加成功');
                }
                return $this->success('添加成功');
            }else{
                return $this->error('添加失败');
            }


        }
        //text单文本
        if($data['dtype']=='text'){
            $image_info = Db::table('cmf_createrecords')->where('id="'.$data['post']['id'].'"')->find();
            $content_one = '
                            <tr style="display: none">
                            <th>隐藏</th>
                            <td>
                            <input class="form-control" type="text" name="posts[biao]"
                            value="'.$data['post']['surface'].'" placeholder="请输入不作为标题"/>
                            </td>
                            </tr>
                            <tr>
                            <th>'.$data['post']['biaodan'].'</th>
                            <td>
                            <input class="form-control" type="text" name="posts['.$data['post']['ziduan'].']"
                            id="title"  value="" placeholder="请输入标题"/>
                            </td>
                            </tr>';
            $content_two ='
                            <tr>
                            <th>'.$data['post']['biaodan'].'</th>
                            <td>
                            <input class="form-control" type="text" name="posts['.$data['post']['ziduan'].']"
                            id="title"  value="pos['.$data['post']['ziduan'].']" placeholder="请输入标题"/>
                            </td>
                            </tr>';
            $image_add  = Db::table('cmf_createrecords')
                ->insertGetId(['addtemplates'=>$content_one,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
            if($image_add){
                $image_addtwo = Db::table('cmf_createrecords')
                    ->where('id="'.$image_add.'"')
                    ->update(['edittemplates'=>$content_two,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                if($image_addtwo){
                    return $this->success('添加成功');
                }
                return $this->success('添加成功');
            }else{
                return $this->error('添加失败');
            }
        }
        //textchar char单文本
        if($data['dtype']=='textchar'){
            $image_info = Db::table('cmf_createrecords')->where('id="'.$data['post']['id'].'"')->find();
            $content_one = '
                            <tr style="display: none">
                            <th>隐藏</th>
                            <td>
                            <input class="form-control" type="text" name="posts[biao]"
                            value="'.$data['post']['surface'].'" placeholder="请输入不作为标题"/>
                            </td>
                            </tr>
                            <tr>
                            <th>'.$data['post']['biaodan'].'</th>
                            <td>
                            <input class="form-control" type="text" name="posts['.$data['post']['ziduan'].']"
                            id="title"  value="" placeholder="请输入标题"/>
                            </td>
                            </tr>';
            $content_two ='
                            <tr>
                              <th>'.$data['post']['biaodan'].'</th>
                            <td>
                            <input class="form-control" type="text" name="posts['.$data['post']['ziduan'].']"
                            id="title"  value="pos['.$data['post']['ziduan'].']" placeholder="请输入标题"/>
                            </td>
                            </tr>';
            $image_add  = Db::table('cmf_createrecords')
                ->insertGetId(['addtemplates'=>$content_one,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
            if($image_add){
                $image_addtwo = Db::table('cmf_createrecords')
                    ->where('id="'.$image_add.'"')
                    ->update(['edittemplates'=>$content_two,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                if($image_addtwo){
                    return $this->success('添加成功');
                }
                return $this->success('添加成功');
            }else{
                return $this->error('添加失败');
            }
        }
        //multitext textarea文本
        if($data['dtype']=='multitext'){
            $image_info = Db::table('cmf_createrecords')->where('id="'.$data['post']['id'].'"')->find();
            $content_one = '
                            <tr style="display: none">
                            <th>隐藏</th>
                            <td>
                            <input class="form-control" type="text" name="posts[biao]"
                            value="'.$data['post']['surface'].'" placeholder="请输入不作为标题"/>
                            </td>
                            </tr>
                            <tr>
                            <th>'.$data['post']['biaodan'].'</th>
                            <td>
                             <textarea class="form-control" name="posts['.$data['post']['ziduan'].']" style="height: 50px;"
                          placeholder="请填写摘要"></textarea>
                            </td>
                            </tr>';
            $content_two ='
                            <tr>
                               <th>'.$data['post']['biaodan'].'</th>
                            <td>
                             <textarea class="form-control" name="posts['.$data['post']['ziduan'].']" style="height: 50px;"
                          placeholder="请填写摘要">'.$data["post"]["ziduan"].'</textarea>
                            </td>
                            </tr>';
            $image_add  = Db::table('cmf_createrecords')
                ->insertGetId(['addtemplates'=>$content_one,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
            if($image_add){
                $image_addtwo = Db::table('cmf_createrecords')
                    ->where('id="'.$image_add.'"')
                    ->update(['edittemplates'=>$content_two,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                if($image_addtwo){
                    return $this->success('添加成功');
                }
                return $this->success('添加成功');
            }else{
                return $this->error('添加失败');
            }
        }
        //htmltext也就是单文本
        if($data['dtype']=='htmltext'){
            $image_info = Db::table('cmf_createrecords')->where('id="'.$data['post']['id'].'"')->find();
            $content_one = '
                            <tr style="display: none">
                            <th>隐藏</th>
                            <td>
                            <input class="form-control" type="text" name="posts[biao]"
                            value="'.$data['post']['surface'].'" placeholder="请输入不作为标题"/>
                            </td>
                            </tr>
                            <tr>
                            <th>'.$data['post']['biaodan'].'</th>
                            <td>
                            <input class="form-control" type="text" name="posts['.$data['post']['ziduan'].']"
                            id="title"  value="" placeholder="请输入标题"/>
                            </td>
                            </tr>';
            $content_two ='
                            <tr>
                             <th>'.$data['post']['biaodan'].'</th>
                            <td>
                           <input class="form-control" type="text" name="posts['.$data['post']['ziduan'].']"
                            id="title"  value="pos['.$data['post']['ziduan'].']" placeholder="请输入标题"/>
                            </td>
                            </tr>';
            $image_add  = Db::table('cmf_createrecords')
                ->insertGetId(['addtemplates'=>$content_one,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
            if($image_add){
                $image_addtwo = Db::table('cmf_createrecords')
                    ->where('id="'.$image_add.'"')
                    ->update(['edittemplates'=>$content_two,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                if($image_addtwo){
                    return $this->success('添加成功');
                }
                return $this->success('添加成功');
            }else{
                return $this->error('添加失败');
            }
        }
        //textdata文本编辑器
        if($data['dtype']=='textdata'){
            $image_info = Db::table('cmf_createrecords')->where('id="'.$data['post']['id'].'"')->find();
            $content_one = '
                            <tr style="display: none">
                            <th>隐藏</th>
                            <td>
                            <input class="form-control" type="text" name="posts[biao]"
                            value="'.$data['post']['surface'].'" placeholder="请输入不作为标题"/>
                            </td>
                            </tr>
                            <tr>
                            <th>'.$data['post']['biaodan'].'</th>
                            <td>
                            <script type="text/plain" id="contents" name="posts['.$data['post']['ziduan'].']"></script>
                            </td>
                            </tr>
                            ';
            $content_two ='
                            <tr>
                            <th>'.$data['post']['biaodan'].'</th>
                            </tr>
                            <tr>
                            <td>
                             <script type="text/plain" id="contents" name="posts['.$data['post']['ziduan'].']"></script>
                            </td>
                            </tr>';
            $image_add  = Db::table('cmf_createrecords')
                ->insertGetId(['addtemplates'=>$content_one,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
            if($image_add){
                $image_addtwo = Db::table('cmf_createrecords')
                    ->where('id="'.$image_add.'"')
                    ->update(['edittemplates'=>$content_two,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                if($image_addtwo){
                    return $this->success('添加成功');
                }
                return $this->success('添加成功');
            }else{
                return $this->error('添加失败');
            }
        }
        //int整形单文本
        if($data['dtype']=='int'){
            $image_info = Db::table('cmf_createrecords')->where('id="'.$data['post']['id'].'"')->find();
            $content_one = '
                            <tr style="display: none">
                            <th>隐藏</th>
                            <td>
                            <input class="form-control" type="text" name="posts[biao]"
                            value="'.$data['post']['surface'].'" placeholder="请输入不作为标题"/>
                            </td>
                            </tr>
                            <tr>
                            <th>'.$data['post']['biaodan'].'</th>
                            <td>
                            <input class="form-control" type="text" name="posts['.$data['post']['ziduan'].']"
                            id="title"  value="" placeholder="请输入标题"/>
                            </td>
                            </tr>';
            $content_two ='
                            <tr>
                                <th>'.$data['post']['biaodan'].'</th>
                            <td>
                            <input class="form-control" type="text" name="posts['.$data['post']['ziduan'].']"
                            id="title"  value="pos['.$data['post']['ziduan'].']" placeholder="请输入标题"/>
                            </td>
                            </tr>';
            $image_add  = Db::table('cmf_createrecords')
                ->insertGetId(['addtemplates'=>$content_one,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
            if($image_add){
                $image_addtwo = Db::table('cmf_createrecords')
                    ->where('id="'.$image_add.'"')
                    ->update(['edittemplates'=>$content_two,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                if($image_addtwo){
                    return $this->success('添加成功');
                }
                return $this->success('添加成功');
            }else{
                return $this->error('添加失败');
            }
        }
        //float单文本
        if($data['dtype']=='float'){
            $image_info = Db::table('cmf_createrecords')->where('id="'.$data['post']['id'].'"')->find();
             $content_one = '
                            <tr style="display: none">
                            <th>隐藏</th>
                            <td>
                            <input class="form-control" type="text" name="posts[biao]"
                            value="'.$data['post']['surface'].'" placeholder="请输入不作为标题"/>
                            </td>
                            </tr>
                            <tr>
                            <th>'.$data['post']['biaodan'].'</th>
                            <td>
                            <input class="form-control" type="text" name="posts['.$data['post']['ziduan'].']"
                            id="title"  value="" placeholder="请输入标题"/>
                            </td>
                            </tr>';
            $content_two ='
                            <tr>
                              <th>'.$data['post']['biaodan'].'</th>
                            <td>
                            <input class="form-control js-bootstrap-datetime" type="text" name="posts['.$data['post']['ziduan'].']"
                           value="pos['.$data['post']['ziduan'].']">
                            </td>
                            </tr>';
            $image_add  = Db::table('cmf_createrecords')
                ->insertGetId(['addtemplates'=>$content_one,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
            if($image_add){
                $image_addtwo = Db::table('cmf_createrecords')
                    ->where('id="'.$image_add.'"')
                    ->update(['edittemplates'=>$content_two,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                if($image_addtwo){
                    return $this->success('添加成功');
                }
                return $this->success('添加成功');
            }else{
                return $this->error('添加失败');
            }
        }
        //datetime时间文本框
        if($data['dtype']=='datetime'){
            $image_info = Db::table('cmf_createrecords')->where('id="'.$data['post']['id'].'"')->find();
            $content_one = '
       
                            <tr style="display: none">
                            <th>隐藏</th>
                            <td>
                            <input class="form-control" type="text" name="posts[biao]"
                            value="'.$data['post']['surface'].'" placeholder="请输入不作为标题"/>
                            </td>
                            </tr>                                     
                            <tr>
                            <th>'.$data['post']['biaodan'].'</th>
                            <td class="input-group date datepicker">
                            <input type="text" class="form-control" name=posts['.$data['post']['ziduan'].']">
                            <div class="input-group-addon">
                            <span class="glyphicon glyphicon-th "></span>
                            </div>
                            </td>
                            </tr>
                            
                            
                            ';
            $content_two ='
                            <tr>
                            <th>'.$data['post']['biaodan'].'</th>
                            <td class="input-group date datepicker">
                            <input type="text" class="form-control" name="posts['.$data['post']['ziduan'].']" value="'.$data['post']['ziduan'].'">
                            <div class="input-group-addon">
                            <span class="glyphicon glyphicon-th "></span>
                            </div>
                            </td>
                            </tr>';
            $image_add  = Db::table('cmf_createrecords')
                ->insertGetId(['addtemplates'=>$content_one,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
            if($image_add){
                $image_addtwo = Db::table('cmf_createrecords')
                    ->where('id="'.$image_add.'"')
                    ->update(['edittemplates'=>$content_two,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                if($image_addtwo){
                    return $this->success('添加成功');
                }
                return $this->success('添加成功');
            }else{
                return $this->error('添加失败');
            }
        }
        //select下拉文本框
        if($data['dtype']=='select'){
            $fenge = $data['post']['vdefault'];
            $fenge_one = explode(',',$fenge);
            $str='';
            $str_edit = '';
            foreach($fenge_one as $key=>$val){
                $str .='<option  value="'.$val.'">'.$val.'</option>';
                $str_edit .='<option value="'.$val.'">'.$val.'</option>';
            }

            $image_info = Db::table('cmf_createrecords')->where('id="'.$data['post']['id'].'"')->find();
            $content_one = '
                            <tr style="display: none">
                            <th>隐藏</th>
                            <td>
                            <input class="form-control" type="text" name="posts[biao]"
                            value="'.$data['post']['surface'].'" placeholder="请输入不作为标题"/>
                            </td>
                            </tr>
                            <tr>
                            <th>
                            <b>'.$data['post']['biaodan'].'</b>
                            </th>
                            <td>
                            <select name="posts['.$data['post']["ziduan"].']" class="add_select" style="min-width: 300px;height:30px;border-radius: 5px;padding-left: 10px">
                            '.$str.' 
                            </select>
                            </td>
                            </tr>';
            $content_two ='
                            <tr>
                            <th>
                            <b>'.$data['post']['biaodan'].'</b>
                            </th>
                            <td>
                            <select  name="posts['.$data['post']["ziduan"].']" class="add_select" style="min-width: 300px;height:30px;border-radius: 5px;padding-left: 10px">              
                            '.$str_edit.'           
                            </select>
                            </td>
                            </tr>';
            $image_add  = Db::table('cmf_createrecords')
                ->insertGetId(['addtemplates'=>$content_one,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
            if($image_add){
                $image_addtwo = Db::table('cmf_createrecords')
                    ->where('id="'.$image_add.'"')
                    ->update(['edittemplates'=>$content_two,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                if($image_addtwo){
                    return $this->success('添加成功');
                }
                return $this->success('添加成功');
            }else{
                return $this->error('添加失败');
            }
        }
        //radio
        if($data['dtype']=='radio'){
            $fenge = $data['post']['vdefault'];
            $fenge_one = explode(',',$fenge);
            $str='';
            $str_edit = '';
            $str='';
            $str_edit = '';
            foreach($fenge_one as $key=>$val){
                $str .='<input type="radio" name="posts['.$data['post']['ziduan'].']" value="'.$val.'">'.$val.'';
                $str_edit .='<input type="radio" name="posts['.$data['post']['ziduan'].']" value="'.$val.'">'.$val.'';
            }
            $image_info = Db::table('cmf_createrecords')->where('id="'.$data['post']['id'].'"')->find();
            $content_one = '
                            <tr style="display: none">
                            <th>隐藏</th>
                            <td>
                            <input class="form-control" type="text" name="posts[biao]"
                            value="'.$data['post']['surface'].'" placeholder="请输入不作为标题"/>
                            </td>
                            </tr>
                            <tr>
                            <th>'.$data['post']['biaodan'].'</th>
                             <td class="bline">
                            '.$str.'
                            </td>
                            </tr>';
            $content_two ='
                             <tr>
                            <th>'.$data['post']['biaodan'].'</th>
                             <td class="bline">
                            '. $str_edit.'
                            </td>
                            </tr>';
            $image_add  = Db::table('cmf_createrecords')
                ->insertGetId(['addtemplates'=>$content_one,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
            if($image_add){
                $image_addtwo = Db::table('cmf_createrecords')
                    ->where('id="'.$image_add.'"')
                    ->update(['edittemplates'=>$content_two,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                if($image_addtwo){
                    return $this->success('添加成功');
                }
                return $this->success('添加成功');
            }else{
                return $this->error('添加失败');
            }

        }
        //多选框
        if($data['dtype']=='checkbox'){
            $fenge = $data['post']['vdefault'];
            $fenge_one = explode(',',$fenge);
            $str='';
            $str_edit = '';
            foreach($fenge_one as $key=>$val){
                $str .=' <input type="checkbox" name="posts['.$data['post']['ziduan'].']"  value="'.$val.'">'.$val.'';
                $str_edit .=' <input type="checkbox" name="posts['.$data['post']['ziduan'].']"  value="'.$val.'">'.$val.'';
            }
            $image_info = Db::table('cmf_createrecords')->where('id="'.$data['post']['id'].'"')->find();
            $content_one = '
                                <tr style="display: none">
                                <th>隐藏</th>
                                <td>
                                <input class="form-control" type="text" name="posts[biao]"
                                value="'.$data['post']['surface'].'" placeholder="请输入不作为标题"/>
                                </td>
                                </tr>
                                <tr>
                                <th>'.$data['post']['biaodan'].'</th>
                                <td class="bline">
                                '.$str.'
                                </td>
                                </tr>';
            $content_two ='
                                <tr> 
                                <td width="90" class="bline" height=\'24\'>&nbsp;asd：</td>
                                <th>'.$data['post']['biaodan'].'</th>
                                <td class="bline">
                                '.$str_edit.'
                                </td>
                                </tr>';
            $image_add  = Db::table('cmf_createrecords')
                ->insertGetId(['addtemplates'=>$content_one,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
            if($image_add){
                $image_addtwo = Db::table('cmf_createrecords')
                    ->where('id="'.$image_add.'"')
                    ->update(['edittemplates'=>$content_two,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                if($image_addtwo){
                    return $this->success('添加成功');
                }
                return $this->success('添加成功');
            }else{
                return $this->error('添加失败');
            }
        }
            return $this->success('添加成功');
        }else{
            return $this->error('添加失败');
        }
    }
    public function filedlist(){
        $data = $this->request->param();
        $res = Db::table('cmf_createrecords')->where('id="'.$data['id'].'"')->find();
        $this->assign('res',$res);
        return $this->fetch();
    }
    public function edittemplate(){
        $data = $this->request->param();
        $PHP_SELF=$_SERVER['PHP_SELF'];
        $url_one='http://'.$_SERVER['HTTP_HOST'].substr($PHP_SELF,0,strrpos($PHP_SELF,'/')+1);
            //img图片
            if($data['dtype']=='img'){
                $image_info = Db::table('cmf_createrecords')->where('id="'.$data['post']['id'].'"')->find();
                $content_one = '
                            <tr style="display: none">
                            <th>隐藏<span class="form-required">*</span></th>
                            <td>
                            <input class="form-control" type="text" name="posts[biao]"
                            value="'.$data['post']['surface'].'" placeholder="请输入不作为标题"/>
                            </td>
                            <tr>
                                <th><b>'.$data['post']['biaodan'].'</b></th>
                                <td>
                                    <div style="text-align: center;">
                                        <input type="hidden" name="posts['.$data['post']['ziduan'].']" id="'.$data['post']['ziduan'].'" value="">
                                        <a href="javascript:uploadOneImage(\'图片上传\',\'#'.$data['post']['ziduan'].'\');">
                                             <img src="/themes/admin_simpleboot3/public/assets/images/default-thumbnail.png"
                                                 id="'.$data['post']['ziduan'].'-preview"
                                                 width="135" style="cursor: pointer;cursor: pointer;"/>
                                        </a>
                                        <input type="button" class="btn btn-sm btn-cancel-thumbnail" value="取消图片">
                                    </div>
                                </td>
                            </tr>
                     
                            ';
                $content_two ='
                            <tr>
                              <th>'.$data['post']['biaodan'].'</th>
                            <td>
                            <div style="text-align: center;">
                            <input type="hidden" name="posts['.$data['post']['ziduan'].']" id="thumbnail"
                            value="{$post.'.$data['post']['ziduan'].'|default=""}">
                            <a href="javascript:uploadOneImage("图片上传","#'.$data['post']['ziduan'].'");">
           
                            <img src="'.$url_one.'upload/'.$data['post']['ziduan'].'"
                            id="thumbnail-preview"
                            width="135" style="cursor: pointer"/>
                         
                            </a>
                            <input type="button" class="btn btn-sm btn-cancel-thumbnail" value="取消图片">
                            </div>
                            </td>
                            </tr>';
                $image_add  = Db::table('cmf_createrecords')
                    ->where('id="'.$data['post']['id'].'"')
                    ->update(['addtemplates'=>$content_one,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                if($image_add){
                    $image_addtwo = Db::table('cmf_createrecords')
                        ->where('id="'.$data['post']['id'].'"')
                        ->update(['edittemplates'=>$content_two,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                    if($image_addtwo){
                        return $this->success('添加成功');
                    }
                    return $this->success('添加成功');
                }else{
                    return $this->error('添加失败');
                }


            }
            //text单文本
            if($data['dtype']=='text'){
                $image_info = Db::table('cmf_createrecords')->where('id="'.$data['post']['id'].'"')->find();
                $content_one = '
                            <tr style="display: none">
                            <th>隐藏</th>
                            <td>
                            <input class="form-control" type="text" name="posts[biao]"
                            value="'.$data['post']['surface'].'" placeholder="请输入不作为标题"/>
                            </td>
                            </tr>
                            <tr>
                            <th>'.$data['post']['biaodan'].'</th>
                            <td>
                            <input class="form-control" type="text" name="posts['.$data['post']['ziduan'].']"
                            id="title"  value="" placeholder="请输入标题"/>
                            </td>
                            </tr>';
                $content_two ='
                            <tr>
                             <th>'.$data['post']['biaodan'].'</th>
                            <td>
                            <input class="form-control" type="text" name="posts['.$data['post']['ziduan'].']"
                            id="title"  value="pos['.$data['post']['ziduan'].']" placeholder="请输入标题"/>
                            </td>
                            </tr>';
                $image_add  = Db::table('cmf_createrecords')
                    ->where('id="'.$data['post']['id'].'"')
                    ->update(['addtemplates'=>$content_one,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                if($image_add){
                    $image_addtwo = Db::table('cmf_createrecords')
                        ->where('id="'.$data['post']['id'].'"')
                        ->update(['edittemplates'=>$content_two,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                    if($image_addtwo){
                        return $this->success('添加成功');
                    }
                    return $this->success('添加成功');
                }else{
                    return $this->error('添加失败');
                }
            }
            //textchar char单文本
            if($data['dtype']=='textchar'){
                $image_info = Db::table('cmf_createrecords')->where('id="'.$data['post']['id'].'"')->find();
                $content_one = '
                            <tr style="display: none">
                            <th>隐藏</th>
                            <td>
                            <input class="form-control" type="text" name="posts[biao]"
                            value="'.$data['post']['surface'].'" placeholder="请输入不作为标题"/>
                            </td>
                            </tr>
                            <tr>
                            <th>'.$data['post']['biaodan'].'</th>
                            <td>
                            <input class="form-control" type="text" name="posts['.$data['post']['ziduan'].']"
                            id="title"  value="" placeholder="请输入标题"/>
                            </td>
                            </tr>';
                $content_two ='
                            <tr>
                            <th>'.$data['post']['biaodan'].'</th>
                            <td>
                            <input class="form-control" type="text" name="posts['.$data['post']['ziduan'].']"
                            id="title"  value="pos['.$data['post']['ziduan'].']" placeholder="请输入标题"/>
                            </td>
                            </tr>';
                $image_add  = Db::table('cmf_createrecords')
                    ->where('id="'.$data['post']['id'].'"')
                    ->update(['addtemplates'=>$content_one,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                if($image_add){
                    $image_addtwo = Db::table('cmf_createrecords')
                        ->where('id="'.$data['post']['id'].'"')
                        ->update(['edittemplates'=>$content_two,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                    if($image_addtwo){
                        return $this->success('添加成功');
                    }
                    return $this->success('添加成功');
                }else{
                    return $this->error('添加失败');
                }
            }
            //multitext textarea文本
            if($data['dtype']=='multitext'){
                $image_info = Db::table('cmf_createrecords')->where('id="'.$data['post']['id'].'"')->find();
                $content_one = '
                            <tr style="display: none">
                            <th>隐藏</th>
                            <td>
                            <input class="form-control" type="text" name="posts[biao]"
                            value="'.$data['post']['surface'].'" placeholder="请输入不作为标题"/>
                            </td>
                            </tr>
                            <tr>
                            <th>'.$data['post']['biaodan'].'<span class="form-required">*</span></th>
                            <td>
                             <textarea class="form-control" name="posts['.$data['post']['ziduan'].']" style="height: 50px;"
                          placeholder="请填写摘要"></textarea>
                            </td>
                            </tr>';
                $content_two ='
                            <tr>
                            <th>'.$data['post']['biaodan'].'</th>
                            <td>
                             <textarea class="form-control" name="posts['.$data['post']['ziduan'].']" style="height: 50px;"
                          placeholder="请填写摘要">'.$data["post"]["ziduan"].'</textarea>
                            </td>
                            </tr>';
                $image_add  = Db::table('cmf_createrecords')
                    ->where('id="'.$data['post']['id'].'"')
                    ->update(['addtemplates'=>$content_one,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                if($image_add){
                    $image_addtwo = Db::table('cmf_createrecords')
                        ->where('id="'.$data['post']['id'].'"')
                        ->update(['edittemplates'=>$content_two,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                    if($image_addtwo){
                        return $this->success('添加成功');
                    }
                    return $this->success('添加成功');
                }else{
                    return $this->error('添加失败');
                }
            }
            //htmltext也就是单文本
            if($data['dtype']=='htmltext'){
                $image_info = Db::table('cmf_createrecords')->where('id="'.$data['post']['id'].'"')->find();
                $content_one = '
                            <tr style="display: none">
                            <th>隐藏<span class="form-required">*</span></th>
                            <td>
                            <input class="form-control" type="text" name="posts[biao]"
                            value="'.$data['post']['surface'].'" placeholder="请输入不作为标题"/>
                            </td>
                            </tr>
                            <tr>
                            <th>'.$data['post']['biaodan'].'</th>
                            <td>
                            <input class="form-control" type="text" name="posts['.$data['post']['ziduan'].']"
                            id="title"  value="" placeholder="请输入标题"/>
                            </td>
                            </tr>';
                $content_two ='
                            <tr>
                            <th>'.$data['post']['biaodan'].'</th>
                            <td>
                           <input class="form-control" type="text" name="posts['.$data['post']['ziduan'].']"
                            id="title"  value="pos['.$data['post']['ziduan'].']" placeholder="请输入标题"/>
                            </td>
                            </tr>';
                $image_add  = Db::table('cmf_createrecords')
                    ->where('id="'.$data['post']['id'].'"')
                    ->update(['addtemplates'=>$content_one,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                if($image_add){
                    $image_addtwo = Db::table('cmf_createrecords')
                        ->where('id="'.$data['post']['id'].'"')
                        ->update(['edittemplates'=>$content_two,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                    if($image_addtwo){
                        return $this->success('添加成功');
                    }
                    return $this->success('添加成功');
                }else{
                    return $this->error('添加失败');
                }
            }
            //textdata文本编辑器
            if($data['dtype']=='textdata'){
                $image_info = Db::table('cmf_createrecords')->where('id="'.$data['post']['id'].'"')->find();
                $content_one = '
                            <tr style="display: none">
                            <th>隐藏</th>
                            <td>
                            <input class="form-control" type="text" name="posts[biao]"
                            value="'.$data['post']['surface'].'" placeholder="请输入不作为标题"/>
                            </td>
                            </tr>
                            <tr>
                            <th>'.$data['post']['biaodan'].'</th>
                            <td>
                            <script type="text/plain" id="contents" name="posts['.$data['post']['ziduan'].']"></script>
                            </td>
                            </tr>
                            ';
                $content_two ='
                            <tr>
                            <th>'.$data['post']['biaodan'].'</th>
                            </tr>
                            <tr>
                            <td>
                             <script type="text/plain" id="contents" name="posts['.$data['post']['ziduan'].']"></script>
                            </td>
                            </tr>';
                $image_add  = Db::table('cmf_createrecords')
                    ->where('id="'.$data['post']['id'].'"')
                    ->update(['addtemplates'=>$content_one,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                if($image_add){
                    $image_addtwo = Db::table('cmf_createrecords')
                        ->where('id="'.$data['post']['id'].'"')
                        ->update(['edittemplates'=>$content_two,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                    if($image_addtwo){
                        return $this->success('添加成功');
                    }
                    return $this->success('添加成功');
                }else{
                    return $this->error('添加失败');
                }
            }
            //int整形单文本
            if($data['dtype']=='int'){
                $image_info = Db::table('cmf_createrecords')->where('id="'.$data['post']['id'].'"')->find();
                $content_one = '
                            <tr style="display: none">
                            <th>隐藏</th>
                            <td>
                            <input class="form-control" type="text" name="posts[biao]"
                            value="'.$data['post']['surface'].'" placeholder="请输入不作为标题"/>
                            </td>
                            </tr>
                            <tr>
                            <th>'.$data['post']['biaodan'].'
                            </th>
                            <td>
                            <input class="form-control" type="text" name="posts['.$data['post']['ziduan'].']"
                            id="title"  value="" placeholder="请输入标题"/>
                            </td>
                            </tr>';
                $content_two ='
                            <tr>
                            <th>'.$data['post']['biaodan'].'</th>
                            <td>
                            <input class="form-control" type="text" name="posts['.$data['post']['ziduan'].']"
                            id="title"  value="pos['.$data['post']['ziduan'].']" placeholder="请输入标题"/>
                            </td>
                            </tr>';
                $image_add  = Db::table('cmf_createrecords')
                    ->where('id="'.$data['post']['id'].'"')
                    ->update(['addtemplates'=>$content_one,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                if($image_add){
                    $image_addtwo = Db::table('cmf_createrecords')
                        ->where('id="'.$data['post']['id'].'"')
                        ->update(['edittemplates'=>$content_two,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                    if($image_addtwo){
                        return $this->success('添加成功');
                    }
                    return $this->success('添加成功');
                }else{
                    return $this->error('添加失败');
                }
            }
            //float单文本
            if($data['dtype']=='float'){
                $image_info = Db::table('cmf_createrecords')->where('id="'.$data['post']['id'].'"')->find();
                $content_one = '
                            <tr style="display: none">
                            <th>隐藏</th>
                            <td>
                            <input class="form-control" type="text" name="posts[biao]"
                            value="'.$data['post']['surface'].'" placeholder="请输入不作为标题"/>
                            </td>
                            </tr>
                            <tr>
                            <th>'.$data['post']['biaodan'].'</th>
                            <td>
                            <input class="form-control" type="text" name="posts['.$data['post']['ziduan'].']"
                            id="title"  value="" placeholder="请输入标题"/>
                            </td>
                            </tr>';
                $content_two ='

                            <tr>
                            <th>'.$data['post']['biaodan'].'</th>
                            <td>
                            <input class="form-control js-bootstrap-datetime" type="text" name="posts['.$data['post']['ziduan'].']"
                           value="pos['.$data['post']['ziduan'].']">
                            </td>
                            </tr>';
                $image_add  = Db::table('cmf_createrecords')
                    ->where('id="'.$data['post']['id'].'"')
                    ->update(['addtemplates'=>$content_one,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                if($image_add){
                    $image_addtwo = Db::table('cmf_createrecords')
                        ->where('id="'.$data['post']['id'].'"')
                        ->update(['edittemplates'=>$content_two,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                    if($image_addtwo){
                        return $this->success('添加成功');
                    }
                    return $this->success('添加成功');
                }else{
                    return $this->error('添加失败');
                }
            }
            //datetime时间文本框
            if($data['dtype']=='datetime'){
                $image_info = Db::table('cmf_createrecords')->where('id="'.$data['post']['id'].'"')->find();
                $content_one = '      
                            <tr style="display: none">
                            <th>隐藏</th>
                            <td>
                            <input class="form-control" type="text" name="posts[biao]"
                            value="'.$data['post']['surface'].'" placeholder="请输入不作为标题"/>
                            </td>
                            </tr>                                     
                            <tr>
                            <th>'.$data['post']['biaodan'].'</th>
                            <td class="input-group date datepicker">
                            <input type="text" class="form-control" name=posts['.$data['post']['ziduan'].']">
                            <div class="input-group-addon">
                            <span class="glyphicon glyphicon-th "></span>
                            </div>
                            </td>
                            </tr>                                                    
                            ';
                $content_two ='
                            <tr>
                            <th>'.$data['post']['biaodan'].'</th>
                            <td class="input-group date datepicker">
                            <input type="text" class="form-control" name="posts['.$data['post']['ziduan'].']" value="'.$data['post']['ziduan'].'">
                            <div class="input-group-addon">
                            <span class="glyphicon glyphicon-th "></span>
                            </div>
                            </td>
                            </tr>';
                $image_add  = Db::table('cmf_createrecords')
                    ->where('id="'.$data['post']['id'].'"')
                    ->update(['addtemplates'=>$content_one,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                if($image_add){
                    $image_addtwo = Db::table('cmf_createrecords')
                        ->where('id="'.$data['post']['id'].'"')
                        ->update(['edittemplates'=>$content_two,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                    if($image_addtwo){
                        return $this->success('添加成功');
                    }
                    return $this->success('添加成功');
                }else{
                    return $this->error('添加失败');
                }
            }
            //select下拉文本框
            if($data['dtype']=='select'){
                $fenge = $data['post']['vdefault'];
                $fenge_one = explode(',',$fenge);
                $str='';
                $str_edit = '';
                foreach($fenge_one as $key=>$val){
                    $str .='<option  value="'.$val.'">'.$val.'</option>';
                    $str_edit .='<option value="'.$val.'">'.$val.'</option>';
                }

                $image_info = Db::table('cmf_createrecords')->where('id="'.$data['post']['id'].'"')->find();
                $content_one = '
                            <tr style="display: none">
                            <th>隐藏</th>
                            <td>
                            <input class="form-control" type="text" name="posts[biao]"
                            value="'.$data['post']['surface'].'" placeholder="请输入不作为标题"/>
                            </td>
                            </tr>
                            <tr>
                            <th>
                            <b>'.$data['post']['biaodan'].'</b>
                            </th>
                            <td>
                            <select name="posts['.$data['post']["ziduan"].']" class="add_select" style="min-width: 300px;height:30px;border-radius: 5px;padding-left: 10px">
                            '.$str.' 
                            </select>
                            </td>
                            </tr>';
                $content_two ='
                            <tr>
                            <th>
                            <b>'.$data['post']['biaodan'].'</b>
                            </th>
                            <td>
                            <select  name="posts['.$data['post']["ziduan"].']" class="add_select" style="min-width: 300px;height:30px;border-radius: 5px;padding-left: 10px">              
                            '.$str_edit.'           
                            </select>
                            </td>
                            </tr>';
                $image_add  = Db::table('cmf_createrecords')
                    ->where('id="'.$data['post']['id'].'"')
                    ->update(['addtemplates'=>$content_one,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                if($image_add){
                    $image_addtwo = Db::table('cmf_createrecords')
                        ->where('id="'.$data['post']['id'].'"')
                        ->update(['edittemplates'=>$content_two,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                    if($image_addtwo){
                        return $this->success('添加成功');
                    }
                    return $this->success('添加成功');
                }else{
                    return $this->error('添加失败');
                }
            }
            //radio
            if($data['dtype']=='radio'){
                $fenge = $data['post']['vdefault'];
                $fenge_one = explode(',',$fenge);
                $str='';
                $str_edit = '';
                $str='';
                $str_edit = '';
                foreach($fenge_one as $key=>$val){
                    $str .='<input type="radio" name="posts['.$data['post']['ziduan'].']" value="'.$val.'">'.$val.'';
                    $str_edit .='<input type="radio" name="posts['.$data['post']['ziduan'].']" value="'.$val.'">'.$val.'';
                }
                $image_info = Db::table('cmf_createrecords')->where('id="'.$data['post']['id'].'"')->find();
                $content_one = '
                            <tr style="display: none">
                            <th>隐藏</th>
                            <td>
                            <input class="form-control" type="text" name="posts[biao]"
                            value="'.$data['post']['surface'].'" placeholder="请输入不作为标题"/>
                            </td>
                            </tr>
                            <tr>
                            <th>'.$data['post']['biaodan'].'</th>
                            </tr>
                            <tr>                             
                            <td class="bline">
                            '.$str.'
                            </td>
                            </tr>';
                $content_two ='
                            <tr>  
                            <th>'.$data['post']['biaodan'].'</th>                        
                            <td class="bline">
                            '. $str_edit.'
                            </td>
                            </tr>';
                $image_add  = Db::table('cmf_createrecords')
                    ->where('id="'.$data['post']['id'].'"')
                    ->update(['addtemplates'=>$content_one,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                if($image_add){
                    $image_addtwo = Db::table('cmf_createrecords')
                        ->where('id="'.$data['post']['id'].'"')
                        ->update(['edittemplates'=>$content_two,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                    if($image_addtwo){
                        return $this->success('添加成功');
                    }
                    return $this->success('添加成功');
                }else{
                    return $this->error('添加失败');
                }

            }
            //多选框
            if($data['dtype']=='Checkbox'){
                $fenge = $data['post']['vdefault'];
                $fenge_one = explode(',',$fenge);
                $str='';
                $str_edit = '';
                foreach($fenge_one as $key=>$val){
                    $str .=' <input type="checkbox" name="posts['.$data['post']['ziduan'].']"  value="'.$val.'">'.$val.'';
                    $str_edit .=' <input type="checkbox" name="posts['.$data['post']['ziduan'].']"  value="'.$val.'">'.$val.'';
                }
                $image_info = Db::table('cmf_createrecords')->where('id="'.$data['post']['id'].'"')->find();
                $content_one = '<tr style="display: none">
                                <th>隐藏</th>
                                <td>
                                <input class="form-control" type="text" name="posts[biao]"
                                value="'.$data['post']['surface'].'" placeholder="请输入不作为标题"/>
                                </td>
                                </tr>
                                <tr>
                                <td class="bline">
                                '.$str.'
                                </td>
                                </tr>';
                $content_two ='                                                    
                                <tr> 
                                <th>'.$data['post']['biaodan'].'</th>
                                <td width="90" class="bline" height=\'24\'>&nbsp;asd：</td>
                                <td class="bline">
                                '.$str_edit.'
                                </td>
                                </tr>';
                $image_add  = Db::table('cmf_createrecords')
                    ->where('id="'.$data['post']['id'].'"')
                    ->update(['addtemplates'=>$content_one,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                if($image_add){
                    $image_addtwo = Db::table('cmf_createrecords')
                        ->where('id="'.$data['post']['id'].'"')
                        ->update(['edittemplates'=>$content_two,'category_id'=>$data['post']['category_id'],'surface'=>$data['post']['surface'],'vdefault'=>$data['post']['vdefault'],'formtips'=>$data['post']['biaodan'],'changeform'=>$data['post']['length'],'formtype'=>$data['dtype'],'ziduan'=>$data['post']['ziduan']]);
                    if($image_addtwo){
                        return $this->success('添加成功');
                    }
                    return $this->success('添加成功');
                }else{
                    return $this->error('添加失败');
                }
            }
            return $this->success('添加成功');
        }

}

?>