SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

UPDATE IGNORE iast_strategy SET vul_name_zh='Response Without Content-Security-Policy Header' WHERE vul_type ='Response Without Content-Security-Policy Header';
UPDATE iast_document
SET  url='https://doc.dongtai.io/docs/getting-started/agent/install-java-agent', weight=99, `language`='JAVA', title_en='Java Agent QuickStart', title_zh='Java Agent快速部署', url_en='https://doc.dongtai.io/docs/getting-started/agent/install-java-agent', url_zh='https://doc.dongtai.io/docs/getting-started/agent/install-java-agent'
WHERE title='Java Agent快速部署';
UPDATE iast_document
SET  url='https://doc.dongtai.io/docs/changelog/release-note', weight=100, `language`='JAVA', title_en='Java Agent Release Note', title_zh='Java Agent Release Note', url_en='https://doc.dongtai.io/docs/changelog/release-note', url_zh='https://doc.dongtai.io/docs/changelog/release-note'
WHERE title='Java Agent Release Note';
UPDATE iast_document
SET url='https://doc.dongtai.io/docs/get-help/faq-agent/faq-agent-install', weight=97, `language`='JAVA', title_en='FAQ', title_zh='常见问题(FAQ)', url_en='https://doc.dongtai.io/docs/get-help/faq-agent/faq-agent-install', url_zh='https://doc.dongtai.io/docs/get-help/faq-agent/faq-agent-install'
WHERE  title='常见问题(FAQ)';
UPDATE iast_document
SET url='https://doc.dongtai.io/docs/getting-started/agent/parameter/config-java-agent', weight=98, `language`='JAVA', title_en='DongTai Agent Configuration', title_zh='DongTai探针参数配置', url_en='https://doc.dongtai.io/docs/getting-started/agent/parameter/config-java-agent', url_zh='https://doc.dongtai.io/docs/getting-started/agent/parameter/config-java-agent'
WHERE title='DongTai探针参数配置';
UPDATE iast_document
SET url='https://doc.dongtai.io/docs/getting-started/agent/parameter/config-python-agent', weight=98, `language`='PYTHON', title_en='DongTai Agent Configuration', title_zh='DongTai探针参数配置', url_en='https://doc.dongtai.io/docs/getting-started/agent/parameter/config-python-agent', url_zh='https://doc.dongtai.io/docs/getting-started/agent/parameter/config-python-agent'
WHERE title='DongTai探针参数配置';
UPDATE iast_document
SET url='https://doc.dongtai.io/docs/get-help/faq-agent/faq-agent-install', weight=97, `language`='PYTHON', title_en='FAQ', title_zh='常见问题(FAQ)', url_en='https://doc.dongtai.io/docs/get-help/faq-agent/faq-agent-install', url_zh='https://doc.dongtai.io/docs/get-help/faq-agent/faq-agent-install'
WHERE title='常见问题(FAQ)';
UPDATE iast_document
SET url='https://doc.dongtai.io/docs/getting-started/agent/install-python-agent', weight=99, `language`='PYTHON', title_en='Python Agent QuickStart', title_zh='Python Agent快速部署', url_en='https://doc.dongtai.io/docs/getting-started/agent/install-python-agent', url_zh='https://doc.dongtai.io/docs/getting-started/agent/install-python-agent'
WHERE title='Python Agent快速部署';
UPDATE iast_document
SET url='https://doc.dongtai.io/docs/changelog/release-note', weight=100, `language`='PYTHON', title_en='Python Agent Release Note', title_zh='Python Agent Release Note', url_en='https://doc.dongtai.io/docs/changelog/release-note', url_zh='https://doc.dongtai.io/docs/changelog/release-note'
WHERE title='Python Agent Release Note';
UPDATE iast_document
SET url='https://doc.dongtai.io/docs/getting-started/agent/install-php-agent', weight=99, `language`='PHP', title_en='PHP Agent QuickStart', title_zh='PHP Agent快速部署', url_en='https://doc.dongtai.io/docs/getting-started/agent/install-php-agent', url_zh='https://doc.dongtai.io/docs/getting-started/agent/install-php-agent'
WHERE title='PHP Agent快速部署';


SET FOREIGN_KEY_CHECKS=1;
