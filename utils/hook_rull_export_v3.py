######################################################################
# @author      : bidaya0 (bidaya0@$HOSTNAME)
# @file        : hook_type_rull_sql
# @created     : 星期五 10月 22, 2021 21:41:12 CST
#
# @description :
######################################################################

with open('complitejava.sql', 'r') as fp:
    sql = fp.readlines()
hook_type_dict = {}
hook_strategy_pair = []
hook_strategy_dict = {}
	
for i in sql:
    if i.startswith(
            'INSERT IGNORE INTO iast_hook_type (id, `type`, name, value, create_time, update_time, created_by, enable, name_en, name_zh, language_id, strategy_id) VALUES('
    ):
        a = i.replace(
            'INSERT IGNORE INTO iast_hook_type (id, `type`, name, value, create_time, update_time, created_by, enable, name_en, name_zh, language_id, strategy_id) VALUES(',
            '').replace(');\n', '')
        id_, type_, name, value, create_time, update_time, created_by, enable, name_en, name_zh, language_id, strategy_id = res = a.split(
            ',')
        print(res)
        hook_type_dict[int(id_)] ='''INSERT IGNORE INTO `iast_hook_type` (`type`, `name`, `value`, `create_time`
	, `update_time`, `created_by`, `enable`, `name_en`, `name_zh`
	, `language_id`)
SELECT {type_}, {name}, {value}, {create_time}
	, {update_time}, {created_by}, {enable}, {name_en}, {name_zh}
	, {language_id} FROM DUAL WHERE NOT EXISTS (SELECT `id` FROM iast_hook_type WHERE 
`type`={type_} AND `name`= {name}
AND  value = {value} AND
update_time={update_time} AND create_time={create_time} AND `created_by`={created_by}
AND enable = {enable} AND name_en = {name_en}AND name_zh = {name_zh} AND language_id = {language_id} LIMIT 1);
SET @HOOK_TYPE_ID = (SELECT `id` FROM iast_hook_type WHERE 
`type`={type_} AND `name`= {name}
AND  value = {value} AND
update_time={update_time} AND create_time={create_time} AND `created_by`={created_by}
AND enable = {enable} AND name_en = {name_en}AND name_zh = {name_zh} AND language_id = {language_id} LIMIT 1);

'''.format(
                type_=type_,
                name=name,
                value=value,
                create_time=create_time,
                update_time=update_time,
                created_by=created_by,
                enable=enable,
                name_en=name_en,
                name_zh=name_zh,
                language_id=language_id)
    elif i.startswith(
            'INSERT IGNORE INTO iast_hook_strategy (id, value, source, target, inherit, track, create_time, update_time, created_by, enable) VALUES('
    ):
        a = i.replace(
            'INSERT IGNORE INTO iast_hook_strategy (id, value, source, target, inherit, track, create_time, update_time, created_by, enable) VALUES(',
            '').replace(');', '')
        print(a.split(','))
        id_, value, source, target, inherit, track, create_time, update_time, created_by, enable = res = a.split(
            ',')
        print(res)
        hook_strategy_dict[int(id_)] = '''INSERT IGNORE INTO iast_hook_strategy
(value, source, target, inherit, track, create_time, update_time, created_by, enable)
SELECT {value}, {source}, {target}, {inherit}, {track}, {create_time}, {update_time}, {created_by}, {enable} FROM DUAL 
WHERE NOT EXISTS (SELECT `id` FROM iast_hook_strategy WHERE 
`value`={value} AND `source`={source} AND `target`={target} AND `inherit`={inherit} AND `track`={track} AND `create_time`= {create_time} AND `update_time`= {update_time} AND `created_by`={created_by} AND `enable` = {enable} LIMIT 1);
SET @IAST_HOOK_STRATEGY_ID = (SELECT `id` FROM iast_hook_strategy WHERE 
`value`={value} AND `source`={source} AND `target`={target} AND `inherit`={inherit} AND `track`={track} AND `create_time`= {create_time} AND `update_time`= {update_time} AND `created_by`={created_by} AND `enable` = {enable} LIMIT 1);
'''.format(value=value,
           source=source,
           target=target,
           inherit=inherit,
           track=track,
           create_time=create_time,
           update_time=update_time,
           created_by=created_by,
           enable=enable)
    elif i.startswith(
            'INSERT IGNORE INTO iast_hook_strategy_type (id, hookstrategy_id, hooktype_id) VALUES('
    ):
        a = i.replace(
            'INSERT IGNORE INTO iast_hook_strategy_type (id, hookstrategy_id, hooktype_id) VALUES(',
            '').replace(');', '')
        id_, hookstrategy_id, hooktype_id = res = a.split(',')
        hook_strategy_pair.append([int(hookstrategy_id), int(hooktype_id)])


for k, v in hook_strategy_pair:
    res = hook_type_dict[int(v)]
    print(hook_strategy_dict[int(k)])
    print(
        'INSERT IGNORE INTO iast_hook_strategy_type (hookstrategy_id, hooktype_id) VALUES (@IAST_HOOK_STRATEGY_ID, @HOOK_TYPE_ID);'
    )
