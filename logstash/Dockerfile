FROM docker.elastic.co/logstash/logstash:8.7.0
run logstash-plugin install logstash-output-analyticdb &&  logstash-plugin install logstash-output-jdbc && mkdir -p  /usr/share/logstash/vendor/jar/jdbc
copy logstash.yml /usr/share/logstash/config/
copy mysql-connector-java-5.1.49.jar /usr/share/logstash/vendor/jar/jdbc/
copy pipelines.yml /usr/share/logstash/config/
copy jvm.options /usr/share/logstash/config/
copy logstash-mysql.conf /usr/share/logstash/pipeline/logstash.conf

