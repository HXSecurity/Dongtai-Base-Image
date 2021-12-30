SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

INSERT IGNORE INTO `iast_hook_type` ( `type`, `name`, `value`, `create_time`, created_by, enable, update_time, name_en, name_zh, language_id, strategy_id) SELECT `type`, `name`, `value`, `create_time`, created_by, enable, update_time, name_en, name_zh, @IAST_LANGUAGE_ID, strategy_id FROM `iast_hook_type` WHERE type IN (3, 4) AND language_id = 1 AND created_by = 1;
INSERT INTO iast_program_language (id, name) VALUES(4, 'Go');

DELETE FROM iast_hook_strategy_type  
WHERE hookstrategy_id IN
(SELECT id FROM iast_hook_strategy ihs 
WHERE value IN 
('builtins.open', 'typing.BinaryIO.readline', 'sqlite3.Cursor.execute', 'sqlite3.Cursor.executemany', 'sqlite3.Cursor.executescript', 'psycopg2._psycopg.cursor.execute', 'psycopg2._psycopg.cursor.executemany', 'mysql.connector.cursor.CursorBase.execute', 'mysql.connector.cursor.CursorBase.executemany', 'MySQLdb.cursors.BaseCursor.execute', 'MySQLdb.cursors.BaseCursor.executemany', 'pymysql.cursors.Cursor.execute', 'pymysql.cursors.Cursor.executemany', 'builtins.eval', 'yaml.unsafe_load', 'yaml.load', 'os.system', 'os.popen', 'subprocess.Popen', 'django.utils.datastructures.MultiValueDict.get', 'django.utils.datastructures.MultiValueDict.__getitem__', 'builtins.str.__format__', 'builtins.str.format', 'builtins.str.join', 'builtins.str.lower', 'builtins.str.ljust', 'flask.jsonify', 'django.template.base.Template.render', 'django.template.base.render_value_in_context', 'django.urls.resolvers.RoutePattern.match', 'urllib.parse.unquote', 'builtins.exec', 'builtins.str.encode', 'builtins.str.split', 'builtins.str.translate', 'json.loads', 'json.dumps', 'os.path.join', 'builtins.str.fstring', 'builtins.str.cformat', 'builtins.bytes.cformat', 'builtins.bytearray.cformat', 'builtins.bytes.decode', 'builtins.bytearray.__init__', 'builtins.bytes.__new__', 'builtins.str.__new__', 'builtins.bytearray.decode', 'builtins.str.capitalize', 'builtins.str.casefold', 'builtins.str.center', 'builtins.str.concat', 'builtins.str.lstrip', 'builtins.str.partition', 'builtins.str.removeprefix', 'builtins.str.removesuffix', 'builtins.str.repeat', 'builtins.str.rpartition', 'builtins.str.rsplit', 'builtins.str.rstrip', 'builtins.str.splitlines', 'builtins.str.strip', 'builtins.str.swapcase', 'builtins.str.title', 'builtins.str.upper', 'builtins.str.zfill', 'base64.b64encode', 'base64.b64decode', 'yaml.dump', 'yaml.dump_all', 'werkzeug.datastructures.getlist', 'werkzeug.datastructures.MultiDict.__getitem__', 'django.http.request.HttpRequest.read', 'werkzeug.datastructures.TypeConversionDict.get', 'werkzeug.wrappers.request.Request.get_data', 'werkzeug.wrappers.base_request.BaseRequest.get_data', 'markupsafe.escape', 'markupsafe.escape_silent', 'jinja2.runtime.escape', 'html.escape', 'flask.app.Flask.make_response', 'django.http.response.HttpResponse.__init__', 'lxml.etree.fromstring', 'lxml.etree.parse', 'urllib.request.urlopen', 'requests.sessions.Session.request', 'pickle.load', 'pickle.loads', 'yaml.unsafe_load_all', 'yaml.load_all', 'builtins.str.rjust', 'builtins.str.replace'
));

DELETE FROM iast_hook_strategy 
WHERE value IN 
('builtins.open', 'typing.BinaryIO.readline', 'sqlite3.Cursor.execute', 'sqlite3.Cursor.executemany', 'sqlite3.Cursor.executescript', 'psycopg2._psycopg.cursor.execute', 'psycopg2._psycopg.cursor.executemany', 'mysql.connector.cursor.CursorBase.execute', 'mysql.connector.cursor.CursorBase.executemany', 'MySQLdb.cursors.BaseCursor.execute', 'MySQLdb.cursors.BaseCursor.executemany', 'pymysql.cursors.Cursor.execute', 'pymysql.cursors.Cursor.executemany', 'builtins.eval', 'yaml.unsafe_load', 'yaml.load', 'os.system', 'os.popen', 'subprocess.Popen', 'django.utils.datastructures.MultiValueDict.get', 'django.utils.datastructures.MultiValueDict.__getitem__', 'builtins.str.__format__', 'builtins.str.format', 'builtins.str.join', 'builtins.str.lower', 'builtins.str.ljust', 'flask.jsonify', 'django.template.base.Template.render', 'django.template.base.render_value_in_context', 'django.urls.resolvers.RoutePattern.match', 'urllib.parse.unquote', 'builtins.exec', 'builtins.str.encode', 'builtins.str.split', 'builtins.str.translate', 'json.loads', 'json.dumps', 'os.path.join', 'builtins.str.fstring', 'builtins.str.cformat', 'builtins.bytes.cformat', 'builtins.bytearray.cformat', 'builtins.bytes.decode', 'builtins.bytearray.__init__', 'builtins.bytes.__new__', 'builtins.str.__new__', 'builtins.bytearray.decode', 'builtins.str.capitalize', 'builtins.str.casefold', 'builtins.str.center', 'builtins.str.concat', 'builtins.str.lstrip', 'builtins.str.partition', 'builtins.str.removeprefix', 'builtins.str.removesuffix', 'builtins.str.repeat', 'builtins.str.rpartition', 'builtins.str.rsplit', 'builtins.str.rstrip', 'builtins.str.splitlines', 'builtins.str.strip', 'builtins.str.swapcase', 'builtins.str.title', 'builtins.str.upper', 'builtins.str.zfill', 'base64.b64encode', 'base64.b64decode', 'yaml.dump', 'yaml.dump_all', 'werkzeug.datastructures.getlist', 'werkzeug.datastructures.MultiDict.__getitem__', 'django.http.request.HttpRequest.read', 'werkzeug.datastructures.TypeConversionDict.get', 'werkzeug.wrappers.request.Request.get_data', 'werkzeug.wrappers.base_request.BaseRequest.get_data', 'markupsafe.escape', 'markupsafe.escape_silent', 'jinja2.runtime.escape', 'html.escape', 'flask.app.Flask.make_response', 'django.http.response.HttpResponse.__init__', 'lxml.etree.fromstring', 'lxml.etree.parse', 'urllib.request.urlopen', 'requests.sessions.Session.request', 'pickle.load', 'pickle.loads', 'yaml.unsafe_load_all', 'yaml.load_all', 'builtins.str.rjust', 'builtins.str.replace'
);

INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1638354942
	,  1638354942,  1,  1,  NULL,  'general-rules'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  '.ZEND_ROPE_END',  'P',  'R',  'false',  'false',  1638355022,  1638567434,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.ZEND_ROPE_END' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1638355022 AND `update_time`=  1638567434 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.ZEND_ROPE_END' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1638355022 AND `update_time`=  1638567434 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1638354942
	,  1638354942,  1,  1,  NULL,  'general-rules'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'basename',  'P',  'R',  'false',  'false',  1640775619,  1640775619,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'basename' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775619 AND `update_time`=  1640775619 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'basename' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775619 AND `update_time`=  1640775619 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1638354942
	,  1638354942,  1,  1,  NULL,  'general-rules'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'dirname',  'P',  'R',  'false',  'false',  1640775640,  1640775640,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'dirname' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775640 AND `update_time`=  1640775640 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'dirname' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775640 AND `update_time`=  1640775640 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1638354942
	,  1638354942,  1,  1,  NULL,  'general-rules'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'explode',  'P',  'R',  'false',  'false',  1640775660,  1640775660,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'explode' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775660 AND `update_time`=  1640775660 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'explode' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775660 AND `update_time`=  1640775660 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1638354942
	,  1638354942,  1,  1,  NULL,  'general-rules'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'implode',  'P',  'R',  'false',  'false',  1640775677,  1640775677,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'implode' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775677 AND `update_time`=  1640775677 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'implode' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775677 AND `update_time`=  1640775677 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1638354942
	,  1638354942,  1,  1,  NULL,  'general-rules'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'join',  'P',  'R',  'false',  'false',  1640775693,  1640775693,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'join' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775693 AND `update_time`=  1640775693 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'join' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775693 AND `update_time`=  1640775693 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1638354942
	,  1638354942,  1,  1,  NULL,  'general-rules'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'ltrim',  'P',  'R',  'false',  'false',  1640775709,  1640775709,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'ltrim' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775709 AND `update_time`=  1640775709 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'ltrim' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775709 AND `update_time`=  1640775709 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1638354942
	,  1638354942,  1,  1,  NULL,  'general-rules'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'mysqli_real_escape_string',  'P',  'R',  'false',  'false',  1640775734,  1640775734,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'mysqli_real_escape_string' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775734 AND `update_time`=  1640775734 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'mysqli_real_escape_string' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775734 AND `update_time`=  1640775734 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1638354942
	,  1638354942,  1,  1,  NULL,  'general-rules'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'pathinfo',  'P',  'R',  'false',  'false',  1640775749,  1640775749,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'pathinfo' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775749 AND `update_time`=  1640775749 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'pathinfo' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775749 AND `update_time`=  1640775749 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1638354942
	,  1638354942,  1,  1,  NULL,  'general-rules'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'rtrim',  'P',  'R',  'false',  'false',  1640775768,  1640775768,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'rtrim' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775768 AND `update_time`=  1640775768 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'rtrim' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775768 AND `update_time`=  1640775768 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1638354942
	,  1638354942,  1,  1,  NULL,  'general-rules'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'split',  'P',  'R',  'false',  'false',  1640775784,  1640775784,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'split' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775784 AND `update_time`=  1640775784 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'split' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775784 AND `update_time`=  1640775784 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1638354942
	,  1638354942,  1,  1,  NULL,  'general-rules'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'sprintf',  'P',  'R',  'false',  'false',  1640775797,  1640775797,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'sprintf' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775797 AND `update_time`=  1640775797 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'sprintf' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775797 AND `update_time`=  1640775797 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1638354942
	,  1638354942,  1,  1,  NULL,  'general-rules'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'str_ireplace',  'P',  'R',  'false',  'false',  1640775812,  1640775812,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'str_ireplace' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775812 AND `update_time`=  1640775812 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'str_ireplace' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775812 AND `update_time`=  1640775812 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1638354942
	,  1638354942,  1,  1,  NULL,  'general-rules'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'str_pad',  'P',  'R',  'false',  'false',  1640775826,  1640775826,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'str_pad' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775826 AND `update_time`=  1640775826 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'str_pad' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775826 AND `update_time`=  1640775826 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1638354942
	,  1638354942,  1,  1,  NULL,  'general-rules'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'str_replace',  'P',  'R',  'false',  'false',  1640775841,  1640775841,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'str_replace' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775841 AND `update_time`=  1640775841 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'str_replace' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775841 AND `update_time`=  1640775841 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1638354942
	,  1638354942,  1,  1,  NULL,  'general-rules'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'stripslashes',  'P',  'R',  'false',  'false',  1640775854,  1640775854,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'stripslashes' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775854 AND `update_time`=  1640775854 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'stripslashes' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775854 AND `update_time`=  1640775854 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1638354942
	,  1638354942,  1,  1,  NULL,  'general-rules'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'strstr',  'P',  'R',  'false',  'false',  1640775871,  1640775871,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'strstr' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775871 AND `update_time`=  1640775871 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'strstr' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775871 AND `update_time`=  1640775871 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1638354942
	,  1638354942,  1,  1,  NULL,  'general-rules'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'strtolower',  'P',  'R',  'false',  'false',  1640775885,  1640775885,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'strtolower' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775885 AND `update_time`=  1640775885 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'strtolower' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775885 AND `update_time`=  1640775885 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1638354942
	,  1638354942,  1,  1,  NULL,  'general-rules'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'strtoupper',  'P',  'R',  'false',  'false',  1640775912,  1640775912,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'strtoupper' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775912 AND `update_time`=  1640775912 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'strtoupper' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775912 AND `update_time`=  1640775912 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1638354942
	,  1638354942,  1,  1,  NULL,  'general-rules'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'strval',  'P',  'R',  'false',  'false',  1640775927,  1640775927,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'strval' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775927 AND `update_time`=  1640775927 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'strval' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775927 AND `update_time`=  1640775927 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1638354942
	,  1638354942,  1,  1,  NULL,  'general-rules'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'substr',  'P',  'R',  'false',  'false',  1640775942,  1640775942,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'substr' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775942 AND `update_time`=  1640775942 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'substr' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775942 AND `update_time`=  1640775942 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1638354942
	,  1638354942,  1,  1,  NULL,  'general-rules'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'trim',  'P',  'R',  'false',  'false',  1640775954,  1640775954,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'trim' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775954 AND `update_time`=  1640775954 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'trim' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775954 AND `update_time`=  1640775954 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1638354942
	,  1638354942,  1,  1,  NULL,  'general-rules'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'vsprintf',  'P',  'R',  'false',  'false',  1640775968,  1640775968,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'vsprintf' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775968 AND `update_time`=  1640775968 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'vsprintf' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640775968 AND `update_time`=  1640775968 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1638354942
	,  1638354942,  1,  1,  NULL,  'general-rules'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  '.ZEND_ASSIGN_CONCAT',  'P',  'R',  'false',  'false',  1640776021,  1640776021,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.ZEND_ASSIGN_CONCAT' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640776021 AND `update_time`=  1640776021 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.ZEND_ASSIGN_CONCAT' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640776021 AND `update_time`=  1640776021 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1638354942
	,  1638354942,  1,  1,  NULL,  'general-rules'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  '.ZEND_CONCAT',  'P',  'R',  'false',  'false',  1640776039,  1640776039,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.ZEND_CONCAT' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640776039 AND `update_time`=  1640776039 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.ZEND_CONCAT' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640776039 AND `update_time`=  1640776039 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1638354942
	,  1638354942,  1,  1,  NULL,  'general-rules'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  '.ZEND_INIT_USER_CALL',  'P',  'R',  'false',  'false',  1640776055,  1640776055,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.ZEND_INIT_USER_CALL' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640776055 AND `update_time`=  1640776055 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.ZEND_INIT_USER_CALL' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640776055 AND `update_time`=  1640776055 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1638354942
	,  1638354942,  1,  1,  NULL,  'general-rules'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  '.ZEND_ECHO',  'P',  'R',  'false',  'false',  1640776071,  1640776071,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.ZEND_ECHO' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640776071 AND `update_time`=  1640776071 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.ZEND_ECHO' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640776071 AND `update_time`=  1640776071 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1638354942
	,  1638354942,  1,  1,  NULL,  'general-rules'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  '.ZEND_EXIT',  'P',  'R',  'false',  'false',  1640776088,  1640776088,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.ZEND_EXIT' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640776088 AND `update_time`=  1640776088 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.ZEND_EXIT' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640776088 AND `update_time`=  1640776088 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1638354942
	,  1638354942,  1,  1,  NULL,  'general-rules'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  '.ZEND_INCLUDE_OR_EVAL',  'P',  'R',  'false',  'false',  1640776106,  1640776106,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.ZEND_INCLUDE_OR_EVAL' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640776106 AND `update_time`=  1640776106 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.ZEND_INCLUDE_OR_EVAL' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640776106 AND `update_time`=  1640776106 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1638354942
	,  1638354942,  1,  1,  NULL,  'general-rules'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1638354942 AND create_time= 1638354942 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  '.ZEND_RETURN',  'P',  'R',  'false',  'false',  1640776123,  1640776123,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.ZEND_RETURN' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640776123 AND `update_time`=  1640776123 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.ZEND_RETURN' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640776123 AND `update_time`=  1640776123 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'Sql注入',  'sql-injection',  1610535131
	,  1610535131,  1,  1,  'SQL Injection',  'Sql注入'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  '.mysqli_query',  'P',  '',  'false',  'true',  1638425182,  1638567465,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.mysqli_query' AND `source`= 'P' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1638425182 AND `update_time`=  1638567465 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.mysqli_query' AND `source`= 'P' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1638425182 AND `update_time`=  1638567465 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'Sql注入',  'sql-injection',  1610535131
	,  1610535131,  1,  1,  'SQL Injection',  'Sql注入'
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  '.mysqli_multi_query',  'P',  '',  'false',  'true',  1639808955,  1639809100,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.mysqli_multi_query' AND `source`= 'P' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1639808955 AND `update_time`=  1639809100 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.mysqli_multi_query' AND `source`= 'P' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1639808955 AND `update_time`=  1639809100 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '命令执行 ',  'cmd-injection',  1610535131
	,  1610535131,  1,  1,  'OS Command Injection',  '命令执行 '
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '命令执行 '
AND  value =  'cmd-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'OS Command Injection'AND name_zh =  '命令执行 ' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '命令执行 '
AND  value =  'cmd-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'OS Command Injection'AND name_zh =  '命令执行 ' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  '.system',  'P',  '',  'false',  'true',  1640775368,  1640775368,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.system' AND `source`= 'P' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1640775368 AND `update_time`=  1640775368 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.system' AND `source`= 'P' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1640775368 AND `update_time`=  1640775368 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '命令执行 ',  'cmd-injection',  1610535131
	,  1610535131,  1,  1,  'OS Command Injection',  '命令执行 '
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '命令执行 '
AND  value =  'cmd-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'OS Command Injection'AND name_zh =  '命令执行 ' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '命令执行 '
AND  value =  'cmd-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'OS Command Injection'AND name_zh =  '命令执行 ' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  '.passthru',  'P',  '',  'false',  'true',  1640775401,  1640775401,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.passthru' AND `source`= 'P' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1640775401 AND `update_time`=  1640775401 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.passthru' AND `source`= 'P' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1640775401 AND `update_time`=  1640775401 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '命令执行 ',  'cmd-injection',  1610535131
	,  1610535131,  1,  1,  'OS Command Injection',  '命令执行 '
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '命令执行 '
AND  value =  'cmd-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'OS Command Injection'AND name_zh =  '命令执行 ' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '命令执行 '
AND  value =  'cmd-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'OS Command Injection'AND name_zh =  '命令执行 ' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  '.exec',  'P',  '',  'false',  'true',  1640775416,  1640775416,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.exec' AND `source`= 'P' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1640775416 AND `update_time`=  1640775416 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.exec' AND `source`= 'P' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1640775416 AND `update_time`=  1640775416 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '命令执行 ',  'cmd-injection',  1610535131
	,  1610535131,  1,  1,  'OS Command Injection',  '命令执行 '
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '命令执行 '
AND  value =  'cmd-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'OS Command Injection'AND name_zh =  '命令执行 ' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '命令执行 '
AND  value =  'cmd-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'OS Command Injection'AND name_zh =  '命令执行 ' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  '.shell_exec',  'P',  '',  'false',  'true',  1640775441,  1640775441,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.shell_exec' AND `source`= 'P' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1640775441 AND `update_time`=  1640775441 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.shell_exec' AND `source`= 'P' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1640775441 AND `update_time`=  1640775441 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '命令执行 ',  'cmd-injection',  1610535131
	,  1610535131,  1,  1,  'OS Command Injection',  '命令执行 '
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '命令执行 '
AND  value =  'cmd-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'OS Command Injection'AND name_zh =  '命令执行 ' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '命令执行 '
AND  value =  'cmd-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'OS Command Injection'AND name_zh =  '命令执行 ' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  '.popen',  'P',  '',  'false',  'true',  1640775458,  1640775458,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.popen' AND `source`= 'P' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1640775458 AND `update_time`=  1640775458 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.popen' AND `source`= 'P' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1640775458 AND `update_time`=  1640775458 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '命令执行 ',  'cmd-injection',  1610535131
	,  1610535131,  1,  1,  'OS Command Injection',  '命令执行 '
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '命令执行 '
AND  value =  'cmd-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'OS Command Injection'AND name_zh =  '命令执行 ' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '命令执行 '
AND  value =  'cmd-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'OS Command Injection'AND name_zh =  '命令执行 ' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  '.proc_open',  'P',  '',  'false',  'true',  1640775523,  1640775523,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.proc_open' AND `source`= 'P' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1640775523 AND `update_time`=  1640775523 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.proc_open' AND `source`= 'P' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1640775523 AND `update_time`=  1640775523 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '命令执行 ',  'cmd-injection',  1610535131
	,  1610535131,  1,  1,  'OS Command Injection',  '命令执行 '
	,  3 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '命令执行 '
AND  value =  'cmd-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'OS Command Injection'AND name_zh =  '命令执行 ' AND language_id =  3 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '命令执行 '
AND  value =  'cmd-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'OS Command Injection'AND name_zh =  '命令执行 ' AND language_id =  3 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  '.pcntl_exec',  'P',  '',  'false',  'true',  1640775546,  1640775546,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.pcntl_exec' AND `source`= 'P' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1640775546 AND `update_time`=  1640775546 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= '.pcntl_exec' AND `source`= 'P' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1640775546 AND `update_time`=  1640775546 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'sql-injection',  'sql-injection',  1638885427
	,  1638885427,  1,  1,  'SQL Injection',  'Sql注入'
	,  4 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1638885427 AND create_time= 1638885427 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  4 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1638885427 AND create_time= 1638885427 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  4 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'sql.(*DB).Query()',  'P1',  'R',  'false',  'true',  1638885427,  1638885427,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'sql.(*DB).Query()' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1638885427 AND `update_time`=  1638885427 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'sql.(*DB).Query()' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1638885427 AND `update_time`=  1638885427 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '路径穿越',  'path-traversal',  1610535131
	,  1610535131,  1,  1,  'Path Traversal',  '路径穿越'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '路径穿越'
AND  value =  'path-traversal' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Path Traversal'AND name_zh =  '路径穿越' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '路径穿越'
AND  value =  'path-traversal' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Path Traversal'AND name_zh =  '路径穿越' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.open',  'P1,file',  '',  'false',  'true',  1636026483,  1640598671,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.open' AND `source`= 'P1,file' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026483 AND `update_time`=  1640598671 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.open' AND `source`= 'P1,file' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026483 AND `update_time`=  1640598671 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'Sql注入',  'sql-injection',  1610535131
	,  1610535131,  1,  1,  'SQL Injection',  'Sql注入'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'sqlite3.Cursor.execute',  'P2',  '',  'false',  'true',  1636026484,  1640601531,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'sqlite3.Cursor.execute' AND `source`= 'P2' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026484 AND `update_time`=  1640601531 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'sqlite3.Cursor.execute' AND `source`= 'P2' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026484 AND `update_time`=  1640601531 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'Sql注入',  'sql-injection',  1610535131
	,  1610535131,  1,  1,  'SQL Injection',  'Sql注入'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'sqlite3.Cursor.executemany',  'P2',  '',  'false',  'true',  1636026484,  1640601538,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'sqlite3.Cursor.executemany' AND `source`= 'P2' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026484 AND `update_time`=  1640601538 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'sqlite3.Cursor.executemany' AND `source`= 'P2' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026484 AND `update_time`=  1640601538 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'Sql注入',  'sql-injection',  1610535131
	,  1610535131,  1,  1,  'SQL Injection',  'Sql注入'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'sqlite3.Cursor.executescript',  'P2',  '',  'false',  'true',  1636026484,  1640601549,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'sqlite3.Cursor.executescript' AND `source`= 'P2' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026484 AND `update_time`=  1640601549 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'sqlite3.Cursor.executescript' AND `source`= 'P2' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026484 AND `update_time`=  1640601549 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'Sql注入',  'sql-injection',  1610535131
	,  1610535131,  1,  1,  'SQL Injection',  'Sql注入'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'psycopg2._psycopg.cursor.execute',  'P2,query',  '',  'false',  'true',  1636026485,  1640601645,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'psycopg2._psycopg.cursor.execute' AND `source`= 'P2,query' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026485 AND `update_time`=  1640601645 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'psycopg2._psycopg.cursor.execute' AND `source`= 'P2,query' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026485 AND `update_time`=  1640601645 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'Sql注入',  'sql-injection',  1610535131
	,  1610535131,  1,  1,  'SQL Injection',  'Sql注入'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'psycopg2._psycopg.cursor.executemany',  'P2,query',  '',  'false',  'true',  1636026485,  1640601630,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'psycopg2._psycopg.cursor.executemany' AND `source`= 'P2,query' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026485 AND `update_time`=  1640601630 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'psycopg2._psycopg.cursor.executemany' AND `source`= 'P2,query' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026485 AND `update_time`=  1640601630 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'Sql注入',  'sql-injection',  1610535131
	,  1610535131,  1,  1,  'SQL Injection',  'Sql注入'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'mysql.connector.cursor.CursorBase.execute',  'P2,operation',  '',  'false',  'true',  1636026485,  1640601712,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'mysql.connector.cursor.CursorBase.execute' AND `source`= 'P2,operation' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026485 AND `update_time`=  1640601712 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'mysql.connector.cursor.CursorBase.execute' AND `source`= 'P2,operation' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026485 AND `update_time`=  1640601712 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'Sql注入',  'sql-injection',  1610535131
	,  1610535131,  1,  1,  'SQL Injection',  'Sql注入'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'mysql.connector.cursor.CursorBase.executemany',  'P2,operation',  '',  'false',  'true',  1636026486,  1640601718,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'mysql.connector.cursor.CursorBase.executemany' AND `source`= 'P2,operation' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026486 AND `update_time`=  1640601718 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'mysql.connector.cursor.CursorBase.executemany' AND `source`= 'P2,operation' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026486 AND `update_time`=  1640601718 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'Sql注入',  'sql-injection',  1610535131
	,  1610535131,  1,  1,  'SQL Injection',  'Sql注入'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'MySQLdb.cursors.BaseCursor.execute',  'P2,query',  '',  'false',  'true',  1636026486,  1640601761,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'MySQLdb.cursors.BaseCursor.execute' AND `source`= 'P2,query' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026486 AND `update_time`=  1640601761 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'MySQLdb.cursors.BaseCursor.execute' AND `source`= 'P2,query' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026486 AND `update_time`=  1640601761 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'Sql注入',  'sql-injection',  1610535131
	,  1610535131,  1,  1,  'SQL Injection',  'Sql注入'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'MySQLdb.cursors.BaseCursor.executemany',  'P2,query',  '',  'false',  'true',  1636026486,  1640601771,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'MySQLdb.cursors.BaseCursor.executemany' AND `source`= 'P2,query' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026486 AND `update_time`=  1640601771 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'MySQLdb.cursors.BaseCursor.executemany' AND `source`= 'P2,query' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026486 AND `update_time`=  1640601771 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'Sql注入',  'sql-injection',  1610535131
	,  1610535131,  1,  1,  'SQL Injection',  'Sql注入'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'pymysql.cursors.Cursor.execute',  'P2,query',  '',  'false',  'true',  1636026486,  1640601781,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'pymysql.cursors.Cursor.execute' AND `source`= 'P2,query' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026486 AND `update_time`=  1640601781 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'pymysql.cursors.Cursor.execute' AND `source`= 'P2,query' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026486 AND `update_time`=  1640601781 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'Sql注入',  'sql-injection',  1610535131
	,  1610535131,  1,  1,  'SQL Injection',  'Sql注入'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Sql注入'
AND  value =  'sql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'SQL Injection'AND name_zh =  'Sql注入' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'pymysql.cursors.Cursor.executemany',  'P2,query',  '',  'false',  'true',  1636026486,  1640601793,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'pymysql.cursors.Cursor.executemany' AND `source`= 'P2,query' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026486 AND `update_time`=  1640601793 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'pymysql.cursors.Cursor.executemany' AND `source`= 'P2,query' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026486 AND `update_time`=  1640601793 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '代码执行',  'exec-code',  1634110527
	,  1634110527,  1,  1,  NULL,  '代码执行'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '代码执行'
AND  value =  'exec-code' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  '代码执行' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '代码执行'
AND  value =  'exec-code' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  '代码执行' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.eval',  'P1',  '',  'false',  'true',  1636026487,  1640676064,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.eval' AND `source`= 'P1' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026487 AND `update_time`=  1640676064 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.eval' AND `source`= 'P1' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026487 AND `update_time`=  1640676064 AND `created_by`= 1 AND `enable` =  1
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
SELECT  'yaml.unsafe_load',  'P1,stream',  '',  'false',  'true',  1636026487,  1640602422,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.unsafe_load' AND `source`= 'P1,stream' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026487 AND `update_time`=  1640602422 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.unsafe_load' AND `source`= 'P1,stream' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026487 AND `update_time`=  1640602422 AND `created_by`= 1 AND `enable` =  1
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
SELECT  'yaml.load',  'P1,stream',  '',  'false',  'true',  1636026487,  1640602438,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.load' AND `source`= 'P1,stream' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026487 AND `update_time`=  1640602438 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.load' AND `source`= 'P1,stream' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026487 AND `update_time`=  1640602438 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '命令执行 ',  'cmd-injection',  1610535131
	,  1610535131,  1,  1,  'OS Command Injection',  '命令执行 '
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '命令执行 '
AND  value =  'cmd-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'OS Command Injection'AND name_zh =  '命令执行 ' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '命令执行 '
AND  value =  'cmd-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'OS Command Injection'AND name_zh =  '命令执行 ' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'os.system',  'P1,command',  '',  'false',  'true',  1636026488,  1640676138,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'os.system' AND `source`= 'P1,command' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026488 AND `update_time`=  1640676138 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'os.system' AND `source`= 'P1,command' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026488 AND `update_time`=  1640676138 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '命令执行 ',  'cmd-injection',  1610535131
	,  1610535131,  1,  1,  'OS Command Injection',  '命令执行 '
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '命令执行 '
AND  value =  'cmd-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'OS Command Injection'AND name_zh =  '命令执行 ' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '命令执行 '
AND  value =  'cmd-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'OS Command Injection'AND name_zh =  '命令执行 ' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'os.popen',  'P1,cmd',  '',  'false',  'true',  1636026488,  1640603630,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'os.popen' AND `source`= 'P1,cmd' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026488 AND `update_time`=  1640603630 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'os.popen' AND `source`= 'P1,cmd' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026488 AND `update_time`=  1640603630 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '命令执行 ',  'cmd-injection',  1610535131
	,  1610535131,  1,  1,  'OS Command Injection',  '命令执行 '
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '命令执行 '
AND  value =  'cmd-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'OS Command Injection'AND name_zh =  '命令执行 ' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '命令执行 '
AND  value =  'cmd-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'OS Command Injection'AND name_zh =  '命令执行 ' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'subprocess.Popen',  'P1,args',  '',  'false',  'true',  1636026488,  1640603799,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'subprocess.Popen' AND `source`= 'P1,args' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026488 AND `update_time`=  1640603799 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'subprocess.Popen' AND `source`= 'P1,args' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026488 AND `update_time`=  1640603799 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '反射型XSS',  'reflected-xss',  1610535131
	,  1610535131,  1,  1,  'Cross-Site Scripting',  '反射型XSS'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '反射型XSS'
AND  value =  'reflected-xss' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Cross-Site Scripting'AND name_zh =  '反射型XSS' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '反射型XSS'
AND  value =  'reflected-xss' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Cross-Site Scripting'AND name_zh =  '反射型XSS' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'flask.app.Flask.make_response',  'P2,rv',  '',  'false',  'true',  1636026489,  1640604493,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'flask.app.Flask.make_response' AND `source`= 'P2,rv' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026489 AND `update_time`=  1640604493 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'flask.app.Flask.make_response' AND `source`= 'P2,rv' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026489 AND `update_time`=  1640604493 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '反射型XSS',  'reflected-xss',  1610535131
	,  1610535131,  1,  1,  'Cross-Site Scripting',  '反射型XSS'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '反射型XSS'
AND  value =  'reflected-xss' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Cross-Site Scripting'AND name_zh =  '反射型XSS' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '反射型XSS'
AND  value =  'reflected-xss' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Cross-Site Scripting'AND name_zh =  '反射型XSS' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'django.http.response.HttpResponse.__init__',  'P2,content',  '',  'false',  'true',  1636026489,  1640604234,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.http.response.HttpResponse.__init__' AND `source`= 'P2,content' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026489 AND `update_time`=  1640604234 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.http.response.HttpResponse.__init__' AND `source`= 'P2,content' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026489 AND `update_time`=  1640604234 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'XML外部实体注入',  'xxe',  1610535131
	,  1610535131,  1,  1,  'XML External Entity Injection (XXE)',  'XML外部实体注入'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'XML外部实体注入'
AND  value =  'xxe' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'XML External Entity Injection (XXE)'AND name_zh =  'XML外部实体注入' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'XML外部实体注入'
AND  value =  'xxe' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'XML External Entity Injection (XXE)'AND name_zh =  'XML外部实体注入' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'lxml.etree.fromstring',  'P1,text',  '',  'false',  'true',  1636026490,  1640604857,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'lxml.etree.fromstring' AND `source`= 'P1,text' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026490 AND `update_time`=  1640604857 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'lxml.etree.fromstring' AND `source`= 'P1,text' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026490 AND `update_time`=  1640604857 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'XML外部实体注入',  'xxe',  1610535131
	,  1610535131,  1,  1,  'XML External Entity Injection (XXE)',  'XML外部实体注入'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'XML外部实体注入'
AND  value =  'xxe' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'XML External Entity Injection (XXE)'AND name_zh =  'XML外部实体注入' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'XML外部实体注入'
AND  value =  'xxe' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'XML External Entity Injection (XXE)'AND name_zh =  'XML外部实体注入' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'lxml.etree.parse',  'P1,source',  '',  'false',  'true',  1636026490,  1640604893,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'lxml.etree.parse' AND `source`= 'P1,source' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026490 AND `update_time`=  1640604893 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'lxml.etree.parse' AND `source`= 'P1,source' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026490 AND `update_time`=  1640604893 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '服务器端请求伪造',  'ssrf',  1610535131
	,  1610535131,  1,  1,  'Server-Side Request Forgery (SSRF)',  '服务器端请求伪造'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '服务器端请求伪造'
AND  value =  'ssrf' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Server-Side Request Forgery (SSRF)'AND name_zh =  '服务器端请求伪造' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '服务器端请求伪造'
AND  value =  'ssrf' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Server-Side Request Forgery (SSRF)'AND name_zh =  '服务器端请求伪造' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'urllib.request.urlopen',  'P3,url',  '',  'false',  'true',  1636026490,  1640676241,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'urllib.request.urlopen' AND `source`= 'P3,url' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026490 AND `update_time`=  1640676241 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'urllib.request.urlopen' AND `source`= 'P3,url' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026490 AND `update_time`=  1640676241 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '服务器端请求伪造',  'ssrf',  1610535131
	,  1610535131,  1,  1,  'Server-Side Request Forgery (SSRF)',  '服务器端请求伪造'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '服务器端请求伪造'
AND  value =  'ssrf' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Server-Side Request Forgery (SSRF)'AND name_zh =  '服务器端请求伪造' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '服务器端请求伪造'
AND  value =  'ssrf' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Server-Side Request Forgery (SSRF)'AND name_zh =  '服务器端请求伪造' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'requests.sessions.Session.request',  'P3,url',  '',  'false',  'true',  1636026491,  1640676249,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'requests.sessions.Session.request' AND `source`= 'P3,url' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026491 AND `update_time`=  1640676249 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'requests.sessions.Session.request' AND `source`= 'P3,url' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1636026491 AND `update_time`=  1640676249 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'django.utils.datastructures.MultiValueDict.get',  'P',  'R',  'false',  'false',  1636026491,  1640598446,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.utils.datastructures.MultiValueDict.get' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026491 AND `update_time`=  1640598446 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.utils.datastructures.MultiValueDict.get' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026491 AND `update_time`=  1640598446 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'django.utils.datastructures.MultiValueDict.__getitem__',  'P',  'R',  'false',  'false',  1636026491,  1640598451,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.utils.datastructures.MultiValueDict.__getitem__' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026491 AND `update_time`=  1640598451 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.utils.datastructures.MultiValueDict.__getitem__' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026491 AND `update_time`=  1640598451 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'django.http.request.HttpRequest.read',  'P',  'R',  'false',  'false',  1636026492,  1640598456,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.http.request.HttpRequest.read' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026492 AND `update_time`=  1640598456 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.http.request.HttpRequest.read' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026492 AND `update_time`=  1640598456 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'werkzeug.datastructures.getlist',  'P',  'R',  'false',  'false',  1636026492,  1640598463,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'werkzeug.datastructures.getlist' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026492 AND `update_time`=  1640598463 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'werkzeug.datastructures.getlist' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026492 AND `update_time`=  1640598463 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'werkzeug.datastructures.TypeConversionDict.get',  'P',  'R',  'false',  'false',  1636026492,  1640598469,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'werkzeug.datastructures.TypeConversionDict.get' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026492 AND `update_time`=  1640598469 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'werkzeug.datastructures.TypeConversionDict.get' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026492 AND `update_time`=  1640598469 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'werkzeug.datastructures.MultiDict.__getitem__',  'P',  'R',  'false',  'false',  1636026493,  1640598475,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'werkzeug.datastructures.MultiDict.__getitem__' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026493 AND `update_time`=  1640598475 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'werkzeug.datastructures.MultiDict.__getitem__' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026493 AND `update_time`=  1640598475 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'werkzeug.wrappers.request.Request.get_data',  'P',  'R',  'false',  'false',  1636026493,  1640598480,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'werkzeug.wrappers.request.Request.get_data' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026493 AND `update_time`=  1640598480 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'werkzeug.wrappers.request.Request.get_data' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026493 AND `update_time`=  1640598480 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.format',  'P',  'R',  'false',  'false',  1636026494,  1640676413,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.format' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026494 AND `update_time`=  1640676413 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.format' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026494 AND `update_time`=  1640676413 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.join',  'P',  'R',  'false',  'false',  1636026494,  1640676482,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.join' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026494 AND `update_time`=  1640676482 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.join' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026494 AND `update_time`=  1640676482 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.lower',  'P1',  'R',  'false',  'false',  1636026494,  1636026494,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.lower' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026494 AND `update_time`=  1636026494 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.lower' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026494 AND `update_time`=  1636026494 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.ljust',  'P1',  'R',  'false',  'false',  1636026495,  1636026495,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.ljust' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026495 AND `update_time`=  1636026495 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.ljust' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026495 AND `update_time`=  1636026495 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'json.loads',  'P1,s',  'R',  'false',  'false',  1636026496,  1640676519,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'json.loads' AND `source`= 'P1,s' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026496 AND `update_time`=  1640676519 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'json.loads' AND `source`= 'P1,s' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026496 AND `update_time`=  1640676519 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'json.dumps',  'P1,obj',  'R',  'false',  'false',  1636026497,  1640676533,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'json.dumps' AND `source`= 'P1,obj' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026497 AND `update_time`=  1640676533 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'json.dumps' AND `source`= 'P1,obj' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026497 AND `update_time`=  1640676533 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'os.path.join',  'P',  'R',  'false',  'false',  1636026497,  1640676544,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'os.path.join' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026497 AND `update_time`=  1640676544 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'os.path.join' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636026497 AND `update_time`=  1640676544 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'flask.jsonify',  'P',  'R',  'false',  'false',  1636081491,  1640676554,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'flask.jsonify' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636081491 AND `update_time`=  1640676554 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'flask.jsonify' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636081491 AND `update_time`=  1640676554 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'django.template.base.Template.render',  'P',  'R',  'false',  'false',  1636963732,  1640676564,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.template.base.Template.render' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636963732 AND `update_time`=  1640676564 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.template.base.Template.render' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636963732 AND `update_time`=  1640676564 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'django.template.base.render_value_in_context',  'P',  'R',  'false',  'false',  1636983192,  1640676568,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.template.base.render_value_in_context' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636983192 AND `update_time`=  1640676568 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.template.base.render_value_in_context' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636983192 AND `update_time`=  1640676568 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'django.urls.resolvers.RoutePattern.match',  'P2,path',  'R',  'false',  'false',  1637209185,  1640598440,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.urls.resolvers.RoutePattern.match' AND `source`= 'P2,path' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1637209185 AND `update_time`=  1640598440 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.urls.resolvers.RoutePattern.match' AND `source`= 'P2,path' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1637209185 AND `update_time`=  1640598440 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'urllib.parse.unquote',  'P1,string',  'R',  'false',  'false',  1637210822,  1640676581,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'urllib.parse.unquote' AND `source`= 'P1,string' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1637210822 AND `update_time`=  1640676581 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'urllib.parse.unquote' AND `source`= 'P1,string' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1637210822 AND `update_time`=  1640676581 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '代码执行',  'exec-code',  1634110527
	,  1634110527,  1,  1,  NULL,  '代码执行'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '代码执行'
AND  value =  'exec-code' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  '代码执行' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '代码执行'
AND  value =  'exec-code' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  '代码执行' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.exec',  'P1',  '',  'false',  'true',  1638328448,  1640676068,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.exec' AND `source`= 'P1' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1638328448 AND `update_time`=  1640676068 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.exec' AND `source`= 'P1' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1638328448 AND `update_time`=  1640676068 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.encode',  'P1',  'R',  'false',  'false',  1638533369,  1638533369,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.encode' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1638533369 AND `update_time`=  1638533369 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.encode' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1638533369 AND `update_time`=  1638533369 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.fstring',  'P1',  'R',  'false',  'false',  1638871319,  1640676595,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.fstring' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1638871319 AND `update_time`=  1640676595 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.fstring' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1638871319 AND `update_time`=  1640676595 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.bytes.decode',  'P1',  'R',  'false',  'false',  1638871430,  1640676612,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.bytes.decode' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1638871430 AND `update_time`=  1640676612 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.bytes.decode' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1638871430 AND `update_time`=  1640676612 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'werkzeug.wrappers.base_request.BaseRequest.get_data',  'P',  'R',  'all',  'false',  1639023166,  1640598484,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'werkzeug.wrappers.base_request.BaseRequest.get_data' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'all' AND `track`= 'false' AND `create_time`=  1639023166 AND `update_time`=  1640598484 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'werkzeug.wrappers.base_request.BaseRequest.get_data' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'all' AND `track`= 'false' AND `create_time`=  1639023166 AND `update_time`=  1640598484 AND `created_by`= 1 AND `enable` =  1
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
SELECT  'pickle.load',  'P1,file',  '',  'all',  'true',  1639039107,  1640602645,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'pickle.load' AND `source`= 'P1,file' AND `target`= '' AND `inherit`= 'all' AND `track`= 'true' AND `create_time`=  1639039107 AND `update_time`=  1640602645 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'pickle.load' AND `source`= 'P1,file' AND `target`= '' AND `inherit`= 'all' AND `track`= 'true' AND `create_time`=  1639039107 AND `update_time`=  1640602645 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.bytearray.__init__',  'P1,source',  'R',  'false',  'false',  1639121191,  1640676641,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.bytearray.__init__' AND `source`= 'P1,source' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639121191 AND `update_time`=  1640676641 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.bytearray.__init__' AND `source`= 'P1,source' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639121191 AND `update_time`=  1640676641 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.bytes.__new__',  'P1,source',  'R',  'false',  'false',  1639121203,  1640676823,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.bytes.__new__' AND `source`= 'P1,source' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639121203 AND `update_time`=  1640676823 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.bytes.__new__' AND `source`= 'P1,source' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639121203 AND `update_time`=  1640676823 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.__new__',  'P1,object',  'R',  'false',  'false',  1639121219,  1640676665,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.__new__' AND `source`= 'P1,object' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639121219 AND `update_time`=  1640676665 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.__new__' AND `source`= 'P1,object' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639121219 AND `update_time`=  1640676665 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.bytearray.decode',  'P1',  'R',  'false',  'false',  1639122261,  1640676622,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.bytearray.decode' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639122261 AND `update_time`=  1640676622 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.bytearray.decode' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639122261 AND `update_time`=  1640676622 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'markupsafe.escape',  'P1,s',  'R',  'false',  'false',  1639378209,  1640597983,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'markupsafe.escape' AND `source`= 'P1,s' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639378209 AND `update_time`=  1640597983 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'markupsafe.escape' AND `source`= 'P1,s' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639378209 AND `update_time`=  1640597983 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'markupsafe.escape_silent',  'P1,s',  'R',  'false',  'false',  1639451276,  1640597993,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'markupsafe.escape_silent' AND `source`= 'P1,s' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639451276 AND `update_time`=  1640597993 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'markupsafe.escape_silent' AND `source`= 'P1,s' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639451276 AND `update_time`=  1640597993 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'html.escape',  'P1,s',  'R',  'false',  'false',  1639464665,  1640597837,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'html.escape' AND `source`= 'P1,s' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639464665 AND `update_time`=  1640597837 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'html.escape' AND `source`= 'P1,s' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639464665 AND `update_time`=  1640597837 AND `created_by`= 1 AND `enable` =  1
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
SELECT  'pickle.loads',  'P1,data',  '',  'false',  'true',  1639473996,  1640602678,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'pickle.loads' AND `source`= 'P1,data' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1639473996 AND `update_time`=  1640602678 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'pickle.loads' AND `source`= 'P1,data' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1639473996 AND `update_time`=  1640602678 AND `created_by`= 1 AND `enable` =  1
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
SELECT  'yaml.unsafe_load_all',  'P1,stream',  '',  'false',  'true',  1639476580,  1640602449,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.unsafe_load_all' AND `source`= 'P1,stream' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1639476580 AND `update_time`=  1640602449 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.unsafe_load_all' AND `source`= 'P1,stream' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1639476580 AND `update_time`=  1640602449 AND `created_by`= 1 AND `enable` =  1
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
SELECT  'yaml.load_all',  'P1,stream',  '',  'false',  'true',  1639476599,  1640602459,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.load_all' AND `source`= 'P1,stream' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1639476599 AND `update_time`=  1640602459 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.load_all' AND `source`= 'P1,stream' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1639476599 AND `update_time`=  1640602459 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.capitalize',  'P1',  'R',  'false',  'false',  1639476800,  1640676843,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.capitalize' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639476800 AND `update_time`=  1640676843 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.capitalize' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639476800 AND `update_time`=  1640676843 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.casefold',  'P1',  'R',  'false',  'false',  1639476823,  1640676847,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.casefold' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639476823 AND `update_time`=  1640676847 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.casefold' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639476823 AND `update_time`=  1640676847 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.center',  'P1',  'R',  'false',  'false',  1639476856,  1640676851,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.center' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639476856 AND `update_time`=  1640676851 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.center' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639476856 AND `update_time`=  1640676851 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.lstrip',  'P1',  'R',  'false',  'false',  1639476909,  1640676877,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.lstrip' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639476909 AND `update_time`=  1640676877 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.lstrip' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639476909 AND `update_time`=  1640676877 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.partition',  'P1',  'R',  'false',  'false',  1639476928,  1640676882,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.partition' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639476928 AND `update_time`=  1640676882 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.partition' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639476928 AND `update_time`=  1640676882 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.removeprefix',  'P1',  'R',  'false',  'false',  1639476955,  1640676888,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.removeprefix' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639476955 AND `update_time`=  1640676888 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.removeprefix' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639476955 AND `update_time`=  1640676888 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.removesuffix',  'P1',  'R',  'false',  'false',  1639476980,  1640676893,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.removesuffix' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639476980 AND `update_time`=  1640676893 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.removesuffix' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639476980 AND `update_time`=  1640676893 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.rpartition',  'P1',  'R',  'false',  'false',  1639477032,  1640676907,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.rpartition' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477032 AND `update_time`=  1640676907 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.rpartition' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477032 AND `update_time`=  1640676907 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.rsplit',  'P1',  'R',  'false',  'false',  1639477053,  1640676912,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.rsplit' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477053 AND `update_time`=  1640676912 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.rsplit' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477053 AND `update_time`=  1640676912 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.rstrip',  'P1',  'R',  'false',  'false',  1639477079,  1640676924,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.rstrip' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477079 AND `update_time`=  1640676924 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.rstrip' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477079 AND `update_time`=  1640676924 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.splitlines',  'P1',  'R',  'false',  'false',  1639477111,  1640676928,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.splitlines' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477111 AND `update_time`=  1640676928 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.splitlines' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477111 AND `update_time`=  1640676928 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.strip',  'P1',  'R',  'false',  'false',  1639477172,  1640676935,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.strip' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477172 AND `update_time`=  1640676935 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.strip' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477172 AND `update_time`=  1640676935 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.swapcase',  'P1',  'R',  'false',  'false',  1639477188,  1640676938,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.swapcase' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477188 AND `update_time`=  1640676938 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.swapcase' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477188 AND `update_time`=  1640676938 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.title',  'P1',  'R',  'false',  'false',  1639477207,  1640676941,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.title' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477207 AND `update_time`=  1640676941 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.title' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477207 AND `update_time`=  1640676941 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.upper',  'P1',  'R',  'false',  'false',  1639477269,  1640676956,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.upper' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477269 AND `update_time`=  1640676956 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.upper' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477269 AND `update_time`=  1640676956 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.zfill',  'P1',  'R',  'false',  'false',  1639477282,  1640676975,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.zfill' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477282 AND `update_time`=  1640676975 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.zfill' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477282 AND `update_time`=  1640676975 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'base64.b64encode',  'P1,s',  'R',  'false',  'false',  1639477320,  1640676994,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'base64.b64encode' AND `source`= 'P1,s' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477320 AND `update_time`=  1640676994 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'base64.b64encode' AND `source`= 'P1,s' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477320 AND `update_time`=  1640676994 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'base64.b64decode',  'P1,s',  'R',  'false',  'false',  1639477338,  1640677004,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'base64.b64decode' AND `source`= 'P1,s' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477338 AND `update_time`=  1640677004 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'base64.b64decode' AND `source`= 'P1,s' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477338 AND `update_time`=  1640677004 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'yaml.dump',  'P1,data',  'R',  'false',  'false',  1639477363,  1640677028,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.dump' AND `source`= 'P1,data' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477363 AND `update_time`=  1640677028 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.dump' AND `source`= 'P1,data' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477363 AND `update_time`=  1640677028 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'yaml.dump_all',  'P1,documents',  'R',  'false',  'false',  1639477385,  1640677041,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.dump_all' AND `source`= 'P1,documents' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477385 AND `update_time`=  1640677041 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.dump_all' AND `source`= 'P1,documents' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1639477385 AND `update_time`=  1640677041 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


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
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'NoSql注入',  'nosql-injection',  1610535131
	,  1610535131,  1,  1,  'NoSQL Injection',  'NoSql注入'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'NoSql注入'
AND  value =  'nosql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'NoSQL Injection'AND name_zh =  'NoSql注入' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'NoSql注入'
AND  value =  'nosql-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'NoSQL Injection'AND name_zh =  'NoSql注入' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'pymongo.collection.Collection.find',  'P2,filter',  '',  'false',  'true',  1639997567,  1640001351,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'pymongo.collection.Collection.find' AND `source`= 'P2,filter' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1639997567 AND `update_time`=  1640001351 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'pymongo.collection.Collection.find' AND `source`= 'P2,filter' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1639997567 AND `update_time`=  1640001351 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'LDAP注入',  'ldap-injection',  1610535131
	,  1610535131,  1,  1,  'LDAP Injection',  'LDAP注入'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'LDAP注入'
AND  value =  'ldap-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'LDAP Injection'AND name_zh =  'LDAP注入' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'LDAP注入'
AND  value =  'ldap-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'LDAP Injection'AND name_zh =  'LDAP注入' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'ldap3.core.connection.Connection.search',  'P3,search_filter',  '',  'false',  'true',  1640159270,  1640159270,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'ldap3.core.connection.Connection.search' AND `source`= 'P3,search_filter' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1640159270 AND `update_time`=  1640159270 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'ldap3.core.connection.Connection.search' AND `source`= 'P3,search_filter' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1640159270 AND `update_time`=  1640159270 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'LDAP注入',  'ldap-injection',  1610535131
	,  1610535131,  1,  1,  'LDAP Injection',  'LDAP注入'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'LDAP注入'
AND  value =  'ldap-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'LDAP Injection'AND name_zh =  'LDAP注入' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'LDAP注入'
AND  value =  'ldap-injection' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'LDAP Injection'AND name_zh =  'LDAP注入' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'ldap.ldapobject.SimpleLDAPObject.search_ext',  'P4,filterstr',  '',  'false',  'true',  1640348136,  1640348136,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'ldap.ldapobject.SimpleLDAPObject.search_ext' AND `source`= 'P4,filterstr' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1640348136 AND `update_time`=  1640348136 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'ldap.ldapobject.SimpleLDAPObject.search_ext' AND `source`= 'P4,filterstr' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1640348136 AND `update_time`=  1640348136 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'ldap.filter.escape_filter_chars',  'P1,assertion_value',  'R',  'false',  'false',  1640585712,  1640585712,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'ldap.filter.escape_filter_chars' AND `source`= 'P1,assertion_value' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640585712 AND `update_time`=  1640585712 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'ldap.filter.escape_filter_chars' AND `source`= 'P1,assertion_value' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640585712 AND `update_time`=  1640585712 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en  IS NULL AND  name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'ldap3.utils.conv.escape_filter_chars',  'P1,text',  'R',  'false',  'false',  1640585737,  1640585737,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'ldap3.utils.conv.escape_filter_chars' AND `source`= 'P1,text' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640585737 AND `update_time`=  1640585737 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'ldap3.utils.conv.escape_filter_chars' AND `source`= 'P1,text' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640585737 AND `update_time`=  1640585737 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);

INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'Html5EscapeSymbols',  'Html5EscapeSymbolsInitializer',  1640074986
	,  1640074986,  1,  1,  NULL,  'Html5EscapeSymbols'
	,  1 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'Html5EscapeSymbols'
AND  value =  'Html5EscapeSymbolsInitializer' AND
update_time= 1640074986 AND create_time= 1640074986 AND `created_by`= 1
AND enable =  1 AND name_en  IS  NULL AND  name_zh =  'Html5EscapeSymbols' AND language_id =  1 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'Html5EscapeSymbols'
AND  value =  'Html5EscapeSymbolsInitializer' AND
update_time= 1640074986 AND create_time= 1640074986 AND `created_by`= 1
AND enable =  1 AND name_en  IS  NULL AND  name_zh =  'Html5EscapeSymbols' AND language_id =  1 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'org.unbescape.html.Html5EscapeSymbolsInitializer.initializeHtml5()',  'O',  'R',  'false',  'false',  1640075015,  1640075015,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'org.unbescape.html.Html5EscapeSymbolsInitializer.initializeHtml5()' AND `source`= 'O' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640075015 AND `update_time`=  1640075015 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'org.unbescape.html.Html5EscapeSymbolsInitializer.initializeHtml5()' AND `source`= 'O' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640075015 AND `update_time`=  1640075015 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'Mybatis传播',  'Mybatis传播',  1640834833
	,  1640834833,  1,  1,  NULL,  'Mybatis传播'
	,  1 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'Mybatis传播'
AND  value =  'Mybatis传播' AND
update_time= 1640834833 AND create_time= 1640834833 AND `created_by`= 1
AND enable =  1 AND name_en  IS  NULL AND  name_zh =  'Mybatis传播' AND language_id =  1 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'Mybatis传播'
AND  value =  'Mybatis传播' AND
update_time= 1640834833 AND create_time= 1640834833 AND `created_by`= 1
AND enable =  1 AND name_en  IS  NULL AND  name_zh =  'Mybatis传播' AND language_id =  1 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'org.apache.ibatis.executor.resultset.DefaultResultSetHandler.handleResultSets(java.sql.Statement)',  'P1',  'R',  'false',  'false',  1640835229,  1640835229,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'org.apache.ibatis.executor.resultset.DefaultResultSetHandler.handleResultSets(java.sql.Statement)' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640835229 AND `update_time`=  1640835229 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'org.apache.ibatis.executor.resultset.DefaultResultSetHandler.handleResultSets(java.sql.Statement)' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640835229 AND `update_time`=  1640835229 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'Mybatis传播',  'Mybatis传播',  1640834833
	,  1640834833,  1,  1,  NULL,  'Mybatis传播'
	,  1 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'Mybatis传播'
AND  value =  'Mybatis传播' AND
update_time= 1640834833 AND create_time= 1640834833 AND `created_by`= 1
AND enable =  1 AND name_en  IS  NULL AND  name_zh =  'Mybatis传播' AND language_id =  1 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'Mybatis传播'
AND  value =  'Mybatis传播' AND
update_time= 1640834833 AND create_time= 1640834833 AND `created_by`= 1
AND enable =  1 AND name_en  IS  NULL AND  name_zh =  'Mybatis传播' AND language_id =  1 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'com.baomidou.mybatisplus.core.override.MybatisMapperMethod.execute(org.apache.ibatis.session.SqlSession,java.lang.Object[])',  'P1,2',  'R',  'false',  'false',  1640835306,  1640835306,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'com.baomidou.mybatisplus.core.override.MybatisMapperMethod.execute(org.apache.ibatis.session.SqlSession,java.lang.Object[])' AND `source`= 'P1,2' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640835306 AND `update_time`=  1640835306 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'com.baomidou.mybatisplus.core.override.MybatisMapperMethod.execute(org.apache.ibatis.session.SqlSession,java.lang.Object[])' AND `source`= 'P1,2' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1640835306 AND `update_time`=  1640835306 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);


SET FOREIGN_KEY_CHECKS=1;

