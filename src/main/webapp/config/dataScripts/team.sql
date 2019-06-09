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

 Date: 09/06/2019 15:00:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `thing_id` bigint(20) NOT NULL,
  `leader_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKakp3oh8ul8hjcycd0aq8x9836`(`thing_id`) USING BTREE,
  INDEX `FK4lrv984nrutn7xe5bwap2p1le`(`leader_id`) USING BTREE,
  CONSTRAINT `FK4lrv984nrutn7xe5bwap2p1le` FOREIGN KEY (`leader_id`) REFERENCES `person` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKakp3oh8ul8hjcycd0aq8x9836` FOREIGN KEY (`thing_id`) REFERENCES `thing` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES (1, 3, 8, 2);
INSERT INTO `team` VALUES (2, 4, 9, 2);
INSERT INTO `team` VALUES (3, 7, 5, 1);
INSERT INTO `team` VALUES (4, 6, 6, 1);
INSERT INTO `team` VALUES (5, 6, 7, 1);
INSERT INTO `team` VALUES (6, 2, 10, 2);
INSERT INTO `team` VALUES (7, 1, 11, 2);
INSERT INTO `team` VALUES (8, 1, 12, 2);
INSERT INTO `team` VALUES (9, 1, 13, 2);
INSERT INTO `team` VALUES (10, 1, 14, 2);
INSERT INTO `team` VALUES (11, 1, 15, 2);
INSERT INTO `team` VALUES (12, 1, 16, 2);
INSERT INTO `team` VALUES (13, 1, 17, 2);
INSERT INTO `team` VALUES (14, 1, 2, 261);
INSERT INTO `team` VALUES (15, 2, 2, 95);
INSERT INTO `team` VALUES (16, 2, 2, 240);
INSERT INTO `team` VALUES (17, 2, 2, 265);
INSERT INTO `team` VALUES (18, 2, 4, 116);
INSERT INTO `team` VALUES (19, 0, 5, 252);
INSERT INTO `team` VALUES (20, 2, 2, 252);
INSERT INTO `team` VALUES (21, 2, 2, 90);
INSERT INTO `team` VALUES (22, 2, 2, 238);
INSERT INTO `team` VALUES (23, 2, 2, 243);
INSERT INTO `team` VALUES (24, 2, 4, 107);
INSERT INTO `team` VALUES (25, 2, 4, 131);
INSERT INTO `team` VALUES (26, 2, 2, 257);
INSERT INTO `team` VALUES (27, 2, 4, 120);
INSERT INTO `team` VALUES (28, 2, 2, 258);
INSERT INTO `team` VALUES (29, 2, 4, 114);
INSERT INTO `team` VALUES (30, 2, 4, 110);
INSERT INTO `team` VALUES (31, 2, 4, 105);
INSERT INTO `team` VALUES (32, 0, 4, 127);
INSERT INTO `team` VALUES (33, 2, 3, 260);
INSERT INTO `team` VALUES (34, 2, 2, 247);
INSERT INTO `team` VALUES (35, 2, 4, 125);
INSERT INTO `team` VALUES (36, 2, 4, 119);
INSERT INTO `team` VALUES (37, 2, 4, 136);
INSERT INTO `team` VALUES (38, 2, 4, 102);
INSERT INTO `team` VALUES (39, 2, 4, 133);
INSERT INTO `team` VALUES (40, 1, 3, 95);
INSERT INTO `team` VALUES (41, 2, 3, 82);
INSERT INTO `team` VALUES (42, 2, 3, 84);
INSERT INTO `team` VALUES (43, 2, 3, 264);
INSERT INTO `team` VALUES (44, 2, 3, 97);
INSERT INTO `team` VALUES (45, 0, 1, 151);
INSERT INTO `team` VALUES (46, 0, 1, 162);
INSERT INTO `team` VALUES (47, 0, 1, 211);
INSERT INTO `team` VALUES (48, 1, 1, 165);
INSERT INTO `team` VALUES (49, 1, 1, 185);
INSERT INTO `team` VALUES (50, 0, 6, 224);
INSERT INTO `team` VALUES (51, 0, 12, 50);
INSERT INTO `team` VALUES (52, 0, 17, 29);
INSERT INTO `team` VALUES (53, 0, 11, 29);
INSERT INTO `team` VALUES (54, 1, 19, 2);
INSERT INTO `team` VALUES (55, 0, 16, 49);
INSERT INTO `team` VALUES (56, 0, 15, 34);
INSERT INTO `team` VALUES (57, 0, 22, 35);
INSERT INTO `team` VALUES (58, 1, 23, 2);
INSERT INTO `team` VALUES (59, 0, 23, 267);
INSERT INTO `team` VALUES (60, 0, 14, 263);
INSERT INTO `team` VALUES (61, 0, 21, 50);
INSERT INTO `team` VALUES (62, 0, 13, 57);
INSERT INTO `team` VALUES (63, 0, 6, 263);
INSERT INTO `team` VALUES (64, 0, 2, 242);
INSERT INTO `team` VALUES (65, 0, 19, 35);
INSERT INTO `team` VALUES (66, 0, 2, 91);
INSERT INTO `team` VALUES (67, 0, 2, 68);
INSERT INTO `team` VALUES (68, 1, 25, 2);
INSERT INTO `team` VALUES (69, 1, 26, 2);
INSERT INTO `team` VALUES (70, 1, 24, 2);

SET FOREIGN_KEY_CHECKS = 1;
