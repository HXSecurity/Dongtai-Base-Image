SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `iast_agent_method_pool` MODIFY COLUMN `res_header` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '响应头' AFTER `req_data`;
ALTER TABLE `iast_hook_type` MODIFY COLUMN `type` int(11) NULL DEFAULT NULL COMMENT '策略总类型，1-source节点、2-propagator节点、3-filter节点、4-sink节点' AFTER `id`;
ALTER TABLE `iast_hook_type` MODIFY COLUMN `enable` tinyint(1) NULL DEFAULT NULL COMMENT '状态：1-启用；0-禁用' AFTER `created_by`;
ALTER TABLE `iast_strategy` MODIFY COLUMN `vul_name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL AFTER `vul_fix_zh`;

SET FOREIGN_KEY_CHECKS=1;