/*
Navicat MySQL Data Transfer

Source Server         : graduationDesign
Source Server Version : 50548
Source Host           : localhost:3306
Source Database       : journal

Target Server Type    : MYSQL
Target Server Version : 50548
File Encoding         : 65001

Date: 2016-12-05 16:40:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for joss_user
-- ----------------------------
DROP TABLE IF EXISTS `joss_user`;
CREATE TABLE `joss_user` (
  `user_id` varchar(8) NOT NULL,
  `user_loginname` varchar(16) NOT NULL,
  `user_passwd` varchar(32) NOT NULL,
  `user_realname` varchar(16) DEFAULT NULL,
  `user_penname` varchar(16) DEFAULT NULL,
  `user_sex` int(1) DEFAULT NULL,
  `user_birth` date DEFAULT NULL,
  `user_phone` varchar(11) DEFAULT NULL,
  `user_address` varchar(128) DEFAULT NULL,
  `user_email` varchar(32) DEFAULT NULL,
  `user_remark` varchar(100) DEFAULT NULL,
  `user_roll` int(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
