/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : lab_manager

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 05/07/2024 18:10:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色标识',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '123456', '管理员', 'http://localhost:9090/files/1720173264374-logo.jpg', 'ADMIN', '13677889922', 'admin@xm.com');
INSERT INTO `admin` VALUES (2, 'Labadmin', '123456', '朱老师', 'http://localhost:9090/files/1715300147308-猫猫.jpg', 'ADMIN', '18770946197', '2174779267@qq.com');
INSERT INTO `admin` VALUES (3, 'Adminn', '123456', '管理员', 'http://localhost:9090/files/1715300253193-猫猫.jpg', 'ADMIN', '13677889922', '2174779267@qq.com');

-- ----------------------------
-- Table structure for checks
-- ----------------------------
DROP TABLE IF EXISTS `checks`;
CREATE TABLE `checks`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '检修人',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '检修说明',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '检修时间',
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '检修单位',
  `lab_id` int(0) NULL DEFAULT NULL COMMENT '实验室ID',
  `fix_id` int(0) NULL DEFAULT NULL COMMENT '报修ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '检修记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of checks
-- ----------------------------
INSERT INTO `checks` VALUES (4, '李师傅', '18877776666', '11', '2024-02-12 16:31:22', '111', 9, 1);
INSERT INTO `checks` VALUES (5, '张师傅', '18899990000', '22222', '2024-02-12 16:32:10', '66666', 6, 2);
INSERT INTO `checks` VALUES (6, '王师傅', '15279698573', '会议室观察仪器摔坏了', '2024-04-08 10:00:00', '会议室检修中心', 9, 3);
INSERT INTO `checks` VALUES (7, 'dada', '152', '125', '2024-04-15 14:00:00', '', 7, 4);
INSERT INTO `checks` VALUES (8, NULL, NULL, NULL, NULL, NULL, 9, 6);
INSERT INTO `checks` VALUES (9, '王老', '18707946126', '会议室桌子坏了', '2024-04-01 00:00:00', '会议室修理中心', 6, 5);
INSERT INTO `checks` VALUES (10, '王师傅', '18707946126', '会议室桌子坏了', '2024-05-07 15:00:00', '会议室修理中心', 6, 7);

-- ----------------------------
-- Table structure for fix
-- ----------------------------
DROP TABLE IF EXISTS `fix`;
CREATE TABLE `fix`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '报修说明',
  `student_id` int(0) NULL DEFAULT NULL COMMENT '学生ID',
  `lab_id` int(0) NULL DEFAULT NULL COMMENT '实验室ID',
  `type_id` int(0) NULL DEFAULT NULL COMMENT '实验室分类ID',
  `labadmin_id` int(0) NULL DEFAULT NULL COMMENT '实验室管理员ID',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '处理状态',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '保修时间',
  `fixtime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '处理时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '报修信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fix
-- ----------------------------
INSERT INTO `fix` VALUES (1, '会议室里面的桌子腿坏了，麻烦修一下', 1, 9, 2, 2, '已处理', '2024-02-12 15:18:42', '2024-02-12 16:31:26');
INSERT INTO `fix` VALUES (2, '会议室有个花盆打碎了', 2, 6, 3, 3, '已处理', '2024-02-12 15:30:18', '2024-02-12 16:32:16');
INSERT INTO `fix` VALUES (3, '会议室观察仪器摔坏了', 5, 9, 2, 2, '已处理', '2024-04-06 10:34:31', '2024-04-06 10:36:33');
INSERT INTO `fix` VALUES (4, '会议室的洗手台漏水', 1, 7, 2, 2, '已处理', '2024-04-06 15:34:15', '2024-04-06 20:33:16');
INSERT INTO `fix` VALUES (5, 'jhvjhh', 5, 6, 3, 3, '已处理', '2024-04-06 20:34:02', '2024-04-20 20:59:03');
INSERT INTO `fix` VALUES (6, 'vghhjvv', 5, 9, 2, 2, '已处理', '2024-04-06 20:34:07', '2024-04-06 20:34:26');
INSERT INTO `fix` VALUES (7, '三张桌子腿坏了', 5, 6, 3, 3, '已处理', '2024-05-05 15:26:40', '2024-05-05 15:32:37');
INSERT INTO `fix` VALUES (8, '会议室的灯管坏了', 5, 6, 3, 3, '待处理', '2024-05-05 15:34:10', NULL);

-- ----------------------------
-- Table structure for lab
-- ----------------------------
DROP TABLE IF EXISTS `lab`;
CREATE TABLE `lab`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '实验室编号',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '实验室介绍',
  `start` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '开始时间',
  `end` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '闭门时间',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '使用状态',
  `type_id` int(0) NULL DEFAULT NULL COMMENT '实验室分类ID',
  `labadmin_id` int(0) NULL DEFAULT NULL COMMENT '实验室管理员ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '实验室信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lab
-- ----------------------------
INSERT INTO `lab` VALUES (1, 'J-001', '行政会议室', '09:00:00', '12:00:00', '空闲中', 1, 1);
INSERT INTO `lab` VALUES (2, 'J-002', '学术会议室', '13:00:00', '15:00:00', '空闲中', 1, 1);
INSERT INTO `lab` VALUES (3, 'J-003', '学生活动室', '15:00:00', '18:00:00', '空闲中', 1, 1);
INSERT INTO `lab` VALUES (4, 'H-001', '多功能会议室', '09:00:00', '12:00:00', '使用中', 3, 3);
INSERT INTO `lab` VALUES (5, 'H-002', '计算机会议室', '13:00:00', '15:00:00', '空闲中', 3, 3);
INSERT INTO `lab` VALUES (6, 'H-003', '电影院', '15:00:00', '18:00:00', '空闲中', 3, 3);
INSERT INTO `lab` VALUES (7, 'W-001', '物理力学实验室', '09:00:00', '11:00:00', '使用中', 2, 2);
INSERT INTO `lab` VALUES (8, 'W-002', '物理电磁实验室', '13:00:00', '15:00:00', '使用中', 2, 2);
INSERT INTO `lab` VALUES (9, 'W-003', '物理课程实验室', '09:00:00', '12:00:00', '使用中', 2, 2);

-- ----------------------------
-- Table structure for labadmin
-- ----------------------------
DROP TABLE IF EXISTS `labadmin`;
CREATE TABLE `labadmin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '实验室管理员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of labadmin
-- ----------------------------
INSERT INTO `labadmin` VALUES (1, 'teacher', '123456', '张老师', 'http://localhost:9090/files/1702022157873-拉布拉多.jpeg', 'LABADMIN', '18899990001', 'zhang@xm.com');
INSERT INTO `labadmin` VALUES (2, 'zhao', '123456', '赵老师', 'http://localhost:9090/files/1702022246155-柴犬.jpeg', 'LABADMIN', '18877778888', 'zhao@xm.com');
INSERT INTO `labadmin` VALUES (3, 'li', '123456', '李老师', 'http://localhost:9090/files/1702022285386-柯基.jpeg', 'LABADMIN', '18800006666', 'li@xm.com');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建时间',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '公告信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (8, '张老师', '1', '2024-04-06', 'admin');
INSERT INTO `notice` VALUES (9, '1', '张', '2024-04-06', 'admin');
INSERT INTO `notice` VALUES (10, '2', '里', '2024-04-06', 'admin');
INSERT INTO `notice` VALUES (11, '今天星期六', '加油', '2024-04-20', 'admin');

-- ----------------------------
-- Table structure for reserve
-- ----------------------------
DROP TABLE IF EXISTS `reserve`;
CREATE TABLE `reserve`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `lab_id` int(0) NULL DEFAULT NULL COMMENT '实验室ID',
  `labadmin_id` int(0) NULL DEFAULT NULL COMMENT '实验室管理员ID',
  `student_id` int(0) NULL DEFAULT NULL COMMENT '学生ID',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作时间',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '预约状态',
  `dostatus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '使用状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '预约信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of reserve
-- ----------------------------
INSERT INTO `reserve` VALUES (3, 9, 2, 1, '2024-02-11 17:54:48', '审核不通过', '审核不通过');
INSERT INTO `reserve` VALUES (4, 9, 2, 1, '2024-02-11 18:13:14', '审核通过', '已结束');
INSERT INTO `reserve` VALUES (5, 6, 3, 2, '2024-02-12 15:29:18', '审核通过', '已结束');
INSERT INTO `reserve` VALUES (7, 8, 2, 1, '2024-02-12 17:40:06', '审核通过', '已结束');
INSERT INTO `reserve` VALUES (9, 9, 2, 5, '2024-04-05 17:46:28', '审核通过', '已结束');
INSERT INTO `reserve` VALUES (10, 4, 3, 5, '2024-04-06 10:28:37', '审核不通过', '审核不通过');
INSERT INTO `reserve` VALUES (11, 8, 2, 1, '2024-04-06 10:38:02', '审核通过', '使用中');
INSERT INTO `reserve` VALUES (12, 9, 2, 1, '2024-04-06 13:17:40', '审核通过', '已结束');
INSERT INTO `reserve` VALUES (13, 7, 2, 1, '2024-04-06 13:17:59', '审核通过', '已结束');
INSERT INTO `reserve` VALUES (14, 7, 2, 1, '2024-04-06 15:31:01', '审核通过', '已结束');
INSERT INTO `reserve` VALUES (15, 9, 2, 5, '2024-04-06 20:21:25', '审核通过', '已结束');
INSERT INTO `reserve` VALUES (16, 6, 3, 5, '2024-04-06 20:21:31', '审核通过', '已结束');
INSERT INTO `reserve` VALUES (17, 9, 2, 5, '2024-04-06 20:25:11', '审核不通过', '审核不通过');
INSERT INTO `reserve` VALUES (18, 9, 2, 5, '2024-04-20 20:59:54', '审核通过', '使用中');
INSERT INTO `reserve` VALUES (19, 7, 2, 1, '2024-07-05 17:40:26', '待审核', '待审核');
INSERT INTO `reserve` VALUES (20, 4, 3, 1, '2024-07-05 17:40:37', '审核通过', '使用中');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '学生信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, 'student', '123456', '张三', 'http://localhost:9090/files/1720149224443-logo.jpg', 'STUDENT', '18899998889', 'zhangsan@xm.com');
INSERT INTO `student` VALUES (2, 'lisi', '123456', '李四', 'http://localhost:9090/files/1702024170078-拉布拉多.jpeg', 'STUDENT', '18899997777', 'lisi@xm.com');
INSERT INTO `student` VALUES (3, 'wangwu', '123456', '王五', 'http://localhost:9090/files/1702024192989-柯基.jpeg', 'STUDENT', '18822223333', 'wangwu@xm.com');
INSERT INTO `student` VALUES (4, 'zhaoliu', '123456', 'zhaoliu', NULL, 'STUDENT', NULL, NULL);
INSERT INTO `student` VALUES (5, 'bear', '123456', 'bear', 'http://localhost:9090/files/1712407870896-猪猪.jpg', 'STUDENT', '1336666666', '123');
INSERT INTO `student` VALUES (8, 'daad', '123456', '哒哒', 'http://localhost:9090/files/1712392290875-猫猫.jpg', 'STUDENT', '1336666888', '2635783267@qq.com');
INSERT INTO `student` VALUES (9, '12', '123', '12', NULL, 'STUDENT', NULL, NULL);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类名称',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类描述',
  `labadmin_id` int(0) NULL DEFAULT NULL COMMENT '实验室管理员ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '实验室分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '中空型会议室', '小型会议室', 1);
INSERT INTO `type` VALUES (2, '剧院式会议室', '表演用的会议室', 2);
INSERT INTO `type` VALUES (3, '科学会议室', '这是科学拓展的会议室', 3);
INSERT INTO `type` VALUES (4, '教室型会议室', '上课用的', 1);

SET FOREIGN_KEY_CHECKS = 1;
