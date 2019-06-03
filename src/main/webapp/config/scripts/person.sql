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

 Date: 29/04/2019 08:44:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `person_title_id` bigint(20) NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `grade_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `major_id` bigint(20) NULL DEFAULT NULL,
  `supervisor_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_4gr67lk0t9mc9aoqfbo9mdmtw`(`code`) USING BTREE,
  INDEX `FKgp5bmxhm3l9bb8l2oymygnfed`(`person_title_id`) USING BTREE,
  INDEX `FKfj7yapqul1e9v1e0e79x6yqmi`(`major_id`) USING BTREE,
  INDEX `FK3e0iqc4bmiwmp8ltecavkc7d8`(`supervisor_id`) USING BTREE,
  CONSTRAINT `FK3e0iqc4bmiwmp8ltecavkc7d8` FOREIGN KEY (`supervisor_id`) REFERENCES `person` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKfj7yapqul1e9v1e0e79x6yqmi` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKgp5bmxhm3l9bb8l2oymygnfed` FOREIGN KEY (`person_title_id`) REFERENCES `person_title` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 267 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES (1, 0, 4, '1552', '宫敬', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (2, 0, 5, '2151', '李晓平', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (3, 0, 5, '2152', '邓道明', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (4, 0, 5, '2333', '左丽丽', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (5, 0, 5, '2013880073', '史博会', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (6, 0, 6, '2012880012', '温凯', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (7, 0, 16, '2014314014', '石国赟', 'cn.edu.cup.basic.Student', '博士2014', 1, 1);
INSERT INTO `person` VALUES (8, 0, 16, '2014314013', '丁麟', 'cn.edu.cup.basic.Student', '博士2014', 1, 1);
INSERT INTO `person` VALUES (9, 0, 16, '2015314019', '虞维超', 'cn.edu.cup.basic.Student', '博士2015', 1, 1);
INSERT INTO `person` VALUES (10, 0, 16, '2015314016', '马千里', 'cn.edu.cup.basic.Student', '博士2015', 1, 1);
INSERT INTO `person` VALUES (11, 0, 16, '2015314022', '靳航', 'cn.edu.cup.basic.Student', '博士2015', 1, 1);
INSERT INTO `person` VALUES (12, 0, 16, '2015314023', '柳扬', 'cn.edu.cup.basic.Student', '博士2015', 1, 1);
INSERT INTO `person` VALUES (13, 0, 16, '2015314017', '宋尚飞', 'cn.edu.cup.basic.Student', '博士2015', 1, 1);
INSERT INTO `person` VALUES (14, 0, 16, '2016314026', '康琦', 'cn.edu.cup.basic.Student', '博士2016', 1, 1);
INSERT INTO `person` VALUES (15, 0, 16, '2016314018', '洪炳沅', 'cn.edu.cup.basic.Student', '博士2016', 1, 1);
INSERT INTO `person` VALUES (16, 0, 16, '2016314025', '黄辉荣', 'cn.edu.cup.basic.Student', '博士2016', 1, 1);
INSERT INTO `person` VALUES (17, 0, 16, '2016314019', '王丹', 'cn.edu.cup.basic.Student', '博士2016', 1, 1);
INSERT INTO `person` VALUES (18, 0, 16, '2016314017', '李昂', 'cn.edu.cup.basic.Student', '博士2016', 1, 1);
INSERT INTO `person` VALUES (19, 0, 16, '2017314026', '樊迪', 'cn.edu.cup.basic.Student', '博士2017', 1, 1);
INSERT INTO `person` VALUES (20, 0, 16, '2017314015', '齐雪宇', 'cn.edu.cup.basic.Student', '博士2017', 1, 1);
INSERT INTO `person` VALUES (21, 0, 16, '2017314023', '于志鹏', 'cn.edu.cup.basic.Student', '博士2017', 1, 1);
INSERT INTO `person` VALUES (22, 0, 16, '2017314013', '陈玉川', 'cn.edu.cup.basic.Student', '博士2017', 1, 1);
INSERT INTO `person` VALUES (23, 0, 16, '2017314014', '李熠辰', 'cn.edu.cup.basic.Student', '博士2017', 1, 1);
INSERT INTO `person` VALUES (24, 0, 16, '2017314024', '张盛楠', 'cn.edu.cup.basic.Student', '博士2017', 1, 1);
INSERT INTO `person` VALUES (25, 0, 16, '2018314016', '段旭', 'cn.edu.cup.basic.Student', '博士2018', 1, 1);
INSERT INTO `person` VALUES (26, 0, 16, '2018314015', '陈思杭', 'cn.edu.cup.basic.Student', '博士2018', 1, 1);
INSERT INTO `person` VALUES (27, 0, 16, '2018314026', '彭泽恒', 'cn.edu.cup.basic.Student', '博士2018', 1, 1);
INSERT INTO `person` VALUES (28, 0, 16, '2018314025', '李楷', 'cn.edu.cup.basic.Student', '博士2018', 1, 1);
INSERT INTO `person` VALUES (29, 0, 17, '2015214549', '金浩', 'cn.edu.cup.basic.Student', '硕士2015', 2, 1);
INSERT INTO `person` VALUES (30, 0, 17, '2015214571', '马晓旭', 'cn.edu.cup.basic.Student', '硕士2015', 2, 1);
INSERT INTO `person` VALUES (31, 0, 17, '2015214557', '朱梦琪', 'cn.edu.cup.basic.Student', '硕士2015', 2, 1);
INSERT INTO `person` VALUES (32, 0, 17, '2016214568', '陈新果', 'cn.edu.cup.basic.Student', '硕士2016', 2, 1);
INSERT INTO `person` VALUES (33, 0, 17, '2016214090', '陈怡鸣', 'cn.edu.cup.basic.Student', '硕士2016', 1, 1);
INSERT INTO `person` VALUES (34, 0, 17, '2016214554', '陈影', 'cn.edu.cup.basic.Student', '硕士2016', 2, 1);
INSERT INTO `person` VALUES (35, 0, 17, '2016214555', '崔可心', 'cn.edu.cup.basic.Student', '硕士2016', 2, 1);
INSERT INTO `person` VALUES (36, 0, 17, '2016214536', '丁凯', 'cn.edu.cup.basic.Student', '硕士2016', 2, 1);
INSERT INTO `person` VALUES (37, 0, 17, '2016214091', '甘东英', 'cn.edu.cup.basic.Student', '硕士2016', 1, 1);
INSERT INTO `person` VALUES (38, 0, 17, '2016214537', '高航', 'cn.edu.cup.basic.Student', '硕士2016', 2, 1);
INSERT INTO `person` VALUES (39, 0, 17, '2016214541', '韩庆龙', 'cn.edu.cup.basic.Student', '硕士2016', 2, 1);
INSERT INTO `person` VALUES (40, 0, 17, '2016214538', '黄璞', 'cn.edu.cup.basic.Student', '硕士2016', 2, 1);
INSERT INTO `person` VALUES (41, 0, 17, '2016214539', '李梦瑶', 'cn.edu.cup.basic.Student', '硕士2016', 2, 1);
INSERT INTO `person` VALUES (42, 0, 17, '2016214086', '李莎', 'cn.edu.cup.basic.Student', '硕士2016', 1, 1);
INSERT INTO `person` VALUES (43, 0, 17, '2016214556', '李愚', 'cn.edu.cup.basic.Student', '硕士2016', 2, 1);
INSERT INTO `person` VALUES (44, 0, 17, '2016214544', '王传硕', 'cn.edu.cup.basic.Student', '硕士2016', 2, 1);
INSERT INTO `person` VALUES (45, 0, 17, '2016214543', '任亮', 'cn.edu.cup.basic.Student', '硕士2016', 2, 1);
INSERT INTO `person` VALUES (46, 0, 17, '2016214060', '沈伟伟', 'cn.edu.cup.basic.Student', '硕士2016', 1, 1);
INSERT INTO `person` VALUES (47, 0, 17, '2016214092', '沈允', 'cn.edu.cup.basic.Student', '硕士2016', 1, 1);
INSERT INTO `person` VALUES (48, 0, 17, '2016214076', '苏越', 'cn.edu.cup.basic.Student', '硕士2016', 1, 2);
INSERT INTO `person` VALUES (49, 0, 17, '2016214557', '万洋洋', 'cn.edu.cup.basic.Student', '硕士2016', 2, 2);
INSERT INTO `person` VALUES (50, 0, 17, '2016214558', '王茀玺', 'cn.edu.cup.basic.Student', '硕士2016', 2, 1);
INSERT INTO `person` VALUES (51, 0, 17, '2016214057', '王君傲', 'cn.edu.cup.basic.Student', '硕士2016', 1, 1);
INSERT INTO `person` VALUES (52, 0, 17, '2016214093', '吴停', 'cn.edu.cup.basic.Student', '硕士2016', 1, 1);
INSERT INTO `person` VALUES (53, 0, 17, '2016214096', '夏子杰', 'cn.edu.cup.basic.Student', '硕士2016', 1, 1);
INSERT INTO `person` VALUES (54, 0, 17, '2015214064', '许洁', 'cn.edu.cup.basic.Student', '硕士2016', 1, 1);
INSERT INTO `person` VALUES (55, 0, 17, '2016214063', '张若晨', 'cn.edu.cup.basic.Student', '硕士2016', 1, 1);
INSERT INTO `person` VALUES (56, 0, 17, '2016214065', '赵云鹏', 'cn.edu.cup.basic.Student', '硕士2016', 1, 1);
INSERT INTO `person` VALUES (57, 0, 17, '2016214560', '周艳红', 'cn.edu.cup.basic.Student', '硕士2016', 2, 2);
INSERT INTO `person` VALUES (58, 0, 17, '2017214552', '邓坤', 'cn.edu.cup.basic.Student', '硕士2017', 2, 1);
INSERT INTO `person` VALUES (59, 0, 17, '2017214564', '高晶晶', 'cn.edu.cup.basic.Student', '硕士2017', 2, 2);
INSERT INTO `person` VALUES (60, 0, 17, '2017214553', '高振宇', 'cn.edu.cup.basic.Student', '硕士2017', 2, 1);
INSERT INTO `person` VALUES (61, 0, 17, '2017214565', '何卓', 'cn.edu.cup.basic.Student', '硕士2017', 2, 2);
INSERT INTO `person` VALUES (62, 0, 17, '2017214554', '胡杰', 'cn.edu.cup.basic.Student', '硕士2017', 2, 1);
INSERT INTO `person` VALUES (63, 0, 17, '2017214558', '兰文萍', 'cn.edu.cup.basic.Student', '硕士2017', 2, 1);
INSERT INTO `person` VALUES (64, 0, 17, '2017214584', '李根', 'cn.edu.cup.basic.Student', '硕士2017', 2, 1);
INSERT INTO `person` VALUES (65, 0, 17, '2017214050', '李金潮', 'cn.edu.cup.basic.Student', '硕士2017', 1, 1);
INSERT INTO `person` VALUES (66, 0, 17, '2017214052', '李立', 'cn.edu.cup.basic.Student', '硕士2017', 1, 1);
INSERT INTO `person` VALUES (67, 0, 17, '2017214555', '林聿明', 'cn.edu.cup.basic.Student', '硕士2017', 2, 1);
INSERT INTO `person` VALUES (68, 0, 17, '2017214053', '吕鹏飞', 'cn.edu.cup.basic.Student', '硕士2017', 1, 1);
INSERT INTO `person` VALUES (69, 0, 17, '2017214054', '孙小喆', 'cn.edu.cup.basic.Student', '硕士2017', 1, 1);
INSERT INTO `person` VALUES (70, 0, 17, '2017214081', '王振威', 'cn.edu.cup.basic.Student', '硕士2017', 1, 1);
INSERT INTO `person` VALUES (71, 0, 17, '2017214078', '肖亚琪', 'cn.edu.cup.basic.Student', '硕士2017', 1, 1);
INSERT INTO `person` VALUES (72, 0, 17, '2017214070', '谢平', 'cn.edu.cup.basic.Student', '硕士2017', 1, 2);
INSERT INTO `person` VALUES (73, 0, 17, '2017214082', '薛一菡', 'cn.edu.cup.basic.Student', '硕士2017', 1, 1);
INSERT INTO `person` VALUES (74, 0, 17, '2017214570', '杨克', 'cn.edu.cup.basic.Student', '硕士2017', 2, 1);
INSERT INTO `person` VALUES (75, 0, 17, '2017214566', '禹亚峰', 'cn.edu.cup.basic.Student', '硕士2017', 2, 2);
INSERT INTO `person` VALUES (76, 0, 17, '2017214556', '张昊', 'cn.edu.cup.basic.Student', '硕士2017', 2, 1);
INSERT INTO `person` VALUES (77, 0, 17, '2017214055', '张杰', 'cn.edu.cup.basic.Student', '硕士2017', 1, 1);
INSERT INTO `person` VALUES (78, 0, 17, '2017214557', '张蒙丽', 'cn.edu.cup.basic.Student', '硕士2017', 2, 1);
INSERT INTO `person` VALUES (79, 0, 17, '2017214056', '张佩颖', 'cn.edu.cup.basic.Student', '硕士2017', 1, 1);
INSERT INTO `person` VALUES (80, 0, 17, '2017214069', '狄国佳', 'cn.edu.cup.basic.Student', '硕士2017', 1, 1);
INSERT INTO `person` VALUES (81, 0, 17, '2018214052', '丁陈陈', 'cn.edu.cup.basic.Student', '硕士2018', 1, 1);
INSERT INTO `person` VALUES (82, 0, 17, '2018214053', '纪晨秋', 'cn.edu.cup.basic.Student', '硕士2018', 1, 1);
INSERT INTO `person` VALUES (83, 0, 17, '2018214054', '廖清云', 'cn.edu.cup.basic.Student', '硕士2018', 1, 1);
INSERT INTO `person` VALUES (84, 0, 17, '2018214055', '刘鹏', 'cn.edu.cup.basic.Student', '硕士2018', 1, 1);
INSERT INTO `person` VALUES (85, 0, 17, '2018214056', '刘轩章', 'cn.edu.cup.basic.Student', '硕士2018', 1, 1);
INSERT INTO `person` VALUES (86, 0, 17, '2018214051', '李国豪', 'cn.edu.cup.basic.Student', '硕士2018', 1, 1);
INSERT INTO `person` VALUES (87, 0, 17, '2018214075', '林德才', 'cn.edu.cup.basic.Student', '硕士2018', 1, 1);
INSERT INTO `person` VALUES (88, 0, 17, '2018214078', '葛运通', 'cn.edu.cup.basic.Student', '硕士2018', 1, 1);
INSERT INTO `person` VALUES (89, 0, 17, '2018214079', '杨晓鹏', 'cn.edu.cup.basic.Student', '硕士2018', 1, 1);
INSERT INTO `person` VALUES (90, 0, 17, '2018214544', '冯兴', 'cn.edu.cup.basic.Student', '硕士2018', 2, 1);
INSERT INTO `person` VALUES (91, 0, 17, '2018214545', '王昕楚', 'cn.edu.cup.basic.Student', '硕士2018', 2, 1);
INSERT INTO `person` VALUES (92, 0, 17, '2018214546', '王靖怡', 'cn.edu.cup.basic.Student', '硕士2018', 2, 1);
INSERT INTO `person` VALUES (93, 0, 17, '2018214553', '崔雪萌', 'cn.edu.cup.basic.Student', '硕士2018', 2, 1);
INSERT INTO `person` VALUES (94, 0, 17, '2018214554', '都兆楠', 'cn.edu.cup.basic.Student', '硕士2018', 2, 1);
INSERT INTO `person` VALUES (95, 0, 17, '2018214555', '谭遥', 'cn.edu.cup.basic.Student', '硕士2018', 2, 2);
INSERT INTO `person` VALUES (96, 0, 17, '2018214084', '周建伟', 'cn.edu.cup.basic.Student', '硕士2018', 1, 1);
INSERT INTO `person` VALUES (97, 0, 17, '2018214068', '刘胜男', 'cn.edu.cup.basic.Student', '硕士2018', 1, 2);
INSERT INTO `person` VALUES (98, 0, 17, '2018214080', '喻伟婕', 'cn.edu.cup.basic.Student', '硕士2018', 1, 1);
INSERT INTO `person` VALUES (99, 0, 17, '2018214081', '张璐瑶', 'cn.edu.cup.basic.Student', '硕士2018', 1, 1);
INSERT INTO `person` VALUES (100, 0, 15, '2014011043', '冯志强', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (101, 0, 15, '2015010667', '沈倩', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (102, 0, 15, '2015010743', '王铁淞', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (103, 0, 15, '2015010854', '德吉曲珍', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (104, 0, 15, '2015010855', '胡瑾', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (105, 0, 15, '2015010856', '贾羽茜', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (106, 0, 15, '2015010857', '康雅倩', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (107, 0, 15, '2015010858', '兰敏', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (108, 0, 15, '2015010859', '李露露', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (109, 0, 15, '2015010860', '李玥洁', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (110, 0, 15, '2015010861', '柳佳丽', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (111, 0, 15, '2015010862', '史安丁', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (112, 0, 15, '2015010863', '张怡铭', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (113, 0, 15, '2015010864', '艾斯卡尔·坎买尔', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (114, 0, 15, '2015010865', '白宗翰', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (115, 0, 15, '2015010866', '董佳鑫', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (116, 0, 15, '2015010867', '付顺康', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (117, 0, 15, '2015010868', '高经华', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (118, 0, 15, '2015010869', '顾鹏程', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (119, 0, 15, '2015010870', '贺国晏', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (120, 0, 15, '2015010871', '侯富恒', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (121, 0, 15, '2015010872', '姜铖', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (122, 0, 15, '2015010873', '李致远', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (123, 0, 15, '2015010875', '刘禹良', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (124, 0, 15, '2015010876', '骆新斗', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (125, 0, 15, '2015010877', '马克', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (126, 0, 15, '2015010878', '马有财', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (127, 0, 15, '2015010879', '邵文宏', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (128, 0, 15, '2015010880', '王饕', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (129, 0, 15, '2015010881', '伍彦松', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (130, 0, 15, '2015010882', '熊泽华', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (131, 0, 15, '2015010883', '严腾飞', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (132, 0, 15, '2015010884', '杨宏慧', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (133, 0, 15, '2015010885', '殷雄', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (134, 0, 15, '2015010886', '张猛', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (135, 0, 15, '2015010887', '张雄凯', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (136, 0, 15, '2015011149', '张悦', 'cn.edu.cup.basic.Student', '储运15-1班', 1, NULL);
INSERT INTO `person` VALUES (137, 0, 15, '2013010935', '李伟奇', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (138, 0, 15, '2013011552', '柴兆杰', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (139, 0, 15, '2015010125', '张扬', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (140, 0, 15, '2015010450', '焦开拓', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (141, 0, 15, '2015010888', '金晓琼', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (142, 0, 15, '2015010889', '亢燕丽', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (143, 0, 15, '2015010890', '刘学春', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (144, 0, 15, '2015010891', '么娆', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (145, 0, 15, '2015010892', '王玉婷', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (146, 0, 15, '2015010893', '王智林', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (147, 0, 15, '2015010894', '徐苗苗', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (148, 0, 15, '2015010895', '徐则林', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (149, 0, 15, '2015010897', '张昊月', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (150, 0, 15, '2015010898', '戴材炜', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (151, 0, 15, '2015010900', '何毅', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (152, 0, 15, '2015010901', '贺禹铭', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (153, 0, 15, '2015010902', '雷平', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (154, 0, 15, '2015010903', '李彦博', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (155, 0, 15, '2015010904', '李泽世', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (156, 0, 15, '2015010905', '刘琪', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (157, 0, 15, '2015010906', '刘万琪', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (158, 0, 15, '2015010907', '刘志伟', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (159, 0, 15, '2015010908', '石金波', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (160, 0, 15, '2015010909', '宋燎东', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (161, 0, 15, '2015010910', '隋金昊', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (162, 0, 15, '2015010911', '邰昊', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (163, 0, 15, '2015010912', '唐银宏', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (164, 0, 15, '2015010913', '王怡博', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (165, 0, 15, '2015010914', '徐帜', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (166, 0, 15, '2015010915', '杨起', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (167, 0, 15, '2015010917', '张兴强', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (168, 0, 15, '2015010918', '赵鹏', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (169, 0, 15, '2015010919', '赵伟', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (170, 0, 15, '2015010920', '周小龙', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (171, 0, 15, '2015010954', '李维嘉', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (172, 0, 15, '2015010956', '吴紫月', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (173, 0, 15, '2015011166', '肖帆', 'cn.edu.cup.basic.Student', '储运15-2班', 1, NULL);
INSERT INTO `person` VALUES (174, 0, 15, '2013010971', '宋少雄', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (175, 0, 15, '2014010805', '张艺馨', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (176, 0, 15, '2015010921', '封叶', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (177, 0, 15, '2015010922', '高维蔚', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (178, 0, 15, '2015010923', '李姗姗', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (179, 0, 15, '2015010924', '潘瑞雪', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (180, 0, 15, '2015010925', '索娜曲珍', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (181, 0, 15, '2015010926', '席蔺璇', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (182, 0, 15, '2015010927', '张琴', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (183, 0, 15, '2015010928', '张婉', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (184, 0, 15, '2015010929', '张鑫', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (185, 0, 15, '2015010930', '郑衣珍', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (186, 0, 15, '2015010931', '陈东宁', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (187, 0, 15, '2015010932', '陈盼杰', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (188, 0, 15, '2015010933', '陈枭', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (189, 0, 15, '2015010934', '池弘睿', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (190, 0, 15, '2015010935', '董高华', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (191, 0, 15, '2015010936', '董兆豪', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (192, 0, 15, '2015010937', '高毅飞', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (193, 0, 15, '2015010938', '何习渊', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (194, 0, 15, '2015010939', '李睿麟', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (195, 0, 15, '2015010940', '李伟浩', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (196, 0, 15, '2015010941', '苗泽宇', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (197, 0, 15, '2015010942', '宁立秋', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (198, 0, 15, '2015010943', '田志刚', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (199, 0, 15, '2015010944', '汪常翔', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (200, 0, 15, '2015010945', '杨浩帆', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (201, 0, 15, '2015010946', '张博', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (202, 0, 15, '2015010947', '张财铄', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (203, 0, 15, '2015010948', '张左旻', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (204, 0, 15, '2015010949', '赵凯歌', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (205, 0, 15, '2015010950', '赵文博', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (206, 0, 15, '2015010951', '郑文川', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (207, 0, 15, '2015010952', '周俊炜', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (208, 0, 15, '2015010953', '朱跃强', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (209, 0, 15, '2015011710', '姜源', 'cn.edu.cup.basic.Student', '储运15-3班', 1, NULL);
INSERT INTO `person` VALUES (210, 0, 15, '2015030065', '达意娜', 'cn.edu.cup.basic.Student', '储运15-4留学生班', 1, NULL);
INSERT INTO `person` VALUES (211, 0, 15, '2015030066', '康迪', 'cn.edu.cup.basic.Student', '储运15-4留学生班', 1, NULL);
INSERT INTO `person` VALUES (212, 0, 15, '2015030067', '梅尔兰', 'cn.edu.cup.basic.Student', '储运15-4留学生班', 1, NULL);
INSERT INTO `person` VALUES (213, 0, 15, '2015030068', '萨纳特', 'cn.edu.cup.basic.Student', '储运15-4留学生班', 1, NULL);
INSERT INTO `person` VALUES (214, 0, 15, '2015030069', '桑迪', 'cn.edu.cup.basic.Student', '储运15-4留学生班', 1, NULL);
INSERT INTO `person` VALUES (215, 0, 5, '2161', '邢晓凯', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (216, 0, 4, '2166', '侯磊', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (217, 0, 5, '2005', '李兆慈', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (218, 0, 4, '1670', '黄启玉', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (219, 0, 5, '1815', '李鸿英', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (220, 0, 6, '2219', '阎凤元', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (221, 0, 5, '2157', '孙恒', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (222, 0, 5, '1357', '张帆', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (223, 0, 4, '0098', '张劲军', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (224, 0, 10, '1102', '吴海浩', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (225, 0, 4, '0093', '吴长春', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (226, 0, 5, '2401', '陈严飞', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (227, 0, 6, '2435', '韩善鹏', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (228, 0, 5, '2011880034', '王艺', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (229, 0, 5, '2013880070', '孙旭', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (230, 0, 5, '2014880069', '张永星', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (231, 0, 6, '2015880040', '刘稳文', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (232, 0, 6, '2016880002', '李文婧', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (233, 0, 6, '2016880044', '孙梦然', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (234, 0, 6, '2017880042', '王雨墨', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (235, 0, 6, '2018880019', '刘啸奔', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (236, 0, 6, '2018891017', '苏怀', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (237, 0, 17, '2015214576', '卜铎', 'cn.edu.cup.basic.Student', '硕士2015', 2, 223);
INSERT INTO `person` VALUES (238, 0, 17, '2017214588', '孙成威', 'cn.edu.cup.basic.Student', '硕士2017', 2, 4);
INSERT INTO `person` VALUES (239, 0, 17, '2018214547', '李雨', 'cn.edu.cup.basic.Student', '硕士2018', 2, 216);
INSERT INTO `person` VALUES (240, 0, 17, '2018214548', '王昕', 'cn.edu.cup.basic.Student', '硕士2018', 2, 216);
INSERT INTO `person` VALUES (241, 0, 17, '2018214549', '朱振宇', 'cn.edu.cup.basic.Student', '硕士2018', 2, 216);
INSERT INTO `person` VALUES (242, 0, 17, '2018214550', '单锦旭', 'cn.edu.cup.basic.Student', '硕士2018', 2, 218);
INSERT INTO `person` VALUES (243, 0, 17, '2018214556', '董小钰', 'cn.edu.cup.basic.Student', '硕士2018', 2, 217);
INSERT INTO `person` VALUES (244, 0, 17, '2018214557', '陶冰星', 'cn.edu.cup.basic.Student', '硕士2018', 2, 217);
INSERT INTO `person` VALUES (245, 0, 17, '2018214558', '王扬超', 'cn.edu.cup.basic.Student', '硕士2018', 2, 217);
INSERT INTO `person` VALUES (246, 0, 17, '2018214559', '杨哲任', 'cn.edu.cup.basic.Student', '硕士2018', 2, 217);
INSERT INTO `person` VALUES (247, 0, 17, '2018214560', '张静宇', 'cn.edu.cup.basic.Student', '硕士2018', 2, 217);
INSERT INTO `person` VALUES (248, 0, 17, '2018214564', '谭宝亮', 'cn.edu.cup.basic.Student', '硕士2018', 2, 225);
INSERT INTO `person` VALUES (249, 0, 17, '2018214565', '赵恭宇', 'cn.edu.cup.basic.Student', '硕士2018', 2, 225);
INSERT INTO `person` VALUES (250, 0, 17, '2018214566', '葛旭', 'cn.edu.cup.basic.Student', '硕士2018', 2, 215);
INSERT INTO `person` VALUES (251, 0, 17, '2018214567', '李栋', 'cn.edu.cup.basic.Student', '硕士2018', 2, 215);
INSERT INTO `person` VALUES (252, 0, 17, '2018214568', '王帅', 'cn.edu.cup.basic.Student', '硕士2018', 2, 215);
INSERT INTO `person` VALUES (253, 0, 17, '2018214569', '武壮', 'cn.edu.cup.basic.Student', '硕士2018', 2, 215);
INSERT INTO `person` VALUES (254, 0, 17, '2018214570', '朱云鹏', 'cn.edu.cup.basic.Student', '硕士2018', 2, 215);
INSERT INTO `person` VALUES (255, 0, 17, '2018214573', '钟思源', 'cn.edu.cup.basic.Student', '硕士2018', 2, 223);
INSERT INTO `person` VALUES (256, 0, 17, '2018214574', '周冰', 'cn.edu.cup.basic.Student', '硕士2018', 2, 223);
INSERT INTO `person` VALUES (257, 0, 17, '2018214575', '曾亚男', 'cn.edu.cup.basic.Student', '硕士2018', 2, 4);
INSERT INTO `person` VALUES (258, 0, 17, '2018214576', '刘壮', 'cn.edu.cup.basic.Student', '硕士2018', 2, 4);
INSERT INTO `person` VALUES (259, 0, 17, '2018214577', '倪平', 'cn.edu.cup.basic.Student', '硕士2018', 2, 4);
INSERT INTO `person` VALUES (260, 0, 17, '2018214578', '张湘玮', 'cn.edu.cup.basic.Student', '硕士2018', 2, 4);
INSERT INTO `person` VALUES (261, 0, 17, '2018214579', '赵留康', 'cn.edu.cup.basic.Student', '硕士2018', 2, 4);
INSERT INTO `person` VALUES (262, 0, 17, '2018244505', '王玮健', 'cn.edu.cup.basic.Student', '硕士2018', 2, NULL);
INSERT INTO `person` VALUES (263, 0, 17, '2016214559', '韦宝成', 'cn.edu.cup.basic.Student', '硕士2016', 2, 2);
INSERT INTO `person` VALUES (264, 0, 17, '2016214080', '李蛟鸾', 'cn.edu.cup.basic.Student', '硕士2016', 1, 2);
INSERT INTO `person` VALUES (265, 0, 17, '2018214572', '陈汉', 'cn.edu.cup.basic.Student', '硕士2018', 2, 2);
INSERT INTO `person` VALUES (266, 0, 17, '2018214551', '时浩', 'cn.edu.cup.basic.Student', '硕士2018', 2, 2);

SET FOREIGN_KEY_CHECKS = 1;
