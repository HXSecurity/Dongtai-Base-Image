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

UPDATE IGNORE iast_strategy
SET vul_fix='1、尽量不要执行外部的应用程序或命令。

2、使用自定义函数或函数库实现外部应用程序或命令的功能。

3、在执行system、eval等命令执行功能的函数前，确定参数内容。

4、使用escapeshellarg函数处理相关参数。Escapeshellarg函数会将任何引起参数或命令结束的字符进行转义，如单引号“’”会被转义为“\’”，双引号“””会被转义为“\””，分号“;”会被转义为“;”，这样escapeshellarg会将参数内容限制在一对单引号或双引号里面，转义参数中所包含的单引号或双引号，使其无法对当前执行进行截断，实现防范命令注入攻击的目的。

5、使用safe_mode_exec_dir执行可执行的文件路径。将php.ini文件中的safe_mode设置为On，然后将允许执行的文件放入一个目录中，并使用safe_mode_exec_dir指定这个可执行的文件路径。这样，在需要执行相应的外部程序时，程序必须在safe_mode_exec_dir指定的目录中才会允许执行，否则执行将失败。', 
vul_fix_zh='1、尽量不要执行外部的应用程序或命令。

2、使用自定义函数或函数库实现外部应用程序或命令的功能。

3、在执行system、eval等命令执行功能的函数前，确定参数内容。

4、使用escapeshellarg函数处理相关参数。Escapeshellarg函数会将任何引起参数或命令结束的字符进行转义，如单引号“’”会被转义为“\’”，双引号“””会被转义为“\””，分号“;”会被转义为“;”，这样escapeshellarg会将参数内容限制在一对单引号或双引号里面，转义参数中所包含的单引号或双引号，使其无法对当前执行进行截断，实现防范命令注入攻击的目的。

5、使用safe_mode_exec_dir执行可执行的文件路径。将php.ini文件中的safe_mode设置为On，然后将允许执行的文件放入一个目录中，并使用safe_mode_exec_dir指定这个可执行的文件路径。这样，在需要执行相应的外部程序时，程序必须在safe_mode_exec_dir指定的目录中才会允许执行，否则执行将失败。'
WHERE vul_name='命令执行';

UPDATE IGNORE iast_strategy
SET vul_fix='1、输入数据验证 　　

应用程序用到的所有输入数据，包括非用户直接提供的数据和应用程序内部使用的数据，都必须进行无害化处理，删掉所有可能被恶意使用的字符。在利用数据进行任何操作之前，必须进行合法性检验。如前所述，在执行一个新的IMAP/SMTP命令时，要求前面的命令必须用CRLF结束。为了确保无法注入额外的命令，您可以在将其传递给邮件服务器之前删除输入数据中的这类字符。 　　

2、IMAP/SMTP服务器的配置 　　

如果只有通过webmail应用程序才能访问邮件服务器的话，这些服务器必须对国际互联网是不可见的。除此之外，还要对这些服务器进一步加固，比如禁用非绝对必要得命令等等。从而使邮件服务器注射攻击的影响降低到最小程度。 　　

3、应用程序防火墙 　　

如果我们已经用其它的保护系统部署了一个应用程序防火墙，那么可以添加一条规则，来过滤有邮件服务器注射缺陷的参数，从而防止这些命令被注入到邮件服务器中。比如，可以将ModSecurity用作应用程序防火墙。根据前面介绍的SquirrelMail示例，可以添加如下规则： 　　`SecFilterselective "ARG_mailbox" "rn" `　　这会过滤掉参数"mailbox"中注入的序列。', 
vul_fix_zh='1、输入数据验证 　　

应用程序用到的所有输入数据，包括非用户直接提供的数据和应用程序内部使用的数据，都必须进行无害化处理，删掉所有可能被恶意使用的字符。在利用数据进行任何操作之前，必须进行合法性检验。如前所述，在执行一个新的IMAP/SMTP命令时，要求前面的命令必须用CRLF结束。为了确保无法注入额外的命令，您可以在将其传递给邮件服务器之前删除输入数据中的这类字符。 　　

2、IMAP/SMTP服务器的配置 　　

如果只有通过webmail应用程序才能访问邮件服务器的话，这些服务器必须对国际互联网是不可见的。除此之外，还要对这些服务器进一步加固，比如禁用非绝对必要得命令等等。从而使邮件服务器注射攻击的影响降低到最小程度。 　　

3、应用程序防火墙 　　

如果我们已经用其它的保护系统部署了一个应用程序防火墙，那么可以添加一条规则，来过滤有邮件服务器注射缺陷的参数，从而防止这些命令被注入到邮件服务器中。比如，可以将ModSecurity用作应用程序防火墙。根据前面介绍的SquirrelMail示例，可以添加如下规则： 　　`SecFilterselective "ARG_mailbox" "rn" `　　这会过滤掉参数"mailbox"中注入的序列。'
WHERE vul_name='SMTP注入';
UPDATE IGNORE iast_strategy
SET vul_fix='1、过滤返回信息，验证远程服务器对请求的响应是比较容易的方法。如果web应用是去获取某一种类型的文件。那么在把返回结果展示给用户之前先验证返回的信息是否符合标准。统一错误信息，避免用户可以根据错误信息来判断远端服务器的端口状态。

2、限制请求的端口为http常用的端口，比如，80,443,8080,8090。

3、黑名单内网ip。避免应用被用来获取获取内网数据，攻击内网。

4、禁用不需要的协议。仅仅允许http和https请求。可以防止类似于file:///,gopher://,ftp:// 等引起的问题。', 
vul_fix_zh='1、过滤返回信息，验证远程服务器对请求的响应是比较容易的方法。如果web应用是去获取某一种类型的文件。那么在把返回结果展示给用户之前先验证返回的信息是否符合标准。统一错误信息，避免用户可以根据错误信息来判断远端服务器的端口状态。

2、限制请求的端口为http常用的端口，比如，80,443,8080,8090。

3、黑名单内网ip。避免应用被用来获取获取内网数据，攻击内网。

4、禁用不需要的协议。仅仅允许http和https请求。可以防止类似于file:///,gopher://,ftp:// 等引起的问题。'
WHERE vul_name='服务器端请求伪造';

UPDATE IGNORE iast_strategy
SET vul_fix='若可以尽量不使用XMLDecoder反序列化XML内容；

若使用则尽量确保参数不可由外界输入，尽量以白名单的方式限定XML文档名且结合严格的过滤机制。', 
vul_fix_zh='若可以尽量不使用XMLDecoder反序列化XML内容；

若使用则尽量确保参数不可由外界输入，尽量以白名单的方式限定XML文档名且结合严格的过滤机制。'
WHERE vul_name='不安全的XML Decode';

UPDATE IGNORE iast_strategy
SET vul_fix='防范SQL注入，标准方案为输入验证与参数化查询相结合。

输入验证分为白名单和黑名单两种方式，通常在系统中是结合到一起来完成输入验证，具体实现通过正则表达式来完成。需要注意以下几方面：

(1) 在可信系统（比如：服务器）上执行所有的数据验证。

(2) 验证所有来自不可信数据源（比如：数据库，文件流，等）的数据。

(3) 应当为应用程序应提供一个集中的输入验证机制和规则。

(4) 为所有输入明确恰当的字符集，比如：UTF-8。在输入验证前，将数据按照常用字符进行编码（规范化）。如果进行关键字的验证，请先统一大小写。

(5) 验证的不仅是参数，包含所有来自客户端的数据，包括：所有参数、URL、HTTP头信息（比如：cookie名字和数据值）。

(6) 验证正确的数据类型、验证数据范围、验证数据长度。

(7) 请考虑是否允许输入常见危险字符。部分常见的危险字符包括：< > "" '' % ( ) & +  '' "" 。

(8) 特殊字符单独验证：空字节 (%00)；换行符 (%0d, %0a, 
, 
)；路径替代字符“点-点-斜杠”（../或 ..）。验证替代字符： %c0%ae%c0%ae/ (使用规范化 验证双编码或其他类型的编码攻击)。

参考代码：

(1) 使用特殊字符过滤程序防护SQL注入攻击：

代码功能：对HTTP请求中的所有参数进行危险字符过滤，发现危险字符可跳转到相应的错误页面。
```java
public void doFilter(ServletRequest args0,
ServletResponse args1,FilterChain chain)
throws IOException, ServletException {
HttpServletRequest req=(HttpServletRequest)args0;
HttpServletResponse res=(HttpServletResponse)args1;
//获得所有请求参数名
Enumeration params = req.getParameterNames();
String sql = """";
while (params.hasMoreElements()) {
//得到参数名
String name = params.nextElement().toString();
//得到参数对应值
String[] value = req.getParameterValues(name);
for (int i = 0; i < value.length; i++) {
sql = sql + value[i];
}
}
//有sql注入和XSS危险字符
if (sqlValidate(sql)) {
throw new IOException(""请求有非法字符：""+sql);
} else {
chain.doFilter(args0,args1);
}
}
protected static boolean sqlValidate(String str) {
str = str.toLowerCase(); //统一转为小写
String badStr = ""and|exec|insert|select|delete
|update|count|union|master|truncate|char|declare
|cast|set|fetch|varchar|sysobjects|drop
|`|''|""|<|>|(|)|/||=|+|-|#|*|;|%"";
String[] badStrs = badStr.split(""|"");
for (int i = 0; i < badStrs.length; i++) {
if (str.indexOf(badStrs[i]) >= 0) {
return true; //参数中包含要过滤关键字;
}
}
return false; //参数中不包含要过滤关键字;
}
```
(2) 通过参数化查询方式进行SQL注入攻击防护：
```java
String sql = “select * from product where cat=’?’ and price >’?’”;
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setInt(1, request.getParameter(“cat”));
pstmt.setString(2, request.getParameter(“price”));
ResultSet rs = pstmt.executeQuery();
```
(3) 使用MyBatis技术，通过Mapper.xml文件定义SQL语句进行SQL注入攻击防护：
```
<mapper namespace="TestUser"> //命名空间
<select id="getById" parameterType="java.lang.String"
resultMap="TestFlowResult">
select
<include refid="TestFlowColumns" />
```


在编写mybatis的映射语句时，尽量采用“#{xxx}”这样的格式。若不得不使用“NULL”这样的参数，要手工地做好过滤工作，来防止sql注入攻击。

(4) 强类型的参数化查询，即在数据库增加、查询、更新操作时，sql语句中所有输入参数统一采用#param#方式。示例如下:
<update id=""updatePtaskDetailState"" parameterClass=""java.lang.String"">
update ZX_PTASKDETAIL set BATCHJNLNOSTATE = ''4'' where JNLNO = #jnlNo#
}
(5)需要使用like语句的地方可以使用''%''||#param#||''%''或concat(concat(''%'',#param#),''%'')避免注入。示例如下
select * from ZX_PCIF where name like ''%''||#name#||''%''', 
vul_fix_zh='防范SQL注入，标准方案为输入验证与参数化查询相结合。

输入验证分为白名单和黑名单两种方式，通常在系统中是结合到一起来完成输入验证，具体实现通过正则表达式来完成。需要注意以下几方面：

(1) 在可信系统（比如：服务器）上执行所有的数据验证。

(2) 验证所有来自不可信数据源（比如：数据库，文件流，等）的数据。

(3) 应当为应用程序应提供一个集中的输入验证机制和规则。

(4) 为所有输入明确恰当的字符集，比如：UTF-8。在输入验证前，将数据按照常用字符进行编码（规范化）。如果进行关键字的验证，请先统一大小写。

(5) 验证的不仅是参数，包含所有来自客户端的数据，包括：所有参数、URL、HTTP头信息（比如：cookie名字和数据值）。

(6) 验证正确的数据类型、验证数据范围、验证数据长度。

(7) 请考虑是否允许输入常见危险字符。部分常见的危险字符包括：< > "" '' % ( ) & +  '' "" 。

(8) 特殊字符单独验证：空字节 (%00)；换行符 (%0d, %0a, 
, 
)；路径替代字符“点-点-斜杠”（../或 ..）。验证替代字符： %c0%ae%c0%ae/ (使用规范化 验证双编码或其他类型的编码攻击)。

参考代码：

(1) 使用特殊字符过滤程序防护SQL注入攻击：

代码功能：对HTTP请求中的所有参数进行危险字符过滤，发现危险字符可跳转到相应的错误页面。
```java
public void doFilter(ServletRequest args0,
ServletResponse args1,FilterChain chain)
throws IOException, ServletException {
HttpServletRequest req=(HttpServletRequest)args0;
HttpServletResponse res=(HttpServletResponse)args1;
//获得所有请求参数名
Enumeration params = req.getParameterNames();
String sql = """";
while (params.hasMoreElements()) {
//得到参数名
String name = params.nextElement().toString();
//得到参数对应值
String[] value = req.getParameterValues(name);
for (int i = 0; i < value.length; i++) {
sql = sql + value[i];
}
}
//有sql注入和XSS危险字符
if (sqlValidate(sql)) {
throw new IOException(""请求有非法字符：""+sql);
} else {
chain.doFilter(args0,args1);
}
}
protected static boolean sqlValidate(String str) {
str = str.toLowerCase(); //统一转为小写
String badStr = ""and|exec|insert|select|delete
|update|count|union|master|truncate|char|declare
|cast|set|fetch|varchar|sysobjects|drop
|`|''|""|<|>|(|)|/||=|+|-|#|*|;|%"";
String[] badStrs = badStr.split(""|"");
for (int i = 0; i < badStrs.length; i++) {
if (str.indexOf(badStrs[i]) >= 0) {
return true; //参数中包含要过滤关键字;
}
}
return false; //参数中不包含要过滤关键字;
}
```
(2) 通过参数化查询方式进行SQL注入攻击防护：
```java
String sql = “select * from product where cat=’?’ and price >’?’”;
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setInt(1, request.getParameter(“cat”));
pstmt.setString(2, request.getParameter(“price”));
ResultSet rs = pstmt.executeQuery();
```
(3) 使用MyBatis技术，通过Mapper.xml文件定义SQL语句进行SQL注入攻击防护：
```
<mapper namespace="TestUser"> //命名空间
<select id="getById" parameterType="java.lang.String"
resultMap="TestFlowResult">
select
<include refid="TestFlowColumns" />
```


在编写mybatis的映射语句时，尽量采用“#{xxx}”这样的格式。若不得不使用“NULL”这样的参数，要手工地做好过滤工作，来防止sql注入攻击。

(4) 强类型的参数化查询，即在数据库增加、查询、更新操作时，sql语句中所有输入参数统一采用#param#方式。示例如下:
<update id=""updatePtaskDetailState"" parameterClass=""java.lang.String"">
update ZX_PTASKDETAIL set BATCHJNLNOSTATE = ''4'' where JNLNO = #jnlNo#
}
(5)需要使用like语句的地方可以使用''%''||#param#||''%''或concat(concat(''%'',#param#),''%'')避免注入。示例如下
select * from ZX_PCIF where name like ''%''||#name#||''%'''
WHERE vul_name='SQL注入';
UPDATE IGNORE iast_strategy
SET vul_fix='1、使用正面验证。字母数字过滤（A..Z,a..z,0..9）适合大部分 LDAP 查询。

2、 应该过滤出或进行转义的特殊 LDAP 字符：

[1] 在字符串开头的空格或“#”字符
[2] 在字符串结尾的空格字符
[3] ,（逗号）
[4] +（加号）
[5] ""（引号）
[6] （反斜杠）
[7] <>（尖括号）
[8] ;（分号）
[9] ()（括号）', 
vul_fix_zh='1、使用正面验证。字母数字过滤（A..Z,a..z,0..9）适合大部分 LDAP 查询。

2、 应该过滤出或进行转义的特殊 LDAP 字符：

[1] 在字符串开头的空格或“#”字符
[2] 在字符串结尾的空格字符
[3] ,（逗号）
[4] +（加号）
[5] ""（引号）
[6] （反斜杠）
[7] <>（尖括号）
[8] ;（分号）
[9] ()（括号）'
WHERE vul_name='LDAP注入';
UPDATE IGNORE iast_strategy
SET vul_fix='1、数据提交到服务器上端，在服务端正式处理这批数据之前，对提交数据的合法性进行验证。

2、检查提交的数据是否包含特殊字符，对特殊字符进行编码转换或替换、删除敏感字符或字符串，如过滤[] ‘ “ and or 等全部过滤，像单双引号这类，可以对这类特殊字符进行编码转换或替换

3、对于系统出现的错误信息，以IE错误编码信息替换，屏蔽系统本身的出错信息或者用统一的报错页面代替（如updataxml()这类）
参数化XPath查询，将需要构建的XPath查询表达式，以变量的形式表示，变量不是可以执行的脚本。。如下代码可以通过创建保存查询的外部文件使查询参数化：
```
    declare variable $loginID as xs：string external；
    declare variable $password as xs：string external；
    //users/user[@loginid=$loginID and@password= $password]
```

4、通过MD5、SSL等加密算法，对于数据敏感信息和在数据传输过程中加密，即使某些非法用户通过非法手法获取数据包，看到的也是加密后的信息。 总结下就是：限制提交非法字符，对输入内容严格检查过滤，参数化XPath查询的变量。

5、验证是否包含特定的 XPath 函数，可以过滤掉一些 XPath 函数，以提高安全性，当然了不能以牺牲用户体验或影响用户正常使用为前提。
总结下就是：限制提交非法字符，对输入内容严格检查过滤，参数化XPath查询的变量', 
vul_fix_zh='1、数据提交到服务器上端，在服务端正式处理这批数据之前，对提交数据的合法性进行验证。

2、检查提交的数据是否包含特殊字符，对特殊字符进行编码转换或替换、删除敏感字符或字符串，如过滤[] ‘ “ and or 等全部过滤，像单双引号这类，可以对这类特殊字符进行编码转换或替换

3、对于系统出现的错误信息，以IE错误编码信息替换，屏蔽系统本身的出错信息或者用统一的报错页面代替（如updataxml()这类）
参数化XPath查询，将需要构建的XPath查询表达式，以变量的形式表示，变量不是可以执行的脚本。。如下代码可以通过创建保存查询的外部文件使查询参数化：
```
    declare variable $loginID as xs：string external；
    declare variable $password as xs：string external；
    //users/user[@loginid=$loginID and@password= $password]
```

4、通过MD5、SSL等加密算法，对于数据敏感信息和在数据传输过程中加密，即使某些非法用户通过非法手法获取数据包，看到的也是加密后的信息。 总结下就是：限制提交非法字符，对输入内容严格检查过滤，参数化XPath查询的变量。

5、验证是否包含特定的 XPath 函数，可以过滤掉一些 XPath 函数，以提高安全性，当然了不能以牺牲用户体验或影响用户正常使用为前提。
总结下就是：限制提交非法字符，对输入内容严格检查过滤，参数化XPath查询的变量'
WHERE vul_name='XPATH注入';
UPDATE IGNORE iast_strategy
SET vul_fix='防止文件路径遍历漏洞的最有效方法是避免将用户提供的输入完全传递给文件系统API。

如果认为不可避免的是将用户提供的输入传递给文件系统API，则应同时使用两层防御，以防止受到攻击：

应用程序应在处理之前验证用户输入。理想情况下，验证应与允许值的白名单进行比较。如果所需的功能无法做到这一点，则验证应验证输入内容仅包含允许的内容，例如纯字母数字字符。

验证提供的输入后，应用程序应将输入附加到基本目录，并使用平台文件系统API规范化路径。验证规范化路径以预期的基本目录开头。

以下是一些简单的Java代码示例，用于根据用户输入来验证文件的规范路径：
```java
File file = new File(BASE_DIRECTORY, userInput);
if (file.getCanonicalPath().startsWith(BASE_DIRECTORY)) {
// process file
}
```', 
vul_fix_zh='防止文件路径遍历漏洞的最有效方法是避免将用户提供的输入完全传递给文件系统API。

如果认为不可避免的是将用户提供的输入传递给文件系统API，则应同时使用两层防御，以防止受到攻击：

应用程序应在处理之前验证用户输入。理想情况下，验证应与允许值的白名单进行比较。如果所需的功能无法做到这一点，则验证应验证输入内容仅包含允许的内容，例如纯字母数字字符。

验证提供的输入后，应用程序应将输入附加到基本目录，并使用平台文件系统API规范化路径。验证规范化路径以预期的基本目录开头。

以下是一些简单的Java代码示例，用于根据用户输入来验证文件的规范路径：
```java
File file = new File(BASE_DIRECTORY, userInput);
if (file.getCanonicalPath().startsWith(BASE_DIRECTORY)) {
// process file
}
```'
WHERE vul_name='路径穿越';
UPDATE IGNORE iast_strategy
SET vul_fix='1、使用目前被业界专家认为较强的经过良好审核的加密PRNG算法，初始化随机数生成器时使用具有足够长度且不固定的种子。

2、在安全性要求较高的应用中，应使用更安全的随机数生成器，如java.security.SecureRandom类。', 
vul_fix_zh='1、使用目前被业界专家认为较强的经过良好审核的加密PRNG算法，初始化随机数生成器时使用具有足够长度且不固定的种子。

2、在安全性要求较高的应用中，应使用更安全的随机数生成器，如java.security.SecureRandom类。'
WHERE vul_name='弱随机数算法';
UPDATE IGNORE iast_strategy
SET vul_fix='库或框架当需要存储或传输敏感数据时，请使用强大的最新加密算法来加密该数据。选择目前被该领域专家认为强大的经过充分审查的算法，并使用经过充分测试的实现。与所有加密机制一样，源代码应该可供分析。', 
vul_fix_zh='库或框架当需要存储或传输敏感数据时，请使用强大的最新加密算法来加密该数据。选择目前被该领域专家认为强大的经过充分审查的算法，并使用经过充分测试的实现。与所有加密机制一样，源代码应该可供分析。'
WHERE vul_name='弱哈希算法';
UPDATE IGNORE iast_strategy
SET vul_fix='DES等加密算法和 MD5、SHA1及RIPEMD160等哈希算法被视为弱加密算法。与更现代的加密算法相比，加密算法 DES 提供的安全位数更少。推荐使用更强大的加密方式，对于 DES 加密，请使用 Aes、SM4、SM7等加密。对于 SHA1 或 RIPEMD160 哈希函数，请使用SHA-2系列（例如SHA512、SHA384、SHA256），或SM3。', 
vul_fix_zh='DES等加密算法和 MD5、SHA1及RIPEMD160等哈希算法被视为弱加密算法。与更现代的加密算法相比，加密算法 DES 提供的安全位数更少。推荐使用更强大的加密方式，对于 DES 加密，请使用 Aes、SM4、SM7等加密。对于 SHA1 或 RIPEMD160 哈希函数，请使用SHA-2系列（例如SHA512、SHA384、SHA256），或SM3。'
WHERE vul_name='弱加密算法';
UPDATE IGNORE iast_strategy
SET vul_fix='在开发阶段，增加验证逻辑，让数据安全地穿过信任边界，即从不受信任的一边移到受信任的一边。', 
vul_fix_zh='在开发阶段，增加验证逻辑，让数据安全地穿过信任边界，即从不受信任的一边移到受信任的一边。'
WHERE vul_name='信任边界';
UPDATE IGNORE iast_strategy
SET vul_fix='为cookie设置Secure属性
代码如下：
```java
private void writeCookie(HttpServletResponse response, String name, String value, String domain, String path, int maxAge,boolean isSecure) {
Cookie cookie = new Cookie(name, value);
cookie.setVersion(0);
cookie.setPath(path);
cookie.setSecure(isSecure);
if (domain != null) {
cookie.setDomain(domain);
}
cookie.setMaxAge(maxAge);
response.addCookie(cookie);
}
```', 
vul_fix_zh='为cookie设置Secure属性
代码如下：
```java
private void writeCookie(HttpServletResponse response, String name, String value, String domain, String path, int maxAge,boolean isSecure) {
Cookie cookie = new Cookie(name, value);
cookie.setVersion(0);
cookie.setPath(path);
cookie.setSecure(isSecure);
if (domain != null) {
cookie.setDomain(domain);
}
cookie.setMaxAge(maxAge);
response.addCookie(cookie);
}
```'
WHERE vul_name='反射型xss';
UPDATE IGNORE iast_strategy
SET vul_fix='1、在设置HTTP响应头的代码中，过滤回车、换行（%0d，%0a，%0D，%0A)等字符，避免输入的数据污染到其他HTTP头。

2、对参数做合法性校验以及长度限制。

3、不对用户的输入直接输出；', 
vul_fix_zh='1、在设置HTTP响应头的代码中，过滤回车、换行（%0d，%0a，%0D，%0A)等字符，避免输入的数据污染到其他HTTP头。

2、对参数做合法性校验以及长度限制。

3、不对用户的输入直接输出；'
WHERE vul_name='Header头注入';
UPDATE IGNORE iast_strategy
SET vul_fix='1、创建 SQL 数据库的用户帐户时遵循最小权限原则。用户应仅具有使用其帐户所需的最低权限。如果系统要求表明用户可以读取和修改自己的数据，则限制其权限，使其无法读取/写入他人的数据。

2、对于在客户端执行的任何安全检查，请确保在服务器端重复这些检查，以避免CWE-602。攻击者可以通过在执行检查后修改值来绕过客户端检查，或者通过更改客户端以完全删除客户端检查。然后，这些修改后的值将提交给服务器。

3、使用绑定变量的预准备语句实现 SQL 字符串。未绑定变量的准备好的语句可能容易受到攻击。', 
vul_fix_zh='1、创建 SQL 数据库的用户帐户时遵循最小权限原则。用户应仅具有使用其帐户所需的最低权限。如果系统要求表明用户可以读取和修改自己的数据，则限制其权限，使其无法读取/写入他人的数据。

2、对于在客户端执行的任何安全检查，请确保在服务器端重复这些检查，以避免CWE-602。攻击者可以通过在执行检查后修改值来绕过客户端检查，或者通过更改客户端以完全删除客户端检查。然后，这些修改后的值将提交给服务器。

3、使用绑定变量的预准备语句实现 SQL 字符串。未绑定变量的准备好的语句可能容易受到攻击。'
WHERE vul_name='HQL注入';
UPDATE IGNORE iast_strategy
SET vul_fix='建议使用`org.apache.commons.io.input.BoundedInputStream`先对流进行大小限制，再使用`readLine`方法来规避安全风险

```java
InputStream in =new FileInputStream(new File("D:	est.txt"));
BoundedInputStream bis=new BoundedInputStream(in, 1010241024);//限制流的大小为10M,根据实际文件大小可调整
InputStreamReader reader =new InputStreamReader(bis, "UTF-8");
BufferedReader br=new BufferedReader(reader);
String line =br.readLine();
```', 
vul_fix_zh='建议使用`org.apache.commons.io.input.BoundedInputStream`先对流进行大小限制，再使用`readLine`方法来规避安全风险

```java
InputStream in =new FileInputStream(new File("D:	est.txt"));
BoundedInputStream bis=new BoundedInputStream(in, 1010241024);//限制流的大小为10M,根据实际文件大小可调整
InputStreamReader reader =new InputStreamReader(bis, "UTF-8");
BufferedReader br=new BufferedReader(reader);
String line =br.readLine();
```'
WHERE vul_name='不安全的readline';
UPDATE IGNORE iast_strategy
SET vul_fix='1、尽量避免使用外部输入的内容作为EL表达式内容

2、通过参数白名单或者黑名单控制参数的合法性

3、如果涉及到执行表达式的方法传入的参数外部可控，就存在表达式注入的安全风险，需要通过白名单参数校验来限制。
如果是java程序，需搜索检查如下关键类方法
```java
el.ExpressionFactory.createValueExpression()
javax.el.ValueExpression.getValue()
```
指定正确EvaluationContext（针对SpEL表达式注入）

Spring官方推出了SimpleEvaluationContext作为安全类来防御该类漏洞，SimpleEvaluationContext旨在仅支持SpEL语言语法的一个子集。它不包括 Java类型引用，构造函数和bean引用，指定正确EvaluationContext，是防止SpEl表达式注入漏洞产生的首选。', 
vul_fix_zh='1、尽量避免使用外部输入的内容作为EL表达式内容

2、通过参数白名单或者黑名单控制参数的合法性

3、如果涉及到执行表达式的方法传入的参数外部可控，就存在表达式注入的安全风险，需要通过白名单参数校验来限制。
如果是java程序，需搜索检查如下关键类方法
```java
el.ExpressionFactory.createValueExpression()
javax.el.ValueExpression.getValue()
```
指定正确EvaluationContext（针对SpEL表达式注入）

Spring官方推出了SimpleEvaluationContext作为安全类来防御该类漏洞，SimpleEvaluationContext旨在仅支持SpEL语言语法的一个子集。它不包括 Java类型引用，构造函数和bean引用，指定正确EvaluationContext，是防止SpEl表达式注入漏洞产生的首选。'
WHERE vul_name='表达式注入';
UPDATE IGNORE iast_strategy
SET vul_fix='不要将不可信赖的数据用作正则表达式', 
vul_fix_zh='不要将不可信赖的数据用作正则表达式'
WHERE vul_name='正则DOS';
UPDATE IGNORE iast_strategy
SET vul_fix='1、重构代码以避免使用反射;

2、尽量避免使用用户控制的输入来选择和加载类或代码。', 
vul_fix_zh='1、重构代码以避免使用反射;

2、尽量避免使用用户控制的输入来选择和加载类或代码。'
WHERE vul_name='反射注入';
UPDATE IGNORE iast_strategy
SET vul_fix='为了避免 NoSQL 注入，必须始终将用户输入视为不受信任，可以执行以下操作：
使用 sanitization library 。例如，mongo-sanitize 或 mongoose。

如果找不到适合您环境的库，请将用户输入转换为所需的类型。

例如，将用户名和密码转换为字符串。

在 MongoDB 的情况下，切勿在用户输入中使用 where，mapReduce 或 group 运算符，因为这些运算符使攻击者能够注入 JavaScript，因此比其他运算符更加危险。为了加强安全性，在 mongod.conf 如果可能的话，设置 javascriptEnabled 为 false。

此外，请始终使用最小特权模型：以尽可能低的特权运行您的应用程序，以便即使被利用，攻击者也无法访问其他资源', 
vul_fix_zh='为了避免 NoSQL 注入，必须始终将用户输入视为不受信任，可以执行以下操作：
使用 sanitization library 。例如，mongo-sanitize 或 mongoose。

如果找不到适合您环境的库，请将用户输入转换为所需的类型。

例如，将用户名和密码转换为字符串。

在 MongoDB 的情况下，切勿在用户输入中使用 where，mapReduce 或 group 运算符，因为这些运算符使攻击者能够注入 JavaScript，因此比其他运算符更加危险。为了加强安全性，在 mongod.conf 如果可能的话，设置 javascriptEnabled 为 false。

此外，请始终使用最小特权模型：以尽可能低的特权运行您的应用程序，以便即使被利用，攻击者也无法访问其他资源'
WHERE vul_name='NoSql注入';
UPDATE IGNORE iast_strategy
SET vul_fix='1、若跳转的URL事先是可以确定的，包括url和参数的值，则可以在后台先配置好，url参数只需传对应url的索引即可，通过索引找到对应具体url再进行跳转；

2、若跳转的URL事先不确定，但其输入是由后台生成的（不是用户通过参数传人），则可以先生成好跳转链接然后进行签名，而跳转cg首先需要进行验证签名通过才能进行跳转；

3、若1和2都不满足，url事先无法确定，只能通过前端参数传入，则必须在跳转的时候对url进行按规则校验：
即控制url是否是公司授权的白名单或者是符合公司规则的url，参考代码：
```
function checkURL (sURL) {
return (/^(https?://)?[w-.]+.(yourDomainA|yourDomainB|yourDomainC).com($|/|)/i).test
(sUrl)||(/^[w][w/.-_%]+$/i).test(sUrl)||(/^[/][^/\\]/i).test(sUrl) ? true : false;
}
```

4、通过对referer的限制：如果确定传递URL参数进入的来源，我们可以通过该方式实现安全限制，保证该URL的有效性，避免恶意用户自己生成跳转链接；

5、加入有效性验证Token：我们保证所有生成的链接都是来自于我们可信域的，通过在生成的链接里加入用户不可控的Token对生成的链接进行校验，可以避免用户生成自己的恶意链接从而被利用，在跳转时做判断，指定跳转的值。当用户访问需要跳转URL的页面时，生成随机token，并保存到Cookie中，后台应用程序在跳转前，判断token是否和cookie中的token一致。

6、理论上讲，url跳转属于CSRF的一种，跳转url检测中也加入了CRLF头部注入漏洞的检测逻辑, 具体就是在请求参数中加入了%0d%0a这种测试代码，需要对这些参数进行删除处理(事实上：在判断到一个参数中包含 %00 -> %1f 的控制字符时都是不合法的，需对其进行删除)。

7、如果为struts2重定向漏洞，则需要更新相关的struts2的版本到最新。', 
vul_fix_zh='1、若跳转的URL事先是可以确定的，包括url和参数的值，则可以在后台先配置好，url参数只需传对应url的索引即可，通过索引找到对应具体url再进行跳转；

2、若跳转的URL事先不确定，但其输入是由后台生成的（不是用户通过参数传人），则可以先生成好跳转链接然后进行签名，而跳转cg首先需要进行验证签名通过才能进行跳转；

3、若1和2都不满足，url事先无法确定，只能通过前端参数传入，则必须在跳转的时候对url进行按规则校验：
即控制url是否是公司授权的白名单或者是符合公司规则的url，参考代码：
```
function checkURL (sURL) {
return (/^(https?://)?[w-.]+.(yourDomainA|yourDomainB|yourDomainC).com($|/|)/i).test
(sUrl)||(/^[w][w/.-_%]+$/i).test(sUrl)||(/^[/][^/\\]/i).test(sUrl) ? true : false;
}
```

4、通过对referer的限制：如果确定传递URL参数进入的来源，我们可以通过该方式实现安全限制，保证该URL的有效性，避免恶意用户自己生成跳转链接；

5、加入有效性验证Token：我们保证所有生成的链接都是来自于我们可信域的，通过在生成的链接里加入用户不可控的Token对生成的链接进行校验，可以避免用户生成自己的恶意链接从而被利用，在跳转时做判断，指定跳转的值。当用户访问需要跳转URL的页面时，生成随机token，并保存到Cookie中，后台应用程序在跳转前，判断token是否和cookie中的token一致。

6、理论上讲，url跳转属于CSRF的一种，跳转url检测中也加入了CRLF头部注入漏洞的检测逻辑, 具体就是在请求参数中加入了%0d%0a这种测试代码，需要对这些参数进行删除处理(事实上：在判断到一个参数中包含 %00 -> %1f 的控制字符时都是不合法的，需对其进行删除)。

7、如果为struts2重定向漏洞，则需要更新相关的struts2的版本到最新。'
WHERE vul_name='不安全的重定向';
UPDATE IGNORE iast_strategy
SET vul_fix='1、尽量避免使用转发机制，如果使用了，那么在定义目标URL的时候不要包含用户参数。

2、如果一定要保护用户输入的参数，那么：

对每个参数都必须进行验证以确保它的合法性和正确性，或是在服务端提供映射机制，将用户的选择参数转变为真正的白名单目标页面', 
vul_fix_zh='1、尽量避免使用转发机制，如果使用了，那么在定义目标URL的时候不要包含用户参数。

2、如果一定要保护用户输入的参数，那么：

对每个参数都必须进行验证以确保它的合法性和正确性，或是在服务端提供映射机制，将用户的选择参数转变为真正的白名单目标页面'
WHERE vul_name='不安全的转发';
UPDATE IGNORE iast_strategy
SET vul_fix='1、围绕JNI调用实现错误处理，如果使用不受信任的本机库，尽量不使用JNI调用，可调用功能相近的Java API

2、出现JNI漏洞说明服务器可能存在代码执行漏洞，请检查漏洞的位置并限制执行代码的功能。', 
vul_fix_zh='1、围绕JNI调用实现错误处理，如果使用不受信任的本机库，尽量不使用JNI调用，可调用功能相近的Java API

2、出现JNI漏洞说明服务器可能存在代码执行漏洞，请检查漏洞的位置并限制执行代码的功能。'
WHERE vul_name='JNI注入';
UPDATE IGNORE iast_strategy
SET vul_fix='1、使用语言中推荐的禁用外部实体的方法

PHP：
```php
libxml_disable_entity_loader(true);
```
JAVA:
```java
DocumentBuilderFactory dbf =DocumentBuilderFactory.newInstance();
dbf.setExpandEntityReferences(false);
.setFeature("http://apache.org/xml/features/disallow-doctype-decl",true);
.setFeature("http://xml.org/sax/features/external-general-entities",false)
.setFeature("http://xml.org/sax/features/external-parameter-entities",false);
```
Python：
```python
from lxml import etree
xmlData = etree.parse(xmlSource,etree.XMLParser(resolve_entities=False))
```
2、手动黑名单过滤(不推荐)
过滤关键词：', 
vul_fix_zh='1、使用语言中推荐的禁用外部实体的方法

PHP：
```php
libxml_disable_entity_loader(true);
```
JAVA:
```java
DocumentBuilderFactory dbf =DocumentBuilderFactory.newInstance();
dbf.setExpandEntityReferences(false);
.setFeature("http://apache.org/xml/features/disallow-doctype-decl",true);
.setFeature("http://xml.org/sax/features/external-general-entities",false)
.setFeature("http://xml.org/sax/features/external-parameter-entities",false);
```
Python：
```python
from lxml import etree
xmlData = etree.parse(xmlSource,etree.XMLParser(resolve_entities=False))
```
2、手动黑名单过滤(不推荐)
过滤关键词：'
WHERE vul_name='XXE';
UPDATE IGNORE iast_strategy
SET vul_fix='将用户提供的数据写入 JSON 时，应该遵守以下准则：

1、不要创建名称来自用户输入的 JSON 属性。

2、确保使用安全的序列化函数（能够以单引号或双引号分隔不可信赖的数据，并且避免任何特殊字符）执行对 JSON 的所有序列化操作。', 
vul_fix_zh='将用户提供的数据写入 JSON 时，应该遵守以下准则：

1、不要创建名称来自用户输入的 JSON 属性。

2、确保使用安全的序列化函数（能够以单引号或双引号分隔不可信赖的数据，并且避免任何特殊字符）执行对 JSON 的所有序列化操作。'
WHERE vul_name='不安全的JSON反序列化';
UPDATE IGNORE iast_strategy
SET vul_fix='为cookie设置Secure属性
代码如下：
```java
private void writeCookie(HttpServletResponse response, String name, String value, String domain, String path, int maxAge,boolean isSecure) {
Cookie cookie = new Cookie(name, value);
cookie.setVersion(0);
cookie.setPath(path);
cookie.setSecure(isSecure);
if (domain != null) {
cookie.setDomain(domain);
}
cookie.setMaxAge(maxAge);
response.addCookie(cookie);
}
```', 
vul_fix_zh='为cookie设置Secure属性
代码如下：
```java
private void writeCookie(HttpServletResponse response, String name, String value, String domain, String path, int maxAge,boolean isSecure) {
Cookie cookie = new Cookie(name, value);
cookie.setVersion(0);
cookie.setPath(path);
cookie.setSecure(isSecure);
if (domain != null) {
cookie.setDomain(domain);
}
cookie.setMaxAge(maxAge);
response.addCookie(cookie);
}
```'
WHERE vul_name='Response Without Content-Security-Policy Header';
UPDATE IGNORE iast_strategy
SET vul_fix='启用 X-XSS-Protection 并将值设置为 1。
PHP
```
header("X-XSS-Protection: 1; mode=block");
```

Apache (.htaccess)
```
Header set X-XSS-Protection "1; mode=block"
```
nginx
```
add_header "X-XSS-Protection" "1; mode=block";
```', 
vul_fix_zh='启用 X-XSS-Protection 并将值设置为 1。
PHP
```
header("X-XSS-Protection: 1; mode=block");
```

Apache (.htaccess)
```
Header set X-XSS-Protection "1; mode=block"
```
nginx
```
add_header "X-XSS-Protection" "1; mode=block";
```'
WHERE vul_name='Response With X-XSS-Protection Disabled';
UPDATE IGNORE iast_strategy
SET vul_fix='1、修改服务端程序，给HTTP响应头加上Strict-Transport-Security 
如果是java 服务端，可以使用如下方式添加HTTP响应头
```Java
response.setHeader("Strict-Transport-Security"，"value")
```

如果是php 服务端，可以使用如下方式添加HTTP响应头
```php
header(''Strict-Transport-Security:value'')
```
如果是asp服务端，可以使用如下方式添加 HTTP响应头
```
Response.AddHeader "Strict-Transport-Security","value"
```
如果是python django 服务端，可以使用如下方式添加HTTP响应头
```
response=HttpResponse() 
response[''Strict-Transport-Security'']="value”
```
如果是python flask服务端，可以使用如下方式添加 HTTP响应头
```
response=make_ response()
response.headers["Strict-Transport-Security"]="value";
```

2、修改负载均衡或反向代理服务器，给HTTP响应头加上Strict-Transport-Security;

如果使用Nginx、Tengine、Open resty 等作为代理服务器，在配置文件中写入如下内容即可添加HTTP响应头；
```
add_header Strict-Transport-Security value；
```

如果使用Apache作为代理服务器，在配置文件中写入如下内容即可添加HTTP啊应头：
```
Header add Strict-Transport-Security"value"。
```', 
vul_fix_zh='1、修改服务端程序，给HTTP响应头加上Strict-Transport-Security 
如果是java 服务端，可以使用如下方式添加HTTP响应头
```Java
response.setHeader("Strict-Transport-Security"，"value")
```

如果是php 服务端，可以使用如下方式添加HTTP响应头
```php
header(''Strict-Transport-Security:value'')
```
如果是asp服务端，可以使用如下方式添加 HTTP响应头
```
Response.AddHeader "Strict-Transport-Security","value"
```
如果是python django 服务端，可以使用如下方式添加HTTP响应头
```
response=HttpResponse() 
response[''Strict-Transport-Security'']="value”
```
如果是python flask服务端，可以使用如下方式添加 HTTP响应头
```
response=make_ response()
response.headers["Strict-Transport-Security"]="value";
```

2、修改负载均衡或反向代理服务器，给HTTP响应头加上Strict-Transport-Security;

如果使用Nginx、Tengine、Open resty 等作为代理服务器，在配置文件中写入如下内容即可添加HTTP响应头；
```
add_header Strict-Transport-Security value；
```

如果使用Apache作为代理服务器，在配置文件中写入如下内容即可添加HTTP啊应头：
```
Header add Strict-Transport-Security"value"。
```'
WHERE vul_name='Response With Insecurely Configured Strict-Transport-Security Header';
UPDATE IGNORE iast_strategy
SET vul_fix='1、使用Firefox的Noscript的ClearClick功能

2、阻挡iframe的执行（NoScript）或停用Javascript

3、Frame busting（也就是anti-framing）for your own sites

<script>if（top！=self）top.location=location</script>', 
vul_fix_zh='1、使用Firefox的Noscript的ClearClick功能

2、阻挡iframe的执行（NoScript）或停用Javascript

3、Frame busting（也就是anti-framing）for your own sites

<script>if（top！=self）top.location=location</script>'
WHERE vul_name='Pages Without Anti-Clickjacking Controls';
UPDATE IGNORE iast_strategy
SET vul_fix='1、PHP配置设置
在Headers.php文件中添加"X-Content-Type-Options:nosniff"
通过设置""X-Content-Type-Options: nosniff""响应标头，对 script 和 styleSheet 在执行是通过MIME 类型来过滤掉不安全的文件,如果通过 styleSheet 参考检索到的响应中接收到 ""nosniff"" 指令，则 Windows Internet Explorer 不会加载“stylesheet”文件，除非 MIME 类型匹配 ""text/css""。

2、nginx配置设置
设置代码为：
```
... ...
server{
... ...
add_header X-Content-Type-Options ""nosniff"";
... ...
}
```', 
vul_fix_zh='1、PHP配置设置
在Headers.php文件中添加"X-Content-Type-Options:nosniff"
通过设置""X-Content-Type-Options: nosniff""响应标头，对 script 和 styleSheet 在执行是通过MIME 类型来过滤掉不安全的文件,如果通过 styleSheet 参考检索到的响应中接收到 ""nosniff"" 指令，则 Windows Internet Explorer 不会加载“stylesheet”文件，除非 MIME 类型匹配 ""text/css""。

2、nginx配置设置
设置代码为：
```
... ...
server{
... ...
add_header X-Content-Type-Options ""nosniff"";
... ...
}
```'
WHERE vul_name='Response Without X-Content-Type-Options Header';
UPDATE IGNORE iast_strategy
SET vul_fix='在任何时候都应尽可能的避免动态代码的解析，如果需要执行动态代码，应用程序不能直接执行和解析未验证的用户输入。', 
vul_fix_zh='在任何时候都应尽可能的避免动态代码的解析，如果需要执行动态代码，应用程序不能直接执行和解析未验证的用户输入。'
WHERE vul_name='代码执行';




CREATE INDEX sca_maven_artifact_signature_IDX USING BTREE ON sca_maven_artifact (signature);
ALTER TABLE iast_project ADD CONSTRAINT iast_project_UN UNIQUE KEY (name,user_id);


SET FOREIGN_KEY_CHECKS=1;

