SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE iast_request_chains ADD span_id varchar(255)  NULL COMMENT 'span_id';
ALTER TABLE iast_request_chains ADD parent_span_id varchar(255)  NULL COMMENT 'parent_span_id';

-- dongtai_webapi.iast_request_chains_vul_context definition

CREATE TABLE `iast_request_chains_vul_context` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `vul_id` int(11) DEFAULT NULL COMMENT '来源调用ID',
  `method_pool_id` int(11) DEFAULT NULL COMMENT '目标调用ID',
  `project_id` int(11) DEFAULT NULL COMMENT '项目ID',
  `level_id` int(11) DEFAULT NULL COMMENT '层级ID',
  `stack` json DEFAULT NULL COMMENT '方法池',
  `project_path` varchar(255) DEFAULT NULL COMMENT 'project hash',
  `parent_project_id` int(11) DEFAULT NULL COMMENT '项目ID',
  `request_hash` varchar(255) DEFAULT NULL COMMENT 'request hash',
  PRIMARY KEY (`id`),
  KEY `iast_request_chains_vul_context_vul_id_IDX` (`vul_id`,`method_pool_id`,`project_id`,`level_id`,`project_path`) USING BTREE
);

-- dongtai_webapi.iast_agent_event definition

CREATE TABLE `iast_agent_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE auth_department ADD token varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '部门token';
ALTER TABLE auth_department ADD department_path varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '部门层级';
ALTER TABLE iast_vulnerability ADD project_id int(11) DEFAULT 0 NULL COMMENT '项目ID';
ALTER TABLE iast_vulnerability ADD project_version_id int(11) DEFAULT 0 NULL COMMENT '应用ID';
ALTER TABLE iast_api_route ADD project_id int(11) DEFAULT 0 NULL COMMENT '项目ID';
ALTER TABLE iast_api_route ADD project_version_id int(11) DEFAULT 0 NULL COMMENT '项目版本ID';
ALTER TABLE iast_agent ADD department_id int(11) NULL COMMENT '部门id';
ALTER TABLE iast_project ADD department_id int(11) NULL COMMENT '部门id';
ALTER TABLE iast_vulnerability ADD server_id int(11) DEFAULT 0 NULL COMMENT 'server';
ALTER TABLE iast_vulnerability ADD language varchar(10)  NULL COMMENT 'language';

UPDATE iast_vulnerability iv 
JOIN iast_agent ia  ON iv.agent_id = ia.id 
SET iv.project_id  = ia.bind_project_id  , iv.project_version_id = ia.project_version_id
WHERE 1=1;
UPDATE iast_api_route  iv 
JOIN iast_agent ia  ON iv.agent_id = ia.id 
SET iv.project_id  = ia.bind_project_id  , iv.project_version_id = ia.project_version_id
WHERE 1=1;
UPDATE iast_agent ia 
JOIN auth_user_department aud ON ia.user_id = aud.user_id
SET ia.department_id = aud.department_id WHERE 1=1;
UPDATE iast_project  ia 
JOIN auth_user_department aud ON ia.user_id = aud.user_id
SET ia.department_id = aud.department_id WHERE 1=1;
UPDATE iast_asset ia 
JOIN auth_user_department aud ON ia.user_id = aud.user_id
SET ia.department_id = aud.department_id WHERE 1=1;
UPDATE iast_vulnerability iv
JOIN iast_agent ia ON iv.agent_id = ia.id 
SET iv.server_id = ia.server_id WHERE 1 = 1;
UPDATE iast_vulnerability iv
JOIN iast_agent ia ON iv.agent_id = ia.id 
SET iv.language = ia.language WHERE 1 = 1;


ALTER TABLE iast_agent_method_pool_replay MODIFY COLUMN res_body TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '响应体';
ALTER TABLE iast_agent_method_pool_replay MODIFY COLUMN res_header TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '响应头';
ALTER TABLE iast_agent_method_pool_replay MODIFY COLUMN req_data TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求体';
ALTER TABLE iast_agent_method_pool_replay MODIFY COLUMN req_params TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求参数';
ALTER TABLE iast_agent_method_pool_replay MODIFY COLUMN req_header TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求头';

ALTER TABLE iast_strategy_user ADD department_id int(11) NULL COMMENT '部门id';

UPDATE iast_strategy_user  ia 
JOIN auth_user_department aud ON ia.user_id = aud.user_id
SET ia.department_id = aud.department_id WHERE 1=1;


SET FOREIGN_KEY_CHECKS=1;
