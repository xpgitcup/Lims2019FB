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

 Date: 09/06/2019 15:00:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for team_person
-- ----------------------------
DROP TABLE IF EXISTS `team_person`;
CREATE TABLE `team_person`  (
  `team_members_id` bigint(20) NOT NULL,
  `person_id` bigint(20) NULL DEFAULT NULL,
  INDEX `FK849p1qabcqamcqtn57f2h8v8p`(`person_id`) USING BTREE,
  INDEX `FKt0ne9eoxa1hptfkq4vo8xhd53`(`team_members_id`) USING BTREE,
  CONSTRAINT `FK849p1qabcqamcqtn57f2h8v8p` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKt0ne9eoxa1hptfkq4vo8xhd53` FOREIGN KEY (`team_members_id`) REFERENCES `team` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of team_person
-- ----------------------------
INSERT INTO `team_person` VALUES (12, 49);
INSERT INTO `team_person` VALUES (9, 57);
INSERT INTO `team_person` VALUES (8, 43);
INSERT INTO `team_person` VALUES (13, 29);
INSERT INTO `team_person` VALUES (11, 34);
INSERT INTO `team_person` VALUES (10, 263);
INSERT INTO `team_person` VALUES (5, 2);
INSERT INTO `team_person` VALUES (5, 15);
INSERT INTO `team_person` VALUES (5, 75);
INSERT INTO `team_person` VALUES (5, 69);
INSERT INTO `team_person` VALUES (5, 64);
INSERT INTO `team_person` VALUES (5, 224);
INSERT INTO `team_person` VALUES (69, 95);
INSERT INTO `team_person` VALUES (70, 97);
INSERT INTO `team_person` VALUES (4, 2);
INSERT INTO `team_person` VALUES (4, 224);
INSERT INTO `team_person` VALUES (4, 6);
INSERT INTO `team_person` VALUES (4, 49);
INSERT INTO `team_person` VALUES (4, 34);
INSERT INTO `team_person` VALUES (4, 263);
INSERT INTO `team_person` VALUES (1, 48);
INSERT INTO `team_person` VALUES (1, 61);
INSERT INTO `team_person` VALUES (1, 1);
INSERT INTO `team_person` VALUES (3, 2);
INSERT INTO `team_person` VALUES (3, 15);
INSERT INTO `team_person` VALUES (3, 43);
INSERT INTO `team_person` VALUES (3, 57);
INSERT INTO `team_person` VALUES (3, 48);
INSERT INTO `team_person` VALUES (3, 59);
INSERT INTO `team_person` VALUES (3, 80);
INSERT INTO `team_person` VALUES (7, 29);
INSERT INTO `team_person` VALUES (18, 118);
INSERT INTO `team_person` VALUES (18, 115);
INSERT INTO `team_person` VALUES (24, 124);
INSERT INTO `team_person` VALUES (24, 127);
INSERT INTO `team_person` VALUES (25, 135);
INSERT INTO `team_person` VALUES (25, 128);
INSERT INTO `team_person` VALUES (27, 100);
INSERT INTO `team_person` VALUES (27, 129);
INSERT INTO `team_person` VALUES (29, 113);
INSERT INTO `team_person` VALUES (29, 117);
INSERT INTO `team_person` VALUES (30, 109);
INSERT INTO `team_person` VALUES (30, 112);
INSERT INTO `team_person` VALUES (31, 106);
INSERT INTO `team_person` VALUES (31, 103);
INSERT INTO `team_person` VALUES (35, 121);
INSERT INTO `team_person` VALUES (35, 130);
INSERT INTO `team_person` VALUES (36, 123);
INSERT INTO `team_person` VALUES (36, 104);
INSERT INTO `team_person` VALUES (37, 108);
INSERT INTO `team_person` VALUES (37, 126);
INSERT INTO `team_person` VALUES (38, 111);
INSERT INTO `team_person` VALUES (38, 101);
INSERT INTO `team_person` VALUES (39, 134);
INSERT INTO `team_person` VALUES (39, 132);
INSERT INTO `team_person` VALUES (48, 165);
INSERT INTO `team_person` VALUES (49, 185);
INSERT INTO `team_person` VALUES (68, 94);
INSERT INTO `team_person` VALUES (33, 256);
INSERT INTO `team_person` VALUES (33, 255);
INSERT INTO `team_person` VALUES (40, 94);
INSERT INTO `team_person` VALUES (41, 81);
INSERT INTO `team_person` VALUES (41, 92);
INSERT INTO `team_person` VALUES (42, 83);
INSERT INTO `team_person` VALUES (42, 68);
INSERT INTO `team_person` VALUES (43, 66);
INSERT INTO `team_person` VALUES (43, 265);
INSERT INTO `team_person` VALUES (44, 93);
INSERT INTO `team_person` VALUES (44, 96);
INSERT INTO `team_person` VALUES (2, 1);
INSERT INTO `team_person` VALUES (2, 48);
INSERT INTO `team_person` VALUES (2, 15);
INSERT INTO `team_person` VALUES (2, 61);
INSERT INTO `team_person` VALUES (54, 35);
INSERT INTO `team_person` VALUES (14, 260);
INSERT INTO `team_person` VALUES (15, 245);
INSERT INTO `team_person` VALUES (15, 94);
INSERT INTO `team_person` VALUES (16, 241);
INSERT INTO `team_person` VALUES (16, 266);
INSERT INTO `team_person` VALUES (17, 256);
INSERT INTO `team_person` VALUES (17, 255);
INSERT INTO `team_person` VALUES (20, 253);
INSERT INTO `team_person` VALUES (20, 254);
INSERT INTO `team_person` VALUES (21, 249);
INSERT INTO `team_person` VALUES (21, 239);
INSERT INTO `team_person` VALUES (22, 33);
INSERT INTO `team_person` VALUES (22, 68);
INSERT INTO `team_person` VALUES (23, 244);
INSERT INTO `team_person` VALUES (23, 93);
INSERT INTO `team_person` VALUES (26, 259);
INSERT INTO `team_person` VALUES (26, 242);
INSERT INTO `team_person` VALUES (28, 251);
INSERT INTO `team_person` VALUES (28, 250);
INSERT INTO `team_person` VALUES (34, 246);
INSERT INTO `team_person` VALUES (34, 56);
INSERT INTO `team_person` VALUES (6, 48);
INSERT INTO `team_person` VALUES (6, 61);
INSERT INTO `team_person` VALUES (58, 267);

SET FOREIGN_KEY_CHECKS = 1;
