
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

CREATE INDEX django_admin_log_action_time_IDX USING BTREE ON django_admin_log (action_time);

SET FOREIGN_KEY_CHECKS=1;
