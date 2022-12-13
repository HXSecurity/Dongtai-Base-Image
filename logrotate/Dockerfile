FROM ubuntu:latest
RUN apt-get update && apt-get -y install logrotate
copy entrypoint.sh .
copy logrotate /etc/logrotate.d/
ENTRYPOINT ["bash","entrypoint.sh"]
#CMD service cron start && tail -f /dev/null