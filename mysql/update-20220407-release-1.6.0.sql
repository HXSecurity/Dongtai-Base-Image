
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE `iast_vul_integration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `vul_id` int(11) DEFAULT NULL COMMENT '漏洞id',
  `gitlab_id` varchar(255) DEFAULT NULL COMMENT 'gitlab_id',
  `gitlab_url` varchar(255) DEFAULT NULL COMMENT 'gitlab_url',
  `gitlab_state` varchar(255) DEFAULT NULL COMMENT 'gitlab_状态',
  `jira_id` varchar(255) DEFAULT NULL COMMENT 'jira_id',
  `jira_url` varchar(255) DEFAULT NULL COMMENT 'jira_url',
  `jira_state` varchar(255) DEFAULT NULL COMMENT 'jira状态',
  `zendao_id` varchar(255) DEFAULT NULL COMMENT '禅道id',
  `zendao_url` varchar(255) DEFAULT NULL COMMENT '禅道url',
  `zendao_state` varchar(255) DEFAULT NULL COMMENT '禅道状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `iast_agent_config_1_UN` (`user_id`,`vul_id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `iast_agent_config_1_user_id_IDX` (`user_id`,`vul_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE iast_webapi_buss_test.iast_agent_config_1 (
	id int(11) auto_increment NOT NULL,
	user_id int(11) NULL COMMENT '用户id',
	vul_id int(11) NULL COMMENT '漏洞id',
	gitlab_id varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'gitlab_id',
	gitlab_url varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'gitlab_url',
	gitlab_state varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'gitlab_状态',
	jira_id varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'jira_id',
	jira_url varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'jira_url',
	jira_state varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'jira状态',
	zendao_id varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '禅道id',
	zendao_url varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '禅道url',
	zendao_state varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '禅道状态',
	CONSTRAINT `PRIMARY` PRIMARY KEY (id),
	CONSTRAINT iast_agent_config_1_UN UNIQUE KEY (user_id,vul_id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci
COMMENT='';
CREATE INDEX user_id USING BTREE ON iast_webapi_buss_test.iast_agent_config_1 (user_id);
CREATE INDEX iast_agent_config_1_user_id_IDX USING BTREE ON iast_webapi_buss_test.iast_agent_config_1 (user_id,vul_id);


SET FOREIGN_KEY_CHECKS=1;