SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

INSERT IGNORE INTO `django_celery_beat_intervalschedule`(`id`, `every`, `period`) VALUES (1, 10, 'seconds');
INSERT IGNORE INTO `django_celery_beat_intervalschedule`(`id`, `every`, `period`) VALUES (2, 1, 'hours');
INSERT IGNORE INTO `django_celery_beat_intervalschedule`(`id`, `every`, `period`) VALUES (3, 5, 'minutes');
INSERT IGNORE INTO `django_celery_beat_intervalschedule`(`id`, `every`, `period`) VALUES (4, 1, 'days');
INSERT IGNORE INTO `django_celery_beat_intervalschedule`(`id`, `every`, `period`) VALUES (5, 30, 'days');
 
INSERT IGNORE INTO `django_celery_beat_periodictask`(`name`, `task`, `args`, `kwargs`, `queue`, `exchange`, `routing_key`, `expires`, `enabled`, `last_run_at`, `total_run_count`, `date_changed`, `description`, `crontab_id`, `interval_id`, `solar_id`, `one_off`, `start_time`, `priority`, `headers`, `clocked_id`, `expire_seconds`) VALUES ('engine.heartbeat', 'core.tasks.heartbeat', '[]', '{}', NULL, NULL, NULL, NULL, 1, '2021-05-08 05:34:02.743450', 509, '2021-05-08 05:35:33.100817', '', NULL, 2, NULL, 0, NULL, NULL, '{}', NULL, NULL);
INSERT IGNORE INTO `django_celery_beat_periodictask`(`name`, `task`, `args`, `kwargs`, `queue`, `exchange`, `routing_key`, `expires`, `enabled`, `last_run_at`, `total_run_count`, `date_changed`, `description`, `crontab_id`, `interval_id`, `solar_id`, `one_off`, `start_time`, `priority`, `headers`, `clocked_id`, `expire_seconds`) VALUES ('engine.update_agent_status', 'core.tasks.update_agent_status', '[]', '{}', NULL, NULL, NULL, NULL, 1, '2021-05-08 06:25:47.527645', 2509, '2021-05-08 06:27:22.947828', '', NULL, 3, NULL, 0, NULL, NULL, '{}', NULL, NULL);
INSERT IGNORE INTO `django_celery_beat_periodictask`(`name`, `task`, `args`, `kwargs`, `queue`, `exchange`, `routing_key`, `expires`, `enabled`, `last_run_at`, `total_run_count`, `date_changed`, `description`, `crontab_id`, `interval_id`, `solar_id`, `one_off`, `start_time`, `priority`, `headers`, `clocked_id`, `expire_seconds`) VALUES ('engine.update_sca', 'core.tasks.update_sca', '[]', '{}', NULL, NULL, NULL, NULL, 1, '2021-05-08 06:25:35.184066', 8, '2021-05-08 06:27:22.926700', '', NULL, 4, NULL, 0, NULL, NULL, '{}', NULL, NULL);

INSERT IGNORE INTO `iast_deploy`(`desc`, `middleware`, `os`) VALUES ('**手动修改**\n\n进入tomcat主目录，找到`bin/catalina.sh`文件，在**文件首行**增加如下配置：\n```bash\nCATALINA_OPTS=\"-javaagent:/path/to/server/agent.jar -Dproject.name=<project name>\"\n```\n\n**注意：**`<project name>`与创建的项目名称保持一致，agent将自动关联至项目；如果不配置该参数，需要进入项目管理中进行手工绑定。', 'tomcat', 'linux');
INSERT IGNORE INTO `iast_deploy`(`desc`, `middleware`, `os`) VALUES ('####  JBossAS 6\n\n进入JBoss容器的主目录，在`bin/run.sh`文件中找到`# Setup JBoss specific properties`所在行，在该行的下面插入如下行：\n```bash\nJAVA_OPTS=\"$JAVA_OPTS \"-javaagent:/path/to/server/agent.jar\" \"-Dproject.name=<project name>\n```\n**注意：**`<project name>`与创建的项目名称保持一致，agent将自动关联至项目；如果不配置该参数，需要进入项目管理中进行手工绑定。\n\n\n#### JBossAS 7、JBossWildfly\n\n进入JBoss容器的主目录，根据当前服务器的启动类型：standalone、domain修改对应的配置文件\n\n##### Standalone模式\n打开`bin/standalone.sh`文件，定位`# Display our environment`所在的行，在其上方插入自定义配置，如下：\n```bash\nJAVA_OPTS=\"$JAVA_OPTS \"-javaagent:/path/to/server/agent.jar\" \"-Dproject.name=<project name>\n```\n**注意：**`<project name>`与创建的项目名称保持一致，agent将自动关联至项目；如果不配置该参数，需要进入项目管理中进行手工绑定。\n\n##### domain模式\ndomain模式下的部署方式与Standalone模式类似，请自行查询', 'jboss', 'linux');
INSERT IGNORE INTO `iast_deploy`(`desc`, `middleware`, `os`) VALUES ('> Jetty\n#### 手工修改\n1.进入jetty的根目录，打开`bin/jetty.sh`文件，找到`Add jetty properties to Java VM options.`所在行，在下面行插入`JAVA_OPTIONS+=( \"-javaagent:/opt/agent/agent.jar=token=e7509bf7-e44f-4e1f-8e25-5079e2540c63\")`\n\n2.重启jetty服务器\n\n#### 自动修改\n进入tomcat容器的主目录，找到`bin/jetty.sh`文件，使用下面的shell命令修改jetty.sh文件\n```bash\nsed \"$(cat jetty.sh |grep -n \\\"Add jetty properties to Java VM options\\\"|cut -d \":\" -f1) aJAVA_OPTS=\\\"\\$JAVA_OPTS\\ \\\"-javaagent:/opt/agent/agent.jar=token=e7509bf7-e44f-4e1f-8e25-5079e2540c63\" -i jetty.sh\n```', 'jetty', 'linux');
INSERT IGNORE INTO `iast_deploy`(`desc`, `middleware`, `os`) VALUES ('> Resin\n#### 手动修改\n进入resin容器的主目录，打开`conf/cluster-default.xml`文件，定位到`<server-default>`所在的行，在该行下面插入`<jvm-arg>-javaagent:/opt/agent/agent.jar</jvm-arg>`', 'resin', 'linux');
INSERT IGNORE INTO `iast_deploy`(`desc`, `middleware`, `os`) VALUES ('> WebLogic配置agent\n\n#### 手动修改\n**非集群方式**\n\n进入WebLogic目录，打开`bin/startWebLogic.sh`文件，找到`JAVA_OPTIONS=\"${SAVE_JAVA_OPTIONS}\"`所在行，在该行的下面增加一行\n\n```\nJAVA_OPTIONS=\"-javaagent:${DOMAIN_HOME}/agent/agent.jar\"\n```\n\n**集群方式**\n\n##### 方式一、通过weblogic的console\n\n访问weblogic的console，例如：\n\n1.找到“环境”下的“服务器”，然后在服务器列表中点击需要安装agent的服务器，如：AdminServer\n\n![img](https://i0x0fy4ibf.feishu.cn/space/api/box/stream/download/asynccode/?code=6920cd75d5484b9dcae5f67a8aad155f_8f118824ce50c961_boxcngZyBvKQSo849VNXlQBJuge_YuAYCtHZdJXJCwvIlL3fxPrHcOQuN1Ce)\n\n2.进入服务器详情，点击“服务器启动”，在下方的参数一栏中填入javaagent的参数`-javaagent:/opt/agent/agent.jar`，如：\n\n![img](https://i0x0fy4ibf.feishu.cn/space/api/box/stream/download/asynccode/?code=e32f0fdef6dc3e199632ee96e9e14aa5_8f118824ce50c961_boxcnfxBALg44nqZNvWICeYo93f_mfxihZ670SCKmxtDiZ3ykAkC556TiWMW)\n\n3.重启服务器，使配置生效\n\n![img](https://i0x0fy4ibf.feishu.cn/space/api/box/stream/download/asynccode/?code=346e5344abca7fae8d3cdc89c05f2fbd_8f118824ce50c961_boxcn3SbZEAQhl0B4RSMJpZbibv_o17TRySNfvsOwiyoAYdmpC7GU9XmegU4)\n\n\n\n##### 方式二、通过配置weblogic的config.xml文件\n\n找到`/u01/oracle/weblogic/user_projects/domains/base_domain/config`目录下的config.xml文件，定位到`<server-start>`标签下的`<arguments>`标签，在标签内添加如下配置：\n```\n-javaagent:/opt/agent/agent.jar\n```\n\n\n', 'weblogic', 'linux');
INSERT IGNORE INTO `iast_deploy`(`desc`, `middleware`, `os`) VALUES ('> WebSphere\n![websphere-01](/upload/masterimg/websphere-01.png)\n![websphere-02](/upload/masterimg/websphere-02.png)\n![websphere-03](/upload/masterimg/websphere-03.png)\n', 'websphere', 'linux');
INSERT IGNORE INTO `iast_deploy`(`desc`, `middleware`, `os`) VALUES ('> WebLogic\n![weblogic-01](/upload/masterimg/weblogic-01.png)\n![weblogic-02](/upload/masterimg/weblogic-02.png)\n![weblogic-03](/upload/masterimg/weblogic-03.png)\n![weblogic-04](/upload/masterimg/weblogic-04.png)', 'weblogic', 'windows');
INSERT IGNORE INTO `iast_deploy`(`desc`, `middleware`, `os`) VALUES ('**SpringBoot**\n\n1. 下载`agent.jar`，然后放入具有写入权限的目录中，如：`/tmp/`\n\n2. 针对SpringBoot应用\n	1). 如果使用**war包**的方式部署，agent的安装方式为具体中间件的安装方式\n	2). 如果使用`java -jar app.jar`的方式部署，则直接在启动命令中增加启动参数`-javaagent:/path/to/agent.jar`即可，如：`java -javaagent:/path/to/agent.jar -Dproject.name=<project name> -jar app.jar`\n	\n**注意：**`<project name>`与创建的项目名称保持一致，agent将自动关联至项目；如果不配置该参数，需要进入项目管理中进行手工绑定。', 'SpringBoot', 'linux');
INSERT IGNORE INTO `iast_deploy`(`desc`, `middleware`, `os`) VALUES ('**SpringBoot**\n\n1. 下载`agent.jar`，然后放入具有写入权限的目录中，如：`/tmp/`\n\n2. 针对SpringBoot应用\n	1）如果使用**war包**的方式部署，agent的安装方式为具体中间件的安装方式；\n	2）如果使用`java -jar app.jar`的方式部署，则直接在启动命令中增加启动参数`-javaagent:/path/to/agent.jar`即可，如：`java -javaagent:/path/to/agent.jar -Dproject.name=<project name> -jar app.jar`\n	\n**注意：**`<project name>`与创建的项目名称保持一致，agent将自动关联至项目；如果不配置该参数，需要进入项目管理中进行手工绑定。', 'SpringBoot', 'windows');

-- 创建默认用户
INSERT IGNORE INTO `auth_user`(`password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `phone`) VALUES ('pbkdf2_sha256$180000$tpUFyXYrIGXh$PIqkgklZerTwKsDe5s9P+6USI/Z2Yq+5J6oXx4kbiKI=', '2021-03-23 18:32:44.117558', 2, 'admin', 'admin', 'admin', 'admin@huoxian.cn', 1, 1, '2020-01-01 00:00:00.000000', 1);

-- 创建租户
INSERT IGNORE INTO `auth_talent`(`talent_name`, `create_time`, `update_time`, `created_by`, `is_active`) VALUES ('默认租户', 1610532209, 1611031026, 1, 1);

-- 创建部门
INSERT IGNORE INTO `auth_department`(`name`, `create_time`, `update_time`, `created_by`, `parent_id`) VALUES ('默认部门', 1611031807, 1611045352, 1, -1);

-- 创建组
INSERT IGNORE INTO `auth_group`(`name`) VALUES ('system_admin');
INSERT IGNORE INTO `auth_group`(`name`) VALUES ('talent_admin');
INSERT IGNORE INTO `auth_group`(`name`) VALUES ('user');

-- 创建关联关系
INSERT IGNORE INTO `auth_department_talent`(`department_id`, `talent_id`) VALUES (1, 1);
INSERT IGNORE INTO `auth_user_department`(`user_id`, `department_id`) VALUES (1, 1);
INSERT IGNORE INTO `auth_user_groups`(`user_id`, `group_id`) VALUES (1, 2);

SET FOREIGN_KEY_CHECKS = 1;SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;


CREATE TABLE IF NOT EXISTS `iast_replay_queue`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relation_id` int(11) NULL DEFAULT NULL COMMENT '待检测的漏洞ID',
  `state` int(1) NULL DEFAULT NULL COMMENT '状态，0-待处理、1-待重放、2-已重放',
  `count` int(11) NULL DEFAULT NULL COMMENT '重放次数',
  `result` int(1) NULL DEFAULT NULL COMMENT '重放结果，0-无漏洞，1-存在漏洞，2-失败',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `verify_time` int(11) NULL DEFAULT NULL COMMENT '结果更新时间',
  `uri` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标URI',
  `method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `scheme` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求协议，http/https',
  `header` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求头',
  `params` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `body` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求体',
  `replay_type` int(1) NULL DEFAULT NULL COMMENT '重放类型，1-漏洞重放、2-请求重放',
  `agent_id` int(11) NULL DEFAULT NULL COMMENT 'Agent ID，外键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `iast_agent_method_pool_replay`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) NULL DEFAULT NULL COMMENT 'Agent',
  `url` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'URL',
  `uri` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'URI',
  `http_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'HTTP请求方法',
  `http_scheme` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '协议',
  `http_protocol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'HTTP协议',
  `req_header` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求头',
  `req_params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `req_data` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求体',
  `res_header` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '响应头',
  `res_body` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '响应体',
  `context_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用上下文',
  `language` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语言',
  `method_pool` json NULL COMMENT '方法池',
  `clent_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户端IP',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `replay_id` int(11) NULL DEFAULT NULL COMMENT '重放ID',
  `replay_type` int(11) NULL DEFAULT NULL COMMENT '重放请求类型',
  `relation_id` int(11) NULL DEFAULT NULL COMMENT '原始请求关联ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `agent_id`(`agent_id`) USING BTREE,
  INDEX `replay_id`(`replay_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- 增加定时任务处理漏洞重放数据
INSERT IGNORE INTO `django_celery_beat_periodictask`(`name`, `task`, `args`, `kwargs`, `queue`, `exchange`, `routing_key`, `expires`, `enabled`, `last_run_at`, `total_run_count`, `date_changed`, `description`, `crontab_id`, `interval_id`, `solar_id`, `one_off`, `start_time`, `priority`, `headers`, `clocked_id`, `expire_seconds`) VALUES ('engine.clear_error_log', 'core.tasks.clear_error_log', '[]', '{}', NULL, NULL, NULL, NULL, 1, '2021-07-01 16:42:11.173748', 0, '2021-07-01 09:56:51.153195', '', NULL, 4, NULL, 0, NULL, NULL, '{}', NULL, NULL);
INSERT IGNORE INTO `django_celery_beat_periodictask`(`name`, `task`, `args`, `kwargs`, `queue`, `exchange`, `routing_key`, `expires`, `enabled`, `last_run_at`, `total_run_count`, `date_changed`, `description`, `crontab_id`, `interval_id`, `solar_id`, `one_off`, `start_time`, `priority`, `headers`, `clocked_id`, `expire_seconds`) VALUES ('engine.vul_recheck', 'core.tasks.vul_recheck', '[]', '{}', NULL, NULL, NULL, NULL, 1, '2021-07-02 15:39:52.544385', 346, '2021-07-02 15:41:57.661959', '', NULL, 3, NULL, 0, NULL, NULL, '{}', NULL, NULL);


SET FOREIGN_KEY_CHECKS=1;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `iast_agent` ADD COLUMN `language` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'JAVA' COMMENT '语言，JAVA、PYTHON' AFTER `is_core_running`;

ALTER TABLE `iast_agent` MODIFY COLUMN `is_core_running` int(11) NULL DEFAULT NULL COMMENT '核心引擎是否启动' AFTER `online`;

ALTER TABLE `iast_agent_method_pool` DROP COLUMN `language`;

ALTER TABLE `iast_agent_method_pool_replay` DROP COLUMN `language`;

ALTER TABLE `iast_asset` DROP COLUMN `language`;

ALTER TABLE `iast_heartbeat` DROP COLUMN `hostname`;

ALTER TABLE `iast_heartbeat` DROP COLUMN `network`;

ALTER TABLE `iast_heartbeat` DROP COLUMN `pid`;

ALTER TABLE `iast_heartbeat` DROP COLUMN `env`;

ALTER TABLE `iast_server` MODIFY COLUMN `env` text;

ALTER TABLE `iast_server` ADD COLUMN `network` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网络情况' AFTER `update_time`;

ALTER TABLE `iast_server` ADD COLUMN `pid` int(11) NULL DEFAULT NULL COMMENT '进程ID ' AFTER `network`;

ALTER TABLE `iast_server` DROP COLUMN `name`;

ALTER TABLE `iast_server` DROP COLUMN `agent_version`;

ALTER TABLE `iast_server` DROP COLUMN `latest_agent_version`;

ALTER TABLE `iast_server` DROP COLUMN `language`;

ALTER TABLE `iast_vulnerability` ADD COLUMN `method_pool_id` int(11) NULL DEFAULT 0 COMMENT '方法池ID ' AFTER `param_name`;

ALTER TABLE `iast_vulnerability` DROP COLUMN `language`;

DROP TABLE `iast_hook_talent_strategy`;

SET FOREIGN_KEY_CHECKS=1;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `iast_agent_method_pool` ADD COLUMN `req_header_for_search` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '用于搜索功能的请求头，请求方法、uri、参数、协议、请求头的拼接' AFTER `pool_sign`;

ALTER TABLE `iast_agent_method_pool` ADD CONSTRAINT `iast_agent_method_pool_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `iast_agent` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `iast_agent_method_pool` ADD INDEX `update_time`(`update_time`) USING BTREE;

-- ----------------------------
-- Table structure for iast_deploy
-- ----------------------------

CREATE TABLE IF NOT EXISTS `iast_deploy` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `desc` mediumtext COMMENT '安装描述',
  `middleware` varchar(255) DEFAULT NULL COMMENT '中间件',
  `language` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of iast_deploy
-- ----------------------------
BEGIN;
INSERT IGNORE INTO `iast_deploy` VALUES (1, '**手动修改**\n\n进入tomcat主目录，找到`bin/catalina.sh`文件，在文件首行增加如下配置：\n```bash\nCATALINA_OPTS=\"-javaagent:/path/to/server/agent.jar -Dproject.name=<project name>\"\n```\n\n**注意：**`<project name>`与创建的项目名称保持一致，agent将自动关联至项目；如果不配置该参数，需要进入项目管理中进行手工绑定。', 'tomcat', 'java');
INSERT IGNORE INTO `iast_deploy` VALUES (2, '####  JBossAS 6\n\n进入JBoss容器的主目录，在`bin/run.sh`文件中找到`# Setup JBoss specific properties`所在行，在该行的下面插入如下行：\n```bash\nJAVA_OPTS=\"$JAVA_OPTS \"-javaagent:/path/to/server/agent.jar\" \"-Dproject.name=<project name>\n```\n**注意：**`<project name>`与创建的项目名称保持一致，agent将自动关联至项目；如果不配置该参数，需要进入项目管理中进行手工绑定。\n\n\n#### JBossAS 7、JBossWildfly\n\n进入JBoss容器的主目录，根据当前服务器的启动类型：standalone、domain修改对应的配置文件\n\n##### Standalone模式\n打开`bin/standalone.sh`文件，定位`# Display our environment`所在的行，在其上方插入自定义配置，如下：\n```bash\nJAVA_OPTS=\"$JAVA_OPTS \"-javaagent:/path/to/server/agent.jar\" \"-Dproject.name=<project name>\n```\n**注意：**`<project name>`与创建的项目名称保持一致，agent将自动关联至项目；如果不配置该参数，需要进入项目管理中进行手工绑定。\n\n##### domain模式\ndomain模式下的部署方式与Standalone模式类似，请自行查询', 'jboss', 'java');
INSERT IGNORE INTO `iast_deploy` VALUES (3, '> Jetty\n#### 手工修改\n1.进入jetty的根目录，打开`bin/jetty.sh`文件，找到`Add jetty properties to Java VM options.`所在行，在下面行插入`JAVA_OPTIONS+=( \"-javaagent:/opt/agent/agent.jar=token=e7509bf7-e44f-4e1f-8e25-5079e2540c63\")`\n\n2.重启jetty服务器\n\n#### 自动修改\n进入tomcat容器的主目录，找到`bin/jetty.sh`文件，使用下面的shell命令修改jetty.sh文件\n```bash\nsed \"$(cat jetty.sh |grep -n \\\"Add jetty properties to Java VM options\\\"|cut -d \":\" -f1) aJAVA_OPTS=\\\"\\$JAVA_OPTS\\ \\\"-javaagent:/opt/agent/agent.jar=token=e7509bf7-e44f-4e1f-8e25-5079e2540c63\" -i jetty.sh\n```', 'jetty', 'java');
INSERT IGNORE INTO `iast_deploy` VALUES (4, '> Resin\n#### 手动修改\n进入resin容器的主目录，打开`conf/cluster-default.xml`文件，定位到`<server-default>`所在的行，在该行下面插入`<jvm-arg>-javaagent:/opt/agent/agent.jar</jvm-arg>`', 'resin', 'java');
INSERT IGNORE INTO `iast_deploy` VALUES (5, '> WebLogic配置agent\n\n#### 手动修改\n**非集群方式**\n\n进入WebLogic目录，打开`bin/startWebLogic.sh`文件，找到`JAVA_OPTIONS=\"${SAVE_JAVA_OPTIONS}\"`所在行，在该行的下面增加一行\n\n```\nJAVA_OPTIONS=\"-javaagent:${DOMAIN_HOME}/agent/agent.jar\"\n```\n\n**集群方式**\n\n##### 方式一、通过weblogic的console\n\n访问weblogic的console，例如：\n\n1.找到“环境”下的“服务器”，然后在服务器列表中点击需要安装agent的服务器，如：AdminServer\n\n![img](https://i0x0fy4ibf.feishu.cn/space/api/box/stream/download/asynccode/?code=6920cd75d5484b9dcae5f67a8aad155f_8f118824ce50c961_boxcngZyBvKQSo849VNXlQBJuge_YuAYCtHZdJXJCwvIlL3fxPrHcOQuN1Ce)\n\n2.进入服务器详情，点击“服务器启动”，在下方的参数一栏中填入javaagent的参数`-javaagent:/opt/agent/agent.jar`，如：\n\n![img](https://i0x0fy4ibf.feishu.cn/space/api/box/stream/download/asynccode/?code=e32f0fdef6dc3e199632ee96e9e14aa5_8f118824ce50c961_boxcnfxBALg44nqZNvWICeYo93f_mfxihZ670SCKmxtDiZ3ykAkC556TiWMW)\n\n3.重启服务器，使配置生效\n\n![img](https://i0x0fy4ibf.feishu.cn/space/api/box/stream/download/asynccode/?code=346e5344abca7fae8d3cdc89c05f2fbd_8f118824ce50c961_boxcn3SbZEAQhl0B4RSMJpZbibv_o17TRySNfvsOwiyoAYdmpC7GU9XmegU4)\n\n\n\n##### 方式二、通过配置weblogic的config.xml文件\n\n找到`/u01/oracle/weblogic/user_projects/domains/base_domain/config`目录下的config.xml文件，定位到`<server-start>`标签下的`<arguments>`标签，在标签内添加如下配置：\n```\n-javaagent:/opt/agent/agent.jar\n```\n\n\n', 'weblogic', 'java');
INSERT IGNORE INTO `iast_deploy` VALUES (6, '> WebSphere\n![websphere-01](/upload/masterimg/websphere-01.png)\n![websphere-02](/upload/masterimg/websphere-02.png)\n![websphere-03](/upload/masterimg/websphere-03.png)\n', 'websphere', 'java');
INSERT IGNORE INTO `iast_deploy` VALUES (9, '**SpringBoot**\n\n1. 下载`agent.jar`，然后放入具有写入权限的目录中，如：`/tmp/`\n\n2. 针对SpringBoot应用\n	1). 如果使用**war包**的方式部署，agent的安装方式为具体中间件的安装方式\n	2). 如果使用`java -jar app.jar`的方式部署，则直接在启动命令中增加启动参数`-javaagent:/path/to/agent.jar`即可，如：`java -javaagent:/path/to/agent.jar -Dproject.name=<project name> -jar app.jar`\n	\n**注意：**`<project name>`与创建的项目名称保持一致，agent将自动关联至项目；如果不配置该参数，需要进入项目管理中进行手工绑定。', 'SpringBoot', 'java');
INSERT IGNORE INTO `iast_deploy` VALUES (10, '修改待检测的Django项目中的settings.py, 在configure middleware位置，增加一条\r\n```bash\r\n	MIDDLEWARE = [ \r\n		\'dongtai_agent_python.middlewares.django_middleware.FireMiddleware\',\r\n		#...\r\n	]\r\n```\r\n', 'Django', 'python');
COMMIT;

-- ----------------------------
-- Table structure for iast_document
-- ----------------------------

CREATE TABLE IF NOT EXISTS `iast_document`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for iast_profile
-- ----------------------------

CREATE TABLE IF NOT EXISTS `iast_profile`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `iast_profile_UN`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for iast_program_language
-- ----------------------------

CREATE TABLE IF NOT EXISTS `iast_program_language`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS=1;

BEGIN;
INSERT IGNORE INTO `iast_document` VALUES (1, 'Java Agent快速部署', 'https://hxsecurity.github.io/DongTai-Doc/#/doc/tutorial/quickstart', 99, 'JAVA');
INSERT IGNORE INTO `iast_document` VALUES (2, 'Java Agent Release Note', 'https://hxsecurity.github.io/DongTai-Doc/#/doc/changes/JavaAgent', 100, 'JAVA');
INSERT IGNORE INTO `iast_document` VALUES (3, '讨论区(Q&A)', 'https://hxsecurity.github.io/DongTai-Doc/#/doc/qa', 97, 'JAVA');
INSERT IGNORE INTO `iast_document` VALUES (4, 'DongTai探针参数配置', 'https://hxsecurity.github.io/DongTai-Doc/#/doc/tutorial/args', 98, 'JAVA');
INSERT IGNORE INTO `iast_document` VALUES (6, 'DongTai探针参数配置', 'https://hxsecurity.github.io/DongTai-Doc/#/doc/tutorial/args', 98, 'PYTHON');
INSERT IGNORE INTO `iast_document` VALUES (7, '讨论区(Q&A)', 'https://hxsecurity.github.io/DongTai-Doc/#/doc/qa', 97, 'PYTHON');
INSERT IGNORE INTO `iast_document` VALUES (8, 'Python Agent快速部署', 'https://hxsecurity.github.io/DongTai-Doc/#/doc/tutorial/quickstart?id=python%e7%89%88%e6%9c%ac%e5%bf%ab%e9%80%9f%e4%bd%93%e9%aa%8c', 99, 'PYTHON');
INSERT IGNORE INTO `iast_document` VALUES (9, 'Python Agent Release Note', 'https://hxsecurity.github.io/DongTai-Doc/#/doc/changes/PythonAgent', 100, 'PYTHON');
INSERT IGNORE INTO `iast_profile`(`key`, `value`) VALUES ('enable_update', 'TRUE');
COMMIT;
