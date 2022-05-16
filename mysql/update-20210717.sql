SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `iast_agent` ADD COLUMN `language` varchar(10)  NULL DEFAULT 'JAVA' COMMENT '语言，JAVA、PYTHON' AFTER `is_core_running`;

ALTER TABLE `iast_agent` MODIFY COLUMN `is_core_running` int(11) NULL DEFAULT NULL COMMENT '核心引擎是否启动' AFTER `online`;

ALTER TABLE `iast_agent_method_pool` DROP COLUMN `language`;

ALTER TABLE `iast_agent_method_pool_replay` DROP COLUMN `language`;

ALTER TABLE `iast_asset` DROP COLUMN `language`;

ALTER TABLE `iast_heartbeat` DROP COLUMN `hostname`;

ALTER TABLE `iast_heartbeat` DROP COLUMN `network`;

ALTER TABLE `iast_heartbeat` DROP COLUMN `pid`;

ALTER TABLE `iast_heartbeat` DROP COLUMN `env`;

ALTER TABLE `iast_server` MODIFY COLUMN `env` text;

ALTER TABLE `iast_server` ADD COLUMN `network` text  NULL DEFAULT NULL COMMENT '网络情况' AFTER `update_time`;

ALTER TABLE `iast_server` ADD COLUMN `pid` int(11) NULL DEFAULT NULL COMMENT '进程ID ' AFTER `network`;

ALTER TABLE `iast_server` DROP COLUMN `name`;

ALTER TABLE `iast_server` DROP COLUMN `agent_version`;

ALTER TABLE `iast_server` DROP COLUMN `latest_agent_version`;

ALTER TABLE `iast_server` DROP COLUMN `language`;

ALTER TABLE `iast_vulnerability` ADD COLUMN `method_pool_id` int(11) NULL DEFAULT 0 COMMENT '方法池ID ' AFTER `param_name`;

ALTER TABLE `iast_vulnerability` DROP COLUMN `language`;

DROP TABLE `iast_hook_talent_strategy`;

SET FOREIGN_KEY_CHECKS=1;
