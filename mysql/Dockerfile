FROM mysql:5.7

ENV MYSQL_DATABASE dongtai_webapi
ENV MYSQL_ROOT_PASSWORD dongtai-iast

ADD https://huoqi-public.oss-cn-beijing.aliyuncs.com/iast/sql/sca.sql /docker-entrypoint-initdb.d/sca.sql
ADD https://huoqi-public.oss-cn-beijing.aliyuncs.com/iast/sql/rule.sql /docker-entrypoint-initdb.d/rule.sql
COPY db.sql /docker-entrypoint-initdb.d/
COPY update-*release*.sql /docker-entrypoint-initdb.d/

RUN chmod 777 /docker-entrypoint-initdb.d -R

CMD [ "mysqld", "--character-set-server=utf8mb4", "--collation-server=utf8mb4_unicode_ci" ]
