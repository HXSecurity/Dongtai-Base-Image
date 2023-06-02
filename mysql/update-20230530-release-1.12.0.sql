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
  KEY `iast_asset_project_InDeX` (`project_id`,`signature_value`,`version`) USING BTREE,
  KEY `idx_pid` (`project_id`) USING BTREE
) ;


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
  KEY `level_id` (`level_id`) USING BTREE
) ;


-- dongtai_webapi.iast_asset_v2_license definition

CREATE TABLE `iast_asset_v2_license` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license_id` int(11) DEFAULT NULL COMMENT 'cwe编号',
  `asset` varchar(255) DEFAULT NULL COMMENT '漏洞类型名称',
  PRIMARY KEY (`id`)
) ;


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
  `vul_type` varchar(255) DEFAULT NULL COMMENT 'iast_aql_info',	
  `vul_codes` json DEFAULT NULL COMMENT 'references',
  PRIMARY KEY (`id`),
  KEY `create_time_order` (`create_time`) USING BTREE,
  KEY `level_update_order_desc` (`level_id`,`update_time`) USING BTREE,
  KEY `update_time_order` (`update_time`) USING BTREE
) ;


-- dongtai_webapi.iast_asset_vul_v2_relation definition

CREATE TABLE `iast_asset_vul_v2_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vul_id` varchar(255) DEFAULT NULL COMMENT 'cwe编号',
  `asset` varchar(255) DEFAULT NULL COMMENT '漏洞类型名称',
  PRIMARY KEY (`id`)
) ;


-- dongtai_webapi.iast_asset_v2_ga_info definition

CREATE TABLE `iast_asset_v2_ga_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_fullname` varchar(255) DEFAULT NULL COMMENT 'ecosystem + packagename',	
  `affected_versions` json DEFAULT NULL COMMENT '最近修复版本',
  `unaffected_versions` json DEFAULT NULL COMMENT '最近修复版本',
  PRIMARY KEY (`id`),
  UNIQUE KEY `iast_asset_vul_type_UN` (`package_fullname`)
);

SET FOREIGN_KEY_CHECKS=1;
