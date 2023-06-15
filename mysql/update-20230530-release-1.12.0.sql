SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;
-- dongtai_webapi.iast_asset_v2 definition

CREATE TABLE `iast_asset_v2` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `package_name` varchar(255) DEFAULT NULL COMMENT '第三方包名',
  `package_path` varchar(255) DEFAULT NULL COMMENT '第三方包所在路径',
  `signature_algorithm` varchar(255) DEFAULT NULL COMMENT '签名算法',
  `signature_value` varchar(255) DEFAULT NULL COMMENT '签名值',
  `dt` int(11) DEFAULT NULL COMMENT '更新时间',
  `version` varchar(255) DEFAULT NULL COMMENT '当前版本',
  `project_id` int(11) DEFAULT '0' COMMENT '项目ID',
  `project_version_id` int(11) NOT NULL DEFAULT '0' COMMENT '项目版本id',
  `department_id` int(11) DEFAULT '0' COMMENT '部门id',
  `language_id` int(11) DEFAULT '0' COMMENT '语言id',
  `aql` varchar(255) DEFAULT NULL COMMENT '当前版本',
  PRIMARY KEY (`id`),
  UNIQUE KEY `iast_asset_v2_UN` (`project_id`,`project_version_id`,`aql`),
  KEY `iast_asset_project_InDeX` (`project_id`,`signature_value`,`version`) USING BTREE,
  KEY `idx_pid` (`project_id`) USING BTREE,
  KEY `iast_asset_v2_package_name_IDX` (`package_name`,`version`,`project_id`,`language_id`) USING BTREE
);


-- dongtai_webapi.iast_asset_v2_ga_info definition

CREATE TABLE `iast_asset_v2_ga_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_fullname` varchar(255) DEFAULT NULL COMMENT 'ecosystem + packagename',
  `affected_versions` json DEFAULT NULL COMMENT '最近修复版本',
  `unaffected_versions` json DEFAULT NULL COMMENT '最近修复版本',
  PRIMARY KEY (`id`),
  UNIQUE KEY `iast_asset_vul_type_UN` (`package_fullname`)
);


-- dongtai_webapi.iast_asset_v2_global definition

CREATE TABLE `iast_asset_v2_global` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `package_name` varchar(255) DEFAULT NULL COMMENT '第三方包名',
  `package_fullname` varchar(255) DEFAULT NULL COMMENT '与info',
  `signature_algorithm` varchar(255) DEFAULT NULL COMMENT '签名算法',
  `signature_value` varchar(255) DEFAULT NULL COMMENT '签名值',
  `version` varchar(255) DEFAULT NULL COMMENT '当前版本',
  `level_id` int(11) DEFAULT NULL COMMENT '漏洞等级',
  `vul_count` int(11) DEFAULT NULL COMMENT '总漏洞数量',
  `vul_critical_count` int(11) NOT NULL DEFAULT '0' COMMENT '严重漏洞数量',
  `vul_high_count` int(11) NOT NULL DEFAULT '0' COMMENT '高危漏洞数',
  `vul_medium_count` int(11) NOT NULL DEFAULT '0' COMMENT '中危漏洞数量',
  `vul_low_count` int(11) NOT NULL DEFAULT '0' COMMENT '低危漏洞数量',
  `vul_info_count` int(11) DEFAULT '0' COMMENT '无风险漏洞数',
  `license_list` json DEFAULT NULL COMMENT '开源协议版本',
  `language_id` int(11) DEFAULT '0' COMMENT '无风险漏洞数',
  `aql` varchar(255) DEFAULT NULL COMMENT '当前版本',
  PRIMARY KEY (`id`),
  UNIQUE KEY `iast_asset_v2_global_UN` (`aql`),
  KEY `level_id` (`level_id`) USING BTREE,
  KEY `iast_asset_v2_global_package_name_IDX` (`package_name`,`version`,`language_id`,`aql`) USING BTREE
);


-- dongtai_webapi.iast_asset_v2_license definition

CREATE TABLE `iast_asset_v2_license` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license_id` int(11) DEFAULT NULL COMMENT 'cwe编号',
  `asset` varchar(255) DEFAULT NULL COMMENT '漏洞类型名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `iast_asset_v2_license_UN` (`license_id`,`asset`)
);


-- dongtai_webapi.iast_asset_vul_v2 definition

CREATE TABLE `iast_asset_vul_v2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vul_name` varchar(255) DEFAULT NULL COMMENT '关联 iast_aql_info',
  `vul_detail` text COMMENT '漏洞详情',
  `level_id` tinyint(2) DEFAULT NULL COMMENT '漏洞等级',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `references` json DEFAULT NULL COMMENT 'references',
  `change_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `published_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `vul_id` varchar(255) DEFAULT NULL COMMENT '关联 iast_aql_info',
  `vul_type` json DEFAULT NULL COMMENT 'iast_aql_info',
  `vul_codes` json DEFAULT NULL COMMENT 'references',
  `affected_versions` json DEFAULT NULL COMMENT 'affected_versions',
  `unaffected_versions` json DEFAULT NULL COMMENT 'unaffected_versions',
  PRIMARY KEY (`id`),
  UNIQUE KEY `iast_asset_vul_v2_UN` (`vul_id`),
  KEY `create_time_order` (`create_time`) USING BTREE,
  KEY `level_update_order_desc` (`level_id`,`update_time`) USING BTREE,
  KEY `update_time_order` (`update_time`) USING BTREE
);


-- dongtai_webapi.iast_asset_vul_v2_relation definition

CREATE TABLE `iast_asset_vul_v2_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vul_id` varchar(255) DEFAULT NULL COMMENT 'cwe编号',
  `asset` varchar(255) DEFAULT NULL COMMENT '漏洞类型名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `iast_asset_vul_v2_relation_UN` (`vul_id`,`asset`)
);

CREATE INDEX iast_vulnerability_project_id_IDX USING BTREE ON iast_vulnerability (project_id,project_version_id,server_id,is_del,level_id,latest_time_desc);
CREATE INDEX iast_dast_integration_vul_type_IDX USING BTREE ON iast_dast_integration (vul_type);
CREATE INDEX iast_project_department_id_IDX USING BTREE ON iast_project (department_id);
CREATE INDEX iast_dast_integration_project_id_IDX USING BTREE ON iast_dast_integration (project_id,project_version_id);
CREATE INDEX iast_message_to_user_id_IDX USING BTREE ON iast_message (to_user_id);
CREATE INDEX iast_agent_filepathsimhash_IDX USING BTREE ON iast_agent (filepathsimhash,`language`);
CREATE INDEX iast_agent_language_IDX USING BTREE ON iast_agent (`language`,server_id);
CREATE INDEX iast_server_path_IDX USING BTREE ON iast_server (`path`);
CREATE INDEX auth_department_token_IDX USING BTREE ON auth_department (token);
CREATE INDEX iast_vulnerability_is_del_IDX USING BTREE ON iast_vulnerability (is_del,project_id,project_version_id);
CREATE INDEX iast_hook_strategy_enable_IDX USING BTREE ON iast_hook_strategy (enable,language_id);
CREATE INDEX iast_heartbeat_agent_id_IDX USING BTREE ON iast_heartbeat (agent_id,dt);
CREATE INDEX iast_agent_bind_project_id_IDX4 USING BTREE ON iast_agent (bind_project_id,department_id,server_id,latest_time);
CREATE INDEX iast_replay_queue_agent_id_IDX USING BTREE ON iast_replay_queue (agent_id,`state`,replay_type);
CREATE INDEX iast_api_route_method_id_IDX USING BTREE ON iast_api_route (method_id,project_id,project_version_id);
CREATE INDEX iast_vulnerability_uri_IDX2 USING BTREE ON iast_vulnerability (uri,project_id,project_version_id,server_id,is_del,level_id,latest_time_desc);
CREATE INDEX iast_asset_v2_language_id_IDX3 USING BTREE ON iast_asset_v2 (language_id,version,package_name,project_id,project_version_id,dt);

INSERT INTO web_url_route
(id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n)
VALUES(62, 'scalistDetail/:page/:id', 'scalistDetail/:page/:id', 'views/sca/ScaDialog.vue', 'False', 'False', 'menu.scalistDetail', 'False', 3, 'menu.scanDetail', '', '', '', '');
INSERT INTO web_role_url_relation
(role_id, url_id)
VALUES(6, 62);
INSERT INTO web_role_url_relation
(role_id, url_id)
VALUES(7, 62);
INSERT INTO web_role_url_relation
(role_id, url_id)
VALUES(8, 62);

SET FOREIGN_KEY_CHECKS=1;
