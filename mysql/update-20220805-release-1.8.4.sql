SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE iast_vulnerability ADD pattern_uri varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' NULL COMMENT 'pattern_uri';
UPDATE iast_vulnerability SET pattern_uri = uri WHERE  1=1;


SET FOREIGN_KEY_CHECKS=1;