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

 Date: 08/06/2019 11:13:36
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
) ENGINE = InnoDB AUTO_INCREMENT = 153 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of query_statementa
-- ----------------------------
INSERT INTO `query_statementa` VALUES (1, 1, '2019-05-21 17:18:49', NULL, 'person', b'0', b'1', 'count', '[]', 'select count(*) from Major major', '专业', NULL);
INSERT INTO `query_statementa` VALUES (2, 1, '2019-05-21 17:18:53', NULL, 'operation4Person', b'0', b'1', 'list', '[max, offset]', 'from Major major order by name', '专业', 'listMajor');
INSERT INTO `query_statementa` VALUES (3, 1, '2019-05-21 17:53:26', NULL, 'operation4Person', b'0', b'1', 'count', '[]', 'select count(*) from Major major', '专业', NULL);
INSERT INTO `query_statementa` VALUES (4, 1, '2019-05-24 10:05:21', NULL, 'operation4ThingTypeCircle', b'0', b'1', 'count', '[]', 'select count(*) from ThingTypeCircle thingTypeCircle', '人员类型', NULL);
INSERT INTO `query_statementa` VALUES (5, 2, '2019-05-24 10:05:23', NULL, 'operation4ThingTypeCircle', b'0', b'1', 'list', '[max, offset]', 'from ThingTypeCircle thingTypeCircle order by personTitle', '人员类型', 'listThingTypeCirclePersonTitle');
INSERT INTO `query_statementa` VALUES (6, 1, '2019-05-24 10:05:21', NULL, 'operation4ThingTypeCircle', b'0', b'1', 'count', '[]', 'select count(*) from ThingTypeCircle thingTypeCircle', '任务类型', NULL);
INSERT INTO `query_statementa` VALUES (7, 1, '2019-05-24 10:05:21', NULL, 'operation4ThingTypeCircle', b'0', b'1', 'list', '[max, offset]', 'from ThingTypeCircle thingTypeCircle order by thingType', '任务类型', 'listThingTypeCircle');
INSERT INTO `query_statementa` VALUES (8, 1, '2019-05-27 16:18:51', NULL, 'operation4Team', b'0', b'1', 'count', '[thingTypeList]', 'select count(*) from Thing thing where thing.thingType in :thingTypeList', '可选项目', NULL);
INSERT INTO `query_statementa` VALUES (9, 1, '2019-05-27 16:18:51', NULL, 'operation4Team', b'0', b'1', 'list', '[max, offset, thingTypeList]', 'from Thing thing where thing.thingType in :thingTypeList', '可选项目', 'listThing');
INSERT INTO `query_statementa` VALUES (10, 1, '2019-05-21 17:18:52', NULL, 'operation4Person', b'0', b'1', 'list', '[max, offset]', 'from Student student  order by personTitle, supervisor, gradeName,  major, code', '学生', 'listStudent');
INSERT INTO `query_statementa` VALUES (11, 1, '2019-05-21 17:53:26', NULL, 'operation4Person', b'0', b'1', 'count', '[]', 'select count(*) from Student student', '学生', NULL);
INSERT INTO `query_statementa` VALUES (12, 1, '2019-05-21 17:18:53', NULL, 'operation4Person', b'1', b'1', 'list', '[max, offset]', 'SELECT DISTINCT person.grade_name FROM person WHERE person.grade_name IS NOT NULL limit %d,%d', '年级', 'listGradeName');
INSERT INTO `query_statementa` VALUES (13, 1, '2019-05-21 17:53:26', NULL, 'operation4Person', b'0', b'1', 'count', '[]', 'SELECT Count(DISTINCT person.grade_name) FROM person WHERE person.grade_name IS NOT NULL', '年级', NULL);
INSERT INTO `query_statementa` VALUES (14, 1, '2019-05-19 17:19:05', NULL, 'home', b'0', b'1', 'count', '[]', 'select count(*) from Progress progress', '当前进度', NULL);
INSERT INTO `query_statementa` VALUES (15, 1, '2019-05-19 17:19:05', NULL, 'home', b'0', b'1', 'list', '[max, offset]', 'from Progress progress order by regDate desc', '当前进度', 'listProgressHome');
INSERT INTO `query_statementa` VALUES (16, 2, '2019-05-19 22:10:07', NULL, 'home', b'0', b'1', 'count', '[myself]', 'select count(*) from SystemStatus systemStatus where systemStatus.userName=:myself', '我的登录', NULL);
INSERT INTO `query_statementa` VALUES (17, 2, '2019-05-19 22:10:07', NULL, 'home', b'0', b'1', 'list', '[max, myself, offset]', 'from SystemStatus systemStatus where systemStatus.userName=:myself', '我的登录', 'listSystemStatus');
INSERT INTO `query_statementa` VALUES (20, 3, '2019-05-19 22:10:07', NULL, 'home', b'0', b'1', 'count', '[myself]', 'select count(*) from Progress progress where progress.contributor=:myself', '我的进展', NULL);
INSERT INTO `query_statementa` VALUES (21, 4, '2019-05-19 22:10:09', NULL, 'home', b'0', b'1', 'list', '[max, myself, offset]', 'from Progress progress where progress.contributor=:myself order by regDate desc', '我的进展', 'listProgressHome');
INSERT INTO `query_statementa` VALUES (24, 1, '2019-05-23 21:42:44', NULL, 'operation4Thing', b'0', b'1', 'count', '[]', 'select count(*) from Course course', '教学', NULL);
INSERT INTO `query_statementa` VALUES (25, 2, '2019-05-23 22:18:59', NULL, 'operation4Thing', b'0', b'1', 'list', '[max, offset]', 'from Course course order by name', '教学', 'listCourse');
INSERT INTO `query_statementa` VALUES (26, 1, '2019-05-21 17:18:50', NULL, 'operation4Person', b'0', b'1', 'list', '[max, offset]', 'from Teacher teacher order by name', '教师', 'listTeacher');
INSERT INTO `query_statementa` VALUES (27, 1, '2019-05-21 17:53:26', NULL, 'operation4Person', b'0', b'1', 'count', '[]', 'select count(*) from Teacher teacher', '教师', NULL);
INSERT INTO `query_statementa` VALUES (28, 1, '2019-05-19 22:42:44', NULL, 'operation4DataRootPath', b'0', b'1', 'count', '[]', 'select count(*) from DataRootPath dataRootPath', '数据根目录', NULL);
INSERT INTO `query_statementa` VALUES (29, 1, '2019-05-19 22:42:44', NULL, 'operation4DataRootPath', b'0', b'1', 'list', '[max, offset]', 'from DataRootPath dataRootPath order by keyString', '数据根目录', 'listDataRootPath');
INSERT INTO `query_statementa` VALUES (30, 1, '2019-05-19 00:00:00', NULL, 'operation4QueryStatementA', b'0', b'1', 'count', '[]', 'select count(*) from QueryStatementA queryStatementA', '查询维护', NULL);
INSERT INTO `query_statementa` VALUES (31, 1, '2019-05-19 00:00:00', NULL, 'operation4QueryStatementA', b'0', b'1', 'list', '[max, offset]', 'from QueryStatementA queryStatementA order by controllerName, actionName', '查询维护', 'listQueryStatementA');
INSERT INTO `query_statementa` VALUES (32, 1, '2019-05-19 20:25:20', NULL, 'operation4QueryStatementA', b'0', b'1', 'count', '[like]', 'select count(*) from QueryStatementA queryStatementA where queryStatementA.keyString like :like', '查询维护', NULL);
INSERT INTO `query_statementa` VALUES (33, 1, '2019-05-19 20:25:20', NULL, 'operation4QueryStatementA', b'0', b'1', 'list', '[like, max, offset]', 'from QueryStatementA queryStatementA where queryStatementA.keyString like :like order by controllerName, actionName,keyString', '查询维护', 'listQueryStatementA');
INSERT INTO `query_statementa` VALUES (34, 1, '2019-05-19 00:00:00', NULL, 'operation4QueryStatementA', b'0', b'1', 'count', '[]', 'select count(*) from QueryStatementA queryStatementA where queryStatementA.queryString=null', '查询维护待编辑', NULL);
INSERT INTO `query_statementa` VALUES (35, 2, '2019-05-19 00:00:00', NULL, 'operation4QueryStatementA', b'0', b'1', 'list', '[max, offset]', 'from QueryStatementA queryStatementA where queryStatementA.queryString=null order by updateTime desc, controllerName, actionName,keyString', '查询维护待编辑', 'listQueryStatementA');
INSERT INTO `query_statementa` VALUES (36, 1, '2019-05-20 20:20:11', NULL, 'operation4SystemUser', b'0', b'1', 'count', '[]', 'select count(*) from SystemUser systemUser', '用户维护', NULL);
INSERT INTO `query_statementa` VALUES (37, 2, '2019-05-20 20:20:12', NULL, 'operation4SystemUser', b'0', b'1', 'list', '[max, offset]', 'from SystemUser systemUser order by userName', '用户维护', 'listSystemUser');
INSERT INTO `query_statementa` VALUES (38, 1, '2019-05-20 21:33:17', NULL, 'operation4SystemUser', b'0', b'1', 'count', '[like]', 'select count(*) from SystemUser systemUser where appendAttribute like :like', '用户维护', NULL);
INSERT INTO `query_statementa` VALUES (39, 1, '2019-05-20 21:33:17', NULL, 'operation4SystemUser', b'0', b'1', 'list', '[like, max, offset]', 'from SystemUser systemuser where appendAttribute like :like', '用户维护', 'listSystemUser');
INSERT INTO `query_statementa` VALUES (40, 2, '2019-05-19 17:19:05', NULL, 'home', b'0', b'1', 'count', '[]', 'select count(*) from SystemStatus systemStatus where systemStatus.userName is not null', '登陆情况', NULL);
INSERT INTO `query_statementa` VALUES (41, 2, '2019-05-19 17:25:06', NULL, 'home', b'0', b'1', 'list', '[max, offset]', 'from SystemStatus systemStatus  where systemStatus.userName is not null order by loginTime desc', '登陆情况', 'listSystemStatus');
INSERT INTO `query_statementa` VALUES (42, 1, '2019-05-27 16:11:20', NULL, 'operation4Team', b'0', b'1', 'count', '[currentThing, thingTypeList]', 'select count(*) from Team team where team.thing=:currentThing', '相关团队', NULL);
INSERT INTO `query_statementa` VALUES (43, 1, '2019-05-27 16:11:21', NULL, 'operation4Team', b'0', b'1', 'list', '[currentThing, max, offset, thingTypeList]', 'from Team team where team.thing=:currentThing', '相关团队', 'listTeamLeft');
INSERT INTO `query_statementa` VALUES (44, 1, '2019-05-27 16:26:59', NULL, 'operation4Team', b'0', b'1', 'count', '[currentThing]', 'select count(*) from Team team where team.thing=:currentThing', '相关团队', NULL);
INSERT INTO `query_statementa` VALUES (45, 1, '2019-05-27 16:27:00', NULL, 'operation4Team', b'0', b'1', 'list', '[currentThing, max, offset]', 'from Team team where team.thing=:currentThing', '相关团队', 'listTeamLeft');
INSERT INTO `query_statementa` VALUES (46, 1, '2019-05-23 21:42:43', NULL, 'operation4Thing', b'0', b'1', 'count', '[]', 'select count(*) from Project project', '科研', NULL);
INSERT INTO `query_statementa` VALUES (47, 1, '2019-05-23 21:42:44', NULL, 'operation4Thing', b'0', b'1', 'list', '[max, offset]', 'from Project project order by name', '科研', 'listProject');
INSERT INTO `query_statementa` VALUES (48, 1, '2019-05-23 23:08:00', NULL, 'operation4Plan', b'0', b'1', 'count', '[thingType]', 'select count(*) from Plan plan where plan.thingType.id=cast(:thingType as integer) and plan.upPlan is null', '通用计划', NULL);
INSERT INTO `query_statementa` VALUES (49, 1, '2019-05-23 23:08:00', NULL, 'operation4Plan', b'0', b'1', 'list', '[max, offset, thingType]', 'from Plan plan where plan.thingType.id=cast(:thingType as integer) and plan.upPlan is null order by updateDate desc', '通用计划', 'listPlan');
INSERT INTO `query_statementa` VALUES (50, 3, '2019-05-27 16:11:20', NULL, 'operation4Team', b'0', b'0', 'count', '[]', NULL, '队员列表', NULL);
INSERT INTO `query_statementa` VALUES (51, 4, '2019-05-27 16:11:22', NULL, 'operation4Team', b'0', b'0', 'list', '[max, offset]', NULL, '队员列表', 'listMember');
INSERT INTO `query_statementa` VALUES (52, 0, '2019-05-27 20:39:57', NULL, 'operation4Team', b'0', b'1', 'count', '[currentTeam]', NULL, '队员列表', NULL);
INSERT INTO `query_statementa` VALUES (53, 1, '2019-05-27 20:39:57', NULL, 'operation4Team', b'0', b'0', 'list', '[currentTeam, max, offset]', NULL, '队员列表', NULL);
INSERT INTO `query_statementa` VALUES (54, 0, '2019-05-27 22:37:16', NULL, 'operation4Team', b'0', b'1', 'count', '[]', NULL, '我管理的', NULL);
INSERT INTO `query_statementa` VALUES (55, 1, '2019-05-27 22:37:16', NULL, 'operation4Team', b'0', b'1', 'count', '[myself, thingTypeList]', 'select count(*) from Team team where team.leader=:myself and team.thing.thingType in :thingTypeList', '我领导的', NULL);
INSERT INTO `query_statementa` VALUES (56, 1, '2019-05-27 22:37:17', NULL, 'operation4Team', b'1', b'1', 'count', '[myself, thingTypeList]', 'SELECT count(*) FROM team_person\r\nINNER JOIN team ON team_person.team_members_id = team.id\r\nINNER JOIN thing ON team.thing_id = thing.id\r\nINNER JOIN thing_type ON thing.thing_type_id = thing_type.id\r\nWHERE team_person.person_id=myself  AND\r\nthing.thing_type_id IN (thingTypeList)', '我参与的', NULL);
INSERT INTO `query_statementa` VALUES (58, 1, '2019-05-27 22:37:19', NULL, 'operation4Team', b'0', b'1', 'list', '[max, myself, offset, thingTypeList]', 'from Team team where team.thing.thingType in :thingTypeList and team.leader=:myself', '我领导的', 'listTeamAsLeader');
INSERT INTO `query_statementa` VALUES (59, 3, '2019-05-27 22:37:20', NULL, 'operation4Team', b'1', b'1', 'list', '[max, myself, offset, thingTypeList]', 'SELECT team_person.team_members_id\r\nFROM team_person INNER JOIN team ON team_person.team_members_id = team.id \r\nINNER JOIN thing ON team.thing_id = thing.id\r\nINNER JOIN thing_type ON thing.thing_type_id = thing_type.id\r\nWHERE team_person.person_id=myself AND\r\nthing.thing_type_id IN (thingTypeList)\r\nlimit %d,%d', '我参与的', 'listTeamRightAsMember');
INSERT INTO `query_statementa` VALUES (72, 1, '2019-06-01 22:22:50', NULL, 'operation4TeamTeacherProject', b'0', b'1', 'count', '[thingTypeList]', 'select count(*) from Thing thing where thing.thingType in :thingTypeList', '可选项目', NULL);
INSERT INTO `query_statementa` VALUES (73, 1, '2019-06-01 22:22:50', NULL, 'operation4TeamTeacherProject', b'0', b'1', 'count', '[currentThing]', 'select count(*) from Team team where team.thing=:currentThing', '相关团队', NULL);
INSERT INTO `query_statementa` VALUES (74, 1, '2019-06-01 22:22:50', NULL, 'operation4TeamTeacherProject', b'0', b'1', 'count', '[myself, thingTypeList]', 'select count(*) from Team team where team.leader=:myself and team.thing.thingType in :thingTypeList', '我领导的', NULL);
INSERT INTO `query_statementa` VALUES (75, 2, '2019-06-01 22:22:51', NULL, 'operation4TeamTeacherProject', b'1', b'1', 'count', '[myself, thingTypeList]', 'SELECT count(*) FROM team_person\r\nINNER JOIN team ON team_person.team_members_id = team.id\r\nINNER JOIN thing ON team.thing_id = thing.id\r\nINNER JOIN thing_type ON thing.thing_type_id = thing_type.id\r\nWHERE team_person.person_id=myself  AND\r\nthing.thing_type_id IN (thingTypeList)', '我参与的', NULL);
INSERT INTO `query_statementa` VALUES (76, 2, '2019-06-01 22:22:51', NULL, 'operation4TeamTeacherProject', b'1', b'1', 'list', '[max, myself, offset, thingTypeList]', 'SELECT team_person.team_members_id\r\nFROM team_person INNER JOIN team ON team_person.team_members_id = team.id \r\nINNER JOIN thing ON team.thing_id = thing.id\r\nINNER JOIN thing_type ON thing.thing_type_id = thing_type.id\r\nWHERE team_person.person_id=myself AND\r\nthing.thing_type_id IN (thingTypeList)\r\nlimit %d,%d', '我参与的', 'listTeamRightAsMember');
INSERT INTO `query_statementa` VALUES (77, 3, '2019-06-01 22:22:52', NULL, 'operation4TeamTeacherProject', b'0', b'1', 'list', '[max, offset, thingTypeList]', 'from Thing thing where thing.thingType in :thingTypeList', '可选项目', 'listThingTeacherProject');
INSERT INTO `query_statementa` VALUES (78, 2, '2019-06-01 22:22:53', NULL, 'operation4TeamTeacherProject', b'0', b'1', 'list', '[currentThing, max, offset]', 'from Team team where team.thing=:currentThing', '相关团队', 'listTeamLeft');
INSERT INTO `query_statementa` VALUES (79, 1, '2019-06-01 22:22:57', NULL, 'operation4TeamTeacherProject', b'0', b'1', 'list', '[max, myself, offset, thingTypeList]', 'from Team team where team.thing.thingType in :thingTypeList and team.leader=:myself', '我领导的', 'listTeamAsLeader');
INSERT INTO `query_statementa` VALUES (92, 1, '2019-06-02 18:43:13', NULL, 'operation4TeamStudentProject', b'0', b'1', 'count', '[thingTypeList]', 'select count(*) from Thing thing where thing.thingType in :thingTypeList', '可选项目', NULL);
INSERT INTO `query_statementa` VALUES (93, 2, '2019-06-02 18:43:13', NULL, 'operation4TeamStudentProject', b'0', b'1', 'list', '[max, offset, thingTypeList]', 'from Thing thing where thing.thingType in :thingTypeList', '可选项目', 'listThingLeft');
INSERT INTO `query_statementa` VALUES (100, 1, '2019-06-06 21:47:01', NULL, 'operation4Routine', b'0', b'1', 'count', '[myself]', 'select count(*) from Progress progress where progress.contributor=:myself', '我的进展', NULL);
INSERT INTO `query_statementa` VALUES (101, 1, '2019-06-06 21:47:01', NULL, 'operation4Routine', b'0', b'1', 'list', '[max, myself, offset]', 'from Progress progress where progress.contributor=:myself order by regDate desc', '我的进展', 'listProgress');
INSERT INTO `query_statementa` VALUES (108, 4, '2019-06-06 21:47:05', NULL, 'operation4Routine', b'0', b'1', 'count', '[myself]', 'select count(*) from SystemStatus systemStatus where systemStatus.userName=:myself', '我的登录', NULL);
INSERT INTO `query_statementa` VALUES (109, 5, '2019-06-06 21:47:05', NULL, 'operation4Routine', b'0', b'1', 'list', '[max, myself, offset]', 'from SystemStatus systemStatus where systemStatus.userName=:myself', '我的登录', 'listSystemStatus');
INSERT INTO `query_statementa` VALUES (110, 1, '2019-06-07 08:49:38', NULL, 'operation4Routine', b'1', b'1', 'count', '[myself, thingTypeList]', 'SELECT count(*) FROM team_person\r\nINNER JOIN team ON team_person.team_members_id = team.id\r\nINNER JOIN thing ON team.thing_id = thing.id\r\nINNER JOIN thing_type ON thing.thing_type_id = thing_type.id\r\nWHERE team_person.person_id=myself  AND\r\nthing.thing_type_id IN (thingTypeList)', '我参与的', NULL);
INSERT INTO `query_statementa` VALUES (111, 1, '2019-06-07 08:49:39', NULL, 'operation4Routine', b'1', b'1', 'list', '[max, myself, offset, thingTypeList]', 'SELECT team_person.team_members_id\r\nFROM team_person INNER JOIN team ON team_person.team_members_id = team.id \r\nINNER JOIN thing ON team.thing_id = thing.id\r\nINNER JOIN thing_type ON thing.thing_type_id = thing_type.id\r\nWHERE team_person.person_id=myself AND\r\nthing.thing_type_id IN (thingTypeList)\r\nlimit %d,%d', '我参与的', 'listTeamRightAsMember');
INSERT INTO `query_statementa` VALUES (112, 2, '2019-06-07 08:49:41', NULL, 'operation4Routine', b'0', b'1', 'count', '[myself, thingTypeList]', 'select count(*) from Team team where team.leader=:myself  and team.thing.thingType in :thingTypeList', '我的项目', NULL);
INSERT INTO `query_statementa` VALUES (113, 2, '2019-06-07 08:49:41', NULL, 'operation4Routine', b'0', b'1', 'list', '[max, myself, offset, thingTypeList]', 'from Team team where team.leader=:myself and team.thing.thingType in :thingTypeList\r\norder by team.thing.startDate desc', '我的项目', 'listTeamAsLeader');
INSERT INTO `query_statementa` VALUES (114, 1, '2019-06-07 08:53:57', NULL, 'operation4Routine', b'0', b'1', 'count', '[myself, thingTypeList]', 'select count(*) from Team team where team.leader=:myself  and team.thing.thingType in :thingTypeList', '我的课程', NULL);
INSERT INTO `query_statementa` VALUES (115, 1, '2019-06-07 08:53:58', NULL, 'operation4Routine', b'0', b'1', 'list', '[max, myself, offset, thingTypeList]', 'from Team team where team.leader=:myself and team.thing.thingType in :thingTypeList\r\norder by team.thing.startDate desc', '我的课程', 'listTeamAsLeader');
INSERT INTO `query_statementa` VALUES (116, 0, '2019-06-07 09:43:48', NULL, 'home', b'0', b'1', 'count', '[]', NULL, '登录情况', NULL);
INSERT INTO `query_statementa` VALUES (117, 0, '2019-06-07 09:43:48', NULL, 'home', b'0', b'1', 'list', '[max, offset]', NULL, '登录情况', NULL);
INSERT INTO `query_statementa` VALUES (130, 2, '2019-06-07 11:35:18', NULL, 'operation4Routine', b'0', b'1', 'count', '[myself, thingTypeList]', 'select count(*) from Progress progress \r\nwhere progress.team.leader=:myself  \r\nand progress.team.thing.thingType in :thingTypeList', '领导的项目', NULL);
INSERT INTO `query_statementa` VALUES (131, 3, '2019-06-07 11:35:18', NULL, 'operation4Routine', b'0', b'1', 'list', '[max, myself, offset, thingTypeList]', 'from Progress progress \r\nwhere progress.team.leader=:myself  \r\nand progress.team.thing.thingType in :thingTypeList\r\norder by progress.regDate desc,\r\nprogress.contributor', '领导的项目', 'listProgressAsLeader4Teacher');
INSERT INTO `query_statementa` VALUES (132, 6, '2019-06-07 11:41:32', NULL, 'operation4Routine', b'0', b'1', 'count', '[myself, thingTypeList]', 'select count(*) from Progress progress\r\nwhere \r\n:myself in (progress.team.members)\r\nand\r\nprogress.team.thing.thingType in (:thingTypeList)', '参与的项目', NULL);
INSERT INTO `query_statementa` VALUES (133, 7, '2019-06-07 11:41:32', NULL, 'operation4Routine', b'1', b'1', 'list', '[max, myself, offset, thingTypeList]', 'from Progress progress\r\nwhere \r\n:myself in (progress.team.members)\r\nand\r\nprogress.team.thing.thingType in (:thingTypeList)', '参与的项目', 'listProgressAsMember');
INSERT INTO `query_statementa` VALUES (134, 1, '2019-06-07 11:45:22', NULL, 'operation4Routine', b'0', b'1', 'count', '[myself, thingTypeList]', 'select count(*) from Team team where team.leader=:myself  and team.thing.thingType in :thingTypeList', '带队的课程', NULL);
INSERT INTO `query_statementa` VALUES (135, 1, '2019-06-07 11:45:22', NULL, 'operation4Routine', b'0', b'1', 'list', '[max, myself, offset, thingTypeList]', 'from Team team where team.leader=:myself and team.thing.thingType in :thingTypeList\r\norder by team.thing.startDate desc', '带队的课程', 'listTeamAsLeader');
INSERT INTO `query_statementa` VALUES (136, 1, '2019-06-07 11:45:23', NULL, 'operation4Routine', b'1', b'1', 'count', '[myself, thingTypeList]', 'SELECT count(*) FROM team_person\r\nINNER JOIN team ON team_person.team_members_id = team.id\r\nINNER JOIN thing ON team.thing_id = thing.id\r\nINNER JOIN thing_type ON thing.thing_type_id = thing_type.id\r\nWHERE team_person.person_id=myself  AND\r\nthing.thing_type_id IN (thingTypeList)', '参与的课程', NULL);
INSERT INTO `query_statementa` VALUES (137, 1, '2019-06-07 11:45:23', NULL, 'operation4Routine', b'1', b'1', 'list', '[max, myself, offset, thingTypeList]', 'SELECT team_person.team_members_id\r\nFROM team_person INNER JOIN team ON team_person.team_members_id = team.id \r\nINNER JOIN thing ON team.thing_id = thing.id\r\nINNER JOIN thing_type ON thing.thing_type_id = thing_type.id\r\nWHERE team_person.person_id=myself AND\r\nthing.thing_type_id IN (thingTypeList)\r\nlimit %d,%d', '参与的课程', 'listTeamRightAsMember');
INSERT INTO `query_statementa` VALUES (139, 1, '2019-06-07 16:10:06', NULL, 'operation4Thing', b'0', b'1', 'count', '[]', 'select count(*) from Thing thing', '项目维护', NULL);
INSERT INTO `query_statementa` VALUES (140, 1, '2019-06-07 16:17:44', NULL, 'operation4Thing', b'0', b'1', 'list', '[max, offset]', 'from Thing thing order by thing.thingType, thing.sponsor, thing.startDate desc', '项目维护', 'listThing');
INSERT INTO `query_statementa` VALUES (141, 1, '2019-06-07 16:27:59', NULL, 'operation4Thing', b'0', b'1', 'count', '[]', 'select count(*) from Project project', '科研项目', NULL);
INSERT INTO `query_statementa` VALUES (142, 1, '2019-06-07 16:27:59', NULL, 'operation4Thing', b'0', b'1', 'list', '[max, offset]', 'from Project project  order by project.thingType, project.sponsor, project.startDate desc', '科研项目', 'listProject');
INSERT INTO `query_statementa` VALUES (143, 1, '2019-06-07 16:28:01', NULL, 'operation4Thing', b'0', b'1', 'count', '[]', 'select count(*) from Course course', '教学任务', NULL);
INSERT INTO `query_statementa` VALUES (144, 1, '2019-06-07 16:28:01', NULL, 'operation4Thing', b'0', b'1', 'list', '[max, offset]', 'from Course course order by course.thingType, course.sponsor, course.startDate desc', '教学任务', 'listCourse');
INSERT INTO `query_statementa` VALUES (145, 1, '2019-06-07 19:52:32', NULL, 'operation4Team', b'0', b'1', 'count', '[]', 'select count(*) from Team team', '团队维护', NULL);
INSERT INTO `query_statementa` VALUES (146, 1, '2019-06-07 19:52:32', NULL, 'operation4Team', b'0', b'1', 'list', '[max, offset]', 'from Team team order by team.thing.thingType, team.thing, team.leader, thing.startDate desc', '团队维护', 'listTeam');
INSERT INTO `query_statementa` VALUES (147, 1, '2019-06-07 21:21:30', NULL, 'operation4ProjectPlan', b'0', b'1', 'count', '[]', 'select count(*) from ProjectPlan projectPlan', '团队计划维护', NULL);
INSERT INTO `query_statementa` VALUES (148, 2, '2019-06-07 21:21:30', NULL, 'operation4ProjectPlan', b'0', b'1', 'list', '[max, offset]', 'from ProjectPlan projectPlan\r\norder by team, upProjectPlan, serialNumber', '团队计划维护', 'listProjectPlan');
INSERT INTO `query_statementa` VALUES (149, 0, '2019-06-08 09:48:23', NULL, 'operation4Routine', b'0', b'1', 'count', '[myself]', NULL, '本周进展统计', NULL);
INSERT INTO `query_statementa` VALUES (150, 0, '2019-06-08 09:48:24', NULL, 'operation4Routine', b'0', b'1', 'list', '[max, myself, offset]', NULL, '本周进展统计', NULL);
INSERT INTO `query_statementa` VALUES (151, 0, '2019-06-08 09:48:24', NULL, 'operation4Routine', b'0', b'1', 'count', '[myself]', NULL, '进展统计', NULL);
INSERT INTO `query_statementa` VALUES (152, 0, '2019-06-08 09:48:24', NULL, 'operation4Routine', b'0', b'1', 'list', '[max, myself, offset]', NULL, '进展统计', NULL);

SET FOREIGN_KEY_CHECKS = 1;
