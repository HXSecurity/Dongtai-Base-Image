
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;



ALTER TABLE web_url_route ADD CONSTRAINT web_url_route_UN UNIQUE KEY (name);
ALTER TABLE web_button ADD CONSTRAINT web_button_UN UNIQUE KEY (name,webroute_id);
ALTER TABLE sca_maven_db ADD `import_from` INT DEFAULT 1 NOT NULL;
ALTER TABLE iast_project ADD base_url varchar(512) DEFAULT '' NOT NULL;
ALTER TABLE iast_project ADD test_req_header_key varchar(512) DEFAULT '' NOT NULL;
ALTER TABLE iast_project ADD test_req_header_value varchar(512) DEFAULT '' NOT NULL;
CREATE INDEX iast_hook_type_type_IDX USING BTREE ON iast_hook_type (`type`,created_by,enable);
CREATE TABLE `iast_project_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `agent_id` int(11) NOT NULL COMMENT 'Agent',
  `header_type` int(11) NOT NULL DEFAULT '0' COMMENT 'Agent',
  PRIMARY KEY (`id`),
  UNIQUE KEY `iast_project_header_UN` (`header_type`,`agent_id`,`key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4

SET FOREIGN_KEY_CHECKS=1;
