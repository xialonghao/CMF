set charset utf8;
DROP TABLE IF EXISTS `cmf_admin_menu`;
CREATE TABLE `cmf_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父菜单id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '菜单类型;1:有界面可访问菜单,2:无界面可访问菜单,0:只作为菜单',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;1:显示,0:不显示',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `app` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '应用名',
  `controller` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '控制器名',
  `action` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '操作名称',
  `param` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '额外参数',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '菜单图标',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parent_id` (`parent_id`),
  KEY `controller` (`controller`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COMMENT='后台菜单表';
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('1','0','0','1','20','admin','Plugin','default','','插件中心','cloud','插件中心');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('2','1','1','1','10000','admin','Hook','index','','钩子管理','','钩子管理');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('3','2','1','0','10000','admin','Hook','plugins','','钩子插件管理','','钩子插件管理');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('4','2','2','0','10000','admin','Hook','pluginListOrder','','钩子插件排序','','钩子插件排序');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('5','2','1','0','10000','admin','Hook','sync','','同步钩子','','同步钩子');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('6','0','0','1','0','admin','Setting','default','','设置','cogs','系统设置入口');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('7','0','1','1','50','admin','Link','index','','友情链接','chain','友情链接管理');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('8','7','1','0','10000','admin','Link','add','','添加友情链接','','添加友情链接');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('9','7','2','0','10000','admin','Link','addPost','','添加友情链接提交保存','','添加友情链接提交保存');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('10','7','1','0','10000','admin','Link','edit','','编辑友情链接','','编辑友情链接');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('11','7','2','0','10000','admin','Link','editPost','','编辑友情链接提交保存','','编辑友情链接提交保存');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('12','7','2','0','10000','admin','Link','delete','','删除友情链接','','删除友情链接');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('13','7','2','0','10000','admin','Link','listOrder','','友情链接排序','','友情链接排序');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('14','7','2','0','10000','admin','Link','toggle','','友情链接显示隐藏','','友情链接显示隐藏');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('15','6','1','1','10','admin','Mailer','index','','邮箱配置','','邮箱配置');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('16','15','2','0','10000','admin','Mailer','indexPost','','邮箱配置提交保存','','邮箱配置提交保存');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('17','15','1','0','10000','admin','Mailer','template','','邮件模板','','邮件模板');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('18','15','2','0','10000','admin','Mailer','templatePost','','邮件模板提交','','邮件模板提交');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('19','15','1','0','10000','admin','Mailer','test','','邮件发送测试','','邮件发送测试');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('20','6','1','0','10000','admin','Menu','index','','后台菜单','','后台菜单管理');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('21','20','1','0','10000','admin','Menu','lists','','所有菜单','','后台所有菜单列表');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('22','20','1','0','10000','admin','Menu','add','','后台菜单添加','','后台菜单添加');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('23','20','2','0','10000','admin','Menu','addPost','','后台菜单添加提交保存','','后台菜单添加提交保存');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('24','20','1','0','10000','admin','Menu','edit','','后台菜单编辑','','后台菜单编辑');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('25','20','2','0','10000','admin','Menu','editPost','','后台菜单编辑提交保存','','后台菜单编辑提交保存');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('26','20','2','0','10000','admin','Menu','delete','','后台菜单删除','','后台菜单删除');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('27','20','2','0','10000','admin','Menu','listOrder','','后台菜单排序','','后台菜单排序');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('28','20','1','0','10000','admin','Menu','getActions','','导入新后台菜单','','导入新后台菜单');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('29','0','1','1','30','admin','Nav','index','','导航管理','navicon','导航管理');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('30','29','1','0','10000','admin','Nav','add','','添加导航','','添加导航');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('31','29','2','0','10000','admin','Nav','addPost','','添加导航提交保存','','添加导航提交保存');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('32','29','1','0','10000','admin','Nav','edit','','编辑导航','','编辑导航');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('33','29','2','0','10000','admin','Nav','editPost','','编辑导航提交保存','','编辑导航提交保存');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('34','29','2','0','10000','admin','Nav','delete','','删除导航','','删除导航');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('35','29','1','0','10000','admin','NavMenu','index','','导航菜单','','导航菜单');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('36','35','1','0','10000','admin','NavMenu','add','','添加导航菜单','','添加导航菜单');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('37','35','2','0','10000','admin','NavMenu','addPost','','添加导航菜单提交保存','','添加导航菜单提交保存');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('38','35','1','0','10000','admin','NavMenu','edit','','编辑导航菜单','','编辑导航菜单');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('39','35','2','0','10000','admin','NavMenu','editPost','','编辑导航菜单提交保存','','编辑导航菜单提交保存');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('40','35','2','0','10000','admin','NavMenu','delete','','删除导航菜单','','删除导航菜单');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('41','35','2','0','10000','admin','NavMenu','listOrder','','导航菜单排序','','导航菜单排序');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('42','1','1','1','10000','admin','Plugin','index','','插件列表','','插件列表');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('43','42','2','0','10000','admin','Plugin','toggle','','插件启用禁用','','插件启用禁用');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('44','42','1','0','10000','admin','Plugin','setting','','插件设置','','插件设置');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('45','42','2','0','10000','admin','Plugin','settingPost','','插件设置提交','','插件设置提交');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('46','42','2','0','10000','admin','Plugin','install','','插件安装','','插件安装');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('47','42','2','0','10000','admin','Plugin','update','','插件更新','','插件更新');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('48','42','2','0','10000','admin','Plugin','uninstall','','卸载插件','','卸载插件');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('49','110','0','1','10000','admin','User','default','','管理组','','管理组');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('50','49','1','1','10000','admin','Rbac','index','','角色管理','','角色管理');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('51','50','1','0','10000','admin','Rbac','roleAdd','','添加角色','','添加角色');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('52','50','2','0','10000','admin','Rbac','roleAddPost','','添加角色提交','','添加角色提交');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('53','50','1','0','10000','admin','Rbac','roleEdit','','编辑角色','','编辑角色');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('54','50','2','0','10000','admin','Rbac','roleEditPost','','编辑角色提交','','编辑角色提交');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('55','50','2','0','10000','admin','Rbac','roleDelete','','删除角色','','删除角色');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('56','50','1','0','10000','admin','Rbac','authorize','','设置角色权限','','设置角色权限');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('57','50','2','0','10000','admin','Rbac','authorizePost','','角色授权提交','','角色授权提交');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('58','0','1','0','10000','admin','RecycleBin','index','','回收站','','回收站');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('59','58','2','0','10000','admin','RecycleBin','restore','','回收站还原','','回收站还原');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('60','58','2','0','10000','admin','RecycleBin','delete','','回收站彻底删除','','回收站彻底删除');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('61','6','1','1','10000','admin','Route','index','','URL美化','','URL规则管理');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('62','61','1','0','10000','admin','Route','add','','添加路由规则','','添加路由规则');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('63','61','2','0','10000','admin','Route','addPost','','添加路由规则提交','','添加路由规则提交');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('64','61','1','0','10000','admin','Route','edit','','路由规则编辑','','路由规则编辑');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('65','61','2','0','10000','admin','Route','editPost','','路由规则编辑提交','','路由规则编辑提交');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('66','61','2','0','10000','admin','Route','delete','','路由规则删除','','路由规则删除');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('67','61','2','0','10000','admin','Route','ban','','路由规则禁用','','路由规则禁用');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('68','61','2','0','10000','admin','Route','open','','路由规则启用','','路由规则启用');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('69','61','2','0','10000','admin','Route','listOrder','','路由规则排序','','路由规则排序');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('70','61','1','0','10000','admin','Route','select','','选择URL','','选择URL');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('71','6','1','1','0','admin','Setting','site','','网站信息','','网站信息');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('72','71','2','0','10000','admin','Setting','sitePost','','网站信息设置提交','','网站信息设置提交');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('73','6','1','0','10000','admin','Setting','password','','密码修改','','密码修改');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('74','73','2','0','10000','admin','Setting','passwordPost','','密码修改提交','','密码修改提交');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('75','6','1','1','10000','admin','Setting','upload','','上传设置','','上传设置');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('76','75','2','0','10000','admin','Setting','uploadPost','','上传设置提交','','上传设置提交');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('77','6','1','0','10000','admin','Setting','clearCache','','清除缓存','','清除缓存');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('78','0','1','1','40','admin','Slide','index','','幻灯片管理','file-photo-o','幻灯片管理');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('79','78','1','0','10000','admin','Slide','add','','添加幻灯片','','添加幻灯片');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('80','78','2','0','10000','admin','Slide','addPost','','添加幻灯片提交','','添加幻灯片提交');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('81','78','1','0','10000','admin','Slide','edit','','编辑幻灯片','','编辑幻灯片');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('82','78','2','0','10000','admin','Slide','editPost','','编辑幻灯片提交','','编辑幻灯片提交');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('83','78','2','0','10000','admin','Slide','delete','','删除幻灯片','','删除幻灯片');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('84','78','1','0','10000','admin','SlideItem','index','','幻灯片页面列表','','幻灯片页面列表');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('85','84','1','0','10000','admin','SlideItem','add','','幻灯片页面添加','','幻灯片页面添加');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('86','84','2','0','10000','admin','SlideItem','addPost','','幻灯片页面添加提交','','幻灯片页面添加提交');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('87','84','1','0','10000','admin','SlideItem','edit','','幻灯片页面编辑','','幻灯片页面编辑');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('88','84','2','0','10000','admin','SlideItem','editPost','','幻灯片页面编辑提交','','幻灯片页面编辑提交');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('89','84','2','0','10000','admin','SlideItem','delete','','幻灯片页面删除','','幻灯片页面删除');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('90','84','2','0','10000','admin','SlideItem','ban','','幻灯片页面隐藏','','幻灯片页面隐藏');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('91','84','2','0','10000','admin','SlideItem','cancelBan','','幻灯片页面显示','','幻灯片页面显示');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('92','84','2','0','10000','admin','SlideItem','listOrder','','幻灯片页面排序','','幻灯片页面排序');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('93','6','1','1','10000','admin','Storage','index','','文件存储','','文件存储');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('94','93','2','0','10000','admin','Storage','settingPost','','文件存储设置提交','','文件存储设置提交');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('95','0','1','1','20','admin','Theme','index','','模板管理','folder-open','模板管理');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('96','95','1','0','10000','admin','Theme','install','','安装模板','','安装模板');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('97','95','2','0','10000','admin','Theme','uninstall','','卸载模板','','卸载模板');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('98','95','2','0','10000','admin','Theme','installTheme','','模板安装','','模板安装');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('99','95','2','0','10000','admin','Theme','update','','模板更新','','模板更新');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('100','95','2','0','10000','admin','Theme','active','','启用模板','','启用模板');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('101','95','1','0','10000','admin','Theme','files','','模板文件列表','','启用模板');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('102','95','1','0','10000','admin','Theme','fileSetting','','模板文件设置','','模板文件设置');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('103','95','1','0','10000','admin','Theme','fileArrayData','','模板文件数组数据列表','','模板文件数组数据列表');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('104','95','2','0','10000','admin','Theme','fileArrayDataEdit','','模板文件数组数据添加编辑','','模板文件数组数据添加编辑');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('105','95','2','0','10000','admin','Theme','fileArrayDataEditPost','','模板文件数组数据添加编辑提交保存','','模板文件数组数据添加编辑提交保存');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('106','95','2','0','10000','admin','Theme','fileArrayDataDelete','','模板文件数组数据删除','','模板文件数组数据删除');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('107','95','2','0','10000','admin','Theme','settingPost','','模板文件编辑提交保存','','模板文件编辑提交保存');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('108','95','1','0','10000','admin','Theme','dataSource','','模板文件设置数据源','','模板文件设置数据源');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('109','95','1','0','10000','admin','Theme','design','','模板设计','','模板设计');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('110','0','0','1','10','user','AdminIndex','default','','用户管理','group','用户管理');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('111','49','1','1','10000','admin','User','index','','管理员','','管理员管理');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('112','111','1','0','10000','admin','User','add','','管理员添加','','管理员添加');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('113','111','2','0','10000','admin','User','addPost','','管理员添加提交','','管理员添加提交');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('114','111','1','0','10000','admin','User','edit','','管理员编辑','','管理员编辑');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('115','111','2','0','10000','admin','User','editPost','','管理员编辑提交','','管理员编辑提交');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('116','111','1','0','10000','admin','User','userInfo','','个人信息','','管理员个人信息修改');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('117','111','2','0','10000','admin','User','userInfoPost','','管理员个人信息修改提交','','管理员个人信息修改提交');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('118','111','2','0','10000','admin','User','delete','','管理员删除','','管理员删除');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('119','111','2','0','10000','admin','User','ban','','停用管理员','','停用管理员');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('120','111','2','0','10000','admin','User','cancelBan','','启用管理员','','启用管理员');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('121','0','1','0','10000','user','AdminAsset','index','','资源管理','file','资源管理列表');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('122','121','2','0','10000','user','AdminAsset','delete','','删除文件','','删除文件');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('123','110','0','1','10000','user','AdminIndex','default1','','用户组','','用户组');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('124','123','1','1','10000','user','AdminIndex','index','','本站用户','','本站用户');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('125','124','2','0','10000','user','AdminIndex','ban','','本站用户拉黑','','本站用户拉黑');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('126','124','2','0','10000','user','AdminIndex','cancelBan','','本站用户启用','','本站用户启用');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('127','123','1','1','10000','user','AdminOauth','index','','第三方用户','','第三方用户');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('128','127','2','0','10000','user','AdminOauth','delete','','删除第三方用户绑定','','删除第三方用户绑定');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('129','6','1','1','10000','user','AdminUserAction','index','','用户操作管理','','用户操作管理');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('130','129','1','0','10000','user','AdminUserAction','edit','','编辑用户操作','','编辑用户操作');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('131','129','2','0','10000','user','AdminUserAction','editPost','','编辑用户操作提交','','编辑用户操作提交');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('132','129','1','0','10000','user','AdminUserAction','sync','','同步用户操作','','同步用户操作');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('133','0','1','1','10000','inquiry','InquiryList','defult','','询盘管理','handshake-o','');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('134','133','1','1','10000','inquiry','InquiryList','lists','','询盘列表','','');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('135','0','1','1','10000','virtud','DataBackup','lists','','数据备份管理','database','');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('136','0','0','1','30','portal','AdminIndex','default','','内容管理','th','门户管理');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('137','136','1','1','10000','portal','AdminArticle','index','','文章管理','','文章列表');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('138','137','1','0','10000','portal','AdminArticle','add','','添加文章','','添加文章');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('139','137','2','0','10000','portal','AdminArticle','addPost','','添加文章提交','','添加文章提交');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('140','137','1','0','10000','portal','AdminArticle','edit','','编辑文章','','编辑文章');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('141','137','2','0','10000','portal','AdminArticle','editPost','','编辑文章提交','','编辑文章提交');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('142','137','2','0','10000','portal','AdminArticle','delete','','文章删除','','文章删除');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('143','137','2','0','10000','portal','AdminArticle','publish','','文章发布','','文章发布');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('144','137','2','0','10000','portal','AdminArticle','top','','文章置顶','','文章置顶');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('145','137','2','0','10000','portal','AdminArticle','recommend','','文章推荐','','文章推荐');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('146','137','2','0','10000','portal','AdminArticle','listOrder','','文章排序','','文章排序');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('147','136','1','1','10000','portal','AdminCategory','index','','栏目管理','','文章分类列表');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('148','147','1','0','10000','portal','AdminCategory','add','','添加文章分类','','添加文章分类');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('149','147','2','0','10000','portal','AdminCategory','addPost','','添加文章分类提交','','添加文章分类提交');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('150','147','1','0','10000','portal','AdminCategory','edit','','编辑文章分类','','编辑文章分类');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('151','147','2','0','10000','portal','AdminCategory','editPost','','编辑文章分类提交','','编辑文章分类提交');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('152','147','1','0','10000','portal','AdminCategory','select','','文章分类选择对话框','','文章分类选择对话框');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('153','147','2','0','10000','portal','AdminCategory','listOrder','','文章分类排序','','文章分类排序');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('154','147','2','0','10000','portal','AdminCategory','toggle','','文章分类显示隐藏','','文章分类显示隐藏');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('155','147','2','0','10000','portal','AdminCategory','delete','','删除文章分类','','删除文章分类');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('156','136','1','1','10000','portal','AdminPage','index','','页面管理','','页面管理');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('157','156','1','0','10000','portal','AdminPage','add','','添加页面','','添加页面');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('158','156','2','0','10000','portal','AdminPage','addPost','','添加页面提交','','添加页面提交');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('159','156','1','0','10000','portal','AdminPage','edit','','编辑页面','','编辑页面');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('160','156','2','0','10000','portal','AdminPage','editPost','','编辑页面提交','','编辑页面提交');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('161','156','2','0','10000','portal','AdminPage','delete','','删除页面','','删除页面');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('162','136','1','1','10000','portal','AdminTag','index','','文章标签','','文章标签');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('163','162','1','0','10000','portal','AdminTag','add','','添加文章标签','','添加文章标签');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('164','162','2','0','10000','portal','AdminTag','addPost','','添加文章标签提交','','添加文章标签提交');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('165','162','2','0','10000','portal','AdminTag','upStatus','','更新标签状态','','更新标签状态');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('166','162','2','0','10000','portal','AdminTag','delete','','删除文章标签','','删除文章标签');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('167','0','1','1','10000','keyworder','KeyWorder','index','','SEO内链','chain-broken','');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('168','0','1','1','10000','advertisement','Advertisement','index','defult','广告模块','grav','');
insert into `cmf_admin_menu`(`id`,`parent_id`,`type`,`status`,`list_order`,`app`,`controller`,`action`,`param`,`name`,`icon`,`remark`) values('169','0','1','1','10000','modular','Modular','index','','内容模型管理','puzzle-piece','');
DROP TABLE IF EXISTS `cmf_advertisement`;
CREATE TABLE `cmf_advertisement` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` varchar(255) DEFAULT NULL COMMENT '栏目id',
  `image` varchar(255) DEFAULT NULL COMMENT '图片',
  `url_image` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `character` varchar(255) DEFAULT NULL COMMENT '文字内容',
  `url_character` varchar(255) DEFAULT NULL COMMENT '文字链接',
  `endtime` varchar(255) DEFAULT NULL COMMENT '结束时间',
  `starttime` varchar(255) DEFAULT NULL COMMENT '开始时间',
  `username` varchar(255) DEFAULT NULL COMMENT '广告昵称',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='广告';
DROP TABLE IF EXISTS `cmf_asset`;
CREATE TABLE `cmf_asset` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `file_size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小,单位B',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:可用,0:不可用',
  `download_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `file_key` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件惟一码',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_path` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件路径,相对于upload目录,可以为url',
  `file_md5` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件md5值',
  `file_sha1` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `suffix` varchar(10) NOT NULL DEFAULT '' COMMENT '文件后缀名,不包括点',
  `more` text COMMENT '其它详细信息,JSON格式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COMMENT='资源表';
insert into `cmf_asset`(`id`,`user_id`,`file_size`,`create_time`,`status`,`download_times`,`file_key`,`filename`,`file_path`,`file_md5`,`file_sha1`,`suffix`,`more`) values('1','1','4828','1563189542','1','0','b727bf090cec8a77559d75ffe2312256702226aa9df6c4560c170bcd6a8be230','cms20190624195838.png','advertisement/20190715/fc234241d3f79b9daa41a3afb6990f66.png','b727bf090cec8a77559d75ffe2312256','0de8cdfd901e51239630bb5d251a05da0750178b','png','');
insert into `cmf_asset`(`id`,`user_id`,`file_size`,`create_time`,`status`,`download_times`,`file_key`,`filename`,`file_path`,`file_md5`,`file_sha1`,`suffix`,`more`) values('2','1','123421','1563189576','1','0','deb4a025d273c0ae2e9971fb130c723a2c31f5fed8cf3c0b3355a84db2a4b3fd','3a17a8aa476c42fef88b5fcc591c74e7.jpeg','advertisement/20190715/5c4765a7ddd1703eacba555ef9890380.jpeg','deb4a025d273c0ae2e9971fb130c723a','7052262c7ef5fe3feb7fae7d350b7eb636713460','jpeg','');
insert into `cmf_asset`(`id`,`user_id`,`file_size`,`create_time`,`status`,`download_times`,`file_key`,`filename`,`file_path`,`file_md5`,`file_sha1`,`suffix`,`more`) values('3','1','38948','1563193041','1','0','c991fdd1d97b4acf056a2cc29a895a6e69df82d0365cb8337e8ee359dba2bbc3','adsfq.jpg','advertisement/20190715/bce87a0f04ce9b39a3bec568569760a9.jpg','c991fdd1d97b4acf056a2cc29a895a6e','8d1dedf3ef8dbfe926bd2aab8601c48ac0f62f32','jpg','');
insert into `cmf_asset`(`id`,`user_id`,`file_size`,`create_time`,`status`,`download_times`,`file_key`,`filename`,`file_path`,`file_md5`,`file_sha1`,`suffix`,`more`) values('4','1','33835','1563969274','1','0','41ec6c7fba7141d132a0d41bb43d20efb89e7262af8d99b2080aef26d8ba55a4','微信图片_20190724143054.jpg','portal/20190724/c56d912c5ea5254a1bfc215c41247d67.jpg','41ec6c7fba7141d132a0d41bb43d20ef','ca8d4d6adef03df5e5925883589dcf800c109acf','jpg','');
insert into `cmf_asset`(`id`,`user_id`,`file_size`,`create_time`,`status`,`download_times`,`file_key`,`filename`,`file_path`,`file_md5`,`file_sha1`,`suffix`,`more`) values('5','1','8159','1564019645','1','0','2366e457178e22df0b61b6f9a796e185b1aa7f3c32eacbef4ab3821cfe9efe6a','timg (1).jpg','portal/20190725/aacd217425f7e69b5a29e8561501db26.jpg','2366e457178e22df0b61b6f9a796e185','f03e0f37823824f0c194127c81cb212c0a1aebbe','jpg','');
insert into `cmf_asset`(`id`,`user_id`,`file_size`,`create_time`,`status`,`download_times`,`file_key`,`filename`,`file_path`,`file_md5`,`file_sha1`,`suffix`,`more`) values('6','1','3878','1564109780','1','0','e9eb5dd6dd58dee7e2ed1ca7b62391968b33ceb36b313fee81e2b25af640d321','baike_nav_img3.png','portal/20190726/81ac2a4684ca72705ac07dbf510a4cb6.png','e9eb5dd6dd58dee7e2ed1ca7b6239196','dc289a0508b29df4e816b1ca45ea208bf1ca1bdd','png','');
insert into `cmf_asset`(`id`,`user_id`,`file_size`,`create_time`,`status`,`download_times`,`file_key`,`filename`,`file_path`,`file_md5`,`file_sha1`,`suffix`,`more`) values('7','1','8491','1564110077','1','0','ea5caeb83f60429967ea5c6e238a248c030cd0c72a3c74a0e87f8a5ebf43e018','foot-img1.jpg','portal/20190726/cd4a0e4e9979506074880dc165731bb1.jpg','ea5caeb83f60429967ea5c6e238a248c','a94a5a5b21ff6c4347d696d6e1eed894da41b780','jpg','');
insert into `cmf_asset`(`id`,`user_id`,`file_size`,`create_time`,`status`,`download_times`,`file_key`,`filename`,`file_path`,`file_md5`,`file_sha1`,`suffix`,`more`) values('8','1','101142','1564111473','1','0','8218730d4f49677d0eb2dc48bbbb2036140e124c4d76a86340d3cdb9ee8b181c','71348.jpg','portal/20190726/bcfe0ab3f71043cc71770af15df3fd3a.jpg','8218730d4f49677d0eb2dc48bbbb2036','3148431fcfea5a08c98fdc80c00ab22f51a1da49','jpg','');
insert into `cmf_asset`(`id`,`user_id`,`file_size`,`create_time`,`status`,`download_times`,`file_key`,`filename`,`file_path`,`file_md5`,`file_sha1`,`suffix`,`more`) values('9','1','116466','1564372827','1','0','df3db2a018ada79a44382293fe4bc700552b30b9ab799757ce8508d1030e3743','klsadvnas.jpg','portal/20190729/acda5440e31c7db996cee16956d6ab83.jpg','df3db2a018ada79a44382293fe4bc700','2e8052bad0a7e20fed4e9c3b9dc9cab98a3b9baf','jpg','');
insert into `cmf_asset`(`id`,`user_id`,`file_size`,`create_time`,`status`,`download_times`,`file_key`,`filename`,`file_path`,`file_md5`,`file_sha1`,`suffix`,`more`) values('10','1','34699','1564390508','1','0','5fc6de9eb2e7c871d412902bc7c0b6cc15b4ee1550b05188b713ded1ff8b0b60','u=2564645995,140225418&fm=27&gp=0.jpg','portal/20190729/2db4a2fe0e9816359bfaacaf54de5cbd.jpg','5fc6de9eb2e7c871d412902bc7c0b6cc','6cc3da177cf1648d7b02abb812e220ae04a8a861','jpg','');
insert into `cmf_asset`(`id`,`user_id`,`file_size`,`create_time`,`status`,`download_times`,`file_key`,`filename`,`file_path`,`file_md5`,`file_sha1`,`suffix`,`more`) values('11','1','32','1564631066','1','0','34f44c3b077a988e3fd128887c76c9573861e41213872a447a6747e955a7d22b','qIOjJgrG4P.txt','portal/20190801/6cb6dcaa4438ceedf99b6f4a01a57b46.txt','34f44c3b077a988e3fd128887c76c957','b6ef77b600fba6dc1283df5667cbb59224b252c5','txt','');
insert into `cmf_asset`(`id`,`user_id`,`file_size`,`create_time`,`status`,`download_times`,`file_key`,`filename`,`file_path`,`file_md5`,`file_sha1`,`suffix`,`more`) values('12','1','32','1564631086','1','0','1d55e2239c30a13d6d90341db23cfc49de62e36006562959e53e087693dbb983','hrKbUdD0Tf.txt','portal/20190801/a6c397b9c206536efd7b88ba7e0979b0.txt','1d55e2239c30a13d6d90341db23cfc49','a3c6c6985f72f04a4d105df6eb746936c3dffd2e','txt','');
insert into `cmf_asset`(`id`,`user_id`,`file_size`,`create_time`,`status`,`download_times`,`file_key`,`filename`,`file_path`,`file_md5`,`file_sha1`,`suffix`,`more`) values('13','1','32','1564631842','1','0','406255b6eef72691db8de11a520b3954edc17b461e6eeb60412576bd664644a7','NSgF7nO24O.txt','portal/20190801/53478f8a66ba2aa425c401355f5f3a85.txt','406255b6eef72691db8de11a520b3954','4e56ad1acd5c420ef29bf7aab6e71d9aa57fb18c','txt','');
insert into `cmf_asset`(`id`,`user_id`,`file_size`,`create_time`,`status`,`download_times`,`file_key`,`filename`,`file_path`,`file_md5`,`file_sha1`,`suffix`,`more`) values('14','1','32','1564631903','1','0','e06652bc71eee74c56a6137496f9cfc86eecdda5de91ce454f21ad91965bdfa2','sAaJvIvLhz.txt','portal/20190801/5c83b4d1af5b3df8ba2a22e6396ab2b2.txt','e06652bc71eee74c56a6137496f9cfc8','b5c9b9c9b779787f4636d0701e1a904a16e7ad91','txt','');
insert into `cmf_asset`(`id`,`user_id`,`file_size`,`create_time`,`status`,`download_times`,`file_key`,`filename`,`file_path`,`file_md5`,`file_sha1`,`suffix`,`more`) values('15','1','32','1564638491','1','0','e0ccea9e38aafd2536abe7b60d0bd8349ab0e273fcbaeeee8a6c9fb33a5825c0','9a9w6ojrhx.txt','portal/20190801/e2412e0857c4e25e75de9ef15f0ecf88.txt','e0ccea9e38aafd2536abe7b60d0bd834','532bed21a8cb97d32b62c657508822234536a476','txt','');
DROP TABLE IF EXISTS `cmf_auth_access`;
CREATE TABLE `cmf_auth_access` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类,请加应用前缀,如admin_',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限授权表';
DROP TABLE IF EXISTS `cmf_auth_rule`;
CREATE TABLE `cmf_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `app` varchar(40) NOT NULL DEFAULT '' COMMENT '规则所属app',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(100) NOT NULL DEFAULT '' COMMENT '额外url参数',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则描述',
  `condition` varchar(200) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `module` (`app`,`status`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4 COMMENT='权限规则表';
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('1','1','admin','admin_url','admin/Hook/index','','钩子管理','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('2','1','admin','admin_url','admin/Hook/plugins','','钩子插件管理','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('3','1','admin','admin_url','admin/Hook/pluginListOrder','','钩子插件排序','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('4','1','admin','admin_url','admin/Hook/sync','','同步钩子','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('5','1','admin','admin_url','admin/Link/index','','友情链接','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('6','1','admin','admin_url','admin/Link/add','','添加友情链接','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('7','1','admin','admin_url','admin/Link/addPost','','添加友情链接提交保存','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('8','1','admin','admin_url','admin/Link/edit','','编辑友情链接','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('9','1','admin','admin_url','admin/Link/editPost','','编辑友情链接提交保存','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('10','1','admin','admin_url','admin/Link/delete','','删除友情链接','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('11','1','admin','admin_url','admin/Link/listOrder','','友情链接排序','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('12','1','admin','admin_url','admin/Link/toggle','','友情链接显示隐藏','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('13','1','admin','admin_url','admin/Mailer/index','','邮箱配置','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('14','1','admin','admin_url','admin/Mailer/indexPost','','邮箱配置提交保存','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('15','1','admin','admin_url','admin/Mailer/template','','邮件模板','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('16','1','admin','admin_url','admin/Mailer/templatePost','','邮件模板提交','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('17','1','admin','admin_url','admin/Mailer/test','','邮件发送测试','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('18','1','admin','admin_url','admin/Menu/index','','后台菜单','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('19','1','admin','admin_url','admin/Menu/lists','','所有菜单','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('20','1','admin','admin_url','admin/Menu/add','','后台菜单添加','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('21','1','admin','admin_url','admin/Menu/addPost','','后台菜单添加提交保存','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('22','1','admin','admin_url','admin/Menu/edit','','后台菜单编辑','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('23','1','admin','admin_url','admin/Menu/editPost','','后台菜单编辑提交保存','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('24','1','admin','admin_url','admin/Menu/delete','','后台菜单删除','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('25','1','admin','admin_url','admin/Menu/listOrder','','后台菜单排序','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('26','1','admin','admin_url','admin/Menu/getActions','','导入新后台菜单','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('27','1','admin','admin_url','admin/Nav/index','','导航管理','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('28','1','admin','admin_url','admin/Nav/add','','添加导航','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('29','1','admin','admin_url','admin/Nav/addPost','','添加导航提交保存','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('30','1','admin','admin_url','admin/Nav/edit','','编辑导航','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('31','1','admin','admin_url','admin/Nav/editPost','','编辑导航提交保存','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('32','1','admin','admin_url','admin/Nav/delete','','删除导航','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('33','1','admin','admin_url','admin/NavMenu/index','','导航菜单','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('34','1','admin','admin_url','admin/NavMenu/add','','添加导航菜单','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('35','1','admin','admin_url','admin/NavMenu/addPost','','添加导航菜单提交保存','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('36','1','admin','admin_url','admin/NavMenu/edit','','编辑导航菜单','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('37','1','admin','admin_url','admin/NavMenu/editPost','','编辑导航菜单提交保存','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('38','1','admin','admin_url','admin/NavMenu/delete','','删除导航菜单','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('39','1','admin','admin_url','admin/NavMenu/listOrder','','导航菜单排序','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('40','1','admin','admin_url','admin/Plugin/default','','插件中心','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('41','1','admin','admin_url','admin/Plugin/index','','插件列表','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('42','1','admin','admin_url','admin/Plugin/toggle','','插件启用禁用','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('43','1','admin','admin_url','admin/Plugin/setting','','插件设置','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('44','1','admin','admin_url','admin/Plugin/settingPost','','插件设置提交','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('45','1','admin','admin_url','admin/Plugin/install','','插件安装','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('46','1','admin','admin_url','admin/Plugin/update','','插件更新','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('47','1','admin','admin_url','admin/Plugin/uninstall','','卸载插件','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('48','1','admin','admin_url','admin/Rbac/index','','角色管理','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('49','1','admin','admin_url','admin/Rbac/roleAdd','','添加角色','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('50','1','admin','admin_url','admin/Rbac/roleAddPost','','添加角色提交','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('51','1','admin','admin_url','admin/Rbac/roleEdit','','编辑角色','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('52','1','admin','admin_url','admin/Rbac/roleEditPost','','编辑角色提交','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('53','1','admin','admin_url','admin/Rbac/roleDelete','','删除角色','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('54','1','admin','admin_url','admin/Rbac/authorize','','设置角色权限','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('55','1','admin','admin_url','admin/Rbac/authorizePost','','角色授权提交','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('56','1','admin','admin_url','admin/RecycleBin/index','','回收站','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('57','1','admin','admin_url','admin/RecycleBin/restore','','回收站还原','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('58','1','admin','admin_url','admin/RecycleBin/delete','','回收站彻底删除','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('59','1','admin','admin_url','admin/Route/index','','URL美化','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('60','1','admin','admin_url','admin/Route/add','','添加路由规则','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('61','1','admin','admin_url','admin/Route/addPost','','添加路由规则提交','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('62','1','admin','admin_url','admin/Route/edit','','路由规则编辑','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('63','1','admin','admin_url','admin/Route/editPost','','路由规则编辑提交','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('64','1','admin','admin_url','admin/Route/delete','','路由规则删除','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('65','1','admin','admin_url','admin/Route/ban','','路由规则禁用','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('66','1','admin','admin_url','admin/Route/open','','路由规则启用','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('67','1','admin','admin_url','admin/Route/listOrder','','路由规则排序','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('68','1','admin','admin_url','admin/Route/select','','选择URL','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('69','1','admin','admin_url','admin/Setting/default','','设置','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('70','1','admin','admin_url','admin/Setting/site','','网站信息','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('71','1','admin','admin_url','admin/Setting/sitePost','','网站信息设置提交','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('72','1','admin','admin_url','admin/Setting/password','','密码修改','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('73','1','admin','admin_url','admin/Setting/passwordPost','','密码修改提交','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('74','1','admin','admin_url','admin/Setting/upload','','上传设置','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('75','1','admin','admin_url','admin/Setting/uploadPost','','上传设置提交','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('76','1','admin','admin_url','admin/Setting/clearCache','','清除缓存','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('77','1','admin','admin_url','admin/Slide/index','','幻灯片管理','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('78','1','admin','admin_url','admin/Slide/add','','添加幻灯片','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('79','1','admin','admin_url','admin/Slide/addPost','','添加幻灯片提交','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('80','1','admin','admin_url','admin/Slide/edit','','编辑幻灯片','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('81','1','admin','admin_url','admin/Slide/editPost','','编辑幻灯片提交','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('82','1','admin','admin_url','admin/Slide/delete','','删除幻灯片','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('83','1','admin','admin_url','admin/SlideItem/index','','幻灯片页面列表','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('84','1','admin','admin_url','admin/SlideItem/add','','幻灯片页面添加','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('85','1','admin','admin_url','admin/SlideItem/addPost','','幻灯片页面添加提交','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('86','1','admin','admin_url','admin/SlideItem/edit','','幻灯片页面编辑','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('87','1','admin','admin_url','admin/SlideItem/editPost','','幻灯片页面编辑提交','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('88','1','admin','admin_url','admin/SlideItem/delete','','幻灯片页面删除','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('89','1','admin','admin_url','admin/SlideItem/ban','','幻灯片页面隐藏','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('90','1','admin','admin_url','admin/SlideItem/cancelBan','','幻灯片页面显示','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('91','1','admin','admin_url','admin/SlideItem/listOrder','','幻灯片页面排序','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('92','1','admin','admin_url','admin/Storage/index','','文件存储','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('93','1','admin','admin_url','admin/Storage/settingPost','','文件存储设置提交','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('94','1','admin','admin_url','admin/Theme/index','','模板管理','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('95','1','admin','admin_url','admin/Theme/install','','安装模板','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('96','1','admin','admin_url','admin/Theme/uninstall','','卸载模板','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('97','1','admin','admin_url','admin/Theme/installTheme','','模板安装','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('98','1','admin','admin_url','admin/Theme/update','','模板更新','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('99','1','admin','admin_url','admin/Theme/active','','启用模板','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('100','1','admin','admin_url','admin/Theme/files','','模板文件列表','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('101','1','admin','admin_url','admin/Theme/fileSetting','','模板文件设置','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('102','1','admin','admin_url','admin/Theme/fileArrayData','','模板文件数组数据列表','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('103','1','admin','admin_url','admin/Theme/fileArrayDataEdit','','模板文件数组数据添加编辑','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('104','1','admin','admin_url','admin/Theme/fileArrayDataEditPost','','模板文件数组数据添加编辑提交保存','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('105','1','admin','admin_url','admin/Theme/fileArrayDataDelete','','模板文件数组数据删除','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('106','1','admin','admin_url','admin/Theme/settingPost','','模板文件编辑提交保存','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('107','1','admin','admin_url','admin/Theme/dataSource','','模板文件设置数据源','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('108','1','admin','admin_url','admin/Theme/design','','模板设计','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('109','1','admin','admin_url','admin/User/default','','管理组','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('110','1','admin','admin_url','admin/User/index','','管理员','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('111','1','admin','admin_url','admin/User/add','','管理员添加','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('112','1','admin','admin_url','admin/User/addPost','','管理员添加提交','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('113','1','admin','admin_url','admin/User/edit','','管理员编辑','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('114','1','admin','admin_url','admin/User/editPost','','管理员编辑提交','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('115','1','admin','admin_url','admin/User/userInfo','','个人信息','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('116','1','admin','admin_url','admin/User/userInfoPost','','管理员个人信息修改提交','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('117','1','admin','admin_url','admin/User/delete','','管理员删除','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('118','1','admin','admin_url','admin/User/ban','','停用管理员','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('119','1','admin','admin_url','admin/User/cancelBan','','启用管理员','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('120','1','user','admin_url','user/AdminAsset/index','','资源管理','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('121','1','user','admin_url','user/AdminAsset/delete','','删除文件','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('122','1','user','admin_url','user/AdminIndex/default','','会员管理','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('123','1','user','admin_url','user/AdminIndex/default1','','用户组','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('124','1','user','admin_url','user/AdminIndex/index','','本站用户','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('125','1','user','admin_url','user/AdminIndex/ban','','本站用户拉黑','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('126','1','user','admin_url','user/AdminIndex/cancelBan','','本站用户启用','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('127','1','user','admin_url','user/AdminOauth/index','','第三方用户','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('128','1','user','admin_url','user/AdminOauth/delete','','删除第三方用户绑定','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('129','1','user','admin_url','user/AdminUserAction/index','','用户操作管理','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('130','1','user','admin_url','user/AdminUserAction/edit','','编辑用户操作','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('131','1','user','admin_url','user/AdminUserAction/editPost','','编辑用户操作提交','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('132','1','user','admin_url','user/AdminUserAction/sync','','同步用户操作','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('162','1','portal','admin_url','portal/AdminArticle/index','','文章管理','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('163','1','portal','admin_url','portal/AdminArticle/add','','添加文章','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('164','1','portal','admin_url','portal/AdminArticle/addPost','','添加文章提交','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('165','1','portal','admin_url','portal/AdminArticle/edit','','编辑文章','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('166','1','portal','admin_url','portal/AdminArticle/editPost','','编辑文章提交','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('167','1','portal','admin_url','portal/AdminArticle/delete','','文章删除','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('168','1','portal','admin_url','portal/AdminArticle/publish','','文章发布','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('169','1','portal','admin_url','portal/AdminArticle/top','','文章置顶','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('170','1','portal','admin_url','portal/AdminArticle/recommend','','文章推荐','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('171','1','portal','admin_url','portal/AdminArticle/listOrder','','文章排序','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('172','1','portal','admin_url','portal/AdminCategory/index','','栏目管理','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('173','1','portal','admin_url','portal/AdminCategory/add','','添加文章分类','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('174','1','portal','admin_url','portal/AdminCategory/addPost','','添加文章分类提交','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('175','1','portal','admin_url','portal/AdminCategory/edit','','编辑文章分类','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('176','1','portal','admin_url','portal/AdminCategory/editPost','','编辑文章分类提交','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('177','1','portal','admin_url','portal/AdminCategory/select','','文章分类选择对话框','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('178','1','portal','admin_url','portal/AdminCategory/listOrder','','文章分类排序','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('179','1','portal','admin_url','portal/AdminCategory/toggle','','文章分类显示隐藏','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('180','1','portal','admin_url','portal/AdminCategory/delete','','删除文章分类','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('181','1','portal','admin_url','portal/AdminIndex/default','','内容管理','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('182','1','portal','admin_url','portal/AdminPage/index','','页面管理','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('183','1','portal','admin_url','portal/AdminPage/add','','添加页面','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('184','1','portal','admin_url','portal/AdminPage/addPost','','添加页面提交','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('185','1','portal','admin_url','portal/AdminPage/edit','','编辑页面','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('186','1','portal','admin_url','portal/AdminPage/editPost','','编辑页面提交','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('187','1','portal','admin_url','portal/AdminPage/delete','','删除页面','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('188','1','portal','admin_url','portal/AdminTag/index','','文章标签','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('189','1','portal','admin_url','portal/AdminTag/add','','添加文章标签','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('190','1','portal','admin_url','portal/AdminTag/addPost','','添加文章标签提交','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('191','1','portal','admin_url','portal/AdminTag/upStatus','','更新标签状态','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('192','1','portal','admin_url','portal/AdminTag/delete','','删除文章标签','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('193','1','client','admin_url','client/ClientUser/defult','','用户管理','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('194','1','Inquiry','admin_url','Inquiry/Inquiry/defult','','询盘管理','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('195','1','inquiry','admin_url','inquiry/Inquiry/inquirylist','','询盘列表','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('196','1','inquiry','admin_url','inquiry/InquiryList/defult','','询盘管理','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('197','1','inquiry','admin_url','inquiry/InquiryList/lists','','询盘列表','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('198','1','virtud','admin_url','virtud/DataBackup/lists','','数据备份管理','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('199','1','keyworder','admin_url','keyworder/KeyWorder/index','','SEO内链','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('200','1','advertisement','admin_url','advertisement/Advertisement/index','defult','广告模块','');
insert into `cmf_auth_rule`(`id`,`status`,`app`,`type`,`name`,`param`,`title`,`condition`) values('201','1','modular','admin_url','modular/Modular/index','','内容模型管理','');
DROP TABLE IF EXISTS `cmf_client`;
CREATE TABLE `cmf_client` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '用户',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `recently_log` varchar(255) DEFAULT NULL COMMENT '最近登录',
  `register_time` datetime DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='客户';
DROP TABLE IF EXISTS `cmf_comment`;
CREATE TABLE `cmf_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `like_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `dislike_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '不喜欢数',
  `floor` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '楼层数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:已审核,0:未审核',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '评论内容所在表，不带表前缀',
  `full_name` varchar(50) NOT NULL DEFAULT '' COMMENT '评论者昵称',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '评论者邮箱',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  `url` text COMMENT '原文地址',
  `content` text CHARACTER SET utf8mb4 COMMENT '评论内容',
  `more` text CHARACTER SET utf8mb4 COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `table_id_status` (`table_name`,`object_id`,`status`),
  KEY `object_id` (`object_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';
DROP TABLE IF EXISTS `cmf_createrecords`;
CREATE TABLE `cmf_createrecords` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` varchar(255) DEFAULT NULL,
  `surface` varchar(255) DEFAULT NULL,
  `addtemplates` text COMMENT '添加模板',
  `edittemplates` text COMMENT '编辑模板',
  `vdefault` varchar(255) DEFAULT NULL COMMENT '放下拉框，多选，单选内容',
  `formtips` varchar(255) DEFAULT NULL COMMENT '表单提示文字',
  `changeform` varchar(255) DEFAULT NULL COMMENT '字段长度',
  `formtype` varchar(255) DEFAULT NULL COMMENT '表单类型',
  `ziduan` varchar(255) DEFAULT NULL COMMENT '字段',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='创建记录表';
insert into `cmf_createrecords`(`Id`,`category_id`,`surface`,`addtemplates`,`edittemplates`,`vdefault`,`formtips`,`changeform`,`formtype`,`ziduan`) values('1','5','cmf_dianzi','','','','','','','');
insert into `cmf_createrecords`(`Id`,`category_id`,`surface`,`addtemplates`,`edittemplates`,`vdefault`,`formtips`,`changeform`,`formtype`,`ziduan`) values('2','5','cmf_dianzi','
                            <tr style=\"display: none\">
                            <th>隐藏</th>
                            <td>
                            <input class=\"form-control\" type=\"text\" name=\"posts[biao]\"
                            value=\"cmf_dianzi\" placeholder=\"请输入不作为标题\"/>
                            </td>
                            </tr>
                            <tr>
                            <th>
                            <b>风格</b>
                            </th>
                            <td>
                            <select name=\"posts[style]\" class=\"add_select\" style=\"min-width: 300px;height:30px;border-radius: 5px;padding-left: 10px\">
                            <option  value=\"家装\">家装</option><option  value=\"简约\">简约</option><option  value=\"欧美\">欧美</option><option  value=\"美式\">美式</option><option  value=\"奢华\">奢华</option><option  value=\"洋房\">洋房</option> 
                            </select>
                            </td>
                            </tr>','
                            <tr>
                            <th>
                            <b>风格</b>
                            </th>
                            <td>
                            <select  name=\"posts[style]\" class=\"add_select\" style=\"min-width: 300px;height:30px;border-radius: 5px;padding-left: 10px\">              
                            <option value=\"家装\">家装</option><option value=\"简约\">简约</option><option value=\"欧美\">欧美</option><option value=\"美式\">美式</option><option value=\"奢华\">奢华</option><option value=\"洋房\">洋房</option>           
                            </select>
                            </td>
                            </tr>','家装,简约,欧美,美式,奢华,洋房','风格','255','select','style');
DROP TABLE IF EXISTS `cmf_dianzi`;
CREATE TABLE `cmf_dianzi` (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `biao` varchar(255) DEFAULT NULL,
  `category_id` varchar(255) NOT NULL,
  `style` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
insert into `cmf_dianzi`(`model_id`,`post_id`,`biao`,`category_id`,`style`) values('1','0','','5','');
DROP TABLE IF EXISTS `cmf_filename`;
CREATE TABLE `cmf_filename` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL COMMENT '文件名',
  `creationtime` varchar(255) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='数据库文件名';
insert into `cmf_filename`(`Id`,`filename`,`creationtime`) values('1','zhihuocms20190812092110.sql','1565572870');
DROP TABLE IF EXISTS `cmf_goods_category`;
CREATE TABLE `cmf_goods_category` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `goods_id` int(11) DEFAULT NULL COMMENT '上级id',
  `goods_image` varchar(255) DEFAULT NULL COMMENT '商品图片',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='产品分类';
DROP TABLE IF EXISTS `cmf_hook`;
CREATE TABLE `cmf_hook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '钩子类型(1:系统钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)',
  `once` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否只允许一个插件运行(0:多个;1:一个)',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子',
  `app` varchar(15) NOT NULL DEFAULT '' COMMENT '应用名(只有应用钩子才用)',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子表';
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('2','1','0','应用开始','app_begin','cmf','应用开始');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('3','1','0','模块初始化','module_init','cmf','模块初始化');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('4','1','0','控制器开始','action_begin','cmf','控制器开始');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('5','1','0','视图输出过滤','view_filter','cmf','视图输出过滤');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('6','1','0','应用结束','app_end','cmf','应用结束');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('7','1','0','日志write方法','log_write','cmf','日志write方法');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('8','1','0','输出结束','response_end','cmf','输出结束');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('9','1','0','后台控制器初始化','admin_init','cmf','后台控制器初始化');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('10','1','0','前台控制器初始化','home_init','cmf','前台控制器初始化');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('11','1','1','发送手机验证码','send_mobile_verification_code','cmf','发送手机验证码');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('12','3','0','模板 body标签开始','body_start','','模板 body标签开始');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('13','3','0','模板 head标签结束前','before_head_end','','模板 head标签结束前');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('14','3','0','模板底部开始','footer_start','','模板底部开始');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('15','3','0','模板底部开始之前','before_footer','','模板底部开始之前');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('16','3','0','模板底部结束之前','before_footer_end','','模板底部结束之前');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('17','3','0','模板 body 标签结束之前','before_body_end','','模板 body 标签结束之前');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('18','3','0','模板左边栏开始','left_sidebar_start','','模板左边栏开始');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('19','3','0','模板左边栏结束之前','before_left_sidebar_end','','模板左边栏结束之前');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('20','3','0','模板右边栏开始','right_sidebar_start','','模板右边栏开始');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('21','3','0','模板右边栏结束之前','before_right_sidebar_end','','模板右边栏结束之前');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('22','3','1','评论区','comment','','评论区');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('23','3','1','留言区','guestbook','','留言区');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('24','2','0','后台首页仪表盘','admin_dashboard','admin','后台首页仪表盘');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('25','4','0','后台模板 head标签结束前','admin_before_head_end','','后台模板 head标签结束前');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('26','4','0','后台模板 body 标签结束之前','admin_before_body_end','','后台模板 body 标签结束之前');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('27','2','0','后台登录页面','admin_login','admin','后台登录页面');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('28','1','1','前台模板切换','switch_theme','cmf','前台模板切换');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('29','3','0','主要内容之后','after_content','','主要内容之后');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('32','2','1','获取上传界面','fetch_upload_view','user','获取上传界面');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('33','3','0','主要内容之前','before_content','cmf','主要内容之前');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('34','1','0','日志写入完成','log_write_done','cmf','日志写入完成');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('35','1','1','后台模板切换','switch_admin_theme','cmf','后台模板切换');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('36','1','1','验证码图片','captcha_image','cmf','验证码图片');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('37','2','1','后台模板设计界面','admin_theme_design_view','admin','后台模板设计界面');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('38','2','1','后台设置网站信息界面','admin_setting_site_view','admin','后台设置网站信息界面');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('39','2','1','后台清除缓存界面','admin_setting_clear_cache_view','admin','后台清除缓存界面');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('40','2','1','后台导航管理界面','admin_nav_index_view','admin','后台导航管理界面');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('41','2','1','后台友情链接管理界面','admin_link_index_view','admin','后台友情链接管理界面');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('42','2','1','后台幻灯片管理界面','admin_slide_index_view','admin','后台幻灯片管理界面');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('43','2','1','后台管理员列表界面','admin_user_index_view','admin','后台管理员列表界面');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('44','2','1','后台角色管理界面','admin_rbac_index_view','admin','后台角色管理界面');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('49','2','1','用户管理本站用户列表界面','user_admin_index_view','user','用户管理本站用户列表界面');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('50','2','1','资源管理列表界面','user_admin_asset_index_view','user','资源管理列表界面');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('51','2','1','用户管理第三方用户列表界面','user_admin_oauth_index_view','user','用户管理第三方用户列表界面');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('52','2','1','后台首页界面','admin_index_index_view','admin','后台首页界面');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('53','2','1','后台回收站界面','admin_recycle_bin_index_view','admin','后台回收站界面');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('54','2','1','后台菜单管理界面','admin_menu_index_view','admin','后台菜单管理界面');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('55','2','1','后台自定义登录是否开启钩子','admin_custom_login_open','admin','后台自定义登录是否开启钩子');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('64','2','1','后台幻灯片页面列表界面','admin_slide_item_index_view','admin','后台幻灯片页面列表界面');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('65','2','1','后台幻灯片页面添加界面','admin_slide_item_add_view','admin','后台幻灯片页面添加界面');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('66','2','1','后台幻灯片页面编辑界面','admin_slide_item_edit_view','admin','后台幻灯片页面编辑界面');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('67','2','1','后台管理员添加界面','admin_user_add_view','admin','后台管理员添加界面');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('68','2','1','后台管理员编辑界面','admin_user_edit_view','admin','后台管理员编辑界面');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('69','2','1','后台角色添加界面','admin_rbac_role_add_view','admin','后台角色添加界面');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('70','2','1','后台角色编辑界面','admin_rbac_role_edit_view','admin','后台角色编辑界面');
insert into `cmf_hook`(`id`,`type`,`once`,`name`,`hook`,`app`,`description`) values('71','2','1','后台角色授权界面','admin_rbac_authorize_view','admin','后台角色授权界面');
DROP TABLE IF EXISTS `cmf_hook_plugin`;
CREATE TABLE `cmf_hook_plugin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名',
  `plugin` varchar(50) NOT NULL DEFAULT '' COMMENT '插件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子插件表';
DROP TABLE IF EXISTS `cmf_inquiry`;
CREATE TABLE `cmf_inquiry` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `inquiry_name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `inquiry_email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `inquiry_mobile` varchar(50) DEFAULT NULL COMMENT '手机号',
  `inquiry_address` varchar(100) DEFAULT NULL COMMENT '地址',
  `inquiry_time` varchar(200) DEFAULT NULL COMMENT '询盘时间',
  `inquiry_websys` varchar(255) DEFAULT NULL COMMENT '来源网页信息',
  `inquiry_xiangmu` varchar(255) DEFAULT NULL COMMENT '服务项目',
  `inquiry_qq` varchar(13) DEFAULT NULL COMMENT 'QQ号',
  `inquiry_weixin` varchar(100) DEFAULT NULL COMMENT '微信号',
  `inquiry_money` decimal(10,2) DEFAULT NULL COMMENT '预算金额',
  `inquiry_cilentip` varchar(255) DEFAULT NULL COMMENT '客户网站信息',
  `inquiry_demad` varchar(255) DEFAULT NULL COMMENT '需求说明',
  `inquiry_ip` varchar(50) DEFAULT NULL COMMENT '客户ip',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='询盘';
DROP TABLE IF EXISTS `cmf_keyword`;
CREATE TABLE `cmf_keyword` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `keyworder` varchar(255) DEFAULT NULL COMMENT '关键词',
  `url` varchar(255) DEFAULT NULL COMMENT '链接',
  `frequency` varchar(255) DEFAULT NULL COMMENT '频率',
  `weight` varchar(255) DEFAULT NULL COMMENT '权重',
  `creation_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='文章关键词维护';
DROP TABLE IF EXISTS `cmf_link`;
CREATE TABLE `cmf_link` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:不显示',
  `rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接地址',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '友情链接名称',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '友情链接图标',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `rel` varchar(50) NOT NULL DEFAULT '' COMMENT '链接与网站的关系',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='友情链接表';
DROP TABLE IF EXISTS `cmf_nav`;
CREATE TABLE `cmf_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_main` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否为主导航;1:是;0:不是',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '导航位置名称',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='前台导航位置表';
DROP TABLE IF EXISTS `cmf_nav_menu`;
CREATE TABLE `cmf_nav_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nav_id` int(11) NOT NULL COMMENT '导航 id',
  `parent_id` int(11) NOT NULL COMMENT '父 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '打开方式',
  `href` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '图标',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='前台导航菜单表';
DROP TABLE IF EXISTS `cmf_option`;
CREATE TABLE `cmf_option` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `autoload` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否自动加载;1:自动加载;0:不自动加载',
  `option_name` varchar(64) NOT NULL DEFAULT '' COMMENT '配置名',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='全站配置表';
insert into `cmf_option`(`id`,`autoload`,`option_name`,`option_value`) values('1','1','site_info','{\"site_name\":\" \",\"site_seo_title\":\"\",\"site_seo_keywords\":\"\",\"site_seo_description\":\"\",\"site_icp\":\"\",\"site_gwa\":\"\",\"site_admin_email\":\"\",\"site_analytics\":\"\"}');
insert into `cmf_option`(`id`,`autoload`,`option_name`,`option_value`) values('2','1','cmf_settings','{\"open_registration\":\"0\",\"banned_usernames\":\"\"}');
insert into `cmf_option`(`id`,`autoload`,`option_name`,`option_value`) values('3','1','cdn_settings','{\"cdn_static_root\":\"\"}');
insert into `cmf_option`(`id`,`autoload`,`option_name`,`option_value`) values('4','1','admin_settings','{\"admin_password\":\"\",\"admin_theme\":\"admin_simpleboot3\",\"admin_style\":\"simpleadmin\"}');
insert into `cmf_option`(`id`,`autoload`,`option_name`,`option_value`) values('5','1','smtp_setting','{\"from_name\":\"2278259541@qq.com\",\"from\":\"2278259541@qq.com\",\"host\":\"smtp.qq.com\",\"smtp_secure\":\"tls\",\"port\":\"25\",\"username\":\"2278259541@qq.com\",\"password\":\"gndvkclcvjrgebcc\"}');
insert into `cmf_option`(`id`,`autoload`,`option_name`,`option_value`) values('6','1','admin_dashboard_widgets','[{\"name\":\"CmfHub\",\"is_system\":1},{\"name\":\"CmfDocuments\",\"is_system\":1},{\"name\":\"Contributors\",\"is_system\":1},{\"name\":\"MainContributors\",\"is_system\":1},{\"name\":\"Custom1\",\"is_system\":1},{\"name\":\"Custom2\",\"is_system\":1},{\"name\":\"Custom3\",\"is_system\":1},{\"name\":\"Custom4\",\"is_system\":1},{\"name\":\"Custom5\",\"is_system\":1}]');
DROP TABLE IF EXISTS `cmf_pc`;
CREATE TABLE `cmf_pc` (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `biao` varchar(255) DEFAULT NULL,
  `category_id` varchar(255) NOT NULL,
  PRIMARY KEY (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
insert into `cmf_pc`(`model_id`,`post_id`,`biao`,`category_id`) values('1','0','','2');
DROP TABLE IF EXISTS `cmf_plugin`;
CREATE TABLE `cmf_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '插件类型;1:网站;8:微信',
  `has_admin` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台管理,0:没有;1:有',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:开启;0:禁用',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '插件标识名,英文字母(惟一)',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件名称',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `hooks` varchar(255) NOT NULL DEFAULT '' COMMENT '实现的钩子;以“,”分隔',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '插件版本号',
  `description` varchar(255) NOT NULL COMMENT '插件描述',
  `config` text COMMENT '插件配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='插件表';
insert into `cmf_plugin`(`id`,`type`,`has_admin`,`status`,`create_time`,`name`,`title`,`demo_url`,`hooks`,`author`,`author_url`,`version`,`description`,`config`) values('1','1','0','1','0','MPcTheme','M/PC模板自动跳转','','','@夏','','1.0','M/PC模板自动跳转','{\"wapthems\":\"mzhvi\"}');
DROP TABLE IF EXISTS `cmf_portal_category`;
CREATE TABLE `cmf_portal_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类父id',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类文章数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '分类描述',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '分类层级关系路径',
  `seo_title` varchar(100) NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '',
  `seo_description` varchar(255) NOT NULL DEFAULT '',
  `list_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类列表模板',
  `one_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类文章页模板',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 文章分类表';
insert into `cmf_portal_category`(`id`,`parent_id`,`post_count`,`status`,`delete_time`,`list_order`,`name`,`description`,`path`,`seo_title`,`seo_keywords`,`seo_description`,`list_tpl`,`one_tpl`,`more`) values('1','0','0','1','0','10000','微信小程序','weixinxiaochengxu','0-1','','','','list','article','{\"thumbnail\":\"portal\\/20190604\\/6469474eb9e959c81a74f6adb797ddbc.jpg\"}');
insert into `cmf_portal_category`(`id`,`parent_id`,`post_count`,`status`,`delete_time`,`list_order`,`name`,`description`,`path`,`seo_title`,`seo_keywords`,`seo_description`,`list_tpl`,`one_tpl`,`more`) values('2','0','0','1','0','10000','PC','PC','0-2','666','666','7777','list','article','{\"thumbnail\":\"portal\\/20190604\\/f304646466121fd35a6745e40c5aa08c.jpg\"}');
insert into `cmf_portal_category`(`id`,`parent_id`,`post_count`,`status`,`delete_time`,`list_order`,`name`,`description`,`path`,`seo_title`,`seo_keywords`,`seo_description`,`list_tpl`,`one_tpl`,`more`) values('3','0','0','1','0','10000','移动管理','yidong','0-3','','','','list','article','{\"thumbnail\":\"portal\\/20190604\\/19486e0b8ea0664ed8c24359711eda62.jpg\"}');
insert into `cmf_portal_category`(`id`,`parent_id`,`post_count`,`status`,`delete_time`,`list_order`,`name`,`description`,`path`,`seo_title`,`seo_keywords`,`seo_description`,`list_tpl`,`one_tpl`,`more`) values('4','0','0','1','0','10000','百度','baidu','0-4','','','','list','article','{\"thumbnail\":\"portal\\/20190604\\/4c4358f4c7ff7945d8fcaa7a29055b8e.png\"}');
insert into `cmf_portal_category`(`id`,`parent_id`,`post_count`,`status`,`delete_time`,`list_order`,`name`,`description`,`path`,`seo_title`,`seo_keywords`,`seo_description`,`list_tpl`,`one_tpl`,`more`) values('5','2','0','1','0','10000','电子商品','','0-2-5','','','','list','article','{\"thumbnail\":\"\"}');
DROP TABLE IF EXISTS `cmf_portal_category_post`;
CREATE TABLE `cmf_portal_category_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `category_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `term_taxonomy_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 分类文章对应表';
DROP TABLE IF EXISTS `cmf_portal_post`;
CREATE TABLE `cmf_portal_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `post_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型,1:文章;2:页面',
  `post_format` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '内容格式;1:html;2:md',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发表者用户id',
  `post_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:已发布;0:未发布;',
  `comment_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论状态;1:允许;0:不允许',
  `is_top` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶;1:置顶;0:不置顶',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_hits` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '查看数',
  `post_favorites` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  `post_like` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comment_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `published_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `post_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'post标题',
  `post_keywords` varchar(150) NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `post_excerpt` varchar(500) NOT NULL DEFAULT '' COMMENT 'post摘要',
  `post_source` varchar(150) NOT NULL DEFAULT '' COMMENT '转载文章的来源',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `post_content` text COMMENT '文章内容',
  `post_content_filtered` text COMMENT '处理过的文章内容',
  `more` text COMMENT '扩展属性,如缩略图;格式为json',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '不是title',
  `summary` varchar(255) NOT NULL DEFAULT '' COMMENT '不是摘要',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '不是关键词',
  `bannes` varchar(255) DEFAULT NULL COMMENT 'banner图',
  `homethumb` varchar(255) DEFAULT NULL COMMENT '首页缩略图',
  `sortid` varchar(255) DEFAULT NULL COMMENT '排序',
  `asdf` varchar(123) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL COMMENT '1文章存在2删除',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`create_time`,`id`),
  KEY `parent_id` (`parent_id`),
  KEY `user_id` (`user_id`),
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='portal应用 文章表';
DROP TABLE IF EXISTS `cmf_portal_tag`;
CREATE TABLE `cmf_portal_tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签文章数',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 文章标签表';
DROP TABLE IF EXISTS `cmf_portal_tag_post`;
CREATE TABLE `cmf_portal_tag_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签 id',
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 标签文章对应表';
DROP TABLE IF EXISTS `cmf_recycle_bin`;
CREATE TABLE `cmf_recycle_bin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT '0' COMMENT '删除内容 id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(60) DEFAULT '' COMMENT '删除内容所在表名',
  `name` varchar(255) DEFAULT '' COMMENT '删除内容名称',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT=' 回收站';
DROP TABLE IF EXISTS `cmf_role`;
CREATE TABLE `cmf_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父角色ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';
insert into `cmf_role`(`id`,`parent_id`,`status`,`create_time`,`update_time`,`list_order`,`name`,`remark`) values('1','0','1','1329633709','1329633709','0','超级管理员','拥有网站最高管理员权限！');
insert into `cmf_role`(`id`,`parent_id`,`status`,`create_time`,`update_time`,`list_order`,`name`,`remark`) values('2','0','1','1329633709','1329633709','0','普通管理员','权限由最高管理员分配！');
DROP TABLE IF EXISTS `cmf_role_user`;
CREATE TABLE `cmf_role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';
insert into `cmf_role_user`(`id`,`role_id`,`user_id`) values('2','2','2');
DROP TABLE IF EXISTS `cmf_route`;
CREATE TABLE `cmf_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态;1:启用,0:不启用',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'URL规则类型;1:用户自定义;2:别名添加',
  `full_url` varchar(255) NOT NULL DEFAULT '' COMMENT '完整url',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '实际显示的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='url路由表';
insert into `cmf_route`(`id`,`list_order`,`status`,`type`,`full_url`,`url`) values('1','5000','1','2','portal/List/index?id=5','dianzia');
insert into `cmf_route`(`id`,`list_order`,`status`,`type`,`full_url`,`url`) values('2','4999','1','2','portal/Article/index?cid=5','dianzia/:id');
insert into `cmf_route`(`id`,`list_order`,`status`,`type`,`full_url`,`url`) values('3','5000','1','2','portal/List/index?id=6','dianzi');
insert into `cmf_route`(`id`,`list_order`,`status`,`type`,`full_url`,`url`) values('4','4999','1','2','portal/Article/index?cid=6','dianzi/:id');
insert into `cmf_route`(`id`,`list_order`,`status`,`type`,`full_url`,`url`) values('5','5000','1','2','portal/List/index?id=7','shop');
insert into `cmf_route`(`id`,`list_order`,`status`,`type`,`full_url`,`url`) values('6','4999','1','2','portal/Article/index?cid=7','shop/:id');
insert into `cmf_route`(`id`,`list_order`,`status`,`type`,`full_url`,`url`) values('7','5000','1','2','portal/List/index?id=8','dianzi');
insert into `cmf_route`(`id`,`list_order`,`status`,`type`,`full_url`,`url`) values('8','4999','1','2','portal/Article/index?cid=8','dianzi/:id');
DROP TABLE IF EXISTS `cmf_slide`;
CREATE TABLE `cmf_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示,0不显示',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片分类',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '分类备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='幻灯片表';
DROP TABLE IF EXISTS `cmf_slide_item`;
CREATE TABLE `cmf_slide_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slide_id` int(11) NOT NULL DEFAULT '0' COMMENT '幻灯片id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '幻灯片名称',
  `image` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片图片',
  `url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片链接',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `description` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '幻灯片描述',
  `content` text CHARACTER SET utf8 COMMENT '幻灯片内容',
  `more` text COMMENT '扩展信息',
  PRIMARY KEY (`id`),
  KEY `slide_id` (`slide_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='幻灯片子项表';
DROP TABLE IF EXISTS `cmf_theme`;
CREATE TABLE `cmf_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后升级时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '模板状态,1:正在使用;0:未使用',
  `is_compiled` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为已编译模板',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '主题目录名，用于主题的维一标识',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '主题名称',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '主题版本号',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `author` varchar(20) NOT NULL DEFAULT '' COMMENT '主题作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `lang` varchar(10) NOT NULL DEFAULT '' COMMENT '支持语言',
  `keywords` varchar(50) NOT NULL DEFAULT '' COMMENT '主题关键字',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '主题描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
insert into `cmf_theme`(`id`,`create_time`,`update_time`,`status`,`is_compiled`,`theme`,`name`,`version`,`demo_url`,`thumbnail`,`author`,`author_url`,`lang`,`keywords`,`description`) values('1','0','0','0','0','default','default','1.0.0','http://demo.thinkcmf.com','','ThinkCMF','http://www.thinkcmf.com','zh-cn','ThinkCMF默认模板','ThinkCMF默认模板');
insert into `cmf_theme`(`id`,`create_time`,`update_time`,`status`,`is_compiled`,`theme`,`name`,`version`,`demo_url`,`thumbnail`,`author`,`author_url`,`lang`,`keywords`,`description`) values('2','0','0','0','0','simpleboot3','simpleboot3','1.0.2','http://demo.thinkcmf.com','','ThinkCMF','http://www.thinkcmf.com','zh-cn','ThinkCMF模板','ThinkCMF默认模板');
DROP TABLE IF EXISTS `cmf_theme_file`;
CREATE TABLE `cmf_theme_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_public` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否公共的模板文件',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '模板名称',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '模板文件名',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作',
  `file` varchar(50) NOT NULL DEFAULT '' COMMENT '模板文件，相对于模板根目录，如Portal/index.html',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '模板文件描述',
  `more` text COMMENT '模板更多配置,用户自己后台设置的',
  `config_more` text COMMENT '模板更多配置,来源模板的配置文件',
  `draft_more` text COMMENT '模板更多配置,用户临时保存的配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
insert into `cmf_theme_file`(`id`,`is_public`,`list_order`,`theme`,`name`,`action`,`file`,`description`,`more`,`config_more`,`draft_more`) values('1','0','10','simpleboot3','文章页','portal/Article/index','portal/article','文章页模板文件','{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}','{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}','');
insert into `cmf_theme_file`(`id`,`is_public`,`list_order`,`theme`,`name`,`action`,`file`,`description`,`more`,`config_more`,`draft_more`) values('2','0','10','simpleboot3','联系我们页','portal/Page/index','portal/contact','联系我们页模板文件','{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}','{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}','');
insert into `cmf_theme_file`(`id`,`is_public`,`list_order`,`theme`,`name`,`action`,`file`,`description`,`more`,`config_more`,`draft_more`) values('3','0','5','simpleboot3','首页','portal/Index/index','portal/index','首页模板文件','{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"2\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/Category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}','{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"2\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/Category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}','');
insert into `cmf_theme_file`(`id`,`is_public`,`list_order`,`theme`,`name`,`action`,`file`,`description`,`more`,`config_more`,`draft_more`) values('4','0','10','simpleboot3','文章列表页','portal/List/index','portal/list','文章列表模板文件','{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}','{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}','');
insert into `cmf_theme_file`(`id`,`is_public`,`list_order`,`theme`,`name`,`action`,`file`,`description`,`more`,`config_more`,`draft_more`) values('5','0','10','simpleboot3','单页面','portal/Page/index','portal/page','单页面模板文件','{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}','{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}','');
insert into `cmf_theme_file`(`id`,`is_public`,`list_order`,`theme`,`name`,`action`,`file`,`description`,`more`,`config_more`,`draft_more`) values('6','0','10','simpleboot3','搜索页面','portal/search/index','portal/search','搜索模板文件','{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}','{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}','');
insert into `cmf_theme_file`(`id`,`is_public`,`list_order`,`theme`,`name`,`action`,`file`,`description`,`more`,`config_more`,`draft_more`) values('7','1','0','simpleboot3','模板全局配置','public/Config','public/config','模板全局配置文件','{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}','{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}','');
insert into `cmf_theme_file`(`id`,`is_public`,`list_order`,`theme`,`name`,`action`,`file`,`description`,`more`,`config_more`,`draft_more`) values('8','1','1','simpleboot3','导航条','public/Nav','public/nav','导航条模板文件','{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"ThinkCMF\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}','{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"ThinkCMF\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}','');
DROP TABLE IF EXISTS `cmf_third_party_user`;
CREATE TABLE `cmf_third_party_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '本站用户id',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'access_token过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `login_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:正常;0:禁用',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `third_party` varchar(20) NOT NULL DEFAULT '' COMMENT '第三方惟一码',
  `app_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方应用 id',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `access_token` varchar(512) NOT NULL DEFAULT '' COMMENT '第三方授权码',
  `openid` varchar(40) NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `union_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方用户多个产品中的惟一 id,(如:微信平台)',
  `more` text COMMENT '扩展信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='第三方用户表';
DROP TABLE IF EXISTS `cmf_user`;
CREATE TABLE `cmf_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户类型;1:admin;2:会员',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `coin` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '金币',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网址',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT '个性签名',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '中国手机不带国家代码，国际手机号格式为：国家代码-手机号',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `user_login` (`user_login`),
  KEY `user_nickname` (`user_nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';
insert into `cmf_user`(`id`,`user_type`,`sex`,`birthday`,`last_login_time`,`score`,`coin`,`balance`,`create_time`,`user_status`,`user_login`,`user_pass`,`user_nickname`,`user_email`,`user_url`,`avatar`,`signature`,`last_login_ip`,`user_activation_key`,`mobile`,`more`) values('1','1','0','0','1567045275','4','4','0.00','1558344687','1','admin','###7c5bfcaddb516fbdba422b7d09f42595','admin','admin@qq.com','','','','127.0.0.1','','','');
insert into `cmf_user`(`id`,`user_type`,`sex`,`birthday`,`last_login_time`,`score`,`coin`,`balance`,`create_time`,`user_status`,`user_login`,`user_pass`,`user_nickname`,`user_email`,`user_url`,`avatar`,`signature`,`last_login_ip`,`user_activation_key`,`mobile`,`more`) values('2','1','0','0','1558591526','0','0','0.00','0','1','ceshi','###6114e6d1851a55f617a61095270e3656','','22@qq.com','','','','127.0.0.1','','','');
DROP TABLE IF EXISTS `cmf_user_action`;
CREATE TABLE `cmf_user_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  `reward_number` int(11) NOT NULL DEFAULT '0' COMMENT '奖励次数',
  `cycle_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '周期类型;0:不限;1:按天;2:按小时;3:永久',
  `cycle_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '周期时间值',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `app` varchar(50) NOT NULL DEFAULT '' COMMENT '操作所在应用名或插件名等',
  `url` text COMMENT '执行操作的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户操作表';
DROP TABLE IF EXISTS `cmf_user_action_log`;
CREATE TABLE `cmf_user_action_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `last_visit_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后访问时间',
  `object` varchar(100) NOT NULL DEFAULT '' COMMENT '访问对象的id,格式:不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称;格式:应用名+控制器+操作名,也可自己定义格式只要不发生冲突且惟一;',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user_id`,`object`,`action`),
  KEY `user_object_action_ip` (`user_id`,`object`,`action`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='访问记录表';
DROP TABLE IF EXISTS `cmf_user_balance_log`;
CREATE TABLE `cmf_user_balance_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `change` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '更改余额',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '更改后余额',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户余额变更日志表';
DROP TABLE IF EXISTS `cmf_user_favorite`;
CREATE TABLE `cmf_user_favorite` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '收藏内容的标题',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，JSON格式',
  `description` text COMMENT '收藏内容的描述',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '收藏实体以前所在表,不带前缀',
  `object_id` int(10) unsigned DEFAULT '0' COMMENT '收藏内容原来的主键id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户收藏表';
DROP TABLE IF EXISTS `cmf_user_like`;
CREATE TABLE `cmf_user_like` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '内容原来的主键id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '内容以前所在表,不带前缀',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '内容的原文地址，不带域名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '内容的标题',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `description` text COMMENT '内容的描述',
  PRIMARY KEY (`id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户点赞表';
DROP TABLE IF EXISTS `cmf_user_login_attempt`;
CREATE TABLE `cmf_user_login_attempt` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login_attempts` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试次数',
  `attempt_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试登录时间',
  `locked_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '锁定时间',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户 ip',
  `account` varchar(100) NOT NULL DEFAULT '' COMMENT '用户账号,手机号,邮箱或用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户登录尝试表';
DROP TABLE IF EXISTS `cmf_user_score_log`;
CREATE TABLE `cmf_user_score_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户操作积分等奖励日志表';
DROP TABLE IF EXISTS `cmf_user_token`;
CREATE TABLE `cmf_user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='用户客户端登录 token 表';
insert into `cmf_user_token`(`id`,`user_id`,`expire_time`,`create_time`,`token`,`device_type`) values('1','1','1573897205','1558345205','ae3f9d934ddbd359a3ac05ef73b4284ce957725635d16d6af8cf76ee658dd57b','web');
insert into `cmf_user_token`(`id`,`user_id`,`expire_time`,`create_time`,`token`,`device_type`) values('2','2','1574143526','1558591526','36f3cad924e04e9282535fd079d37949477cba1ff19ae69bc0677870eb9151dc','web');
DROP TABLE IF EXISTS `cmf_verification_code`;
CREATE TABLE `cmf_verification_code` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当天已经发送成功的次数',
  `send_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后发送成功时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证码过期时间',
  `code` varchar(8) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '最后发送成功的验证码',
  `account` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '手机号或者邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='手机邮箱数字验证码表';
DROP TABLE IF EXISTS `cmf_wxuser`;
CREATE TABLE `cmf_wxuser` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) DEFAULT NULL COMMENT '微信唯一标识',
  `nickname` varchar(255) DEFAULT NULL COMMENT '姓名',
  `sex` tinyint(2) DEFAULT NULL COMMENT '0:男,1:女',
  `language` varchar(255) DEFAULT NULL COMMENT '国家编码',
  `city` varchar(255) DEFAULT NULL COMMENT '区',
  `province` varchar(255) DEFAULT NULL COMMENT '市',
  `country` varchar(255) DEFAULT NULL COMMENT '那个国家',
  `headimgurl` varchar(255) DEFAULT NULL COMMENT '头像',
  `username` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `company_name` varchar(255) DEFAULT NULL COMMENT '公司名字',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号',
  `address` varchar(255) DEFAULT NULL COMMENT '用户填写地址',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信用户';
DROP TABLE IF EXISTS `cmf_zdbs`;
CREATE TABLE `cmf_zdbs` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `portal_id` varchar(255) DEFAULT NULL COMMENT '栏目id',
  `ziduan` varchar(255) DEFAULT NULL COMMENT '字段',
  `columnname` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `yiji` varchar(255) DEFAULT NULL COMMENT '一级筛选标题',
  `erji` varchar(255) DEFAULT NULL,
  `sanji` varchar(255) DEFAULT NULL COMMENT '三级',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='后台分类显示字段';
insert into `cmf_zdbs`(`Id`,`portal_id`,`ziduan`,`columnname`,`yiji`,`erji`,`sanji`) values('2','5','asdf','阿大石街道图','','','');
