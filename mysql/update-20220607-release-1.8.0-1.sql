SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE `iast_aql_info`  (
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

ALTER TABLE `iast_asset_vul` ADD COLUMN `package_fix_version` varchar(255)  NULL DEFAULT NULL COMMENT '当前漏洞修复版本' AFTER `package_version`;
ALTER TABLE `iast_asset_vul` ADD COLUMN `vul_publish_time` datetime NULL DEFAULT NULL COMMENT '漏洞发现时间' AFTER `cve_id`;
ALTER TABLE `iast_asset_vul` ADD COLUMN `vul_update_time` datetime NULL DEFAULT NULL COMMENT '漏洞更新时间' AFTER `vul_publish_time`;
ALTER TABLE `iast_asset_vul` MODIFY COLUMN `cve_id` int(11) NULL DEFAULT 0 COMMENT '漏洞编号关联id' AFTER `cve_code`;
ALTER TABLE `iast_asset_vul_type_relation` ADD INDEX `vul_id_index`(`asset_vul_id`) USING BTREE;
ALTER TABLE `iast_project_report` ADD COLUMN `report_name` varchar(255)  NULL DEFAULT NULL COMMENT '报告名称\r\n' AFTER `create_time`;
ALTER TABLE `iast_project_report` ADD COLUMN `level_png` varchar(255)  NULL DEFAULT NULL COMMENT '漏洞等级汇总图片名称' AFTER `report_name`;
ALTER TABLE `iast_project_report` ADD COLUMN `trend_png` varchar(255)  NULL DEFAULT NULL COMMENT '漏洞趋势图片名称' AFTER `level_png`;
ALTER TABLE `iast_project_report` ADD COLUMN `is_del` tinyint(2) NULL DEFAULT 0 COMMENT '1 删除 0正常' AFTER `trend_png`;
ALTER TABLE `iast_project_report` ADD COLUMN `version_str` text  NULL COMMENT '版本号id拼接' AFTER `is_del`;
ALTER TABLE `iast_project_report` ADD COLUMN `vul_type_str` varchar(255)  NULL DEFAULT NULL COMMENT '应用漏洞类型id拼接' AFTER `version_str`;
ALTER TABLE `iast_project_report` ADD COLUMN `sca_type_str` text  NULL COMMENT '组件漏洞类型id拼接' AFTER `vul_type_str`;
ALTER TABLE `iast_project_report` MODIFY COLUMN `language` varchar(255)  NOT NULL DEFAULT '' COMMENT '语言包：zh或者en' AFTER `sca_type_str`;
ALTER TABLE `iast_project_report` MODIFY COLUMN `project_name` varchar(255)  NULL DEFAULT NULL COMMENT '项目名称' AFTER `language`;
ALTER TABLE `iast_project_report` MODIFY COLUMN `vul_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '漏洞id' AFTER `project_name`;
ALTER TABLE `iast_vulnerability` ADD INDEX `iast_vulnerability_agent_id_strategy_IDX`(`agent_id`, `strategy_id`, `level_id`) USING BTREE;
ALTER TABLE `iast_vulnerability` ADD INDEX `iast_vulnerability_distinct_IDX`(`uri`, `http_method`, `agent_id`, `param_name`, `strategy_id`) USING BTREE;

SET FOREIGN_KEY_CHECKS=1;
