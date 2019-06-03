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

 Date: 20/05/2019 15:36:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for project_plan
-- ----------------------------
DROP TABLE IF EXISTS `project_plan`;
CREATE TABLE `project_plan`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `team_id` bigint(20) NOT NULL,
  `percent` double NOT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_date` datetime(0) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `up_project_plan_id` bigint(20) NULL DEFAULT NULL,
  `serial_number` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKsq3iopayrp12ukkn2evdhw9gc`(`team_id`) USING BTREE,
  INDEX `FKs16m1vvwams47lvnaqo9ynkws`(`up_project_plan_id`) USING BTREE,
  CONSTRAINT `FKs16m1vvwams47lvnaqo9ynkws` FOREIGN KEY (`up_project_plan_id`) REFERENCES `project_plan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKsq3iopayrp12ukkn2evdhw9gc` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 345 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of project_plan
-- ----------------------------
INSERT INTO `project_plan` VALUES (1, 0, 5, 0, '', '2019-04-23 14:40:07', '多气合采全开发周期集输及处理工艺.1552.宫敬.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (2, 0, 5, 0, '', '2019-04-23 14:40:07', '招标', 1, 1);
INSERT INTO `project_plan` VALUES (3, 0, 5, 0, '', '2019-04-23 14:40:07', '调研', 1, 2);
INSERT INTO `project_plan` VALUES (4, 0, 5, 0, '', '2019-04-23 14:40:07', '算例', 1, 3);
INSERT INTO `project_plan` VALUES (5, 0, 5, 0, '', '2019-04-23 14:40:07', '实验', 1, 4);
INSERT INTO `project_plan` VALUES (6, 16, 5, 0, '', '2019-04-23 14:40:07', '日常汇报', 1, 5);
INSERT INTO `project_plan` VALUES (7, 2, 5, 0, '', '2019-04-23 14:40:07', '工作报告', 1, 6);
INSERT INTO `project_plan` VALUES (8, 0, 5, 0, '', '2019-04-23 14:40:07', '研究报告', 1, 7);
INSERT INTO `project_plan` VALUES (9, 0, 5, 0, '', '2019-04-23 14:40:07', '程序代码', 1, 8);
INSERT INTO `project_plan` VALUES (10, 0, 5, 0, '', '2019-04-23 14:40:07', '计算模型文件', 1, 9);
INSERT INTO `project_plan` VALUES (11, 4, 6, 0, '', '2019-04-23 14:40:07', '华南销售项目.1552.宫敬.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (12, 3, 6, 0, '', '2019-04-23 14:40:07', '招标', 11, 1);
INSERT INTO `project_plan` VALUES (13, 1, 6, 0, '', '2019-04-23 14:40:07', '调研', 11, 2);
INSERT INTO `project_plan` VALUES (14, 0, 6, 0, '', '2019-04-23 14:40:07', '算例', 11, 3);
INSERT INTO `project_plan` VALUES (15, 0, 6, 0, '', '2019-04-23 14:40:07', '实验', 11, 4);
INSERT INTO `project_plan` VALUES (16, 3, 6, 0, '', '2019-04-23 14:40:07', '日常汇报', 11, 5);
INSERT INTO `project_plan` VALUES (17, 0, 6, 0, '', '2019-04-23 14:40:07', '工作报告', 11, 6);
INSERT INTO `project_plan` VALUES (18, 0, 6, 0, '', '2019-04-23 14:40:07', '研究报告', 11, 7);
INSERT INTO `project_plan` VALUES (19, 3, 6, 0, '', '2019-04-23 14:40:07', '程序代码', 11, 8);
INSERT INTO `project_plan` VALUES (20, 0, 6, 0, '', '2019-04-23 14:40:07', '计算模型文件', 11, 9);
INSERT INTO `project_plan` VALUES (21, 0, 7, 0, '', '2019-04-23 14:40:07', '冲蚀项目.1552.宫敬.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (22, 1, 7, 0, '', '2019-04-23 14:40:07', '招标', 21, 1);
INSERT INTO `project_plan` VALUES (23, 0, 7, 0, '', '2019-04-23 14:40:07', '调研', 21, 2);
INSERT INTO `project_plan` VALUES (24, 1, 7, 0, '', '2019-04-23 14:40:07', '算例', 21, 3);
INSERT INTO `project_plan` VALUES (25, 0, 7, 0, '', '2019-04-23 14:40:07', '实验', 21, 4);
INSERT INTO `project_plan` VALUES (26, 1, 7, 0, '', '2019-04-23 14:40:07', '日常汇报', 21, 5);
INSERT INTO `project_plan` VALUES (27, 0, 7, 0, '', '2019-04-23 14:40:07', '工作报告', 21, 6);
INSERT INTO `project_plan` VALUES (28, 0, 7, 0, '', '2019-04-23 14:40:07', '研究报告', 21, 7);
INSERT INTO `project_plan` VALUES (29, 0, 7, 0, '', '2019-04-23 14:40:07', '程序代码', 21, 8);
INSERT INTO `project_plan` VALUES (30, 0, 7, 0, '', '2019-04-23 14:40:07', '计算模型文件', 21, 9);
INSERT INTO `project_plan` VALUES (31, 0, 3, 0, '', '2019-04-23 14:40:07', '单管水力模拟.2151.李晓平.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (32, 0, 3, 0, '', '2019-04-23 14:40:07', '招标', 31, 1);
INSERT INTO `project_plan` VALUES (33, 0, 3, 0, '', '2019-04-23 14:40:07', '调研', 31, 2);
INSERT INTO `project_plan` VALUES (34, 0, 3, 0, '', '2019-04-23 14:40:07', '算例', 31, 3);
INSERT INTO `project_plan` VALUES (35, 0, 3, 0, '', '2019-04-23 14:40:07', '实验', 31, 4);
INSERT INTO `project_plan` VALUES (36, 1, 3, 0, '', '2019-04-23 14:40:07', '日常汇报', 31, 5);
INSERT INTO `project_plan` VALUES (37, 0, 3, 0, '', '2019-04-23 14:40:07', '工作报告', 31, 6);
INSERT INTO `project_plan` VALUES (38, 0, 3, 0, '', '2019-04-23 14:40:07', '研究报告', 31, 7);
INSERT INTO `project_plan` VALUES (39, 0, 3, 0, '', '2019-04-23 14:40:07', '程序代码', 31, 8);
INSERT INTO `project_plan` VALUES (40, 0, 3, 0, '', '2019-04-23 14:40:07', '计算模型文件', 31, 9);
INSERT INTO `project_plan` VALUES (41, 0, 4, 0, '', '2019-04-23 14:40:07', '管网水力模拟.2151.李晓平.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (42, 0, 4, 0, '', '2019-04-23 14:40:07', '招标', 41, 1);
INSERT INTO `project_plan` VALUES (43, 0, 4, 0, '', '2019-04-23 14:40:07', '调研', 41, 2);
INSERT INTO `project_plan` VALUES (44, 0, 4, 0, '', '2019-04-23 14:40:07', '算例', 41, 3);
INSERT INTO `project_plan` VALUES (45, 1, 4, 0, '', '2019-04-23 14:40:07', '实验', 41, 4);
INSERT INTO `project_plan` VALUES (46, 18, 4, 0, '', '2019-04-23 14:40:07', '日常汇报', 41, 5);
INSERT INTO `project_plan` VALUES (47, 1, 4, 0, '', '2019-04-23 14:40:07', '工作报告', 41, 6);
INSERT INTO `project_plan` VALUES (48, 31, 4, 0, '', '2019-04-23 14:40:07', '研究报告', 41, 7);
INSERT INTO `project_plan` VALUES (49, 0, 4, 0, '', '2019-04-23 14:40:07', '程序代码', 41, 8);
INSERT INTO `project_plan` VALUES (50, 0, 4, 0, '', '2019-04-23 14:40:07', '计算模型文件', 41, 9);
INSERT INTO `project_plan` VALUES (51, 0, 8, 0, '', '2019-04-23 14:40:07', '集输管网积液.2151.李晓平.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (52, 0, 8, 0, '', '2019-04-23 14:40:07', '招标', 51, 1);
INSERT INTO `project_plan` VALUES (53, 0, 8, 0, '', '2019-04-23 14:40:07', '调研', 51, 2);
INSERT INTO `project_plan` VALUES (54, 0, 8, 0, '', '2019-04-23 14:40:07', '算例', 51, 3);
INSERT INTO `project_plan` VALUES (55, 0, 8, 0, '', '2019-04-23 14:40:07', '实验', 51, 4);
INSERT INTO `project_plan` VALUES (56, 0, 8, 0, '', '2019-04-23 14:40:07', '日常汇报', 51, 5);
INSERT INTO `project_plan` VALUES (57, 0, 8, 0, '', '2019-04-23 14:40:07', '工作报告', 51, 6);
INSERT INTO `project_plan` VALUES (58, 0, 8, 0, '', '2019-04-23 14:40:07', '研究报告', 51, 7);
INSERT INTO `project_plan` VALUES (59, 0, 8, 0, '', '2019-04-23 14:40:07', '程序代码', 51, 8);
INSERT INTO `project_plan` VALUES (60, 0, 8, 0, '', '2019-04-23 14:40:07', '计算模型文件', 51, 9);
INSERT INTO `project_plan` VALUES (61, 0, 9, 0, '', '2019-04-23 14:40:07', '微型SCADA系统.2151.李晓平.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (62, 0, 10, 0, '', '2019-04-23 14:40:07', '2016.硕士论文.李愚.2151.李晓平.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (63, 32, 10, 0, '', '2019-04-23 14:40:07', '每周汇报', 62, 1);
INSERT INTO `project_plan` VALUES (64, 1, 10, 0, '', '2019-04-23 14:40:07', '论文初稿', 62, 2);
INSERT INTO `project_plan` VALUES (65, 0, 10, 0, '', '2019-04-23 14:40:07', '论文算例', 62, 3);
INSERT INTO `project_plan` VALUES (66, 0, 10, 0, '', '2019-04-23 14:40:07', '模型文档', 62, 4);
INSERT INTO `project_plan` VALUES (67, 0, 10, 0, '', '2019-04-23 14:40:07', '程序代码', 62, 5);
INSERT INTO `project_plan` VALUES (68, 0, 10, 0, '', '2019-04-23 14:40:07', '论文最终版', 62, 6);
INSERT INTO `project_plan` VALUES (69, 0, 11, 0, '', '2019-04-23 14:40:07', '2016.硕士论文.周艳红.2151.李晓平.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (70, 0, 11, 0, '', '2019-04-23 14:40:07', '每周汇报', 69, 1);
INSERT INTO `project_plan` VALUES (71, 0, 11, 0, '', '2019-04-23 14:40:07', '论文初稿', 69, 2);
INSERT INTO `project_plan` VALUES (72, 0, 11, 0, '', '2019-04-23 14:40:07', '论文算例', 69, 3);
INSERT INTO `project_plan` VALUES (73, 0, 11, 0, '', '2019-04-23 14:40:07', '模型文档', 69, 4);
INSERT INTO `project_plan` VALUES (74, 0, 11, 0, '', '2019-04-23 14:40:07', '程序代码', 69, 5);
INSERT INTO `project_plan` VALUES (75, 0, 11, 0, '', '2019-04-23 14:40:07', '论文最终版', 69, 6);
INSERT INTO `project_plan` VALUES (76, 0, 12, 0, '', '2019-04-23 14:40:07', '2016.硕士论文.韦宝成.2151.李晓平.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (77, 0, 12, 0, '', '2019-04-23 14:40:07', '每周汇报', 76, 1);
INSERT INTO `project_plan` VALUES (78, 0, 12, 0, '', '2019-04-23 14:40:07', '论文初稿', 76, 2);
INSERT INTO `project_plan` VALUES (79, 0, 12, 0, '', '2019-04-23 14:40:07', '论文算例', 76, 3);
INSERT INTO `project_plan` VALUES (80, 0, 12, 0, '', '2019-04-23 14:40:07', '模型文档', 76, 4);
INSERT INTO `project_plan` VALUES (81, 0, 12, 0, '', '2019-04-23 14:40:07', '程序代码', 76, 5);
INSERT INTO `project_plan` VALUES (82, 0, 12, 0, '', '2019-04-23 14:40:07', '论文最终版', 76, 6);
INSERT INTO `project_plan` VALUES (83, 0, 13, 0, '', '2019-04-23 14:40:07', '2016.硕士论文.陈影.2151.李晓平.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (84, 0, 13, 0, '', '2019-04-23 14:40:07', '每周汇报', 83, 1);
INSERT INTO `project_plan` VALUES (85, 1, 13, 0, '', '2019-04-23 14:40:07', '论文初稿', 83, 2);
INSERT INTO `project_plan` VALUES (86, 2, 13, 0, '', '2019-04-23 14:40:07', '论文算例', 83, 3);
INSERT INTO `project_plan` VALUES (87, 0, 13, 0, '', '2019-04-23 14:40:07', '模型文档', 83, 4);
INSERT INTO `project_plan` VALUES (88, 0, 13, 0, '', '2019-04-23 14:40:07', '程序代码', 83, 5);
INSERT INTO `project_plan` VALUES (89, 1, 13, 0, '', '2019-04-23 14:40:07', '论文最终版', 83, 6);
INSERT INTO `project_plan` VALUES (90, 0, 14, 0, '', '2019-04-23 14:40:07', '2016.硕士论文.万洋洋.2151.李晓平.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (91, 0, 14, 0, '', '2019-04-23 14:40:07', '每周汇报', 90, 1);
INSERT INTO `project_plan` VALUES (92, 0, 14, 0, '', '2019-04-23 14:40:07', '论文初稿', 90, 2);
INSERT INTO `project_plan` VALUES (93, 0, 14, 0, '', '2019-04-23 14:40:07', '论文算例', 90, 3);
INSERT INTO `project_plan` VALUES (94, 0, 14, 0, '', '2019-04-23 14:40:07', '模型文档', 90, 4);
INSERT INTO `project_plan` VALUES (95, 0, 14, 0, '', '2019-04-23 14:40:07', '程序代码', 90, 5);
INSERT INTO `project_plan` VALUES (96, 1, 14, 0, '', '2019-04-23 14:40:07', '论文最终版', 90, 6);
INSERT INTO `project_plan` VALUES (97, 0, 15, 0, '', '2019-04-23 14:40:07', '2016.硕士论文.金浩.2151.李晓平.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (98, 0, 15, 0, '', '2019-04-23 14:40:07', '每周汇报', 97, 1);
INSERT INTO `project_plan` VALUES (99, 0, 15, 0, '', '2019-04-23 14:40:07', '论文初稿', 97, 2);
INSERT INTO `project_plan` VALUES (100, 0, 15, 0, '', '2019-04-23 14:40:07', '论文算例', 97, 3);
INSERT INTO `project_plan` VALUES (101, 0, 15, 0, '', '2019-04-23 14:40:07', '模型文档', 97, 4);
INSERT INTO `project_plan` VALUES (102, 0, 15, 0, '', '2019-04-23 14:40:07', '程序代码', 97, 5);
INSERT INTO `project_plan` VALUES (103, 0, 15, 0, '', '2019-04-23 14:40:07', '论文最终版', 97, 6);
INSERT INTO `project_plan` VALUES (104, 1, 51, 0, '', '2019-04-23 14:40:07', '油气管道SCADA系统与过程控制.2018-2019-2.2018214053.纪晨秋.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (105, 6, 51, 0, '', '2019-04-23 14:40:07', '中期汇报', 104, 1);
INSERT INTO `project_plan` VALUES (106, 2, 51, 0, '', '2019-04-23 14:40:07', '结业论文', 104, 2);
INSERT INTO `project_plan` VALUES (107, 3, 52, 0, '', '2019-04-23 14:40:07', '油气管道SCADA系统与过程控制.2018-2019-2.2018214055.刘鹏.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (108, 11, 52, 0, '', '2019-04-23 14:40:07', '中期汇报', 107, 1);
INSERT INTO `project_plan` VALUES (109, 2, 52, 0, '', '2019-04-23 14:40:07', '结业论文', 107, 2);
INSERT INTO `project_plan` VALUES (110, 1, 25, 0, '', '2019-04-23 14:40:07', '软件概论.2018-2019-2.2018214544.冯兴.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (111, 4, 25, 0, '', '2019-04-23 14:40:07', '中期汇报', 110, 1);
INSERT INTO `project_plan` VALUES (112, 0, 25, 0, '', '2019-04-23 14:40:07', '结业论文', 110, 2);
INSERT INTO `project_plan` VALUES (113, 3, 18, 0, '', '2019-04-23 14:40:07', '软件概论.2018-2019-2.2018214555.谭遥.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (114, 5, 18, 0, '', '2019-04-23 14:40:07', '中期汇报', 113, 1);
INSERT INTO `project_plan` VALUES (115, 7, 18, 0, '', '2019-04-23 14:40:07', '结业论文', 113, 2);
INSERT INTO `project_plan` VALUES (116, 3, 50, 0, '', '2019-04-23 14:40:07', '油气管道SCADA系统与过程控制.2018-2019-2.2018214555.谭遥.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (117, 9, 50, 0, '', '2019-04-23 14:40:07', '中期汇报', 116, 1);
INSERT INTO `project_plan` VALUES (118, 4, 50, 0, '', '2019-04-23 14:40:07', '结业论文', 116, 2);
INSERT INTO `project_plan` VALUES (119, 14, 54, 0, '', '2019-04-23 14:40:07', '油气管道SCADA系统与过程控制.2018-2019-2.2018214068.刘胜男.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (120, 16, 54, 0, '', '2019-04-23 14:40:07', '中期汇报', 119, 1);
INSERT INTO `project_plan` VALUES (121, 7, 54, 0, '', '2019-04-23 14:40:07', '结业论文', 119, 2);
INSERT INTO `project_plan` VALUES (122, 0, 48, 0, '', '2019-04-23 14:40:07', '成品油管道设计.2018-2019-2.2015010743.王铁淞.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (123, 0, 48, 0, '', '2019-04-23 14:40:07', '中期汇报', 122, 1);
INSERT INTO `project_plan` VALUES (124, 0, 48, 0, '', '2019-04-23 14:40:07', '结业论文', 122, 2);
INSERT INTO `project_plan` VALUES (125, 0, 37, 0, '', '2019-04-23 14:40:07', '成品油管道设计.2018-2019-2.2015010856.贾羽茜.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (126, 0, 37, 0, '', '2019-04-23 14:40:07', '中期汇报', 125, 1);
INSERT INTO `project_plan` VALUES (127, 0, 37, 0, '', '2019-04-23 14:40:07', '结业论文', 125, 2);
INSERT INTO `project_plan` VALUES (128, 0, 28, 0, '', '2019-04-23 14:40:07', '成品油管道设计.2018-2019-2.2015010858.兰敏.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (129, 0, 28, 0, '', '2019-04-23 14:40:07', '中期汇报', 128, 1);
INSERT INTO `project_plan` VALUES (130, 0, 28, 0, '', '2019-04-23 14:40:07', '结业论文', 128, 2);
INSERT INTO `project_plan` VALUES (131, 0, 36, 0, '', '2019-04-23 14:40:07', '成品油管道设计.2018-2019-2.2015010861.柳佳丽.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (132, 0, 36, 0, '', '2019-04-23 14:40:07', '中期汇报', 131, 1);
INSERT INTO `project_plan` VALUES (133, 0, 36, 0, '', '2019-04-23 14:40:07', '结业论文', 131, 2);
INSERT INTO `project_plan` VALUES (134, 0, 34, 0, '', '2019-04-23 14:40:07', '成品油管道设计.2018-2019-2.2015010865.白宗翰.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (135, 2, 34, 0, '', '2019-04-23 14:40:07', '中期汇报', 134, 1);
INSERT INTO `project_plan` VALUES (136, 2, 34, 0, '', '2019-04-23 14:40:07', '结业论文', 134, 2);
INSERT INTO `project_plan` VALUES (137, 0, 22, 0, '', '2019-04-23 14:40:07', '成品油管道设计.2018-2019-2.2015010867.付顺康.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (138, 0, 22, 0, '', '2019-04-23 14:40:08', '中期汇报', 137, 1);
INSERT INTO `project_plan` VALUES (139, 0, 22, 0, '', '2019-04-23 14:40:08', '结业论文', 137, 2);
INSERT INTO `project_plan` VALUES (140, 0, 45, 0, '', '2019-04-23 14:40:08', '成品油管道设计.2018-2019-2.2015010870.贺国晏.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (141, 0, 45, 0, '', '2019-04-23 14:40:08', '中期汇报', 140, 1);
INSERT INTO `project_plan` VALUES (142, 0, 45, 0, '', '2019-04-23 14:40:08', '结业论文', 140, 2);
INSERT INTO `project_plan` VALUES (143, 0, 32, 0, '', '2019-04-23 14:40:08', '成品油管道设计.2018-2019-2.2015010871.侯富恒.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (144, 0, 32, 0, '', '2019-04-23 14:40:08', '中期汇报', 143, 1);
INSERT INTO `project_plan` VALUES (145, 0, 32, 0, '', '2019-04-23 14:40:08', '结业论文', 143, 2);
INSERT INTO `project_plan` VALUES (146, 0, 43, 0, '', '2019-04-23 14:40:08', '成品油管道设计.2018-2019-2.2015010877.马克.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (147, 0, 43, 0, '', '2019-04-23 14:40:08', '中期汇报', 146, 1);
INSERT INTO `project_plan` VALUES (148, 0, 43, 0, '', '2019-04-23 14:40:08', '结业论文', 146, 2);
INSERT INTO `project_plan` VALUES (149, 0, 39, 0, '', '2019-04-23 14:40:08', '成品油管道设计.2018-2019-2.2015010879.邵文宏.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (150, 0, 39, 0, '', '2019-04-23 14:40:08', '中期汇报', 149, 1);
INSERT INTO `project_plan` VALUES (151, 0, 39, 0, '', '2019-04-23 14:40:08', '结业论文', 149, 2);
INSERT INTO `project_plan` VALUES (152, 0, 30, 0, '', '2019-04-23 14:40:08', '成品油管道设计.2018-2019-2.2015010883.严腾飞.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (153, 0, 30, 0, '', '2019-04-23 14:40:08', '中期汇报', 152, 1);
INSERT INTO `project_plan` VALUES (154, 0, 30, 0, '', '2019-04-23 14:40:08', '结业论文', 152, 2);
INSERT INTO `project_plan` VALUES (155, 0, 49, 0, '', '2019-04-23 14:40:08', '成品油管道设计.2018-2019-2.2015010885.殷雄.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (156, 0, 49, 0, '', '2019-04-23 14:40:08', '中期汇报', 155, 1);
INSERT INTO `project_plan` VALUES (157, 0, 49, 0, '', '2019-04-23 14:40:08', '结业论文', 155, 2);
INSERT INTO `project_plan` VALUES (158, 0, 46, 0, '', '2019-04-23 14:40:08', '成品油管道设计.2018-2019-2.2015011149.张悦.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (159, 0, 46, 0, '', '2019-04-23 14:40:08', '中期汇报', 158, 1);
INSERT INTO `project_plan` VALUES (160, 0, 46, 0, '', '2019-04-23 14:40:08', '结业论文', 158, 2);
INSERT INTO `project_plan` VALUES (161, 0, 56, 0, '', '2019-04-23 14:40:08', '本科毕设.2018-2019-2.2015010900.何毅.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (162, 13, 56, 0, '', '2019-04-23 14:40:08', '每周汇报', 161, 1);
INSERT INTO `project_plan` VALUES (163, 7, 56, 0, '', '2019-04-23 14:40:08', '论文初稿', 161, 2);
INSERT INTO `project_plan` VALUES (164, 0, 56, 0, '', '2019-04-23 14:40:08', '论文算例', 161, 3);
INSERT INTO `project_plan` VALUES (165, 0, 56, 0, '', '2019-04-23 14:40:08', '论文最终版', 161, 4);
INSERT INTO `project_plan` VALUES (166, 2, 57, 0, '', '2019-04-23 14:40:08', '本科毕设.2018-2019-2.2015010911.邰昊.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (167, 6, 57, 0, '', '2019-04-23 14:40:08', '每周汇报', 166, 1);
INSERT INTO `project_plan` VALUES (168, 7, 57, 0, '', '2019-04-23 14:40:08', '论文初稿', 166, 2);
INSERT INTO `project_plan` VALUES (169, 7, 57, 0, '', '2019-04-23 14:40:08', '论文算例', 166, 3);
INSERT INTO `project_plan` VALUES (170, 0, 57, 0, '', '2019-04-23 14:40:08', '论文最终版', 166, 4);
INSERT INTO `project_plan` VALUES (171, 7, 60, 0, '', '2019-04-23 14:40:08', '本科毕设.2018-2019-2.2015010914.徐帜.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (172, 16, 60, 0, '', '2019-04-23 14:40:08', '每周汇报', 171, 1);
INSERT INTO `project_plan` VALUES (173, 8, 60, 0, '', '2019-04-23 14:40:08', '论文初稿', 171, 2);
INSERT INTO `project_plan` VALUES (174, 0, 60, 0, '', '2019-04-23 14:40:08', '论文算例', 171, 3);
INSERT INTO `project_plan` VALUES (175, 0, 60, 0, '', '2019-04-23 14:40:08', '论文最终版', 171, 4);
INSERT INTO `project_plan` VALUES (176, 0, 61, 0, '', '2019-04-23 14:40:08', '本科毕设.2018-2019-2.2015010930.郑衣珍.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (177, 25, 61, 0, '', '2019-04-23 14:40:08', '每周汇报', 176, 1);
INSERT INTO `project_plan` VALUES (178, 15, 61, 0, '', '2019-04-23 14:40:08', '论文初稿', 176, 2);
INSERT INTO `project_plan` VALUES (179, 7, 61, 0, '', '2019-04-23 14:40:08', '论文算例', 176, 3);
INSERT INTO `project_plan` VALUES (180, 0, 61, 0, '', '2019-04-23 14:40:08', '论文最终版', 176, 4);
INSERT INTO `project_plan` VALUES (181, 6, 58, 0, '', '2019-04-23 14:40:08', '本科毕设.2018-2019-2.2015030066.康迪.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (182, 9, 58, 0, '', '2019-04-23 14:40:08', '每周汇报', 181, 1);
INSERT INTO `project_plan` VALUES (183, 6, 58, 0, '', '2019-04-23 14:40:08', '论文初稿', 181, 2);
INSERT INTO `project_plan` VALUES (184, 4, 58, 0, '', '2019-04-23 14:40:08', '论文算例', 181, 3);
INSERT INTO `project_plan` VALUES (185, 0, 58, 0, '', '2019-04-23 14:40:08', '论文最终版', 181, 4);
INSERT INTO `project_plan` VALUES (186, 6, 26, 0, '', '2019-04-23 14:40:08', '软件概论.2018-2019-2.2017214588.孙成威.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (187, 4, 26, 0, '', '2019-04-23 14:40:08', '中期汇报', 186, 1);
INSERT INTO `project_plan` VALUES (188, 10, 26, 0, '', '2019-04-23 14:40:08', '结业论文', 186, 2);
INSERT INTO `project_plan` VALUES (189, 0, 19, 0, '', '2019-04-23 14:40:08', '软件概论.2018-2019-2.2018214548.王昕.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (190, 0, 19, 0, '', '2019-04-23 14:40:08', '中期汇报', 189, 1);
INSERT INTO `project_plan` VALUES (191, 0, 19, 0, '', '2019-04-23 14:40:08', '结业论文', 189, 2);
INSERT INTO `project_plan` VALUES (192, 3, 27, 0, '', '2019-04-23 14:40:08', '软件概论.2018-2019-2.2018214556.董小钰.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (193, 3, 27, 0, '', '2019-04-23 14:40:08', '中期汇报', 192, 1);
INSERT INTO `project_plan` VALUES (194, 1, 27, 0, '', '2019-04-23 14:40:08', '结业论文', 192, 2);
INSERT INTO `project_plan` VALUES (195, 0, 42, 0, '', '2019-04-23 14:40:08', '软件概论.2018-2019-2.2018214560.张静宇.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (196, 4, 42, 0, '', '2019-04-23 14:40:08', '中期汇报', 195, 1);
INSERT INTO `project_plan` VALUES (197, 1, 42, 0, '', '2019-04-23 14:40:08', '结业论文', 195, 2);
INSERT INTO `project_plan` VALUES (198, 0, 23, 0, '', '2019-04-23 14:40:08', '多气合采全开发周期集输及处理工艺.2018214568.王帅.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (199, 0, 23, 0, '', '2019-04-23 14:40:08', '招标', 198, 1);
INSERT INTO `project_plan` VALUES (200, 0, 23, 0, '', '2019-04-23 14:40:08', '调研', 198, 2);
INSERT INTO `project_plan` VALUES (201, 0, 23, 0, '', '2019-04-23 14:40:08', '算例', 198, 3);
INSERT INTO `project_plan` VALUES (202, 0, 23, 0, '', '2019-04-23 14:40:08', '实验', 198, 4);
INSERT INTO `project_plan` VALUES (203, 0, 23, 0, '', '2019-04-23 14:40:08', '日常汇报', 198, 5);
INSERT INTO `project_plan` VALUES (204, 0, 23, 0, '', '2019-04-23 14:40:08', '工作报告', 198, 6);
INSERT INTO `project_plan` VALUES (205, 0, 23, 0, '', '2019-04-23 14:40:08', '研究报告', 198, 7);
INSERT INTO `project_plan` VALUES (206, 0, 23, 0, '', '2019-04-23 14:40:08', '程序代码', 198, 8);
INSERT INTO `project_plan` VALUES (207, 0, 23, 0, '', '2019-04-23 14:40:08', '计算模型文件', 198, 9);
INSERT INTO `project_plan` VALUES (208, 0, 24, 0, '', '2019-04-23 14:40:08', '软件概论.2018-2019-2.2018214568.王帅.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (209, 0, 24, 0, '', '2019-04-23 14:40:08', '中期汇报', 208, 1);
INSERT INTO `project_plan` VALUES (210, 0, 24, 0, '', '2019-04-23 14:40:08', '结业论文', 208, 2);
INSERT INTO `project_plan` VALUES (211, 2, 31, 0, '', '2019-04-23 14:40:08', '软件概论.2018-2019-2.2018214575.曾亚男.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (212, 14, 31, 0, '', '2019-04-23 14:40:08', '中期汇报', 211, 1);
INSERT INTO `project_plan` VALUES (213, 27, 31, 0, '', '2019-04-23 14:40:08', '结业论文', 211, 2);
INSERT INTO `project_plan` VALUES (214, 3, 33, 0, '', '2019-04-23 14:40:08', '软件概论.2018-2019-2.2018214576.刘壮.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (215, 3, 33, 0, '', '2019-04-23 14:40:08', '中期汇报', 214, 1);
INSERT INTO `project_plan` VALUES (216, 2, 33, 0, '', '2019-04-23 14:40:08', '结业论文', 214, 2);
INSERT INTO `project_plan` VALUES (217, 9, 41, 0, '', '2019-04-23 14:40:08', '油气管道SCADA系统与过程控制.2018-2019-2.2018214578.张湘玮.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (218, 7, 41, 0, '', '2019-04-23 14:40:08', '中期汇报', 217, 1);
INSERT INTO `project_plan` VALUES (219, 2, 41, 0, '', '2019-04-23 14:40:08', '结业论文', 217, 2);
INSERT INTO `project_plan` VALUES (220, 7, 17, 0, '', '2019-04-23 14:40:08', '软件概论.2018-2019-2.2018214579.赵留康.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (221, 6, 17, 0, '', '2019-04-23 14:40:08', '中期汇报', 220, 1);
INSERT INTO `project_plan` VALUES (222, 0, 17, 0, '', '2019-04-23 14:40:08', '结业论文', 220, 2);
INSERT INTO `project_plan` VALUES (223, 1, 53, 0, '', '2019-04-23 14:40:08', '油气管道SCADA系统与过程控制.2018-2019-2.2016214080.李蛟鸾.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (224, 7, 53, 0, '', '2019-04-23 14:40:08', '中期汇报', 223, 1);
INSERT INTO `project_plan` VALUES (225, 2, 53, 0, '', '2019-04-23 14:40:08', '结业论文', 223, 2);
INSERT INTO `project_plan` VALUES (226, 0, 20, 0, '', '2019-04-23 14:40:08', '软件概论.2018-2019-2.2018214572.陈汉.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (227, 5, 20, 0, '', '2019-04-23 14:40:08', '中期汇报', 226, 1);
INSERT INTO `project_plan` VALUES (228, 7, 20, 0, '', '2019-04-23 14:40:08', '结业论文', 226, 2);
INSERT INTO `project_plan` VALUES (229, 0, 62, 0, '', '2019-04-24 09:17:48', '华南销售项目.1102.吴海浩.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (230, 0, 62, 0, '', '2019-04-24 09:17:48', '招标', 229, 1);
INSERT INTO `project_plan` VALUES (231, 0, 62, 0, '', '2019-04-24 09:17:48', '调研', 229, 2);
INSERT INTO `project_plan` VALUES (232, 0, 62, 0, '', '2019-04-24 09:17:48', '算例', 229, 3);
INSERT INTO `project_plan` VALUES (233, 0, 62, 0, '', '2019-04-24 09:17:48', '实验', 229, 4);
INSERT INTO `project_plan` VALUES (234, 0, 62, 0, '', '2019-04-24 09:17:48', '日常汇报', 229, 5);
INSERT INTO `project_plan` VALUES (235, 0, 62, 0, '', '2019-04-24 09:17:48', '工作报告', 229, 6);
INSERT INTO `project_plan` VALUES (236, 0, 62, 0, '', '2019-04-24 09:17:48', '研究报告', 229, 7);
INSERT INTO `project_plan` VALUES (237, 0, 62, 0, '', '2019-04-24 09:17:48', '程序代码', 229, 8);
INSERT INTO `project_plan` VALUES (238, 0, 62, 0, '', '2019-04-24 09:17:48', '计算模型文件', 229, 9);
INSERT INTO `project_plan` VALUES (239, 0, 65, 0, '', '2019-05-06 08:50:24', '2016.硕士论文.李愚.2016214558.王茀玺.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (240, 0, 65, 0, '', '2019-05-06 08:50:24', '每周汇报', 239, 1);
INSERT INTO `project_plan` VALUES (241, 0, 65, 0, '', '2019-05-06 08:50:24', '论文初稿', 239, 2);
INSERT INTO `project_plan` VALUES (242, 0, 65, 0, '', '2019-05-06 08:50:24', '论文算例', 239, 3);
INSERT INTO `project_plan` VALUES (243, 0, 65, 0, '', '2019-05-06 08:50:25', '模型文档', 239, 4);
INSERT INTO `project_plan` VALUES (244, 0, 65, 0, '', '2019-05-06 08:50:25', '程序代码', 239, 5);
INSERT INTO `project_plan` VALUES (245, 0, 65, 0, '', '2019-05-06 08:50:25', '论文最终版', 239, 6);
INSERT INTO `project_plan` VALUES (246, 0, 66, 0, '', '2019-05-06 09:06:02', '2016.硕士论文.金浩.2015214549.金浩.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (247, 0, 66, 0, '', '2019-05-06 09:06:02', '每周汇报', 246, 1);
INSERT INTO `project_plan` VALUES (248, 0, 66, 0, '', '2019-05-06 09:06:03', '论文初稿', 246, 2);
INSERT INTO `project_plan` VALUES (249, 0, 66, 0, '', '2019-05-06 09:06:03', '论文算例', 246, 3);
INSERT INTO `project_plan` VALUES (250, 0, 66, 0, '', '2019-05-06 09:06:03', '模型文档', 246, 4);
INSERT INTO `project_plan` VALUES (251, 0, 66, 0, '', '2019-05-06 09:06:03', '程序代码', 246, 5);
INSERT INTO `project_plan` VALUES (252, 0, 66, 0, '', '2019-05-06 09:06:03', '论文最终版', 246, 6);
INSERT INTO `project_plan` VALUES (253, 0, 67, 0, '', '2019-05-06 09:06:37', '微型SCADA系统.2015214549.金浩.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (254, 5, 68, 0, '', '2019-05-06 10:07:41', '纳米微波.2151.李晓平.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (255, 0, 68, 0, '', '2019-05-06 10:07:41', '招标', 254, 1);
INSERT INTO `project_plan` VALUES (256, 0, 68, 0, '', '2019-05-06 10:07:41', '调研', 254, 2);
INSERT INTO `project_plan` VALUES (257, 0, 68, 0, '', '2019-05-06 10:07:41', '算例', 254, 3);
INSERT INTO `project_plan` VALUES (258, 0, 68, 0, '', '2019-05-06 10:07:41', '实验', 254, 4);
INSERT INTO `project_plan` VALUES (259, 0, 68, 0, '', '2019-05-06 10:07:41', '日常汇报', 254, 5);
INSERT INTO `project_plan` VALUES (260, 0, 68, 0, '', '2019-05-06 10:07:41', '工作报告', 254, 6);
INSERT INTO `project_plan` VALUES (261, 0, 68, 0, '', '2019-05-06 10:07:41', '研究报告', 254, 7);
INSERT INTO `project_plan` VALUES (262, 0, 68, 0, '', '2019-05-06 10:07:41', '程序代码', 254, 8);
INSERT INTO `project_plan` VALUES (263, 0, 68, 0, '', '2019-05-06 10:07:41', '计算模型文件', 254, 9);
INSERT INTO `project_plan` VALUES (264, 0, 69, 0, '', '2019-05-06 15:29:34', '2016.硕士论文.万洋洋.2016214557.万洋洋.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (265, 0, 69, 0, '', '2019-05-06 15:29:34', '每周汇报', 264, 1);
INSERT INTO `project_plan` VALUES (266, 0, 69, 0, '', '2019-05-06 15:29:34', '论文初稿', 264, 2);
INSERT INTO `project_plan` VALUES (267, 0, 69, 0, '', '2019-05-06 15:29:34', '论文算例', 264, 3);
INSERT INTO `project_plan` VALUES (268, 0, 69, 0, '', '2019-05-06 15:29:34', '模型文档', 264, 4);
INSERT INTO `project_plan` VALUES (269, 1, 69, 0, '', '2019-05-06 15:29:34', '程序代码', 264, 5);
INSERT INTO `project_plan` VALUES (270, 1, 69, 0, '', '2019-05-06 15:29:34', '论文最终版', 264, 6);
INSERT INTO `project_plan` VALUES (271, 0, 78, 0, '', '2019-05-06 16:40:48', '顺北项目.2151.李晓平.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (272, 0, 78, 0, '', '2019-05-06 16:40:48', '招标', 271, 1);
INSERT INTO `project_plan` VALUES (273, 0, 78, 0, '', '2019-05-06 16:40:48', '调研', 271, 2);
INSERT INTO `project_plan` VALUES (274, 0, 78, 0, '', '2019-05-06 16:40:48', '算例', 271, 3);
INSERT INTO `project_plan` VALUES (275, 0, 78, 0, '', '2019-05-06 16:40:48', '实验', 271, 4);
INSERT INTO `project_plan` VALUES (276, 0, 78, 0, '', '2019-05-06 16:40:48', '日常汇报', 271, 5);
INSERT INTO `project_plan` VALUES (277, 0, 78, 0, '', '2019-05-06 16:40:48', '工作报告', 271, 6);
INSERT INTO `project_plan` VALUES (278, 0, 78, 0, '', '2019-05-06 16:40:48', '研究报告', 271, 7);
INSERT INTO `project_plan` VALUES (279, 0, 78, 0, '', '2019-05-06 16:40:48', '程序代码', 271, 8);
INSERT INTO `project_plan` VALUES (280, 0, 78, 0, '', '2019-05-06 16:40:48', '计算模型文件', 271, 9);
INSERT INTO `project_plan` VALUES (281, 0, 79, 0, '', '2019-05-06 16:54:55', '顺北项目.2017214058.刘莹莹.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (282, 0, 79, 0, '', '2019-05-06 16:54:55', '招标', 281, 1);
INSERT INTO `project_plan` VALUES (283, 0, 79, 0, '', '2019-05-06 16:54:55', '调研', 281, 2);
INSERT INTO `project_plan` VALUES (284, 0, 79, 0, '', '2019-05-06 16:54:55', '算例', 281, 3);
INSERT INTO `project_plan` VALUES (285, 0, 79, 0, '', '2019-05-06 16:54:55', '实验', 281, 4);
INSERT INTO `project_plan` VALUES (286, 0, 79, 0, '', '2019-05-06 16:54:55', '日常汇报', 281, 5);
INSERT INTO `project_plan` VALUES (287, 0, 79, 0, '', '2019-05-06 16:54:55', '工作报告', 281, 6);
INSERT INTO `project_plan` VALUES (288, 0, 79, 0, '', '2019-05-06 16:54:55', '研究报告', 281, 7);
INSERT INTO `project_plan` VALUES (289, 0, 79, 0, '', '2019-05-06 16:54:55', '程序代码', 281, 8);
INSERT INTO `project_plan` VALUES (290, 0, 79, 0, '', '2019-05-06 16:54:55', '计算模型文件', 281, 9);
INSERT INTO `project_plan` VALUES (291, 0, 81, 0, '', '2019-05-07 17:54:22', '2016.硕士论文.韦宝成.2016214559.韦宝成.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (292, 21, 81, 0, '', '2019-05-07 17:54:22', '每周汇报', 291, 1);
INSERT INTO `project_plan` VALUES (293, 3, 81, 0, '', '2019-05-07 17:54:22', '论文初稿', 291, 2);
INSERT INTO `project_plan` VALUES (294, 0, 81, 0, '', '2019-05-07 17:54:22', '论文算例', 291, 3);
INSERT INTO `project_plan` VALUES (295, 1, 81, 0, '', '2019-05-07 17:54:22', '模型文档', 291, 4);
INSERT INTO `project_plan` VALUES (296, 1, 81, 0, '', '2019-05-07 17:54:22', '程序代码', 291, 5);
INSERT INTO `project_plan` VALUES (297, 2, 81, 0, '', '2019-05-07 17:54:22', '论文最终版', 291, 6);
INSERT INTO `project_plan` VALUES (298, 0, 82, 0, '', '2019-05-07 22:40:41', '2016.硕士论文.王茀玺.2016214558.王茀玺.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (299, 1, 82, 0, '', '2019-05-07 22:40:41', '每周汇报', 298, 1);
INSERT INTO `project_plan` VALUES (300, 1, 82, 0, '', '2019-05-07 22:40:41', '论文初稿', 298, 2);
INSERT INTO `project_plan` VALUES (301, 0, 82, 0, '', '2019-05-07 22:40:41', '论文算例', 298, 3);
INSERT INTO `project_plan` VALUES (302, 0, 82, 0, '', '2019-05-07 22:40:41', '模型文档', 298, 4);
INSERT INTO `project_plan` VALUES (303, 0, 82, 0, '', '2019-05-07 22:40:41', '程序代码', 298, 5);
INSERT INTO `project_plan` VALUES (304, 0, 82, 0, '', '2019-05-07 22:40:41', '论文最终版', 298, 6);
INSERT INTO `project_plan` VALUES (305, 4, 84, 0, '', '2019-05-08 09:16:35', '2016.硕士论文.周艳红.2016214560.周艳红.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (306, 18, 84, 0, '', '2019-05-08 09:16:35', '每周汇报', 305, 1);
INSERT INTO `project_plan` VALUES (307, 4, 84, 0, '', '2019-05-08 09:16:35', '论文初稿', 305, 2);
INSERT INTO `project_plan` VALUES (308, 0, 84, 0, '', '2019-05-08 09:16:35', '论文算例', 305, 3);
INSERT INTO `project_plan` VALUES (309, 0, 84, 0, '', '2019-05-08 09:16:35', '模型文档', 305, 4);
INSERT INTO `project_plan` VALUES (310, 0, 84, 0, '', '2019-05-08 09:16:35', '程序代码', 305, 5);
INSERT INTO `project_plan` VALUES (311, 0, 84, 0, '', '2019-05-08 09:16:35', '论文最终版', 305, 6);
INSERT INTO `project_plan` VALUES (312, 0, 85, 0, '', '2019-05-08 09:17:57', '华南销售项目.2016214559.韦宝成.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (313, 0, 85, 0, '', '2019-05-08 09:17:57', '招标', 312, 1);
INSERT INTO `project_plan` VALUES (314, 0, 85, 0, '', '2019-05-08 09:17:57', '调研', 312, 2);
INSERT INTO `project_plan` VALUES (315, 0, 85, 0, '', '2019-05-08 09:17:57', '算例', 312, 3);
INSERT INTO `project_plan` VALUES (316, 0, 85, 0, '', '2019-05-08 09:17:57', '实验', 312, 4);
INSERT INTO `project_plan` VALUES (317, 0, 85, 0, '', '2019-05-08 09:17:57', '日常汇报', 312, 5);
INSERT INTO `project_plan` VALUES (318, 0, 85, 0, '', '2019-05-08 09:17:57', '工作报告', 312, 6);
INSERT INTO `project_plan` VALUES (319, 0, 85, 0, '', '2019-05-08 09:17:57', '研究报告', 312, 7);
INSERT INTO `project_plan` VALUES (320, 0, 85, 0, '', '2019-05-08 09:17:57', '程序代码', 312, 8);
INSERT INTO `project_plan` VALUES (321, 1, 85, 0, '', '2019-05-08 09:17:57', '计算模型文件', 312, 9);
INSERT INTO `project_plan` VALUES (322, 0, 86, 0, '', '2019-05-12 10:26:51', '软件概论.2018-2019-2.2018214550.单锦旭.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (323, 0, 86, 0, '', '2019-05-12 10:26:51', '中期汇报', 322, 1);
INSERT INTO `project_plan` VALUES (324, 0, 86, 0, '', '2019-05-12 10:26:51', '结业论文', 322, 2);
INSERT INTO `project_plan` VALUES (325, 0, 72, 0, '', '2019-05-12 18:53:32', '2016.硕士论文.崔可心.2016214555.崔可心.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (326, 0, 72, 0, '', '2019-05-12 18:53:32', '每周汇报', 325, 1);
INSERT INTO `project_plan` VALUES (327, 0, 72, 0, '', '2019-05-12 18:53:32', '论文初稿', 325, 2);
INSERT INTO `project_plan` VALUES (328, 0, 72, 0, '', '2019-05-12 18:53:32', '论文算例', 325, 3);
INSERT INTO `project_plan` VALUES (329, 0, 72, 0, '', '2019-05-12 18:53:32', '模型文档', 325, 4);
INSERT INTO `project_plan` VALUES (330, 0, 72, 0, '', '2019-05-12 18:53:32', '程序代码', 325, 5);
INSERT INTO `project_plan` VALUES (331, 0, 72, 0, '', '2019-05-12 18:53:32', '论文最终版', 325, 6);
INSERT INTO `project_plan` VALUES (332, 0, 87, 0, '', '2019-05-12 18:56:33', '纳米微波.2016214555.崔可心.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (333, 0, 87, 0, '', '2019-05-12 18:56:33', '招标', 332, 1);
INSERT INTO `project_plan` VALUES (334, 0, 87, 0, '', '2019-05-12 18:56:33', '调研', 332, 2);
INSERT INTO `project_plan` VALUES (335, 0, 87, 0, '', '2019-05-12 18:56:33', '算例', 332, 3);
INSERT INTO `project_plan` VALUES (336, 0, 87, 0, '', '2019-05-12 18:56:33', '实验', 332, 4);
INSERT INTO `project_plan` VALUES (337, 0, 87, 0, '', '2019-05-12 18:56:33', '日常汇报', 332, 5);
INSERT INTO `project_plan` VALUES (338, 0, 87, 0, '', '2019-05-12 18:56:33', '工作报告', 332, 6);
INSERT INTO `project_plan` VALUES (339, 0, 87, 0, '', '2019-05-12 18:56:33', '研究报告', 332, 7);
INSERT INTO `project_plan` VALUES (340, 0, 87, 0, '', '2019-05-12 18:56:33', '程序代码', 332, 8);
INSERT INTO `project_plan` VALUES (341, 0, 87, 0, '', '2019-05-12 18:56:33', '计算模型文件', 332, 9);
INSERT INTO `project_plan` VALUES (342, 1, 88, 0, '', '2019-05-12 22:39:43', '软件概论.2018-2019-2.2018214545.王昕楚.进度管理', NULL, 0);
INSERT INTO `project_plan` VALUES (343, 0, 88, 0, '', '2019-05-12 22:39:43', '中期汇报', 342, 1);
INSERT INTO `project_plan` VALUES (344, 1, 88, 0, '', '2019-05-12 22:39:43', '结业论文', 342, 2);

SET FOREIGN_KEY_CHECKS = 1;
