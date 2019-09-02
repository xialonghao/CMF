<?php
// +----------------------------------------------------------------------
// | Copyright (c) Du All rights reserved.
// +----------------------------------------------------------------------
// | Author: @Du <597756738@qq.com>
// +----------------------------------------------------------------------
namespace plugins\m_pc_theme;
use cmf\lib\Plugin;
use think\Request;
class MPcThemePlugin extends Plugin
{
    public $info = [
    'name'        => 'MPcTheme',
    'title'       => 'M/PC模板自动跳转',
    'description' => 'M/PC模板自动跳转',
    'status'      => 1,
    'author'      => '@夏',
    'version'     => '1.0',
    'demo_url'    => '',
    'author_url'  => ''
    ];

    public $hasAdmin = 0;

    public function install()
    {
        return true;
    }

    public function uninstall()
    {
        return true;
    }

    public function switchTheme($param)
    {
        $request =new Request();
        $domin_url = $request->host();
        $domin_url = explode('.',$domin_url);
        if(cmf_is_mobile() == true && $domin_url[0]=='www'){
            header('Location: http://m.'.$domin_url[1].'.'.$domin_url[2].'/');
        }elseif(cmf_is_mobile() == false && $domin_url[0]=='m'){
            header('Location:http://www.'.$domin_url[1].'.'.$domin_url[2].'/');
        }

        $config = $this->getConfig();
        if(cmf_is_mobile() == true){
            $mobile = true;
        }else{$mobile = false;}

        if ($mobile) {
            $cmfDefaultTheme = $config['wapthems'];
        }else{
            $cmfDefaultTheme = config('cmf_default_theme');
        }
        return $cmfDefaultTheme;
    }
}