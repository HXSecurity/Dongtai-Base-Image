SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

UPDATE iast_agent  SET actual_running_status = 1
WHERE is_core_running  = 1 and online = 1 ;

UPDATE iast_agent  SET actual_running_status = 2
WHERE is_core_running  = 0 and online = 1;


UPDATE iast_agent  SET except_running_status = 1
WHERE control  = 3 and is_control = 1;

UPDATE iast_agent  SET except_running_status = 2
WHERE control  = 4 and is_control = 1;

UPDATE iast_agent SET except_running_status  = actual_running_status
WHERE online = 0;

SET FOREIGN_KEY_CHECKS=1;