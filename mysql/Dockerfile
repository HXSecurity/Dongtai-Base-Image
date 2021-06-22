FROM mysql:5.7

ENV MYSQL_DATABASE dongtai_webapi
ENV MYSQL_ROOT_PASSWORD dongtai-iast

ADD https://huoqi-public.oss-cn-beijing.aliyuncs.com/iast/sca.sql /docker-entrypoint-initdb.d/sca.sql
ADD https://huoqi-public.oss-cn-beijing.aliyuncs.com/iast/rule.sql /opt/rule.sql
COPY db.sql /docker-entrypoint-initdb.d/

RUN chmod 777 /docker-entrypoint-initdb.d -R

