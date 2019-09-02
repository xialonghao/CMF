<?php
namespace app\inquiry\controller;
use cmf\controller\AdminBaseController;
use think\Db;
use app\portal\model\PortalPostModel;
use PHPExcel;
USE PHPExcel_IOFactory;
use think\db\Query;
class InquiryListController extends AdminBaseController{
    public function defult(){
    }
    /**
     * 询盘列表
     */
        public function lists(){
        $mobile= $this->request->param('mobile');
        $userEmail = trim($this->request->param('email'));
        $list = DB::table('cmf_inquiry')
            ->where(function (Query $query) use ($mobile, $userEmail) {
                if ($mobile) {
                    $query->where('inquiry_mobile', 'like', "%$mobile%");
                }

                if ($userEmail) {
                    $query->where('inquiry_email', 'like', "%$userEmail%");
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
    /**
     * 询盘批量删除
     */
    public function delete()
    {
        $param= $this->request->param();
        $ids     = $this->request->param('ids');
        $res = Db::table('cmf_inquiry')->where('id','in',$ids)->delete();
        return $this->success('删除成功！','');
    }
    /**
     * 询盘批量导出extel
     */
    public function batchextel(){
        header('Content-Type: text/html; charset=utf-8');
        $param = $this->request->param();
        if (isset($param['ids'])) {
            $ids = $this->request->param('ids');
            $res = Db::table('cmf_inquiry')->where('id','in',$ids)->select();
            $PHPExcel = new PHPExcel();
            $PHPSheet = $PHPExcel->getActiveSheet();
            $PHPSheet->setTitle("询盘列表");
            $PHPSheet->setCellValue("A1","姓名");
            $PHPSheet->setCellValue("B1","邮箱");
            $PHPSheet->setCellValue("C1","手机号");
            $PHPSheet->setCellValue("D1","地址");
            $PHPSheet->setCellValue("E1","询盘时间");
            $PHPSheet->setCellValue("F1","来源网站信息");
            $PHPSheet->setCellValue("G1","服务项目");
            $PHPSheet->setCellValue("H1","qq号");
            $PHPSheet->setCellValue("I1","微信号");
            $PHPSheet->setCellValue("G1","预算金额");
            $PHPSheet->setCellValue("K1","客户网站信息");
            $PHPSheet->setCellValue("M1","需求说明");
            $PHPSheet->setCellValue("L1","需求ip");
            $i = 2;
            foreach($res as $key => $value){
                $PHPSheet->setCellValue('A'.$i,''.$value['inquiry_name']);
                $PHPSheet->setCellValue('B'.$i,''.$value['inquiry_email']);
                $PHPSheet->setCellValue('C'.$i,''.$value['inquiry_mobile']);
                $PHPSheet->setCellValue('D'.$i,''.$value['inquiry_address']);
                $PHPSheet->setCellValue('E'.$i,''.$value['inquiry_time']);
                $PHPSheet->setCellValue('F'.$i,''.$value['inquiry_websys']);
                $PHPSheet->setCellValue('G'.$i,''.$value['inquiry_xiangmu']);
                $PHPSheet->setCellValue('H'.$i,''.$value['inquiry_qq']);
                $PHPSheet->setCellValue('I'.$i,''.$value['inquiry_weixin']);
                $PHPSheet->setCellValue('G'.$i,''.$value['inquiry_money']);
                $PHPSheet->setCellValue('K'.$i,''.$value['inquiry_cilentip']);
                $PHPSheet->setCellValue('M'.$i,''.$value['inquiry_demad']);
                $PHPSheet->setCellValue('L'.$i,''.$value['inquiry_ip']);
                $i++;
            }
            $PHPWriter = \PHPExcel_IOFactory::createWriter($PHPExcel, "Excel2007"); //创建生成的格式
            header('Content-Disposition: attachment;filename="用户列表.xlsx"'); //下载下来的表格名
            header('Content-Type: applicationnd.openxmlformats-officedocument.spreadsheetml.sheet');
            $PHPWriter->save("php://output"); //表示在$path路径下面生成demo.xlsx文件
        }
    }
    /**
     * 询盘全部导出extel
     */
    public function allextel(){
            $res = Db::table('cmf_inquiry')->select();
            $PHPExcel = new PHPExcel();
            $PHPSheet = $PHPExcel->getActiveSheet();
            $PHPSheet->setTitle("询盘列表");
            $PHPSheet->setCellValue("A1","姓名");
            $PHPSheet->setCellValue("B1","邮箱");
            $PHPSheet->setCellValue("C1","手机号");
            $PHPSheet->setCellValue("D1","地址");
            $PHPSheet->setCellValue("E1","询盘时间");
            $PHPSheet->setCellValue("F1","来源网站信息");
            $PHPSheet->setCellValue("G1","服务项目");
            $PHPSheet->setCellValue("H1","qq号");
            $PHPSheet->setCellValue("I1","微信号");
            $PHPSheet->setCellValue("G1","预算金额");
            $PHPSheet->setCellValue("K1","客户网站信息");
            $PHPSheet->setCellValue("M1","需求说明");
            $PHPSheet->setCellValue("L1","需求ip");
            $i = 2;
            foreach($res as $key => $value){
                $PHPSheet->setCellValue('A'.$i,''.$value['inquiry_name']);
                $PHPSheet->setCellValue('B'.$i,''.$value['inquiry_email']);
                $PHPSheet->setCellValue('C'.$i,''.$value['inquiry_mobile']);
                $PHPSheet->setCellValue('D'.$i,''.$value['inquiry_address']);
                $PHPSheet->setCellValue('E'.$i,''.$value['inquiry_time']);
                $PHPSheet->setCellValue('F'.$i,''.$value['inquiry_websys']);
                $PHPSheet->setCellValue('G'.$i,''.$value['inquiry_xiangmu']);
                $PHPSheet->setCellValue('H'.$i,''.$value['inquiry_qq']);
                $PHPSheet->setCellValue('I'.$i,''.$value['inquiry_weixin']);
                $PHPSheet->setCellValue('G'.$i,''.$value['inquiry_money']);
                $PHPSheet->setCellValue('K'.$i,''.$value['inquiry_cilentip']);
                $PHPSheet->setCellValue('M'.$i,''.$value['inquiry_demad']);
                $PHPSheet->setCellValue('L'.$i,''.$value['inquiry_ip']);
                $i++;
            }
        $PHPWriter = \PHPExcel_IOFactory::createWriter($PHPExcel, "Excel2007"); //创建生成的格式
        header('Content-Disposition: attachment;filename="用户列表.xlsx"'); //下载下来的表格名
        header('Content-Type: applicationnd.openxmlformats-officedocument.spreadsheetml.sheet');
        $PHPWriter->save("php://output"); //表示在$path路径下面生成demo.xlsx文件
    }
    /**
     * 查看
     */
    public function examine(){
        $id = $this->request->param();
        $res = Db::table('cmf_inquiry')->where('id="'.$id['id'].'"')->find();

        $this->assign('res',$res);
        return $this->fetch();
    }
    public function dels(){
        $id = $this->request->param();
//        print_r();die;
        $res = Db::table('cmf_inquiry')->where('id="'.$id['id'].'"')->delete();
        if($res){
            return $this->Success('删除成功！','');
        }else{
            return $this->Success('删除失败！','');
        }

    }
    /**
     * 查询
     */
//    public function chaxun(){
////        $res = Db::table('cmf_wxuser')->paginate(10);
//        /**搜索条件**/
//        $mobile= $this->request->param('mobile');
//        $userEmail = trim($this->request->param('inquiry_email'));
//
//        $users = Db::name('inquiry')
//            ->where(function (Query $query) use ($mobile, $userEmail) {
//                if ($mobile) {
//                    $query->where('inquiry_mobile', 'like', "%$mobile%");
//                }
//
//                if ($userEmail) {
//                    $query->where('inquiry_email', 'like', "%$userEmail%");
//                }
//            })
//            ->order("id DESC")
//            ->paginate(10);
//
//        $users->appends(['user_login' => $mobile, 'user_email' => $userEmail]);
//
//        $page = $users->render();
//        $this->assign('list',$users);
//
//        return $this->fetch();;
//    }
}
?>