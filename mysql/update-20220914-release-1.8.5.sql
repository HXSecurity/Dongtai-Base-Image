SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE `iast_header_vulnerability` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL COMMENT 'url地址',
  `project_version_id` int(11) DEFAULT NULL,
  `vul_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iast_header_vulnerability_UN` (`url`,`project_version_id`,`project_id`,`vul_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `iast_header_vulnerability_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` bigint(20) unsigned DEFAULT NULL,
  `method_pool_id` bigint(20) unsigned DEFAULT NULL,
  `header_vul_id` bigint(20) unsigned DEFAULT NULL,
  `req_header` text,
  `res_header` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iast_header_vulnerability_detail_UN` (`header_vul_id`,`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


SET FOREIGN_KEY_CHECKS=1;