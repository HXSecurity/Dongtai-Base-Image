SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

DELETE FROM  iast_hook_strategy
WHERE value IN 
('yaml.unsafe_load', 'yaml.load', 'yaml.unsafe_load_all', 'yaml.load_all', 'builtins.str.fstring');

INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  '无效的传播方法',  'InvalidPropagator',  1645587869
	,  1645587869,  1,  1,  NULL,  '无效的传播方法'
	,  1 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  '无效的传播方法'
AND  value =  'InvalidPropagator' AND
update_time= 1645587869 AND create_time= 1645587869 AND `created_by`= 1
AND enable =  1 AND name_en =  NULLAND name_zh =  '无效的传播方法' AND language_id =  1 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  '无效的传播方法'
AND  value =  'InvalidPropagator' AND
update_time= 1645587869 AND create_time= 1645587869 AND `created_by`= 1
AND enable =  1 AND name_en =  NULLAND name_zh =  '无效的传播方法' AND language_id =  1 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'com.mysql.jdbc.ResultSetImpl.next()',  'O',  'R',  'false',  'false',  1645587906,  1645587906,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'com.mysql.jdbc.ResultSetImpl.next()' AND `source`= 'O' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1645587906 AND `update_time`=  1645587906 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'com.mysql.jdbc.ResultSetImpl.next()' AND `source`= 'O' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1645587906 AND `update_time`=  1645587906 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  '无效的传播方法',  'InvalidPropagator',  1645587869
	,  1645587869,  1,  1,  NULL,  '无效的传播方法'
	,  1 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  '无效的传播方法'
AND  value =  'InvalidPropagator' AND
update_time= 1645587869 AND create_time= 1645587869 AND `created_by`= 1
AND enable =  1 AND name_en =  NULLAND name_zh =  '无效的传播方法' AND language_id =  1 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  '无效的传播方法'
AND  value =  'InvalidPropagator' AND
update_time= 1645587869 AND create_time= 1645587869 AND `created_by`= 1
AND enable =  1 AND name_en =  NULLAND name_zh =  '无效的传播方法' AND language_id =  1 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'org.thymeleaf.spring5.view.ThymeleafView.render(java.util.Map<java.lang.String,?>,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse)',  'O',  'O',  'false',  'false',  1645614497,  1645614497,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'org.thymeleaf.spring5.view.ThymeleafView.render(java.util.Map<java.lang.String,?>,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse)' AND `source`= 'O' AND `target`= 'O' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1645614497 AND `update_time`=  1645614497 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'org.thymeleaf.spring5.view.ThymeleafView.render(java.util.Map<java.lang.String,?>,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse)' AND `source`= 'O' AND `target`= 'O' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1645614497 AND `update_time`=  1645614497 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  1,  '无效的传播方法',  'InvalidPropagator',  1645587869
	,  1645587869,  1,  1,  NULL,  '无效的传播方法'
	,  1 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  '无效的传播方法'
AND  value =  'InvalidPropagator' AND
update_time= 1645587869 AND create_time= 1645587869 AND `created_by`= 1
AND enable =  1 AND name_en =  NULLAND name_zh =  '无效的传播方法' AND language_id =  1 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  '无效的传播方法'
AND  value =  'InvalidPropagator' AND
update_time= 1645587869 AND create_time= 1645587869 AND `created_by`= 1
AND enable =  1 AND name_en =  NULLAND name_zh =  '无效的传播方法' AND language_id =  1 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'org.jruby.ir.IRScope.prepareForCompilation()',  'O',  'R',  'all',  'false',  1645614576,  1645614576,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'org.jruby.ir.IRScope.prepareForCompilation()' AND `source`= 'O' AND `target`= 'R' AND `inherit`= 'all' AND `track`= 'false' AND `create_time`=  1645614576 AND `update_time`=  1645614576 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'org.jruby.ir.IRScope.prepareForCompilation()' AND `source`= 'O' AND `target`= 'R' AND `inherit`= 'all' AND `track`= 'false' AND `create_time`=  1645614576 AND `update_time`=  1645614576 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en =  NULLAND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en =  NULLAND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.str.fstring',  'P',  'R',  'false',  'false',  1638871319,  1642487592,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.fstring' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1638871319 AND `update_time`=  1642487592 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.fstring' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1638871319 AND `update_time`=  1642487592 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en =  NULLAND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en =  NULLAND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'Crypto.Cipher.Blowfish.new',  'P',  'R',  'false',  'false',  1641806894,  1641806894,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Crypto.Cipher.Blowfish.new' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1641806894 AND `update_time`=  1641806894 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Crypto.Cipher.Blowfish.new' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1641806894 AND `update_time`=  1641806894 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en =  NULLAND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en =  NULLAND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'Crypto.Cipher.DES.new',  'P',  'R',  'false',  'false',  1641806911,  1641806911,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Crypto.Cipher.DES.new' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1641806911 AND `update_time`=  1641806911 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Crypto.Cipher.DES.new' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1641806911 AND `update_time`=  1641806911 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en =  NULLAND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en =  NULLAND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'Cryptodome.Cipher.Blowfish.new',  'P',  'R',  'false',  'false',  1641806927,  1641806927,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Cryptodome.Cipher.Blowfish.new' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1641806927 AND `update_time`=  1641806927 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Cryptodome.Cipher.Blowfish.new' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1641806927 AND `update_time`=  1641806927 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en =  NULLAND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110528 AND create_time= 1634110528 AND `created_by`= 1
AND enable =  1 AND name_en =  NULLAND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'Cryptodome.Cipher.DES.new',  'P',  'R',  'false',  'false',  1641806949,  1641806949,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Cryptodome.Cipher.DES.new' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1641806949 AND `update_time`=  1641806949 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Cryptodome.Cipher.DES.new' AND `source`= 'P' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1641806949 AND `update_time`=  1641806949 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '不安全的加密算法',  'crypto-bad-ciphers',  1610535131
	,  1610535131,  1,  1,  'Insecure Encryption Algorithms',  '不安全的加密算法'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的加密算法'
AND  value =  'crypto-bad-ciphers' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Insecure Encryption Algorithms'AND name_zh =  '不安全的加密算法' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的加密算法'
AND  value =  'crypto-bad-ciphers' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Insecure Encryption Algorithms'AND name_zh =  '不安全的加密算法' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'Crypto.Cipher._mode_cbc.CbcMode.encrypt',  'P1,2,plaintext',  '',  'false',  'true',  1641807029,  1641808074,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Crypto.Cipher._mode_cbc.CbcMode.encrypt' AND `source`= 'P1,2,plaintext' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641807029 AND `update_time`=  1641808074 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Crypto.Cipher._mode_cbc.CbcMode.encrypt' AND `source`= 'P1,2,plaintext' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641807029 AND `update_time`=  1641808074 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '不安全的加密算法',  'crypto-bad-ciphers',  1610535131
	,  1610535131,  1,  1,  'Insecure Encryption Algorithms',  '不安全的加密算法'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的加密算法'
AND  value =  'crypto-bad-ciphers' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Insecure Encryption Algorithms'AND name_zh =  '不安全的加密算法' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的加密算法'
AND  value =  'crypto-bad-ciphers' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Insecure Encryption Algorithms'AND name_zh =  '不安全的加密算法' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'Crypto.Cipher._mode_cfb.CfbMode.encrypt',  'P1,2,plaintext',  '',  'false',  'true',  1641807089,  1641807089,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Crypto.Cipher._mode_cfb.CfbMode.encrypt' AND `source`= 'P1,2,plaintext' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641807089 AND `update_time`=  1641807089 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Crypto.Cipher._mode_cfb.CfbMode.encrypt' AND `source`= 'P1,2,plaintext' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641807089 AND `update_time`=  1641807089 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '不安全的加密算法',  'crypto-bad-ciphers',  1610535131
	,  1610535131,  1,  1,  'Insecure Encryption Algorithms',  '不安全的加密算法'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的加密算法'
AND  value =  'crypto-bad-ciphers' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Insecure Encryption Algorithms'AND name_zh =  '不安全的加密算法' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的加密算法'
AND  value =  'crypto-bad-ciphers' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Insecure Encryption Algorithms'AND name_zh =  '不安全的加密算法' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'Crypto.Cipher._mode_ctr.CtrMode.encrypt',  'P1,2,plaintext',  '',  'false',  'true',  1641807155,  1641807155,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Crypto.Cipher._mode_ctr.CtrMode.encrypt' AND `source`= 'P1,2,plaintext' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641807155 AND `update_time`=  1641807155 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Crypto.Cipher._mode_ctr.CtrMode.encrypt' AND `source`= 'P1,2,plaintext' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641807155 AND `update_time`=  1641807155 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '不安全的加密算法',  'crypto-bad-ciphers',  1610535131
	,  1610535131,  1,  1,  'Insecure Encryption Algorithms',  '不安全的加密算法'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的加密算法'
AND  value =  'crypto-bad-ciphers' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Insecure Encryption Algorithms'AND name_zh =  '不安全的加密算法' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的加密算法'
AND  value =  'crypto-bad-ciphers' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Insecure Encryption Algorithms'AND name_zh =  '不安全的加密算法' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'Crypto.Cipher._mode_eax.EaxMode.encrypt',  'P1,2,plaintext',  '',  'false',  'true',  1641807184,  1641807184,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Crypto.Cipher._mode_eax.EaxMode.encrypt' AND `source`= 'P1,2,plaintext' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641807184 AND `update_time`=  1641807184 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Crypto.Cipher._mode_eax.EaxMode.encrypt' AND `source`= 'P1,2,plaintext' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641807184 AND `update_time`=  1641807184 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '不安全的加密算法',  'crypto-bad-ciphers',  1610535131
	,  1610535131,  1,  1,  'Insecure Encryption Algorithms',  '不安全的加密算法'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的加密算法'
AND  value =  'crypto-bad-ciphers' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Insecure Encryption Algorithms'AND name_zh =  '不安全的加密算法' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的加密算法'
AND  value =  'crypto-bad-ciphers' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Insecure Encryption Algorithms'AND name_zh =  '不安全的加密算法' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'Crypto.Cipher._mode_ecb.EcbMode.encrypt',  'P1,2,plaintext',  '',  'false',  'true',  1641807217,  1641807217,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Crypto.Cipher._mode_ecb.EcbMode.encrypt' AND `source`= 'P1,2,plaintext' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641807217 AND `update_time`=  1641807217 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Crypto.Cipher._mode_ecb.EcbMode.encrypt' AND `source`= 'P1,2,plaintext' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641807217 AND `update_time`=  1641807217 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '不安全的加密算法',  'crypto-bad-ciphers',  1610535131
	,  1610535131,  1,  1,  'Insecure Encryption Algorithms',  '不安全的加密算法'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的加密算法'
AND  value =  'crypto-bad-ciphers' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Insecure Encryption Algorithms'AND name_zh =  '不安全的加密算法' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的加密算法'
AND  value =  'crypto-bad-ciphers' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Insecure Encryption Algorithms'AND name_zh =  '不安全的加密算法' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'Crypto.Cipher._mode_ofb.OfbMode.encrypt',  'P1,2,plaintext',  '',  'false',  'true',  1641807243,  1641807243,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Crypto.Cipher._mode_ofb.OfbMode.encrypt' AND `source`= 'P1,2,plaintext' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641807243 AND `update_time`=  1641807243 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Crypto.Cipher._mode_ofb.OfbMode.encrypt' AND `source`= 'P1,2,plaintext' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641807243 AND `update_time`=  1641807243 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '不安全的加密算法',  'crypto-bad-ciphers',  1610535131
	,  1610535131,  1,  1,  'Insecure Encryption Algorithms',  '不安全的加密算法'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的加密算法'
AND  value =  'crypto-bad-ciphers' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Insecure Encryption Algorithms'AND name_zh =  '不安全的加密算法' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的加密算法'
AND  value =  'crypto-bad-ciphers' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Insecure Encryption Algorithms'AND name_zh =  '不安全的加密算法' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'Crypto.Cipher._mode_openpgp.OpenPgpMode.encrypt',  'P1,2,plaintext',  '',  'false',  'true',  1641807275,  1641807288,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Crypto.Cipher._mode_openpgp.OpenPgpMode.encrypt' AND `source`= 'P1,2,plaintext' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641807275 AND `update_time`=  1641807288 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Crypto.Cipher._mode_openpgp.OpenPgpMode.encrypt' AND `source`= 'P1,2,plaintext' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641807275 AND `update_time`=  1641807288 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '不安全的加密算法',  'crypto-bad-ciphers',  1610535131
	,  1610535131,  1,  1,  'Insecure Encryption Algorithms',  '不安全的加密算法'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的加密算法'
AND  value =  'crypto-bad-ciphers' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Insecure Encryption Algorithms'AND name_zh =  '不安全的加密算法' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的加密算法'
AND  value =  'crypto-bad-ciphers' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Insecure Encryption Algorithms'AND name_zh =  '不安全的加密算法' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'Cryptodome.Cipher._mode_cbc.CbcMode.encrypt',  'P1,2,plaintext',  '',  'false',  'true',  1641807973,  1641807991,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Cryptodome.Cipher._mode_cbc.CbcMode.encrypt' AND `source`= 'P1,2,plaintext' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641807973 AND `update_time`=  1641807991 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Cryptodome.Cipher._mode_cbc.CbcMode.encrypt' AND `source`= 'P1,2,plaintext' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641807973 AND `update_time`=  1641807991 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '不安全的加密算法',  'crypto-bad-ciphers',  1610535131
	,  1610535131,  1,  1,  'Insecure Encryption Algorithms',  '不安全的加密算法'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的加密算法'
AND  value =  'crypto-bad-ciphers' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Insecure Encryption Algorithms'AND name_zh =  '不安全的加密算法' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的加密算法'
AND  value =  'crypto-bad-ciphers' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Insecure Encryption Algorithms'AND name_zh =  '不安全的加密算法' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'Cryptodome.Cipher._mode_cfb.CfbMode.encrypt',  'P1,2,plaintext',  '',  'false',  'true',  1641808119,  1641808119,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Cryptodome.Cipher._mode_cfb.CfbMode.encrypt' AND `source`= 'P1,2,plaintext' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641808119 AND `update_time`=  1641808119 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Cryptodome.Cipher._mode_cfb.CfbMode.encrypt' AND `source`= 'P1,2,plaintext' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641808119 AND `update_time`=  1641808119 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '不安全的加密算法',  'crypto-bad-ciphers',  1610535131
	,  1610535131,  1,  1,  'Insecure Encryption Algorithms',  '不安全的加密算法'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的加密算法'
AND  value =  'crypto-bad-ciphers' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Insecure Encryption Algorithms'AND name_zh =  '不安全的加密算法' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的加密算法'
AND  value =  'crypto-bad-ciphers' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Insecure Encryption Algorithms'AND name_zh =  '不安全的加密算法' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'Cryptodome.Cipher._mode_ctr.CtrMode.encrypt',  'P1,2,plaintext',  '',  'false',  'true',  1641808150,  1641808150,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Cryptodome.Cipher._mode_ctr.CtrMode.encrypt' AND `source`= 'P1,2,plaintext' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641808150 AND `update_time`=  1641808150 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Cryptodome.Cipher._mode_ctr.CtrMode.encrypt' AND `source`= 'P1,2,plaintext' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641808150 AND `update_time`=  1641808150 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '不安全的加密算法',  'crypto-bad-ciphers',  1610535131
	,  1610535131,  1,  1,  'Insecure Encryption Algorithms',  '不安全的加密算法'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的加密算法'
AND  value =  'crypto-bad-ciphers' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Insecure Encryption Algorithms'AND name_zh =  '不安全的加密算法' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的加密算法'
AND  value =  'crypto-bad-ciphers' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Insecure Encryption Algorithms'AND name_zh =  '不安全的加密算法' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'Cryptodome.Cipher._mode_eax.EaxMode.encrypt',  'P1,2,plaintext',  '',  'false',  'true',  1641808192,  1641808192,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Cryptodome.Cipher._mode_eax.EaxMode.encrypt' AND `source`= 'P1,2,plaintext' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641808192 AND `update_time`=  1641808192 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Cryptodome.Cipher._mode_eax.EaxMode.encrypt' AND `source`= 'P1,2,plaintext' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641808192 AND `update_time`=  1641808192 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '不安全的加密算法',  'crypto-bad-ciphers',  1610535131
	,  1610535131,  1,  1,  'Insecure Encryption Algorithms',  '不安全的加密算法'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的加密算法'
AND  value =  'crypto-bad-ciphers' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Insecure Encryption Algorithms'AND name_zh =  '不安全的加密算法' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的加密算法'
AND  value =  'crypto-bad-ciphers' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Insecure Encryption Algorithms'AND name_zh =  '不安全的加密算法' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'Cryptodome.Cipher._mode_ecb.EcbMode.encrypt',  'P1,2,plaintext',  '',  'false',  'true',  1641808224,  1641808224,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Cryptodome.Cipher._mode_ecb.EcbMode.encrypt' AND `source`= 'P1,2,plaintext' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641808224 AND `update_time`=  1641808224 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Cryptodome.Cipher._mode_ecb.EcbMode.encrypt' AND `source`= 'P1,2,plaintext' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641808224 AND `update_time`=  1641808224 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '不安全的加密算法',  'crypto-bad-ciphers',  1610535131
	,  1610535131,  1,  1,  'Insecure Encryption Algorithms',  '不安全的加密算法'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的加密算法'
AND  value =  'crypto-bad-ciphers' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Insecure Encryption Algorithms'AND name_zh =  '不安全的加密算法' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的加密算法'
AND  value =  'crypto-bad-ciphers' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Insecure Encryption Algorithms'AND name_zh =  '不安全的加密算法' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'Cryptodome.Cipher._mode_ofb.OfbMode.encrypt',  'P1,2,plaintext',  '',  'false',  'true',  1641808248,  1641808248,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Cryptodome.Cipher._mode_ofb.OfbMode.encrypt' AND `source`= 'P1,2,plaintext' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641808248 AND `update_time`=  1641808248 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Cryptodome.Cipher._mode_ofb.OfbMode.encrypt' AND `source`= 'P1,2,plaintext' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641808248 AND `update_time`=  1641808248 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '不安全的加密算法',  'crypto-bad-ciphers',  1610535131
	,  1610535131,  1,  1,  'Insecure Encryption Algorithms',  '不安全的加密算法'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的加密算法'
AND  value =  'crypto-bad-ciphers' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Insecure Encryption Algorithms'AND name_zh =  '不安全的加密算法' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '不安全的加密算法'
AND  value =  'crypto-bad-ciphers' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Insecure Encryption Algorithms'AND name_zh =  '不安全的加密算法' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'Cryptodome.Cipher._mode_openpgp.OpenPgpMode.encrypt',  'P1,2,plaintext',  '',  'false',  'true',  1641808309,  1641808309,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Cryptodome.Cipher._mode_openpgp.OpenPgpMode.encrypt' AND `source`= 'P1,2,plaintext' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641808309 AND `update_time`=  1641808309 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'Cryptodome.Cipher._mode_openpgp.OpenPgpMode.encrypt' AND `source`= 'P1,2,plaintext' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641808309 AND `update_time`=  1641808309 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '正则表达式Dos攻击',  'redos',  1610535131
	,  1610535131,  1,  1,  'Regular Expression DoS',  '正则表达式Dos攻击'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '正则表达式Dos攻击'
AND  value =  'redos' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Regular Expression DoS'AND name_zh =  '正则表达式Dos攻击' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '正则表达式Dos攻击'
AND  value =  'redos' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Regular Expression DoS'AND name_zh =  '正则表达式Dos攻击' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  're.match',  'P1,pattern',  '',  'false',  'true',  1641974015,  1642495834,  1,  0
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 're.match' AND `source`= 'P1,pattern' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641974015 AND `update_time`=  1642495834 AND `created_by`= 1 AND `enable` =  0
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 're.match' AND `source`= 'P1,pattern' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641974015 AND `update_time`=  1642495834 AND `created_by`= 1 AND `enable` =  0
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '正则表达式Dos攻击',  'redos',  1610535131
	,  1610535131,  1,  1,  'Regular Expression DoS',  '正则表达式Dos攻击'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '正则表达式Dos攻击'
AND  value =  'redos' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Regular Expression DoS'AND name_zh =  '正则表达式Dos攻击' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '正则表达式Dos攻击'
AND  value =  'redos' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Regular Expression DoS'AND name_zh =  '正则表达式Dos攻击' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  're.fullmatch',  'P1,pattern',  '',  'false',  'true',  1641974044,  1642495842,  1,  0
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 're.fullmatch' AND `source`= 'P1,pattern' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641974044 AND `update_time`=  1642495842 AND `created_by`= 1 AND `enable` =  0
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 're.fullmatch' AND `source`= 'P1,pattern' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641974044 AND `update_time`=  1642495842 AND `created_by`= 1 AND `enable` =  0
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '正则表达式Dos攻击',  'redos',  1610535131
	,  1610535131,  1,  1,  'Regular Expression DoS',  '正则表达式Dos攻击'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '正则表达式Dos攻击'
AND  value =  'redos' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Regular Expression DoS'AND name_zh =  '正则表达式Dos攻击' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '正则表达式Dos攻击'
AND  value =  'redos' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Regular Expression DoS'AND name_zh =  '正则表达式Dos攻击' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  're.search',  'P1,pattern',  '',  'false',  'true',  1641974100,  1642496643,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 're.search' AND `source`= 'P1,pattern' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641974100 AND `update_time`=  1642496643 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 're.search' AND `source`= 'P1,pattern' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641974100 AND `update_time`=  1642496643 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '正则表达式Dos攻击',  'redos',  1610535131
	,  1610535131,  1,  1,  'Regular Expression DoS',  '正则表达式Dos攻击'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '正则表达式Dos攻击'
AND  value =  'redos' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Regular Expression DoS'AND name_zh =  '正则表达式Dos攻击' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '正则表达式Dos攻击'
AND  value =  'redos' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Regular Expression DoS'AND name_zh =  '正则表达式Dos攻击' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  're.sub',  'P1,pattern',  '',  'false',  'true',  1641974125,  1642496649,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 're.sub' AND `source`= 'P1,pattern' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641974125 AND `update_time`=  1642496649 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 're.sub' AND `source`= 'P1,pattern' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641974125 AND `update_time`=  1642496649 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '正则表达式Dos攻击',  'redos',  1610535131
	,  1610535131,  1,  1,  'Regular Expression DoS',  '正则表达式Dos攻击'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '正则表达式Dos攻击'
AND  value =  'redos' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Regular Expression DoS'AND name_zh =  '正则表达式Dos攻击' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '正则表达式Dos攻击'
AND  value =  'redos' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Regular Expression DoS'AND name_zh =  '正则表达式Dos攻击' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  're.subn',  'P1,pattern',  '',  'false',  'true',  1641974146,  1642496654,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 're.subn' AND `source`= 'P1,pattern' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641974146 AND `update_time`=  1642496654 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 're.subn' AND `source`= 'P1,pattern' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641974146 AND `update_time`=  1642496654 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '正则表达式Dos攻击',  'redos',  1610535131
	,  1610535131,  1,  1,  'Regular Expression DoS',  '正则表达式Dos攻击'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '正则表达式Dos攻击'
AND  value =  'redos' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Regular Expression DoS'AND name_zh =  '正则表达式Dos攻击' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '正则表达式Dos攻击'
AND  value =  'redos' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Regular Expression DoS'AND name_zh =  '正则表达式Dos攻击' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  're.split',  'P1,pattern',  '',  'false',  'true',  1641974164,  1642496801,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 're.split' AND `source`= 'P1,pattern' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641974164 AND `update_time`=  1642496801 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 're.split' AND `source`= 'P1,pattern' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641974164 AND `update_time`=  1642496801 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '正则表达式Dos攻击',  'redos',  1610535131
	,  1610535131,  1,  1,  'Regular Expression DoS',  '正则表达式Dos攻击'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '正则表达式Dos攻击'
AND  value =  'redos' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Regular Expression DoS'AND name_zh =  '正则表达式Dos攻击' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '正则表达式Dos攻击'
AND  value =  'redos' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Regular Expression DoS'AND name_zh =  '正则表达式Dos攻击' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  're.findall',  'P1,pattern',  '',  'false',  'true',  1641974183,  1642496808,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 're.findall' AND `source`= 'P1,pattern' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641974183 AND `update_time`=  1642496808 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 're.findall' AND `source`= 'P1,pattern' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641974183 AND `update_time`=  1642496808 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT  4,  '正则表达式Dos攻击',  'redos',  1610535131
	,  1610535131,  1,  1,  'Regular Expression DoS',  '正则表达式Dos攻击'
	,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '正则表达式Dos攻击'
AND  value =  'redos' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Regular Expression DoS'AND name_zh =  '正则表达式Dos攻击' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  '正则表达式Dos攻击'
AND  value =  'redos' AND
update_time= 1610535131 AND create_time= 1610535131 AND `created_by`= 1
AND enable =  1 AND name_en =  'Regular Expression DoS'AND name_zh =  '正则表达式Dos攻击' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  're.finditer',  'P1,pattern',  '',  'false',  'true',  1641974199,  1642496815,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 're.finditer' AND `source`= 'P1,pattern' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641974199 AND `update_time`=  1642496815 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 're.finditer' AND `source`= 'P1,pattern' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1641974199 AND `update_time`=  1642496815 AND `created_by`= 1 AND `enable` =  1
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
AND enable =  1 AND name_en =  NULLAND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 3 AND `name`=  'general-rules'
AND  value =  'general-rules' AND
update_time= 1634110529 AND create_time= 1634110529 AND `created_by`= 1
AND enable =  1 AND name_en =  NULLAND name_zh =  'general-rules' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  're.escape',  'P1,pattern',  'R',  'false',  'false',  1641974469,  1641974486,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 're.escape' AND `source`= 'P1,pattern' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1641974469 AND `update_time`=  1641974486 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 're.escape' AND `source`= 'P1,pattern' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1641974469 AND `update_time`=  1641974486 AND `created_by`= 1 AND `enable` =  1
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
SELECT  'yaml.loader.FullLoader.__init__',  'P2,stream',  '',  'false',  'true',  1642494670,  1642494670,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.loader.FullLoader.__init__' AND `source`= 'P2,stream' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1642494670 AND `update_time`=  1642494670 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.loader.FullLoader.__init__' AND `source`= 'P2,stream' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1642494670 AND `update_time`=  1642494670 AND `created_by`= 1 AND `enable` =  1
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
SELECT  'yaml.loader.UnsafeLoader.__init__',  'P2,stream',  '',  'false',  'true',  1642494759,  1642494759,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.loader.UnsafeLoader.__init__' AND `source`= 'P2,stream' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1642494759 AND `update_time`=  1642494759 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.loader.UnsafeLoader.__init__' AND `source`= 'P2,stream' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1642494759 AND `update_time`=  1642494759 AND `created_by`= 1 AND `enable` =  1
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
SELECT  'yaml.loader.Loader.__init__',  'P2,stream',  '',  'false',  'true',  1642494826,  1642494826,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.loader.Loader.__init__' AND `source`= 'P2,stream' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1642494826 AND `update_time`=  1642494826 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'yaml.loader.Loader.__init__' AND `source`= 'P2,stream' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1642494826 AND `update_time`=  1642494826 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);



ALTER TABLE iast_api_methods MODIFY COLUMN `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;
ALTER TABLE iast_http_method MODIFY COLUMN `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;

SET FOREIGN_KEY_CHECKS=1;
