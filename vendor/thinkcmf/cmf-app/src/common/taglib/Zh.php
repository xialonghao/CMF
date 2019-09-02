<?php
/**
 * Created by PhpStorm.
 * User: qianrao
 * Date: 2019/6/15
 * Time: 14:24
 */
namespace app\common\taglib;
use think\template\TagLib;
use think\Db;
/**
 * CX标签库解析类
 * @category   Think
 * @package  Think
 * @subpackage  Driver.Taglib
 * @author    liu21st <liu21st@gmail.com>
 */
class Zh extends Taglib
{
    // 标签定义： attr 属性列表 close 是否闭合（0 或者1 默认1） alias 标签别名 level 嵌套层次
    protected $tags = [
        'newslist' => ['attr' => 'field,order,limit,like,sql,name,where,page', 'close' => 1],
        'flink' => ['attr' => 'order,limit,thumb,name,where', 'close' => 1],
    ];
    public function tagNewlist($tag,$content){
        $field = isset($tag['field'])?$tag['field']:'*';
        $order = isset($tab['order'])?$tag['order']:'id asc';
        $like  = isset($tab['like'])?$tag['like']:'';
        $sql = isset($tag['sql']) ? $tag['sql'] : false;
        $page = isset($tag['page']) ? $tag['page'] == 'true' ? true : false : false;
        $name = isset($tag['name']) ? $tag['name'] : 'zh';
        $where = isset($tag['where'])?$tag['where']:'1=1';
        $where = $where.$like;
        $countinfo = Db::table('cmf_portal_post')->where($where)->count();         //总条数
        $row = isset($tag['limit']) ? $tag['limit'] : $countinfo;   //获取limit
        $countpage = ceil($countinfo/$row);       //总页数
        $pagestr = $page ? '"':'\' \'';
        //循环分页
        if($page){
            $pagestr .= '<ul style=\'list-style: none;clear:both;height: auto;overflow: hidden;\'>';
            for($i=1;$i<=$countpage;$i++){
                if($countpage==1) break;
                $pagestr .= '<li style=\'float: left;margin-left: 10px\'><a style=\'text-decoration: none;color: #000;font-size: 18px;\' href=\'?page='.$i.'\'>' . $i . '</a></li>';
            }
            $pagestr .= "</ul>\"";
        }
        if($sql){
            $str  = '<?php ';
            $str .= '$info=Db::table()->query(' . "\"" . $sql . "\"" . ');';
            $str .= ' foreach($info as $zh):';
            $str .= ' ?>';
            $str .= $content;
            $str .= '<?php endforeach; ?>';
            return $str;
        }
        $str  = '<?php ';
        $str .= ' $info=Db::table(\'cmf_portal_post\')->field(\''.$field.'\')->where("'.$where.$like.'")->order(\''.$order.'\')->limit(($pages-1)*'.$row.','.$row.')->select();';
        $str .= '$page='.$pagestr.';';
        $str .= ' foreach($info as $'.$name.'): ?>';
        $str .= $content;
        $str .= '<?php endforeach; ?>';
        return $str;
    }
    /*友情链接*/
    public function tagFlink($tag,$content){
        $order = isset($tag['order']) ? $tag['order'] : 'id asc';      //排序方式
        $limit = isset($tag['limit']) ? "->limit('".$tag['limit']."')" : '';  //读取条数
        $where = isset($tag['where']) ?  $tag['where'] : '1=1';     //where条件
        $page = isset($tag['page']) ? $tag['page'] == 'true' ? true : false : false;        //sql语句
        $thumb = isset($tag['thumb']) ? $tag['thumb'] == 'true' ? true : false : false; //是否显示图片
        $name=isset($tag['name']) ? $tag['name'] : 'v';        //循环变量
        $countinfo = db('cmf_link')->where($where)->count();         //总条数
        $row = isset($tag['limit']) ? $tag['limit'] : $countinfo;   //获取limit
        $countpage = ceil($countinfo/$row);       //总页数
        $pagestr = $page ? '"':'\' \'';
        //循环分页
        if($page){
            $pagestr .= '<ul style=\'list-style: none;clear:both;height: auto;overflow: hidden;\'>';
            for($i=1;$i<=$countpage;$i++){
                if($countpage==1) break;
                $pagestr .= '<li style=\'float: left;margin-left: 10px\'><a style=\'text-decoration: none;color: #000;font-size: 18px;\' href=\'?page='.$i.'\'>' . $i . '</a></li>';
            }
            $pagestr .= "</ul>\"";
        }
        $str  = '<?php ';
        if($thumb == 'true'){
            $str .= '$info=db(\'cmf_link\')->where(\'photo is not null\')->order(\''.$order.'\')'.$limit.'->select();';
        }else{
            $str .= '$info=db(\'cmf_link\')->where(\'photo is null\')->order(\''.$order.'\')'.$limit.'->select();';
        }
        $str .= '$page='.$pagestr.';';
        $str .= ' foreach($info as $'.$name.'): ?>';
        $str .= $content;
        $str .= '<?php endforeach; ?>';
        return $str;
    }
}
?>