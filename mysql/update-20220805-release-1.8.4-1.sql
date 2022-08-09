SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;



UPDATE iast_asset_vul SET sid=NULL
WHERE sid = '';

DELETE  FROM iast_asset_vul 
WHERE SID IN ( SELECT sid FROM (
SELECT sid,COUNT(id) AS count_sid FROM iast_asset_vul iav 
WHERE  sid  IS NOT NULL 
GROUP BY sid 
HAVING  count_sid > 1)tmp );


DELETE FROM iast_asset_vul_type_relation 
WHERE   (asset_vul_id ,asset_vul_type_id) IN (
SELECT asset_vul_id ,asset_vul_type_id FROM
(
SELECT asset_vul_id ,asset_vul_type_id, count(id) AS _count  FROM iast_asset_vul_type_relation iavtr 
GROUP BY    asset_vul_id ,asset_vul_type_id
HAVING _count > 1 ) tmp);


DELETE FROM iast_asset_vul_relation 
WHERE asset_vul_id IN (
SELECT id FROM iast_asset_vul iav2 
WHERE SID IN ( SELECT sid FROM (
SELECT sid,COUNT(id) AS count_sid FROM iast_asset_vul iav 
WHERE  sid  IS NOT NULL 
GROUP BY sid 
HAVING  count_sid > 1)tmp ) );



ALTER TABLE iast_asset DROP KEY signature_value;
ALTER TABLE iast_asset_vul_relation ADD CONSTRAINT iast_asset_vul_relation_UN UNIQUE KEY (asset_id,asset_vul_id);

ALTER TABLE iast_asset_vul_type_relation ADD CONSTRAINT iast_asset_vul_type_relation_UN UNIQUE KEY (asset_vul_id,asset_vul_type_id);


ALTER TABLE iast_asset_vul ADD CONSTRAINT iast_asset_vul_UN UNIQUE KEY (sid);


SET FOREIGN_KEY_CHECKS=1;
