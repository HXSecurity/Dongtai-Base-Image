FROM mysql:8.0 as builder
ENV MYSQL_DATABASE dongtai_webapi
ENV MYSQL_ROOT_PASSWORD dongtai-iast

COPY db.sql /docker-entrypoint-initdb.d/
COPY update-*release*.sql /docker-entrypoint-initdb.d/
RUN chmod 777 /docker-entrypoint-initdb.d -R
RUN ["sed", "-i", "s/exec \"$@\"/echo \"not running $@\"/", "/usr/local/bin/docker-entrypoint.sh"]
RUN ["/usr/local/bin/docker-entrypoint.sh", "mysqld", "--character-set-server=utf8mb4", "--datadir", "/tmp/initialized-db"]

FROM mysql:8.0
ENV MYSQL_DATABASE dongtai_webapi
ENV MYSQL_ROOT_PASSWORD dongtai-iast

COPY --from=builder /tmp/initialized-db /var/lib/mysql
COPY update-*release*.sql /sql/
COPY mysqld.cnf /etc/mysql/conf.d/
COPY dongtai-mysql-schema.txt /schema/
COPY mysql8.sql /schema/
COPY updaterecord.txt /schema/
CMD [ "mysqld", "--max_allowed_packet=1024M", "--character-set-server=utf8mb4" ]
