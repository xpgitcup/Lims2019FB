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

 Date: 20/05/2019 15:36:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for thing_progress
-- ----------------------------
DROP TABLE IF EXISTS `thing_progress`;
CREATE TABLE `thing_progress`  (
  `thing_progresses_id` bigint(20) NOT NULL,
  `progress_id` bigint(20) NULL DEFAULT NULL,
  INDEX `FKobt92l4fslq51a7s9smgvq74b`(`progress_id`) USING BTREE,
  INDEX `FKqqdsiyq8l68a7m27rkdgpiwk1`(`thing_progresses_id`) USING BTREE,
  CONSTRAINT `FKobt92l4fslq51a7s9smgvq74b` FOREIGN KEY (`progress_id`) REFERENCES `progress` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKqqdsiyq8l68a7m27rkdgpiwk1` FOREIGN KEY (`thing_progresses_id`) REFERENCES `thing` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
