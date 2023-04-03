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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO web_url_route
(id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n)
VALUES(61, 'ScanDetail/:page/:id', 'ScanDetail/:page/:id', 'views/sca/ScanDetail.vue', 'False', 'False', 'menu.scanDetail', 'False', 2, 'menu.scanDetail', '', '', '', '');


SET @SuperUserId = (SELECT `id` FROM web_role wr
WHERE name = '超级管理员'); 

SET @GroupUserId = (SELECT `id` FROM web_role wr
WHERE name = '组织管理员'); 

SET @NormalUserId = (SELECT `id` FROM web_role wr
WHERE name = '普通用户'); 

INSERT INTO web_role_url_relation
(role_id, url_id)
VALUES(@SuperUserId, 61);
INSERT INTO web_role_url_relation
( role_id, url_id)
VALUES(@GroupUserId, 61);
INSERT INTO web_role_url_relation
(role_id, url_id)
VALUES(@NormalUserId, 61);

CREATE TABLE `iast_dast_integration_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iastvul_id` int(11) DEFAULT NULL,
  `dastvul_id` int(11) DEFAULT NULL,
  `dt_mark` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `iast_dast_integration_relation_iastvul_id_IDX` (`iastvul_id`,`dastvul_id`,`dt_mark`) USING BTREE
) ;


CREATE INDEX iast_asset_IDX USING BTREE ON iast_asset (department_id,is_del,license,signature_value);

CREATE INDEX iast_asset_level__InDeX USING BTREE ON iast_asset (department_id,is_del,level_id,signature_value);

CREATE INDEX iast_asset_language_InDeX USING BTREE ON iast_asset (department_id,is_del,language,signature_value);

CREATE INDEX iast_asset_project_InDeX USING BTREE ON iast_asset (project_id,signature_value,version);

ALTER TABLE iast_dast_integration ADD dongtai_vul_type json NULL;

CREATE TABLE iast_iast_dtmatk_relation (
	id int(11) auto_increment NOT NULL,
	iastvul_id int(11) NULL,
	dt_mark varchar(255)  DEFAULT '' NULL,
	CONSTRAINT `PRIMARY` PRIMARY KEY (id)
)
COMMENT='';

CREATE TABLE iast_dast_dtmatk_relation (
	id int(11) auto_increment NOT NULL,
	dastvul_id int(11) NULL,
	dt_mark varchar(255)  DEFAULT '' NULL,
	CONSTRAINT `PRIMARY` PRIMARY KEY (id)
)
COMMENT='';

ALTER TABLE iast_project ADD enable_log int(11) NULL COMMENT '开启日志';
ALTER TABLE iast_project ADD log_level varchar(100) NULL COMMENT '日志等级';

ALTER TABLE iast_hook_strategy ADD ignore_blacklist int(11) DEFAULT 0 NOT NULL;
ALTER TABLE iast_hook_strategy ADD ignore_internal int(11) DEFAULT 0 NOT NULL;
UPDATE auth_user SET is_superuser = 1
WHERE username = "admin" ;
ALTER TABLE iast_dast_integration_relation ADD CONSTRAINT iast_dast_integration_relation_UN UNIQUE KEY (iastvul_id,dastvul_id);

ALTER TABLE iast_dast_integration ADD CONSTRAINT iast_dast_integration_UN UNIQUE KEY (target,vul_type,project_id,project_version_id);

INSERT INTO dongtai_webapi.iast_profile
(`key`, value)
VALUES('dast_validation_settings', '{"strategy_id": [1, 2, 3, 4, 5, 6, 7, 8, 16, 18, 20, 21, 25, 27, 35, 39, 40, 26, 15, 17, 19, 22, 23, 41], "validation_status": true}');


SET FOREIGN_KEY_CHECKS=1;
