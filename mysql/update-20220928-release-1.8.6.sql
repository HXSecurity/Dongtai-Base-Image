SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE dongtai_webapi.iast_asset_vul_relation ADD vul_asset_metadata_id varchar(256) NOT NULL;

-- dongtai_webapi.iast_asset_vul_relation_metadata definition

CREATE TABLE `iast_asset_vul_relation_metadata` (
  `vul_asset_key` varchar(256) NOT NULL,
  `effected_version_list` json DEFAULT NULL COMMENT '漏洞影响版本',
  `fixed_version_list` json DEFAULT NULL COMMENT '漏洞修复版本',
  `nearest_fixed_version` json DEFAULT NULL COMMENT '最近修复版本',
  `vul_dependency_path` json DEFAULT NULL COMMENT '漏洞依赖',
  PRIMARY KEY (`vul_asset_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


SET FOREIGN_KEY_CHECKS=1;
