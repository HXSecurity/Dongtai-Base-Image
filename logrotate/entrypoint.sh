#!/bin/bash
for ((;;))
do
   echo "== 十分钟每次的日志检查 start！！！"
   sleep 600
   logrotate /etc/logrotate.d/logrotate
done