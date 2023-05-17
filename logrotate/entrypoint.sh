#!/bin/bash
for ((;;))
do
   echo "== 十分钟每次的日志检查 start！！！"
   sleep 600
   find /tmp/logstash/agent/ -mtime +30 -name "*log*" -exec rm -rf {} \;
   logrotate /etc/logrotate.d/logrotate
done
