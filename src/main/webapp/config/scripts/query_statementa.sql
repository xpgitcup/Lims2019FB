/*
 Navicat Premium Data Transfer

 Source Server         : sample
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : lims2019dba

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 04/07/2019 17:09:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for query_statementa
-- ----------------------------
DROP TABLE IF EXISTS `query_statementa`;
CREATE TABLE `query_statementa`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `format_string` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `controller_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `issql` bit(1) NOT NULL,
  `need_to_query` bit(1) NOT NULL,
  `action_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `params_string` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `query_string` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `key_string` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `view_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of query_statementa
-- ----------------------------
INSERT INTO `query_statementa` VALUES (1, 0, '2019-07-04 15:02:53', NULL, 'home', b'0', b'1', 'count', '[]', NULL, '在研项目', NULL);
INSERT INTO `query_statementa` VALUES (2, 0, '2019-07-04 15:02:53', NULL, 'home', b'0', b'1', 'list', '[max, offset]', NULL, '在研项目', NULL);
INSERT INTO `query_statementa` VALUES (3, 0, '2019-07-04 15:03:07', NULL, 'home', b'0', b'1', 'count', '[]', NULL, '全部项目', NULL);
INSERT INTO `query_statementa` VALUES (4, 0, '2019-07-04 15:03:07', NULL, 'home', b'0', b'1', 'list', '[max, offset]', NULL, '全部项目', NULL);
INSERT INTO `query_statementa` VALUES (5, 0, '2019-07-04 15:03:08', NULL, 'home', b'0', b'1', 'count', '[]', NULL, '当前教学', NULL);
INSERT INTO `query_statementa` VALUES (6, 0, '2019-07-04 15:03:08', NULL, 'home', b'0', b'1', 'list', '[max, offset]', NULL, '当前教学', NULL);
INSERT INTO `query_statementa` VALUES (7, 0, '2019-07-04 15:03:09', NULL, 'home', b'0', b'1', 'count', '[]', NULL, '全部教学', NULL);
INSERT INTO `query_statementa` VALUES (8, 0, '2019-07-04 15:03:09', NULL, 'home', b'0', b'1', 'list', '[max, offset]', NULL, '全部教学', NULL);
INSERT INTO `query_statementa` VALUES (9, 0, '2019-07-04 15:03:10', NULL, 'home', b'0', b'1', 'count', '[]', NULL, '科研进展', NULL);
INSERT INTO `query_statementa` VALUES (10, 0, '2019-07-04 15:03:10', NULL, 'home', b'0', b'1', 'list', '[max, offset]', NULL, '科研进展', NULL);
INSERT INTO `query_statementa` VALUES (11, 0, '2019-07-04 15:03:11', NULL, 'home', b'0', b'1', 'count', '[]', NULL, '教学进展', NULL);
INSERT INTO `query_statementa` VALUES (12, 0, '2019-07-04 15:03:11', NULL, 'home', b'0', b'1', 'list', '[max, offset]', NULL, '教学进展', NULL);
INSERT INTO `query_statementa` VALUES (13, 0, '2019-07-04 15:03:11', NULL, 'home', b'0', b'1', 'count', '[]', NULL, '进展统计', NULL);
INSERT INTO `query_statementa` VALUES (14, 0, '2019-07-04 15:03:11', NULL, 'home', b'0', b'1', 'list', '[max, offset]', NULL, '进展统计', NULL);
INSERT INTO `query_statementa` VALUES (15, 0, '2019-07-04 15:03:12', NULL, 'home', b'0', b'1', 'count', '[]', NULL, '登录统计', NULL);
INSERT INTO `query_statementa` VALUES (16, 0, '2019-07-04 15:03:12', NULL, 'home', b'0', b'1', 'list', '[max, offset]', NULL, '登录统计', NULL);
INSERT INTO `query_statementa` VALUES (17, 0, '2019-07-04 15:03:16', NULL, 'home', b'0', b'1', 'count', '[myself]', NULL, '我的进展', NULL);
INSERT INTO `query_statementa` VALUES (18, 0, '2019-07-04 15:03:16', NULL, 'home', b'0', b'1', 'count', '[myself]', NULL, '我的登录', NULL);
INSERT INTO `query_statementa` VALUES (19, 0, '2019-07-04 15:03:16', NULL, 'home', b'0', b'1', 'list', '[max, myself, offset]', NULL, '我的登录', NULL);
INSERT INTO `query_statementa` VALUES (20, 0, '2019-07-04 15:03:20', NULL, 'operation4QueryStatementA', b'0', b'1', 'count', '[]', 'select count(*) from QueryStatementA queryStatementA', '查询维护', NULL);
INSERT INTO `query_statementa` VALUES (21, 0, '2019-07-04 15:03:20', NULL, 'operation4QueryStatementA', b'0', b'1', 'list', '[max, offset]', 'from QueryStatementA queryStatementA', '查询维护', 'listQueryStatementA');
INSERT INTO `query_statementa` VALUES (22, 0, '2019-07-04 15:25:22', NULL, 'operation4QueryStatementA', b'0', b'1', 'count', '[]', 'select count(*) from QueryStatementA queryStatementA', '查询维护待编辑', NULL);
INSERT INTO `query_statementa` VALUES (23, 0, '2019-07-04 15:25:22', NULL, 'operation4QueryStatementA', b'0', b'1', 'list', '[max, offset]', 'from QueryStatementA queryStatementA', '查询维护待编辑', 'listQueryStatementA');
INSERT INTO `query_statementa` VALUES (24, 1, '2019-07-04 15:25:52', NULL, 'operation4QueryStatementA', b'0', b'1', 'count', '[like]', 'select count(*) from QueryStatementA queryStatementA\r\n where queryStatementA.keyString like :like', '查询维护', NULL);
INSERT INTO `query_statementa` VALUES (25, 1, '2019-07-04 15:25:52', NULL, 'operation4QueryStatementA', b'0', b'1', 'list', '[like, max, offset]', 'from QueryStatementA queryStatementA\r\n where queryStatementA.keyString like :like', '查询维护', 'listQueryStatementA');
INSERT INTO `query_statementa` VALUES (26, 0, '2019-07-04 17:08:23', NULL, 'operation4SystemUser', b'0', b'1', 'count', '[]', 'select count(*) from SystemUser systemUser', '用户维护', NULL);
INSERT INTO `query_statementa` VALUES (27, 0, '2019-07-04 17:08:24', NULL, 'operation4SystemUser', b'0', b'1', 'list', '[max, offset]', 'from SystemUser systemUser', '用户维护', 'listSystemUser');

SET FOREIGN_KEY_CHECKS = 1;
