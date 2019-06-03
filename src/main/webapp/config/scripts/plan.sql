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

 Date: 03/05/2019 11:00:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for plan
-- ----------------------------
DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `up_plan_id` bigint(20) NULL DEFAULT NULL,
  `thing_type_id` bigint(20) NOT NULL,
  `update_date` datetime(0) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `serial_number` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKb4qv3kc7k2ge19t9xyfnh352n`(`up_plan_id`) USING BTREE,
  INDEX `FKqw6as4ra6srlomhy0g4gp2jw5`(`thing_type_id`) USING BTREE,
  CONSTRAINT `FKb4qv3kc7k2ge19t9xyfnh352n` FOREIGN KEY (`up_plan_id`) REFERENCES `plan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKqw6as4ra6srlomhy0g4gp2jw5` FOREIGN KEY (`thing_type_id`) REFERENCES `thing_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of plan
-- ----------------------------
INSERT INTO `plan` VALUES (1, 0, NULL, 17, '2019-04-19 15:10:58', '硕士论文.计划', 0);
INSERT INTO `plan` VALUES (2, 0, 1, 17, '2019-04-19 15:10:58', '每周汇报', 1);
INSERT INTO `plan` VALUES (3, 0, 1, 17, '2019-04-19 15:10:58', '论文初稿', 2);
INSERT INTO `plan` VALUES (4, 0, 1, 17, '2019-04-19 15:10:58', '论文算例', 3);
INSERT INTO `plan` VALUES (5, 0, 1, 17, '2019-04-19 15:10:58', '模型文档', 4);
INSERT INTO `plan` VALUES (6, 0, 1, 17, '2019-04-19 15:10:58', '程序代码', 5);
INSERT INTO `plan` VALUES (7, 0, 1, 17, '2019-04-19 15:10:58', '论文最终版', 6);
INSERT INTO `plan` VALUES (8, 0, NULL, 16, '2019-04-19 15:10:58', '本科毕设.计划', 0);
INSERT INTO `plan` VALUES (9, 0, 8, 16, '2019-04-19 15:10:58', '每周汇报', 1);
INSERT INTO `plan` VALUES (10, 0, 8, 16, '2019-04-19 15:10:58', '论文初稿', 2);
INSERT INTO `plan` VALUES (11, 0, 8, 16, '2019-04-19 15:10:58', '论文算例', 3);
INSERT INTO `plan` VALUES (12, 0, 8, 16, '2019-04-19 15:10:58', '论文最终版', 4);
INSERT INTO `plan` VALUES (13, 0, NULL, 8, '2019-04-19 15:10:58', '课堂教学.计划', 0);
INSERT INTO `plan` VALUES (14, 0, 13, 8, '2019-04-19 15:10:58', '每周汇报', 1);
INSERT INTO `plan` VALUES (15, 0, 13, 8, '2019-04-19 15:10:58', '结业答辩', 2);
INSERT INTO `plan` VALUES (16, 0, NULL, 2, '2019-04-19 15:10:58', '科研项目.计划', 0);
INSERT INTO `plan` VALUES (17, 0, 16, 2, '2019-04-19 15:10:58', '招标', 1);
INSERT INTO `plan` VALUES (18, 0, 16, 2, '2019-04-19 15:10:58', '调研', 2);
INSERT INTO `plan` VALUES (19, 0, 16, 2, '2019-04-19 15:10:58', '算例', 3);
INSERT INTO `plan` VALUES (20, 0, 16, 2, '2019-04-19 15:10:58', '实验', 4);
INSERT INTO `plan` VALUES (21, 0, 16, 2, '2019-04-19 15:10:58', '日常汇报', 5);
INSERT INTO `plan` VALUES (22, 0, 16, 2, '2019-04-19 15:10:58', '工作报告', 6);
INSERT INTO `plan` VALUES (23, 0, 16, 2, '2019-04-19 15:10:58', '研究报告', 7);
INSERT INTO `plan` VALUES (24, 0, 16, 2, '2019-04-19 15:10:58', '程序代码', 8);
INSERT INTO `plan` VALUES (25, 0, 16, 2, '2019-04-19 15:10:58', '计算模型文件', 9);
INSERT INTO `plan` VALUES (26, 0, NULL, 4, '2019-04-19 15:10:58', '国家科技重大专项.计划', 0);
INSERT INTO `plan` VALUES (27, 0, 26, 4, '2019-04-19 15:10:58', '招标', 1);
INSERT INTO `plan` VALUES (28, 0, 26, 4, '2019-04-19 15:10:58', '调研', 2);
INSERT INTO `plan` VALUES (29, 0, 26, 4, '2019-04-19 15:10:58', '算例', 3);
INSERT INTO `plan` VALUES (30, 0, 26, 4, '2019-04-19 15:10:58', '实验', 4);
INSERT INTO `plan` VALUES (31, 0, 26, 4, '2019-04-19 15:10:58', '日常汇报', 5);
INSERT INTO `plan` VALUES (32, 0, 26, 4, '2019-04-19 15:10:58', '工作报告', 6);
INSERT INTO `plan` VALUES (33, 0, 26, 4, '2019-04-19 15:10:58', '研究报告', 7);
INSERT INTO `plan` VALUES (34, 0, 26, 4, '2019-04-19 15:10:58', '程序代码', 8);
INSERT INTO `plan` VALUES (35, 0, 26, 4, '2019-04-19 15:10:58', '计算模型文件', 9);
INSERT INTO `plan` VALUES (36, 0, NULL, 5, '2019-04-19 15:10:58', '自然基金.计划', 0);
INSERT INTO `plan` VALUES (37, 0, 36, 5, '2019-04-19 15:10:58', '招标', 1);
INSERT INTO `plan` VALUES (38, 0, 36, 5, '2019-04-19 15:10:58', '调研', 2);
INSERT INTO `plan` VALUES (39, 0, 36, 5, '2019-04-19 15:10:58', '算例', 3);
INSERT INTO `plan` VALUES (40, 0, 36, 5, '2019-04-19 15:10:58', '实验', 4);
INSERT INTO `plan` VALUES (41, 0, 36, 5, '2019-04-19 15:10:58', '日常汇报', 5);
INSERT INTO `plan` VALUES (42, 0, 36, 5, '2019-04-19 15:10:58', '工作报告', 6);
INSERT INTO `plan` VALUES (43, 0, 36, 5, '2019-04-19 15:10:58', '研究报告', 7);
INSERT INTO `plan` VALUES (44, 0, 36, 5, '2019-04-19 15:10:58', '程序代码', 8);
INSERT INTO `plan` VALUES (45, 0, 36, 5, '2019-04-19 15:10:58', '计算模型文件', 9);
INSERT INTO `plan` VALUES (46, 0, NULL, 6, '2019-04-19 15:10:58', '省级自然基金.计划', 0);
INSERT INTO `plan` VALUES (47, 0, 46, 6, '2019-04-19 15:10:58', '招标', 1);
INSERT INTO `plan` VALUES (48, 0, 46, 6, '2019-04-19 15:10:58', '调研', 2);
INSERT INTO `plan` VALUES (49, 0, 46, 6, '2019-04-19 15:10:58', '算例', 3);
INSERT INTO `plan` VALUES (50, 0, 46, 6, '2019-04-19 15:10:58', '实验', 4);
INSERT INTO `plan` VALUES (51, 0, 46, 6, '2019-04-19 15:10:58', '日常汇报', 5);
INSERT INTO `plan` VALUES (52, 0, 46, 6, '2019-04-19 15:10:58', '工作报告', 6);
INSERT INTO `plan` VALUES (53, 0, 46, 6, '2019-04-19 15:10:58', '研究报告', 7);
INSERT INTO `plan` VALUES (54, 0, 46, 6, '2019-04-19 15:10:58', '程序代码', 8);
INSERT INTO `plan` VALUES (55, 0, 46, 6, '2019-04-19 15:10:58', '计算模型文件', 9);
INSERT INTO `plan` VALUES (56, 0, NULL, 7, '2019-04-19 15:10:58', '横向项目.计划', 0);
INSERT INTO `plan` VALUES (57, 0, 56, 7, '2019-04-19 15:10:58', '招标', 1);
INSERT INTO `plan` VALUES (58, 0, 56, 7, '2019-04-19 15:10:58', '调研', 2);
INSERT INTO `plan` VALUES (59, 0, 56, 7, '2019-04-19 15:10:58', '算例', 3);
INSERT INTO `plan` VALUES (60, 0, 56, 7, '2019-04-19 15:10:58', '实验', 4);
INSERT INTO `plan` VALUES (61, 0, 56, 7, '2019-04-19 15:10:58', '日常汇报', 5);
INSERT INTO `plan` VALUES (62, 0, 56, 7, '2019-04-19 15:10:58', '工作报告', 6);
INSERT INTO `plan` VALUES (63, 0, 56, 7, '2019-04-19 15:10:58', '研究报告', 7);
INSERT INTO `plan` VALUES (64, 0, 56, 7, '2019-04-19 15:10:58', '程序代码', 8);
INSERT INTO `plan` VALUES (65, 0, 56, 7, '2019-04-19 15:10:58', '计算模型文件', 9);
INSERT INTO `plan` VALUES (66, 0, NULL, 9, '2019-04-19 15:10:58', '课程设计.计划', 0);
INSERT INTO `plan` VALUES (67, 0, 66, 9, '2019-04-19 15:10:58', '中期汇报', 1);
INSERT INTO `plan` VALUES (68, 0, 66, 9, '2019-04-19 15:10:58', '结业论文', 2);
INSERT INTO `plan` VALUES (69, 0, NULL, 10, '2019-04-19 15:10:58', '软件实训.计划', 0);
INSERT INTO `plan` VALUES (70, 0, 69, 10, '2019-04-19 15:10:58', '中期汇报', 1);
INSERT INTO `plan` VALUES (71, 0, 69, 10, '2019-04-19 15:10:58', '结业论文', 2);
INSERT INTO `plan` VALUES (72, 0, NULL, 11, '2019-04-19 15:10:58', '软件概论.计划', 0);
INSERT INTO `plan` VALUES (73, 0, 72, 11, '2019-04-19 15:10:58', '中期汇报', 1);
INSERT INTO `plan` VALUES (74, 0, 72, 11, '2019-04-19 15:10:58', '结业论文', 2);
INSERT INTO `plan` VALUES (75, 0, NULL, 12, '2019-04-19 15:10:58', '油气管道SCADA系统与过程控制.计划', 0);
INSERT INTO `plan` VALUES (76, 0, 75, 12, '2019-04-19 15:10:58', '中期汇报', 1);
INSERT INTO `plan` VALUES (77, 0, 75, 12, '2019-04-19 15:10:58', '结业论文', 2);
INSERT INTO `plan` VALUES (78, 0, NULL, 13, '2019-04-19 15:10:58', '成品油管道设计.计划', 0);
INSERT INTO `plan` VALUES (79, 0, 78, 13, '2019-04-19 15:10:58', '中期汇报', 1);
INSERT INTO `plan` VALUES (80, 0, 78, 13, '2019-04-19 15:10:58', '结业论文', 2);

SET FOREIGN_KEY_CHECKS = 1;
