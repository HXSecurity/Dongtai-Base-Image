SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;
--
-- Add field name_en to hooktype
--
-- ALTER TABLE `iast_hook_type` ADD COLUMN `name_en` varchar(255) NULL;
--
-- Add field name_zh to hooktype
--
-- ALTER TABLE `iast_hook_type` ADD COLUMN `name_zh` varchar(255) NULL;
--
-- Add field desc_en to iastdeploydesc
--
ALTER TABLE `iast_deploy` ADD COLUMN `desc_en` longtext NULL;
--
-- Add field desc_zh to iastdeploydesc
--
ALTER TABLE `iast_deploy` ADD COLUMN `desc_zh` longtext NULL;
--
-- Add field title_en to iastdocument
--
ALTER TABLE `iast_document` ADD COLUMN `title_en` varchar(100) NULL;
--
-- Add field title_zh to iastdocument
--
ALTER TABLE `iast_document` ADD COLUMN `title_zh` varchar(100) NULL;
--
-- Add field url_en to iastdocument
--
ALTER TABLE `iast_document` ADD COLUMN `url_en` varchar(2000) NULL;
--
-- Add field url_zh to iastdocument
--
ALTER TABLE `iast_document` ADD COLUMN `url_zh` varchar(2000) NULL;
--
-- Add field vul_desc_en to iaststrategymodel
--
 -- ALTER TABLE `iast_strategy` ADD COLUMN `vul_desc_en` longtext NULL;
--
-- Add field vul_desc_zh to iaststrategymodel
--
 -- ALTER TABLE `iast_strategy` ADD COLUMN `vul_desc_zh` longtext NULL;
--
-- Add field vul_fix_en to iaststrategymodel
--
-- ALTER TABLE `iast_strategy` ADD COLUMN `vul_fix_en` longtext NULL;
--
-- Add field vul_fix_zh to iaststrategymodel
--
-- ALTER TABLE `iast_strategy` ADD COLUMN `vul_fix_zh` longtext NULL;
--
-- Add field vul_name_en to iaststrategymodel
--
-- ALTER TABLE `iast_strategy` ADD COLUMN `vul_name_en` varchar(255) NULL;
--
-- Add field vul_name_zh to iaststrategymodel
--
-- ALTER TABLE `iast_strategy` ADD COLUMN `vul_name_zh` varchar(255) NULL;
--
-- Add field name_type_en to iastvullevel
--
-- ALTER TABLE `iast_vul_level` ADD COLUMN `name_type_en` varchar(255) NULL;
--
-- Add field name_type_zh to iastvullevel
--
-- ALTER TABLE `iast_vul_level` ADD COLUMN `name_type_zh` varchar(255) NULL;
--
-- Add field name_value_en to iastvullevel
--
-- ALTER TABLE `iast_vul_level` ADD COLUMN `name_value_en` varchar(255) NULL;
--
-- Add field name_value_zh to iastvullevel
--
-- ALTER TABLE `iast_vul_level` ADD COLUMN `name_value_zh` varchar(255) NULL;
--


SET FOREIGN_KEY_CHECKS=1;

BEGIN;

UPDATE iast_strategy SET vul_desc_zh = vul_desc WHERE  1=1;
UPDATE iast_strategy SET vul_fix_zh = vul_fix WHERE  1=1; 
UPDATE iast_strategy SET vul_name_zh = vul_name WHERE  1=1 ;
UPDATE iast_vul_level SET name_value_zh = name_value WHERE  1=1 ;
UPDATE iast_vul_level SET name_type_zh = name_type WHERE  1=1 ;
UPDATE iast_deploy SET desc_zh = `desc` WHERE  1=1 ;
UPDATE iast_hook_type SET name_zh = name WHERE  1=1 ;
UPDATE iast_document SET title_zh = title WHERE  1=1 ;
UPDATE iast_document SET url_zh = url WHERE  1=1 ;
UPDATE iast_strategy SET vul_desc_en = vul_desc WHERE  1=1;
UPDATE iast_strategy SET vul_fix_en = vul_fix WHERE  1=1; 
UPDATE iast_strategy SET vul_name_en = vul_name WHERE  1=1 ;
UPDATE iast_vul_level SET name_value_en = name_value WHERE  1=1 ;
UPDATE iast_vul_level SET name_type_en = name_type WHERE  1=1 ;
UPDATE iast_deploy SET desc_en = `desc` WHERE  1=1 ;
UPDATE iast_hook_type SET name_en = name WHERE  1=1 ;
UPDATE iast_document SET title_en = title WHERE  1=1 ;
UPDATE iast_document SET url_en = url WHERE  1=1 ;
COMMIT;
