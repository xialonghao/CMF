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
use think\Db;
class LianxiController extends HomeBaseController
{

    public function add()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: toresetpwdken, Origin, X-Requested-With, Content-Type, Accept, Authorization");
        header('Access-Control-Allow-Methods: POST,GET,PUT,DELETE');
        $param = $this->request->param();
        $ip = get_client_ip($type = 0, $adv = false);
        $param['inquiry_ip']=$ip;
        $param['inquiry_time']=time();
        $res = Db::table('cmf_inquiry')->insert($param);
        if($res){
            // $this->success('成功');
            return json(array(
                'code'=>'200',
                'msg'=>'成功',
                'data'=>1,
            ));
        }
    }
    public function Clue(){
        $res = Db::table('cmf_inquiry')->select();
        if($res){
            // $this->success('成功');
            return json(array(
                'code'=>'200',
                'msg'=>'成功',
                'data'=>$res,
            ));
        }
    }

}
