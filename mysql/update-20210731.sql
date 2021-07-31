SET FOREIGN_KEY_CHECKS=0;

-- iast_webapi_pre.iast_document definition
DROP TABLE IF EXISTS `iast_document`
CREATE TABLE `iast_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT '0',
  `language` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- iast_webapi_pre.iast_profile definition

CREATE TABLE `iast_profile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(100) NOT NULL,
  `value` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iast_profile_UN` (`key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

ALTER TABLE `iast_agent_method_pool` ADD COLUMN `req_header_for_search` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' ;

SET FOREIGN_KEY_CHECKS=1;
