SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `iast_agent` ADD COLUMN `language` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'JAVA' COMMENT '语言，JAVA、PYTHON' AFTER `is_core_running`;

ALTER TABLE `iast_agent` MODIFY COLUMN `is_core_running` int(11) NULL DEFAULT NULL COMMENT '核心引擎是否启动' AFTER `online`;

ALTER TABLE `iast_agent_method_pool` DROP COLUMN `language`;

ALTER TABLE `iast_agent_method_pool_replay` DROP COLUMN `language`;

ALTER TABLE `iast_asset` DROP COLUMN `language`;

ALTER TABLE `iast_heartbeat` DROP COLUMN `hostname`;

ALTER TABLE `iast_heartbeat` DROP COLUMN `network`;

ALTER TABLE `iast_heartbeat` DROP COLUMN `pid`;

ALTER TABLE `iast_heartbeat` DROP COLUMN `env`;

ALTER TABLE `iast_hook_type` MODIFY COLUMN `enable` tinyint(1) NULL DEFAULT NULL COMMENT '状态：1-启用；0-禁用' AFTER `created_by`;

ALTER TABLE `iast_server` ADD COLUMN `network` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网络情况' AFTER `update_time`;

ALTER TABLE `iast_server` ADD COLUMN `pid` int(11) NULL DEFAULT NULL COMMENT '进程ID ' AFTER `network`;

ALTER TABLE `iast_server` DROP COLUMN `name`;

ALTER TABLE `iast_server` DROP COLUMN `agent_version`;

ALTER TABLE `iast_server` DROP COLUMN `latest_agent_version`;

ALTER TABLE `iast_server` DROP COLUMN `language`;

ALTER TABLE `iast_strategy` ADD COLUMN `hook_type_id` int(11) NULL DEFAULT NULL COMMENT 'hook策略类型ID' AFTER `vul_fix`;

ALTER TABLE `iast_vulnerability` ADD COLUMN `method_pool_id` int(11) NULL DEFAULT 0 COMMENT '方法池ID ' AFTER `param_name`;

ALTER TABLE `iast_vulnerability` DROP COLUMN `language`;

DROP TABLE `iast_hook_talent_strategy`;

-- 修改数据
UPDATE iast_strategy SET hook_type_id=40 WHERE id=1;
UPDATE iast_strategy SET hook_type_id=37 WHERE id=2;
UPDATE iast_strategy SET hook_type_id=38 WHERE id=3;
UPDATE iast_strategy SET hook_type_id=39 WHERE id=4;
UPDATE iast_strategy SET hook_type_id=41 WHERE id=5;
UPDATE iast_strategy SET hook_type_id=42 WHERE id=6;
UPDATE iast_strategy SET hook_type_id=43 WHERE id=7;
UPDATE iast_strategy SET hook_type_id=44 WHERE id=8;
UPDATE iast_strategy SET hook_type_id=45 WHERE id=9;
UPDATE iast_strategy SET hook_type_id=46 WHERE id=10;
UPDATE iast_strategy SET hook_type_id=47 WHERE id=11;
UPDATE iast_strategy SET hook_type_id=48 WHERE id=12;
UPDATE iast_strategy SET hook_type_id=49 WHERE id=13;
UPDATE iast_strategy SET hook_type_id=50 WHERE id=14;
UPDATE iast_strategy SET hook_type_id=61 WHERE id=15;
UPDATE iast_strategy SET hook_type_id=56 WHERE id=16;
UPDATE iast_strategy SET hook_type_id=58 WHERE id=17;
UPDATE iast_strategy SET hook_type_id=52 WHERE id=18;
UPDATE iast_strategy SET hook_type_id=53 WHERE id=19;
UPDATE iast_strategy SET hook_type_id=54 WHERE id=20;
UPDATE iast_strategy SET hook_type_id=57 WHERE id=21;
UPDATE iast_strategy SET hook_type_id=60 WHERE id=22;
UPDATE iast_strategy SET hook_type_id=59 WHERE id=23;
UPDATE iast_strategy SET hook_type_id=47 WHERE id=24;
UPDATE iast_strategy SET hook_type_id=62 WHERE id=25;
UPDATE iast_strategy SET hook_type_id=51 WHERE id=26;
UPDATE iast_strategy SET hook_type_id=55 WHERE id=27;

SET FOREIGN_KEY_CHECKS=1;
