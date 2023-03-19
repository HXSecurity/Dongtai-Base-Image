SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `sca2_license_level`;
CREATE TABLE `sca2_license_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `identifier` varchar(64) DEFAULT NULL,
  `level_id` tinyint(4) DEFAULT NULL COMMENT '风险等级 1高危，2中危，3低危，0无风险',
  `level_desc` varchar(64) DEFAULT NULL COMMENT '风险等级描述',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 ROW_FORMAT = Dynamic;

ALTER TABLE `iast_agent` ADD COLUMN `actual_running_status` int(11) NOT NULL DEFAULT 1 COMMENT '实际运行状态' AFTER `servicetype`;
ALTER TABLE `iast_agent` ADD COLUMN `except_running_status` int(11) NOT NULL DEFAULT 1 COMMENT '期望运行状态' AFTER `actual_running_status`;
ALTER TABLE `iast_agent` ADD COLUMN `state_status` int(11) NOT NULL DEFAULT 1 COMMENT 'Agent位置状态的原因' AFTER `except_running_status`;
ALTER TABLE `iast_asset` ADD COLUMN `safe_version_list` json NULL COMMENT '漏洞安全版本' AFTER `talent_id`;
ALTER TABLE `iast_asset` ADD COLUMN `nearest_safe_version` json NULL COMMENT '最近版本' AFTER `safe_version_list`;
ALTER TABLE `iast_asset` ADD COLUMN `latest_safe_version` json NULL COMMENT '最新版本' AFTER `nearest_safe_version`;
ALTER TABLE `iast_asset` ADD COLUMN `license_list` json NULL COMMENT '开源协议版本' AFTER `latest_safe_version`;
ALTER TABLE `iast_asset` ADD COLUMN `highest_license` json NULL COMMENT '最高风险开源协议' AFTER `license_list`;
ALTER TABLE `iast_asset_vul` ADD poc json NULL COMMENT 'poc';
ALTER TABLE `iast_asset_vul` ADD fix_plan json NULL COMMENT 'fix_plan';
ALTER TABLE `iast_asset_vul` ADD descriptions json NULL COMMENT 'descriptions';
ALTER TABLE `iast_asset_vul` ADD `references` json NULL COMMENT 'references';
ALTER TABLE `iast_asset_vul` DROP INDEX `create_time_order`;
ALTER TABLE `iast_asset_vul` DROP INDEX `update_time_order`;
ALTER TABLE `iast_asset_vul` DROP INDEX `have_poc_index`;
ALTER TABLE `iast_asset_vul` DROP INDEX `have_article_index`;
ALTER TABLE `iast_asset_vul` DROP INDEX `level_update_order_asc`;
ALTER TABLE `iast_asset_vul` DROP INDEX `package_language_where`;
ALTER TABLE `iast_asset_vul` DROP INDEX `level_update_order_desc`;
ALTER TABLE `iast_asset_vul` DROP INDEX `search_index`;
ALTER TABLE `iast_asset_vul` ADD COLUMN `sid` varchar(64) CHARACTER SET utf8mb4  NULL DEFAULT '' COMMENT '漏洞唯一编号' AFTER `update_time_desc`;
ALTER TABLE `iast_asset_vul` ADD INDEX `create_time_order`(`create_time`) USING BTREE;
ALTER TABLE `iast_asset_vul` ADD INDEX `update_time_order`(`update_time`) USING BTREE;
ALTER TABLE `iast_asset_vul` ADD INDEX `have_poc_index`(`have_poc`) USING BTREE;
ALTER TABLE `iast_asset_vul` ADD INDEX `have_article_index`(`have_article`) USING BTREE;
ALTER TABLE `iast_asset_vul` ADD INDEX `level_update_order_asc`(`level_id`, `update_time_desc`) USING BTREE;
ALTER TABLE `iast_asset_vul` ADD INDEX `package_language_where`(`package_language`) USING BTREE;
ALTER TABLE `iast_asset_vul` ADD INDEX `level_update_order_desc`(`level_id`, `update_time`) USING BTREE;
ALTER TABLE `iast_asset_vul` ADD FULLTEXT INDEX `search_index`(`license`);
ALTER TABLE `iast_asset_vul_relation` ADD COLUMN `effected_version_list` json NULL COMMENT '漏洞影响版本' AFTER `create_time`;
ALTER TABLE `iast_asset_vul_relation` ADD COLUMN `fixed_version_list` json NULL COMMENT '漏洞修复版本' AFTER `effected_version_list`;
ALTER TABLE `iast_asset_vul_relation` ADD COLUMN `nearest_fixed_version` json NULL COMMENT '最近修复版本' AFTER `fixed_version_list`;
ALTER TABLE `iast_asset_vul_relation` ADD COLUMN `vul_dependency_path` json NULL COMMENT '漏洞依赖' AFTER `nearest_fixed_version`;
ALTER TABLE `iast_asset_vul_type_relation` DROP INDEX `type_id_where`;
ALTER TABLE `iast_asset_vul_type_relation` ADD INDEX `type_id_where`(`asset_vul_type_id`) USING BTREE;
ALTER TABLE `iast_vul_all` DROP INDEX `title_index`;
ALTER TABLE `iast_vulnerability` DROP INDEX `ft_index_uri`;
ALTER TABLE `iast_vulnerability` DROP INDEX `ft_index_search_keywords`;
ALTER TABLE `iast_vulnerability` DROP INDEX `ft_index_vul_title`;
ALTER TABLE `iast_vulnerability` DROP INDEX `ft_index_search`;
ALTER TABLE `iast_vulnerability` MODIFY COLUMN `hook_type_id` int(11) NOT NULL DEFAULT 0 COMMENT '漏洞类型id' AFTER `method_pool_id`;
ALTER TABLE `iast_vulnerability` ADD FULLTEXT INDEX `ft_index_uri`(`uri`);
ALTER TABLE `iast_vulnerability` ADD FULLTEXT INDEX `ft_index_search_keywords`(`search_keywords`);
ALTER TABLE `iast_vulnerability` ADD FULLTEXT INDEX `ft_index_vul_title`(`vul_title`);
ALTER TABLE `iast_vulnerability` ADD FULLTEXT INDEX `ft_index_search`(`search_keywords`, `uri`, `vul_title`, `http_method`, `http_protocol`, `top_stack`, `bottom_stack`);


UPDATE iast_asset_vul SET sid=NULL WHERE sid = '';

DELETE  FROM iast_asset_vul 
WHERE SID IN ( SELECT sid FROM (
SELECT sid,COUNT(id) AS count_sid FROM iast_asset_vul iav 
WHERE  sid  IS NOT NULL 
GROUP BY sid 
HAVING  count_sid > 1)tmp );

DELETE FROM iast_asset_vul_type_relation 
WHERE   (asset_vul_id ,asset_vul_type_id) IN (
SELECT asset_vul_id ,asset_vul_type_id FROM
(
SELECT asset_vul_id ,asset_vul_type_id, count(id) AS _count  FROM iast_asset_vul_type_relation iavtr 
GROUP BY    asset_vul_id ,asset_vul_type_id
HAVING _count > 1 ) tmp);

DELETE FROM iast_asset_vul_relation 
WHERE asset_vul_id IN (
SELECT id FROM iast_asset_vul iav2 
WHERE SID IN ( SELECT sid FROM (
SELECT sid,COUNT(id) AS count_sid FROM iast_asset_vul iav 
WHERE  sid  IS NOT NULL 
GROUP BY sid 
HAVING  count_sid > 1)tmp ) );

DELETE
FROM 
	iast_asset_vul_type
WHERE
	cwe_id IN 
(
	SELECT
		cwe_id
	FROM
		(
		SELECT
			cwe_id,
			count(*) AS _count
		FROM
			iast_asset_vul_type iavt
		GROUP BY
			cwe_id ) tmp );

ALTER TABLE iast_asset DROP KEY signature_value;
ALTER TABLE iast_asset_vul_relation ADD CONSTRAINT iast_asset_vul_relation_UN UNIQUE KEY (asset_id,asset_vul_id);
ALTER TABLE iast_asset_vul_type_relation ADD CONSTRAINT iast_asset_vul_type_relation_UN UNIQUE KEY (asset_vul_id,asset_vul_type_id);
ALTER TABLE iast_asset_vul ADD CONSTRAINT iast_asset_vul_UN UNIQUE KEY (sid);
ALTER TABLE iast_asset_vul_type ADD CONSTRAINT iast_asset_vul_type_UN UNIQUE KEY (cwe_id);


UPDATE iast_agent  SET actual_running_status = 1
WHERE is_core_running  = 1 and online = 1 ;

UPDATE iast_agent  SET actual_running_status = 2
WHERE is_core_running  = 0 and online = 1;


UPDATE iast_agent  SET except_running_status = 1
WHERE control  = 3 and is_control = 1;

UPDATE iast_agent  SET except_running_status = 2
WHERE control  = 4 and is_control = 1;

UPDATE iast_agent SET except_running_status  = actual_running_status
WHERE online = 0;

INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (52, 'GPL-1.0-only', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (53, 'GPL-1.0-or-later', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (54, 'GPL-2.0-only', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (55, 'GPL-2.0-or-later', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (56, 'GPL-3.0-only', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (57, 'GPL-3.0-or-later', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (58, 'GPL-1.0', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (59, 'GPL-1.0+', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (60, 'GPL-2.0', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (61, 'GPL-2.0+', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (62, 'GPL-2.0-with-autoconf-exception', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (63, 'GPL-2.0-with-bison-exception', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (64, 'GPL-2.0-with-classpath-exception', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (65, 'GPL-2.0-with-font-exception', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (66, 'GPL-2.0-with-GCC-exception', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (67, 'GPL-3.0', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (68, 'GPL-3.0+', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (69, 'GPL-3.0-with-autoconf-exception', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (70, 'GPL-3.0-with-GCC-exception', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (71, 'AGPL-1.0-only', 1, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (72, 'AGPL-1.0-or-later', 1, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (73, 'AGPL-3.0-only', 1, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (74, 'AGPL-3.0-or-later', 1, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (75, 'AGPL-1.0', 1, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (76, 'AGPL-3.0', 1, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (77, 'LGPL-2.0-only', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (78, 'LGPL-2.0-or-later', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (79, 'LGPL-2.1-only', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (80, 'LGPL-2.1-or-later', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (81, 'LGPL-3.0-only', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (82, 'LGPL-3.0-or-later', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (83, 'LGPLLR', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (84, 'LGPL-2.0', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (85, 'LGPL-2.0+', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (86, 'LGPL-2.1', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (87, 'LGPL-2.1+', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (88, 'LGPL-3.0', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (89, 'LGPL-3.0+', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (90, 'Artistic-1.0', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (91, 'Artistic-1.0-cl8', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (92, 'Artistic-1.0-Perl', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (93, 'Artistic-2.0', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT IGNORE INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (94, 'ClArtistic', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');


SET FOREIGN_KEY_CHECKS=1;