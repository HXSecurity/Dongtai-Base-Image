FROM mysql:5.7 as builder

ENV MYSQL_DATABASE dongtai_webapi
ENV MYSQL_ROOT_PASSWORD dongtai-iast

COPY zzz_last_processed_file.sh /docker-entrypoint-initdb.d

COPY wait_to_shutdown.sh /tmp/wait_to_shutdown.sh

ADD https://huoqi-public.oss-cn-beijing.aliyuncs.com/iast/sql/sca.sql /docker-entrypoint-initdb.d/sca.sql

ADD https://huoqi-public.oss-cn-beijing.aliyuncs.com/iast/sql/rule.sql /docker-entrypoint-initdb.d/rule.sql

COPY db.sql /docker-entrypoint-initdb.d/

COPY update-*release*.sql /docker-entrypoint-initdb.d/

RUN chmod 777 /docker-entrypoint-initdb.d -R && chmod +x /tmp/wait_to_shutdown.sh

RUN /entrypoint.sh mysqld --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci & /tmp/wait_to_shutdown.sh  

RUN rm /docker-entrypoint-initdb.d/*



FROM mysql:5.7

ENV MYSQL_DATABASE dongtai_webapi
ENV MYSQL_ROOT_PASSWORD dongtai-iast

COPY --from=builder /var/lib/mysql /var/lib/mysql

COPY db.sql /docker-entrypoint-initdb.d/

COPY update-*release*.sql /docker-entrypoint-initdb.d/

CMD [ "mysqld", "--character-set-server=utf8mb4", "--collation-server=utf8mb4_unicode_ci" ]

