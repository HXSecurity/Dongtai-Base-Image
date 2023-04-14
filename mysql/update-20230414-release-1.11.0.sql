SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE dongtai_webapi.iast_hook_strategy ADD command varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT  NULL  DEFAULT '' COMMENT '污点范围';
ALTER TABLE dongtai_webapi.iast_hook_strategy ADD tags json NULL COMMENT '污点标记';
ALTER TABLE dongtai_webapi.iast_hook_strategy ADD untags json NULL COMMENT '污点反标记';
ALTER TABLE dongtai_webapi.iast_hook_strategy ADD stack_blacklist json NULL COMMENT '调用栈黑名单';


UPDATE iast_hook_strategy ihs SET tags = "[]"
WHERE ihs.tags  IS NULL ; 

UPDATE iast_hook_strategy ihs SET untags = "[]"
WHERE ihs.untags  IS NULL ; 


UPDATE iast_hook_strategy ihs SET stack_blacklist = "[]" WHERE ihs.stack_blacklist IS NULL;

SET FOREIGN_KEY_CHECKS=1;
