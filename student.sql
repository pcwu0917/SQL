/*
 Navicat Premium Data Transfer

 Source Server         : user.sit.czworks.cn
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : user.sit.czworks.cn:3306
 Source Schema         : czorder

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 03/12/2020 15:49:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `stuID` int(11) NOT NULL,
  `classID` int(11) NULL DEFAULT NULL,
  `health` tinyint(1) NULL DEFAULT 0 COMMENT '学生的健康程度',
  PRIMARY KEY (`stuID`) USING BTREE,
  INDEX `classId`(`classID`) USING BTREE,
  CONSTRAINT `classId` FOREIGN KEY (`classID`) REFERENCES `class` (`classID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, 1, 1);
INSERT INTO `student` VALUES (2, 1, 1);
INSERT INTO `student` VALUES (4, 1, 1);

-- ----------------------------
-- Triggers structure for table student
-- ----------------------------
DROP TRIGGER IF EXISTS `tri_stuInsert`;
delimiter ;;
CREATE TRIGGER `tri_stuInsert` AFTER INSERT ON `student` FOR EACH ROW begin
	declare c int;
  set c = (select stuCount from class where classID=new.classID);
  update class set stuCount = c + 1 where classID = new.classID;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table student
-- ----------------------------
DROP TRIGGER IF EXISTS `tri_healthInsert`;
delimiter ;;
CREATE TRIGGER `tri_healthInsert` AFTER INSERT ON `student` FOR EACH ROW begin
	declare allStu,allHealthStu int;
  set allStu = (select count(health) from student where classId=new.classId);
	set allHealthStu = (select count(health) from student where classId=new.classId and health=1);
	if allStu=allHealthStu THEN 
		update class set healthAll=1 where classID = new.classID;
	else
		update class set healthAll=0 where classID = new.classID;
	end if;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table student
-- ----------------------------
DROP TRIGGER IF EXISTS `tri_healthupdate`;
delimiter ;;
CREATE TRIGGER `tri_healthupdate` AFTER UPDATE ON `student` FOR EACH ROW begin
	declare allStu,allHealthStu int;
  set allStu = (select count(health) from student where classId=old.classId);
	set allHealthStu = (select count(health) from student where classId=old.classId and health=1);
	if allStu=allHealthStu THEN 
		update class set healthAll=1 where classID = old.classID;
	else
		update class set healthAll=0 where classID = old.classID;
	end if;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table student
-- ----------------------------
DROP TRIGGER IF EXISTS `tri_healthDelete`;
delimiter ;;
CREATE TRIGGER `tri_healthDelete` AFTER DELETE ON `student` FOR EACH ROW begin
	declare allStu,allHealthStu int;
  set allStu = (select count(health) from student where classId=old.classId);
	set allHealthStu = (select count(health) from student where classId=old.classId and health=1);
	if allStu=allHealthStu THEN 
		update class set healthAll=1 where classID = old.classID;
	else
		update class set healthAll=0 where classID = old.classID;
	end if;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
