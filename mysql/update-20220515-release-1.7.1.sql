SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `dongtai_webapi`.`auth_department` ADD INDEX `auth_department_principal_id_IDX`(`principal_id`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`auth_department_talent` ADD CONSTRAINT `auth_department_talent_ibfk_1` FOREIGN KEY (`talent_id`) REFERENCES `dongtai_webapi`.`auth_talent` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `dongtai_webapi`.`auth_department_talent` ADD CONSTRAINT `auth_department_talent_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `dongtai_webapi`.`auth_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `dongtai_webapi`.`auth_group_permissions` ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `dongtai_webapi`.`auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `dongtai_webapi`.`auth_group_permissions` ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `dongtai_webapi`.`auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE `dongtai_webapi`.`auth_group_routes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `routes` json NULL COMMENT '可访问的路由',
  `group_id` int(11) NULL DEFAULT NULL COMMENT '用户组ID',
  `created_by_id` int(11) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `is_active` int(11) NULL DEFAULT NULL COMMENT '是否启用，0-禁用，1-启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB ROW_FORMAT = Dynamic;

ALTER TABLE `dongtai_webapi`.`auth_permission` ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `dongtai_webapi`.`django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `dongtai_webapi`.`auth_user_department` ADD CONSTRAINT `auth_user_department_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `dongtai_webapi`.`auth_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `dongtai_webapi`.`auth_user_department` ADD CONSTRAINT `auth_user_department_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `dongtai_webapi`.`auth_department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `dongtai_webapi`.`auth_user_department` ADD INDEX `auth_user_department_user_id_IDX`(`user_id`, `department_id`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`auth_user_department` ADD INDEX `auth_user_department_department_id_IDX`(`department_id`, `user_id`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`auth_user_groups` ADD CONSTRAINT `auth_user_groups_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `dongtai_webapi`.`auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `dongtai_webapi`.`auth_user_groups` ADD CONSTRAINT `auth_user_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `dongtai_webapi`.`auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `dongtai_webapi`.`auth_user_user_permissions` ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `dongtai_webapi`.`auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `dongtai_webapi`.`auth_user_user_permissions` ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `dongtai_webapi`.`auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `dongtai_webapi`.`authtoken_token` ADD CONSTRAINT `authtoken_token_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `dongtai_webapi`.`auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `dongtai_webapi`.`django_admin_log` ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `dongtai_webapi`.`django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `dongtai_webapi`.`django_admin_log` ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `dongtai_webapi`.`auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `dongtai_webapi`.`django_celery_beat_periodictask` ADD CONSTRAINT `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` FOREIGN KEY (`clocked_id`) REFERENCES `dongtai_webapi`.`django_celery_beat_clockedschedule` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `dongtai_webapi`.`django_celery_beat_periodictask` ADD CONSTRAINT `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` FOREIGN KEY (`crontab_id`) REFERENCES `dongtai_webapi`.`django_celery_beat_crontabschedule` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `dongtai_webapi`.`django_celery_beat_periodictask` ADD CONSTRAINT `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` FOREIGN KEY (`interval_id`) REFERENCES `dongtai_webapi`.`django_celery_beat_intervalschedule` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `dongtai_webapi`.`django_celery_beat_periodictask` ADD CONSTRAINT `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` FOREIGN KEY (`solar_id`) REFERENCES `dongtai_webapi`.`django_celery_beat_solarschedule` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `dongtai_webapi`.`engine_monitoring_indicators` MODIFY COLUMN `key` varchar(100)  NOT NULL AFTER `id`;

ALTER TABLE `dongtai_webapi`.`engine_monitoring_indicators` MODIFY COLUMN `name` varchar(100)  NOT NULL AFTER `key`;

ALTER TABLE `dongtai_webapi`.`engine_monitoring_indicators` MODIFY COLUMN `name_en` varchar(100)  NULL DEFAULT NULL AFTER `name`;

ALTER TABLE `dongtai_webapi`.`engine_monitoring_indicators` MODIFY COLUMN `name_zh` varchar(100)  NULL DEFAULT NULL AFTER `name_en`;

ALTER TABLE `dongtai_webapi`.`iast_agent` MODIFY COLUMN `control` int(1) NULL DEFAULT NULL COMMENT 'agent控制位，1-启动、2-暂停、3-审核通过、0-无控制' AFTER `is_running`;

ALTER TABLE `dongtai_webapi`.`iast_agent` MODIFY COLUMN `alias` varchar(255)  NOT NULL DEFAULT '' COMMENT 'agent别名' AFTER `language`;

ALTER TABLE `dongtai_webapi`.`iast_agent` MODIFY COLUMN `is_audit` int(11) NULL DEFAULT 1 COMMENT '是否审核' AFTER `register_time`;

ALTER TABLE `dongtai_webapi`.`iast_agent` ADD CONSTRAINT `iast_agent_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `dongtai_webapi`.`auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `dongtai_webapi`.`iast_agent` ADD CONSTRAINT `iast_agent_ibfk_2` FOREIGN KEY (`server_id`) REFERENCES `dongtai_webapi`.`iast_server` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `dongtai_webapi`.`iast_agent` ADD INDEX `iast_agent_bind_project_id_single_IDX`(`bind_project_id`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_agent` ADD INDEX `iast_agent_id_IDX`(`id`, `bind_project_id`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_agent` ADD INDEX `bind_project_id_language_IDX`(`bind_project_id`, `language`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_agent` ADD INDEX `language_IDX`(`language`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_agent` ADD INDEX `iast_agent_user_id_IDX`(`user_id`, `bind_project_id`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_agent` ADD INDEX `iast_agent_bind_project_id2_IDX`(`bind_project_id`, `user_id`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_agent_method_pool` DROP FOREIGN KEY `iast_agent_method_pool_ibfk_1`;

ALTER TABLE `dongtai_webapi`.`iast_agent_method_pool` ADD INDEX `iast_agent_method_pool_id_IDX`(`id`, `agent_id`, `http_scheme`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_agent_method_pool` ADD INDEX `iast_agent_method_pool_http_scheme_IDX`(`http_scheme`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_agent_method_pool_sinks` ADD CONSTRAINT `iast_agent_method_pool_sinks_ibfk_1` FOREIGN KEY (`methodpool_id`) REFERENCES `dongtai_webapi`.`iast_agent_method_pool` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `dongtai_webapi`.`iast_api_parameter` MODIFY COLUMN `name` varchar(100)  NOT NULL AFTER `id`;

ALTER TABLE `dongtai_webapi`.`iast_api_parameter` MODIFY COLUMN `type` varchar(100)  NOT NULL AFTER `name`;

ALTER TABLE `dongtai_webapi`.`iast_api_parameter` MODIFY COLUMN `annotation` varchar(500)  NOT NULL AFTER `type`;

ALTER TABLE `dongtai_webapi`.`iast_api_response` MODIFY COLUMN `return_type` varchar(100)  NOT NULL AFTER `id`;

ALTER TABLE `dongtai_webapi`.`iast_api_route` DROP INDEX `iast_api_route_iast_api_route_path_method_agent_uniq`;

ALTER TABLE `dongtai_webapi`.`iast_api_route` ADD COLUMN `from_where` int(11) NOT NULL DEFAULT 1 COMMENT '1-agent,2-method_pool' AFTER `method_id`;

ALTER TABLE `dongtai_webapi`.`iast_api_route` MODIFY COLUMN `path` varchar(255)  NOT NULL AFTER `id`;

ALTER TABLE `dongtai_webapi`.`iast_api_route` MODIFY COLUMN `code_class` varchar(255)  NOT NULL AFTER `path`;

ALTER TABLE `dongtai_webapi`.`iast_api_route` MODIFY COLUMN `description` varchar(500)  NOT NULL AFTER `code_class`;

ALTER TABLE `dongtai_webapi`.`iast_api_route` MODIFY COLUMN `code_file` varchar(500)  NOT NULL AFTER `description`;

ALTER TABLE `dongtai_webapi`.`iast_api_route` MODIFY COLUMN `controller` varchar(100)  NOT NULL AFTER `code_file`;

CREATE TABLE `dongtai_webapi`.`iast_aql_info2`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vul_number` varchar(255)  NULL DEFAULT NULL COMMENT '漏洞编号 汇总',
  `vul_title` varchar(255)  NULL DEFAULT NULL COMMENT '漏洞标题',
  `safe_version` varchar(255)  NULL DEFAULT NULL COMMENT '安全版本',
  `latest_version` varchar(255)  NULL DEFAULT NULL COMMENT '最新版本',
  `availability` tinyint(2) NULL DEFAULT NULL COMMENT '可利用性',
  `source_license` varchar(255)  NULL DEFAULT NULL COMMENT '开源许可证',
  `license_risk` tinyint(2) NULL DEFAULT NULL COMMENT '开源许可证风险等级',
  `vul_type_name` varchar(255)  NULL DEFAULT NULL COMMENT '漏洞类型名称',
  `aql` varchar(255)  NULL DEFAULT NULL,
  `level_id` tinyint(2) NULL DEFAULT NULL COMMENT '漏洞等级',
  `hash` varchar(255)  NULL DEFAULT NULL COMMENT 'aql hash',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB  ROW_FORMAT = Dynamic;

ALTER TABLE `dongtai_webapi`.`iast_asset` ADD COLUMN `safe_version` varchar(255)  NOT NULL DEFAULT '' COMMENT '安全版本' AFTER `version`;

ALTER TABLE `dongtai_webapi`.`iast_asset` ADD COLUMN `last_version` varchar(255)  NOT NULL DEFAULT '' COMMENT '最新版本' AFTER `safe_version`;

ALTER TABLE `dongtai_webapi`.`iast_asset` ADD COLUMN `vul_critical_count` int(11) NOT NULL DEFAULT 0 COMMENT '严重漏洞数量' AFTER `vul_count`;

ALTER TABLE `dongtai_webapi`.`iast_asset` ADD COLUMN `vul_high_count` int(11) NOT NULL DEFAULT 0 COMMENT '高危漏洞数' AFTER `vul_critical_count`;

ALTER TABLE `dongtai_webapi`.`iast_asset` ADD COLUMN `vul_medium_count` int(11) NOT NULL DEFAULT 0 COMMENT '中危漏洞数量' AFTER `vul_high_count`;

ALTER TABLE `dongtai_webapi`.`iast_asset` ADD COLUMN `vul_low_count` int(11) NOT NULL DEFAULT 0 COMMENT '低危漏洞数量' AFTER `vul_medium_count`;

ALTER TABLE `dongtai_webapi`.`iast_asset` ADD COLUMN `vul_info_count` int(11) NULL DEFAULT 0 COMMENT '无风险漏洞数' AFTER `vul_low_count`;

ALTER TABLE `dongtai_webapi`.`iast_asset` ADD COLUMN `project_id` int(11) NULL DEFAULT 0 COMMENT '项目ID' AFTER `agent_id`;

ALTER TABLE `dongtai_webapi`.`iast_asset` ADD COLUMN `project_name` varchar(255)  NOT NULL DEFAULT '' COMMENT '项目名称' AFTER `project_id`;

ALTER TABLE `dongtai_webapi`.`iast_asset` ADD COLUMN `project_version_id` int(11) NOT NULL DEFAULT 0 COMMENT '项目版本id' AFTER `project_name`;

ALTER TABLE `dongtai_webapi`.`iast_asset` ADD COLUMN `user_id` int(11) NULL DEFAULT 0 COMMENT '用户ID' AFTER `project_version_id`;

ALTER TABLE `dongtai_webapi`.`iast_asset` ADD COLUMN `license` varchar(255)  NOT NULL DEFAULT '' COMMENT '许可证' AFTER `user_id`;

ALTER TABLE `dongtai_webapi`.`iast_asset` ADD COLUMN `language` varchar(255)  NOT NULL DEFAULT '' COMMENT '语言' AFTER `license`;

ALTER TABLE `dongtai_webapi`.`iast_asset` ADD COLUMN `dependency_level` int(255) NOT NULL DEFAULT 0 COMMENT '依赖层级' AFTER `language`;

ALTER TABLE `dongtai_webapi`.`iast_asset` ADD COLUMN `parent_dependency_id` int(255) NOT NULL DEFAULT 0 COMMENT '顶级依赖层级' AFTER `dependency_level`;

ALTER TABLE `dongtai_webapi`.`iast_asset` ADD COLUMN `is_del` tinyint(2) NULL DEFAULT 0 COMMENT '0有效1删除' AFTER `parent_dependency_id`;

ALTER TABLE `dongtai_webapi`.`iast_asset` ADD COLUMN `department_id` int(5) NULL DEFAULT 0 COMMENT '部门id' AFTER `is_del`;

ALTER TABLE `dongtai_webapi`.`iast_asset` ADD COLUMN `talent_id` int(5) NULL DEFAULT 0 COMMENT '租户id' AFTER `department_id`;

ALTER TABLE `dongtai_webapi`.`iast_asset` MODIFY COLUMN `signature_value` varchar(255)  NULL DEFAULT NULL COMMENT '签名值' AFTER `signature_algorithm`;

ALTER TABLE `dongtai_webapi`.`iast_asset` MODIFY COLUMN `vul_count` int(11) NULL DEFAULT NULL COMMENT '总漏洞数量' AFTER `level_id`;

ALTER TABLE `dongtai_webapi`.`iast_asset` ADD CONSTRAINT `iast_asset_ibfk_2` FOREIGN KEY (`agent_id`) REFERENCES `dongtai_webapi`.`iast_agent` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `dongtai_webapi`.`iast_asset` ADD CONSTRAINT `iast_asset_ibfk_3` FOREIGN KEY (`level_id`) REFERENCES `dongtai_webapi`.`iast_vul_level` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `dongtai_webapi`.`iast_asset` ADD INDEX `iast_asset_level_id_IDX`(`level_id`, `dt`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_asset` ADD INDEX `idx_pid`(`project_id`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_asset` ADD INDEX `idx_parent_id`(`parent_dependency_id`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_asset` ADD INDEX `iast_asset_user_id_IDX`(`user_id`, `vul_count`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_asset` ADD INDEX `index_user_id_is_del`(`user_id`, `is_del`) USING BTREE;

CREATE TABLE `dongtai_webapi`.`iast_asset_aggr`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `package_name` varchar(255)  NULL DEFAULT NULL COMMENT '第三方包名',
  `signature_value` varchar(255)  NULL DEFAULT NULL COMMENT '签名值',
  `version` varchar(255)  NULL DEFAULT NULL COMMENT '当前版本',
  `safe_version` varchar(255)  NOT NULL DEFAULT '' COMMENT '安全版本',
  `last_version` varchar(255)  NOT NULL DEFAULT '' COMMENT '最新版本',
  `level_id` int(11) NULL DEFAULT NULL COMMENT '漏洞等级',
  `vul_count` int(11) NULL DEFAULT NULL COMMENT '总漏洞数量',
  `vul_critical_count` int(11) NOT NULL DEFAULT 0 COMMENT '严重漏洞数量',
  `vul_high_count` int(11) NOT NULL DEFAULT 0 COMMENT '高危漏洞数',
  `vul_medium_count` int(11) NOT NULL DEFAULT 0 COMMENT '中危漏洞数量',
  `vul_low_count` int(11) NOT NULL DEFAULT 0 COMMENT '低危漏洞数量',
  `vul_info_count` int(11) NOT NULL DEFAULT 0 COMMENT '无风险漏洞数',
  `project_count` int(11) NOT NULL DEFAULT 0 COMMENT '项目数量',
  `license` varchar(255)  NOT NULL DEFAULT '' COMMENT '许可证',
  `language` varchar(255)  NOT NULL DEFAULT '' COMMENT '语言',
  `is_del` tinyint(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `signature_value`(`signature_value`) USING BTREE,
  INDEX `level_id`(`level_id`) USING BTREE
) ENGINE = InnoDB ROW_FORMAT = Dynamic;

CREATE TABLE `dongtai_webapi`.`iast_asset_vul`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vul_name` varchar(255)  NULL DEFAULT NULL COMMENT '关联 iast_aql_info',
  `search_title` varchar(1000)  NULL DEFAULT NULL COMMENT '为搜索引擎准备的标题',
  `vul_detail` text  NULL COMMENT '漏洞详情',
  `level_id` tinyint(2) NULL DEFAULT NULL COMMENT '漏洞等级',
  `license` varchar(50)  NULL DEFAULT NULL COMMENT '漏洞标题+编号(fulltext)',
  `license_level` tinyint(2) NULL DEFAULT NULL COMMENT '可利用性',
  `aql` varchar(255)  NULL DEFAULT NULL COMMENT 'aql 标识',
  `package_name` varchar(255)  NULL DEFAULT NULL,
  `package_hash` varchar(255)  NULL DEFAULT NULL COMMENT '组件hash',
  `package_version` varchar(255)  NULL DEFAULT NULL COMMENT '组件版本',
  `package_safe_version` varchar(255)  NULL DEFAULT NULL COMMENT '组件安全版本',
  `package_latest_version` varchar(255)  NULL DEFAULT NULL COMMENT '组件最新版本',
  `package_language` varchar(10)  NULL DEFAULT NULL COMMENT '组件语言 JAVA\\GO',
  `vul_cve_nums` json NULL COMMENT 'cve 编号 详情',
  `vul_serial` varchar(255)  NULL DEFAULT NULL COMMENT '# 漏洞编号  CWE|CVE等数据',
  `have_article` tinyint(2) NULL DEFAULT 0 COMMENT '1存在分析文章 0 不存在\r\n',
  `have_poc` tinyint(2) NULL DEFAULT 0 COMMENT '1存在可利用poc 0不存在',
  `cve_code` varchar(64)  NULL DEFAULT NULL COMMENT '漏洞CVE编号',
  `cve_id` int(11) NULL DEFAULT NULL COMMENT '漏洞编号关联id',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time_desc` int(11) NULL DEFAULT NULL COMMENT '-更新时间 倒序',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_cve_code`(`cve_code`) USING BTREE,
  INDEX `idx_pkg_hash`(`package_hash`) USING BTREE,
  INDEX `level_update_order_desc`(`level_id`, `update_time`) USING BTREE COMMENT 'level_id desc + update_time desc',
  INDEX `level_update_order_asc`(`level_id`, `update_time_desc`) USING BTREE COMMENT 'level_id asc + update_time_desc',
  INDEX `create_time_order`(`create_time`) USING BTREE COMMENT 'create_time asc / desc',
  INDEX `update_time_order`(`update_time`) USING BTREE COMMENT 'update_time asc/desc ',
  INDEX `package_language_where`(`package_language`) USING BTREE COMMENT 'select language',
  INDEX `have_article_index`(`have_article`) USING BTREE COMMENT 'have_article_index',
  INDEX `have_poc_index`(`have_poc`) USING BTREE COMMENT 'have_poc_index',
  FULLTEXT INDEX `search_index`(`license`) COMMENT 'vul_title+vul_number',
  FULLTEXT INDEX `ft_index_search`(`vul_name`, `aql`, `vul_serial`)
) ENGINE = InnoDB  ROW_FORMAT = Dynamic;

CREATE TABLE `dongtai_webapi`.`iast_asset_vul_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_vul_id` int(11) NULL DEFAULT NULL,
  `asset_id` int(11) NULL DEFAULT NULL,
  `status_id` tinyint(2) NULL DEFAULT 0 COMMENT '组件漏洞状态',
  `is_del` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0有效1删除',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_asset_vul_id`(`asset_vul_id`, `is_del`, `asset_id`) USING BTREE,
  INDEX `is_del_index`(`is_del`) USING BTREE
) ENGINE = InnoDB  ROW_FORMAT = Dynamic;

CREATE TABLE `dongtai_webapi`.`iast_asset_vul_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cwe_id` varchar(20)  NULL DEFAULT NULL COMMENT 'cwe编号',
  `name` varchar(100)  NULL DEFAULT NULL COMMENT '漏洞类型名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB  ROW_FORMAT = Dynamic;

CREATE TABLE `dongtai_webapi`.`iast_asset_vul_type_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_vul_id` int(11) NULL DEFAULT NULL,
  `asset_vul_type_id` int(5) NULL DEFAULT NULL COMMENT '组件漏洞类型id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_id_where`(`asset_vul_type_id`) USING BTREE COMMENT 'type_id in'
) ENGINE = InnoDB  ROW_FORMAT = Dynamic;

CREATE TABLE `dongtai_webapi`.`iast_circuit_configs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200)  NULL DEFAULT NULL,
  `metric_types` varchar(2000)  NULL DEFAULT NULL,
  `targets` varchar(2000)  NULL DEFAULT NULL,
  `system_type` int(11) NULL DEFAULT NULL,
  `is_enable` int(11) NULL DEFAULT NULL,
  `is_deleted` int(11) NULL DEFAULT NULL,
  `deal` int(11) NULL DEFAULT NULL,
  `interval` int(11) NULL DEFAULT NULL,
  `metric_group` int(11) NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `create_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB  ROW_FORMAT = Dynamic;

CREATE TABLE `dongtai_webapi`.`iast_circuit_metrics`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `metric_type` int(11) NULL DEFAULT NULL,
  `measure` varchar(200) NULL DEFAULT NULL,
  `opt` int(11) NULL DEFAULT NULL,
  `value` varchar(200) NULL DEFAULT NULL,
  `circuit_config_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB  ROW_FORMAT = Dynamic;

CREATE TABLE `dongtai_webapi`.`iast_circuit_targets`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_type` int(11) NULL DEFAULT NULL,
  `opt` int(11) NULL DEFAULT NULL,
  `value` varchar(200)  NULL DEFAULT NULL,
  `circuit_config_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB  ROW_FORMAT = Dynamic;

ALTER TABLE `dongtai_webapi`.`iast_errorlog` ADD CONSTRAINT `iast_errorlog_ibfk_2` FOREIGN KEY (`agent_id`) REFERENCES `dongtai_webapi`.`iast_agent` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `dongtai_webapi`.`iast_heartbeat` ADD CONSTRAINT `iast_heartbeat_ibfk_2` FOREIGN KEY (`agent_id`) REFERENCES `dongtai_webapi`.`iast_agent` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `dongtai_webapi`.`iast_hook_type` MODIFY COLUMN `type` int(11) NULL DEFAULT NULL COMMENT '策略总类型，2-source节点、1-propagator节点、3-filter节点、4-sink节点' AFTER `id`;

ALTER TABLE `dongtai_webapi`.`iast_hook_type` MODIFY COLUMN `enable` tinyint(1) NULL DEFAULT NULL COMMENT '状态：1-启用；0-禁用;-1-删除' AFTER `created_by`;

ALTER TABLE `dongtai_webapi`.`iast_http_method` ADD UNIQUE INDEX `iast_http_method_UN`(`method`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_http_method_relation` DROP INDEX `iast_http_method_relation_http_method_id_d25a1696`;

ALTER TABLE `dongtai_webapi`.`iast_message` MODIFY COLUMN `message` varchar(512)  NOT NULL DEFAULT '' AFTER `id`;

ALTER TABLE `dongtai_webapi`.`iast_message` MODIFY COLUMN `relative_url` varchar(512)  NOT NULL DEFAULT '' AFTER `message`;

ALTER TABLE `dongtai_webapi`.`iast_message_type` MODIFY COLUMN `name` varchar(100)  NOT NULL DEFAULT '' AFTER `id`;

ALTER TABLE `dongtai_webapi`.`iast_notify_config` ADD COLUMN `notify_meta_data` json NULL COMMENT '通知相关的元数据，包括，账号、密码、模版等数据' AFTER `notify_type`;

ALTER TABLE `dongtai_webapi`.`iast_notify_config` ADD COLUMN `test_result` tinyint(2) NULL DEFAULT 0 COMMENT '1测试通过，0测试未通过' AFTER `user_id`;

ALTER TABLE `dongtai_webapi`.`iast_notify_config` ADD COLUMN `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间' AFTER `test_result`;

ALTER TABLE `dongtai_webapi`.`iast_notify_config` MODIFY COLUMN `notify_type` tinyint(2) NULL DEFAULT NULL COMMENT '1webhook、2gitlab、3jira、4zendao、5feishu、6weixin、7dingding' AFTER `id`;

ALTER TABLE `dongtai_webapi`.`iast_notify_config` DROP COLUMN `notify_metadata`;

ALTER TABLE `dongtai_webapi`.`iast_profile` MODIFY COLUMN `key` varchar(100)  NOT NULL AFTER `id`;

ALTER TABLE `dongtai_webapi`.`iast_profile` MODIFY COLUMN `value` varchar(100)  NULL DEFAULT NULL AFTER `key`;

ALTER TABLE `dongtai_webapi`.`iast_project` DROP INDEX `iast_project_UN`;

ALTER TABLE `dongtai_webapi`.`iast_project` ADD CONSTRAINT `iast_project_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `dongtai_webapi`.`auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `dongtai_webapi`.`iast_project` ADD CONSTRAINT `iast_project_ibfk_2` FOREIGN KEY (`scan_id`) REFERENCES `dongtai_webapi`.`iast_strategy_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `dongtai_webapi`.`iast_project` ADD INDEX `iast_project_name_IDX`(`name`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_project` ADD INDEX `iast_project_id_IDX`(`id`, `name`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_request_chains` ADD COLUMN `protocol` varchar(100)  NOT NULL DEFAULT '' COMMENT '协议' AFTER `dt`;

ALTER TABLE `dongtai_webapi`.`iast_request_chains` ADD INDEX `iast_request_chains_target_agent_id_IDX`(`target_agent_id`, `source_agent_id`, `request_hash`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_request_chains` ADD INDEX `iast_request_chains_target_id_IDX`(`target_id`, `source_id`, `source_agent_id`, `target_agent_id`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_request_chains` ADD INDEX `iast_request_chains_target_id_source_IDX`(`target_id`, `source_id`, `target_agent_id`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_request_chains` ADD INDEX `iast_request_chains_source_id_IDX`(`source_id`, `source_agent_id`, `target_agent_id`, `request_hash`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_request_chains` ADD INDEX `iast_request_chains_source_agent_id_IDX`(`source_agent_id`, `target_agent_id`, `request_hash`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_request_chains` ADD INDEX `iast_request_chains_request_hash_IDX`(`request_hash`, `source_agent_id`, `target_agent_id`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_request_chains` ADD INDEX `iast_request_chains_request_hash_HASH_IDX`(`request_hash`) USING BTREE;


ALTER TABLE `dongtai_webapi`.`iast_server` ADD COLUMN `protocol` varchar(255)  NOT NULL DEFAULT '' COMMENT 'protocol' AFTER `cluster_version`;

ALTER TABLE `dongtai_webapi`.`iast_server` MODIFY COLUMN `env` TEXT  NULL DEFAULT NULL COMMENT '环境变量' AFTER `command`;

ALTER TABLE `dongtai_webapi`.`iast_server` MODIFY COLUMN `network` varchar(255)  NULL DEFAULT NULL COMMENT '网络情况' AFTER `update_time`;


ALTER TABLE `dongtai_webapi`.`iast_strategy` MODIFY COLUMN `vul_name_en` varchar(255)  NULL DEFAULT NULL AFTER `vul_name_zh`;


ALTER TABLE `dongtai_webapi`.`iast_system` ADD CONSTRAINT `iast_system_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `dongtai_webapi`.`auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;


ALTER TABLE `dongtai_webapi`.`iast_third_party_service` MODIFY COLUMN `port` varchar(255)  NULL DEFAULT NULL COMMENT '端口' AFTER `agent_id`;

ALTER TABLE `dongtai_webapi`.`iast_third_party_service` MODIFY COLUMN `address` varchar(255)  NULL DEFAULT NULL COMMENT '地址' AFTER `port`;

ALTER TABLE `dongtai_webapi`.`iast_third_party_service` MODIFY COLUMN `service_type` varchar(255)  NULL DEFAULT NULL COMMENT '服务类型' AFTER `address`;

CREATE TABLE `dongtai_webapi`.`iast_vul_all`  (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `vul_title` varchar(255)  NULL DEFAULT NULL COMMENT '漏洞标题',
  `vul_number` varchar(255)  NULL DEFAULT NULL COMMENT '漏洞编号',
  `vul_type_name` varchar(255)  NULL DEFAULT NULL COMMENT '漏洞类型名称',
  `availability` tinyint(2) NULL DEFAULT NULL COMMENT '可利用性',
  `language` tinyint(2) NULL DEFAULT NULL COMMENT '探针语言',
  `level_id` tinyint(2) NULL DEFAULT NULL COMMENT '漏洞等级',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `department_id` int(5) NULL DEFAULT 0 COMMENT '部门id',
  `talent_id` int(5) NULL DEFAULT 0 COMMENT '租户id',
  `first_time` int(11) NULL DEFAULT NULL COMMENT '第一次发现时间',
  `last_time` int(11) NULL DEFAULT NULL COMMENT '上一次发现时间',
  `aggregation` varchar(255)  NULL DEFAULT NULL COMMENT '聚合条件',
  `source_type` tinyint(2) NULL DEFAULT 1 COMMENT '漏洞来源 1 应用漏洞 2组件漏洞',
  `source_vul_id` int(11) NULL DEFAULT NULL COMMENT '应用漏洞id/组件漏洞aql_id',
  `is_del` tinyint(2) NULL DEFAULT 0 COMMENT '默认0有效，1已删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `level_index`(`level_id`) USING BTREE,
  INDEX `lang_index`(`language`) USING BTREE,
  INDEX `group_index`(`aggregation`) USING BTREE,
  FULLTEXT INDEX `title_index`(`vul_title`, `vul_number`, `vul_type_name`) WITH PARSER `ngram`
) ENGINE = InnoDB  ROW_FORMAT = Dynamic;

ALTER TABLE `dongtai_webapi`.`iast_vul_integration` AUTO_INCREMENT = 59;

ALTER TABLE `dongtai_webapi`.`iast_vul_integration` ADD COLUMN `asset_vul_id` int(11) NULL DEFAULT NULL COMMENT '组件漏洞id' AFTER `zendao_state`;

CREATE TABLE `dongtai_webapi`.`iast_vul_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `msg` text  NULL COMMENT '日志详情',
  `meta_data` json NULL COMMENT '日志原始数据',
  `datetime` int(11) NULL DEFAULT NULL COMMENT '日志触发时间',
  `user_id` int(11) NULL DEFAULT NULL COMMENT 'user id',
  `asset_vul_id` int(11) NULL DEFAULT NULL COMMENT 'agent id',
  `vul_id` int(11) NULL DEFAULT NULL COMMENT 'vul id',
  `msg_type` int(11) NULL DEFAULT NULL COMMENT '日志类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB  ROW_FORMAT = Dynamic;

ALTER TABLE `dongtai_webapi`.`iast_vul_overpower` ADD CONSTRAINT `iast_vul_overpower_ibfk_2` FOREIGN KEY (`agent_id`) REFERENCES `dongtai_webapi`.`iast_agent` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` ADD COLUMN `level_id_desc` int(11) NOT NULL DEFAULT -1 COMMENT '-1 * level，解决mysql7 mix order无法使用索引的问题' AFTER `level_id`;

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` ADD COLUMN `latest_time_desc` int(11) NOT NULL DEFAULT 0 COMMENT '-1*latest_time,为了解决mysql7中 mix order无法使用索引的问题' AFTER `latest_time`;

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` ADD COLUMN `is_del` tinyint(2) NULL DEFAULT 0 COMMENT '0有效1删除' AFTER `strategy_id`;

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` ADD COLUMN `search_keywords` varchar(1000)  NULL DEFAULT NULL AFTER `is_del`;

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` ADD COLUMN `vul_title` varchar(255)  NULL DEFAULT NULL COMMENT '组合后的漏洞标题' AFTER `search_keywords`;

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` MODIFY COLUMN `taint_value` varchar(4000)  NULL DEFAULT NULL COMMENT '污点值' AFTER `bottom_stack`;

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` DROP COLUMN `type`;

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` ADD CONSTRAINT `iast_vulnerability_ibfk_2` FOREIGN KEY (`agent_id`) REFERENCES `dongtai_webapi`.`iast_agent` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` ADD CONSTRAINT `iast_vulnerability_ibfk_3` FOREIGN KEY (`level_id`) REFERENCES `dongtai_webapi`.`iast_vul_level` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` ADD INDEX `iast_vulnerability_method_pool_id_IDX`(`method_pool_id`, `hook_type_id`, `strategy_id`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` ADD INDEX `status_id_strategy_id_agent_id`(`status_id`, `strategy_id`, `agent_id`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` ADD INDEX `iast_vulnerability_strategy_id_IDX`(`strategy_id`, `hook_type_id`, `http_method`, `uri`, `method_pool_id`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` ADD INDEX `strategy_id_IDX`(`strategy_id`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` ADD INDEX `strategy_id_is_del_IDX`(`strategy_id`, `is_del`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` ADD INDEX `level_id_is_del`(`level_id`, `is_del`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` ADD INDEX `is_del_agent_id`(`is_del`, `agent_id`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` ADD INDEX `is_del_level_id_latest_time`(`level_id`, `latest_time`, `is_del`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` ADD INDEX `level_id_latest_time_desc_order`(`level_id`, `latest_time_desc`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` ADD INDEX `level_id_latest_time_order`(`level_id`, `latest_time`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` ADD INDEX `first_time_order`(`first_time`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` ADD INDEX `latest_time_order`(`latest_time`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` ADD INDEX `status_order`(`status`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` ADD INDEX `iast_vulnerability_agent_id_IDX`(`agent_id`, `level_id`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` ADD FULLTEXT INDEX `ft_index_uri`(`uri`) WITH PARSER `ngram`;

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` ADD FULLTEXT INDEX `ft_index_search_keywords`(`search_keywords`) WITH PARSER `ngram`;

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` ADD FULLTEXT INDEX `ft_index_vul_title`(`vul_title`) WITH PARSER `ngram`;

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` ADD FULLTEXT INDEX `ft_index_http_method`(`http_method`);

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` ADD FULLTEXT INDEX `ft_index_http_protocol`(`http_protocol`);

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` ADD FULLTEXT INDEX `ft_index_top_stack`(`top_stack`);

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` ADD FULLTEXT INDEX `ft_index_bottom_stack`(`bottom_stack`);

ALTER TABLE `dongtai_webapi`.`iast_vulnerability` ADD FULLTEXT INDEX `ft_index_search`(`search_keywords`, `uri`, `vul_title`, `http_method`, `http_protocol`, `top_stack`, `bottom_stack`) WITH PARSER `ngram`;

ALTER TABLE `dongtai_webapi`.`iast_vulnerability_status` MODIFY COLUMN `name` varchar(100)  NOT NULL DEFAULT '' AFTER `id`;

ALTER TABLE `dongtai_webapi`.`iast_vulnerability_status` MODIFY COLUMN `name_zh` varchar(100)  NULL DEFAULT NULL AFTER `name`;

ALTER TABLE `dongtai_webapi`.`iast_vulnerability_status` MODIFY COLUMN `name_en` varchar(100)  NULL DEFAULT NULL AFTER `name_zh`;

ALTER TABLE `dongtai_webapi`.`web_role_button_relation` ADD INDEX `web_role_button_relation_role_id_IDX`(`role_id`, `button_id`) USING BTREE;

ALTER TABLE `dongtai_webapi`.`web_role_url_relation` ADD INDEX `web_role_url_relation_role_id_IDX`(`role_id`, `url_id`) USING BTREE;

DROP TABLE IF EXISTS `dongtai_webapi`.`iast_agent_config_1`;







INSERT INTO `dongtai_webapi`.`web_button` (`id`, `name`, `webroute_id`) VALUES (14, '主动验证', 18);

INSERT INTO `dongtai_webapi`.`web_button` (`id`, `name`, `webroute_id`) VALUES (15, '熔断管理', 18);

UPDATE `dongtai_webapi`.`web_button` SET `name` = '降级配置', `webroute_id` = 18 WHERE `id` = 13;

DELETE FROM `dongtai_webapi`.`web_role_button_relation` WHERE `id` = 104;

DELETE FROM `dongtai_webapi`.`web_role_button_relation` WHERE `id` = 105;

DELETE FROM `dongtai_webapi`.`web_role_button_relation` WHERE `id` = 106;

DELETE FROM `dongtai_webapi`.`web_role_button_relation` WHERE `id` = 107;

DELETE FROM `dongtai_webapi`.`web_role_button_relation` WHERE `id` = 108;

DELETE FROM `dongtai_webapi`.`web_role_button_relation` WHERE `id` = 109;

DELETE FROM `dongtai_webapi`.`web_role_button_relation` WHERE `id` = 110;

DELETE FROM `dongtai_webapi`.`web_role_button_relation` WHERE `id` = 111;

DELETE FROM `dongtai_webapi`.`web_role_button_relation` WHERE `id` = 112;

DELETE FROM `dongtai_webapi`.`web_role_button_relation` WHERE `id` = 113;

INSERT INTO `dongtai_webapi`.`web_role_button_relation` (`id`, `role_id`, `button_id`) VALUES (226, 6, 14);

INSERT INTO `dongtai_webapi`.`web_role_button_relation` (`id`, `role_id`, `button_id`) VALUES (227, 6, 15);

INSERT INTO `dongtai_webapi`.`web_role_button_relation` (`id`, `role_id`, `button_id`) VALUES (228, 6, 1);

INSERT INTO `dongtai_webapi`.`web_role_button_relation` (`id`, `role_id`, `button_id`) VALUES (229, 6, 13);

INSERT INTO `dongtai_webapi`.`web_role_button_relation` (`id`, `role_id`, `button_id`) VALUES (230, 6, 11);

INSERT INTO `dongtai_webapi`.`web_role_button_relation` (`id`, `role_id`, `button_id`) VALUES (231, 6, 2);

INSERT INTO `dongtai_webapi`.`web_role_button_relation` (`id`, `role_id`, `button_id`) VALUES (232, 6, 3);

INSERT INTO `dongtai_webapi`.`web_role_button_relation` (`id`, `role_id`, `button_id`) VALUES (233, 6, 8);

INSERT INTO `dongtai_webapi`.`web_role_button_relation` (`id`, `role_id`, `button_id`) VALUES (234, 6, 9);

INSERT INTO `dongtai_webapi`.`web_role_button_relation` (`id`, `role_id`, `button_id`) VALUES (235, 6, 4);

INSERT INTO `dongtai_webapi`.`web_role_button_relation` (`id`, `role_id`, `button_id`) VALUES (236, 6, 7);

INSERT INTO `dongtai_webapi`.`web_role_button_relation` (`id`, `role_id`, `button_id`) VALUES (237, 6, 6);

INSERT INTO `dongtai_webapi`.`web_role_button_relation` (`id`, `role_id`, `button_id`) VALUES (256, 7, 1);

INSERT INTO `dongtai_webapi`.`web_role_button_relation` (`id`, `role_id`, `button_id`) VALUES (257, 7, 13);

INSERT INTO `dongtai_webapi`.`web_role_button_relation` (`id`, `role_id`, `button_id`) VALUES (258, 7, 11);

INSERT INTO `dongtai_webapi`.`web_role_button_relation` (`id`, `role_id`, `button_id`) VALUES (259, 7, 2);

INSERT INTO `dongtai_webapi`.`web_role_button_relation` (`id`, `role_id`, `button_id`) VALUES (260, 7, 3);

INSERT INTO `dongtai_webapi`.`web_role_button_relation` (`id`, `role_id`, `button_id`) VALUES (261, 7, 8);

INSERT INTO `dongtai_webapi`.`web_role_button_relation` (`id`, `role_id`, `button_id`) VALUES (262, 7, 9);

INSERT INTO `dongtai_webapi`.`web_role_button_relation` (`id`, `role_id`, `button_id`) VALUES (263, 7, 4);

INSERT INTO `dongtai_webapi`.`web_role_button_relation` (`id`, `role_id`, `button_id`) VALUES (264, 7, 7);

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 743;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 744;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 745;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 746;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 747;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 748;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 749;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 750;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 751;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 752;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 753;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 754;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 755;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 756;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 757;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 758;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 759;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 760;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 761;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 762;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 763;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 764;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 765;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 766;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 767;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 768;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 769;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 770;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 771;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 772;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 773;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 774;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 775;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 776;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 777;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 778;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 779;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 780;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 781;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 782;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 783;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 784;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 785;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 786;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 787;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 788;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 789;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 790;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 791;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 792;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 793;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 794;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 795;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 796;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 797;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 798;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 799;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 800;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 801;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 802;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 803;

DELETE FROM `dongtai_webapi`.`web_role_url_relation` WHERE `id` = 804;

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1602, 6, 1);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1603, 6, 2);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1604, 6, 3);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1605, 6, 4);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1606, 6, 5);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1607, 6, 6);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1608, 6, 7);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1609, 6, 8);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1610, 6, 9);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1611, 6, 10);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1612, 6, 11);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1613, 6, 12);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1614, 6, 13);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1615, 6, 14);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1616, 6, 15);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1617, 6, 17);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1618, 6, 18);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1619, 6, 19);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1620, 6, 20);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1621, 6, 21);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1622, 6, 22);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1623, 6, 23);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1624, 6, 24);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1625, 6, 26);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1626, 6, 27);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1627, 6, 28);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1628, 6, 29);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1629, 6, 30);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1630, 6, 33);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1631, 6, 34);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1632, 6, 35);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1633, 6, 36);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1634, 6, 37);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1635, 6, 38);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1636, 6, 39);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1637, 6, 41);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1638, 6, 42);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1639, 6, 43);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1640, 6, 44);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1641, 6, 45);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1642, 6, 46);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1643, 6, 47);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1644, 6, 48);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1645, 6, 49);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1646, 6, 50);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1647, 6, 51);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1708, 7, 1);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1709, 7, 2);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1710, 7, 3);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1711, 7, 4);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1712, 7, 5);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1713, 7, 6);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1714, 7, 9);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1715, 7, 10);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1716, 7, 11);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1717, 7, 12);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1718, 7, 13);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1719, 7, 14);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1720, 7, 15);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1721, 7, 17);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1722, 7, 18);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1723, 7, 19);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1724, 7, 20);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1725, 7, 21);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1726, 7, 22);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1727, 7, 26);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1728, 7, 34);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1729, 7, 42);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1730, 7, 43);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1731, 7, 44);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1732, 7, 45);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1733, 7, 46);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1734, 7, 48);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1735, 7, 49);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1736, 7, 50);

INSERT INTO `dongtai_webapi`.`web_role_url_relation` (`id`, `role_id`, `url_id`) VALUES (1737, 7, 51);

INSERT INTO `dongtai_webapi`.`web_role_user_relation` (`id`, `role_id`, `user_id`) VALUES (16, 6, 3);

INSERT INTO `dongtai_webapi`.`web_role_user_relation` (`id`, `role_id`, `user_id`) VALUES (17, 6, 4);

INSERT INTO `dongtai_webapi`.`web_role_user_relation` (`id`, `role_id`, `user_id`) VALUES (18, 6, 6);

INSERT INTO `dongtai_webapi`.`web_role_user_relation` (`id`, `role_id`, `user_id`) VALUES (19, 6, 13);

INSERT INTO `dongtai_webapi`.`web_role_user_relation` (`id`, `role_id`, `user_id`) VALUES (20, 7, 213);

INSERT INTO `dongtai_webapi`.`web_role_user_relation` (`id`, `role_id`, `user_id`) VALUES (21, 7, 564);

INSERT INTO `dongtai_webapi`.`web_role_user_relation` (`id`, `role_id`, `user_id`) VALUES (22, 6, 566);

INSERT INTO `dongtai_webapi`.`web_role_user_relation` (`id`, `role_id`, `user_id`) VALUES (25, 7, 570);

INSERT INTO `dongtai_webapi`.`web_role_user_relation` (`id`, `role_id`, `user_id`) VALUES (27, 7, 572);

INSERT INTO `dongtai_webapi`.`web_role_user_relation` (`id`, `role_id`, `user_id`) VALUES (30, 7, 573);

INSERT INTO `dongtai_webapi`.`web_role_user_relation` (`id`, `role_id`, `user_id`) VALUES (31, 7, 574);

INSERT INTO `dongtai_webapi`.`web_role_user_relation` (`id`, `role_id`, `user_id`) VALUES (32, 7, 575);

INSERT INTO `dongtai_webapi`.`web_role_user_relation` (`id`, `role_id`, `user_id`) VALUES (33, 6, 576);

INSERT INTO `dongtai_webapi`.`web_role_user_relation` (`id`, `role_id`, `user_id`) VALUES (34, 7, 577);

INSERT INTO `dongtai_webapi`.`web_role_user_relation` (`id`, `role_id`, `user_id`) VALUES (35, 7, 578);

INSERT INTO `dongtai_webapi`.`web_role_user_relation` (`id`, `role_id`, `user_id`) VALUES (36, 7, 579);

INSERT INTO `dongtai_webapi`.`web_role_user_relation` (`id`, `role_id`, `user_id`) VALUES (37, 7, 203);

INSERT INTO `dongtai_webapi`.`web_url_route` (`id`, `path`, `name`, `component`, `meta_keepAlive`, `meta_disabled`, `meta_i18n`, `meta_isMenu`, `parent`, `meta_name`, `redirect`, `name_i18n_zh`, `name_i18n_en`, `name_i18n`) VALUES (47, 'about', 'about', 'views/setting/about.vue', 'False', 'True', 'menu.about', 'False', 6, 'menu.about', '', '', '', '');

INSERT INTO `dongtai_webapi`.`web_url_route` (`id`, `path`, `name`, `component`, `meta_keepAlive`, `meta_disabled`, `meta_i18n`, `meta_isMenu`, `parent`, `meta_name`, `redirect`, `name_i18n_zh`, `name_i18n_en`, `name_i18n`) VALUES (48, 'feishu', 'feishu', 'views/setting/feishu.vue', 'False', 'True', 'menu.feishu', 'False', 6, 'menu.feishu', '', '', '', '');

INSERT INTO `dongtai_webapi`.`web_url_route` (`id`, `path`, `name`, `component`, `meta_keepAlive`, `meta_disabled`, `meta_i18n`, `meta_isMenu`, `parent`, `meta_name`, `redirect`, `name_i18n_zh`, `name_i18n_en`, `name_i18n`) VALUES (49, 'dingding', 'dingding', 'views/setting/dingding.vue', 'False', 'True', 'menu.dingding', 'False', 6, 'menu.dingding', '', '', '', '');

INSERT INTO `dongtai_webapi`.`web_url_route` (`id`, `path`, `name`, `component`, `meta_keepAlive`, `meta_disabled`, `meta_i18n`, `meta_isMenu`, `parent`, `meta_name`, `redirect`, `name_i18n_zh`, `name_i18n_en`, `name_i18n`) VALUES (50, 'weixin', 'weixin', 'views/setting/weixin.vue', 'False', 'True', 'menu.weixin', 'False', 6, 'menu.weixin', '', '', '', '');

INSERT INTO `dongtai_webapi`.`web_url_route` (`id`, `path`, `name`, `component`, `meta_keepAlive`, `meta_disabled`, `meta_i18n`, `meta_isMenu`, `parent`, `meta_name`, `redirect`, `name_i18n_zh`, `name_i18n_en`, `name_i18n`) VALUES (51, 'webhook', 'webhook', 'views/setting/webhook.vue', 'False', 'True', 'menu.webhook', 'False', 6, 'menu.webhook', '', '', '', '');

UPDATE `dongtai_webapi`.`web_url_route` SET `path` = '/taint', `name` = 'taint', `component` = 'views/taint/Index.vue', `meta_keepAlive` = 'True', `meta_disabled` = 'True', `meta_i18n` = 'menu.taintPool', `meta_isMenu` = 'False', `parent` = 0, `meta_name` = '', `redirect` = '/taint/search', `name_i18n_zh` = '', `name_i18n_en` = '', `name_i18n` = '' WHERE `id` = 4;

UPDATE `dongtai_webapi`.`web_url_route` SET `path` = '/setting', `name` = 'setting', `component` = 'views/setting/Index.vue', `meta_keepAlive` = '', `meta_disabled` = '', `meta_i18n` = 'menu.setting', `meta_isMenu` = 'False', `parent` = 0, `meta_name` = '', `redirect` = '/setting/integration', `name_i18n_zh` = '', `name_i18n_en` = '', `name_i18n` = '' WHERE `id` = 6;

UPDATE `dongtai_webapi`.`web_url_route` SET `path` = '/department', `name` = 'department', `component` = 'views/department/Index.vue', `meta_keepAlive` = '', `meta_disabled` = '', `meta_i18n` = 'menu.department', `meta_isMenu` = 'False', `parent` = 0, `meta_name` = '', `redirect` = '/department/departmentList', `name_i18n_zh` = '', `name_i18n_en` = '', `name_i18n` = '' WHERE `id` = 7;

UPDATE `dongtai_webapi`.`web_url_route` SET `path` = '/talent', `name` = 'talent', `component` = 'views/talent/Index.vue', `meta_keepAlive` = '', `meta_disabled` = '', `meta_i18n` = 'menu.talent', `meta_isMenu` = 'True', `parent` = 6, `meta_name` = '', `redirect` = '/talent/talentList', `name_i18n_zh` = '', `name_i18n_en` = '', `name_i18n` = '' WHERE `id` = 8;

UPDATE `dongtai_webapi`.`web_url_route` SET `path` = 'scaDetail/:page/:id', `name` = 'scaDetail/:page/:id', `component` = 'views/sca/ScaDetail.vue', `meta_keepAlive` = '', `meta_disabled` = 'True', `meta_i18n` = 'menu.scaDetail', `meta_isMenu` = '', `parent` = 2, `meta_name` = '', `redirect` = '', `name_i18n_zh` = '', `name_i18n_en` = '', `name_i18n` = '' WHERE `id` = 15;

UPDATE `dongtai_webapi`.`web_url_route` SET `path` = 'agentManage', `name` = 'agentManage', `component` = 'views/setting/AgentManage.vue', `meta_keepAlive` = '', `meta_disabled` = 'True', `meta_i18n` = 'menu.agentManage', `meta_isMenu` = 'True', `parent` = 0, `meta_name` = '', `redirect` = '', `name_i18n_zh` = '', `name_i18n_en` = '', `name_i18n` = '' WHERE `id` = 18;

UPDATE `dongtai_webapi`.`web_url_route` SET `path` = 'sysInfo', `name` = 'sysInfo', `component` = 'views/setting/SysInfo.vue', `meta_keepAlive` = '', `meta_disabled` = '', `meta_i18n` = 'menu.sysInfo', `meta_isMenu` = '', `parent` = 0, `meta_name` = '', `redirect` = '', `name_i18n_zh` = '', `name_i18n_en` = '', `name_i18n` = '' WHERE `id` = 21;

UPDATE `dongtai_webapi`.`web_url_route` SET `path` = 'departmentList', `name` = 'departmentList', `component` = 'views/department/DepartmentList.vue', `meta_keepAlive` = '', `meta_disabled` = '', `meta_i18n` = 'menu.department', `meta_isMenu` = '', `parent` = 6, `meta_name` = 'menu.department', `redirect` = '', `name_i18n_zh` = '', `name_i18n_en` = '', `name_i18n` = '' WHERE `id` = 27;

UPDATE `dongtai_webapi`.`web_url_route` SET `path` = 'talentList', `name` = 'talentList', `component` = 'views/talent/TalentList.vue', `meta_keepAlive` = '', `meta_disabled` = '', `meta_i18n` = 'menu.talent', `meta_isMenu` = '', `parent` = 6, `meta_name` = '', `redirect` = '', `name_i18n_zh` = '', `name_i18n_en` = '', `name_i18n` = '' WHERE `id` = 28;

UPDATE `dongtai_webapi`.`web_url_route` SET `path` = 'userSetting', `name` = 'userSetting', `component` = 'views/department/userSetting.vue', `meta_keepAlive` = '', `meta_disabled` = '', `meta_i18n` = 'menu.userSetting', `meta_isMenu` = '', `parent` = 6, `meta_name` = 'menu.userSetting', `redirect` = '', `name_i18n_zh` = '', `name_i18n_en` = '', `name_i18n` = '' WHERE `id` = 29;

UPDATE `dongtai_webapi`.`web_url_route` SET `path` = 'roleSetting', `name` = 'roleSetting', `component` = 'views/department/roleSetting.vue', `meta_keepAlive` = '', `meta_disabled` = '', `meta_i18n` = 'menu.roleSetting', `meta_isMenu` = '', `parent` = 6, `meta_name` = 'menu.roleSetting', `redirect` = '', `name_i18n_zh` = '', `name_i18n_en` = '', `name_i18n` = '' WHERE `id` = 30;

UPDATE `dongtai_webapi`.`web_url_route` SET `path` = 'agentConfig', `name` = 'agentConfig', `component` = 'views/setting/agentConfig.vue', `meta_keepAlive` = 'False', `meta_disabled` = 'True', `meta_i18n` = 'menu.agentConfig', `meta_isMenu` = 'False', `parent` = 0, `meta_name` = 'menu.agentConfig', `redirect` = '', `name_i18n_zh` = '', `name_i18n_en` = '', `name_i18n` = '' WHERE `id` = 41;


SET FOREIGN_KEY_CHECKS=1;




