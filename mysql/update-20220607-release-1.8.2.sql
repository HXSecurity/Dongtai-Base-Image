SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `iast_agent_method_pool` MODIFY COLUMN `res_header` text NULL COMMENT '响应头' AFTER `req_data`;
ALTER TABLE `iast_hook_type` MODIFY COLUMN `type` int(11) NULL DEFAULT NULL COMMENT '策略总类型，1-source节点、2-propagator节点、3-filter节点、4-sink节点' AFTER `id`;
ALTER TABLE `iast_hook_type` MODIFY COLUMN `enable` tinyint(1) NULL DEFAULT NULL COMMENT '状态：1-启用；0-禁用' AFTER `created_by`;
ALTER TABLE `iast_strategy` MODIFY COLUMN `vul_name_en` varchar(255) NULL DEFAULT NULL AFTER `vul_fix_zh`;


INSERT IGNORE INTO `iast_profile` (`key`, `value`) VALUES ('data_clean', '{\"clean_time\": \"00:00:00\", \"days_before\": 7, \"enable\": true}');
INSERT IGNORE INTO `django_celery_beat_periodictask` (`id`, `name`, `task`, `args`, `kwargs`, `queue`, `exchange`, `routing_key`, `expires`, `enabled`, `last_run_at`, `total_run_count`, `date_changed`, `description`, `crontab_id`, `interval_id`, `solar_id`, `one_off`, `start_time`, `priority`, `headers`, `clocked_id`, `expire_seconds`) VALUES (11, 'engine.consume_notify_list', 'dongtai_engine.signals.handlers.notify_controler.consume_notify_list', '[]', '{}', NULL, NULL, NULL, NULL, 1, '2022-06-29 10:29:56.000000', 0, '2022-06-29 10:30:07.000000', 'notify', NULL, 1, NULL, 0, NULL, NULL, '{}', NULL, NULL);
INSERT IGNORE INTO `django_celery_beat_periodictask` (`id`, `name`, `task`, `args`, `kwargs`, `queue`, `exchange`, `routing_key`, `expires`, `enabled`, `last_run_at`, `total_run_count`, `date_changed`, `description`, `crontab_id`, `interval_id`, `solar_id`, `one_off`, `start_time`, `priority`, `headers`, `clocked_id`, `expire_seconds`) VALUES (13, 'data clean functions', 'dongtai_engine.plugins.data_clean.data_cleanup', '[]', '{\"days\": 1}', NULL, NULL, NULL, NULL, 0, NULL, 0, '2022-07-13 19:16:56.980132', '', 4, NULL, NULL, 0, NULL, NULL, '{}', NULL, NULL);
INSERT IGNORE INTO `django_celery_beat_crontabschedule` (`id`, `minute`, `hour`, `day_of_week`, `day_of_month`, `month_of_year`, `timezone`) VALUES (4, '0', '0', '*', '*', '*', 'UTC');

SET FOREIGN_KEY_CHECKS=1;