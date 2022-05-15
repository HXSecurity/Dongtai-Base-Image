SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE iast_server ADD protocol varchar(255) DEFAULT '' NOT NULL COMMENT 'protocol';
ALTER TABLE iast_request_chains ADD protocol varchar(100)  DEFAULT '' NOT NULL COMMENT '协议';

ALTER TABLE dongtai_webapi.iast_request_chains ADD protocol varchar(100) DEFAULT '' NOT NULL COMMENT '协议';
UPDATE IGNORE iast_request_chains as v , (SELECT irc.id as irc_id , iamp.http_scheme as iamp_http_scheme FROM  iast_request_chains irc ,iast_agent_method_pool iamp 
WHERE irc.target_id = iamp.id  ) as tmp
SET http_protocol  = iamp_http_scheme
WHERE v.id = tmp.irc_id ;
--
-- Create model IastCircuitConfig
--
CREATE TABLE `iast_circuit_configs` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `name` varchar(200) NULL, `metric_types` varchar(2000) NULL, `targets` varchar(2000) NULL, `system_type` integer NULL, `is_enable` integer NULL, `is_deleted` integer NULL, `deal` integer NULL, `interval` integer NULL, `metric_group` integer NULL, `priority` integer NULL, `create_time` integer NULL, `update_time` integer NULL, `user_id` integer NOT NULL);
--
-- Create model IastCircuitTarget
--
CREATE TABLE `iast_circuit_targets` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `target_type` integer NULL, `opt` integer NULL, `value` varchar(200) NULL, `circuit_config_id` integer NOT NULL);
--
-- Create model IastCircuitMetric
--
CREATE TABLE `iast_circuit_metrics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `metric_type` int(11) DEFAULT NULL,
  `measure` varchar(200)  DEFAULT NULL,
  `opt` int(11) DEFAULT NULL,
  `value` varchar(200)  DEFAULT NULL,
  `circuit_config_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);
--
CREATE TABLE iast_vul_log (
	id int(11) auto_increment NOT NULL COMMENT '自增主键',
	msg TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '日志详情',
	meta_data json NULL COMMENT '日志原始数据',
	`datetime` int(11) NULL COMMENT '日志触发时间',
	user_id int(11) NULL COMMENT 'user id',
	asset_id int(11) NULL COMMENT 'agent id',
	vul_id int(11) NULL COMMENT 'vul id',
	msg_type int(11) NULL COMMENT '日志类型',
	CONSTRAINT `PRIMARY` PRIMARY KEY (id)
);
---
CREATE TABLE dongtai_webapi.iast_asset_vul_relation (
	id int(11) auto_increment NOT NULL,
	asset_id int(11) DEFAULT 0 NOT NULL,
	asset_vul_id int(11) DEFAULT 0 NOT NULL,
	status_id int(11) DEFAULT 0 NOT NULL COMMENT '漏洞状态id',
	CONSTRAINT `PRIMARY` PRIMARY KEY (id)
);
---
CREATE TABLE `iast_asset_vul` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` json DEFAULT NULL,
  `package_name` varchar(255) DEFAULT NULL COMMENT '包名',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `license` varchar(255) DEFAULT NULL COMMENT '许可证',
  `license_level` int(11) DEFAULT NULL COMMENT '许可证风险等级',
  `vul_name` varchar(255) DEFAULT NULL COMMENT '漏洞名称',
  `safe_version` varchar(255) DEFAULT NULL COMMENT '安全版本',
  `fix_version` varchar(255) DEFAULT NULL COMMENT '修复版本',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `proofable` int(11) DEFAULT NULL COMMENT '可利用性',
  `vul_type` varchar(255) DEFAULT NULL COMMENT '修复版本',
  `package_hash` varchar(255) DEFAULT NULL COMMENT '包hash',
  `package_version` varchar(255) DEFAULT NULL COMMENT '包版本',
  `aql` varchar(255) DEFAULT NULL COMMENT '包aql',
  PRIMARY KEY (`id`)
);
---
CREATE INDEX iast_vulnerability_method_pool_id_IDX USING BTREE ON iast_vulnerability (method_pool_id,hook_type_id,strategy_id);
ALTER TABLE iast_http_method ADD CONSTRAINT iast_http_method_UN UNIQUE KEY (`method`);
ALTER TABLE iast_api_methods ADD CONSTRAINT iast_api_methods_un UNIQUE KEY (`method`);
CREATE INDEX iast_asset_user_id_IDX USING BTREE ON iast_asset (user_id,vul_count);
CREATE INDEX auth_user_department_department_id_REIDX USING BTREE ON auth_user_department (department_id,user_id);
CREATE INDEX auth_department_principal_id_IDX USING BTREE ON auth_department (principal_id);
CREATE INDEX iast_agent_bind_project_id2_IDX USING BTREE ON iast_agent (bind_project_id,user_id);
CREATE INDEX iast_vulnerability_agent_id_IDX USING BTREE ON iast_vulnerability (agent_id,level_id);
CREATE INDEX iast_project_name_IDX USING BTREE ON iast_project (name);


# 解决mysql7 索引的问题
# update iast_vulnerability set `-latest_time` = -1 * latest_time;
# update iast_vulnerability set `-level_id` = -1 * level_id;



SET FOREIGN_KEY_CHECKS=1;
