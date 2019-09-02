<?php
namespace app\virtud\controller;
use cmf\controller\AdminBaseController;
use think\Db;
use think\db\Query;
class DataBackupController extends AdminBaseController{
    public function lists(){
        return $this->fetch();
    }
    //数据库备份
    public function exportDatabase(){
        //备份数据库
        $host="localhost";
        $user="root";//数据库账号
        $password="root";//数据库密码
        $dbname="zhihuocms";//数据库名称
        //这里的账号、密码、名称都是从页面传过来的
        $con = mysqli_connect($host,$user,$password);
        if(!\mysqli_connect($host,$user,$password)) //连接mysql数据库
        {
            return json(array(
                'code'=>500,
                'msg' =>'数据库连接失败，请核对后再试',
                'data'=>0,
            ));
            exit;
        }
        if(!mysqli_select_db($con,$dbname)) //是否存在该数据库
        {
            return json(array(
                'code'=>500,
                'msg' =>'不存在数据库:'.$dbname.',请核对后再试',
                'data'=>0,
            ));
            exit;
        }
        mysqli_query($con,"set names 'utf8'");
        $mysql= "set charset utf8;\r\n";

        //show tables是所有表
        $q1=mysqli_query($con,"show tables");

        while($t=mysqli_fetch_array($q1)){
            //是获取循环的所有表名
            $table=$t[0];
//            DROP TABLE IF EXISTS `article`;
            //获取每个循环标的插入结构
            $q2=mysqli_query($con,"show create table `$table`");
            $sql=mysqli_fetch_array($q2);
            //导入数据库的方法
            $mysql.="DROP TABLE IF EXISTS `".$sql['Table']."`;\r\n".$sql['Create Table'].";\r\n";

            $q3=mysqli_query($con,"select * from `$table`");
//所有表的内容
            while($data=mysqli_fetch_assoc($q3)){

                $keys=array_keys($data);
                //所有表字段
                $keys=array_map('addslashes',$keys);
                $keys=join('`,`',$keys);
                $keys="`".$keys."`";
                $vals=array_values($data);
                $vals=array_map('addslashes',$vals);
                $vals=join("','",$vals);
                $vals="'".$vals."'";
                $mysql.="insert into `$table`($keys) values($vals);\r\n";
            }
        }
//        echo CMF_ROOT;die;
        $filename=CMF_ROOT."public/databasebackup/".$dbname.date('YmdHis').".sql"; //存放路径，默认存放到项目最外层
        $filename_one = explode('/',$filename);
        $data = array(
            'filename'=>$filename_one[3],
            'creationtime'=>time(),
        );
        Db::table('cmf_filename')->insert($data);
        $fp = fopen($filename,'w');
        fputs($fp,$mysql);
        fclose($fp);
       return json(array(
           'code'=>200,
           'msg' =>'备份成功',
           'data'=>1,
       ));

    }

////删除文件名
//    function delFile(){
//        $dirName = CMF_ROOT."public/databasebackup/zhihuocms20190625181715.sql";
//        if(file_exists($dirName) && $handle=opendir($dirName)){
//            while(false!==($item = readdir($handle))){
//                if($item!= "." && $item != ".."){
//                    if(file_exists($dirName.'/'.$item) && is_dir($dirName.'/'.$item)){
//                        delFile($dirName.'/'.$item);
//                    }else{
//                        if(unlink($dirName.'/'.$item)){
//                            return true;
//                        }
//                    }
//                }
//            }
//            closedir( $handle);
//        }
//    }

//数据还原
    public function inputDatabase(){
        $sqls = $this->request->param();
        $filename = CMF_ROOT."public/databasebackup/".$sqls['ids']."";

        $host="localhost"; //主机名
        $user="root"; //MYSQL用户名
        $password="root"; //密码
        $dbname="asd"; //在此指定您要恢复的数据库名，不存在则必须先创建,请自已修改数据库名
        $con =  mysqli_connect($host,$user,$password);

        mysqli_select_db($con,$dbname);
        $mysql_file=$filename; //指定要恢复的MySQL备份文件路径,请自已修改此路径
        $this->restore($mysql_file,$con); //执行MySQL恢复命令

    }
    function restore($fname,$con)
    {
        ini_set('max_execution_time', '300');
//        $host = "localhost"; //主机名
//        $user = "root"; //MYSQL用户名
//        $password = "root"; //密码
//        $dbname = "asdf"; //在此指定您要恢复的数据库名，不存在则必须先创建,请自已修改数据库名
//        $con =  mysqli_connect($host,$user,$password);
//        检查文件是否存在
        if (file_exists($fname)) {
            $sql_value="";
            $cg=0;
            $sb=0;
            //读取整体文件内容转化数组
            $sqls=file($fname);

            foreach($sqls as $sql)
            {
                $sql_value.=$sql;
            }
            $a=explode(";\r\n", $sql_value); //根据";\r\n"条件对数据库中分条执行
            $total=count($a)-1;
            mysqli_query($con,"set names 'utf8'");
            for ($i=0;$i<$total;$i++)
            {
                mysqli_query($con,"set names 'utf8'");
                //执行命令
                if(mysqli_query($con,$a[$i]))
                {
                    $cg+=1;
                }
                else
                {
                    $sb+=1;
                    $sb_command[$sb]=$a[$i];
                }
            }
            echo "操作完毕，共处理 $total 条命令，成功 $cg 条，失败 $sb 条";

            if ($sb>0)
            {
                echo "<hr><br><br>失败命令如下：<br>";

                for ($ii=1;$ii<=$sb;$ii++)
                {
                    echo "<p><b>第 ".$ii." 条命令（内容如下）：</b><br>".$sb_command[$ii]."</p><br>";
                }
            }  //-----------------------------------------------------------
        }else{
            echo "MySQL备份文件不存在，请检查文件路径是否正确！";

        }
    }
    public function zhanshi(){

        $filename=CMF_ROOT."public/databasebackup/"; //存放路径，默认存放到项目最外层
        $wenjian='';
        if (is_dir($filename)){
            if ($dh = opendir($filename)){
                while (($file = readdir($dh)) !== false){
                    $wenjian .=  ",".$file;
                }
            }
        }
        $shuzu = explode(",",$wenjian);
        unset($shuzu[0]);
        unset($shuzu[1]);
        unset($shuzu[2]);

        return json(array('code'=>'200','msg'=>'成功','data'=>$shuzu));

    }
    public function myshow(){
        $res = Db::table('cmf_filename')->select();
        foreach($res as &$val){
            $val['creationtime']= date('Y-m-d H:i:s',$val['creationtime']);
            $data[]=   $val;
        }
        return json(array('code'=>'200','msg'=>'成功','data'=>$data));
    }
        public function shanchu(){
            $sqls = $this->request->param();
            $lj = $sqls['ids'];
           $res = Db::table('cmf_filename')->where('filename="'.$lj.'"')->delete();
           if($res){
               $filename=CMF_ROOT."public/databasebackup/"; //存放路径，默认存放到项目最外层
               $wenjian='';
               if (is_dir($filename)){
                   $dato = opendir($filename);
                   while (($file = readdir($dato)) !== false){
                       if ( $file != "." && $file != ".." ) {

                           if( unlink( "$filename/$lj " ) ){
                               return json(array(
                                   'code'=>'200',
                                    'msg'=>'删除成功',
                                   'data'=>1,
                               ));
                           }
                       }

                   }
               }
           }else{
               return json(array(
                   'code'=>'500',
                   'msg'=>'删除失败',
                   'data'=>1,
               ));
           }

        }

}
?>