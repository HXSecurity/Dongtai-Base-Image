SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;



UPDATE IGNORE `iast_document` SET `title` = 'Java Agent快速部署', `url` = 'https://doc.dongtai.io/02_start/03_agent.html#java-agent', `weight` = 99, `language` = 'JAVA', `title_en` = 'Java Agent QuickStart', `title_zh` = 'Java Agent快速部署', `url_en` = 'http://doc2.dongtai.io/en/02_start/03_agent.html#java-agent', `url_zh` = 'https://doc.dongtai.io/02_start/03_agent.html#java-agent' WHERE `id` = 1;
UPDATE IGNORE `iast_document` SET `title` = 'Java Agent Release Note', `url` = 'https://doc.dongtai.io/10_log/01_log.html#java-agent', `weight` = 100, `language` = 'JAVA', `title_en` = 'Java Agent Release Note', `title_zh` = 'Java Agent Release Note', `url_en` = 'http://doc2.dongtai.io/en/10_log/01_log.html#java-agent', `url_zh` = 'https://doc.dongtai.io/10_log/01_log.html#java-agent' WHERE `id` = 2;
UPDATE IGNORE `iast_document` SET `title` = '常见问题(FAQ)', `url` = 'https://doc.dongtai.io/09_faq/index.html', `weight` = 97, `language` = 'JAVA', `title_en` = 'FAQ', `title_zh` = '常见问题(FAQ)', `url_en` = 'http://doc2.dongtai.io/en/09_faq/index.html', `url_zh` = 'https://doc.dongtai.io/09_faq/index.html' WHERE `id` = 3;
UPDATE IGNORE `iast_document` SET `title` = 'DongTai探针参数配置', `url` = 'https://doc.dongtai.io/03_config/02_agent.html#id1', `weight` = 98, `language` = 'JAVA', `title_en` = 'DongTai Agent Configuration', `title_zh` = 'DongTai探针参数配置', `url_en` = 'http://doc2.dongtai.io/en/03_config/02_agent.html#parameter-table', `url_zh` = 'https://doc.dongtai.io/03_config/02_agent.html#id1' WHERE `id` = 4;
UPDATE IGNORE `iast_document` SET `title` = 'DongTai探针参数配置', `url` = 'https://doc.dongtai.io/03_config/02_agent.html#id1', `weight` = 98, `language` = 'PYTHON', `title_en` = 'DongTai Agent Configuration', `title_zh` = 'DongTai探针参数配置', `url_en` = 'http://doc2.dongtai.io/en/03_config/02_agent.html#parameter-table', `url_zh` = 'https://doc.dongtai.io/03_config/02_agent.html#id1' WHERE `id` = 6;
UPDATE IGNORE `iast_document` SET `title` = '常见问题(FAQ)', `url` = 'https://doc.dongtai.io/09_faq/index.html', `weight` = 97, `language` = 'PYTHON', `title_en` = 'FAQ', `title_zh` = '常见问题(FAQ)', `url_en` = 'http://doc2.dongtai.io/en/09_faq/index.html', `url_zh` = 'https://doc.dongtai.io/09_faq/index.html' WHERE `id` = 7;
UPDATE IGNORE `iast_document` SET `title` = 'Python Agent快速部署', `url` = 'https://doc.dongtai.io/02_start/03_agent.html#python-agent', `weight` = 99, `language` = 'PYTHON', `title_en` = 'Python Agent QuickStart', `title_zh` = 'Python Agent快速部署', `url_en` = 'http://doc2.dongtai.io/en/02_start/03_agent.html#python-agent', `url_zh` = 'https://doc.dongtai.io/02_start/03_agent.html#python-agent' WHERE `id` = 8;
UPDATE IGNORE `iast_document` SET `title` = 'Python Agent Release Note', `url` = 'https://doc.dongtai.io/10_log/01_log.html#python-agent', `weight` = 100, `language` = 'PYTHON', `title_en` = 'Python Agent Release Note', `title_zh` = 'Python Agent Release Note', `url_en` = 'http://doc2.dongtai.io/en/10_log/01_log.html#python-agent', `url_zh` = 'https://doc.dongtai.io/10_log/01_log.html#python-agent' WHERE `id` = 9;
UPDATE IGNORE `iast_document` SET `title` = 'PHP Agent快速部署', `url` = 'https://doc2.dongtai.io/zh/02_start/03_agent.html#php-agent', `weight` = 99, `language` = 'PHP', `title_en` = 'PHP Agent QuickStart', `title_zh` = 'PHP Agent快速部署', `url_en` = 'https://doc2.dongtai.io/en/02_start/03_agent.html#php-agent', `url_zh` = 'https://doc2.dongtai.io/zh/02_start/03_agent.html#php-agent' WHERE `id` = 10;

UPDATE IGNORE iast_vul_level SET name='high', name_value='高危', name_type='高危漏洞', name_type_en='HIGH', name_type_zh='高危漏洞', name_value_en='HIGH', name_value_zh='高危' WHERE id=1;
UPDATE IGNORE iast_vul_level SET name='medium', name_value='中危', name_type='中危漏洞', name_type_en='MEDIUM', name_type_zh='中危漏洞', name_value_en='MEDIUM', name_value_zh='中危' WHERE id=2;
UPDATE IGNORE iast_vul_level SET name='low', name_value='低危', name_type='低危漏洞', name_type_en='LOW', name_type_zh='低危漏洞', name_value_en='LOW', name_value_zh='低危' WHERE id=3;
UPDATE IGNORE iast_vul_level SET name='info', name_value='无风险', name_type='无风险', name_type_en='INFO', name_type_zh='无风险', name_value_en='INFO', name_value_zh='无风险' WHERE id=4;
UPDATE IGNORE iast_vul_level SET name='note', name_value='提示', name_type='提示信息', name_type_en='NOTE', name_type_zh='提示信息', name_value_en='NOTE', name_value_zh='提示' WHERE id=5;

UPDATE IGNORE iast_pattern_type SET name='正则匹配', value=1 WHERE id=1;
UPDATE IGNORE iast_pattern_type SET name='JSON 字段解析', value=2 WHERE id=2;


SET FOREIGN_KEY_CHECKS=1;
