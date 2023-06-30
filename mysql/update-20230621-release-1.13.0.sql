SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;
  
  
-- dongtai_webapi.iast_api_route_v2 definition
CREATE TABLE `iast_api_route_v2` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`path` varchar(255) NOT NULL,
`method` varchar(31) NOT NULL,
`from_where` int(11) NOT NULL DEFAULT '1' COMMENT '1-agent,2-method_pool',
`project_id` int(11) NOT NULL DEFAULT '0' COMMENT '项目ID',
`project_version_id` int(11) NOT NULL DEFAULT '0' COMMENT '项目版本ID',
`is_cover` int(11) NOT NULL DEFAULT '0' COMMENT '是否覆盖',
`api_info` json DEFAULT NULL COMMENT 'API接口的相关信息',
PRIMARY KEY (`id`),
UNIQUE KEY `iast_api_route_v2_UN` (`project_id`,`project_version_id`,`path`,`method`,`from_where`),
KEY `iast_api_route_method_id_7ff9eb8e` (`method`) USING BTREE,
KEY `iast_api_route_method_id_IDX` (`method`,`project_id`,`project_version_id`) USING BTREE,
KEY `iast_api_route_path_IDX` (`method`,`path`,`project_id`,`project_version_id`) USING BTREE,
KEY `iast_api_route_project_id_IDX` (`project_id`,`project_version_id`,`from_where`,`is_cover`,`method`,`path`) USING BTREE,
KEY `iast_api_route_project_id_IDX_temp` (`project_id`,`project_version_id`,`method`,`path`) USING BTREE,
KEY `iast_api_route_project_id_is_cover_IDX` (`project_id`,`project_version_id`,`is_cover`,`method`) USING BTREE,
KEY `iast_api_route_project_version_id_IDX` (`project_version_id`,`method`,`path`) USING BTREE
) ENGINE=InnoDB ;


SET FOREIGN_KEY_CHECKS=1;

-- dongtai_engine.plugins.project_status definition
alter table iast_project
    add last_has_online_agent_time INT not null comment '最后有在线Agent的时间';

alter table iast_project
    add status INT not null comment '项目状态';

INSERT INTO dongtai_webapi.django_celery_beat_intervalschedule (id, every, period)
VALUES (6, 1, 'hours');

INSERT INTO dongtai_webapi.django_celery_beat_periodictask (id, name, task, args,
                                                            kwargs, queue, exchange,
                                                            routing_key, expires,
                                                            enabled, last_run_at,
                                                            total_run_count,
                                                            date_changed, description,
                                                            crontab_id, interval_id,
                                                            solar_id, one_off,
                                                            start_time, priority,
                                                            headers, clocked_id,
                                                            expire_seconds)
VALUES (14, 'dongtai_engine.plugins.project_status',
        'dongtai_engine.plugins.project_status.update_project_status', '[]', '{}', null,
        null, null, null, 1, null, 0, '2022-07-13 19:16:56.980132', '', null, 6, null,
        0, null, null, '{}', null, null);

-- change vulnerability_status
DELETE
FROM dongtai_webapi.iast_vulnerability_status
WHERE id = 7;

DELETE
FROM dongtai_webapi.iast_vulnerability_status
WHERE id = 4;

DELETE
FROM dongtai_webapi.iast_vulnerability_status
WHERE id = 2;

UPDATE dongtai_webapi.iast_vulnerability_status t
SET t.name    = '待确认',
    t.name_zh = '待确认'
WHERE t.id = 1;

UPDATE dongtai_webapi.iast_vulnerability t
SET t.status_id = 1
WHERE t.status_id IN (2, 4, 7);