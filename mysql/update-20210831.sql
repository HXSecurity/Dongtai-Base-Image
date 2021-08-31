SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

--
-- Create model HttpMethod
--
CREATE TABLE `iast_http_method` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `method` varchar(100) NOT NULL);
--
-- Create model IastApiMethod
--
CREATE TABLE `iast_api_methods` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `method` varchar(100) NOT NULL);
--
-- Create model IastApiRoute
--
CREATE TABLE `iast_api_route` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `path` varchar(255) NOT NULL, `code_class` varchar(255) NOT NULL, `description` varchar(500) NOT NULL, `code_file` varchar(500) NOT NULL, `controller` varchar(100) NOT NULL, `agent_id` integer NOT NULL, `method_id` integer NOT NULL);
--
-- Create model IastApiResponse
--
CREATE TABLE `iast_api_response` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `return_type` varchar(100) NOT NULL, `route_id` integer NOT NULL);
--
-- Create model IastApiParameter
--
CREATE TABLE `iast_api_parameter` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `name` varchar(100) NOT NULL, `type` varchar(100) NOT NULL, `annotation` varchar(500) NOT NULL, `route_id` integer NOT NULL);
--
-- Create model IastApiMethodHttpMethodRelation
--
CREATE TABLE `iast_http_method_relation` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `api_method_id` integer NOT NULL, `http_method_id` integer NOT NULL);
--
-- Add field http_method to iastapimethod
--
ALTER TABLE iast_agent_method_pool ADD uri_sha1 varchar(40) DEFAULT '' NOT NULL;
--
-- Create index iast_agent__uri_sha_aac6d7_idx on field(s) uri_sha1, http_method, agent of model methodpool
--
CREATE INDEX `iast_agent__uri_sha_aac6d7_idx` ON `iast_agent_method_pool` (`uri_sha1`, `http_method`, `agent_id`);
--
-- Alter unique_together for iastapiroute (1 constraint(s))
--
-- ALTER TABLE `iast_api_route` ADD CONSTRAINT `iast_api_route_path_method_id_7fbc2841_uniq` UNIQUE (`path`, `method_id`);
ALTER TABLE iast_webapi_pre.iast_api_route ADD CONSTRAINT iast_api_route_method_agent_path_uniq UNIQUE KEY (method_id,agent_id,`path`);
--
-- Alter unique_together for iastapiresponse (1 constraint(s))
--
ALTER TABLE `iast_api_response` ADD CONSTRAINT `iast_api_response_return_type_route_id_7e7c48e0_uniq` UNIQUE (`return_type`, `route_id`);
--
-- Alter unique_together for iastapiparameter (1 constraint(s))
--
ALTER TABLE `iast_api_parameter` ADD CONSTRAINT `iast_api_parameter_name_route_id_d9123aff_uniq` UNIQUE (`name`, `route_id`);
--
-- Alter unique_together for iastapimethodhttpmethodrelation (1 constraint(s))
--
ALTER TABLE `iast_http_method_relation` ADD CONSTRAINT `iast_http_method_relatio_api_method_id_http_metho_9680d881_uniq` UNIQUE (`api_method_id`, `http_method_id`);
CREATE INDEX `iast_agent_method_pool_uri_sha1_a64012e4` ON `iast_agent_method_pool` (`uri_sha1`);
CREATE INDEX `iast_agent_method_pool_agent_id_30df78eb` ON `iast_agent_method_pool` (`agent_id`);
CREATE INDEX `iast_api_route_agent_id_80c18e0e` ON `iast_api_route` (`agent_id`);
CREATE INDEX `iast_api_route_method_id_7ff9eb8e` ON `iast_api_route` (`method_id`);
CREATE INDEX `iast_api_response_route_id_ffe61cb5` ON `iast_api_response` (`route_id`);
CREATE INDEX `iast_api_parameter_route_id_5eac0d6c` ON `iast_api_parameter` (`route_id`);
CREATE INDEX `iast_http_method_relation_api_method_id_10ea754d` ON `iast_http_method_relation` (`api_method_id`);
CREATE INDEX `iast_http_method_relation_http_method_id_d25a1696` ON `iast_http_method_relation` (`http_method_id`);
UPDATE iast_agent_method_pool SET uri_sha1 = SHA1(uri) WHERE 1=1;
ALTER TABLE iast_webapi_pre.iast_api_route ADD CONSTRAINT iast_api_route_iast_api_route_path_method_agent_uniq UNIQUE KEY (method_id,agent_id,`path`);
ALTER TABLE iast_webapi_pre.iast_api_route ADD CONSTRAINT iast_api_route_method_agent_path_uniq UNIQUE KEY (method_id,agent_id,`path`);
ALTER TABLE iast_webapi_pre.iast_project_version ADD CONSTRAINT iast_project_version_UN UNIQUE KEY (version_name,project_id);
ALTER TABLE iast_webapi_pre.iast_heartbeat ADD report_queue INT(3) UNSIGNED DEFAULT 0 NOT NULL COMMENT '报告队列';
ALTER TABLE iast_webapi_pre.iast_heartbeat ADD method_queue INT(3) UNSIGNED DEFAULT 0 NOT NULL COMMENT '方法池队列';
ALTER TABLE iast_webapi_pre.iast_heartbeat ADD replay_queue INT(3) UNSIGNED DEFAULT 0 NOT NULL COMMENT '重放队列';
CREATE TABLE `engine_monitoring_indicators` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `key` varchar(100) NOT NULL UNIQUE, `name` varchar(100) NOT NULL, `name_en` varchar(100) NULL, `name_zh` varchar(100) NULL);
ALTER TABLE iast_vulnerability ADD hook_type_id INT UNSIGNED DEFAULT 0 NOT NULL COMMENT '漏洞类型id';



UPDATE iast_vulnerability as v , (SELECT iv.id as iv_id ,iht2.id as iht2_id FROM  iast_vulnerability iv,iast_hook_type iht2 
WHERE iv.`type`  = iht2.name) as tmp
SET hook_type_id  = tmp.iht2_id
WHERE v.id = tmp.iv_id ;

UPDATE iast_vulnerability as v , (SELECT iv.id as iv_id ,iht2.id as iht2_id FROM  iast_vulnerability iv,iast_hook_type iht2 
WHERE iv.`type`  = iht2.name_en) as tmp
SET hook_type_id  = tmp.iht2_id
WHERE v.id = tmp.iv_id and v.hook_type_id = 0;




ALTER TABLE iast_vulnerability ADD status_id INT DEFAULT 0 NOT NULL COMMENT '漏洞状态id';

CREATE TABLE iast_vulnerability_status (
	`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, 
	name varchar(100) DEFAULT '' NOT NULL,
	name_zh varchar(100) NULL,
	name_en varchar(100) NULL
)
INSERT INTO iast_vulnerability_status
(name, name_zh, name_en)
VALUES('待验证', '待验证', 'Pending');
INSERT INTO iast_vulnerability_status
(name, name_zh, name_en)
VALUES('验证中', '验证中', 'Verifying');
INSERT INTO iast_vulnerability_status
(name, name_zh, name_en)
VALUES('已确认', '已确认', 'Confirmed');
INSERT INTO iast_vulnerability_status
(name, name_zh, name_en)
VALUES('已忽略', '已忽略', 'Ignore');
INSERT INTO iast_vulnerability_status
(name, name_zh, name_en)
VALUES('已处理', '已处理', 'Solved');

UPDATE iast_vulnerability as v , (SELECT iv.id as iv_id, ivs.id as ivs_id FROM  iast_vulnerability iv , iast_vulnerability_status ivs
WHERE iv.status  = ivs.name) as tmp
SET status_id = tmp.ivs_id
WHERE v.id = tmp.iv_id ;
UPDATE iast_vulnerability as v , (SELECT iv.id as iv_id, ivs.id as ivs_id FROM  iast_vulnerability iv , iast_vulnerability_status ivs
WHERE iv.status  = ivs.name_en) as tmp
SET status_id = tmp.ivs_id
WHERE v.id = tmp.iv_id AND  status_id = 0;
CREATE INDEX iast_vulnerability_uri_IDX USING BTREE ON dongtai_webapi_.iast_vulnerability (uri,agent_id);


SET FOREIGN_KEY_CHECKS=1;
