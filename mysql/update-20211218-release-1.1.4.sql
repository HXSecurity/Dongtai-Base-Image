SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;


DELETE FROM iast_hook_strategy 
WHERE value = "werkzeug.datastructures.getlist";
DELETE FROM iast_hook_strategy 
WHERE value = "werkzeug.datastructures.TypeConversionDict.get";

DELETE FROM iast_hook_strategy 
WHERE value = "werkzeug.datastructures.MultiDict.__getitem__";

DELETE FROM iast_hook_strategy 
WHERE ( id  IN 
(SELECT hookstrategy_id FROM iast_hook_strategy_type ihst 
WHERE hooktype_id  IN  (SELECT id FROM iast_hook_type 
WHERE  language_id  = 2 AND type = 3)) AND value IN ("builtins.list.__add__","json.loads","json.dumps","os.path.join","builtins.str.rjust","builtins.str.split","builtins.str.translate"
,"builtins.list.append","builtins.list.insert","builtins.list.__add__","json.loads","json.dumps","os.path.join")) OR value IN ("builtins.list.__add__","json.loads","json.dumps","os.path.join","builtins.str.rjust","builtins.str.split","builtins.str.translate"
,"builtins.list.append","builtins.list.insert","builtins.list.__add__","json.loads","json.dumps","os.path.join");

DELETE FROM iast_hook_strategy 
WHERE  (id  IN 
(SELECT hookstrategy_id FROM iast_hook_strategy_type ihst 
WHERE hooktype_id  IN  (SELECT id FROM iast_hook_type 
WHERE  language_id  = 2 AND type = 2)) AND value IN ("builtins.list.__new__","builtins.str.index")) OR value IN ("builtins.list.__new__","builtins.str.index");


SET @NEW_HOOK_TYPE_ID  = (SELECT id FROM iast_hook_type iht 
WHERE name = "不安全的反序列化" and language_id  = 2 and created_by = 1
ORDER BY create_time  ASC LIMIT 1);

UPDATE iast_hook_strategy_type ihst set hooktype_id = @NEW_HOOK_TYPE_ID
WHERE hookstrategy_id IN (SELECT id FROM iast_hook_strategy ihs 
WHERE value = "yaml.unsafe_load" and created_by = 1);

UPDATE iast_hook_strategy_type ihst set hooktype_id = @NEW_HOOK_TYPE_ID
WHERE hookstrategy_id IN (SELECT id FROM iast_hook_strategy ihs 
WHERE value = "yaml.load" and created_by = 1);


INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1634110528
	,  1634110528,  1,  1,  NULL,  'general-rules'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.split',  'P1',  'R',  'false',  'false',  1636026495,  1636026495,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.split' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026495 AND `update_time`=  1636026495 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.split' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026495 AND `update_time`=  1636026495 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.translate',  'P1',  'R',  'false',  'false',  1636026495,  1636026495,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.translate' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026495 AND `update_time`=  1636026495 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.translate' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026495 AND `update_time`=  1636026495 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'json.loads',  'P1',  'R',  'false',  'false',  1636026496,  1636026496,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'json.loads' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026496 AND `update_time`=  1636026496 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'json.loads' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026496 AND `update_time`=  1636026496 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'json.dumps',  'P1',  'R',  'false',  'false',  1636026497,  1636026497,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'json.dumps' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026497 AND `update_time`=  1636026497 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'json.dumps' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026497 AND `update_time`=  1636026497 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'os.path.join',  'P1',  'R',  'false',  'false',  1636026497,  1636026497,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'os.path.join' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026497 AND `update_time`=  1636026497 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'os.path.join' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026497 AND `update_time`=  1636026497 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.fstring',  'P',  'R',  'false',  'false',  1638871319,  1638871319,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.fstring' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1638871319 AND `update_time`=  1638871319 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.fstring' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1638871319 AND `update_time`=  1638871319 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.cformat',  'P',  'R',  'false',  'false',  1638871342,  1638871342,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.cformat' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1638871342 AND `update_time`=  1638871342 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.cformat' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1638871342 AND `update_time`=  1638871342 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.bytes.cformat',  'P',  'R',  'false',  'false',  1638871361,  1638871361,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.bytes.cformat' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1638871361 AND `update_time`=  1638871361 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.bytes.cformat' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1638871361 AND `update_time`=  1638871361 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.bytearray.cformat',  'P',  'R',  'false',  'false',  1638871376,  1638871376,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.bytearray.cformat' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1638871376 AND `update_time`=  1638871376 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.bytearray.cformat' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1638871376 AND `update_time`=  1638871376 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.bytes.decode',  'P',  'R',  'false',  'false',  1638871430,  1638871430,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.bytes.decode' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1638871430 AND `update_time`=  1638871430 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.bytes.decode' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1638871430 AND `update_time`=  1638871430 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.bytearray.__init__',  'P',  'R',  'false',  'false',  1639121191,  1639122715,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.bytearray.__init__' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639121191 AND `update_time`=  1639122715 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.bytearray.__init__' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639121191 AND `update_time`=  1639122715 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.bytes.__new__',  'P',  'R',  'false',  'false',  1639121203,  1639122699,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.bytes.__new__' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639121203 AND `update_time`=  1639122699 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.bytes.__new__' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639121203 AND `update_time`=  1639122699 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.__new__',  'P',  'R',  'false',  'false',  1639121219,  1639122687,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.__new__' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639121219 AND `update_time`=  1639122687 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.__new__' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639121219 AND `update_time`=  1639122687 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.bytearray.decode',  'P',  'R',  'false',  'false',  1639122261,  1639122261,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.bytearray.decode' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639122261 AND `update_time`=  1639122261 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.bytearray.decode' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639122261 AND `update_time`=  1639122261 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.capitalize',  'P',  'R',  'false',  'false',  1639476800,  1639476800,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.capitalize' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639476800 AND `update_time`=  1639476800 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.capitalize' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639476800 AND `update_time`=  1639476800 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.casefold',  'P',  'R',  'false',  'false',  1639476823,  1639476823,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.casefold' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639476823 AND `update_time`=  1639476823 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.casefold' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639476823 AND `update_time`=  1639476823 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.center',  'P',  'R',  'false',  'false',  1639476856,  1639476856,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.center' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639476856 AND `update_time`=  1639476856 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.center' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639476856 AND `update_time`=  1639476856 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.concat',  'P',  'R',  'false',  'false',  1639476872,  1639476872,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.concat' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639476872 AND `update_time`=  1639476872 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.concat' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639476872 AND `update_time`=  1639476872 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.lstrip',  'P',  'R',  'false',  'false',  1639476909,  1639476909,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.lstrip' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639476909 AND `update_time`=  1639476909 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.lstrip' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639476909 AND `update_time`=  1639476909 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.partition',  'P',  'R',  'false',  'false',  1639476928,  1639476928,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.partition' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639476928 AND `update_time`=  1639476928 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.partition' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639476928 AND `update_time`=  1639476928 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.removeprefix',  'P',  'R',  'false',  'false',  1639476955,  1639476955,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.removeprefix' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639476955 AND `update_time`=  1639476955 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.removeprefix' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639476955 AND `update_time`=  1639476955 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.removesuffix',  'P',  'R',  'false',  'false',  1639476980,  1639476980,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.removesuffix' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639476980 AND `update_time`=  1639476980 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.removesuffix' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639476980 AND `update_time`=  1639476980 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.repeat',  'P',  'R',  'false',  'false',  1639477002,  1639477002,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.repeat' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477002 AND `update_time`=  1639477002 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.repeat' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477002 AND `update_time`=  1639477002 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.rpartition',  'P',  'R',  'false',  'false',  1639477032,  1639477032,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.rpartition' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477032 AND `update_time`=  1639477032 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.rpartition' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477032 AND `update_time`=  1639477032 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.rsplit',  'P',  'R',  'false',  'false',  1639477053,  1639477053,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.rsplit' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477053 AND `update_time`=  1639477053 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.rsplit' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477053 AND `update_time`=  1639477053 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.rstrip',  'P',  'R',  'false',  'false',  1639477079,  1639477079,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.rstrip' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477079 AND `update_time`=  1639477079 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.rstrip' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477079 AND `update_time`=  1639477079 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.splitlines',  'P',  'R',  'false',  'false',  1639477111,  1639477111,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.splitlines' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477111 AND `update_time`=  1639477111 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.splitlines' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477111 AND `update_time`=  1639477111 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.strip',  'P',  'R',  'false',  'false',  1639477172,  1639477172,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.strip' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477172 AND `update_time`=  1639477172 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.strip' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477172 AND `update_time`=  1639477172 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.swapcase',  'P',  'R',  'false',  'false',  1639477188,  1639477188,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.swapcase' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477188 AND `update_time`=  1639477188 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.swapcase' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477188 AND `update_time`=  1639477188 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.title',  'P',  'R',  'false',  'false',  1639477207,  1639477207,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.title' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477207 AND `update_time`=  1639477207 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.title' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477207 AND `update_time`=  1639477207 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.upper',  'P',  'R',  'false',  'false',  1639477269,  1639477269,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.upper' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477269 AND `update_time`=  1639477269 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.upper' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477269 AND `update_time`=  1639477269 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.zfill',  'P',  'R',  'false',  'false',  1639477282,  1639477282,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.zfill' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477282 AND `update_time`=  1639477282 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.zfill' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477282 AND `update_time`=  1639477282 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'base64.b64encode',  'P',  'R',  'false',  'false',  1639477320,  1639477320,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'base64.b64encode' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477320 AND `update_time`=  1639477320 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'base64.b64encode' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477320 AND `update_time`=  1639477320 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'base64.b64decode',  'P',  'R',  'false',  'false',  1639477338,  1639477338,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'base64.b64decode' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477338 AND `update_time`=  1639477338 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'base64.b64decode' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477338 AND `update_time`=  1639477338 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'yaml.dump',  'P',  'R',  'false',  'false',  1639477363,  1639477363,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.dump' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477363 AND `update_time`=  1639477363 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.dump' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477363 AND `update_time`=  1639477363 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'yaml.dump_all',  'P',  'R',  'false',  'false',  1639477385,  1639477385,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.dump_all' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477385 AND `update_time`=  1639477385 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.dump_all' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477385 AND `update_time`=  1639477385 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  2,  'general-rules',  'general-rules',  1634110528
	,  1634110528,  1,  1,  NULL,  'general-rules'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'werkzeug.datastructures.getlist',  'P1',  'R',  'false',  'false',  1635748594,  1635748594,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'werkzeug.datastructures.getlist' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1635748594 AND `update_time`=  1635748594 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'werkzeug.datastructures.getlist' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1635748594 AND `update_time`=  1635748594 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  2,  'general-rules',  'general-rules',  1634110528
	,  1634110528,  1,  1,  NULL,  'general-rules'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  2,  'general-rules',  'general-rules',  1634110528
	,  1634110528,  1,  1,  NULL,  'general-rules'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'werkzeug.datastructures.MultiDict.__getitem__',  'P1',  'R',  'false',  'false',  1635748626,  1635748626,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'werkzeug.datastructures.MultiDict.__getitem__' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1635748626 AND `update_time`=  1635748626 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'werkzeug.datastructures.MultiDict.__getitem__' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1635748626 AND `update_time`=  1635748626 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  2,  'general-rules',  'general-rules',  1634110528
	,  1634110528,  1,  1,  NULL,  'general-rules'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'django.http.request.HttpRequest.read',  'P1',  'R',  'false',  'false',  1636026492,  1636026492,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.http.request.HttpRequest.read' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026492 AND `update_time`=  1636026492 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.http.request.HttpRequest.read' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026492 AND `update_time`=  1636026492 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  2,  'general-rules',  'general-rules',  1634110528
	,  1634110528,  1,  1,  NULL,  'general-rules'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  2,  'general-rules',  'general-rules',  1634110528
	,  1634110528,  1,  1,  NULL,  'general-rules'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'werkzeug.datastructures.TypeConversionDict.get',  'P1',  'R',  'false',  'false',  1636026492,  1636026492,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'werkzeug.datastructures.TypeConversionDict.get' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026492 AND `update_time`=  1636026492 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'werkzeug.datastructures.TypeConversionDict.get' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026492 AND `update_time`=  1636026492 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  2,  'general-rules',  'general-rules',  1634110528
	,  1634110528,  1,  1,  NULL,  'general-rules'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  2,  'general-rules',  'general-rules',  1634110528
	,  1634110528,  1,  1,  NULL,  'general-rules'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'werkzeug.wrappers.request.Request.get_data',  'P1',  'R',  'false',  'false',  1636026493,  1636026493,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'werkzeug.wrappers.request.Request.get_data' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026493 AND `update_time`=  1636026493 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'werkzeug.wrappers.request.Request.get_data' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026493 AND `update_time`=  1636026493 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  2,  'general-rules',  'general-rules',  1634110528
	,  1634110528,  1,  1,  NULL,  'general-rules'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'werkzeug.wrappers.base_request.BaseRequest.get_data',  'P1',  'R',  'all',  'false',  1639023166,  1639023166,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'werkzeug.wrappers.base_request.BaseRequest.get_data' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'all' AND `track`= 'false' AND `create_time`=  1639023166 AND `update_time`=  1639023166 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'werkzeug.wrappers.base_request.BaseRequest.get_data' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'all' AND `track`= 'false' AND `create_time`=  1639023166 AND `update_time`=  1639023166 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  3,  'general-rules',  'general-rules',  1634110529
	,  1634110529,  1,  1,  NULL,  'general-rules'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'markupsafe.escape',  'P',  'R',  'false',  'false',  1639378209,  1639451258,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'markupsafe.escape' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639378209 AND `update_time`=  1639451258 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'markupsafe.escape' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639378209 AND `update_time`=  1639451258 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  3,  'general-rules',  'general-rules',  1634110529
	,  1634110529,  1,  1,  NULL,  'general-rules'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'markupsafe.escape_silent',  'P',  'R',  'false',  'false',  1639451276,  1639473804,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'markupsafe.escape_silent' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639451276 AND `update_time`=  1639473804 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'markupsafe.escape_silent' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639451276 AND `update_time`=  1639473804 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  3,  'general-rules',  'general-rules',  1634110529
	,  1634110529,  1,  1,  NULL,  'general-rules'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'jinja2.runtime.escape',  'P',  'R',  'false',  'false',  1639463855,  1639463855,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'jinja2.runtime.escape' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639463855 AND `update_time`=  1639463855 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'jinja2.runtime.escape' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639463855 AND `update_time`=  1639463855 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  3,  'general-rules',  'general-rules',  1634110529
	,  1634110529,  1,  1,  NULL,  'general-rules'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'html.escape',  'P',  'R',  'false',  'false',  1639464665,  1639464665,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'html.escape' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639464665 AND `update_time`=  1639464665 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'html.escape' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639464665 AND `update_time`=  1639464665 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'reflected-xss',  'reflected-xss',  1636026489
	,  1636026489,  1,  1,  NULL,  'reflected-xss'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'reflected-xss'
AND  value =  'reflected-xss' AND
update_time= 1636026489 AND create_time= 1636026489 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'reflected-xss' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'reflected-xss'
AND  value =  'reflected-xss' AND
update_time= 1636026489 AND create_time= 1636026489 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'reflected-xss' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'flask.app.Flask.make_response',  'P1',  'R',  'false',  'false',  1636026489,  1636026489,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'flask.app.Flask.make_response' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026489 AND `update_time`=  1636026489 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'flask.app.Flask.make_response' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026489 AND `update_time`=  1636026489 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'reflected-xss',  'reflected-xss',  1636026489
	,  1636026489,  1,  1,  NULL,  'reflected-xss'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'reflected-xss'
AND  value =  'reflected-xss' AND
update_time= 1636026489 AND create_time= 1636026489 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'reflected-xss' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'reflected-xss'
AND  value =  'reflected-xss' AND
update_time= 1636026489 AND create_time= 1636026489 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'reflected-xss' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'django.http.response.HttpResponse.__init__',  'P1',  'R',  'false',  'false',  1636026489,  1636026489,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.http.response.HttpResponse.__init__' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026489 AND `update_time`=  1636026489 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.http.response.HttpResponse.__init__' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026489 AND `update_time`=  1636026489 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'xxe',  'xxe',  1636026489
	,  1636026489,  1,  1,  NULL,  'xxe'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'xxe'
AND  value =  'xxe' AND
update_time= 1636026489 AND create_time= 1636026489 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'xxe' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'xxe'
AND  value =  'xxe' AND
update_time= 1636026489 AND create_time= 1636026489 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'xxe' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'lxml.etree.fromstring',  'P1',  'R',  'false',  'false',  1636026490,  1636026490,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'lxml.etree.fromstring' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026490 AND `update_time`=  1636026490 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'lxml.etree.fromstring' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026490 AND `update_time`=  1636026490 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'xxe',  'xxe',  1636026489
	,  1636026489,  1,  1,  NULL,  'xxe'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'xxe'
AND  value =  'xxe' AND
update_time= 1636026489 AND create_time= 1636026489 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'xxe' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'xxe'
AND  value =  'xxe' AND
update_time= 1636026489 AND create_time= 1636026489 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'xxe' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'lxml.etree.parse',  'P1',  'R',  'false',  'false',  1636026490,  1636026490,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'lxml.etree.parse' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026490 AND `update_time`=  1636026490 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'lxml.etree.parse' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026490 AND `update_time`=  1636026490 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'ssrf',  'ssrf',  1636026490
	,  1636026490,  1,  1,  NULL,  'ssrf'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'ssrf'
AND  value =  'ssrf' AND
update_time= 1636026490 AND create_time= 1636026490 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'ssrf' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'ssrf'
AND  value =  'ssrf' AND
update_time= 1636026490 AND create_time= 1636026490 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'ssrf' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'urllib.request.urlopen',  'P1',  'R',  'false',  'false',  1636026490,  1636026490,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'urllib.request.urlopen' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026490 AND `update_time`=  1636026490 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'urllib.request.urlopen' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026490 AND `update_time`=  1636026490 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'ssrf',  'ssrf',  1636026490
	,  1636026490,  1,  1,  NULL,  'ssrf'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'ssrf'
AND  value =  'ssrf' AND
update_time= 1636026490 AND create_time= 1636026490 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'ssrf' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'ssrf'
AND  value =  'ssrf' AND
update_time= 1636026490 AND create_time= 1636026490 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'ssrf' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'requests.sessions.Session.request',  'P1',  'R',  'false',  'false',  1636026491,  1636026491,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'requests.sessions.Session.request' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026491 AND `update_time`=  1636026491 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'requests.sessions.Session.request' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026491 AND `update_time`=  1636026491 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '不安全的反序列化',  'unsafe-json-deserialize',  1610535131
	,  1610535131,  1,  1,  'Untrusted Deserialization',  '不安全的反序列化'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的反序列化'
AND  value =  'unsafe-json-deserialize' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Untrusted Deserialization'AND name_zh =  '不安全的反序列化' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的反序列化'
AND  value =  'unsafe-json-deserialize' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Untrusted Deserialization'AND name_zh =  '不安全的反序列化' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'pickle.load',  'R',  '',  'all',  'true',  1639039107,  1639125353,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'pickle.load' AND `source`= 'R' AND `target`= '' AND `inherit`= 'all' AND `track`= 'true' AND `create_time`=  1639039107 AND `update_time`=  1639125353 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'pickle.load' AND `source`= 'R' AND `target`= '' AND `inherit`= 'all' AND `track`= 'true' AND `create_time`=  1639039107 AND `update_time`=  1639125353 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '不安全的反序列化',  'unsafe-json-deserialize',  1610535131
	,  1610535131,  1,  1,  'Untrusted Deserialization',  '不安全的反序列化'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的反序列化'
AND  value =  'unsafe-json-deserialize' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Untrusted Deserialization'AND name_zh =  '不安全的反序列化' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的反序列化'
AND  value =  'unsafe-json-deserialize' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Untrusted Deserialization'AND name_zh =  '不安全的反序列化' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'pickle.loads',  'P',  '',  'false',  'true',  1639473996,  1639473996,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'pickle.loads' AND `source`= 'P' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1639473996 AND `update_time`=  1639473996 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'pickle.loads' AND `source`= 'P' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1639473996 AND `update_time`=  1639473996 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '不安全的反序列化',  'unsafe-json-deserialize',  1610535131
	,  1610535131,  1,  1,  'Untrusted Deserialization',  '不安全的反序列化'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的反序列化'
AND  value =  'unsafe-json-deserialize' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Untrusted Deserialization'AND name_zh =  '不安全的反序列化' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的反序列化'
AND  value =  'unsafe-json-deserialize' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Untrusted Deserialization'AND name_zh =  '不安全的反序列化' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'yaml.unsafe_load_all',  'P',  '',  'false',  'true',  1639476580,  1639476580,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.unsafe_load_all' AND `source`= 'P' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1639476580 AND `update_time`=  1639476580 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.unsafe_load_all' AND `source`= 'P' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1639476580 AND `update_time`=  1639476580 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '不安全的反序列化',  'unsafe-json-deserialize',  1610535131
	,  1610535131,  1,  1,  'Untrusted Deserialization',  '不安全的反序列化'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的反序列化'
AND  value =  'unsafe-json-deserialize' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Untrusted Deserialization'AND name_zh =  '不安全的反序列化' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的反序列化'
AND  value =  'unsafe-json-deserialize' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Untrusted Deserialization'AND name_zh =  '不安全的反序列化' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'yaml.load_all',  'P',  '',  'false',  'true',  1639476599,  1639476599,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.load_all' AND `source`= 'P' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1639476599 AND `update_time`=  1639476599 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.load_all' AND `source`= 'P' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1639476599 AND `update_time`=  1639476599 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);

INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  2,  'general-rules',  'general-rules',  1634110528
	,  1634110528,  1,  1,  NULL,  'general-rules'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'werkzeug.datastructures.getlist',  'P1',  'R',  'false',  'false',  1635748594,  1635748594,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'werkzeug.datastructures.getlist' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1635748594 AND `update_time`=  1635748594 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'werkzeug.datastructures.getlist' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1635748594 AND `update_time`=  1635748594 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  2,  'general-rules',  'general-rules',  1634110528
	,  1634110528,  1,  1,  NULL,  'general-rules'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  2,  'general-rules',  'general-rules',  1634110528
	,  1634110528,  1,  1,  NULL,  'general-rules'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);



INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1634110528
	,  1634110528,  1,  1,  NULL,  'general-rules'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.rjust',  'P1',  'R',  'false',  'false',  1636026495,  1636026495,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.rjust' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026495 AND `update_time`=  1636026495 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.rjust' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026495 AND `update_time`=  1636026495 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.replace',  'P',  'R',  'false',  'false',  1639819168,  1639819168,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.replace' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639819168 AND `update_time`=  1639819168 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.replace' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639819168 AND `update_time`=  1639819168 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);

CREATE INDEX sca_maven_artifact_signature_IDX USING BTREE ON sca_maven_artifact (signature);
ALTER TABLE iast_project ADD CONSTRAINT iast_project_PK PRIMARY KEY (name,user_id);


SET FOREIGN_KEY_CHECKS=1;

