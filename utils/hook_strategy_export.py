######################################################################
# @author      : bidaya0 (bidaya0@$HOSTNAME)
# @file        : hook_strategy_export
# @created     : 星期一 2月 07, 2022 16:29:01 CST
#
# @description :
######################################################################

from test_strategy import TestDB,TargetDB

cursor = TargetDB.db.cursor()
hook_type_query_sql = '''
select * from iast_hook_type iht 
where id in (select hooktype_id from iast_hook_strategy_type ihst 
where  hooktype_id in (
select id from iast_hook_type iht where  language_id IN (1,2,3,4) AND enable in (0,1) and `type` in (1,2,3,4) )
and hookstrategy_id  in (select id from iast_hook_strategy ihs where created_by IN (1,1207) and enable in (0,1)));
'''

hook_type_sql = '''
INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`
	, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT %s, %s, %s, %s
	, %s, %s, %s 
	, %s FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`=%s AND `name`= %s
AND  value = %s AND  `created_by`= %s
AND enable = %s AND name_en = %s AND name_zh = %s AND language_id = %s LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`=%s AND `name`= %s
AND  value = %s  AND `created_by` = %s
AND enable = %s AND name_en = %s AND name_zh = %s AND language_id = %s LIMIT 1);
'''

hook_strategy_query_sql = '''
select * from iast_hook_strategy ihs2 
where id in (select hookstrategy_id from iast_hook_strategy_type ihst 
where  hooktype_id in (
select id from iast_hook_type iht where  language_id  IN (1,2,3,4) AND enable in (0,1) and `type` in (1,2,3,4))
and hookstrategy_id  in (select id from iast_hook_strategy ihs where created_by IN (1,1207) and enable in (0,1)));
'''

hook_strategy_sql = '''
INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, created_by, enable)
SELECT %s, %s, %s, %s, %s, %s, %s FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value` = %s AND `source` = %s AND `target` = %s AND `inherit` = %s AND `track` = %s AND  `created_by` = %s AND `enable` = %s LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value` = %s AND `source` = %s AND `target` = %s AND `inherit` = %s AND `track` = %s AND  `created_by` = %s AND `enable` = %s LIMIT 1);
'''

hook_strategy_type_query_sql = '''
select * from iast_hook_strategy_type ihst
where  hooktype_id in (
select id from iast_hook_type iht where  language_id  IN (1,2,3,4) AND enable in (0,1) and `type` in (1,2,3,4))
and hookstrategy_id  in (select id from iast_hook_strategy ihs where created_by IN (1,1207) and enable in (0,1));
'''

finsql = hook_strategy_sql.format(
    **{
        i: '%s'
        for i in [
            'value', 'source', 'target', 'inherit', 'track', 'created_by', 'enable'
        ]
    })


cursor.execute(hook_type_query_sql)


def escape_null_equal(sql):
    return sql.replace('= NULL', 'IS NULL')


hook_type_dict = {}
for data in cursor.fetchall():
    final_sql = cursor.mogrify(hook_type_sql, [
        data['type'],
        data['name'],
        data['value'],
        1,
        data['enable'],
        data['name_en'],
        data['name_zh'],
        data['language_id'],
    ] * 3)
    hook_type_dict[int(data['id'])] = escape_null_equal(final_sql)




cursor.execute(hook_strategy_query_sql)


def escape_null_equal(sql):
    return sql.replace('= NULL', 'IS NULL')


hook_strategy_dict = {}
for data in cursor.fetchall():
    data['created_by'] = 1
    final_sql = cursor.mogrify(hook_strategy_sql, [
        data[i] for i in [
            'value', 'source', 'target', 'inherit', 'track', 'created_by',
            'enable'
        ]
    ] * 3)
    hook_strategy_dict[int(data['id'])] = escape_null_equal(final_sql)

cursor.execute(hook_strategy_type_query_sql)
for data in cursor.fetchall():
    print(hook_type_dict[data['hooktype_id']])
    print(hook_strategy_dict[data['hookstrategy_id']])
    print(
        'INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);'
    )

hook_strategy_value_sql = '''
SELECT value FROM iast_hook_strategy ihs ;
'''

DELETE_EXIST_STRATEGY_SQL = '''
DELETE FROM iast_hook_strategy WHERE value IN ({});
'''
testcursor = TestDB.db.cursor()
testcursor.execute(hook_strategy_value_sql)
result = testcursor.fetchall()
values = map(lambda x: x['value'], result)
res = DELETE_EXIST_STRATEGY_SQL.format(','.join(
    cursor._escape_args(list(values), cursor._get_db())))
print(res)
