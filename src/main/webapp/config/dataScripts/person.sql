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

 Date: 06/06/2019 11:14:18
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
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_4gr67lk0t9mc9aoqfbo9mdmtw`(`code`) USING BTREE,
  INDEX `FKgp5bmxhm3l9bb8l2oymygnfed`(`person_title_id`) USING BTREE,
  CONSTRAINT `FKgp5bmxhm3l9bb8l2oymygnfed` FOREIGN KEY (`person_title_id`) REFERENCES `person_title` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 268 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES (1, 0, 4, '1552', '宫敬');
INSERT INTO `person` VALUES (2, 0, 5, '2151', '李晓平');
INSERT INTO `person` VALUES (3, 0, 5, '2152', '邓道明');
INSERT INTO `person` VALUES (4, 0, 5, '2333', '左丽丽');
INSERT INTO `person` VALUES (5, 0, 5, '2013880073', '史博会');
INSERT INTO `person` VALUES (6, 0, 6, '2012880012', '温凯');
INSERT INTO `person` VALUES (7, 0, 16, '2014314014', '石国赟');
INSERT INTO `person` VALUES (8, 0, 16, '2014314013', '丁麟');
INSERT INTO `person` VALUES (9, 0, 16, '2015314019', '虞维超');
INSERT INTO `person` VALUES (10, 0, 16, '2015314016', '马千里');
INSERT INTO `person` VALUES (11, 0, 16, '2015314022', '靳航');
INSERT INTO `person` VALUES (12, 0, 16, '2015314023', '柳扬');
INSERT INTO `person` VALUES (13, 0, 16, '2015314017', '宋尚飞');
INSERT INTO `person` VALUES (14, 0, 16, '2016314026', '康琦');
INSERT INTO `person` VALUES (15, 0, 16, '2016314018', '洪炳沅');
INSERT INTO `person` VALUES (16, 0, 16, '2016314025', '黄辉荣');
INSERT INTO `person` VALUES (17, 0, 16, '2016314019', '王丹');
INSERT INTO `person` VALUES (18, 0, 16, '2016314017', '李昂');
INSERT INTO `person` VALUES (19, 0, 16, '2017314026', '樊迪');
INSERT INTO `person` VALUES (20, 0, 16, '2017314015', '齐雪宇');
INSERT INTO `person` VALUES (21, 0, 16, '2017314023', '于志鹏');
INSERT INTO `person` VALUES (22, 0, 16, '2017314013', '陈玉川');
INSERT INTO `person` VALUES (23, 0, 16, '2017314014', '李熠辰');
INSERT INTO `person` VALUES (24, 0, 16, '2017314024', '张盛楠');
INSERT INTO `person` VALUES (25, 0, 16, '2018314016', '段旭');
INSERT INTO `person` VALUES (26, 0, 16, '2018314015', '陈思杭');
INSERT INTO `person` VALUES (27, 0, 16, '2018314026', '彭泽恒');
INSERT INTO `person` VALUES (28, 0, 16, '2018314025', '李楷');
INSERT INTO `person` VALUES (29, 0, 17, '2015214549', '金浩');
INSERT INTO `person` VALUES (30, 0, 17, '2015214571', '马晓旭');
INSERT INTO `person` VALUES (31, 0, 17, '2015214557', '朱梦琪');
INSERT INTO `person` VALUES (32, 0, 17, '2016214568', '陈新果');
INSERT INTO `person` VALUES (33, 0, 17, '2016214090', '陈怡鸣');
INSERT INTO `person` VALUES (34, 0, 17, '2016214554', '陈影');
INSERT INTO `person` VALUES (35, 0, 17, '2016214555', '崔可心');
INSERT INTO `person` VALUES (36, 0, 17, '2016214536', '丁凯');
INSERT INTO `person` VALUES (37, 0, 17, '2016214091', '甘东英');
INSERT INTO `person` VALUES (38, 0, 17, '2016214537', '高航');
INSERT INTO `person` VALUES (39, 0, 17, '2016214541', '韩庆龙');
INSERT INTO `person` VALUES (40, 0, 17, '2016214538', '黄璞');
INSERT INTO `person` VALUES (41, 0, 17, '2016214539', '李梦瑶');
INSERT INTO `person` VALUES (42, 0, 17, '2016214086', '李莎');
INSERT INTO `person` VALUES (43, 0, 17, '2016214556', '李愚');
INSERT INTO `person` VALUES (44, 0, 17, '2016214544', '王传硕');
INSERT INTO `person` VALUES (45, 0, 17, '2016214543', '任亮');
INSERT INTO `person` VALUES (46, 0, 17, '2016214060', '沈伟伟');
INSERT INTO `person` VALUES (47, 0, 17, '2016214092', '沈允');
INSERT INTO `person` VALUES (48, 0, 17, '2016214076', '苏越');
INSERT INTO `person` VALUES (49, 0, 17, '2016214557', '万洋洋');
INSERT INTO `person` VALUES (50, 0, 17, '2016214558', '王茀玺');
INSERT INTO `person` VALUES (51, 0, 17, '2016214057', '王君傲');
INSERT INTO `person` VALUES (52, 0, 17, '2016214093', '吴停');
INSERT INTO `person` VALUES (53, 0, 17, '2016214096', '夏子杰');
INSERT INTO `person` VALUES (54, 0, 17, '2015214064', '许洁');
INSERT INTO `person` VALUES (55, 0, 17, '2016214063', '张若晨');
INSERT INTO `person` VALUES (56, 0, 17, '2016214065', '赵云鹏');
INSERT INTO `person` VALUES (57, 0, 17, '2016214560', '周艳红');
INSERT INTO `person` VALUES (58, 0, 17, '2017214552', '邓坤');
INSERT INTO `person` VALUES (59, 0, 17, '2017214564', '高晶晶');
INSERT INTO `person` VALUES (60, 0, 17, '2017214553', '高振宇');
INSERT INTO `person` VALUES (61, 0, 17, '2017214565', '何卓');
INSERT INTO `person` VALUES (62, 0, 17, '2017214554', '胡杰');
INSERT INTO `person` VALUES (63, 0, 17, '2017214558', '兰文萍');
INSERT INTO `person` VALUES (64, 0, 17, '2017214584', '李根');
INSERT INTO `person` VALUES (65, 0, 17, '2017214050', '李金潮');
INSERT INTO `person` VALUES (66, 0, 17, '2017214052', '李立');
INSERT INTO `person` VALUES (67, 0, 17, '2017214555', '林聿明');
INSERT INTO `person` VALUES (68, 0, 17, '2017214053', '吕鹏飞');
INSERT INTO `person` VALUES (69, 0, 17, '2017214054', '孙小喆');
INSERT INTO `person` VALUES (70, 0, 17, '2017214081', '王振威');
INSERT INTO `person` VALUES (71, 0, 17, '2017214078', '肖亚琪');
INSERT INTO `person` VALUES (72, 0, 17, '2017214070', '谢平');
INSERT INTO `person` VALUES (73, 0, 17, '2017214082', '薛一菡');
INSERT INTO `person` VALUES (74, 0, 17, '2017214570', '杨克');
INSERT INTO `person` VALUES (75, 0, 17, '2017214566', '禹亚峰');
INSERT INTO `person` VALUES (76, 0, 17, '2017214556', '张昊');
INSERT INTO `person` VALUES (77, 0, 17, '2017214055', '张杰');
INSERT INTO `person` VALUES (78, 0, 17, '2017214557', '张蒙丽');
INSERT INTO `person` VALUES (79, 0, 17, '2017214056', '张佩颖');
INSERT INTO `person` VALUES (80, 0, 17, '2017214069', '狄国佳');
INSERT INTO `person` VALUES (81, 0, 17, '2018214052', '丁陈陈');
INSERT INTO `person` VALUES (82, 0, 17, '2018214053', '纪晨秋');
INSERT INTO `person` VALUES (83, 0, 17, '2018214054', '廖清云');
INSERT INTO `person` VALUES (84, 0, 17, '2018214055', '刘鹏');
INSERT INTO `person` VALUES (85, 0, 17, '2018214056', '刘轩章');
INSERT INTO `person` VALUES (86, 0, 17, '2018214051', '李国豪');
INSERT INTO `person` VALUES (87, 0, 17, '2018214075', '林德才');
INSERT INTO `person` VALUES (88, 0, 17, '2018214078', '葛运通');
INSERT INTO `person` VALUES (89, 0, 17, '2018214079', '杨晓鹏');
INSERT INTO `person` VALUES (90, 0, 17, '2018214544', '冯兴');
INSERT INTO `person` VALUES (91, 0, 17, '2018214545', '王昕楚');
INSERT INTO `person` VALUES (92, 0, 17, '2018214546', '王靖怡');
INSERT INTO `person` VALUES (93, 0, 17, '2018214553', '崔雪萌');
INSERT INTO `person` VALUES (94, 0, 17, '2018214554', '都兆楠');
INSERT INTO `person` VALUES (95, 0, 17, '2018214555', '谭遥');
INSERT INTO `person` VALUES (96, 0, 17, '2018214084', '周建伟');
INSERT INTO `person` VALUES (97, 0, 17, '2018214068', '刘胜男');
INSERT INTO `person` VALUES (98, 0, 17, '2018214080', '喻伟婕');
INSERT INTO `person` VALUES (99, 0, 17, '2018214081', '张璐瑶');
INSERT INTO `person` VALUES (100, 0, 13, '2014011043', '冯志强');
INSERT INTO `person` VALUES (101, 0, 13, '2015010667', '沈倩');
INSERT INTO `person` VALUES (102, 0, 13, '2015010743', '王铁淞');
INSERT INTO `person` VALUES (103, 0, 13, '2015010854', '德吉曲珍');
INSERT INTO `person` VALUES (104, 0, 13, '2015010855', '胡瑾');
INSERT INTO `person` VALUES (105, 0, 13, '2015010856', '贾羽茜');
INSERT INTO `person` VALUES (106, 0, 13, '2015010857', '康雅倩');
INSERT INTO `person` VALUES (107, 0, 13, '2015010858', '兰敏');
INSERT INTO `person` VALUES (108, 0, 13, '2015010859', '李露露');
INSERT INTO `person` VALUES (109, 0, 13, '2015010860', '李玥洁');
INSERT INTO `person` VALUES (110, 0, 13, '2015010861', '柳佳丽');
INSERT INTO `person` VALUES (111, 0, 13, '2015010862', '史安丁');
INSERT INTO `person` VALUES (112, 0, 13, '2015010863', '张怡铭');
INSERT INTO `person` VALUES (113, 0, 13, '2015010864', '艾斯卡尔·坎买尔');
INSERT INTO `person` VALUES (114, 0, 13, '2015010865', '白宗翰');
INSERT INTO `person` VALUES (115, 0, 13, '2015010866', '董佳鑫');
INSERT INTO `person` VALUES (116, 0, 13, '2015010867', '付顺康');
INSERT INTO `person` VALUES (117, 0, 13, '2015010868', '高经华');
INSERT INTO `person` VALUES (118, 0, 13, '2015010869', '顾鹏程');
INSERT INTO `person` VALUES (119, 0, 13, '2015010870', '贺国晏');
INSERT INTO `person` VALUES (120, 0, 13, '2015010871', '侯富恒');
INSERT INTO `person` VALUES (121, 0, 13, '2015010872', '姜铖');
INSERT INTO `person` VALUES (122, 0, 13, '2015010873', '李致远');
INSERT INTO `person` VALUES (123, 0, 13, '2015010875', '刘禹良');
INSERT INTO `person` VALUES (124, 0, 13, '2015010876', '骆新斗');
INSERT INTO `person` VALUES (125, 0, 13, '2015010877', '马克');
INSERT INTO `person` VALUES (126, 0, 13, '2015010878', '马有财');
INSERT INTO `person` VALUES (127, 0, 13, '2015010879', '邵文宏');
INSERT INTO `person` VALUES (128, 0, 13, '2015010880', '王饕');
INSERT INTO `person` VALUES (129, 0, 13, '2015010881', '伍彦松');
INSERT INTO `person` VALUES (130, 0, 13, '2015010882', '熊泽华');
INSERT INTO `person` VALUES (131, 0, 13, '2015010883', '严腾飞');
INSERT INTO `person` VALUES (132, 0, 13, '2015010884', '杨宏慧');
INSERT INTO `person` VALUES (133, 0, 13, '2015010885', '殷雄');
INSERT INTO `person` VALUES (134, 0, 13, '2015010886', '张猛');
INSERT INTO `person` VALUES (135, 0, 13, '2015010887', '张雄凯');
INSERT INTO `person` VALUES (136, 0, 13, '2015011149', '张悦');
INSERT INTO `person` VALUES (137, 0, 13, '2013010935', '李伟奇');
INSERT INTO `person` VALUES (138, 0, 13, '2013011552', '柴兆杰');
INSERT INTO `person` VALUES (139, 0, 13, '2015010125', '张扬');
INSERT INTO `person` VALUES (140, 0, 13, '2015010450', '焦开拓');
INSERT INTO `person` VALUES (141, 0, 13, '2015010888', '金晓琼');
INSERT INTO `person` VALUES (142, 0, 13, '2015010889', '亢燕丽');
INSERT INTO `person` VALUES (143, 0, 13, '2015010890', '刘学春');
INSERT INTO `person` VALUES (144, 0, 13, '2015010891', '么娆');
INSERT INTO `person` VALUES (145, 0, 13, '2015010892', '王玉婷');
INSERT INTO `person` VALUES (146, 0, 13, '2015010893', '王智林');
INSERT INTO `person` VALUES (147, 0, 13, '2015010894', '徐苗苗');
INSERT INTO `person` VALUES (148, 0, 13, '2015010895', '徐则林');
INSERT INTO `person` VALUES (149, 0, 13, '2015010897', '张昊月');
INSERT INTO `person` VALUES (150, 0, 13, '2015010898', '戴材炜');
INSERT INTO `person` VALUES (151, 0, 13, '2015010900', '何毅');
INSERT INTO `person` VALUES (152, 0, 13, '2015010901', '贺禹铭');
INSERT INTO `person` VALUES (153, 0, 13, '2015010902', '雷平');
INSERT INTO `person` VALUES (154, 0, 13, '2015010903', '李彦博');
INSERT INTO `person` VALUES (155, 0, 13, '2015010904', '李泽世');
INSERT INTO `person` VALUES (156, 0, 13, '2015010905', '刘琪');
INSERT INTO `person` VALUES (157, 0, 13, '2015010906', '刘万琪');
INSERT INTO `person` VALUES (158, 0, 13, '2015010907', '刘志伟');
INSERT INTO `person` VALUES (159, 0, 13, '2015010908', '石金波');
INSERT INTO `person` VALUES (160, 0, 13, '2015010909', '宋燎东');
INSERT INTO `person` VALUES (161, 0, 13, '2015010910', '隋金昊');
INSERT INTO `person` VALUES (162, 0, 13, '2015010911', '邰昊');
INSERT INTO `person` VALUES (163, 0, 13, '2015010912', '唐银宏');
INSERT INTO `person` VALUES (164, 0, 13, '2015010913', '王怡博');
INSERT INTO `person` VALUES (165, 0, 13, '2015010914', '徐帜');
INSERT INTO `person` VALUES (166, 0, 13, '2015010915', '杨起');
INSERT INTO `person` VALUES (167, 0, 13, '2015010917', '张兴强');
INSERT INTO `person` VALUES (168, 0, 13, '2015010918', '赵鹏');
INSERT INTO `person` VALUES (169, 0, 13, '2015010919', '赵伟');
INSERT INTO `person` VALUES (170, 0, 13, '2015010920', '周小龙');
INSERT INTO `person` VALUES (171, 0, 13, '2015010954', '李维嘉');
INSERT INTO `person` VALUES (172, 0, 13, '2015010956', '吴紫月');
INSERT INTO `person` VALUES (173, 0, 13, '2015011166', '肖帆');
INSERT INTO `person` VALUES (174, 0, 13, '2013010971', '宋少雄');
INSERT INTO `person` VALUES (175, 0, 13, '2014010805', '张艺馨');
INSERT INTO `person` VALUES (176, 0, 13, '2015010921', '封叶');
INSERT INTO `person` VALUES (177, 0, 13, '2015010922', '高维蔚');
INSERT INTO `person` VALUES (178, 0, 13, '2015010923', '李姗姗');
INSERT INTO `person` VALUES (179, 0, 13, '2015010924', '潘瑞雪');
INSERT INTO `person` VALUES (180, 0, 13, '2015010925', '索娜曲珍');
INSERT INTO `person` VALUES (181, 0, 13, '2015010926', '席蔺璇');
INSERT INTO `person` VALUES (182, 0, 13, '2015010927', '张琴');
INSERT INTO `person` VALUES (183, 0, 13, '2015010928', '张婉');
INSERT INTO `person` VALUES (184, 0, 13, '2015010929', '张鑫');
INSERT INTO `person` VALUES (185, 0, 13, '2015010930', '郑衣珍');
INSERT INTO `person` VALUES (186, 0, 13, '2015010931', '陈东宁');
INSERT INTO `person` VALUES (187, 0, 13, '2015010932', '陈盼杰');
INSERT INTO `person` VALUES (188, 0, 13, '2015010933', '陈枭');
INSERT INTO `person` VALUES (189, 0, 13, '2015010934', '池弘睿');
INSERT INTO `person` VALUES (190, 0, 13, '2015010935', '董高华');
INSERT INTO `person` VALUES (191, 0, 13, '2015010936', '董兆豪');
INSERT INTO `person` VALUES (192, 0, 13, '2015010937', '高毅飞');
INSERT INTO `person` VALUES (193, 0, 13, '2015010938', '何习渊');
INSERT INTO `person` VALUES (194, 0, 13, '2015010939', '李睿麟');
INSERT INTO `person` VALUES (195, 0, 13, '2015010940', '李伟浩');
INSERT INTO `person` VALUES (196, 0, 13, '2015010941', '苗泽宇');
INSERT INTO `person` VALUES (197, 0, 13, '2015010942', '宁立秋');
INSERT INTO `person` VALUES (198, 0, 13, '2015010943', '田志刚');
INSERT INTO `person` VALUES (199, 0, 13, '2015010944', '汪常翔');
INSERT INTO `person` VALUES (200, 0, 13, '2015010945', '杨浩帆');
INSERT INTO `person` VALUES (201, 0, 13, '2015010946', '张博');
INSERT INTO `person` VALUES (202, 0, 13, '2015010947', '张财铄');
INSERT INTO `person` VALUES (203, 0, 13, '2015010948', '张左旻');
INSERT INTO `person` VALUES (204, 0, 13, '2015010949', '赵凯歌');
INSERT INTO `person` VALUES (205, 0, 13, '2015010950', '赵文博');
INSERT INTO `person` VALUES (206, 0, 13, '2015010951', '郑文川');
INSERT INTO `person` VALUES (207, 0, 13, '2015010952', '周俊炜');
INSERT INTO `person` VALUES (208, 0, 13, '2015010953', '朱跃强');
INSERT INTO `person` VALUES (209, 0, 13, '2015011710', '姜源');
INSERT INTO `person` VALUES (210, 0, 13, '2015030065', '达意娜');
INSERT INTO `person` VALUES (211, 0, 13, '2015030066', '康迪');
INSERT INTO `person` VALUES (212, 0, 13, '2015030067', '梅尔兰');
INSERT INTO `person` VALUES (213, 0, 13, '2015030068', '萨纳特');
INSERT INTO `person` VALUES (214, 0, 13, '2015030069', '桑迪');
INSERT INTO `person` VALUES (215, 0, 5, '2161', '邢晓凯');
INSERT INTO `person` VALUES (216, 0, 4, '2166', '侯磊');
INSERT INTO `person` VALUES (217, 0, 5, '2005', '李兆慈');
INSERT INTO `person` VALUES (218, 0, 4, '1670', '黄启玉');
INSERT INTO `person` VALUES (219, 0, 5, '1815', '李鸿英');
INSERT INTO `person` VALUES (220, 0, 6, '2219', '阎凤元');
INSERT INTO `person` VALUES (221, 0, 5, '2157', '孙恒');
INSERT INTO `person` VALUES (222, 0, 5, '1357', '张帆');
INSERT INTO `person` VALUES (223, 0, 4, '0098', '张劲军');
INSERT INTO `person` VALUES (224, 0, 10, '1102', '吴海浩');
INSERT INTO `person` VALUES (225, 0, 4, '0093', '吴长春');
INSERT INTO `person` VALUES (226, 0, 5, '2401', '陈严飞');
INSERT INTO `person` VALUES (227, 0, 6, '2435', '韩善鹏');
INSERT INTO `person` VALUES (228, 0, 5, '2011880034', '王艺');
INSERT INTO `person` VALUES (229, 0, 5, '2013880070', '孙旭');
INSERT INTO `person` VALUES (230, 0, 5, '2014880069', '张永星');
INSERT INTO `person` VALUES (231, 0, 6, '2015880040', '刘稳文');
INSERT INTO `person` VALUES (232, 0, 6, '2016880002', '李文婧');
INSERT INTO `person` VALUES (233, 0, 6, '2016880044', '孙梦然');
INSERT INTO `person` VALUES (234, 0, 6, '2017880042', '王雨墨');
INSERT INTO `person` VALUES (235, 0, 6, '2018880019', '刘啸奔');
INSERT INTO `person` VALUES (236, 0, 6, '2018891017', '苏怀');
INSERT INTO `person` VALUES (237, 0, 17, '2015214576', '卜铎');
INSERT INTO `person` VALUES (238, 0, 17, '2017214588', '孙成威');
INSERT INTO `person` VALUES (239, 0, 17, '2018214547', '李雨');
INSERT INTO `person` VALUES (240, 0, 17, '2018214548', '王昕');
INSERT INTO `person` VALUES (241, 0, 17, '2018214549', '朱振宇');
INSERT INTO `person` VALUES (242, 0, 17, '2018214550', '单锦旭');
INSERT INTO `person` VALUES (243, 0, 17, '2018214556', '董小钰');
INSERT INTO `person` VALUES (244, 0, 17, '2018214557', '陶冰星');
INSERT INTO `person` VALUES (245, 0, 17, '2018214558', '王扬超');
INSERT INTO `person` VALUES (246, 0, 17, '2018214559', '杨哲任');
INSERT INTO `person` VALUES (247, 0, 17, '2018214560', '张静宇');
INSERT INTO `person` VALUES (248, 0, 17, '2018214564', '谭宝亮');
INSERT INTO `person` VALUES (249, 0, 17, '2018214565', '赵恭宇');
INSERT INTO `person` VALUES (250, 0, 17, '2018214566', '葛旭');
INSERT INTO `person` VALUES (251, 0, 17, '2018214567', '李栋');
INSERT INTO `person` VALUES (252, 0, 17, '2018214568', '王帅');
INSERT INTO `person` VALUES (253, 0, 17, '2018214569', '武壮');
INSERT INTO `person` VALUES (254, 0, 17, '2018214570', '朱云鹏');
INSERT INTO `person` VALUES (255, 0, 17, '2018214573', '钟思源');
INSERT INTO `person` VALUES (256, 0, 17, '2018214574', '周冰');
INSERT INTO `person` VALUES (257, 0, 17, '2018214575', '曾亚男');
INSERT INTO `person` VALUES (258, 0, 17, '2018214576', '刘壮');
INSERT INTO `person` VALUES (259, 0, 17, '2018214577', '倪平');
INSERT INTO `person` VALUES (260, 0, 17, '2018214578', '张湘玮');
INSERT INTO `person` VALUES (261, 0, 17, '2018214579', '赵留康');
INSERT INTO `person` VALUES (262, 0, 17, '2018244505', '王玮健');
INSERT INTO `person` VALUES (263, 0, 17, '2016214559', '韦宝成');
INSERT INTO `person` VALUES (264, 0, 17, '2016214080', '李蛟鸾');
INSERT INTO `person` VALUES (265, 0, 17, '2018214572', '陈汉');
INSERT INTO `person` VALUES (266, 0, 17, '2018214551', '时浩');
INSERT INTO `person` VALUES (267, 0, 17, '2017214058', '刘莹莹');

SET FOREIGN_KEY_CHECKS = 1;
