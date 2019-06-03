/*
 Navicat Premium Data Transfer

 Source Server         : 10.1.16.50
 Source Server Type    : MySQL
 Source Server Version : 50627
 Source Host           : 10.1.16.50:3306
 Source Schema         : lims2019db

 Target Server Type    : MySQL
 Target Server Version : 50627
 File Encoding         : 65001

 Date: 29/04/2019 08:46:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for data_root_path
-- ----------------------------
DROP TABLE IF EXISTS `data_root_path`;
CREATE TABLE `data_root_path`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `root_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `key_string` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_iiheaavm7j7jj5uagoxoxwu8x`(`key_string`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of data_root_path
-- ----------------------------
INSERT INTO `data_root_path` VALUES (1, 0, 'e:/home', 'DEVELOPMENT.operation4Progress');
INSERT INTO `data_root_path` VALUES (2, 0, '/home/documents/lims2019dc', 'PRODUCTION.operation4Progress');

SET FOREIGN_KEY_CHECKS = 1;
