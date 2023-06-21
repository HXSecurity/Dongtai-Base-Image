SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;
  
  
-- dongtai_webapi.iast_api_route_v2 definition
CREATE TABLE `iast_api_route_v2` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`path` varchar(255) NOT NULL,
`method` varchar(31) NOT NULL,
`from_where` int(11) NOT NULL DEFAULT '1' COMMENT '1-agent,2-method_pool',
`project_id` int(11) NOT NULL DEFAULT '0' COMMENT '项目ID',
`project_version_id` int(11) NOT NULL DEFAULT '0' COMMENT '项目版本ID',
`is_cover` int(11) NOT NULL DEFAULT '0' COMMENT '是否覆盖',
`api_info` json DEFAULT NULL COMMENT 'API接口的相关信息',
PRIMARY KEY (`id`),
UNIQUE KEY `iast_api_route_v2_UN` (`project_id`,`project_version_id`,`path`,`method`,`from_where`),
KEY `iast_api_route_method_id_7ff9eb8e` (`method`) USING BTREE,
KEY `iast_api_route_method_id_IDX` (`method`,`project_id`,`project_version_id`) USING BTREE,
KEY `iast_api_route_path_IDX` (`method`,`path`,`project_id`,`project_version_id`) USING BTREE,
KEY `iast_api_route_project_id_IDX` (`project_id`,`project_version_id`,`from_where`,`is_cover`,`method`,`path`) USING BTREE,
KEY `iast_api_route_project_id_IDX_temp` (`project_id`,`project_version_id`,`method`,`path`) USING BTREE,
KEY `iast_api_route_project_id_is_cover_IDX` (`project_id`,`project_version_id`,`is_cover`,`method`) USING BTREE,
KEY `iast_api_route_project_version_id_IDX` (`project_version_id`,`method`,`path`) USING BTREE
) ENGINE=InnoDB ;


SET FOREIGN_KEY_CHECKS=1;
