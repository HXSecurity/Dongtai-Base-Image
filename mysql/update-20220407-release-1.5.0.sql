
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE IF NOT EXISTS `iast_third_party_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `project_id` int(11) DEFAULT NULL COMMENT '项目ID',
  `agent_id` int(11) DEFAULT NULL COMMENT '来源agentID',
  `port` varchar(255) DEFAULT NULL COMMENT '端口',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `service_type` varchar(255) DEFAULT NULL COMMENT '服务类型',
  PRIMARY KEY (`id`)
)

ALTER TABLE iast_agent ADD filepathsimhash varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' NOT NULL COMMENT 'agent目录结构相似度哈希';
ALTER TABLE iast_third_party_service ADD CONSTRAINT iast_third_party_service_UN UNIQUE KEY (address,service_type,port,agent_id);
ALTER TABLE iast_agent ADD servicetype varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' NOT NULL COMMENT '部署的方式';
CREATE INDEX iast_vulnerability_level_id_IDX USING BTREE ON iast_webapi_buss_test.iast_vulnerability (level_id,agent_id);

SET FOREIGN_KEY_CHECKS=1;
