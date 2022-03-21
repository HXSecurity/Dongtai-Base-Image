/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : iast_webapi_pre

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 14/03/2022 19:55:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for iast_agent_config
-- ----------------------------

CREATE TABLE IF NOT EXISTS `iast_agent_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `details` json DEFAULT NULL,
  `hostname` varchar(100) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `port` int(50) DEFAULT NULL,
  `cluster_name` varchar(255) DEFAULT NULL COMMENT '集群名称',
  `cluster_version` varchar(100) DEFAULT NULL COMMENT '集群版本号',
  `priority` int(10) DEFAULT NULL COMMENT '优先级100>10',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- Table structure for iast_agent_upload_type_url
-- ----------------------------
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE IF NOT EXISTS `iast_agent_upload_type_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `type_id` int(5) DEFAULT NULL COMMENT '需要转发数据类型',
  `url` varchar(255)  DEFAULT NULL COMMENT '数据转发地址',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `headers` json DEFAULT NULL COMMENT '请求头',
  `send_num` int(11) DEFAULT '0' COMMENT '转发次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ;

SET FOREIGN_KEY_CHECKS = 1;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for iast_server
-- ----------------------------
ALTER TABLE iast_server ADD cluster_name varchar(255) CHARACTER SET utf8mb4  NULL COMMENT '集群名称';
ALTER TABLE iast_server ADD cluster_version varchar(100) CHARACTER SET utf8mb4  NULL COMMENT '集群名称';
ALTER TABLE iast_agent_method_pool MODIFY COLUMN pool_sign varchar(64) CHARACTER SET utf8mb4  NULL COMMENT '方法池签名';


SET FOREIGN_KEY_CHECKS = 1;
