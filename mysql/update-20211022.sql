SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;
CREATE TABLE `iast_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(512) NOT NULL DEFAULT '',
  `relative_url` varchar(512) NOT NULL DEFAULT '',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `read_time` int(11) NOT NULL DEFAULT '0',
  `is_read` smallint(6) NOT NULL DEFAULT '0',
  `message_type_id` smallint(6) NOT NULL DEFAULT '0',
  `to_user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
); 

CREATE TABLE `iast_message_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
);
INSERT INTO iast_profile
(`key`, value)
VALUES('cpu_limit', '60');
ALTER TABLE iast_profile 
DEFAULT CHARSET=utf8mb4;
ALTER TABLE iast_profile MODIFY COLUMN `key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;
ALTER TABLE iast_profile MODIFY COLUMN value varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL;
ALTER TABLE iast_api_route MODIFY COLUMN `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;
ALTER TABLE iast_api_route MODIFY COLUMN code_class varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;
ALTER TABLE iast_api_route MODIFY COLUMN description varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;
ALTER TABLE iast_api_route MODIFY COLUMN code_file varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;
ALTER TABLE iast_api_route MODIFY COLUMN controller varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;
ALTER TABLE iast_agent ADD startup_time int(11) DEFAULT 0 NOT NULL COMMENT '启动时间';
ALTER TABLE iast_agent ADD alias varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' NOT NULL COMMENT 'agent别名';
ALTER TABLE iast_agent ADD register_time int(11) DEFAULT 0 NOT NULL COMMENT '注册时间';
INSERT IGNORE INTO `iast_vul_level` (`name`, `name_value`, `name_type`, `name_type_en`, `name_type_zh`, `name_value_en`, `name_value_zh`)
SELECT  'note', '提示', '提示信息', 'NOTE', '提示信息', 'NOTE', '提示' FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_vul_level WHERE 
`name`='note' AND `name_value`='提示' AND `name_type`='提示信息' AND `name_type_en`='NOTE' AND `name_type_zh`='提示信息' AND `name_value_en`='NOTE' AND `name_value_zh`='提示' LIMIT 1);
SET @VUL_LEVEL_ID = (SELECT `id` FROM iast_vul_level WHERE 
`name`='note' AND `name_value`='提示' AND `name_type`='提示信息' AND `name_type_en`='NOTE' AND `name_type_zh`='提示信息' AND `name_value_en`='NOTE' AND `name_value_zh`='提示' LIMIT 1);


INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'Response Without Content-Security-Policy Header',  'Response Without Content-Security-Policy Header',  1634887532
	,  1634887532,  1,  1,  'Response Without Content-Security-Policy Header', '没有Content-Security-Policy的响应'
	,  1 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Response Without Content-Security-Policy Header'
AND  value =  'Response Without Content-Security-Policy Header' AND
update_time= 1634887532 AND create_time= 1634887532 AND `created_by`= 1
AND enable =  1 AND name_en =  'Response Without Content-Security-Policy Header'AND name_zh = '没有Content-Security-Policy的响应' AND language_id =  1 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Response Without Content-Security-Policy Header'
AND  value =  'Response Without Content-Security-Policy Header' AND
update_time= 1634887532 AND create_time= 1634887532 AND `created_by`= 1
AND enable =  1 AND name_en =  'Response Without Content-Security-Policy Header'AND name_zh = '没有Content-Security-Policy的响应' AND language_id =  1 LIMIT 1);


INSERT IGNORE INTO `iast_strategy` (`user_id`, `vul_type`, `level_id`, `state`
	, `dt`, `vul_name`, `vul_desc`, `vul_fix`, `hook_type_id`
	, `vul_desc_en`, `vul_desc_zh`, `vul_fix_en`, `vul_fix_zh`, `vul_name_zh`
	, `vul_name_en`)
VALUES ( 1,  'Response Without Content-Security-Policy Header',  @VUL_LEVEL_ID ,  'enable'
	,  1,  'Response Without Content-Security-Policy Header',  'Verifies that the requests sent by the application have the Content-Security-Policy or Content-Security-Policy-Read-Only header set.        ',  NULL, @HOOK_TYPE_ID
	,  'Verifies that the requests sent by the application have the Content-Security-Policy or Content-Security-Policy-Read-Only header set.        ',  'Response Without Content-Security-Policy Header',  NULL,  NULL,  '缺少 Content-Security-Policy 响应头'
	,  'Response Without Content-Security-Policy Header'
);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'Response With X-XSS-Protection Disabled',  'Response With X-XSS-Protection Disabled',  1634887580
	,  1634887580,  1,  1,  'Response With X-XSS-Protection Disabled', '禁用 X-XSS-Protection 的响应'
	,  1 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Response With X-XSS-Protection Disabled'
AND  value =  'Response With X-XSS-Protection Disabled' AND
update_time= 1634887580 AND create_time= 1634887580 AND `created_by`= 1
AND enable =  1 AND name_en =  'Response With X-XSS-Protection Disabled'AND name_zh = '禁用 X-XSS-Protection 的响应' AND language_id =  1 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Response With X-XSS-Protection Disabled'
AND  value =  'Response With X-XSS-Protection Disabled' AND
update_time= 1634887580 AND create_time= 1634887580 AND `created_by`= 1
AND enable =  1 AND name_en =  'Response With X-XSS-Protection Disabled'AND name_zh = '禁用 X-XSS-Protection 的响应' AND language_id =  1 LIMIT 1);


INSERT IGNORE INTO `iast_strategy` (`user_id`, `vul_type`, `level_id`, `state`
	, `dt`, `vul_name`, `vul_desc`, `vul_fix`, `hook_type_id`
	, `vul_desc_en`, `vul_desc_zh`, `vul_fix_en`, `vul_fix_zh`, `vul_name_zh`
	, `vul_name_en`)
VALUES ( 1,  'Response With X-XSS-Protection Disabled',  @VUL_LEVEL_ID,  'enable'
	,  1,  'Response With X-XSS-Protection Disabled',  'Response With X-XSS-Protection Disabled',  NULL, @HOOK_TYPE_ID
	,  'Verifies that the requests sent by the application have the X-XSS-Protection header left default (secure) or set correctly.        ',  'Response With X-XSS-Protection Disabled',  NULL,  NULL,  'Response With X-XSS-Protection Disabled'
	,  'Response With X-XSS-Protection Disabled'
);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'Response With Insecurely Configured Strict-Transport-Security Header',  'Response With Insecurely Configured Strict-Transport-Security Header',  1634887591
	,  1634887591,  1,  1,  'Strict-Transport-Security', '使用不安全配置的 Strict-Transport-Security 标头进行响应'
	,  1 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Response With Insecurely Configured Strict-Transport-Security Header'
AND  value =  'Response With Insecurely Configured Strict-Transport-Security Header' AND
update_time= 1634887591 AND create_time= 1634887591 AND `created_by`= 1
AND enable =  1 AND name_en =  'Strict-Transport-Security'AND name_zh = '使用不安全配置的 Strict-Transport-Security 标头进行响应' AND language_id =  1 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Response With Insecurely Configured Strict-Transport-Security Header'
AND  value =  'Response With Insecurely Configured Strict-Transport-Security Header' AND
update_time= 1634887591 AND create_time= 1634887591 AND `created_by`= 1
AND enable =  1 AND name_en =  'Strict-Transport-Security'AND name_zh = '使用不安全配置的 Strict-Transport-Security 标头进行响应' AND language_id =  1 LIMIT 1);


INSERT IGNORE INTO `iast_strategy` (`user_id`, `vul_type`, `level_id`, `state`
	, `dt`, `vul_name`, `vul_desc`, `vul_fix`, `hook_type_id`
	, `vul_desc_en`, `vul_desc_zh`, `vul_fix_en`, `vul_fix_zh`, `vul_name_zh`
	, `vul_name_en`)
VALUES ( 1,  'Response With Insecurely Configured Strict-Transport-Security Header        ',  @VUL_LEVEL_ID ,  'enable'
	,  1,  'Response With Insecurely Configured Strict-Transport-Security Header        ',  'Verifies that the requests sent by the application have the Strict Transport Security header set correctly.        ',  NULL, @HOOK_TYPE_ID
	,  'Verifies that the requests sent by the application have the Strict Transport Security header set correctly.        ',  'Verifies that the requests sent by the application have the Strict Transport Security header set correctly.        ',  NULL,  NULL,  'Response With Insecurely Configured Strict-Transport-Security Header        '
	,  'Response With Insecurely Configured Strict-Transport-Security Header'
);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'Pages Without Anti-Clickjacking Controls',  'Pages Without Anti-Clickjacking Controls',  1634887601
	,  1634887601,  1,  1, 'Pages Without Anti-Clickjacking Controls', '没有反点击劫持控制的页面'
	,  1 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Pages Without Anti-Clickjacking Controls'
AND  value =  'Pages Without Anti-Clickjacking Controls' AND
update_time= 1634887601 AND create_time= 1634887601 AND `created_by`= 1
AND enable =  1 AND name_en = 'Pages Without Anti-Clickjacking Controls'AND name_zh = '没有反点击劫持控制的页面' AND language_id =  1 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Pages Without Anti-Clickjacking Controls'
AND  value =  'Pages Without Anti-Clickjacking Controls' AND
update_time= 1634887601 AND create_time= 1634887601 AND `created_by`= 1
AND enable =  1 AND name_en = 'Pages Without Anti-Clickjacking Controls'AND name_zh = '没有反点击劫持控制的页面' AND language_id =  1 LIMIT 1);


INSERT IGNORE INTO `iast_strategy` (`user_id`, `vul_type`, `level_id`, `state`
	, `dt`, `vul_name`, `vul_desc`, `vul_fix`, `hook_type_id`
	, `vul_desc_en`, `vul_desc_zh`, `vul_fix_en`, `vul_fix_zh`, `vul_name_zh`
	, `vul_name_en`)
VALUES ( 1,  'Pages Without Anti-Clickjacking Controls',  @VUL_LEVEL_ID ,  'enable'
	,  1,  'Pages Without Anti-Clickjacking Controls',  'Verifies that frame-breaking controls are used on every page.        ',  NULL, @HOOK_TYPE_ID
	,  'Verifies that frame-breaking controls are used on every page.        ',  'Verifies that frame-breaking controls are used on every page.        ',  NULL,  NULL,  'Pages Without Anti-Clickjacking Controls'
	,  'Pages Without Anti-Clickjacking Controls'
);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'Response Without X-Content-Type-Options Header',  'Response Without X-Content-Type-Options Header',  1634887612
	,  1634887612,  1,  1,  'Response Without X-Content-Type-Options Header', '没有 X-Content-Type-Options 标头的响应'
	,  1 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Response Without X-Content-Type-Options Header'
AND  value =  'Response Without X-Content-Type-Options Header' AND
update_time= 1634887612 AND create_time= 1634887612 AND `created_by`= 1
AND enable =  1 AND name_en =  'Response Without X-Content-Type-Options Header'AND name_zh = '没有 X-Content-Type-Options 标头的响应' AND language_id =  1 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'Response Without X-Content-Type-Options Header'
AND  value =  'Response Without X-Content-Type-Options Header' AND
update_time= 1634887612 AND create_time= 1634887612 AND `created_by`= 1
AND enable =  1 AND name_en =  'Response Without X-Content-Type-Options Header'AND name_zh = '没有 X-Content-Type-Options 标头的响应' AND language_id =  1 LIMIT 1);


INSERT IGNORE INTO `iast_strategy` (`user_id`, `vul_type`, `level_id`, `state`
	, `dt`, `vul_name`, `vul_desc`, `vul_fix`, `hook_type_id`
	, `vul_desc_en`, `vul_desc_zh`, `vul_fix_en`, `vul_fix_zh`, `vul_name_zh`
	, `vul_name_en`)
VALUES ( 1,  'Response Without X-Content-Type-Options Header',  @VUL_LEVEL_ID ,  'enable'
	,  1,  'Response Without X-Content-Type-Options Header',  'Verifies that the requests sent by the application have the X-Content-Type-Options header set correctly.',  '', @HOOK_TYPE_ID
	,  'Verifies that the requests sent by the application have the X-Content-Type-Options header set correctly.',  'Verifies that the requests sent by the application have the X-Content-Type-Options header set correctly.',  NULL,  NULL,  'Response Without X-Content-Type-Options Header'
	,  'Response Without X-Content-Type-Options Header');
INSERT IGNORE INTO iast_deploy
(`desc`, middleware, `language`, desc_en, desc_zh)
VALUES('#### Flask 
修改项目的入口文件(如 app.py), 增加如下内容
```python
app = Flask(__name__)

from dongtai_agent_python.middlewares.flask_middleware import AgentMiddleware
app.wsgi_app = AgentMiddleware(app.wsgi_app, app)


@app.route(''/'')
def hello_world():
    return ''Hello World!''


if __name__ == ''__main__'':
    app.run()
```
', 'Flask', 'python', '#### Flask 
Modify the entry file of the project (such as app.py) and add the following content
```python
app = Flask(__name__)

from dongtai_agent_python.middlewares.flask_middleware import AgentMiddleware
app.wsgi_app = AgentMiddleware(app.wsgi_app, app)


@app.route(''/'')
def hello_world():
    return ''Hello World!''


if __name__ == ''__main__'':
    app.run()
```', '#### Flask 
修改项目的入口文件(如 app.py), 增加如下内容
```python
app = Flask(__name__)

from dongtai_agent_python.middlewares.flask_middleware import AgentMiddleware
app.wsgi_app = AgentMiddleware(app.wsgi_app, app)


@app.route(''/'')
def hello_world():
    return ''Hello World!''


if __name__ == ''__main__'':
    app.run()
```
');
ALTER TABLE iast_api_methods MODIFY COLUMN `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;
ALTER TABLE iast_api_parameter MODIFY COLUMN name varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;
ALTER TABLE iast_api_parameter MODIFY COLUMN `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;
ALTER TABLE iast_api_parameter MODIFY COLUMN annotation varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;
ALTER TABLE iast_api_response MODIFY COLUMN return_type varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;
ALTER TABLE iast_api_route MODIFY COLUMN `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;
ALTER TABLE iast_api_route MODIFY COLUMN code_class varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;
ALTER TABLE iast_api_route MODIFY COLUMN description varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;
ALTER TABLE iast_api_route MODIFY COLUMN code_file varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;
ALTER TABLE iast_api_route MODIFY COLUMN controller varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'path-traversal',  'path-traversal',  1634110525
	,  1634110525,  1,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.open',  'P1',  'R',  'false',  'false',  1634110525,  1634110525,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.open' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110525 AND `update_time`=  1634110525 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.open' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110525 AND `update_time`=  1634110525 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'path-traversal',  'path-traversal',  1634110525
	,  1634110525,  1,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'typing.BinaryIO.readline',  'P1',  'R',  'false',  'false',  1634110525,  1634110525,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'typing.BinaryIO.readline' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110525 AND `update_time`=  1634110525 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'typing.BinaryIO.readline' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110525 AND `update_time`=  1634110525 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'sql-injection',  'sql-injection',  1634110525
	,  1634110525,  1,  1,  NULL,  'sql-injection'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'sqlite3.Cursor.execute',  'P1',  'R',  'false',  'false',  1634110525,  1634110525,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'sqlite3.Cursor.execute' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110525 AND `update_time`=  1634110525 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'sqlite3.Cursor.execute' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110525 AND `update_time`=  1634110525 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'sql-injection',  'sql-injection',  1634110525
	,  1634110525,  1,  1,  NULL,  'sql-injection'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'sqlite3.Cursor.executemany',  'P1',  'R',  'false',  'false',  1634110525,  1634110525,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'sqlite3.Cursor.executemany' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110525 AND `update_time`=  1634110525 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'sqlite3.Cursor.executemany' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110525 AND `update_time`=  1634110525 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'sql-injection',  'sql-injection',  1634110525
	,  1634110525,  1,  1,  NULL,  'sql-injection'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'sqlite3.Cursor.executescript',  'P1',  'R',  'false',  'false',  1634110526,  1634110526,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'sqlite3.Cursor.executescript' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'sqlite3.Cursor.executescript' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'sql-injection',  'sql-injection',  1634110525
	,  1634110525,  1,  1,  NULL,  'sql-injection'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'psycopg2._psycopg.cursor.execute',  'P1',  'R',  'false',  'false',  1634110526,  1634110526,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'psycopg2._psycopg.cursor.execute' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'psycopg2._psycopg.cursor.execute' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'sql-injection',  'sql-injection',  1634110525
	,  1634110525,  1,  1,  NULL,  'sql-injection'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'psycopg2._psycopg.cursor.executemany',  'P1',  'R',  'false',  'false',  1634110526,  1634110526,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'psycopg2._psycopg.cursor.executemany' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'psycopg2._psycopg.cursor.executemany' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'sql-injection',  'sql-injection',  1634110525
	,  1634110525,  1,  1,  NULL,  'sql-injection'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'mysql.connector.cursor.CursorBase.execute',  'P1',  'R',  'false',  'false',  1634110526,  1634110526,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'mysql.connector.cursor.CursorBase.execute' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'mysql.connector.cursor.CursorBase.execute' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'sql-injection',  'sql-injection',  1634110525
	,  1634110525,  1,  1,  NULL,  'sql-injection'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'mysql.connector.cursor.CursorBase.executemany',  'P1',  'R',  'false',  'false',  1634110526,  1634110526,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'mysql.connector.cursor.CursorBase.executemany' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'mysql.connector.cursor.CursorBase.executemany' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'sql-injection',  'sql-injection',  1634110525
	,  1634110525,  1,  1,  NULL,  'sql-injection'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'MySQLdb.cursors.BaseCursor.execute',  'P1',  'R',  'false',  'false',  1634110526,  1634110526,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'MySQLdb.cursors.BaseCursor.execute' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'MySQLdb.cursors.BaseCursor.execute' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'sql-injection',  'sql-injection',  1634110525
	,  1634110525,  1,  1,  NULL,  'sql-injection'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'MySQLdb.cursors.BaseCursor.executemany',  'P1',  'R',  'false',  'false',  1634110526,  1634110526,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'MySQLdb.cursors.BaseCursor.executemany' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'MySQLdb.cursors.BaseCursor.executemany' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'sql-injection',  'sql-injection',  1634110525
	,  1634110525,  1,  1,  NULL,  'sql-injection'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'pymysql.cursors.Cursor.execute',  'P1',  'R',  'false',  'false',  1634110526,  1634110526,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'pymysql.cursors.Cursor.execute' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'pymysql.cursors.Cursor.execute' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'sql-injection',  'sql-injection',  1634110525
	,  1634110525,  1,  1,  NULL,  'sql-injection'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'pymysql.cursors.Cursor.executemany',  'P1',  'R',  'false',  'false',  1634110526,  1634110526,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'pymysql.cursors.Cursor.executemany' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'pymysql.cursors.Cursor.executemany' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110526 AND `update_time`=  1634110526 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'exec-code',  'exec-code',  1634110527
	,  1634110527,  1,  1,  NULL,  'exec-code'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'exec-code'
AND  value =  'exec-code' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'exec-code' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'exec-code'
AND  value =  'exec-code' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'exec-code' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.eval',  'P1',  'R',  'false',  'false',  1634110527,  1634110527,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.eval' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110527 AND `update_time`=  1634110527 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.eval' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110527 AND `update_time`=  1634110527 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'exec-code',  'exec-code',  1634110527
	,  1634110527,  1,  1,  NULL,  'exec-code'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'exec-code'
AND  value =  'exec-code' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'exec-code' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'exec-code'
AND  value =  'exec-code' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'exec-code' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'yaml.unsafe_load',  'P1',  'R',  'false',  'false',  1634110527,  1634110527,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.unsafe_load' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110527 AND `update_time`=  1634110527 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.unsafe_load' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110527 AND `update_time`=  1634110527 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'exec-code',  'exec-code',  1634110527
	,  1634110527,  1,  1,  NULL,  'exec-code'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'exec-code'
AND  value =  'exec-code' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'exec-code' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'exec-code'
AND  value =  'exec-code' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'exec-code' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'yaml.load',  'P1',  'R',  'false',  'false',  1634110527,  1634110527,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.load' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110527 AND `update_time`=  1634110527 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.load' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110527 AND `update_time`=  1634110527 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'exec-command',  'exec-command',  1634110527
	,  1634110527,  1,  1,  NULL,  'exec-command'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'exec-command'
AND  value =  'exec-command' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'exec-command' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'exec-command'
AND  value =  'exec-command' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'exec-command' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'os.system',  'P1',  'R',  'false',  'false',  1634110527,  1634110527,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'os.system' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110527 AND `update_time`=  1634110527 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'os.system' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110527 AND `update_time`=  1634110527 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'exec-command',  'exec-command',  1634110527
	,  1634110527,  1,  1,  NULL,  'exec-command'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'exec-command'
AND  value =  'exec-command' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'exec-command' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'exec-command'
AND  value =  'exec-command' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'exec-command' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'os.popen',  'P1',  'R',  'false',  'false',  1634110527,  1634110527,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'os.popen' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110527 AND `update_time`=  1634110527 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'os.popen' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110527 AND `update_time`=  1634110527 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'exec-command',  'exec-command',  1634110527
	,  1634110527,  1,  1,  NULL,  'exec-command'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'exec-command'
AND  value =  'exec-command' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'exec-command' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'exec-command'
AND  value =  'exec-command' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'exec-command' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'subprocess.Popen',  'P1',  'R',  'false',  'false',  1634110527,  1634110527,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'subprocess.Popen' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110527 AND `update_time`=  1634110527 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'subprocess.Popen' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110527 AND `update_time`=  1634110527 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  2,  'path-traversal',  'path-traversal',  1634110528
	,  1634110528,  1,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'django.utils.datastructures.MultiValueDict.get',  'P1',  'R',  'false',  'false',  1634110528,  1634110528,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.utils.datastructures.MultiValueDict.get' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110528 AND `update_time`=  1634110528 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.utils.datastructures.MultiValueDict.get' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110528 AND `update_time`=  1634110528 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  2,  'path-traversal',  'path-traversal',  1634110528
	,  1634110528,  1,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'django.utils.datastructures.MultiValueDict.__getitem__',  'P1',  'R',  'false',  'false',  1634110528,  1634110528,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.utils.datastructures.MultiValueDict.__getitem__' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110528 AND `update_time`=  1634110528 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.utils.datastructures.MultiValueDict.__getitem__' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110528 AND `update_time`=  1634110528 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'path-traversal',  'path-traversal',  1634110528
	,  1634110528,  1,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.__format__',  'P1',  'R',  'false',  'false',  1634110528,  1634110528,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.__format__' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110528 AND `update_time`=  1634110528 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.__format__' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110528 AND `update_time`=  1634110528 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'path-traversal',  'path-traversal',  1634110528
	,  1634110528,  1,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.list.__new__',  'P1',  'R',  'false',  'false',  1634110528,  1634110528,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.list.__new__' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110528 AND `update_time`=  1634110528 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.list.__new__' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110528 AND `update_time`=  1634110528 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'path-traversal',  'path-traversal',  1634110528
	,  1634110528,  1,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.format',  'P1',  'R',  'false',  'false',  1634110528,  1634110528,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.format' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110528 AND `update_time`=  1634110528 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.format' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110528 AND `update_time`=  1634110528 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'path-traversal',  'path-traversal',  1634110528
	,  1634110528,  1,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.join',  'P1',  'R',  'false',  'false',  1634110528,  1634110528,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.join' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110528 AND `update_time`=  1634110528 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.join' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110528 AND `update_time`=  1634110528 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'path-traversal',  'path-traversal',  1634110528
	,  1634110528,  1,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.lower',  'P1',  'R',  'false',  'false',  1634110529,  1634110529,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.lower' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.lower' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'path-traversal',  'path-traversal',  1634110528
	,  1634110528,  1,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.ljust',  'P1',  'R',  'false',  'false',  1634110529,  1634110529,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.ljust' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.ljust' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'path-traversal',  'path-traversal',  1634110528
	,  1634110528,  1,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.rjust',  'P1',  'R',  'false',  'false',  1634110529,  1634110529,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.rjust' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.rjust' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'path-traversal',  'path-traversal',  1634110528
	,  1634110528,  1,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.index',  'P1',  'R',  'false',  'false',  1634110529,  1634110529,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.index' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.index' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  3,  'path-traversal',  'path-traversal',  1634110529
	,  1634110529,  1,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);

SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.split',  'P1',  'R',  'false',  'false',  1634110529,  1634110529,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.split' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.split' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  3,  'path-traversal',  'path-traversal',  1634110529
	,  1634110529,  1,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.rjust',  'P1',  'R',  'false',  'false',  1634110529,  1634110529,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.rjust' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.rjust' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  3,  'path-traversal',  'path-traversal',  1634110529
	,  1634110529,  1,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.translate',  'P1',  'R',  'false',  'false',  1634110529,  1634110529,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.translate' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.translate' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  3,  'path-traversal',  'path-traversal',  1634110529
	,  1634110529,  1,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.list.append',  'P1',  'R',  'false',  'false',  1634110529,  1634110529,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.list.append' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.list.append' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110529 AND `update_time`=  1634110529 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  3,  'path-traversal',  'path-traversal',  1634110529
	,  1634110529,  1,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.list.insert',  'P1',  'R',  'false',  'false',  1634110530,  1634110530,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.list.insert' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110530 AND `update_time`=  1634110530 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.list.insert' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110530 AND `update_time`=  1634110530 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  3,  'path-traversal',  'path-traversal',  1634110529
	,  1634110529,  1,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.list.__add__',  'P1',  'R',  'false',  'false',  1634110530,  1634110530,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.list.__add__' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110530 AND `update_time`=  1634110530 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.list.__add__' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110530 AND `update_time`=  1634110530 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  3,  'path-traversal',  'path-traversal',  1634110529
	,  1634110529,  1,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'json.loads',  'P1',  'R',  'false',  'false',  1634110530,  1634110530,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'json.loads' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110530 AND `update_time`=  1634110530 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'json.loads' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110530 AND `update_time`=  1634110530 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  3,  'path-traversal',  'path-traversal',  1634110529
	,  1634110529,  1,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'json.dumps',  'P1',  'R',  'false',  'false',  1634110530,  1634110530,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'json.dumps' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110530 AND `update_time`=  1634110530 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'json.dumps' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110530 AND `update_time`=  1634110530 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  3,  'path-traversal',  'path-traversal',  1634110529
	,  1634110529,  1,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en is NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'os.path.join',  'P1',  'R',  'false',  'false',  1634110530,  1634110530,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'os.path.join' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110530 AND `update_time`=  1634110530 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'os.path.join' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1634110530 AND `update_time`=  1634110530 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);

INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'path-traversal',  'path-traversal',  1634110525
	,  1634110525,  1,  1,  NULL,  'path-traversal'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 1
AND enable =  1 AND name_en IS NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'path-traversal'
AND  value =  'path-traversal' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 1
AND enable =  1 AND name_en IS NULL AND name_zh =  'path-traversal' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO `iast_strategy` (`user_id`, `vul_type`, `level_id`, `state`
	, `dt`, `vul_name`, `vul_desc`, `vul_fix`, `hook_type_id`
	, `vul_desc_en`, `vul_desc_zh`, `vul_fix_en`, `vul_fix_zh`, `vul_name_zh`
	, `vul_name_en`)
VALUES ( 1,  'path-traversal',  1,  'enable'
	,  1,  '路径穿越',  'CWE-23，该软件使用外部输入来构建路径名，该路径名应位于受限目录内，但不能正确中和诸如“ ..”之类的序列，这些序列可以解析到该目录之外的位置。',  NULL, @HOOK_TYPE_ID
	,  'Verifies that file paths containing untrusted data are not accessed.	',  'CWE-23，该软件使用外部输入来构建路径名，该路径名应位于受限目录内，但不能正确中和诸如“ ..”之类的序列，这些序列可以解析到该目录之外的位置。',  NULL,  NULL,  '路径穿越'
	,  'Path Traversal'
);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'sql-injection',  'sql-injection',  1634110525
	,  1634110525,  1,  1,  NULL,  'sql-injection'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 1
AND enable =  1 AND name_en IS NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'sql-injection'
AND  value =  'sql-injection' AND
update_time= 1634110525 AND create_time= 1634110525 AND `created_by`= 1
AND enable =  1 AND name_en IS NULL AND name_zh =  'sql-injection' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO `iast_strategy` (`user_id`, `vul_type`, `level_id`, `state`
	, `dt`, `vul_name`, `vul_desc`, `vul_fix`, `hook_type_id`
	, `vul_desc_en`, `vul_desc_zh`, `vul_fix_en`, `vul_fix_zh`, `vul_name_zh`
	, `vul_name_en`)
VALUES ( 1,  'sql-injection',  1,  'enable'
	,  1,  'SQL注入',  '软件使用来自上游组件的外部影响的输入来构造全部或部分SQL命令，但不会中和或不正确地中和了特殊元素，这些特殊元素在将其发送到下游组件时可能会修改预期的SQL命令。',  NULL, @HOOK_TYPE_ID
	,  'Verifies that no untrusted data is used in dynamic database queries.	',  '软件使用来自上游组件的外部影响的输入来构造全部或部分SQL命令，但不会中和或不正确地中和了特殊元素，这些特殊元素在将其发送到下游组件时可能会修改预期的SQL命令。',  NULL,  NULL,  'SQL注入'
	,  'SQL Injection'
);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'exec-code',  'exec-code',  1634110527
	,  1634110527,  1,  1,  NULL,  'exec-code'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'exec-code'
AND  value =  'exec-code' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 1
AND enable =  1 AND name_en IS NULL AND name_zh =  'exec-code' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'exec-code'
AND  value =  'exec-code' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 1
AND enable =  1 AND name_en IS NULL AND name_zh =  'exec-code' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO `iast_strategy` (`user_id`, `vul_type`, `level_id`, `state`
	, `dt`, `vul_name`, `vul_desc`, `vul_fix`, `hook_type_id`
	, `vul_desc_en`, `vul_desc_zh`, `vul_fix_en`, `vul_fix_zh`, `vul_name_zh`
	, `vul_name_en`)
VALUES ( 1,  'code-execution',  1,  'enable'
	,  1,  '代码执行',  '代码执行漏洞是指应用程序对传入命令的参数过滤不严导致恶意攻击值能控制最终执行的命令，进而入侵系统，造成严重破坏的高危漏洞。',  NULL, @HOOK_TYPE_ID
	,  'Using this vulnerability, an attacker can execute arbitrary code.',  '代码执行漏洞是指应用程序对传入命令的参数过滤不严导致恶意攻击值能控制最终执行的命令，进而入侵系统，造成严重破坏的高危漏洞。',  NULL,  NULL,  '代码执行'
	,  'Code-execution');
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  'exec-command',  'exec-command',  1634110527
	,  1634110527,  1,  1,  NULL,  'exec-command'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'exec-command'
AND  value =  'exec-command' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 1
AND enable =  1 AND name_en IS NULL AND name_zh =  'exec-command' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'exec-command'
AND  value =  'exec-command' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 1
AND enable =  1 AND name_en IS NULL AND name_zh =  'exec-command' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO `iast_strategy` (`user_id`, `vul_type`, `level_id`, `state`
	, `dt`, `vul_name`, `vul_desc`, `vul_fix`, `hook_type_id`
	, `vul_desc_en`, `vul_desc_zh`, `vul_fix_en`, `vul_fix_zh`, `vul_name_zh`
	, `vul_name_en`)
VALUES ( 1,  'cmd-injection',  1,  'enable'
	,  1,  '命令执行',  '命令执行漏洞是指由于Web应用程序对用户提交的数据过滤不严格，导致黑客可以通过构造特殊命令字符串的方式，将数据提交至Web应用程序中，并利用该方式执行外部程序或系统命令实施攻击，非法获取数据或者网络资源等。',  NULL, @HOOK_TYPE_ID
	,  'Verifies that no untrusted data is used in commands sent to the operating system.	',  '命令执行漏洞是指由于Web应用程序对用户提交的数据过滤不严格，导致黑客可以通过构造特殊命令字符串的方式，将数据提交至Web应用程序中，并利用该方式执行外部程序或系统命令实施攻击，非法获取数据或者网络资源等。',  NULL,  NULL,  '命令执行'
	,  'OS Command Injection'
);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  'general-rules',  'general-rules',  1634110528
	,  1634110528,  1,  1,  NULL,  'general-rules'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  2,  'general-rules',  'general-rules',  1634110528
	,  1634110528,  1,  1,  NULL,  'general-rules'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  3,  'general-rules',  'general-rules',  1634110529
	,  1634110529,  1,  1,  NULL,  'general-rules'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en IS NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);



SET FOREIGN_KEY_CHECKS=1;
