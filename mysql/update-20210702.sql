SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `iast_replay_queue`;
CREATE TABLE `iast_replay_queue`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relation_id` int(11) NULL DEFAULT NULL COMMENT '待检测的漏洞ID',
  `state` int(1) NULL DEFAULT NULL COMMENT '状态，0-待处理、1-待重放、2-已重放',
  `count` int(11) NULL DEFAULT NULL COMMENT '重放次数',
  `result` int(1) NULL DEFAULT NULL COMMENT '重放结果，0-无漏洞，1-存在漏洞，2-失败',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `verify_time` int(11) NULL DEFAULT NULL COMMENT '结果更新时间',
  `uri` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标URI',
  `method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `scheme` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求协议，http/https',
  `header` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求头',
  `params` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `body` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求体',
  `replay_type` int(1) NULL DEFAULT NULL COMMENT '重放类型，1-漏洞重放、2-请求重放',
  `agent_id` int(11) NULL DEFAULT NULL COMMENT 'Agent ID，外键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- 增加定时任务处理漏洞重放数据
INSERT INTO `django_celery_beat_periodictask`(`id`, `name`, `task`, `args`, `kwargs`, `queue`, `exchange`, `routing_key`, `expires`, `enabled`, `last_run_at`, `total_run_count`, `date_changed`, `description`, `crontab_id`, `interval_id`, `solar_id`, `one_off`, `start_time`, `priority`, `headers`, `clocked_id`, `expire_seconds`) VALUES (5, 'engine.clear_error_log', 'core.tasks.clear_error_log', '[]', '{}', NULL, NULL, NULL, NULL, 1, '2021-07-01 16:42:11.173748', 0, '2021-07-01 09:56:51.153195', '', NULL, 4, NULL, 0, NULL, NULL, '{}', NULL, NULL);
INSERT INTO `django_celery_beat_periodictask`(`id`, `name`, `task`, `args`, `kwargs`, `queue`, `exchange`, `routing_key`, `expires`, `enabled`, `last_run_at`, `total_run_count`, `date_changed`, `description`, `crontab_id`, `interval_id`, `solar_id`, `one_off`, `start_time`, `priority`, `headers`, `clocked_id`, `expire_seconds`) VALUES (6, 'engine.vul_recheck', 'core.tasks.vul_recheck', '[]', '{}', NULL, NULL, NULL, NULL, 1, '2021-07-02 15:39:52.544385', 346, '2021-07-02 15:41:57.661959', '', NULL, 3, NULL, 0, NULL, NULL, '{}', NULL, NULL);


SET FOREIGN_KEY_CHECKS=1;
