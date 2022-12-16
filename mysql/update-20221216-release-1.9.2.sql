SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;


ALTER TABLE iast_server ADD ipaddresslist json NULL COMMENT 'ipaddresslist';
INSERT INTO iast_vulnerability_status (id, name, name_zh, name_en) VALUES(7, '验证失败', '验证失败', 'Verify failed');

INSERT INTO web_url_route (id, `path`, name, component, meta_keepAlive, meta_disabled, meta_i18n, meta_isMenu, parent, meta_name, redirect, name_i18n_zh, name_i18n_en, name_i18n) VALUES(59, 'systemSettings', 'systemSettings', 'views/setting/SystemSettings.vue', 'False', 'True', 'menu.systemSettings', 'False', 6, 'menu.systemSettings', '', '', '', '');
INSERT INTO web_role_url_relation (role_id, url_id) VALUES(6, 59);

ALTER TABLE iast_agent ADD events json NULL COMMENT 'events';
ALTER TABLE iast_profile MODIFY COLUMN value text  NULL;


DELETE FROM iast_circuit_configs 
WHERE metric_group  != 1;

UPDATE iast_circuit_configs SET deal = 2
WHERE deal = 1;


SET FOREIGN_KEY_CHECKS=1;
