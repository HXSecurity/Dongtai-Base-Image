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
DROP TABLE IF EXISTS `iast_agent_config`;
CREATE TABLE `iast_agent_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `details` json DEFAULT NULL,
  `hostname` varchar(100) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `port` int(50) DEFAULT NULL,
  `cluster_name` varchar(255) DEFAULT NULL COMMENT '容器名称',
  `cluster_version` varchar(100) DEFAULT NULL COMMENT '容器版本号',
  `priority` int(10) DEFAULT NULL COMMENT '优先级100>10',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;
