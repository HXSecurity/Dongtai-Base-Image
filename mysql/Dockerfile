FROM mysql:5.7 as builder

# That file does the DB initialization but also runs mysql daemon, by removing the last line it will only init
RUN ["sed", "-i", "s/exec \"$@\"/echo \"not running $@\"/", "/usr/local/bin/docker-entrypoint.sh"]

# needed for intialization
ENV MYSQL_DATABASE dongtai_webapi
ENV MYSQL_ROOT_PASSWORD dongtai-iast

ADD https://huoqi-public.oss-cn-beijing.aliyuncs.com/iast/sql/sca-schema.sql /docker-entrypoint-initdb.d/sca-0.sql
ADD https://huoqi-public.oss-cn-beijing.aliyuncs.com/iast/sql/rule.sql /docker-entrypoint-initdb.d/rule.sql
ADD https://huoqi-public.oss-cn-beijing.aliyuncs.com/iast-pro/sql/sca-schema-pro-ENT.sql /docker-entrypoint-initdb.d/update-20220114-release-sca.sql

COPY db.sql /docker-entrypoint-initdb.d/
COPY update-*release*.sql /docker-entrypoint-initdb.d/
RUN chmod 777 /docker-entrypoint-initdb.d -R

RUN ["/usr/local/bin/docker-entrypoint.sh", "mysqld", "--character-set-server=utf8mb4", "--collation-server=utf8mb4_general_ci", "--datadir", "/initialized-db"] \
  && mysqldump -d dongtai_webapi -u root -p'dongtai-iast' --single-transaction --skip-set-charset --skip-comments --allow-keywords --skip-opt | sed 's/ AUTO_INCREMENT=[0-9]*//g' | sed 's/\/\*!*.*//g' > /sql/sca-schema-pro.sql 

FROM mysql:5.7
ENV MYSQL_DATABASE dongtai_webapi
ENV MYSQL_ROOT_PASSWORD dongtai-iast

COPY --from=builder /initialized-db /var/lib/mysql
COPY update-*release*.sql /sql/
COPY mysqld.cnf /etc/mysql/mysql.conf.d/

CMD [ "mysqld","--max_allowed_packet=1024M", "--character-set-server=utf8mb4", "--collation-server=utf8mb4_general_ci" ]
