SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for iast_project_report
-- ----------------------------
DROP TABLE IF EXISTS `iast_project_report`;
CREATE TABLE `iast_project_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0' COMMENT '项目id',
  `vul_id` int(11) unsigned DEFAULT '0' COMMENT '漏洞id',
  `project_name` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '报告类型',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0:生成中;1:已生成',
  `path` varchar(255) DEFAULT NULL COMMENT '报告路径',
  `language` varchar(255) NOT NULL DEFAULT '' COMMENT '语言包：zh或者en',
  `file` longblob COMMENT '二进制报告文件',
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`path`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;


INSERT IGNORE INTO iast_program_language (name) SELECT 'PHP' FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_program_language WHERE  `name` = 'PHP');

INSERT IGNORE INTO `django_celery_beat_periodictask`(`name`, `task`, `args`, `kwargs`, `queue`, `exchange`, `routing_key`, `expires`, `enabled`, `last_run_at`, `total_run_count`, `date_changed`, `description`, `crontab_id`, `interval_id`, `solar_id`, `one_off`, `start_time`, `priority`, `headers`, `clocked_id`, `expire_seconds`) VALUES ('engine.export_report', 'core.tasks.export_report', '[]', '{}', NULL, NULL, NULL, NULL, 1, '2021-11-03 06:15:43.686509', 22, '2021-11-03 06:15:48.701943', '', NULL, 1, NULL, 0, NULL, NULL, '{}', NULL, NULL);

INSERT IGNORE INTO iast_message_type (id, name) SELECT 1, 'report' FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_program_language WHERE `id` = 1 AND `name` = 'report');
ALTER TABLE iast_agent ADD is_audit int(11) DEFAULT 0 NOT NULL COMMENT '0:未审核；1：已审核';

INSERT INTO iast_document (title, url, weight, `language`, title_en, title_zh, url_en, url_zh) VALUES('PHP Agent快速部署', 'https://doc2.dongtai.io/zh/02_start/03_agent.html#php-agent', 99, 'PHP', 'PHP Agent QuickStart', 'PHP Agent快速部署', 'https://doc2.dongtai.io/en/02_start/03_agent.html#php-agent', 'https://doc2.dongtai.io/zh/02_start/03_agent.html#php-agent');

-- ----------------------------
-- Java Agent Hook rule
-- ----------------------------
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'Propagator:Hessian',  'Propagator:Hessian',  1636081832
	,  1636081832,  1,  1,  NULL,  'Propagator:Hessian'
	,  1 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'Propagator:Hessian'
AND  value =  'Propagator:Hessian' AND
update_time= 1636081832 AND create_time= 1636081832 AND `created_by`= 1
AND enable =  1 AND name_en IS  NULL AND name_zh =  'Propagator:Hessian' AND language_id =  1 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'Propagator:Hessian'
AND  value =  'Propagator:Hessian' AND
update_time= 1636081832 AND create_time= 1636081832 AND `created_by`= 1
AND enable =  1 AND name_en IS  NULL AND name_zh =  'Propagator:Hessian' AND language_id =  1 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'com.caucho.hessian.io.HessianInput.init(java.io.InputStream)',  'P1',  'O',  'false',  'false',  1636081860,  1636081860,  1,  1 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'com.caucho.hessian.io.HessianInput.init(java.io.InputStream)' AND `source`= 'P1' AND `target`= 'O' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636081860 AND `update_time`=  1636081860 AND `created_by`= 1 AND `enable` =  1 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'com.caucho.hessian.io.HessianInput.init(java.io.InputStream)' AND `source`= 'P1' AND `target`= 'O' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636081860 AND `update_time`=  1636081860 AND `created_by`= 1 AND `enable` =  1 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  '字符串传播-01',  'String',  1610535130
	,  1610535130,  1,  1,  '字符串传播-01',  '字符串传播-01'
	,  1 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  '字符串传播-01'
AND  value =  'String' AND
update_time= 1610535130 AND create_time= 1610535130 AND `created_by`= 1
AND enable =  1 AND name_en =  '字符串传播-01'AND name_zh =  '字符串传播-01' AND language_id =  1 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  '字符串传播-01'
AND  value =  'String' AND
update_time= 1610535130 AND create_time= 1610535130 AND `created_by`= 1
AND enable =  1 AND name_en =  '字符串传播-01'AND name_zh =  '字符串传播-01' AND language_id =  1 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'java.lang.StringConcatHelper.newString(byte[],long)',  'P1',  'R',  'false',  'false',  1636082001,  1636082001,  1,  1 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'java.lang.StringConcatHelper.newString(byte[],long)' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636082001 AND `update_time`=  1636082001 AND `created_by`= 1 AND `enable` =  1 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'java.lang.StringConcatHelper.newString(byte[],long)' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636082001 AND `update_time`=  1636082001 AND `created_by`= 1 AND `enable` =  1 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  '字符串传播-01',  'String',  1610535130
	,  1610535130,  1,  1,  '字符串传播-01',  '字符串传播-01'
	,  1 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  '字符串传播-01'
AND  value =  'String' AND
update_time= 1610535130 AND create_time= 1610535130 AND `created_by`= 1
AND enable =  1 AND name_en =  '字符串传播-01'AND name_zh =  '字符串传播-01' AND language_id =  1 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  '字符串传播-01'
AND  value =  'String' AND
update_time= 1610535130 AND create_time= 1610535130 AND `created_by`= 1
AND enable =  1 AND name_en =  '字符串传播-01'AND name_zh =  '字符串传播-01' AND language_id =  1 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'java.lang.StringConcatHelper.prepend(long,byte[],byte,java.lang.String)',  'P1',  'R',  'false',  'false',  1636082015,  1636082015,  1,  1 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'java.lang.StringConcatHelper.prepend(long,byte[],byte,java.lang.String)' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636082015 AND `update_time`=  1636082015 AND `created_by`= 1 AND `enable` =  1 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'java.lang.StringConcatHelper.prepend(long,byte[],byte,java.lang.String)' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636082015 AND `update_time`=  1636082015 AND `created_by`= 1 AND `enable` =  1 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '任意文件写入',  'FileWrite',  1636085906
	,  1636085906,  1,  1,  NULL,  '任意文件写入'
	,  1 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '任意文件写入'
AND  value =  'FileWrite' AND
update_time= 1636085906 AND create_time= 1636085906 AND `created_by`= 1
AND enable =  1 AND name_en IS  NULL AND name_zh =  '任意文件写入' AND language_id =  1 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '任意文件写入'
AND  value =  'FileWrite' AND
update_time= 1636085906 AND create_time= 1636085906 AND `created_by`= 1
AND enable =  1 AND name_en IS  NULL AND name_zh =  '任意文件写入' AND language_id =  1 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'org.apache.commons.fileupload.FileItem.write(java.io.File)',  'P1',  '',  'true',  'true',  1636085926,  1636085926,  1,  1 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'org.apache.commons.fileupload.FileItem.write(java.io.File)' AND `source`= 'P1' AND `target`= '' AND `inherit`= 'true' AND `track`= 'true' AND `create_time`=  1636085926 AND `update_time`=  1636085926 AND `created_by`= 1 AND `enable` =  1 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'org.apache.commons.fileupload.FileItem.write(java.io.File)' AND `source`= 'P1' AND `target`= '' AND `inherit`= 'true' AND `track`= 'true' AND `create_time`=  1636085926 AND `update_time`=  1636085926 AND `created_by`= 1 AND `enable` =  1 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'Sql注入',  'sql-injection',  1610535131
	,  1610535131,  1,  1,  'SQL Injection',  'Sql注入'
	,  1 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  1 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  1 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'java.sql.Statement.executeLargeUpdate(java.lang.String,java.lang.String[])',  'P1',  '',  'true',  'true',  1636085948,  1636085948,  1,  1 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'java.sql.Statement.executeLargeUpdate(java.lang.String,java.lang.String[])' AND `source`= 'P1' AND `target`= '' AND `inherit`= 'true' AND `track`= 'true' AND `create_time`=  1636085948 AND `update_time`=  1636085948 AND `created_by`= 1 AND `enable` =  1 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'java.sql.Statement.executeLargeUpdate(java.lang.String,java.lang.String[])' AND `source`= 'P1' AND `target`= '' AND `inherit`= 'true' AND `track`= 'true' AND `create_time`=  1636085948 AND `update_time`=  1636085948 AND `created_by`= 1 AND `enable` =  1 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'Sql注入',  'sql-injection',  1610535131
	,  1610535131,  1,  1,  'SQL Injection',  'Sql注入'
	,  1 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  1 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  1 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'java.sql.Statement.executeLargeUpdate(java.lang.String,int[])',  'P1',  '',  'true',  'true',  1636085964,  1636085964,  1,  1 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'java.sql.Statement.executeLargeUpdate(java.lang.String,int[])' AND `source`= 'P1' AND `target`= '' AND `inherit`= 'true' AND `track`= 'true' AND `create_time`=  1636085964 AND `update_time`=  1636085964 AND `created_by`= 1 AND `enable` =  1 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'java.sql.Statement.executeLargeUpdate(java.lang.String,int[])' AND `source`= 'P1' AND `target`= '' AND `inherit`= 'true' AND `track`= 'true' AND `create_time`=  1636085964 AND `update_time`=  1636085964 AND `created_by`= 1 AND `enable` =  1 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'Sql注入',  'sql-injection',  1610535131
	,  1610535131,  1,  1,  'SQL Injection',  'Sql注入'
	,  1 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  1 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  1 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'java.sql.Statement.executeLargeUpdate(java.lang.String,int)',  'P1',  '',  'true',  'true',  1636085976,  1636085976,  1,  1 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'java.sql.Statement.executeLargeUpdate(java.lang.String,int)' AND `source`= 'P1' AND `target`= '' AND `inherit`= 'true' AND `track`= 'true' AND `create_time`=  1636085976 AND `update_time`=  1636085976 AND `created_by`= 1 AND `enable` =  1 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'java.sql.Statement.executeLargeUpdate(java.lang.String,int)' AND `source`= 'P1' AND `target`= '' AND `inherit`= 'true' AND `track`= 'true' AND `create_time`=  1636085976 AND `update_time`=  1636085976 AND `created_by`= 1 AND `enable` =  1 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'Sql注入',  'sql-injection',  1610535131
	,  1610535131,  1,  1,  'SQL Injection',  'Sql注入'
	,  1 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  1 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  1 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'java.sql.Statement.executeLargeUpdate(java.lang.String)',  'P1',  '',  'true',  'true',  1636085988,  1636085988,  1,  1 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'java.sql.Statement.executeLargeUpdate(java.lang.String)' AND `source`= 'P1' AND `target`= '' AND `inherit`= 'true' AND `track`= 'true' AND `create_time`=  1636085988 AND `update_time`=  1636085988 AND `created_by`= 1 AND `enable` =  1 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'java.sql.Statement.executeLargeUpdate(java.lang.String)' AND `source`= 'P1' AND `target`= '' AND `inherit`= 'true' AND `track`= 'true' AND `create_time`=  1636085988 AND `update_time`=  1636085988 AND `created_by`= 1 AND `enable` =  1 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '不安全的反序列化',  'unsafe-json-deserialize',  1610535131
	,  1610535131,  1,  1,  'Untrusted Deserialization',  '不安全的反序列化'
	,  1 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的反序列化'
AND  value =  'unsafe-json-deserialize' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Untrusted Deserialization'AND name_zh =  '不安全的反序列化' AND language_id =  1 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的反序列化'
AND  value =  'unsafe-json-deserialize' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Untrusted Deserialization'AND name_zh =  '不安全的反序列化' AND language_id =  1 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'com.alibaba.fastjson.JSON.parseObject(java.lang.String)',  'P1',  '',  'false',  'true',  1636086045,  1636086045,  1,  1 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'com.alibaba.fastjson.JSON.parseObject(java.lang.String)' AND `source`= 'P1' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636086045 AND `update_time`=  1636086045 AND `created_by`= 1 AND `enable` =  1 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'com.alibaba.fastjson.JSON.parseObject(java.lang.String)' AND `source`= 'P1' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636086045 AND `update_time`=  1636086045 AND `created_by`= 1 AND `enable` =  1 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '不安全的反序列化',  'unsafe-json-deserialize',  1610535131
	,  1610535131,  1,  1,  'Untrusted Deserialization',  '不安全的反序列化'
	,  1 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的反序列化'
AND  value =  'unsafe-json-deserialize' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Untrusted Deserialization'AND name_zh =  '不安全的反序列化' AND language_id =  1 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的反序列化'
AND  value =  'unsafe-json-deserialize' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Untrusted Deserialization'AND name_zh =  '不安全的反序列化' AND language_id =  1 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'com.caucho.hessian.io.HessianInput.readObject()',  'O',  '',  'false',  'true',  1636086060,  1636086060,  1,  1 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'com.caucho.hessian.io.HessianInput.readObject()' AND `source`= 'O' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636086060 AND `update_time`=  1636086060 AND `created_by`= 1 AND `enable` =  1 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'com.caucho.hessian.io.HessianInput.readObject()' AND `source`= 'O' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636086060 AND `update_time`=  1636086060 AND `created_by`= 1 AND `enable` =  1 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);

-- ----------------------------
-- Python Agent Hook rule
-- ----------------------------


INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'path-traversal',  'path-traversal',  1634110525
	,  1634110525,  203,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.open',  'P1',  'R',  'false',  'false',  1634110525,  1634110525,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.open' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110525 AND `update_time`=  1634110525 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.open' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110525 AND `update_time`=  1634110525 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'path-traversal',  'path-traversal',  1634110525
	,  1634110525,  203,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'typing.BinaryIO.readline',  'P1',  'R',  'false',  'false',  1634110525,  1634110525,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'typing.BinaryIO.readline' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110525 AND `update_time`=  1634110525 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'typing.BinaryIO.readline' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110525 AND `update_time`=  1634110525 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'sql-injection',  'sql-injection',  1634110525
	,  1634110525,  203,  1,  NULL,  'sql-injection'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'sqlite3.Cursor.execute',  'P1',  'R',  'false',  'false',  1634110525,  1634110525,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'sqlite3.Cursor.execute' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110525 AND `update_time`=  1634110525 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'sqlite3.Cursor.execute' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110525 AND `update_time`=  1634110525 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'sql-injection',  'sql-injection',  1634110525
	,  1634110525,  203,  1,  NULL,  'sql-injection'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'sqlite3.Cursor.executemany',  'P1',  'R',  'false',  'false',  1634110525,  1634110525,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'sqlite3.Cursor.executemany' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110525 AND `update_time`=  1634110525 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'sqlite3.Cursor.executemany' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110525 AND `update_time`=  1634110525 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'sql-injection',  'sql-injection',  1634110525
	,  1634110525,  203,  1,  NULL,  'sql-injection'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'sqlite3.Cursor.executescript',  'P1',  'R',  'false',  'false',  1634110526,  1634110526,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'sqlite3.Cursor.executescript' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'sqlite3.Cursor.executescript' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'sql-injection',  'sql-injection',  1634110525
	,  1634110525,  203,  1,  NULL,  'sql-injection'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'psycopg2._psycopg.cursor.execute',  'P1',  'R',  'false',  'false',  1634110526,  1634110526,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'psycopg2._psycopg.cursor.execute' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'psycopg2._psycopg.cursor.execute' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'sql-injection',  'sql-injection',  1634110525
	,  1634110525,  203,  1,  NULL,  'sql-injection'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'psycopg2._psycopg.cursor.executemany',  'P1',  'R',  'false',  'false',  1634110526,  1634110526,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'psycopg2._psycopg.cursor.executemany' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'psycopg2._psycopg.cursor.executemany' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'sql-injection',  'sql-injection',  1634110525
	,  1634110525,  203,  1,  NULL,  'sql-injection'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'mysql.connector.cursor.CursorBase.execute',  'P1',  'R',  'false',  'false',  1634110526,  1634110526,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'mysql.connector.cursor.CursorBase.execute' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'mysql.connector.cursor.CursorBase.execute' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'sql-injection',  'sql-injection',  1634110525
	,  1634110525,  203,  1,  NULL,  'sql-injection'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'mysql.connector.cursor.CursorBase.executemany',  'P1',  'R',  'false',  'false',  1634110526,  1634110526,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'mysql.connector.cursor.CursorBase.executemany' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'mysql.connector.cursor.CursorBase.executemany' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'sql-injection',  'sql-injection',  1634110525
	,  1634110525,  203,  1,  NULL,  'sql-injection'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'MySQLdb.cursors.BaseCursor.execute',  'P1',  'R',  'false',  'false',  1634110526,  1634110526,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'MySQLdb.cursors.BaseCursor.execute' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'MySQLdb.cursors.BaseCursor.execute' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'sql-injection',  'sql-injection',  1634110525
	,  1634110525,  203,  1,  NULL,  'sql-injection'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'MySQLdb.cursors.BaseCursor.executemany',  'P1',  'R',  'false',  'false',  1634110526,  1634110526,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'MySQLdb.cursors.BaseCursor.executemany' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'MySQLdb.cursors.BaseCursor.executemany' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'sql-injection',  'sql-injection',  1634110525
	,  1634110525,  203,  1,  NULL,  'sql-injection'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'pymysql.cursors.Cursor.execute',  'P1',  'R',  'false',  'false',  1634110526,  1634110526,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'pymysql.cursors.Cursor.execute' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'pymysql.cursors.Cursor.execute' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'sql-injection',  'sql-injection',  1634110525
	,  1634110525,  203,  1,  NULL,  'sql-injection'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'pymysql.cursors.Cursor.executemany',  'P1',  'R',  'false',  'false',  1634110526,  1634110526,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'pymysql.cursors.Cursor.executemany' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'pymysql.cursors.Cursor.executemany' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'exec-code',  'exec-code',  1634110527
	,  1634110527,  203,  1,  NULL,  'exec-code'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'exec-code'
AND  value =  'exec-code' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'exec-code' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'exec-code'
AND  value =  'exec-code' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'exec-code' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.eval',  'P1',  'R',  'false',  'false',  1634110527,  1634110527,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.eval' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110527 AND `update_time`=  1634110527 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.eval' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110527 AND `update_time`=  1634110527 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'exec-code',  'exec-code',  1634110527
	,  1634110527,  203,  1,  NULL,  'exec-code'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'exec-code'
AND  value =  'exec-code' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'exec-code' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'exec-code'
AND  value =  'exec-code' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'exec-code' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'yaml.unsafe_load',  'P1',  'R',  'false',  'false',  1634110527,  1634110527,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.unsafe_load' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110527 AND `update_time`=  1634110527 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.unsafe_load' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110527 AND `update_time`=  1634110527 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'exec-code',  'exec-code',  1634110527
	,  1634110527,  203,  1,  NULL,  'exec-code'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'exec-code'
AND  value =  'exec-code' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'exec-code' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'exec-code'
AND  value =  'exec-code' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'exec-code' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'yaml.load',  'P1',  'R',  'false',  'false',  1634110527,  1634110527,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.load' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110527 AND `update_time`=  1634110527 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.load' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110527 AND `update_time`=  1634110527 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'exec-command',  'exec-command',  1634110527
	,  1634110527,  203,  1,  NULL,  'exec-command'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'exec-command'
AND  value =  'exec-command' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'exec-command' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'exec-command'
AND  value =  'exec-command' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'exec-command' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'os.system',  'P1',  'R',  'false',  'false',  1634110527,  1634110527,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'os.system' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110527 AND `update_time`=  1634110527 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'os.system' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110527 AND `update_time`=  1634110527 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'exec-command',  'exec-command',  1634110527
	,  1634110527,  203,  1,  NULL,  'exec-command'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'exec-command'
AND  value =  'exec-command' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'exec-command' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'exec-command'
AND  value =  'exec-command' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'exec-command' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'os.popen',  'P1',  'R',  'false',  'false',  1634110527,  1634110527,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'os.popen' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110527 AND `update_time`=  1634110527 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'os.popen' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110527 AND `update_time`=  1634110527 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'exec-command',  'exec-command',  1634110527
	,  1634110527,  203,  1,  NULL,  'exec-command'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'exec-command'
AND  value =  'exec-command' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'exec-command' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'exec-command'
AND  value =  'exec-command' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'exec-command' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'subprocess.Popen',  'P1',  'R',  'false',  'false',  1634110527,  1634110527,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'subprocess.Popen' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110527 AND `update_time`=  1634110527 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'subprocess.Popen' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110527 AND `update_time`=  1634110527 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'path-traversal',  'path-traversal',  1634110528
	,  1634110528,  203,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'django.utils.datastructures.MultiValueDict.get',  'P1',  'R',  'false',  'false',  1634110528,  1634110528,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.utils.datastructures.MultiValueDict.get' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110528 AND `update_time`=  1634110528 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.utils.datastructures.MultiValueDict.get' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110528 AND `update_time`=  1634110528 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'path-traversal',  'path-traversal',  1634110528
	,  1634110528,  203,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'django.utils.datastructures.MultiValueDict.__getitem__',  'P1',  'R',  'false',  'false',  1634110528,  1634110528,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.utils.datastructures.MultiValueDict.__getitem__' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110528 AND `update_time`=  1634110528 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.utils.datastructures.MultiValueDict.__getitem__' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110528 AND `update_time`=  1634110528 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  2,  'path-traversal',  'path-traversal',  1634110528
	,  1634110528,  203,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.__format__',  'P1',  'R',  'false',  'false',  1634110528,  1634110528,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.__format__' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110528 AND `update_time`=  1634110528 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.__format__' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110528 AND `update_time`=  1634110528 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  2,  'path-traversal',  'path-traversal',  1634110528
	,  1634110528,  203,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.list.__new__',  'P1',  'R',  'false',  'false',  1634110528,  1634110528,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.list.__new__' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110528 AND `update_time`=  1634110528 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.list.__new__' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110528 AND `update_time`=  1634110528 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  2,  'path-traversal',  'path-traversal',  1634110528
	,  1634110528,  203,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.format',  'P1',  'R',  'false',  'false',  1634110528,  1634110528,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.format' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110528 AND `update_time`=  1634110528 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.format' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110528 AND `update_time`=  1634110528 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  2,  'path-traversal',  'path-traversal',  1634110528
	,  1634110528,  203,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.join',  'P1',  'R',  'false',  'false',  1634110528,  1634110528,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.join' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110528 AND `update_time`=  1634110528 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.join' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110528 AND `update_time`=  1634110528 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  2,  'path-traversal',  'path-traversal',  1634110528
	,  1634110528,  203,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.lower',  'P1',  'R',  'false',  'false',  1634110529,  1634110529,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.lower' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.lower' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  2,  'path-traversal',  'path-traversal',  1634110528
	,  1634110528,  203,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.ljust',  'P1',  'R',  'false',  'false',  1634110529,  1634110529,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.ljust' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.ljust' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  2,  'path-traversal',  'path-traversal',  1634110528
	,  1634110528,  203,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.rjust',  'P1',  'R',  'false',  'false',  1634110529,  1634110529,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.rjust' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.rjust' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  2,  'path-traversal',  'path-traversal',  1634110528
	,  1634110528,  203,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.index',  'P1',  'R',  'false',  'false',  1634110529,  1634110529,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.index' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.index' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  3,  'path-traversal',  'path-traversal',  1634110529
	,  1634110529,  203,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.split',  'P1',  'R',  'false',  'false',  1634110529,  1634110529,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.split' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.split' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  3,  'path-traversal',  'path-traversal',  1634110529
	,  1634110529,  203,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.rjust',  'P1',  'R',  'false',  'false',  1634110529,  1634110529,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.rjust' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.rjust' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  3,  'path-traversal',  'path-traversal',  1634110529
	,  1634110529,  203,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.translate',  'P1',  'R',  'false',  'false',  1634110529,  1634110529,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.translate' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.translate' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  3,  'path-traversal',  'path-traversal',  1634110529
	,  1634110529,  203,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.list.append',  'P1',  'R',  'false',  'false',  1634110529,  1634110529,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.list.append' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.list.append' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  3,  'path-traversal',  'path-traversal',  1634110529
	,  1634110529,  203,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.list.insert',  'P1',  'R',  'false',  'false',  1634110530,  1634110530,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.list.insert' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110530 AND `update_time`=  1634110530 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.list.insert' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110530 AND `update_time`=  1634110530 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  3,  'path-traversal',  'path-traversal',  1634110529
	,  1634110529,  203,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.list.__add__',  'P1',  'R',  'false',  'false',  1634110530,  1634110530,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.list.__add__' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110530 AND `update_time`=  1634110530 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.list.__add__' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110530 AND `update_time`=  1634110530 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  3,  'path-traversal',  'path-traversal',  1634110529
	,  1634110529,  203,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'json.loads',  'P1',  'R',  'false',  'false',  1634110530,  1634110530,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'json.loads' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110530 AND `update_time`=  1634110530 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'json.loads' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110530 AND `update_time`=  1634110530 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  3,  'path-traversal',  'path-traversal',  1634110529
	,  1634110529,  203,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'json.dumps',  'P1',  'R',  'false',  'false',  1634110530,  1634110530,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'json.dumps' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110530 AND `update_time`=  1634110530 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'json.dumps' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110530 AND `update_time`=  1634110530 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  3,  'path-traversal',  'path-traversal',  1634110529
	,  1634110529,  203,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 203
AND enable =  1 AND name_en IS  NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'os.path.join',  'P1',  'R',  'false',  'false',  1634110530,  1634110530,  203,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'os.path.join' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110530 AND `update_time`=  1634110530 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'os.path.join' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110530 AND `update_time`=  1634110530 AND `created_by`= 203 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1634110528
	,  1634110528,  1,  1,  NULL,  'general-rules'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en IS  NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en IS  NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'flask.jsonify',  'P1',  'R',  'false',  'false',  1636081491,  1636081491,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'flask.jsonify' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636081491 AND `update_time`=  1636081491 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'flask.jsonify' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636081491 AND `update_time`=  1636081491 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);



SET FOREIGN_KEY_CHECKS=1;
