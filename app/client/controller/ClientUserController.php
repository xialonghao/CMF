<?php
namespace app\client\controller;
use cmf\controller\AdminBaseController;
use think\Db;
use think\db\Query;
use PHPExcel;
use PHPExcel_IOFactory;
    class ClientUserController extends AdminBaseController{
    public function defult(){
        $mobile= $this->request->param('mobile');
        $userEmail = trim($this->request->param('email'));
        $list = DB::table('cmf_client')
            ->where(function (Query $query) use ($mobile, $userEmail) {
                if ($mobile) {
                    $query->where('mobile', 'like', "%$mobile%");
                }

                if ($userEmail) {
                    $query->where('email', 'like', "%$userEmail%");
                }
            })
            ->order("id DESC")
            ->paginate(10);
        // 获取分页显示
        $page = $list->render();
        $this->assign('list', $list);
        $this->assign('page', $page);
        return $this->fetch();
    }
    public function dels(){
        $id = $this->request->param('id');
       $res = Db::table('cmf_client')->where('id',$id)->delete();
       if($res){
           return $this->Success('删除成功！','');
       }
    }
    public function extel(){
        $res = Db::table('cmf_client')->select();
        $PHPExcel = new PHPExcel();
        $PHPSheet = $PHPExcel->getActiveSheet();
        $PHPSheet->setTitle("用户列表");
        $PHPSheet->setCellValue("A1","用户");
        $PHPSheet->setCellValue("B1","手机号");
        $PHPSheet->setCellValue("C1","邮箱");
        $PHPSheet->setCellValue("D1","性别");
        $PHPSheet->setCellValue("E1","头像地址");
        $PHPSheet->setCellValue("F1","注册时间");
        $i = 2;
        foreach($res as $key => $value){
        $PHPSheet->setCellValue('A'.$i,''.$value['username']);
        $PHPSheet->setCellValue('B'.$i,''.$value['password']);
        $PHPSheet->setCellValue('C'.$i,''.$value['mobile']);
        $PHPSheet->setCellValue('D'.$i,''.$value['email']);
        if($value['sex']==0){
            $PHPSheet->setCellValue('E'.$i,'女');
        }
        if($value['sex']==1){
            $PHPSheet->setCellValue('E'.$i,'男');
        }
            $i++;
        }
        $PHPWriter = \PHPExcel_IOFactory::createWriter($PHPExcel, "Excel2007"); //创建生成的格式
        header('Content-Disposition: attachment;filename="用户列表.xlsx"'); //下载下来的表格名
        header('Content-Type: applicationnd.openxmlformats-officedocument.spreadsheetml.sheet');
        $PHPWriter->save("php://output"); //表示在$path路径下面生成demo.xlsx文件
    }
    public function zhengze(){
        $strSubject = "abc【111】abc【222】abc【333】abc";
        $strPattern = "/(?<=【)[^】]+/";
        $arrMatches = [];
        preg_match_all($strPattern, $strSubject, $arrMatches);
        echo"<pre>";
        var_dump($arrMatches);
    }

}
?>