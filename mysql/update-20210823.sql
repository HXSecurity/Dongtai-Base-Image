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
