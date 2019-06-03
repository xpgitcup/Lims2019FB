/*
 Navicat Premium Data Transfer

 Source Server         : sample
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : lims2019dba

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 27/05/2019 22:29:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for system_attribute
-- ----------------------------
DROP TABLE IF EXISTS `system_attribute`;
CREATE TABLE `system_attribute`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `up_attribute_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKa8ygck6uvyk4a6bb7ywe573xp`(`up_attribute_id`) USING BTREE,
  CONSTRAINT `FKa8ygck6uvyk4a6bb7ywe573xp` FOREIGN KEY (`up_attribute_id`) REFERENCES `system_attribute` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of system_attribute
-- ----------------------------
INSERT INTO `system_attribute` VALUES (1, 1, '系统权限', NULL);
INSERT INTO `system_attribute` VALUES (2, 0, '系统维护', 1);
INSERT INTO `system_attribute` VALUES (3, 0, '基础维护', 1);
INSERT INTO `system_attribute` VALUES (7, 0, '底层管理', 1);
INSERT INTO `system_attribute` VALUES (8, 0, '教师权限', NULL);
INSERT INTO `system_attribute` VALUES (9, 0, '学生权限', NULL);
INSERT INTO `system_attribute` VALUES (10, 0, '基础维护', 8);
INSERT INTO `system_attribute` VALUES (11, 2, '教师服务', 8);
INSERT INTO `system_attribute` VALUES (12, 2, '学生服务', 9);
INSERT INTO `system_attribute` VALUES (15, 0, '底层管理', 8);
INSERT INTO `system_attribute` VALUES (16, 1, '教师服务', 1);
INSERT INTO `system_attribute` VALUES (17, 0, '学生服务', 1);
INSERT INTO `system_attribute` VALUES (18, 0, '用户服务', 1);
INSERT INTO `system_attribute` VALUES (19, 0, '用户服务', 8);
INSERT INTO `system_attribute` VALUES (20, 0, '用户服务', 9);

SET FOREIGN_KEY_CHECKS = 1;
