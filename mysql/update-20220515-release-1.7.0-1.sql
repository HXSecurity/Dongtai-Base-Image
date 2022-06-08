SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `auth_department` ADD INDEX `auth_department_principal_id_IDX`(`principal_id`) USING BTREE;

CREATE TABLE `auth_group_routes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `routes` json NULL COMMENT '可访问的路由',
  `group_id` int(11) NULL DEFAULT NULL COMMENT '用户组ID',
  `created_by_id` int(11) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `is_active` int(11) NULL DEFAULT NULL COMMENT '是否启用，0-禁用，1-启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 ROW_FORMAT = Dynamic;

ALTER TABLE `auth_user_department` ADD INDEX `auth_user_department_user_id_IDX`(`user_id`, `department_id`) USING BTREE;
ALTER TABLE `auth_user_department` ADD INDEX `auth_user_department_department_id_IDX`(`department_id`, `user_id`) USING BTREE;
ALTER TABLE `engine_monitoring_indicators` MODIFY COLUMN `key` varchar(100)  NOT NULL AFTER `id`;
ALTER TABLE `engine_monitoring_indicators` MODIFY COLUMN `name` varchar(100)  NOT NULL AFTER `key`;
ALTER TABLE `engine_monitoring_indicators` MODIFY COLUMN `name_en` varchar(100)  NULL DEFAULT NULL AFTER `name`;
ALTER TABLE `engine_monitoring_indicators` MODIFY COLUMN `name_zh` varchar(100)  NULL DEFAULT NULL AFTER `name_en`;
ALTER TABLE `iast_agent` MODIFY COLUMN `control` int(1) NULL DEFAULT NULL COMMENT 'agent控制位，1-启动、2-暂停、3-审核通过、0-无控制' AFTER `is_running`;
ALTER TABLE `iast_agent` MODIFY COLUMN `alias` varchar(255)  NOT NULL DEFAULT '' COMMENT 'agent别名' AFTER `language`;
ALTER TABLE `iast_agent` MODIFY COLUMN `is_audit` int(11) NULL DEFAULT 1 COMMENT '是否审核' AFTER `register_time`;
ALTER TABLE `iast_agent` ADD INDEX `iast_agent_bind_project_id_single_IDX`(`bind_project_id`) USING BTREE;
ALTER TABLE `iast_agent` ADD INDEX `iast_agent_id_IDX`(`id`, `bind_project_id`) USING BTREE;
ALTER TABLE `iast_agent` ADD INDEX `bind_project_id_language_IDX`(`bind_project_id`, `language`) USING BTREE;
ALTER TABLE `iast_agent` ADD INDEX `language_IDX`(`language`) USING BTREE;
ALTER TABLE `iast_agent` ADD INDEX `iast_agent_user_id_IDX`(`user_id`, `bind_project_id`) USING BTREE;
ALTER TABLE `iast_agent` ADD INDEX `iast_agent_bind_project_id2_IDX`(`bind_project_id`, `user_id`) USING BTREE;
ALTER TABLE `iast_agent_method_pool` ADD INDEX `iast_agent_method_pool_id_IDX`(`id`, `agent_id`, `http_scheme`) USING BTREE;
ALTER TABLE `iast_agent_method_pool` ADD INDEX `iast_agent_method_pool_http_scheme_IDX`(`http_scheme`) USING BTREE;
ALTER TABLE `iast_api_parameter` MODIFY COLUMN `name` varchar(100)  NOT NULL AFTER `id`;
ALTER TABLE `iast_api_parameter` MODIFY COLUMN `type` varchar(100)  NOT NULL AFTER `name`;
ALTER TABLE `iast_api_parameter` MODIFY COLUMN `annotation` varchar(500)  NOT NULL AFTER `type`;
ALTER TABLE `iast_api_response` MODIFY COLUMN `return_type` varchar(100)  NOT NULL AFTER `id`;
ALTER TABLE `iast_api_route` DROP INDEX `iast_api_route_iast_api_route_path_method_agent_uniq`;
ALTER TABLE `iast_api_route` ADD COLUMN `from_where` int(11) NOT NULL DEFAULT 1 COMMENT '1-agent,2-method_pool' AFTER `method_id`;
ALTER TABLE `iast_api_route` MODIFY COLUMN `path` varchar(255)  NOT NULL AFTER `id`;
ALTER TABLE `iast_api_route` MODIFY COLUMN `code_class` varchar(255)  NOT NULL AFTER `path`;
ALTER TABLE `iast_api_route` MODIFY COLUMN `description` varchar(500)  NOT NULL AFTER `code_class`;
ALTER TABLE `iast_api_route` MODIFY COLUMN `code_file` varchar(500)  NOT NULL AFTER `description`;
ALTER TABLE `iast_api_route` MODIFY COLUMN `controller` varchar(100)  NOT NULL AFTER `code_file`;

CREATE TABLE `iast_aql_info2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 ROW_FORMAT = Dynamic;

ALTER TABLE `iast_asset` ADD COLUMN `safe_version` varchar(255)  NOT NULL DEFAULT '' COMMENT '安全版本' AFTER `version`;
ALTER TABLE `iast_asset` ADD COLUMN `last_version` varchar(255)  NOT NULL DEFAULT '' COMMENT '最新版本' AFTER `safe_version`;
ALTER TABLE `iast_asset` ADD COLUMN `vul_critical_count` int(11) NOT NULL DEFAULT 0 COMMENT '严重漏洞数量' AFTER `vul_count`;
ALTER TABLE `iast_asset` ADD COLUMN `vul_high_count` int(11) NOT NULL DEFAULT 0 COMMENT '高危漏洞数' AFTER `vul_critical_count`;
ALTER TABLE `iast_asset` ADD COLUMN `vul_medium_count` int(11) NOT NULL DEFAULT 0 COMMENT '中危漏洞数量' AFTER `vul_high_count`;
ALTER TABLE `iast_asset` ADD COLUMN `vul_low_count` int(11) NOT NULL DEFAULT 0 COMMENT '低危漏洞数量' AFTER `vul_medium_count`;
ALTER TABLE `iast_asset` ADD COLUMN `vul_info_count` int(11) NULL DEFAULT 0 COMMENT '无风险漏洞数' AFTER `vul_low_count`;
ALTER TABLE `iast_asset` ADD COLUMN `project_id` int(11) NULL DEFAULT 0 COMMENT '项目ID' AFTER `agent_id`;
ALTER TABLE `iast_asset` ADD COLUMN `project_name` varchar(255)  NOT NULL DEFAULT '' COMMENT '项目名称' AFTER `project_id`;
ALTER TABLE `iast_asset` ADD COLUMN `project_version_id` int(11) NOT NULL DEFAULT 0 COMMENT '项目版本id' AFTER `project_name`;
ALTER TABLE `iast_asset` ADD COLUMN `user_id` int(11) NULL DEFAULT 0 COMMENT '用户ID' AFTER `project_version_id`;
ALTER TABLE `iast_asset` ADD COLUMN `license` varchar(255)  NOT NULL DEFAULT '' COMMENT '许可证' AFTER `user_id`;
ALTER TABLE `iast_asset` ADD COLUMN `language` varchar(255)  NOT NULL DEFAULT '' COMMENT '语言' AFTER `license`;
ALTER TABLE `iast_asset` ADD COLUMN `dependency_level` int(255) NOT NULL DEFAULT 0 COMMENT '依赖层级' AFTER `language`;
ALTER TABLE `iast_asset` ADD COLUMN `parent_dependency_id` int(255) NOT NULL DEFAULT 0 COMMENT '顶级依赖层级' AFTER `dependency_level`;
ALTER TABLE `iast_asset` ADD COLUMN `is_del` tinyint(2) NULL DEFAULT 0 COMMENT '0有效1删除' AFTER `parent_dependency_id`;
ALTER TABLE `iast_asset` ADD COLUMN `department_id` int(5) NULL DEFAULT 0 COMMENT '部门id' AFTER `is_del`;
ALTER TABLE `iast_asset` ADD COLUMN `talent_id` int(5) NULL DEFAULT 0 COMMENT '租户id' AFTER `department_id`;
ALTER TABLE `iast_asset` MODIFY COLUMN `signature_value` varchar(255)  NULL DEFAULT NULL COMMENT '签名值' AFTER `signature_algorithm`;
ALTER TABLE `iast_asset` MODIFY COLUMN `vul_count` int(11) NULL DEFAULT NULL COMMENT '总漏洞数量' AFTER `level_id`;
ALTER TABLE `iast_asset` ADD INDEX `iast_asset_level_id_IDX`(`level_id`, `dt`) USING BTREE;
ALTER TABLE `iast_asset` ADD INDEX `idx_pid`(`project_id`) USING BTREE;
ALTER TABLE `iast_asset` ADD INDEX `idx_parent_id`(`parent_dependency_id`) USING BTREE;
ALTER TABLE `iast_asset` ADD INDEX `iast_asset_user_id_IDX`(`user_id`, `vul_count`) USING BTREE;
ALTER TABLE `iast_asset` ADD INDEX `index_user_id_is_del`(`user_id`, `is_del`) USING BTREE;

CREATE TABLE `iast_asset_aggr`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 ROW_FORMAT = Dynamic;

CREATE TABLE `iast_asset_vul`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 ROW_FORMAT = Dynamic;

CREATE TABLE `iast_asset_vul_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_vul_id` int(11) NULL DEFAULT NULL,
  `asset_id` int(11) NULL DEFAULT NULL,
  `status_id` tinyint(2) NULL DEFAULT 0 COMMENT '组件漏洞状态',
  `is_del` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0有效1删除',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_asset_vul_id`(`asset_vul_id`, `is_del`, `asset_id`) USING BTREE,
  INDEX `is_del_index`(`is_del`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 ROW_FORMAT = Dynamic;

CREATE TABLE `iast_asset_vul_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cwe_id` varchar(20)  NULL DEFAULT NULL COMMENT 'cwe编号',
  `name` varchar(100)  NULL DEFAULT NULL COMMENT '漏洞类型名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 ROW_FORMAT = Dynamic;

CREATE TABLE `iast_asset_vul_type_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_vul_id` int(11) NULL DEFAULT NULL,
  `asset_vul_type_id` int(5) NULL DEFAULT NULL COMMENT '组件漏洞类型id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_id_where`(`asset_vul_type_id`) USING BTREE COMMENT 'type_id in'
) ENGINE = InnoDB AUTO_INCREMENT = 1 ROW_FORMAT = Dynamic;

CREATE TABLE `iast_circuit_configs`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 ROW_FORMAT = Dynamic;

CREATE TABLE `iast_circuit_metrics`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `metric_type` int(11) NULL DEFAULT NULL,
  `measure` varchar(200) NULL DEFAULT NULL,
  `opt` int(11) NULL DEFAULT NULL,
  `value` varchar(200) NULL DEFAULT NULL,
  `circuit_config_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 ROW_FORMAT = Dynamic;

CREATE TABLE `iast_circuit_targets`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_type` int(11) NULL DEFAULT NULL,
  `opt` int(11) NULL DEFAULT NULL,
  `value` varchar(200)  NULL DEFAULT NULL,
  `circuit_config_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 ROW_FORMAT = Dynamic;

ALTER TABLE `iast_hook_type` MODIFY COLUMN `type` int(11) NULL DEFAULT NULL COMMENT '策略总类型，2-source节点、1-propagator节点、3-filter节点、4-sink节点' AFTER `id`;
ALTER TABLE `iast_hook_type` MODIFY COLUMN `enable` tinyint(1) NULL DEFAULT NULL COMMENT '状态：1-启用；0-禁用;-1-删除' AFTER `created_by`;
ALTER TABLE `iast_http_method` ADD UNIQUE INDEX `iast_http_method_UN`(`method`) USING BTREE;
ALTER TABLE `iast_http_method_relation` DROP INDEX `iast_http_method_relation_http_method_id_d25a1696`;
ALTER TABLE `iast_message` MODIFY COLUMN `message` varchar(512)  NOT NULL DEFAULT '' AFTER `id`;
ALTER TABLE `iast_message` MODIFY COLUMN `relative_url` varchar(512)  NOT NULL DEFAULT '' AFTER `message`;
ALTER TABLE `iast_message_type` MODIFY COLUMN `name` varchar(100)  NOT NULL DEFAULT '' AFTER `id`;
ALTER TABLE `iast_notify_config` ADD COLUMN `notify_meta_data` json NULL COMMENT '通知相关的元数据，包括，账号、密码、模版等数据' AFTER `notify_type`;
ALTER TABLE `iast_notify_config` ADD COLUMN `test_result` tinyint(2) NULL DEFAULT 0 COMMENT '1测试通过，0测试未通过' AFTER `user_id`;
ALTER TABLE `iast_notify_config` ADD COLUMN `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间' AFTER `test_result`;
ALTER TABLE `iast_notify_config` MODIFY COLUMN `notify_type` tinyint(2) NULL DEFAULT NULL COMMENT '1webhook、2gitlab、3jira、4zendao、5feishu、6weixin、7dingding' AFTER `id`;
ALTER TABLE `iast_notify_config` DROP COLUMN `notify_metadata`;
ALTER TABLE `iast_profile` MODIFY COLUMN `key` varchar(100)  NOT NULL AFTER `id`;
ALTER TABLE `iast_profile` MODIFY COLUMN `value` varchar(100)  NULL DEFAULT NULL AFTER `key`;
ALTER TABLE `iast_project` DROP INDEX `iast_project_UN`;
ALTER TABLE `iast_project` ADD INDEX `iast_project_name_IDX`(`name`) USING BTREE;
ALTER TABLE `iast_project` ADD INDEX `iast_project_id_IDX`(`id`, `name`) USING BTREE;
ALTER TABLE `iast_request_chains` ADD COLUMN `protocol` varchar(100)  NOT NULL DEFAULT '' COMMENT '协议' AFTER `dt`;
ALTER TABLE `iast_request_chains` ADD INDEX `iast_request_chains_target_agent_id_IDX`(`target_agent_id`, `source_agent_id`, `request_hash`) USING BTREE;
ALTER TABLE `iast_request_chains` ADD INDEX `iast_request_chains_target_id_IDX`(`target_id`, `source_id`, `source_agent_id`, `target_agent_id`) USING BTREE;
ALTER TABLE `iast_request_chains` ADD INDEX `iast_request_chains_target_id_source_IDX`(`target_id`, `source_id`, `target_agent_id`) USING BTREE;
ALTER TABLE `iast_request_chains` ADD INDEX `iast_request_chains_source_id_IDX`(`source_id`, `source_agent_id`, `target_agent_id`, `request_hash`) USING BTREE;
ALTER TABLE `iast_request_chains` ADD INDEX `iast_request_chains_source_agent_id_IDX`(`source_agent_id`, `target_agent_id`, `request_hash`) USING BTREE;
ALTER TABLE `iast_request_chains` ADD INDEX `iast_request_chains_request_hash_IDX`(`request_hash`, `source_agent_id`, `target_agent_id`) USING BTREE;
ALTER TABLE `iast_request_chains` ADD INDEX `iast_request_chains_request_hash_HASH_IDX`(`request_hash`) USING BTREE;
ALTER TABLE `iast_server` ADD COLUMN `protocol` varchar(255)  NOT NULL DEFAULT '' COMMENT 'protocol' AFTER `cluster_version`;
ALTER TABLE `iast_server` MODIFY COLUMN `env` TEXT  NULL DEFAULT NULL COMMENT '环境变量' AFTER `command`;
ALTER TABLE `iast_server` MODIFY COLUMN `network` varchar(255)  NULL DEFAULT NULL COMMENT '网络情况' AFTER `update_time`;
ALTER TABLE `iast_strategy` MODIFY COLUMN `vul_name_en` varchar(255)  NULL DEFAULT NULL AFTER `vul_name_zh`;
ALTER TABLE `iast_third_party_service` MODIFY COLUMN `port` varchar(255)  NULL DEFAULT NULL COMMENT '端口' AFTER `agent_id`;
ALTER TABLE `iast_third_party_service` MODIFY COLUMN `address` varchar(255)  NULL DEFAULT NULL COMMENT '地址' AFTER `port`;
ALTER TABLE `iast_third_party_service` MODIFY COLUMN `service_type` varchar(255)  NULL DEFAULT NULL COMMENT '服务类型' AFTER `address`;
CREATE TABLE `iast_vul_all`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 ROW_FORMAT = Dynamic;
ALTER TABLE `iast_vul_integration` ADD COLUMN `asset_vul_id` int(11) NULL DEFAULT NULL COMMENT '组件漏洞id' AFTER `zendao_state`;
CREATE TABLE `iast_vul_log`  (
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
ALTER TABLE `iast_vulnerability` ADD COLUMN `level_id_desc` int(11) NOT NULL DEFAULT -1 COMMENT '-1 * level，解决mysql7 mix order无法使用索引的问题' AFTER `level_id`;
ALTER TABLE `iast_vulnerability` ADD COLUMN `latest_time_desc` int(11) NOT NULL DEFAULT 0 COMMENT '-1*latest_time,为了解决mysql7中 mix order无法使用索引的问题' AFTER `latest_time`;
ALTER TABLE `iast_vulnerability` ADD COLUMN `is_del` tinyint(2) NULL DEFAULT 0 COMMENT '0有效1删除' AFTER `strategy_id`;
ALTER TABLE `iast_vulnerability` ADD COLUMN `search_keywords` varchar(1000)  NULL DEFAULT NULL AFTER `is_del`;
ALTER TABLE `iast_vulnerability` ADD COLUMN `vul_title` varchar(255)  NULL DEFAULT NULL COMMENT '组合后的漏洞标题' AFTER `search_keywords`;
ALTER TABLE `iast_vulnerability` MODIFY COLUMN `taint_value` varchar(4000)  NULL DEFAULT NULL COMMENT '污点值' AFTER `bottom_stack`;
ALTER TABLE `iast_vulnerability` DROP COLUMN `type`;
ALTER TABLE `iast_vulnerability` ADD INDEX `iast_vulnerability_method_pool_id_IDX`(`method_pool_id`, `hook_type_id`, `strategy_id`) USING BTREE;
ALTER TABLE `iast_vulnerability` ADD INDEX `status_id_strategy_id_agent_id`(`status_id`, `strategy_id`, `agent_id`) USING BTREE;
ALTER TABLE `iast_vulnerability` ADD INDEX `iast_vulnerability_strategy_id_IDX`(`strategy_id`, `hook_type_id`, `http_method`, `uri`, `method_pool_id`) USING BTREE;
ALTER TABLE `iast_vulnerability` ADD INDEX `strategy_id_IDX`(`strategy_id`) USING BTREE;
ALTER TABLE `iast_vulnerability` ADD INDEX `strategy_id_is_del_IDX`(`strategy_id`, `is_del`) USING BTREE;
ALTER TABLE `iast_vulnerability` ADD INDEX `level_id_is_del`(`level_id`, `is_del`) USING BTREE;
ALTER TABLE `iast_vulnerability` ADD INDEX `is_del_agent_id`(`is_del`, `agent_id`) USING BTREE;
ALTER TABLE `iast_vulnerability` ADD INDEX `is_del_level_id_latest_time`(`level_id`, `latest_time`, `is_del`) USING BTREE;
ALTER TABLE `iast_vulnerability` ADD INDEX `level_id_latest_time_desc_order`(`level_id`, `latest_time_desc`) USING BTREE;
ALTER TABLE `iast_vulnerability` ADD INDEX `level_id_latest_time_order`(`level_id`, `latest_time`) USING BTREE;
ALTER TABLE `iast_vulnerability` ADD INDEX `first_time_order`(`first_time`) USING BTREE;
ALTER TABLE `iast_vulnerability` ADD INDEX `latest_time_order`(`latest_time`) USING BTREE;
ALTER TABLE `iast_vulnerability` ADD INDEX `status_order`(`status`) USING BTREE;
ALTER TABLE `iast_vulnerability` ADD INDEX `iast_vulnerability_agent_id_IDX`(`agent_id`, `level_id`) USING BTREE;
ALTER TABLE `iast_vulnerability` ADD FULLTEXT INDEX `ft_index_uri`(`uri`) WITH PARSER `ngram`;
ALTER TABLE `iast_vulnerability` ADD FULLTEXT INDEX `ft_index_search_keywords`(`search_keywords`) WITH PARSER `ngram`;
ALTER TABLE `iast_vulnerability` ADD FULLTEXT INDEX `ft_index_vul_title`(`vul_title`) WITH PARSER `ngram`;
ALTER TABLE `iast_vulnerability` ADD FULLTEXT INDEX `ft_index_http_method`(`http_method`);
ALTER TABLE `iast_vulnerability` ADD FULLTEXT INDEX `ft_index_http_protocol`(`http_protocol`);
ALTER TABLE `iast_vulnerability` ADD FULLTEXT INDEX `ft_index_top_stack`(`top_stack`);
ALTER TABLE `iast_vulnerability` ADD FULLTEXT INDEX `ft_index_bottom_stack`(`bottom_stack`);
ALTER TABLE `iast_vulnerability` ADD FULLTEXT INDEX `ft_index_search`(`search_keywords`, `uri`, `vul_title`, `http_method`, `http_protocol`, `top_stack`, `bottom_stack`) WITH PARSER `ngram`;
ALTER TABLE `iast_vulnerability_status` MODIFY COLUMN `name` varchar(100)  NOT NULL DEFAULT '' AFTER `id`;
ALTER TABLE `iast_vulnerability_status` MODIFY COLUMN `name_zh` varchar(100)  NULL DEFAULT NULL AFTER `name`;
ALTER TABLE `iast_vulnerability_status` MODIFY COLUMN `name_en` varchar(100)  NULL DEFAULT NULL AFTER `name_zh`;
ALTER TABLE `web_role_button_relation` ADD INDEX `web_role_button_relation_role_id_IDX`(`role_id`, `button_id`) USING BTREE;
ALTER TABLE `web_role_url_relation` ADD INDEX `web_role_url_relation_role_id_IDX`(`role_id`, `url_id`) USING BTREE;
ALTER TABLE `iast_project` ADD UNIQUE INDEX `iast_project_UN`(`name`, `user_id`) USING BTREE;
ALTER TABLE iast_server MODIFY COLUMN network TEXT NULL COMMENT '网络情况';
ALTER TABLE iast_replay_queue ADD payload_id int(11) DEFAULT -1 NOT NULL COMMENT 'Payload ID，外键';
CREATE TABLE `iast_vul_recheck_payload` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
`value` varchar(255) NOT NULL,
`status` integer NOT NULL,
`create_time` integer NULL,
`language_id` integer NOT NULL,
`strategy_id` integer NULL,
`user_id` integer NULL);


SET FOREIGN_KEY_CHECKS=1;