/*
 Navicat Premium Data Transfer

 Source Server         : localMySQL80
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : killer

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 19/09/2019 14:09:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cust_rela
-- ----------------------------
DROP TABLE IF EXISTS `cust_rela`;
CREATE TABLE `cust_rela`  (
  `CUST_NUMBER` varchar(100) NULL DEFAULT NULL COMMENT '客户号',
  `RELA_CUST_NUMBER` varchar(100) NULL DEFAULT NULL COMMENT '关联客户号',
  `RELA_CUST_KILL_TIME` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '新客户进场时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cust_rela
-- ----------------------------
BEGIN;
INSERT INTO `cust_rela` VALUES (20190730001, 20190802001, '20190802');
COMMIT;

-- ----------------------------
-- Table structure for item_info
-- ----------------------------
DROP TABLE IF EXISTS `item_info`;
CREATE TABLE `item_info`  (
  `ITEM_NAME` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主题名称',
  `ITEM_ID` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主题代码',
  `ROLE_ID` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色代码',
  `ROLE_NAME` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色名称'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of item_info
-- ----------------------------
BEGIN;
INSERT INTO `item_info` VALUES ('将军府', '001', '001', '将军');
COMMIT;

-- ----------------------------
-- Table structure for killer_cust
-- ----------------------------
DROP TABLE IF EXISTS `killer_cust`;
CREATE TABLE `killer_cust`  (
  `CUST_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `CUST_NUMBER` varchar(100) NULL DEFAULT NULL COMMENT '客户号',
  `CUST_GENDER` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户性别',
  `CUST_FTIME` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户开户时间',
  `CUST_PHONE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户联系方式'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of killer_cust
-- ----------------------------
BEGIN;
INSERT INTO `killer_cust` VALUES ('张舜钰', 20190730001, '男', '20190730', '13262969595');
COMMIT;

-- ----------------------------
-- Table structure for killer_info
-- ----------------------------
DROP TABLE IF EXISTS `killer_info`;
CREATE TABLE `killer_info`  (
  `CUST_NUMBER` varchar(100) NULL DEFAULT NULL COMMENT '客户号',
  `KILL_TIME` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '玩家进场日期',
  `ITEM_ID` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '当日主题代码',
  `ROLE_ID` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '当日角色',
  `GROUP_ID` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '团队号码'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of killer_info
-- ----------------------------
BEGIN;
INSERT INTO `killer_info` VALUES (20190730001, '20190730', '001', '001', 't2019073001');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
