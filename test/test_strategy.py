from configparser import ConfigParser
import os
import pymysql
pymysql.install_as_MySQLdb()
import MySQLdb
import sys
config = ConfigParser()
status = config.read('conf/config.ini')
if len(status) == 0:
    print("config file not exist. stop running")
    sys.exit(0)


DBCONFIG = {
    'user': config.get("mysql", 'user'),
    'db': config.get("mysql", 'name'),
    'passwd': config.get("mysql", 'password'),
    'host': config.get("mysql", 'host'),
    'port': int(config.get("mysql", 'port')),
}
TARGETDBCONFIG = {
    'user': config.get("prodmysql", 'user'),
    'db': config.get("prodmysql", 'name'),
    'passwd': config.get("prodmysql", 'password'),
    'host': config.get("prodmysql", 'host'),
    'port': int(config.get("prodmysql", 'port')),
}
#class TestDB:
#    db = MySQLdb.connect(**DBCONFIG, use_unicode=True, charset="utf8mb4",cursorclass=pymysql.cursors.DictCursor)
class TargetDB:
    db = MySQLdb.connect(**TARGETDBCONFIG, use_unicode=True, charset="utf8mb4",cursorclass=pymysql.cursors.DictCursor)
def test_hook_strategy():
    cursor = TestDB.db.cursor()
    cursor.execute("SELECT * FROM iast_hook_type;")
    data = cursor.fetchall()
    test_hook_type= {}
    for item in data:
        test_hook_type[item['name']]=item
    cursor = TargetDB.db.cursor()
    cursor.execute("SELECT * FROM iast_hook_type;")
    data = cursor.fetchall()
    target_hook_type = {}
    for item in data:
        target_hook_type[item['name']] = item
    for key, item in target_hook_type.items():
        if key not in test_hook_type.keys():
            print(item)
