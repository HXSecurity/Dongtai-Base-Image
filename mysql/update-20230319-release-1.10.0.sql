
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

-- dongtai_webapi.iast_dast_integration definition

CREATE TABLE `iast_dast_integration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `detail` text,
  `vul_level_id` int(11) DEFAULT NULL,
  `payload` varchar(255) DEFAULT '',
  `target` varchar(255) DEFAULT NULL,
  `vul_type` varchar(255) DEFAULT NULL,
  `dast_tag` varchar(255) DEFAULT NULL,
  `request_messages` json DEFAULT NULL,
  `urls` json DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `latest_time` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `project_version_id` int(11) DEFAULT NULL,
  `vul_name` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `iast_dast_integration_id_IDX` (`id`,`vul_level_id`,`project_id`,`project_version_id`,`create_time`,`latest_time`,`target`,`vul_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;


INSERT INTO dongtai_webapi.web_url_route
(id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n)
VALUES(61, 'ScanDetail/:page/:id', 'ScanDetail/:page/:id', 'views/sca/ScanDetail.vue', 'False', 'False', 'menu.scanDetail', 'False', 2, 'menu.scanDetail', '', '', '', '');


SET @SuperUserId = (SELECT `id` FROM web_role wr
WHERE name = '超级管理员'); 

SET @GroupUserId = (SELECT `id` FROM web_role wr
WHERE name = '组织管理员'); 

SET @NormalUserId = (SELECT `id` FROM web_role wr
WHERE name = '普通用户'); 

INSERT INTO dongtai_webapi.web_role_url_relation
(role_id, url_id)
VALUES(@SuperUserId, 61);
INSERT INTO dongtai_webapi.web_role_url_relation
( role_id, url_id)
VALUES(@GroupUserId, 61);
INSERT INTO dongtai_webapi.web_role_url_relation
(role_id, url_id)
VALUES(@NormalUserId, 61);


-- dongtai_webapi.iast_dast_integration_1 definition

CREATE TABLE `iast_dast_integration_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iastvul_id` int(11) DEFAULT NULL,
  `dastvul_id` int(11) DEFAULT NULL,
  `dt_mark` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `iast_dast_integration_relation_iastvul_id_IDX` (`iastvul_id`,`dastvul_id`,`dt_mark`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


ALTER TABLE iast_dast_integration ADD dongtai_vul_type json NULL;

CREATE TABLE iast_iast_dtmatk_relation (
	id int(11) auto_increment NOT NULL,
	iastvul_id int(11) NULL,
	dt_mark varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' NULL,
	CONSTRAINT `PRIMARY` PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COMMENT='';

CREATE TABLE iast_dast_dtmatk_relation (
	id int(11) auto_increment NOT NULL,
	dastvul_id int(11) NULL,
	dt_mark varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' NULL,
	CONSTRAINT `PRIMARY` PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COMMENT='';

ALTER TABLE iast_project ADD enable_log int(11) NULL COMMENT '开启日志';
ALTER TABLE iast_project ADD log_level varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '日志等级';

SET FOREIGN_KEY_CHECKS=1;
