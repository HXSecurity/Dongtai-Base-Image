SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE IF NOT EXISTS `iast_sensitive_info_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `latest_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `strategy_id` int(11) NOT NULL DEFAULT '0',
  `pattern_type_id` int(11) NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `iast_pattern_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '匹配模式',
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT IGNORE INTO iast_pattern_type (id, name, value) VALUES(1, '正则匹配', 1);
INSERT IGNORE INTO iast_pattern_type (id, name, value) VALUES(2, 'JSON 字段解析', 2);


UPDATE IGNORE `iast_document` SET `title` = 'Java Agent快速部署', `url` = 'https://doc.dongtai.io/02_start/03_agent.html#java-agent', `weight` = 99, `language` = 'JAVA', `title_en` = 'Java Agent QuickStart', `title_zh` = 'Java Agent快速部署', `url_en` = 'http://doc2.dongtai.io/en/02_start/03_agent.html#java-agent', `url_zh` = 'https://doc.dongtai.io/02_start/03_agent.html#java-agent' WHERE `id` = 1;
UPDATE IGNORE `iast_document` SET `title` = 'Java Agent Release Note', `url` = 'https://doc.dongtai.io/10_log/01_log.html#java-agent', `weight` = 100, `language` = 'JAVA', `title_en` = 'Java Agent Release Note', `title_zh` = 'Java Agent Release Note', `url_en` = 'http://doc2.dongtai.io/en/10_log/01_log.html#java-agent', `url_zh` = 'https://doc.dongtai.io/10_log/01_log.html#java-agent' WHERE `id` = 2;
UPDATE IGNORE `iast_document` SET `title` = '常见问题(FAQ)', `url` = 'https://doc.dongtai.io/09_faq/index.html', `weight` = 97, `language` = 'JAVA', `title_en` = 'FAQ', `title_zh` = '常见问题(FAQ)', `url_en` = 'http://doc2.dongtai.io/en/09_faq/index.html', `url_zh` = 'https://doc.dongtai.io/09_faq/index.html' WHERE `id` = 3;
UPDATE IGNORE `iast_document` SET `title` = 'DongTai探针参数配置', `url` = 'https://doc.dongtai.io/03_config/02_agent.html#id1', `weight` = 98, `language` = 'JAVA', `title_en` = 'DongTai Agent Configuration', `title_zh` = 'DongTai探针参数配置', `url_en` = 'http://doc2.dongtai.io/en/03_config/02_agent.html#parameter-table', `url_zh` = 'https://doc.dongtai.io/03_config/02_agent.html#id1' WHERE `id` = 4;
UPDATE IGNORE `iast_document` SET `title` = 'DongTai探针参数配置', `url` = 'https://doc.dongtai.io/03_config/02_agent.html#id1', `weight` = 98, `language` = 'PYTHON', `title_en` = 'DongTai Agent Configuration', `title_zh` = 'DongTai探针参数配置', `url_en` = 'http://doc2.dongtai.io/en/03_config/02_agent.html#parameter-table', `url_zh` = 'https://doc.dongtai.io/03_config/02_agent.html#id1' WHERE `id` = 6;
UPDATE IGNORE `iast_document` SET `title` = '常见问题(FAQ)', `url` = 'https://doc.dongtai.io/09_faq/index.html', `weight` = 97, `language` = 'PYTHON', `title_en` = 'FAQ', `title_zh` = '常见问题(FAQ)', `url_en` = 'http://doc2.dongtai.io/en/09_faq/index.html', `url_zh` = 'https://doc.dongtai.io/09_faq/index.html' WHERE `id` = 7;
UPDATE IGNORE `iast_document` SET `title` = 'Python Agent快速部署', `url` = 'https://doc.dongtai.io/02_start/03_agent.html#python-agent', `weight` = 99, `language` = 'PYTHON', `title_en` = 'Python Agent QuickStart', `title_zh` = 'Python Agent快速部署', `url_en` = 'http://doc2.dongtai.io/en/02_start/03_agent.html#python-agent', `url_zh` = 'https://doc.dongtai.io/02_start/03_agent.html#python-agent' WHERE `id` = 8;
UPDATE IGNORE `iast_document` SET `title` = 'Python Agent Release Note', `url` = 'https://doc.dongtai.io/10_log/01_log.html#python-agent', `weight` = 100, `language` = 'PYTHON', `title_en` = 'Python Agent Release Note', `title_zh` = 'Python Agent Release Note', `url_en` = 'http://doc2.dongtai.io/en/10_log/01_log.html#python-agent', `url_zh` = 'https://doc.dongtai.io/10_log/01_log.html#python-agent' WHERE `id` = 9;
UPDATE IGNORE `iast_document` SET `title` = 'PHP Agent快速部署', `url` = 'https://doc2.dongtai.io/zh/02_start/03_agent.html#php-agent', `weight` = 99, `language` = 'PHP', `title_en` = 'PHP Agent QuickStart', `title_zh` = 'PHP Agent快速部署', `url_en` = 'https://doc2.dongtai.io/en/02_start/03_agent.html#php-agent', `url_zh` = 'https://doc2.dongtai.io/zh/02_start/03_agent.html#php-agent' WHERE `id` = 10;






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
SELECT  'django.template.base.Template.render',  'P1',  'R',  'false',  'false',  1636963732,  1636963732,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.template.base.Template.render' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636963732 AND `update_time`=  1636963732 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.template.base.Template.render' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636963732 AND `update_time`=  1636963732 AND `created_by`= 1 AND `enable` =  1
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
SELECT  'django.template.base.render_value_in_context',  'P1',  'R',  'false',  'false',  1636983192,  1636983192,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.template.base.render_value_in_context' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636983192 AND `update_time`=  1636983192 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.template.base.render_value_in_context' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1636983192 AND `update_time`=  1636983192 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en IS  NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 2 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en IS  NULL AND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'django.urls.resolvers.RoutePattern.match',  'P1',  'R',  'false',  'false',  1637209185,  1637209185,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.urls.resolvers.RoutePattern.match' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1637209185 AND `update_time`=  1637209185 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'django.urls.resolvers.RoutePattern.match' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1637209185 AND `update_time`=  1637209185 AND `created_by`= 1 AND `enable` =  1
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
SELECT  'urllib.parse.unquote',  'P1',  'R',  'false',  'false',  1637210822,  1637210822,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'urllib.parse.unquote' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1637210822 AND `update_time`=  1637210822 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'urllib.parse.unquote' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1637210822 AND `update_time`=  1637210822 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);


ALTER TABLE iast_vulnerability ADD strategy_id INT(11) DEFAULT 0 NOT NULL COMMENT '漏洞类型-策略id';
ALTER TABLE iast_hook_type ADD strategy_id int(11) DEFAULT 0 NOT NULL;
ALTER TABLE iast_agent_method_pool MODIFY COLUMN res_body TEXT  NULL COMMENT '响应体';


SET FOREIGN_KEY_CHECKS=1;
