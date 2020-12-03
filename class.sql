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

 Date: 03/12/2020 15:48:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `classID` int(11) NOT NULL COMMENT ' ',
  `stuCount` int(11) NULL DEFAULT NULL,
  `healthAll` tinyint(1) NULL DEFAULT 0 COMMENT '判断学生是否都是健康的',
  PRIMARY KEY (`classID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES (1, 7, 1);

SET FOREIGN_KEY_CHECKS = 1;
