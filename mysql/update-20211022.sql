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
VALUES('cpu_limit', '90');

ALTER TABLE iast_api_route MODIFY COLUMN `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;
ALTER TABLE iast_api_route MODIFY COLUMN code_class varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;
ALTER TABLE iast_api_route MODIFY COLUMN description varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;
ALTER TABLE iast_api_route MODIFY COLUMN code_file varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;
ALTER TABLE iast_api_route MODIFY COLUMN controller varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;
ALTER TABLE iast_agent ADD startup_time int(11) DEFAULT 0 NOT NULL COMMENT '启动时间';
ALTER TABLE iast_agent ADD alias varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' NOT NULL COMMENT 'agent别名';
ALTER TABLE iast_agent ADD register_time int(11) DEFAULT 0 NOT NULL COMMENT '注册时间';
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
VALUES ( 1,  'Response Without Content-Security-Policy Header',  4,  'enable'
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
VALUES ( 1,  'Response With X-XSS-Protection Disabled',  4,  'enable'
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
VALUES ( 1,  'Response With Insecurely Configured Strict-Transport-Security Header        ',  4,  'enable'
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
VALUES ( 1,  'Pages Without Anti-Clickjacking Controls',  4,  'enable'
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
VALUES ( 1,  'Response Without X-Content-Type-Options Header',  4,  'enable'
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


SET FOREIGN_KEY_CHECKS=1;
