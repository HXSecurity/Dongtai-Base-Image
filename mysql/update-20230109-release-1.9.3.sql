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


SET FOREIGN_KEY_CHECKS=1;
