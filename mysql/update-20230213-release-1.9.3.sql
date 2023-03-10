SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

-- beta1

ALTER TABLE iast_request_chains ADD span_id varchar(255)  NULL COMMENT 'span_id';
ALTER TABLE iast_request_chains ADD parent_span_id varchar(255)  NULL COMMENT 'parent_span_id';

-- dongtai_webapi.iast_request_chains_vul_context definition

CREATE TABLE `iast_request_chains_vul_context` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `vul_id` int(11) DEFAULT NULL COMMENT '来源调用ID',
  `method_pool_id` int(11) DEFAULT NULL COMMENT '目标调用ID',
  `project_id` int(11) DEFAULT NULL COMMENT '项目ID',
  `level_id` int(11) DEFAULT NULL COMMENT '层级ID',
  `stack` json DEFAULT NULL COMMENT '方法池',
  `project_path` varchar(255) DEFAULT NULL COMMENT 'project hash',
  `parent_project_id` int(11) DEFAULT NULL COMMENT '项目ID',
  `request_hash` varchar(255) DEFAULT NULL COMMENT 'request hash',
  PRIMARY KEY (`id`),
  KEY `iast_request_chains_vul_context_vul_id_IDX` (`vul_id`,`method_pool_id`,`project_id`,`level_id`,`project_path`) USING BTREE
);

-- dongtai_webapi.iast_agent_event definition

CREATE TABLE `iast_agent_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- beta2

ALTER TABLE auth_department ADD token varchar(255) NULL COMMENT '部门token';
ALTER TABLE auth_department ADD department_path varchar(255) NULL COMMENT '部门层级';
ALTER TABLE iast_vulnerability ADD project_id int(11) DEFAULT 0 NULL COMMENT '项目ID';
ALTER TABLE iast_vulnerability ADD project_version_id int(11) DEFAULT 0 NULL COMMENT '应用ID';
ALTER TABLE iast_api_route ADD project_id int(11) DEFAULT 0 NULL COMMENT '项目ID';
ALTER TABLE iast_api_route ADD project_version_id int(11) DEFAULT 0 NULL COMMENT '项目版本ID';
ALTER TABLE iast_agent ADD department_id int(11) NULL COMMENT '部门id';
ALTER TABLE iast_project ADD department_id int(11) NULL COMMENT '部门id';
ALTER TABLE iast_vulnerability ADD server_id int(11) DEFAULT 0 NULL COMMENT 'server';
ALTER TABLE iast_vulnerability ADD language varchar(10)  NULL COMMENT 'language';

ALTER TABLE iast_agent_method_pool_replay MODIFY COLUMN res_body TEXT NULL COMMENT '响应体';
ALTER TABLE iast_agent_method_pool_replay MODIFY COLUMN res_header TEXT NULL COMMENT '响应头';
ALTER TABLE iast_agent_method_pool_replay MODIFY COLUMN req_data TEXT NULL COMMENT '请求体';
ALTER TABLE iast_agent_method_pool_replay MODIFY COLUMN req_params TEXT NULL COMMENT '请求参数';
ALTER TABLE iast_agent_method_pool_replay MODIFY COLUMN req_header TEXT NULL COMMENT '请求头';

ALTER TABLE iast_strategy_user ADD department_id int(11) NULL COMMENT '部门id';


UPDATE iast_vulnerability iv 
JOIN iast_agent ia  ON iv.agent_id = ia.id 
SET iv.project_id  = ia.bind_project_id  , iv.project_version_id = ia.project_version_id
WHERE 1=1;
UPDATE iast_api_route  iv 
JOIN iast_agent ia  ON iv.agent_id = ia.id 
SET iv.project_id  = ia.bind_project_id  , iv.project_version_id = ia.project_version_id
WHERE 1=1;
UPDATE iast_agent ia 
JOIN auth_user_department aud ON ia.user_id = aud.user_id
SET ia.department_id = aud.department_id WHERE 1=1;
UPDATE iast_project  ia 
JOIN auth_user_department aud ON ia.user_id = aud.user_id
SET ia.department_id = aud.department_id WHERE 1=1;
UPDATE iast_asset ia 
JOIN auth_user_department aud ON ia.user_id = aud.user_id
SET ia.department_id = aud.department_id WHERE 1=1;
UPDATE iast_vulnerability iv
JOIN iast_agent ia ON iv.agent_id = ia.id 
SET iv.server_id = ia.server_id WHERE 1 = 1;
UPDATE iast_vulnerability iv
JOIN iast_agent ia ON iv.agent_id = ia.id 
SET iv.language = ia.language WHERE 1 = 1;
UPDATE iast_strategy_user  ia 
JOIN auth_user_department aud ON ia.user_id = aud.user_id
SET ia.department_id = aud.department_id WHERE 1=1;


ALTER TABLE iast_agent_black_rule ADD project_id int(11) DEFAULT -1 NULL;
ALTER TABLE iast_agent_black_rule ADD project_template_id int(11) DEFAULT -1 NULL;

-- dongtai_webapi.iast_project_template definition

CREATE TABLE `iast_project_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `latest_time` int(11) DEFAULT NULL COMMENT '最新时间',
  `user_id` int(11) DEFAULT NULL COMMENT 'user id',
  `scan_id` bigint(20) unsigned DEFAULT NULL COMMENT '扫描策略ID',
  `vul_validation` int(11) NOT NULL DEFAULT '0' COMMENT '漏洞验证 0-跟随全局,1-启用,2-禁用',
  `is_system` int(11) NOT NULL DEFAULT '0' COMMENT '是否为默认配置',
  `data_gather` json DEFAULT NULL COMMENT '数据采集设置',
  `data_gather_is_followglobal` int(11) NOT NULL DEFAULT '0' COMMENT '数据采集设置是否跟随全局',
  `blacklist_is_followglobal` int(11) NOT NULL DEFAULT '0' COMMENT '黑名单设置是否跟随全局',
  PRIMARY KEY (`id`),
  KEY `iast_project_id_IDX` (`id`,`template_name`) USING BTREE,
  KEY `iast_project_name_IDX` (`template_name`) USING BTREE,
  KEY `scan_id` (`scan_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE iast_project ADD data_gather json NULL COMMENT '数据采集设置';
ALTER TABLE iast_project ADD data_gather_is_followglobal int(11) DEFAULT 1 NOT NULL COMMENT '数据采集设置是否跟随全局';
ALTER TABLE iast_project ADD blacklist_is_followglobal int(11) DEFAULT 1 NOT NULL COMMENT '黑名单设置是否跟随全局';

INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(60, 'projectTemplate', 'projectTemplate', 'views/setting/projectTemplate.vue', 'False', 'False', 'menu.projectTemplate', 'False', 6, 'menu.projectTemplate', '', '', '', '');
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 60);

INSERT INTO iast_project_template (template_name, latest_time, user_id, scan_id, vul_validation, is_system, data_gather, data_gather_is_followglobal, blacklist_is_followglobal) VALUES('默认模版', 1674901260, 1, 5, 0, 1, '{"gather_res_body": false, "version_header_name": "DongTai", "enable_version_header": true, "method_pool_max_length": 5000}', 0, 0);

UPDATE iast_strategy_user  ia 
JOIN auth_user_department aud ON ia.user_id = aud.user_id
SET ia.department_id = aud.department_id WHERE 1=1;

ALTER TABLE iast_project ADD template_id int(11) DEFAULT 1 NOT NULL COMMENT '模板id';


DELETE
FROM
	web_role_url_relation 
WHERE
	role_id IN (6, 7);


DELETE
FROM
	web_role_button_relation 
WHERE
	role_id IN (6, 7);

INSERT INTO web_role_button_relation (role_id, button_id) VALUES(6, 1);
INSERT INTO web_role_button_relation (role_id, button_id) VALUES(6, 2);
INSERT INTO web_role_button_relation (role_id, button_id) VALUES(6, 3);
INSERT INTO web_role_button_relation (role_id, button_id) VALUES(6, 4);
INSERT INTO web_role_button_relation (role_id, button_id) VALUES(6, 6);
INSERT INTO web_role_button_relation (role_id, button_id) VALUES(6, 7);
INSERT INTO web_role_button_relation (role_id, button_id) VALUES(6, 8);
INSERT INTO web_role_button_relation (role_id, button_id) VALUES(6, 9);
INSERT INTO web_role_button_relation (role_id, button_id) VALUES(6, 11);
INSERT INTO web_role_button_relation (role_id, button_id) VALUES(6, 13);
INSERT INTO web_role_button_relation (role_id, button_id) VALUES(6, 14);
INSERT INTO web_role_button_relation (role_id, button_id) VALUES(6, 15);
INSERT INTO web_role_button_relation (role_id, button_id) VALUES(7, 6);

INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 1);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 2);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 3);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 4);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 5);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 6);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 7);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 8);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 9);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 10);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 11);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 12);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 13);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 14);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 15);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 17);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 18);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 19);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 20);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 21);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 22);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 23);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 24);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 26);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 27);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 28);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 29);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 30);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 33);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 34);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 35);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 36);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 37);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 38);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 39);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 41);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 42);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 43);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 44);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 45);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 46);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 47);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 48);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 49);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 50);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 51);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 53);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 54);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 55);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 56);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 57);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 58);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 59);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 60);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 1);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 2);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 3);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 4);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 5);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 6);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 7);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 9);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 10);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 11);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 12);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 13);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 14);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 15);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 17);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 18);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 21);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 22);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 27);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 29);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 34);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 42);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 43);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 44);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 45);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 46);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 47);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 48);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 49);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 50);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 51);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 53);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 54);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 55);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 56);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 57);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(7, 58);

UPDATE
	web_role
SET
	name = "组织管理员"
WHERE
	name = "普通用户";

INSERT INTO web_role (name, state) VALUES('普通用户', 1);

SET @NormalUserId = (SELECT `id` FROM web_role wr
WHERE name = '普通用户');

INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 1);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 2);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 3);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 4);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 5);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 6);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 9);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 10);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 11);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 12);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 13);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 14);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 15);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 17);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 18);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 21);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 22);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 34);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 42);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 43);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 44);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 45);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 46);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 47);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 48);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 49);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 50);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 51);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 53);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 54);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 55);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 56);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(@NormalUserId, 57);

UPDATE web_role_user_relation 
SET role_id  = @NormalUserId
WHERE id = 7;


DELETE FROM web_url_route 
WHERE 1=1;

INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(1, '/project', 'project', 'views/project/Index.vue', '', 'True', 'menu.projectManage', 'True', 0, '', '/project/projectManage', '项目', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(2, '/vuln', 'vuln', 'views/vuln/Index.vue', '', '', 'menu.vuln', 'True', 0, '', '/vuln/vulnList', '漏洞', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(3, '/sca', 'sca', 'views/sca/Index.vue', '', 'True', 'menu.sca', 'True', 0, '', '/sca/scaList', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(4, '/taint', 'taint', 'views/taint/Index.vue', 'True', 'True', 'menu.taintPool', 'False', 0, '', '/taint/search', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(5, '/links', 'links', 'views/links/index.vue', '', '', 'menu.links', 'True', 0, 'menu.links', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(6, '/setting', 'setting', 'views/setting/Index.vue', '', '', 'menu.setting', 'False', 0, '', '/setting/integration', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(7, '/department', 'department', 'views/department/Index.vue', '', '', 'menu.department', 'False', 0, '', '/department/departmentList', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(8, '/talent', 'talent', 'views/talent/Index.vue', '', '', 'menu.talent', 'True', 6, '', '/talent/talentList', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(9, 'projectManage', 'projectManage', 'views/project/ProjectManage.vue', '', 'True', 'menu.projectManage', '', 1, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(10, 'projectEdit/:pid?', 'projectEdit/:pid?', 'views/project/ProjectEdit.vue', '', 'True', 'menu.projectEdit', '', 1, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(11, 'projectDetail/:pid', 'projectDetail/:pid', 'views/project/ProjectDetail.vue', 'True', 'True', 'menu.projectDetail', '', 1, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(12, 'vulnList', 'vulnList', 'views/vuln/VulnList.vue', 'True', '', 'menu.vulnList', '', 2, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(13, 'vulnDetail/:page/:id', 'vulnDetail/:page/:id', 'views/vuln/VulnDetail.vue', '', '', 'menu.vulnDetail', '', 2, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(14, 'scaList', 'scaList', 'views/sca/ScaList.vue', '', 'True', 'menu.scaList', '', 3, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(15, 'scaDetail/:page/:id', 'scaDetail/:page/:id', 'views/sca/ScaDetail.vue', '', 'True', 'menu.scaDetail', '', 2, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(17, 'poolDetail/:id', 'poolDetail', 'views/taint/PoolDetail.vue', 'True', 'True', 'menu.poolDetail', '', 4, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(18, 'agentManage', 'agentManage', 'views/setting/AgentManage.vue', '', 'True', 'menu.agentManage', 'True', 0, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(19, 'strategyManage', 'strategyManage', 'views/setting/StrategyManage.vue', 'False', 'True', 'menu.strategyManage', 'False', 6, 'menu.strategyManage', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(20, 'hookRule', 'hookRule', 'views/setting/hookRule.vue', '', 'True', 'menu.hookRule', '', 6, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(21, 'sysInfo', 'sysInfo', 'views/setting/SysInfo.vue', '', '', 'menu.sysInfo', '', 0, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(22, 'changePassword', 'changePassword', 'views/setting/ChangePassword.vue', '', 'True', 'menu.changePassword', '', 6, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(23, 'changeLogo', 'changeLogo', 'views/setting/changeLogo.vue', '', 'True', 'menu.changeLogo', '', 6, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(24, 'logManage', 'logManage', 'views/setting/LogManage.vue', '', 'True', 'menu.logManage', '', 6, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(26, 'StatusMonitoring', 'StatusMonitoring', 'views/setting/StatusMonitoring.vue', '', 'True', 'menu.statusMonitoring', '', 6, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(27, 'departmentList', 'departmentList', 'views/department/DepartmentList.vue', '', '', 'menu.department', '', 6, 'menu.department', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(28, 'talentList', 'talentList', 'views/talent/TalentList.vue', '', '', 'menu.talent', '', 6, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(29, 'userSetting', 'userSetting', 'views/department/userSetting.vue', '', '', 'menu.userSetting', '', 6, 'menu.userSetting', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(30, 'roleSetting', 'roleSetting', 'views/department/roleSetting.vue', '', '', 'menu.roleSetting', '', 6, 'menu.roleSetting', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(33, 'license', 'license', 'views/setting/license.vue', '', '', 'menu.license', '', 6, 'menu.license', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(34, '/deploy', '/deploy', 'views/deploy/Deploy.vue', '', 'True', 'deploy', '', 0, '部署IAST', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(35, 'sensitiveManage', 'sensitiveManage', 'views/setting/sensitiveManage.vue', 'False', 'True', 'menu.sensitiveManage', 'False', 6, 'menu.sensitiveManage', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(36, 'sensitive', 'sensitive', 'views/setting/sensitive.vue', 'False', 'True', 'menu.sensitive', 'False', 6, 'menu.sensitive', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(37, 'strategy', 'strategy', 'views/setting/Strategy.vue', 'False', 'True', 'menu.strategy', 'False', 6, 'menu.strategy', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(38, 'template', 'template', 'views/setting/template.vue', 'False', 'True', 'menu.template', 'False', 6, 'menu.template', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(39, 'templateManage', 'templateManage', 'views/setting/templateManage.vue', 'False', 'True', 'menu.templateManage', 'False', 6, 'menu.templateManage', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(41, 'agentConfig', 'agentConfig', 'views/setting/agentConfig.vue', 'False', 'True', 'menu.agentConfig', 'False', 0, 'menu.agentConfig', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(42, 'integration', 'integration', 'views/setting/integration.vue', 'False', 'False', 'menu.integration', 'False', 6, 'menu.integration', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(43, 'jira', 'jira', 'views/setting/jira.vue', 'False', 'True', 'menu.jira', 'False', 6, 'menu.jira', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(44, 'chandao', 'chandao', 'views/setting/chandao.vue', 'False', 'True', 'menu.chandao', 'False', 6, 'menu.chandao', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(45, 'gitlab', 'gitlab', 'views/setting/gitlab.vue', 'False', 'True', 'menu.gitlab', 'False', 6, 'menu.gitlab', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(46, 'jenkins', 'jenkins', 'views/setting/jenkins.vue', 'False', 'True', 'menu.jenkins', 'False', 6, 'menu.jenkins', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(47, 'about', 'about', 'views/setting/about.vue', 'False', 'True', 'menu.about', 'False', 6, 'menu.about', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(48, 'feishu', 'feishu', 'views/setting/feishu.vue', 'False', 'True', 'menu.feishu', 'False', 6, 'menu.feishu', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(49, 'dingding', 'dingding', 'views/setting/dingding.vue', 'False', 'True', 'menu.dingding', 'False', 6, 'menu.dingding', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(50, 'weixin', 'weixin', 'views/setting/weixin.vue', 'False', 'True', 'menu.weixin', 'False', 6, 'menu.weixin', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(51, 'webhook', 'webhook', 'views/setting/webhook.vue', 'False', 'True', 'menu.webhook', 'False', 6, 'menu.webhook', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(53, 'reportCenter', 'reportCenter', 'views/project/reportCenter.vue', '', 'True', 'menu.reportCenter', '', 0, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(54, 'projectExport/:pid?', 'projectExport/:pid?', 'views/project/ProjectExport.vue', '', 'True', 'menu.projectExport', '', 1, '', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(55, 'kubernetes', 'kubernetes', 'views/setting/k8s.vue', 'False', 'True', 'menu.kubernetes', 'False', 6, 'menu.kubernetes', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(56, 'yunxiao', 'yunxiao', 'views/setting/yunxiao.vue', 'False', 'True', 'menu.yunxiao', 'False', 6, 'menu.yunxiao', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(57, 'IntelliJ', 'IntelliJ', 'views/setting/intelliJ.vue', 'False', 'True', 'menu.intelliJ', 'False', 6, 'menu.intelliJ', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(58, 'lanjing', 'lanjing', 'views/setting/lanjing.vue', 'False', 'True', 'menu.lanjing', 'False', 6, 'menu.lanjing', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(59, 'systemSettings', 'systemSettings', 'views/setting/SystemSettings.vue', 'False', 'True', 'menu.systemSettings', 'False', 6, 'menu.systemSettings', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(60, 'projectTemplate', 'projectTemplate', 'views/setting/projectTemplate.vue', 'False', 'False', 'menu.projectTemplate', 'False', 6, 'menu.projectTemplate', '', '', '', '');

ALTER TABLE iast_api_route  ADD is_cover int(11) DEFAULT 0 NOT NULL COMMENT '是否覆盖';

ALTER TABLE iast_project DROP KEY iast_project_UN;
CREATE INDEX iast_asset_project_id_IDX USING BTREE ON iast_asset (project_id,department_id,project_name);

SET FOREIGN_KEY_CHECKS=1;
