/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : hrm10

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2020-11-16 20:12:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for attendance
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `employee_number` int(10) DEFAULT NULL,
  `day` date DEFAULT NULL,
  `time_type` enum('上午','下午','加班') DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `start_type` enum('正常','迟到','未签到') DEFAULT '未签到',
  `end_time` time DEFAULT NULL,
  `end_type` enum('正常','早退','未签到') DEFAULT '未签到',
  `work_type` enum('上班','请假') DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attendance
-- ----------------------------
INSERT INTO `attendance` VALUES ('20', '1001', '2020-11-09', '加班', '20:32:27', '迟到', '20:32:28', '早退', null, null);
INSERT INTO `attendance` VALUES ('21', '1004', '2020-11-09', '加班', '20:36:29', '迟到', '20:36:30', '早退', null, null);
INSERT INTO `attendance` VALUES ('22', '1001', '2020-11-15', '下午', '16:37:34', '迟到', '16:37:35', '早退', null, null);
INSERT INTO `attendance` VALUES ('23', '1006', '2020-11-15', '下午', '16:47:21', '迟到', '16:47:24', '早退', null, null);

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `department_number` int(10) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `manager` varchar(10) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('13', '2013', '人事部', '李烨', '0923-2456123', '你猜02', '');
INSERT INTO `department` VALUES ('15', '2014', 'UI', null, '18926643688', '你猜', 'UI');
INSERT INTO `department` VALUES ('16', '2015', '前端', null, '18926643687', '你猜01', '');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `employee_number` int(10) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `gender` enum('男','女') DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `telephone` varchar(15) DEFAULT '',
  `email` varchar(30) DEFAULT '',
  `address` varchar(50) DEFAULT NULL,
  `photo` varchar(50) DEFAULT '',
  `education` varchar(20) DEFAULT '',
  `department_number` int(10) DEFAULT NULL,
  `position_number` int(10) DEFAULT NULL,
  `in_time` date DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `notes` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `department_number` (`department_number`),
  KEY `title_number` (`position_number`),
  KEY `employee_number` (`employee_number`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '1001', '若空', '男', '1995-10-18', '15678015439', 'test@qq.com', '上海', '', '研究生', '2013', '3009', '2020-11-09', '1001', '超级管理员');
INSERT INTO `employee` VALUES ('12', '1004', '张麻子03', '男', '2020-01-09', '18926643681', '', '', '', '', '2015', '3014', '2020-11-09', '123456', '');
INSERT INTO `employee` VALUES ('13', '1005', '张麻子04', '男', null, '', '', '', '', '', '2013', '3009', '2020-11-09', '123456', '');
INSERT INTO `employee` VALUES ('14', '1006', '胡麻子', '男', null, '', '', '', '', '', '2014', '3013', '2020-11-09', '123456', '');
INSERT INTO `employee` VALUES ('15', '1007', '尘雪', '男', null, '', '', '', '', '', '2014', '3011', '2020-11-13', '1007', '');

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `employee_number` int(10) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `gender` enum('男','女') DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `telephone` varchar(20) DEFAULT '',
  `email` varchar(30) DEFAULT '',
  `address` varchar(50) DEFAULT '',
  `photo` varchar(50) DEFAULT '',
  `education` varchar(20) DEFAULT '',
  `in_time` date DEFAULT NULL,
  `out_time` date DEFAULT NULL,
  `department_number` int(10) DEFAULT NULL,
  `position_number` int(10) DEFAULT NULL,
  `status` enum('离职','在职','退休') DEFAULT NULL,
  `home` varchar(100) DEFAULT '',
  `notes` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES ('15', '1002', '张麻子', '男', '2020-11-12', '18926643688', '', '', '', '', '2020-11-09', null, '2013', '3010', '离职', '', '');
INSERT INTO `history` VALUES ('16', '1003', '张麻子02', '男', '2016-02-09', '18926643688', '', '', '', '', '2020-11-09', '2020-11-09', '2013', '3010', '离职', '', '');
INSERT INTO `history` VALUES ('17', '1004', '张麻子03', '男', '2020-01-09', '18926643681', '', '', '', '', '2020-11-09', null, '2015', '3011', '在职', '', '');
INSERT INTO `history` VALUES ('18', '1005', '张麻子04', '男', null, '', '', '', '', '', '2020-11-09', null, '2013', '3009', '在职', '', '');
INSERT INTO `history` VALUES ('19', '1006', '胡麻子', '男', null, '', '', '', '', '', '2020-11-09', null, '2014', '3013', '在职', '', '');
INSERT INTO `history` VALUES ('20', '1007', '尘雪', '男', null, '', '', '', '', '', '2020-11-13', null, '2014', '3011', '在职', '', '');
INSERT INTO `history` VALUES ('21', '1008', '前端员工测试', '男', null, '18926443688', '', '', '', '', '2020-11-15', null, '2015', '3012', '离职', '', '');

-- ----------------------------
-- Table structure for lea
-- ----------------------------
DROP TABLE IF EXISTS `lea`;
CREATE TABLE `lea` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `employee_number` int(10) DEFAULT NULL,
  `department_number` int(10) DEFAULT NULL,
  `start_time` date DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  `days` varchar(10) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `type` enum('事假','病假') DEFAULT NULL,
  `manager` varchar(10) DEFAULT NULL,
  `status` enum('已批准','未批准') DEFAULT '未批准',
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lea
-- ----------------------------
INSERT INTO `lea` VALUES ('22', '1001', '2013', '2020-11-15', '2020-11-22', '7', 'yous', '事假', null, '已批准', null);

-- ----------------------------
-- Table structure for move
-- ----------------------------
DROP TABLE IF EXISTS `move`;
CREATE TABLE `move` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `employee_number` int(10) DEFAULT NULL,
  `before` int(10) DEFAULT NULL,
  `after` int(10) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `manager` varchar(10) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of move
-- ----------------------------

-- ----------------------------
-- Table structure for overtime
-- ----------------------------
DROP TABLE IF EXISTS `overtime`;
CREATE TABLE `overtime` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `department_number` int(10) DEFAULT NULL,
  `employee_number` int(10) DEFAULT NULL,
  `day` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of overtime
-- ----------------------------
INSERT INTO `overtime` VALUES ('14', '2013', '1001', '2020-11-09', null, null, null);
INSERT INTO `overtime` VALUES ('15', '2013', '1001', '2020-11-03', null, null, null);
INSERT INTO `overtime` VALUES ('16', '2014', '1001', '2020-11-14', null, null, null);
INSERT INTO `overtime` VALUES ('17', '2013', '1007', '2020-11-15', null, null, null);

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `position_number` int(10) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `level` enum('部门主任','部门员工','人事部主任','人事部员工') DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `position_number` (`position_number`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES ('9', '3009', '人事部主任', '人事部主任', '');
INSERT INTO `position` VALUES ('10', '3010', '人事部员工', '人事部员工', '');
INSERT INTO `position` VALUES ('12', '3011', 'UI工程师', '部门员工', '');
INSERT INTO `position` VALUES ('13', '3012', '前端工程师', '部门员工', '');
INSERT INTO `position` VALUES ('14', '3013', 'UI主任', '部门主任', '');
INSERT INTO `position` VALUES ('15', '3014', '前端主任', '部门主任', '');
INSERT INTO `position` VALUES ('16', '3015', '后端主任', '部门主任', '');

-- ----------------------------
-- Table structure for rewards_punishment
-- ----------------------------
DROP TABLE IF EXISTS `rewards_punishment`;
CREATE TABLE `rewards_punishment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `employee_number` int(10) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `money` float(8,0) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `manager` varchar(10) DEFAULT NULL,
  `notes` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_number` (`employee_number`),
  CONSTRAINT `rewards_punishment_ibfk_1` FOREIGN KEY (`employee_number`) REFERENCES `employee` (`employee_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rewards_punishment
-- ----------------------------
