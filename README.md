# SQL触发器

# 1、创建触发器

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

