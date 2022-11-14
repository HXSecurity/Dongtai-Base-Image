SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;


ALTER TABLE iast_project ADD vul_validation int(11) DEFAULT 0 NOT NULL COMMENT '漏洞验证 0-跟随全局,1-启用,2-禁用';
ALTER TABLE iast_hook_type ADD CONSTRAINT iast_hook_type_UN UNIQUE KEY (id,`type`,name,value,language_id);
ALTER TABLE iast_sensitive_info_rule MODIFY COLUMN pattern varchar(2000) CHARACTER SET utf8mb4  DEFAULT '' NOT NULL;
INSERT IGNORE INTO iast_profile (`key`, value) VALUES('vul_verifiy', '1');

SET
@IAST_LANGUAGE_ID = 2;
INSERT
IGNORE
        INTO
        `iast_hook_type` (
        `type`,
        `name`,
        `value`,
        `create_time`,
        created_by,
        enable,
        update_time,
        name_en,
        name_zh,
        language_id,
        strategy_id)
SELECT

        `type`,
        `name`,
        `value`,
        `create_time`,
        created_by,
        enable,
        update_time,
        name_en,
        name_zh,
        @IAST_LANGUAGE_ID,
        strategy_id
FROM
        `iast_hook_type`
WHERE
        type IN (3,4)
        AND language_id = 1
        AND created_by = 1;
SET
@IAST_LANGUAGE_ID = 3;
INSERT
IGNORE
        INTO
        `iast_hook_type` (
        `type`,
        `name`,
        `value`,
        `create_time`,
        created_by,
        enable,
        update_time,
        name_en,
        name_zh,
        language_id,
        strategy_id)
SELECT

        `type`,
        `name`,
        `value`,
        `create_time`,
        created_by,
        enable,
        update_time,
        name_en,
        name_zh,
        @IAST_LANGUAGE_ID,
        strategy_id
FROM
        `iast_hook_type`
WHERE
        type IN (3,4)
        AND language_id = 1
        AND created_by = 1;






UPDATE
        IGNORE `iast_hook_strategy` SET
        `enable`=-1
WHERE
        `value` = 'builtins.list.__new__'
        AND `source` = 'P1'
        AND `target` = 'R'
        AND `inherit` = 'false'
        AND `track` = 'false'
        AND `create_time` = 1634110528
        AND `update_time` = 1634110528
        AND `created_by` = 203
        AND `enable` = 1;
UPDATE
        IGNORE `iast_hook_strategy` SET
        `enable` =-1
WHERE
        `value` = 'builtins.list.append'
        AND `source` = 'P1'
        AND `target` = 'R'
        AND `inherit` = 'false'
        AND `track` = 'false'
        AND `create_time` = 1634110529
        AND `update_time` = 1634110529
        AND `created_by` = 203
        AND `enable` = 1;
UPDATE
        IGNORE `iast_hook_strategy` SET
        `enable` =-1
WHERE
        `value` = 'builtins.list.insert'
        AND `source` = 'P1'
        AND `target` = 'R'
        AND `inherit` = 'false'
        AND `track` = 'false'
        AND `create_time` = 1634110530
        AND `update_time` = 1634110530
        AND `created_by` = 203
        AND `enable` = 1;
UPDATE
        IGNORE `iast_hook_strategy` SET
        `enable` =-1
WHERE
        `value` = 'builtins.list.__add__'
        AND `source` = 'P1'
        AND `target` = 'R'
        AND `inherit` = 'false'
        AND `track` = 'false'
        AND `create_time` = 1634110530
        AND `update_time` = 1634110530
        AND `created_by` = 203
        AND `enable` = 1;

INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
        , `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
        , `language_id`)
SELECT  4,  'exec-code',  'exec-code',  1634110527
        ,  1634110527,  1,  1,  NULL,  'exec-code'
        ,  2 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'exec-code'
AND  value =  'exec-code' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 1
AND enable =  1 AND name_en IS  NULL AND name_zh =  'exec-code' AND language_id =  2 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 4 AND `name`=  'exec-code'
AND  value =  'exec-code' AND
update_time= 1634110527 AND create_time= 1634110527 AND `created_by`= 1
AND enable =  1 AND name_en IS  NULL AND name_zh =  'exec-code' AND language_id =  2 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'builtins.exec',  'P1',  '',  'false',  'true',  1638328448,  1638328448,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.exec' AND `source`= 'P1' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1638328448 AND `update_time`=  1638328448 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.exec' AND `source`= 'P1' AND `target`= '' AND `inherit`= 'false' AND `track`= 'true' AND `create_time`=  1638328448 AND `update_time`=  1638328448 AND `created_by`= 1 AND `enable` =  1
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
SELECT  'builtins.str.encode',  'P1',  'R',  'false',  'false',  1638533369,  1638533369,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.encode' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1638533369 AND `update_time`=  1638533369 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'builtins.str.encode' AND `source`= 'P1' AND `target`= 'R' AND `inherit`= 'false' AND `track`= 'false' AND `create_time`=  1638533369 AND `update_time`=  1638533369 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);


INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
        , `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
        , `language_id`)
SELECT  1,  '文件上传',  'Spring',  1638532562
        ,  1638532562,  1,  1,  NULL,  '文件上传'
        ,  1 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  '文件上传'
AND  value =  'Spring' AND
update_time= 1638532562 AND create_time= 1638532562 AND `created_by`= 1
AND enable =  1 AND name_en IS NULL AND name_zh =  '文件上传' AND language_id =  1 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  '文件上传'
AND  value =  'Spring' AND
update_time= 1638532562 AND create_time= 1638532562 AND `created_by`= 1
AND enable =  1 AND name_en IS NULL AND name_zh =  '文件上传' AND language_id =  1 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'org.springframework.web.multipart.MultipartFile.getOriginalFilename()',  'O',  'R',  'true',  'false',  1638532625,  1638532625,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'org.springframework.web.multipart.MultipartFile.getOriginalFilename()' AND `source`= 'O' AND `target`= 'R' AND `inherit`= 'true' AND `track`= 'false' AND `create_time`=  1638532625 AND `update_time`=  1638532625 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'org.springframework.web.multipart.MultipartFile.getOriginalFilename()' AND `source`= 'O' AND `target`= 'R' AND `inherit`= 'true' AND `track`= 'false' AND `create_time`=  1638532625 AND `update_time`=  1638532625 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
        , `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
        , `language_id`)
SELECT  1,  '文件上传',  'Spring',  1638532562
        ,  1638532562,  1,  1,  NULL,  '文件上传'
        ,  1 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  '文件上传'
AND  value =  'Spring' AND
update_time= 1638532562 AND create_time= 1638532562 AND `created_by`= 1
AND enable =  1 AND name_en IS NULL AND name_zh =  '文件上传' AND language_id =  1 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  '文件上传'
AND  value =  'Spring' AND
update_time= 1638532562 AND create_time= 1638532562 AND `created_by`= 1
AND enable =  1 AND name_en IS NULL AND name_zh =  '文件上传' AND language_id =  1 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'org.springframework.web.multipart.MultipartFile.getName()',  'O',  'R',  'true',  'false',  1638532661,  1638532661,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'org.springframework.web.multipart.MultipartFile.getName()' AND `source`= 'O' AND `target`= 'R' AND `inherit`= 'true' AND `track`= 'false' AND `create_time`=  1638532661 AND `update_time`=  1638532661 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'org.springframework.web.multipart.MultipartFile.getName()' AND `source`= 'O' AND `target`= 'R' AND `inherit`= 'true' AND `track`= 'false' AND `create_time`=  1638532661 AND `update_time`=  1638532661 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
        , `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
        , `language_id`)
SELECT  1,  '文件上传',  'Spring',  1638532562
        ,  1638532562,  1,  1,  NULL,  '文件上传'
        ,  1 FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  '文件上传'
AND  value =  'Spring' AND
update_time= 1638532562 AND create_time= 1638532562 AND `created_by`= 1
AND enable =  1 AND name_en IS NULL AND name_zh =  '文件上传' AND language_id =  1 LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`= 1 AND `name`=  '文件上传'
AND  value =  'Spring' AND
update_time= 1638532562 AND create_time= 1638532562 AND `created_by`= 1
AND enable =  1 AND name_en IS NULL AND name_zh =  '文件上传' AND language_id =  1 LIMIT 1);


INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT  'org.apache.commons.fileupload.FileItem.getName()',  'O',  'R',  'true',  'false',  1638532689,  1638532689,  1,  1
 FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'org.apache.commons.fileupload.FileItem.getName()' AND `source`= 'O' AND `target`= 'R' AND `inherit`= 'true' AND `track`= 'false' AND `create_time`=  1638532689 AND `update_time`=  1638532689 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`= 'org.apache.commons.fileupload.FileItem.getName()' AND `source`= 'O' AND `target`= 'R' AND `inherit`= 'true' AND `track`= 'false' AND `create_time`=  1638532689 AND `update_time`=  1638532689 AND `created_by`= 1 AND `enable` =  1
 LIMIT 1);

INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);


INSERT
        IGNORE iast_strategy (user_id,
        vul_type,
        level_id,
        state,
        dt,
        vul_name,
        vul_desc,
        vul_fix,
        hook_type_id,
        vul_desc_en,
        vul_desc_zh,
        vul_fix_en,
        vul_fix_zh,
        vul_name_zh,
        vul_name_en)
SELECT
        1,
        '手机号码泄漏',
        5,
        'enable',
        1637329559,
        '手机号码泄漏',
        '这是手机号码泄漏的描述',
        '这是手机号码泄漏的修复建议',
        NULL,
        NULL,
        '这是手机号码泄漏的描述',
        NULL,
        '这是手机号码泄漏的修复建议',
        '手机号码泄漏',
        NULL
FROM
        DUAL
WHERE
        NOT EXISTS (
        SELECT
                `id`
        FROM
                iast_strategy
        WHERE
                vul_type = '手机号码泄漏');

SET
@IAST_STRATEGY_ID = (
SELECT
        `id`
FROM
        iast_strategy
WHERE
        vul_type = '手机号码泄漏');

INSERT
        INTO
        iast_sensitive_info_rule (
        latest_time,
        user_id,
        strategy_id,
        pattern_type_id,
        pattern,
        status)
VALUES(
1638538661,
1,
@IAST_STRATEGY_ID,
1,
'\\D?(1[3-9]\\d{9})\\D?',
1);


SET FOREIGN_KEY_CHECKS=1;
