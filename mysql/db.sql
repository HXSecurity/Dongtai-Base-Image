SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_department
-- ----------------------------
DROP TABLE IF EXISTS `auth_department`;
CREATE TABLE `auth_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '部门名称',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `created_by` int(11) DEFAULT NULL COMMENT '创建用户',
  `parent_id` int(11) DEFAULT NULL COMMENT '父节点ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for auth_department_talent
-- ----------------------------
DROP TABLE IF EXISTS `auth_department_talent`;
CREATE TABLE `auth_department_talent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `talent_id` int(11) DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `department_id` (`department_id`,`talent_id`) USING BTREE,
  UNIQUE KEY `department_id_2` (`department_id`,`talent_id`) USING BTREE,
  KEY `talent_id` (`talent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`) USING BTREE,
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for auth_talent
-- ----------------------------
DROP TABLE IF EXISTS `auth_talent`;
CREATE TABLE `auth_talent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `talent_name` varchar(255) DEFAULT NULL COMMENT '租户名称',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `created_by` int(11) DEFAULT NULL COMMENT '创建用户',
  `is_active` tinyint(1) DEFAULT NULL COMMENT '租户是否启用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `talent_name` (`talent_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL COMMENT '0-普通用户、1-系统管理员、2-租户管理员',
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `phone` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for auth_user_department
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_department`;
CREATE TABLE `auth_user_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `department_id` int(11) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`),
  KEY `department_id` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `group_id` (`group_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`) USING BTREE,
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for authtoken_token
-- ----------------------------
DROP TABLE IF EXISTS `authtoken_token`;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `hashkey` (`hashkey`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`) USING BTREE,
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
-- ----------------------------
-- Table structure for django_celery_beat_clockedschedule
-- ----------------------------
DROP TABLE IF EXISTS `django_celery_beat_clockedschedule`;
CREATE TABLE `django_celery_beat_clockedschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clocked_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for django_celery_beat_crontabschedule
-- ----------------------------
DROP TABLE IF EXISTS `django_celery_beat_crontabschedule`;
CREATE TABLE `django_celery_beat_crontabschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `minute` varchar(240) NOT NULL,
  `hour` varchar(96) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(124) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  `timezone` varchar(63) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for django_celery_beat_intervalschedule
-- ----------------------------
DROP TABLE IF EXISTS `django_celery_beat_intervalschedule`;
CREATE TABLE `django_celery_beat_intervalschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `every` int(11) NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for django_celery_beat_periodictask
-- ----------------------------
DROP TABLE IF EXISTS `django_celery_beat_periodictask`;
CREATE TABLE `django_celery_beat_periodictask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int(10) unsigned NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `crontab_id` int(11) DEFAULT NULL,
  `interval_id` int(11) DEFAULT NULL,
  `solar_id` int(11) DEFAULT NULL,
  `one_off` tinyint(1) NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `priority` int(10) unsigned DEFAULT NULL,
  `headers` longtext NOT NULL,
  `clocked_id` int(11) DEFAULT NULL,
  `expire_seconds` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` (`crontab_id`) USING BTREE,
  KEY `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` (`interval_id`) USING BTREE,
  KEY `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` (`solar_id`) USING BTREE,
  KEY `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` (`clocked_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for django_celery_beat_periodictasks
-- ----------------------------
DROP TABLE IF EXISTS `django_celery_beat_periodictasks`;
CREATE TABLE `django_celery_beat_periodictasks` (
  `ident` smallint(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`ident`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for django_celery_beat_solarschedule
-- ----------------------------
DROP TABLE IF EXISTS `django_celery_beat_solarschedule`;
CREATE TABLE `django_celery_beat_solarschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(24) NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq` (`event`,`latitude`,`longitude`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  KEY `django_session_expire_date_a5c62663` (`expire_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for iast_agent
-- ----------------------------
DROP TABLE IF EXISTS `iast_agent`;
CREATE TABLE `iast_agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) DEFAULT NULL COMMENT 'agent唯一标识',
  `version` varchar(255) DEFAULT NULL COMMENT '版本',
  `latest_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `server_id` int(11) DEFAULT NULL COMMENT '服务器ID',
  `is_running` int(1) DEFAULT NULL COMMENT 'agent运行状态',
  `control` int(1) DEFAULT NULL COMMENT 'agent控制位，1-安装、2-卸载、0-无控制',
  `is_control` int(1) DEFAULT NULL COMMENT '是否正处于控制中，0-否，1-是',
  `bind_project_id` int(11) DEFAULT '0' COMMENT '捆绑项目ID，存在则为已捆绑',
  `project_name` varchar(255) DEFAULT NULL COMMENT '项目名称，用于先启动agent后创建项目',
  `project_version_id` int(11) NULL DEFAULT 0 COMMENT '项目版本ID',
  `online` tinyint(4) NULL DEFAULT 0 COMMENT '1在线运行，0未运行，同token，仅一个online',
  `is_core_running` int(11) NULL DEFAULT NULL COMMENT '核心引擎是否启动',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `server_id` (`server_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for iast_agent_method_pool
-- ----------------------------
DROP TABLE IF EXISTS `iast_agent_method_pool`;
CREATE TABLE `iast_agent_method_pool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) DEFAULT NULL COMMENT 'Agent',
  `url` varchar(2000) DEFAULT NULL COMMENT 'URL',
  `uri` varchar(2000) DEFAULT NULL COMMENT 'URI',
  `http_method` varchar(10) DEFAULT NULL COMMENT 'HTTP请求方法',
  `http_scheme` varchar(20) DEFAULT NULL COMMENT '协议',
  `http_protocol` varchar(255) DEFAULT NULL COMMENT 'HTTP协议',
  `req_header` varchar(2000) DEFAULT NULL COMMENT '请求头',
  `req_params` varchar(2000) DEFAULT NULL COMMENT '请求参数',
  `req_data` varchar(4000) DEFAULT NULL COMMENT '请求体',
  `res_header` varchar(1000) DEFAULT NULL COMMENT '响应头',
  `res_body` varchar(1000) DEFAULT NULL COMMENT '响应体',
  `context_path` varchar(255) DEFAULT NULL COMMENT '应用上下文',
  `language` varchar(20) DEFAULT NULL COMMENT '语言',
  `method_pool` json DEFAULT NULL COMMENT '方法池',
  `clent_ip` varchar(255) DEFAULT NULL COMMENT '客户端IP',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `pool_sign` varchar(40) DEFAULT NULL COMMENT '方法池签名',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `pool_sign` (`pool_sign`,`agent_id`) USING BTREE,
  KEY `agent_id` (`agent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for iast_agent_method_pool_sinks
-- ----------------------------
DROP TABLE IF EXISTS `iast_agent_method_pool_sinks`;
CREATE TABLE `iast_agent_method_pool_sinks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `methodpool_id` int(11) DEFAULT NULL,
  `hookstrategy_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `methodpool_id` (`methodpool_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for iast_agent_properties
-- ----------------------------
DROP TABLE IF EXISTS `iast_agent_properties`;
CREATE TABLE `iast_agent_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `hook_type` int(1) DEFAULT '0' COMMENT 'HOOK类型，1-全量HOOK，0-按配置HOOK',
  `dump_class` int(1) DEFAULT '0' COMMENT '是否dump修改后的字节码，1-dump，0-不dump，默认不dump',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `updated_by` int(11) DEFAULT NULL COMMENT '修改人',
  `agent_id` int(11) DEFAULT NULL COMMENT 'agent',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for iast_asset
-- ----------------------------
DROP TABLE IF EXISTS `iast_asset`;
CREATE TABLE `iast_asset` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `package_name` varchar(255) DEFAULT NULL COMMENT '第三方包名',
  `package_path` varchar(255) DEFAULT NULL COMMENT '第三方包所在路径',
  `signature_algorithm` varchar(255) DEFAULT NULL COMMENT '签名算法',
  `signature_value` varchar(50) DEFAULT NULL COMMENT '签名值',
  `dt` int(11) DEFAULT NULL COMMENT '更新时间',
  `version` varchar(255) DEFAULT NULL COMMENT '当前版本',
  `level_id` int(11) DEFAULT NULL COMMENT '漏洞等级',
  `vul_count` int(11) DEFAULT NULL COMMENT '漏洞数量',
  `agent_id` int(11) DEFAULT NULL COMMENT 'agent id',
  `language` varchar(255) DEFAULT NULL COMMENT '语言',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `signature_value` (`signature_value`,`agent_id`) USING HASH,
  KEY `agent_id` (`agent_id`) USING BTREE,
  KEY `level_id` (`level_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for iast_deploy
-- ----------------------------
DROP TABLE IF EXISTS `iast_deploy`;
CREATE TABLE `iast_deploy` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `desc` mediumtext COMMENT '安装描述',
  `middleware` varchar(255) DEFAULT NULL COMMENT '中间件',
  `os` varchar(255) DEFAULT NULL COMMENT '操作系统',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for iast_engine_heartbeat
-- ----------------------------
DROP TABLE IF EXISTS `iast_engine_heartbeat`;
CREATE TABLE `iast_engine_heartbeat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_ip` varchar(255) DEFAULT NULL COMMENT '客户端IP',
  `status` varchar(255) DEFAULT NULL COMMENT '引擎状态',
  `msg` varchar(255) DEFAULT NULL COMMENT '引擎返回信息',
  `agentCount` int(11) DEFAULT NULL COMMENT '历史agent数量',
  `reqCount` bigint(255) DEFAULT NULL COMMENT '历史请求数量',
  `agentEnableCount` int(11) DEFAULT NULL COMMENT '正在运行的agent数量',
  `projectCount` int(11) DEFAULT NULL COMMENT '项目数量',
  `userCount` int(11) DEFAULT NULL COMMENT '用户数量',
  `vulCount` int(11) DEFAULT NULL COMMENT '漏洞数量',
  `methodPoolCount` int(11) DEFAULT NULL COMMENT '方法池数量',
  `timestamp` int(11) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for iast_errorlog
-- ----------------------------
DROP TABLE IF EXISTS `iast_errorlog`;
CREATE TABLE `iast_errorlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `errorlog` mediumtext COMMENT '错误日志详情',
  `state` varchar(50) DEFAULT NULL COMMENT '错误日志状态',
  `dt` int(11) DEFAULT NULL COMMENT '日志触发时间',
  `agent_id` int(11) DEFAULT NULL COMMENT 'agent id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `agent_id` (`agent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for iast_heartbeat
-- ----------------------------
DROP TABLE IF EXISTS `iast_heartbeat`;
CREATE TABLE `iast_heartbeat` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `hostname` varchar(1000) DEFAULT NULL COMMENT '主机名',
  `network` varchar(2000) DEFAULT NULL COMMENT '网卡信息 ',
  `memory` varchar(1000) DEFAULT NULL COMMENT '内存信息',
  `cpu` varchar(1000) DEFAULT NULL COMMENT 'CPU信息',
  `disk` varchar(1000) DEFAULT NULL COMMENT '磁盘信息',
  `pid` varchar(1050) DEFAULT NULL COMMENT '进程ID，带主机名',
  `env` mediumtext COMMENT '环境变量',
  `req_count` int(255) DEFAULT NULL COMMENT 'HTTP请求数量',
  `dt` int(11) DEFAULT NULL COMMENT '最近一次心跳时间',
  `agent_id` int(11) DEFAULT NULL COMMENT 'agent ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `agent_id` (`agent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='IAST agent心跳表';

-- ----------------------------
-- Table structure for iast_hook_strategy
-- ----------------------------
DROP TABLE IF EXISTS `iast_hook_strategy`;
CREATE TABLE `iast_hook_strategy` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `value` varchar(2000) DEFAULT NULL COMMENT '策略值',
  `source` varchar(255) DEFAULT NULL COMMENT '污点来源',
  `target` varchar(255) DEFAULT NULL COMMENT '污点去向',
  `inherit` varchar(255) DEFAULT NULL COMMENT '继承类型，false-仅检测当前类，true-进检测子类，all-检测当前类及子类',
  `track` varchar(5) DEFAULT NULL COMMENT '是否需要污点跟踪，true-需要，false-不需要',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `created_by` int(11) DEFAULT NULL COMMENT '创建人',
  `enable` tinyint(1) DEFAULT '1' COMMENT '启用状态：0-禁用，1-启用，-1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for iast_hook_strategy_type
-- ----------------------------
DROP TABLE IF EXISTS `iast_hook_strategy_type`;
CREATE TABLE `iast_hook_strategy_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `hookstrategy_id` int(11) DEFAULT NULL COMMENT '策略ID',
  `hooktype_id` int(11) DEFAULT NULL COMMENT '策略类型ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `hookstrategy_id` (`hookstrategy_id`,`hooktype_id`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for iast_hook_talent_strategy
-- ----------------------------
DROP TABLE IF EXISTS `iast_hook_talent_strategy`;
CREATE TABLE `iast_hook_talent_strategy` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `talent_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `values` varchar(500) DEFAULT NULL COMMENT '租户启用的策略类型',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `created_by` int(11) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `talent_id` (`talent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for iast_hook_type
-- ----------------------------
DROP TABLE IF EXISTS `iast_hook_type`;
CREATE TABLE `iast_hook_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '策略总类型，1-source节点、2-propagator节点、3-filter节点、4-sink节点',
  `name` varchar(255) DEFAULT NULL COMMENT '策略类型名称',
  `value` varchar(255) DEFAULT NULL COMMENT '策略类型值',
  `enable` int(1) DEFAULT NULL COMMENT '状态：1-启用；0-禁用',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `created_by` int(11) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for iast_notify_config
-- ----------------------------
DROP TABLE IF EXISTS `iast_notify_config`;
CREATE TABLE `iast_notify_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notify_type` int(11) DEFAULT NULL COMMENT '通知类型，webhook、jira、dingding、企业微信等',
  `notify_metadata` json DEFAULT NULL COMMENT '通知相关的元数据，包括，账号、密码、模版等数据',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for iast_project
-- ----------------------------
DROP TABLE IF EXISTS `iast_project`;
CREATE TABLE `iast_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `mode` varchar(255) DEFAULT NULL COMMENT '项目类型，默认为插桩',
  `vul_count` int(11) unsigned DEFAULT '0' COMMENT '漏洞数量',
  `agent_count` int(11) DEFAULT NULL COMMENT 'Agent数量',
  `latest_time` int(11) DEFAULT NULL COMMENT '最新时间',
  `user_id` int(11) DEFAULT NULL COMMENT 'user id',
  `scan_id` bigint(20) unsigned DEFAULT NULL COMMENT '扫描策略ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `scan_id` (`scan_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for iast_project_version
-- ----------------------------
CREATE TABLE `iast_project_version`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `version_name` varchar(255)  NULL DEFAULT NULL COMMENT '版本号名称',
  `project_id` int(11) NULL DEFAULT NULL COMMENT '项目ID',
  `current_version` tinyint(4) NULL DEFAULT 0 COMMENT '1当前版本0预备版本',
  `description` text  NULL COMMENT '版本描述',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '1有效数据0无效',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `user_id` int(11) NULL DEFAULT NULL COMMENT 'user id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `project_id`(`project_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for iast_server
-- ----------------------------
DROP TABLE IF EXISTS `iast_server`;
CREATE TABLE `iast_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `name` varchar(255) DEFAULT NULL COMMENT '服务器名称',
  `hostname` varchar(255) DEFAULT NULL COMMENT '主机名',
  `ip` varchar(255) DEFAULT NULL COMMENT '服务器IP地址',
  `port` int(11) DEFAULT NULL COMMENT '服务器开放的端口',
  `environment` text COMMENT '运行环境：dev/test/prod',
  `agent_version` varchar(20) DEFAULT NULL COMMENT 'Agent版本',
  `latest_agent_version` varchar(255) DEFAULT NULL COMMENT '最新Agent版本',
  `language` varchar(20) DEFAULT NULL COMMENT 'Agent语言',
  `path` varchar(255) DEFAULT NULL COMMENT '服务器路径',
  `status` varchar(255) DEFAULT NULL COMMENT '服务器状态',
  `container` varchar(255) DEFAULT NULL COMMENT '中间件信息',
  `container_path` varchar(255) DEFAULT NULL COMMENT '中间件路径',
  `command` varchar(255) DEFAULT NULL COMMENT '启动命令',
  `env` varchar(255) DEFAULT NULL COMMENT '环境变量',
  `runtime` varchar(255) DEFAULT NULL COMMENT '运行时环境',
  `create_time` int(11) DEFAULT NULL COMMENT '启动时间',
  `update_time` int(11) DEFAULT NULL COMMENT '最近一次活跃',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for iast_strategy
-- ----------------------------
DROP TABLE IF EXISTS `iast_strategy`;
CREATE TABLE `iast_strategy` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vul_type` varchar(255) DEFAULT NULL COMMENT '漏洞类型',
  `level_id` int(11) DEFAULT NULL COMMENT '漏洞等级',
  `state` varchar(255) DEFAULT NULL COMMENT '策略状态，true-开启，false-关闭',
  `dt` int(11) DEFAULT NULL COMMENT '策略变更时间',
  `vul_name` varchar(255) DEFAULT NULL COMMENT '漏洞名称（中文）',
  `vul_desc` text COMMENT '漏洞描述',
  `vul_fix` text COMMENT '修复建议',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `level_id` (`level_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for iast_strategy_user
-- ----------------------------
DROP TABLE IF EXISTS `iast_strategy_user`;
CREATE TABLE `iast_strategy_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '策略名称',
  `content` text COMMENT '策略ID串',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `status` tinyint(2) DEFAULT '1' COMMENT '1有效0无效',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for iast_system
-- ----------------------------
DROP TABLE IF EXISTS `iast_system`;
CREATE TABLE `iast_system` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `agent_value` varchar(50) DEFAULT NULL COMMENT 'agent类型',
  `java_version` varchar(50) DEFAULT NULL COMMENT 'java版本',
  `middleware` varchar(50) DEFAULT NULL COMMENT '中间件',
  `system` varchar(50) DEFAULT NULL COMMENT '系统信息',
  `deploy_status` tinyint(5) DEFAULT NULL COMMENT '0未安装，1第一步，2第二部',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `user_id` int(11) DEFAULT NULL COMMENT '操作用户',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for iast_vul_level
-- ----------------------------
DROP TABLE IF EXISTS `iast_vul_level`;
CREATE TABLE `iast_vul_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '漏洞等级名称 ：high、medium、low、info',
  `name_value` varchar(255) DEFAULT NULL COMMENT '漏洞等级值：高危、中危、低危、提示',
  `name_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for iast_vul_overpower
-- ----------------------------
DROP TABLE IF EXISTS `iast_vul_overpower`;
CREATE TABLE `iast_vul_overpower` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `agent_id` int(255) DEFAULT NULL COMMENT 'agent ID ',
  `http_url` varchar(2000) DEFAULT NULL COMMENT 'HTTP请求的URL',
  `http_uri` varchar(2000) DEFAULT NULL COMMENT 'HTTP请求的URI',
  `http_query_string` varchar(2000) DEFAULT NULL COMMENT 'HTTP请求的查询参数',
  `http_method` varchar(10) DEFAULT NULL COMMENT 'HTTP请求的方法',
  `http_scheme` varchar(255) DEFAULT NULL COMMENT 'HTTP请求的协议',
  `http_protocol` varchar(255) DEFAULT NULL COMMENT 'HTTP请求协议（完整）',
  `http_header` varchar(2000) DEFAULT NULL COMMENT 'HTTP请求头',
  `x_trace_id` varchar(255) DEFAULT NULL COMMENT '灵芝trace-id',
  `cookie` varchar(2000) DEFAULT NULL COMMENT '当前请求的cookie',
  `sql` varchar(2000) DEFAULT NULL COMMENT '当前请求触发的sql语句',
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `agent_id` (`agent_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for iast_vul_rule
-- ----------------------------
DROP TABLE IF EXISTS `iast_vul_rule`;
CREATE TABLE `iast_vul_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_name` varchar(255) DEFAULT NULL COMMENT '策略名称',
  `rule_level` varchar(10) DEFAULT NULL COMMENT '策略等级',
  `rule_msg` varchar(255) DEFAULT NULL COMMENT '策略描述',
  `rule_value` json DEFAULT NULL COMMENT '策略详情',
  `is_enable` tinyint(1) DEFAULT NULL COMMENT '是否启用，0-禁用、1-启用',
  `is_system` tinyint(1) DEFAULT NULL COMMENT '是否为系统策略',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rule_name` (`rule_name`,`create_by`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for iast_vulnerability
-- ----------------------------
DROP TABLE IF EXISTS `iast_vulnerability`;
CREATE TABLE `iast_vulnerability` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `type` varchar(255) DEFAULT NULL COMMENT '漏洞类型',
  `level_id` int(11) DEFAULT NULL COMMENT '漏洞等级',
  `url` varchar(2000) DEFAULT NULL COMMENT '漏洞url',
  `uri` varchar(255) DEFAULT '' COMMENT 'uri',
  `http_method` varchar(10) DEFAULT NULL COMMENT '漏洞请求方法',
  `http_scheme` varchar(255) DEFAULT NULL COMMENT '协议名',
  `http_protocol` varchar(255) DEFAULT NULL COMMENT 'HTTP协议',
  `req_header` mediumtext COMMENT '漏洞请求的header头',
  `req_params` varchar(2000) DEFAULT NULL COMMENT '漏洞url的get参数',
  `req_data` mediumtext COMMENT '漏洞url的post数据信息',
  `res_header` mediumtext COMMENT '漏洞响应头',
  `res_body` mediumtext COMMENT '漏洞响应包',
  `full_stack` mediumtext COMMENT '漏洞栈',
  `top_stack` varchar(255) DEFAULT NULL COMMENT '污点栈-栈顶',
  `bottom_stack` varchar(255) DEFAULT NULL COMMENT '污点栈-栈底',
  `taint_value` varchar(255) DEFAULT NULL COMMENT '污点值',
  `taint_position` varchar(255) DEFAULT NULL COMMENT '漏洞所在请求的位置',
  `agent_id` int(11) DEFAULT '0' COMMENT '应用ID',
  `context_path` varchar(255) DEFAULT NULL COMMENT '漏洞所在应用',
  `counts` int(11) DEFAULT NULL COMMENT '漏洞出现次数',
  `status` varchar(255) DEFAULT NULL COMMENT '漏洞状态：已上报、已确认、已忽略',
  `language` varchar(255) DEFAULT NULL COMMENT '开发语言',
  `first_time` int(11) DEFAULT NULL COMMENT '漏洞第一次出现的时间',
  `latest_time` int(11) DEFAULT NULL COMMENT '漏洞最近一次出现的时间',
  `client_ip` varchar(255) DEFAULT NULL COMMENT '来源IP',
  `param_name` varchar(255) DEFAULT NULL COMMENT '传递参数变量名称',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `agent_id` (`agent_id`) USING BTREE,
  KEY `level_id` (`level_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for sca_artifact_db
-- ----------------------------
DROP TABLE IF EXISTS `sca_artifact_db`;
CREATE TABLE `sca_artifact_db` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `cwe_id` varchar(20) DEFAULT NULL COMMENT 'CWE漏洞编号',
  `cve_id` varchar(20) DEFAULT NULL COMMENT 'CVE漏洞编号',
  `stage` varchar(255) DEFAULT NULL COMMENT '第三方包发布类型',
  `title` varchar(255) DEFAULT NULL COMMENT '漏洞标题',
  `overview` text COMMENT '漏洞概述',
  `teardown` text COMMENT '漏洞详细解释（markdown）',
  `group_id` varchar(256) DEFAULT NULL COMMENT '第三方组件的组信息',
  `artifact_id` varchar(256) DEFAULT NULL COMMENT '第三方组件的名称',
  `latest_version` varchar(50) DEFAULT NULL COMMENT '第三方组件的最新版本',
  `component_name` varchar(512) DEFAULT NULL COMMENT '第三方组件的human名称',
  `dt` int(11) DEFAULT NULL COMMENT '数据添加时间',
  `reference` text COMMENT '相关链接/分析文章',
  `cvss_score` float(10,0) DEFAULT NULL COMMENT 'cvss2评分',
  `cvss3_score` float(10,0) DEFAULT NULL COMMENT 'cvss3评分',
  `level` varchar(20) DEFAULT NULL COMMENT '漏洞等级(以cvss3为准）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `cve_id` (`cve_id`,`group_id`,`artifact_id`,`latest_version`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for sca_maven_artifact
-- ----------------------------
DROP TABLE IF EXISTS `sca_maven_artifact`;
CREATE TABLE `sca_maven_artifact` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `aid` int(11) DEFAULT NULL COMMENT 'artifactdb表关联主键',
  `safe_version` varchar(255) DEFAULT NULL COMMENT '推荐版本',
  `version_range` varchar(255) DEFAULT NULL COMMENT '组件版本范围',
  `cph_version` varchar(255) DEFAULT NULL COMMENT 'maven查询规范',
  `dt` int(11) DEFAULT NULL COMMENT '更新时间',
  `patch` varchar(255) DEFAULT NULL COMMENT '补丁地址',
  `cph` varchar(255) DEFAULT NULL COMMENT '组件maven查询语法',
  `type` varchar(255) DEFAULT NULL COMMENT '包管理器类型',
  `group_id` varchar(255) DEFAULT NULL COMMENT '包管理器组',
  `artifact_id` varchar(255) DEFAULT NULL COMMENT 'artifact',
  `version` varchar(255) DEFAULT NULL COMMENT '版本',
  `signature` varchar(255) DEFAULT NULL COMMENT '版本哈希',
  `package_name` varchar(255) DEFAULT NULL COMMENT '包名',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `cph_version` (`cph_version`,`aid`) USING BTREE,
  KEY `aid` (`aid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for sca_maven_db
-- ----------------------------
DROP TABLE IF EXISTS `sca_maven_db`;
CREATE TABLE `sca_maven_db` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_id` varchar(255) DEFAULT NULL COMMENT 'Java第三方组件的groupID',
  `atrifact_id` varchar(255) DEFAULT NULL COMMENT 'Java第三方组件的ArtifactId',
  `version` varchar(255) DEFAULT NULL COMMENT 'Java第三方组件的版本号',
  `sha_1` varchar(255) DEFAULT NULL COMMENT 'Java包的SHA-1值，用于与灵芝Agent获取的数据进行匹配',
  `package_name` varchar(255) DEFAULT NULL COMMENT '包名',
  `aql` varchar(255) DEFAULT NULL COMMENT '组件查询语言',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `sha_1` (`sha_1`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for sca_record
-- ----------------------------
DROP TABLE IF EXISTS `sca_record`;
CREATE TABLE `sca_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page` int(11) DEFAULT NULL COMMENT '当前页',
  `total` int(11) DEFAULT NULL COMMENT '总页数',
  `dt` int(11) DEFAULT NULL COMMENT '更新时间s',
  `type` varchar(255) DEFAULT NULL COMMENT '记录类型',
  `data` varchar(255) DEFAULT NULL COMMENT '记录数据',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for sca_vul_db
-- ----------------------------
DROP TABLE IF EXISTS `sca_vul_db`;
CREATE TABLE `sca_vul_db` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `package_type` varchar(20) DEFAULT NULL COMMENT '包管理器',
  `cve` varchar(20) DEFAULT NULL COMMENT 'cve编号',
  `cwe` varchar(20) DEFAULT NULL COMMENT 'cwe编号',
  `vul_name` varchar(255) DEFAULT NULL COMMENT '漏洞名称',
  `vul_level` varchar(20) DEFAULT NULL COMMENT '漏洞等级',
  `cve_href` varchar(255) DEFAULT NULL COMMENT 'CVE地址',
  `cwe_href` varchar(255) DEFAULT NULL COMMENT 'CWE地址',
  `aql` varchar(255) DEFAULT NULL COMMENT '组件查询语言：',
  `version_range` varchar(255) DEFAULT NULL COMMENT '版本范围',
  `version_condition` varchar(255) DEFAULT NULL COMMENT '版本范围-条件',
  `latest_version` varchar(255) DEFAULT NULL COMMENT '最新版本',
  `overview` varchar(255) DEFAULT NULL COMMENT '漏洞概述',
  `teardown` varchar(2000) DEFAULT NULL COMMENT '漏洞详细描述',
  `url` varchar(255) DEFAULT NULL COMMENT '漏洞地址',
  `source` varchar(20) DEFAULT NULL COMMENT '数据来源',
  `dt` int(11) DEFAULT NULL COMMENT '时间戳',
  `extra` varchar(2000) DEFAULT NULL COMMENT '附加数据，暂时不知道是否有用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `package_type` (`package_type`,`cve`,`cwe`,`vul_name`,`aql`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `iast_replay_queue`;
CREATE TABLE `iast_replay_queue`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relation_id` int(11) NULL DEFAULT NULL COMMENT '待检测的漏洞ID',
  `state` int(1) NULL DEFAULT NULL COMMENT '状态，0-待处理、1-待重放、2-已重放',
  `count` int(11) NULL DEFAULT NULL COMMENT '重放次数',
  `result` int(1) NULL DEFAULT NULL COMMENT '重放结果，0-无漏洞，1-存在漏洞，2-失败',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `verify_time` int(11) NULL DEFAULT NULL COMMENT '结果更新时间',
  `uri` varchar(2000)  NULL DEFAULT NULL COMMENT '目标URI',
  `method` varchar(10)  NULL DEFAULT NULL COMMENT '请求方法',
  `scheme` varchar(10)  NULL DEFAULT NULL COMMENT '请求协议，http/https',
  `header` varchar(4000)  NULL DEFAULT NULL COMMENT '请求头',
  `params` varchar(2000)  NULL DEFAULT NULL COMMENT '参数',
  `body` varchar(4000)  NULL DEFAULT NULL COMMENT '请求体',
  `replay_type` int(1) NULL DEFAULT NULL COMMENT '重放类型，1-漏洞重放、2-请求重放',
  `agent_id` int(11) NULL DEFAULT NULL COMMENT 'Agent ID，外键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1  ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `iast_agent_method_pool_replay`;
CREATE TABLE `iast_agent_method_pool_replay`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) NULL DEFAULT NULL COMMENT 'Agent',
  `url` varchar(2000)  NULL DEFAULT NULL COMMENT 'URL',
  `uri` varchar(2000)  NULL DEFAULT NULL COMMENT 'URI',
  `http_method` varchar(10)  NULL DEFAULT NULL COMMENT 'HTTP请求方法',
  `http_scheme` varchar(20)  NULL DEFAULT NULL COMMENT '协议',
  `http_protocol` varchar(255)  NULL DEFAULT NULL COMMENT 'HTTP协议',
  `req_header` varchar(2000)  NULL DEFAULT NULL COMMENT '请求头',
  `req_params` varchar(2000)  NULL DEFAULT NULL COMMENT '请求参数',
  `req_data` varchar(4000)  NULL DEFAULT NULL COMMENT '请求体',
  `res_header` varchar(1000)  NULL DEFAULT NULL COMMENT '响应头',
  `res_body` varchar(1000)  NULL DEFAULT NULL COMMENT '响应体',
  `context_path` varchar(255)  NULL DEFAULT NULL COMMENT '应用上下文',
  `language` varchar(20)  NULL DEFAULT NULL COMMENT '语言',
  `method_pool` json NULL COMMENT '方法池',
  `clent_ip` varchar(255)  NULL DEFAULT NULL COMMENT '客户端IP',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `replay_id` int(11) NULL DEFAULT NULL COMMENT '重放ID',
  `replay_type` int(11) NULL DEFAULT NULL COMMENT '重放请求类型',
  `relation_id` int(11) NULL DEFAULT NULL COMMENT '原始请求关联ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `agent_id`(`agent_id`) USING BTREE,
  INDEX `replay_id`(`replay_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1  ROW_FORMAT = Dynamic;









DROP TABLE IF EXISTS `iast_hook_strategy`;
CREATE TABLE `iast_hook_strategy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `value` varchar(2000)  NULL DEFAULT NULL COMMENT '策略值',
  `source` varchar(255)  NULL DEFAULT NULL COMMENT '污点来源',
  `target` varchar(255)  NULL DEFAULT NULL COMMENT '污点去向',
  `inherit` varchar(255)  NULL DEFAULT NULL COMMENT '继承类型，false-仅检测当前类，true-进检测子类，all-检测当前类及子类',
  `track` varchar(5)  NULL DEFAULT NULL COMMENT '是否需要污点跟踪，true-需要，false-不需要',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `created_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `enable` tinyint(1) NULL DEFAULT 1 COMMENT '启用状态：0-禁用，1-启用，-1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 672 CHARACTER SET = utf8mb4 ;

-- ----------------------------
-- Records of iast_hook_strategy
-- ----------------------------
BEGIN;
INSERT INTO `iast_hook_strategy` VALUES (1, 'javax.servlet.Filter.doFilter(javax.servlet.ServletRequest,javax.servlet.ServletResponse,javax.servlet.FilterChain)', '', '', 'true', '', 1610536826, 1610536826, 1, 1), (2, 'javax.servlet.http.HttpServlet.service(javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse)', '', '', 'true', '', 1610536826, 1610536826, 1, 1), (3, 'javax.servlet.jsp.JspPage._jspService(javax.servlet.ServletRequest, javax.servlet.ServletResponse)', '', '', 'true', '', 1610536826, 1610536826, 1, 1), (4, 'java.lang.String.<init>(java.lang.String)', 'P1', 'O', 'false', '', 1610536826, 1610536826, 1, 1), (5, 'java.lang.String.<init>(java.lang.StringBuffer)', 'P1', 'O', 'false', '', 1610536826, 1610536826, 1, 1), (6, 'java.lang.String.<init>(java.lang.StringBuilder)', 'P1', 'O', 'false', '', 1610536826, 1610536826, 1, 1), (7, 'java.lang.String.<init>(byte[])', 'P1', 'O', 'false', '', 1610536826, 1610536826, 1, 1), (8, 'java.lang.String.<init>(byte[],int,int)', 'P1', 'O', 'false', '', 1610536826, 1610536826, 1, 1), (9, 'java.lang.String.<init>(byte[],int,int,int)', 'P1', 'O', 'false', '', 1610536826, 1610536826, 1, 1), (10, 'java.lang.String.<init>(byte[],int,int,java.nio.charset.Charset)', 'P1', 'O', 'false', '', 1610536826, 1610536826, 1, 1), (11, 'java.lang.String.<init>(byte[],int,int,java.lang.String)', 'P1', 'O', 'false', '', 1610536826, 1610536826, 1, 1), (12, 'java.lang.String.<init>(char[])', 'P1', 'O', 'false', '', 1610536826, 1610536826, 1, 1), (13, 'java.lang.String.<init>(char[],int,int)', 'P1', 'O', 'false', '', 1610536826, 1610536826, 1, 1), (14, 'java.lang.String.replace(java.lang.CharSequence,java.lang.CharSequence)', 'P2', 'O', 'false', '', 1610536826, 1610536826, 1, 1), (15, 'java.lang.String.toLowerCase(java.util.Locale)', 'O', 'R', 'false', '', 1610536826, 1610536826, 1, 1), (16, 'java.lang.String.toUpperCase(java.util.Locale)', 'O', 'R', 'false', '', 1610536826, 1610536826, 1, 1), (17, 'java.lang.String.getBytes()', 'O', 'R', 'false', '', 1610536826, 1610536826, 1, 1), (18, 'java.lang.String.getBytes(java.lang.String)', 'O', 'R', 'false', '', 1610536826, 1610536826, 1, 1), (19, 'java.lang.String.getBytes(java.nio.charset.Charset)', 'P1', 'R', 'false', '', 1610536826, 1610536826, 1, 1), (20, 'java.lang.String.getBytes(int,int,byte[],int)', 'O', 'P3', 'false', '', 1610536826, 1610536826, 1, 1), (21, 'java.lang.String.getChars(int,int,char[],int)', 'O', 'P3', 'false', '', 1610536826, 1610536826, 1, 1), (22, 'java.lang.String.concat(java.lang.String)', 'O|P1', 'R', 'false', '', 1610536827, 1610536827, 1, 1), (23, 'java.lang.String.substring(int,int)', 'O', 'R', 'false', '', 1610536827, 1610536827, 1, 1), (24, 'java.lang.String.substring(int)', 'O', 'R', 'false', '', 1610536827, 1610536827, 1, 1), (25, 'java.lang.String.toCharArray()', 'O', 'R', 'false', '', 1610536827, 1610536827, 1, 1), (26, 'java.lang.String.<init>(char[],int,int,boolean)', 'P1', 'O', 'false', '', 1610536827, 1610536827, 1, 1), (27, 'java.lang.String.split(java.lang.String)', 'O', 'R', 'false', '', 1610536827, 1610536827, 1, 1), (28, 'java.lang.String.split(java.lang.String, int)', 'O', 'R', 'false', '', 1610536827, 1610536827, 1, 1), (29, 'java.lang.StringBuilder.replace(int,int,java.lang.String)', 'O', 'R', 'false', '', 1610536827, 1610536827, 1, 1), (30, 'java.lang.StringBuilder.toString()', 'O', 'R', 'false', '', 1610536827, 1610536827, 1, 1), (31, 'java.lang.StringBuilder.<init>(java.lang.String)', 'P1', 'O', 'false', '', 1610536827, 1610536827, 1, 1), (32, 'java.lang.StringBuilder.<init>(java.lang.CharSequence)', 'P1', 'O', 'false', '', 1610536827, 1610536827, 1, 1), (33, 'java.lang.StringBuilder.append(java.lang.Object)', 'P1', 'O', 'false', '', 1610536827, 1610536827, 1, 1), (34, 'java.lang.StringBuilder.append(java.lang.String)', 'P1', 'O', 'false', '', 1610536827, 1610536827, 1, 1), (35, 'java.lang.StringBuilder.append(java.lang.StringBuffer)', 'P1', 'O', 'false', '', 1610536827, 1610536827, 1, 1), (36, 'java.lang.StringBuilder.append(java.lang.CharSequence)', 'P1', 'O', 'false', '', 1610536827, 1610536827, 1, 1), (37, 'java.lang.StringBuilder.append(java.lang.CharSequence,int,int)', 'P1', 'O', 'false', '', 1610536827, 1610536827, 1, 1), (38, 'java.lang.StringBuilder.append(char[],int,int)', 'P1', 'O', 'false', '', 1610536827, 1610536827, 1, 1), (39, 'java.util.List.<init>(java.util.Collection)', 'P1', 'O', 'true', '', 1610536827, 1610536827, 1, 1), (40, 'java.util.List.add(int,java.lang.Object)', 'P2', 'O', 'true', '', 1610536827, 1610536827, 1, 1), (41, 'java.util.List.add(java.lang.Object)', 'P1', 'O', 'true', '', 1610536827, 1610536827, 1, 1), (42, 'java.util.List.addAll(int,java.util.Collection)', 'P2', 'P2', 'true', '', 1610536827, 1610536827, 1, 1), (43, 'java.util.List.addAll(java.util.Collection)', 'P1', 'O', 'true', '', 1610536827, 1610536827, 1, 1), (44, 'java.util.List.set(int,java.lang.Object)', 'P2', 'O', 'true', '', 1610536827, 1610536827, 1, 1), (45, 'java.util.List.get(int)', 'O&R', 'R', 'true', '', 1610536827, 1610536827, 1, 1), (46, 'java.util.List.clone()', 'O', 'R', 'true', '', 1610536827, 1610536827, 1, 1), (47, 'java.util.List.toArray()', 'O', 'R', 'true', '', 1610536827, 1610536827, 1, 1), (48, 'java.util.List.toArray(java.lang.Object[])', 'O', 'R', 'true', '', 1610536827, 1610536827, 1, 1), (49, 'java.util.Map.get(java.lang.Object)', 'O&R', 'R', 'true', '', 1610536827, 1610536827, 1, 1), (50, 'java.util.Map.getOrDefault(java.lang.Object,java.lang.Object)', 'O&R', 'R', 'true', '', 1610536827, 1610536827, 1, 1), (51, 'java.util.Map.put(java.lang.Object,java.lang.Object)', 'P1,2', 'O', 'true', '', 1610536827, 1610536827, 1, 1), (52, 'java.util.Map.putAll(java.util.Map)', 'P1', 'O', 'true', '', 1610536827, 1610536827, 1, 1), (53, 'java.util.Map.putIfAbsent(java.lang.Object,java.lang.Object)', 'P1,2', 'O', 'true', '', 1610536827, 1610536827, 1, 1), (54, 'java.util.Enumeration.nextElement()', 'O', 'R', 'true', '', 1610536827, 1610536827, 1, 1), (55, 'java.net.Socket.<init>(java.lang.String,int)', 'P1', 'O', 'false', '', 1610536828, 1610536828, 1, 1), (56, 'java.net.Socket.getOutputStream()', 'O', 'R', 'false', '', 1610536828, 1610536828, 1, 1), (57, 'java.io.BufferedReader.<init>(java.io.Reader)', 'P1', 'O', 'false', '', 1610536828, 1610536828, 1, 1), (58, 'java.io.BufferedReader.<init>(java.io.Reader,int)', 'P1', 'O', 'false', '', 1610536828, 1610536828, 1, 1), (59, 'java.io.BufferedReader.<init>(java.io.FileReader)', 'P1', 'O', 'false', '', 1610536828, 1610536828, 1, 1), (60, 'java.io.BufferedReader.<init>(java.io.InputStreamReader)', 'P1', 'O', 'false', '', 1610536828, 1610536828, 1, 1), (61, 'java.io.BufferedReader.readLine()', 'O', 'R', 'false', '', 1610536828, 1610536828, 1, 1), (62, 'java.io.InputStreamReader.<init>(java.io.InputStream)', 'P1', 'O', 'false', '', 1610536828, 1610536828, 1, 1), (63, 'java.io.InputStreamReader.<init>(java.io.InputStream,java.nio.charset.Charset)', 'P1', 'O', 'false', '', 1610536828, 1610536828, 1, 1), (64, 'java.io.StringReader.<init>(java.lang.String)', 'P1', 'O', 'false', '', 1610536828, 1610536828, 1, 1), (65, 'java.io.FileInputStream.<init>(java.io.File)', 'P1', 'O', 'false', '', 1610536828, 1610536828, 1, 1), (66, 'java.io.FileInputStream.<init>(java.lang.String)', 'P1', 'O', 'false', '', 1610536828, 1610536828, 1, 1), (67, 'java.io.FileReader.<init>(java.io.File)', 'P1', 'O', 'false', '', 1610536828, 1610536828, 1, 1), (68, 'java.io.InputStreamReader.read(char[],int,int)', 'O', 'P1', 'false', '', 1610536828, 1610536828, 1, 1), (69, 'java.io.ByteArrayInputStream.<init>(byte[])', 'P1', 'O', 'false', '', 1610536828, 1610536828, 1, 1), (70, 'java.io.ByteArrayInputStream.<init>(byte[],int,int)', 'P1', 'O', 'false', '', 1610536828, 1610536828, 1, 1), (71, 'java.io.InputStream.read(byte[],int,int)', 'O', 'P1', 'false', '', 1610536828, 1610536828, 1, 1), (72, 'java.io.PushbackInputStream.<init>(java.io.InputStream,int)', 'P1', 'O', 'false', '', 1610536828, 1610536828, 1, 1), (73, 'java.io.InputStream.<init>(java.io.InputStream)', 'P1', 'O', 'false', '', 1610536828, 1610536828, 1, 1), (74, 'java.io.ObjectInputStream.<init>(java.io.InputStream)', 'P1', 'O', 'all', '', 1610536828, 1610536828, 1, 1), (75, 'java.io.CharArrayReader.<init>(char[])', 'P1', 'O', 'false', '', 1610536828, 1610536828, 1, 1), (76, 'java.io.CharArrayReader.<init>(char[],int,int)', 'P1', 'O', 'false', '', 1610536828, 1610536828, 1, 1), (77, 'java.io.CharArrayReader.read(char[],int,int)', 'O', 'P1', 'false', '', 1610536828, 1610536828, 1, 1), (78, 'java.io.ByteArrayOutputStream.write(byte[],int,int)', 'P1', 'O', 'false', '', 1610536828, 1610536828, 1, 1), (79, 'java.io.ByteArrayOutputStream.toByteArray()', 'P1', 'O', 'false', '', 1610536828, 1610536828, 1, 1), (80, 'java.io.ByteArrayOutputStream.reset()', 'O', 'O', 'false', '', 1610536828, 1610536828, 1, 1), (81, 'java.net.URI.<init>(java.lang.String)', 'P1', 'O', 'false', '', 1610536828, 1610536828, 1, 1), (82, 'java.net.URI.<init>(java.lang.String,java.lang.String,java.lang.String)', 'P1,2,3', 'O', 'false', '', 1610536828, 1610536828, 1, 1), (83, 'java.net.URI.<init>(java.lang.String,java.lang.String,java.lang.String,java.lang.String,java.lang.String)', 'P2,3,4,5', 'O', 'false', '', 1610536828, 1610536828, 1, 1), (84, 'java.net.URI.toURL()', 'O', 'R', 'false', '', 1610536828, 1610536828, 1, 1), (85, 'org.apache.commons.httpclient.URI.parseUriReference(java.lang.String, boolean)', 'P1', 'O', 'false', '', 1610536828, 1610536828, 1, 1), (86, 'java.net.URL.<init>(java.lang.String)', 'P1', 'O', 'false', '', 1610536828, 1610536828, 1, 1), (87, 'java.net.URL.<init>(java.lang.String,java.lang.String,int,java.lang.String)', 'P1,2,4', 'O', 'false', '', 1610536828, 1610536828, 1, 1), (88, 'java.net.URL.<init>(java.lang.String,java.lang.String,int,java.lang.String,java.net.URLStreamHandler)', 'P1,2,4', 'O', 'false', '', 1610536828, 1610536828, 1, 1), (89, 'java.net.URL.<init>(java.lang.String,java.lang.String,java.lang.String)', 'P1,2,3', 'O', 'false', '', 1610536828, 1610536828, 1, 1), (90, 'java.net.URL.<init>(java.net.URL,java.lang.String)', 'P1,2', 'O', 'false', '', 1610536828, 1610536828, 1, 1), (91, 'java.net.URLDecoder.decode(java.lang.String,java.lang.String)', 'P1', 'R', 'false', '', 1610536828, 1610536828, 1, 1), (92, 'javax.servlet.ServletRequest.getParameterNames()', 'O', 'R', 'true', '', 1610536829, 1610536829, 1, 1), (93, 'javax.servlet.ServletRequest.getParameterValues(java.lang.String)', 'O', 'R', 'true', '', 1610536829, 1610536829, 1, 1), (94, 'javax.servlet.http.Cookie.getValue()', 'O', 'R', 'false', '', 1610536829, 1610536829, 1, 1), (95, 'javax.servlet.http.Cookie.<init>(java.lang.String,java.lang.String)', 'P1,2', 'O', 'false', '', 1610536829, 1610536829, 1, 1), (96, 'java.lang.ProcessBuilder.command(java.lang.String[])', 'P1', 'O', 'false', '', 1610536829, 1610536829, 1, 1), (97, 'java.lang.ProcessBuilder.command(java.util.List)', 'P1', 'O', 'false', '', 1610536829, 1610536829, 1, 1), (98, 'java.lang.ProcessBuilder.<init>(java.lang.String[])', 'P1', 'O', 'false', '', 1610536829, 1610536829, 1, 1), (99, 'java.lang.ProcessBuilder.<init>(java.util.List)', 'P1', 'O', 'false', '', 1610536829, 1610536829, 1, 1), (100, 'java.util.Base64$Decoder.decode(byte[])', 'P1', 'R', 'false', '', 1610536829, 1610536829, 1, 1), (101, 'java.util.Base64$Decoder.decode(java.lang.String)', 'P1', 'R', 'false', '', 1610536829, 1610536829, 1, 1), (102, 'java.util.Base64$Decoder.decode(java.nio.ByteBuffer)', 'P1', 'R', 'false', '', 1610536829, 1610536829, 1, 1), (103, 'java.util.Base64$Decoder.decode(byte[],byte[])', 'P1', 'P2', 'false', '', 1610536829, 1610536829, 1, 1), (104, 'org.apache.commons.codec.binary.Base64.decodeBase64(java.lang.String)', 'P1', 'R', 'false', '', 1610536829, 1610536829, 1, 1), (105, 'org.apache.commons.codec.binary.Base64.decodeBase64(byte[])', 'P1', 'R', 'false', '', 1610536829, 1610536829, 1, 1), (106, 'org.apache.commons.codec.binary.Base64.decodeInteger(byte[])', 'P1', 'R', 'false', '', 1610536829, 1610536829, 1, 1), (107, 'org.apache.commons.codec.binary.BaseNCodec.decode(java.lang.Object)', 'P1', 'R', 'true', '', 1610536829, 1610536829, 1, 1), (108, 'org.apache.commons.codec.binary.BaseNCodec.decode(byte[])', 'P1', 'R', 'true', '', 1610536829, 1610536829, 1, 1), (109, 'org.apache.commons.codec.binary.BaseNCodec.decode(java.lang.String)', 'P1', 'R', 'true', '', 1610536829, 1610536829, 1, 1), (110, 'org.apache.commons.codec.binary.Base64.decode(byte[],int,int,org.apache.commons.codec.binary.BaseNCodec$Context)', 'P1', 'R', 'false', '', 1610536829, 1610536829, 1, 1), (111, 'java.util.Base64$Encoder.encode(byte[])', 'P1', 'R', 'false', '', 1610536829, 1610536829, 1, 1), (112, 'java.util.Base64$Encoder.encodeToString(byte[])', 'P1', 'R', 'false', '', 1610536829, 1610536829, 1, 1), (113, 'java.util.Base64$Encoder.encode(java.nio.ByteBuffer)', 'P1', 'R', 'false', '', 1610536829, 1610536829, 1, 1), (114, 'java.util.Base64$Encoder.encode(byte[],byte[])', 'P1', 'P2', 'false', '', 1610536829, 1610536829, 1, 1), (115, 'org.apache.commons.codec.binary.BaseNCodec.encode(byte[])', 'P1', 'R', 'true', '', 1610536829, 1610536829, 1, 1), (116, 'org.apache.commons.codec.binary.BaseNCodec.encode(byte[],int,int)', 'P1', 'R', 'true', '', 1610536829, 1610536829, 1, 1), (117, 'org.apache.commons.codec.binary.BaseNCodec.encode(java.lang.Object)', 'P1', 'R', 'true', '', 1610536829, 1610536829, 1, 1), (118, 'org.apache.commons.codec.binary.BaseNCodec.encodeAsString(byte[])', 'P1', 'R', 'true', '', 1610536829, 1610536829, 1, 1), (119, 'org.apache.commons.codec.binary.BaseNCodec.encodeToString(byte[])', 'P1', 'R', 'true', '', 1610536829, 1610536829, 1, 1), (120, 'org.apache.commons.codec.binary.Base64.encodeBase64(byte[])', 'P1', 'R', 'false', '', 1610536829, 1610536829, 1, 1), (121, 'org.apache.commons.codec.binary.Base64.encodeBase64(byte[],boolean)', 'P1', 'R', 'false', '', 1610536829, 1610536829, 1, 1), (122, 'org.apache.commons.codec.binary.Base64.encodeBase64(byte[],boolean,boolean)', 'P1', 'R', 'false', '', 1610536829, 1610536829, 1, 1), (123, 'org.apache.commons.codec.binary.Base64.encodeBase64(byte[],boolean,boolean,int)', 'P1', 'R', 'false', '', 1610536829, 1610536829, 1, 1), (124, 'org.owasp.esapi.reference.DefaultEncoder.encodeForHTML(java.lang.String)', 'P1', 'R', 'true', '', 1610536830, 1610536830, 1, 1), (125, 'org.apache.commons.lang.StringEscapeUtils.escapeHtml(java.lang.String)', 'P1', 'R', 'false', '', 1610536830, 1610536830, 1, 1), (126, 'org.apache.commons.lang.StringEscapeUtils.escapeHtml(java.io.Writer,java.lang.String)', 'P2', 'R', 'false', '', 1610536830, 1610536830, 1, 1), (127, 'javax.xml.transform.stream.StreamSource.<init>(java.io.File)', 'P1', 'O', 'false', '', 1610536830, 1610536830, 1, 1), (128, 'javax.xml.transform.stream.StreamSource.<init>(java.io.Reader)', 'P1', 'O', 'false', '', 1610536830, 1610536830, 1, 1), (129, 'javax.xml.transform.stream.StreamSource.<init>(java.io.Reader,java.lang.String)', 'P1', 'O', 'false', '', 1610536830, 1610536830, 1, 1), (130, 'javax.xml.transform.stream.StreamSource.<init>(java.io.InputStream)', 'P1', 'O', 'false', '', 1610536830, 1610536830, 1, 1), (131, 'javax.xml.transform.stream.StreamSource.<init>(java.io.InputStream,java.lang.String)', 'P1', 'O', 'false', '', 1610536830, 1610536830, 1, 1), (132, 'javax.xml.stream.XMLInputFactory.createXMLStreamReader(java.io.Reader)', 'P1', 'R', 'true', '', 1610536830, 1610536830, 1, 1), (133, 'javax.xml.stream.XMLInputFactory.createXMLStreamReader(javax.xml.transform.Source)', 'P1', 'R', 'true', '', 1610536830, 1610536830, 1, 1), (134, 'javax.xml.stream.XMLInputFactory.createXMLStreamReader(java.io.InputStream)', 'P1', 'R', 'true', '', 1610536830, 1610536830, 1, 1), (135, 'javax.xml.stream.XMLInputFactory.createXMLStreamReader(java.io.InputStream,java.lang.String)', 'P1', 'R', 'true', '', 1610536830, 1610536830, 1, 1), (136, 'javax.xml.stream.XMLInputFactory.createXMLStreamReader(java.lang.String,java.io.InputStream)', 'P2', 'R', 'true', '', 1610536830, 1610536830, 1, 1), (137, 'javax.xml.stream.XMLInputFactory.createXMLStreamReader(java.lang.String,java.io.Reader)', 'P2', 'R', 'true', '', 1610536830, 1610536830, 1, 1), (138, 'javax.xml.bind.Unmarshaller.unmarshal(java.io.Reader)', 'P1', 'R', 'true', '', 1610536830, 1610536830, 1, 1), (139, 'javax.xml.bind.Unmarshaller.unmarshal(java.io.InputStream)', 'P1', 'R', 'true', '', 1610536830, 1610536830, 1, 1), (140, 'javax.xml.bind.Unmarshaller.unmarshal(org.xml.sax.InputSource)', 'P1', 'R', 'true', '', 1610536830, 1610536830, 1, 1), (141, 'javax.xml.bind.Unmarshaller.unmarshal(javax.xml.transform.Source)', 'P1', 'R', 'true', '', 1610536830, 1610536830, 1, 1), (142, 'javax.xml.bind.Unmarshaller.unmarshal(javax.xml.transform.Source,java.lang.Class)', 'P1', 'R', 'true', '', 1610536830, 1610536830, 1, 1), (143, 'javax.xml.bind.JAXBElement.getValue()', 'O', 'R', 'false', '', 1610536830, 1610536830, 1, 1), (144, 'javax.xml.transform.sax.SAXSource.<init>(org.xml.sax.InputSource)', 'P1', 'O', 'false', '', 1610536830, 1610536830, 1, 1), (145, 'javax.xml.transform.sax.SAXSource.<init>(org.xml.sax.XMLReader,org.xml.sax.InputSource)', 'P2', 'O', 'false', '', 1610536830, 1610536830, 1, 1), (146, 'javax.xml.transform.sax.SAXSource.setInputSource(org.xml.sax.InputSource)', 'P1', 'O', 'false', '', 1610536830, 1610536830, 1, 1), (147, 'org.xml.sax.InputSource.<init>(java.lang.String)', 'P1', 'O', 'false', '', 1610536830, 1610536830, 1, 1), (148, 'org.xml.sax.InputSource.<init>(java.io.InputStream)', 'P1', 'O', 'false', '', 1610536830, 1610536830, 1, 1), (149, 'org.xml.sax.InputSource.<init>(java.io.Reader)', 'P1', 'O', 'false', '', 1610536830, 1610536830, 1, 1), (150, 'org.xml.sax.InputSource.setCharacterStream(java.io.Reader)', 'P1', 'O', 'false', '', 1610536830, 1610536830, 1, 1), (151, 'org.xml.sax.InputSource.getCharacterStream()', 'O', 'R', 'false', '', 1610536830, 1610536830, 1, 1), (152, 'org.xml.sax.InputSource.setByteStream(java.io.InputStream)', 'P1', 'O', 'false', '', 1610536830, 1610536830, 1, 1), (153, 'org.xml.sax.InputSource.getByteStream()', 'O', 'R', 'false', '', 1610536831, 1610536831, 1, 1), (154, 'org.xml.sax.InputSource.setSystemId(java.lang.String', 'P1', 'O', 'false', '', 1610536831, 1610536831, 1, 1), (155, 'org.xml.sax.InputSource.getSystemId()', 'O', 'R', 'false', '', 1610536831, 1610536831, 1, 1), (156, 'org.springframework.web.util.HtmlUtils.htmlEscape(java.lang.String)', 'P1', 'R', 'false', '', 1610536831, 1610536831, 1, 1), (157, 'org.springframework.cloud.config.server.resource.ResourceController.retrieve(java.lang.String,java.lang.String,java.lang.String,java.lang.String,boolean)', 'P1,2,3,4', 'R', 'false', '', 1610536831, 1610536831, 1, 1), (158, 'org.springframework.cloud.config.server.resource.GenericResourceRepository.findOne(java.lang.String,java.lang.String,java.lang.String,java.lang.String)', 'P1,2,3,4', 'R', 'false', '', 1610536831, 1610536831, 1, 1), (159, 'org.springframework.cloud.config.server.environment.MultipleJGitEnvironmentRepository.getLocations(java.lang.String,java.lang.String,java.lang.String)', 'P1,2,3', 'R', 'false', '', 1610536831, 1610536831, 1, 1), (160, 'org.apache.hc.core5.http.message.BasicHttpRequest.setUri(java.net.URI)', 'P1', 'O', 'true', '', 1610536831, 1610536831, 1, 1), (161, 'org.apache.hc.core.http.message.BasicHttpRequest.setUri(java.net.URI)', 'P1', 'O', 'true', '', 1610536831, 1610536831, 1, 1), (162, 'org.apache.hc.client5.http.classic.methods.HttpGet.<init>(java.lang.String)', 'P1', 'O', 'false', '', 1610536831, 1610536831, 1, 1), (163, 'org.apache.hc.client5.http.classic.methods.HttpGet.<init>(java.net.URI)', 'P1', 'O', 'false', '', 1610536831, 1610536831, 1, 1), (164, 'org.apache.hc.core5.http.HttpHost.<init>(java.lang.String,int)', 'P1', 'O', 'false', '', 1610536831, 1610536831, 1, 1), (165, 'org.apache.hc.core5.http.HttpHost.<init>(java.lang.String,java.lang.String)', 'P1', 'O', 'false', '', 1610536831, 1610536831, 1, 1), (166, 'com.squareup.okhttp.Request$Builder.build()', 'O', 'R', 'false', '', 1610536831, 1610536831, 1, 1), (167, 'com.squareup.okhttp.Request$Builder.url(com.squareup.okhttp.HttpUrl)', 'P1', 'R', 'false', '', 1610536831, 1610536831, 1, 1), (168, 'com.squareup.okhttp.HttpUrl.parse(java.lang.String)', 'P1', 'R', 'false', '', 1610536831, 1610536831, 1, 1), (169, 'com.squareup.okhttp.OkHttpClient.newCall(com.squareup.okhttp.Request)', 'P1', 'R', 'false', '', 1610536831, 1610536831, 1, 1), (170, 'okhttp3.Request$Builder.build()', 'O', 'R', 'false', '', 1610536831, 1610536831, 1, 1), (171, 'okhttp3.Request$Builder.url(okhttp3.HttpUrl)', 'P1', 'R', 'false', '', 1610536831, 1610536831, 1, 1), (172, 'okhttp3.HttpUrl.get(java.lang.String)', 'P1', 'R', 'false', '', 1610536831, 1610536831, 1, 1), (173, 'okhttp3.Call$Factory.newCall(okhttp3.Request)', 'P1', 'R', 'true', '', 1610536831, 1610536831, 1, 1), (174, 'org.springframework.expression.ExpressionParser.parseExpression(java.lang.String,org.springframework.expression.ParserContext)', 'P1', 'R', 'true', '', 1610536831, 1610536831, 1, 1), (175, 'org.springframework.expression.ExpressionParser.parseExpression(java.lang.String)', 'P1', 'R', 'true', '', 1610536831, 1610536831, 1, 1), (176, 'ognl.Ognl.parseExpression(java.lang.String)', 'P1', 'R', 'false', '', 1610536831, 1610536831, 1, 1), (177, 'ognl.OgnlParser.<init>(java.io.Reader)', 'P1', 'O', 'false', '', 1610536831, 1610536831, 1, 1), (178, 'ognl.OgnlParser.<init>(java.io.InputStream)', 'P1', 'O', 'false', '', 1610536831, 1610536831, 1, 1), (179, 'ognl.OgnlParser.<init>(ognl.OgnlParserTokenManager)', 'P1', 'O', 'false', '', 1610536831, 1610536831, 1, 1), (180, 'ognl.OgnlParser.topLevelExpression()', 'O', 'R', 'false', '', 1610536831, 1610536831, 1, 1), (181, 'java.util.function.BiConsumer.accept(java.lang.Object,java.lang.Object', 'O', 'P1', 'true', '', 1610536831, 1610536831, 1, 1), (182, 'org.apache.catalina.connector.CoyoteInputStream.read(byte[])', 'O', 'P1', 'false', '', 1610536831, 1610536831, 1, 1), (183, 'org.apache.catalina.connector.CoyoteInputStream.read(byte[],int,int)', 'O', 'P1', 'false', '', 1610536831, 1610536831, 1, 1), (184, 'org.apache.catalina.connector.CoyoteInputStream.read(java.nio.ByteBuffer)', 'O', 'P1', 'false', '', 1610536831, 1610536831, 1, 1), (185, 'java.sql.Connection.nativeSQL(java.lang.String)', 'P1', 'O', 'true', '', 1610536831, 1610536831, 1, 1), (186, 'javax.mail.Message.setFrom(javax.mail.Address)', 'P1', '', 'all', 'true', 1610536832, 1610536832, 1, 1), (187, 'javax.mail.Message.setHeader(java.lang.String,java.lang.String)', 'P1,2', '', 'all', 'true', 1610536832, 1610536832, 1, 1), (188, 'javax.mail.Message.setRecipient(javax.mail.Message.RecipientType,javax.mail.Address)', 'P2', '', 'all', 'true', 1610536832, 1610536832, 1, 1), (189, 'javax.mail.internet.MimeMessage.setRecipients(javax.mail.Message.RecipientType,java.lang.String)', 'P2', '', 'all', 'true', 1610536832, 1610536832, 1, 1), (190, 'javax.mail.Message.setSubject(java.lang.String)', 'P1', '', 'all', 'true', 1610536832, 1610536832, 1, 1), (191, 'javax.mail.internet.MimeMessage.setSubject(java.lang.String,java.lang.String)', 'P1', '', 'all', 'true', 1610536832, 1610536832, 1, 1), (192, 'javax.mail.Part.setText(java.lang.String)', 'P1', '', 'all', 'true', 1610536832, 1610536832, 1, 1), (193, 'javax.mail.internet.MimeBodyPart.setText(javax.mail.internet.MimePart,java.lang.String,java.lang.String,java.lang.String)', 'P2', '', 'all', 'true', 1610536832, 1610536832, 1, 1), (194, 'javax.mail.internet.InternetHeaders.setHeader(java.lang.String,java.lang.String)', 'P1,2', '', 'all', 'true', 1610536832, 1610536832, 1, 1), (195, 'javax.mail.internet.InternetHeaders.addHeader(java.lang.String,java.lang.String)', 'P1,2', '', 'all', 'true', 1610536832, 1610536832, 1, 1), (196, 'javax.mail.internet.InternetHeaders.addHeaderLine(java.lang.String)', 'P1', '', 'all', 'true', 1610536832, 1610536832, 1, 1), (197, 'java.net.URL.openConnection()', 'O', '', 'all', 'true', 1610536832, 1610536832, 1, 1), (198, 'java.net.URL.openConnection(java.net.Proxy)', 'O', '', 'all', 'true', 1610536832, 1610536832, 1, 1), (199, 'org.apache.http.client.methods.HttpRequestBase.setURI(java.net.URI)', 'P1', '', 'all', 'true', 1610536832, 1610536832, 1, 1), (200, 'org.apache.commons.httpclient.HttpMethodBase.<init>(java.lang.String)', 'P1', '', 'all', 'true', 1610536832, 1610536832, 1, 1), (201, 'org.apache.commons.httpclient.HttpMethodBase.setURI(java.net.URI)', 'P1', '', 'all', 'true', 1610536832, 1610536832, 1, 1), (202, 'org.apache.hc.client5.http.impl.classic.CloseableHttpClient.doExecute(org.apache.hc.core5.http.HttpHost,org.apache.hc.core5.http.ClassicHttpRequest,org.apache.hc.core5.http.protocol.HttpContext)', 'P2', '', 'all', 'true', 1610536832, 1610536832, 1, 1), (203, 'com.squareup.okhttp.Call.execute()', 'O', '', 'false', 'true', 1610536832, 1610536832, 1, 1), (204, 'com.squareup.okhttp.Call.enqueue(com.squareup.okhttp.Callback)', 'O', '', 'false', 'true', 1610536832, 1610536832, 1, 1), (205, 'okhttp3.Call.execute()', 'O', '', 'all', 'true', 1610536832, 1610536832, 1, 1), (206, 'okhttp3.Call.enqueue(okhttp3.Callback)', 'O', '', 'all', 'true', 1610536832, 1610536832, 1, 1), (207, 'java.beans.XMLDecoder.<init>(org.xml.sax.InputSource)', 'P1', '', 'all', 'true', 1610536832, 1610536832, 1, 1), (208, 'java.beans.XMLDecoder.<init>(java.io.InputStream)', 'P1', '', 'all', 'true', 1610536832, 1610536832, 1, 1), (209, 'java.beans.XMLDecoder.<init>(java.io.InputStream,java.lang.Object)', 'P1', '', 'all', 'true', 1610536832, 1610536832, 1, 1), (210, 'java.beans.XMLDecoder.<init>(java.io.InputStream,java.lang.Object,java.beans.ExceptionListener)', 'P1', '', 'all', 'true', 1610536832, 1610536832, 1, 1), (211, 'java.lang.ProcessImpl.start(java.lang.String[],java.util.Map,java.lang.String,java.lang.ProcessBuilder$Redirect[],boolean)', 'P1,2', '', 'false', 'true', 1610536832, 1610536832, 1, 1), (212, 'java.lang.ProcessBuilder.start()', 'O', '', 'false', 'true', 1610536832, 1610536832, 1, 1), (213, 'java.lang.Runtime.exec(java.lang.String[],java.lang.String[])', 'P1,2', '', 'false', 'true', 1610536832, 1610536832, 1, 1), (214, 'java.lang.Runtime.exec(java.lang.String[])', 'P1', '', 'false', 'true', 1610536832, 1610536832, 1, 1), (215, 'java.lang.Runtime.exec(java.lang.String)', 'P1', '', 'false', 'true', 1610536832, 1610536832, 1, 1), (216, 'java.lang.Runtime.exec(java.lang.String[],java.lang.String[],java.io.File)', 'P1,2', '', 'false', 'true', 1610536832, 1610536832, 1, 1), (217, 'java.lang.Runtime.exec(java.lang.String,java.lang.String[],java.io.File)', 'P1,2', '', 'false', 'true', 1610536832, 1610536832, 1, 1), (218, 'java.lang.Runtime.exec(java.lang.String,java.lang.String[])', 'P1,2', '', 'false', 'true', 1610536832, 1610536832, 1, 1), (219, 'java.sql.Statement.addBatch(java.lang.String)', 'P1', '', 'true', 'true', 1610536832, 1610536832, 1, 1), (220, 'java.sql.Statement.execute(java.lang.String)', 'P1', '', 'true', 'true', 1610536832, 1610536832, 1, 1), (221, 'java.sql.Statement.execute(java.lang.String,int)', 'P1', '', 'true', 'true', 1610536832, 1610536832, 1, 1), (222, 'java.sql.Statement.execute(java.lang.String,int[])', 'P1', '', 'true', 'true', 1610536832, 1610536832, 1, 1), (223, 'java.sql.Statement.execute(java.lang.String,java.lang.String[])', 'P1', '', 'true', 'true', 1610536833, 1610536833, 1, 1), (224, 'java.sql.Statement.executeQuery(java.lang.String)', 'P1', '', 'true', 'true', 1610536833, 1610536833, 1, 1), (225, 'java.sql.Statement.executeUpdate(java.lang.String)', 'P1', '', 'true', 'true', 1610536833, 1610536833, 1, 1), (226, 'java.sql.Statement.executeUpdate(java.lang.String,int)', 'P1', '', 'true', 'true', 1610536833, 1610536833, 1, 1), (227, 'java.sql.Statement.executeUpdate(java.lang.String,int[])', 'P1', '', 'true', 'true', 1610536833, 1610536833, 1, 1), (228, 'java.sql.Statement.executeUpdate(java.lang.String,java.lang.String[])', 'P1', '', 'true', 'true', 1610536833, 1610536833, 1, 1), (229, 'java.sql.Connection.prepareCall(java.lang.String)', 'P1', '', 'true', 'true', 1610536833, 1610536833, 1, 1), (230, 'java.sql.Connection.prepareCall(java.lang.String,int,int)', 'P1', '', 'true', 'true', 1610536833, 1610536833, 1, 1), (231, 'java.sql.Connection.prepareCall(java.lang.String,int,int,int)', 'P1', '', 'true', 'true', 1610536833, 1610536833, 1, 1), (232, 'java.sql.Connection.prepareStatement(java.lang.String)', 'P1', '', 'true', 'true', 1610536833, 1610536833, 1, 1), (233, 'java.sql.Connection.prepareStatement(java.lang.String,int)', 'P1', '', 'true', 'true', 1610536833, 1610536833, 1, 1), (234, 'java.sql.Connection.prepareStatement(java.lang.String,int,int)', 'P1', '', 'true', 'true', 1610536833, 1610536833, 1, 1), (235, 'java.sql.Connection.prepareStatement(java.lang.String,int,int,int)', 'P1', '', 'true', 'true', 1610536833, 1610536833, 1, 1), (236, 'java.sql.Connection.prepareStatement(java.lang.String,int[])', 'P1', '', 'true', 'true', 1610536833, 1610536833, 1, 1), (237, 'java.sql.Connection.prepareStatement(java.lang.String,java.lang.String[])', 'P1', '', 'true', 'true', 1610536833, 1610536833, 1, 1), (238, 'javax.naming.directory.DirContext.search(java.lang.String,java.lang.String,java.lang.Object[],javax.naming.directory.SearchControls)', 'P2', '', 'all', 'true', 1610536833, 1610536833, 1, 1), (239, 'javax.naming.directory.DirContext.search(java.lang.String,java.lang.String,javax.naming.directory.SearchControls)', 'P2', '', 'all', 'true', 1610536833, 1610536833, 1, 1), (240, 'javax.naming.directory.DirContext.search(java.lang.String,java.lang.String,javax.naming.directory.SearchControls', 'P2', '', 'all', 'true', 1610536833, 1610536833, 1, 1), (241, 'javax.naming.directory.InitialDirContext.search(java.lang.String,java.lang.String,java.lang.Object[],javax.naming.directory.SearchControls)', 'P2', '', 'all', 'true', 1610536833, 1610536833, 1, 1), (242, 'javax.naming.directory.InitialDirContext.search(java.lang.String,java.lang.String,javax.naming.directory.SearchControls)', 'P2', '', 'all', 'true', 1610536833, 1610536833, 1, 1), (243, 'javax.naming.directory.InitialDirContext.search(java.lang.String,java.lang.String,javax.naming.directory.SearchControls', 'P2', '', 'all', 'true', 1610536833, 1610536833, 1, 1), (244, 'javax.xml.xpath.XPath.compile(java.lang.String)', 'P1', '', 'all', 'true', 1610536833, 1610536833, 1, 1), (245, 'javax.xml.xpath.XPath.evaluate(java.lang.String,org.xml.sax.InputSource)', 'P1', '', 'all', 'true', 1610536833, 1610536833, 1, 1), (246, 'javax.xml.xpath.XPath.evaluate(java.lang.String,org.xml.sax.InputSource,javax.xml.namespace.QName)', 'P1', '', 'all', 'true', 1610536833, 1610536833, 1, 1), (247, 'javax.xml.xpath.XPath.evaluate(java.lang.String,java.lang.Object)', 'P1', '', 'all', 'true', 1610536833, 1610536833, 1, 1), (248, 'javax.xml.xpath.XPath.evaluate(java.lang.String,java.lang.Object,javax.xml.namespace.QName)', 'P1', '', 'all', 'true', 1610536833, 1610536833, 1, 1), (249, 'javax.xml.xpath.XPath.eval(org.w3c.dom.Node,java.lang.String)', 'P2', '', 'all', 'true', 1610536833, 1610536833, 1, 1), (250, 'org.apache.xpath.XPathAPI.eval(org.w3c.dom.Node,java.lang.String)', 'P2', '', 'all', 'true', 1610536833, 1610536833, 1, 1), (251, 'org.apache.xpath.XPathAPI.eval(org.w3c.dom.Node,java.lang.String,org.w3c.dom.Node)', 'P2', '', 'all', 'true', 1610536833, 1610536833, 1, 1), (252, 'org.apache.xpath.XPathAPI.eval(org.w3c.dom.Node,java.lang.String,org.apache.xml.utils.PrefixResolver)', 'P2', '', 'all', 'true', 1610536833, 1610536833, 1, 1), (253, 'net.sf.saxon.s9api.XPathCompiler.compile(java.lang.String)', 'P1', '', 'all', 'true', 1610536833, 1610536833, 1, 1), (254, 'com.sun.org.apache.xpath.internal.jaxp.XPathImpl.eval(java.lang.String,java.lang.Object)', 'P1', '', 'all', 'true', 1610536833, 1610536833, 1, 1), (255, 'com.sun.org.apache.xpath.internal.jaxp.XPathImpl.evaluate(java.lang.String,java.lang.Object,javax.xml.namespace.QName)', 'P1', '', 'all', 'true', 1610536833, 1610536833, 1, 1), (256, 'com.sun.org.apache.xpath.internal.jaxp.XPathImpl.evaluate(java.lang.String,java.lang.Object)', 'P1', '', 'all', 'true', 1610536833, 1610536833, 1, 1), (257, 'com.sun.org.apache.xpath.internal.jaxp.XPathImpl.compile(java.lang.String)', 'P1', '', 'all', 'true', 1610536833, 1610536833, 1, 1), (258, 'com.sun.org.apache.xpath.internal.jaxp.XPathImpl.evaluate(java.lang.String,org.xml.sax.InputSource,javax.xml.namespace.QName)', 'P1', '', 'all', 'true', 1610536833, 1610536833, 1, 1), (259, 'com.sun.org.apache.xpath.internal.jaxp.XPathImpl.evaluate(java.lang.String,org.xml.sax.InputSource)', 'P1', '', 'all', 'true', 1610536833, 1610536833, 1, 1), (260, 'org.apache.xpath.jaxp.XPathImpl.eval(java.lang.String,java.lang.Object)', 'P1', '', 'all', 'true', 1610536834, 1610536834, 1, 1), (261, 'org.apache.xpath.jaxp.XPathImpl.evaluate(java.lang.String,java.lang.Object,javax.xml.namespace.QName)', 'P1', '', 'all', 'true', 1610536834, 1610536834, 1, 1), (262, 'org.apache.xpath.jaxp.XPathImpl.evaluate(java.lang.String,java.lang.Object)', 'P1', '', 'all', 'true', 1610536834, 1610536834, 1, 1), (263, 'org.apache.xpath.jaxp.XPathImpl.compile(java.lang.String)', 'P1', '', 'all', 'true', 1610536834, 1610536834, 1, 1), (264, 'org.apache.xpath.jaxp.XPathImpl.evaluate(java.lang.String,org.xml.sax.InputSource,javax.xml.namespace.QName)', 'P1', '', 'all', 'true', 1610536834, 1610536834, 1, 1), (265, 'org.apache.xpath.jaxp.XPathImpl.evaluate(java.lang.String,org.xml.sax.InputSource)', 'P1', '', 'all', 'true', 1610536834, 1610536834, 1, 1), (266, 'java.nio.file.Paths.get(java.lang.String,java.lang.String[])', 'P1,2', '', 'all', 'true', 1610536834, 1610536834, 1, 1), (267, 'java.nio.file.Paths.get(java.net.URI)', 'P1', '', 'all', 'true', 1610536834, 1610536834, 1, 1), (268, 'java.io.File.<init>(java.lang.String)', 'P1', '', 'all', 'true', 1610536834, 1610536834, 1, 1), (269, 'java.io.File.<init>(java.lang.String,java.lang.String)', 'P1,2', '', 'all', 'true', 1610536834, 1610536834, 1, 1), (270, 'java.io.File.<init>(java.io.File,java.lang.String)', 'P2', '', 'all', 'true', 1610536834, 1610536834, 1, 1), (271, 'java.io.File.<init>(java.net.URI)', 'P1', '', 'all', 'true', 1610536834, 1610536834, 1, 1), (272, 'java.io.RandomAccessFile.<init>(java.lang.String,java.lang.String)', 'P1', '', 'all', 'true', 1610536834, 1610536834, 1, 1), (273, 'java.lang.Math.random()', '', '', 'false', 'false', 1610536834, 1610536834, 1, 1), (274, 'org.apache.commons.lang.RandomStringUtils.random(int,int,int,boolean,boolean,char[])', '', '', 'false', 'false', 1610536834, 1610536834, 1, 1), (275, 'org.apache.commons.lang.RandomStringUtils.random(int,int,int,boolean,boolean)', '', '', 'false', 'false', 1610536834, 1610536834, 1, 1), (276, 'org.apache.commons.lang.RandomStringUtils.randomAlphabetic(int)', '', '', 'false', 'false', 1610536834, 1610536834, 1, 1), (277, 'org.apache.commons.lang.RandomStringUtils.randomAlphanumeric(int)', '', '', 'false', 'false', 1610536834, 1610536834, 1, 1), (278, 'org.apache.commons.lang.RandomStringUtils.randomAscii(int)', '', '', 'false', 'false', 1610536834, 1610536834, 1, 1), (279, 'org.apache.commons.lang.RandomStringUtils.randomNumeric(int)', '', '', 'false', 'false', 1610536834, 1610536834, 1, 1), (280, 'java.util.Random.nextInt()', '', '', 'false', 'false', 1610536834, 1610536834, 1, 1), (281, 'java.util.Random.nextBoolean()', '', '', 'false', 'false', 1610536834, 1610536834, 1, 1), (282, 'java.util.Random.nextDouble()', '', '', 'false', 'false', 1610536834, 1610536834, 1, 1), (283, 'java.util.Random.nextFloat()', '', '', 'false', 'false', 1610536834, 1610536834, 1, 1), (284, 'java.util.Random.nextGaussian()', '', '', 'false', 'false', 1610536834, 1610536834, 1, 1), (285, 'java.util.Random.nextInt()', '', '', 'false', 'false', 1610536834, 1610536834, 1, 1), (286, 'java.util.Random.nextLong()', '', '', 'false', 'false', 1610536834, 1610536834, 1, 1), (287, 'java.security.MessageDigest.getInstance(java.lang.String)', 'P1', '', 'false', 'false', 1610536834, 1610536834, 1, 1), (288, 'java.security.MessageDigest.getInstance(java.lang.String,java.security.Provider)', 'P1', '', 'false', 'false', 1610536834, 1610536834, 1, 1), (289, 'java.security.MessageDigest.getInstance(java.lang.String,java.lang.String)', 'P1', '', 'false', 'false', 1610536834, 1610536834, 1, 1), (290, 'javax.crypto.Cipher.getInstance(java.lang.String)', 'P1', '', 'false', 'false', 1610536834, 1610536834, 1, 1), (291, 'javax.crypto.Cipher.getInstance(java.lang.String,java.security.Provider)', 'P1', '', 'false', 'false', 1610536834, 1610536834, 1, 1), (292, 'javax.crypto.Cipher.getInstance(java.lang.String,java.lang.String)', 'P1', '', 'false', 'false', 1610536834, 1610536834, 1, 1), (293, 'javax.servlet.http.Cookie.setSecure(boolean)', 'P1', '', 'true', 'false', 1610536834, 1610536834, 1, 1), (294, 'org.glassfish.grizzly.http.Cookie.setSecure(boolean)', 'P1', '', 'false', 'false', 1610536834, 1610536834, 1, 1), (295, 'javax.ws.rs.core.NewCookie.<init>(java.lang.String,java.lang.String,java.lang.String,java.lang.String,int,java.lang.String,int,java.util.Date,boolean,boolean)', 'P9', '', 'false', 'false', 1610536834, 1610536834, 1, 1), (296, 'javax.ws.rs.core.NewCookie.<init>(javax.ws.rs.core.Cookie,java.lang.String,int,java.util.Date,boolean,boolean)', 'P5', '', 'false', 'false', 1610536834, 1610536834, 1, 1), (297, 'javax.servlet.http.HttpSession.setAttribute(java.lang.String,java.lang.Object)', 'P1,2', '', 'true', 'true', 1610536834, 1610536834, 1, 1), (298, 'javax.servlet.http.HttpSession.putValue(java.lang.String,java.lang.Object)', 'P1,2', '', 'true', 'true', 1610536834, 1610536834, 1, 1), (299, 'org.apache.struts2.dispatcher.SessionMap.put(java.lang.Object,java.lang.Object)', 'P1,2', '', 'false', 'true', 1610536834, 1610536834, 1, 1), (300, 'coldfusion.runtime.SessionScope.bind(java.lang.String,java.lang.Object)', 'P1,2', '', 'false', 'true', 1610536834, 1610536834, 1, 1), (301, 'play.mvc.Http$Session.put(java.lang.String,java.lang.String)', 'P1,2', '', 'false', 'true', 1610536834, 1610536834, 1, 1), (302, 'org.springframework.http.converter.StringHttpMessageConverter.writeInternal(java.lang.String,org.springframework.http.HttpOutputMessage)', 'P1', '', 'false', 'true', 1610536835, 1610536835, 1, 1), (303, 'play.twirl.api.Html$.apply(java.lang.String)', 'P1', '', 'false', 'true', 1610536835, 1610536835, 1, 1), (304, 'org.glassfish.jersey.message.internal.ByteArrayProvider.writeTo(byte[],java.lang.Class,java.lang.reflect.Type,java.lang.annotation.Annotation[],javax.ws.rs.core.MediaType,javax.ws.rs.core.MultivaluedMap,java.io.OutputStream)', 'P1', '', 'false', 'true', 1610536835, 1610536835, 1, 1), (305, 'org.glassfish.jersey.message.internal.DataSourceProvider.writeTo(javax.activation.DataSource,java.lang.Class,java.lang.reflect.Type,java.lang.annotation.Annotation[],javax.ws.rs.core.MediaType,javax.ws.rs.core.MultivaluedMap,java.io.OutputStream)', 'P1', '', 'false', 'true', 1610536835, 1610536835, 1, 1), (306, 'org.glassfish.jersey.message.internal.FileProvider.writeTo(java.io.File,java.lang.Class,java.lang.reflect.Type,java.lang.annotation.Annotation[],javax.ws.rs.core.MediaType,javax.ws.rs.core.MultivaluedMap,java.io.OutputStream)', 'P1', '', 'false', 'true', 1610536835, 1610536835, 1, 1), (307, 'org.glassfish.jersey.message.internal.InputStreamProvider.writeTo(java.io.InputStream,java.lang.Class,java.lang.reflect.Type,java.lang.annotation.Annotation[],javax.ws.rs.core.MediaType,javax.ws.rs.core.MultivaluedMap,java.io.OutputStream)', 'P1', '', 'false', 'true', 1610536835, 1610536835, 1, 1), (308, 'org.glassfish.jersey.message.internal.ReaderProvider.writeTo(java.io.Reader,java.lang.Class,java.lang.reflect.Type,java.lang.annotation.Annotation[],javax.ws.rs.core.MediaType,javax.ws.rs.core.MultivaluedMap,java.io.OutputStream)', 'P1', '', 'false', 'true', 1610536835, 1610536835, 1, 1), (309, 'org.glassfish.jersey.message.internal.StringMessageProvider.writeTo(java.lang.String,java.lang.Class,java.lang.reflect.Type,java.lang.annotation.Annotation[],javax.ws.rs.core.MediaType,javax.ws.rs.core.MultivaluedMap,java.io.OutputStream)', 'P1', '', 'false', 'true', 1610536835, 1610536835, 1, 1), (310, 'org.glassfish.jersey.message.internal.AbstractMessageReaderWriterProvider.writeToAsString(java.lang.String,java.io.OutputStream,javax.ws.rs.core.MediaType)', 'P1', '', 'false', 'true', 1610536835, 1610536835, 1, 1), (311, 'com.github.mustachejava.codes.ValueCode.execute(java.io.Writer,java.lang.String)', 'P2', '', 'false', 'true', 1610536835, 1610536835, 1, 1), (312, 'javax.servlet.jsp.JspWriter.print(java.lang.String)', 'P1', '', 'all', 'true', 1610536835, 1610536835, 1, 1), (313, 'javax.servlet.jsp.JspWriter.println(java.lang.String)', 'P1', '', 'all', 'true', 1610536835, 1610536835, 1, 1), (314, 'javax.servlet.jsp.JspWriter.write(java.lang.String)', 'P1', '', 'all', 'true', 1610536835, 1610536835, 1, 1), (315, 'javax.servlet.jsp.JspWriter.write(java.lang.String,int,int)', 'P1', '', 'all', 'true', 1610536835, 1610536835, 1, 1), (316, 'javax.servlet.jsp.JspWriter.write(char[])', 'P1', '', 'all', 'true', 1610536835, 1610536835, 1, 1), (317, 'javax.servlet.jsp.JspWriter.write(char[],int,int)', 'P1', '', 'all', 'true', 1610536835, 1610536835, 1, 1), (318, 'java.io.PrintWriter.format(java.util.Locale,java.lang.String,java.lang.Object[])', 'P2,3', '', 'all', 'true', 1610536835, 1630428661, 1, 1), (319, 'java.io.PrintWriter.format(java.lang.String,java.lang.Object[])', 'P1,2', '', 'all', 'true', 1610536835, 1630428683, 1, 1), (320, 'java.io.PrintWriter.print(char[])', 'P1', '', 'all', 'true', 1610536835, 1630428688, 1, 1), (321, 'java.io.PrintWriter.print(java.lang.Object)', 'P1', '', 'all', 'true', 1610536835, 1630428692, 1, 1), (322, 'java.io.PrintWriter.print(java.lang.String)', 'P1', '', 'all', 'true', 1610536835, 1630428713, 1, 1), (323, 'java.io.PrintWriter.printf(java.util.Locale,java.lang.String,java.lang.Object[])', 'P2,3', '', 'all', 'true', 1610536835, 1630428717, 1, 1), (324, 'java.io.PrintWriter.printf(java.lang.String,java.lang.Object[])', 'P1,2', '', 'all', 'true', 1610536835, 1630428721, 1, 1), (325, 'java.io.PrintWriter.println(char[])', 'P1', '', 'all', 'true', 1610536835, 1630428725, 1, 1), (326, 'java.io.PrintWriter.println(java.lang.Object)', 'P1', '', 'all', 'true', 1610536835, 1630428730, 1, 1), (327, 'java.io.PrintWriter.println(java.lang.String)', 'P1', '', 'all', 'true', 1610536835, 1630428735, 1, 1), (328, 'java.io.PrintWriter.write(char[])', 'P1', '', 'all', 'true', 1610536835, 1630428740, 1, 1), (329, 'java.io.PrintWriter.write(char[],int,int)', 'P1', '', 'all', 'true', 1610536835, 1630428754, 1, 1), (330, 'java.io.PrintWriter.write(java.lang.String)', 'P1', '', 'all', 'true', 1610536835, 1630428760, 1, 1), (331, 'java.io.PrintWriter.write(java.lang.String,int,int)', 'P1', '', 'all', 'true', 1610536835, 1630428764, 1, 1), (332, 'org.apache.tapestry5.internal.services.MarkupWriterImpl.writeRaw(java.lang.String)', 'P1', '', 'false', 'true', 1610536835, 1610536835, 1, 1), (333, 'com.sun.faces.renderkit.html_basic.HtmlResponseWriter.write(java.lang.String)', 'P1', '', 'false', 'true', 1610536835, 1610536835, 1, 1), (334, 'org.mule.module.http.internal.domain.response.DefaultHttpResponse.<init>(org.mule.module.http.internal.domain.response.ResponseStatus,org.apache.commons.collections.MultiMap,org.mule.module.http.internal.domain.HttpEntity)', 'P3', '', 'false', 'true', 1610536835, 1610536835, 1, 1), (335, 'org.mule.module.http.internal.domain.response.HttpResponseBuilder.setEntity(org.mule.module.http.internal.domain.HttpEntity)', 'P1', '', 'false', 'true', 1610536835, 1610536835, 1, 1), (336, 'org.mule.module.http.internal.domain.response.HttpResponseBuilder.build(org.mule.module.http.internal.domain.HttpEntity)', 'P1', '', 'false', 'true', 1610536835, 1610536835, 1, 1), (337, 'org.mule.transformer.simple.SetPayloadMessageProcessor.resolveDataType(org.mule.DefaultMuleEvent,java.lang.Object)', 'P1', '', 'false', 'true', 1610536835, 1610536835, 1, 1), (338, 'org.mule.transformer.simple.SetPayloadMessageProcessor.resolveDataType(org.mule.api.MuleEvent,java.lang.Object)', 'P1', '', 'false', 'true', 1610536835, 1610536835, 1, 1), (339, 'org.apache.jasper.runtime.JspWriterImpl.println(java.lang.String)', 'P1', '', 'false', 'true', 1610536835, 1610536835, 1, 1), (340, 'javax.xml.parsers.DocumentBuilder.parse(java.io.File)', 'P1', '', 'true', 'true', 1610536835, 1610536835, 1, 1), (341, 'javax.xml.parsers.DocumentBuilder.parse(java.io.InputStream)', 'P1', '', 'true', 'true', 1610536835, 1610536835, 1, 1), (342, 'javax.xml.parsers.DocumentBuilder.parse(java.io.InputStream,java.lang.String)', 'P1', '', 'true', 'true', 1610536836, 1610536836, 1, 1), (343, 'javax.xml.parsers.DocumentBuilder.parse(java.lang.String)', 'P1', '', 'true', 'true', 1610536836, 1610536836, 1, 1), (344, 'javax.xml.parsers.DocumentBuilder.parse(org.xml.sax.InputSource)', 'P1', '', 'true', 'true', 1610536836, 1610536836, 1, 1), (345, 'nu.xom.Builder.build(java.io.File)', 'P1', '', 'true', 'true', 1610536836, 1610536836, 1, 1), (346, 'nu.xom.Builder.build(java.io.InputStream)', 'P1', '', 'true', 'true', 1610536836, 1610536836, 1, 1), (347, 'nu.xom.Builder.build(java.io.InputStream,java.lang.String)', 'P1', '', 'true', 'true', 1610536836, 1610536836, 1, 1), (348, 'nu.xom.Builder.build(java.io.Reader)', 'P1', '', 'true', 'true', 1610536836, 1610536836, 1, 1), (349, 'nu.xom.Builder.build(java.io.Reader,java.lang.String)', 'P1', '', 'true', 'true', 1610536836, 1610536836, 1, 1), (350, 'nu.xom.Builder.build(java.lang.String)', 'P1', '', 'true', 'true', 1610536836, 1610536836, 1, 1), (351, 'javax.xml.bind.Unmarshaller.unmarshal(java.io.InputStream)', 'P1', '', 'true', 'true', 1610536836, 1610536836, 1, 1), (352, 'javax.xml.bind.Unmarshaller.unmarshal(java.io.Reader)', 'P1', '', 'true', 'true', 1610536836, 1610536836, 1, 1), (353, 'javax.xml.bind.Unmarshaller.unmarshal(javax.xml.transform.Source)', 'P1', '', 'true', 'true', 1610536836, 1610536836, 1, 1), (354, 'javax.xml.bind.Unmarshaller.unmarshal(javax.xml.transform.Source,java.lang.Class)', 'P1', '', 'true', 'true', 1610536836, 1610536836, 1, 1), (355, 'javax.xml.bind.Unmarshaller.unmarshal(org.xml.sax.InputSource)', 'P1', '', 'true', 'true', 1610536836, 1610536836, 1, 1), (356, 'javax.xml.bind.Unmarshaller.unmarshal(javax.xml.stream.XMLStreamReader)', 'P1', '', 'true', 'true', 1610536836, 1610536836, 1, 1), (357, 'javax.xml.bind.Unmarshaller.unmarshal(javax.xml.stream.XMLStreamReader,java.lang.Class)', 'P1', '', 'true', 'true', 1610536836, 1610536836, 1, 1), (358, 'javax.xml.bind.Unmarshaller.unmarshal(javax.xml.stream.XMLEventReader)', 'P1', '', 'true', 'true', 1610536836, 1610536836, 1, 1), (359, 'javax.xml.bind.Unmarshaller.unmarshal(javax.xml.stream.XMLEventReader,java.lang.Class)', 'P1', '', 'true', 'true', 1610536836, 1610536836, 1, 1), (360, 'javax.xml.parsers.SAXParser.parse(java.io.InputStream,org.xml.sax.HandlerBase)', 'P1', '', 'true', 'true', 1610536836, 1610536836, 1, 1), (361, 'javax.xml.parsers.SAXParser.parse(java.io.InputStream,org.xml.sax.HandlerBase,java.lang.String)', 'P1', '', 'true', 'true', 1610536836, 1610536836, 1, 1), (362, 'javax.xml.parsers.SAXParser.parse(java.io.InputStream,org.xml.sax.helpers.DefaultHandler)', 'P1', '', 'true', 'true', 1610536836, 1610536836, 1, 1), (363, 'javax.xml.parsers.SAXParser.parse(java.io.InputStream,org.xml.sax.helpers.DefaultHandler,java.lang.String)', 'P1', '', 'true', 'true', 1610536836, 1610536836, 1, 1), (364, 'javax.xml.parsers.SAXParser.parse(org.xml.sax.InputSource,org.xml.sax.HandlerBase)', 'P1', '', 'true', 'true', 1610536836, 1610536836, 1, 1), (365, 'javax.xml.parsers.SAXParser.parse(org.xml.sax.InputSource,org.xml.sax.helpers.DefaultHandler)', 'P1', '', 'true', 'true', 1610536836, 1610536836, 1, 1), (366, 'org.xml.sax.XMLReader.parse(org.xml.sax.InputSource)', 'P1', '', 'true', 'true', 1610536836, 1610536836, 1, 1), (367, 'javax.xml.stream.XMLStreamReader.getElementText()', 'O', '', 'true', 'true', 1610536836, 1610536836, 1, 1), (368, 'javax.servlet.jsp.el.ExpressionEvaluator.evaluate(java.lang.String,java.lang.Class,javax.servlet.jsp.el.VariableResolver,javax.servlet.jsp.el.FunctionMapper)', 'P1', '', 'all', 'true', 1610536836, 1610536836, 1, 1), (369, 'ognl.Ognl.getValue(java.lang.Object,java.util.Map,java.lang.Object)', 'P1', '', 'all', 'true', 1610536836, 1610536836, 1, 1), (370, 'ognl.Ognl.getValue(java.lang.Object,java.util.Map,java.lang.Object,java.lang.Class)', 'P1', '', 'all', 'true', 1610536836, 1610536836, 1, 1), (371, 'ognl.Ognl.getValue(java.lang.String,java.util.Map,java.lang.Object)', 'P1', '', 'all', 'true', 1610536836, 1610536836, 1, 1), (372, 'ognl.Ognl.getValue(java.lang.String,java.util.Map,java.lang.Object,java.lang.Class)', 'P1', '', 'all', 'true', 1610536836, 1610536836, 1, 1), (373, 'ognl.Ognl.getValue(java.lang.Object,java.lang.Object)', 'P1', '', 'all', 'true', 1610536836, 1610536836, 1, 1), (374, 'ognl.Ognl.getValue(java.lang.Object,java.lang.Object,java.lang.Class)', 'P1', '', 'all', 'true', 1610536836, 1610536836, 1, 1), (375, 'ognl.Ognl.getValue(java.lang.String,java.lang.Object)', 'P1', '', 'all', 'true', 1610536836, 1610536836, 1, 1), (376, 'ognl.Ognl.getValue(java.lang.String,java.lang.Object,java.lang.Class)', 'P1', '', 'all', 'true', 1610536836, 1610536836, 1, 1), (377, 'org.apache.commons.ognl.Ognl.parseExpression(java.lang.String)', 'P1', '', 'all', 'true', 1610536836, 1610536836, 1, 1), (378, 'org.springframework.expression.Expression.getValue()', 'O', '', 'true', 'true', 1610536836, 1610536836, 1, 1), (379, 'org.springframework.expression.Expression.getValue(java.lang.Class)', 'O', '', 'true', 'true', 1610536837, 1610536837, 1, 1), (380, 'org.springframework.expression.Expression.getValue(org.springframework.expression.EvaluationContext)', 'O', '', 'true', 'true', 1610536837, 1610536837, 1, 1), (381, 'org.springframework.expression.Expression.getValue(org.springframework.expression.EvaluationContext,java.lang.Class)', 'O', '', 'true', 'true', 1610536837, 1610536837, 1, 1), (382, 'org.springframework.expression.Expression.getValue(org.springframework.expression.EvaluationContext,java.lang.Object,java.lang.Class)', 'O', '', 'true', 'true', 1610536837, 1610536837, 1, 1), (383, 'org.springframework.expression.Expression.getValue(org.springframework.expression.EvaluationContext,java.lang.Object)', 'O', '', 'true', 'true', 1610536837, 1610536837, 1, 1), (384, 'org.springframework.expression.Expression.getValue(java.lang.Object)', 'O', '', 'true', 'true', 1610536837, 1610536837, 1, 1), (385, 'org.springframework.expression.Expression.getValue(java.lang.Object,java.lang.Class)', 'O', '', 'true', 'true', 1610536837, 1610536837, 1, 1), (386, 'org.springframework.expression.Expression.getValueTypeDescriptor(java.lang.Object)', 'O', '', 'true', 'true', 1610536837, 1610536837, 1, 1), (387, 'org.springframework.expression.Expression.getValueTypeDescriptor()', 'O', '', 'true', 'true', 1610536837, 1610536837, 1, 1), (388, 'org.springframework.expression.Expression.getValueTypeDescriptor(org.springframework.expression.EvaluationContext,java.lang.Object)', 'O', '', 'true', 'true', 1610536837, 1610536837, 1, 1), (389, 'org.springframework.expression.Expression.getValueTypeDescriptor(org.springframework.expression.EvaluationContext)', 'O', '', 'true', 'true', 1610536837, 1610536837, 1, 1), (390, 'java.util.regex.Pattern.matcher(java.lang.CharSequence)', 'P1', '', 'false', 'true', 1610536837, 1610536837, 1, 1), (391, 'jregex.Pattern.matcher(java.lang.String)', 'P1', '', 'false', 'true', 1610536837, 1610536837, 1, 1), (392, 'java.lang.Class.forName(java.lang.String)', 'P1', '', 'false', 'false', 1610536837, 1610536837, 1, 1), (393, 'java.lang.Class.forName(java.lang.String,boolean,java.lang.ClassLoader)', 'P1', '', 'false', 'false', 1610536837, 1610536837, 1, 1), (394, 'java.io.ObjectInput.readObject()', 'O', '', 'true', 'true', 1610536837, 1610536837, 1, 1), (395, 'java.io.ObjectInputStream.readObject()', 'O', '', 'all', 'true', 1610536837, 1610536837, 1, 1), (396, 'com.thoughtworks.xstream.XStream.fromXML(java.lang.String)', 'P1', '', 'false', 'true', 1610536837, 1610536837, 1, 1), (397, 'com.thoughtworks.xstream.XStream.fromXML(java.lang.String,java.lang.Object)', 'P1', '', 'false', 'true', 1610536837, 1610536837, 1, 1), (398, 'com.thoughtworks.xstream.XStream.fromXML(java.io.Reader)', 'P1', '', 'false', 'true', 1610536837, 1610536837, 1, 1), (399, 'com.thoughtworks.xstream.XStream.fromXML(java.io.Reader,java.lang.Object)', 'P1', '', 'false', 'true', 1610536837, 1610536837, 1, 1), (400, 'com.thoughtworks.xstream.XStream.fromXML(java.io.InputStream)', 'P1', '', 'false', 'true', 1610536837, 1610536837, 1, 1), (401, 'com.thoughtworks.xstream.XStream.fromXML(java.io.InputStream,java.lang.Object)', 'P1', '', 'false', 'true', 1610536837, 1610536837, 1, 1), (402, 'com.thoughtworks.xstream.XStream.fromXML(java.net.URL)', 'P1', '', 'false', 'true', 1610536837, 1610536837, 1, 1), (403, 'com.thoughtworks.xstream.XStream.fromXML(java.net.URL,java.lang.Object)', 'P1', '', 'false', 'true', 1610536837, 1610536837, 1, 1), (404, 'com.esotericsoftware.kryo.Kryo.readObject(com.esotericsoftware.kryo.io.Input,java.lang.Class)', 'P1', '', 'false', 'true', 1610536837, 1610536837, 1, 1), (405, 'com.esotericsoftware.kryo.Kryo.readObjectOrNull(com.esotericsoftware.kryo.io.Input,java.lang.Class)', 'P1', '', 'false', 'true', 1610536837, 1610536837, 1, 1), (406, 'com.esotericsoftware.kryo.Kryo.readObject(com.esotericsoftware.kryo.io.Input,java.lang.Class,com.esotericsoftware.kryo.Serializer)', 'P1', '', 'false', 'true', 1610536837, 1610536837, 1, 1), (407, 'com.esotericsoftware.kryo.Kryo.readObjectOrNull(com.esotericsoftware.kryo.io.Input,java.lang.Class,com.esotericsoftware.kryo.Serializer)', 'P1', '', 'false', 'true', 1610536837, 1610536837, 1, 1), (408, 'com.esotericsoftware.kryo.Kryo.readClassAndObject(com.esotericsoftware.kryo.io.Input)', 'P1', '', 'false', 'true', 1610536837, 1610536837, 1, 1), (409, 'org.hibernate.Session.createFilter(java.lang.Object,java.lang.String)', 'P2', '', 'true', 'true', 1610536837, 1610536837, 1, 1), (410, 'org.hibernate.Session.createQuery(java.lang.String)', 'P1', '', 'true', 'true', 1610536837, 1610536837, 1, 1), (411, 'org.hibernate.Session.createSQLQuery(java.lang.String,java.lang.String,java.lang.Class)', 'P1', '', 'true', 'true', 1610536837, 1610536837, 1, 1), (412, 'org.hibernate.Session.createSQLQuery(java.lang.String,java.lang.String[],java.lang.Class[])', 'P1', '', 'true', 'true', 1610536837, 1610536837, 1, 1), (413, 'org.hibernate.Session.createSQLQuery(java.lang.String)', 'P1', '', 'true', 'true', 1610536837, 1610536837, 1, 1), (414, 'org.hibernate.Session.delete(java.lang.String)', 'P1', '', 'true', 'true', 1610536837, 1610536837, 1, 1), (415, 'org.hibernate.Session.delete(java.lang.String,java.lang.Object,org.hibernate.type.Type)', 'P1', '', 'true', 'true', 1610536837, 1610536837, 1, 1), (416, 'org.hibernate.Session.delete(java.lang.String,java.lang.Object[],org.hibernate.type.Type[])', 'P1', '', 'true', 'true', 1610536837, 1610536837, 1, 1), (417, 'org.hibernate.Session.filter(java.lang.Object,java.lang.String)', 'P2', '', 'true', 'true', 1610536837, 1610536837, 1, 1), (418, 'org.hibernate.Session.filter(java.lang.Object,java.lang.String,java.lang.Object,org.hibernate.type.Type)', 'P2', '', 'true', 'true', 1610536837, 1610536837, 1, 1), (419, 'org.hibernate.Session.filter(java.lang.Object,java.lang.String,java.lang.Object[],org.hibernate.type.Type[])', 'P2', '', 'true', 'true', 1610536837, 1610536837, 1, 1), (420, 'org.hibernate.Session.find(java.lang.String)', 'P1', '', 'true', 'true', 1610536837, 1610536837, 1, 1), (421, 'org.hibernate.Session.find(java.lang.String,java.lang.Object,org.hibernate.type.Type)', 'P1', '', 'true', 'true', 1610536837, 1610536837, 1, 1), (422, 'org.hibernate.Session.find(java.lang.String,java.lang.Object[],org.hibernate.type.Type[])', 'P1', '', 'true', 'true', 1610536837, 1610536837, 1, 1), (423, 'org.hibernate.Session.iterate(java.lang.String)', 'P1', '', 'true', 'true', 1610536838, 1610536838, 1, 1), (424, 'org.hibernate.Session.iterate(java.lang.String,java.lang.Object,org.hibernate.type.Type)', 'P1', '', 'true', 'true', 1610536838, 1610536838, 1, 1), (425, 'org.hibernate.Session.iterate(java.lang.String,java.lang.Object[],org.hibernate.type.Type[])', 'P1', '', 'true', 'true', 1610536838, 1610536838, 1, 1), (426, 'org.hibernate.SharedSessionContract.createQuery(java.lang.String)', 'P1', '', 'true', 'true', 1610536838, 1610536838, 1, 1), (427, 'org.hibernate.SharedSessionContract.createSQLQuery(java.lang.String)', 'P1', '', 'true', 'true', 1610536838, 1610536838, 1, 1), (428, 'com.mongodb.DB.doEval(java.lang.String,java.lang.Object[])', 'P1', '', 'true', 'true', 1610536838, 1610536838, 1, 1), (429, 'java.io.BufferedReader.readLine()', 'O', '', 'true', 'true', 1610536838, 1610536838, 1, 1), (430, 'javax.servlet.ServletRequest.getRequestDispatcher(java.lang.String)', 'P1', '', 'true', 'true', 1610536838, 1610536838, 1, 1), (431, 'javax.servlet.jsp.PageContext.forward(java.lang.String)', 'P1', '', 'false', 'true', 1610536838, 1610536838, 1, 1), (432, 'org.glassfish.grizzly.http.server.Response.sendRedirect(java.lang.String)', 'P1', '', 'true', 'true', 1610536838, 1610536838, 1, 1), (433, 'play.mvc.Results.redirect(java.lang.String)', 'P1', '', 'true', 'true', 1610536838, 1610536838, 1, 1), (434, 'javax.ws.rs.core.Response.temporaryRedirect(java.net.URI)', 'P1', '', 'true', 'true', 1610536838, 1610536838, 1, 1), (435, 'javax.servlet.http.HttpServletResponse.sendRedirect(java.lang.String)', 'P1', '', 'true', 'true', 1610536838, 1610536838, 1, 1), (436, 'javax.servlet.http.HttpServletResponse.setHeader(java.lang.String,java.lang.String)', 'P2', '', 'true', 'true', 1610536838, 1610536838, 1, 1), (437, 'io.netty.handler.codec.http.DefaultHttpHeaders.add0(int,int,java.lang.CharSequence,java.lang.CharSequence)', 'P2', '', 'true', 'true', 1610536838, 1610536838, 1, 1), (438, 'javax.servlet.http.HttpServletResponse.addHeader(java.lang.String,java.lang.String)', 'P2', '', 'true', 'true', 1610536838, 1610536838, 1, 1), (439, 'javax.servlet.http.HttpServletResponse.setHeader(java.lang.String,java.lang.String)', 'P1,2', '', 'false', 'true', 1610536838, 1610536838, 1, 0), (440, 'javax.servlet.http.HttpServletResponse.addHeader(java.lang.String,java.lang.String)', 'P1,2', '', 'false', 'true', 1610536838, 1610536838, 1, 0), (441, 'javax.ws.rs.core.Response$ResponseBuilder.header(java.lang.String,java.lang.Object)', 'P1,2', '', 'false', 'true', 1610536838, 1610536838, 1, 0), (442, 'java.lang.Runtime.load0(java.lang.Class,java.lang.String)', 'P2', '', 'false', 'true', 1610536838, 1610536838, 1, 1), (443, 'org.springframework.core.io.FileUrlResource.createRelative(java.lang.String)', 'P1', '', 'false', 'true', 1610536838, 1610536838, 1, 0), (444, 'com.mysql.jdbc.MysqlIO.sqlQueryDirect(com.mysql.jdbc.StatementImpl,java.lang.String,java.lang.String,com.mysql.jdbc.Buffer,int,int,int,boolean,java.lang.String,com.mysql.jdbc.Field[])', 'P4', '', 'false', 'false', 1610536838, 1610536838, 1, 0), (445, 'com.mysql.cj.NativeSession.execSQL(com.mysql.cj.Query,java.lang.String,int,com.mysql.cj.protocol.a.NativePacketPayload,boolean,com.mysql.cj.protocol.ProtocolEntityFactory,com.mysql.cj.protocol.ColumnDefinition,boolean)', 'P4', '', 'false', 'false', 1610536838, 1610536838, 1, 0), (446, 'com.mysql.cj.NativeSession.execSQL(com.mysql.cj.Query,java.lang.String,int,com.mysql.cj.protocol.a.NativePacketPayload,boolean,com.mysql.cj.protocol.ProtocolEntityFactory,java.lang.String,com.mysql.cj.protocol.ColumnDefinition,boolean)', 'P4', '', 'false', 'false', 1610536838, 1610536838, 1, 0), (447, 'com.mysql.cj.fabric.jdbc.FabricMySQLConnectionProxy.execSQL(com.mysql.cj.jdbc.StatementImpl,java.lang.String,int,com.mysql.cj.mysqla.io.Buffer,int,int,boolean,java.lang.String,com.mysql.cj.core.result.Field[])', 'P4', '', 'false', 'false', 1610536838, 1610536838, 1, 0), (448, 'com.mysql.cj.fabric.jdbc.FabricMySQLConnectionProxy.execSQL(com.mysql.cj.jdbc.StatementImpl,java.lang.String,int,com.mysql.cj.mysqla.io.Buffer,int,int,boolean,java.lang.String,com.mysql.cj.core.result.Field[],boolean)', 'P4', '', 'false', 'false', 1610536838, 1610536838, 1, 0), (449, 'com.mysql.cj.jdbc.ConnectionImpl.execSQL(com.mysql.cj.jdbc.StatementImpl,java.lang.String,int,com.mysql.cj.api.mysqla.io.PacketPayload,boolean,java.lang.String,com.mysql.cj.api.mysqla.result.ColumnDefinition)', 'P4', '', 'false', 'false', 1610536838, 1610536838, 1, 0), (450, 'com.mysql.cj.jdbc.ConnectionImpl.execSQL(com.mysql.cj.jdbc.StatementImpl,java.lang.String,int,com.mysql.cj.api.mysqla.io.PacketPayload,boolean,java.lang.String,com.mysql.cj.api.mysqla.result.ColumnDefinition,boolean)', 'P4', '', 'false', 'false', 1610536838, 1610536838, 1, 0), (451, 'com.mysql.cj.jdbc.ConnectionImpl.execSQL(com.mysql.cj.jdbc.StatementImpl,java.lang.String,int,com.mysql.cj.mysqla.io.Buffer,int,int,boolean,java.lang.String,com.mysql.cj.core.result.Field[])', 'P4', '', 'false', 'false', 1610536838, 1610536838, 1, 0), (452, 'com.mysql.cj.jdbc.ConnectionImpl.execSQL(com.mysql.cj.jdbc.StatementImpl,java.lang.String,int,com.mysql.cj.mysqla.io.Buffer,int,int,boolean,java.lang.String,com.mysql.cj.core.result.Field[],boolean)', 'P4', '', 'false', 'false', 1610536838, 1610536838, 1, 0), (453, 'com.mysql.cj.jdbc.ConnectionWrapper.execSQL(com.mysql.cj.jdbc.StatementImpl,java.lang.String,int,com.mysql.cj.api.mysqla.io.PacketPayload,boolean,java.lang.String,com.mysql.cj.api.mysqla.result.ColumnDefinition)', 'P4', '', 'false', 'false', 1610536839, 1610536839, 1, 0), (454, 'com.mysql.cj.jdbc.ConnectionWrapper.execSQL(com.mysql.cj.jdbc.StatementImpl,java.lang.String,int,com.mysql.cj.api.mysqla.io.PacketPayload,boolean,java.lang.String,com.mysql.cj.api.mysqla.result.ColumnDefinition,boolean)', 'P4', '', 'false', 'false', 1610536839, 1610536839, 1, 0), (455, 'com.mysql.cj.jdbc.ConnectionWrapper.execSQL(com.mysql.cj.jdbc.StatementImpl,java.lang.String,int,com.mysql.cj.mysqla.io.Buffer,int,int,boolean,java.lang.String,com.mysql.cj.core.result.Field[])', 'P4', '', 'false', 'false', 1610536839, 1610536839, 1, 0), (456, 'com.mysql.cj.jdbc.ConnectionWrapper.execSQL(com.mysql.cj.jdbc.StatementImpl,java.lang.String,int,com.mysql.cj.mysqla.io.Buffer,int,int,boolean,java.lang.String,com.mysql.cj.core.result.Field[],boolean)', 'P4', '', 'false', 'false', 1610536839, 1610536839, 1, 0), (457, 'com.mysql.cj.jdbc.ha.MultiHostMySQLConnection.execSQL(com.mysql.cj.jdbc.StatementImpl,java.lang.String,int,com.mysql.cj.api.mysqla.io.PacketPayload,boolean,java.lang.String,com.mysql.cj.api.mysqla.result.ColumnDefinition)', 'P4', '', 'false', 'false', 1610536839, 1610536839, 1, 0), (458, 'com.mysql.cj.jdbc.ha.MultiHostMySQLConnection.execSQL(com.mysql.cj.jdbc.StatementImpl,java.lang.String,int,com.mysql.cj.api.mysqla.io.PacketPayload,boolean,java.lang.String,com.mysql.cj.api.mysqla.result.ColumnDefinition,boolean)', 'P4', '', 'false', 'false', 1610536839, 1610536839, 1, 0), (459, 'com.mysql.cj.jdbc.ha.MultiHostMySQLConnection.execSQL(com.mysql.cj.jdbc.StatementImpl,java.lang.String,int,com.mysql.cj.mysqla.io.Buffer,int,int,boolean,java.lang.String,com.mysql.cj.core.result.Field[])', 'P4', '', 'false', 'false', 1610536839, 1610536839, 1, 0), (460, 'com.mysql.cj.jdbc.ha.MultiHostMySQLConnection.execSQL(com.mysql.cj.jdbc.StatementImpl,java.lang.String,int,com.mysql.cj.mysqla.io.Buffer,int,int,boolean,java.lang.String,com.mysql.cj.core.result.Field[],boolean)', 'P4', '', 'false', 'false', 1610536839, 1610536839, 1, 0), (461, 'com.mysql.cj.mysqla.MysqlaSession.execSQL(com.mysql.cj.api.Query,java.lang.String,int,com.mysql.cj.api.mysqla.io.PacketPayload,boolean,com.mysql.cj.api.mysqla.io.ProtocolEntityFactory,java.lang.String,com.mysql.cj.api.mysqla.result.ColumnDefinition,boolean)', 'P4', '', 'false', 'false', 1610536839, 1610536839, 1, 0), (462, 'com.mysql.fabric.jdbc.FabricMySQLConnectionProxy.execSQL(com.mysql.jdbc.StatementImpl,java.lang.String,int,com.mysql.jdbc.Buffer,int,int,boolean,java.lang.String,com.mysql.jdbc.Field[])', 'P4', '', 'false', 'false', 1610536839, 1610536839, 1, 0), (463, 'com.mysql.fabric.jdbc.FabricMySQLConnectionProxy.execSQL(com.mysql.jdbc.StatementImpl,java.lang.String,int,com.mysql.jdbc.Buffer,int,int,boolean,java.lang.String,com.mysql.jdbc.Field[],boolean)', 'P4', '', 'false', 'false', 1610536839, 1610536839, 1, 0), (464, 'java.sql.Connection.execSQL(com.mysql.jdbc.StatementImpl,java.lang.String,int,com.mysql.jdbc.Buffer,int,int,boolean,java.lang.String,com.mysql.jdbc.Field[])', 'P4', '', 'false', 'false', 1610536839, 1610536839, 1, 0), (465, 'java.sql.Connection.execSQL(com.mysql.jdbc.StatementImpl,java.lang.String,int,com.mysql.jdbc.Buffer,int,int,boolean,java.lang.String,com.mysql.jdbc.Field[],boolean)', 'P4', '', 'false', 'false', 1610536839, 1610536839, 1, 0), (466, 'com.mysql.jdbc.LoadBalancedMySQLConnection.execSQL(com.mysql.jdbc.StatementImpl,java.lang.String,int,com.mysql.jdbc.Buffer,int,int,boolean,java.lang.String,com.mysql.jdbc.Field[])', 'P4', '', 'false', 'false', 1610536839, 1610536839, 1, 0), (467, 'com.mysql.jdbc.LoadBalancedMySQLConnection.execSQL(com.mysql.jdbc.StatementImpl,java.lang.String,int,com.mysql.jdbc.Buffer,int,int,boolean,java.lang.String,com.mysql.jdbc.Field[],boolean)', 'P4', '', 'false', 'false', 1610536839, 1610536839, 1, 0), (468, 'com.mysql.jdbc.MultiHostMySQLConnection.execSQL(com.mysql.jdbc.StatementImpl,java.lang.String,int,com.mysql.jdbc.Buffer,int,int,boolean,java.lang.String,com.mysql.jdbc.Field[])', 'P4', '', 'false', 'false', 1610536839, 1610536839, 1, 0);
INSERT INTO `iast_hook_strategy` VALUES (469, 'com.mysql.jdbc.MultiHostMySQLConnection.execSQL(com.mysql.jdbc.StatementImpl,java.lang.String,int,com.mysql.jdbc.Buffer,int,int,boolean,java.lang.String,com.mysql.jdbc.Field[],boolean)', 'P4', '', 'false', 'false', 1610536839, 1610536839, 1, 0), (470, 'org.postgresql.jdbc.PgStatement.executeInternal(org.postgresql.core.CachedQuery,org.postgresql.core.ParameterList,int)', 'P1,2', '', 'false', 'false', 1610536839, 1610536839, 1, 0), (471, 'org.postgresql.core.v3.QueryExecutorImpl.sendParse(org.postgresql.core.v3.SimpleQuery,org.postgresql.core.v3.SimpleParameterList,boolean)', 'P1,2', '', 'false', 'false', 1610536839, 1610536839, 1, 0), (472, 'com.microsoft.sqlserver.jdbc.SQLServerConnection.executeCommand(com.microsoft.sqlserver.jdbc.TDSCommand)', 'P1', '', 'false', 'false', 1610536839, 1610536839, 1, 0), (473, 'com.microsoft.sqlserver.jdbc.SQLServerStatement.executeCommand(com.microsoft.sqlserver.jdbc.TDSCommand)', 'P1', '', 'false', 'false', 1610536839, 1610536839, 1, 0), (474, 'org.springframework.web.util.HtmlUtils.htmlEscape(java.lang.String)', '', '', 'false', '', 1610536839, 1610536839, 1, 1), (475, 'org.springframework.web.util.HtmlUtils.htmlEscape(java.lang.String,java.lang.String)', '', '', 'false', '', 1610536839, 1610536839, 1, 1), (476, 'org.springframework.web.util.HtmlUtils.htmlEscapeDecimal(java.lang.String)', '', '', 'false', '', 1610536840, 1610536840, 1, 1), (477, 'org.springframework.web.util.HtmlUtils.htmlEscapeDecimal(java.lang.String,java.lang.String)', '', '', 'false', '', 1610536840, 1610536840, 1, 1), (478, 'org.apache.commons.lang.StringEscapeUtils.escapeHtml(java.lang.String)', '', '', 'false', '', 1610536840, 1610536840, 1, 1), (479, 'org.apache.commons.lang.StringEscapeUtils.escapeHtml(java.io.Writer,java.lang.String)', '', '', 'false', '', 1610536840, 1610536840, 1, 1), (480, 'org.owasp.esapi.reference.DefaultEncoder.encodeForHTML(java.lang.String)', '', '', 'false', '', 1610536840, 1610536840, 1, 1), (481, 'javax.xml.parsers.DocumentBuilderFactory.setFeature(java.lang.String, boolean)', '', '', 'true', '', 1610536840, 1610536840, 1, 1), (482, 'javax.xml.parsers.SAXParserFactory.setFeature(java.lang.String, boolean)', '', '', 'true', '', 1610536840, 1610536840, 1, 1), (483, 'org.xml.sax.XMLReader.setFeature(java.lang.String, boolean)', '', '', 'true', '', 1610536840, 1610536840, 1, 1), (484, 'javax.xml.transform.TransformerFactory.setFeature(java.lang.String, boolean)', '', '', 'true', '', 1610536840, 1610536840, 1, 1), (485, 'com.sun.org.apache.xerces.internal.xni.parser.XMLParserConfiguration.setFeature(java.lang.String, boolean)', '', '', 'true', '', 1610536840, 1610536840, 1, 1), (486, 'com.sun.org.apache.xerces.internal.xni.grammars.XMLGrammarLoader.setFeature(java.lang.String, boolean)', '', '', 'true', '', 1610536840, 1610536840, 1, 1), (487, 'java.util.Arrays.asList(java.lang.Object[])', 'P1', 'R', 'false', 'false', 1614601101, 1614601101, 1, 1), (488, 'java.util.Collection.addAll(java.util.Collection)', 'P1', 'O', 'true', ' ', 1614601101, 1614601101, 1, 1), (493, 'java.lang.String<init>()', 'P1', 'R', 'false', 'false', 1615544200, 1615544200, 16, -1), (494, 'org.apache.solr.servlet.SolrRequestParsers.parseQueryString(java.lang.String,java.util.Map)', 'P1', 'P2', 'false', 'false', 1616036605, 1616036605, 1, 1), (495, 'org.apache.solr.servlet.SolrRequestParsers.parseQueryString(java.lang.String,java.util.Map)', 'P1', 'P2', 'false', 'false', 1616036872, 1616036872, 1, 1), (496, 'org.apache.solr.servlet.SolrRequestParsers.parseQueryString(java.lang.String)', 'P1', 'R', 'false', 'false', 1616037935, 1616037935, 1, 1), (497, 'org.apache.solr.common.params.SolrParams.get(java.lang.String)', 'O', 'R', 'true', 'false', 1616038118, 1616038118, 1, 1), (498, 'org.apache.solr.common.params.SolrParams.getParams(java.lang.String)', 'O', 'R', 'true', 'false', 1616038139, 1616038139, 1, 1), (502, 'org.apache.struts2.dispatcher.multipart.MultiPartRequest.getParameterValues(java.lang.String)', 'P1', 'R', 'true', 'false', 1616579162, 1618796536, 1, 1), (507, 'com.zhengjim.helloworld.exploit.Exploit.vuln()', 'R', '', 'false', 'true', 1618477311, 1618477311, 72, -1), (508, 'com.zhengjim.helloworld.exploit.Exploit.vuln()', 'R', '', 'false', 'false', 1618479449, 1618479449, 72, -1), (509, 'com.opensymphony.xwork2.util.ValueStack.findValue(java.lang.String)', 'P1', 'R', 'true', 'false', 1618480153, 1618480153, 1, 1), (510, 'com.opensymphony.xwork2.util.ValueStack.findString(java.lang.String)', 'P1', 'R', 'true', 'false', 1618480192, 1618480192, 1, 1), (511, 'com.opensymphony.xwork2.util.ValueStack.findValue(java.lang.String,java.lang.Class)', 'P1', 'R', 'true', 'false', 1618480209, 1618480209, 1, 1), (514, 'java.lang.StringUTF16.newString(byte[],int,int)', 'P1', 'R', 'false', 'false', 1618827358, 1618827358, 1, 1), (515, 'java.lang.StringLatin1.newString(byte[],int,int)', 'P1', 'R', 'false', 'false', 1618827438, 1618827438, 1, 1), (516, 'java.lang.StringConcatHelper.newString(byte[],int,byte)', 'P1', 'R', 'false', 'false', 1618827508, 1618827508, 1, 1), (517, 'java.lang.StringBuilder.delete(int,int)', 'O', 'O', 'false', 'false', 1618827778, 1618827778, 1, 1), (518, 'java.lang.StringConcatHelper.prepend(int,byte[],byte,java.lang.String)', 'P4', 'P2', 'false', 'false', 1618892316, 1618893712, 1, 1), (519, 'java.lang.String.getBytes(byte[],int,byte)', 'O', 'P1', 'false', 'false', 1618893583, 1618893644, 1, 1), (520, 'jdk.internal.joptsimple.internal.OptionNameMap.get(java.lang.String)', 'O', 'O', 'true', 'false', 1618899888, 1618899888, 93, -1), (521, 'jdk.internal.joptsimple.internal.OptionNameMap.put(java.lang.String,V)', 'R', 'O', 'true', 'false', 1618900287, 1618900287, 93, -1), (522, 'jdk.internal.joptsimple.internal.OptionNameMap.put(java.lang.String,V)', 'O&R', 'O&O', 'true', 'false', 1618901225, 1618901225, 93, -1), (523, 'jdk.internal.joptsimple.internal.OptionNameMap.get(java.lang.String)', 'O', 'R', 'true', 'false', 1618901348, 1626773439, 93, -1), (524, 'jdk.internal.joptsimple.internal.OptionNameMap.get(java.lang.String)', 'O&O', 'R', 'true', 'false', 1618901539, 1618901539, 93, -1), (525, 'jdk.internal.joptsimple.internal.OptionNameMap.get(java.lang.String)', 'O', 'R', 'true', 'false', 1618901557, 1618901557, 93, -1), (526, 'jdk.internal.joptsimple.internal.OptionNameMap.get(java.lang.String)', 'O&R', 'O', 'true', 'false', 1618901583, 1618901583, 93, -1), (527, 'jdk.internal.joptsimple.internal.OptionNameMap.get(java.lang.String)', 'O', '', 'true', 'true', 1618901823, 1618901823, 93, -1), (528, 'jdk.internal.joptsimple.internal.OptionNameMap.get(java.lang.String)', 'O', 'R', 'true', 'false', 1618901941, 1618901941, 93, -1), (529, 'jdk.internal.joptsimple.internal.OptionNameMap.get(java.lang.String)', 'O', '', 'true', 'true', 1618902364, 1618902364, 93, -1), (530, 'cn.huoxian.dongtai.plugin.util.GetJson.getJson(int)', 'P1|R', 'O', 'all', 'false', 1618906984, 1618906984, 93, -1), (531, 'jdk.internal.joptsimple.internal.OptionNameMap.get(java.lang.String)', 'O&P1', 'O', 'true', 'false', 1618921359, 1618921359, 93, -1), (532, 'cn.huoxian.demo.Demo.longestPalindrome(java.lang.String)', 'O', 'O', 'false', 'false', 1618974421, 1618974421, 93, -1), (533, 'cn.huoxian.demo.Demo.longestPalindrome(java.lang.String)', 'O', '', 'false', 'false', 1618975036, 1618975036, 93, -1), (534, 'jdk.internal.joptsimple.internal.OptionNameMap.put(java.lang.String,V)', 'O', '', 'true', 'false', 1618999394, 1618999394, 93, -1), (535, 'jdk.internal.joptsimple.internal.OptionNameMap.putAll(java.lang.Iterable<java.lang.String>,V)', 'O', '', 'true', 'false', 1618999418, 1618999418, 93, -1), (536, 'jdk.internal.joptsimple.internal.OptionNameMap.put(java.lang.String,V)', 'O', 'O', 'true', 'false', 1618999808, 1618999808, 93, -1), (537, 'java.io.ObjectInputStream.readObject()', 'O', '', 'all', 'true', 1619023678, 1619023678, 148, 1), (538, 'ognl.Ognl.getValue', 'P', '', 'false', 'true', 1619361277, 1619361277, 149, 1), (539, 'cn.huoxian.demo.Demo.longestPalindrome(java.lang.String)', 'R', 'O', 'false', 'false', 1619490996, 1619491788, 93, -1), (540, 'se.citerus.dddsample.Application.init()', 'O', 'O', 'false', 'false', 1619493026, 1619493026, 16, 0), (541, 'com.example.demo', 'P1,2,3', 'R', 'all', 'false', 1620640715, 1620698918, 155, 1), (542, 'com.example.testT', 'R', 'R', 'all', 'false', 1620640823, 1620640823, 155, 1), (543, 'com.example.testF', 'R', 'R', 'all', 'false', 1620640865, 1620640865, 155, 1), (544, 'com.example.testSink', 'R', '', 'all', 'true', 1620640900, 1620640900, 155, -1), (545, 'com.example.demoSource', 'O&R&P1', 'R', 'all', 'false', 1620641129, 1620698937, 155, 1), (546, 'org.apache.commons.lang3.StringEscapeUtils.escapeJava(java.lang.String)', 'P1', 'R', 'false', 'false', 1621475523, 1621475523, 18, 1), (547, 'org.apache.commons.lang3.StringEscapeUtils.escapeEcmaScript(java.lang.String)', 'P1', 'R', 'false', 'false', 1621476110, 1621476110, 18, 1), (548, 'org.apache.commons.lang3.StringEscapeUtils.escapeJson(java.lang.String)', 'P1', 'R', 'false', 'false', 1621476140, 1621476140, 18, 1), (549, 'org.apache.commons.lang3.StringEscapeUtils.unescapeJava(java.lang.String)', 'P1', 'R', 'false', 'false', 1621476206, 1621476206, 18, 1), (550, 'org.apache.commons.lang3.StringEscapeUtils.unescapeEcmaScript(java.lang.String)', 'P1', 'R', 'false', 'false', 1621476226, 1621476226, 18, 1), (551, 'org.apache.commons.lang3.StringEscapeUtils.unescapeJson(java.lang.String)', 'P1', 'R', 'false', 'false', 1621476246, 1621476246, 18, 1), (552, 'org.apache.commons.lang3.StringEscapeUtils.escapeHtml4(java.lang.String)', 'P1', 'R', 'false', 'false', 1621476378, 1621476378, 18, 1), (553, 'org.apache.commons.lang3.StringEscapeUtils.escapeHtml3(java.lang.String)', 'P1', 'R', 'false', 'false', 1621476395, 1621476395, 18, 1), (554, 'org.apache.commons.lang3.StringEscapeUtils.unescapeHtml4(java.lang.String)', 'P1', 'R', 'false', 'false', 1621476410, 1621476410, 18, 1), (555, 'org.apache.commons.lang3.StringEscapeUtils.unescapeHtml3(java.lang.String)', 'P1', 'R', 'false', 'false', 1621476422, 1621476422, 18, 1), (556, 'org.apache.commons.lang3.StringEscapeUtils.escapeXml(java.lang.String)', 'P1', 'R', 'false', 'false', 1621476436, 1621476436, 18, 1), (557, 'org.apache.commons.lang3.StringEscapeUtils.unescapeXml(java.lang.String)', 'P1', 'R', 'false', 'false', 1621476450, 1621476450, 18, 1), (558, 'org.apache.commons.lang3.StringEscapeUtils.escapeCsv(java.lang.String)', 'P1', 'R', 'false', 'false', 1621476474, 1621476474, 18, 1), (559, 'org.apache.commons.lang3.StringEscapeUtils.unescapeCsv(java.lang.String)', 'P1', 'R', 'false', 'false', 1621476486, 1621476486, 18, 1), (560, 'cn.rui0.httpbinController.eval()', 'P1', '', 'false', 'true', 1622021535, 1622021535, 245, 1), (562, 'javax.servlet.ServletRequest.getInputStream()', 'O', 'R', 'true', 'false', 1622522113, 1622522113, 1, 1), (563, 'javax.servlet.ServletRequest.getParameter(java.lang.String)', 'P1', 'R', 'true', 'false', 1622522239, 1622522239, 1, 1), (564, 'javax.servlet.ServletRequest.getParameterNames()', 'O', 'R', 'true', 'false', 1622522255, 1622522255, 1, 1), (565, 'javax.servlet.ServletRequest.getParameterValues(java.lang.String)', 'P1', 'R', 'true', 'false', 1622522275, 1622522275, 1, 1), (566, 'javax.servlet.ServletRequest.getParameterMap()', 'O', 'R', 'true', 'false', 1622522288, 1622522288, 1, 1), (567, 'javax.servlet.ServletRequest.getReader()', 'O', 'R', 'true', 'false', 1622522303, 1622522303, 1, 1), (568, 'javax.servlet.http.HttpServletRequest.getHeader(java.lang.String)', 'P1', 'R', 'true', 'false', 1622524240, 1622524240, 1, 1), (569, 'javax.servlet.http.HttpServletRequest.getHeaderNames()', 'O', 'R', 'true', 'false', 1622524294, 1622524294, 1, 1), (570, 'javax.servlet.http.HttpServletRequest.getParts()', 'O', 'R', 'true', 'false', 1622524335, 1622524335, 1, 1), (571, 'javax.servlet.http.HttpServletRequest.getPart(java.lang.String)', 'P1', 'R', 'true', 'false', 1622524349, 1622524349, 1, 1), (572, 'org.springframework.web.method.support.HandlerMethodArgumentResolver.resolveArgument(org.springframework.core.MethodParameter,org.springframework.web.method.support.ModelAndViewContainer,org.springframework.web.context.request.NativeWebRequest,org.springframework.web.bind.support.WebDataBinderFactory)', 'P1', 'R', 'true', 'false', 1622524675, 1622524675, 1, 1), (573, 'javax.servlet.http.HttpServletRequest.getCookies()', 'O', 'R', 'true', 'false', 1622528104, 1622528104, 1, 1), (574, 'javax.servlet.http.HttpServletRequest.getHeaders(java.lang.String)', 'P1', 'R', 'true', 'false', 1622528147, 1622528147, 1, 1), (575, 'javax.servlet.http.HttpServletRequest.getQueryString()', 'O', 'R', 'true', 'false', 1622528180, 1622528180, 1, 1), (576, 'se.citerus.dddsample.Application.init()', 'O', 'O', 'false', 'false', 1623331973, 1623331973, 93, -1), (577, 'se.citerus.dddsample.Application.init()', 'O', 'O', 'false', 'false', 1623332404, 1623332404, 93, -1), (578, 'com.example.demo.util.FileUtils.setHeader(java.lang.String,java.lang.String)', 'P2', '', 'false', 'true', 1623811699, 1623811847, 176, -1), (579, 'com.gaoxin.controller.passport.PassportController.execLogin(javax.servlet.http.HttpServletRequest,com.xinhai.security.controller.LoginCommand)', 'O', '', 'false', 'true', 1623820283, 1623820283, 150, 1), (580, 'com.gaoxin.controller.passport.PassportController.login(javax.servlet.http.HttpServletRequest,com.alibaba.fastjson.JSONObject)', 'P1&R', 'P2', 'false', 'false', 1623820390, 1623820390, 150, -1), (581, 'com.gaoxin.controller.passport.PassportController.login(javax.servlet.http.HttpServletRequest,com.alibaba.fastjson.JSONObject)', 'P1&P2', 'P1', 'false', 'false', 1623820531, 1623820531, 150, 1), (582, 'org.joychou.controller.SQLI.jdbc_sqli_vul(java.lang.String)', 'O', '', 'false', 'true', 1623830390, 1623830390, 211, 1), (583, 'org.joychou.controller.SQLI.jdbc_sqli_vul(java.lang.String)', 'O', '', 'false', 'true', 1623830487, 1623830487, 211, 1), (584, 'javax.servlet.http.HttpServletRequest.getInputStream()', 'O', 'R', 'true', 'false', 1624450208, 1624450208, 1, 1), (585, 'javax.servlet.http.HttpServletRequest.getParameter(java.lang.String)', 'P1', 'R', 'true', 'false', 1624450230, 1624450230, 1, 1), (586, 'javax.servlet.http.HttpServletRequest.getParameterNames()', 'O', 'R', 'true', 'false', 1624450243, 1624450243, 1, 1), (587, 'javax.servlet.http.HttpServletRequest.getParameterValues(java.lang.String)', 'P1', 'R', 'true', 'false', 1624450258, 1624450258, 1, 1), (588, 'javax.servlet.http.HttpServletRequest.getParameterMap()', 'O', 'R', 'true', 'false', 1624450274, 1624450274, 1, 1), (589, 'javax.servlet.http.HttpServletRequest.getReader()', 'O', 'R', 'true', 'false', 1624450293, 1624450293, 1, 1), (590, 'java.io.ObjectInput.readObject()', 'O', '', 'true', 'true', 1626095674, 1626095674, 449, 1), (591, 'java.lang.string', 'R', 'O', 'false', 'false', 1626693921, 1626693921, 33, -1), (592, 'django.utils.datastructures.get(str)', 'P1', 'R', 'all', 'false', 1627830391, 1627830391, 93, -1), (593, 'django.utils.datastructures.get(str)', 'P1', 'R', 'all', 'false', 1627974709, 1627974709, 445, 1), (594, 'io.open(str)', 'P1', '', 'false', 'true', 1627974905, 1627974905, 445, 1), (595, 'com.ruoyi.RuoYiApplication.main(java.lang.String[])', 'O', 'O', 'false', 'false', 1628153819, 1628153819, 489, 1), (596, 'com.cloudgx.guangxi.common.utils.html.EscapeUtil.encode(java.lang.String)', 'O', 'R', 'false', 'false', 1628266030, 1628266030, 541, 1), (597, 'com.ruoyi.RuoYiApplication.main(String[])', 'O', 'O', 'false', 'false', 1628497913, 1628497913, 560, 1), (598, 'com.ruoyi.RuoYiApplication.main(java.lang.String[])', 'O', 'O', 'false', 'false', 1628562391, 1628562391, 489, 1), (599, '<no package!>.<no class name!>.printName()', 'O', 'R', 'false', 'false', 1628693326, 1628693326, 570, 1), (600, 'com.xxl.job.admin.XxlJobAdminApplication.main(java.lang.String[])', 'O', 'O', 'all', 'false', 1628757914, 1628757914, 435, 1), (601, 'com.xxl.job.admin.XxlJobAdminApplication.main(java.lang.String[])', 'O', 'O', 'false', 'false', 1628759743, 1628759743, 435, 1), (602, 'java.lang', 'O', 'R', 'all', 'false', 1629373804, 1629373804, 559, -1), (603, 'io.open(str)', 'P1', '', 'false', 'true', 1629799656, 1629799656, 601, 1), (604, 'org.joychou.controller.SSRF.URLConnectionSec(java.lang.String)', 'R', 'O', 'true', 'false', 1630170377, 1630170377, 622, -1), (605, 'com.example.demo.controller.DemoController10.qaaq(java.lang.String,java.lang.String,java.lang.String)', 'O', 'O', 'all', 'false', 1630662651, 1630662651, 673, 1), (606, '<script>alert(/XSS/)</script>', 'P', 'R', 'false', 'false', 1630851622, 1630851622, 689, -1), (607, 'java.io.ObjectInput.readObject()', 'O', 'O', 'true', 'false', 1630854052, 1630854162, 689, -1), (608, 'org.iast.springsec.common.DataManager.doManage(java.lang.String)', 'P1', 'R', 'false', 'false', 1630873608, 1630873608, 442, 1), (609, 'javax.crypto.Cipher.doFinal(byte[])', 'P1', 'R', 'all', 'false', 1630874643, 1630874643, 442, 1), (610, 'com.ruoyi.RuoYiApplication.main(java.lang.String[])', 'O', 'O', 'false', 'false', 1630902957, 1630902957, 105, 0), (611, '123', 'O', 'O', 'false', 'false', 1630905260, 1630905376, 724, -1), (612, '.Iast.testIast(java.lang.String)', 'P', 'O', 'false', 'false', 1630909579, 1630909579, 673, 1), (613, '.Iast.t(int)', 'P参数编号', '', 'false', 'true', 1630909609, 1630909609, 673, 1), (614, '.Iast.t(int)', 'P1', '', 'false', 'true', 1630909613, 1630909613, 673, 1), (615, '.Iast.t(int)', 'P0', '', 'false', 'true', 1630909616, 1630909616, 673, 1), (616, '.Iast.t(int)', 'P0', '', 'false', 'true', 1630909616, 1630909616, 673, 1), (617, '.Iast.t(int)', 'P0', '', 'false', 'true', 1630909622, 1630909622, 673, 1), (618, '.Iast.t(int)', 'P0', '', 'false', 'true', 1630909622, 1630909622, 673, 1), (619, '.Iast.t(int)', 'P0', '', 'false', 'true', 1630909623, 1630909623, 673, 1), (620, '.Iast.t(int)', 'P0', '', 'false', 'true', 1630909623, 1630909623, 673, 1), (621, '.Iast.t(int)', 'P0', '', 'false', 'true', 1630909633, 1630909633, 673, 1), (622, 'FF', 'O', 'R', 'false', 'false', 1630911303, 1630911303, 105, -1), (623, 'FF', 'O', 'R', 'false', 'false', 1630911304, 1630911304, 105, -1), (624, 'FF', 'O', 'R', 'false', 'false', 1630911304, 1630911304, 105, -1), (625, 'FF', 'O', 'R', 'false', 'false', 1630911305, 1630911305, 105, -1), (626, '.Iast.testIast(java.lang.String)', 'O', 'R', 'false', 'false', 1630918816, 1630918816, 673, 1), (627, 'com.unisguard.common.utils.file.FileUploadUtils.upload(java.lang.String,org.springframework.web.multipart.MultipartFile,java.lang.String[])', 'P参数编号', 'O', 'all', 'false', 1631262110, 1631262110, 277, 1), (628, 'org.iast.springsec.common.DataManager.doManage(java.lang.String)', 'P1', 'R', 'false', 'false', 1632667104, 1632758980, 1, 1), (629, '123', 'O', 'O', 'false', 'false', 1632813369, 1632813369, 105, 0), (630, 'com.neusoft.po.Item.getName()', 'O', 'R', 'false', 'false', 1632832670, 1632832670, 442, 1), (631, 'com.neusoft.po.Item.getPrice()', 'O', 'R', 'false', 'false', 1632832697, 1632832697, 442, 1), (632, 'com.neusoft.po.Item.getUrl1()', 'O', 'R', 'false', 'false', 1632832733, 1632832733, 442, 1), (633, 'com.neusoft.po.Item.getUrl2()', 'O', 'R', 'false', 'false', 1632832753, 1632832762, 442, 1), (634, 'com.neusoft.po.Item.getUrl3()', 'O', 'R', 'false', 'false', 1632833688, 1632833688, 442, 1), (635, 'com.neusoft.po.Item.getUrl4()', 'O', 'R', 'false', 'false', 1632833707, 1632833707, 442, 1), (636, 'com.neusoft.po.Item.getUrl5()', 'O', 'R', 'false', 'false', 1632833729, 1632833729, 442, 1), (637, 'com.neusoft.po.Item.getMs()', 'O', 'R', 'false', 'false', 1632833751, 1632833751, 442, 1), (638, 'com.neusoft.po.Item.getPam1()', 'O', 'R', 'false', 'false', 1632833771, 1632833771, 442, 1), (639, 'com.neusoft.po.Item.getPam2()', 'O', 'R', 'false', 'false', 1632833788, 1632833788, 442, 1), (640, 'com.neusoft.po.Item.getPam3()', 'O', 'R', 'false', 'false', 1632833805, 1632833805, 442, 1), (641, 'com.neusoft.po.Item.getVal3()', 'O', 'R', 'false', 'false', 1632833826, 1632833826, 442, 1), (642, 'com.neusoft.po.Item.getVal2()', 'O', 'R', 'false', 'false', 1632833845, 1632833845, 442, 1), (643, 'com.neusoft.po.Item.getVal1()', 'O', 'R', 'false', 'false', 1632833865, 1632833865, 442, 1), (644, 'com.neusoft.po.User.getUserName()', 'O', 'R', 'false', 'false', 1632834715, 1632834715, 442, 1), (645, 'com.neusoft.po.User.getPassWord()', 'O', 'R', 'false', 'false', 1632834733, 1632834733, 442, 1), (646, 'com.neusoft.po.User.getPhone()', 'O', 'R', 'false', 'false', 1632834750, 1632834750, 442, 1), (647, 'com.neusoft.po.User.getRealName()', 'O', 'R', 'false', 'false', 1632834769, 1632834769, 442, 1), (648, 'com.neusoft.po.User.getSex()', 'O', 'R', 'false', 'false', 1632834788, 1632834788, 442, 1), (649, 'com.neusoft.po.User.getAddress()', 'O', 'R', 'false', 'false', 1632834807, 1632834807, 442, 1), (650, 'com.neusoft.po.User.getEmail()', 'O', 'R', 'false', 'false', 1632834826, 1632834826, 442, 1), (651, 'com.neusoft.po.Car.getTotal()', 'O', 'R', 'false', 'false', 1632834998, 1632834998, 442, 1), (652, 'com.neusoft.po.Address.getName()', 'O', 'R', 'false', 'false', 1632835124, 1632835124, 442, 1), (653, 'com.neusoft.po.Address.getPhone()', 'O', 'R', 'false', 'false', 1632835144, 1632835144, 442, 1), (654, 'com.neusoft.po.Address.getArea()', 'O', 'R', 'false', 'false', 1632835167, 1632835167, 442, 1), (655, 'com.neusoft.po.Address.getBm()', 'O', 'R', 'false', 'false', 1632835184, 1632835184, 442, 1), (656, 'com.neusoft.po.Comment.getContent()', 'O', 'R', 'false', 'false', 1632835237, 1632835237, 442, 1), (657, 'com.neusoft.po.ItemCategory.getName()', 'O', 'R', 'false', 'false', 1632835265, 1632835265, 442, 1), (658, 'com.neusoft.po.ItemOrder.getCode()', 'O', 'R', 'false', 'false', 1632835312, 1632835312, 442, 1), (659, 'com.neusoft.po.ItemOrder.getTotal()', 'O', 'R', 'false', 'false', 1632835338, 1632835338, 442, 1), (660, 'com.neusoft.po.ItemOrder.getRefundWay()', 'O', 'R', 'false', 'false', 1632835360, 1632835360, 442, 1), (661, 'com.neusoft.po.ItemOrder.getContent()', 'O', 'R', 'false', 'false', 1632835377, 1632835377, 442, 1), (662, 'com.neusoft.po.ItemOrder.getRemark()', 'O', 'R', 'false', 'false', 1632835393, 1632835393, 442, 1), (663, 'com.neusoft.po.Manage.getUserName()', 'O', 'R', 'false', 'false', 1632835425, 1632835425, 442, 1), (664, 'com.neusoft.po.Manage.getPassWord()', 'O', 'R', 'false', 'false', 1632835440, 1632835440, 442, 1), (665, 'com.neusoft.po.Manage.getRealName()', 'O', 'R', 'false', 'false', 1632835457, 1632835457, 442, 1), (666, 'com.neusoft.po.OrderDetail.getTotal()', 'O', 'R', 'false', 'false', 1632835496, 1632835496, 442, 1), (667, 'org.springframework.web.multipart.MultipartFile.getOriginalFilename()', 'O', 'R', 'true', 'false', 1632836297, 1632837711, 442, 1), (668, 'org.springframework.web.multipart.MultipartFile.getName()', 'O', 'R', 'true', 'false', 1632837730, 1632837730, 442, 1), (669, 'org.apache.commons.fileupload.FileItem.write(java.io.File)', 'P1', '', 'true', 'true', 1632838789, 1632845616, 442, 1), (670, 'org.apache.commons.fileupload.FileItem.getName()', 'O', 'R', 'true', 'false', 1632845498, 1632845498, 442, 1), (671, 'org.apache.commons.fileupload.FileItem.write(java.io.File)', 'P1', '', 'true', 'true', 1633666061, 1633666061, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for iast_hook_strategy_type
-- ----------------------------
DROP TABLE IF EXISTS `iast_hook_strategy_type`;
CREATE TABLE `iast_hook_strategy_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `hookstrategy_id` int(11) NULL DEFAULT NULL COMMENT '策略ID',
  `hooktype_id` int(11) NULL DEFAULT NULL COMMENT '策略类型ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `hookstrategy_id`(`hookstrategy_id`, `hooktype_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1131 CHARACTER SET = utf8mb4 ;

-- ----------------------------
-- Records of iast_hook_strategy_type
-- ----------------------------
BEGIN;
INSERT INTO `iast_hook_strategy_type` VALUES (1, 1, 13), (2, 2, 13), (3, 3, 13), (4, 4, 1), (5, 5, 1), (6, 6, 1), (7, 7, 1), (8, 8, 1), (9, 9, 1), (10, 10, 1), (11, 11, 1), (12, 12, 1), (13, 13, 1), (14, 14, 1), (15, 15, 1), (16, 16, 1), (17, 17, 1), (18, 18, 1), (19, 19, 1), (20, 20, 1), (21, 21, 1), (22, 22, 1), (23, 23, 1), (24, 24, 1), (25, 25, 1), (26, 26, 1), (27, 27, 1), (28, 28, 1), (29, 29, 2), (30, 30, 2), (31, 31, 2), (32, 32, 2), (33, 33, 2), (34, 34, 2), (35, 35, 2), (36, 36, 2), (37, 37, 2), (38, 38, 2), (39, 39, 3), (40, 40, 3), (41, 41, 3), (42, 42, 3), (43, 43, 3), (44, 44, 3), (45, 45, 3), (46, 46, 3), (47, 47, 3), (48, 48, 3), (49, 49, 4), (50, 50, 4), (51, 51, 4), (52, 52, 4), (53, 53, 4), (54, 54, 5), (55, 55, 14), (56, 56, 14), (57, 57, 14), (58, 58, 14), (59, 59, 14), (60, 60, 14), (61, 61, 14), (62, 62, 14), (63, 63, 14), (64, 64, 14), (65, 65, 14), (66, 66, 14), (68, 67, 14), (69, 68, 14), (70, 69, 14), (71, 70, 14), (72, 71, 14), (73, 72, 14), (74, 73, 14), (75, 74, 14), (76, 75, 14), (77, 76, 14), (78, 77, 14), (79, 78, 14), (80, 79, 14), (81, 80, 14), (82, 81, 15), (83, 82, 15), (84, 83, 15), (85, 84, 15), (86, 85, 15), (87, 86, 16), (88, 87, 16), (89, 88, 16), (90, 89, 16), (91, 90, 16), (92, 91, 17), (93, 92, 18), (94, 93, 18), (95, 94, 19), (96, 95, 19), (97, 96, 20), (98, 97, 20), (99, 98, 20), (100, 99, 20), (101, 100, 21), (102, 101, 21), (103, 102, 21), (104, 103, 21), (105, 104, 21), (106, 105, 21), (107, 106, 21), (108, 107, 21), (109, 108, 21), (110, 109, 21), (111, 110, 21), (112, 111, 22), (113, 112, 22), (114, 113, 22), (115, 114, 22), (116, 115, 22), (117, 116, 22), (118, 117, 22), (119, 118, 22), (120, 119, 22), (121, 120, 22), (122, 121, 22), (123, 122, 22), (124, 123, 22), (125, 124, 23), (126, 125, 24), (127, 126, 24), (128, 127, 25), (129, 128, 25), (130, 129, 25), (131, 130, 25), (132, 131, 25), (133, 132, 25), (134, 133, 25), (135, 134, 25), (136, 135, 25), (137, 136, 25), (138, 137, 25), (139, 138, 25), (140, 139, 25), (141, 140, 25), (142, 141, 25), (143, 142, 25), (144, 143, 25), (145, 144, 25), (146, 145, 25), (147, 146, 25), (148, 147, 26), (149, 148, 26), (150, 149, 26), (151, 150, 26), (152, 151, 26), (153, 152, 26), (154, 153, 26), (155, 154, 26), (156, 155, 26), (157, 156, 27), (158, 157, 27), (159, 158, 27), (160, 159, 27), (161, 160, 28), (162, 161, 28), (163, 162, 29), (164, 163, 29), (165, 164, 29), (166, 165, 29), (167, 166, 30), (168, 167, 30), (169, 168, 30), (170, 169, 30), (171, 170, 31), (172, 171, 31), (173, 172, 31), (174, 173, 31), (175, 174, 32), (176, 175, 32), (177, 176, 33), (178, 177, 33), (179, 178, 33), (180, 179, 33), (181, 180, 33), (182, 181, 34), (183, 182, 35), (184, 183, 35), (185, 184, 35), (186, 185, 36), (187, 186, 37), (188, 187, 37), (189, 188, 37), (190, 189, 37), (191, 190, 37), (192, 191, 37), (193, 192, 37), (194, 193, 37), (195, 194, 37), (196, 195, 37), (197, 196, 37), (198, 197, 38), (199, 198, 38), (200, 199, 38), (201, 200, 38), (202, 201, 38), (203, 202, 38), (204, 203, 38), (205, 204, 38), (206, 205, 38), (207, 206, 38), (208, 207, 39), (209, 208, 39), (210, 209, 39), (211, 210, 39), (212, 211, 40), (213, 212, 40), (214, 213, 40), (215, 214, 40), (216, 215, 40), (217, 216, 40), (218, 217, 40), (219, 218, 40), (220, 219, 41), (221, 220, 41), (222, 221, 41), (223, 222, 41), (224, 223, 41), (225, 224, 41), (226, 225, 41), (227, 226, 41), (228, 227, 41), (229, 228, 41), (230, 229, 41), (231, 230, 41), (232, 231, 41), (233, 232, 41), (234, 233, 41), (235, 234, 41), (236, 235, 41), (237, 236, 41), (238, 237, 41), (239, 238, 42), (240, 239, 42), (241, 240, 42), (242, 241, 42), (243, 242, 42), (244, 243, 42), (245, 244, 43), (246, 245, 43), (247, 246, 43), (248, 247, 43), (249, 248, 43), (250, 249, 43), (251, 250, 43), (252, 251, 43), (253, 252, 43), (254, 253, 43), (255, 254, 43), (256, 255, 43), (257, 256, 43), (258, 257, 43), (259, 258, 43), (260, 259, 43), (261, 260, 43), (262, 261, 43), (263, 262, 43), (264, 263, 43), (265, 264, 43), (266, 265, 43), (267, 266, 44), (268, 267, 44), (269, 268, 44), (270, 269, 44), (271, 270, 44), (272, 271, 44), (273, 272, 44), (274, 273, 45), (275, 274, 45), (276, 275, 45), (277, 276, 45), (278, 277, 45), (279, 278, 45), (280, 279, 45), (281, 280, 45), (282, 281, 45), (283, 282, 45), (284, 283, 45), (285, 284, 45), (286, 285, 45), (287, 286, 45), (288, 287, 46), (289, 288, 46), (290, 289, 46), (291, 290, 47), (292, 291, 47), (293, 292, 47), (294, 293, 48), (295, 294, 48), (296, 295, 48), (297, 296, 48), (298, 297, 49), (299, 298, 49), (300, 299, 49), (301, 300, 49), (302, 301, 49), (303, 302, 50), (304, 303, 50), (305, 304, 50), (306, 305, 50), (307, 306, 50), (308, 307, 50), (309, 308, 50), (310, 309, 50), (311, 310, 50), (312, 311, 50), (313, 312, 50), (314, 313, 50), (315, 314, 50), (316, 315, 50), (317, 316, 50), (318, 317, 50), (319, 318, 50), (320, 319, 50), (321, 320, 50), (322, 321, 50), (323, 322, 50), (324, 323, 50), (325, 324, 50), (326, 325, 50), (327, 326, 50), (328, 327, 50), (329, 328, 50), (330, 329, 50), (331, 330, 50), (332, 331, 50), (333, 332, 50), (334, 333, 50), (335, 334, 50), (336, 335, 50), (337, 336, 50), (338, 337, 50), (339, 338, 50), (340, 339, 50), (341, 340, 51), (342, 341, 51), (343, 342, 51), (344, 343, 51), (345, 344, 51), (346, 345, 51), (347, 346, 51), (348, 347, 51), (349, 348, 51), (350, 349, 51), (351, 350, 51), (352, 351, 51), (353, 352, 51), (354, 353, 51), (355, 354, 51), (356, 355, 51), (357, 356, 51), (358, 357, 51), (359, 358, 51), (360, 359, 51), (361, 360, 51), (362, 361, 51), (363, 362, 51), (364, 363, 51), (365, 364, 51), (366, 365, 51), (367, 366, 51), (368, 367, 51), (369, 368, 52), (370, 369, 52), (371, 370, 52), (372, 371, 52), (373, 372, 52), (374, 373, 52), (375, 374, 52), (376, 375, 52), (377, 376, 52), (378, 377, 52), (379, 378, 52), (380, 379, 52), (381, 380, 52), (382, 381, 52), (383, 382, 52), (384, 383, 52), (385, 384, 52), (386, 385, 52), (387, 386, 52), (388, 387, 52), (389, 388, 52), (390, 389, 52), (391, 390, 53), (392, 391, 53), (393, 392, 54), (394, 393, 54), (395, 394, 55), (396, 395, 55), (397, 396, 55), (398, 397, 55), (399, 398, 55), (400, 399, 55), (401, 400, 55), (402, 401, 55), (403, 402, 55), (404, 403, 55), (405, 404, 55), (406, 405, 55), (407, 406, 55), (408, 407, 55), (409, 408, 55), (410, 409, 56), (411, 410, 56), (412, 411, 56), (413, 412, 56), (414, 413, 56), (415, 414, 56), (416, 415, 56), (417, 416, 56), (418, 417, 56), (419, 418, 56), (420, 419, 56), (421, 420, 56), (422, 421, 56), (423, 422, 56), (424, 423, 56), (425, 424, 56), (426, 425, 56), (427, 426, 56), (428, 427, 56), (429, 428, 57), (430, 429, 58), (431, 430, 59), (432, 431, 59), (433, 432, 60), (434, 433, 60), (435, 434, 60), (436, 435, 60), (437, 436, 60), (438, 437, 60), (439, 438, 60), (440, 439, 61), (441, 440, 61), (442, 441, 61), (443, 442, 62), (444, 443, 63), (906, 444, 64), (907, 445, 64), (908, 446, 64), (909, 447, 64), (910, 448, 64), (911, 449, 64), (912, 450, 64), (913, 451, 64), (914, 452, 64), (915, 453, 64), (916, 454, 64), (917, 455, 64), (918, 456, 64), (919, 457, 64), (920, 458, 64), (921, 459, 64), (922, 460, 64), (923, 461, 64), (924, 462, 64), (925, 463, 64), (926, 464, 64), (927, 465, 64), (928, 466, 64), (929, 467, 64), (930, 468, 64), (931, 469, 64), (932, 470, 64), (933, 471, 64), (934, 472, 64), (935, 473, 64), (936, 474, 65), (937, 475, 65), (938, 476, 65), (939, 477, 65), (940, 478, 65), (941, 479, 65), (942, 480, 65), (943, 481, 66), (944, 482, 66), (945, 483, 66), (946, 484, 66), (947, 485, 66), (948, 486, 66), (951, 487, 67), (952, 488, 68), (953, 493, 69), (954, 495, 71), (955, 496, 71), (956, 497, 71), (957, 498, 71), (961, 502, 76), (966, 507, 81), (967, 508, 81), (968, 509, 33), (969, 510, 33), (970, 511, 33), (971, 512, 87), (972, 513, 88), (973, 514, 1), (974, 515, 1), (975, 516, 1), (976, 517, 2), (977, 518, 1), (978, 519, 1), (979, 520, 5), (980, 521, 67), (981, 522, 67), (982, 523, 76), (983, 524, 66), (984, 525, 66), (985, 526, 76), (986, 527, 37), (987, 528, 2), (988, 529, 38), (989, 530, 76), (990, 531, 76), (991, 532, 76), (992, 533, 76), (993, 534, 67), (994, 535, 76), (995, 536, 67), (996, 537, 55), (997, 538, 52), (998, 539, 76), (999, 540, 76), (1000, 541, 95), (1001, 542, 97), (1002, 543, 98), (1003, 544, 99), (1004, 545, 95), (1005, 546, 101), (1006, 547, 101), (1007, 548, 101), (1008, 549, 101), (1009, 550, 101), (1010, 551, 101), (1011, 552, 101), (1012, 553, 101), (1013, 554, 101), (1014, 555, 101), (1015, 556, 101), (1016, 557, 101), (1017, 558, 101), (1018, 559, 101), (1019, 560, 38), (1020, 561, 102), (1021, 562, 102), (1022, 563, 102), (1023, 564, 102), (1024, 565, 102), (1025, 566, 102), (1026, 567, 102), (1027, 568, 103), (1028, 569, 103), (1029, 570, 103), (1030, 571, 103), (1031, 572, 104), (1032, 573, 103), (1033, 574, 103), (1034, 575, 103), (1035, 576, 67), (1036, 577, 104), (1037, 578, 61), (1038, 579, 55), (1039, 580, 17), (1040, 581, 16), (1041, 582, 41), (1042, 583, 41), (1043, 584, 103), (1044, 585, 103), (1045, 586, 103), (1046, 587, 103), (1047, 588, 103), (1048, 589, 103), (1049, 590, 55), (1050, 591, 103), (1051, 592, 110), (1052, 593, 112), (1053, 594, 44), (1054, 595, 104), (1055, 596, 104), (1056, 597, 76), (1057, 598, 104), (1058, 599, 102), (1059, 600, 104), (1060, 601, 104), (1061, 602, 76), (1062, 603, 44), (1063, 604, 104), (1064, 605, 104), (1065, 606, 114), (1066, 607, 115), (1067, 608, 117), (1068, 609, 117), (1069, 610, 104), (1070, 611, 76), (1071, 612, 15), (1072, 613, 38), (1073, 614, 38), (1074, 615, 38), (1075, 616, 38), (1076, 617, 38), (1077, 618, 38), (1078, 619, 38), (1079, 620, 38), (1080, 621, 48), (1081, 622, 1), (1082, 623, 1), (1083, 624, 1), (1084, 625, 1), (1085, 626, 67), (1086, 627, 104), (1087, 628, 127), (1088, 629, 102), (1089, 630, 128), (1090, 631, 128), (1091, 632, 128), (1092, 633, 128), (1093, 634, 128), (1094, 635, 128), (1095, 636, 128), (1096, 637, 128), (1097, 638, 128), (1098, 639, 128), (1099, 640, 128), (1100, 641, 128), (1101, 642, 128), (1102, 643, 128), (1103, 644, 128), (1104, 645, 128), (1105, 646, 128), (1106, 647, 128), (1107, 648, 128), (1108, 649, 128), (1109, 650, 128), (1110, 651, 128), (1111, 652, 128), (1112, 653, 128), (1113, 654, 128), (1114, 655, 128), (1115, 656, 128), (1116, 657, 128), (1117, 658, 128), (1118, 659, 128), (1119, 660, 128), (1120, 661, 128), (1121, 662, 128), (1122, 663, 128), (1123, 664, 128), (1124, 665, 128), (1125, 666, 128), (1126, 667, 129), (1127, 668, 129), (1128, 669, 130), (1129, 670, 129), (1130, 671, 131);
COMMIT;

-- ----------------------------
-- Table structure for iast_hook_type
-- ----------------------------
DROP TABLE IF EXISTS `iast_hook_type`;
CREATE TABLE `iast_hook_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NULL DEFAULT NULL COMMENT '策略总类型，1-source节点、2-propagator节点、3-filter节点、4-sink节点',
  `name` varchar(255)  NULL DEFAULT NULL COMMENT '策略类型名称',
  `value` varchar(255)  NULL DEFAULT NULL COMMENT '策略类型值',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `created_by` int(11) NULL DEFAULT NULL COMMENT '创建者',
  `enable` tinyint(1) NULL DEFAULT NULL COMMENT '状态：1-启用；0-禁用',
  `name_en` varchar(255)  NULL DEFAULT NULL,
  `name_zh` varchar(255)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 132 CHARACTER SET = utf8mb4 ;

-- ----------------------------
-- Records of iast_hook_type
-- ----------------------------
BEGIN;
INSERT INTO `iast_hook_type` VALUES (1, 1, '字符串传播-01', 'String', 1610535130, 1610535130, 1, 1, 'Propagator:String', '字符串传播-01'), (2, 1, '字符串传播-02', 'StringBuilder', 1610535130, 1610535130, 1, 1, 'Propagator:StringBuilder', '字符串传播-02'), (3, 1, 'List类型传播', 'List', 1610535130, 1610535130, 1, 1, 'Propagator:List', 'List类型传播'), (4, 1, 'Map类型传播', 'Map', 1610535130, 1610535130, 1, 1, 'Propagator:Map', 'Map类型传播'), (5, 1, '枚举类型传播', 'Enumeration', 1610535130, 1610535130, 1, 1, 'Propagator:Enumeration', '枚举类型传播'), (13, 5, 'HttpRequest源处理', 'HttpRequest', 1610535127, 1610535127, 1, 1, 'Http Request', 'HttpRequest源处理'), (14, 1, 'IO传播', 'io', 1610535130, 1610535130, 1, 1, 'Propagator:IO', 'IO传播'), (15, 1, 'URI传播', 'URI', 1610535130, 1610535130, 1, 1, 'Propagator:Uri', 'URI传播'), (16, 1, 'URL类型传播', 'URL', 1610535130, 1610535130, 1, 1, 'Propagator:Url', 'URL类型传播'), (17, 1, 'URLDecoder传播', 'URLDecoder', 1610535130, 1610535130, 1, 1, 'Propagator:Url Decoder', 'URLDecoder传播'), (18, 1, 'RequestFacade传播', 'RequestFacade', 1610535130, 1610535130, 1, 1, 'Propagator:Request', 'RequestFacade传播'), (19, 1, 'Cookie传播', 'Cookie', 1610535130, 1610535130, 1, 1, 'Propagator:Cookie', 'Cookie传播'), (20, 1, 'ProcessBuilder传播', 'ProcessBuilder', 1610535130, 1610535130, 1, 1, 'Propagator:ProcessBuilder', 'ProcessBuilder传播'), (21, 1, 'BASE64解码', 'base64-dec', 1610535130, 1610535130, 1, 1, 'Propagator:Base64 Decode', 'BASE64解码'), (22, 1, 'BASE64编码', 'base64-enc', 1610535131, 1610535131, 1, 1, 'Propagator:Base64 Encode', 'BASE64编码'), (23, 1, 'OWASP-Esapi传播', 'owasp-esapi', 1610535131, 1610535131, 1, 1, 'Propagator:OWASP-Esapi', 'OWASP-Esapi传播'), (24, 1, 'Apache过滤方法', 'apache-filter', 1610535131, 1610535131, 1, 1, 'Propagator:Apache Filter', 'Apache过滤方法'), (25, 1, 'Javax传播', 'javax', 1610535131, 1610535131, 1, 1, 'Propagator:For XXE', 'Javax传播'), (26, 1, 'Xml.Sax传播', 'xml.sax', 1610535131, 1610535131, 1, 1, 'Propagator:For XXE', 'Xml.Sax传播'), (27, 1, 'Spring传播', 'spring', 1610535131, 1610535131, 1, 1, 'Propagator: Spring', 'Spring传播'), (28, 1, 'httpclient传播', 'httpclient', 1610535131, 1610535131, 1, 1, 'Propagator:HttpClient', 'httpclient传播'), (29, 1, 'httpclient5传播', 'httpclient5', 1610535131, 1610535131, 1, 1, 'Propagator:HttpClient5', 'httpclient5传播'), (30, 1, 'okhttp传播', 'okhttp', 1610535131, 1610535131, 1, 1, 'Propagator:OkHttp', 'okhttp传播'), (31, 1, 'okhttp3传播', 'okhttp3', 1610535131, 1610535131, 1, 1, 'Propagator:okHttp3', 'okhttp3传播'), (32, 1, 'SPEL传播', 'spel', 1610535131, 1610535131, 1, 1, 'Propagator:SPEL', 'SPEL传播'), (33, 1, 'OGNL传播', 'ognl', 1610535131, 1610535131, 1, 1, 'Propagator:OGNL', 'OGNL传播'), (34, 1, 'Lambda表达式函数', 'lambda-function', 1610535131, 1610535131, 1, 1, 'Propagator:Lambda Function', 'Lambda表达式函数'), (35, 1, 'serverlt-stream传播', 'servelt-stream', 1610535131, 1610535131, 1, 1, 'Propagator:Serverlt-Stream', 'serverlt-stream传播'), (36, 1, 'JDBC传播', 'jdbc', 1610535131, 1610535131, 1, 1, 'Propagator:JDBC', 'JDBC传播'), (37, 4, 'SMTP注入', 'smtp-injection', 1610535131, 1610535131, 1, 1, 'SMTP Injection', 'SMTP注入'), (38, 4, '服务器端请求伪造', 'ssrf', 1610535131, 1610535131, 1, 1, 'Server-Side Request Forgery (SSRF)', '服务器端请求伪造'), (39, 4, '不安全的XMl Decode', 'unsafe-xml-decode', 1610535131, 1610535131, 1, 1, 'Unsafe XML Decoding', '不安全的XMl Decode'), (40, 4, '命令执行 ', 'cmd-injection', 1610535131, 1610535131, 1, 1, 'OS Command Injection', '命令执行 '), (41, 4, 'Sql注入', 'sql-injection', 1610535131, 1610535131, 1, 1, 'SQL Injection', 'Sql注入'), (42, 4, 'LDAP注入', 'ldap-injection', 1610535131, 1610535131, 1, 1, 'LDAP Injection', 'LDAP注入'), (43, 4, 'XPATH注入', 'xpath-injection', 1610535131, 1610535131, 1, 1, 'XPath Injection', 'XPATH注入'), (44, 4, '路径穿越', 'path-traversal', 1610535131, 1610535131, 1, 1, 'Path Traversal', '路径穿越'), (45, 4, '不安全的随机数', 'crypto-weak-randomness', 1610535131, 1610535131, 1, 1, 'Weak Random Number Generation', '不安全的随机数'), (46, 4, '不安全的hash算法', 'crypto-bad-mac', 1610535131, 1610535131, 1, 1, 'Insecure Hash Algorithms', '不安全的hash算法'), (47, 4, '不安全的加密算法', 'crypto-bad-ciphers', 1610535131, 1610535131, 1, 1, 'Insecure Encryption Algorithms', '不安全的加密算法'), (48, 4, 'Cookie-flag缺失', 'cookie-flags-missing', 1610535131, 1610535131, 1, 1, 'Application Disables \'\'secure\'\' Flag on Cookies', 'Cookie-flag缺失'), (49, 4, '信任边界', 'trust-boundary-violation', 1610535131, 1610535131, 1, 1, 'Trust Boundary Violation', '信任边界'), (50, 4, '反射型XSS', 'reflected-xss', 1610535131, 1610535131, 1, 1, 'Cross-Site Scripting', '反射型XSS'), (51, 4, 'XML外部实体注入', 'xxe', 1610535131, 1610535131, 1, 1, 'XML External Entity Injection (XXE)', 'XML外部实体注入'), (52, 4, '表达式注入', 'expression-language-injection', 1610535131, 1610535131, 1, 1, 'Expression Language Injection', '表达式注入'), (53, 4, '正则表达式Dos攻击', 'redos', 1610535131, 1610535131, 1, 1, 'Regular Expression DoS', '正则表达式Dos攻击'), (54, 4, '反射注入', 'reflection-injection', 1610535131, 1610535131, 1, 1, 'Reflection Injection', '反射注入'), (55, 4, '不安全的反序列化', 'unsafe-json-deserialize', 1610535131, 1610535131, 1, 1, 'Untrusted Deserialization', '不安全的反序列化'), (56, 4, 'Hql注入', 'hql-injection', 1610535131, 1610535131, 1, 1, 'Hibernate Injection', 'Hql注入'), (57, 4, 'NoSql注入', 'nosql-injection', 1610535131, 1610535131, 1, 1, 'NoSQL Injection', 'NoSql注入'), (58, 4, '不安全的readline', 'unsafe-readline', 1610535131, 1610535131, 1, 1, 'Use of readLine on Untrusted Streams', '不安全的readline'), (59, 4, '不安全的转发', 'unvalidated-forward', 1610535131, 1610535131, 1, 1, 'Arbitrary Server Side Forwards', '不安全的转发'), (60, 4, '不安全的重定向', 'unvalidated-redirect', 1610535131, 1610535131, 1, 1, 'Unvalidated Redirect', '不安全的重定向'), (61, 4, 'Header头注入', 'header-injection', 1610535131, 1610535131, 1, 1, 'Header Injection', 'Header头注入'), (62, 4, '动态库加载', 'dynamic-library-load', 1610535131, 1610535131, 1, 1, 'JNI Injection', '动态库加载'), (63, 4, 'SpringCloudConfigServer', 'spring-cloud-config-server', 1610535131, 1610535131, 1, 0, 'SpringCloudConfigServer', 'SpringCloudConfigServer'), (64, 4, 'SQL越权类型', 'sql-over-power', 1610535131, 1610535131, 1, 0, 'Over Power', 'SQL越权类型'), (65, 3, '反射型XSS过滤类型', 'reflected-xss-filter', 1610535131, 1610535131, 1, 0, 'Cross-Site Scripting Filter', '反射型XSS过滤类型'), (66, 3, 'XXE过滤类型', 'xxe-filter', 1610535131, 1610535131, 1, 1, 'XML External Entity Injection (XXE) Filter', 'XXE过滤类型'), (67, 1, 'Arrays辅助传播策略', 'Arrays', 1614601101, 1614601101, 1, 1, 'Propagator:Arrays', 'Arrays辅助传播策略'), (68, 1, 'Collection辅助传播识别策略', 'Collection', 1614601101, 1614601101, 1, 1, 'Propagator:Collection', 'Collection辅助传播识别策略'), (71, 1, 'Solr参数解析', 'SolrParamParser', 1616036563, 1616036563, 1, 1, 'Propagator:Apache Solr', 'Solr参数解析'), (74, 2, 'exp1', '表达式注入', 1616564094, 1616564094, 44, 0, 'exp1', 'exp1'), (75, 2, 'exp1', '表达式出入', 1616564123, 1616564123, 44, 0, 'exp1', 'exp1'), (76, 2, 'Struts2接口读取参数', 'Struts2', 1616579090, 1616579090, 1, 1, 'Source:Struts2 Param', 'Struts2接口读取参数'), (77, 2, '测试', '测试', 1618400904, 1618400904, 102, 0, '测试', '测试'), (78, 2, '测试', '测试', 1618400926, 1618400926, 102, 0, '测试', '测试'), (79, 2, 'Exp-01', 'Exploit', 1618472497, 1618472497, 72, 0, 'Exp-01', 'Exp-01'), (80, 4, 'Exploit-01', 'Exploit', 1618472531, 1618472531, 72, -1, 'Exploit-01', 'Exploit-01'), (81, 4, 'exp', '自定义危险方法', 1618472680, 1618472680, 72, -1, 'exp', 'exp'), (89, 2, 'test', 'test', 1618554457, 1618554457, 102, 0, 'test', 'test'), (90, 4, 'readObject01', 'ObjectInputStream', 1619024535, 1619024535, 148, -1, 'readObject01', 'readObject01'), (91, 4, '12', 'aaaa', 1619024581, 1619024581, 148, -1, '12', '12'), (92, 3, 'exec-cmd', 'Runtime', 1619404441, 1619404441, 168, 1, 'OS Command Injection Filter', 'exec-cmd'), (93, 4, 'exec', 'Runtime', 1619404459, 1619404459, 168, -1, 'exec', 'exec'), (94, 2, 'test', 'Custom', 1620640609, 1620640609, 155, 0, 'test', 'test'), (95, 2, 'test', 'customtest', 1620640632, 1620640632, 155, 0, 'test', 'test'), (96, 1, 'test1', 'com.demo.test', 1620640750, 1620640750, 155, 0, 'test1', 'test1'), (97, 1, 'test', 'customT', 1620640788, 1620640788, 155, 1, 'test', 'test'), (98, 3, 'test', 'customF', 1620640842, 1620640842, 155, 1, 'test', 'test'), (99, 4, 'test', 'customSink', 1620640877, 1620640877, 155, -1, 'test', 'test'), (100, 3, '路径穿越过滤方法', 'path-traversal-filter', 1620893202, 1620893202, 18, 1, '路径穿越过滤方法', '路径穿越过滤方法'), (101, 3, 'apache工具包过滤组件', 'Apache-Commons-Lang-Filter', 1621475489, 1621475489, 18, 1, 'apache工具包过滤组件', 'apache工具包过滤组件'), (102, 2, 'ServletRequest接口', 'javax.servlet.ServletRequest', 1622521929, 1622521929, 1, 1, 'Source:Servlet Request Interface', 'ServletRequest接口'), (103, 2, 'HttpServletRequest接口', 'javax.servlet.http.HttpServletRequest', 1622522441, 1622522441, 1, 1, 'Source:Http Servlet Request Interface', 'HttpServletRequest接口'), (104, 2, 'Spring参数处理接口', 'org.springframework.web.method.support.HandlerMethodArgumentResolver', 1622524533, 1622524533, 1, 1, 'Source:Spring', 'Spring参数处理接口'), (105, 4, 'test', 'test', 1626774479, 1626774479, 447, -1, 'test', 'test'), (106, 4, 'test123', 'test123', 1626774485, 1626774485, 447, -1, 'test123', 'test123'), (107, 4, '<script>alert(\"xss\");</script>', '<script>alert(\"xss\");</script>', 1626774523, 1626774523, 447, -1, '<script>alert(\"xss\");</script>', '<script>alert(\"xss\");</script>'), (108, 4, '<script>alert(\"xss\");</script>', '<p>testadsadasd</p>', 1626774680, 1626774680, 447, -1, '<script>alert(\"xss\");</script>', '<script>alert(\"xss\");</script>'), (109, 4, '<p>asdad</p>', '<p>asdad</p>', 1626774715, 1626774715, 447, -1, '<p>asdad</p>', '<p>asdad</p>'), (110, 2, 'py-get', 'python-任意文件读取', 1627830222, 1627830222, 93, 1, 'Source:py-get', 'py-get'), (111, 4, 'io.open(str)', 'python-任意文件读取', 1627831304, 1627831304, 93, 1, 'io.open(str)', 'io.open(str)'), (112, 2, 'python 获取传参', 'py-get', 1627974648, 1627974648, 445, 1, 'Source:python param', 'python 获取传参'), (113, 2, 'url', 'org.springframework.expression.Expression.getValue', 1628588745, 1628588745, 529, 1, 'Source:url', 'url'), (114, 2, '字符类01', 'string', 1630645789, 1630645789, 689, 1, NULL, '字符类01'), (115, 2, '01', '不安全的反序列化', 1630854032, 1630854032, 689, 1, NULL, '01'), (116, 2, '不安全的反序列化', 'java.io.ObjectInput.readObject()', 1630854089, 1630854089, 689, 1, NULL, '不安全的反序列化'), (117, 1, '加密算法', 'Propagation:Cipher', 1630873564, 1630873564, 442, 1, '加密算法', NULL), (118, 2, '\"><img src=1 onerror=alert(1)>', '\"><img src=1 onerror=alert(1)>', 1630905213, 1630905213, 724, 1, NULL, '\"><img src=1 onerror=alert(1)>'), (119, 1, 'DD', 'ff', 1630911294, 1630911294, 105, 1, NULL, 'DD'), (120, 1, 'DD', 'ff', 1630911295, 1630911295, 105, 1, NULL, 'DD'), (121, 1, 'DD', 'ff', 1630911296, 1630911296, 105, 1, NULL, 'DD'), (122, 1, 'DD', 'ff', 1630911296, 1630911296, 105, 1, NULL, 'DD'), (123, 4, 'vul-test-0906', 'vul-test-0906', 1630998630, 1630998630, 105, 1, NULL, 'vul-test-0906'), (124, 1, 'test', 'test', 1631590282, 1631590282, 768, 1, NULL, 'test'), (125, 1, '字符串111', 'String', 1631591376, 1631591376, 741, 1, NULL, '字符串111'), (126, 2, '测试自定义规则类型', '测试自定义规则类型名称', 1631591609, 1631591609, 54, 1, NULL, '测试自定义规则类型'), (127, 1, '自定义加密算法', 'custom-encrypt', 1632667036, 1632667036, 1, 1, NULL, '自定义加密算法'), (128, 1, '自定义传播', 'custom-pro', 1632832622, 1632832622, 442, 1, NULL, '自定义传播'), (129, 1, '文件上传', 'PartFile', 1632836255, 1632836255, 442, 1, NULL, '文件上传'), (130, 4, '文件上传', 'commons-fileupload', 1632838742, 1632838742, 442, 1, NULL, '文件上传'), (131, 4, '文件写入', 'FileWrite', 1633666003, 1633666003, 1, 1, NULL, '文件写入');
COMMIT;

-- ----------------------------
-- Table structure for iast_strategy
-- ----------------------------
DROP TABLE IF EXISTS `iast_strategy`;
CREATE TABLE `iast_strategy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `vul_type` varchar(255)  NULL DEFAULT NULL COMMENT '漏洞类型',
  `level_id` int(11) NULL DEFAULT NULL COMMENT '漏洞等级',
  `state` varchar(255)  NULL DEFAULT NULL COMMENT '策略状态，true-开启，false-关闭',
  `dt` int(11) NULL DEFAULT NULL COMMENT '策略变更时间',
  `vul_name` varchar(255)  NULL DEFAULT NULL COMMENT '漏洞名称（中文）',
  `vul_desc` text  NULL COMMENT '漏洞描述',
  `vul_fix` text  NULL COMMENT '修复建议',
  `hook_type_id` int(11) NULL DEFAULT NULL COMMENT 'hook策略类型ID',
  `vul_desc_en` longtext  NULL,
  `vul_desc_zh` longtext  NULL,
  `vul_fix_en` longtext  NULL,
  `vul_fix_zh` longtext  NULL,
  `vul_name_en` varchar(255)  NULL DEFAULT NULL,
  `vul_name_zh` varchar(255)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `level_id`(`level_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 ;

-- ----------------------------
-- Records of iast_strategy
-- ----------------------------
BEGIN;
INSERT INTO `iast_strategy` VALUES (1, 1, 'cmd-injection', 1, 'enable', 1, '命令执行', '命令执行漏洞是指由于Web应用程序对用户提交的数据过滤不严格，导致黑客可以通过构造特殊命令字符串的方式，将数据提交至Web应用程序中，并利用该方式执行外部程序或系统命令实施攻击，非法获取数据或者网络资源等。', NULL, 40, 'Verifies that no untrusted data is used in commands sent to the operating system.	', '命令执行漏洞是指由于Web应用程序对用户提交的数据过滤不严格，导致黑客可以通过构造特殊命令字符串的方式，将数据提交至Web应用程序中，并利用该方式执行外部程序或系统命令实施攻击，非法获取数据或者网络资源等。', NULL, NULL, '命令执行', '命令执行'), (2, 1, 'smtp-injection', 1, 'enable', 1, 'SMTP注入', '攻击者利用IMAP / SMTP服务器上输入验证的弱点在服务器上执行命令。Web邮件服务器通常位于Internet与IMAP或SMTP邮件服务器之间。Web邮件服务器接收到用户请求，然后Web邮件服务器向后端邮件服务器查询所请求的信息，并将此响应返回给用户。在IMAP / SMTP命令注入攻击中，邮件服务器命令嵌入在发送到Web邮件服务器的部分请求中。如果Web邮件服务器未能充分清理这些请求，则当Web邮件服务器查询后端服务器时，这些命令将被发送到后端邮件服务器，然后在此处执行命令。', NULL, 37, 'Verifies that untrusted data is not used in sensitive parts of a SMTP message	.', '攻击者利用IMAP / SMTP服务器上输入验证的弱点在服务器上执行命令。Web邮件服务器通常位于Internet与IMAP或SMTP邮件服务器之间。Web邮件服务器接收到用户请求，然后Web邮件服务器向后端邮件服务器查询所请求的信息，并将此响应返回给用户。在IMAP / SMTP命令注入攻击中，邮件服务器命令嵌入在发送到Web邮件服务器的部分请求中。如果Web邮件服务器未能充分清理这些请求，则当Web邮件服务器查询后端服务器时，这些命令将被发送到后端邮件服务器，然后在此处执行命令。', NULL, NULL, 'SMTP注入', 'SMTP注入'), (3, 1, 'ssrf', 1, 'enable', 1, '服务器端请求伪造', '将请求中的参数`<<<result_vul.information.probe.vulparam>>>`的内容设置为测试Payload:`<<<result_vul.information.probe.poc>>>`后进行分析发现<<<result_vul.information.description>>>，故判定该请求存在<<<vultags.tag_title>>>\r\n请求信息:\r\n```http<<=http-result_vul.information.probe=>>```\r\n响应信息:\r\n```http<<=httpresponse-result_vul.information.response=>>```', NULL, 38, 'Verifies that untrusted actors can\'t decide which URLs the application invokes from the server side	.', '将请求中的参数`<<<result_vul.information.probe.vulparam>>>`的内容设置为测试Payload:`<<<result_vul.information.probe.poc>>>`后进行分析发现<<<result_vul.information.description>>>，故判定该请求存在<<<vultags.tag_title>>>\r\n请求信息:\r\n```http<<=http-result_vul.information.probe=>>```\r\n响应信息:\r\n```http<<=httpresponse-result_vul.information.response=>>```', NULL, NULL, '服务器端请求伪造', '服务器端请求伪造'), (4, 1, 'unsafe-xml-decode', 1, 'enable', 1, '不安全的XML Decode', '当用户输入以不安全的方式插入到服务器端XML文档或SOAP消息中时，就会XML外部实体注入漏洞。恶意用户可构造XML元自付破坏XML原本结构，从而查看应用服务器本地文件或对应用同一网络环境下的应用进行间接攻击。', NULL, 39, 'Verifies that use of the JavaBeans XMLDecoder is not done with untrusted data.	', '当用户输入以不安全的方式插入到服务器端XML文档或SOAP消息中时，就会XML外部实体注入漏洞。恶意用户可构造XML元自付破坏XML原本结构，从而查看应用服务器本地文件或对应用同一网络环境下的应用进行间接攻击。', NULL, NULL, '不安全的XML Decode', '不安全的XML Decode'), (5, 1, 'sql-injection', 1, 'enable', 1, 'SQL注入', '软件使用来自上游组件的外部影响的输入来构造全部或部分SQL命令，但不会中和或不正确地中和了特殊元素，这些特殊元素在将其发送到下游组件时可能会修改预期的SQL命令。', NULL, 41, 'Verifies that no untrusted data is used in dynamic database queries.	', '软件使用来自上游组件的外部影响的输入来构造全部或部分SQL命令，但不会中和或不正确地中和了特殊元素，这些特殊元素在将其发送到下游组件时可能会修改预期的SQL命令。', NULL, NULL, 'SQL注入', 'SQL注入'), (6, 1, 'ldap-injection', 1, 'enable', 1, 'LDAP注入', 'LDAP注入是指客户端发送查询请求时，输入的字符串中含有一些特殊字符，导致修改了LDAP本来的查询结构，从而使得可以访问更多的未授权数据的一种攻击方式。', NULL, 42, 'Verifies that no untrusted data is used in dynamic LDAP queries.	', 'LDAP注入是指客户端发送查询请求时，输入的字符串中含有一些特殊字符，导致修改了LDAP本来的查询结构，从而使得可以访问更多的未授权数据的一种攻击方式。', NULL, NULL, 'LDAP注入', 'LDAP注入'), (7, 1, 'xpath-injection', 1, 'enable', 1, 'XPATH注入', 'XPath注入攻击，是指利用XPath 解析器的松散输入和容错特性，能够在 URL、表单或其它信息上附带恶意的XPath 查询代码，以获得权限信息的访问权并更改这些信息。XPath注入攻击是针对Web服务应用新的攻击方法，它允许攻击者在事先不知道XPath查询相关知 识的情况下，通过XPath查询得到一个XML文档的完整内容。Xpath注入攻击本质上和SQL注入攻击是类似的，都是输入一些恶意的查询等代码字符串，从而对网站进行攻击。', NULL, 43, 'Verifies that no untrusted data is used in XPath expression used to retrieve data from an XML database.	', 'XPath注入攻击，是指利用XPath 解析器的松散输入和容错特性，能够在 URL、表单或其它信息上附带恶意的XPath 查询代码，以获得权限信息的访问权并更改这些信息。XPath注入攻击是针对Web服务应用新的攻击方法，它允许攻击者在事先不知道XPath查询相关知 识的情况下，通过XPath查询得到一个XML文档的完整内容。Xpath注入攻击本质上和SQL注入攻击是类似的，都是输入一些恶意的查询等代码字符串，从而对网站进行攻击。', NULL, NULL, 'XPATH注入', 'XPATH注入'), (8, 1, 'path-traversal', 1, 'enable', 1, '路径穿越', 'CWE-23，该软件使用外部输入来构建路径名，该路径名应位于受限目录内，但不能正确中和诸如“ ..”之类的序列，这些序列可以解析到该目录之外的位置。', NULL, 44, 'Verifies that file paths containing untrusted data are not accessed.	', 'CWE-23，该软件使用外部输入来构建路径名，该路径名应位于受限目录内，但不能正确中和诸如“ ..”之类的序列，这些序列可以解析到该目录之外的位置。', NULL, NULL, '路径穿越', '路径穿越'), (9, 1, 'crypto-weak-randomness', 3, 'disable', 1, '弱随机数算法', '随机数在计算机应用中使用的比较广泛，最为熟知的便是在密码学中的应用。随机数分为真随机数和伪随机数，我们程序使用的基本都是伪随机数。伪随机又分为强伪随机数和弱伪随机数。伪随机数，通过一定算法和种子得出。软件实现的是伪随机数。强伪随机数，难以预测的随机数。弱伪随机数，易于预测的随机数。\nJava程序中，使用java.util.Random获得随机数，这种随机数源于伪随机数生成器，产生的随机数容易被预测，对于安全性要求较高的环境中，使用这种随机数可能会降低系统安全性，使攻击者有机可乘。', NULL, 45, 'Verifies that weak sources of entropy are not used.', '随机数在计算机应用中使用的比较广泛，最为熟知的便是在密码学中的应用。随机数分为真随机数和伪随机数，我们程序使用的基本都是伪随机数。伪随机又分为强伪随机数和弱伪随机数。伪随机数，通过一定算法和种子得出。软件实现的是伪随机数。强伪随机数，难以预测的随机数。弱伪随机数，易于预测的随机数。\nJava程序中，使用java.util.Random获得随机数，这种随机数源于伪随机数生成器，产生的随机数容易被预测，对于安全性要求较高的环境中，使用这种随机数可能会降低系统安全性，使攻击者有机可乘。', NULL, NULL, '弱随机数算法', '弱随机数算法'), (10, 1, 'crypto-bad-mac', 3, 'disable', 1, '弱哈希算法', '哈希算法是使用哈希函数将任意长度的消息映射成为一个长度较短且长度固定的值，这个经过映射的值为哈希值。它是一种单向加密体制，即一个从明文到密文的不可逆映射，只有加密过程，没有解密过程。而不安全的哈希算法则可以逆向推出明文。在密码学中，哈希算法主要用于消息摘要和签名来对整个消息的完整性进行校验，所以需要哈希算法无法推导输入的原始值，这是哈希算法安全性的基础。目前常用的哈希算法包括MD4、MD5、SHA等。本篇文章以JAVA语言源代码为例，分析不安全的哈希算法缺陷产生的原因以及修复方法。详细请参见：CWE ID 327: Use of a Broken or Risky Cryptographic Algorithm (http://cwe.mitre.org/data/definitions/327.html)。', NULL, 46, 'Verifies that only strong hash algorithms are used.', '哈希算法是使用哈希函数将任意长度的消息映射成为一个长度较短且长度固定的值，这个经过映射的值为哈希值。它是一种单向加密体制，即一个从明文到密文的不可逆映射，只有加密过程，没有解密过程。而不安全的哈希算法则可以逆向推出明文。在密码学中，哈希算法主要用于消息摘要和签名来对整个消息的完整性进行校验，所以需要哈希算法无法推导输入的原始值，这是哈希算法安全性的基础。目前常用的哈希算法包括MD4、MD5、SHA等。本篇文章以JAVA语言源代码为例，分析不安全的哈希算法缺陷产生的原因以及修复方法。详细请参见：CWE ID 327: Use of a Broken or Risky Cryptographic Algorithm (http://cwe.mitre.org/data/definitions/327.html)。', NULL, NULL, '弱哈希算法', '弱哈希算法'), (11, 1, 'crypto-bad-cipher', 3, 'disable', 1, '弱加密算法', '数据通过弱加密算法MessageDigest函数进行加密', NULL, 47, 'Verifies that only strong cryptographic algorithms are used.', '数据通过弱加密算法MessageDigest函数进行加密', NULL, NULL, '弱加密算法', '弱加密算法'), (12, 1, 'cookie-flags-missing', 3, 'disable', 1, 'Cookie未设置secure', '没有设置HTTPS会话中敏感cookie的安全属性，这可能导致用户代理通过HTTP会话以明文发送这些cookie。', NULL, 48, 'Verifies that cookies have the \'secure\' flag.', '没有设置HTTPS会话中敏感cookie的安全属性，这可能导致用户代理通过HTTP会话以明文发送这些cookie。', NULL, NULL, 'Cookie未设置secure', 'Cookie未设置secure'), (13, 1, 'trust-boundary-violation', 3, 'disable', 1, '信任边界', 'CWE-501，信任边界可以认为是通过程序绘制的线。 在生产线的一侧，数据不受信任。 在该行的另一端，假定数据是可信的。 验证逻辑的目的是允许数据安全地越过信任边界-从不受信任变为受信任。 当程序模糊了可信和不可信之间的界限时，就会发生信任边界冲突。 通过在同一数据结构中组合可信数据和不可信数据，程序员可以更容易地错误地信任未验证的数据。', NULL, 49, 'Verifies that untrusted data is not used in the HTTP session.', 'CWE-501，信任边界可以认为是通过程序绘制的线。 在生产线的一侧，数据不受信任。 在该行的另一端，假定数据是可信的。 验证逻辑的目的是允许数据安全地越过信任边界-从不受信任变为受信任。 当程序模糊了可信和不可信之间的界限时，就会发生信任边界冲突。 通过在同一数据结构中组合可信数据和不可信数据，程序员可以更容易地错误地信任未验证的数据。', NULL, NULL, '信任边界', '信任边界'), (14, 1, 'reflected-xss', 2, 'disable', 1, '反射型xss', '跨站脚本攻击漏洞简称XSS漏洞,主要是由于应用后端未对用户输入进行安全校验或校验不严格导致恶意用户可自定义控制页面输出内容，从而产生跨站脚本攻击漏洞。通常来说恶意用户通过构造闭合标签方式在HTML页面中插入Javascript代码，在正常用户浏览此页面时对正常用户进行攻击，常见的攻击方式有获取用户的身份凭据、对用户内网进行探测扫描、执行钓鱼欺骗攻击等', NULL, 50, 'Verifies that no untrusted data is used in generated HTML pages	.', '跨站脚本攻击漏洞简称XSS漏洞,主要是由于应用后端未对用户输入进行安全校验或校验不严格导致恶意用户可自定义控制页面输出内容，从而产生跨站脚本攻击漏洞。通常来说恶意用户通过构造闭合标签方式在HTML页面中插入Javascript代码，在正常用户浏览此页面时对正常用户进行攻击，常见的攻击方式有获取用户的身份凭据、对用户内网进行探测扫描、执行钓鱼欺骗攻击等', NULL, NULL, '反射型xss', '反射型xss'), (15, 1, 'header-injection', 3, 'enable', 1, 'Header头注入', 'HTTP响应拆分漏洞，也叫CRLF注入攻击。CR、LF分别对应回车、换行字符。攻击者可能注入自定义HTTP头。例如，攻击者可以注入会话cookie或HTML代码。这可能会进行类似的XSS（跨站点脚本）或会话固定漏洞。', NULL, 61, 'Verifies that untrusted data is not used in an HTTP header.', 'HTTP响应拆分漏洞，也叫CRLF注入攻击。CR、LF分别对应回车、换行字符。攻击者可能注入自定义HTTP头。例如，攻击者可以注入会话cookie或HTML代码。这可能会进行类似的XSS（跨站点脚本）或会话固定漏洞。', NULL, NULL, 'Header头注入', 'Header头注入'), (16, 1, 'hql-injection', 1, 'enable', 1, 'HQL注入', 'CWE-564，使用Hibernate执行使用用户控制的输入构建的动态SQL语句，可使攻击者修改该语句的含义或执行任意SQL命令。', NULL, 56, 'Verifies that no untrusted data is appended to dynamically constructed hibernate queries.	', 'CWE-564，使用Hibernate执行使用用户控制的输入构建的动态SQL语句，可使攻击者修改该语句的含义或执行任意SQL命令。', NULL, NULL, 'HQL注入', 'HQL注入'), (17, 1, 'unsafe-readline', 3, 'enable', 1, '不安全的readline', '使用不安全的方法进行行数据读取', NULL, 58, 'Verifies that untrusted stream doesn\'t use readLine() method.', '使用不安全的方法进行行数据读取', NULL, NULL, '不安全的readline', '不安全的readline'), (18, 1, 'expression-language-injection', 1, 'enable', 1, '表达式注入', 'CWE-917，该软件使用来自上游组件的外部影响的输入来构造Java Server Page（JSP）中的全部或部分表达语言（EL）语句，但不会中和或错误地中和了可以修改预期的EL语句的特殊元素。它被执行。', NULL, 52, 'Verifies that untrusted data is not used in the evaluation of JSP Expression Language.	', 'CWE-917，该软件使用来自上游组件的外部影响的输入来构造Java Server Page（JSP）中的全部或部分表达语言（EL）语句，但不会中和或错误地中和了可以修改预期的EL语句的特殊元素。它被执行。', NULL, NULL, '表达式注入', '表达式注入'), (19, 1, 'redos', 3, 'enable', 1, '正则DOS', 'CWE-185，使用的正则表达式会导致数据不正确的匹配或比较，造成程序响应速度变慢', NULL, 53, 'Verifies that no heavily backtracking regular expressions are used on untrusted data.	', 'CWE-185，使用的正则表达式会导致数据不正确的匹配或比较，造成程序响应速度变慢', NULL, NULL, '正则DOS', '正则DOS'), (20, 1, 'reflection-injection', 1, 'enable', 1, '反射注入', '使用反射方式动态加载用户输入的类名，如果未做过滤，可加载恶意类产生命令执行等风险。', NULL, 54, 'Verifies that untrusted data is not used in a reflection API.', '使用反射方式动态加载用户输入的类名，如果未做过滤，可加载恶意类产生命令执行等风险。', NULL, NULL, '反射注入', '反射注入'), (21, 1, 'nosql-injection', 1, 'enable', 1, 'NoSql注入', 'NoSQL(泛指非关系型的数据库)注入是指服务端充分信任用户输入导致输入带入查询操作，导致用户可控制数据库查询语句；但由于nosql数据库不同于传统数据库的语法，由于各个数据库之间使用语法、API一般不同，NoSQL注入攻击可能在应用程序的不同区域执行，具体取决于使用的NoSQL API和数据模型；NoSQL注入按照攻击途径又分五类：重言式/永真式、联合查询、JavaScript注入、背负式查询、跨域违规；', NULL, 57, 'Verifies that no untrusted data is used in dynamic database queries.	', 'NoSQL(泛指非关系型的数据库)注入是指服务端充分信任用户输入导致输入带入查询操作，导致用户可控制数据库查询语句；但由于nosql数据库不同于传统数据库的语法，由于各个数据库之间使用语法、API一般不同，NoSQL注入攻击可能在应用程序的不同区域执行，具体取决于使用的NoSQL API和数据模型；NoSQL注入按照攻击途径又分五类：重言式/永真式、联合查询、JavaScript注入、背负式查询、跨域违规；', NULL, NULL, 'NoSql注入', 'NoSql注入'), (22, 1, 'unvalidated-redirect', 3, 'enable', 1, '不安全的重定向', 'CWE-601，Web应用程序接受用户控制的输入，该输入指定到外部站点的链接，并在重定向中使用该链接，简化了网络钓鱼攻击。', NULL, 60, 'Verifies that requests are not redirected using untrusted data.', 'CWE-601，Web应用程序接受用户控制的输入，该输入指定到外部站点的链接，并在重定向中使用该链接，简化了网络钓鱼攻击。', NULL, NULL, '不安全的重定向', '不安全的重定向'), (23, 1, 'unvalidated-forward', 3, 'enable', 1, '不安全的转发', '验证服务端是否使用不受信任的数据链接进行重定向。', NULL, 59, 'Verifies that no untrusted data is used to build a path used in forwards.	', '验证服务端是否使用不受信任的数据链接进行重定向。', NULL, NULL, '不安全的转发', '不安全的转发'), (24, 1, 'crypto-bad-ciphers', 3, 'disable', 1, '弱加密算法', '数据通过弱加密算法MessageDigest函数进行加密', NULL, 47, 'Verifies that no untrusted data is used to build a path used in forwards.	', '数据通过弱加密算法MessageDigest函数进行加密', NULL, NULL, '弱加密算法', '弱加密算法'), (25, 1, 'dynamic-library-load', 1, 'enable', 1, 'JNI注入', 'JNI注入是指由于WEB应用程序对用户提交的JNI包过滤不严格，导致攻击者可以通过构造恶意JNI包并动态加载至WEB应用中', '这里是修复建议', 62, 'Verifies that use of the Java Runtiom load is not done with untrusted data.', 'JNI注入是指由于WEB应用程序对用户提交的JNI包过滤不严格，导致攻击者可以通过构造恶意JNI包并动态加载至WEB应用中', '这里是修复建议', '这里是修复建议', 'JNI注入', 'JNI注入'), (26, 1, 'xxe', 2, 'enable', 1, 'XXE', 'XML 指可扩展标记语言（eXtensible Markup Language），是一种用于标记电子文件使其具有结构性的标记语言，被设计用来传输和存储数据。XML文档结构包括XML声明、DTD文档类型定义（可选）、文档元素。目前，XML文件作为配置文件（Spring、Struts2等）、文档结构说明文件（PDF、RSS等）、图片格式文件（SVG header）应用比较广泛。 XML 的语法规范由 DTD （Document Type Definition）来进行控制。\n\nXML外部实体注入（XML External Entity Injection）漏洞是指当恶意用户在提交一个精心构造的包含外部实体引用的XML文档给未正确配置的XML解析器处理时，该攻击就会发生。', NULL, 51, 'Verifies that external entities aren\'t processed during XML.\nXML外部实体注入（XML External Entity Injection）漏洞是指当恶意用户在提交一个精心构造的包含外部实体引用的XML文档给未正确配置的XML解析器处理时，该攻击就会发生。', 'XML 指可扩展标记语言（eXtensible Markup Language），是一种用于标记电子文件使其具有结构性的标记语言，被设计用来传输和存储数据。XML文档结构包括XML声明、DTD文档类型定义（可选）、文档元素。目前，XML文件作为配置文件（Spring、Struts2等）、文档结构说明文件（PDF、RSS等）、图片格式文件（SVG header）应用比较广泛。 XML 的语法规范由 DTD （Document Type Definition）来进行控制。\n\nXML外部实体注入（XML External Entity Injection）漏洞是指当恶意用户在提交一个精心构造的包含外部实体引用的XML文档给未正确配置的XML解析器处理时，该攻击就会发生。', NULL, NULL, 'XXE', 'XXE'), (27, 1, 'unsafe-json-deserialize', 1, 'enable', 1, '不安全的JSON反序列化', '不安全的JSON反序列化是指WEB应用程序对用户提交的反序列化数据未进行有效过滤，导致反序列化过程中产生命令执行、文件读取等漏洞', NULL, 55, 'Verifies that objects aren\'t deserialized from untrusted sources.', '不安全的JSON反序列化是指WEB应用程序对用户提交的反序列化数据未进行有效过滤，导致反序列化过程中产生命令执行、文件读取等漏洞', NULL, NULL, '不安全的JSON反序列化', '不安全的JSON反序列化');
COMMIT;

-- ----------------------------
-- Table structure for iast_strategy_user
-- ----------------------------
DROP TABLE IF EXISTS `iast_strategy_user`;
CREATE TABLE `iast_strategy_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200)  NULL DEFAULT NULL COMMENT '策略名称',
  `content` text  NULL COMMENT '策略ID串',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `status` tinyint(2) NULL DEFAULT 1 COMMENT '1有效0无效',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 391 CHARACTER SET = utf8mb4 ;

-- ----------------------------
-- Records of iast_strategy_user
-- ----------------------------
BEGIN;
INSERT INTO `iast_strategy_user` VALUES (5, '插桩测试标准模板', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 1, 1, '2020-12-16 21:32:34'), (6, '全量策略', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 16, 1, '2021-01-22 16:21:24'), (7, 'testiast', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 21, 1, '2021-03-18 22:50:25'), (9, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 24, 1, '2021-03-19 16:03:37'), (10, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 24, 1, '2021-03-19 17:30:36'), (11, 'aaa', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 25, 1, '2021-03-21 11:40:18'), (12, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,9,10,11,12,13,15,17,19,22,23,24,14,26', 25, 1, '2021-03-21 11:46:50'), (13, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 26, 1, '2021-03-22 01:21:34'), (14, 'a', '3,4,8,16,27,21,20', 28, 1, '2021-03-22 10:20:43'), (15, 'cmddemo', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 27, 1, '2021-03-22 10:55:50'), (16, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 34, 1, '2021-03-22 16:01:02'), (17, '全部', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 38, 1, '2021-03-23 10:31:14'), (18, '全部低危', '9,10,11,12,13,15,17,19,22,23,24', 38, 1, '2021-03-23 10:31:42'), (19, '全部中危', '14,26', 38, 1, '2021-03-23 10:32:17'), (20, 'demo', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 40, 1, '2021-03-23 17:13:47'), (21, '全选', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 37, 1, '2021-03-23 21:18:55'), (22, '全部策略', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 43, 1, '2021-03-24 10:21:59'), (23, 'Full', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 45, 1, '2021-03-24 13:10:36'), (24, '全扫', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 47, 1, '2021-03-24 17:05:31'), (25, 'allinone', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 27, 1, '2021-03-25 21:24:23'), (27, '1', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 31, 1, '2021-03-31 11:07:39'), (28, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 64, 1, '2021-04-02 12:21:12'), (29, '测试', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 59, 1, '2021-04-02 13:24:58'), (30, 'policy', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,26,14,9,10,11,12,13,15,17,19,22,23,24', 62, 1, '2021-04-02 14:53:02'), (31, 'solr', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 56, 1, '2021-04-02 18:01:09'), (32, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 53, 1, '2021-04-06 14:41:44'), (33, '策略1', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 71, 1, '2021-04-06 15:11:52'), (34, '所有', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 72, 1, '2021-04-07 16:08:46'), (35, '全量策略', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 18, 1, '2021-04-07 17:42:01'), (36, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 87, 1, '2021-04-08 13:43:30'), (37, 'webgoat', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 63, 1, '2021-04-08 14:56:17'), (38, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 56, 1, '2021-04-08 16:29:46'), (39, '全量策略', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 93, 1, '2021-04-08 19:23:00'), (40, '1.8', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 63, 1, '2021-04-09 15:16:27'), (41, '靶场实践IAST', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,9,10,11,12,13,15,17,19,22,23,24,14,26', 95, 1, '2021-04-11 11:19:51'), (42, 'q\'q\'q', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 97, 1, '2021-04-12 10:13:12'), (43, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 97, 1, '2021-04-12 10:30:14'), (44, 'normal', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 82, 1, '2021-04-12 10:44:34'), (45, '全量', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 93, 1, '2021-04-13 10:08:03'), (46, 'test01', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 102, 1, '2021-04-13 14:52:30'), (47, '全量策略', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 103, 1, '2021-04-13 15:22:47'), (48, '8081', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 102, 1, '2021-04-13 15:23:16'), (49, '全量策略', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 105, 1, '2021-04-14 10:12:26'), (50, '2333', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 16, 1, '2021-04-14 10:21:48'), (51, '全部', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 102, 1, '2021-04-14 14:31:05'), (52, '常用', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,15', 85, 1, '2021-04-14 15:25:13'), (53, 'ALL', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 106, 1, '2021-04-15 17:20:50'), (54, 'M&H', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26', 106, 1, '2021-04-15 17:22:26'), (55, '全量策略', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 80, 1, '2021-04-17 15:54:53'), (56, 'A', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 140, 1, '2021-04-19 15:22:40'), (57, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 144, 1, '2021-04-20 12:40:38'), (58, 'all1', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 144, 1, '2021-04-20 12:51:58'), (59, '全选', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 150, 1, '2021-04-20 13:24:26'), (60, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 33, 1, '2021-04-21 22:23:59'), (61, 'info', '27', 148, 1, '2021-04-21 22:51:26'), (62, 'high1', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 148, 1, '2021-04-21 23:06:26'), (63, 'unser', '27', 148, 1, '2021-04-22 02:23:07'), (64, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 134, 1, '2021-04-22 10:13:19'), (65, 'high', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 134, 1, '2021-04-22 10:25:55'), (66, 'expression inject', '18', 148, 1, '2021-04-22 12:00:20'), (67, 'high_all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 148, 1, '2021-04-22 13:35:33'), (68, 'All', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 157, 1, '2021-04-22 14:13:32'), (69, 't1', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 155, 1, '2021-04-22 14:51:45'), (70, 'ss', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 154, 1, '2021-04-22 15:21:37'), (71, 'except_info', '9,10,11,12,13,15,17,19,22,23,24,14,26,1,2,3,4,5,6,7,8,16,18,20,21,25,27', 148, 1, '2021-04-22 15:44:17'), (72, 'testcl', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 149, 1, '2021-04-22 15:56:24'), (73, '测试', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 159, 1, '2021-04-23 09:30:51'), (74, '全流量', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 159, 1, '2021-04-23 09:31:44'), (75, 'high-medium', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26', 149, 1, '2021-04-24 12:29:13'), (76, 'high', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 149, 1, '2021-04-24 12:38:17'), (77, 'EL', '18', 149, 1, '2021-04-24 15:59:34'), (78, 'EL2', '18,1,2,3,4,5,6,7,8,16,20,21,25,27', 149, 1, '2021-04-24 16:01:13'), (79, 'high', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 149, 1, '2021-04-24 16:03:47'), (80, 'high', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 149, 1, '2021-04-24 16:10:13'), (81, 'high', '1', 149, 1, '2021-04-24 16:11:14'), (82, 'EL23', '18', 149, 1, '2021-04-24 16:12:50'), (83, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 149, 1, '2021-04-24 16:20:51'), (84, 'test1', '18,1,2,3,4,5,6,7,8,16,21,25,27', 149, 1, '2021-04-24 16:22:22'), (85, 'high-all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 149, 1, '2021-04-24 16:38:33'), (86, 'high-all-without-xss', '1,2,3,4,5,6,7,8,16,18,21,25,27', 149, 1, '2021-04-24 16:39:58'), (87, 'all-without-xss', '1,2,3,4,5,6,7,8,16,18,21,25,27,26,9,10,11,12,13,15,17,19,22,23,24', 149, 1, '2021-04-24 21:02:07'), (88, 'info', '9,10,11,12,13,15,17,19,22,23,24', 149, 1, '2021-04-24 21:03:38'), (89, '全部策略', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 161, 1, '2021-04-25 09:53:05'), (90, 'EL-only', '18', 149, 1, '2021-04-25 10:46:32'), (91, 'high-all-2', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 149, 1, '2021-04-25 11:30:09'), (92, 'all2', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 149, 1, '2021-04-25 11:36:15'), (93, 'xx', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 165, 1, '2021-04-25 11:39:00'), (94, 'xx', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 165, 1, '2021-04-25 13:05:34'), (95, '123', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 165, 1, '2021-04-25 13:16:07'), (96, 'all3', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 149, 1, '2021-04-25 15:08:11'), (97, 'high-all-without-xss-1', '1,2,3,4,5,6,7,8,16,18,21,25,27', 149, 1, '2021-04-25 15:54:52'), (98, 'EL-only-2', '18', 149, 1, '2021-04-25 22:16:44'), (99, 'tester1', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 168, 1, '2021-04-26 10:11:56'), (100, 'test2', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 168, 1, '2021-04-26 10:30:36'), (101, 'vulns-test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 168, 1, '2021-04-26 10:44:21'), (102, 'test-vulns-2', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 168, 1, '2021-04-26 10:47:23'), (103, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 168, 1, '2021-04-26 11:44:02'), (104, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 168, 1, '2021-04-26 11:44:02'), (105, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 168, 1, '2021-04-26 11:44:03'), (106, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 168, 1, '2021-04-26 11:44:12'), (107, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 168, 1, '2021-04-26 13:50:53'), (108, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 167, 1, '2021-04-26 13:59:20'), (109, 'test-tomcat', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 168, 1, '2021-04-26 14:29:59'), (110, 'test-bugger', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 168, 1, '2021-04-26 16:30:26'), (111, '全部漏洞', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 173, 1, '2021-04-27 09:57:27'), (112, 'tomcat_cs', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 175, 1, '2021-04-27 10:47:31'), (113, '高危漏洞', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 173, 1, '2021-04-27 11:08:28'), (114, '全部', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 167, 1, '2021-04-27 16:12:47'), (115, '全选', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 176, 1, '2021-04-27 16:30:57'), (116, 'uc_all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 175, 1, '2021-04-27 17:38:47'), (117, 'default', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 181, 1, '2021-04-29 11:07:32'), (118, '全策略', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 170, 1, '2021-04-29 14:01:06'), (119, 'r', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 54, 1, '2021-04-29 15:35:18'), (120, 'besall', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,26,14,9,10,11,12,13,15,17,19,22,23,24', 175, 1, '2021-04-30 10:32:07'), (121, '全量', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,9,10,11,12,13,15,17,19,22,23,24,14,26', 187, 1, '2021-04-30 10:35:36'), (122, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 180, 1, '2021-04-30 10:43:45'), (123, 'SQL注入', '5', 178, 1, '2021-04-30 17:46:06'), (124, '测试', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26', 191, 1, '2021-04-30 18:35:48'), (125, 'TW7_ENT', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 175, 1, '2021-05-06 15:44:33'), (126, '中高危', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26', 198, 1, '2021-05-08 10:08:10'), (127, '全量策略', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 52, 1, '2021-05-08 10:15:44'), (128, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 199, 1, '2021-05-08 10:19:15'), (129, 'quanxuan', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 196, 1, '2021-05-08 10:28:10'), (130, '全选！', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 176, 1, '2021-05-11 10:01:36'), (131, '全量-all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 204, 1, '2021-05-12 14:27:27'), (132, '通用', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 205, 1, '2021-05-14 13:53:14'), (133, 'ALL', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 164, 1, '2021-05-15 22:09:33'), (134, 'ALL', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 164, 1, '2021-05-15 22:09:33'), (135, 'ALLL', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26', 164, 1, '2021-05-15 23:40:40'), (136, 'TW', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 171, 1, '2021-05-17 10:42:24'), (137, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 211, 1, '2021-05-17 11:13:31'), (138, 'all-all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 211, 1, '2021-05-17 13:53:28'), (139, '全选策略', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 202, 1, '2021-05-17 16:07:53'), (140, 'tw_heimdall', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 171, 1, '2021-05-17 19:22:05'), (141, 'sl-ky扫描', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 220, 1, '2021-05-18 10:51:04'), (142, '除提示', '9,10,11,12,13,15,17,19,22,23,24,14,26,1,2,3,4,5,6,7,8,16,18,20,21,25,27', 219, 1, '2021-05-19 11:14:01'), (143, 't1', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 147, 1, '2021-05-19 11:49:16'), (144, 'tt', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 147, 1, '2021-05-19 13:13:55'), (145, 'tt', '14,26,9,10,11,12,13,15,17,19,22,23,24,1,2,3,4,5,6,7,8,16,18,20,21,25,27', 147, 1, '2021-05-19 13:14:12'), (146, '全选', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 16, 1, '2021-05-19 17:03:54'), (147, 'sd', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 16, 1, '2021-05-19 19:58:55'), (148, '1', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 228, 1, '2021-05-20 10:39:02'), (149, 't2', '5,6,2,1,3,4,16,20,25,27', 147, 1, '2021-05-20 14:56:50'), (150, 'demo', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 217, 1, '2021-05-21 15:03:57'), (151, '高危', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 137, 1, '2021-05-24 10:22:09'), (152, 'springtest', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 207, 1, '2021-05-24 10:38:36'), (153, 'quanx', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 242, 1, '2021-05-25 10:14:14'), (154, '凌凌八', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 239, 1, '2021-05-25 14:56:05'), (155, '铁拐董', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 239, 1, '2021-05-25 14:58:22'), (156, 'testpolicy', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 236, 1, '2021-05-25 15:40:02'), (157, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 230, 1, '2021-05-25 18:09:57'), (158, '2', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 244, 1, '2021-05-25 21:46:30'), (159, '1', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 246, 1, '2021-05-26 10:28:21'), (160, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 231, 1, '2021-05-26 13:36:15'), (161, 'a', '14,26,1,2,3,4,5,6,7,8,16,18,20,21,25,27,9,10,11,12,13,15,17,19,22,23,24', 246, 1, '2021-05-26 14:24:50'), (162, 'ces', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 206, 1, '2021-05-26 14:30:39'), (163, 'test1', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 238, 1, '2021-05-26 19:27:44'), (164, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 238, 1, '2021-05-26 19:27:57'), (165, 'Template', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26', 252, 1, '2021-05-27 10:24:50'), (166, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 254, 1, '2021-05-27 11:06:34'), (167, 'fff', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 237, 1, '2021-05-27 13:55:46'), (168, '标准测试', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 269, 1, '2021-05-27 18:39:10'), (169, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 269, 1, '2021-05-27 18:43:39'), (170, 'test1', '5', 169, 1, '2021-05-27 20:07:11'), (171, 'A', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 277, 1, '2021-05-28 16:09:25'), (172, 'test', '5,6', 287, 1, '2021-05-31 13:22:17'), (173, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 248, 1, '2021-05-31 18:14:28'), (174, 'default', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 282, 1, '2021-05-31 19:19:21'), (175, '高几率命中', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,26', 274, 1, '2021-06-03 13:37:44'), (176, 'all in one', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 300, 1, '2021-06-03 15:09:58'), (177, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 301, 1, '2021-06-03 15:12:26'), (178, '<img src=x onerror=alert(1)/>', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 300, 1, '2021-06-03 16:02:52'), (179, '全量扫描', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 222, 1, '2021-06-03 16:24:08'), (180, '全部', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 307, 1, '2021-06-07 11:23:33'), (181, 'wildlfly', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 312, 1, '2021-06-08 10:38:08'), (182, 'ALL', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 250, 1, '2021-06-08 13:56:47'), (183, '全选', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 314, 1, '2021-06-09 11:15:56'), (185, 'All-Scan', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 282, 1, '2021-06-10 10:27:20'), (186, 'xssle测试策略', '1,5,6,7,8,18,21,20,25,27,3,16,9,10,11,12,13,15,17,19,22,23,24,14,26,2', 290, 1, '2021-06-15 14:57:09'), (187, '全', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 317, 1, '2021-06-15 20:29:00'), (188, 'high', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 396, 1, '2021-06-18 11:05:41'), (189, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,13,15,17,19,22,23', 396, 1, '2021-06-18 11:07:06'), (190, '11', '1,27', 390, 1, '2021-06-21 15:01:26'), (191, '注入', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 390, 1, '2021-06-21 15:06:21'), (192, '高中', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26', 435, 1, '2021-06-21 17:47:09'), (193, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 408, 1, '2021-06-22 10:30:30'), (194, '6', '9,10,11,12,13,15,17,19,22,23,24,14,26,1,2,3,4,5,6,7,8,16,18,20,21,25,27', 436, 1, '2021-06-22 10:43:45'), (195, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 433, 1, '2021-06-22 20:14:01'), (196, 'ss', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 433, 1, '2021-06-22 20:33:42'), (197, 'test1', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 447, 1, '2021-06-23 14:17:33'), (198, '全量漏洞', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 446, 1, '2021-06-23 15:25:34'), (199, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 137, 1, '2021-06-24 15:03:07'), (200, '漏洞检测', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 31, 1, '2021-06-25 17:14:05'), (201, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 450, 1, '2021-06-28 16:27:38'), (202, 'celue', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 451, 1, '2021-06-29 16:35:03'), (203, '1111', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26', 156, 1, '2021-06-30 14:17:41'), (204, '全部策略', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 453, 1, '2021-06-30 17:14:58'), (205, 'high', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 456, 1, '2021-07-01 10:06:28'), (206, '高危中危扫描', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26', 462, 1, '2021-07-05 10:31:56'), (207, 'ALL', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 455, 1, '2021-07-05 10:53:37'), (208, '默认策略', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 442, 1, '2021-07-05 11:12:42'), (209, 'ALL', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 27, 1, '2021-07-07 10:54:22'), (210, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 309, 1, '2021-07-07 14:25:32'), (211, 'minglingzhuru', '1', 467, 1, '2021-07-08 10:05:52'), (212, 'ALL', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 467, 1, '2021-07-08 10:21:17'), (213, 'allin', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 93, 1, '2021-07-08 18:28:51'), (214, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 463, 1, '2021-07-08 22:12:29'), (215, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 459, 1, '2021-07-11 13:52:36'), (216, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 459, 1, '2021-07-11 15:14:52'), (217, '检查所有策略', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 453, 1, '2021-07-11 20:31:33'), (218, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 449, 1, '2021-07-12 20:54:37'), (219, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 471, 1, '2021-07-12 22:37:31'), (220, 'All', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 472, 1, '2021-07-14 00:10:08'), (221, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 473, 1, '2021-07-14 17:38:18'), (222, 'spring', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 443, 1, '2021-07-14 21:00:14'), (223, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 476, 1, '2021-07-16 16:33:41'), (224, '自定义', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 208, 1, '2021-07-16 21:29:24'), (225, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 473, 1, '2021-07-19 14:45:32'), (226, '中高漏洞', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26', 75, 1, '2021-07-20 14:24:15'), (227, '111', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26', 452, 1, '2021-07-21 13:01:06'), (228, 'high', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 33, 1, '2021-07-22 16:20:10'), (229, '全量', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 485, 1, '2021-07-27 13:52:41'), (230, '测试', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26', 486, 1, '2021-07-28 10:14:29'), (231, '高危', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 494, 1, '2021-07-29 14:35:56'), (232, '1', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 494, 1, '2021-07-29 15:39:42'), (233, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 495, 1, '2021-07-30 10:22:52'), (234, 'qyhcl', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 309, 1, '2021-07-30 15:31:32'), (235, 'test1', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 495, 1, '2021-07-30 16:08:17'), (236, '1', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26', 494, 1, '2021-07-30 16:59:17'), (237, '21312', '1', 496, 1, '2021-08-01 12:01:32'), (238, '测', '1', 496, 1, '2021-08-01 12:01:58'), (239, 'test-strategy', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 445, 1, '2021-08-02 11:26:57'), (240, 'dddd', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 495, 1, '2021-08-02 14:20:52'), (241, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 497, 1, '2021-08-02 16:09:31'), (242, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 500, 1, '2021-08-02 16:15:48'), (243, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 509, 1, '2021-08-02 16:33:45'), (244, '全部', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 552, 1, '2021-08-02 17:18:04'), (245, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 545, 1, '2021-08-03 10:50:12'), (246, 'test11', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 545, 1, '2021-08-03 11:59:33'), (247, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 544, 1, '2021-08-03 17:00:59'), (248, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 553, 1, '2021-08-03 17:34:20'), (249, 'all', '9,10,11,12,13,15,17,19,22,23,24,14,26,1,2,3,4,5,6,7,8,16,18,20,21,25,27', 553, 1, '2021-08-04 11:20:48'), (250, '全选', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 555, 1, '2021-08-04 12:05:36'), (251, '全部漏洞', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 559, 1, '2021-08-04 16:50:38'), (252, '全选测试', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26', 486, 1, '2021-08-04 17:19:22'), (253, 'ALL', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 561, 1, '2021-08-05 15:15:32'), (254, 'ALL', '1,8,27,20,5,18,6,7,3,2,4,14,26,9,10,11,12,13,15,17,19,22,23,24,16,21,25', 561, 1, '2021-08-05 15:45:42'), (255, 'scan-all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 561, 1, '2021-08-05 15:46:08'), (256, '全扫', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 563, 1, '2021-08-05 17:29:17'), (257, 'XSS', '14', 561, 1, '2021-08-05 18:26:23'), (258, '全选', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 541, 1, '2021-08-05 22:35:25'), (259, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 565, 1, '2021-08-05 23:05:21'), (260, 'test2', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26', 565, 1, '2021-08-05 23:50:14'), (261, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 564, 1, '2021-08-06 10:35:36'), (262, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 564, 1, '2021-08-06 11:06:05'), (263, 'etl_2.2.8', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 175, 1, '2021-08-06 11:31:46'), (264, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 541, 1, '2021-08-07 12:21:25'), (265, 'test', '14,26,1,2,3,4,5,6,7,8,16,18,20,21,25,27', 539, 1, '2021-08-09 11:18:12'), (266, '全量策略', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 560, 1, '2021-08-09 14:38:21'), (267, '表达式注入', '18', 560, 1, '2021-08-09 17:44:11'), (268, '全量扫描', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 540, 1, '2021-08-09 23:33:44'), (269, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 489, 1, '2021-08-10 10:34:33'), (270, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26', 568, 1, '2021-08-10 11:05:14'), (271, 'sql', '5', 529, 1, '2021-08-10 17:13:23'), (272, 'S2-001', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 560, 1, '2021-08-11 10:07:56'), (273, 's2-007', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 560, 1, '2021-08-11 10:34:22'), (274, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 571, 1, '2021-08-11 12:31:06'), (275, 'allin', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,26', 570, 1, '2021-08-11 15:08:20'), (276, 'iast-test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 572, 1, '2021-08-12 14:45:35'), (277, 'demo', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 484, 1, '2021-08-12 16:52:49'), (278, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 576, 1, '2021-08-13 10:54:02'), (279, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,9,10,11,12,13,15,17,19,22,23,24,14,26', 232, 1, '2021-08-15 17:18:16'), (280, 'wintw6.1.5.21', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 175, 1, '2021-08-16 13:39:50'), (281, 'ddfe', '1,5', 582, 1, '2021-08-16 14:48:40'), (282, 'cmdsql', '1,5', 134, 1, '2021-08-16 14:57:20'), (283, 'allpolicy', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 583, 1, '2021-08-16 15:37:50'), (284, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 585, 1, '2021-08-17 11:52:32'), (285, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 244, 1, '2021-08-17 14:11:40'), (286, 'huang', '1,3,5,6,7,14,9,10,11,12,13,24,8,16,18,20', 54, 1, '2021-08-17 15:30:21'), (287, 'z', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 54, 1, '2021-08-17 17:44:30'), (288, '全选', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 56, 1, '2021-08-17 18:04:16'), (289, 'hhf', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 54, 1, '2021-08-18 09:04:24'), (290, 'zdl', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 54, 1, '2021-08-18 10:39:13'), (291, '2', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 494, 1, '2021-08-18 11:37:55'), (292, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 173, 1, '2021-08-18 13:15:18'), (293, '高中低危漏洞策略', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 588, 1, '2021-08-18 13:50:11'), (294, '高危险', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,26', 593, 1, '2021-08-19 11:26:14'), (295, '全插件', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 573, 1, '2021-08-19 14:10:05'), (296, 'All', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 550, 1, '2021-08-19 16:36:42'), (297, 'test', '1,5', 600, 1, '2021-08-19 19:48:11'), (298, 'python路径穿越', '8', 601, 1, '2021-08-20 14:27:08'), (299, 'python路径穿越', '8', 602, 1, '2021-08-20 14:45:00'), (300, '火线测试-001', '1,5,7,2,3,4,6,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 591, 1, '2021-08-23 10:12:54'), (301, '123', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 578, 1, '2021-08-23 17:21:22'), (302, '测试 ', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 461, 1, '2021-08-23 21:35:58'), (303, 'ALL', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 611, 1, '2021-08-24 09:36:45'), (304, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 590, 1, '2021-08-24 10:19:45'), (305, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 139, 1, '2021-08-24 10:56:59'), (306, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 601, 1, '2021-08-24 13:17:15'), (307, 'high', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 621, 1, '2021-08-27 23:21:11'), (308, '中高危', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26', 146, 1, '2021-08-30 10:42:38'), (309, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 625, 1, '2021-08-30 11:33:11'), (310, '测试', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 577, 1, '2021-08-30 13:01:29'), (311, '1', '9,10,11,12,13,15,17,19,22,23,24', 636, 1, '2021-08-30 17:35:30'), (312, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 639, 1, '2021-08-31 14:13:50'), (313, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26', 640, 1, '2021-08-31 14:16:23'), (314, '全部检查', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 642, 1, '2021-08-31 14:38:33'), (315, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 641, 1, '2021-08-31 15:01:45'), (316, 'Python-High', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 265, 1, '2021-09-01 10:56:55'), (317, 'all', '9,10,11,12,13,15,17,19,22,23,24', 265, 1, '2021-09-01 11:12:38'), (318, 'scan', '1,5,2,3,4,6,7,8,16,18,20,21,25,27', 646, 1, '2021-09-01 15:18:57'), (319, 'celue1', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 655, 1, '2021-09-01 15:42:22'), (320, 'ALL', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 265, 1, '2021-09-01 16:07:44'), (321, '9986_poicy', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 654, 1, '2021-09-01 16:22:07'), (322, '1', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 688, 1, '2021-09-01 17:51:58'), (323, '高危检测', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 693, 1, '2021-09-02 10:28:29'), (324, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26', 430, 1, '2021-09-02 15:42:13'), (325, '全量', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 706, 1, '2021-09-02 18:23:35'), (326, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 698, 1, '2021-09-03 10:35:55'), (327, 'test', '1,2,3,4,16,8,7,6,5', 694, 1, '2021-09-03 10:40:56'), (328, '全选', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 658, 1, '2021-09-03 12:53:23'), (329, 's', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 713, 1, '2021-09-03 14:49:23'), (330, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 714, 1, '2021-09-03 16:14:07'), (331, 'test', '1', 707, 1, '2021-09-03 17:18:54'), (332, '全部的', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26', 715, 1, '2021-09-03 18:41:52'), (333, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 718, 1, '2021-09-03 19:41:10'), (334, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 719, 1, '2021-09-05 10:40:52'), (335, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 689, 1, '2021-09-05 21:44:46'), (336, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 689, 1, '2021-09-05 22:21:41'), (337, 'test1', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 689, 1, '2021-09-05 22:27:24'), (338, '漏洞检测', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26', 685, 1, '2021-09-06 10:34:55'), (339, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 723, 1, '2021-09-06 11:03:05'), (340, '123', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 735, 1, '2021-09-06 19:40:23'), (341, '1', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 736, 1, '2021-09-06 21:55:05'), (342, '2', '14,26', 736, 1, '2021-09-06 21:55:12'), (343, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 694, 1, '2021-09-07 09:18:17'), (344, '全选1', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 737, 1, '2021-09-07 13:33:38'), (345, '所有', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 553, 1, '2021-09-07 14:35:53'), (346, '全部漏洞', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 737, 1, '2021-09-07 15:59:47'), (347, '驱蚊器翁无群二无群二无群', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 737, 1, '2021-09-07 16:33:21'), (348, '全量扫描', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 670, 1, '2021-09-07 17:17:17'), (349, '高危', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 648, 1, '2021-09-07 19:34:18'), (350, 'All', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 744, 1, '2021-09-08 10:47:04'), (351, '1', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 747, 1, '2021-09-08 13:56:47'), (352, 'demo', '14,26,1,2,3,4,5,6,7,8,16,18,20,21,25,27,9,10,11,12,13,15,17,19,22,23,24', 742, 1, '2021-09-08 15:49:34'), (353, '全', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 543, 1, '2021-09-08 16:27:45'), (354, '123', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 753, 1, '2021-09-09 15:04:05'), (355, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 756, 1, '2021-09-09 19:38:10'), (356, '9.9', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 541, 1, '2021-09-09 22:39:44'), (357, 'qw', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26', 757, 1, '2021-09-10 08:57:06'), (358, '全量', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 217, 1, '2021-09-10 17:15:04'), (359, '全部', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 761, 1, '2021-09-11 14:05:24'), (360, '中高全有', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,26,14,15', 765, 1, '2021-09-13 21:49:43'), (361, '1111', '27,8,3,1,5,2,4,6,7,16,18,20,21,25', 766, 1, '2021-09-13 22:13:13'), (362, '测试', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 541, 1, '2021-09-14 10:07:58'), (363, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26', 683, 1, '2021-09-14 10:10:12'), (364, '全部', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 769, 1, '2021-09-14 13:51:08'), (365, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 769, 1, '2021-09-14 14:16:30'), (366, '高危', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 751, 1, '2021-09-14 14:38:49'), (367, '命令执行', '1', 770, 1, '2021-09-15 10:34:40'), (368, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 764, 1, '2021-09-15 13:25:10'), (369, 't', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 771, 1, '2021-09-15 14:17:20'), (370, '全量扫描', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 771, 1, '2021-09-15 14:39:06'), (371, 'foo', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 105, 1, '2021-09-18 16:46:13'), (372, '2133', '2,3,4,5,6,7,8,16,18,20,21,25,27', 496, 1, '2021-09-22 12:45:05'), (373, '11', '20', 496, 1, '2021-09-22 14:12:30'), (374, '1123', '25', 496, 1, '2021-09-22 14:14:36'), (375, '13456556', '1,2', 496, 1, '2021-09-22 14:15:43'), (376, '全部', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26', 767, 1, '2021-09-22 14:45:16'), (377, 'demo', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 711, 1, '2021-09-22 14:50:12'), (378, 'springtest', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26', 723, 1, '2021-09-22 17:33:30'), (379, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 521, 1, '2021-09-24 12:28:07'), (380, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 760, 1, '2021-09-26 11:41:12'), (381, 'a', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 575, 1, '2021-09-28 15:02:39'), (382, '全选', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 780, 1, '2021-09-29 11:43:05'), (383, 'test', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 781, 1, '2021-09-29 13:02:45'), (384, 'EOS-TEST', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 588, 1, '2021-09-30 09:41:44'), (385, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 783, 1, '2021-09-30 11:30:38'), (386, '123', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26', 452, 1, '2021-09-30 17:17:08'), (387, 'JDsrc', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 629, 1, '2021-10-03 15:16:46'), (388, 'all', '1,2,3,4,5,6,7,8,16,18,20,21,25,27', 785, 1, '2021-10-06 15:43:23'), (389, 'ALL', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,14,26,9,10,11,12,13,15,17,19,22,23,24', 785, 1, '2021-10-07 10:08:11'), (390, 'JAVA代码安全扫描', '1,2,3,4,5,6,7,8,16,18,20,21,25,27,26,15', 788, 1, '2021-10-09 10:15:00');
COMMIT;

-- ----------------------------
-- Table structure for iast_vul_level
-- ----------------------------
DROP TABLE IF EXISTS `iast_vul_level`;
CREATE TABLE `iast_vul_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255)  NULL DEFAULT NULL COMMENT '漏洞等级名称 ：high、medium、low、info',
  `name_value` varchar(255)  NULL DEFAULT NULL COMMENT '漏洞等级值：高危、中危、低危、提示',
  `name_type` varchar(255)  NULL DEFAULT NULL,
  `name_type_en` varchar(255)  NULL DEFAULT NULL,
  `name_type_zh` varchar(255)  NULL DEFAULT NULL,
  `name_value_en` varchar(255)  NULL DEFAULT NULL,
  `name_value_zh` varchar(255)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 ;

-- ----------------------------
-- Records of iast_vul_level
-- ----------------------------
BEGIN;
INSERT INTO `iast_vul_level` VALUES (1, 'high', '高危', '高危漏洞', 'HIGH', '高危漏洞', 'HIGH', '高危'), (2, 'medium', '中危', '中危漏洞', 'MEDIUM', '中危漏洞', 'MEDIUM', '中危'), (3, 'low', '低危', '低危漏洞', 'LOW', '低危漏洞', 'LOW', '低危'), (4, 'info', '无风险', '提示信息', 'NOTE', '提示信息', 'NOTE', '无风险');
COMMIT;








DROP TABLE IF EXISTS `sca_artifact_db`;
CREATE TABLE `sca_artifact_db`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `cwe_id` varchar(20)  NULL DEFAULT NULL COMMENT 'CWE漏洞编号',
  `cve_id` varchar(20)  NULL DEFAULT NULL COMMENT 'CVE漏洞编号',
  `stage` varchar(255)  NULL DEFAULT NULL COMMENT '第三方包发布类型',
  `title` varchar(255)  NULL DEFAULT NULL COMMENT '漏洞标题',
  `overview` text  NULL COMMENT '漏洞概述',
  `teardown` text  NULL COMMENT '漏洞详细解释（markdown）',
  `group_id` varchar(256)  NULL DEFAULT NULL COMMENT '第三方组件的组信息',
  `artifact_id` varchar(256)  NULL DEFAULT NULL COMMENT '第三方组件的名称',
  `latest_version` varchar(50)  NULL DEFAULT NULL COMMENT '第三方组件的最新版本',
  `component_name` varchar(512)  NULL DEFAULT NULL COMMENT '第三方组件的human名称',
  `dt` int(11) NULL DEFAULT NULL COMMENT '数据添加时间',
  `reference` text  NULL COMMENT '相关链接/分析文章',
  `cvss_score` float(10, 0) NULL DEFAULT NULL COMMENT 'cvss2评分',
  `cvss3_score` float(10, 0) NULL DEFAULT NULL COMMENT 'cvss3评分',
  `level` varchar(20)  NULL DEFAULT NULL COMMENT '漏洞等级(以cvss3为准）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cve_id`(`cve_id`, `group_id`, `artifact_id`, `latest_version`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39499 CHARACTER SET = utf8mb4 ;

-- ----------------------------
-- Records of sca_artifact_db
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sca_maven_artifact
-- ----------------------------
DROP TABLE IF EXISTS `sca_maven_artifact`;
CREATE TABLE `sca_maven_artifact`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `aid` int(11) NULL DEFAULT NULL COMMENT 'artifactdb表关联主键',
  `safe_version` varchar(255)  NULL DEFAULT NULL COMMENT '推荐版本',
  `version_range` varchar(255)  NULL DEFAULT NULL COMMENT '组件版本范围',
  `cph_version` varchar(255)  NULL DEFAULT NULL COMMENT 'maven查询规范',
  `dt` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `patch` varchar(255)  NULL DEFAULT NULL COMMENT '补丁地址',
  `cph` varchar(255)  NULL DEFAULT NULL COMMENT '组件maven查询语法',
  `type` varchar(255)  NULL DEFAULT NULL COMMENT '包管理器类型',
  `group_id` varchar(255)  NULL DEFAULT NULL COMMENT '包管理器组',
  `artifact_id` varchar(255)  NULL DEFAULT NULL COMMENT 'artifact',
  `version` varchar(255)  NULL DEFAULT NULL COMMENT '版本',
  `signature` varchar(255)  NULL DEFAULT NULL COMMENT '版本哈希',
  `package_name` varchar(255)  NULL DEFAULT NULL COMMENT '包名',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cph_version`(`cph_version`, `aid`) USING BTREE,
  INDEX `aid`(`aid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66971721 CHARACTER SET = utf8mb4 ;



DROP TABLE IF EXISTS `sca_maven_db`;
CREATE TABLE `sca_maven_db`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_id` varchar(255)  NULL DEFAULT NULL COMMENT 'Java第三方组件的groupID',
  `atrifact_id` varchar(255)  NULL DEFAULT NULL COMMENT 'Java第三方组件的ArtifactId',
  `version` varchar(255)  NULL DEFAULT NULL COMMENT 'Java第三方组件的版本号',
  `sha_1` varchar(255)  NULL DEFAULT NULL COMMENT 'Java包的SHA-1值，用于与灵芝Agent获取的数据进行匹配',
  `package_name` varchar(255)  NULL DEFAULT NULL COMMENT '包名',
  `aql` varchar(255)  NULL DEFAULT NULL COMMENT '组件查询语言',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sha_1`(`sha_1`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 193562 CHARACTER SET = utf8mb4 ;

DROP TABLE IF EXISTS `sca_vul_db`;
CREATE TABLE `sca_vul_db`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `package_type` varchar(20)  NULL DEFAULT NULL COMMENT '包管理器',
  `cve` varchar(20)  NULL DEFAULT NULL COMMENT 'cve编号',
  `cwe` varchar(20)  NULL DEFAULT NULL COMMENT 'cwe编号',
  `vul_name` varchar(255)  NULL DEFAULT NULL COMMENT '漏洞名称',
  `vul_level` varchar(20)  NULL DEFAULT NULL COMMENT '漏洞等级',
  `cve_href` varchar(255)  NULL DEFAULT NULL COMMENT 'CVE地址',
  `cwe_href` varchar(255)  NULL DEFAULT NULL COMMENT 'CWE地址',
  `aql` varchar(255)  NULL DEFAULT NULL COMMENT '组件查询语言：',
  `version_range` varchar(255)  NULL DEFAULT NULL COMMENT '版本范围',
  `version_condition` varchar(255)  NULL DEFAULT NULL COMMENT '版本范围-条件',
  `latest_version` varchar(255)  NULL DEFAULT NULL COMMENT '最新版本',
  `overview` varchar(255)  NULL DEFAULT NULL COMMENT '漏洞概述',
  `teardown` varchar(2000)  NULL DEFAULT NULL COMMENT '漏洞详细描述',
  `url` varchar(255)  NULL DEFAULT NULL COMMENT '漏洞地址',
  `source` varchar(20)  NULL DEFAULT NULL COMMENT '数据来源',
  `dt` int(11) NULL DEFAULT NULL COMMENT '时间戳',
  `extra` varchar(2000)  NULL DEFAULT NULL COMMENT '附加数据，暂时不知道是否有用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `package_type`(`package_type`, `cve`, `cwe`, `vul_name`, `aql`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31963 CHARACTER SET = utf8mb4 ;





DROP TABLE IF EXISTS `sca2_cve_relation`;
CREATE TABLE `sca2_cve_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ä¸»é”®',
  `cve` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT 'CVEç¼–å·',
  `cnvd` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT 'CNVDç¼–å·',
  `cnnvd` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT 'CNNVDç¼–å·',
  `ghsa` varchar(64) NOT NULL,
  `vul_title` varchar(512) NOT NULL,
  `vul_title_en` varchar(512) NOT NULL,
  `cwe` varchar(255) NOT NULL,
  `cwe_info` json DEFAULT NULL,
  `cpe_list` json DEFAULT NULL,
  `cvss2_list` json DEFAULT NULL,
  `cvss3_list` json DEFAULT NULL,
  `description` json DEFAULT NULL,
  `poc` json DEFAULT NULL,
  `fix_plan` json DEFAULT NULL,
  `references` json DEFAULT NULL,
  `severity` varchar(32) NOT NULL,
  `publish_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_cve` (`cve`) USING BTREE,
  KEY `idx_cnvd` (`cnvd`) USING BTREE,
  KEY `idx_cnnvd` (`cnnvd`) USING BTREE,
  KEY `sca2_cve_relation_cve_IDX` (`cve`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=259783 DEFAULT CHARSET=utf8mb4 COMMENT='æ¼æ´žä¿¡æ¯è¡¨';


DROP TABLE IF EXISTS `sca2_license_level`;
CREATE TABLE `sca2_license_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `identifier` varchar(64) DEFAULT NULL,
  `level_id` tinyint(4) DEFAULT NULL COMMENT '风险等级 1高危，2中危，3低危，0无风险',
  `level_desc` varchar(64) DEFAULT NULL COMMENT '风险等级描述',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `sca2_package_dependency`;
CREATE TABLE `sca2_package_dependency` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `package_name` varchar(255) NOT NULL DEFAULT '' COMMENT '组件name',
  `p_version` varchar(255) NOT NULL COMMENT '组件版本',
  `dependency_package_name` varchar(255) NOT NULL COMMENT '依赖组件name',
  `d_version` varchar(255) NOT NULL COMMENT '依赖组件版本',
  `ecosystem` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pn_v_es` (`package_name`,`p_version`,`ecosystem`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=93329021 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `sca2_package_license_info`;
CREATE TABLE `sca2_package_license_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `license_name` varchar(128) DEFAULT NULL COMMENT '许可证名称',
  `identifier` varchar(64) DEFAULT NULL COMMENT '身份缩写',
  `fsf_free` varchar(20) DEFAULT NULL COMMENT '是否免费',
  `osi_approved` varchar(20) DEFAULT NULL COMMENT '意义不明',
  `deprecated` varchar(20) DEFAULT NULL COMMENT '弃用版本',
  `license_text` text COMMENT '许可证介绍',
  `create_at` datetime DEFAULT NULL COMMENT '改变时间',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `ix_package_license_info_identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=485 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `sca2_package_v2`;
CREATE TABLE `sca2_package_v2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huo_xian_product_id` varchar(255) DEFAULT NULL,
  `aql` varchar(255) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `ecosystem` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `version_publish_time` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `fields` (`ecosystem`,`name`,`version`) USING BTREE,
  KEY `hash` (`hash`) USING BTREE,
  KEY `aql` (`aql`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22262410 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `sca2_vul_package_v2`;
CREATE TABLE `sca2_vul_package_v2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cve` varchar(64) NOT NULL DEFAULT '',
  `ecosystem` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `severity` varchar(32) DEFAULT NULL,
  `introduced` varchar(64) DEFAULT NULL,
  `introduced_vcode` varchar(255) DEFAULT NULL,
  `final_version` varchar(64) DEFAULT NULL,
  `final_vcode` varchar(255) DEFAULT NULL,
  `fixed` varchar(64) NOT NULL DEFAULT '',
  `fixed_vcode` varchar(64) DEFAULT NULL,
  `safe_version` varchar(64) NOT NULL DEFAULT '',
  `safe_vcode` varchar(64) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE,
  KEY `e_name` (`ecosystem`,`name`),
  KEY `vcode` (`introduced_vcode`,`fixed_vcode`),
  KEY `sca2_vul_package_v2_cve_IDX` (`cve`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=218447 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `sca_record`;
CREATE TABLE `sca_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page` int(11) DEFAULT NULL COMMENT '当前页',
  `total` int(11) DEFAULT NULL COMMENT '总页数',
  `dt` int(11) DEFAULT NULL COMMENT '更新时间s',
  `type` varchar(255) DEFAULT NULL COMMENT '记录类型',
  `data` varchar(255) DEFAULT NULL COMMENT '记录数据',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;


SET FOREIGN_KEY_CHECKS = 1;
