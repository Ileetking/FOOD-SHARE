/*
Navicat MySQL Data Transfer

Source Server         : hhh
Source Server Version : 60011
Source Host           : localhost:3306
Source Database       : food

Target Server Type    : MYSQL
Target Server Version : 60011
File Encoding         : 65001

Date: 2021-09-08 23:49:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for commentary
-- ----------------------------
DROP TABLE IF EXISTS `commentary`;
CREATE TABLE `commentary` (
  `cid` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `fid` bigint(20) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `FK_fid` (`fid`),
  KEY `FK_uid` (`uid`),
  CONSTRAINT `FK_fid` FOREIGN KEY (`fid`) REFERENCES `food` (`fid`),
  CONSTRAINT `FK_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `fid` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) DEFAULT NULL,
  `description` varchar(2555) DEFAULT NULL,
  `img` varchar(400) DEFAULT NULL,
  `article` longtext,
  `time` datetime DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `cid` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`fid`),
  KEY `FK_food` (`uid`),
  KEY `FK_FC` (`cid`),
  CONSTRAINT `FK_FC` FOREIGN KEY (`cid`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_food` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(12) NOT NULL,
  `password` varchar(20) NOT NULL,
  `uimage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
