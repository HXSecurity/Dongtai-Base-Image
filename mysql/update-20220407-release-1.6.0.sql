
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

CREATE TABLE iast_agent_config_1 (
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
CREATE INDEX user_id USING BTREE ON iast_agent_config_1 (user_id);
CREATE INDEX iast_agent_config_1_user_id_IDX USING BTREE ON iast_agent_config_1 (user_id,vul_id);

INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(42, 'integration', 'integration', 'views/setting/integration.vue', 'False', 'False', 'menu.integration', 'False', 6, 'menu.integration', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(43, 'jira', 'jira', 'views/setting/jira.vue', 'False', 'True', 'menu.jira', 'False', 6, 'menu.jira', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(44, 'chandao', 'chandao', 'views/setting/chandao.vue', 'False', 'True', 'menu.chandao', 'False', 6, 'menu.chandao', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(45, 'gitlab', 'gitlab', 'views/setting/gitlab.vue', 'False', 'True', 'menu.gitlab', 'False', 6, 'menu.gitlab', '', '', '', '');
INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(46, 'jenkins', 'jenkins', 'views/setting/jenkins.vue', 'False', 'True', 'menu.jenkins', 'False', 6, 'menu.jenkins', '', '', '', '');
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 42);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 43);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 44);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 45);
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 46);




SET FOREIGN_KEY_CHECKS=1;
