SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;
 
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(1, '/project', 'project', 'views/project/Index.vue', '', 'True', 'menu.projectManage', 'True', 0, '', '/project/projectManage', '项目', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(2, '/vuln', 'vuln', 'views/vuln/Index.vue', '', '', 'menu.vuln', 'True', 0, '', '/vuln/vulnList', '漏洞', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(3, '/sca', 'sca', 'views/sca/Index.vue', '', 'True', 'menu.sca', 'True', 0, '', '/sca/scaList', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(4, '/taint', 'taint', 'views/taint/Index.vue', 'True', 'True', 'menu.taintPool', 'True', 0, '', '/taint/search', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(5, '/links', 'links', 'views/links/index.vue', '', '', 'menu.links', 'True', 0, 'menu.links', '', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(6, '/setting', 'setting', 'views/setting/Index.vue', '', '', 'menu.setting', 'True', 0, '', '/setting/agentManage', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(7, '/department', 'department', 'views/department/Index.vue', '', '', 'menu.department', 'True', 0, '', '/department/departmentList', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(8, '/talent', 'talent', 'views/talent/Index.vue', '', '', 'menu.talent', 'True', 0, '', '/talent/talentList', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(9, 'projectManage', 'projectManage', 'views/project/ProjectManage.vue', '', 'True', 'menu.projectManage', '', 1, '', '', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(10, 'projectEdit/:pid?', 'projectEdit/:pid?', 'views/project/ProjectEdit.vue', '', 'True', 'menu.projectEdit', '', 1, '', '', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(11, 'projectDetail/:pid', 'projectDetail/:pid', 'views/project/ProjectDetail.vue', '', 'True', 'menu.projectDetail', '', 1, '', '', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(12, 'vulnList', 'vulnList', 'views/vuln/VulnList.vue', '', '', 'menu.vulnList', '', 2, '', '', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(13, 'vulnDetail/:page/:id', 'vulnDetail/:page/:id', 'views/vuln/VulnDetail.vue', '', '', 'menu.vulnDetail', '', 2, '', '', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(14, 'scaList', 'scaList', 'views/sca/ScaList.vue', '', 'True', 'menu.scaList', '', 3, '', '', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(15, 'scaDetail/:page/:id', 'scaDetail/:page/:id', 'views/sca/ScaDetail.vue', '', 'True', 'menu.scaDetail', '', 3, '', '', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(17, 'poolDetail/:id', 'poolDetail', 'views/taint/PoolDetail.vue', 'True', 'True', 'menu.poolDetail', '', 4, '', '', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(18, 'agentManage', 'agentManage', 'views/setting/AgentManage.vue', '', 'True', 'menu.agentManage', '', 6, '', '', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(19, 'strategyManage', 'strategyManage', 'views/setting/StrategyManage.vue', 'False', 'True', 'menu.strategyManage', 'False', 6, 'menu.strategyManage', '', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(20, 'hookRule', 'hookRule', 'views/setting/hookRule.vue', '', 'True', 'menu.hookRule', '', 6, '', '', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(21, 'sysInfo', 'sysInfo', 'views/setting/SysInfo.vue', '', '', 'menu.sysInfo', '', 6, '', '', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(22, 'changePassword', 'changePassword', 'views/setting/ChangePassword.vue', '', 'True', 'menu.changePassword', '', 6, '', '', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(23, 'changeLogo', 'changeLogo', 'views/setting/changeLogo.vue', '', 'True', 'menu.changeLogo', '', 6, '', '', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(24, 'logManage', 'logManage', 'views/setting/LogManage.vue', '', 'True', 'menu.logManage', '', 6, '', '', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(26, 'StatusMonitoring', 'StatusMonitoring', 'views/setting/StatusMonitoring.vue', '', 'True', 'menu.statusMonitoring', '', 6, '', '', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(27, 'departmentList', 'departmentList', 'views/department/DepartmentList.vue', '', '', 'menu.department', '', 7, 'menu.department', '', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(28, 'talentList', 'talentList', 'views/talent/TalentList.vue', '', '', 'menu.talent', '', 8, '', '', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(29, 'userSetting', 'userSetting', 'views/department/userSetting.vue', '', '', 'menu.userSetting', '', 7, 'menu.userSetting', '', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(30, 'roleSetting', 'roleSetting', 'views/department/roleSetting.vue', '', '', 'menu.roleSetting', '', 7, 'menu.roleSetting', '', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(33, 'license', 'license', 'views/setting/license.vue', '', '', 'menu.license', '', 6, 'menu.license', '', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(34, '/deploy', '/deploy', 'views/deploy/Deploy.vue', '', 'True', 'deploy', '', 0, '部署IAST', '', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(35, 'sensitiveManage', 'sensitiveManage', 'views/setting/sensitiveManage.vue', 'False', 'True', 'menu.sensitiveManage', 'False', 6, 'menu.sensitiveManage', '', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(36, 'sensitive', 'sensitive', 'views/setting/sensitive.vue', 'False', 'True', 'menu.sensitive', 'False', 6, 'menu.sensitive', '', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(37, 'strategy', 'strategy', 'views/setting/Strategy.vue', 'False', 'True', 'menu.strategy', 'False', 6, 'menu.strategy', '', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(38, 'template', 'template', 'views/setting/template.vue', 'False', 'True', 'menu.template', 'False', 6, 'menu.template', '', '', '', '');
INSERT IGNORE INTO  web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(39, 'templateManage', 'templateManage', 'views/setting/templateManage.vue', 'False', 'True', 'menu.templateManage', 'False', 6, 'menu.templateManage', '', '', '', '');



INSERT IGNORE INTO  web_role_user_relation (id, role_id, user_id) VALUES(15, 6, 1);
INSERT IGNORE INTO web_role_user_relation (role_id , user_id)
SELECT 7,id FROM auth_user 
WHERE id != 1;
INSERT IGNORE INTO  web_role (id, name, state) VALUES(6, '超级管理员', 1);
INSERT IGNORE INTO  web_role (id, name, state) VALUES(7, '普通用户', 1);
INSERT IGNORE INTO  web_button (id, name, webroute_id) VALUES(8, 'Agent审核', 21);
INSERT IGNORE INTO  web_button (id, name, webroute_id) VALUES(9, '主动验证', 21);
INSERT IGNORE INTO  web_button (id, name, webroute_id) VALUES(11, '新增策略', 19);
INSERT IGNORE INTO  web_button (id, name, webroute_id) VALUES(2, '状态管理', 19);
INSERT IGNORE INTO  web_button (id, name, webroute_id) VALUES(3, '设置', 19);
INSERT IGNORE INTO  web_button (id, name, webroute_id) VALUES(4, '设置阈值', 21);
INSERT IGNORE INTO  web_button (id, name, webroute_id) VALUES(1, '运行时间', 18);
INSERT IGNORE INTO  web_button (id, name, webroute_id) VALUES(6, '重置密码', 29);
INSERT IGNORE INTO  web_button (id, name, webroute_id) VALUES(7, '阈值调整', 21);
INSERT IGNORE INTO  webapi_api_site (id, `path`, `method`, name) VALUES(1, 'api/v1/user/password/reset', 'POST', '密码重置');
INSERT IGNORE INTO  webapi_api_site (id, `path`, `method`, name) VALUES(2, 'api/v1/strategy/<int:id_>/disable', 'GET', '策略禁用');
INSERT IGNORE INTO  webapi_api_site (id, `path`, `method`, name) VALUES(3, 'api/v1/strategy/<int:id_>/update', 'PUT', '策略更新');
INSERT IGNORE INTO  webapi_api_site (id, `path`, `method`, name) VALUES(4, 'api/v1/profile/batch/modified', 'POST', '配置修改');
INSERT IGNORE INTO  webapi_api_site (id, `path`, `method`, name) VALUES(5, 'api/v1/license/current_concurrency', 'GET', '当前并发');


INSERT IGNORE INTO  web_api_role_relation (id, role_id, api_id, state) VALUES(1, 6, 5, 1);

INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(743, 6, 1);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(744, 6, 2);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(745, 6, 3);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(746, 6, 4);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(747, 6, 5);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(748, 6, 6);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(749, 6, 7);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(750, 6, 8);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(751, 6, 9);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(752, 6, 10);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(753, 6, 11);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(754, 6, 12);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(755, 6, 13);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(756, 6, 14);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(757, 6, 15);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(758, 6, 17);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(759, 6, 18);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(760, 6, 19);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(761, 6, 20);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(762, 6, 21);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(763, 6, 22);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(764, 6, 23);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(765, 6, 24);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(766, 6, 26);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(767, 6, 27);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(768, 6, 28);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(769, 6, 29);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(770, 6, 30);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(771, 6, 33);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(772, 6, 34);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(773, 6, 35);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(774, 6, 36);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(775, 6, 37);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(776, 6, 38);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(777, 6, 39);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(778, 7, 1);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(779, 7, 2);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(780, 7, 3);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(781, 7, 4);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(782, 7, 5);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(783, 7, 6);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(784, 7, 9);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(785, 7, 10);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(786, 7, 11);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(787, 7, 12);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(788, 7, 13);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(789, 7, 14);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(790, 7, 15);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(791, 7, 17);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(792, 7, 18);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(793, 7, 19);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(794, 7, 20);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(795, 7, 21);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(796, 7, 22);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(797, 7, 26);
INSERT IGNORE INTO  web_role_url_relation (id, role_id, url_id) VALUES(798, 7, 34);


INSERT IGNORE INTO  web_role_button_relation (id, role_id, button_id) VALUES(104, 6, 1);
INSERT IGNORE INTO  web_role_button_relation (id, role_id, button_id) VALUES(105, 6, 2);
INSERT IGNORE INTO  web_role_button_relation (id, role_id, button_id) VALUES(106, 6, 3);
INSERT IGNORE INTO  web_role_button_relation (id, role_id, button_id) VALUES(107, 6, 4);
INSERT IGNORE INTO  web_role_button_relation (id, role_id, button_id) VALUES(108, 6, 6);
INSERT IGNORE INTO  web_role_button_relation (id, role_id, button_id) VALUES(109, 6, 7);
INSERT IGNORE INTO  web_role_button_relation (id, role_id, button_id) VALUES(110, 6, 8);
INSERT IGNORE INTO  web_role_button_relation (id, role_id, button_id) VALUES(111, 6, 9);
INSERT IGNORE INTO  web_role_button_relation (id, role_id, button_id) VALUES(112, 6, 11);

INSERT IGNORE INTO  iast_profile (`key`, value) VALUES('auto_audit', '0');



SET FOREIGN_KEY_CHECKS=1;
