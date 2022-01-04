SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;


-- iast_webapi_buss_test.web_api_button_relations definition

CREATE TABLE `web_api_button_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL DEFAULT '0',
  `button_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- iast_webapi_buss_test.web_api_role_relation definition

CREATE TABLE `web_api_role_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `api_id` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;


-- iast_webapi_buss_test.web_api_url_relations definition

CREATE TABLE `web_api_url_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL DEFAULT '0',
  `url_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- iast_webapi_buss_test.web_button definition

CREATE TABLE `web_button` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `webroute_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;


-- iast_webapi_buss_test.web_role definition

CREATE TABLE `web_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `state` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;


-- iast_webapi_buss_test.web_role_button_relation definition

CREATE TABLE `web_role_button_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `button_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4;


-- iast_webapi_buss_test.web_role_url_relation definition

CREATE TABLE `web_role_url_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `url_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=411 DEFAULT CHARSET=utf8mb4;


-- iast_webapi_buss_test.web_role_user_relation definition

CREATE TABLE `web_role_user_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;


-- iast_webapi_buss_test.web_url_route definition

CREATE TABLE `web_url_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `component` varchar(100) NOT NULL DEFAULT '',
  `meta_keepAlive` varchar(100) NOT NULL DEFAULT '',
  `meta_disabled` varchar(100) NOT NULL DEFAULT '',
  `meta_i18n` varchar(100) NOT NULL DEFAULT '',
  `meta_isMenu` varchar(100) NOT NULL DEFAULT '',
  `parent` int(11) NOT NULL DEFAULT '0',
  `meta_name` varchar(100) NOT NULL DEFAULT '',
  `redirect` varchar(100) NOT NULL DEFAULT '',
  `name_i18n_zh` varchar(100) NOT NULL DEFAULT '',
  `name_i18n_en` varchar(100) NOT NULL DEFAULT '',
  `name_i18n` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;

-- iast_webapi_buss_test.iast_request_chains definition

CREATE TABLE `iast_request_chains` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `source_id` int(11) DEFAULT NULL COMMENT '来源调用ID',
  `target_id` int(11) DEFAULT NULL COMMENT '目标调用ID',
  `project_id` int(11) DEFAULT NULL COMMENT '项目ID',
  `source_agent_id` int(11) DEFAULT NULL COMMENT '来源agentID',
  `target_agent_id` int(11) DEFAULT NULL COMMENT '目标agentID',
  `level_id` int(11) DEFAULT NULL COMMENT '层级ID',
  `request_hash` varchar(255) DEFAULT NULL COMMENT '请求链hash',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- iast_webapi_buss_test.webapi_api_site definition

CREATE TABLE `webapi_api_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(100) NOT NULL DEFAULT '',
  `method` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `webapi_api_site_UN` (`path`,`method`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- iast_webapi_buss_test.iast_license definition

CREATE TABLE `iast_license` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `iast_license_UN` (`key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT IGNORE INTO web_api_role_relation (id, role_id, api_id, state) VALUES(1, 6, 5, 1);
INSERT IGNORE INTO web_button (id, name, webroute_id) VALUES(1, '运行时间', 18);
INSERT IGNORE INTO web_button (id, name, webroute_id) VALUES(2, '状态管理', 19);
INSERT IGNORE INTO web_button (id, name, webroute_id) VALUES(3, '设置', 19);
INSERT IGNORE INTO web_button (id, name, webroute_id) VALUES(4, '设置阈值', 21);
INSERT IGNORE INTO web_button (id, name, webroute_id) VALUES(5, 'openapi配置', 25);
INSERT IGNORE INTO web_button (id, name, webroute_id) VALUES(6, '重置密码', 29);
INSERT IGNORE INTO webapi_api_site (id, `path`, `method`, name) VALUES(1, 'api/v1/user/password/reset', 'POST', '密码重置');
INSERT IGNORE INTO webapi_api_site (id, `path`, `method`, name) VALUES(2, 'api/v1/strategy/<int:id_>/disable', 'GET', '策略禁用');
INSERT IGNORE INTO webapi_api_site (id, `path`, `method`, name) VALUES(3, 'api/v1/strategy/<int:id_>/update', 'PUT', '策略更新');
INSERT IGNORE INTO webapi_api_site (id, `path`, `method`, name) VALUES(4, 'api/v1/profile/batch/modified', 'POST', '配置修改');
INSERT IGNORE INTO webapi_api_site (id, `path`, `method`, name) VALUES(5, 'api/v1/license/current_concurrency', 'GET', '当前并发');

INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(1, '/project', 'project', 'views/project/Index.vue', '', 'True', 'menu.projectManage', 'True', 0, '', '/project/projectManage', '项目', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(2, '/vuln', 'vuln', 'views/vuln/Index.vue', '', '', 'menu.vuln', 'True', 0, '', '/vuln/vulnList', '漏洞', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(3, '/sca', 'sca', 'views/sca/Index.vue', '', 'True', 'menu.sca', 'True', 0, '', '/sca/scaList', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(4, '/taint', 'taint', 'views/taint/Index.vue', 'True', 'True', 'menu.taintPool', 'True', 0, '', '/taint/search', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(5, '/setting', 'setting', 'views/setting/Index.vue', '', '', 'menu.setting', 'True', 0, '', '/setting/agentManage', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(6, '/department', 'department', 'views/department/Index.vue', '', '', 'menu.department', 'True', 0, '', '/department/departmentList', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(7, '/talent', 'talent', 'views/talent/Index.vue', '', '', 'menu.talent', 'True', 0, '', '/talent/talentList', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(8, '/deploy', '/deploy', 'views/deploy/Deploy.vue', '', 'True', 'deploy', '', 0, '部署IAST', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(9, 'projectManage', 'projectManage', 'views/project/ProjectManage.vue', '', 'True', 'menu.projectManage', '', 1, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(10, 'projectEdit/:pid?', 'projectEdit/:pid?', 'views/project/ProjectEdit.vue', '', 'True', 'menu.projectEdit', '', 1, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(11, 'projectDetail/:pid', 'projectDetail/:pid', 'views/project/ProjectDetail.vue', '', 'True', 'menu.projectDetail', '', 1, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(12, 'vulnList', 'vulnList', 'views/vuln/VulnList.vue', '', '', 'menu.vulnList', '', 2, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(13, 'vulnDetail/:page/:id', 'vulnDetail/:page/:id', 'views/vuln/VulnDetail.vue', '', '', 'menu.vulnDetail', '', 2, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(14, 'scaList', 'scaList', 'views/sca/ScaList.vue', '', 'True', 'menu.scaList', '', 3, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(15, 'scaDetail/:page/:id', 'scaDetail/:page/:id', 'views/sca/ScaDetail.vue', '', 'True', 'menu.scaDetail', '', 3, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(16, 'search', 'search', 'views/taint/Search.vue', 'True', 'True', 'menu.taintPool', '', 4, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(17, 'poolDetail/:id', 'poolDetail', 'views/taint/PoolDetail.vue', 'True', 'True', 'menu.poolDetail', '', 4, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(18, 'agentManage', 'agentManage', 'views/setting/AgentManage.vue', '', 'True', 'menu.agentManage', '', 5, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(19, 'strategyManage', 'strategyManage', 'views/setting/StrategyManage.vue', 'False', 'True', 'menu.strategyManage', 'False', 5, 'menu.strategyManage', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(20, 'hookRule', 'hookRule', 'views/setting/hookRule.vue', '', 'True', 'menu.hookRule', '', 5, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(21, 'sysInfo', 'sysInfo', 'views/setting/SysInfo.vue', '', '', 'menu.sysInfo', '', 5, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(22, 'changePassword', 'changePassword', 'views/setting/ChangePassword.vue', '', 'True', 'menu.changePassword', '', 5, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(23, 'changeLogo', 'changeLogo', 'views/setting/changeLogo.vue', '', 'True', 'menu.changeLogo', '', 5, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(24, 'logManage', 'logManage', 'views/setting/LogManage.vue', '', 'True', 'menu.logManage', '', 5, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(25, 'serverRegister', 'serverRegister', 'views/setting/serverRegister.vue', '', 'True', 'menu.serverRegister', '', 5, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(26, 'StatusMonitoring', 'StatusMonitoring', 'views/setting/StatusMonitoring.vue', '', 'True', 'menu.statusMonitoring', '', 5, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(27, 'departmentList', 'departmentList', 'views/department/DepartmentList.vue', '', '', 'menu.department', '', 6, 'menu.department', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(28, 'talentList', 'talentList', 'views/talent/TalentList.vue', '', '', 'menu.talent', '', 7, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(29, 'userSetting', 'userSetting', 'views/department/userSetting.vue', '', '', 'menu.userSetting', '', 6, 'menu.userSetting', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(30, 'roleSetting', 'roleSetting', 'views/department/roleSetting.vue', '', '', 'menu.roleSetting', '', 6, 'menu.roleSetting', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(33, 'license', 'license', 'views/setting/license.vue', '', '', 'menu.license', '', 5, 'menu.license', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(34, '/links', 'links', 'views/links/index.vue', '', '', 'menu.links', 'True', 0, 'menu.links', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(35, 'sensitiveManage', 'sensitiveManage', 'views/setting/sensitiveManage.vue', 'False', 'True', 'menu.sensitiveManage', 'False', 5, 'menu.sensitiveManage', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(36, 'sensitive', 'sensitive', 'views/setting/sensitive.vue', 'False', 'True', 'menu.sensitive', 'False', 5, 'menu.sensitive', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(37, 'strategy', 'strategy', 'views/setting/Strategy.vue', 'False', 'True', 'menu.strategy', 'False', 5, 'menu.strategy', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(38, 'template', 'template', 'views/setting/template.vue', 'False', 'True', 'menu.template', 'False', 5, 'menu.template', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(39, 'templateManage', 'templateManage', 'views/setting/templateManage.vue', 'False', 'True', 'menu.templateManage', 'False', 5, 'menu.templateManage', '', '', '', '');

INSERT IGNORE INTO web_role (id, name, state) VALUES(6, '超级管理员', 1);
INSERT IGNORE INTO web_role (id, name, state) VALUES(7, '普通用户', 1);
INSERT IGNORE INTO web_role_user_relation (id, role_id, user_id) VALUES(15, 6, 1);
INSERT IGNORE INTO web_role_user_relation (role_id , user_id)
SELECT 7,id FROM auth_user 
WHERE id != 1;
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(445, 6, 1);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(446, 6, 2);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(447, 6, 3);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(448, 6, 4);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(449, 6, 5);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(450, 6, 6);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(451, 6, 7);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(452, 6, 8);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(453, 6, 9);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(454, 6, 10);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(455, 6, 11);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(456, 6, 12);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(457, 6, 13);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(458, 6, 14);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(459, 6, 15);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(460, 6, 16);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(461, 6, 17);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(462, 6, 18);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(463, 6, 19);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(464, 6, 20);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(465, 6, 21);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(466, 6, 22);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(467, 6, 23);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(468, 6, 24);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(469, 6, 25);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(470, 6, 26);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(471, 6, 27);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(472, 6, 28);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(473, 6, 29);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(474, 6, 30);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(475, 6, 33);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(476, 6, 34);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(477, 6, 35);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(478, 6, 36);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(479, 6, 37);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(480, 6, 38);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(481, 6, 39);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(424, 7, 1);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(425, 7, 2);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(426, 7, 3);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(427, 7, 4);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(428, 7, 5);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(429, 7, 8);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(430, 7, 9);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(431, 7, 10);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(432, 7, 11);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(433, 7, 12);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(434, 7, 13);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(435, 7, 14);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(436, 7, 15);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(437, 7, 17);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(438, 7, 18);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(439, 7, 19);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(440, 7, 20);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(441, 7, 21);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(442, 7, 22);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(443, 7, 26);
INSERT INTO web_role_url_relation (id, role_id, url_id) VALUES(444, 7, 34);

ALTER TABLE auth_department ADD principal_id int(11) DEFAULT 1 NOT NULL COMMENT '负责人id';


SET FOREIGN_KEY_CHECKS=1;
