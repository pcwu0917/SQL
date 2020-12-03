# SQL触发器

# 1、创建触发器

1、语法规则

```sql
-- 修改语句结束符;;
delimiter ;;
CREATE TRIGGER `触发器名` AFTER/BEFORE INSERT/UPDATE/DELETE ON `表名` FOR EACH ROW 
begin
	-- 定义变量c用于接收后面sql语句结果
	declare c int;
	set c = (select stuCount from class where classID=new.classID);
	
	-- 更新操作：insert只有个new,delete只有old,update有new和old对象
	update class set stuCount = c + 1 where classID = new.classID;
END
-- 结束
;;
-- 改回语句结束符
delimiter ;
```

2、获取到sql中的字段，用@stuNum接收

```sql
BEGIN
	SELECT student_num from clazz where id=new.class_id into @stuNum;
	-- 当班级学生数量大于30时，禁止插入，后面的sql语句也不执行
	if @stuNum >= '30' THEN
		insert into nothing VALUES (1,1,1,1);
	end if;
END
```

