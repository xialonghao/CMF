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

class IndexController extends HomeBaseController
{

    public function index()
    {
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
            return $this->fetch(':index');
        }


    }
}
