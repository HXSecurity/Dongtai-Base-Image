SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `iast_agent` ADD COLUMN `language` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'JAVA' COMMENT '语言，JAVA、PYTHON' AFTER `is_core_running`;

ALTER TABLE `iast_agent` MODIFY COLUMN `is_core_running` int(11) NULL DEFAULT NULL COMMENT '核心引擎是否启动' AFTER `online`;

ALTER TABLE `iast_agent_method_pool` DROP COLUMN `language`;

ALTER TABLE `iast_agent_method_pool_replay` DROP COLUMN `language`;

ALTER TABLE `iast_asset` DROP COLUMN `language`;

ALTER TABLE `iast_heartbeat` DROP COLUMN `hostname`;

ALTER TABLE `iast_heartbeat` DROP COLUMN `network`;

ALTER TABLE `iast_heartbeat` DROP COLUMN `pid`;

ALTER TABLE `iast_heartbeat` DROP COLUMN `env`;

ALTER TABLE `iast_hook_type` MODIFY COLUMN `enable` tinyint(1) NULL DEFAULT NULL COMMENT '状态：1-启用；0-禁用' AFTER `created_by`;

ALTER TABLE `iast_server` MODIFY COLUMN `env` text;

ALTER TABLE `iast_server` ADD COLUMN `network` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网络情况' AFTER `update_time`;

ALTER TABLE `iast_server` ADD COLUMN `pid` int(11) NULL DEFAULT NULL COMMENT '进程ID ' AFTER `network`;

ALTER TABLE `iast_server` DROP COLUMN `name`;

ALTER TABLE `iast_server` DROP COLUMN `agent_version`;

ALTER TABLE `iast_server` DROP COLUMN `latest_agent_version`;

ALTER TABLE `iast_server` DROP COLUMN `language`;

ALTER TABLE `iast_strategy` ADD COLUMN `hook_type_id` int(11) NULL DEFAULT NULL COMMENT 'hook策略类型ID' AFTER `vul_fix`;

ALTER TABLE `iast_vulnerability` ADD COLUMN `method_pool_id` int(11) NULL DEFAULT 0 COMMENT '方法池ID ' AFTER `param_name`;

ALTER TABLE `iast_vulnerability` DROP COLUMN `language`;

DROP TABLE `iast_hook_talent_strategy`;

INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (1, 1, '字符串传播-01', 'String', 1610535130, 1610535130, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (2, 1, '字符串传播-02', 'StringBuilder', 1610535130, 1610535130, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (3, 1, 'List类型传播', 'List', 1610535130, 1610535130, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (4, 1, 'Map类型传播', 'Map', 1610535130, 1610535130, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (5, 1, '枚举类型传播', 'Enumeration', 1610535130, 1610535130, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (13, 5, 'HttpRequest源处理', 'HttpRequest', 1610535127, 1610535127, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (14, 1, 'IO传播', 'io', 1610535130, 1610535130, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (15, 1, 'URI传播', 'URI', 1610535130, 1610535130, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (16, 1, 'URL类型传播', 'URL', 1610535130, 1610535130, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (17, 1, 'URLDecoder传播', 'URLDecoder', 1610535130, 1610535130, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (18, 1, 'RequestFacade传播', 'RequestFacade', 1610535130, 1610535130, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (19, 1, 'Cookie传播', 'Cookie', 1610535130, 1610535130, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (20, 1, 'ProcessBuilder传播', 'ProcessBuilder', 1610535130, 1610535130, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (21, 1, 'BASE64解码', 'base64-dec', 1610535130, 1610535130, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (22, 1, 'BASE64编码', 'base64-enc', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (23, 1, 'OWASP-Esapi传播', 'owasp-esapi', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (24, 1, 'Apache过滤方法', 'apache-filter', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (25, 1, 'Javax传播', 'javax', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (26, 1, 'Xml.Sax传播', 'xml.sax', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (27, 1, 'Spring传播', 'spring', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (28, 1, 'httpclient传播', 'httpclient', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (29, 1, 'httpclient5传播', 'httpclient5', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (30, 1, 'okhttp传播', 'okhttp', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (31, 1, 'okhttp3传播', 'okhttp3', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (32, 1, 'SPEL传播', 'spel', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (33, 1, 'OGNL传播', 'ognl', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (34, 1, 'Lambda表达式函数', 'lambda-function', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (35, 1, 'serverlt-stream传播', 'servelt-stream', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (36, 1, 'JDBC传播', 'jdbc', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (37, 4, 'SMTP注入', 'smtp-injection', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (38, 4, '服务器端请求伪造', 'ssrf', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (39, 4, '不安全的XMl Decode', 'unsafe-xml-decode', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (40, 4, '命令执行 ', 'cmd-injection', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (41, 4, 'Sql注入', 'sql-injection', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (42, 4, 'LDAP注入', 'ldap-injection', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (43, 4, 'XPATH注入', 'xpath-injection', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (44, 4, '路径穿越', 'path-traversal', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (45, 4, '不安全的随机数', 'crypto-weak-randomness', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (46, 4, '不安全的hash算法', 'crypto-bad-mac', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (47, 4, '不安全的加密算法', 'crypto-bad-ciphers', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (48, 4, 'Cookie-flag缺失', 'cookie-flags-missing', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (49, 4, '信任边界', 'trust-boundary-violation', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (50, 4, '反射型XSS', 'reflected-xss', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (51, 4, 'XML外部实体注入', 'xxe', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (52, 4, '表达式注入', 'expression-language-injection', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (53, 4, '正则表达式Dos攻击', 'redos', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (54, 4, '反射注入', 'reflection-injection', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (55, 4, '不安全的反序列化', 'unsafe-json-deserialize', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (56, 4, 'Hql注入', 'hql-injection', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (57, 4, 'NoSql注入', 'nosql-injection', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (58, 4, '不安全的readline', 'unsafe-readline', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (59, 4, '不安全的转发', 'unvalidated-forward', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (60, 4, '不安全的重定向', 'unvalidated-redirect', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (61, 4, 'Header头注入', 'header-injection', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (62, 4, '动态库加载', 'dynamic-library-load', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (63, 4, 'SpringCloudConfigServer', 'spring-cloud-config-server', 1610535131, 1610535131, 1, 0);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (64, 4, 'SQL越权类型', 'sql-over-power', 1610535131, 1610535131, 1, 0);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (65, 3, '反射型XSS过滤类型', 'reflected-xss-filter', 1610535131, 1610535131, 1, 0);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (66, 3, 'XXE过滤类型', 'xxe-filter', 1610535131, 1610535131, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (67, 1, 'Arrays辅助传播策略', 'Arrays', 1614601101, 1614601101, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (68, 1, 'Collection辅助传播识别策略', 'Collection', 1614601101, 1614601101, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (71, 1, 'Solr参数解析', 'SolrParamParser', 1616036563, 1616036563, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (76, 2, 'Struts2接口读取参数', 'Struts2', 1616579090, 1616579090, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (100, 3, '路径穿越过滤方法', 'path-traversal-filter', 1620893202, 1620893202, 18, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (101, 3, 'apache工具包过滤组件', 'Apache-Commons-Lang-Filter', 1621475489, 1621475489, 18, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (102, 2, 'ServletRequest接口', 'javax.servlet.ServletRequest', 1622521929, 1622521929, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (103, 2, 'HttpServletRequest接口', 'javax.servlet.http.HttpServletRequest', 1622522441, 1622522441, 1, 1);
INSERT INTO `iast_hook_type`(`id`, `type`, `name`, `value`, `create_time`, `update_time`, `created_by`, `enable`) VALUES (104, 2, 'Spring参数处理接口', 'org.springframework.web.method.support.HandlerMethodArgumentResolver', 1622524533, 1622524533, 1, 1);

-- 修改数据
UPDATE iast_strategy SET hook_type_id=40 WHERE id=1;
UPDATE iast_strategy SET hook_type_id=37 WHERE id=2;
UPDATE iast_strategy SET hook_type_id=38 WHERE id=3;
UPDATE iast_strategy SET hook_type_id=39 WHERE id=4;
UPDATE iast_strategy SET hook_type_id=41 WHERE id=5;
UPDATE iast_strategy SET hook_type_id=42 WHERE id=6;
UPDATE iast_strategy SET hook_type_id=43 WHERE id=7;
UPDATE iast_strategy SET hook_type_id=44 WHERE id=8;
UPDATE iast_strategy SET hook_type_id=45 WHERE id=9;
UPDATE iast_strategy SET hook_type_id=46 WHERE id=10;
UPDATE iast_strategy SET hook_type_id=47 WHERE id=11;
UPDATE iast_strategy SET hook_type_id=48 WHERE id=12;
UPDATE iast_strategy SET hook_type_id=49 WHERE id=13;
UPDATE iast_strategy SET hook_type_id=50 WHERE id=14;
UPDATE iast_strategy SET hook_type_id=61 WHERE id=15;
UPDATE iast_strategy SET hook_type_id=56 WHERE id=16;
UPDATE iast_strategy SET hook_type_id=58 WHERE id=17;
UPDATE iast_strategy SET hook_type_id=52 WHERE id=18;
UPDATE iast_strategy SET hook_type_id=53 WHERE id=19;
UPDATE iast_strategy SET hook_type_id=54 WHERE id=20;
UPDATE iast_strategy SET hook_type_id=57 WHERE id=21;
UPDATE iast_strategy SET hook_type_id=60 WHERE id=22;
UPDATE iast_strategy SET hook_type_id=59 WHERE id=23;
UPDATE iast_strategy SET hook_type_id=47 WHERE id=24;
UPDATE iast_strategy SET hook_type_id=62 WHERE id=25;
UPDATE iast_strategy SET hook_type_id=51 WHERE id=26;
UPDATE iast_strategy SET hook_type_id=55 WHERE id=27;

SET FOREIGN_KEY_CHECKS=1;
