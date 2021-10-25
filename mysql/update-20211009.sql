SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;
UPDATE iast_deploy
SET `desc`='**手动修改**
进入tomcat主目录，找到`bin/catalina.sh`文件，在文件首行增加如下配置：
```bash
CATALINA_OPTS="-javaagent:/path/to/server/agent.jar -Dproject.name=<project name>"
```
**注意：**`<project name>`与创建的项目名称保持一致，agent将自动关联至项目；如果不配置该参数，需要进入项目管理中进行手工绑定。', middleware='tomcat', `language`='java', desc_en='#### Tomcat 
Navigate to Tomcat''s bin directory and open the `/catalina.sh` file in text editor. Add the following settings at the first line of text: 
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
domain模式下的部署方式与Standalone模式类似，请自行查询', middleware='jboss', `language`='java', desc_en='#### JBoss AS 6
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
```', middleware='jetty', `language`='java', desc_en='#### Jetty

Added -javaAgent to Java startup parameters:

```
java -javaagent:/path/to/agent.jar -Dproject.name=<project name> -jar start.jar
```

**Notice:** Keep the `<application name>` consistent with the application name that has created. The agent will associate the application automatically; You also can manually associate it in application settings at the SaaS Platform to keep the parameters value blank.', desc_zh='#### Jetty

修改 java 启动参数，增加 -javaagent 参数（注意将 `-jar` 放在命令最末尾):

```
java -javaagent:/path/to/agent.jar -Dproject.name=<project name> -jar start.jar
```

**注意：**`<project name>`与创建的项目名称保持一致，agent将自动关联至项目；如果不配置该参数，需要进入项目管理中进行手工绑定。
'
WHERE id=3;
UPDATE iast_deploy
SET `desc`='> Resin
#### 手动修改
进入resin容器的主目录，打开`conf/cluster-default.xml`文件，定位到`<server-default>`所在的行，在该行下面插入`<jvm-arg>-javaagent:/opt/agent/agent.jar</jvm-arg>`', middleware='resin', `language`='java', desc_en='#### Resin
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
进入WebLogic目录，打开`bin/startWebLogic.sh`文件，找到`JAVA_OPTIONS="NULL"`所在行，在该行的下面增加一行
```
JAVA_OPTIONS="-javaagent:NULL/agent/agent.jar"
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
', middleware='weblogic', `language`='java', desc_en='#### WebLogic
**Non-clustered**
Navigate to WebLogic''s bin directory and open`/startWebLogic.sh` file with text editor. Find `JAVA_OPTIONS="NULL"` in the text and add the following line below it: 
```
JAVA_OPTIONS="-javaagent:NULL/agent/agent.jar" "-Dproject.name=<application name>"
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
进入WebLogic目录，打开`bin/startWebLogic.sh`文件，找到`JAVA_OPTIONS="NULL"`所在行，在该行的下面增加一行
```
JAVA_OPTIONS="-javaagent:NULL/agent/agent.jar"
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
', middleware='websphere', `language`='java', desc_en='#### WebSphere
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
	
**注意：**`<project name>`与创建的项目名称保持一致，agent将自动关联至项目；如果不配置该参数，需要进入项目管理中进行手工绑定。', middleware='SpringBoot', `language`='java', desc_en='#### SpringBoot 
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
', middleware='Django', `language`='python', desc_en='#### Django 
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
ALTER TABLE iast_hook_type ADD language_id INTEGER DEFAULT 0 NOT NULL;
CREATE INDEX iast_hook_type_language_id_IDX USING BTREE ON iast_hook_type (language_id);
UPDATE iast_hook_type SET language_id = 1 WHERE 1 = 1;
ALTER TABLE  iast_vulnerability_status 
DEFAULT CHARSET=utf8mb4;
ALTER TABLE  iast_http_method_relation 
DEFAULT CHARSET=utf8mb4;
ALTER TABLE  iast_program_language 
DEFAULT CHARSET=utf8mb4;
ALTER TABLE  iast_replay_queue 
DEFAULT CHARSET=utf8mb4;
ALTER TABLE  iast_api_route 
DEFAULT CHARSET=utf8mb4;
ALTER TABLE  iast_api_response 
DEFAULT CHARSET=utf8mb4;
ALTER TABLE  iast_api_parameter 
DEFAULT CHARSET=utf8mb4;
ALTER TABLE  iast_api_methods 
DEFAULT CHARSET=utf8mb4;
ALTER TABLE  engine_monitoring_indicators 
DEFAULT CHARSET=utf8mb4;
ALTER TABLE  auth_user ADD default_language varchar(20) NULL;

INSERT INTO iast_program_language
(id, name)
VALUES(1, 'Java');
INSERT INTO iast_program_language
(id, name)
VALUES(2, 'Python');

SET FOREIGN_KEY_CHECKS=1;
