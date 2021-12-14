SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Records of engine_monitoring_indicators
-- ----------------------------
BEGIN;
INSERT IGNORE INTO `engine_monitoring_indicators` VALUES (1, 'dongtai-method-pool-scan', '漏洞扫描任务', 'Vul Scan Task', '漏洞扫描队列');
INSERT IGNORE INTO `engine_monitoring_indicators` VALUES (2, 'periodic_task', '定时任务', 'Schedule Task', '定时任务');
INSERT IGNORE INTO `engine_monitoring_indicators` VALUES (3, 'dongtai-search-scan', '策略更新任务', 'Sink Update Task', '策略更新任务');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

