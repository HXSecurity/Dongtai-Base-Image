SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `iast_agent_method_pool` ADD COLUMN `req_header_for_search` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '用于搜索功能的请求头，请求方法、uri、参数、协议、请求头的拼接' AFTER `pool_sign`;

ALTER TABLE `iast_agent_method_pool` ADD CONSTRAINT `iast_agent_method_pool_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `iast_agent` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `iast_agent_method_pool` ADD INDEX `update_time`(`update_time`) USING BTREE;

-- ----------------------------
-- Table structure for iast_deploy
-- ----------------------------
DROP TABLE IF EXISTS `iast_deploy`;
CREATE TABLE `iast_deploy` (
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
INSERT INTO `iast_deploy` VALUES (1, '**手动修改**\n\n进入tomcat主目录，找到`bin/catalina.sh`文件，在文件首行增加如下配置：\n```bash\nCATALINA_OPTS=\"-javaagent:/path/to/server/agent.jar -Dproject.name=<project name>\"\n```\n\n**注意：**`<project name>`与创建的项目名称保持一致，agent将自动关联至项目；如果不配置该参数，需要进入项目管理中进行手工绑定。', 'tomcat', 'java');
INSERT INTO `iast_deploy` VALUES (2, '####  JBossAS 6\n\n进入JBoss容器的主目录，在`bin/run.sh`文件中找到`# Setup JBoss specific properties`所在行，在该行的下面插入如下行：\n```bash\nJAVA_OPTS=\"$JAVA_OPTS \"-javaagent:/path/to/server/agent.jar\" \"-Dproject.name=<project name>\n```\n**注意：**`<project name>`与创建的项目名称保持一致，agent将自动关联至项目；如果不配置该参数，需要进入项目管理中进行手工绑定。\n\n\n#### JBossAS 7、JBossWildfly\n\n进入JBoss容器的主目录，根据当前服务器的启动类型：standalone、domain修改对应的配置文件\n\n##### Standalone模式\n打开`bin/standalone.sh`文件，定位`# Display our environment`所在的行，在其上方插入自定义配置，如下：\n```bash\nJAVA_OPTS=\"$JAVA_OPTS \"-javaagent:/path/to/server/agent.jar\" \"-Dproject.name=<project name>\n```\n**注意：**`<project name>`与创建的项目名称保持一致，agent将自动关联至项目；如果不配置该参数，需要进入项目管理中进行手工绑定。\n\n##### domain模式\ndomain模式下的部署方式与Standalone模式类似，请自行查询', 'jboss', 'java');
INSERT INTO `iast_deploy` VALUES (3, '> Jetty\n#### 手工修改\n1.进入jetty的根目录，打开`bin/jetty.sh`文件，找到`Add jetty properties to Java VM options.`所在行，在下面行插入`JAVA_OPTIONS+=( \"-javaagent:/opt/agent/agent.jar=token=e7509bf7-e44f-4e1f-8e25-5079e2540c63\")`\n\n2.重启jetty服务器\n\n#### 自动修改\n进入tomcat容器的主目录，找到`bin/jetty.sh`文件，使用下面的shell命令修改jetty.sh文件\n```bash\nsed \"$(cat jetty.sh |grep -n \\\"Add jetty properties to Java VM options\\\"|cut -d \":\" -f1) aJAVA_OPTS=\\\"\\$JAVA_OPTS\\ \\\"-javaagent:/opt/agent/agent.jar=token=e7509bf7-e44f-4e1f-8e25-5079e2540c63\" -i jetty.sh\n```', 'jetty', 'java');
INSERT INTO `iast_deploy` VALUES (4, '> Resin\n#### 手动修改\n进入resin容器的主目录，打开`conf/cluster-default.xml`文件，定位到`<server-default>`所在的行，在该行下面插入`<jvm-arg>-javaagent:/opt/agent/agent.jar</jvm-arg>`', 'resin', 'java');
INSERT INTO `iast_deploy` VALUES (5, '> WebLogic配置agent\n\n#### 手动修改\n**非集群方式**\n\n进入WebLogic目录，打开`bin/startWebLogic.sh`文件，找到`JAVA_OPTIONS=\"${SAVE_JAVA_OPTIONS}\"`所在行，在该行的下面增加一行\n\n```\nJAVA_OPTIONS=\"-javaagent:${DOMAIN_HOME}/agent/agent.jar\"\n```\n\n**集群方式**\n\n##### 方式一、通过weblogic的console\n\n访问weblogic的console，例如：\n\n1.找到“环境”下的“服务器”，然后在服务器列表中点击需要安装agent的服务器，如：AdminServer\n\n![img](https://i0x0fy4ibf.feishu.cn/space/api/box/stream/download/asynccode/?code=6920cd75d5484b9dcae5f67a8aad155f_8f118824ce50c961_boxcngZyBvKQSo849VNXlQBJuge_YuAYCtHZdJXJCwvIlL3fxPrHcOQuN1Ce)\n\n2.进入服务器详情，点击“服务器启动”，在下方的参数一栏中填入javaagent的参数`-javaagent:/opt/agent/agent.jar`，如：\n\n![img](https://i0x0fy4ibf.feishu.cn/space/api/box/stream/download/asynccode/?code=e32f0fdef6dc3e199632ee96e9e14aa5_8f118824ce50c961_boxcnfxBALg44nqZNvWICeYo93f_mfxihZ670SCKmxtDiZ3ykAkC556TiWMW)\n\n3.重启服务器，使配置生效\n\n![img](https://i0x0fy4ibf.feishu.cn/space/api/box/stream/download/asynccode/?code=346e5344abca7fae8d3cdc89c05f2fbd_8f118824ce50c961_boxcn3SbZEAQhl0B4RSMJpZbibv_o17TRySNfvsOwiyoAYdmpC7GU9XmegU4)\n\n\n\n##### 方式二、通过配置weblogic的config.xml文件\n\n找到`/u01/oracle/weblogic/user_projects/domains/base_domain/config`目录下的config.xml文件，定位到`<server-start>`标签下的`<arguments>`标签，在标签内添加如下配置：\n```\n-javaagent:/opt/agent/agent.jar\n```\n\n\n', 'weblogic', 'java');
INSERT INTO `iast_deploy` VALUES (6, '> WebSphere\n![websphere-01](/upload/masterimg/websphere-01.png)\n![websphere-02](/upload/masterimg/websphere-02.png)\n![websphere-03](/upload/masterimg/websphere-03.png)\n', 'websphere', 'java');
INSERT INTO `iast_deploy` VALUES (9, '**SpringBoot**\n\n1. 下载`agent.jar`，然后放入具有写入权限的目录中，如：`/tmp/`\n\n2. 针对SpringBoot应用\n	1). 如果使用**war包**的方式部署，agent的安装方式为具体中间件的安装方式\n	2). 如果使用`java -jar app.jar`的方式部署，则直接在启动命令中增加启动参数`-javaagent:/path/to/agent.jar`即可，如：`java -javaagent:/path/to/agent.jar -Dproject.name=<project name> -jar app.jar`\n	\n**注意：**`<project name>`与创建的项目名称保持一致，agent将自动关联至项目；如果不配置该参数，需要进入项目管理中进行手工绑定。', 'SpringBoot', 'java');
INSERT INTO `iast_deploy` VALUES (10, '修改待检测的Django项目中的settings.py, 在configure middleware位置，增加一条\r\n```bash\r\n	MIDDLEWARE = [ \r\n		\'dongtai_agent_python.middlewares.django_middleware.FireMiddleware\',\r\n		#...\r\n	]\r\n```\r\n', 'Django', 'python');
COMMIT;

-- ----------------------------
-- Table structure for iast_document
-- ----------------------------
DROP TABLE IF EXISTS `iast_document`;
CREATE TABLE `iast_document`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for iast_profile
-- ----------------------------
DROP TABLE IF EXISTS `iast_profile`;
CREATE TABLE `iast_profile`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `iast_profile_UN`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for iast_program_language
-- ----------------------------
DROP TABLE IF EXISTS `iast_program_language`;
CREATE TABLE `iast_program_language`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS=1;

BEGIN;
INSERT INTO `iast_document` VALUES (1, 'Java Agent快速部署', 'https://hxsecurity.github.io/DongTai-Doc/#/doc/tutorial/quickstart', 99, 'JAVA');
INSERT INTO `iast_document` VALUES (2, 'Java Agent Release Note', 'https://hxsecurity.github.io/DongTai-Doc/#/doc/changes/JavaAgent', 100, 'JAVA');
INSERT INTO `iast_document` VALUES (3, '讨论区(Q&A)', 'https://hxsecurity.github.io/DongTai-Doc/#/doc/qa', 97, 'JAVA');
INSERT INTO `iast_document` VALUES (4, 'DongTai探针参数配置', 'https://hxsecurity.github.io/DongTai-Doc/#/doc/tutorial/args', 98, 'JAVA');
INSERT INTO `iast_document` VALUES (6, 'DongTai探针参数配置', 'https://hxsecurity.github.io/DongTai-Doc/#/doc/tutorial/args', 98, 'PYTHON');
INSERT INTO `iast_document` VALUES (7, '讨论区(Q&A)', 'https://hxsecurity.github.io/DongTai-Doc/#/doc/qa', 97, 'PYTHON');
INSERT INTO `iast_document` VALUES (8, 'Python Agent快速部署', 'https://hxsecurity.github.io/DongTai-Doc/#/doc/tutorial/quickstart?id=python%e7%89%88%e6%9c%ac%e5%bf', 99, 'PYTHON');
INSERT INTO `iast_document` VALUES (9, 'Python Agent Release Note', 'https://hxsecurity.github.io/DongTai-Doc/#/doc/changes/PythonAgent', 100, 'PYTHON');
INSERT INTO `iast_profile`(`key`, `value`) VALUES ('enable_update', 'TRUE');
COMMIT;
