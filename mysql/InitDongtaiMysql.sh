#! /bin/bash
# 下载数据库文件
# wget https://huoqi-public.oss-cn-beijing.aliyuncs.com/iast/sql/db.sql

echo "#! /bin/bash" > mysql/mysqlBuild.sh
echo "wget https://huoqi-public.oss-cn-beijing.aliyuncs.com/iast/sql/db.sql" >> mysql/mysqlBuild.sh
cat mysql/updaterecord.txt | while read -r line;
do
if [[ $line == "" ]]; then
    continue
fi
    PODNAME=`echo $line | awk '{print $2}'`;
    echo $PODNAME
    echo "wget https://huoqi-public.oss-cn-beijing.aliyuncs.com/iast/sql/${PODNAME}" >> mysql/mysqlBuild.sh
done
