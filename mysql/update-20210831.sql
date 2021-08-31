SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

--
-- Create model HttpMethod
--
CREATE TABLE `iast_http_method` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `method` varchar(100) NOT NULL);
--
-- Create model IastApiMethod
--
CREATE TABLE `iast_api_methods` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `method` varchar(100) NOT NULL);
--
-- Create model IastApiRoute
--
CREATE TABLE `iast_api_route` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `path` varchar(255) NOT NULL, `code_class` varchar(255) NOT NULL, `description` varchar(500) NOT NULL, `code_file` varchar(500) NOT NULL, `controller` varchar(100) NOT NULL, `agent_id` integer NOT NULL, `method_id` integer NOT NULL);
--
-- Create model IastApiResponse
--
CREATE TABLE `iast_api_response` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `return_type` varchar(100) NOT NULL, `route_id` integer NOT NULL);
--
-- Create model IastApiParameter
--
CREATE TABLE `iast_api_parameter` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `name` varchar(100) NOT NULL, `type` varchar(100) NOT NULL, `annotation` varchar(500) NOT NULL, `route_id` integer NOT NULL);
--
-- Create model IastApiMethodHttpMethodRelation
--
CREATE TABLE `iast_http_method_relation` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `api_method_id` integer NOT NULL, `http_method_id` integer NOT NULL);
--
-- Add field http_method to iastapimethod
--
ALTER TABLE iast_agent_method_pool ADD uri_sha1 varchar(40) DEFAULT '' NOT NULL;
--
-- Create index iast_agent__uri_sha_aac6d7_idx on field(s) uri_sha1, http_method, agent of model methodpool
--
CREATE INDEX `iast_agent__uri_sha_aac6d7_idx` ON `iast_agent_method_pool` (`uri_sha1`, `http_method`, `agent_id`);
--
-- Alter unique_together for iastapiroute (1 constraint(s))
--
-- ALTER TABLE `iast_api_route` ADD CONSTRAINT `iast_api_route_path_method_id_7fbc2841_uniq` UNIQUE (`path`, `method_id`);
ALTER TABLE iast_api_route ADD CONSTRAINT iast_api_route_method_agent_path_uniq UNIQUE KEY (method_id,agent_id,`path`);
--
-- Alter unique_together for iastapiresponse (1 constraint(s))
--
ALTER TABLE `iast_api_response` ADD CONSTRAINT `iast_api_response_return_type_route_id_7e7c48e0_uniq` UNIQUE (`return_type`, `route_id`);
--
-- Alter unique_together for iastapiparameter (1 constraint(s))
--
ALTER TABLE `iast_api_parameter` ADD CONSTRAINT `iast_api_parameter_name_route_id_d9123aff_uniq` UNIQUE (`name`, `route_id`);
--
-- Alter unique_together for iastapimethodhttpmethodrelation (1 constraint(s))
--
ALTER TABLE `iast_http_method_relation` ADD CONSTRAINT `iast_http_method_relatio_api_method_id_http_metho_9680d881_uniq` UNIQUE (`api_method_id`, `http_method_id`);
CREATE INDEX `iast_agent_method_pool_uri_sha1_a64012e4` ON `iast_agent_method_pool` (`uri_sha1`);
CREATE INDEX `iast_agent_method_pool_agent_id_30df78eb` ON `iast_agent_method_pool` (`agent_id`);
CREATE INDEX `iast_api_route_agent_id_80c18e0e` ON `iast_api_route` (`agent_id`);
CREATE INDEX `iast_api_route_method_id_7ff9eb8e` ON `iast_api_route` (`method_id`);
CREATE INDEX `iast_api_response_route_id_ffe61cb5` ON `iast_api_response` (`route_id`);
CREATE INDEX `iast_api_parameter_route_id_5eac0d6c` ON `iast_api_parameter` (`route_id`);
CREATE INDEX `iast_http_method_relation_api_method_id_10ea754d` ON `iast_http_method_relation` (`api_method_id`);
CREATE INDEX `iast_http_method_relation_http_method_id_d25a1696` ON `iast_http_method_relation` (`http_method_id`);
UPDATE iast_agent_method_pool SET uri_sha1 = SHA1(uri) WHERE 1=1;
ALTER TABLE iast_api_route ADD CONSTRAINT iast_api_route_iast_api_route_path_method_agent_uniq UNIQUE KEY (method_id,agent_id,`path`);
ALTER TABLE iast_project_version ADD CONSTRAINT iast_project_version_UN UNIQUE KEY (version_name,project_id);
ALTER TABLE iast_heartbeat ADD report_queue INT(3) UNSIGNED DEFAULT 0 NOT NULL COMMENT '报告队列';
ALTER TABLE iast_heartbeat ADD method_queue INT(3) UNSIGNED DEFAULT 0 NOT NULL COMMENT '方法池队列';
ALTER TABLE iast_heartbeat ADD replay_queue INT(3) UNSIGNED DEFAULT 0 NOT NULL COMMENT '重放队列';
CREATE TABLE `engine_monitoring_indicators` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `key` varchar(100) NOT NULL UNIQUE, `name` varchar(100) NOT NULL, `name_en` varchar(100) NULL, `name_zh` varchar(100) NULL);
ALTER TABLE iast_vulnerability ADD hook_type_id INT UNSIGNED DEFAULT 0 NOT NULL COMMENT '漏洞类型id';



UPDATE iast_vulnerability as v , (SELECT iv.id as iv_id ,iht2.id as iht2_id FROM  iast_vulnerability iv,iast_hook_type iht2 
WHERE iv.`type`  = iht2.name COLLATE utf8mb4_general_ci ) as tmp
SET hook_type_id  = tmp.iht2_id
WHERE v.id = tmp.iv_id ;

UPDATE iast_vulnerability as v , (SELECT iv.id as iv_id ,iht2.id as iht2_id FROM  iast_vulnerability iv,iast_hook_type iht2 
WHERE iv.`type`  = iht2.name_en COLLATE utf8mb4_general_ci ) as tmp
SET hook_type_id  = tmp.iht2_id
WHERE v.id = tmp.iv_id and v.hook_type_id = 0;




ALTER TABLE iast_vulnerability ADD status_id INT DEFAULT 0 NOT NULL COMMENT '漏洞状态id';

CREATE TABLE iast_vulnerability_status (
	`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, 
	name varchar(100) DEFAULT '' NOT NULL,
	name_zh varchar(100) NULL,
	name_en varchar(100) NULL
);
INSERT INTO iast_vulnerability_status
(name, name_zh, name_en)
VALUES('待验证', '待验证', 'Pending');
INSERT INTO iast_vulnerability_status
(name, name_zh, name_en)
VALUES('验证中', '验证中', 'Verifying');
INSERT INTO iast_vulnerability_status
(name, name_zh, name_en)
VALUES('已确认', '已确认', 'Confirmed');
INSERT INTO iast_vulnerability_status
(name, name_zh, name_en)
VALUES('已忽略', '已忽略', 'Ignore');
INSERT INTO iast_vulnerability_status
(name, name_zh, name_en)
VALUES('已处理', '已处理', 'Solved');

UPDATE iast_vulnerability as v , (SELECT iv.id as iv_id, ivs.id as ivs_id FROM  iast_vulnerability iv , iast_vulnerability_status ivs
WHERE iv.status  = ivs.name COLLATE utf8mb4_general_ci ) as tmp
SET status_id = tmp.ivs_id
WHERE v.id = tmp.iv_id ;
UPDATE iast_vulnerability as v , (SELECT iv.id as iv_id, ivs.id as ivs_id FROM  iast_vulnerability iv , iast_vulnerability_status ivs
WHERE iv.status  = ivs.name_en COLLATE utf8mb4_general_ci ) as tmp
SET status_id = tmp.ivs_id
WHERE v.id = tmp.iv_id AND  status_id = 0;
CREATE INDEX iast_vulnerability_uri_IDX USING BTREE ON iast_vulnerability (uri,agent_id);
UPDATE iast_deploy
SET `desc`='**手动修改**

进入tomcat主目录，找到`bin/catalina.sh`文件，在文件首行增加如下配置：
```bash
CATALINA_OPTS="-javaagent:/path/to/server/agent.jar -Dproject.name=<project name>"
```

**注意：**`<project name>`与创建的项目名称保持一致，agent将自动关联至项目；如果不配置该参数，需要进入项目管理中进行手工绑定。', middleware='tomcat', `language`='java', desc_en='Navigate to Tomcat''s bin directory and open the `/catalina.sh` file in text editor. Add the following settings at the first line of text: 
```bash
CATALINA_OPTS="-javaagent:/path/to/server/agent.jar -Dproject.name=<application name>"
```

**Notice:** Keep the `<application name>` consistent with the application name that has created. The agent will associate the application automatically; You also can manually associate it in application settings at the SaaS Platform to keep the parameters value blank.', desc_zh='**手动修改**

进入tomcat主目录，找到`bin/catalina.sh`文件，在文件首行增加如下配置：
```bash
CATALINA_OPTS="-javaagent:/path/to/server/agent.jar -Dproject.name=<project name>"
```

**注意：**`<project name>`与创建的项目名称保持一致，agent将自动关联至项目；如果不配置该参数，需要进入项目管理中进行手工绑定。'
WHERE id=1;
UPDATE iast_deploy
SET `desc`='####  JBossAS 6

进入JBoss容器的主目录，在`bin/run.sh`文件中找到`# Setup JBoss specific properties`所在行，在该行的下面插入如下行：
```bash
JAVA_OPTS="$JAVA_OPTS "-javaagent:/path/to/server/agent.jar" "-Dproject.name=<project name>
```
**注意：**`<project name>`与创建的项目名称保持一致，agent将自动关联至项目；如果不配置该参数，需要进入项目管理中进行手工绑定。


#### JBossAS 7、JBossWildfly

进入JBoss容器的主目录，根据当前服务器的启动类型：standalone、domain修改对应的配置文件

##### Standalone模式
打开`bin/standalone.sh`文件，定位`# Display our environment`所在的行，在其上方插入自定义配置，如下：
```bash
JAVA_OPTS="$JAVA_OPTS "-javaagent:/path/to/server/agent.jar" "-Dproject.name=<project name>
```
**注意：**`<project name>`与创建的项目名称保持一致，agent将自动关联至项目；如果不配置该参数，需要进入项目管理中进行手工绑定。

##### domain模式
domain模式下的部署方式与Standalone模式类似，请自行查询', middleware='jboss', `language`='java', desc_en='####JBoss AS 6
Navigate to JBoss''s bin directory and open the `/run.sh` file in text editor. Find `# Setup JBoss specific properties` in the text and add the following line below it:
```bash
JAVA_OPTS="$JAVA_OPTS "-javaagent:/path/to/server/agent.jar" "-Dproject.name=<application name>
```
**Notice:** Keep the `<application name>` consistent with the application name that has created. The agent will associate the application automatically; You also can manually associate it in application settings at the SaaS Platform to keep the parameters value blank. 


#### JBoss AS 7、JBoss Wildfly
Navigate to JBoss''s bin directory and modify the setting''s value according to the server mode: standalone mode or domain mode.

##### Standalone Mode
Open `/standalone.sh` file in the text editor and find # Display our environment` in the text. Add the following line above it: 
```bash
JAVA_OPTS="$JAVA_OPTS "-javaagent:/path/to/server/agent.jar" "-Dproject.name=<application name>
```
**Notice:** Keep the `<application name>` consistent with the application name that has created. The agent will associate the application automatically; You also can manually associate it in application settings at the SaaS Platform to keep the parameters value blank. 

##### Domain Mode
Please refer to Standalone Mode’s settings guide.', desc_zh='####  JBossAS 6

进入JBoss容器的主目录，在`bin/run.sh`文件中找到`# Setup JBoss specific properties`所在行，在该行的下面插入如下行：
```bash
JAVA_OPTS="$JAVA_OPTS "-javaagent:/path/to/server/agent.jar" "-Dproject.name=<project name>
```
**注意：**`<project name>`与创建的项目名称保持一致，agent将自动关联至项目；如果不配置该参数，需要进入项目管理中进行手工绑定。


#### JBossAS 7、JBossWildfly

进入JBoss容器的主目录，根据当前服务器的启动类型：standalone、domain修改对应的配置文件

##### Standalone模式
打开`bin/standalone.sh`文件，定位`# Display our environment`所在的行，在其上方插入自定义配置，如下：
```bash
JAVA_OPTS="$JAVA_OPTS "-javaagent:/path/to/server/agent.jar" "-Dproject.name=<project name>
```
**注意：**`<project name>`与创建的项目名称保持一致，agent将自动关联至项目；如果不配置该参数，需要进入项目管理中进行手工绑定。

##### domain模式
domain模式下的部署方式与Standalone模式类似，请自行查询'
WHERE id=2;
UPDATE iast_deploy
SET `desc`='> Jetty
#### 手工修改
1.进入jetty的根目录，打开`bin/jetty.sh`文件，找到`Add jetty properties to Java VM options.`所在行，在下面行插入`JAVA_OPTIONS+=( "-javaagent:/opt/agent/agent.jar=token=e7509bf7-e44f-4e1f-8e25-5079e2540c63")`

2.重启jetty服务器

#### 自动修改
进入tomcat容器的主目录，找到`bin/jetty.sh`文件，使用下面的shell命令修改jetty.sh文件
```bash
sed "$(cat jetty.sh |grep -n \\"Add jetty properties to Java VM options\\"|cut -d ":" -f1) aJAVA_OPTS=\\"\\$JAVA_OPTS\\ \\"-javaagent:/opt/agent/agent.jar=token=e7509bf7-e44f-4e1f-8e25-5079e2540c63" -i jetty.sh
```', middleware='jetty', `language`='java', desc_en='> ####Jetty
Navigate to Jetty''s bin directory and open the `/jetty.sh` file with text editor. Find `Add jetty properties to Java VM options.` and add the following line below it: 
```bash
JAVA_OPTIONS+=( "-javaagent:/opt/agent/agent.jar=token=e7509bf7-e44f-4e1f-8e25-5079e2540c63 --Dproject.name=<application name>")
```
Save the change and restart Jetty service. 
##### Automatic Configuration
Navigate to Tomcat''s bin directory and find `/jetty.sh` file. Modify it with the following shell command: 
```bash
sed"$(cat jetty.sh |grep -n "Add jetty properties to Java VM options"|cut -d ":" -f1) aJAVA_OPTS="$JAVA_OPTS "-javaagent:/opt/agent/agent.jar=token=e7509bf7-e44f-4e1f-8e25-5079e2540c63 --Dproject.name=<application name>" -i jetty.sh
```
**Notice:** Keep the `<application name>` consistent with the application name that has created. The agent will associate the application automatically; You also can manually associate it in application settings at the SaaS Platform to keep the parameters value blank.', desc_zh='> Jetty
#### 手工修改
1.进入jetty的根目录，打开`bin/jetty.sh`文件，找到`Add jetty properties to Java VM options.`所在行，在下面行插入`JAVA_OPTIONS+=( "-javaagent:/opt/agent/agent.jar=token=e7509bf7-e44f-4e1f-8e25-5079e2540c63")`

2.重启jetty服务器

#### 自动修改
进入tomcat容器的主目录，找到`bin/jetty.sh`文件，使用下面的shell命令修改jetty.sh文件
```bash
sed "$(cat jetty.sh |grep -n \\"Add jetty properties to Java VM options\\"|cut -d ":" -f1) aJAVA_OPTS=\\"\\$JAVA_OPTS\\ \\"-javaagent:/opt/agent/agent.jar=token=e7509bf7-e44f-4e1f-8e25-5079e2540c63" -i jetty.sh
```'
WHERE id=3;
UPDATE iast_deploy
SET `desc`='> Resin
#### 手动修改
进入resin容器的主目录，打开`conf/cluster-default.xml`文件，定位到`<server-default>`所在的行，在该行下面插入`<jvm-arg>-javaagent:/opt/agent/agent.jar</jvm-arg>`', middleware='resin', `language`='java', desc_en='> ####Resin
Navigate to Resin''s conf directory and open `/cluster-default.xml` file with text editor. Find `<server-default>`in the text and add the following line below it: 
```bash
 <jvm-arg>-javaagent:/opt/agent/agent.jar</jvm-arg> <jvm-arg>-Dproject.name=<application name></jvm-arg>
```
**Notice:** Keep the `<application name>` consistent with the application name that has created. The agent will associate the application automatically; You also can manually associate it in application settings at the SaaS Platform to keep the parameters value blank.', desc_zh='> Resin
#### 手动修改
进入resin容器的主目录，打开`conf/cluster-default.xml`文件，定位到`<server-default>`所在的行，在该行下面插入`<jvm-arg>-javaagent:/opt/agent/agent.jar</jvm-arg>`'
WHERE id=4;
UPDATE iast_deploy
SET `desc`='> WebLogic配置agent

#### 手动修改
**非集群方式**

进入WebLogic目录，打开`bin/startWebLogic.sh`文件，找到`JAVA_OPTIONS="${SAVE_JAVA_OPTIONS}"`所在行，在该行的下面增加一行

```
JAVA_OPTIONS="-javaagent:${DOMAIN_HOME}/agent/agent.jar"
```

**集群方式**

##### 方式一、通过weblogic的console

访问weblogic的console，例如：

1.找到“环境”下的“服务器”，然后在服务器列表中点击需要安装agent的服务器，如：AdminServer

![img](https://i0x0fy4ibf.feishu.cn/space/api/box/stream/download/asynccode/?code=6920cd75d5484b9dcae5f67a8aad155f_8f118824ce50c961_boxcngZyBvKQSo849VNXlQBJuge_YuAYCtHZdJXJCwvIlL3fxPrHcOQuN1Ce)

2.进入服务器详情，点击“服务器启动”，在下方的参数一栏中填入javaagent的参数`-javaagent:/opt/agent/agent.jar`，如：

![img](https://i0x0fy4ibf.feishu.cn/space/api/box/stream/download/asynccode/?code=e32f0fdef6dc3e199632ee96e9e14aa5_8f118824ce50c961_boxcnfxBALg44nqZNvWICeYo93f_mfxihZ670SCKmxtDiZ3ykAkC556TiWMW)

3.重启服务器，使配置生效

![img](https://i0x0fy4ibf.feishu.cn/space/api/box/stream/download/asynccode/?code=346e5344abca7fae8d3cdc89c05f2fbd_8f118824ce50c961_boxcn3SbZEAQhl0B4RSMJpZbibv_o17TRySNfvsOwiyoAYdmpC7GU9XmegU4)



##### 方式二、通过配置weblogic的config.xml文件

找到`/u01/oracle/weblogic/user_projects/domains/base_domain/config`目录下的config.xml文件，定位到`<server-start>`标签下的`<arguments>`标签，在标签内添加如下配置：
```
-javaagent:/opt/agent/agent.jar
```


', middleware='weblogic', `language`='java', desc_en='> ####WebLogic
**Non-clustered**
Navigate to WebLogic''s bin directory and open`/startWebLogic.sh` file with text editor. Find `JAVA_OPTIONS="${SAVE_JAVA_OPTIONS}"` in the text and add the following line below it: 
```
JAVA_OPTIONS="-javaagent:${DOMAIN_HOME}/agent/agent.jar" "-Dproject.name=<application name>"
```
**Clustered**
They have two ways to install the agent: .
##### Method 1
 Via WebLogic Server Administration Console
1. Navigate to `Domain Structure > Environment > Servers` and select the application server which is going to install the agent from the table.
![img](https://dongtai.oss-cn-beijing.aliyuncs.com/static/weblogic-01.png )
2. Navigate to `Server Start` in `Summary of Servers` and add the following line into `Arguments`. 
```
-javaagent:/opt/agent/agent.jar
 -Dproject.name=<application name>
```
![img](https://dongtai.oss-cn-beijing.aliyuncs.com/static/weblogic-02.png )
3.Restart service to apply the new settings.
![img](https://dongtai.oss-cn-beijing.aliyuncs.com/static/weblogic-03.png )
##### Method 2
Via edit config.xml in WebLogic
Navigate to the following WebLogis''s directory `/u01/oracle/weblogic/user_projects/domains/base_domain/config` and open `config.xml` file with text editor, find the sub-element of `<server-start>` which is `<arguments>`, then add the following content into the sub-element: 
```-javaagent:\\/opt\\/agent\\/agent.jar\\n  -Dproject.name=<application name>
```
**Notice:** Keep the `<application name>` consistent with the application name that has created. The agent will associate the application automatically; You also can manually associate it in application settings at the SaaS Platform to keep the parameters value blank.', desc_zh='> WebLogic配置agent

#### 手动修改
**非集群方式**

进入WebLogic目录，打开`bin/startWebLogic.sh`文件，找到`JAVA_OPTIONS="${SAVE_JAVA_OPTIONS}"`所在行，在该行的下面增加一行

```
JAVA_OPTIONS="-javaagent:${DOMAIN_HOME}/agent/agent.jar"
```

**集群方式**

##### 方式一、通过weblogic的console

访问weblogic的console，例如：

1.找到“环境”下的“服务器”，然后在服务器列表中点击需要安装agent的服务器，如：AdminServer

![img](https://dongtai.oss-cn-beijing.aliyuncs.com/static/weblogic-01.png )

2.进入服务器详情，点击“服务器启动”，在下方的参数一栏中填入javaagent的参数`-javaagent:/opt/agent/agent.jar`，如：

![img](https://dongtai.oss-cn-beijing.aliyuncs.com/static/weblogic-02.png )

3.重启服务器，使配置生效

![img](https://dongtai.oss-cn-beijing.aliyuncs.com/static/weblogic-03.png )



##### 方式二、通过配置weblogic的config.xml文件

找到`/u01/oracle/weblogic/user_projects/domains/base_domain/config`目录下的config.xml文件，定位到`<server-start>`标签下的`<arguments>`标签，在标签内添加如下配置：
```
-javaagent:/opt/agent/agent.jar
```'
WHERE id=5;
UPDATE iast_deploy
SET `desc`='> WebSphere
![websphere-01](/upload/masterimg/websphere-01.png)
![websphere-02](/upload/masterimg/websphere-02.png)
![websphere-03](/upload/masterimg/websphere-03.png)
', middleware='websphere', `language`='java', desc_en='> ####WebSphere
1. From WebSphere Admin Console, navigate to `Server > Server Types > WebSphere Application Server`.
![img1](https://dongtai.oss-cn-beijing.aliyuncs.com/static/weblogic-01.png )
2. Select the application server which is going the agent and navigate to `Server Infrastructure > Process definition`.
![img2](https://dongtai.oss-cn-beijing.aliyuncs.com/static/weblogic-02.png )
3. Then head to `Additional Properties > Java Virtual Machine`.
![img3](https://dongtai.oss-cn-beijing.aliyuncs.com/static/weblogic-03.png )
4.Find the `Generic JVM arguments`, then add the following line and save the change.
```-javaagent:/opt/agent/agent.jar 
-Dproject.name=<application name>
```
**Notice:** Keep the `<application name>` consistent with the application name that has created. The agent will associate the application automatically; You also can manually associate it in application settings at the SaaS Platform to keep the parameters value blank.', desc_zh='> WebSphere
![websphere-01](https://dongtai.oss-cn-beijing.aliyuncs.com/static/weblogic-01.png )
![websphere-02](https://dongtai.oss-cn-beijing.aliyuncs.com/static/weblogic-02.png )
![websphere-03](https://dongtai.oss-cn-beijing.aliyuncs.com/static/weblogic-03.png )
'
WHERE id=6;
UPDATE iast_deploy
SET `desc`='**SpringBoot**

1. 下载`agent.jar`，然后放入具有写入权限的目录中，如：`/tmp/`

2. 针对SpringBoot应用
	1). 如果使用**war包**的方式部署，agent的安装方式为具体中间件的安装方式
	2). 如果使用`java -jar app.jar`的方式部署，则直接在启动命令中增加启动参数`-javaagent:/path/to/agent.jar`即可，如：`java -javaagent:/path/to/agent.jar -Dproject.name=<project name> -jar app.jar`
	
**注意：**`<project name>`与创建的项目名称保持一致，agent将自动关联至项目；如果不配置该参数，需要进入项目管理中进行手工绑定。', middleware='SpringBoot', `language`='java', desc_en='####SpringBoot 
1. Download `agent.jar` and then move it to the directory which allows read and write permission, such: `/tmp/`
2. For Spring Boot application
a). If the application is deployed by **WAR**, attach the agent on it by following the official guide
b). If the application is deployed by `java -jar app.jar`. Add the following arguments `-javaagent:/path/to/agent.jar` in which you start your app. Make sure to add it before the `-jar` argument, such:`java -javaagent:/path/to/agent.jar -Dproject.name=<application name> -jar app.jar`
**Notice:** Keep the `<application name>` consistent with the application name that has created. The agent will associate the application automatically; You also can manually associate it in application settings at the SaaS Platform to keep the parameters value blank.', desc_zh='**SpringBoot**

1. 下载`agent.jar`，然后放入具有写入权限的目录中，如：`/tmp/`

2. 针对SpringBoot应用
	1). 如果使用**war包**的方式部署，agent的安装方式为具体中间件的安装方式
	2). 如果使用`java -jar app.jar`的方式部署，则直接在启动命令中增加启动参数`-javaagent:/path/to/agent.jar`即可，如：`java -javaagent:/path/to/agent.jar -Dproject.name=<project name> -jar app.jar`
	
**注意：**`<project name>`与创建的项目名称保持一致，agent将自动关联至项目；如果不配置该参数，需要进入项目管理中进行手工绑定。'
WHERE id=9;
UPDATE iast_deploy
SET `desc`='修改待检测的Django项目中的settings.py, 在configure middleware位置，增加一条
```bash
	MIDDLEWARE = [ 
		''dongtai_agent_python.middlewares.django_middleware.FireMiddleware'',
		#...
	]
```
', middleware='Django', `language`='python', desc_en='####Django 
 Modify the `settings.py` file in the Django application which is going to install the agent. Find `configure middleware` in the file and add the following line: 

```python
MIDDLEWARE = [ 
    ''dongtai_agent_python.middlewares.django_middleware.FireMiddleware'',
#   ...
]
```', desc_zh='修改待检测的Django项目中的settings.py, 在configure middleware位置，增加一条
```bash
	MIDDLEWARE = [ 
		''dongtai_agent_python.middlewares.django_middleware.FireMiddleware'',
		#...
	]
```
'
WHERE id=10;

UPDATE iast_document
SET title='Java Agent快速部署', url='https://hxsecurity.github.io/DongTai-Doc/#/doc/tutorial/quickstart', weight=99, `language`='JAVA', title_en='Java Agent QuickStart', title_zh='Java Agent快速部署', url_en='https://hxsecurity.github.io/DongTai-Doc/#/en-us/doc/tutorial/quickstart', url_zh='https://hxsecurity.github.io/DongTai-Doc/#/doc/tutorial/quickstart'
WHERE id=1;
UPDATE iast_document
SET title='Java Agent Release Note', url='https://hxsecurity.github.io/DongTai-Doc/#/doc/changes/JavaAgent', weight=100, `language`='JAVA', title_en='Java Agent Release Note', title_zh='Java Agent Release Note', url_en='https://hxsecurity.github.io/DongTai-Doc/#/en-us/doc/changes/JavaAgent', url_zh='https://hxsecurity.github.io/DongTai-Doc/#/doc/changes/JavaAgent'
WHERE id=2;
UPDATE iast_document
SET title='讨论区(Q&A)', url='https://hxsecurity.github.io/DongTai-Doc/#/doc/qa', weight=97, `language`='JAVA', title_en='Forum(Q&A)', title_zh='讨论区(Q&A)', url_en='https://hxsecurity.github.io/DongTai-Doc/#/en-us/doc/qa', url_zh='https://hxsecurity.github.io/DongTai-Doc/#/doc/qa'
WHERE id=3;
UPDATE iast_document
SET title='DongTai探针参数配置', url='https://hxsecurity.github.io/DongTai-Doc/#/doc/tutorial/args', weight=98, `language`='JAVA', title_en='DongTai Agent Configuration', title_zh='DongTai探针参数配置', url_en='https://hxsecurity.github.io/DongTai-Doc/#/en-us/doc/tutorial/args', url_zh='https://hxsecurity.github.io/DongTai-Doc/#/doc/tutorial/args'
WHERE id=4;
UPDATE iast_document
SET title='DongTai探针参数配置', url='https://hxsecurity.github.io/DongTai-Doc/#/doc/tutorial/args', weight=98, `language`='PYTHON', title_en='DongTai Agent Configuration', title_zh='DongTai探针参数配置', url_en='https://hxsecurity.github.io/DongTai-Doc/#/en-us/doc/tutorial/args', url_zh='https://hxsecurity.github.io/DongTai-Doc/#/doc/tutorial/args'
WHERE id=6;
UPDATE iast_document
SET title='讨论区(Q&A)', url='https://hxsecurity.github.io/DongTai-Doc/#/doc/qa', weight=97, `language`='PYTHON', title_en='Forum(Q&A)', title_zh='讨论区(Q&A)', url_en='https://hxsecurity.github.io/DongTai-Doc/#/en-us/doc/qa', url_zh='https://hxsecurity.github.io/DongTai-Doc/#/doc/qa'
WHERE id=7;
UPDATE iast_document
SET title='Python Agent快速部署', url='https://hxsecurity.github.io/DongTai-Doc/#/doc/tutorial/quickstart?id=python%E7%89%88%E6%9C%AC%E5%BF%AB%E9%80%9F%E4%BD%93%E9%AA%8C', weight=99, `language`='PYTHON', title_en='Python Agent QuickStart', title_zh='Python Agent快速部署', url_en='https://hxsecurity.github.io/DongTai-Doc/#/en-us/doc/tutorial/quickstart?id=python%E7%89%88%E6%9C%AC%E5%BF%AB%E9%80%9F%E4%BD%93%E9%AA%8C', url_zh='https://hxsecurity.github.io/DongTai-Doc/#/doc/tutorial/quickstart?id=python%E7%89%88%E6%9C%AC%E5%BF%AB%E9%80%9F%E4%BD%93%E9%AA%8C'
WHERE id=8;
UPDATE iast_document
SET title='Python Agent Release Note', url='https://hxsecurity.github.io/DongTai-Doc/#/doc/changes/PythonAgent', weight=100, `language`='PYTHON', title_en='Python Agent Release Note', title_zh='Python Agent Release Note', url_en='https://hxsecurity.github.io/DongTai-Doc/#/en-us/doc/changes/PythonAgent', url_zh='https://hxsecurity.github.io/DongTai-Doc/#/doc/changes/PythonAgent'
WHERE id=9;


SET FOREIGN_KEY_CHECKS=1;
