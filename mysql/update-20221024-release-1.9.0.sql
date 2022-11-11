SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

-- dongtai_webapi.iast_agent_black_rule definition

CREATE TABLE `iast_agent_black_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `scope` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- dongtai_webapi.iast_agent_black_rule_detail definition

CREATE TABLE `iast_agent_black_rule_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` datetime(6) NOT NULL,
  `value` varchar(512) NOT NULL,
  `rule_id` int(11) DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `operator` int(11) DEFAULT NULL,
  `target_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS=1;
