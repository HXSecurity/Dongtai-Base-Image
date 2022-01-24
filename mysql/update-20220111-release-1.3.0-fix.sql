
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

INSERT IGNORE INTO iast_strategy (user_id, vul_type, level_id, state, dt, vul_name, vul_desc, vul_fix, hook_type_id, vul_desc_en, vul_desc_zh, vul_fix_en, vul_fix_zh, vul_name_en, vul_name_zh) VALUES(1, 'JNDI注入', 1, 'enable', 1641449965, 'JNDI注入', 'JNDI注入', '禁用lookup方法或禁用远程协议加载', NULL, NULL, 'JNDI注入', NULL, '禁用lookup方法或禁用远程协议加载', NULL, 'JNDI注入');

SET FOREIGN_KEY_CHECKS=1;
