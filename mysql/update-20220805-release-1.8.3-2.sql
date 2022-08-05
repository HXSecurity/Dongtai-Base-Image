SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

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

INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (52, 'GPL-1.0-only', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (53, 'GPL-1.0-or-later', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (54, 'GPL-2.0-only', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (55, 'GPL-2.0-or-later', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (56, 'GPL-3.0-only', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (57, 'GPL-3.0-or-later', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (58, 'GPL-1.0', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (59, 'GPL-1.0+', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (60, 'GPL-2.0', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (61, 'GPL-2.0+', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (62, 'GPL-2.0-with-autoconf-exception', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (63, 'GPL-2.0-with-bison-exception', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (64, 'GPL-2.0-with-classpath-exception', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (65, 'GPL-2.0-with-font-exception', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (66, 'GPL-2.0-with-GCC-exception', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (67, 'GPL-3.0', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (68, 'GPL-3.0+', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (69, 'GPL-3.0-with-autoconf-exception', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (70, 'GPL-3.0-with-GCC-exception', 1, '禁止商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (71, 'AGPL-1.0-only', 1, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (72, 'AGPL-1.0-or-later', 1, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (73, 'AGPL-3.0-only', 1, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (74, 'AGPL-3.0-or-later', 1, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (75, 'AGPL-1.0', 1, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (76, 'AGPL-3.0', 1, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (77, 'LGPL-2.0-only', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (78, 'LGPL-2.0-or-later', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (79, 'LGPL-2.1-only', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (80, 'LGPL-2.1-or-later', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (81, 'LGPL-3.0-only', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (82, 'LGPL-3.0-or-later', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (83, 'LGPLLR', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (84, 'LGPL-2.0', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (85, 'LGPL-2.0+', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (86, 'LGPL-2.1', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (87, 'LGPL-2.1+', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (88, 'LGPL-3.0', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (89, 'LGPL-3.0+', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (90, 'Artistic-1.0', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (91, 'Artistic-1.0-cl8', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (92, 'Artistic-1.0-Perl', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (93, 'Artistic-2.0', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');
INSERT INTO `sca2_license_level` (`id`, `identifier`, `level_id`, `level_desc`, `create_at`, `update_at`) VALUES (94, 'ClArtistic', 2, '限制性商业闭源集成', '2022-05-08 16:24:07', '2022-05-08 16:24:09');

SET FOREIGN_KEY_CHECKS=1;