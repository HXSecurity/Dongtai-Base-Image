SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

CREATE INDEX iast_api_route_project_id_is_cover_IDX USING BTREE ON iast_api_route (project_id,project_version_id,is_cover,method_id);
CREATE INDEX iast_api_route_project_version_id_IDX USING BTREE ON iast_api_route (project_version_id,method_id,`path`);
CREATE INDEX iast_api_methods_id_IDX USING BTREE ON iast_api_methods (id,`method`);
CREATE INDEX iast_api_route_project_id_IDX_temp USING BTREE ON iast_api_route (project_id,project_version_id,method_id,`path`);
DELETE FROM iast_api_route WHERE id NOT IN (SELECT MAX(id) GROUP BY project_id ,project_version_id ,method_id ,`path` );
ALTER TABLE iast_api_route ADD CONSTRAINT iast_api_route_UN UNIQUE KEY (project_id,project_version_id,method_id,`path`);
CREATE INDEX iast_api_route_project_id_IDX USING BTREE ON iast_api_route (project_id,project_version_id,from_where,is_cover,method_id,`path`);
ALTER TABLE iast_hook_strategy ADD command varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT  NULL  DEFAULT '' COMMENT '污点范围';
ALTER TABLE iast_hook_strategy ADD tags json NULL COMMENT '污点标记';
ALTER TABLE iast_hook_strategy ADD untags json NULL COMMENT '污点反标记';
ALTER TABLE iast_hook_strategy ADD stack_blacklist json NULL COMMENT '调用栈黑名单';


UPDATE iast_hook_strategy ihs SET tags = "[]"
WHERE ihs.tags  IS NULL ; 

UPDATE iast_hook_strategy ihs SET untags = "[]"
WHERE ihs.untags  IS NULL ; 


UPDATE iast_hook_strategy ihs SET stack_blacklist = "[]" WHERE ihs.stack_blacklist IS NULL;

-- dongtai_webapi.iast_recoginze_rule definition

CREATE TABLE `iast_recoginze_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `rule_detail` varchar(255) NOT NULL DEFAULT '',
  `rule_type` int(11) NOT NULL DEFAULT '0',
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iast_recoginze_rule_project_id_IDX` (`project_id`,`rule_type`,`updated`,`rule_detail`) USING BTREE,
  KEY `iast_recoginze_rule_project_id_IDX2` (`project_id`,`rule_type`,`rule_detail`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
ALTER TABLE iast_agent ADD allow_report INT DEFAULT 1 NOT NULL;

SET FOREIGN_KEY_CHECKS=1;
