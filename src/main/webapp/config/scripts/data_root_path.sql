/*
 Navicat Premium Data Transfer

 Source Server         : sample
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : lims2019dba

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 10/06/2019 18:31:25
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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_root_path
-- ----------------------------
INSERT INTO `data_root_path` VALUES (1, 0, 'e:/home', 'DEVELOPMENT.operation4Progress');
INSERT INTO `data_root_path` VALUES (2, 0, '/home/documents/lims2019dc', 'PRODUCTION.operation4Progress');
INSERT INTO `data_root_path` VALUES (3, 0, 'e:/home', 'DEVELOPMENT.operation4Routine');
INSERT INTO `data_root_path` VALUES (4, 0, '/home/documents/lims2019dc', 'PRODUCTION.operation4Routine');

SET FOREIGN_KEY_CHECKS = 1;
