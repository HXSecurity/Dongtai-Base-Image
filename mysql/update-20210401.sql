SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

INSERT INTO `django_celery_beat_intervalschedule`(`id`, `every`, `period`) VALUES (1, 10, 'seconds');
INSERT INTO `django_celery_beat_intervalschedule`(`id`, `every`, `period`) VALUES (2, 1, 'hours');
INSERT INTO `django_celery_beat_intervalschedule`(`id`, `every`, `period`) VALUES (3, 5, 'minutes');
INSERT INTO `django_celery_beat_intervalschedule`(`id`, `every`, `period`) VALUES (4, 1, 'days');
INSERT INTO `django_celery_beat_intervalschedule`(`id`, `every`, `period`) VALUES (5, 30, 'days');
 
INSERT INTO `django_celery_beat_periodictask`(`name`, `task`, `args`, `kwargs`, `queue`, `exchange`, `routing_key`, `expires`, `enabled`, `last_run_at`, `total_run_count`, `date_changed`, `description`, `crontab_id`, `interval_id`, `solar_id`, `one_off`, `start_time`, `priority`, `headers`, `clocked_id`, `expire_seconds`) VALUES ('engine.heartbeat', 'core.tasks.heartbeat', '[]', '{}', NULL, NULL, NULL, NULL, 1, '2021-05-08 05:34:02.743450', 509, '2021-05-08 05:35:33.100817', '', NULL, 2, NULL, 0, NULL, NULL, '{}', NULL, NULL);
INSERT INTO `django_celery_beat_periodictask`(`name`, `task`, `args`, `kwargs`, `queue`, `exchange`, `routing_key`, `expires`, `enabled`, `last_run_at`, `total_run_count`, `date_changed`, `description`, `crontab_id`, `interval_id`, `solar_id`, `one_off`, `start_time`, `priority`, `headers`, `clocked_id`, `expire_seconds`) VALUES ('engine.update_agent_status', 'core.tasks.update_agent_status', '[]', '{}', NULL, NULL, NULL, NULL, 1, '2021-05-08 06:25:47.527645', 2509, '2021-05-08 06:27:22.947828', '', NULL, 3, NULL, 0, NULL, NULL, '{}', NULL, NULL);
INSERT INTO `django_celery_beat_periodictask`(`name`, `task`, `args`, `kwargs`, `queue`, `exchange`, `routing_key`, `expires`, `enabled`, `last_run_at`, `total_run_count`, `date_changed`, `description`, `crontab_id`, `interval_id`, `solar_id`, `one_off`, `start_time`, `priority`, `headers`, `clocked_id`, `expire_seconds`) VALUES ('engine.update_sca', 'core.tasks.update_sca', '[]', '{}', NULL, NULL, NULL, NULL, 1, '2021-05-08 06:25:35.184066', 8, '2021-05-08 06:27:22.926700', '', NULL, 4, NULL, 0, NULL, NULL, '{}', NULL, NULL);

INSERT INTO `iast_deploy`(`desc`, `middleware`, `os`) VALUES ('**手动修改**\n\n进入tomcat主目录，找到`bin/catalina.sh`文件，在**文件首行**增加如下配置：\n```bash\nCATALINA_OPTS=\"-javaagent:/path/to/server/agent.jar -Dproject.name=<project name>\"\n```\n\n**注意：**`<project name>`与创建的项目名称保持一致，agent将自动关联至项目；如果不配置该参数，需要进入项目管理中进行手工绑定。', 'tomcat', 'linux');
INSERT INTO `iast_deploy`(`desc`, `middleware`, `os`) VALUES ('####  JBossAS 6\n\n进入JBoss容器的主目录，在`bin/run.sh`文件中找到`# Setup JBoss specific properties`所在行，在该行的下面插入如下行：\n```bash\nJAVA_OPTS=\"$JAVA_OPTS \"-javaagent:/path/to/server/agent.jar\" \"-Dproject.name=<project name>\n```\n**注意：**`<project name>`与创建的项目名称保持一致，agent将自动关联至项目；如果不配置该参数，需要进入项目管理中进行手工绑定。\n\n\n#### JBossAS 7、JBossWildfly\n\n进入JBoss容器的主目录，根据当前服务器的启动类型：standalone、domain修改对应的配置文件\n\n##### Standalone模式\n打开`bin/standalone.sh`文件，定位`# Display our environment`所在的行，在其上方插入自定义配置，如下：\n```bash\nJAVA_OPTS=\"$JAVA_OPTS \"-javaagent:/path/to/server/agent.jar\" \"-Dproject.name=<project name>\n```\n**注意：**`<project name>`与创建的项目名称保持一致，agent将自动关联至项目；如果不配置该参数，需要进入项目管理中进行手工绑定。\n\n##### domain模式\ndomain模式下的部署方式与Standalone模式类似，请自行查询', 'jboss', 'linux');
INSERT INTO `iast_deploy`(`desc`, `middleware`, `os`) VALUES ('> Jetty\n#### 手工修改\n1.进入jetty的根目录，打开`bin/jetty.sh`文件，找到`Add jetty properties to Java VM options.`所在行，在下面行插入`JAVA_OPTIONS+=( \"-javaagent:/opt/agent/agent.jar=token=e7509bf7-e44f-4e1f-8e25-5079e2540c63\")`\n\n2.重启jetty服务器\n\n#### 自动修改\n进入tomcat容器的主目录，找到`bin/jetty.sh`文件，使用下面的shell命令修改jetty.sh文件\n```bash\nsed \"$(cat jetty.sh |grep -n \\\"Add jetty properties to Java VM options\\\"|cut -d \":\" -f1) aJAVA_OPTS=\\\"\\$JAVA_OPTS\\ \\\"-javaagent:/opt/agent/agent.jar=token=e7509bf7-e44f-4e1f-8e25-5079e2540c63\" -i jetty.sh\n```', 'jetty', 'linux');
INSERT INTO `iast_deploy`(`desc`, `middleware`, `os`) VALUES ('> Resin\n#### 手动修改\n进入resin容器的主目录，打开`conf/cluster-default.xml`文件，定位到`<server-default>`所在的行，在该行下面插入`<jvm-arg>-javaagent:/opt/agent/agent.jar</jvm-arg>`', 'resin', 'linux');
INSERT INTO `iast_deploy`(`desc`, `middleware`, `os`) VALUES ('> WebLogic配置agent\n\n#### 手动修改\n**非集群方式**\n\n进入WebLogic目录，打开`bin/startWebLogic.sh`文件，找到`JAVA_OPTIONS=\"${SAVE_JAVA_OPTIONS}\"`所在行，在该行的下面增加一行\n\n```\nJAVA_OPTIONS=\"-javaagent:${DOMAIN_HOME}/agent/agent.jar\"\n```\n\n**集群方式**\n\n##### 方式一、通过weblogic的console\n\n访问weblogic的console，例如：\n\n1.找到“环境”下的“服务器”，然后在服务器列表中点击需要安装agent的服务器，如：AdminServer\n\n![img](https://i0x0fy4ibf.feishu.cn/space/api/box/stream/download/asynccode/?code=6920cd75d5484b9dcae5f67a8aad155f_8f118824ce50c961_boxcngZyBvKQSo849VNXlQBJuge_YuAYCtHZdJXJCwvIlL3fxPrHcOQuN1Ce)\n\n2.进入服务器详情，点击“服务器启动”，在下方的参数一栏中填入javaagent的参数`-javaagent:/opt/agent/agent.jar`，如：\n\n![img](https://i0x0fy4ibf.feishu.cn/space/api/box/stream/download/asynccode/?code=e32f0fdef6dc3e199632ee96e9e14aa5_8f118824ce50c961_boxcnfxBALg44nqZNvWICeYo93f_mfxihZ670SCKmxtDiZ3ykAkC556TiWMW)\n\n3.重启服务器，使配置生效\n\n![img](https://i0x0fy4ibf.feishu.cn/space/api/box/stream/download/asynccode/?code=346e5344abca7fae8d3cdc89c05f2fbd_8f118824ce50c961_boxcn3SbZEAQhl0B4RSMJpZbibv_o17TRySNfvsOwiyoAYdmpC7GU9XmegU4)\n\n\n\n##### 方式二、通过配置weblogic的config.xml文件\n\n找到`/u01/oracle/weblogic/user_projects/domains/base_domain/config`目录下的config.xml文件，定位到`<server-start>`标签下的`<arguments>`标签，在标签内添加如下配置：\n```\n-javaagent:/opt/agent/agent.jar\n```\n\n\n', 'weblogic', 'linux');
INSERT INTO `iast_deploy`(`desc`, `middleware`, `os`) VALUES ('> WebSphere\n![websphere-01](/upload/masterimg/websphere-01.png)\n![websphere-02](/upload/masterimg/websphere-02.png)\n![websphere-03](/upload/masterimg/websphere-03.png)\n', 'websphere', 'linux');
INSERT INTO `iast_deploy`(`desc`, `middleware`, `os`) VALUES ('> WebLogic\n![weblogic-01](/upload/masterimg/weblogic-01.png)\n![weblogic-02](/upload/masterimg/weblogic-02.png)\n![weblogic-03](/upload/masterimg/weblogic-03.png)\n![weblogic-04](/upload/masterimg/weblogic-04.png)', 'weblogic', 'windows');
INSERT INTO `iast_deploy`(`desc`, `middleware`, `os`) VALUES ('**SpringBoot**\n\n1. 下载`agent.jar`，然后放入具有写入权限的目录中，如：`/tmp/`\n\n2. 针对SpringBoot应用\n	1). 如果使用**war包**的方式部署，agent的安装方式为具体中间件的安装方式\n	2). 如果使用`java -jar app.jar`的方式部署，则直接在启动命令中增加启动参数`-javaagent:/path/to/agent.jar`即可，如：`java -javaagent:/path/to/agent.jar -Dproject.name=<project name> -jar app.jar`\n	\n**注意：**`<project name>`与创建的项目名称保持一致，agent将自动关联至项目；如果不配置该参数，需要进入项目管理中进行手工绑定。', 'SpringBoot', 'linux');
INSERT INTO `iast_deploy`(`desc`, `middleware`, `os`) VALUES ('**SpringBoot**\n\n1. 下载`agent.jar`，然后放入具有写入权限的目录中，如：`/tmp/`\n\n2. 针对SpringBoot应用\n	1）如果使用**war包**的方式部署，agent的安装方式为具体中间件的安装方式；\n	2）如果使用`java -jar app.jar`的方式部署，则直接在启动命令中增加启动参数`-javaagent:/path/to/agent.jar`即可，如：`java -javaagent:/path/to/agent.jar -Dproject.name=<project name> -jar app.jar`\n	\n**注意：**`<project name>`与创建的项目名称保持一致，agent将自动关联至项目；如果不配置该参数，需要进入项目管理中进行手工绑定。', 'SpringBoot', 'windows');

-- 创建默认用户
INSERT INTO `auth_user`(`password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `phone`) VALUES ('pbkdf2_sha256$180000$tpUFyXYrIGXh$PIqkgklZerTwKsDe5s9P+6USI/Z2Yq+5J6oXx4kbiKI=', '2021-03-23 18:32:44.117558', 2, 'admin', 'admin', 'admin', 'admin@huoxian.cn', 1, 1, '2020-01-01 00:00:00.000000', 1);

-- 创建租户
INSERT INTO `auth_talent`(`talent_name`, `create_time`, `update_time`, `created_by`, `is_active`) VALUES ('默认租户', 1610532209, 1611031026, 1, 1);

-- 创建部门
INSERT INTO `auth_department`(`name`, `create_time`, `update_time`, `created_by`, `parent_id`) VALUES ('默认部门', 1611031807, 1611045352, 1, -1);

-- 创建组
INSERT INTO `auth_group`(`name`) VALUES ('system_admin');
INSERT INTO `auth_group`(`name`) VALUES ('talent_admin');
INSERT INTO `auth_group`(`name`) VALUES ('user');

-- 创建关联关系
INSERT INTO `auth_department_talent`(`department_id`, `talent_id`) VALUES (1, 1);
INSERT INTO `auth_user_department`(`user_id`, `department_id`) VALUES (1, 1);
INSERT INTO `auth_user_groups`(`user_id`, `group_id`) VALUES (1, 2);

SET FOREIGN_KEY_CHECKS = 1;