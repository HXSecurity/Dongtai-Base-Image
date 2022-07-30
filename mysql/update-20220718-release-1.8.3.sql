SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;


ALTER TABLE iast_vulnerability MODIFY COLUMN hook_type_id INT(11) DEFAULT 0 NOT NULL COMMENT '漏洞类型id';



ALTER TABLE iast_agent ADD actual_running_status int(11) DEFAULT 1 NOT NULL COMMENT '实际运行状态';
ALTER TABLE iast_agent ADD except_running_status int(11) DEFAULT 1 NOT NULL COMMENT '期望运行状态';
ALTER TABLE iast_agent ADD state_status int(11) DEFAULT 1 NOT NULL COMMENT 'Agent位置状态的原因';


UPDATE iast_agent  SET actual_running_status = 1
WHERE is_core_running  = 1 and online = 1 ;

UPDATE iast_agent  SET actual_running_status = 2
WHERE is_core_running  = 0 and online = 1;


UPDATE iast_agent  SET except_running_status = 1
WHERE control  = 3 and is_control = 1;

UPDATE iast_agent  SET except_running_status = 2
WHERE control  = 4 and is_control = 1;

UPDATE iast_agent SET except_running_status  = actual_running_status
WHERE online = 0;


ALTER TABLE iast_asset_vul_relation ADD effected_version_list json NULL COMMENT '漏洞影响版本';
ALTER TABLE iast_asset_vul_relation ADD fixed_version_list json NULL COMMENT '漏洞修复版本';
ALTER TABLE iast_asset_vul_relation ADD nearest_fixed_version json NULL COMMENT '最近修复版本';
ALTER TABLE iast_asset_vul_relation ADD vul_dependency_path json NULL COMMENT '漏洞依赖';
ALTER TABLE iast_asset ADD safe_version_list json NULL COMMENT '漏洞安全版本';
ALTER TABLE iast_asset ADD nearest_safe_version json NULL COMMENT '最近版本';
ALTER TABLE iast_asset_vul ADD sid varchar(64) DEFAULT '' NULL COMMENT '漏洞唯一编号';
ALTER TABLE iast_asset ADD latest_safe_version json NULL COMMENT '最新版本';

SET FOREIGN_KEY_CHECKS = 1;

