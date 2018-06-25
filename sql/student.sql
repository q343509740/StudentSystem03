/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50560
 Source Host           : localhost:3306
 Source Schema         : student

 Target Server Type    : MySQL
 Target Server Version : 50560
 File Encoding         : 65001

 Date: 24/06/2018 23:49:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) NOT NULL,
  `stu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stu_age` int(11) NOT NULL,
  `stu_major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `stu_id`(`stu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (6, 2, 'Ray12', 23, 'Java12');
INSERT INTO `student` VALUES (7, 13, 'Ray13', 24, 'Java13');
INSERT INTO `student` VALUES (8, 14, 'Ray14', 25, 'Java14');
INSERT INTO `student` VALUES (9, 15, 'Ray15', 26, 'Java15');
INSERT INTO `student` VALUES (10, 16, 'Ray16', 27, 'Java16');
INSERT INTO `student` VALUES (11, 17, 'Ray17', 28, 'Java17');
INSERT INTO `student` VALUES (12, 18, 'Ray18', 29, 'Java18');
INSERT INTO `student` VALUES (13, 19, 'Ray19', 30, 'Java19');
INSERT INTO `student` VALUES (14, 20, 'Ray20', 31, 'Java20');
INSERT INTO `student` VALUES (15, 21, 'Ray21', 32, 'Java21');
INSERT INTO `student` VALUES (16, 22, 'Ray22', 33, 'Java22');
INSERT INTO `student` VALUES (17, 23, 'Ray23', 34, 'Java23');
INSERT INTO `student` VALUES (18, 24, 'Ray24', 35, 'Java24');
INSERT INTO `student` VALUES (19, 25, 'Ray25', 36, 'Java25');
INSERT INTO `student` VALUES (20, 26, 'Ray26', 37, 'Java26');
INSERT INTO `student` VALUES (21, 27, 'Ray27', 38, 'Java27');
INSERT INTO `student` VALUES (22, 28, 'Ray28', 39, 'Java28');
INSERT INTO `student` VALUES (23, 29, 'Ray29', 40, 'Java29');
INSERT INTO `student` VALUES (24, 30, 'Ray30', 41, 'Java30');
INSERT INTO `student` VALUES (25, 31, 'Ray31', 42, 'Java31');
INSERT INTO `student` VALUES (26, 32, 'Ray32', 43, 'Java32');
INSERT INTO `student` VALUES (27, 33, 'Ray33', 44, 'Java33');
INSERT INTO `student` VALUES (28, 34, 'Ray34', 45, 'Java34');
INSERT INTO `student` VALUES (29, 35, 'Ray35', 46, 'Java35');
INSERT INTO `student` VALUES (30, 36, 'Ray36', 47, 'Java36');
INSERT INTO `student` VALUES (31, 37, 'Ray37', 48, 'Java37');
INSERT INTO `student` VALUES (32, 38, 'Ray38', 49, 'Java38');
INSERT INTO `student` VALUES (33, 39, 'Ray39', 50, 'Java39');
INSERT INTO `student` VALUES (34, 40, 'Ray40', 51, 'Java40');
INSERT INTO `student` VALUES (35, 41, 'Ray41', 52, 'Java41');
INSERT INTO `student` VALUES (36, 42, 'Ray42', 53, 'Java42');
INSERT INTO `student` VALUES (37, 43, 'Ray43', 54, 'Java43');
INSERT INTO `student` VALUES (38, 44, 'Ray44', 55, 'Java44');
INSERT INTO `student` VALUES (39, 45, 'Ray45', 56, 'Java45');
INSERT INTO `student` VALUES (40, 46, 'Ray46', 57, 'Java46');
INSERT INTO `student` VALUES (41, 47, 'Ray47', 58, 'Java47');
INSERT INTO `student` VALUES (42, 48, 'Ray48', 59, 'Java48');
INSERT INTO `student` VALUES (43, 49, 'Ray49', 60, 'Java49');
INSERT INTO `student` VALUES (45, 50, '阿斯顿', 17, 'JavaEE中文');
INSERT INTO `student` VALUES (47, 111, '111', 111, '111');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123');
INSERT INTO `user` VALUES (2, 'Chen', '123');
INSERT INTO `user` VALUES (3, 'Ray', '123');

SET FOREIGN_KEY_CHECKS = 1;
