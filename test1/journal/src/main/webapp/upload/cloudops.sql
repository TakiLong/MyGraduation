/*
Navicat MySQL Data Transfer

Source Server         : 192.168.0.179
Source Server Version : 50173
Source Host           : 192.168.0.179:3306
Source Database       : cloudops

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-09-13 10:02:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for application
-- ----------------------------
DROP TABLE IF EXISTS `application`;
CREATE TABLE `application` (
  `uuid` varchar(32) NOT NULL,
  `app_name` varchar(45) DEFAULT NULL,
  `app_desc` varchar(255) DEFAULT NULL,
  `app_cpu` int(11) DEFAULT NULL,
  `app_mem` int(11) DEFAULT NULL,
  `add_disk` int(11) DEFAULT NULL,
  `app_disk` int(11) DEFAULT NULL,
  `app_ipaddr` varchar(45) DEFAULT NULL,
  `app_status_uuid` varchar(32) DEFAULT NULL COMMENT '应用运行状态\n0表示停止\n1表示运行\n2表示挂起\n3表示创建中',
  `app_project_uuid` varchar(32) DEFAULT NULL,
  `app_source_uuid` varchar(32) DEFAULT NULL,
  `app_config_uuid` varchar(32) DEFAULT NULL,
  `os_template_type_uuid` varchar(32) DEFAULT NULL,
  `task_uuid` varchar(32) DEFAULT NULL,
  `user_uuid` varchar(32) DEFAULT NULL,
  `hostname` varchar(45) DEFAULT NULL,
  `expire_date` date DEFAULT NULL COMMENT '到期时间',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  KEY `app_config_uuid_idx` (`app_config_uuid`),
  KEY `os_template_type_uuid_idx` (`os_template_type_uuid`),
  KEY `task_uuid_idx` (`task_uuid`),
  CONSTRAINT `app_config_uuid` FOREIGN KEY (`app_config_uuid`) REFERENCES `applicationconfig` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `os_template_type_uuid` FOREIGN KEY (`os_template_type_uuid`) REFERENCES `property` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of application
-- ----------------------------
INSERT INTO `application` VALUES ('52843b0c6f1540ee8638c613d5f96d3e', 'newVM120', 'test', '1', '1', '0', '6', '192.168.0.186', '72', 'a3a3433929564653959934793d113288', '333b8b97a06b434097e089810a2601fe', null, '41', '76c4aeec6a8f4510a142c97fa3e91c36', '090c6e01a3c54d768ce27fe143551f79', 'newVM120', '2016-11-30');
INSERT INTO `application` VALUES ('75b9fc79749646feaec3ee7c1b4d0f92', 'newVM161', 'test', '4', '8', '1', '6', '192.168.0.188', '71', 'a3a3433929564653959934793d113288', '333b8b97a06b434097e089810a2601fe', null, '41', '52cd7c48ae9843f19bac558d34816636', '090c6e01a3c54d768ce27fe143551f79', 'newVM161', '2016-10-27');

-- ----------------------------
-- Table structure for applicationconfig
-- ----------------------------
DROP TABLE IF EXISTS `applicationconfig`;
CREATE TABLE `applicationconfig` (
  `uuid` varchar(32) NOT NULL,
  `config_name` varchar(45) DEFAULT NULL,
  `config_cpu` int(11) DEFAULT NULL,
  `config_mem` int(11) DEFAULT NULL,
  `config_disk` int(11) DEFAULT NULL,
  `isenable` tinyint(1) DEFAULT NULL COMMENT '是否启用\n0是未启用\n1是启用\n',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of applicationconfig
-- ----------------------------
INSERT INTO `applicationconfig` VALUES ('1', '小型应用', '1', '1', '100', '0');
INSERT INTO `applicationconfig` VALUES ('2', '中型应用', '1', '2', '200', '0');
INSERT INTO `applicationconfig` VALUES ('3', '大型应用', '2', '2', '500', '0');

-- ----------------------------
-- Table structure for applicationmodules
-- ----------------------------
DROP TABLE IF EXISTS `applicationmodules`;
CREATE TABLE `applicationmodules` (
  `uuid` varchar(32) NOT NULL,
  `app_uuid` varchar(32) DEFAULT NULL,
  `module_uuid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of applicationmodules
-- ----------------------------
INSERT INTO `applicationmodules` VALUES ('018c015b861e4eeca3de9c387443a438', 'c37be0ac55d44767b3dc0dbc15e5da20', 'a48aaaba23e3455c85661c0f54514ab9');
INSERT INTO `applicationmodules` VALUES ('09fd4eadf13f4033b94adf84d0ced8b9', '没有可用的IP地址请重新创建应用', 'e12f147bb5c043718b989027af86a7f4');
INSERT INTO `applicationmodules` VALUES ('2d8a7b04de3e4764a22ee900a3287446', '75b9fc79749646feaec3ee7c1b4d0f92', 'e12f147bb5c043718b989027af86a7f4');
INSERT INTO `applicationmodules` VALUES ('351c3229ade740dd8cd8abfdbfba5776', '168ea118621f4daa808ec3fe7d2954d6', 'e12f147bb5c043718b989027af86a7f4');
INSERT INTO `applicationmodules` VALUES ('45378e2fc268441ab39ab6c7c3302608', '没有可用的IP地址请重新创建应用', 'e12f147bb5c043718b989027af86a7f4');
INSERT INTO `applicationmodules` VALUES ('509f5e06ad024c698ac1a7711fb1675d', '没有可用的IP地址请重新创建应用', 'e12f147bb5c043718b989027af86a7f4');
INSERT INTO `applicationmodules` VALUES ('5e979b8fe9394bfcb6a1181c045e5131', '52843b0c6f1540ee8638c613d5f96d3e', 'e12f147bb5c043718b989027af86a7f4');
INSERT INTO `applicationmodules` VALUES ('6edc6169b39e44d5b0d361ff10ace577', '6593a7f4406149238042aadb4b5979f0', 'e12f147bb5c043718b989027af86a7f4');
INSERT INTO `applicationmodules` VALUES ('8a80edca62c0402788f180c5a75bd7d1', '没有可用的IP地址请重新创建应用', 'e12f147bb5c043718b989027af86a7f4');
INSERT INTO `applicationmodules` VALUES ('a77573acf8084d92bf4e54e1a2adafcc', '没有可用的IP地址请重新创建应用', 'e12f147bb5c043718b989027af86a7f4');
INSERT INTO `applicationmodules` VALUES ('bf0fb71e9dd54efc9e89319050e64e30', '没有可用的IP地址请重新创建应用', 'e12f147bb5c043718b989027af86a7f4');

-- ----------------------------
-- Table structure for auditlogs
-- ----------------------------
DROP TABLE IF EXISTS `auditlogs`;
CREATE TABLE `auditlogs` (
  `uuid` varchar(32) NOT NULL,
  `log_user_uuid` varchar(32) DEFAULT NULL,
  `log_user_name_cn` varchar(45) DEFAULT NULL,
  `ipaddr` varchar(45) DEFAULT NULL,
  `operate_time` timestamp NULL DEFAULT NULL,
  `operate_detail` text,
  `operate_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auditlogs
-- ----------------------------
INSERT INTO `auditlogs` VALUES ('007e4524ca0e4624bd9186dd1effc568', '1', '系统管理员', '192.168.0.111', '2016-09-08 16:43:29', '保存报表：rrr', '报表统计');
INSERT INTO `auditlogs` VALUES ('01368f97848a4005ad64135e64fdce4c', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-07 15:34:19', '添加-标签:333,3333', '我的标签');
INSERT INTO `auditlogs` VALUES ('0139dfed047646549dc029a9820a6593', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-29 15:37:57', '修改-用户：hanyumeng', '用户管理');
INSERT INTO `auditlogs` VALUES ('01d5a6e2d73d44f699ed70175300632d', '1', '系统管理员', '192.168.0.111', '2016-08-30 16:41:07', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('01e0ad0e673441d7b84dc1351d31bc3c', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-30 16:40:58', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('01fb1451f9e24126a82a03fc42ac1f92', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-06 16:02:58', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('0251d612b6c442db80ce4bdac2a33719', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-08 16:10:23', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('028a17024d304a64af0f90242e90ec2c', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-06 11:41:50', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('0324bda7146f4d2fbc8704eb5351a89f', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-31 11:44:02', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('0325c3cd00ae4c57b22b898f114d944f', '1', '系统管理员', '192.168.0.111', '2016-08-29 11:55:16', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('03704acdf8f24ed2b082b1f742e3131d', '1', '系统管理员', '192.168.0.111', '2016-08-25 10:54:27', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('03811f3ebc6e4439adcb5c6959558e1d', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-06 16:55:19', '删除-应用：newvm27', '我的应用');
INSERT INTO `auditlogs` VALUES ('05bfcee129894a19abf66d7077f3bcae', '1', '系统管理员', '192.168.0.112', '2016-08-25 18:25:11', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('05c8baa209b740ea81bda44787812e66', '1', '系统管理员', '192.168.0.112', '2016-09-06 10:24:47', '删除-资源池：8.8新建source', '资源管理');
INSERT INTO `auditlogs` VALUES ('05e6585c98214773847265835466d191', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-06 10:24:07', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('072144cfcd5d47ba89489d656892b029', '1', '系统管理员', '192.168.0.111', '2016-08-30 18:19:44', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('072ebd5216f44a9d9a1215aeae8057a9', '1', '系统管理员', '192.168.0.111', '2016-08-26 14:45:55', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('073398a361864778a90f2dff963d606d', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.112', '2016-08-26 15:50:16', '挂起-应用：newVM161', '我的应用');
INSERT INTO `auditlogs` VALUES ('07673655ec4c4f3895354ead5e3120f4', '1', '系统管理员', '192.168.0.111', '2016-09-07 14:24:48', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('079373cd5c0a481e85d1d0bf8ca1566b', '1', '系统管理员', '192.168.0.111', '2016-08-23 15:43:50', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('0817b79754694398b3ec0f581446d782', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-25 17:24:28', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('08c59d8ae77e45888f0c2d02e3f66caa', '1', '系统管理员', '192.168.0.111', '2016-09-06 09:50:32', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('08fc17fcffa0487db2ba09ce5ad017a7', '1', '系统管理员', '192.168.0.111', '2016-09-12 16:49:58', '添加-资源池：source-2', '资源管理');
INSERT INTO `auditlogs` VALUES ('096dac7c474f4bb0be9f2523edc3d299', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-25 18:12:14', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('0a0586f4ff0847aea34e22442c130c02', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-24 15:06:14', '删除-应用：newvm3', '我的应用');
INSERT INTO `auditlogs` VALUES ('0a05ba438c37442a8fe3f4cea5987496', '1', '系统管理员', '192.168.0.111', '2016-08-25 15:00:11', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('0a4dfb92494247f090bae60ee6b5cc13', '1', '系统管理员', '192.168.0.111', '2016-08-24 15:25:28', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('0a6e15b829284bdabe741b5703e308c3', '1', '系统管理员', '192.168.0.111', '2016-08-23 15:50:17', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('0af332e80f6b499f9aa66892d4c82e23', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 12:09:19', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('0b22f910b55446f6bfce1e88f54f2843', '1', '系统管理员', '192.168.0.111', '2016-08-26 16:21:20', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('0bb49e78bc5548bf8a8315a4bc191eb1', '1', '系统管理员', '192.168.0.110', '2016-09-07 10:39:27', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('0bebb4ad0f6543daaa6446ef35ea3eaa', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-24 18:06:39', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('0c29214e5c0648d49043cc8650f6d979', '1', '系统管理员', '192.168.0.112', '2016-08-24 18:17:49', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('0d0174d750284bcb8614d0f0522e8303', '1', '系统管理员', '192.168.0.110', '2016-08-23 15:12:14', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('0df9c9b1a1434e2ba5bcc93d3bdfdae5', '1', '系统管理员', '192.168.0.110', '2016-08-25 14:54:31', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('0dfd89f0baa444d5bf07c832713486d1', '1', '系统管理员', '192.168.0.110', '2016-08-24 11:05:43', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('0e2edb1f709c4a6da112b810a26048ee', '1', '系统管理员', '192.168.0.111', '2016-09-07 17:29:38', '删除-自定义报表：save', '报表统计');
INSERT INTO `auditlogs` VALUES ('0e86fd9d8a8e4f149d5bda49712fb801', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-24 17:54:38', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('0e9180a024294a3c9fc429d07300b712', '1', '系统管理员', '192.168.0.111', '2016-09-08 16:43:39', '删除-自定义报表：Test2', '报表统计');
INSERT INTO `auditlogs` VALUES ('0ea6b7860d3a4d2daaea9f2e1ca6130d', '1', '系统管理员', '192.168.0.111', '2016-08-31 16:24:11', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('0ee1b08280f34bb3945993d7ab153543', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-08 11:46:28', '删除-应用：newvm32', '我的应用');
INSERT INTO `auditlogs` VALUES ('0ef3ffa373c94f498a56617e6d40d875', '1', '系统管理员', '192.168.0.112', '2016-08-24 12:27:43', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('0f88abfb22aa474b8cd46effd0210b66', '1', '系统管理员', '192.168.0.111', '2016-09-12 14:44:28', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('0fa3ab1df41c4693bd1bf6a1086a4271', '1', '系统管理员', '192.168.0.112', '2016-09-08 17:57:58', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('104a83eb9dce4160948a204a833cf5a7', '1', '系统管理员', '192.168.0.111', '2016-09-12 14:56:45', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('105fa1b52c814d10b1c34f76549dd7a0', '1', '系统管理员', '192.168.0.111', '2016-09-07 14:29:30', '保存报表：wpTest', '报表统计');
INSERT INTO `auditlogs` VALUES ('10be6cf592d64732ab8e0abe1ec3832e', '1', '系统管理员', '192.168.0.111', '2016-09-08 15:39:04', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('10d9d028b467412387d6fb3d3063d0b8', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-29 15:57:07', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('110f04b0429646ed9f299453200d94e6', '1', '系统管理员', '192.168.0.112', '2016-08-24 14:29:31', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('11c843e4c66e49f2a469f71a1ae82bdf', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-09-07 11:19:07', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('13aafa1dafe74572b8f9da4987fadb95', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-07 10:21:30', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('140549e7fd1f4e5c937b152d8b1d990a', '1', '系统管理员', '192.168.0.110', '2016-08-24 14:46:32', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('14da66c487c042e184c253014820713c', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-12 15:02:07', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('14e047c7bd43402a81ba011cf06acd89', '1', '系统管理员', '192.168.0.111', '2016-09-05 17:15:27', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('17ea576ae7154c61b9033ae13398e2fe', '1', '系统管理员', '192.168.0.110', '2016-08-30 10:03:52', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('188ed6e135f84a1687921f5d0e02325b', '1', '系统管理员', '192.168.0.111', '2016-09-01 11:43:04', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('18997e6178e0486581c8acfc6704ff5e', '1', '系统管理员', '192.168.0.112', '2016-09-08 10:19:35', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('18a04bb91cf94138a621e84fc5e38c6e', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 11:07:44', '启动-应用：newvm15', '我的应用');
INSERT INTO `auditlogs` VALUES ('18ffb6a06a1042faa2a78c0a26bff281', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.112', '2016-08-26 15:42:41', '启动-应用：newVM161', '我的应用');
INSERT INTO `auditlogs` VALUES ('191de8a55041478e9bba41cfcc3958c2', '1', '系统管理员', '192.168.0.111', '2016-09-06 15:06:02', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('19353973e30748629cd56819c7176779', '1', '系统管理员', '192.168.0.110', '2016-09-01 11:38:35', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('1972a1e8b99341f98af96dfe37e7c4dd', '1', '系统管理员', '192.168.0.110', '2016-08-23 17:46:44', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('19bb5d2ec59c4a4181a603d6c41b9ba0', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-24 18:04:51', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('19f677dd9f1a4019bf68f19fadf65e32', '1', '系统管理员', '192.168.0.112', '2016-09-06 10:45:38', '添加-应用模块：test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('1a024d8a779d44bb9767d551eccc10c7', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-06 14:54:54', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('1a093f3c28a9451285626f00ee94561f', '1', '系统管理员', '192.168.0.111', '2016-09-12 14:46:04', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('1a947b45396c41eda5e1851e5e333ac0', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-06 10:18:09', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('1ab7fa38d64f484fbb27ed40fa62cd81', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-07 15:26:41', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('1ae97a33cac647538e81e1ec2bb55121', '1', '系统管理员', '192.168.0.112', '2016-09-06 10:57:58', '重置密码：test1', '用户管理管理');
INSERT INTO `auditlogs` VALUES ('1b71629a758c40b78a99c4deb26d59e8', '1', '系统管理员', '192.168.0.61', '2016-08-25 10:34:07', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('1bcc858729ea46f597f2ccfced3598ba', '1', '系统管理员', '192.168.0.111', '2016-08-26 14:13:20', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('1d73178bf0824a42ab23b223ea1e3180', '1', '系统管理员', '192.168.0.111', '2016-08-23 17:52:58', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('1d7528df45ce408299d09bd5b9bcdbcd', '1', '系统管理员', '192.168.0.112', '2016-08-30 10:19:40', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('1d9d3002ef53493bbc56d6efdf6b3be4', '1', '系统管理员', '192.168.0.111', '2016-08-30 17:00:33', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('1e31f2fa32ca496f86ffd83d87baf523', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-25 17:53:38', '删除-应用：newVM168', '我的应用');
INSERT INTO `auditlogs` VALUES ('1e6694490a354b769ab0653ce5e92159', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-09-08 17:26:51', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('1e7b8e904dc246f2835416f2a2392a5e', '1', '系统管理员', '192.168.0.111', '2016-08-26 10:01:55', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('1f03f6ad99f641b8a032b63533a8632f', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-26 10:41:00', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('1f1741ddfd8a4f439fbf596a0109ca61', '1', '系统管理员', '192.168.0.112', '2016-09-05 14:25:06', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('1f1d67f6ae124f239d181e3743500261', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-31 16:05:37', '将项目：62状态更改为运行：', '我的项目');
INSERT INTO `auditlogs` VALUES ('1fb6e61f375145b386b1c990154dd1e8', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-12 14:39:34', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('1fc0898ca3d14f03aee45dec20fed22b', '1', '系统管理员', '192.168.0.110', '2016-08-29 09:30:03', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('1ff7960b9689465dbbd593d5a998a00a', '1', '系统管理员', '192.168.0.111', '2016-09-12 11:26:33', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('2017f45e9531433e8780ba3ef82f60b3', '1', '系统管理员', '192.168.0.111', '2016-09-08 17:00:47', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('20641b2fa3d242be972040b161ff9d5c', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-07 14:57:48', '删除-应用：newvm29', '我的应用');
INSERT INTO `auditlogs` VALUES ('209f9f501fb84899833d7496b9155eb1', '1', '系统管理员', '192.168.0.112', '2016-09-06 10:23:21', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('20bc6ed38d994c05b87c2105c4c3210d', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 11:08:46', '删除-应用：newvm15', '我的应用');
INSERT INTO `auditlogs` VALUES ('20f958102ed743feafa26f3f3929da2a', '1', '系统管理员', '192.168.0.111', '2016-09-05 13:42:10', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('213099c602f7477ab4de648706d5d0c0', '1', '系统管理员', '192.168.0.112', '2016-08-31 15:42:34', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('219bdf0d22894be8af651fe202e1eee0', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-30 10:45:20', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('21bfd5828b14457cae6070743cd3b6d2', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-25 11:10:34', '添加-标签:wpTest', '我的标签');
INSERT INTO `auditlogs` VALUES ('2251567aa5614d12828b720f78977d66', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-26 16:58:07', '添加-标签:www', '我的标签');
INSERT INTO `auditlogs` VALUES ('226fac9f472e4e66b6cc5159d1a64206', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-06 11:01:48', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('22ecde618da64588a348a85e90d3a1f4', '1', '系统管理员', '192.168.0.111', '2016-08-30 16:35:29', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('23e494d82e28446c8f89202510769654', '1', '系统管理员', '192.168.0.111', '2016-08-24 13:45:00', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('250eb274882840aabd0376166bcf8232', '1', '系统管理员', '192.168.0.111', '2016-09-08 16:24:38', '删除-应用模块：Test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('25425adfa4584e4581e41fbfbc97aa5c', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-24 17:51:46', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('25d39e3f79434a3b93792f9c8701e4da', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-09-08 15:22:33', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('25fc9d914c0e48d28ad4cd54431462ac', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-30 11:43:59', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('26b7bf87159946abaf8c2319eca9a9c0', '1', '系统管理员', '192.168.0.112', '2016-09-08 11:28:56', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('271fa974eaac40f9b85f34c60e68f954', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-24 15:25:02', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('276f7819e0d04358bebea9278629edfa', '1', '系统管理员', '192.168.0.111', '2016-08-23 15:29:13', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('288775685c12415ea4bc1ecd11e3b986', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-24 15:06:34', '删除-应用：newvm3', '我的应用');
INSERT INTO `auditlogs` VALUES ('299e6fda55a3400088d1083ecd27266e', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-26 14:29:57', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('29afd939f4ef456289b9f492f270f12b', '1', '系统管理员', '192.168.0.110', '2016-09-06 11:14:17', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('29f30d61e11b4d2ea920f92c671c1378', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-29 17:29:53', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('2a7bc1290d41472085236d2ffd53eea2', '1', '系统管理员', '192.168.0.111', '2016-09-06 14:17:47', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('2b54d44c6681414493245056a4ddabe7', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-08 16:58:16', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('2b9f7063fafa46eb9b4a846f8980c6ff', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-07 14:37:52', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('2bb4b369c5ec484a840fc2983a21dd71', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-24 18:09:57', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('2bbfcfd663b4493798824a1218b5f209', '1', '系统管理员', '192.168.0.112', '2016-08-24 14:49:12', '修改-资源池：test', '资源管理');
INSERT INTO `auditlogs` VALUES ('2c43d103d7ad4ea39dd1bea74239e848', '1', '系统管理员', '192.168.0.110', '2016-08-24 10:10:27', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('2c5985cb859d48d2835eef2ee3b67115', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-24 18:02:43', '删除-应用：newvm5', '我的应用');
INSERT INTO `auditlogs` VALUES ('2cd9fc5325284dc0bdde7071bfd672bf', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-24 18:05:51', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('2ce8dfc25c084460aadea4b58981b4d8', '1', '系统管理员', '192.168.0.110', '2016-08-23 18:07:34', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('2d2514b578bc4bf3a56a1a69d80e5509', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 10:39:43', '删除-应用：newvm12', '我的应用');
INSERT INTO `auditlogs` VALUES ('2d6231fd0e7b419a95881baa3dde8494', '1', '系统管理员', '192.168.0.110', '2016-09-08 17:27:57', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('2d8746edbd964d5cb86965f6e0faaa87', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-07 14:04:53', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('2df489fa52644040aa7a829d1fa5c3cf', '1', '系统管理员', '192.168.0.110', '2016-08-30 11:33:57', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('2e07147d1a044096947d67eaa22ee068', '1', '系统管理员', '192.168.0.111', '2016-08-29 17:18:55', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('2e76304b9c084ece88dbd93117becf18', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.112', '2016-08-26 15:44:48', '挂起-应用：newVM161', '我的应用');
INSERT INTO `auditlogs` VALUES ('2ebea082628947738b77753992c8812e', '1', '系统管理员', '192.168.0.112', '2016-09-08 15:49:13', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('2f476a48aac34f0cbc520564f8bd83bf', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-12 15:48:45', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('2fa477207f0b46c88277a3cfbafcd117', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-25 17:55:21', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('30c210d9b4f24053a76031e4afb32446', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-31 15:33:17', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('3170b472826b4b95818345d0dbeabe0f', '1', '系统管理员', '192.168.0.112', '2016-08-24 14:16:52', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('31e6f4b4136b4586978f8a3d1936641b', '1', '系统管理员', '192.168.0.111', '2016-09-06 14:25:25', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('32182418e3634daab0fc5549425312e3', '1', '系统管理员', '192.168.0.112', '2016-09-06 17:16:33', '删除-应用模块：test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('32b301c013f24e12b48f1918d65ee2be', '1', '系统管理员', '192.168.0.112', '2016-09-06 10:45:41', '添加-应用模块：test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('32d83bf19d1f4bc2b5bb144ed70c8e89', '1', '系统管理员', '192.168.0.110', '2016-08-23 17:48:43', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('32e799965ce34d489c5fc4365dc994d1', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-25 10:56:30', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('32f1568cc9ec4fcaac56ed656b8de7a2', '1', '系统管理员', '192.168.0.112', '2016-09-08 11:31:27', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('3364f32f74c24422861012919076b0a4', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-30 09:16:45', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('33674502fc514a5c89abd96e0d8a0193', '1', '系统管理员', '192.168.0.112', '2016-09-07 10:35:58', '添加-应用模块：test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('33a698e57f484efd9049134d59bcb336', '1', '系统管理员', '192.168.0.110', '2016-08-23 15:04:49', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('33c624ca7b98452db3407a9dc75c25ad', '1', '系统管理员', '192.168.0.110', '2016-08-25 10:14:15', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('33dec5881dc04e89b87213b80c5051dc', '1', '系统管理员', '192.168.0.112', '2016-08-30 10:16:02', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('35e59783452f4ca9bfb804be8fbe5afd', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-24 15:17:16', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('360b39f2447a4cb28518fb24b97d94bd', '1', '系统管理员', '192.168.0.111', '2016-09-07 10:50:44', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('36257d8a49cf43ab8750f0579a1ebd27', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.112', '2016-08-26 15:51:56', '挂起-应用：newVM161', '我的应用');
INSERT INTO `auditlogs` VALUES ('3689713d27a84627baeda54dc3bb8c56', '1', '系统管理员', '192.168.0.111', '2016-08-31 11:42:25', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('368d8cbe01cb4682951d92e21d0fafab', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-24 12:05:43', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('36b6724334ec4b18a9fd19fa40d36c78', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-24 18:10:04', '删除-应用：newvm7', '我的应用');
INSERT INTO `auditlogs` VALUES ('36f51801da2a42aa8d0bc4dc32055e62', '1', '系统管理员', '192.168.0.111', '2016-09-12 15:24:18', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('3700ca3e5b24464c898c464a055f11ec', '1', '系统管理员', '192.168.0.111', '2016-08-24 16:08:41', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('3767cda5a4844aaeb6df6aaf1df179a2', '1', '系统管理员', '192.168.0.111', '2016-09-06 10:22:04', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('3796e5b0a2574be2a1e9b3273036145c', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-30 16:45:36', '将项目：62状态更改为运行：', '我的项目');
INSERT INTO `auditlogs` VALUES ('37e4af31b1df41ca89c7da20ea093228', '1', '系统管理员', '192.168.0.111', '2016-09-13 09:44:18', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('38b358e31587400d8d58b870086b6d4d', '1', '系统管理员', '192.168.0.112', '2016-09-08 18:27:53', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('38cbde4b0f8e473ea7a505eb47170fa8', '1', '系统管理员', '192.168.0.110', '2016-09-08 10:19:32', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('39acebd5d3a94150bebe46175bd4825c', '1', '系统管理员', '192.168.0.111', '2016-09-08 16:55:49', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('39ccd90e3abc4688a19373134b0fba4f', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-12 11:59:21', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('39f15b7ed9ed443ba81d173723d8c9b0', '1', '系统管理员', '192.168.0.111', '2016-09-08 16:42:52', '保存报表：Test2', '报表统计');
INSERT INTO `auditlogs` VALUES ('3a3ee223c65a42d6b3ef6bffaf7856f3', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 11:14:04', '删除-应用：newvm16', '我的应用');
INSERT INTO `auditlogs` VALUES ('3acc289625a941d6a11b5b97c4482e1c', '1', '系统管理员', '192.168.0.111', '2016-08-23 15:01:11', '退出登录', '登录');
INSERT INTO `auditlogs` VALUES ('3ae301b5a23242f6b141a6a2450932ce', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-06 11:02:47', '将项目：62状态更改为运行：', '我的项目');
INSERT INTO `auditlogs` VALUES ('3af6855357914dd78c04fa64473cefee', '1', '系统管理员', '192.168.0.111', '2016-08-29 15:09:57', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('3b4925f7b50a4a8781794ba1d836ce7f', '1', '系统管理员', '192.168.0.110', '2016-09-08 10:53:25', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('3cb9dcb439e74d78a30ec983f898070b', '1', '系统管理员', '192.168.0.112', '2016-09-06 10:45:48', '添加-应用模块：test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('3db09114465a4a2eb0b8c4a01a6a5e47', '1', '系统管理员', '192.168.0.110', '2016-08-23 15:03:07', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('3ddbdc07ee7543b188649a5c82569ebb', '1', '系统管理员', '192.168.0.111', '2016-09-12 14:29:47', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('3e027a73d04d451f911b81f82909881b', '1', '系统管理员', '192.168.0.110', '2016-08-24 09:18:10', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('3e7d36c69f574f59a3078b7632e199db', '1', '系统管理员', '192.168.0.111', '2016-09-06 09:48:42', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('3e80e981504c4ce4b348b75f50ac946f', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-08 16:49:05', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('3ea7a6bf175849d5b007ad346c1e97e2', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 14:49:13', '删除-应用：newvm19', '我的应用');
INSERT INTO `auditlogs` VALUES ('3ed0a05c8f8a42d9805b153c77de0461', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-24 17:55:25', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('3edc42e59cdb4a5d83172f16b942f20f', '1', '系统管理员', '192.168.0.110', '2016-09-08 12:14:21', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('3fdc8b183b744ed683b6fc0ed975512e', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-31 15:56:58', '将项目：61状态更改为运行：', '我的项目');
INSERT INTO `auditlogs` VALUES ('3ff8933cee924dfc93af97ad5be2ed62', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.112', '2016-08-26 15:51:31', '停止-应用：newVM161', '我的应用');
INSERT INTO `auditlogs` VALUES ('4000ed27a556443682e31a2e87112927', '1', '系统管理员', '192.168.0.110', '2016-08-23 16:55:11', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('40e35bf883cc484ba356c60701d3f7e9', '1', '系统管理员', '192.168.0.110', '2016-08-24 11:02:24', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('4171346bec08491dafa28339ae2bc9c7', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-09-08 11:20:12', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('41eaf518bd7640f38544fd285c767ecd', '1', '系统管理员', '192.168.0.112', '2016-09-06 17:16:34', '删除-应用模块：test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('4299108ba62941d689dfe139f8046f4c', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-25 18:07:22', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('432aff4b8f9f4afdbc7a4ff645987f29', '1', '系统管理员', '192.168.0.111', '2016-08-23 16:31:55', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('43d01041e854454cb444f787edfc4393', '1', '系统管理员', '192.168.0.112', '2016-09-06 10:47:18', '删除-应用模块：test,test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('44ba519edae24582a9f79e282f0cc71c', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-24 11:04:48', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('44c97217ffc84fc2a908ace142ee8b29', '1', '系统管理员', '192.168.0.112', '2016-09-06 10:45:37', '添加-应用模块：test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('455864928d1c4bf880fc39cfbb8938de', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-07 15:03:01', '删除-应用：newvm30', '我的应用');
INSERT INTO `auditlogs` VALUES ('4619209a67d4415cae01c22dd7bc88ee', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 17:00:26', '启动-应用：newvm23', '我的应用');
INSERT INTO `auditlogs` VALUES ('462cfe76fe234008a3b0d1d1ad18b85f', '1', '系统管理员', '192.168.0.110', '2016-08-26 15:51:20', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('46685df6f1084644b00fc00e84b87d05', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-24 11:01:07', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('472af1f25bc14daeadc5473850b60c02', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-24 15:06:03', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('472f191f707c40cd948cd0e908acd607', '1', '系统管理员', '192.168.0.112', '2016-08-24 17:49:03', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('473c8ee064d3407fae6fb8975e313897', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-26 14:15:17', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('484cf4b5c69349eba83fd8f5c68e7368', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-25 18:14:20', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('48879bed8bf445a69f9182cd6865d20b', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-25 16:31:08', '删除-应用：newVM163', '我的应用');
INSERT INTO `auditlogs` VALUES ('48c37052b8414502af12dbb71321789d', '1', '系统管理员', '192.168.0.111', '2016-08-30 10:58:51', '将IP地址：192.168.0.8,192.168.0.2改为不可用：', 'IP地址管理');
INSERT INTO `auditlogs` VALUES ('48d504fde9db4b49b07a356ef45b57b2', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-25 18:14:01', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('49e75fd48f714f82a34ba800aa94e975', '1', '系统管理员', '192.168.0.112', '2016-09-06 10:56:57', '添加-用户：test1', '用户管理');
INSERT INTO `auditlogs` VALUES ('4a0c7a10402b4acf93fc6dd8174c8fe5', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-24 15:22:44', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('4a494096ed3848879af7d6f9b3f4dd5f', '1', '系统管理员', '192.168.0.111', '2016-08-23 17:02:46', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('4ac451bdb7d14bda9710c929d40e5a84', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-12 14:33:30', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('4b5eee5480cb46e3ab74bc60e9c88694', '1', '系统管理员', '192.168.0.110', '2016-08-25 18:00:04', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('4b6eeec59f3c40fe85637764a24c4b94', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-29 14:49:32', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('4b9c3461db024b748fb5b9a0c22752d0', '1', '系统管理员', '192.168.0.111', '2016-08-24 15:50:39', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('4ba6d4d060df4546977b85e64ccb9f97', '1', '系统管理员', '192.168.0.111', '2016-09-07 14:35:17', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('4baf8f49a3454aa9b6251c9834e0e393', '1', '系统管理员', '192.168.0.111', '2016-09-07 15:46:36', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('4c0935990d7746aa8b1b9f72d2409d47', '1', '系统管理员', '192.168.0.110', '2016-08-26 10:43:49', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('4d7a0eb05ad24348ac3ea0840ff5a9de', '1', '系统管理员', '192.168.0.110', '2016-09-08 16:10:32', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('4de5e3bf16d14255a9159411c52bd441', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 11:57:42', '启动-应用：newvm18', '我的应用');
INSERT INTO `auditlogs` VALUES ('4ded83db7c5d4d79a36075b8999a07d4', '1', '系统管理员', '192.168.0.111', '2016-08-24 11:20:31', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('4e31ba4febc548e180ea1f09459cc495', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-25 11:34:25', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('4e7af36904694c39903b911ec77d948d', '1', '系统管理员', '192.168.0.112', '2016-08-26 12:14:27', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('4ecd7ecabbb243718e5767d4199c7513', '1', '系统管理员', '192.168.0.112', '2016-09-06 17:16:33', '删除-应用模块：test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('4ecdfd00d85742df8cd01dfc24a324bd', '1', '系统管理员', '192.168.0.110', '2016-09-12 16:18:37', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('4ed95b120f3b46dd95280da1e1ba339f', '1', '系统管理员', '192.168.0.111', '2016-09-06 10:48:07', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('4f6d3b28e5e94c87a381f7663ca8bac2', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 16:11:03', '启动-应用：newvm22', '我的应用');
INSERT INTO `auditlogs` VALUES ('50049f3d393e4ffbaa073d063f6548a5', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-24 15:11:56', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('501dc86f08c1498f8de3e9da42ebac7e', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-25 17:50:56', '删除-应用：newVM167,newVM166', '我的应用');
INSERT INTO `auditlogs` VALUES ('50ac64696b294527b2524e90776b27a6', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-25 18:19:11', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('50d419fb52d248db9e71a0cef11cd946', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-24 10:58:41', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('50e18e27aabe4997896786fcba5087c3', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-30 10:47:09', '删除-应用：newvm23', '我的应用');
INSERT INTO `auditlogs` VALUES ('51adb9ca06154c95b4c0af941f2673d5', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-31 15:37:45', '挂起-应用：newvm25', '我的应用');
INSERT INTO `auditlogs` VALUES ('523d213c37354bbcb29f8b832f898b28', '1', '系统管理员', '192.168.0.110', '2016-08-24 17:58:47', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('5260dbe3fb904095bffa2a4ae3c10d34', '1', '系统管理员', '192.168.0.111', '2016-09-07 14:28:17', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('5281ec15cd684f2d9d41c74d43644d80', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-25 16:31:31', '删除-应用：newVM202', '我的应用');
INSERT INTO `auditlogs` VALUES ('534645d439c24c529285dde44a20bbba', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-12 10:36:42', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('54875b629dd14740be33d1b35471d810', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-09-07 15:39:23', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('54934015662c4d548e82cb17d59f99ae', '1', '系统管理员', '192.168.0.111', '2016-08-26 11:46:50', '添加-资源池：Test', '资源管理');
INSERT INTO `auditlogs` VALUES ('54fe4bcf1a1543318f3c225854536949', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-06 14:16:55', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('5557cd57f27a4d998fc58c6e14fb74b5', '1', '系统管理员', '192.168.0.111', '2016-09-02 11:51:15', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('5566c7a4de284346a02ec716fac4e4d1', '1', '系统管理员', '192.168.0.112', '2016-09-05 17:47:25', '将IP地址：192.168.0.110改为空闲：', 'IP地址管理');
INSERT INTO `auditlogs` VALUES ('556922b9373b45399e932a5f0e1d266e', '1', '系统管理员', '192.168.0.111', '2016-08-23 15:01:24', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('558d6da400714a75ad0c934dd319586c', '1', '系统管理员', '192.168.0.111', '2016-08-31 15:33:40', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('55e6c8c4dde54c55905e5bd8860aaf33', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.111', '2016-08-31 11:40:34', '挂起-应用：newvm24', '我的应用');
INSERT INTO `auditlogs` VALUES ('560079aeac1f479d9cf6d4faf92d3d4c', '1', '系统管理员', '192.168.0.111', '2016-09-08 16:24:29', '添加-应用模块：Test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('56533dacdffa4c43b50e7a03e71be93f', '1', '系统管理员', '192.168.0.110', '2016-08-29 16:51:19', '添加-应用模块：app_tomcat', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('5684c1df72e04e229c79e2fd703ba7a1', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-25 18:14:56', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('56cf0a850d644b2899749dad50293e2f', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-07 16:37:57', '删除-应用：newvm31', '我的应用');
INSERT INTO `auditlogs` VALUES ('571c2336a8364f1db53458abd41c9e78', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 11:07:58', '停止-应用：newvm15', '我的应用');
INSERT INTO `auditlogs` VALUES ('573c1aec5aa34b4bab04eb22adf0ba56', '1', '系统管理员', '192.168.0.110', '2016-08-23 15:06:26', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('580b782602524a5295b2bce6834fb63e', '1', '系统管理员', '192.168.0.112', '2016-09-06 17:16:33', '删除-应用模块：test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('582907ab47ab404f9db3f9b4db9c8cea', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-30 11:32:07', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('588737967e4a4a3bb1f675017667e891', '1', '系统管理员', '192.168.0.111', '2016-08-25 15:21:10', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('588a8a305b7b4326b11a2fbeff349a4e', '1', '系统管理员', '192.168.0.112', '2016-09-05 17:46:42', '将IP地址：192.168.0.110改为不可用：', 'IP地址管理');
INSERT INTO `auditlogs` VALUES ('58d86872855c4d308cf51bc2b7df847d', '1', '系统管理员', '192.168.0.112', '2016-08-24 14:34:22', '删除-应用模块：123', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('58f28fb4a0aa4186814ccc161639f034', '1', '系统管理员', '192.168.0.112', '2016-09-06 10:45:37', '添加-应用模块：test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('5956de15b6ef48a3982fb4e539814c64', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-25 18:03:56', '删除-应用：newVM169', '我的应用');
INSERT INTO `auditlogs` VALUES ('59abf55053034e14bf9b5cf107edacc1', '1', '系统管理员', '192.168.0.110', '2016-09-12 11:15:24', '删除-资源池：test', '资源管理');
INSERT INTO `auditlogs` VALUES ('59cd25fe20fd4ba9a2c58901a7a14649', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 11:59:35', '停止-应用：newvm18', '我的应用');
INSERT INTO `auditlogs` VALUES ('5a1257cb29514a7aa990dedc778119de', '1', '系统管理员', '192.168.0.112', '2016-09-05 15:22:40', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('5a4c2124da9e4151a102815e58fbeb7d', '1', '系统管理员', '192.168.0.111', '2016-08-25 18:23:18', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('5a977017d4a843e482fe8c2490c2cbfe', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-25 18:19:15', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('5adb943236aa44579b6de40da0d206a3', '1', '系统管理员', '192.168.0.111', '2016-08-31 15:12:41', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('5b0fd7f7775e425295b76a112864269f', '1', '系统管理员', '192.168.0.112', '2016-08-30 16:08:42', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('5b97f631991b4d619a82b72546cfa7a6', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-24 15:10:29', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('5c11f8a3034e425793493e06f88c51f8', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.112', '2016-08-26 15:44:31', '停止-应用：newVM161', '我的应用');
INSERT INTO `auditlogs` VALUES ('5cf0b0e057814d1f86658e384df05eee', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-09-12 15:09:03', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('5d14cad98d5e4dcf96f8cef9eaef2d50', '388c9242e49142998cba43a54a729f0e', 'wangping', '192.168.0.111', '2016-08-31 17:56:05', '增加-我的项目：wpTest', '我的项目');
INSERT INTO `auditlogs` VALUES ('5d56d29774ad41d6a74c0520bd568485', '1', '系统管理员', '192.168.0.111', '2016-09-12 15:01:11', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('5d8fad12fc264271b53d611ca40903ce', '1', '系统管理员', '192.168.0.111', '2016-08-24 15:22:29', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('5e5a670730004a2e92a8a57ea974a480', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 11:59:57', '启动-应用：newvm18', '我的应用');
INSERT INTO `auditlogs` VALUES ('5e9c0620f86a4dc69f9b0578ba955268', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-06 10:12:51', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('5edf5d30f52c471a8bc846e74121c8d3', '1', '系统管理员', '192.168.0.112', '2016-09-06 10:45:38', '添加-应用模块：test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('5f8a965c93e24d7ea34ac3e30cbc034f', '1', '系统管理员', '192.168.0.110', '2016-09-09 17:55:25', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('602b686cd642491a8b9a2c78df609448', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-25 18:17:27', '挂起-应用：newvm0', '我的应用');
INSERT INTO `auditlogs` VALUES ('607b1af6ac1944bbbb9afc80cb794007', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-08 16:09:17', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('60e8de277c4a425db1a48434366c906d', '1', '系统管理员', '192.168.0.111', '2016-09-07 17:29:57', '保存报表：wppp', '报表统计');
INSERT INTO `auditlogs` VALUES ('620b76312ab14aa39e55f9fca7155d10', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.112', '2016-09-08 18:07:04', '停止-应用：newVM161', '我的应用');
INSERT INTO `auditlogs` VALUES ('621c615c31b149818139b197e3859cbb', '1', '系统管理员', '192.168.0.112', '2016-09-06 11:01:13', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('6241a4b378924641aabd6c129920f836', '388c9242e49142998cba43a54a729f0e', 'wangping', '192.168.0.111', '2016-08-23 15:04:31', 'wangping修改密码', '用户管理');
INSERT INTO `auditlogs` VALUES ('6263d5ef1bd6448aa161ca9037589484', '1', '系统管理员', '192.168.0.111', '2016-09-12 14:52:49', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('62ce9a9ea9344179a09feb5d9fb3d197', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-25 17:54:07', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('62f59a8192eb46bdbd645a57addabf0a', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-07 14:25:28', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('634459e8094645aab88816fb79b9e231', '1', '系统管理员', '192.168.0.112', '2016-08-24 18:10:35', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('634b15a1ebc2467ab77856ea68b91400', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-07 14:46:05', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('6387608d29284455bbefcf887f671269', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 12:02:24', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('63c58ed2ae0e48c49afb3dd917a298ce', '1', '系统管理员', '192.168.0.112', '2016-09-06 10:45:36', '添加-应用模块：test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('63d03122b90a48eaaebbe52ef1f2ffb8', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-26 14:15:45', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('6434083096e54cdd9fe6dbcd45104ba4', '1', '系统管理员', '192.168.0.110', '2016-08-25 10:48:50', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('6470c5e8b8e147a2a646fc5c464d9950', '1', '系统管理员', '192.168.0.111', '2016-09-08 17:50:02', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('647e9490dfb64f97a418c69e6d5cff3b', '1', '系统管理员', '192.168.0.110', '2016-08-30 12:03:46', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('6494a5b97bbe4c2f92f0b8b38c0472e8', '1', '系统管理员', '192.168.0.112', '2016-09-06 10:45:37', '添加-应用模块：test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('652bc6baf73d44c4b8b0aaf1046d90b2', '1', '系统管理员', '192.168.0.112', '2016-09-05 15:52:52', '修改-应用模块：jboss', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('653c9f71e7264e7aa7cd88ac79dda978', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-09-06 17:59:00', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('656363e6806e48f68f7e3f48c0b242ef', '1', '系统管理员', '192.168.0.110', '2016-09-06 17:35:51', '删除-自定义报表：Twts', '报表统计');
INSERT INTO `auditlogs` VALUES ('658b191a5a944f21a40f6555c1bc1bf7', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 12:00:54', '删除-应用：newvm18', '我的应用');
INSERT INTO `auditlogs` VALUES ('65913138d6744efea6f4da2e953e06ec', '1', '系统管理员', '192.168.0.112', '2016-09-06 10:47:38', '删除-应用模块：test,test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('661038581d9549ec95626f12c66be68c', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-09-08 10:43:49', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('663020b2c8604c4faa686c05cacd5086', '1', '系统管理员', '192.168.0.111', '2016-08-30 16:42:11', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('66a4f8ff32a149609445c444816b961c', '1', '系统管理员', '192.168.0.111', '2016-08-31 09:37:05', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('6723714e6a794b1e96c6101a8adcf4a1', '1', '系统管理员', '192.168.0.110', '2016-08-29 15:55:41', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('67557321c5964ef78c71596d4380ae2b', '1', '系统管理员', '192.168.0.110', '2016-08-23 15:04:26', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('6834010215754fad87adfbc3cec2bddd', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-25 18:06:36', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('68abdbd6ba184ec5b3d715136c81b8b4', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-25 17:51:28', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('68d97db655ff41249a1a14d09f8b4af9', '1', '系统管理员', '192.168.0.111', '2016-09-01 14:27:40', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('68eb4fc459114780af3768a485ff9091', '1', '系统管理员', '192.168.0.112', '2016-08-24 18:09:04', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('69cc1d35e96e40db80c276072fd06a6b', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-06 16:46:07', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('69f7e348a7f74261a1675c3965929a0e', '1', '系统管理员', '192.168.0.110', '2016-08-23 15:03:57', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('69f9c7d5e3064e2b9f718d95be500f37', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-24 18:02:23', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('6a737adc600d4fde9a08e9921dfb39be', '1', '系统管理员', '192.168.0.111', '2016-08-31 11:44:29', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('6b93109cdd6949429053667421a8e380', '1', '系统管理员', '192.168.0.110', '2016-08-23 15:36:04', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('6c34f15b5bd74809879397e482ea1166', '1', '系统管理员', '192.168.0.112', '2016-09-01 11:21:08', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('6c6e3b4b190144309f8c73e8c1a85029', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-06 17:11:31', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('6c849f342cd347569edaec71772702b4', '1', '系统管理员', '192.168.0.112', '2016-09-06 17:03:44', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('6cd6daf14da04cc69cc8b88146b0dfca', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-08 11:25:50', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('6d824f528324428aaadae7e68922677f', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-09-07 15:01:23', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('6e04663d416f46c99c5f7906ef758863', '1', '系统管理员', '192.168.0.110', '2016-08-23 17:47:30', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('6e44360975f240de9deedaa4c6255fd5', '1', '系统管理员', '192.168.0.110', '2016-08-24 14:58:21', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('6ea334b7b83c4965b5dd0169fff84578', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-08 11:29:46', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('6ead56c693bb43aeaa65c16ad5341cd9', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.111', '2016-08-31 11:40:14', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('707676d0fad04c40a1b4f58d8bb0124e', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-07 14:31:00', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('70ea0228cb694a108730d4d4f7b5106e', '1', '系统管理员', '192.168.0.111', '2016-09-13 09:43:14', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('711d42f92ad2478187289ef7c63b74b5', '1', '系统管理员', '192.168.0.111', '2016-08-23 17:59:17', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('71cc66848609429480a274f7aaba76c1', '1', '系统管理员', '192.168.0.112', '2016-09-07 10:36:47', '删除-应用模块：test大法师是对方', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('7300632cd35a4dea90bc521357877a63', '1', '系统管理员', '192.168.0.112', '2016-09-06 10:57:24', '修改-用户：test1', '用户管理');
INSERT INTO `auditlogs` VALUES ('73891f4b5b1646b7a94221820d01c00c', '1', '系统管理员', '192.168.0.111', '2016-08-23 15:02:48', '退出登录', '登录');
INSERT INTO `auditlogs` VALUES ('74196c01319d43a5bd24f4d60035a239', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-08 16:09:32', '删除-应用：newvm35', '我的应用');
INSERT INTO `auditlogs` VALUES ('745e5c71ccb74ed29d3846d9846bf43b', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-12 14:49:56', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('74eaf91826494b3596de102e59d6ec8d', '1', '系统管理员', '192.168.0.110', '2016-09-12 15:08:20', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('75a47dc4e22c4477852267317ed72158', '1', '系统管理员', '192.168.0.111', '2016-09-08 16:43:34', '删除-自定义报表：rrr', '报表统计');
INSERT INTO `auditlogs` VALUES ('760ce4ed7298467cb7220179233cf39b', '1', '系统管理员', '192.168.0.112', '2016-09-08 11:23:45', '添加-资源池：test', '资源管理');
INSERT INTO `auditlogs` VALUES ('76147d800e43453888d59523c9523598', '1', '系统管理员', '192.168.0.112', '2016-09-06 10:47:07', '删除-应用模块：test,test,test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('761f9f39da5941b9ad9956a74a9e0656', '1', '系统管理员', '192.168.0.111', '2016-08-24 15:47:32', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('76ea91b97e604d3b8449fd1cdd7a5e95', '1', '系统管理员', '192.168.0.112', '2016-09-06 11:09:24', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('7733c9ac602d480683c969d7d0442758', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-24 15:11:01', '删除-应用：newVM204', '我的应用');
INSERT INTO `auditlogs` VALUES ('77eb76aeb1214f9a95a77f1faaa62670', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-08 15:45:54', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('79ac138eacf745b9a244c75740ccff9c', '1', '系统管理员', '192.168.0.111', '2016-09-07 10:05:09', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('7a3309e8a44d48fcadd63cb77d35fc87', '1', '系统管理员', '192.168.0.111', '2016-09-07 15:48:59', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('7a4a8773c9214bbbbb44a00e9f8c0351', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-25 16:39:43', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('7a8b390ee44640d89878412398429ddc', '1', '系统管理员', '192.168.0.111', '2016-09-08 16:23:24', '添加-应用模块：Test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('7b046a722ff7409b858b2eff829287f7', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-29 15:36:56', '修改-用户：hanyumeng', '用户管理');
INSERT INTO `auditlogs` VALUES ('7bc3f53f0959473badad13abaef14f41', '1', '系统管理员', '192.168.0.111', '2016-08-30 10:00:24', '将IP地址：192.168.0.9改为不可用：', 'IP地址管理');
INSERT INTO `auditlogs` VALUES ('7bdecc6c26454f36a740a7ea4f629bc8', '1', '系统管理员', '192.168.0.111', '2016-09-08 11:36:40', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('7c177beae3654fc689d7fec198e9b571', '1', '系统管理员', '192.168.0.112', '2016-09-06 10:45:38', '添加-应用模块：test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('7c4414aca3aa4d8c92810403832bc3e1', '388c9242e49142998cba43a54a729f0e', 'wangping', '192.168.0.111', '2016-08-23 15:04:45', 'wangping退出登录', '用户登录');
INSERT INTO `auditlogs` VALUES ('7c837eba7556471e8b5a4cc73e6fa753', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-31 15:37:14', '停止-应用：newvm24', '我的应用');
INSERT INTO `auditlogs` VALUES ('7d59ac3ec18945cbb58a55d211c1b92d', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 16:54:07', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('7d6c5e8bb4454c3f8cf6e090595d04a3', '1', '系统管理员', '192.168.0.112', '2016-08-31 15:49:14', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('7d7dbedb96f344ddb82218916b2de07e', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-25 15:11:04', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('7de21edd34a44d7cb47e6bee284942af', '1', '系统管理员', '192.168.0.111', '2016-09-01 13:52:24', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('7ea5c5f971714f75973ef958f3bf3ab9', '1', '系统管理员', '192.168.0.111', '2016-09-12 15:27:58', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('7eda58a40dd242df95fa59f0cc7aad4b', '1', '系统管理员', '192.168.0.111', '2016-09-08 17:13:46', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('7f3cef6f5a564e509af3cb7a0f0678e5', '1', '系统管理员', '192.168.0.112', '2016-09-06 10:47:29', '删除-应用模块：test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('800df0d0b3ba4b47af9f12abce2d102e', '1', '系统管理员', '192.168.0.111', '2016-08-26 11:12:40', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('802b27fca8594346b3ccbb582c793114', '1', '系统管理员', '192.168.0.111', '2016-08-26 09:55:54', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('80e58437699b41dabe35cf349f297b8a', 'efb65dfc78f7404bbcb0e0001aed73bc', 'test1', '192.168.0.112', '2016-09-06 11:00:42', 'test1登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('81041408c7794db78e024de0f6be7c64', '1', '系统管理员', '192.168.0.111', '2016-08-24 16:03:05', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('8145f5b6e86849cd9e9de3d338a51336', '1', '系统管理员', '192.168.0.111', '2016-08-25 10:56:09', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('8147e952ac034e8aabef0c86347724f2', '1', '系统管理员', '192.168.0.112', '2016-09-05 17:45:03', '删除-应用模块：test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('8151561304b84fbc8a7d9e8a121d2070', '1', '系统管理员', '192.168.0.112', '2016-08-24 15:06:47', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('8242b820e07a46c2a71cf6ea26083b2c', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.112', '2016-08-26 15:41:15', '删除-应用：newVM173', '我的应用');
INSERT INTO `auditlogs` VALUES ('8245f7a17a9b4c86bb9bda60ac93e103', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 11:09:08', '删除-应用：newvm13', '我的应用');
INSERT INTO `auditlogs` VALUES ('8251a2d9f04c4c6cae0b9cf05a1bc8bd', '1', '系统管理员', '192.168.0.112', '2016-09-08 18:29:02', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('8275c20cbe6748a98c5cc7f46b8204f1', '1', '系统管理员', '192.168.0.112', '2016-08-24 14:33:37', '删除-应用模块：FTP服务', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('82900523f7e04746bfe59569a8303f23', '1', '系统管理员', '192.168.0.111', '2016-09-08 16:23:52', '删除-应用模块：Test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('83ae36881e4c4c33981b6ab26599a48c', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-30 11:54:27', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('840a8506407e4290b802bc334ce0008f', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-08 16:56:10', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('8415ee1ef81d431b8c413dc25ec996b5', '1', '系统管理员', '192.168.0.111', '2016-08-29 11:11:58', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('852a5860611e4e95980f7591d58e71c8', '1', '系统管理员', '192.168.0.111', '2016-08-23 15:09:09', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('853a95e7936546158350c662da9688e2', '1', '系统管理员', '192.168.0.112', '2016-08-24 15:11:27', '添加-资源池：testSource', '资源管理');
INSERT INTO `auditlogs` VALUES ('86760b126e6540518d29159b2327834b', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-25 11:02:51', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('8766bdcd929146ff96d5c0c8ea9edff3', '1', '系统管理员', '192.168.0.111', '2016-08-23 15:30:53', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('87928cf8e8304dd19d0c104145c2523f', '1', '系统管理员', '192.168.0.110', '2016-08-24 17:40:04', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('879adf0c70b447c396e7db2b37bb3ec5', '388c9242e49142998cba43a54a729f0e', 'wangping', '192.168.0.111', '2016-08-26 15:12:45', 'wangping登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('87c2fc5664f242248e402d05ad48c100', '1', '系统管理员', '192.168.0.111', '2016-08-25 10:33:30', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('87caf3fb04264615ad38b53b49c1d736', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-07 15:34:07', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('87e474b385aa41508f54572e1b8f3205', '1', '系统管理员', '192.168.0.111', '2016-09-06 18:11:20', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('8815d2b6839940bdb5f70101f1bf0cb3', '1', '系统管理员', '192.168.0.112', '2016-09-08 15:43:18', '添加-资源池：test', '资源管理');
INSERT INTO `auditlogs` VALUES ('884ccac07db8433fa8be74a409655453', '1', '系统管理员', '192.168.0.111', '2016-08-29 11:13:37', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('890e7b55640d4179a1546a2c75b7a671', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-07 10:28:46', '将项目：61状态更改为运行：', '我的项目');
INSERT INTO `auditlogs` VALUES ('89244df8cbec4130a33759a129b84c6d', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-24 11:01:16', '删除-应用：newVM201', '我的应用');
INSERT INTO `auditlogs` VALUES ('894dcf72f73a435b9b3873d430372291', '1', '系统管理员', '192.168.0.112', '2016-09-08 17:07:29', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('8a2128958b8c46d68e7621db8b3bbe3a', '1', '系统管理员', '192.168.0.111', '2016-08-31 17:56:23', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('8a583c36562e4e73ac55942dd3e90e88', '1', '系统管理员', '192.168.0.110', '2016-08-23 17:54:52', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('8a75f8b6efd640c4945c8e3ac43da526', '1', '系统管理员', '192.168.0.110', '2016-09-09 11:07:26', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('8abb8d1a8d2b42cc8e1ca58939fd55ef', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-25 18:18:05', '删除-应用：newVM205,newVM162,newVM171', '我的应用');
INSERT INTO `auditlogs` VALUES ('8cb9954167014db0bfe94b04676ec008', '1', '系统管理员', '192.168.0.111', '2016-08-30 15:40:21', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('8d0b9f9cf3644ba3b34552d02dd09852', '1', '系统管理员', '192.168.0.111', '2016-08-29 15:05:26', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('8d3db6b513f04b9d86b845439ccc110e', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-12 14:49:30', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('8d55f5abab9a4cb29b4df4045976b4d1', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-25 18:17:33', '删除-应用：newvm0', '我的应用');
INSERT INTO `auditlogs` VALUES ('8d55fe3b55be489dbb7a025ac0b94b71', '1', '系统管理员', '192.168.0.111', '2016-08-30 09:37:31', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('8da12b22814648f6ad0316959dbd5752', '1', '系统管理员', '192.168.0.111', '2016-09-05 10:19:25', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('8dc9513dd38e450bb26e69912f9fb839', '1', '系统管理员', '192.168.0.112', '2016-09-07 10:47:15', '保存报表：test', '报表统计');
INSERT INTO `auditlogs` VALUES ('8e0fcb38de58490ca9df8dd0e1fa9bc4', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 11:06:39', '启动-应用：newvm15', '我的应用');
INSERT INTO `auditlogs` VALUES ('8e42d80a8717433c9acadb9a180a1c8c', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-12 09:53:48', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('8e9965a3eeb74c43beb841ba95fdce88', '1', '系统管理员', '192.168.0.111', '2016-09-08 18:39:51', '添加-资源池：wp-Test', '资源管理');
INSERT INTO `auditlogs` VALUES ('8ee008e0359d4808ad67de92c4d5ae12', '1', '系统管理员', '192.168.0.112', '2016-09-08 18:09:35', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('8f5f025aeb1c4ea9b6ec0c18aa50e677', '1', '系统管理员', '192.168.0.111', '2016-08-29 14:52:30', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('8febf5fa663746c1b2eb17142e439f83', '1', '系统管理员', '192.168.0.111', '2016-09-07 14:04:41', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('900b6814158c45ebaf29fbddaf9278aa', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-07 16:38:43', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('90ba0ba0e0bf4e8abf0cddb71d8c7eb7', '1', '系统管理员', '192.168.0.111', '2016-09-06 17:44:23', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('90dc8275f399494b8004958f109b0696', '1', '系统管理员', '192.168.0.110', '2016-09-06 17:19:38', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('90f001cbe895436f81f7482ea873b72b', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-07 14:58:39', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('910bfc7c427b429a823fada18465c4ec', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-07 10:41:52', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('91cc2a5067044ac9a2adb4c1be19310b', '1', '系统管理员', '192.168.0.110', '2016-09-05 10:20:00', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('92225464707343ac80c54a454557d17d', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 10:47:44', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('92269d95be1646c3a6f9f11a204732f5', '1', '系统管理员', '192.168.0.110', '2016-08-30 15:51:23', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('92aa3070bd19487e9cc0a5c27afb17bd', '1', '系统管理员', '192.168.0.110', '2016-09-08 09:54:57', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('92b56e8111bb48178bbb49a10020d84c', '1', '系统管理员', '192.168.0.112', '2016-09-05 17:41:56', '修改-资源池：8.8新建source', '资源管理');
INSERT INTO `auditlogs` VALUES ('92c3a439b6fb4c8db1d9e6944c387720', '1', '系统管理员', '192.168.0.112', '2016-09-05 17:44:13', '修改-应用模块：jboss', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('92fa0069913544dab02b730b1162a05a', '1', '系统管理员', '192.168.0.111', '2016-09-12 14:51:57', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('933ffe032b6548eab972beeb0b7c9ac6', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-25 16:25:50', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('93cc4c24294d41c5a5f5e03407855b5e', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-06 10:13:54', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('94214c6e723c4d3a93a3ae1c75577d48', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-29 11:46:28', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('9434ced64d0f49ff8b115c8cce5b0f26', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-30 10:18:50', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('94b890872234449e8901ddb068812295', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-24 18:10:18', '删除-应用：newvm8', '我的应用');
INSERT INTO `auditlogs` VALUES ('94d121cc6ef54d79ba3d9610c812321a', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 10:48:22', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('94fb667568234744979a81beac0a7a91', '1', '系统管理员', '192.168.0.112', '2016-09-08 11:17:37', '删除-资源池：test', '资源管理');
INSERT INTO `auditlogs` VALUES ('9538188f382d414b8ca6a51079df34cd', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-30 16:43:41', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('95abdba22c5a444ab3e9e3776d3aa27e', '388c9242e49142998cba43a54a729f0e', 'wangping', '192.168.0.111', '2016-08-23 15:02:59', 'wangping登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('960bf7242d334bed85b18f3302b82a7e', '1', '系统管理员', '192.168.0.111', '2016-08-24 11:40:33', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('96116b8850c4434abe1e0d53122616d3', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-01 11:57:44', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('961fee25f2894448be0b0abfb759e1b4', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-06 16:55:47', '删除-应用：newvm26,newvm28', '我的应用');
INSERT INTO `auditlogs` VALUES ('9660868d094d4c11a1b31263c51edf77', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-12 15:01:00', '延期-我的应用：2016-11-30', '我的应用');
INSERT INTO `auditlogs` VALUES ('96b983a17ebb45c1862e58821e608899', '1', '系统管理员', '192.168.0.112', '2016-09-06 10:43:29', '删除-应用模块：MySQL', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('96fe299352ca4a8cbf34b02b833d221c', '1', '系统管理员', '192.168.0.111', '2016-08-24 16:03:18', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('975a7b4bd2544a33b174687c831c4fc1', '1', '系统管理员', '192.168.0.112', '2016-08-24 18:10:44', '删除-资源池：testSource', '资源管理');
INSERT INTO `auditlogs` VALUES ('978e339f2856436ba8ee629c817f522d', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-12 14:42:42', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('97e666399d7747f39054c84aab00e214', '1', '系统管理员', '192.168.0.111', '2016-08-25 16:29:00', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('989be102a4dd42ba824abe67f3683b13', '1', '系统管理员', '192.168.0.110', '2016-09-06 17:36:07', '保存报表：new', '自定义报表');
INSERT INTO `auditlogs` VALUES ('98bb122e5a59488b8aec3dd85ff989eb', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-25 18:12:47', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('993c81e3c1ec4e37b00a32f799972f1c', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-25 18:03:41', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('996aab24fbc6419ca3b522074b2f8285', '1', '系统管理员', '192.168.0.111', '2016-09-08 11:11:04', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('99ea903659ca4a00a7d95391b15989e7', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-25 18:20:04', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('9ae16b1821594c0a8f6c8eedb5bb4014', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-06 14:54:06', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('9b29da2e1553489ab301fdde81dd4894', '1', '系统管理员', '192.168.0.111', '2016-08-25 16:19:45', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('9b56c54b7c8b4bf28ad381707fc82944', '1', '系统管理员', '192.168.0.111', '2016-09-07 10:10:23', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('9be3c988f96f46edaca4c8148d86e4ea', '1', '系统管理员', '192.168.0.112', '2016-09-06 10:45:48', '添加-应用模块：test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('9cb37b142643434b8707a71a1d6b2a0f', '1', '系统管理员', '192.168.0.110', '2016-09-01 11:56:08', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('9cd0011ecfe44fa4b15543a8b9a34b8d', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-26 15:35:08', '删除-应用：ww', '我的应用');
INSERT INTO `auditlogs` VALUES ('9d30faea8f53451f88513930f788085e', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-31 09:33:23', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('9d9e83adeb4b4bc8b819e725ec4df4eb', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-25 17:56:23', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('9e1bc1882d824f838481e28e04c20047', '1', '系统管理员', '192.168.0.111', '2016-08-30 10:58:36', '将IP地址：192.168.0.8,192.168.0.2改为空闲：', 'IP地址管理');
INSERT INTO `auditlogs` VALUES ('9e1e7396c25642fca654b96ea22dedd7', '1', '系统管理员', '192.168.0.111', '2016-08-31 17:00:55', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('9e41c37e609d4b9396f54b713e0100e5', '1', '系统管理员', '192.168.0.110', '2016-09-08 16:12:16', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('9e7cd33b75cc4159ad5d8a819b9efbc2', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-24 18:13:12', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('9e9f26a3d0624674a55c6285f93b2d6b', '1', '系统管理员', '192.168.0.111', '2016-08-29 11:14:51', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('9ee1e126e9884081a3989a9154db6595', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-12 14:54:18', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('9f25ca4e55bc4af3871a7dff33c87b3a', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-06 09:49:38', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('9fb1b65e1ac045e1820adc384d8209b2', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-24 18:02:59', '删除-应用：newvm6', '我的应用');
INSERT INTO `auditlogs` VALUES ('a02ba4f7f8dc4e16b72901ace7608754', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.112', '2016-08-26 15:40:46', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('a05555cce5754a2b8ffdb27b97fa4dc1', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-30 11:32:50', '启动-应用：newVM161', '我的应用');
INSERT INTO `auditlogs` VALUES ('a09474d66b4f4a75ac8fa030f4f0ca51', '1', '系统管理员', '192.168.0.110', '2016-09-08 15:38:47', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('a0f20fd722eb421a946ec68fddf99c3e', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-09-07 11:52:43', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('a11555b162bf40fba720eb3d5a4e907b', '1', '系统管理员', '192.168.0.112', '2016-08-24 15:15:23', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('a17b67f93ad34dbba34ccb0b79ac831b', '388c9242e49142998cba43a54a729f0e', 'wangping', '192.168.0.111', '2016-08-25 18:15:42', 'wangping登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('a27e47fef80d40f4bfb8034014979069', '1', '系统管理员', '192.168.0.111', '2016-08-25 16:40:03', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('a28701fbc7534181adb742d16c33bf5a', '1', '系统管理员', '192.168.0.112', '2016-09-06 10:48:06', '删除-应用模块：test,test,test,test,test,test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('a2c52f169da14865903d7f7217692342', '1', '系统管理员', '192.168.0.111', '2016-08-31 11:44:53', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('a2c7af6065cc4673b57acdc83b25887a', '1', '系统管理员', '192.168.0.111', '2016-09-01 16:17:02', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('a2d27c0945b6476b80a94cf5ae3efe31', '1', '系统管理员', '192.168.0.110', '2016-08-24 10:59:22', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('a35a0cdf12064396b62e9a544cbe4313', '1', '系统管理员', '192.168.0.110', '2016-08-24 15:11:23', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('a368488b50d843538b82160e6d5bb54d', '1', '系统管理员', '192.168.0.111', '2016-09-12 14:33:57', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('a384e943b8db4b519ec07a531774d66e', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-08 15:44:58', '删除-应用：newvm34', '我的应用');
INSERT INTO `auditlogs` VALUES ('a398cbffd2b54c69bed92d51f8a48120', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-08 18:25:53', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('a3ebc337727945ec8b90d046a7de7220', '1', '系统管理员', '192.168.0.112', '2016-08-24 18:16:17', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('a48b671921fc48b4995f20b516119849', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-25 16:31:51', '删除-应用：newVM203', '我的应用');
INSERT INTO `auditlogs` VALUES ('a4bfc101fb994c21858279b7cb4c92d4', '1', '系统管理员', '192.168.0.111', '2016-09-01 13:59:37', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('a4c29a5391444cdf9c99829a65821975', '1', '系统管理员', '192.168.0.110', '2016-09-08 15:31:04', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('a559544f9eac48e6ac379503f47241d5', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-08 10:41:43', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('a55a46be02124835aeee0be06a9116e8', '1', '系统管理员', '192.168.0.111', '2016-08-31 15:14:21', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('a5844a2727f7438a851374795b9add3b', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-26 14:37:13', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('a64087b140d84460a8c0bc1788d6a8e8', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 14:47:52', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('a688622530174b9d9f8fbb77991a954e', '1', '系统管理员', '192.168.0.110', '2016-08-29 16:51:39', '删除-应用模块：app_tomcat', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('a81a569c664c44b69687877a3a87941c', '1', '系统管理员', '192.168.0.110', '2016-09-09 15:13:31', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('a847e26b03e04581b516eebe3c533fdd', '1', '系统管理员', '192.168.0.112', '2016-08-26 16:20:05', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('a8ff387e71484f4ea60fd7b092a0ada2', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-24 15:12:49', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('a963d3c60a004399865cd00b9f08a583', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-26 10:39:58', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('a999aee136c94055bc1832b3d485a64a', '1', '系统管理员', '192.168.0.111', '2016-09-12 16:27:57', '修改-用户：hanyumeng', '用户管理');
INSERT INTO `auditlogs` VALUES ('a999dce5954f49938bf110bbe097b3de', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-24 17:38:23', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('a9a5eb4398cf4f68871934d9b8011562', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-23 14:53:48', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('a9e582ba8e1a45e98ef26a2e1b026a73', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 15:54:00', '挂起-应用：newvm22', '我的应用');
INSERT INTO `auditlogs` VALUES ('aa0cac903d70441fa3b7efda960eed83', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-24 18:03:46', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('aae4f48675ef41368863f81e7b3f88d0', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-07 10:28:12', '增加-我的项目：test', '我的项目');
INSERT INTO `auditlogs` VALUES ('abb83a9cdeb74fbf96c4e54393df6727', '1', '系统管理员', '192.168.0.110', '2016-08-23 18:00:02', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('ac62d736b9394534a511ae484b7e01dd', '1', '系统管理员', '192.168.0.112', '2016-09-06 17:16:33', '删除-应用模块：test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('ac8daa70552a488683fe648d3adee197', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-31 16:06:18', '删除-应用：newvm25,newvm24', '我的应用');
INSERT INTO `auditlogs` VALUES ('acdc6f6fc159418c8fc123f1cada4016', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-05 15:01:49', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('ad3cb86079054237ac52e1944e7d927d', '1', '系统管理员', '192.168.0.110', '2016-08-23 17:41:01', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('ad3eab580ffd40bf85fb4eb22ba7dc50', '1', '系统管理员', '192.168.0.111', '2016-08-25 16:20:18', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('ad4261396ecd4024864705eea4edceba', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 10:41:01', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('ae50946bb41d4b7e833fc96d016ceef1', '1', '系统管理员', '192.168.0.112', '2016-09-05 17:44:53', '添加-应用模块：test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('ae59a471928d41d1963cf04db5c4ef56', '1', '系统管理员', '192.168.0.112', '2016-08-24 18:06:05', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('ae8174d7ba1d441cae637e403c45e44d', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 11:06:26', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('aebcce59e2bf43ba898563e482e5f492', '1', '系统管理员', '192.168.0.110', '2016-09-01 15:24:17', '修改-用户：hanyumeng', '用户管理');
INSERT INTO `auditlogs` VALUES ('aee05fa10bdd4766a13d10d2fa28e7dd', '1', '系统管理员', '192.168.0.112', '2016-08-24 12:28:54', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('af45bf7be6354631912e3ccc802ca265', '1', '系统管理员', '192.168.0.111', '2016-08-23 15:42:55', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('af82bf8946b842ff9cc6936bf4b49140', '1', '系统管理员', '192.168.0.110', '2016-08-25 11:08:21', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('afa7d793d2fe495ca8b9c70ae501ef23', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 15:38:51', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('affd1ec1a60a486681d325c133480836', '1', '系统管理员', '192.168.0.112', '2016-08-31 15:58:58', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('b0250c502d86456380f7e393673e63b9', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-24 18:14:05', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('b0802c0f5eb1416fb8b81e628ada7a80', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-25 18:07:21', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('b0d7b370a4d84452910880433fdce324', '1', '系统管理员', '192.168.0.112', '2016-08-26 11:02:23', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('b1a34576adf24459901b079184309465', '1', '系统管理员', '192.168.0.111', '2016-08-23 15:26:22', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('b2313fea56c64241b415acea8fe6a4ad', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-08 11:48:18', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('b2697f4c161b4fee90f4f640fa9c04b9', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-25 18:30:08', '删除-应用：wptest,test2', '我的应用');
INSERT INTO `auditlogs` VALUES ('b2a63847204d49f195187a4df7d17309', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.112', '2016-08-26 15:52:37', '挂起-应用：newVM161', '我的应用');
INSERT INTO `auditlogs` VALUES ('b2d8faec244440dab1c57f68f4eb91c4', '1', '系统管理员', '192.168.0.111', '2016-09-08 16:44:05', '保存报表：rrrr', '报表统计');
INSERT INTO `auditlogs` VALUES ('b306789f07d04a909b16845ee6c3ebc8', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-06 17:00:07', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('b3824c5c8b7a42e0a13495ebe72a9747', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-29 17:19:23', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('b395ef9bf6564f87b10a434f829e48c7', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-25 17:17:10', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('b3f1684ec6d84e85bae48dca0a89f379', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-24 18:41:54', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('b40ed1bc5c4f431087bd7d6d51155129', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-12 17:31:15', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('b43bb4b058b44102bfab085a9b81001f', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-24 15:06:25', '删除-应用：newvm3,newvm2,newvm3,newvm3,newvm3', '我的应用');
INSERT INTO `auditlogs` VALUES ('b45d446ee29d4e86968246c4b73004b2', '1', '系统管理员', '192.168.0.112', '2016-09-08 11:15:47', '添加-资源池：test', '资源管理');
INSERT INTO `auditlogs` VALUES ('b4855b31f97740cab3105ab75c54bf68', '1', '系统管理员', '192.168.0.111', '2016-08-29 09:28:14', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('b494f3a7ab244efa88606717420c1334', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-25 11:06:36', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('b4db901519754b478a5d9799da2c39ad', '1', '系统管理员', '192.168.0.111', '2016-08-24 15:51:38', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('b5333e4e60f84d4aa9a5048bdeaf0336', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-29 15:39:08', '修改-用户：hanyumeng', '用户管理');
INSERT INTO `auditlogs` VALUES ('b581a1a72bdc4535bb4278b43669f4fe', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-25 16:35:24', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('b60263e9455f432a8ad99d9a9c7b7c1d', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-25 11:07:34', '删除-标签:', '我的标签');
INSERT INTO `auditlogs` VALUES ('b614842b2a1241a497ddee20d3d4bd2c', '1', '系统管理员', '192.168.0.112', '2016-09-08 15:36:53', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('b62f655bc477422ebbb23bee12192b68', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-29 11:56:35', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('b7237922404e4bdbae55f29f15035463', '1', '系统管理员', '192.168.0.111', '2016-09-06 17:09:58', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('b769b60dd1944cdfb42d2afbc876b1f3', '1', '系统管理员', '192.168.0.110', '2016-08-30 16:21:59', '添加-资源池：new', '资源管理');
INSERT INTO `auditlogs` VALUES ('b771daa3ecff47ebb32d5b0461149157', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-24 17:58:13', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('b7a409fea492479bb48d5036d5d4d052', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-06 14:21:12', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('b81fc655cc3f4c87b0e5f0aa9c805437', '1', '系统管理员', '192.168.0.111', '2016-08-24 16:01:34', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('b885ae3de3ea46cd8a681c0bf26028be', '1', '系统管理员', '192.168.0.111', '2016-09-12 15:03:09', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('b88817f23443400681f07ca5bee54e61', '1', '系统管理员', '192.168.0.111', '2016-08-25 14:44:09', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('b888b800f36a495fa00a5cfad3f019c7', '1', '系统管理员', '192.168.0.111', '2016-09-12 14:50:10', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('b8a36143809c4f3fa7f376d05b8ba868', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-07 14:50:52', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('b8d005c1f1c54a6bb03e37a7482305f2', '388c9242e49142998cba43a54a729f0e', 'wangping', '192.168.0.111', '2016-09-12 15:59:56', 'wangping登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('b9192028bacb40d6b162dddd77c888a4', '1', '系统管理员', '192.168.0.111', '2016-08-24 15:41:59', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('b9241f0cc61b4f65995fe85402318f50', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-31 15:56:46', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('b94e2f7a2c5445089355d7bdb6d1a718', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-31 15:38:44', '启动-应用：newvm25', '我的应用');
INSERT INTO `auditlogs` VALUES ('b9a5eaa6ef6f412b8da55418572554a7', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-31 15:58:19', '删除-标签:', '我的标签');
INSERT INTO `auditlogs` VALUES ('b9d5ecb23b8745ec9c2a13f6e190a340', '1', '系统管理员', '192.168.0.111', '2016-08-25 14:18:24', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('b9e6b1e2155c413791fd5508b022fd4b', '1', '系统管理员', '192.168.0.110', '2016-08-26 09:46:42', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('baa070d5078b45b6b97ccbb2568128e7', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-08 18:24:38', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('bb056d5ee65545329f68b02c69433413', '1', '系统管理员', '192.168.0.111', '2016-09-05 17:48:14', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('bb693f7374a24378ac1fd10b7a66d437', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 15:52:59', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('bb8c1905454a4dcda8754dc52bd289a9', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-30 16:12:19', '修改-用户：王万斌', '用户管理');
INSERT INTO `auditlogs` VALUES ('bba9c6c605fa4642b48e2e4bb70049fb', '1', '系统管理员', '192.168.0.112', '2016-09-06 11:42:26', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('bbe636f3014349c79a11b6ea2e3b712c', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-31 15:36:31', '挂起-应用：newvm24', '我的应用');
INSERT INTO `auditlogs` VALUES ('bc09148d18614e98bb4f7c04b28ed9bf', '1', '系统管理员', '192.168.0.112', '2016-08-25 17:57:51', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('bc8c6b5cf3854e1c9b2237d7491ecd36', '1', '系统管理员', '192.168.0.111', '2016-08-30 16:47:26', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('bd11ec8746e147e7950503307a4443d9', '1', '系统管理员', '192.168.0.112', '2016-09-05 17:43:46', '修改-应用模块：jboss', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('bda5b14af9924800b8bf0d8ef8a4dc30', '1', '系统管理员', '192.168.0.111', '2016-08-23 17:36:02', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('bde4e84a365f4a7e8da71c2e3df7e3d6', '1', '系统管理员', '192.168.0.112', '2016-09-06 17:16:33', '删除-应用模块：test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('be34a98f7bc54e448573a7efb7cb1eb7', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-30 16:11:55', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('be55366de32b4253862300d4c096e153', '1', '系统管理员', '192.168.0.112', '2016-09-08 15:42:13', '删除-资源池：test', '资源管理');
INSERT INTO `auditlogs` VALUES ('beb45257234b4f348f78e371a050115c', '1', '系统管理员', '192.168.0.111', '2016-08-23 15:22:16', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('becf3657eadf438bbb222ad8ccee0c36', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-06 11:04:08', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('bed32b942e3143e2bab4c48d429733c6', '1', '系统管理员', '192.168.0.112', '2016-08-24 12:11:23', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('befc03f533bb4be48d68cabd3bc93fe2', '1', '系统管理员', '192.168.0.111', '2016-08-30 11:03:41', '将IP地址：192.168.0.2改为空闲：', 'IP地址管理');
INSERT INTO `auditlogs` VALUES ('bf334215dac04de4a07712db5b7f14d0', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 11:14:51', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('bff18ab3e3774c6297aa11689c08c594', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-29 15:30:23', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('bffdf50f57ca4b87ba7e8e35a2ff5882', '1', '系统管理员', '192.168.0.110', '2016-09-08 11:34:38', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('c058b09c7eff4d9888387afdbf54c67a', '1', '系统管理员', '192.168.0.112', '2016-08-24 15:06:55', '删除-资源池：test', '资源管理');
INSERT INTO `auditlogs` VALUES ('c0e5fe87c42342f09b7f8ad8b7df0cc1', '1', '系统管理员', '192.168.0.110', '2016-08-23 15:11:45', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('c0fd00ce9b59441897b8bd6853afc385', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-24 12:06:14', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('c112fe9d9fd845c5bb704248b16c9c8d', '1', '系统管理员', '192.168.0.111', '2016-08-24 10:17:33', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('c14ae205b1eb47bcbcc971159991724b', '1', '系统管理员', '192.168.0.112', '2016-08-31 15:48:24', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('c14d732d8f78455cb4233b99c2565f97', '1', '系统管理员', '192.168.0.111', '2016-08-31 09:35:30', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('c1a29430e3b646b6ad21bb20b44ea159', '1', '系统管理员', '192.168.0.112', '2016-09-06 10:45:48', '添加-应用模块：test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('c225983e7ff6426da7e9d0144124fea6', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-07 12:03:59', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('c323d356449346f897d0322341471e4a', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-25 18:21:16', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('c3639d6a0252419bb6649ca1a8bfd874', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-30 10:44:35', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('c369db815fb449aa8a6f9821d9aa49a5', '1', '系统管理员', '192.168.0.112', '2016-09-07 10:37:30', '将IP地址：192.168.0.9改为不可用：', 'IP地址管理');
INSERT INTO `auditlogs` VALUES ('c40eeedc9f974d479629e41047cde504', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-07 10:29:09', '增加-我的项目：test', '我的项目');
INSERT INTO `auditlogs` VALUES ('c436e499b56d49038863ccab01fa3eff', '1', '系统管理员', '192.168.0.112', '2016-09-06 10:45:40', '添加-应用模块：test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('c47c7356d0c54f008a565c5e8e0c5bad', '1', '系统管理员', '192.168.0.60', '2016-08-25 10:57:47', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('c4a066abcbc7460eaecd01e3b40053ea', '1', '系统管理员', '192.168.0.110', '2016-09-06 16:59:05', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('c4a6156957494f9e880d6dae053d03ee', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-30 15:38:47', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('c5bfb372b8b44698a3403e2bf1f1920a', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-12 14:57:09', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('c5e792033df8450e9fbbf5bfb641a1f1', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-12 14:56:11', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('c674f4eb4f914d148d00d333d88d5cdd', '1', '系统管理员', '192.168.0.111', '2016-08-25 15:01:55', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('c6eff1955c0943838893a52e2f371085', '1', '系统管理员', '192.168.0.111', '2016-08-30 09:11:22', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('c75257e5621a457a889881b6cf375554', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-25 18:17:27', '挂起-应用：newvm0', '我的应用');
INSERT INTO `auditlogs` VALUES ('c76bbfc5b3254b458d52730abe75c7b1', '1', '系统管理员', '192.168.0.111', '2016-09-01 15:49:56', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('c7c10296341945bd9fe3af7de91a74d0', '388c9242e49142998cba43a54a729f0e', 'wangping', '192.168.0.111', '2016-08-31 17:52:24', 'wangping登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('c82887dbb45f4b39aeb53d9e90b13a0d', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.112', '2016-08-26 15:50:49', '挂起-应用：newVM161', '我的应用');
INSERT INTO `auditlogs` VALUES ('c879c928d2f64db4ad65075da0fa4f3b', 'efb65dfc78f7404bbcb0e0001aed73bc', 'test1', '192.168.0.112', '2016-09-06 10:58:21', 'test1登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('c8c94d5a8ffd45e5923e4e7d82a2b980', '1', '系统管理员', '192.168.0.112', '2016-08-26 10:42:05', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('c8f958d286134ad598c4e3670ab99cc7', '1', '系统管理员', '192.168.0.111', '2016-09-08 18:38:45', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('ca1e011cd43448b5838b4dea611c5425', '1', '系统管理员', '192.168.0.111', '2016-09-01 10:16:43', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('cb1a4e1c3a0d4deabe36fca7e6069dcc', '1', '系统管理员', '192.168.0.111', '2016-08-23 16:32:41', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('cb52bfb4311e4403a4d8e5824a8ed75d', '1', '系统管理员', '192.168.0.111', '2016-09-08 16:03:00', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('cb78d18b0a2a4ded94740255c645ff56', '1', '系统管理员', '192.168.0.111', '2016-09-07 14:04:26', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('cc09dc952a9b4ea6a00ee83cabcd91a1', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-06 11:03:07', '将项目：61状态更改为运行：', '我的项目');
INSERT INTO `auditlogs` VALUES ('cc09ee93169b4b2cb7178c3bd54cb29b', '1', '系统管理员', '192.168.0.111', '2016-09-12 15:01:46', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('cc43f0a461e64c0d9b49e413a8543a94', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-06 16:54:56', '将项目：62状态更改为运行：', '我的项目');
INSERT INTO `auditlogs` VALUES ('cd1c4424181b4157ac649bf30790315c', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-25 16:34:53', '删除-应用：newVM164', '我的应用');
INSERT INTO `auditlogs` VALUES ('cec5af76bd514c889d242da75a74f0b8', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 11:10:05', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('cfa56d6fbb394cdcaa2e6ba0e3ab5e98', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-29 15:39:02', '修改-用户：hanyumeng', '用户管理');
INSERT INTO `auditlogs` VALUES ('cfef96073fa1487a958b3b5025c9a57f', '388c9242e49142998cba43a54a729f0e', 'wangping', '192.168.0.111', '2016-08-23 15:04:16', 'wangping登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('d094280796614a8c9760003f4614444d', '1', '系统管理员', '192.168.0.111', '2016-09-08 15:31:34', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('d10a0773765e4edab00ae46eab463e25', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-30 16:15:15', '将项目：[object Object]状态更改为运行：', '我的项目');
INSERT INTO `auditlogs` VALUES ('d10b40f2fcb24020a3bc5da292f66b0c', '1', '系统管理员', '192.168.0.112', '2016-08-25 17:23:00', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('d1106e68a8e04f1bb290562e4412115c', '1', '系统管理员', '192.168.0.112', '2016-09-01 11:42:46', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('d1236beac66e45d2afdf4a0105d26b27', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-25 16:20:47', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('d164481a73264abdbf89020eff913cf2', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-08 15:44:43', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('d2603c10d33b482593d210ffd87f4489', '1', '系统管理员', '192.168.0.111', '2016-09-12 09:54:04', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('d280ce41f32e49538dd39f3c02bef667', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 15:53:11', '停止-应用：newvm22', '我的应用');
INSERT INTO `auditlogs` VALUES ('d2c3873224b744468afeb1bbd4d29f9f', '1', '系统管理员', '192.168.0.111', '2016-08-26 14:30:14', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('d2f1b6d805574db4a5797259f5bf6ace', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-29 11:45:00', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('d31402b918a044b1800c8d0d5854320f', '1', '系统管理员', '192.168.0.111', '2016-09-12 16:01:45', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('d3842dcc77914dd39dfc9772d4785550', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-12 17:51:49', '启动-应用：newVM161', '我的应用');
INSERT INTO `auditlogs` VALUES ('d40ed37a2938452c9652049ba672d38e', '1', '系统管理员', '192.168.0.111', '2016-09-12 14:52:29', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('d5a06c4705a24434a18014b082f9f50a', '1', '系统管理员', '192.168.0.111', '2016-08-24 10:47:31', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('d6bb9f1d5edd4a6a99cb478a05105268', '1', '系统管理员', '192.168.0.111', '2016-09-05 14:51:38', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('d7ad14731f7f426a9ebd808061463626', '1', '系统管理员', '192.168.0.111', '2016-09-07 10:03:09', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('d7cd0a36e89745b29bef2540a9868f0c', '1', '系统管理员', '192.168.0.110', '2016-08-26 11:22:54', '删除-资源池：失败', '资源管理');
INSERT INTO `auditlogs` VALUES ('d7da92c2ab674e77842dcd2089c538c3', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-24 10:57:46', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('d80f203d93f64b0782f42b1c5c5ef492', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-07 10:28:56', '删除-我的项目：test', '我的项目');
INSERT INTO `auditlogs` VALUES ('d83f1da8fea24a309f6c9144fdb373e5', '1', '系统管理员', '192.168.0.111', '2016-08-31 11:57:17', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('d84f02fe543e45c8a3d25aa46a5ad2f1', '1', '系统管理员', '192.168.0.111', '2016-09-07 17:27:21', '保存报表：save', '报表统计');
INSERT INTO `auditlogs` VALUES ('d865135660db4df09788417fb8fc2f64', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-25 14:18:44', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('d9090059ec9f447090c6003cfbcf065b', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-08 11:12:06', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('d93da979f2174d138eca3d034de540fa', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-08 16:37:16', '删除-应用：newvm36', '我的应用');
INSERT INTO `auditlogs` VALUES ('d9931802f05143179bd9a8534bc35a46', '1', '系统管理员', '192.168.0.111', '2016-08-30 09:57:03', '将IP地址：192.168.0.9改为空闲：', 'IP地址管理');
INSERT INTO `auditlogs` VALUES ('da0bacbd8d50485fb9e72f6c4364d931', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-26 11:55:07', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('da69a668229e401cade4750e119d959c', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-26 15:34:37', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('da9a57ac8e0b4550a4065aa0d76ad235', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-06 11:02:09', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('dac351a4780a4291870e7eee6f33c0bc', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 11:26:52', '启动-应用：newvm18', '我的应用');
INSERT INTO `auditlogs` VALUES ('db140ca8beb1467691e9a66f92506c37', '1', '系统管理员', '192.168.0.111', '2016-08-30 15:34:43', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('db24950d35ed48bb84de293cbed8f769', '1', '系统管理员', '192.168.0.112', '2016-09-06 10:45:47', '添加-应用模块：test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('db3d3958ed904483b466029a00985dd9', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-30 15:40:34', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('db713c33792847a9bff695f7f47e7ec8', '1', '系统管理员', '192.168.0.111', '2016-09-06 16:56:00', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('db7884be4e084c08b34278c7f4627583', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-06 11:02:37', '将项目：61状态更改为运行：', '我的项目');
INSERT INTO `auditlogs` VALUES ('dbe387e1a3534040b039217297e51e4e', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-25 10:44:19', '删除-标签:', '我的标签');
INSERT INTO `auditlogs` VALUES ('dbe494aa18cf4c369440bab8f53f5a63', '1', '系统管理员', '192.168.0.110', '2016-08-30 17:16:34', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('dc2bf1f1278b4b5da32a31f9345a21b6', '1', '系统管理员', '192.168.0.110', '2016-08-24 16:43:41', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('dc3a93f872d24c058634bc8620116869', '1', '系统管理员', '192.168.0.111', '2016-08-25 17:49:17', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('dc778de1e6fd4162b4cd8f247641a667', 'efb65dfc78f7404bbcb0e0001aed73bc', 'test1', '192.168.0.112', '2016-09-06 11:00:22', '修改-用户：test1', '用户管理');
INSERT INTO `auditlogs` VALUES ('dc942131437a45c69687f8cef2691474', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-30 16:48:53', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('dcafed077fc64bd4a62888991d46b1ab', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 16:52:52', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('dce193906b4c4408af97356a6ba405b2', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-25 16:31:59', '删除-应用：newVM200', '我的应用');
INSERT INTO `auditlogs` VALUES ('ddbc68d1504e434db3b55a5720f16bcb', '1', '系统管理员', '192.168.0.112', '2016-08-26 14:30:10', '删除-资源池：Test', '资源管理');
INSERT INTO `auditlogs` VALUES ('df843ff7e8414a02bde33d48e6978234', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-09-07 10:07:45', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('e012a54d63f64a9a89cc83d41d74e18a', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-09-06 17:43:20', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('e04eef73ccb04beb81dd3b0f3a8bf960', '1', '系统管理员', '192.168.0.110', '2016-09-06 18:12:09', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('e25cc99aceaf41c4b478986042bfaf99', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-12 14:45:32', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('e263de06fb5b4833be27cf8be5391d27', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-25 18:13:19', '删除-应用：newVM170', '我的应用');
INSERT INTO `auditlogs` VALUES ('e2a37818cdcb4b4bb3cbadbfd10521d8', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 10:39:24', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('e2c29cbc5bec433fbb82e962853b8294', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-24 15:08:50', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('e2e6199df57b4357acb07fdde846f395', '1', '系统管理员', '192.168.0.111', '2016-09-12 14:54:49', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('e33105f240414ee5ac60e95133ce1f6f', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-25 17:08:16', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('e34c18a8763e4fee8780a08485cc5526', '388c9242e49142998cba43a54a729f0e', 'wangping', '192.168.0.111', '2016-09-12 15:48:21', 'wangping登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('e3701cc6c77a414eb232904fd1954034', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-25 18:17:33', '删除-应用：newvm0', '我的应用');
INSERT INTO `auditlogs` VALUES ('e3866fe88de448fc879c8e78269ab86d', '1', '系统管理员', '192.168.0.110', '2016-08-31 09:23:06', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('e3b3944a0d68414f91f4385a91727ab2', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-25 16:32:55', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('e3c714a1f66741ea9d54395f949865e5', '1', '系统管理员', '192.168.0.112', '2016-09-06 11:01:25', '删除-用户：test1', '用户管理');
INSERT INTO `auditlogs` VALUES ('e3d6e38f67d140aaaa6d8900ccc49cb2', '1', '系统管理员', '192.168.0.110', '2016-08-24 17:55:03', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('e3e2ac862d034a02b6490a39c0e10270', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-09-12 15:11:41', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('e3e7b5a522144ff0b30928f54fbc3441', '1', '系统管理员', '192.168.0.110', '2016-09-12 09:22:11', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('e4057b6753c748189c80c98c38661c20', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-25 18:16:32', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('e457f661660e4f30a72d3347fa6475ae', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-25 17:10:36', '删除-应用：newVM165', '我的应用');
INSERT INTO `auditlogs` VALUES ('e4b851ada1c944208d90b5e2d7b699b0', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-01 11:25:12', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('e550040c228f4deda542903e505655d6', '1', '系统管理员', '192.168.0.112', '2016-09-06 10:45:39', '添加-应用模块：test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('e5cb0251b04e4cd8abefb7a376dce18e', '1', '系统管理员', '192.168.0.111', '2016-09-06 10:25:01', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('e604b36b4db8484095b93cb2c51f3c7b', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-31 15:30:03', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('e6069f2be6aa4d3f8d9391048a84cab8', '1', '系统管理员', '192.168.0.111', '2016-09-07 10:08:06', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('e60f1c4f13f74e0aa28dc48b2b85c9d2', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.112', '2016-08-26 15:42:41', '启动-应用：newVM161', '我的应用');
INSERT INTO `auditlogs` VALUES ('e6350bbca3314a57a5c6cacab746269c', '1', '系统管理员', '192.168.0.112', '2016-08-24 18:12:58', '添加-资源池：testSource', '资源管理');
INSERT INTO `auditlogs` VALUES ('e6effcb51ee2475db5eb9811e43789e0', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-29 17:20:47', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('e71f4af73cb04bfeb2d4f197f6a76a04', '1', '系统管理员', '192.168.0.110', '2016-08-23 16:44:21', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('e73a13fd7f6b4e63ac5de334c8b38bd4', '1', '系统管理员', '192.168.0.112', '2016-09-05 15:48:34', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('e8bf6e1312834d09b97ea18e7ee3ac71', '1', '系统管理员', '192.168.0.111', '2016-09-07 14:28:55', '删除-自定义报表：new', '报表统计');
INSERT INTO `auditlogs` VALUES ('e8df19651357462a9fda994421e66e96', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-09-07 14:30:22', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('e9059e70e7b54ae7a67acc3bb4778960', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-08 11:45:35', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('e96041f4441140e18a35bdf62c54d33c', '1', '系统管理员', '192.168.0.112', '2016-09-07 10:30:52', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('e9a896717183472b85b8e954a19af94c', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-25 18:18:23', '删除-应用：newvm9', '我的应用');
INSERT INTO `auditlogs` VALUES ('e9fb6f1fd71e460f886335275fdf12fa', '1', '系统管理员', '192.168.0.112', '2016-08-24 18:03:57', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('ea24072b71c24015b01d8d67cf8541a8', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-25 16:26:52', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('ea7b1c46417b4626a3c9ef07c900c358', '1', '系统管理员', '192.168.0.60', '2016-08-25 14:47:04', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('eac8303ea8644f27a1cfc14ddc954134', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.112', '2016-08-26 15:52:16', '启动-应用：newVM161', '我的应用');
INSERT INTO `auditlogs` VALUES ('eadba336f2964801a87c848fcfc97442', '1', '系统管理员', '192.168.0.110', '2016-09-06 17:39:33', '保存报表：new2', '报表统计');
INSERT INTO `auditlogs` VALUES ('eadea7e06cfc409b81756ca4fb20184e', '1', '系统管理员', '192.168.0.111', '2016-08-31 17:23:34', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('eb1a1bdf04b54a498094871f842bed62', '1', '系统管理员', '192.168.0.112', '2016-09-05 17:44:02', '修改-应用模块：jboss', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('eb2745f5879943f4b606100087ad05ab', '388c9242e49142998cba43a54a729f0e', 'wangping', '192.168.0.111', '2016-09-06 10:17:49', 'wangping登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('eb3e19b569664f31857e0b5f034bb983', '1', '系统管理员', '192.168.0.111', '2016-09-12 10:37:32', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('eb6efe4ee43d41e48f919fe32167d969', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-07 15:06:41', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('ebda139bae85448e9ac9e6eebb6cffcc', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.112', '2016-08-26 15:51:18', '启动-应用：newVM161', '我的应用');
INSERT INTO `auditlogs` VALUES ('ec296006facf4fedbd0e0c8b5d3e3f91', '1', '系统管理员', '192.168.0.110', '2016-08-30 16:22:10', '删除-资源池：new', '资源管理');
INSERT INTO `auditlogs` VALUES ('eccc5f9f31e544aca2de5c08ba74388d', '1', '系统管理员', '192.168.0.111', '2016-09-01 11:43:54', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('ede2b8a7854d45458917f948322b2d4f', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-09-08 10:18:40', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('ee1e342184114bd5b9e9533af020f40d', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-25 10:39:36', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('ee85192090a64bd698378defec2ecb01', '1', '系统管理员', '192.168.0.112', '2016-09-07 10:47:20', '删除-自定义报表：test', '报表统计');
INSERT INTO `auditlogs` VALUES ('eef94020387b4ba3b0fa649aa4a1b07a', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-12 11:26:24', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('efd67bc21f8846ce90f8e5c028ddfd0e', '1', '系统管理员', '192.168.0.111', '2016-09-07 09:58:30', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('f0159240eed74d4c98e9d26ae9239fdf', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-09-08 12:14:00', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('f01be8a05ff348bda31e7fdff1d6323f', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-24 17:58:33', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('f01bf4afd31d41e1aeaddd609531d9d8', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.60', '2016-08-25 10:36:21', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('f083d40d4b7641e3b482b2a664e9beb4', '1', '系统管理员', '192.168.0.111', '2016-08-24 11:00:53', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('f103a3f90aa94635902bf915e23176c0', '1', '系统管理员', '192.168.0.111', '2016-09-05 09:30:12', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('f14df2fd921742ce910cadc0ae4d8cc5', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-26 16:31:26', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('f177630af0b84585bd3b0aed947823cc', '1', '系统管理员', '192.168.0.111', '2016-09-07 15:18:39', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('f1aeaf3c34cc45adb454956870a07588', '1', '系统管理员', '192.168.0.110', '2016-08-29 09:18:14', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('f21658b55c884cdf99085099663c880d', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-26 15:39:20', '删除-应用：newVM172', '我的应用');
INSERT INTO `auditlogs` VALUES ('f2343015b50b4e169737f8c24bf34627', '1', '系统管理员', '192.168.0.111', '2016-08-24 15:55:29', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('f23bae84b97444e8860ae067dce5fd2d', '1', '系统管理员', '192.168.0.112', '2016-09-06 14:53:32', '添加-应用模块：test', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('f247331ad502458fb2b88ff1f41e7055', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-24 14:55:31', '自助申请成功', '自助申请');
INSERT INTO `auditlogs` VALUES ('f2689578058e432ba5c757d0e73758ba', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-02 16:44:28', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('f2e00dfa657a4044b7ed0d263bd39181', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-09-07 14:45:14', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('f391add29ecd4b8f8adc052a1b8a9d6f', '1', '系统管理员', '192.168.0.112', '2016-09-07 10:36:26', '修改-应用模块：test大法师是对方', '应用模块管理');
INSERT INTO `auditlogs` VALUES ('f397e6013fa9472f8ae1ac2943b4ea64', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-24 12:29:18', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('f3daad4acbe34305b8221b7177fd715b', '1', '系统管理员', '192.168.0.111', '2016-09-12 15:32:41', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('f3f712e5c5f648908c8e1e5c29b79f9b', '1', '系统管理员', '192.168.0.111', '2016-09-12 14:42:07', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('f3f7ba2407fb416696daf2a160987045', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-09-08 10:39:59', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('f4fdba545bc94c7aadcc590d26e0bd9c', '1', '系统管理员', '192.168.0.112', '2016-09-01 11:25:38', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('f51969d7e8a548b9b0d8eeb9b2c98140', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-31 11:44:13', '启动-应用：newVM161', '我的应用');
INSERT INTO `auditlogs` VALUES ('f5d2b5d4d83b4b9a9348cdae6b745dd3', '1', '系统管理员', '192.168.0.111', '2016-08-24 13:58:13', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('f5de136424ff4321b1a463ad1c0b3f64', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-31 15:59:52', '王万斌登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('f619f9e033a5456ba2aca21dfb46c271', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-30 10:47:29', '删除-应用：newvm22', '我的应用');
INSERT INTO `auditlogs` VALUES ('f6268fe5c6c24808b42c477b4191d4dc', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-30 16:15:30', '将项目：[object Object]状态更改为运行：', '我的项目');
INSERT INTO `auditlogs` VALUES ('f639e32daea3498e868f39df9aab947a', '1', '系统管理员', '192.168.0.111', '2016-08-31 12:05:54', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('f646b4cfc92646888e49679579e9f588', '1', '系统管理员', '192.168.0.112', '2016-09-07 10:37:02', '将IP地址：192.168.0.9改为空闲：', 'IP地址管理');
INSERT INTO `auditlogs` VALUES ('f64fb674ead54f2aa22346cd2ab4d335', '1', '系统管理员', '192.168.0.111', '2016-08-31 17:52:49', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('f6a217b702904a37b08070b7a99cd70b', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-31 17:11:36', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('f6c74d0558bc4246888d6a811d971f01', '1', '系统管理员', '192.168.0.111', '2016-09-01 10:33:08', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('f736e177fca1454583e463a06b5d0fd5', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 14:49:34', '删除-应用：newvm21', '我的应用');
INSERT INTO `auditlogs` VALUES ('f785dc3717b44898ada2c2de6f4005a9', '1', '系统管理员', '192.168.0.111', '2016-09-06 15:18:14', '删除-资源池：失败', '资源管理');
INSERT INTO `auditlogs` VALUES ('f89046f1aa5149a3b20898c3a3f52508', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-09-06 15:25:00', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('f8d756384986462daf2047c227e58ede', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-24 17:53:01', '删除-应用：newvm4', '我的应用');
INSERT INTO `auditlogs` VALUES ('f8f80ae91fc545d9b4babbf9351d0a07', '1', '系统管理员', '192.168.0.112', '2016-08-24 17:53:29', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('f993bea6a3524d0dbfb757bde3871dd7', '388c9242e49142998cba43a54a729f0e', 'wangping', '192.168.0.111', '2016-08-31 17:55:55', 'wangping登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('fa2e84a4d7e4465ba5dc7d0ccabf71c7', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-02 16:41:15', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('faa71f539f734e449fd590829ad474dc', '1', '系统管理员', '192.168.0.111', '2016-09-05 15:40:12', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('fb1068c3d2df4f2a84d0b8211590fda2', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.112', '2016-09-08 18:05:19', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('fb66f34567da44d4a1704b637e4b27f1', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.112', '2016-08-26 11:07:12', '挂起-应用：newvm15', '我的应用');
INSERT INTO `auditlogs` VALUES ('fb6af6ba1e5b4c43b67d357d8ad2c855', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-09-12 17:52:17', '停止-应用：newVM161', '我的应用');
INSERT INTO `auditlogs` VALUES ('fb83ba8c88be439aa26df45c40addcda', '1', '系统管理员', '192.168.0.60', '2016-08-25 10:31:41', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('fc0bc263fb5f435f99a36abefbbc9ab4', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.110', '2016-08-24 14:48:38', 'hanyumeng登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('fc44ef1847bf4764963fbefa77d7c753', '1', '系统管理员', '192.168.0.111', '2016-08-23 16:36:12', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('fd2456b1a9364b0d9091c54eab10995f', '1', '系统管理员', '192.168.0.110', '2016-09-12 15:11:26', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('fd4b45b898d5429f9657acf99a8bfd7a', '1', '系统管理员', '192.168.0.111', '2016-08-29 11:56:45', '系统管理员登录成功', '用户登录');
INSERT INTO `auditlogs` VALUES ('fe4a3a0e8e2c46aabca91b51543c86b0', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '192.168.0.111', '2016-08-31 11:42:08', '启动-应用：newvm24', '我的应用');
INSERT INTO `auditlogs` VALUES ('fea80a7f149d430d88d77ad188dd5185', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '192.168.0.111', '2016-08-30 16:45:50', '挂起-应用：newVM161', '我的应用');

-- ----------------------------
-- Table structure for child_task
-- ----------------------------
DROP TABLE IF EXISTS `child_task`;
CREATE TABLE `child_task` (
  `uuid` varchar(32) NOT NULL,
  `task_uuid` varchar(32) DEFAULT NULL,
  `child_name` varchar(45) DEFAULT NULL,
  `child_type` varchar(45) DEFAULT NULL,
  `child_status` varchar(45) DEFAULT NULL,
  `child_end_time` timestamp NULL DEFAULT NULL,
  `child_begin_time` timestamp NULL DEFAULT NULL,
  `child_reason` varchar(255) DEFAULT NULL,
  `child_order` int(4) DEFAULT NULL,
  `child_operation_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of child_task
-- ----------------------------
INSERT INTO `child_task` VALUES ('b5d3dc4ce6ad475c8270ca2f2510b68f', '20b6cf667de644da813860c976788389', '设置IP', '', '已完成', '2016-08-25 18:21:48', '2016-08-25 18:21:13', null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('cbd71ab59f3749fe9215b3f3f2f4b482', '20b6cf667de644da813860c976788389', '添加互信', '', '已完成', '2016-08-25 18:21:48', '2016-08-25 18:21:48', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('e3bd1e00cabb4352a65f31533c81251e', '20b6cf667de644da813860c976788389', '附加存储', '', '已完成', '2016-08-25 18:24:41', '2016-08-25 18:21:48', null, '5', '附加存储');
INSERT INTO `child_task` VALUES ('aa0eb28f56224acca1966007461d23fa', '20b6cf667de644da813860c976788389', '安装应用-app_tomcat', '', '已完成', '2016-08-25 18:28:40', '2016-08-25 18:24:41', null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('0e7a02b2cc5841c39b4bef83ecd7cf53', '20b6cf667de644da813860c976788389', '清空记录', '', '失败', '2016-08-25 18:29:58', '2016-08-25 18:28:40', 'Could not find virtual machine \'500f21c1-a980-75f6-981b-bd45ee828505\'', '7', '清空记录');
INSERT INTO `child_task` VALUES ('54c2ca1f76f34959a647be29de421210', 'ac53539e95e14f17bccff2cbff1f3a4f', '克隆虚拟机', '', '已完成', '2016-08-25 18:24:40', '2016-08-25 18:19:15', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('4cbc4eb5c6e249278695b15295fe1e28', 'ac53539e95e14f17bccff2cbff1f3a4f', '设置IP', '', '已完成', '2016-08-25 18:25:15', '2016-08-25 18:24:40', null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('3b432f69b0fa4405ad8086615accb811', '3eb70bdd3f6349a3bd409d3fa362ff8f', '是否审批', '', '已完成', '2016-08-24 18:06:18', '2016-08-24 18:06:18', null, '1', '是否审批');
INSERT INTO `child_task` VALUES ('066b120f6a5e4437b1a69e09b6d6b776', '3eb70bdd3f6349a3bd409d3fa362ff8f', '克隆虚拟机', '', '已完成', '2016-08-24 18:08:10', '2016-08-24 18:06:18', 'VMName:newvm8 VMUuid:500fb720-9dad-8ab1-e723-66be790e437d', '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('594d271708984df58426ddce95882ecd', '3eb70bdd3f6349a3bd409d3fa362ff8f', '设置IP', '', '已完成', '2016-08-24 18:08:41', '2016-08-24 18:08:10', 'pid:1395', '3', '设置IP');
INSERT INTO `child_task` VALUES ('d3b285a009d64dfab503ac71a14c16de', '3eb70bdd3f6349a3bd409d3fa362ff8f', '添加互信', '', '已完成', '2016-08-24 18:08:41', '2016-08-24 18:08:41', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('b5664d7125194bc9a2962c5c889fe772', '3eb70bdd3f6349a3bd409d3fa362ff8f', '安装应用-app_tomcat', '', '已完成', '2016-08-24 18:09:32', '2016-08-24 18:08:41', 'stats:True', '6', '安装应用');
INSERT INTO `child_task` VALUES ('d2ae79ee7cd342edb1d47ab9b5d92c90', '3eb70bdd3f6349a3bd409d3fa362ff8f', '清空记录', '', '已完成', '2016-08-24 18:09:32', '2016-08-24 18:09:32', 'pid:1642', '7', '清空记录');
INSERT INTO `child_task` VALUES ('ad875af6f6fc4ff09ad388d7550c9519', '4fcf1b7135764789b938826739d47fb7', '克隆虚拟机', '', '已完成', '2016-08-24 18:16:01', '2016-08-24 18:14:05', 'VMName:newvm9 VMUuid:500f1c75-cb3d-e18f-cd65-8e849029d112', '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('ea72a3df1af94bcdac1436038193b2f2', '4fcf1b7135764789b938826739d47fb7', '设置IP', '', '已完成', '2016-08-24 18:16:26', '2016-08-24 18:16:01', 'pid:1399', '3', '设置IP');
INSERT INTO `child_task` VALUES ('45fcafe54ae646baafa87e51bd663640', '4fcf1b7135764789b938826739d47fb7', '添加互信', '', '已完成', '2016-08-24 18:16:26', '2016-08-24 18:16:26', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('b1649c5ea17a4717a8f3c5d315e6b719', '4fcf1b7135764789b938826739d47fb7', '安装应用-app_tomcat', '', '已完成', '2016-08-24 18:17:16', '2016-08-24 18:16:26', 'stats:True', '6', '安装应用');
INSERT INTO `child_task` VALUES ('e7b22594f6794783b0d60313f6278068', '4fcf1b7135764789b938826739d47fb7', '清空记录', '', '已完成', '2016-08-24 18:17:16', '2016-08-24 18:17:16', 'pid:1642', '7', '清空记录');
INSERT INTO `child_task` VALUES ('47e06c09707348238e08cb7fa11da363', '76c2111f9bb242f5b283ee7036b0f327', '克隆虚拟机', '', '未开始', null, null, null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('95504d99a4774b3dba662463638dc5cc', '76c2111f9bb242f5b283ee7036b0f327', '设置IP', '', '未开始', null, null, null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('ad0c13f218f444708af34a685e8d2e13', '76c2111f9bb242f5b283ee7036b0f327', '添加互信', '', '未开始', null, null, null, '4', '添加互信');
INSERT INTO `child_task` VALUES ('e3a9ef18518844c2a05bca794607a275', '76c2111f9bb242f5b283ee7036b0f327', '安装应用-app_tomcat', '', '未开始', null, null, null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('e006a022648840479647edbaade081ae', '76c2111f9bb242f5b283ee7036b0f327', '清空记录', '', '未开始', null, null, null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('b112b23ea24d440f92db4063d25a5b9c', '7b674e1b980948fb8256f955aaac6310', '克隆虚拟机', '', '未开始', null, null, null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('59df9429cbd84a88b522f1cd1220066f', '7b674e1b980948fb8256f955aaac6310', '设置IP', '', '未开始', null, null, null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('8833de15e3174547be3db7a29a51b707', '7b674e1b980948fb8256f955aaac6310', '添加互信', '', '未开始', null, null, null, '4', '添加互信');
INSERT INTO `child_task` VALUES ('7582246d844742c8a09c8a88dc45956c', '7b674e1b980948fb8256f955aaac6310', '安装应用-app_tomcat', '', '未开始', null, null, null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('e02813d73586450f9292e7e58b893055', '7b674e1b980948fb8256f955aaac6310', '清空记录', '', '未开始', null, null, null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('8f9961793939497c954dff05e60ea44c', 'f9fd5380d94143138481f3d79acb01da', '克隆虚拟机', '', '未开始', null, null, null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('11127cfc46904e75bcbd7c3e8029b25c', 'f9fd5380d94143138481f3d79acb01da', '设置IP', '', '未开始', null, null, null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('ffdfa5a2ca6e46148e70541419aff193', 'f9fd5380d94143138481f3d79acb01da', '添加互信', '', '未开始', null, null, null, '4', '添加互信');
INSERT INTO `child_task` VALUES ('181341d09ac54c49baa16792a362662b', 'f9fd5380d94143138481f3d79acb01da', '安装应用-app_tomcat', '', '未开始', null, null, null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('d49711862b6943d48d341e79e3d0c716', 'f9fd5380d94143138481f3d79acb01da', '清空记录', '', '未开始', null, null, null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('9bd6b52f5b9f4f01b8364dce5d5805aa', '77215097cb7642109d5d45cde81cc1b6', '克隆虚拟机', '', '未开始', null, null, null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('d5804a1130b4478686fd4ea04fc7ef5f', '77215097cb7642109d5d45cde81cc1b6', '设置IP', '', '未开始', null, null, null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('628ea22beab541ad8a81a7a46f81bf02', '77215097cb7642109d5d45cde81cc1b6', '添加互信', '', '未开始', null, null, null, '4', '添加互信');
INSERT INTO `child_task` VALUES ('29fb9d4feccb4d2593cc435035615ba6', '77215097cb7642109d5d45cde81cc1b6', '安装应用-app_tomcat', '', '未开始', null, null, null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('984c242712e943229f72c7710714a30f', '77215097cb7642109d5d45cde81cc1b6', '清空记录', '', '未开始', null, null, null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('24a00f8c6c564613b0bcd8d935516d2b', '9fcea9e0d994406bbe340ab7be330297', '克隆虚拟机', '', '已完成', '2016-08-25 17:20:28', '2016-08-25 17:17:10', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('3411c18e581d46a6bfa2aaf020903519', '9fcea9e0d994406bbe340ab7be330297', '设置IP', '', '已完成', '2016-08-25 17:20:54', '2016-08-25 17:20:28', null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('08477bd423734bb6b45f13176cac795a', '9fcea9e0d994406bbe340ab7be330297', '添加互信', '', '已完成', '2016-08-25 17:20:54', '2016-08-25 17:20:54', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('a6860226d8504967ab262d6a0f32953f', '9fcea9e0d994406bbe340ab7be330297', '安装应用-app_tomcat', '', '已完成', '2016-08-25 17:21:46', '2016-08-25 17:20:54', null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('5a2d7375b9194c42a4fee88a9b26d90c', '9fcea9e0d994406bbe340ab7be330297', '清空记录', '', '已完成', '2016-08-25 17:21:46', '2016-08-25 17:21:46', null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('ebc0de5025c742a9b4f8e01d42c44990', 'eadfd333f7b345b895ca3ce99977201d', '克隆虚拟机', '', '未开始', null, null, null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('59d8256df1b6407e9d007b932ab305cf', 'eadfd333f7b345b895ca3ce99977201d', '设置IP', '', '未开始', null, null, null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('50ec50b6e145425ca655aa1eb4f55e44', 'eadfd333f7b345b895ca3ce99977201d', '添加互信', '', '未开始', null, null, null, '4', '添加互信');
INSERT INTO `child_task` VALUES ('d8ec4969f0f44b26a5b081788973e85e', 'eadfd333f7b345b895ca3ce99977201d', '安装应用-app_tomcat', '', '未开始', null, null, null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('0f1b640078e9464aa4f30974198842aa', 'eadfd333f7b345b895ca3ce99977201d', '清空记录', '', '未开始', null, null, null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('5c17fef840eb446c8fed7e26fd83c911', '59c6710307a149fd8e7461903f38ed35', '克隆虚拟机', '', '已完成', '2016-08-25 17:56:20', '2016-08-25 17:54:07', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('40dea0737aa54d38aa5dedb8eec0ad1d', '59c6710307a149fd8e7461903f38ed35', '设置IP', '', '已完成', '2016-08-25 17:56:55', '2016-08-25 17:56:20', null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('5b5cdc33df5c44998c5944d5b6ab43f3', '59c6710307a149fd8e7461903f38ed35', '添加互信', '', '已完成', '2016-08-25 17:56:55', '2016-08-25 17:56:55', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('9a3a4f8ef0274f28b5ad1e7501be5084', '59c6710307a149fd8e7461903f38ed35', '安装应用-app_tomcat', '', '已完成', '2016-08-25 17:57:46', '2016-08-25 17:56:55', null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('59797d3f354d4e56a5009fdd43bc50c8', '59c6710307a149fd8e7461903f38ed35', '清空记录', '', '已完成', '2016-08-25 18:00:22', '2016-08-25 17:57:46', null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('94ffe030668b4ace9a51ed987c9aaad3', '32d41c076c0641ccb35051758fcbd565', '克隆虚拟机', '', '已完成', '2016-08-25 18:00:22', '2016-08-25 17:56:24', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('9e7bf7b718de44eda1f1d6a8dbb0497b', '32d41c076c0641ccb35051758fcbd565', '设置IP', '', '已完成', '2016-08-25 18:00:55', '2016-08-25 18:00:22', null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('87199102a8774596ab9d4edb8fe832f1', '32d41c076c0641ccb35051758fcbd565', '添加互信', '', '已完成', '2016-08-25 18:00:55', '2016-08-25 18:00:55', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('d9abcffca85644d0833250736eab513d', '32d41c076c0641ccb35051758fcbd565', '安装应用-app_tomcat', '', '已完成', '2016-08-25 18:01:48', '2016-08-25 18:00:55', null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('afbac60b850b4978b90deecc77f51590', '32d41c076c0641ccb35051758fcbd565', '清空记录', '', '已完成', '2016-08-25 18:01:48', '2016-08-25 18:01:48', null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('3f53e47bb1804229805b670e12e64664', '15f30101c4a34303b3315c68be610efb', '克隆虚拟机', '', '已完成', '2016-08-25 18:10:03', '2016-08-25 18:07:21', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('c278ee31e609494096e493bfdbd197c3', '15f30101c4a34303b3315c68be610efb', '设置IP', '', '已完成', '2016-08-25 18:10:35', '2016-08-25 18:10:03', null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('0e58071b7c9d49c8a6886babbe5cbb84', '15f30101c4a34303b3315c68be610efb', '添加互信', '', '已完成', '2016-08-25 18:10:35', '2016-08-25 18:10:35', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('6e7e831f1bee46e0a13b73b289ac30ee', '15f30101c4a34303b3315c68be610efb', '安装应用-app_tomcat', '', '已完成', '2016-08-25 18:11:27', '2016-08-25 18:10:35', null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('7ff38d63b83843fd9112a542f43c9461', '15f30101c4a34303b3315c68be610efb', '清空记录', '', '已完成', '2016-08-25 18:11:27', '2016-08-25 18:11:27', null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('71fb2e5aab0244988db27d7b3fd95e84', 'f5411132d4154828ab66fcfb46d963a2', '克隆虚拟机', '', '已完成', '2016-08-25 18:15:55', '2016-08-25 18:14:01', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('4a3da45c7adf461da172b0a81faf220a', 'f5411132d4154828ab66fcfb46d963a2', '设置IP', '', '已完成', '2016-08-25 18:16:28', '2016-08-25 18:15:55', null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('aabfc69fab444bb38cd0ee8ca2ae3a37', 'f5411132d4154828ab66fcfb46d963a2', '添加互信', '', '已完成', '2016-08-25 18:16:28', '2016-08-25 18:16:28', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('0164fe6e25d24066b9bde4f6192a81eb', 'f5411132d4154828ab66fcfb46d963a2', '安装应用-app_tomcat', '', '已完成', '2016-08-25 18:17:19', '2016-08-25 18:16:28', null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('c9fc8ecd0e2b4130ba1e81e0dfcbf80e', 'f5411132d4154828ab66fcfb46d963a2', '清空记录', '', '已完成', '2016-08-25 18:17:34', '2016-08-25 18:17:19', null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('f16a4284dc924f5b8bf35909e13076a6', '20b6cf667de644da813860c976788389', '克隆虚拟机', '', '已完成', '2016-08-25 18:21:13', '2016-08-25 18:19:12', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('3973b297ce2348b59f5791b6b9620424', '45e3638d4e344c0d826ecd5ddf7f7f66', '清空记录', '', '未开始', null, null, null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('c4c6f884cd784f29b18ca22ee023b1f6', '45e3638d4e344c0d826ecd5ddf7f7f66', '安装应用-app_tomcat', '', '未开始', null, null, null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('3c804da343834499949f5e27e2d4ba7b', '45e3638d4e344c0d826ecd5ddf7f7f66', '添加互信', '', '未开始', null, null, null, '4', '添加互信');
INSERT INTO `child_task` VALUES ('a606f66aa69246d8932a4056853479b4', '45e3638d4e344c0d826ecd5ddf7f7f66', '设置IP', '', '未开始', null, null, null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('c1c1431274c84f3c8045d7c34b006a08', '45e3638d4e344c0d826ecd5ddf7f7f66', '克隆虚拟机', '', '未开始', null, null, null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('c14f6fd568a3460f8609ce75a0a34132', '3d08af1121654128b14156e238ab19e7', '克隆虚拟机', '', '未开始', null, null, null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('b93dfa0704ff4e6293fc21a22b23734c', '3d08af1121654128b14156e238ab19e7', '设置IP', '', '未开始', null, null, null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('da1ec22f0dee41cda6df50b503a1d8cd', '3d08af1121654128b14156e238ab19e7', '添加互信', '', '未开始', null, null, null, '4', '添加互信');
INSERT INTO `child_task` VALUES ('56dc871c94544998ac9ab71ea688ca1d', '3d08af1121654128b14156e238ab19e7', '安装应用-app_tomcat', '', '未开始', null, null, null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('400529d13f974c39a80be0ca5d759e3b', '3d08af1121654128b14156e238ab19e7', '清空记录', '', '未开始', null, null, null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('028629ea5f2e443ab69ab1866b77d64c', 'a4fee99ad1c5410a981b5d9a9580c7a8', '克隆虚拟机', '', '未开始', null, null, null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('66687d6fb7984e8fb7ee63bef7105d98', 'a4fee99ad1c5410a981b5d9a9580c7a8', '设置IP', '', '未开始', null, null, null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('b19486569f554a4095b4540b3890de4f', 'a4fee99ad1c5410a981b5d9a9580c7a8', '添加互信', '', '未开始', null, null, null, '4', '添加互信');
INSERT INTO `child_task` VALUES ('fcc69d76681240b8845e2797614b7876', 'a4fee99ad1c5410a981b5d9a9580c7a8', '安装应用-app_tomcat', '', '未开始', null, null, null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('f2354dbda4c54685b8c573375ba4ee15', 'a4fee99ad1c5410a981b5d9a9580c7a8', '清空记录', '', '未开始', null, null, null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('361cdaeb2c974d25b2e9d194b9ca5717', '5d25bbdd249449958984b73ba4f2eedb', '克隆虚拟机', '', '已完成', '2016-08-24 18:00:35', '2016-08-24 17:58:33', 'VMName:newvm6 VMUuid:500f425a-5a80-98be-894e-1f113b31d723', '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('56d40070c2104ca49da0b1d32ac5a00a', '5d25bbdd249449958984b73ba4f2eedb', '设置IP', '', '已完成', '2016-08-24 18:01:07', '2016-08-24 18:00:35', 'pid:1411', '3', '设置IP');
INSERT INTO `child_task` VALUES ('62f8ae356d8b48f4a8e67a7d39d992d5', '5d25bbdd249449958984b73ba4f2eedb', '添加互信', '', '已完成', '2016-08-24 18:01:07', '2016-08-24 18:01:07', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('bf84b84ab43e475ab690a40c73f8dcc9', '5d25bbdd249449958984b73ba4f2eedb', '安装应用-app_tomcat', '', '已完成', '2016-08-24 18:01:58', '2016-08-24 18:01:07', 'stats:True', '6', '安装应用');
INSERT INTO `child_task` VALUES ('de9b2c5e4e10417a8139c0e0750bec88', '5d25bbdd249449958984b73ba4f2eedb', '清空记录', '', '已完成', '2016-08-24 18:01:58', '2016-08-24 18:01:58', 'pid:1641', '7', '清空记录');
INSERT INTO `child_task` VALUES ('0f65bc7c3cae4812bdbeff526e6832da', '45e3638d4e344c0d826ecd5ddf7f7f66', '是否审批', '', '未开始', null, null, null, '1', '是否审批');
INSERT INTO `child_task` VALUES ('83c73c70b7aa40a1addaf8b286340911', '562dbdfad1674b79955a379948d01912', '清空记录', '', '已完成', '2016-08-19 16:34:56', '2016-08-19 16:34:55', 'pid:1701', '8', '清空记录');
INSERT INTO `child_task` VALUES ('eed7f93e49f04395931877fb0fa6b7f8', '6808507f33d5440cbe693c2bbf280eba', '安装应用-app_tomcat', '', '未开始', null, null, null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('0d7ad61f92764f959f3bba675928fd46', '6808507f33d5440cbe693c2bbf280eba', '清空记录', '', '未开始', null, null, null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('2cc2bd725a4c4b719c0d43ae127d9673', '562dbdfad1674b79955a379948d01912', '克隆虚拟机', '', '已完成', '2016-08-19 16:33:20', '2016-08-19 16:31:21', 'VMName:test VMUuid:500fe151-8e46-000e-d930-8a90f5a5650f', '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('a3580d7d3f2041ad98eeaf00bf44bb50', 'a0d5921182c24da3865cb859fbae7e19', '清空记录', '', '已完成', '2016-08-18 17:48:06', '2016-08-18 17:48:06', 'pid:1661', '7', '清空记录');
INSERT INTO `child_task` VALUES ('71549d4d7b304f2f8a6867eaea71743c', 'a0d5921182c24da3865cb859fbae7e19', '克隆虚拟机', '', '已完成', '2016-08-18 17:46:50', '2016-08-18 17:44:51', 'VMName:newVM151 VMUuid:500f8b13-7211-bf5d-46ab-5fdc2f974b6d', '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('50628af3764747b9987a3121d2b25a79', 'a0d5921182c24da3865cb859fbae7e19', '设置IP', '', '已完成', '2016-08-18 17:47:13', '2016-08-18 17:46:50', 'pid:1396', '3', '设置IP');
INSERT INTO `child_task` VALUES ('747eff1fd3c042d6ad18eda706d47cd3', 'a0d5921182c24da3865cb859fbae7e19', '添加互信', '', '已完成', '2016-08-18 17:47:13', '2016-08-18 17:47:13', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('962f0356eca945328dc38617a53eee13', 'a0d5921182c24da3865cb859fbae7e19', '附加存储', '', '已完成', '2016-08-18 17:47:13', '2016-08-18 17:47:13', 'info:3GB disk added to newVM151', '5', '附加存储');
INSERT INTO `child_task` VALUES ('76a93d718b0444bb9ae2de16917ef121', 'a0d5921182c24da3865cb859fbae7e19', '安装应用-app_tomcat', '', '已完成', '2016-08-18 17:48:06', '2016-08-18 17:47:13', 'stats:True', '6', '安装应用');
INSERT INTO `child_task` VALUES ('9edda065974040528653f115967028ee', '5990332e3b514a6ead0fa0ce9015b446', '清空记录', '', '已完成', '2016-08-24 15:20:02', '2016-08-24 15:20:02', 'pid:1634', '7', '清空记录');
INSERT INTO `child_task` VALUES ('19d9659b8ca742f5aa103286198955fc', '5990332e3b514a6ead0fa0ce9015b446', '安装应用-app_tomcat', '', '已完成', '2016-08-24 15:20:02', '2016-08-24 15:19:10', 'stats:True', '6', '安装应用');
INSERT INTO `child_task` VALUES ('e8caed23bf7d487f833cbaa30fbb8977', 'f81ff363ccea415a90ab52fe1d6bf305', '克隆虚拟机', '', '未开始', null, null, null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('d2080f91244e42babc999a8415b096c4', 'f81ff363ccea415a90ab52fe1d6bf305', '设置IP', '', '未开始', null, null, null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('c9c7e68ad3ca4462b5828674fa575eb0', 'f81ff363ccea415a90ab52fe1d6bf305', '添加互信', '', '未开始', null, null, null, '4', '添加互信');
INSERT INTO `child_task` VALUES ('241a167cd77d43eb8c01cd4f0db0d5a7', 'f81ff363ccea415a90ab52fe1d6bf305', '安装应用-app_tomcat', '', '未开始', null, null, null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('53de1c68ff5642c7871caa0d08bf8d29', 'f81ff363ccea415a90ab52fe1d6bf305', '清空记录', '', '未开始', null, null, null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('4f6f7f5e399949c7a98a9c1aed344439', 'fa1dfcf9cbe14c9d9821b106dea62be3', '克隆虚拟机', '', '未开始', null, null, null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('79dd3e1a306c42e9b326bfe4bc8dc87e', 'fa1dfcf9cbe14c9d9821b106dea62be3', '设置IP', '', '未开始', null, null, null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('13073d99fd80471ea0ea5da8c6e8336a', 'fa1dfcf9cbe14c9d9821b106dea62be3', '添加互信', '', '未开始', null, null, null, '4', '添加互信');
INSERT INTO `child_task` VALUES ('427cacdbca4b4e72a7cfd48cb093c640', 'fa1dfcf9cbe14c9d9821b106dea62be3', '安装应用-app_tomcat', '', '未开始', null, null, null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('eead3775bd1b47a0982732a6f078f9af', 'fa1dfcf9cbe14c9d9821b106dea62be3', '清空记录', '', '未开始', null, null, null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('9c6d60a85a6749fda27da13d0f1e2aef', '6a8db03fc1cb47e698fe6e3f4da04057', '克隆虚拟机', '', '未开始', null, null, null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('9c293d2b83a845eab7d689ebf86e95ec', '6a8db03fc1cb47e698fe6e3f4da04057', '设置IP', '', '未开始', null, null, null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('3d7cb7d59266490b96ae4e6997ce813a', '6a8db03fc1cb47e698fe6e3f4da04057', '添加互信', '', '未开始', null, null, null, '4', '添加互信');
INSERT INTO `child_task` VALUES ('4e383fbbf77943a5ae19eab0430234f8', '6a8db03fc1cb47e698fe6e3f4da04057', '安装应用-app_tomcat', '', '未开始', null, null, null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('3a83648135824f7db48f67ab3a272508', '6a8db03fc1cb47e698fe6e3f4da04057', '清空记录', '', '未开始', null, null, null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('d8a3aba8d9534b90877cd7b7d876eee9', '8bf193f27ce54c9792fcdf44395ba4d2', '克隆虚拟机', '', '未开始', null, null, null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('c17c7c63eba94ed99f038704a3466b4d', '8bf193f27ce54c9792fcdf44395ba4d2', '设置IP', '', '未开始', null, null, null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('2da084e34e7b477a85e6975d55dc59af', '8bf193f27ce54c9792fcdf44395ba4d2', '添加互信', '', '未开始', null, null, null, '4', '添加互信');
INSERT INTO `child_task` VALUES ('e083c83533c54f348dfdc043e03999e6', '8bf193f27ce54c9792fcdf44395ba4d2', '安装应用-app_tomcat', '', '未开始', null, null, null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('1e8eb333abc644a887a29fed77eeba23', '8bf193f27ce54c9792fcdf44395ba4d2', '清空记录', '', '未开始', null, null, null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('d12890cda52d439a9a143e77a211626d', '46f9bbc5fd3b424c8cfddb85ff986a64', '克隆虚拟机', '', '未开始', null, null, null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('8d583130ad114bcab618bc394c21794c', '46f9bbc5fd3b424c8cfddb85ff986a64', '设置IP', '', '未开始', null, null, null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('83276e0c7a414ba7b2f53226c653a0a6', '46f9bbc5fd3b424c8cfddb85ff986a64', '添加互信', '', '未开始', null, null, null, '4', '添加互信');
INSERT INTO `child_task` VALUES ('cc0297a1ed094b6f81f56f88273db250', '46f9bbc5fd3b424c8cfddb85ff986a64', '安装应用-app_tomcat', '', '未开始', null, null, null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('1faedbc9a94f4906bfc05533ff33814e', '46f9bbc5fd3b424c8cfddb85ff986a64', '清空记录', '', '未开始', null, null, null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('85d22c04f10d4407804cdcd6049720d5', 'b6cc137bd9254b19b13251491342fc2b', '是否审批', '', '已完成', '2016-08-24 11:53:32', '2016-08-24 11:53:32', null, '1', '是否审批');
INSERT INTO `child_task` VALUES ('57cd60dbedde41089088b6f5decaf39b', 'b6cc137bd9254b19b13251491342fc2b', '克隆虚拟机', '', '未开始', null, null, null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('899588cccaeb441081273deacdc0da65', 'b6cc137bd9254b19b13251491342fc2b', '设置IP', '', '未开始', null, null, null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('e4fc13b466144a60addee3b06729eb2d', 'b6cc137bd9254b19b13251491342fc2b', '添加互信', '', '未开始', null, null, null, '4', '添加互信');
INSERT INTO `child_task` VALUES ('f008adcf0687434684260c7e93cd4f3d', 'b6cc137bd9254b19b13251491342fc2b', '附加存储', '', '未开始', null, null, null, '5', '附加存储');
INSERT INTO `child_task` VALUES ('eb82e52b65d0452f9931b2c8fcdd33f7', 'b6cc137bd9254b19b13251491342fc2b', '安装应用-app_tomcat', '', '未开始', null, null, null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('1059de1d5d38416d8497c47d0183b6b2', 'b6cc137bd9254b19b13251491342fc2b', '清空记录', '', '未开始', null, null, null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('e76ad7debac74691bfe56b6471d0a3a3', 'c6afc643b18b42009c9a359856a1ddd4', '是否审批', '', '未开始', null, null, null, '1', '是否审批');
INSERT INTO `child_task` VALUES ('c2f0024590864619928ce8dd29732b10', 'c6afc643b18b42009c9a359856a1ddd4', '克隆虚拟机', '', '未开始', null, null, null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('fd7e0a2b128d407b9aff62dba837a8a4', 'c6afc643b18b42009c9a359856a1ddd4', '设置IP', '', '未开始', null, null, null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('cea1bcab1bce4d4c9b49fc8eff7388f6', 'c6afc643b18b42009c9a359856a1ddd4', '添加互信', '', '未开始', null, null, null, '4', '添加互信');
INSERT INTO `child_task` VALUES ('cc1085e499244c7f9a3c35c029894306', 'c6afc643b18b42009c9a359856a1ddd4', '安装应用-app_tomcat', '', '未开始', null, null, null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('509e8f36d9a740449c976fa204121c73', 'c6afc643b18b42009c9a359856a1ddd4', '清空记录', '', '未开始', null, null, null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('12e566f5c48741f683d98d5560c45247', 'e79c8e226a5546e78707e6dea849808d', '是否审批', '', '未开始', null, null, null, '1', '是否审批');
INSERT INTO `child_task` VALUES ('275ba96f786145b8a55e6c9442af8f20', 'e79c8e226a5546e78707e6dea849808d', '克隆虚拟机', '', '未开始', null, null, null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('6fc9535c426a40cab803033647047792', 'e79c8e226a5546e78707e6dea849808d', '设置IP', '', '未开始', null, null, null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('c7374db870cb4fe89b209f4dec70a6af', 'e79c8e226a5546e78707e6dea849808d', '添加互信', '', '未开始', null, null, null, '4', '添加互信');
INSERT INTO `child_task` VALUES ('908413440b96489eb8a406707724f779', 'e79c8e226a5546e78707e6dea849808d', '安装应用-app_tomcat', '', '未开始', null, null, null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('1757cb9ca4654e43beeded19a8e4dfd3', 'e79c8e226a5546e78707e6dea849808d', '清空记录', '', '未开始', null, null, null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('cb2baba5ee2043eb8f1a33a1abc3aade', '6033ad3e103f4b388ad8a7cbd7f14bc0', '是否审批', '', '已完成', '2016-08-24 15:02:14', '2016-08-24 15:02:14', null, '1', '是否审批');
INSERT INTO `child_task` VALUES ('4fe499885e27405896bc3e82fa1ae654', '6033ad3e103f4b388ad8a7cbd7f14bc0', '克隆虚拟机', '', '已完成', '2016-08-24 15:04:13', '2016-08-24 15:02:14', 'VMName:newVM204 VMUuid:500f2a08-f0b4-339c-564c-045b67d2ee73', '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('345f1119b1eb412693ea9a595e33e147', '6033ad3e103f4b388ad8a7cbd7f14bc0', '设置IP', '', '已完成', '2016-08-24 15:04:39', '2016-08-24 15:04:13', 'pid:1396', '3', '设置IP');
INSERT INTO `child_task` VALUES ('afcded9a15c243ffa589b8659a61acf4', '6033ad3e103f4b388ad8a7cbd7f14bc0', '添加互信', '', '已完成', '2016-08-24 15:04:39', '2016-08-24 15:04:39', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('bc56b0efb1354d95b07c8a5d2666b6fa', '6033ad3e103f4b388ad8a7cbd7f14bc0', '附加存储', '', '已完成', '2016-08-24 15:04:39', '2016-08-24 15:04:39', 'info:5GB disk added to newVM204', '5', '附加存储');
INSERT INTO `child_task` VALUES ('9e54ad39f7374826b041a0c762cf5c11', '6033ad3e103f4b388ad8a7cbd7f14bc0', '安装应用-app_tomcat', '', '已完成', '2016-08-24 15:05:32', '2016-08-24 15:04:39', 'stats:True', '6', '安装应用');
INSERT INTO `child_task` VALUES ('0ce071aff2f947f6aa31328c255796eb', '6033ad3e103f4b388ad8a7cbd7f14bc0', '清空记录', '', '已完成', '2016-08-24 15:05:32', '2016-08-24 15:05:32', 'pid:1661', '7', '清空记录');
INSERT INTO `child_task` VALUES ('f2b34d75eeb6402e8302bdd03a7f3552', '5990332e3b514a6ead0fa0ce9015b446', '是否审批', '', '已完成', '2016-08-24 15:16:49', '2016-08-24 15:16:49', null, '1', '是否审批');
INSERT INTO `child_task` VALUES ('bf8d23b4064544c89e5f54a20186bc91', '5990332e3b514a6ead0fa0ce9015b446', '克隆虚拟机', '', '已完成', '2016-08-24 15:18:44', '2016-08-24 15:16:49', 'VMName:newVM205 VMUuid:500fdc11-b9d8-e2c7-e6c0-3bbb9cb5ae9c', '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('43835fc70fb54c14b6b214d0e57305f4', '5990332e3b514a6ead0fa0ce9015b446', '设置IP', '', '已完成', '2016-08-24 15:19:10', '2016-08-24 15:18:44', 'pid:1391', '3', '设置IP');
INSERT INTO `child_task` VALUES ('308e1a3dca1a4dd7a9615f3ffb9e98f8', '5990332e3b514a6ead0fa0ce9015b446', '添加互信', '', '已完成', '2016-08-24 15:19:10', '2016-08-24 15:19:10', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('a02d13e4876c419db99a33b08bbcf47d', '3301704157bf4893a44a68cc8df243d3', '清空记录', '', '未开始', null, null, null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('cd883ad291934e5bbbdd444792b09536', '3301704157bf4893a44a68cc8df243d3', '安装应用-app_tomcat', '', '未开始', null, null, null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('fd5f1f46fd6b475abc86d2decbadedb6', '3301704157bf4893a44a68cc8df243d3', '添加互信', '', '未开始', null, null, null, '4', '添加互信');
INSERT INTO `child_task` VALUES ('8da57f8e42ef4aacb4a246bf78a6bbf1', '3301704157bf4893a44a68cc8df243d3', '设置IP', '', '未开始', null, null, null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('6489f442772049b4b3e0ab86c78057e6', '9171391073cf4ceab14297812629d6fb', '清空记录', '', '已完成', '2016-08-22 10:12:12', '2016-08-22 10:12:12', 'pid:1406', '8', '清空记录');
INSERT INTO `child_task` VALUES ('92994d207c5f49e4a23366943e511c79', 'ac4ef85557c54afeb685ac956fb7eb58', '克隆虚拟机', '', '未开始', null, null, null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('1a96624862f748cd94dba357dceb2bb2', 'ac4ef85557c54afeb685ac956fb7eb58', '设置IP', '', '未开始', null, null, null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('88a9372845b64378a904e35abbe5d254', 'ac4ef85557c54afeb685ac956fb7eb58', '添加互信', '', '未开始', null, null, null, '4', '添加互信');
INSERT INTO `child_task` VALUES ('f68fcc1f102c44f492b0f96e24e85caa', 'ac4ef85557c54afeb685ac956fb7eb58', '安装应用-app_tomcat', '', '未开始', null, null, null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('edac559b19e04fbc8a7f2a630d3ad0f2', 'ac4ef85557c54afeb685ac956fb7eb58', '清空记录', '', '未开始', null, null, null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('4a33050d67454a0f983aaf67f65fba94', '303024c58354461694b9d5429b5845f2', '克隆虚拟机', '', '已完成', '2016-08-22 14:35:02', '2016-08-22 14:32:43', 'VMName:newVM154 VMUuid:500fd65d-1cdc-f6c5-78d5-aeadaf85a799', '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('700f9d1f51f84bb094a33cbe4ce09c66', '303024c58354461694b9d5429b5845f2', '设置IP', '', '已完成', '2016-08-22 14:35:31', '2016-08-22 14:35:02', 'pid:1391', '3', '设置IP');
INSERT INTO `child_task` VALUES ('97931d54209d4dc5969a0cf698e81aec', '303024c58354461694b9d5429b5845f2', '添加互信', '', '已完成', '2016-08-22 14:35:31', '2016-08-22 14:35:31', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('d3c1444a327144aa82a8e7b4a68da67e', '303024c58354461694b9d5429b5845f2', '安装应用-app_tomcat', '', '已完成', '2016-08-22 14:38:37', '2016-08-22 14:38:02', 'stats:True', '6', '安装应用');
INSERT INTO `child_task` VALUES ('92afe62224a24f77bc84e0131eadf0b2', '303024c58354461694b9d5429b5845f2', '清空记录', '', '已完成', '2016-08-22 14:38:37', '2016-08-22 14:38:37', 'pid:1644', '7', '清空记录');
INSERT INTO `child_task` VALUES ('934f97fed67d4c5ead97bc6fe751d3b8', 'b6a178ea24ea4135bfe7dd54521f77d0', '克隆虚拟机', '', '未开始', null, null, null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('e567a399b87348939c8aba288efed657', 'b6a178ea24ea4135bfe7dd54521f77d0', '设置IP', '', '未开始', null, null, null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('44f4b722d4f64218bfdb4550186bda05', 'b6a178ea24ea4135bfe7dd54521f77d0', '添加互信', '', '未开始', null, null, null, '4', '添加互信');
INSERT INTO `child_task` VALUES ('98445e4d2c38458db206294dede6c2ec', 'b6a178ea24ea4135bfe7dd54521f77d0', '安装应用-app_tomcat', '', '未开始', null, null, null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('ee1058c44f45450a8397e6f93a82bd33', 'b6a178ea24ea4135bfe7dd54521f77d0', '清空记录', '', '未开始', null, null, null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('27d9ea634d8d41dbb0f84e211687425c', 'ea79d6334a4d4703bd2b7a39bea3cb8c', '克隆虚拟机', '', '未开始', null, null, null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('8f069e5958b546d28ff66e1ddbb6804a', 'ea79d6334a4d4703bd2b7a39bea3cb8c', '设置IP', '', '未开始', null, null, null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('1dd421def528476594c36567ba36bff8', 'ea79d6334a4d4703bd2b7a39bea3cb8c', '添加互信', '', '未开始', null, null, null, '4', '添加互信');
INSERT INTO `child_task` VALUES ('e0934116d9284b4186683faa4a3d9fcd', 'ea79d6334a4d4703bd2b7a39bea3cb8c', '安装应用-app_tomcat', '', '未开始', null, null, null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('d4255150df7a427c904589c8af256332', 'ea79d6334a4d4703bd2b7a39bea3cb8c', '清空记录', '', '未开始', null, null, null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('c201ee6c64094f07a356fe2339c3e9e5', '9fcb481e1cae4c90915b24a8537b20d4', '克隆虚拟机', '', '未开始', null, null, null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('db4aa8df3dbf4f91bb93488f6718ec0b', '9fcb481e1cae4c90915b24a8537b20d4', '设置IP', '', '未开始', null, null, null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('655bb21aaaf94f86929407745f16c7be', '9fcb481e1cae4c90915b24a8537b20d4', '添加互信', '', '未开始', null, null, null, '4', '添加互信');
INSERT INTO `child_task` VALUES ('530c9f5ef3a246908dc5ca9022e4e6d9', '9fcb481e1cae4c90915b24a8537b20d4', '安装应用-app_tomcat', '', '未开始', null, null, null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('aa85d29eb6134e078abd3145a11cb13d', '9fcb481e1cae4c90915b24a8537b20d4', '清空记录', '', '未开始', null, null, null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('c162cc7e54004bdf87398f62b40d5074', '5d02250c90fd4b80a92dbffd3b11e5e5', '克隆虚拟机', '', '已完成', '2016-08-22 15:59:24', '2016-08-22 15:57:30', 'VMName:wwb VMUuid:500fec45-cd1f-0b43-c0f9-1398550db7af', '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('bbff502316494291be8636744bb2f0c4', '5d02250c90fd4b80a92dbffd3b11e5e5', '设置IP', '', '已完成', '2016-08-22 15:59:52', '2016-08-22 15:59:24', 'pid:1398', '3', '设置IP');
INSERT INTO `child_task` VALUES ('ea0f6d3c82934ef3bd20eb935f34b0d5', '5d02250c90fd4b80a92dbffd3b11e5e5', '添加互信', '', '已完成', '2016-08-22 15:59:52', '2016-08-22 15:59:52', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('e2846bfd279c46559c9264a62491616a', '5d02250c90fd4b80a92dbffd3b11e5e5', '安装应用-app_tomcat', '', '已完成', '2016-08-22 16:00:44', '2016-08-22 15:59:52', 'stats:True', '6', '安装应用');
INSERT INTO `child_task` VALUES ('d09f99e8cc67487dbba3ab4ff65ee065', '5d02250c90fd4b80a92dbffd3b11e5e5', '清空记录', '', '已完成', '2016-08-22 16:00:44', '2016-08-22 16:00:44', 'pid:1642', '7', '清空记录');
INSERT INTO `child_task` VALUES ('ae99d4417886436f90bf732a41ad1d24', '55ee9142f5ed44358bbad9c38e8fddd2', '克隆虚拟机', '', '已完成', '2016-08-22 16:38:28', '2016-08-22 16:36:30', 'VMName:newvm1 VMUuid:500fd85a-d560-84be-4702-25821b63d1df', '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('173ba673d0254bac821f1f845ab90bba', '55ee9142f5ed44358bbad9c38e8fddd2', '设置IP', '', '已完成', '2016-08-22 16:40:52', '2016-08-22 16:38:28', 'pid:1400', '3', '设置IP');
INSERT INTO `child_task` VALUES ('4a8065a86ec249cebde1d06466a6a400', '55ee9142f5ed44358bbad9c38e8fddd2', '添加互信', '', '已完成', '2016-08-22 16:40:52', '2016-08-22 16:40:52', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('72ff246244954419ac27a65b4de33a9c', '55ee9142f5ed44358bbad9c38e8fddd2', '安装应用-app_tomcat', '', '已完成', '2016-08-22 16:41:59', '2016-08-22 16:40:52', 'stats:True', '6', '安装应用');
INSERT INTO `child_task` VALUES ('dd0fd85b082947c4b4222e8c6eb951ce', '55ee9142f5ed44358bbad9c38e8fddd2', '清空记录', '', '已完成', '2016-08-22 16:42:33', '2016-08-22 16:41:59', 'pid:1642', '7', '清空记录');
INSERT INTO `child_task` VALUES ('2212dceea3cf4d3a86549a57ff56cbaa', '52cd7c48ae9843f19bac558d34816636', '克隆虚拟机', '', '已完成', '2016-08-22 16:40:26', '2016-08-22 16:36:33', 'VMName:newVM161 VMUuid:500f7083-ba6e-d956-7849-725f01bced85', '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('f5f2d4740e0f4dc9be47f5db5c03a158', '52cd7c48ae9843f19bac558d34816636', '设置IP', '', '已完成', '2016-08-22 16:41:22', '2016-08-22 16:40:26', 'pid:1395', '3', '设置IP');
INSERT INTO `child_task` VALUES ('694765f104814a098179927c2677553c', '52cd7c48ae9843f19bac558d34816636', '添加互信', '', '已完成', '2016-08-22 16:41:22', '2016-08-22 16:41:22', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('5b9f5b7bfef34ef2926892f5fa5c74c8', '52cd7c48ae9843f19bac558d34816636', '安装应用-app_tomcat', '', '已完成', '2016-08-22 16:42:33', '2016-08-22 16:41:22', 'stats:True', '6', '安装应用');
INSERT INTO `child_task` VALUES ('31346cb9f32042c98fd16a429504a444', '52cd7c48ae9843f19bac558d34816636', '清空记录', '', '已完成', '2016-08-22 16:42:34', '2016-08-22 16:42:33', 'pid:1642', '7', '清空记录');
INSERT INTO `child_task` VALUES ('a68eebc04f4a47b886e09be7aab588a5', 'fbe16d6ba3e943988ef54382c4189bf9', '克隆虚拟机', '', '已完成', '2016-08-22 17:54:54', '2016-08-22 17:52:59', 'VMName:newvm2 VMUuid:500fe497-b38f-da41-a1d9-2771aa2f19d5', '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('2e5e16056bd0424bad3a5f3bf0c1409c', 'fbe16d6ba3e943988ef54382c4189bf9', '设置IP', '', '已完成', '2016-08-22 17:55:27', '2016-08-22 17:54:54', 'pid:1400', '3', '设置IP');
INSERT INTO `child_task` VALUES ('bb47fed13d9345408fecbf15de4be5a3', 'fbe16d6ba3e943988ef54382c4189bf9', '添加互信', '', '已完成', '2016-08-22 17:55:27', '2016-08-22 17:55:27', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('d076e492fbb74357b5c7e474461a1a65', 'fbe16d6ba3e943988ef54382c4189bf9', '安装应用-app_tomcat', '', '已完成', '2016-08-22 17:56:36', '2016-08-22 17:55:27', 'stats:True', '6', '安装应用');
INSERT INTO `child_task` VALUES ('54100a6cf1bd487d9580678754f8b58e', 'fbe16d6ba3e943988ef54382c4189bf9', '清空记录', '', '已完成', '2016-08-22 17:56:37', '2016-08-22 17:56:36', 'pid:1642', '7', '清空记录');
INSERT INTO `child_task` VALUES ('734e1e354210441fabd6e26c5c91099d', '9352fb439cd14692b5915c3666deb9f0', '克隆虚拟机', '', '未开始', null, null, null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('4ed8daa90d2743a2bee9d92dcdacfe5a', '9352fb439cd14692b5915c3666deb9f0', '设置IP', '', '未开始', null, null, null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('e26118a223ee41fd9afda0ae2a49557c', '9352fb439cd14692b5915c3666deb9f0', '添加互信', '', '未开始', null, null, null, '4', '添加互信');
INSERT INTO `child_task` VALUES ('9bcb637a354e442489a1e7bc2ea76903', '9352fb439cd14692b5915c3666deb9f0', '安装应用-app_tomcat', '', '未开始', null, null, null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('afb98c03341644eabfb6c9c4d3fe94ce', '9352fb439cd14692b5915c3666deb9f0', '清空记录', '', '未开始', null, null, null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('3016c83639ce40c6809dcd8fba3197c2', '73244eb397834110b2d6ce17b3958bcf', '克隆虚拟机', '', '已完成', '2016-08-23 11:33:20', '2016-08-23 11:31:22', 'VMName:newVM162 VMUuid:500f3630-b3a6-8251-2ce0-83700b162a3d', '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('9d3b8b16345f4521a2b8895bf9314fe5', '73244eb397834110b2d6ce17b3958bcf', '设置IP', '', '已完成', '2016-08-23 11:33:47', '2016-08-23 11:33:20', 'pid:1395', '3', '设置IP');
INSERT INTO `child_task` VALUES ('a0ca82838bb249e2a5dac4950dba0437', '73244eb397834110b2d6ce17b3958bcf', '添加互信', '', '已完成', '2016-08-23 11:33:47', '2016-08-23 11:33:47', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('3e1e98d2d6e647ea9a76e58f012ed4bd', '73244eb397834110b2d6ce17b3958bcf', '附加存储', '', '已完成', '2016-08-23 11:33:47', '2016-08-23 11:33:47', 'info:5GB disk added to newVM162', '5', '附加存储');
INSERT INTO `child_task` VALUES ('90cdd84f016240ccadb28d9067153eda', '73244eb397834110b2d6ce17b3958bcf', '安装应用-app_tomcat', '', '已完成', '2016-08-23 11:34:39', '2016-08-23 11:33:47', 'stats:True', '6', '安装应用');
INSERT INTO `child_task` VALUES ('476e877cc7814647812164ac3765ae37', '73244eb397834110b2d6ce17b3958bcf', '清空记录', '', '已完成', '2016-08-23 11:34:40', '2016-08-23 11:34:39', 'pid:1654', '7', '清空记录');
INSERT INTO `child_task` VALUES ('7e3a7e2334004ba7903efe5cebf9984e', '3301704157bf4893a44a68cc8df243d3', '克隆虚拟机', '', '未开始', null, null, null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('3b7101db2be84fd1aad469fc0eca1aef', '464075f825ff4d6c8736dcc3043f7ab4', '克隆虚拟机', '', '已完成', '2016-08-19 17:38:54', '2016-08-19 17:35:32', 'VMName:hehe VMUuid:500f5701-3752-f6f1-5d47-2e0f20e2327a', '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('1315082f07004155b8895f03fef51162', '464075f825ff4d6c8736dcc3043f7ab4', '设置IP', '', '已完成', '2016-08-19 17:39:52', '2016-08-19 17:38:54', 'pid:1411', '3', '设置IP');
INSERT INTO `child_task` VALUES ('34802b1cddd14cc3bd746a2192edfd31', '464075f825ff4d6c8736dcc3043f7ab4', '添加互信', '', '已完成', '2016-08-19 17:39:52', '2016-08-19 17:39:52', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('b17b63b608d248a684afe48cb134d8f1', '464075f825ff4d6c8736dcc3043f7ab4', '安装应用-os_tuning', '', '已完成', '2016-08-19 17:40:22', '2016-08-19 17:39:52', 'stats:True', '6', '安装应用');
INSERT INTO `child_task` VALUES ('aa7caad2ee83489089a7094d7019662f', '464075f825ff4d6c8736dcc3043f7ab4', '安装应用-app_tomcat', '', '已完成', '2016-08-19 17:41:28', '2016-08-19 17:40:22', 'stats:True', '7', '安装应用');
INSERT INTO `child_task` VALUES ('29ee78ff74704ce3b7c0c54cbdd3e267', '464075f825ff4d6c8736dcc3043f7ab4', '清空记录', '', '已完成', '2016-08-19 17:41:29', '2016-08-19 17:41:28', 'pid:1694', '8', '清空记录');
INSERT INTO `child_task` VALUES ('898005f506a74732bab00ed8ef2c6208', '5ef66671e67e40ac9deedc0b7d10833a', '克隆虚拟机', '', '已完成', '2016-08-22 10:07:00', '2016-08-22 10:04:57', 'VMName:TestWp VMUuid:500fdd34-9745-460b-5f72-d5ee4a7ea81e', '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('d693887c42384cbf990126a4150a0892', '5ef66671e67e40ac9deedc0b7d10833a', '设置IP', '', '已完成', '2016-08-22 10:07:28', '2016-08-22 10:07:00', 'pid:1394', '3', '设置IP');
INSERT INTO `child_task` VALUES ('f06ba4d95ee74421b8bff0fa21346ec5', '5ef66671e67e40ac9deedc0b7d10833a', '添加互信', '', '已完成', '2016-08-22 10:07:28', '2016-08-22 10:07:28', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('7cc2082fac00422da56283a78c03bbf5', '5ef66671e67e40ac9deedc0b7d10833a', '附加存储', '', '失败', '2016-08-22 10:07:38', '2016-08-22 10:07:28', 'VM not found', '5', '附加存储');
INSERT INTO `child_task` VALUES ('6511d66d9c0249749f6e2dc083e2f1a5', '5ef66671e67e40ac9deedc0b7d10833a', '安装应用-内核参数', '', '未开始', null, null, null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('cffbec2ef6804af6be74e03baf8a6d07', '5ef66671e67e40ac9deedc0b7d10833a', '安装应用-MySQL', '', '未开始', null, null, null, '7', '安装应用');
INSERT INTO `child_task` VALUES ('eb10df898d564eda809ff607c423a2d5', '562dbdfad1674b79955a379948d01912', '设置IP', '', '已完成', '2016-08-19 16:33:51', '2016-08-19 16:33:20', 'pid:1392', '3', '设置IP');
INSERT INTO `child_task` VALUES ('16935e368ebc46219267581dba960924', '562dbdfad1674b79955a379948d01912', '添加互信', '', '已完成', '2016-08-19 16:33:51', '2016-08-19 16:33:51', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('e873df8bf75c4634a52d242dd9098425', '562dbdfad1674b79955a379948d01912', '安装应用-os_tuning', '', '已完成', '2016-08-19 16:34:21', '2016-08-19 16:33:51', 'stats:True', '6', '安装应用');
INSERT INTO `child_task` VALUES ('fa158259424642faa785f2e06fb785a9', '562dbdfad1674b79955a379948d01912', '安装应用-app_tomcat', '', '已完成', '2016-08-19 16:34:55', '2016-08-19 16:34:21', 'stats:True', '7', '安装应用');
INSERT INTO `child_task` VALUES ('6d836cf618224b3c971a3b7434cf1bd9', '6808507f33d5440cbe693c2bbf280eba', '克隆虚拟机', '', '已完成', '2016-08-19 16:23:09', '2016-08-19 16:20:51', 'VMName:haha VMUuid:500f5571-a9ff-ba1c-a637-219759b5b3cf', '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('391066c6e5284041b0f408eb8b94a904', '6808507f33d5440cbe693c2bbf280eba', '设置IP', '', '失败', '2016-08-19 16:23:30', '2016-08-19 16:23:09', 'IP address can not be empty!', '3', '设置IP');
INSERT INTO `child_task` VALUES ('6896fe14b53b4322849370a62400e9be', '6808507f33d5440cbe693c2bbf280eba', '添加互信', '', '未开始', null, null, null, '4', '添加互信');
INSERT INTO `child_task` VALUES ('b066e9db68864bf487d2b38ccd02e5e1', 'c94a9e0faaca4b94b8b2c6a2dba47148', '是否审批', '', '未开始', null, null, null, '1', '是否审批');
INSERT INTO `child_task` VALUES ('5ae1b46b62a74a9480f052ed1ede4f2b', 'c94a9e0faaca4b94b8b2c6a2dba47148', '克隆虚拟机', '', '未开始', null, null, null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('101150aab3c544ce854494f97d59fbf5', 'c94a9e0faaca4b94b8b2c6a2dba47148', '设置IP', '', '未开始', null, null, null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('f924e5b7e0d94c8ba5373e1f27e60030', 'c94a9e0faaca4b94b8b2c6a2dba47148', '添加互信', '', '未开始', null, null, null, '4', '添加互信');
INSERT INTO `child_task` VALUES ('dbe946cbf7294a89b35e4e0ff32756c3', 'c94a9e0faaca4b94b8b2c6a2dba47148', '安装应用-app_tomcat', '', '未开始', null, null, null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('d0ba0c53f1364b1295e2be88c70a2a54', 'c94a9e0faaca4b94b8b2c6a2dba47148', '清空记录', '', '未开始', null, null, null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('8a584b8328664ccaa69531d5ec39bd1e', '5ef66671e67e40ac9deedc0b7d10833a', '清空记录', '', '未开始', null, null, null, '8', '清空记录');
INSERT INTO `child_task` VALUES ('59c5fb3365fa46f2a214bf93a17d3ccc', '9171391073cf4ceab14297812629d6fb', '克隆虚拟机', '', '已完成', '2016-08-22 10:11:02', '2016-08-22 10:08:46', 'VMName:Test VMUuid:500f5c09-f221-d4ee-3189-72533c2a829e', '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('3ce4ad006676428688b09b183f25f40c', '9171391073cf4ceab14297812629d6fb', '设置IP', '', '已完成', '2016-08-22 10:11:32', '2016-08-22 10:11:02', 'pid:1403', '3', '设置IP');
INSERT INTO `child_task` VALUES ('70799484f3034f14adb5fdf2aef59323', '9171391073cf4ceab14297812629d6fb', '添加互信', '', '已完成', '2016-08-22 10:11:32', '2016-08-22 10:11:32', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('502f664499a0403d9333cf010c787719', '9171391073cf4ceab14297812629d6fb', '附加存储', '', '已完成', '2016-08-22 10:11:33', '2016-08-22 10:11:32', 'info:11GB disk added to Test', '5', '附加存储');
INSERT INTO `child_task` VALUES ('11fd2de9946349889ca64af922de985b', '9171391073cf4ceab14297812629d6fb', '安装应用-内核参数', '', '失败', '2016-08-22 10:12:02', '2016-08-22 10:11:33', 'error', '6', '安装应用');
INSERT INTO `child_task` VALUES ('dec59a45f15d401c8ffe005bcf53c51c', '9171391073cf4ceab14297812629d6fb', '安装应用-FTP服务', '', '失败', '2016-08-22 10:12:12', '2016-08-22 10:12:02', 'error', '7', '安装应用');
INSERT INTO `child_task` VALUES ('9902e7f7e74440698bda79db87a8b707', 'ebd1a454b46a4d568d8510d801051273', '克隆虚拟机', '', '已完成', '2016-08-19 16:52:22', '2016-08-19 16:50:21', 'VMName:newVM146 VMUuid:500f1ac8-4024-ed91-3c60-1dec6e9142c9', '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('4a8db3cab7df43d2854efad9ba28fd24', 'ebd1a454b46a4d568d8510d801051273', '设置IP', '', '已完成', '2016-08-19 16:54:53', '2016-08-19 16:52:22', 'pid:1391', '3', '设置IP');
INSERT INTO `child_task` VALUES ('df6fff20541a4369acc4e393823a1652', 'ebd1a454b46a4d568d8510d801051273', '添加互信', '', '已完成', '2016-08-19 16:54:53', '2016-08-19 16:54:53', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('101a824e9ef540639a9f31b7f529576b', 'ebd1a454b46a4d568d8510d801051273', '安装应用-os_tuning', '', '已完成', '2016-08-19 16:55:32', '2016-08-19 16:54:53', 'stats:True', '6', '安装应用');
INSERT INTO `child_task` VALUES ('3cf4dcc67158477f879ef38fc6670947', 'ebd1a454b46a4d568d8510d801051273', '安装应用-app_tomcat', '', '已完成', '2016-08-19 16:56:06', '2016-08-19 16:55:32', 'stats:True', '7', '安装应用');
INSERT INTO `child_task` VALUES ('0f426ca4315f4a05b7b12f88752d7905', 'ebd1a454b46a4d568d8510d801051273', '清空记录', '', '已完成', '2016-08-19 16:56:06', '2016-08-19 16:56:06', 'pid:1694', '8', '清空记录');
INSERT INTO `child_task` VALUES ('4a8508a193d94dbb85dd193d32bd5511', '5628cfff3fda488892597d8fa01a6b13', '克隆虚拟机', '', '已完成', '2016-08-19 16:54:20', '2016-08-19 16:50:22', 'VMName:hehe VMUuid:500fdd96-cea0-1bf7-0f52-e6dd28adf746', '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('08923bfce81349b9a0a50253a1899943', '5628cfff3fda488892597d8fa01a6b13', '设置IP', '', '失败', '2016-08-19 16:55:21', '2016-08-19 16:54:20', 'IP address has been used!', '3', '设置IP');
INSERT INTO `child_task` VALUES ('cad87f95f80f459db66d8fae445a7c31', '5628cfff3fda488892597d8fa01a6b13', '添加互信', '', '未开始', null, null, null, '4', '添加互信');
INSERT INTO `child_task` VALUES ('ca46a33156d14e91b685937264eabc47', '5628cfff3fda488892597d8fa01a6b13', '安装应用-app_tomcat', '', '未开始', null, null, null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('e838728fbc4f4877ac0d13b6b3b0fe29', '5628cfff3fda488892597d8fa01a6b13', '清空记录', '', '未开始', null, null, null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('f7eef492ee1b42c19136ba6a33e56fe4', 'b970f1cdea2847a3852e0358f7003832', '克隆虚拟机', '', '已完成', '2016-08-19 17:36:59', '2016-08-19 17:35:00', 'VMName:newVM147 VMUuid:500f2aeb-7a9c-a1b0-226c-01c28d2aa7b7', '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('b7c1368ee63843efaa27a8ada54b4fc9', 'b970f1cdea2847a3852e0358f7003832', '设置IP', '', '已完成', '2016-08-19 17:39:22', '2016-08-19 17:36:59', 'pid:1394', '3', '设置IP');
INSERT INTO `child_task` VALUES ('33bcd566716842ec8469342df83e6813', 'b970f1cdea2847a3852e0358f7003832', '添加互信', '', '已完成', '2016-08-19 17:39:22', '2016-08-19 17:39:22', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('38903db1450d4b269c408f2a7dfef1b1', 'b970f1cdea2847a3852e0358f7003832', '安装应用-os_tuning', '', '已完成', '2016-08-19 17:40:03', '2016-08-19 17:39:22', 'stats:True', '6', '安装应用');
INSERT INTO `child_task` VALUES ('a62577a61f85404c8221aa6f6e4f58bd', 'b970f1cdea2847a3852e0358f7003832', '安装应用-app_tomcat', '', '已完成', '2016-08-19 17:40:55', '2016-08-19 17:40:03', 'stats:True', '7', '安装应用');
INSERT INTO `child_task` VALUES ('d6593456f13749738840b87d30cfd381', 'b970f1cdea2847a3852e0358f7003832', '清空记录', '', '已完成', '2016-08-19 17:41:28', '2016-08-19 17:40:55', 'pid:1703', '8', '清空记录');
INSERT INTO `child_task` VALUES ('3e0d9052860d47f192c742a392a41d98', '066d3039c67b44eb97b8b91ccd1b23ee', '克隆虚拟机', '', '已完成', '2016-08-18 11:26:31', '2016-08-18 11:24:29', 'VMName:newVM150 VMUuid:500f0e3b-a19c-1417-5822-ff6cf30910c6', '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('9418bed4ec3a424583555777f2024a54', '066d3039c67b44eb97b8b91ccd1b23ee', '设置IP', '', '已完成', '2016-08-18 11:27:00', '2016-08-18 11:26:31', 'pid:1391', '3', '设置IP');
INSERT INTO `child_task` VALUES ('f135220aa7aa4882a9701ec3e5e0bb4a', '066d3039c67b44eb97b8b91ccd1b23ee', '添加互信', '', '已完成', '2016-08-18 11:27:01', '2016-08-18 11:27:01', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('87de1cfc45464c53903b0e348bc55a9a', '066d3039c67b44eb97b8b91ccd1b23ee', '安装应用-os_tuning', '', '已完成', '2016-08-18 11:27:30', '2016-08-18 11:27:01', 'stats:True', '6', '安装应用');
INSERT INTO `child_task` VALUES ('799339a5d1934f69a0d69488a9587d8b', '066d3039c67b44eb97b8b91ccd1b23ee', '安装应用-app_tomcat', '', '已完成', '2016-08-18 11:28:08', '2016-08-18 11:27:30', 'stats:True', '7', '安装应用');
INSERT INTO `child_task` VALUES ('3563e40227184888af3de96e3e3b141c', '066d3039c67b44eb97b8b91ccd1b23ee', '清空记录', '', '已完成', '2016-08-18 11:28:08', '2016-08-18 11:28:08', 'pid:1695', '8', '清空记录');
INSERT INTO `child_task` VALUES ('ef988b674be848dca36cd85969b1edb5', 'f39cf69fc74044f4997de5c505559127', '克隆虚拟机', '', '已完成', '2016-08-18 14:11:04', '2016-08-18 14:09:07', 'VMName:newVM152 VMUuid:500fbdc2-7970-98e9-f354-70410ea7dbbd', '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('24164a22e0c44802a911cb4cd91bbb21', 'f39cf69fc74044f4997de5c505559127', '设置IP', '', '已完成', '2016-08-18 14:11:31', '2016-08-18 14:11:04', 'pid:1398', '3', '设置IP');
INSERT INTO `child_task` VALUES ('a432e6a502cb42c590b80716277363d1', 'f39cf69fc74044f4997de5c505559127', '添加互信', '', '已完成', '2016-08-18 14:11:31', '2016-08-18 14:11:31', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('525b184eddc746ddb5aa83634fc6f24a', 'f39cf69fc74044f4997de5c505559127', '安装应用-sys_httpd', '', '已完成', '2016-08-18 14:12:07', '2016-08-18 14:11:31', 'stats:True', '6', '安装应用');
INSERT INTO `child_task` VALUES ('091b9b40b79c4c93ab6e494471d955a2', 'f39cf69fc74044f4997de5c505559127', '安装应用-app_tomcat', '', '已完成', '2016-08-18 14:12:39', '2016-08-18 14:12:07', 'stats:True', '7', '安装应用');
INSERT INTO `child_task` VALUES ('352468ea99de4052b3eee3efdbe53a26', 'f39cf69fc74044f4997de5c505559127', '清空记录', '', '已完成', '2016-08-18 14:12:40', '2016-08-18 14:12:39', 'pid:1884', '8', '清空记录');
INSERT INTO `child_task` VALUES ('9e60ee23912e4ae8930ed810540030ea', 'ac53539e95e14f17bccff2cbff1f3a4f', '添加互信', '', '已完成', '2016-08-25 18:25:15', '2016-08-25 18:25:15', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('68531be682614f5dab7e78a451c61c72', 'ac53539e95e14f17bccff2cbff1f3a4f', '安装应用-app_tomcat', '', '已完成', '2016-08-25 18:29:15', '2016-08-25 18:25:15', null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('eaddec2cda8f4c2a98de234b0005fba1', 'ac53539e95e14f17bccff2cbff1f3a4f', '清空记录', '', '已完成', '2016-08-25 18:29:59', '2016-08-25 18:29:15', null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('a38293dacd534c3e830393dc80af7260', '5f6fc4c52a904e54a391cea9a9cb31e1', '克隆虚拟机', '', '已完成', '2016-08-25 18:28:00', '2016-08-25 18:21:16', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('54436094fe1f48cd9e101d781e020612', '5f6fc4c52a904e54a391cea9a9cb31e1', '设置IP', '', '已完成', '2016-08-25 18:29:58', '2016-08-25 18:28:00', null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('709896cc44ca49d8b95ad21ecac0dd4f', '5f6fc4c52a904e54a391cea9a9cb31e1', '添加互信', '', '已完成', '2016-08-25 18:29:58', '2016-08-25 18:29:58', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('82d89df19f304694881ef01d04bd04a6', '5f6fc4c52a904e54a391cea9a9cb31e1', '安装应用-app_tomcat', '', '失败', '2016-08-25 18:31:12', '2016-08-25 18:29:58', 'error', '6', '安装应用');
INSERT INTO `child_task` VALUES ('c6e3630955644151a4e17e1900780126', '5f6fc4c52a904e54a391cea9a9cb31e1', '清空记录', '', '失败', '2016-08-25 18:31:12', '2016-08-25 18:31:12', 'Could not find virtual machine \'500f0753-9f2b-bc82-01e1-6118996d7b19\'', '7', '清空记录');
INSERT INTO `child_task` VALUES ('717205a467d344d5ae07308ecfa581a6', '94ce538164b74c6f93c4c3e02282d481', '克隆虚拟机', '', '已完成', '2016-08-26 10:46:42', '2016-08-26 10:41:01', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('d7c3298453224c2f8d5982f5974c85e4', '94ce538164b74c6f93c4c3e02282d481', '设置IP', '', '已完成', '2016-08-26 10:47:12', '2016-08-26 10:46:42', null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('bff35cf390e04da9a9bea65186ba9fa6', '94ce538164b74c6f93c4c3e02282d481', '添加互信', '', '已完成', '2016-08-26 10:47:12', '2016-08-26 10:47:12', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('221188075bf84065920707abcebea00b', '94ce538164b74c6f93c4c3e02282d481', '安装应用-app_tomcat', '', '已完成', '2016-08-26 10:48:06', '2016-08-26 10:47:12', null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('0d84af6b9d2845f08b38f9d8c2fddcd5', '94ce538164b74c6f93c4c3e02282d481', '清空记录', '', '已完成', '2016-08-26 10:48:06', '2016-08-26 10:48:06', null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('96008f2968344c52a6bce6d70e41e3de', '4529d093acd34727b9fce2fc5eb9644b', '克隆虚拟机', '', '已完成', '2016-08-26 10:46:44', '2016-08-26 10:41:01', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('aea372cd65a14860878222771dad1534', '4529d093acd34727b9fce2fc5eb9644b', '设置IP', '', '已完成', '2016-08-26 10:47:21', '2016-08-26 10:46:44', null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('d319df5033ce40239a1f94186b227eba', '4529d093acd34727b9fce2fc5eb9644b', '添加互信', '', '已完成', '2016-08-26 10:47:21', '2016-08-26 10:47:21', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('ba8f8a76aff849cfa5e095f61a83ba85', '4529d093acd34727b9fce2fc5eb9644b', '安装应用-app_tomcat', '', '失败', '2016-08-26 10:48:14', '2016-08-26 10:47:21', 'error', '6', '安装应用');
INSERT INTO `child_task` VALUES ('ec87ea43776c4618af4d58e4ba84fbf3', '4529d093acd34727b9fce2fc5eb9644b', '清空记录', '', '已完成', '2016-08-26 10:48:14', '2016-08-26 10:48:14', null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('778f4680a1e94d2eb58377e5023b5007', '81283ec71f3e464ababcf908eb7c5ce0', '克隆虚拟机', '', '已完成', '2016-08-26 10:50:20', '2016-08-26 10:48:22', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('9dda2276c08e4d8fb7ab86fa348cd18c', '81283ec71f3e464ababcf908eb7c5ce0', '设置IP', '', '已完成', '2016-08-26 10:50:51', '2016-08-26 10:50:20', null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('ede027233b94405a97987e7fd489246f', '81283ec71f3e464ababcf908eb7c5ce0', '添加互信', '', '已完成', '2016-08-26 10:50:51', '2016-08-26 10:50:51', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('5b304fe701d445aeaa47d1db00999706', '81283ec71f3e464ababcf908eb7c5ce0', '安装应用-app_tomcat', '', '已完成', '2016-08-26 10:51:42', '2016-08-26 10:50:51', null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('dc6b1ec4bfc74377896d39f79a8ff984', '81283ec71f3e464ababcf908eb7c5ce0', '清空记录', '', '已完成', '2016-08-26 10:51:43', '2016-08-26 10:51:42', null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('9b722ecafca24ec9b214339760dadcf1', '6b526ce981794f46be06c682c35dfd84', '克隆虚拟机', '', '已完成', '2016-08-26 11:12:59', '2016-08-26 11:10:05', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('b1f0f2cd1f39459e8cd00214d276140b', '6b526ce981794f46be06c682c35dfd84', '设置IP', '', '未开始', null, null, null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('47c67eff1bb44fe9b1be0018c2de4e15', '6b526ce981794f46be06c682c35dfd84', '添加互信', '', '未开始', null, null, null, '4', '添加互信');
INSERT INTO `child_task` VALUES ('707628d6e2284284827a36bb6ec912a7', '6b526ce981794f46be06c682c35dfd84', '附加存储', '', '未开始', null, null, null, '5', '附加存储');
INSERT INTO `child_task` VALUES ('99d936c4e0b544f59651bf9c3a18dd18', '6b526ce981794f46be06c682c35dfd84', '安装应用-app_tomcat', '', '未开始', null, null, null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('9a9cff24c8454747b1da0c2c2abc04e4', '6b526ce981794f46be06c682c35dfd84', '清空记录', '', '未开始', null, null, null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('a4529d631da545c79efaa91f57d0bf95', 'ccd3b19aa97e4bdf9dd7b7da761824a0', '克隆虚拟机', '', '已完成', '2016-08-26 11:19:06', '2016-08-26 11:14:51', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('2302778f11884e4db88ac2678d00445c', 'ccd3b19aa97e4bdf9dd7b7da761824a0', '设置IP', '', '未开始', null, null, null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('39239b93152045f090cf71949238f916', 'ccd3b19aa97e4bdf9dd7b7da761824a0', '添加互信', '', '未开始', null, null, null, '4', '添加互信');
INSERT INTO `child_task` VALUES ('abd1f903286e4b3cb0d979408e98b7e7', 'ccd3b19aa97e4bdf9dd7b7da761824a0', '安装应用-app_tomcat', '', '未开始', null, null, null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('bdae8f6f346946dc8e9c25782d7a5c26', 'ccd3b19aa97e4bdf9dd7b7da761824a0', '清空记录', '', '未开始', null, null, null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('d68cdbfb71184e4cb03df1c251ff19e1', 'a772a4dc3432405b8776120bea272371', '克隆虚拟机', '', '已完成', '2016-08-26 12:04:18', '2016-08-26 12:02:24', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('c5d00ddae76244ec81d352da0786a96d', 'a772a4dc3432405b8776120bea272371', '设置IP', '', '失败', '2016-08-26 12:05:21', '2016-08-26 12:04:18', 'VMwareTools is either not running or not installed. Rerun the script after verifying that VMwareTools is running', '3', '设置IP');
INSERT INTO `child_task` VALUES ('165b44fe30dd47639d620d3abeaa46f0', 'a772a4dc3432405b8776120bea272371', '添加互信', '', '未开始', null, null, null, '4', '添加互信');
INSERT INTO `child_task` VALUES ('190bae3928e14de5afaab4bd0236a0c3', 'a772a4dc3432405b8776120bea272371', '附加存储', '', '未开始', null, null, null, '5', '附加存储');
INSERT INTO `child_task` VALUES ('95d5ee964e2c4a13b4aceed203585e92', 'a772a4dc3432405b8776120bea272371', '安装应用-app_tomcat', '', '未开始', null, null, null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('05db24a7210240458939a83205407ab9', 'a772a4dc3432405b8776120bea272371', '清空记录', '', '未开始', null, null, null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('8a51c3bc807340f6a3b214856e71ff52', 'b2adbe2b4b924e2fb621bf809f01ef64', '克隆虚拟机', '', '已完成', '2016-08-26 12:11:15', '2016-08-26 12:09:19', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('e61ba548e9b446479af0d3a39878650d', 'b2adbe2b4b924e2fb621bf809f01ef64', '设置IP', '', '已完成', '2016-08-26 12:11:39', '2016-08-26 12:11:15', null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('0b7d86d4d7ca4114bf24262ffef5ecca', 'b2adbe2b4b924e2fb621bf809f01ef64', '添加互信', '', '已完成', '2016-08-26 12:11:39', '2016-08-26 12:11:39', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('d830cc8440fc4f3790abfa23b59b3ce0', 'b2adbe2b4b924e2fb621bf809f01ef64', '附加存储', '', '已完成', '2016-08-26 12:11:40', '2016-08-26 12:11:39', null, '5', '附加存储');
INSERT INTO `child_task` VALUES ('d095165954ed44fe868f5c71459d71c3', 'b2adbe2b4b924e2fb621bf809f01ef64', '安装应用-app_tomcat', '', '已完成', '2016-08-26 12:12:31', '2016-08-26 12:11:40', null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('6984217076684fee899f1ec799facd7b', 'b2adbe2b4b924e2fb621bf809f01ef64', '清空记录', '', '已完成', '2016-08-26 12:12:31', '2016-08-26 12:12:31', null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('06d270bb386d495fa8b1c10798fa009e', '71e90589accc41dc8b2fb019c195e343', '克隆虚拟机', '', '已完成', '2016-08-26 14:34:07', '2016-08-26 14:29:57', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('10a015f8f1d24f74b9f279dd414ae92a', '71e90589accc41dc8b2fb019c195e343', '设置IP', '', '已完成', '2016-08-26 14:34:37', '2016-08-26 14:34:07', null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('607587b103a74d63a0c8f38d4b8cd5bf', '71e90589accc41dc8b2fb019c195e343', '添加互信', '', '已完成', '2016-08-26 14:34:37', '2016-08-26 14:34:37', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('4a888d3002a04c5f859076c815ad037a', '71e90589accc41dc8b2fb019c195e343', '附加存储', '', '已完成', '2016-08-26 14:34:37', '2016-08-26 14:34:37', null, '5', '附加存储');
INSERT INTO `child_task` VALUES ('92451bbdfd6e456eaabf130978570d92', '71e90589accc41dc8b2fb019c195e343', '安装应用-os_tuning', '', '已完成', '2016-08-26 14:35:09', '2016-08-26 14:34:37', null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('c348c5df580844fd81507b601b1e160e', '71e90589accc41dc8b2fb019c195e343', '安装应用-sys_httpd', '', '已完成', '2016-08-26 14:35:26', '2016-08-26 14:35:09', null, '7', '安装应用');
INSERT INTO `child_task` VALUES ('e8eb7b7d279a4577aeb95159f952c732', '71e90589accc41dc8b2fb019c195e343', '安装应用-app_tomcat', '', '已完成', '2016-08-26 14:35:58', '2016-08-26 14:35:26', null, '8', '安装应用');
INSERT INTO `child_task` VALUES ('000d3782cc494b14b58b62a9161ecd08', '71e90589accc41dc8b2fb019c195e343', '清空记录', '', '已完成', '2016-08-26 14:35:59', '2016-08-26 14:35:58', null, '9', '清空记录');
INSERT INTO `child_task` VALUES ('6a2193ea4b7f4177841a7ca693f0b924', '2e53e4cff5e24145bf256ec846510ce9', '克隆虚拟机', '', '已完成', '2016-08-26 15:36:31', '2016-08-26 15:34:37', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('292ac3f0edf94f81b7d472b634e4d613', '2e53e4cff5e24145bf256ec846510ce9', '设置IP', '', '已完成', '2016-08-26 15:37:01', '2016-08-26 15:36:31', null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('e756c5c645a04ca3802e9ee0b0c63271', '2e53e4cff5e24145bf256ec846510ce9', '添加互信', '', '已完成', '2016-08-26 15:37:01', '2016-08-26 15:37:01', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('4301c4846ed4445da3cf417b64ddd0e1', '2e53e4cff5e24145bf256ec846510ce9', '安装应用-app_tomcat', '', '已完成', '2016-08-26 15:37:54', '2016-08-26 15:37:01', null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('7a36d92e378a4111a49423492482ef46', '2e53e4cff5e24145bf256ec846510ce9', '清空记录', '', '已完成', '2016-08-26 15:37:54', '2016-08-26 15:37:54', null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('17fd3bce0d2247dda5f5d8657bd75f49', '8911b59950e34308a3e651a04a0e8abd', '克隆虚拟机', '', '已完成', '2016-08-26 15:40:53', '2016-08-26 15:38:51', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('08b4e08ef9874454b7cc38063dc3d07b', '8911b59950e34308a3e651a04a0e8abd', '设置IP', '', '已完成', '2016-08-26 15:41:21', '2016-08-26 15:40:53', null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('179a42724c384d34988f3ef72bc98f4f', '8911b59950e34308a3e651a04a0e8abd', '添加互信', '', '已完成', '2016-08-26 15:41:21', '2016-08-26 15:41:21', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('f9b11055839642c4a84f03b674691973', '8911b59950e34308a3e651a04a0e8abd', '安装应用-os_tuning', '', '已完成', '2016-08-26 15:41:52', '2016-08-26 15:41:21', null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('77374b82bbfd4c88bcf6cf677bd0725b', '8911b59950e34308a3e651a04a0e8abd', '清空记录', '', '已完成', '2016-08-26 15:41:52', '2016-08-26 15:41:52', null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('e8049d43b0f54777b1bf8167aa864b0e', '64c5fb051540452a82a1c8954fe56f23', '克隆虚拟机', '', '已完成', '2016-08-26 16:56:06', '2016-08-26 16:54:07', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('2490afbcb7b3411a8efe45351a9ea2de', '64c5fb051540452a82a1c8954fe56f23', '设置IP', '', '已完成', '2016-08-26 16:56:39', '2016-08-26 16:56:06', null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('31de1130b72b477da40b6ee2465ffb43', '64c5fb051540452a82a1c8954fe56f23', '添加互信', '', '已完成', '2016-08-26 16:56:39', '2016-08-26 16:56:39', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('65b34ef3241d44d0924bfb9feaf6cb63', '64c5fb051540452a82a1c8954fe56f23', '附加存储', '', '已完成', '2016-08-26 16:56:39', '2016-08-26 16:56:39', null, '5', '附加存储');
INSERT INTO `child_task` VALUES ('526ad39cbf2e4e49800f9acddf6522cb', '64c5fb051540452a82a1c8954fe56f23', '安装应用-os_tuning', '', '已完成', '2016-08-26 16:57:10', '2016-08-26 16:56:39', null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('239f6aa72e5147f09e27b70028c0c271', '64c5fb051540452a82a1c8954fe56f23', '清空记录', '', '失败', '2016-08-26 16:57:12', '2016-08-26 16:57:10', '(vim.fault.GuestOperationsUnavailable) {\n   dynamicType = <unset>,\n   dynamicProperty = (vmodl.DynamicProperty) [],\n   msg = \'The guest operations agent could not be contacted.\',\n   faultCause = <unset>,\n   faultMessage = (vmodl.LocalizableMessage) []\n}', '7', '清空记录');
INSERT INTO `child_task` VALUES ('1220e8193b454b2e81ae44cd3b57dfa8', '83346e2cf3c14087858c8d6b0e608521', '克隆虚拟机', '', '已完成', '2016-08-30 10:47:11', '2016-08-30 10:45:20', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('69217c41649240b393265ba1183044de', '83346e2cf3c14087858c8d6b0e608521', '设置IP', '', '已完成', '2016-08-30 10:47:36', '2016-08-30 10:47:11', null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('f4f1fe5803174a6b92d5d4c4d0bb4d60', '83346e2cf3c14087858c8d6b0e608521', '添加互信', '', '已完成', '2016-08-30 10:47:36', '2016-08-30 10:47:36', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('7f4792545ed843a0ba462293737631f2', '83346e2cf3c14087858c8d6b0e608521', '安装应用-app_tomcat', '', '已完成', '2016-08-30 10:48:28', '2016-08-30 10:47:36', null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('0e29e8b19711424da19da219375990f4', '83346e2cf3c14087858c8d6b0e608521', '清空记录', '', '已完成', '2016-08-30 10:48:28', '2016-08-30 10:48:28', null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('c3f39175d1f741e0a83dd63e5a4ead47', '136179aa9ad84fa2b1595aff6173c908', '克隆虚拟机', '', '已完成', '2016-08-31 15:31:57', '2016-08-31 15:30:03', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('b5b907e4714d4edbb90cf6af299493ee', '136179aa9ad84fa2b1595aff6173c908', '设置IP', '', '已完成', '2016-08-31 15:32:25', '2016-08-31 15:31:57', null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('bb898e1ea4e1496db18f213fae0a8a33', '136179aa9ad84fa2b1595aff6173c908', '添加互信', '', '已完成', '2016-08-31 15:32:25', '2016-08-31 15:32:25', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('b8b09fa2ed5a4e159b6cf979cd00e63f', '136179aa9ad84fa2b1595aff6173c908', '安装应用-app_tomcat', '', '已完成', '2016-08-31 15:33:16', '2016-08-31 15:32:25', null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('21897bc9925f4cd4aa44d6f637dbfb6e', '136179aa9ad84fa2b1595aff6173c908', '清空记录', '', '已完成', '2016-08-31 15:33:16', '2016-08-31 15:33:16', null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('969c9c1f7a0b41c7a58be2e253a581dd', '708b1a42a55745a48353435f69e9cea3', '克隆虚拟机', '', '已完成', '2016-09-06 11:05:59', '2016-09-06 11:04:09', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('6fce256cec2c43a298ed5a20859e0a06', '708b1a42a55745a48353435f69e9cea3', '设置IP', '', '已完成', '2016-09-06 11:06:33', '2016-09-06 11:05:59', null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('973e3d1229f5456884431c5ffa64aae4', '708b1a42a55745a48353435f69e9cea3', '添加互信', '', '已完成', '2016-09-06 11:06:33', '2016-09-06 11:06:33', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('8138a729b284488ab82a6b38d6781879', '708b1a42a55745a48353435f69e9cea3', '附加存储', '', '已完成', '2016-09-06 11:06:33', '2016-09-06 11:06:33', null, '5', '附加存储');
INSERT INTO `child_task` VALUES ('d98bf624edcc422f936fa6fc3dffec74', '708b1a42a55745a48353435f69e9cea3', '安装应用-os_tuning', '', '已完成', '2016-09-06 11:07:04', '2016-09-06 11:06:33', null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('2920536d92e94f96966d465a309da611', '708b1a42a55745a48353435f69e9cea3', '安装应用-os_security', '', '已完成', '2016-09-06 11:07:15', '2016-09-06 11:07:04', null, '7', '安装应用');
INSERT INTO `child_task` VALUES ('702c48e64cc64e45bc7ec885af8fff95', '708b1a42a55745a48353435f69e9cea3', '安装应用-sys_httpd', '', '已完成', '2016-09-06 11:07:32', '2016-09-06 11:07:15', null, '8', '安装应用');
INSERT INTO `child_task` VALUES ('db74675ab7c3438d88ebb0721a33bb43', '708b1a42a55745a48353435f69e9cea3', '安装应用-sys_ftpd', '', '已完成', '2016-09-06 11:07:44', '2016-09-06 11:07:32', null, '9', '安装应用');
INSERT INTO `child_task` VALUES ('f5da64fb840e4cea8e797c126bafb1b5', '708b1a42a55745a48353435f69e9cea3', '安装应用-app_tomcat', '', '已完成', '2016-09-06 11:08:16', '2016-09-06 11:07:44', null, '10', '安装应用');
INSERT INTO `child_task` VALUES ('f52579d6cc9c4aa19c28e6bcf9dbbad2', '708b1a42a55745a48353435f69e9cea3', '清空记录', '', '已完成', '2016-09-06 11:08:16', '2016-09-06 11:08:16', null, '11', '清空记录');
INSERT INTO `child_task` VALUES ('2aadce9050a641c183f748896df25cc5', 'e3a3c924611a419db40706557d261f1b', '克隆虚拟机', '', '已完成', '2016-09-06 14:56:51', '2016-09-06 14:54:54', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('8c6d7a308a574c63b8ac2d12b4f63f88', 'e3a3c924611a419db40706557d261f1b', '设置IP', '', '已完成', '2016-09-06 14:57:24', '2016-09-06 14:56:51', null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('181343d732cf442da6d9ad906da47ba8', 'e3a3c924611a419db40706557d261f1b', '添加互信', '', '已完成', '2016-09-06 14:57:24', '2016-09-06 14:57:24', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('a500799c1d8345cba603737dea63b1e1', 'e3a3c924611a419db40706557d261f1b', '安装应用-os_tuning', '', '已完成', '2016-09-06 14:57:56', '2016-09-06 14:57:24', null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('68c2a19e810646d797f66cd32ad0550d', 'e3a3c924611a419db40706557d261f1b', '安装应用-os_security', '', '已完成', '2016-09-06 14:58:07', '2016-09-06 14:57:56', null, '7', '安装应用');
INSERT INTO `child_task` VALUES ('5998b68634d5413dbd1103bca4068f5e', 'e3a3c924611a419db40706557d261f1b', '安装应用-sys_httpd', '', '已完成', '2016-09-06 14:58:24', '2016-09-06 14:58:07', null, '8', '安装应用');
INSERT INTO `child_task` VALUES ('b8b71626d87a4ecb90e69403ff3e06c9', 'e3a3c924611a419db40706557d261f1b', '安装应用-sys_ftpd', '', '已完成', '2016-09-06 14:58:36', '2016-09-06 14:58:24', null, '9', '安装应用');
INSERT INTO `child_task` VALUES ('90f9a4a31a884b88b70f57611763dbfc', 'e3a3c924611a419db40706557d261f1b', '安装应用-test', '', '已完成', '2016-09-06 14:59:13', '2016-09-06 14:58:36', null, '10', '安装应用');
INSERT INTO `child_task` VALUES ('c69d7be6c7f444c8a324bb943675436e', 'e3a3c924611a419db40706557d261f1b', '安装应用-app_tomcat', '', '已完成', '2016-09-06 14:59:31', '2016-09-06 14:59:13', null, '11', '安装应用');
INSERT INTO `child_task` VALUES ('df50acef4ea44a129c4d7776c428f463', 'e3a3c924611a419db40706557d261f1b', '清空记录', '', '已完成', '2016-09-06 14:59:31', '2016-09-06 14:59:31', null, '12', '清空记录');
INSERT INTO `child_task` VALUES ('fa3bcb355fd1458e9452b13449eb4fca', '62793d423276432d99f5f5de38477c18', '克隆虚拟机', '', '已完成', '2016-09-06 16:09:02', '2016-09-06 16:02:58', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('72bacc3015a041b0964667c98711d9e7', '62793d423276432d99f5f5de38477c18', '设置IP', '', '已完成', '2016-09-06 16:09:35', '2016-09-06 16:09:02', null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('df0b7b67c2194f949687367a0bb8dc02', '62793d423276432d99f5f5de38477c18', '添加互信', '', '已完成', '2016-09-06 16:09:35', '2016-09-06 16:09:35', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('a00d26f72c844d84896640db74463255', '62793d423276432d99f5f5de38477c18', '安装应用-os_tuning', '', '已完成', '2016-09-06 16:10:07', '2016-09-06 16:09:35', null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('0e6b47fab39345a0b6bd478a2eb07f3e', '62793d423276432d99f5f5de38477c18', '安装应用-os_security', '', '已完成', '2016-09-06 16:10:18', '2016-09-06 16:10:07', null, '7', '安装应用');
INSERT INTO `child_task` VALUES ('c80e34498cc04715b6d79d98501c4275', '62793d423276432d99f5f5de38477c18', '安装应用-sys_httpd', '', '已完成', '2016-09-06 16:10:35', '2016-09-06 16:10:18', null, '8', '安装应用');
INSERT INTO `child_task` VALUES ('5a939d9674944469b577b9e2481973db', '62793d423276432d99f5f5de38477c18', '安装应用-sys_ftpd', '', '已完成', '2016-09-06 16:10:48', '2016-09-06 16:10:35', null, '9', '安装应用');
INSERT INTO `child_task` VALUES ('11f66bfca5554b12b6fb506a0ee4e376', '62793d423276432d99f5f5de38477c18', '安装应用-test', '', '未开始', null, null, null, '10', '安装应用');
INSERT INTO `child_task` VALUES ('64add5f3da41437499c16e4493545098', '62793d423276432d99f5f5de38477c18', '安装应用-app_tomcat', '', '未开始', null, null, null, '11', '安装应用');
INSERT INTO `child_task` VALUES ('0427b310f7c244e6a36593ca3232704b', '62793d423276432d99f5f5de38477c18', '清空记录', '', '未开始', null, null, null, '12', '清空记录');
INSERT INTO `child_task` VALUES ('b0715536de3043979da8d6fa0e6d4b79', 'db9830e7c5754f5ba164d7ea1f50fa3e', '克隆虚拟机', '', '已完成', '2016-09-07 14:47:55', '2016-09-07 14:46:05', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('b089730310af4614bb8f3834c5194a49', 'db9830e7c5754f5ba164d7ea1f50fa3e', '设置IP', '', '已完成', '2016-09-07 14:48:22', '2016-09-07 14:47:55', null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('1dd8580323da40989b22e4a48986efc1', 'db9830e7c5754f5ba164d7ea1f50fa3e', '添加互信', '', '已完成', '2016-09-07 14:48:22', '2016-09-07 14:48:22', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('c2c7d9ecd5494c2ab0e52e32f485656c', 'db9830e7c5754f5ba164d7ea1f50fa3e', '安装应用-os_tuning', '', '已完成', '2016-09-07 14:48:52', '2016-09-07 14:48:22', null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('94388ef8f9734030b5ccf4aa37ca3f24', 'db9830e7c5754f5ba164d7ea1f50fa3e', '安装应用-os_security', '', '已完成', '2016-09-07 14:49:03', '2016-09-07 14:48:52', null, '7', '安装应用');
INSERT INTO `child_task` VALUES ('719579f271db464da4d0d6cef93a3c3e', 'db9830e7c5754f5ba164d7ea1f50fa3e', '安装应用-sys_httpd', '', '已完成', '2016-09-07 14:49:19', '2016-09-07 14:49:03', null, '8', '安装应用');
INSERT INTO `child_task` VALUES ('4b3f2581aba548228232a423f729befd', 'db9830e7c5754f5ba164d7ea1f50fa3e', '安装应用-sys_ftpd', '', '已完成', '2016-09-07 14:49:32', '2016-09-07 14:49:19', null, '9', '安装应用');
INSERT INTO `child_task` VALUES ('c0d744a30e1a44718e51b540e28c85d6', 'db9830e7c5754f5ba164d7ea1f50fa3e', '安装应用-app_tomcat', '', '已完成', '2016-09-07 14:50:04', '2016-09-07 14:49:32', null, '10', '安装应用');
INSERT INTO `child_task` VALUES ('7c4509c86bef41c89137f388b6d3154d', 'db9830e7c5754f5ba164d7ea1f50fa3e', '清空记录', '', '已完成', '2016-09-07 14:50:04', '2016-09-07 14:50:04', null, '11', '清空记录');
INSERT INTO `child_task` VALUES ('26fc0bec746d406cb69ae45cde57327a', 'b2feff66c88a44c0a357f2edc43c9c7c', '克隆虚拟机', '', '未开始', null, null, null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('edd583bec37940daa89bd0ef90cea445', 'b2feff66c88a44c0a357f2edc43c9c7c', '设置IP', '', '未开始', null, null, null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('e52ff6fe3ed6479693be8826c6fd0e0c', 'b2feff66c88a44c0a357f2edc43c9c7c', '添加互信', '', '未开始', null, null, null, '4', '添加互信');
INSERT INTO `child_task` VALUES ('0b91245897c241cfa8632982380a327a', 'b2feff66c88a44c0a357f2edc43c9c7c', '安装应用-os_tuning', '', '未开始', null, null, null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('7b8c32c28433478ba3462161a26c38c3', 'b2feff66c88a44c0a357f2edc43c9c7c', '安装应用-os_security', '', '未开始', null, null, null, '7', '安装应用');
INSERT INTO `child_task` VALUES ('6ad7af57fd184a47aa392ef86839266c', 'b2feff66c88a44c0a357f2edc43c9c7c', '安装应用-sys_httpd', '', '未开始', null, null, null, '8', '安装应用');
INSERT INTO `child_task` VALUES ('855bf6fd2cef42a19694d74aa271431e', 'b2feff66c88a44c0a357f2edc43c9c7c', '安装应用-sys_ftpd', '', '未开始', null, null, null, '9', '安装应用');
INSERT INTO `child_task` VALUES ('701442353c9d43e88e82515599590344', 'b2feff66c88a44c0a357f2edc43c9c7c', '安装应用-app_tomcat', '', '未开始', null, null, null, '10', '安装应用');
INSERT INTO `child_task` VALUES ('f7569760120b4499874e30896f5e1f78', 'b2feff66c88a44c0a357f2edc43c9c7c', '清空记录', '', '未开始', null, null, null, '11', '清空记录');
INSERT INTO `child_task` VALUES ('606c2b5d12c34c0b85f4d0bec776b2fc', '76c4aeec6a8f4510a142c97fa3e91c36', '克隆虚拟机', '', '已完成', '2016-09-07 15:10:29', '2016-09-07 15:01:23', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('5b69e040a3f443f594dd7640adb071a0', '76c4aeec6a8f4510a142c97fa3e91c36', '设置IP', '', '已完成', '2016-09-07 15:11:02', '2016-09-07 15:10:29', null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('e805ae681722439f9c7eac159db17815', '76c4aeec6a8f4510a142c97fa3e91c36', '添加互信', '', '已完成', '2016-09-07 15:11:02', '2016-09-07 15:11:02', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('7fffadc768114a9f8f0c7cf45a476648', '76c4aeec6a8f4510a142c97fa3e91c36', '安装应用-app_tomcat', '', '已完成', '2016-09-07 15:11:54', '2016-09-07 15:11:02', null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('31217d726856451991a558e9f092ce52', '76c4aeec6a8f4510a142c97fa3e91c36', '清空记录', '', '已完成', '2016-09-07 15:11:54', '2016-09-07 15:11:54', null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('8a2af6da34234e85a79070e39fe50fe1', 'fbb896c0bbc14395bf15a51678a5b9bf', '克隆虚拟机', '', '已完成', '2016-09-07 15:10:30', '2016-09-07 15:06:41', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('2f6125a4a5e448d1924c74d110685372', 'fbb896c0bbc14395bf15a51678a5b9bf', '设置IP', '', '已完成', '2016-09-07 15:11:02', '2016-09-07 15:10:30', null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('070553d8a79741f2b0c86990378fc527', 'fbb896c0bbc14395bf15a51678a5b9bf', '添加互信', '', '已完成', '2016-09-07 15:11:02', '2016-09-07 15:11:02', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('65b68e829fd947dea035aecd9cf1ddd3', 'fbb896c0bbc14395bf15a51678a5b9bf', '安装应用-os_tuning', '', '已完成', '2016-09-07 15:11:32', '2016-09-07 15:11:02', null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('3dd9a6c3c102419995a3dc7b592daf97', 'fbb896c0bbc14395bf15a51678a5b9bf', '安装应用-os_security', '', '已完成', '2016-09-07 15:11:43', '2016-09-07 15:11:32', null, '7', '安装应用');
INSERT INTO `child_task` VALUES ('bcd08af7edeb4e8dbd24de9480c1dd02', 'fbb896c0bbc14395bf15a51678a5b9bf', '安装应用-sys_httpd', '', '已完成', '2016-09-07 15:12:00', '2016-09-07 15:11:43', null, '8', '安装应用');
INSERT INTO `child_task` VALUES ('9c6dfa4bcaf744ddab596c1cf1a88a1e', 'fbb896c0bbc14395bf15a51678a5b9bf', '安装应用-sys_ftpd', '', '已完成', '2016-09-07 15:12:13', '2016-09-07 15:12:00', null, '9', '安装应用');
INSERT INTO `child_task` VALUES ('ce4e97be3e6e405182bf2ff4ba4740af', 'fbb896c0bbc14395bf15a51678a5b9bf', '安装应用-app_tomcat', '', '已完成', '2016-09-07 15:12:49', '2016-09-07 15:12:13', null, '10', '安装应用');
INSERT INTO `child_task` VALUES ('f5b46c9519004f4f8d163e107825892b', 'fbb896c0bbc14395bf15a51678a5b9bf', '清空记录', '', '已完成', '2016-09-07 15:12:49', '2016-09-07 15:12:49', null, '11', '清空记录');
INSERT INTO `child_task` VALUES ('b43afdcf7efc42c8a798e8706c8f90a7', '9557ef2d4be149f5ad04dd33207f9325', '克隆虚拟机', '', '已完成', '2016-09-07 16:40:31', '2016-09-07 16:38:43', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('4586861f7a08439ab5ca08229feb8e1e', '9557ef2d4be149f5ad04dd33207f9325', '设置IP', '', '已完成', '2016-09-07 16:41:02', '2016-09-07 16:40:31', null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('9b13bad36c9b400d92b4751ba794c730', '9557ef2d4be149f5ad04dd33207f9325', '添加互信', '', '已完成', '2016-09-07 16:41:02', '2016-09-07 16:41:02', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('94bfc39e6d4a44d0a78961c3ad1a9413', '9557ef2d4be149f5ad04dd33207f9325', '安装应用-os_tuning', '', '已完成', '2016-09-07 16:41:31', '2016-09-07 16:41:02', null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('20c89f3b1e554271960e8cff014aa399', '9557ef2d4be149f5ad04dd33207f9325', '安装应用-os_security', '', '已完成', '2016-09-07 16:41:41', '2016-09-07 16:41:31', null, '7', '安装应用');
INSERT INTO `child_task` VALUES ('9e14649fb031442d97aea5d1b920e3f9', '9557ef2d4be149f5ad04dd33207f9325', '安装应用-sys_httpd', '', '已完成', '2016-09-07 16:41:58', '2016-09-07 16:41:41', null, '8', '安装应用');
INSERT INTO `child_task` VALUES ('9ce588ba50064c0e9e13d379a158cf24', '9557ef2d4be149f5ad04dd33207f9325', '安装应用-sys_ftpd', '', '已完成', '2016-09-07 16:42:11', '2016-09-07 16:41:58', null, '9', '安装应用');
INSERT INTO `child_task` VALUES ('3e46567be9084fd3b2fb9adfd0ad96c8', '9557ef2d4be149f5ad04dd33207f9325', '安装应用-app_tomcat', '', '已完成', '2016-09-07 16:42:43', '2016-09-07 16:42:11', null, '10', '安装应用');
INSERT INTO `child_task` VALUES ('791b039343804fac8eff3d270a0730c9', '9557ef2d4be149f5ad04dd33207f9325', '清空记录', '', '已完成', '2016-09-07 16:42:43', '2016-09-07 16:42:43', null, '11', '清空记录');
INSERT INTO `child_task` VALUES ('ad9d1c9f66774e349955c8d642beedbd', '0902c7ed46d948e5880621ae03261fb6', '克隆虚拟机', '', '已完成', '2016-09-08 11:50:05', '2016-09-08 11:48:19', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('b9550c60f9234609a7f5766ddbba1937', '0902c7ed46d948e5880621ae03261fb6', '设置IP', '', '已完成', '2016-09-08 11:50:37', '2016-09-08 11:50:05', null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('dc8cc39115504e96943d35da09c418fb', '0902c7ed46d948e5880621ae03261fb6', '添加互信', '', '已完成', '2016-09-08 11:50:37', '2016-09-08 11:50:37', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('2f299a272b27449aaf004ec3f98eb702', '0902c7ed46d948e5880621ae03261fb6', '安装应用-os_tuning', '', '已完成', '2016-09-08 11:51:05', '2016-09-08 11:50:37', null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('2bf7b8a3551b454a9702f993c8d21719', '0902c7ed46d948e5880621ae03261fb6', '安装应用-os_security', '', '已完成', '2016-09-08 11:51:16', '2016-09-08 11:51:05', null, '7', '安装应用');
INSERT INTO `child_task` VALUES ('0e2f1021b45b4250a4e2923845f0a264', '0902c7ed46d948e5880621ae03261fb6', '安装应用-sys_httpd', '', '已完成', '2016-09-08 11:51:32', '2016-09-08 11:51:16', null, '8', '安装应用');
INSERT INTO `child_task` VALUES ('577428b39caf47df93904e4bc57fccc0', '0902c7ed46d948e5880621ae03261fb6', '安装应用-sys_ftpd', '', '已完成', '2016-09-08 11:51:44', '2016-09-08 11:51:32', null, '9', '安装应用');
INSERT INTO `child_task` VALUES ('a937b87ab6e8487692ae136e9e1e1a5a', '0902c7ed46d948e5880621ae03261fb6', '安装应用-app_tomcat', '', '已完成', '2016-09-08 11:52:15', '2016-09-08 11:51:44', null, '10', '安装应用');
INSERT INTO `child_task` VALUES ('71a58225d4174036b60c33e77447ea0b', '0902c7ed46d948e5880621ae03261fb6', '清空记录', '', '已完成', '2016-09-08 11:52:15', '2016-09-08 11:52:15', null, '11', '清空记录');
INSERT INTO `child_task` VALUES ('bffe81356a0d4f0e881d5b514d95677c', '9835658c16554a95b20cb2622dfd80a5', '克隆虚拟机', '', '已完成', '2016-09-08 15:47:41', '2016-09-08 15:45:54', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('fdd6556c321e44fe8d07da1d62be6a60', '9835658c16554a95b20cb2622dfd80a5', '设置IP', '', '已完成', '2016-09-08 15:48:09', '2016-09-08 15:47:42', null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('74e23b22e50b485c9a687ff4d158da3c', '9835658c16554a95b20cb2622dfd80a5', '添加互信', '', '已完成', '2016-09-08 15:48:09', '2016-09-08 15:48:09', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('ab188c3a65914ca2883e53f5e1d2a0e7', '9835658c16554a95b20cb2622dfd80a5', '安装应用-os_tuning', '', '已完成', '2016-09-08 15:48:39', '2016-09-08 15:48:09', null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('7e7dca9b26724d3c92175ce693802a26', '9835658c16554a95b20cb2622dfd80a5', '清空记录', '', '已完成', '2016-09-08 15:48:39', '2016-09-08 15:48:39', null, '7', '清空记录');
INSERT INTO `child_task` VALUES ('98443854c2254346a2c6ef201169a0d7', 'dc76ae92b0fa4b4bb7771678c001720f', '克隆虚拟机', '', '已完成', '2016-09-08 16:12:38', '2016-09-08 16:10:23', null, '2', '克隆虚拟机');
INSERT INTO `child_task` VALUES ('556101866b764444a3da47b488319077', 'dc76ae92b0fa4b4bb7771678c001720f', '设置IP', '', '已完成', '2016-09-08 16:13:09', '2016-09-08 16:12:38', null, '3', '设置IP');
INSERT INTO `child_task` VALUES ('9c5eae8f542c4653a40cfb276ee7d770', 'dc76ae92b0fa4b4bb7771678c001720f', '添加互信', '', '已完成', '2016-09-08 16:13:09', '2016-09-08 16:13:09', '', '4', '添加互信');
INSERT INTO `child_task` VALUES ('969dfa32e3b647e0820b0b40785c11b2', 'dc76ae92b0fa4b4bb7771678c001720f', '安装应用-os_tuning', '', '已完成', '2016-09-08 16:13:44', '2016-09-08 16:13:09', null, '6', '安装应用');
INSERT INTO `child_task` VALUES ('89cda8fe65d245cb880b1a8e63c77d66', 'dc76ae92b0fa4b4bb7771678c001720f', '清空记录', '', '失败', '2016-09-08 16:13:45', '2016-09-08 16:13:44', '(vim.fault.GuestOperationsUnavailable) {\n   dynamicType = <unset>,\n   dynamicProperty = (vmodl.DynamicProperty) [],\n   msg = \'The guest operations agent could not be contacted.\',\n   faultCause = <unset>,\n   faultMessage = (vmodl.LocalizableMessage) []\n}', '7', '清空记录');

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `uuid` varchar(32) NOT NULL COMMENT 'UUID可使用Java程序生成，也可以使用MySQL自带UUID函数或者UUID_SHORT函数生成',
  `dept_name` varchar(45) NOT NULL,
  `dept_ parent_uuid` varchar(32) DEFAULT NULL COMMENT '上级部门UUID',
  `dept_level` int(11) DEFAULT NULL COMMENT '部门级别，根为0，以此类推',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of departments
-- ----------------------------

-- ----------------------------
-- Table structure for history_report_all
-- ----------------------------
DROP TABLE IF EXISTS `history_report_all`;
CREATE TABLE `history_report_all` (
  `uuid` varchar(32) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `target_uuid` varchar(32) DEFAULT NULL,
  `cpu_all` varchar(45) DEFAULT NULL,
  `cpu_used` varchar(45) DEFAULT NULL,
  `cpu_run` varchar(45) DEFAULT NULL,
  `mem_all` varchar(45) DEFAULT NULL,
  `mem_used` varchar(45) DEFAULT NULL,
  `mem_run` varchar(45) DEFAULT NULL,
  `disk_all` varchar(45) DEFAULT NULL,
  `disk_used` varchar(45) DEFAULT NULL,
  `disk_run` varchar(45) DEFAULT NULL,
  `ip_all` varchar(45) DEFAULT NULL,
  `ip_used` varchar(45) DEFAULT NULL,
  `ip_run` varchar(45) DEFAULT NULL,
  `app_all` varchar(45) DEFAULT NULL,
  `app_used` varchar(45) DEFAULT NULL,
  `app_run` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history_report_all
-- ----------------------------
INSERT INTO `history_report_all` VALUES ('f1783463ab144466afdc54e8f3254a4e', 'All', '2016-08-30', null, '20.0', '40.64', '4.0', '80.0', '48.250004', '8.0', '255490.0', '1289.79', '7.0', '6', '6', '1', '6', '6', '1');
INSERT INTO `history_report_all` VALUES ('8e2cc180daa64625aa874788d0338141', 'All', '2016-08-31', null, '20.0', '40.64', '4.0', '80.0', '48.250004', '8.0', '255490.0', '1289.79', '7.0', '6', '6', '1', '6', '6', '1');
INSERT INTO `history_report_all` VALUES ('680271ff3ee64a68a5a51f66968dfc4d', 'All', '2016-09-01', null, '20.0', '40.64', '4.0', '80.0', '48.250004', '8.0', '255490.0', '1289.79', '7.0', '6', '6', '1', '6', '6', '1');
INSERT INTO `history_report_all` VALUES ('903a6000973a4a87bbf5d63c88cbb088', 'All', '2016-09-02', null, '20.0', '40.64', '4.0', '80.0', '48.250004', '8.0', '255490.0', '1289.79', '7.0', '6', '6', '1', '6', '6', '1');
INSERT INTO `history_report_all` VALUES ('03586d671ee34705af074cfab00a36bc', 'All', '2016-09-03', null, '20.0', '40.64', '4.0', '80.0', '48.250004', '8.0', '255490.0', '1289.79', '7.0', '6', '6', '1', '6', '6', '1');
INSERT INTO `history_report_all` VALUES ('698a974bd7c440c49f0c21ba0365df89', 'All', '2016-09-04', null, '20.0', '40.64', '4.0', '80.0', '48.250004', '8.0', '255490.0', '1289.79', '7.0', '6', '6', '1', '6', '6', '1');
INSERT INTO `history_report_all` VALUES ('7cda1a216a3f475abee32583322aea90', 'All', '2016-09-05', null, '20.0', '40.64', '4.0', '80.0', '48.250004', '8.0', '255490.0', '1289.79', '7.0', '6', '6', '1', '6', '6', '1');

-- ----------------------------
-- Table structure for history_report_project
-- ----------------------------
DROP TABLE IF EXISTS `history_report_project`;
CREATE TABLE `history_report_project` (
  `uuid` varchar(32) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `target_uuid` varchar(32) DEFAULT NULL,
  `cpu_all` varchar(45) DEFAULT NULL,
  `cpu_used` varchar(45) DEFAULT NULL,
  `cpu_run` varchar(45) DEFAULT NULL,
  `mem_all` varchar(45) DEFAULT NULL,
  `mem_used` varchar(45) DEFAULT NULL,
  `mem_run` varchar(45) DEFAULT NULL,
  `disk_all` varchar(45) DEFAULT NULL,
  `disk_used` varchar(45) DEFAULT NULL,
  `disk_run` varchar(45) DEFAULT NULL,
  `ip_all` varchar(45) DEFAULT NULL,
  `ip_used` varchar(45) DEFAULT NULL,
  `ip_run` varchar(45) DEFAULT NULL,
  `app_all` varchar(45) DEFAULT NULL,
  `app_used` varchar(45) DEFAULT NULL,
  `app_run` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history_report_project
-- ----------------------------
INSERT INTO `history_report_project` VALUES ('62264fd5b6cf47c19d26b390b64e8cdc', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3c5b8fdda0574912bc41093225ec9136', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('76a21ba00072478096a29dded6d1cec3', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('9af5172f20404c0c805355b6b09deabf', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('20624871199f44c48ad810a6c8c5fa20', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('e532b8b515d044e6b3c0b4d1a57b4a96', 'My Project', '2016-07-01', 'a3a3433929564653959934793d113288', '1', '4', '0', '1', '8', '0', '100', '7', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('6d31b3c9d9994125815b3e13224bfcf2', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('fab9f743db5244acbd721c072dc99fa7', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('7a98bfa2239346fe88a0ccd371ae974a', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('49312323a3864137aec961f0608663ce', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('15f2df881fba41e3821816ce7ccc8e5f', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('e82184b791a34a1cbe3c82ffdccd5bbd', 'My Project', '2016-09-01', 'a3a3433929564653959934793d113288', '1', '4', '4', '1', '8', '8', '100', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('05e9cd3221eb428bbde34e55c07cdbe5', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('16573c229735422e9f871f0885ef35b2', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c4df0f6e9c1245b59487d3b9c69c17d6', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f72d280f2916495c8f81e45e6bd4217e', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('73a4887f2160473e969ef511b5cf79c4', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('374795e193f24fb99eed87f11744d839', 'My Project', '2016-09-01', 'a3a3433929564653959934793d113288', '1', '4', '4', '1', '8', '8', '100', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('cbb75da5457546ee9a28f343c93c54ce', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('6f4484a3a5bc46118896066d5fec3f00', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('e73422e8bad7414e9b02bd255be1edd5', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('a4ff5c985c0643ecaa83b1f2aa6cbd05', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3e2b65f35d5843828770e3a881149b2a', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('9d7b2eae529b406092bfaa7c42763e66', 'My Project', '2016-09-01', 'a3a3433929564653959934793d113288', '1', '4', '4', '1', '8', '8', '100', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('8090937afa1a4d4c8ca75b317ceb32dc', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('06f0097a36ce454f9e74fd64a7eb56dd', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f6c7e55fcdfa42e2b784c0cad54b75df', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('7685bc50226d460393b69f66bf7ea1bf', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3d69fe8f3c9e473181c223681f429d03', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('9b4df1bd7db84206b405bc9783828fb9', 'My Project', '2016-09-01', 'a3a3433929564653959934793d113288', '1', '4', '4', '1', '8', '8', '100', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('4e3d1755b8f44c9a822d1bf9955cf688', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('e2818b40a51242c9b7886ef1ddcf6df4', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('6685906276e147938614509bf020065d', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('a5107dbe523c4d579c4e178d8fd37eb3', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1f7bd1c5fbba4934b8ae5af64a26a412', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('df5645e379b1499daf9245db0fcd3f2f', 'My Project', '2016-09-01', 'a3a3433929564653959934793d113288', '1', '4', '4', '1', '8', '8', '100', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('bda4b3775af74665a195a25ba23c5187', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b7d5054baaa5475f8604b7c0cecb7471', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('8444abb113074aed973220d3825ea9d0', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('5bba2a0cbe9c4109bff46d9b9b9e4aa1', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('9601fa9d4e204a86a37d0b9682bcf839', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('98bdae37f4d5451781873e6ae0d3f4fb', 'My Project', '2016-09-01', 'a3a3433929564653959934793d113288', '1', '4', '4', '1', '8', '8', '100', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('662490a478504926a0ce6576394e64d0', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('e124ca093d894c58ac9e2d5e9cefcef4', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('9f4f4da6db94479396a9b52458c880ca', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('29bd25482da54f068ac709f6e50d724d', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d5514a93abf846709f43265272f0faaa', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('419d94af629e4d6abd2fe3f8007f5359', 'My Project', '2016-09-01', 'a3a3433929564653959934793d113288', '1', '4', '4', '1', '8', '8', '100', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('b1bb9d23007943cea39501de79eec7d4', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b8419c90e1724826875ef7ee7237c161', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1eeca28ea869420880ff2495750e7009', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('95b79e686ea548d386676465e5672cab', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('5c92a7e2dd7c46e1b35e51ed7f68a450', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4da6b95807e044c6bedd63dee0414aec', 'My Project', '2016-09-01', 'a3a3433929564653959934793d113288', '1', '4', '4', '1', '8', '8', '100', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('7f6bf9ff714a46e4a677d914825e6d2f', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('31b50dd2e5d54d1db252c1095f520d4d', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('01b335f0c32c468ca31822d334a4412b', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4d6ca8b94fc04f9cb8a414f94142354f', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('459651630bb9482292d125abfbdae949', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1272af9492834e1c9a5c59fd5110c318', 'My Project', '2016-09-01', 'a3a3433929564653959934793d113288', '1', '4', '4', '1', '8', '8', '100', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('d0469e28cf8a41c7a4c202edda53d908', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('a511f945a98d471faa2bd2d060e90328', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('fb6b3e2a7cd14c5b95908d99dc9c611b', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('8b9dcd936dff4b059dd6059cf5eb2157', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('8b97ab933dde4aca87ab26d244de2062', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ba7f4f3a194d4502be2e68208acf24db', 'My Project', '2016-09-01', 'a3a3433929564653959934793d113288', '1', '4', '4', '1', '8', '8', '100', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('a44cf44869e84ab9bf6c286689a53f23', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ba8b1b65041c4acdbc6938d097ef37b6', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('dd6790cae7834c13a444f7cc1883df27', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('edb561c7aaec4104b4c77652426966ff', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('8dff9dacdbbb4ef388b4d0e3598bd11e', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('0e7dddbeff894a80b7812b6f963a751d', 'My Project', '2016-09-01', 'a3a3433929564653959934793d113288', '1', '4', '4', '1', '8', '8', '100', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('b024a5471e134c7e93058b1ece5fd516', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d3964e8799484681ac8f490db3ef3cf6', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f669053fe7f040f4b058aa3dbdc10893', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('23012e09fa7b4131bc4f787fe4527173', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d0047e054fa34520856b2c4a5e0ba57d', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('fb4940ad473e451cac1ea00ac15b50e4', 'My Project', '2016-09-01', 'a3a3433929564653959934793d113288', '1', '4', '4', '1', '8', '8', '100', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('b64d3dc4dae24e83aa8807a4049a70ef', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b3012a7425404c64bdf209b6b3438618', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('66eb0ca0db4449fda7bbe53c530891ed', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('5de1651ac00b4ee4ab401b673dcc5c73', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b28fdcaf0f914de1be7d1e567fff266d', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('fc41a327796e4172a74d9e7610ce40fa', 'My Project', '2016-09-01', 'a3a3433929564653959934793d113288', '1', '4', '4', '1', '8', '8', '100', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('aaacdaa65f5c4a41866b8835b2888f17', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('61c0e88eaa844af1ae4387ce10e670c0', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('9456c0f174c148a695b406ade7db0acd', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('e83960909f5949c98412d3fe30f8e81b', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f3998eaaf6bd40039da759021ad1281f', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f7f3cd7fb06c4e0f9befebfc59bac3fd', 'My Project', '2016-09-01', 'a3a3433929564653959934793d113288', '1', '4', '4', '1', '8', '8', '100', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('e3ec5f3832b14c9ba2cd681dc17c6d79', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('041f6e2afe7c421bad06bba40faa6e56', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('22ddc946c8c745a5a91636bcd97e8b32', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('14a3805606d8430a9831bfc36419beac', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4ebd0d59dfc943b2a2320cfa338b5084', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c09385dbf934442795aa46af8e342710', 'My Project', '2016-09-01', 'a3a3433929564653959934793d113288', '1', '4', '4', '1', '8', '8', '100', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('af7907b50a374b35b74ea3e4d7df2515', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('8106503052b5416d977f398854e95d14', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('67d9e502d7f84cc6a547c4545c9b5d1b', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d220022c9e2e482c96c451ebbf4879c9', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('e1ba9198d55d4abd802a10980d09e3b9', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('7959f865dfb348f09ac4be41b0c7bdbf', 'My Project', '2016-09-01', 'a3a3433929564653959934793d113288', '1', '4', '4', '1', '8', '8', '100', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('7487f71251ba463a84a43a91b6c3d39d', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('397f3b1b490a4ef5944a7f0d646093e2', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1cd3e6a817ab487098d447f4538be22c', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('bb70ac5d209b46c6bd7bfb60dc5b0efc', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('7806ca1119fb43c2a6dfd00cba1a3685', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('bceb7c7655514f7eacf40f9df545bfc1', 'My Project', '2016-09-01', 'a3a3433929564653959934793d113288', '1', '4', '4', '1', '8', '8', '100', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('d4a994dc90684022b5c54a14a68f864a', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3e3dc564b4384b7e8de0e86dccab8352', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c4ca02b536f14edc8e9abc17f0210711', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ea2c3d97667c403c8785be5677404795', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4c6a7103cbb04b42a9a47997ce5fe0ca', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('28ce3c548cf3400a94191bab08225fe8', 'My Project', '2016-09-01', 'a3a3433929564653959934793d113288', '1', '4', '4', '1', '8', '8', '100', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('eae3e5648074486c8913d1f9aed8271c', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('e59e1f52943c4588ad5f54c0a105afa7', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('14373d67b5e641e2afca53cf954d811b', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c62bf437b2aa470f921d774373342410', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('255645752bfe4ded8f3d08675ba85048', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2b85f56304ba4fb2a903b0bbe067418e', 'My Project', '2016-09-01', 'a3a3433929564653959934793d113288', '1', '4', '4', '1', '8', '8', '100', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('eb0c5cca593349ec92d94b845bed1112', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1ea10912f9754abca79bdef556848da0', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('a1cc917f8c4140b7ac36e69fa5986d95', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('a2c7dd4bfab74bfba65df73449a0560f', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('0210bcbcd5bd4a2bad78e639d4587681', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('8bc4fd465ae94dd69f6c62932581839a', 'My Project', '2016-09-01', 'a3a3433929564653959934793d113288', '1', '4', '4', '1', '8', '8', '100', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('7a073e6298fe490a97b08309f3232481', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('5ce2872668274f3ba7a33345e9744368', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d2b98567012e4ecd91ad55a7c50742cf', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('085e34bcd1dd4b4eb745dd892fd59a64', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1779a9bd46804eb3b7fc983d6e03bac2', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3e68a24433454e1f9339d4765467f973', 'My Project', '2016-09-01', 'a3a3433929564653959934793d113288', '1', '4', '4', '1', '8', '8', '100', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('a6fb91c99fec4c33a8bc26ce90aa3a7e', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('a74067c8f4424957bc36db5150f47927', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d60f48377aa647d2bab79ead418db15f', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('67ac899af94b43b280b4a9054b14dca6', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d861ec7e81d2459980a48deb8bc9325d', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('a95206dcd1a4416088703b6705be17a3', 'My Project', '2016-09-01', 'a3a3433929564653959934793d113288', '1', '4', '4', '1', '8', '8', '100', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('a6a4c7c3404b49918da1518d73e47635', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('28905a294cd74ae58530fbc644ff1c18', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d855b840cc434ac19de6fb85254a06bb', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('9904fd10083647d5b6a41b0d41440fb2', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d11ced78e6414e90aebc01bf359fec26', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b13373d5b8cf44e9a852fda30c6a7f4c', 'My Project', '2016-09-01', 'a3a3433929564653959934793d113288', '1', '4', '4', '1', '8', '4', '100', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('224f40c434f444d3854097d155dc2d75', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('0b39e1b609af4152be48e56f2ecb3e4b', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('09dd2920739e4bb88a705b9975f863dc', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('36d2fc3ce03e4f1f903055a72ec3ba12', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2ea34f2260554d82a827b84c1870b7f1', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c350348f45e54d65b739fc5bf5f808f4', 'My Project', '2016-09-01', 'a3a3433929564653959934793d113288', '1', '4', '4', '1', '8', '4', '100', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('a8df154144844b29855808195e3b5f0f', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('6ae5dc97dded49d9a419fa31f6fd55c1', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('6021a18e3a5d4edf81bf3dade97e66b5', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('24a1fa398bbd4d0093a7078aa2175e4d', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1a1ca2f78a86414a938a1e2b5403484b', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('55940fdb77754b02bbcd3c104bbde0a6', 'My Project', '2016-09-01', 'a3a3433929564653959934793d113288', '1', '4', '4', '1', '8', '8', '100', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('06b22e76ec414da5b386e7b1b27171cb', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('fa7d6b5df7f043c1b0ec3a14d8873d64', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ae812ee92ee2401480a3da016dafcea4', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('5b69d3c858214c9aba2160cf9029329a', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('fd926f499c07453082a5282ec90b076e', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ba95cb0a910847a2b23f0c8d7e4658f9', 'My Project', '2016-09-01', 'a3a3433929564653959934793d113288', '1', '4', '4', '1', '8', '8', '100', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('296a228afb9f426a88d6af54dcc36194', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b9f1a9d43ef34285832d4c09cb386b92', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1526b00027c34d8391a4a90e0ea0f81b', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('64157d4c2eac403fbd33bb2d022d6a03', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f52f82edc29f4994b7641e16e70625ed', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('0aeb40da11f7467f8ddc1a360f25ea36', 'My Project', '2016-09-01', 'a3a3433929564653959934793d113288', '1', '4', '4', '1', '8', '8', '100', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('c9981b7f2e61464bb05365fa466044fc', 'wpTest', '2016-09-01', 'c93030c93674434bb086f13f6ec62cff', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('9ec91a557df2448b9cca8859e5279e90', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f76d455b8c8d417f82a0e59688475aab', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('405e0f58f32d4c178d1f7113a9ba352b', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f9ec8f913d944837b286a9ab783f9aa0', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('7f45d19905a7452eb027496ee7be67a4', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b780c0bb97664530a36a8fdd4d1418ef', 'My Project', '2016-09-01', 'a3a3433929564653959934793d113288', '1', '4', '4', '1', '8', '8', '100', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('d4f56b683a754cdb9d0847b00aec6c5a', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('96a1c68cb44546c38e1ea6f88082cb77', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('344b8284e344405da50a2b8d39d6fbbc', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b27e74c2f2514ad093f947af90aa0ca7', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('9b57f277ec094f879a64620d4bdf8d8b', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('02c2c539f39340208bf58ae65dd9f654', 'My Project', '2016-09-01', 'a3a3433929564653959934793d113288', '1', '4', '4', '1', '8', '8', '100', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('3055ecc10fb24d6c9640a4c8fa96f879', 'hhh', '2016-09-01', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('099e1a2cff7a428dba95df4a15f888c3', 'new', '2016-09-01', '48c5448d3c3c4321b9eb332cfed5a9d3', '1', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('79158688025e4c10a653bba36463c2f6', 'aaa', '2016-09-01', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f3933416fcc84a29bf5852a1addfc503', 'ddd', '2016-09-01', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('58b6131db7cb420894bbc1bb7ad70782', 'efe', '2016-09-01', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('05cc4e580ce642bb97fb4e0ff521061f', 'My Project', '2016-09-01', 'a3a3433929564653959934793d113288', '1', '4', '4', '1', '8', '8', '100', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('7ce97f8fb802439ca79823e742cc5063', '项目2', '2016-09-01', 'ba682e57ddcb49e1886e47ffb17774af', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('990f0f5f533f4070a84125f4fc57b200', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('977271c585234c3f8844f67cc226d1f4', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('447371b0ade048c0a168a247326906de', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('37a02e73db6c450689c60de09ce25559', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b89df8eaabad4e6bbe86143a583f1217', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b2a09eb816ae4d47890e0007615e67de', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('f0228d263b9d4764ba2aa53f25aa9e38', '项目2', '2016-09-02', 'ba682e57ddcb49e1886e47ffb17774af', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('15bd07da86ab4abba4c2708299fed9dc', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4a89317bcf0548578b86d15571555a0a', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('61ce81aeb9c84349bd896d68bbb0ccf4', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c789601fdfef43778142429bdd6fac9a', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('acf21b0c1e3442968eb535093a9b2b09', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('0c4402a5bf344092aca756e0ebe5df1f', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('ece9c4914d22428ca449c82df808b8bc', '项目2', '2016-09-03', 'ba682e57ddcb49e1886e47ffb17774af', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c4b5baca6b20495194321cc4cdd2395d', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ecd5d85dbb7d4de190234a502bc1eb04', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('80506c4690e144c1a1a68b7f0d855c73', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('59b0786c60394a939ddff5096a807010', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('e53c1f3b226046d1bb14e27fd06d0135', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('5c52f0c4da864b61825e082a4d4e0a8d', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ee0b672a97054c79a1dc3516fda715d0', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('9e320343b2084de7b1ab7612d78f7764', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('5849a141180d4d8fbc9cef177b2f8a21', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1d93a5e575e84df786e1ecb539749ac4', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('5fb709fff8004606b4ac20eca6e62f0c', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('bf4d803d7cc441e69f9440fbc10fb553', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b09929be5b00466c8d21d7926feb90c7', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b5756ed662c9489aa5fc6d2448750fff', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('e36f4837ab60428db6d25e66a84e9fa8', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('8dd36d105ef7460eb8fd955f96580c13', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('64d2f00c347a4fc9acdde0fd9fb0c652', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d60bf807318249dc9a89aa5baeca6abf', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('844fededeaf44b74b76791f3641f6691', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f3848abf30744884933447f29852b6d7', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('a1cf1433a0ed467bb52b2ad8693cfbc2', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('c8b0cc47b29b4f09bd16b3661fabd369', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('bb5eabcbd5564feebefa0d09107e4c70', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('45b09266dda44f10ab5ca024f8dfd560', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('0eeee160b4db4b079da22302988783e4', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('feb5eb3c40c54d39b260139c66ea4f78', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4c8b4862e67f485f8b58b43e1f1caf09', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('84bec362e6974e88a1017d877f90f469', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('c055b83e7e7b44b08883c27e93d02099', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4e0bb4ee08df4d939dccc1fd2906c004', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('867e34100f3840d791b42d97dd1b0e14', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('986c47860aa94e11a29c9d128b2c51ba', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ef180eaf7e9f4fcfaf675b35cf92f46b', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('dae71206d72e4cf4892a84c61fc1781f', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('593dcc08fc2d4a05ac7eed1ed7eb3b90', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('ac1beb144c5f4a398be26dde5725df4b', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('19d9edc152b04f3ab503b3712003d818', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b0edc0c611a447049f1f124263bcdb47', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2b6f7ab6b3ec48eba13ddce4fe3a8a44', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('6afb3107f8694b5d871565abb92d1109', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('31662618e07d47aebd72d2265a30aace', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d5938768daab4a219925153f7f19ab2e', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('4a694c478eea49d981d260d06cd280e7', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ba260cad801e4fa286373ee71d979bf1', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b51ef6225af84878ba1cd85140f8e447', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('9e2aadfe8e5e41929dec9acaaddd292d', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f8312a16dfea42a68b014281eef8bac0', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ba32c861137a45ed95dfc07a1c140cec', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('49c1fccfb3784984930f78f302e5b39f', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('1f4f45d5134f4776b93a8ec1b4f1eede', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('90286e1720294df8b0aac4a1f6fe7079', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('731f6f56771f4ef9aed3fd193ac5909e', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f5134eab083d483cb1a8595b49be4cf3', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('271ef8cc0b93496a8db8fb2ff106c9ff', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('5605aa0b4ebe4a0a847592fa03f3694a', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('bd204723a525428a835928c385f03f77', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('6f312c0665a54fcdacb6e01d12adf75a', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d1e1d75e295f45f5ab460fa18df418e8', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('af0ad641fc1a4740afbe73be8af9bf36', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('035de270bf31458fa572806cee73df3b', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('0cf07e13ddb94d49b622ef48665fc39c', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('9785fbba7b9e4ac099ab2f54bca4a1fb', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('9c905e3a52704b5a924e0c0ce5537b0f', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('58983544d4314e6388fdeb59f28de0ed', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('56763d05fc4a4b34a0fb0040e616597a', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('fbb2cf355b2b48ec9ec1ceeb91f938f8', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('77c91fdd67554484b2dd37ad09b828bf', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d333dee4872f411cac783c4a01eac441', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('e2e1e63450634ea4864488f2817639b4', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('76dfb02254ed4ecb9efec21a4ed190ef', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('ae951cd2ad6144f5a2639c73e2bc918b', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3f5f6ebbfb4442bdb97b9c5e77361fd3', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f464c2355d1042238e3de3a03f2d7488', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3b2d4b8c72584dbbbfb132b5a47a5b47', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2cf65ec2ca084ed384b2fa69669baae1', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('5a28c8f413684bb2a9a57beef6b9d70b', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('cdc8b1c2d19440fa9bf95b88ae862b99', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('79b3c43125d74560a9cab716c2315df1', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4fc4a871901043e48d415a32fa38ca8d', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('a39b564ee3c341b3b24151e8cdaa0beb', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ae81915586274d859e7a83ad6d3bbf5f', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('7c4fd88f9fa945b087f5b4b7b54c85a3', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('88500de5025e4d999608c744b7fabd32', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2c0832a3296843b0a971cdc4e26561c3', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('9d5398cbf8da4577aa8c1ca7d6e25d09', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('a6a2cc3e89b64ffdba236ca7da428740', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('13ca85c074b944689934ba5333eb1d8e', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d746249d9e6b492fb334363c294c5d52', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ab12c35f22b84aca9bc0b4a095413eaa', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('e2c974971c854f6bb1ee51e48b19f247', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f6bd85a328ce47e2a20d5eb934896a8a', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('98dfcc590f964a52aae86c456839ef7d', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d6c7ce6d44814b219e003da39ffc970a', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c29dd48cc366467e8ced299c101075c1', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('122d63a6498c4c0a87f851d6eb9c27a0', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('18cc64e2576e4cc7816771a77d261e99', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b634dbf000204cad876cb6fc4df9607e', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('45a8e72d4c9e493992b9882e6b0d8f60', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('ff35768c9dd442eab15260ce5f6f1afe', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('095a7e6889864996beab7d50dd4889ce', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('05f636e1213e44da9add5b92452fdac4', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('48ba564c6ea2460ebbb5ed8d455c7d23', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('85171b049dcc4220b23a6de33f4db9e1', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('7be3315d526d4b8d916ec009c787ed70', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('75779153b2f24b2799c811b4c965dcc6', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('cc09b1c9bfeb4d369ed7177f50aab5bc', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('601406f4f4d64e04ac471fac9ee5f19a', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('5eaf122f1339497684a7d69fc7f5d3c2', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2a52bea7dbb246df91551bf0828ecdd4', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f5adb19e8e034a6d842f58c5d3542615', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('dd384ddf19594b7ab61d6a85a1ebd0c0', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1f4cf77d22e1464ea36017206177c3f2', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('d8c69468caf34ffcbec021059049650d', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d919451d2e4346ecae1db331b8f50ee2', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('15257490e3a2406fa3057a8faa4a3fd7', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('dda4e12910454c5783bb6cb911609e78', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b05a1cfa010b45488efebfb41f4d3812', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('eb28509b3fda4a94a0327bbe104bfa99', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('48b618b23e1e47b8a314b948d69f941d', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('12d4a68418cc4c7cbbbde779d16228eb', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('9b34e096d52145d1bef3a21cae8d3e91', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ac489776af66403ea25de232a3500da4', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('23fb2c80dd53449882eee02025c35891', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('90e6b4e214a345aba39bcd708b99f598', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('046dc7f0fb374d52925ba3f018c96b7f', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('29e26b45d5b745c98665da5863ec28e3', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('c85922df33da4a13a4b6c0e181a6c0be', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1cc3fac28746468099909d94268e06cb', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2bd7e98e643e49368fe0dd47466bf8aa', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('02402b84a22847c79c35fddf205798e6', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('a1491771f6fb40f3b4850c306cba567b', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('22c3ff03839849ffbb2bfc0d2c086536', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('6754b15b79514dd59ddd56908d0e8dfd', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('8c36abf89573462a840774f60dd6319d', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('17d2fe1d4c564fec9f8e8e78273530d2', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2401c51e18854b29921a8a4570a33411', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c2c1c2743d854eaead4d3c5def0066e6', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c9492e2e2b2c495ba9c5a2e389156f4a', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f2e22585aae1424a9a4b920db8feeea1', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('cd1bd5ac3f71438790d92af5dab1832a', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('f86011eabc964f62a4235ee79af720ac', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3f880048f2214011ba74bfc7d7279f81', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c52170c65dca4c35a08563f6961dd213', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('de407e8c6bbe486984fc45b70919bb5f', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('fc755a91780541d0baf1c4e0f63c3f60', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('aa2f67fb03a04b81bc72ffc33b48563c', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('40ca7e12403c47c2b904ae9400c03647', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('e025688842fd48938f5252f781be382f', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ea46c06868e341f89360c16337cdc9ad', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1d1e14b2fec9441c8c34f0d13ef5e873', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('9d0f68de4e924aa08990989912f4a4ab', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ba2738272f20402eb17960b5da4ce5f6', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('fabcd15a5a934b7dac2393199e3b6ad0', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('efde912b6e0948fd800cad434768d516', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('c687dc6d4ef148ecbbc2b6bce3ef9ff8', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('445449744d064b6d8301c8e031d1b219', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('0824d6f5eed249f6a2df9a549a81f96a', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('6d4638afe2744b11acad7c8a070ee834', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('8b4ed36618464b768068f9bf679a801d', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('901ad5e913914b7989bf1c14c19a4e80', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f26877759b2942369dc7a34d7ed4b738', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('a28d7db0bd054892b9dca395d8d7f90c', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4c7f49a382ef4912aea047a032f41975', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('98550f6717854f89af3609ff455dcea4', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('55132f1aac664c6a9325bb2f43c5311d', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b28c26128de249b28cae7fd2687fbc08', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('fa4ecc2a3baa400fb13fc71a31bcbb5c', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f51c5e4683da49bfb8abc5a2228c28b5', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('28fcf2042d274f76991e01fd18ab688f', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('a3c335449f7943569f6f44e611d7c074', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('727bacab0b4b4fbcafdbdf54800c7c1b', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('8b3cdac02596492eb5abee4be7492171', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('0a0f24d9d2424b00aeead91d975b69f8', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('a454c09d880249d59e5e72be4e08dd22', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f22d9160002d4bd9a375c33b6d9e4d1d', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('a6071e0f3f3646569516aa372a067227', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('8209a94d586140f9b373c026e3bdac58', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('14723bfe368f48269cf0912a4b8c8f04', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('83dceb3f61c6460c957766602467c75d', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('605e0c4fd2f84fab88e9f1eef5c610bd', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4fca30acc7744ea2ac61fe121b82c5cf', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('875034f835034b21b2b06154cf87e060', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('1a9936b138714a2b92fae6202819e2cf', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f3786a8c7e964cfba854cd95abbb70c1', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('cb8c724f35dd4b8dad06e76ddd53ea1b', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('71afe14afee841f19be050c8515de444', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('a9de88e91d37428ba59d7f01e2370744', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('edb66c47226d43d6b4cae8724accf6f9', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3f15f46ac95741b4aea58f7de6e09684', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('2539f7e2d27f4018956725625c9a1260', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('75ba1f0a3d8f493782facfaacd23263c', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('60e6bd1f78bc4c60a7f2b1fd30bae12b', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('e0fde1a5a3fc47e2ac9b640ab7dbf029', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b3e0e1c6700c4297b8115654fde52f30', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('8077d2ad5d964f60bd41c41949e8b467', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('54cb0860c87442f6a955b6c9a01f1e34', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('cb3d6bc4ea5b45ff8868716baa3db89a', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('26257d688b7c4c969dd03255217ed247', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d799b7db30b7463090d52463fe8c7011', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('8450347fd28c4c2ea1c397017f567ecf', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('a4b2a08381f140ecbbceeaccadb46df2', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('dd98ea7167614037878e9af4bf0ff0d1', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('e30f43f27c824291b31bd847fd43a0d8', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2f5b90bbd1c94a4a9f8d4387aa8be61f', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('7255187d51d4427bb85483279128eb54', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('bc62c6c5c2c9407e8d6cd96e5e83d3b9', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('a898f572e4f54c54b2b0dc863c126ca0', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('a77c4b6250a040a69d22982b5c6b0b76', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('85b5441465f5448bb9d746d2f84fd474', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c6ca8bd87b3649e59dbd9d0e861afae1', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('e2da07c79f2f4ba3b0453a231b90b40c', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('9f9731651b0a4a3ea61beba1e97a64fa', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1407733982d94b5b85585c8978317ce4', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('96aa2722df0b436d8e697be5399b2fbe', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4e8a913fd58b46eebc315c41f35064b6', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ae96d7ba27d94b52b5573ad3a0055c81', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('6be1d5c43f1a4303adcde68f2fdbb006', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('ab235d4cf00f498e97dccbba7c27eaa9', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('8abd30550ec343769bffc6812476692e', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f17e404496bf400ea53e4b923bfaf877', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1223874ee858430eb6363a470d15ee1e', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('32bc09bcc1c64caeb43438b5ee8cb76c', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c819c674f21647c9ae2ad06f10451496', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('78d102a420c8417dabee78a0e77cf104', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('a7541df3473a46f2936cc63f15d749a9', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('18fdbefc6b1b4086a92b52e19fbde537', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2fec28798bff4b0fb0bbdb4401a58c2d', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3534c935c8db42d5bcb9d1046b376950', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('46ffd0156aec4a2482c36db11b4fc77e', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2c51e951edd04e49a596617567336427', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c9e466bc437a45bea35e7ea360b00b44', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('f094afb2f4ab47a189c5b61ff164d9d0', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('6f3dcfd63d364142958aaa3a9a2ba787', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('26c488150b5f466996ff5349851f9e3c', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('22c31b413beb433fb8d078da0ebb95a7', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c2bfd0bbd80340bca50a08aab86de823', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3beb8999b4524880b82a1b60b4a2485f', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('6522a62c086840568362e25cbfe75251', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('d7797497f2ac4cfb95a6cd6ca4365be2', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4a8c7479d3aa4bbc98ff4a0adea5f4fe', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('936308f6b36d48bab7fbea520f6ff94d', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('591df97025e44be480ae2d4cfddc59a9', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4c7cbff079e64b56b3661fb92a126e3c', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('310466b492f04647816d33d2028c0ad1', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('0513d2339f2e4445970df2ecd7b9fcd9', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('d2347747defc4328ac83d040db080c03', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ccfc2f013ce042a4a3a2eb20313f2fd5', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('cf4e653d387a4250962975b807ac838d', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('93acba249c8c48078c7fc4409c63c63d', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('7239167ea96149aa807a64da015b3303', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b72b48f5573246eebf43dd5997faef00', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('dd03bba0f4704a55a1af509ad4c1da51', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('8febc57384af4174ad34012901a61c36', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('81c32229f71e4304aa7e32eb8706b0cc', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('324c0f10fcb645948a5175cd6912dfb8', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c2a5ebda2d814b38892d71703f4707d4', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('bd901ac508be4a988c515676685ca36b', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b16040fd9b6d4a79a3f93f3ddf8123f6', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d5f49c5bbaf1407f8f0ea1a145bb7088', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('80a3624f061b413b8c5dd5fde7885272', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('52d15160c3df4699a3022bd0cad4ecf5', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d30f1e34b58549aeb528952e26aa0797', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b762e76ada7d4bf5848608c15029dac2', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2f5ce6e78f024d8da06363d4bd9aea2f', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d1e40017c55b4c27941f15f18a445568', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('aeb748307c9b492c85ee259619cdd4ac', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('c64196dfad084251b88f89556e293c71', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f8818e4233604e58859f750c981c8353', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4376a485524d4fbdb83ebd0160efee18', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('0cb672201a704cf99adc1117ff8de35b', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('74f3592f82f741d6bce2511b4da6a822', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('776d4b4ba6ac4e6eb574007fe100d07a', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('e662758045e749d381b2862331ad1930', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('300d098a31e442268d1857f141786e44', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('24c76ce6310c4cb68ced5ca1cbd58213', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('07a6430c4b4d47d396da1d00abfa7596', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b724ba9a80d949df906d4b8e73513630', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b30d581cb0f24e209b03f214de4e1c9c', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b1bc552250704585af481d889b639661', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('39604b57b5a348ac892285e98cabfc46', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('9950e430f64446128d48ca213c0b79c0', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('64a20045ca054c8180641be850dac464', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('9a5d51b2329b4950ab58392d3c247625', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2c6cf631e5144ae0b10ccae9030e3065', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('7dc69bd1e55b4a0788feb5900801c561', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('bf93dbb6e679428abffdcb638aa6adbc', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ec115153fb584adea9a40bc73127d84f', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('89dd1653b4474827baf9f76398de4f68', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1a19b49e7f0c4ab18cb3438ce573d6be', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('60ca3cc946e8402492617abf368e44f4', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ff26fd904bfc4f1da868c6e5e6a4d89d', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('06c54d69faa14ddf8281d06a4fad604b', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b32ac2a3e37c49c19bd8f76ac00447b0', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4d8ffb6cf84d4f4eb6dd1b24e0b79634', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('d59e23a4997349f6a0d8069ee90abfce', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b8899d98b9e54421a0426fcc07fb2ee5', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2a1246dd9cd049f382c86134f20e0444', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('5cc47d6e30e4414aad15feb0d459ad26', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('751bce83e63b4e019ce58799a7ef1db1', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1867b1eb98594cf6a117385b2d1e74a0', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('8c25c98d54ae4749907f17f7645ba97b', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('9ce45078724f4d9ba78776a9479e98ec', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2a28f8005cda4ca28ac17913bf500d74', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('5e4796dd814d449a953ef1aa038b1282', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c355145954324eb4b855ca35864e2d8a', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('dcd812c8d3af4da9b5498343323772d9', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b143c87b7f974e70ad91da2a94869425', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c8198c9e325d49a780a5692ee990a43c', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('48f2160ffa3e47bd9cb3d0a645e7b0e9', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('8c0cef2b463543e9981f58f56dae6f94', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('de19a3a0490e4d07b635b9f20291d0fa', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d7a51fe618d84a6ab8bef2896c391f52', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ecb489c75e3a4e048bc561d307e9ecdf', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('aba981c83e1e497688b3dcdbbb1594d4', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('21145ed9a03f4ccb85d4c31e2848b794', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('c5da2d85f3f1439999de1cbe6a5c6070', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('202f257abd704ee3bba30ed379692f5d', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c14ee2a41cef47c98b5a92893abcdc5f', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('320ff60f26ec4386b63a2a575be626a9', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4cf18510ed2e4d618230a5ec95afac99', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('71eac003b1d9401d812a1fcde401b44d', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('de01db86d5714042bf947fa042aa0eeb', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('eac7e7e3cf3b4a84a431e12a85ddce35', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('e23db98d2ffe44a2a5e335192d7953dd', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3f718bbd9d614c02a4099489911684e8', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('71e9d5261f3247ab906fb2caa3070fc7', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('8b73d34651b6435491f3ed2fa5f0a79e', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2a3e8d4356f54fc182673e2a0ab2a660', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('35a0ee21a55d4874bf383fe3bbe001cb', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('f29029a411d64194b234c0536da90736', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('25feebe4277f47dd996ea3037539b5ed', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('75701428cc6c4d90983201d9d34aaf94', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('a85f172e09e5422086e0655efc0b4dd9', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('e57bb4cea7924ad1ba20d427eae3995e', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('92d1b8ee7bc3460eb1d1e53a4b61e68c', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('80449bc0a9cb441da2636fcac749ba6c', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('2874c1bb0f9144488489eb4c7c3fb4d4', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f7ab081d41a044fead7545ab89b7f587', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('39f5be00712a47ec9bcc89c8f0c5db4c', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1b786e8b71124045a38430696ea76f5d', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('25aed9040a8947d2a37959d75ec651f8', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('26412bca658b4d8b9e15f344f95f6030', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d736a0ca1b4b440cb01fbbe858da59fe', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('b649cdafa2014cfca3918c35601e9641', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('31ef3a552d15480680560bcaae2d9c5b', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d9e22184b93a430f92dd0fdd0834e344', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('59145a61842d440a942ccc0ad47b9f68', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('aac1037446824ac99739fe5fbf6d5eb1', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('e1d03985ca574168a9a0e161db13a5eb', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('bd75e5a5cf8c40ec87d64afa875cc870', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('11e4e503c97b4ab58c0d1c5b350c0f6f', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('5f4063ecc0da4e7f8302311868056202', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('deffdd866a004bf58cf46c58d2620c2c', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('12a27e7155ef42b484375ba2494c5d27', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('cd06640d46c940acb7227b175c4ff163', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d6ad9ef6a1a04eaea9057c31a2293407', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('a2bf2986051f4e12b8fedf3d77b99f00', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('aa6dbf91dc6c4ec8815740b8b3e98cdd', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('762ce5d6a73749ea835b4793e10c126e', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('e97324d32200401dbf31dd2ad81e5f29', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('66a5c0d6e65c4fc8a0b5429e4d0b227c', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f71ced46ae43403cb3ff7bca86057fa2', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('8e93cbd8320b4854adaf8f65520d3a5f', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('9210c90dd35a49378cdd19e171a2cde5', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('9b3736c0873248b9ac81aa186975bf97', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('218089c1c44b404e848124d7e0b14202', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1274c31e75564d819909c6dbdb47f24c', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4151371d0b9543178db88e026c0815da', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('43dfdd5634a9491180ac17eccf4d4762', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('c30415434ed2467799a68a1069ca628e', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b096f5a5eb904a7da78278db7e551d5e', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3514163d608e4901a76a296122399f5f', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f7c0c8900f6f460bbf279bf798fb8ee7', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3d52687f70294f0a80a70077aa3596a1', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('a3cf4d3d361a4aa7aa12e12ff8e2e444', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('a82c67909d0e430f99d8dd06de36ec46', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('90dc3a5dd7f64a58b0b331e3af62546e', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('9d5feb807aec4a91900858ea0dad88f3', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('288051c824ba4ffcb83872309c4d6496', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d7bb06fcab2e4f438f71c2677f486447', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('05b00752b6094a478b8e4d374e725636', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('6e970a250b4d4cdeb03c496c482017d7', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('8dea683db8c1473188588d7cb368e2e6', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('49ce4ac96101439b83a1d6fe366d15a1', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3fef563d32494befa1d29accbad063b2', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('117b99c2ca8f45f589fad30d3431efd8', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('30fa699500a14ffd9a84243cb64b8175', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('c782af1b48394000b84617959cb8871e', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1d20193f553c48518801278253576e4c', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('a35004c14c8d4c748939f6f16b4bace3', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('0d4c19a99ac947a4af0a9750fe0ab670', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('214a6757d8f6492dbad62161ef0f5140', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('8959cb5894f748e59a3a0a01c1bc9edc', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('60dba13d7a184a329106a9bb3b9af6c7', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('0a8c959e37df46d69f07811a7ee3317e', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c9118db337f245b292c0136ce56934a0', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('a6050e7359ea4154973377967bc2d14d', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d54008e0968341f684be2e1e8da2bbff', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('74cc32e735244efdb484fd75ee0f1b46', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('88417ca8c001481d8cbedaf5bd7d3c84', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2d3eb121cde44403bf0755b98228816c', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('fb7461f3d7024f0d8dc2c9cf8a2a66ee', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2b94d590fdf04f80986190fbadf74e6a', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('5062a40e25d84db4bff3c6f979e51098', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ed7febeb98e44cfdaf7581c1df091f1f', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('5f16b35b23e64146b52933e5c25f06cf', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('27cc534805294140b4d0c7e9e2035105', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2eea02b4b9fb435eb92a0056028b5b98', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('a591af1db9d0486aace58f03dd3e5358', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f66f1c4710e545df8dd17c78dc26689b', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('31f890e92966482c892da19e63539a31', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('80b12b3e4c11443f8295339e3bbbddd5', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3810dc62492a4a0dbcc589ed9e275279', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('865abf071f694dd8b54924eb93680364', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('1bb1bb799b3c4084ae6ce41330138d91', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4357f08013804b2891b3d4f914de60cd', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3fcaeb22790442038438dfb70d694f9e', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('94c5540d20c645758204a03d23393b0c', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('14b85a44ba3041098ab08a78e8186c97', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('743411aabf5542eab098a9913e05a7d9', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('b760a7dc277140bf97c37f2374e99e3d', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2f60f8861a314ec98b1ed34060f92d88', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f648b696e0934ecaba2edbf2cfece638', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('9d7f6f20aca84c679f649ed3a6242ad0', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('30b573d495204807a4f9173798a9ef02', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('a89eda8d792c4c53aae62529b57e6251', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('02e349d6455e490ea0780c4f8f77780d', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('8b4019376dad423ba34c223be82c67ad', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('67d2807a8c074039b9a93e7c4bcfaa3d', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('272647001ac54fd1a840cc88f98ba3c3', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b0d532a104b742e5a3eae02a224756b5', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('9ac26478e50b41e8b2983ccfd0af5bf5', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('430ed8a5e13b45038b405aa07238fce1', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3debf333df594bfbaa641982a0d57055', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('42a6912b30704083bfd2c6f328e5b15c', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d003fb85e7864d6bac33ffc56dd47977', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f793785e6b7f4e69881a7affd64aebac', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2165c9cc10cb43a7a3d91fba55a06976', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('15cc0519e6444d76a7e7c271098ae694', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('72444a7e95e84574a9fc593eefc3fde1', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('72fcfec8a2054aed8ea923fe3781e044', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('c3e39456c6424eb6b7f398e556ff4fd9', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('8c200c96e2eb4802bbd297554a14239d', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('93d6d515bc48435189b5d43f4e2f63a7', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4f2a56eed8ea474e86f5e14c36e2a95f', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('6b9c7e0627944b6f9faf3a1564b7bd4e', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('15cfd151e1084605bc462c5ba69112b6', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('e4a31532ff7746f49eaa34448fd25c23', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('e8e5c40b1ec444b89d281cc958a2d821', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ccb4e067c73c47338793a12b4d53ee24', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4ca55edf2d47472d848dd6c7ed3b5261', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('44300cc34c9740d0928e8187b66db1e1', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('fd73b2d0ce1d424cb65339c71199856c', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('05d78df7da4a423c8dcf350060afb7af', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('20a8efc71f074171bfa159cedb564ea4', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('f08b7062e1ea4c0ab4599c9cd5007cfc', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('41342fe06c3e4783ac7952195b15ec3a', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3ca239cc0a9a40879505691823330c74', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4562b0aa69c64320a22c398246675771', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('eb72f00ae84a4145913f312ea830f0bf', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('e7d95de4776d49a68fcb09f77369eece', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('59cd34803c2e478bb6e54d1bcc589420', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('d9f21d7463174728ad46a1247039fb6b', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('da1722efef174b67a14efaaef00d7e98', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ef30569d53124dca9b830fb39920381d', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('7e082eaaf2b24523a939253c9c1711cb', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2011e2a745474e95bb6e54e572ee81d9', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1a617cb11a504badb5d396a31a4cc025', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('55ddc561a2554c2282c704b979d9d3bf', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('25865c80eb3d45d4a313d06a9ca5e9d8', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1ac30be8a063437290a4942d7992481a', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('54ea4b49d3664c71904905eea0a02025', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d48d8881a28f491584738416aa609d20', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b0b3860a13004d1a98884ef9092284a9', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('aab1f0837cec4cedb54ff5606573c114', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('fcc5b4db49ca451aadc8ad83e42acd34', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('e8cd99690f9043f2a0001f2822fd1d44', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('bad505ff4b0a40f084b6358d6cffcbf4', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c49b8b0ff03d464e8501950ea1bd9695', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3ab7708565774ca9befbd5923efb2ae0', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f40455955e9049e899f721bef47f29f8', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d21c4573b0034cd6803bf0b00652ffb4', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c8ddedf642244d6fbb2dd9328b50a39c', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('87bbe7be8f964cb582e0d9af6555c8a4', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('15a77df33d714ecd8e05622f58e97765', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('0141d2e4937e471dab99770e1e5f00bf', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f37e8371b0f6475ab7e829967783639a', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('53e13d50dd584a07b8d0791942ad28ad', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3d3378bbf28f48ae9ebbb28e4f04c011', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('32d14772ee534803be437b127dd95f15', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('389231d68bd24efcaffdd2247bed45e8', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('fc2104f8696443de8453868cb8d5f643', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('5736256a65c043269fb9177c86d456f8', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('7782df12b09b45d18f5203649311fa87', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('642191353ece4da4902087e5246f67d7', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('193644c0b6954add91e34bdd1cea57a4', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d5eddc39971f41cbbea590de91f9cef2', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('422bb3aa641a4f999d1c465b5ccbc9d0', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('5383d5c3079a4c998534af92038cad63', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b06ba52a259740ed8127c44edb606b34', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4dedce21b3384ba29b04dd6e9383946a', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('dc188d22ea4946d89387aa5ab12de097', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d361c119a7a94536996f20b5ff49af47', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('6bdc20dfcf4f4db4b48f5fec19e165cb', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('3eea2e3251be4695a97cf26a969f5a02', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('460bb07d64f345f28cee404776a4d82e', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('62c207ef2d6140a5b51d8dbe4c7f35b2', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('19f42aecd1494e7699772d18f9dfdd17', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4e005ee536e047d393ec0ff194f4864f', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('e80f53ec313a4848be8d6c1d942f582f', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1cff76ad686b462490ee8ff96346c546', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('85cbd97313214feea57850a451db2cde', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('16e5e5f68fcd47819dad743b35b9623e', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b69d02bc5a7441609501dd48f20801ef', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('6d04409061fd4b7c8e9f97176234e26e', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('377db567a92a41ac853519f8b64b4f95', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('6225db6c9d6c4b4c85faed1f06c49954', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1c8d7f9cb7c044d29de8a88ed20a5085', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('6d15073968f04a6bb5f5e96af0894b26', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('9493979654ea4007aafa63b6894dfb56', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('766bd51c258a4636b902d6dea44d812a', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('936bb6ecaf56424fa05a1044b221ac89', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b85a0a5c4a1c4951a49684588a57e4ec', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('cbfab23104254da0b9e0866bc648f11c', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2df44dc3e9614dcc85e35a92531bbb86', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('583c7d33a1b943c5a1988c1f706534d1', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('7643e317c55644d687c4927cfe5ad05c', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('73d3eda120d0479fa1ffeb09ad4750ec', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('489e8306b26843e98dce7492d3c1ecf8', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4e22f49e2ee44f0aaed2b6fdbdc3f8d5', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3e8e1c059e1e433c94141309f387e6d2', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('81c3f2f0bd734cf188258a03f2ba2df7', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('09d1f9fda81c43ff9d6a34acc4b48ea2', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('28e1398fa03042b29db55e078d06e474', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('86e6334a2e874b7caa226b2bef795552', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3a45306b15434578902743f9b646726f', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('63d2c63c94d8403fbde4a050a85f8748', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2e7f7f08103e4b129eea79770311c6b1', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('45413cedc3df4f779625f994c1c1e6dc', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('42d7660b26414144a945b78dd4f31b04', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1ed99997aca8424b86d0c7d487b24c49', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('e21f6d424bcd497c9bb26aeabcf6a7bf', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('711132175d7f44329459d9461f8ffa44', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c356dbce48af465fa495c7519f75b41c', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ddf011e11fd34c98a82732de7123d30b', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('5804baa143164633baf85f7c9c6f82c5', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('e9ee4c31729a40f78e1e2f5cc46b3d02', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b72c3f60a72d433392341fd982b435c2', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1efdc4225aa546c190f59778aab7c731', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('e0eb36519c8640afa34728e5b8dc6700', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('82ca56b0198c405d8d17e847582d9124', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('5f7d850de35345b8949e13c16ae9cd93', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('8abcebdbc6b5498389457a8f545db74e', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('99acb8b45c2945f58119e50e0a853b5d', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('8d506966bde445e6bf8d6572e1e5cd30', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4de0ffabf2a2471d9712503aa3a24aae', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('e65f09ed21bd4e68a0b1ce36d9ffe119', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('90a6a84343fd4a729f655db92719f1ed', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c90754e5ce11495e975973669b83deeb', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('7501eea7993d4e0c80b104557371fc3b', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('92c3f41b736f457fa70cc961e0153924', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3397b60e96b74238ab412371ffa96a11', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b8bd7c109e4345338149363eb2df4cd4', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('bb66188abeeb4ee4a98eb9a95569f632', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('48da286a157144b28acf56ca141c21f4', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('7423ab2adb634b8094db7752f9d03863', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('7b38d4919308444f80d6478ff969caf4', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('6987ad458685457897a0656317b19ad1', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('7ada7b6bca054d27b7c5c05032889700', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('806fbb22f82d4796ad650b10be22c9f0', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('e15cfca8e94644989984705120715454', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1680e420aa514fb0b9c10abc235b3bee', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2d09426110e44ff5830341b59926938b', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('13d6edb248bb4455bd3deee231785233', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1d6bd6bb44a54ce6b50aca59bf4b5dc9', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('da8f8bdfc77d4398b0ba44ee84b81c4f', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('065e3c9e59df412b9d758d4da93bb1bd', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b034513dcb004d55ab42b4a22a6cdd9f', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('44a7e1ea191541f7a2fe39ab6b0412da', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('990076fa3e534370a7adcc859ad47d5e', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f81e320af03e44a19c0d49f4ab0f2f06', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('a17d97a112644bfdb6e5b36bf0012342', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ae428179be35486fb9b4bab574c1312a', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2025fec1952b45c1b105202c89a1fd6f', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('695b0ec626cc40c8becfa2a507660aa6', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('73e18e16dc7a4b48ad67ba40b25ac2fd', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c311f703374f405c87284c5567d3e330', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('10766039c46e4de2bb22787d59803b6b', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('2dba0341ae92484dbb7b15b6b93b190b', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3479440065a84f6e99f222d06eca848f', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('57bfa1771f5d4cfab814ca5f57eb37ab', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4b08faf160664543be267ffb8ac0f963', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('abae95bc7b2243e6a6b51dfa330da91d', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1f403f8e7b064cd48cdd2b2fa326363c', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('7ab97237e044426c9e7f0af392e3fef8', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('4763b731ee8a4e8e856f85650b7bf976', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('585aa576a9d142fb81f91686b8f79324', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ed0f703fa95a4407988e684012345d6c', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2ba29f6a83b04000b89c20cb88e0b186', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('e791dcf1191345a9926635d6dc78359d', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3142c646119c4cd7b4ebad8f10595e0f', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('57c03b472f614065abe823475351a6ef', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('af1d3605683342998ef915fd551ace01', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('5183e1a759484ce4b0752ae387f3be62', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('0613fb79383740769f26970921397f6d', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f61c5f5921a249e1a9812e68fe36773d', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ae9d99781da6463abf528158c0b45ce8', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('915ed3fde3b740dcb7ba944ec547dd82', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b2cd043a5fcb4c319ae5449999b394df', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('9f26429ce0ad45dcab5adcc89708ede0', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('6ad05ae76a1c46e9ba8b4a47f03d04a0', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('6b611791781a4707996d31ca892bf584', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('511ee9e683b3401fb01c76863e6ca63f', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('6138fbf20bb04d96ba5e65b063e0f67e', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('9677e0210da04e0a9afb7ccefa1cd416', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f857dfd94f204968a7937a8befa0a5a5', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('8fe09febc67a4c85b13db2440a55b61e', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4290e523d29745209a2f77da8638b143', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('96f619750dc7428f8fbb8bffa183f33b', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c0311819e2b045d4821390c7ba72d3fb', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('de1a5d0e09974bc4976edb80d5b1fc55', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('5c682e02e6bc4eb885a81bfdf15c1521', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d074fb65bd154cc2a5ee6c7555147b0d', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('f51a23bf224d4e9080ff4ed4fdb89a02', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d12527960dbe444c8c4266ffd28bc238', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('bfb01279d66d45318dfcdd6d541de0fa', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1d4ae583f9ac4662bb9d71cbb5296b7a', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ea92dccc91f14012a4dc18ce93428e3c', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('521e709480dc4ee88a3aef6a2bdf2f69', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d7d961efb65a41a89ca2f8d8377a9285', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('379f7f23ee1341029c816c771c4864f7', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('5221e4abaabf4fde9135b1021cef18a5', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2aae59711826442eb615ac1cc96a3a11', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('093236b3fb59455395d9fd128804bff5', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ec7dfa1c75be45caa9001b9f2c9eb9bb', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1e84b19f267649fb87b57af7f80a2e16', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('7be8040985f14daf903b033247828e80', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('c985218e12024eae804f39cf1e185ed1', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b080051fcf9c4f1baca89d0333ce1f94', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('7f3a35e047174373b4ee6e087fc5e8a6', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c3df2fbb4eea41e981ce4c0e8d58f805', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('82d1778863c54d22b99a4cb0398291c7', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('a0c74fc4541646c881d3e2691a2d330c', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('9d9bd0b980934d6db67bedfc296667cf', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('3006cd1428584051a7f52a66b70ba323', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f09fdc4367b2481eacb518f15b5b2023', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('738dfd9181aa421d910c8318ea6fdb07', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('6f97e77e7c844e6aaeb1c67ea63c2c93', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('a14ab2f1263a4776ae3e34c764d66202', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c98f2681d5f74920ba3eb53d5da1af26', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2ed0bd3d1f53479fa147bfe8c31e23d0', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('9274b6d892834533a95807a6d6468f7b', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c1c4a90bfdc241e79f15bc308df23af3', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('72b62344cc624a1c830ee1a961d458e9', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b4acae6acbe549949ed0888e2a81f097', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ad39381db47a4e67aab7e4f1ec6b0cf8', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('368fbc19f3da4e179cb015aef87f5028', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('933e4f2872cf47cfb999d7386f284132', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('dd842955a8144a0da5124ba0eda27d31', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('26c07cf7ae624efe8669530f26fb4fc4', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('28eadbfba8894d139834b79ea444c0b1', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('0df9dd49fe984b9b9c0ecbfb0bd84ec9', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('25521ee6e4f842569285dcc0c2306952', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('e51c7dc448a94765a2cf0ae0826f686f', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3dd2d4e77a1c4995bb463fa7b9cfdf0e', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('91103b0635e942ffa91c013a8baea03b', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('aacfebb18caf44918ceecb11e70a97c0', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('04898dc88ac849df9a6383d4202989b2', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('edd10647d93e47cbbf632bc815f01d87', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ac07f3dfbd1f448c98f5ff54218d112c', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('5e6dfc81cf6d467c83031f6e87cfc3d6', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4be2a9b1147644d8a983b7cffd48ece4', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('6a1f907559184ce084b9d2f2ef99e9cb', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4939fcb6841c4d24bfa1979c1a66d3cc', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('eb242ea79a0c4b5093582a251e9ec370', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c25af0b2de064d0c8d2b647412b7a899', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c0c556dda2ee4ef8ba44b5cc80069766', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('32002b3735a14a97987ebf913c67cb4e', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('663e884a53d4469183ab0229d5f43b8c', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('4b8b3781ce844e19a7c88edca95013dc', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2e5d30b2f8dd4e37893af757eede6a11', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('056a8681108445dea3ccc58575c27ba2', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('a63cb7c805d24f7cb3e669c672cf7f4b', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('7008a85c67eb464896c55ad3416c008b', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d26436fba6f64041b37b4dd01add07d9', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('9873cf96040f4814a5ff69f5380ebcf2', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('eb376b15cfb346b4aa5782e1e13bb952', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('a87721d2c3eb4a799300b895caae77eb', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3ec186c41c5141979cfbaa1fa3f0d7bb', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('6f2b766fa75e4f04a4fa04702d7b415b', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('6353ccdf787349f594e8e8e24c23c30f', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('6878138e5eee4421b33a34571dc8e838', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1152eebeca34495f996ced370a9c2179', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('c005b73f026d4620a518b0efd098e42c', 'vvv', '2016-09-01', 'b6a8c871e0694d48ae03e84f79a6c263', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('809bc611277246bf9a1fe5417c088847', '切切切', '2016-09-01', 'bb966a046be743a5a99f799fdd713019', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('46bbc4b1c566444c89d82fd06005a65f', '项目1', '2016-09-01', 'c2ec1cf90cc74bd4bcaf4c8b93ade7a4', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('439868b62c0e4087ab4bb937df3d42bf', 'wpTest', '2016-09-02', 'c93030c93674434bb086f13f6ec62cff', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4d4acf4ab22b43b385ab748efb000626', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('e76d510db19042fe94cdc759513ef96d', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3528a4008b394e4f84e60846c30ab4d4', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3489b75fe6764a038d66eaf55dc42b26', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4ef6193072854de88d39c9fe9404ce69', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('afbeefc20ee94c088fe59eaeb3acb257', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('101a853845cd440ab11d5ddd70090857', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('6c363121c93746889deab2b7a4ef04ce', 'vvv', '2016-09-02', 'b6a8c871e0694d48ae03e84f79a6c263', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('49741e8dc0254f47860e4a2d2a811f3f', '切切切', '2016-09-02', 'bb966a046be743a5a99f799fdd713019', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1cd3c9565cc44384a86b1bba9bdab2b8', '项目1', '2016-09-02', 'c2ec1cf90cc74bd4bcaf4c8b93ade7a4', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('0be9f12e3ed24845a6d09cbdf9b074da', 'wpTest', '2016-09-03', 'c93030c93674434bb086f13f6ec62cff', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f0d20dd8c9ed439ca31896d6e3f17fcc', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c48393f1bcfe4a9ab68c1e4f4863fa80', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('43fde1867c0a451193d57f9439be7dfc', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('af12c14b6a15448c8b21f6a247004b51', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f021ae0c4aba491080a6e3b431eaad97', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('7e35b122a0bf4297b4d511eb9eec9498', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4a7417ebdebd44328c5d8ec236e94c5d', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('65496b89824e45849b79aee140e437fb', 'vvv', '2016-09-03', 'b6a8c871e0694d48ae03e84f79a6c263', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('21eea83ccff44a8a896a5b4fabddaa66', '切切切', '2016-09-03', 'bb966a046be743a5a99f799fdd713019', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d094d0ff9d3148e99e15e1e6bda59de0', '项目1', '2016-09-03', 'c2ec1cf90cc74bd4bcaf4c8b93ade7a4', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1079e6a0e64447d09b4876700c4e42b9', 'wpTest', '2016-09-04', 'c93030c93674434bb086f13f6ec62cff', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('bf98f90d2b3142e4a20f725efd8be12b', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('30880942b78542cd935bbdae93060637', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('7326cd7165574c0ebaa2648d19e6c910', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('dfc2aeaeeeed49ac9f3508116c5de688', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('cad345f191c64afa95c56199c278b2a9', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('83b5db0a695944b98508cfb0ba9f91e2', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('62e371ffd2a9420387cb276b5a68de48', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('7f276a2ec0124af89b8dc15dc8235fc3', 'vvv', '2016-09-04', 'b6a8c871e0694d48ae03e84f79a6c263', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('cc44d5384f1e4973bb779c2faac5a75c', '项目2', '2016-09-04', 'ba682e57ddcb49e1886e47ffb17774af', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('76ded6798a3b4a54aab8be5deb01d082', '切切切', '2016-09-04', 'bb966a046be743a5a99f799fdd713019', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('385b17124fad4d47a765f7d89c130792', '项目1', '2016-09-04', 'c2ec1cf90cc74bd4bcaf4c8b93ade7a4', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('51104e31927e4899beca6a34a3dc9937', 'wpTest', '2016-09-05', 'c93030c93674434bb086f13f6ec62cff', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('0b8febe7741b437b86b9d600dbf4f876', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('136142e1bf7b4a289f72613694ee4ad1', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('cd77d7e635e841a09c7d0e4c8a42bc35', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('49b1e24a7c754a3ea85224ddb07b52ca', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ff7ead3401fd4ee8af72326f123a1b18', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('28962efb31fa4833bc6558c05162f0ee', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('8325f6143cc34b96a6c16fdf837cdc9a', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('8aa13097b35740ab9ead2b9f488826e3', 'vvv', '2016-09-05', 'b6a8c871e0694d48ae03e84f79a6c263', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('628eff0b99d54faca7bdd2bb9ab25737', '项目2', '2016-09-05', 'ba682e57ddcb49e1886e47ffb17774af', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ff255564819946259b017c9c243d8665', '切切切', '2016-09-05', 'bb966a046be743a5a99f799fdd713019', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1560b7dae0b54e1995f566c30bac9652', '项目1', '2016-09-05', 'c2ec1cf90cc74bd4bcaf4c8b93ade7a4', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('f88641d2852e4590ba494bcb70c1d36c', 'wpTest', '2016-09-06', 'c93030c93674434bb086f13f6ec62cff', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3fbe60ca662d4d299e2464a8103f6e3d', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1ce011c3b9c34b1bba6436ca6e63b8f9', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('fdff82850aaf4181bf86401d15ac3601', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ca61822028674e42bce7400d2411fceb', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1ee00068da4b4114918f3f3e12c9bfae', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('d8ab8c480671471890fb52a2e345e027', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('b1cdb0ffe8bf491285e081fce8219278', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('f48bb2fe379a472abf78d53a21edb30e', 'vvv', '2016-09-06', 'b6a8c871e0694d48ae03e84f79a6c263', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('3a1bfe9299d24477b959fb27fedd6abe', '项目2', '2016-09-06', 'ba682e57ddcb49e1886e47ffb17774af', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('1ec8b20a827144c989408fbc97841bf7', '切切切', '2016-09-06', 'bb966a046be743a5a99f799fdd713019', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('064691376c7640248fc5583f91002f3c', '项目1', '2016-09-06', 'c2ec1cf90cc74bd4bcaf4c8b93ade7a4', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('4b65e11ebfa54ceea1277a4e9fbc3df5', 'wpTest', '2016-09-07', 'c93030c93674434bb086f13f6ec62cff', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('832a7a503b6140bb914e06c14514350a', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('ea3372e8a887470d85604ebbb40e6ed1', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('70134a6ffce84e4da1ad95a4f28f41b9', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('9276f9d499024b62b73e608d8d4f7fa1', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('18aad555737842e7a38cec83df94b9b7', 'ddd', '2016-09-05', '83e37ba3f7a74d8a802a80d89746c65a', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('175704862ce24bbea3bc7bb7d0327002', 'efe', '2016-09-05', '950ab083eda1438a9cfb499fe3c91e99', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('cca5eb95d9b04ca8b27309cd72b486ad', 'My Project', '2016-09-05', 'a3a3433929564653959934793d113288', '4', '4', '4', '16', '8', '8', '400', '7', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_project` VALUES ('88569c2ecc654f218e9ed8a42aa56a6f', 'vvv', '2016-09-07', 'b6a8c871e0694d48ae03e84f79a6c263', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('9180043b0c5949879c04aaf8c8084e9f', '项目2', '2016-09-07', 'ba682e57ddcb49e1886e47ffb17774af', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('c31f456100f04bddb78d52d636a540e4', '切切切', '2016-09-07', 'bb966a046be743a5a99f799fdd713019', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('28506be586334b43a7a591ec74d3e6ce', '项目1', '2016-09-07', 'c2ec1cf90cc74bd4bcaf4c8b93ade7a4', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('8e4b10d890bc4a35b29773deb8d2c13e', 'hhh', '2016-09-05', '23e7338f18dc42528bd05977e4979468', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('11b76b0baee64726a8f416f6fc3f2de1', 'project', '2016-09-05', '2b5999395f904919a04956cd5dd3b0e8', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('2a37fec0b7b747f396da37d0d0dde5ab', 'new', '2016-09-05', '48c5448d3c3c4321b9eb332cfed5a9d3', '4', '0', '0', '16', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_project` VALUES ('166f5c56499e4849aec308a904643d28', 'aaa', '2016-09-05', '589937a466d64fc2a0c1b4677aca57e0', '4', '0', '0', '100', '0', '0', '400', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for history_report_source
-- ----------------------------
DROP TABLE IF EXISTS `history_report_source`;
CREATE TABLE `history_report_source` (
  `uuid` varchar(32) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `target_uuid` varchar(32) DEFAULT NULL,
  `cpu_all` varchar(45) DEFAULT NULL,
  `cpu_used` varchar(45) DEFAULT NULL,
  `cpu_run` varchar(45) DEFAULT NULL,
  `mem_all` varchar(45) DEFAULT NULL,
  `mem_used` varchar(45) DEFAULT NULL,
  `mem_run` varchar(45) DEFAULT NULL,
  `disk_all` varchar(45) DEFAULT NULL,
  `disk_used` varchar(45) DEFAULT NULL,
  `disk_run` varchar(45) DEFAULT NULL,
  `ip_all` varchar(45) DEFAULT NULL,
  `ip_used` varchar(45) DEFAULT NULL,
  `ip_run` varchar(45) DEFAULT NULL,
  `app_all` varchar(45) DEFAULT NULL,
  `app_used` varchar(45) DEFAULT NULL,
  `app_run` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history_report_source
-- ----------------------------
INSERT INTO `history_report_source` VALUES ('11a3fe04db804815a76f91f6e809bc7c', '需审批资源池', '2016-09-01', '0aeb3d649f1146ac90f83e5e452b4d1b', '4', '9.16', '0', '16', '10.06', '0', '384.5', '321.29', '0', '2', '2', '0', '2', '2', '0');
INSERT INTO `history_report_source` VALUES ('79716979f3354fe99e365ae83c86419f', '测试用资源池', '2016-09-01', '333b8b97a06b434097e089810a2601fe', '4', '4', '4', '16', '8', '8', '384.5', '7', '7', '2', '2', '1', '2', '2', '1');
INSERT INTO `history_report_source` VALUES ('2fe03ea7c3764d25a759719a11ed8eb0', '需审批资源池', '2016-09-02', '0aeb3d649f1146ac90f83e5e452b4d1b', '4', '9.16', '0', '16', '10.06', '0', '384.5', '321.29', '0', '2', '2', '0', '2', '2', '0');
INSERT INTO `history_report_source` VALUES ('837b39b5ad184170b74faac71c28e674', '测试用资源池', '2016-09-02', '333b8b97a06b434097e089810a2601fe', '4', '4', '4', '16', '8', '8', '384.5', '7', '7', '2', '2', '1', '2', '2', '1');
INSERT INTO `history_report_source` VALUES ('4cbdeda97a9945c7a055287b26235177', '需审批资源池', '2016-09-03', '0aeb3d649f1146ac90f83e5e452b4d1b', '4', '9.16', '0', '16', '10.06', '0', '384.5', '321.29', '0', '2', '2', '0', '2', '2', '0');
INSERT INTO `history_report_source` VALUES ('0ae7a5b9bbc44aa3a64d6a80bb64af34', '测试用资源池', '2016-09-03', '333b8b97a06b434097e089810a2601fe', '4', '4', '4', '16', '8', '8', '384.5', '7', '7', '2', '2', '1', '2', '2', '1');
INSERT INTO `history_report_source` VALUES ('cbbb438a55494fd8b26252ed0018f014', '需审批资源池', '2016-09-04', '0aeb3d649f1146ac90f83e5e452b4d1b', '4', '9.16', '0', '16', '10.06', '0', '384.5', '321.29', '0', '2', '2', '0', '2', '2', '0');
INSERT INTO `history_report_source` VALUES ('8158010f30a9428eb14b0ad7d778a463', '测试用资源池', '2016-09-04', '333b8b97a06b434097e089810a2601fe', '4', '4', '4', '16', '8', '8', '384.5', '7', '7', '2', '2', '1', '2', '2', '1');
INSERT INTO `history_report_source` VALUES ('19efa0239e8f4dfb811ed8e20fbb6bad', '需审批资源池', '2016-09-05', '0aeb3d649f1146ac90f83e5e452b4d1b', '4', '9.16', '0', '16', '10.06', '0', '384.5', '321.29', '0', '2', '2', '0', '2', '2', '0');
INSERT INTO `history_report_source` VALUES ('1c77f6defec94ea0a6c891607e2c2f34', '测试用资源池', '2016-09-05', '333b8b97a06b434097e089810a2601fe', '4', '4', '4', '16', '8', '8', '384.5', '7', '7', '2', '2', '1', '2', '2', '1');
INSERT INTO `history_report_source` VALUES ('94e152a174e24e7f8cd5405ae3ce95fe', '需审批资源池', '2016-09-06', '0aeb3d649f1146ac90f83e5e452b4d1b', '4', '9.16', '0', '16', '10.06', '0', '384.5', '321.29', '0', '2', '2', '0', '2', '2', '0');
INSERT INTO `history_report_source` VALUES ('f9fd2cc075994621b60d35867025fea2', '测试用资源池', '2016-09-06', '333b8b97a06b434097e089810a2601fe', '4', '4', '4', '16', '8', '8', '384.5', '7', '7', '2', '2', '1', '2', '2', '1');
INSERT INTO `history_report_source` VALUES ('8517896993884f05a77bf0a0192fcad6', '需审批资源池', '2016-09-07', '0aeb3d649f1146ac90f83e5e452b4d1b', '4', '9.16', '0', '16', '10.06', '0', '384.5', '321.29', '0', '2', '2', '0', '2', '2', '0');
INSERT INTO `history_report_source` VALUES ('87a8cb78869046d6aca6eeb1255e9116', '测试用资源池', '2016-08-07', '333b8b97a06b434097e089810a2601fe', '4', '4', '0', '16', '8', '0', '384.5', '7', '0', '2', '2', '1', '2', '2', '1');

-- ----------------------------
-- Table structure for history_report_user
-- ----------------------------
DROP TABLE IF EXISTS `history_report_user`;
CREATE TABLE `history_report_user` (
  `uuid` varchar(32) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `target_uuid` varchar(32) DEFAULT NULL,
  `cpu_all` varchar(45) DEFAULT NULL,
  `cpu_used` varchar(45) DEFAULT NULL,
  `cpu_run` varchar(45) DEFAULT NULL,
  `mem_all` varchar(45) DEFAULT NULL,
  `mem_used` varchar(45) DEFAULT NULL,
  `mem_run` varchar(45) DEFAULT NULL,
  `disk_all` varchar(45) DEFAULT NULL,
  `disk_used` varchar(45) DEFAULT NULL,
  `disk_run` varchar(45) DEFAULT NULL,
  `ip_all` varchar(45) DEFAULT NULL,
  `ip_used` varchar(45) DEFAULT NULL,
  `ip_run` varchar(45) DEFAULT NULL,
  `app_all` varchar(45) DEFAULT NULL,
  `app_used` varchar(45) DEFAULT NULL,
  `app_run` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history_report_user
-- ----------------------------
INSERT INTO `history_report_user` VALUES ('c3ab5dee19994087870702ad0a3c0a9a', 'hanyumeng', '2016-09-01', '090c6e01a3c54d768ce27fe143551f79', '4', '4.0', '4.0', '16', '8.0', '8.0', '400', '7.0', '7.0', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_user` VALUES ('0742d0d03b3e4aaf8ccb6fa7c0bdebff', 'hanyumeng', '2016-09-02', '090c6e01a3c54d768ce27fe143551f79', '4', '4.0', '4.0', '16', '8.0', '8.0', '400', '7.0', '7.0', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_user` VALUES ('3dd4534d730d45dc9ba6eac6bd9445ac', 'hanyumeng', '2016-09-03', '090c6e01a3c54d768ce27fe143551f79', '4', '4.0', '4.0', '16', '8.0', '8.0', '400', '7.0', '7.0', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_user` VALUES ('a2086fb79a534fac93bc225105c4cf9a', 'hanyumeng', '2016-09-04', '090c6e01a3c54d768ce27fe143551f79', '4', '4.0', '4.0', '16', '8.0', '8.0', '400', '7.0', '7.0', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_user` VALUES ('02d1d1e6fa4d4d3ab74b708149490c67', 'hanyumeng', '2016-09-05', '090c6e01a3c54d768ce27fe143551f79', '4', '4.0', '4.0', '16', '8.0', '8.0', '400', '7.0', '7.0', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_user` VALUES ('79db44b191204de7be9ef86333b6341f', 'hanyumeng', '2016-09-06', '090c6e01a3c54d768ce27fe143551f79', '4', '4.0', '4.0', '16', '8.0', '8.0', '400', '7.0', '7.0', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_user` VALUES ('d90f4636c23f40a1adc61f1b5af9eea6', 'hanyumeng', '2016-09-07', '090c6e01a3c54d768ce27fe143551f79', '4', '4.0', '4.0', '16', '8.0', '8.0', '400', '7.0', '7.0', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_user` VALUES ('00fddcb8bd40469ca47c136f24f089a9', '系统管理员', '2016-09-05', '1', '4', null, null, '100', null, null, '2000', null, null, null, null, null, null, null, null);
INSERT INTO `history_report_user` VALUES ('e45659e268724ecba37acc445c9bc994', 'wangping', '2016-09-01', '388c9242e49142998cba43a54a729f0e', '4', '0.0', '0.0', '100', '0.0', '0.0', '400', '0.0', '0.0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_user` VALUES ('f301a9e63f534034a8c2ee4ba42dd9a5', 'Test', '2016-09-01', '9e2b52304d44452fb296da1b98407215', '1', null, null, '1', null, null, '1', null, null, null, null, null, null, null, null);
INSERT INTO `history_report_user` VALUES ('b24c3354a2c24d9eaa125d1be05e997d', '王万斌', '2016-09-01', 'dc1d14d6677d48f3958685143a7f480d', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_user` VALUES ('53b71939566b458e9cbeb3db080be269', 'hanyumeng', '2016-07-05', '090c6e01a3c54d768ce27fe143551f79', '4', '4.0', '4.0', '16', '8.0', '8.0', '400', '7.0', '7.0', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_user` VALUES ('1d1756539cda464c95b203a760374bc6', '系统管理员', '2016-09-05', '1', '4', null, null, '100', null, null, '2000', null, null, null, null, null, null, null, null);
INSERT INTO `history_report_user` VALUES ('44b4a4e6bb7749389014806cd7ee56ff', 'wangping', '2016-09-02', '388c9242e49142998cba43a54a729f0e', '4', '0.0', '0.0', '100', '0.0', '0.0', '400', '0.0', '0.0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_user` VALUES ('1550054cbb06488c808cdec363c4d2d6', 'Test', '2016-09-02', '9e2b52304d44452fb296da1b98407215', '1', null, null, '1', null, null, '1', null, null, null, null, null, null, null, null);
INSERT INTO `history_report_user` VALUES ('90e02c222b9843e6b52ddcbbd8e69275', '王万斌', '2016-09-02', 'dc1d14d6677d48f3958685143a7f480d', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_user` VALUES ('1fed0936ced74f71ba567d0e26589d4f', 'hanyumeng', '2016-08-05', '090c6e01a3c54d768ce27fe143551f79', '4', '4.0', '0', '16', '8.0', '0', '400', '7.0', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_user` VALUES ('25594ed66d5a4ad787f27b1558866ede', '系统管理员', '2016-09-05', '1', '4', null, null, '100', null, null, '2000', null, null, null, null, null, null, null, null);
INSERT INTO `history_report_user` VALUES ('574e3b1eec9440e2920e1961dab17955', 'wangping', '2016-09-03', '388c9242e49142998cba43a54a729f0e', '4', '0.0', '0.0', '100', '0.0', '0.0', '400', '0.0', '0.0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_user` VALUES ('4d305b9074ae4495b052064b50fb006a', 'Test', '2016-09-03', '9e2b52304d44452fb296da1b98407215', '1', null, null, '1', null, null, '1', null, null, null, null, null, null, null, null);
INSERT INTO `history_report_user` VALUES ('672a960777c54480a3a4d85c7c19699e', '王万斌', '2016-09-03', 'dc1d14d6677d48f3958685143a7f480d', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_user` VALUES ('452070b777fe4c8fbf94b743d8816e4b', 'hanyumeng', '2016-06-05', '090c6e01a3c54d768ce27fe143551f79', '4', '3', '3', '16', '3', '3', '400', '3', '3', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_user` VALUES ('ff0b2e4f75df4cd5a146574a9900afe1', '系统管理员', '2016-09-05', '1', '4', null, null, '100', null, null, '2000', null, null, null, null, null, null, null, null);
INSERT INTO `history_report_user` VALUES ('a00be93afe3047f7b37295cfabbe23d2', 'wangping', '2016-09-04', '388c9242e49142998cba43a54a729f0e', '4', '0.0', '0.0', '100', '0.0', '0.0', '400', '0.0', '0.0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_user` VALUES ('b79343b130b345bbb4b608b5f188acbd', 'Test', '2016-09-04', '9e2b52304d44452fb296da1b98407215', '1', null, null, '1', null, null, '1', null, null, null, null, null, null, null, null);
INSERT INTO `history_report_user` VALUES ('de5c809f681a45dcbf300295598f40d2', '王万斌', '2016-09-04', 'dc1d14d6677d48f3958685143a7f480d', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_user` VALUES ('b2265cb74b914166ad949ea91a68b624', 'hanyumeng', '2016-04-05', '090c6e01a3c54d768ce27fe143551f79', '4', '2', '2', '16', '2', '2', '400', '2', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_user` VALUES ('940aeae479e242d5962acf50e41d9d6f', '系统管理员', '2016-09-05', '1', '4', null, null, '100', null, null, '2000', null, null, null, null, null, null, null, null);
INSERT INTO `history_report_user` VALUES ('5b6aabbe2ebd4ce08a21996fbf318194', 'wangping', '2016-09-05', '388c9242e49142998cba43a54a729f0e', '4', '0.0', '0.0', '100', '0.0', '0.0', '400', '0.0', '0.0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_user` VALUES ('757d4fdda9fb4574a4c544f90a3aa10f', 'Test', '2016-09-05', '9e2b52304d44452fb296da1b98407215', '1', null, null, '1', null, null, '1', null, null, null, null, null, null, null, null);
INSERT INTO `history_report_user` VALUES ('aa83ad8ba6ad4efc8f786a9197d99470', '王万斌', '2016-09-05', 'dc1d14d6677d48f3958685143a7f480d', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_user` VALUES ('0a9e3e5715fd4641863b9028f645bebb', 'hanyumeng', '2016-03-05', '090c6e01a3c54d768ce27fe143551f79', '4', '1', '1', '16', '1', '1', '400', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_user` VALUES ('9e1a8d17432c49b48a72cddf93956303', '系统管理员', '2016-09-05', '1', '4', null, null, '100', null, null, '2000', null, null, null, null, null, null, null, null);
INSERT INTO `history_report_user` VALUES ('63708d621a1f4361bdeef6f6257c5c7d', 'wangping', '2016-09-06', '388c9242e49142998cba43a54a729f0e', '4', '0.0', '0.0', '100', '0.0', '0.0', '400', '0.0', '0.0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_user` VALUES ('506fdc3df4744e858f38f4a5a7f6e193', 'Test', '2016-09-06', '9e2b52304d44452fb296da1b98407215', '1', null, null, '1', null, null, '1', null, null, null, null, null, null, null, null);
INSERT INTO `history_report_user` VALUES ('d321ead398614a14a249cdf0ad5cea80', '王万斌', '2016-09-06', 'dc1d14d6677d48f3958685143a7f480d', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_user` VALUES ('ffb119465911494594610af19b1893a5', 'hanyumeng', '2016-02-05', '090c6e01a3c54d768ce27fe143551f79', '4', '0', '0', '16', '0', '0', '400', '0', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `history_report_user` VALUES ('d3406fee0374472db0102487ecfa0915', '系统管理员', '2016-09-05', '1', '4', null, null, '100', null, null, '2000', null, null, null, null, null, null, null, null);
INSERT INTO `history_report_user` VALUES ('3b70d123fd094234bd81f0c7c8a539f1', 'wangping', '2016-09-07', '388c9242e49142998cba43a54a729f0e', '4', '0.0', '0.0', '100', '0.0', '0.0', '400', '0.0', '0.0', '0', '0', '0', '0', '0', '0');
INSERT INTO `history_report_user` VALUES ('5e0dfa5c506741999c229dad55093f5e', 'Test', '2016-09-07', '9e2b52304d44452fb296da1b98407215', '1', null, null, '1', null, null, '1', null, null, null, null, null, null, null, null);
INSERT INTO `history_report_user` VALUES ('82f30f97250f478ba7b6149a8ba9f275', '王万斌', '2016-09-07', 'dc1d14d6677d48f3958685143a7f480d', '5', '0', '0', '10', '0', '0', '500', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for information
-- ----------------------------
DROP TABLE IF EXISTS `information`;
CREATE TABLE `information` (
  `uuid` varchar(32) NOT NULL,
  `info_content` varchar(4000) DEFAULT NULL,
  `info_type` varchar(32) DEFAULT NULL,
  `info_status` varchar(32) DEFAULT NULL,
  `info_to_user` varchar(32) DEFAULT NULL,
  `info_from_user` varchar(32) DEFAULT NULL,
  `info_submit_time` timestamp NULL DEFAULT NULL,
  `info_approval_time` timestamp NULL DEFAULT NULL,
  `task_uuid` varchar(32) DEFAULT NULL,
  `info_condition` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of information
-- ----------------------------
INSERT INTO `information` VALUES ('1002', '虚拟机创建申请', '审批', '未审批', '1', '388c9242e49142998cba43a54a729f0e', null, '2016-08-23 10:04:27', null, null);
INSERT INTO `information` VALUES ('1001', '<p>Hi Peter, <br>Thanks for the e-mail. It is always nice to hear from people, especially from you, Scott.</p> <p>I have not got any reply, a positive or negative one, from Seibido yet.<br>Let\'s wait and hope that it will make a BOOK.</p> <p>Have you finished your paperwork for Kaken and writing academic articles?<br>If you have some free time in the near future, I want to meet you and explain to you our next project.</p>', '审批', '未审批', '1', '090c6e01a3c54d768ce27fe143551f79', null, '2016-08-23 10:04:27', null, null);
INSERT INTO `information` VALUES ('1003', '测试新数据', '其他', '已读', '1', '388c9242e49142998cba43a54a729f0e', null, '2016-08-23 17:40:13', null, null);
INSERT INTO `information` VALUES ('1004', '虚拟机申请创建，请批准', '审批', '已审批', '1', '388c9242e49142998cba43a54a729f0e', null, '2016-08-24 09:51:27', null, null);
INSERT INTO `information` VALUES ('cf93311808a548a6a28c9954b39381c8', '<p>申请信息：</p><p>创建虚拟机名称：newVM202<br>应用描述：test<br>申请cpu：8<br>申请内存：32<br>申请磁盘：6<br>占用IP：192.168.0.187</p><p>所属项目：My Project</p><p>资源池名称：需审批资源池<br>资源池描述：需审批</p>', '审批', '已审批', '1', '090c6e01a3c54d768ce27fe143551f79', null, '2016-08-24 11:05:23', 'c6afc643b18b42009c9a359856a1ddd4', null);
INSERT INTO `information` VALUES ('229941cd6f8e4d539e204333537961d5', '<p>申请信息：</p><p>创建虚拟机名称：newVM203<br>应用描述：test<br>申请cpu：4<br>申请内存：8<br>申请磁盘：6<br>占用IP：192.168.0.186</p><p>所属项目：My Project</p><p>资源池名称：需审批资源池<br>资源池描述：需审批</p>', '审批', '已审批', '1', '090c6e01a3c54d768ce27fe143551f79', '2016-08-24 14:43:43', '2016-08-24 12:06:14', 'e79c8e226a5546e78707e6dea849808d', null);
INSERT INTO `information` VALUES ('08ebf4749d1945119c0987694bcd89bc', '<p>申请信息：</p><p>创建虚拟机名称：newVM204<br>应用描述：test<br>申请cpu：8<br>申请内存：32<br>申请磁盘：6<br>占用IP：192.168.0.186</p><p>所属项目：My Project</p><p>资源池名称：需审批资源池<br>资源池描述：需审批</p>', '审批', '已审批', '1', '090c6e01a3c54d768ce27fe143551f79', null, '2016-08-24 14:55:31', '6033ad3e103f4b388ad8a7cbd7f14bc0', null);
INSERT INTO `information` VALUES ('aeec434c872a44f1949eb23a60e97672', '<p>申请信息：</p><p>创建虚拟机名称：newVM205<br>应用描述：test<br>申请cpu：4<br>申请内存：8<br>申请磁盘：6<br>占用IP：192.168.0.187</p><p>所属项目：My Project</p><p>资源池名称：需审批资源池<br>资源池描述：需审批</p>', '审批', '已审批', '1', '090c6e01a3c54d768ce27fe143551f79', '2016-08-24 15:16:49', '2016-08-24 15:10:29', '5990332e3b514a6ead0fa0ce9015b446', null);
INSERT INTO `information` VALUES ('ee84a90c31544c0e93ac683a1d3c5e11', '您申请的 newVM205 创建申请已通过', '提醒', '已读', '090c6e01a3c54d768ce27fe143551f79', '1', null, '2016-08-24 15:16:49', null, null);
INSERT INTO `information` VALUES ('bc94755a9cab48a4a7809abe0fcd8350', '<p>申请信息：</p><p>创建虚拟机名称：newvm7<br>应用描述：newvm7<br>申请cpu：4<br>申请内存：8<br>申请磁盘：6<br>占用IP：192.168.0.186</p><p>所属项目：project</p><p>资源池名称：需审批资源池<br>资源池描述：需审批</p>', '审批', '已审批', '1', 'dc1d14d6677d48f3958685143a7f480d', '2016-08-24 18:04:27', '2016-08-24 18:03:46', '45e3638d4e344c0d826ecd5ddf7f7f66', null);
INSERT INTO `information` VALUES ('a97f09b40b6a46f2affb77f6bc704565', '您申请的 newvm7 创建申请未通过', '提醒', '已读', 'dc1d14d6677d48f3958685143a7f480d', '1', null, '2016-08-24 18:04:27', null, null);
INSERT INTO `information` VALUES ('e19b39cc478f4fe0942a65274be0edcb', '<p>申请信息：</p><p>创建虚拟机名称：newvm8<br>应用描述：newvm8<br>申请cpu：4<br>申请内存：8<br>申请磁盘：6<br>占用IP：192.168.0.186</p><p>所属项目：project</p><p>资源池名称：需审批资源池<br>资源池描述：需审批</p>', '审批', '已审批', '1', 'dc1d14d6677d48f3958685143a7f480d', '2016-08-24 18:06:18', '2016-08-24 18:05:51', '3eb70bdd3f6349a3bd409d3fa362ff8f', null);
INSERT INTO `information` VALUES ('ed6abe1e05be47fd8853370448f0f186', '您申请的 newvm8 创建申请已通过', '提醒', '已读', 'dc1d14d6677d48f3958685143a7f480d', '1', null, '2016-08-24 18:06:18', null, null);
INSERT INTO `information` VALUES ('3b8d0dfd43944bd28e8968cd77b10b68', '您的应用还有5过期！请及时续期', '续期', '已读', '090c6e01a3c54d768ce27fe143551f79', '1', '2016-09-12 15:01:00', '2016-09-07 11:15:10', '75b9fc79749646feaec3ee7c1b4d0f92', null);
INSERT INTO `information` VALUES ('85022de67d1842269aea9dfb4408d531', '您的newVM161应用还有5过期！请及时续期', '续期', '已读', '090c6e01a3c54d768ce27fe143551f79', '1', '2016-09-12 15:01:00', '2016-09-07 11:16:17', '75b9fc79749646feaec3ee7c1b4d0f92', null);
INSERT INTO `information` VALUES ('1005', '您的newVM161应用还有4过期！请及时续期', '续期', '已读', '090c6e01a3c54d768ce27fe143551f79', '1', '2016-09-12 15:01:00', '2016-09-07 11:16:18', '75b9fc79749646feaec3ee7c1b4d0f92', null);
INSERT INTO `information` VALUES ('5ae4857601bd4a9697c19194df1f3565', '您的应用newVM161续期申请已审批通过', '提醒', '已读', '090c6e01a3c54d768ce27fe143551f79', '1', null, '2016-09-08 15:17:18', null, null);
INSERT INTO `information` VALUES ('c98d0978543a469e89e3c12b4acf562b', '您的应用newVM161续期申请已审批通过', '提醒', '已读', '090c6e01a3c54d768ce27fe143551f79', '1', null, '2016-09-08 15:17:32', null, null);
INSERT INTO `information` VALUES ('9919573bed52410ea536e3f46d549b70', '您的应用newVM161续期申请未通过审批', '提醒', '已读', '090c6e01a3c54d768ce27fe143551f79', '1', null, '2016-09-08 15:18:48', null, null);
INSERT INTO `information` VALUES ('e3a650a5f1754480a175f2bf525090d7', '<p>申请信息：【应用续期】</p><p>应用名称：newVM120<br>应用描述：test<br>过期时间：2016-09-13<br>申请时间：Sat Oct 08 2016 00:00:00 GMT+0800 (中国标准时间)</p>', '审批', '已审批', '1', '090c6e01a3c54d768ce27fe143551f79', '2016-09-12 15:01:00', '2016-09-12 14:28:41', '52843b0c6f1540ee8638c613d5f96d3e', 'Sat Oct 08 2016 00:00:00 GMT+0800 (中国标准时间)');
INSERT INTO `information` VALUES ('cffeef1cbce8416e8c48e9d408ee559d', '<p>申请信息：【应用续期】</p><p>应用名称：newVM161<br>应用描述：test<br>过期时间：2016-12-01<br>申请时间：2016-10-13</p>', '审批', '已审批', '1', '090c6e01a3c54d768ce27fe143551f79', '2016-09-12 15:01:00', '2016-09-08 12:14:11', '75b9fc79749646feaec3ee7c1b4d0f92', '2016-10-13');
INSERT INTO `information` VALUES ('df36f7d2c0e44275925f9b669833b105', '<p>申请信息：【应用续期】</p><p>应用名称：newVM120<br>应用描述：test<br>过期时间：2016-09-13<br>申请时间：Sat Oct 08 2016 00:00:00 GMT+0800 (中国标准时间)</p>', '审批', '已审批', '1', '090c6e01a3c54d768ce27fe143551f79', '2016-09-12 15:01:00', '2016-09-12 14:29:09', '52843b0c6f1540ee8638c613d5f96d3e', 'Sat Oct 08 2016 00:00:00 GMT+0800 (中国标准时间)');
INSERT INTO `information` VALUES ('e7d2e642f1b04c4cb20f2192b2b4cf6d', '您的应用newVM120续期申请未通过审批', '提醒', '未读', '090c6e01a3c54d768ce27fe143551f79', '1', null, '2016-09-12 14:32:09', null, null);
INSERT INTO `information` VALUES ('57a896d8c1a34879a096e34571e46b0e', '您的应用newVM120续期申请未通过审批', '提醒', '未读', '090c6e01a3c54d768ce27fe143551f79', '1', null, '2016-09-12 14:32:19', null, null);
INSERT INTO `information` VALUES ('37f359a56ae2491ca51cf579b5a37296', '<p>申请信息：【应用续期】</p><p>应用名称：newVM120<br>应用描述：test<br>过期时间：2016-09-13<br>申请时间：2016-10-27</p>', '审批', '已审批', '1', '090c6e01a3c54d768ce27fe143551f79', '2016-09-12 15:01:00', '2016-09-12 14:33:45', '52843b0c6f1540ee8638c613d5f96d3e', '2016-10-27');
INSERT INTO `information` VALUES ('c49ab21292c14740bb74db3e5bf1bcee', '您的应用newVM120续期申请未通过审批', '提醒', '已读', '090c6e01a3c54d768ce27fe143551f79', '1', null, '2016-09-12 14:34:37', null, null);
INSERT INTO `information` VALUES ('061ac22cdc414198968fdd39844aef9d', '<p>申请信息：【应用续期】</p><p>应用名称：newVM120<br>应用描述：test<br>过期时间：2016-09-13<br>申请时间：2016-10-8</p>', '审批', '已审批', '1', '090c6e01a3c54d768ce27fe143551f79', '2016-09-12 15:01:00', '2016-09-12 14:44:18', '52843b0c6f1540ee8638c613d5f96d3e', '2016-10-8');
INSERT INTO `information` VALUES ('5d525cb33a79462db9b6caa85e0f4b13', '您的应用newVM120续期申请已审批通过', '提醒', '未读', '090c6e01a3c54d768ce27fe143551f79', '1', null, '2016-09-12 14:44:37', null, null);
INSERT INTO `information` VALUES ('b1d3abb854d342f6947860bf61a2e0a2', '<p>申请信息：【应用续期】</p><p>应用名称：newVM120<br>应用描述：test<br>过期时间：2016-10-08<br>申请时间：2016-10-20</p>', '审批', '已审批', '1', '090c6e01a3c54d768ce27fe143551f79', '2016-09-12 15:01:00', '2016-09-12 14:45:52', '52843b0c6f1540ee8638c613d5f96d3e', '2016-10-20');
INSERT INTO `information` VALUES ('20e39a052f744c28b102a361c3201805', '您的应用newVM120续期申请未通过审批', '提醒', '未读', '090c6e01a3c54d768ce27fe143551f79', '1', null, '2016-09-12 14:46:32', null, null);
INSERT INTO `information` VALUES ('cb4ce379384a472db34a16108f0f4194', '<p>申请信息：【应用续期】</p><p>应用名称：newVM120<br>应用描述：test<br>过期时间：2016-10-08<br>申请时间：2016-11-24</p>', '审批', '已审批', '1', '090c6e01a3c54d768ce27fe143551f79', '2016-09-12 15:01:00', '2016-09-12 14:49:43', '52843b0c6f1540ee8638c613d5f96d3e', '2016-11-24');
INSERT INTO `information` VALUES ('d962ed2d299541ac9e510618acacd81f', '您的应用newVM120续期申请未通过审批', '提醒', '未读', '090c6e01a3c54d768ce27fe143551f79', '1', null, '2016-09-12 14:50:21', null, null);
INSERT INTO `information` VALUES ('8a676fca59104db6a003f5f07679ef88', '<p>申请信息：【应用续期】</p><p>应用名称：newVM120<br>应用描述：test<br>过期时间：2016-10-08<br>申请时间：2016-11-1</p>', '审批', '已审批', '1', '090c6e01a3c54d768ce27fe143551f79', '2016-09-12 15:01:00', '2016-09-12 14:54:37', '52843b0c6f1540ee8638c613d5f96d3e', '2016-11-1');
INSERT INTO `information` VALUES ('21b253259b174e8387748fcae7796f0c', '您的应用newVM120续期申请未通过审批', '提醒', '未读', '090c6e01a3c54d768ce27fe143551f79', '1', null, '2016-09-12 14:54:57', null, null);
INSERT INTO `information` VALUES ('01c847c4de194ed6b090e5fc547f9731', '您的应用newVM120续期申请未通过审批', '提醒', '未读', '090c6e01a3c54d768ce27fe143551f79', '1', null, '2016-09-12 14:55:03', null, null);
INSERT INTO `information` VALUES ('f86f8b285cdc4d30ad97272690a83ef5', '<p>申请信息：【应用续期】</p><p>应用名称：newVM161<br>应用描述：test<br>过期时间：2016-10-13<br>申请时间：2016-10-27</p>', '审批', '已审批', '1', '090c6e01a3c54d768ce27fe143551f79', '2016-09-12 15:01:00', '2016-09-12 14:56:35', '75b9fc79749646feaec3ee7c1b4d0f92', '2016-10-27');
INSERT INTO `information` VALUES ('3b170083139642da88b4c2116f594636', '您的应用newVM161续期申请已审批通过', '提醒', '未读', '090c6e01a3c54d768ce27fe143551f79', '1', null, '2016-09-12 14:56:51', null, null);
INSERT INTO `information` VALUES ('3967cef9e22a4e5da7790ea028b941be', '<p>申请信息：【应用续期】</p><p>应用名称：newVM120<br>应用描述：test<br>过期时间：2016-10-08<br>申请时间：2016-11-30</p>', '审批', '未审批', '1', '090c6e01a3c54d768ce27fe143551f79', '2016-09-12 15:01:00', '2016-09-12 15:00:07', '52843b0c6f1540ee8638c613d5f96d3e', '2016-11-30');
INSERT INTO `information` VALUES ('64244a13f8904c49bea0b365fb868392', '<p>申请信息：【应用续期】</p><p>应用名称：newVM161<br>应用描述：test<br>过期时间：2016-10-27<br>申请时间：2016-11-30</p>', '审批', '未审批', '1', '090c6e01a3c54d768ce27fe143551f79', '2016-09-12 15:01:00', '2016-09-12 15:00:08', '75b9fc79749646feaec3ee7c1b4d0f92', '2016-11-30');
INSERT INTO `information` VALUES ('4cd91ba2749b447a8982ea0d5c9841bd', '<p>申请信息：【应用续期】</p><p>应用名称：newVM120<br>应用描述：test<br>过期时间：2016-10-08<br>申请时间：2016-11-30</p>', '审批', '已审批', '1', '090c6e01a3c54d768ce27fe143551f79', '2016-09-12 15:01:27', '2016-09-12 15:01:00', '52843b0c6f1540ee8638c613d5f96d3e', '2016-11-30');
INSERT INTO `information` VALUES ('d4cd3f952e5946db84a49bad82cca252', '<p>申请信息：【应用续期】</p><p>应用名称：newVM161<br>应用描述：test<br>过期时间：2016-10-27<br>申请时间：2016-11-30</p>', '审批', '已审批', '1', '090c6e01a3c54d768ce27fe143551f79', '2016-09-12 15:01:22', '2016-09-12 15:01:00', '75b9fc79749646feaec3ee7c1b4d0f92', '2016-11-30');
INSERT INTO `information` VALUES ('8c685260799043d79770ca741e504467', '您的应用newVM161续期申请未通过审批', '提醒', '未读', '090c6e01a3c54d768ce27fe143551f79', '1', null, '2016-09-12 15:01:22', null, null);
INSERT INTO `information` VALUES ('80f85b5a258f482f8db2485919297701', '您的应用newVM120续期申请已审批通过', '提醒', '未读', '090c6e01a3c54d768ce27fe143551f79', '1', null, '2016-09-12 15:01:27', null, null);

-- ----------------------------
-- Table structure for ipaddrs
-- ----------------------------
DROP TABLE IF EXISTS `ipaddrs`;
CREATE TABLE `ipaddrs` (
  `uuid` varchar(32) NOT NULL,
  `network_value` varchar(45) DEFAULT NULL,
  `ipaddr` varchar(45) DEFAULT NULL,
  `ipaddr_status_uuid` varchar(32) DEFAULT NULL COMMENT 'IP地址状态\n',
  `source_uuid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ipaddrs
-- ----------------------------
INSERT INTO `ipaddrs` VALUES ('00c7e0c25a194794a1551b87679ee86c', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', 'b6f7dbe642fe4b53a4bed62edfc56f22');
INSERT INTO `ipaddrs` VALUES ('01a95e1d2cc24450a8cbdad594573539', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', 'e3596cdbf61e48578e9bc9fe45625fb0');
INSERT INTO `ipaddrs` VALUES ('01aedc52af3e4172bf118689f708b56e', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', '9e116ba92f334065a2e264be0d06413a');
INSERT INTO `ipaddrs` VALUES ('0208b4feb6114c5cb3d766e967ad271f', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', '33a3d3ee93c149c595d23962d9f844da');
INSERT INTO `ipaddrs` VALUES ('020a1a27542f4ae8bb91d0530729c68b', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', 'b6f7dbe642fe4b53a4bed62edfc56f22');
INSERT INTO `ipaddrs` VALUES ('03a26d44fe52457080d60a67dcfa6abb', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', 'f63a5ee04fb545aba31940895357fa5a');
INSERT INTO `ipaddrs` VALUES ('03b9325c3f2748b5841e22be2bdb7d14', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', 'bb597db0d51c49f1b01ca148d119be1e');
INSERT INTO `ipaddrs` VALUES ('0618083fe5704263acb9842202c1d685', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', 'e9f33e1e129d4e65bb1d7a13c986e93a');
INSERT INTO `ipaddrs` VALUES ('068a7644560f4ad5bd65d14e47788397', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', '9e5bb69322e04e81a77427768e180e49');
INSERT INTO `ipaddrs` VALUES ('06ff4ac0a0cb425c932f47343e1eefa3', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', '61d94caed483472ba8904603192d026c');
INSERT INTO `ipaddrs` VALUES ('070785b547c740d389cf73fd1e96901c', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', 'f62d7093594c4df4ba283f55aa1b9fd8');
INSERT INTO `ipaddrs` VALUES ('07b02262f8a34647811e1a168bd4f316', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', '2636ad4b856240d3a0af09aa52c7f01a');
INSERT INTO `ipaddrs` VALUES ('0813a6eb9128404d9dd7eb4d1ae85c85', '192.168.0.6-192.168.0.9', '192.168.0.9', '24', '35fddf7948614ce1aa0cc48805a93527');
INSERT INTO `ipaddrs` VALUES ('09a5df9d9a2e4e83b05d7879f9617b32', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', 'fc88443889954febac1ea384e3b1b049');
INSERT INTO `ipaddrs` VALUES ('0aba9305fd2f488d9d203ce15498ca20', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', '96fc8149eb4442e0977328d5fa757d85');
INSERT INTO `ipaddrs` VALUES ('0b23764247244f1ea737b10fb436ceee', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', '0e5e131c70d843e1b09af783c5021807');
INSERT INTO `ipaddrs` VALUES ('0baa0fb5ce374d128c162868867446f0', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', '9e5bb69322e04e81a77427768e180e49');
INSERT INTO `ipaddrs` VALUES ('0c630edd3f354733b054795cbef1d48a', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', '33a3d3ee93c149c595d23962d9f844da');
INSERT INTO `ipaddrs` VALUES ('0cbf9bc207874c1eb36cea5410be4d47', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', '3c6cc7bbf2044cff9931491917ffdc1c');
INSERT INTO `ipaddrs` VALUES ('0cde5637b4204a00823442e2fe441592', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', 'accd51cddf2d496ca8ee61d6d452c75f');
INSERT INTO `ipaddrs` VALUES ('0d6d362553834551b416d70964bed98c', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', 'f63a5ee04fb545aba31940895357fa5a');
INSERT INTO `ipaddrs` VALUES ('0dab27e55f6f455ebd99aa3a2d299d5f', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', '9e5bb69322e04e81a77427768e180e49');
INSERT INTO `ipaddrs` VALUES ('0df3c467414c4d1593b41d12ce650402', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', 'b6f7dbe642fe4b53a4bed62edfc56f22');
INSERT INTO `ipaddrs` VALUES ('0f4e744ef57a40b29bb5d28a1f20cd6f', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', 'b8f59ef15eb24d1481d71b9a5857c94c');
INSERT INTO `ipaddrs` VALUES ('0fec1a514f92482d8647c0815c98cd55', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', '2636ad4b856240d3a0af09aa52c7f01a');
INSERT INTO `ipaddrs` VALUES ('1', '192.168.0.185-192.168.0.190', '192.168.0.185', '21', '333b8b97a06b434097e089810a2601fe');
INSERT INTO `ipaddrs` VALUES ('1055636f0ef94615b85460d7a4800370', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', '30f57ab43420494484ba3f1d3f88d2c1');
INSERT INTO `ipaddrs` VALUES ('1137c2d432c74db1900ae0e12fe31c7b', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', '85b1adcd86c64cb3818fd6c7f6b5f683');
INSERT INTO `ipaddrs` VALUES ('1159799dc347414dba8591014eef3898', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', 'b6f7dbe642fe4b53a4bed62edfc56f22');
INSERT INTO `ipaddrs` VALUES ('138cd06781a844099eec4054c5ee442d', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', 'c776ff51fe2342fea4c4b5375825a398');
INSERT INTO `ipaddrs` VALUES ('1545765e4c4341e0b788b6561b3d2d74', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', '7d56517974154390a685780e9bb40048');
INSERT INTO `ipaddrs` VALUES ('15f2d322776a4d4cac5abf47856e14f3', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', '8a5c862c962746c0bb5fb7b904a4cd84');
INSERT INTO `ipaddrs` VALUES ('160c50f60bbf4e43a7cf0c2cef6e6c6e', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', '61d94caed483472ba8904603192d026c');
INSERT INTO `ipaddrs` VALUES ('160de8af68ee4447b534b989d7941104', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', '9e116ba92f334065a2e264be0d06413a');
INSERT INTO `ipaddrs` VALUES ('167b2f47bcf74ee89e9d50c976f272dc', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', 'fc88443889954febac1ea384e3b1b049');
INSERT INTO `ipaddrs` VALUES ('169228cbe1db4339b9ae094b98a35257', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', '65577a2286ea4402b278f5344e8dc49e');
INSERT INTO `ipaddrs` VALUES ('16c61dc052534073a097b1a6904da2d1', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', '9862a587af3440cc9e7f870e43205203');
INSERT INTO `ipaddrs` VALUES ('18e947b6606645c3af0a383b7c336ace', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', '9e116ba92f334065a2e264be0d06413a');
INSERT INTO `ipaddrs` VALUES ('19014cf2b111401cb4d27fb0779de5e7', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', 'e3596cdbf61e48578e9bc9fe45625fb0');
INSERT INTO `ipaddrs` VALUES ('1915befa58294714aa618a30f97a1e71', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', '1504320ca1bd49a8894c3a8c5d07e7bf');
INSERT INTO `ipaddrs` VALUES ('197440787ceb4119987e00f0b229a5d5', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', 'f5c7a24b48b14301813294c2a96714a0');
INSERT INTO `ipaddrs` VALUES ('19af1b36c32d4f32b7f6b781dfe0e716', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', '67bdcea31d7a46acb0580ac5926d2aab');
INSERT INTO `ipaddrs` VALUES ('1b8836ffe6364b34aca1bdcd9e9af021', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', 'f62d7093594c4df4ba283f55aa1b9fd8');
INSERT INTO `ipaddrs` VALUES ('1bf4e0a8ea854b78a0415e4eaa92ccd4', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', '67bdcea31d7a46acb0580ac5926d2aab');
INSERT INTO `ipaddrs` VALUES ('1cccdd69aad5439aa7010fb9a09907ed', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', '2636ad4b856240d3a0af09aa52c7f01a');
INSERT INTO `ipaddrs` VALUES ('1d306cd99a9240329fdc2c8f67d1b3ee', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', '30f57ab43420494484ba3f1d3f88d2c1');
INSERT INTO `ipaddrs` VALUES ('1d43cd26f8584e5ebab1a3e7956944a0', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', '30f57ab43420494484ba3f1d3f88d2c1');
INSERT INTO `ipaddrs` VALUES ('1d917660e587494f8293c48a5b5d41cd', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', '9e116ba92f334065a2e264be0d06413a');
INSERT INTO `ipaddrs` VALUES ('1e151d132ad3476c8bb2e209b3f15549', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', '897387c5d7074386b853ee852973a2c5');
INSERT INTO `ipaddrs` VALUES ('1f1d53b6883442ed902ead0e3aef967b', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', '30f57ab43420494484ba3f1d3f88d2c1');
INSERT INTO `ipaddrs` VALUES ('1fbc33e330b1460da05b1087f5efadec', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', 'e9f33e1e129d4e65bb1d7a13c986e93a');
INSERT INTO `ipaddrs` VALUES ('2', '192.168.0.185-192.168.0.190', '192.168.0.186', '22', '333b8b97a06b434097e089810a2601fe');
INSERT INTO `ipaddrs` VALUES ('20276d3cf4fd466fa6d373b09ed7a6e0', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', '897387c5d7074386b853ee852973a2c5');
INSERT INTO `ipaddrs` VALUES ('2089c25a8d65457d99aeffa27cedcbf7', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', '67bdcea31d7a46acb0580ac5926d2aab');
INSERT INTO `ipaddrs` VALUES ('20974b4f9b8d4958b9fce37a5ec5386e', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', '1504320ca1bd49a8894c3a8c5d07e7bf');
INSERT INTO `ipaddrs` VALUES ('212e15095a154783a2bc29f86637f5dc', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', '3c6cc7bbf2044cff9931491917ffdc1c');
INSERT INTO `ipaddrs` VALUES ('218f75c037d047acaa949c27c30bc059', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', '65577a2286ea4402b278f5344e8dc49e');
INSERT INTO `ipaddrs` VALUES ('21bcc350c34d431591f0ee896298fc18', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', '897387c5d7074386b853ee852973a2c5');
INSERT INTO `ipaddrs` VALUES ('21d10295e88048be83f15dd991174245', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', '9e5bb69322e04e81a77427768e180e49');
INSERT INTO `ipaddrs` VALUES ('23388c73a54d49c3812f009d19a0ee2c', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', '19003bd23f2b481897df59618979d498');
INSERT INTO `ipaddrs` VALUES ('2473f34c165a43708f0ed71a189dbc07', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', '19003bd23f2b481897df59618979d498');
INSERT INTO `ipaddrs` VALUES ('2488152b73c44a3d99dd3c01cb25a1ce', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', '5749ad1c0cf2477b86e3299256dea01e');
INSERT INTO `ipaddrs` VALUES ('25c4b17523044f5faf6fc7fafad12b92', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', 'f62d7093594c4df4ba283f55aa1b9fd8');
INSERT INTO `ipaddrs` VALUES ('26363df1405442c69e37c34fcbcd9403', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', '4a75bc47aedd44dbb85a8d9e5c28da72');
INSERT INTO `ipaddrs` VALUES ('26aea261ff244519a8af45322fab7909', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', '1504320ca1bd49a8894c3a8c5d07e7bf');
INSERT INTO `ipaddrs` VALUES ('26c00e40fb8043deb80296bc249c15d6', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', 'e3596cdbf61e48578e9bc9fe45625fb0');
INSERT INTO `ipaddrs` VALUES ('26df7bb2a5cd4fceacbfb548500fda8c', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', 'bb597db0d51c49f1b01ca148d119be1e');
INSERT INTO `ipaddrs` VALUES ('27533a56d3a8486b84d1d4b4786a1b72', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', 'bb597db0d51c49f1b01ca148d119be1e');
INSERT INTO `ipaddrs` VALUES ('275a00ee91564f63b2120fcedcffa49a', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', 'accd51cddf2d496ca8ee61d6d452c75f');
INSERT INTO `ipaddrs` VALUES ('279670872d404f91a1a6d3787753edd9', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', '4a75bc47aedd44dbb85a8d9e5c28da72');
INSERT INTO `ipaddrs` VALUES ('28584fe9c8374399a74cd92fe7a339f0', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', '2636ad4b856240d3a0af09aa52c7f01a');
INSERT INTO `ipaddrs` VALUES ('28924e31a35f489099c3e69d6b079ec7', '192.168.0.194-192.168.0.199', '192.168.0.194', '21', '8fd3eb48a25641179ce9fa673b74131e');
INSERT INTO `ipaddrs` VALUES ('292333b251264137b6cb11099673f067', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', '3c6cc7bbf2044cff9931491917ffdc1c');
INSERT INTO `ipaddrs` VALUES ('297c4a36192c4e40ac96bdaf3a7bbb31', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', '65577a2286ea4402b278f5344e8dc49e');
INSERT INTO `ipaddrs` VALUES ('2a0809934720401eb5b112cb5075a876', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', 'c776ff51fe2342fea4c4b5375825a398');
INSERT INTO `ipaddrs` VALUES ('2a565f5da79148289c86c5c0a0c7e3b4', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', '5749ad1c0cf2477b86e3299256dea01e');
INSERT INTO `ipaddrs` VALUES ('2b8fb6e13abc454fac638bf3df4e027d', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', '9e116ba92f334065a2e264be0d06413a');
INSERT INTO `ipaddrs` VALUES ('2be5d0860a854f99ab75c7e8993132a8', '192.168.0.194-192.168.0.199', '192.168.0.196', '21', '8fd3eb48a25641179ce9fa673b74131e');
INSERT INTO `ipaddrs` VALUES ('2cae8e53eff844d6bca4cf86d21a05e6', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', '96fc8149eb4442e0977328d5fa757d85');
INSERT INTO `ipaddrs` VALUES ('2f5af562f35d4104ba7a0dd87077a399', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', '61d94caed483472ba8904603192d026c');
INSERT INTO `ipaddrs` VALUES ('2f7e0de869044d1a97534fb88016629d', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', '85b1adcd86c64cb3818fd6c7f6b5f683');
INSERT INTO `ipaddrs` VALUES ('2f8007d29d73426abf75106ac09420dc', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', 'eae6347b21194993b567da51f2d9fee9');
INSERT INTO `ipaddrs` VALUES ('2f854d7cae6f4467b0dd249e9e887b22', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', 'f5c7a24b48b14301813294c2a96714a0');
INSERT INTO `ipaddrs` VALUES ('3', '192.168.0.185-192.168.0.190', '192.168.0.187', '21', '333b8b97a06b434097e089810a2601fe');
INSERT INTO `ipaddrs` VALUES ('3127560bf2ee459486a48e29429c9d33', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', 'f9210810e9194541a8dec75c1138d449');
INSERT INTO `ipaddrs` VALUES ('3174ef09939043e3a3b87b7ba4427b98', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', '65577a2286ea4402b278f5344e8dc49e');
INSERT INTO `ipaddrs` VALUES ('318f6b8c517f4317a2927b222424d3aa', '192.168.0.194-192.168.0.199', '192.168.0.199', '21', '8fd3eb48a25641179ce9fa673b74131e');
INSERT INTO `ipaddrs` VALUES ('31c8de5c1d234a088dbe49b7bc2ed4b3', '192.168.0.12-192.168.0.13', '192.168.0.13', '21', '1d1f62c97a374973aed64d91bffa7543');
INSERT INTO `ipaddrs` VALUES ('31e26d8a7694403194c2f12e2c5cd7c5', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', 'f63a5ee04fb545aba31940895357fa5a');
INSERT INTO `ipaddrs` VALUES ('31e72776e408492ba6c9426ff90547fe', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', '8a5c862c962746c0bb5fb7b904a4cd84');
INSERT INTO `ipaddrs` VALUES ('32254055ce0a42849911c8fbc8b49390', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', '96fc8149eb4442e0977328d5fa757d85');
INSERT INTO `ipaddrs` VALUES ('325ead75f4e74635b6ec875a636f9591', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', '65577a2286ea4402b278f5344e8dc49e');
INSERT INTO `ipaddrs` VALUES ('32b2f5fb57194517b697b2334cebee19', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', '2636ad4b856240d3a0af09aa52c7f01a');
INSERT INTO `ipaddrs` VALUES ('33576532432342bcb96e1126aa464eec', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', 'f63a5ee04fb545aba31940895357fa5a');
INSERT INTO `ipaddrs` VALUES ('33a99f0606a54abba332d56775f3585d', '192.168.0.194-192.168.0.199', '192.168.0.198', '21', 'e2037212d5b34cbab0dc13eb1c778151');
INSERT INTO `ipaddrs` VALUES ('33bd3315b33e401789a07cd45062da25', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', '2636ad4b856240d3a0af09aa52c7f01a');
INSERT INTO `ipaddrs` VALUES ('354a91bab90a4dcd95576eabf4e77c9c', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', '4a75bc47aedd44dbb85a8d9e5c28da72');
INSERT INTO `ipaddrs` VALUES ('3659f05712494786a0d4cd5792ef00f5', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', '61d94caed483472ba8904603192d026c');
INSERT INTO `ipaddrs` VALUES ('369ba45d569e48098009f9fc0851867b', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', '4d788f01f2084088910f610c5161369d');
INSERT INTO `ipaddrs` VALUES ('3781820a80bd4266a27b9656b02c67b0', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', 'bb597db0d51c49f1b01ca148d119be1e');
INSERT INTO `ipaddrs` VALUES ('37cef9024793408fac03d18b2ad70603', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', '5749ad1c0cf2477b86e3299256dea01e');
INSERT INTO `ipaddrs` VALUES ('380fe8880b7042f292e8d5036565fdaa', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', '33a3d3ee93c149c595d23962d9f844da');
INSERT INTO `ipaddrs` VALUES ('39219fdbb51a4fbb85aaca0241fb666c', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', '67bdcea31d7a46acb0580ac5926d2aab');
INSERT INTO `ipaddrs` VALUES ('392fb1a2a99e4191902908a04ded2774', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', '85b1adcd86c64cb3818fd6c7f6b5f683');
INSERT INTO `ipaddrs` VALUES ('3a9f7b11d9744d0caeffec1867b0788d', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', '7d56517974154390a685780e9bb40048');
INSERT INTO `ipaddrs` VALUES ('3b5b90c5e33147feb1319c9ef2936f82', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', 'f5c7a24b48b14301813294c2a96714a0');
INSERT INTO `ipaddrs` VALUES ('3d44fa2067c6400cabca5ce29e6d6b9d', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', 'fc88443889954febac1ea384e3b1b049');
INSERT INTO `ipaddrs` VALUES ('3d7abe2ac9204320bfd41cf6c472b2ef', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', '4d788f01f2084088910f610c5161369d');
INSERT INTO `ipaddrs` VALUES ('3e07288b6f7d46bca447fb4594e8386b', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', 'e5307d46bc8446909474a9639743e845');
INSERT INTO `ipaddrs` VALUES ('3e5961f41b14453db14f889dd84a0186', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', '61d94caed483472ba8904603192d026c');
INSERT INTO `ipaddrs` VALUES ('3e875fa76a854defaec2a28363366632', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', '61d94caed483472ba8904603192d026c');
INSERT INTO `ipaddrs` VALUES ('3eddea60276841a1b81f271c8d58697f', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', 'e9f33e1e129d4e65bb1d7a13c986e93a');
INSERT INTO `ipaddrs` VALUES ('3f85a69d9849477e814d766a1634768d', '192.168.0.185-192.168.0.190', '192.168.0.186', '22', '0aeb3d649f1146ac90f83e5e452b4d1b');
INSERT INTO `ipaddrs` VALUES ('3fb67dccc43d4d259f717862046161ae', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', 'accd51cddf2d496ca8ee61d6d452c75f');
INSERT INTO `ipaddrs` VALUES ('3fb843f4c1934449b1c661b2303b34ae', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', '67bdcea31d7a46acb0580ac5926d2aab');
INSERT INTO `ipaddrs` VALUES ('3fbdde22dd544c108e89bb6f870bfeb2', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', 'b8f59ef15eb24d1481d71b9a5857c94c');
INSERT INTO `ipaddrs` VALUES ('4', '192.168.0.185-192.168.0.190', '192.168.0.188', '22', '333b8b97a06b434097e089810a2601fe');
INSERT INTO `ipaddrs` VALUES ('403cd4ff8d8d4f9aa6bac86c5a1c6165', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', 'eae6347b21194993b567da51f2d9fee9');
INSERT INTO `ipaddrs` VALUES ('4206b2fc79a7488ab53772f4e9c2131f', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', '8a5c862c962746c0bb5fb7b904a4cd84');
INSERT INTO `ipaddrs` VALUES ('43b2019bb3c84ff7a993d734cb77c238', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', 'f62d7093594c4df4ba283f55aa1b9fd8');
INSERT INTO `ipaddrs` VALUES ('45395a3def4342d9bc9bd579add8a763', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', 'f5c7a24b48b14301813294c2a96714a0');
INSERT INTO `ipaddrs` VALUES ('458f915229314595a9b097c6c86e5b39', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', '4a75bc47aedd44dbb85a8d9e5c28da72');
INSERT INTO `ipaddrs` VALUES ('45e13cbcc9c94f9c90e860dae3f7a190', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', '30f57ab43420494484ba3f1d3f88d2c1');
INSERT INTO `ipaddrs` VALUES ('45e55a7575b445f5a8c57737357efd44', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', '85b1adcd86c64cb3818fd6c7f6b5f683');
INSERT INTO `ipaddrs` VALUES ('45e6d55f82e84797ab11b8a4e8a7a7bc', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', 'c776ff51fe2342fea4c4b5375825a398');
INSERT INTO `ipaddrs` VALUES ('4624644c41934699b0656da9afed1e7a', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', 'b6f7dbe642fe4b53a4bed62edfc56f22');
INSERT INTO `ipaddrs` VALUES ('463ab495b7cc47fa8aff519aa8c49d71', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', '67bdcea31d7a46acb0580ac5926d2aab');
INSERT INTO `ipaddrs` VALUES ('478bd931e78e45ebbc3a0142f29e2ced', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', 'ee23c8b1dc2847eaa7c708de577323da');
INSERT INTO `ipaddrs` VALUES ('48ceecad7ecb4599a59481e7a4ca88b1', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', '897387c5d7074386b853ee852973a2c5');
INSERT INTO `ipaddrs` VALUES ('495b4b79f147468596e08780f165097e', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', '3c6cc7bbf2044cff9931491917ffdc1c');
INSERT INTO `ipaddrs` VALUES ('4a439536030847c19d28bbf50722fa9c', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', '19003bd23f2b481897df59618979d498');
INSERT INTO `ipaddrs` VALUES ('4ac1368c91d14689a15de88ad93a96b9', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', 'fc88443889954febac1ea384e3b1b049');
INSERT INTO `ipaddrs` VALUES ('4b5c65f223c74f08b24a85e276f0e6b0', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', '65577a2286ea4402b278f5344e8dc49e');
INSERT INTO `ipaddrs` VALUES ('4b73b509d8634344ba7f95975879969e', '192.168.0.194-192.168.0.199', '192.168.0.195', '21', '874bef9da03445779cf405ea825b230e');
INSERT INTO `ipaddrs` VALUES ('4bfd345cdf8740a2b9d655b3586d7371', '192.168.0.6-192.168.0.9', '192.168.0.7', '22', '35fddf7948614ce1aa0cc48805a93527');
INSERT INTO `ipaddrs` VALUES ('4cdc6c6672444b0baf16d426dc3455fb', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', '65577a2286ea4402b278f5344e8dc49e');
INSERT INTO `ipaddrs` VALUES ('4cef7d708273433d89f93fdfad275ee1', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', 'b6f7dbe642fe4b53a4bed62edfc56f22');
INSERT INTO `ipaddrs` VALUES ('4d5675f8c93246dca9da2e4cd051951c', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', '9862a587af3440cc9e7f870e43205203');
INSERT INTO `ipaddrs` VALUES ('4df268c350d9440ba739c6d29c8e13cf', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', 'f62d7093594c4df4ba283f55aa1b9fd8');
INSERT INTO `ipaddrs` VALUES ('4e3b6f4a74504d4baf58342f675d7ac2', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', '897387c5d7074386b853ee852973a2c5');
INSERT INTO `ipaddrs` VALUES ('4ec920b4787243798dadcee9ef158c3d', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', '897387c5d7074386b853ee852973a2c5');
INSERT INTO `ipaddrs` VALUES ('4ee448c3b96d4478902c193407a0792b', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', 'f62d7093594c4df4ba283f55aa1b9fd8');
INSERT INTO `ipaddrs` VALUES ('4eeec0a10354457691220dcb7e897af8', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', '4d788f01f2084088910f610c5161369d');
INSERT INTO `ipaddrs` VALUES ('5', '192.168.0.185-192.168.0.190', '192.168.0.189', '23', '333b8b97a06b434097e089810a2601fe');
INSERT INTO `ipaddrs` VALUES ('5032294a1b754c41961e3d77880d475c', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', 'b8f59ef15eb24d1481d71b9a5857c94c');
INSERT INTO `ipaddrs` VALUES ('5064ad505af44745a25b40846d9c6a7a', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', 'ee23c8b1dc2847eaa7c708de577323da');
INSERT INTO `ipaddrs` VALUES ('50852829dd62499f832df7c987258914', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', '5749ad1c0cf2477b86e3299256dea01e');
INSERT INTO `ipaddrs` VALUES ('5111c05545824faa8e079638d5bb3a8a', '192.168.0.185-192.168.0.190', '192.168.0.188', '22', '0aeb3d649f1146ac90f83e5e452b4d1b');
INSERT INTO `ipaddrs` VALUES ('51706d6d30c14abfaa2eaef0570b0366', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', '7d56517974154390a685780e9bb40048');
INSERT INTO `ipaddrs` VALUES ('518dbbff2465476d9a6ae24916525162', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', '67bdcea31d7a46acb0580ac5926d2aab');
INSERT INTO `ipaddrs` VALUES ('524b5aedb7f1497eb0f6a34acbfe6477', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', '65577a2286ea4402b278f5344e8dc49e');
INSERT INTO `ipaddrs` VALUES ('531a3be2e3c248f1a522a6154231c09e', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', '4d788f01f2084088910f610c5161369d');
INSERT INTO `ipaddrs` VALUES ('543ac601bcc14e669c6a0b52f77ac1d4', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', '7d56517974154390a685780e9bb40048');
INSERT INTO `ipaddrs` VALUES ('55c5493527fd42a4b5a4ce84f9a421b0', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', 'f5c7a24b48b14301813294c2a96714a0');
INSERT INTO `ipaddrs` VALUES ('5657126fa192425a98ee6ca644da8f13', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', '3c6cc7bbf2044cff9931491917ffdc1c');
INSERT INTO `ipaddrs` VALUES ('56b3362c365e4a918f795486ad543357', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', '61d94caed483472ba8904603192d026c');
INSERT INTO `ipaddrs` VALUES ('57021de75fd940edba88d9d24bb439fc', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', '85b1adcd86c64cb3818fd6c7f6b5f683');
INSERT INTO `ipaddrs` VALUES ('5787fa320efa4a9a8122f6fd53d8c911', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', '96fc8149eb4442e0977328d5fa757d85');
INSERT INTO `ipaddrs` VALUES ('586bcfacded24bfda092a04c873050ba', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', 'e5307d46bc8446909474a9639743e845');
INSERT INTO `ipaddrs` VALUES ('58a4ff37b1664b77900a7fcc3c427713', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', '2636ad4b856240d3a0af09aa52c7f01a');
INSERT INTO `ipaddrs` VALUES ('58ca84f5568b4d5ab1f450add73cbdd8', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', '30f57ab43420494484ba3f1d3f88d2c1');
INSERT INTO `ipaddrs` VALUES ('592ba8f60b254f688e6516a28fd9e500', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', 'eae6347b21194993b567da51f2d9fee9');
INSERT INTO `ipaddrs` VALUES ('59f68d95988a427da8efd1f9115108fd', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', 'b6f7dbe642fe4b53a4bed62edfc56f22');
INSERT INTO `ipaddrs` VALUES ('5ae50ed883b1465bb1dd076595f04712', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', 'e9f33e1e129d4e65bb1d7a13c986e93a');
INSERT INTO `ipaddrs` VALUES ('5af981e2c2ab4e0cb9c1596d02f9f0df', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', 'e5307d46bc8446909474a9639743e845');
INSERT INTO `ipaddrs` VALUES ('5b17cd81dd3c4462a68ae33f9685c914', '192.168.0.194-192.168.0.199', '192.168.0.197', '21', 'e2037212d5b34cbab0dc13eb1c778151');
INSERT INTO `ipaddrs` VALUES ('5b33fbee941c4d528bee740beb799252', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', 'accd51cddf2d496ca8ee61d6d452c75f');
INSERT INTO `ipaddrs` VALUES ('5c1351d2126140b891a2a87cdaac9976', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', 'accd51cddf2d496ca8ee61d6d452c75f');
INSERT INTO `ipaddrs` VALUES ('5c3a568948d94b7382ddb5ae2a921bdc', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', '1504320ca1bd49a8894c3a8c5d07e7bf');
INSERT INTO `ipaddrs` VALUES ('5c9181fc4cda44a684c465e029edee74', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', 'f63a5ee04fb545aba31940895357fa5a');
INSERT INTO `ipaddrs` VALUES ('5f569fcc456848b293301d9e2cf4a498', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', '30f57ab43420494484ba3f1d3f88d2c1');
INSERT INTO `ipaddrs` VALUES ('5fe2a043b644468db2b3061815a00aa3', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', 'f63a5ee04fb545aba31940895357fa5a');
INSERT INTO `ipaddrs` VALUES ('5ff3e52ce76548148ae15ad5464a1736', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', 'fc88443889954febac1ea384e3b1b049');
INSERT INTO `ipaddrs` VALUES ('6', '192.168.0.185-192.168.0.190', '192.168.0.190', '23', '333b8b97a06b434097e089810a2601fe');
INSERT INTO `ipaddrs` VALUES ('60ebcc1d5c7d44f8b202edb59fcce7e3', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', 'e5307d46bc8446909474a9639743e845');
INSERT INTO `ipaddrs` VALUES ('60f261717db846269582680ec80b74ef', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', '7d56517974154390a685780e9bb40048');
INSERT INTO `ipaddrs` VALUES ('615efb592cb14a7e865e9fec38400421', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', '9e116ba92f334065a2e264be0d06413a');
INSERT INTO `ipaddrs` VALUES ('61610c1faeb44150a48d587f854f8f7e', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', '33a3d3ee93c149c595d23962d9f844da');
INSERT INTO `ipaddrs` VALUES ('61856b8f81614608bf5b1a158c86cff5', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', 'ee23c8b1dc2847eaa7c708de577323da');
INSERT INTO `ipaddrs` VALUES ('62ae596f8e534dccaeb0a7bfdb5a45b6', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', '2636ad4b856240d3a0af09aa52c7f01a');
INSERT INTO `ipaddrs` VALUES ('63639a85fe1247a4a13669669561e356', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', '0e5e131c70d843e1b09af783c5021807');
INSERT INTO `ipaddrs` VALUES ('6397ec3abfdd45489d86ef95009f1434', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', 'f63a5ee04fb545aba31940895357fa5a');
INSERT INTO `ipaddrs` VALUES ('64849afa3ba8481a871b9cdfc0ae45bd', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', 'eae6347b21194993b567da51f2d9fee9');
INSERT INTO `ipaddrs` VALUES ('649b764081c24b888c654017ecf02918', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', '897387c5d7074386b853ee852973a2c5');
INSERT INTO `ipaddrs` VALUES ('651a1f80b1e9451b87966f0fef38d7b4', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', 'f62d7093594c4df4ba283f55aa1b9fd8');
INSERT INTO `ipaddrs` VALUES ('6586d858bee84fdb9e132472b2049abc', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', 'ee23c8b1dc2847eaa7c708de577323da');
INSERT INTO `ipaddrs` VALUES ('68871b8d6fc04facaa6c2e79e934fff4', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', 'fc88443889954febac1ea384e3b1b049');
INSERT INTO `ipaddrs` VALUES ('693dd47285b14d5a9da93c29ab26361e', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', 'ee23c8b1dc2847eaa7c708de577323da');
INSERT INTO `ipaddrs` VALUES ('69ab9717804c4bc4b954174c1d34dd77', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', 'ee23c8b1dc2847eaa7c708de577323da');
INSERT INTO `ipaddrs` VALUES ('6a0fdace92024dda86eabd269bd1e4b3', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', '30f57ab43420494484ba3f1d3f88d2c1');
INSERT INTO `ipaddrs` VALUES ('6a8a87791c1b419e9b13acefe5002f9e', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', 'eae6347b21194993b567da51f2d9fee9');
INSERT INTO `ipaddrs` VALUES ('6ac03b8d21194c8293e6d432869fcdb2', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', 'c776ff51fe2342fea4c4b5375825a398');
INSERT INTO `ipaddrs` VALUES ('6afc58bdc5a140a0baa69aa46c89aae9', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', '4d788f01f2084088910f610c5161369d');
INSERT INTO `ipaddrs` VALUES ('6c13a2332e69464eb4ee017064651553', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', 'f9210810e9194541a8dec75c1138d449');
INSERT INTO `ipaddrs` VALUES ('6c521945303d423a9a0dc3eef42f03c2', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', 'f9210810e9194541a8dec75c1138d449');
INSERT INTO `ipaddrs` VALUES ('6d6abf091b6c44958f97248fb6b88411', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', 'f9210810e9194541a8dec75c1138d449');
INSERT INTO `ipaddrs` VALUES ('6e2fa0200536499facf7b8b98f9692f3', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', 'c776ff51fe2342fea4c4b5375825a398');
INSERT INTO `ipaddrs` VALUES ('6e3fb804a20343d9a013ebb3fb329eb5', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', 'ee23c8b1dc2847eaa7c708de577323da');
INSERT INTO `ipaddrs` VALUES ('6edddc892b674c82ac985efcc09a4f61', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', 'accd51cddf2d496ca8ee61d6d452c75f');
INSERT INTO `ipaddrs` VALUES ('7145e0312c934a52845314a9c9e7d5ef', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', 'eae6347b21194993b567da51f2d9fee9');
INSERT INTO `ipaddrs` VALUES ('71f979ae9dd34941b8d4e08ace126a44', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', '9862a587af3440cc9e7f870e43205203');
INSERT INTO `ipaddrs` VALUES ('72731c25be9d48d094576979a82e0e0c', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', '1504320ca1bd49a8894c3a8c5d07e7bf');
INSERT INTO `ipaddrs` VALUES ('72881c11d04644fcbb2c9a0709067fb3', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', '5749ad1c0cf2477b86e3299256dea01e');
INSERT INTO `ipaddrs` VALUES ('73878409be4b45aaa09775ccf8df33ad', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', 'fc88443889954febac1ea384e3b1b049');
INSERT INTO `ipaddrs` VALUES ('746e72c544a74ae19ee82b26abcaf077', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', 'c776ff51fe2342fea4c4b5375825a398');
INSERT INTO `ipaddrs` VALUES ('748d7aedffe94070ae94c3d4b023418e', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', '33a3d3ee93c149c595d23962d9f844da');
INSERT INTO `ipaddrs` VALUES ('7493272256e843dbb0ba2359c34f3376', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', '0e5e131c70d843e1b09af783c5021807');
INSERT INTO `ipaddrs` VALUES ('7584eaaf8c8a4f78a36b36abc8e07215', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', '3c6cc7bbf2044cff9931491917ffdc1c');
INSERT INTO `ipaddrs` VALUES ('7763571b4e72482983068d0b35e7f4b9', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', '4d788f01f2084088910f610c5161369d');
INSERT INTO `ipaddrs` VALUES ('776a8f4acba34806b9404fdbe61ac289', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', '9862a587af3440cc9e7f870e43205203');
INSERT INTO `ipaddrs` VALUES ('77debf5a8649420c9002443bc37d6c2d', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', '61d94caed483472ba8904603192d026c');
INSERT INTO `ipaddrs` VALUES ('77e9529a22a9422ea3fdbac17ac2ffe1', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', '0e5e131c70d843e1b09af783c5021807');
INSERT INTO `ipaddrs` VALUES ('79707dc9298b45cca13aaa6b40ee06f3', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', 'e3596cdbf61e48578e9bc9fe45625fb0');
INSERT INTO `ipaddrs` VALUES ('79a73ec3ea4f40af85d7ac5bfa877a39', '192.168.0.194-192.168.0.199', '192.168.0.197', '21', '874bef9da03445779cf405ea825b230e');
INSERT INTO `ipaddrs` VALUES ('7aa604c2bb114953b87c8b0c20bb9a19', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', 'e5307d46bc8446909474a9639743e845');
INSERT INTO `ipaddrs` VALUES ('7b776211a882427eaeba2b054341edd2', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', 'b8f59ef15eb24d1481d71b9a5857c94c');
INSERT INTO `ipaddrs` VALUES ('7ba231547da44959905d27f0097962d4', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', '61d94caed483472ba8904603192d026c');
INSERT INTO `ipaddrs` VALUES ('7c1763cb49ba44239886873e0b769a51', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', '4a75bc47aedd44dbb85a8d9e5c28da72');
INSERT INTO `ipaddrs` VALUES ('7c6dbdcf05ac455fb487a3eb45b481de', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', 'e9f33e1e129d4e65bb1d7a13c986e93a');
INSERT INTO `ipaddrs` VALUES ('7cf00e5c5aec4653b354bfe2baba7669', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', 'b6f7dbe642fe4b53a4bed62edfc56f22');
INSERT INTO `ipaddrs` VALUES ('7d3bb754ff2f4397bb7b753969eb7ca8', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', '5749ad1c0cf2477b86e3299256dea01e');
INSERT INTO `ipaddrs` VALUES ('7d6d4ddd4bbe4470931847f1bcff4e2a', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', '33a3d3ee93c149c595d23962d9f844da');
INSERT INTO `ipaddrs` VALUES ('7d7efa09c7d549a7a46a2de3350bc328', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', 'e9f33e1e129d4e65bb1d7a13c986e93a');
INSERT INTO `ipaddrs` VALUES ('7d96840a12de41618b0e9c4044658007', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', '4a75bc47aedd44dbb85a8d9e5c28da72');
INSERT INTO `ipaddrs` VALUES ('7e14ec28d72047c89e7a73d1a2276044', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', 'accd51cddf2d496ca8ee61d6d452c75f');
INSERT INTO `ipaddrs` VALUES ('7f3986c162264c7799f1570bd2b32c49', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', '4a75bc47aedd44dbb85a8d9e5c28da72');
INSERT INTO `ipaddrs` VALUES ('80811e61110c4e05b036ae49b912f91b', '192.168.0.194-192.168.0.199', '192.168.0.197', '21', '8fd3eb48a25641179ce9fa673b74131e');
INSERT INTO `ipaddrs` VALUES ('81d55fa4cf8042a599c70099a1837498', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', '7d56517974154390a685780e9bb40048');
INSERT INTO `ipaddrs` VALUES ('81eb338c05bd488db56ec472e032bf0f', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', 'bb597db0d51c49f1b01ca148d119be1e');
INSERT INTO `ipaddrs` VALUES ('82461c44ae634fb1861690426e8d2fb7', '192.168.0.12-192.168.0.13', '192.168.0.12', '21', '1d1f62c97a374973aed64d91bffa7543');
INSERT INTO `ipaddrs` VALUES ('830537bc0ed84736aba9b5da15b9e8ea', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', '4d788f01f2084088910f610c5161369d');
INSERT INTO `ipaddrs` VALUES ('8307a0ed442441d092a8ee3f5702a81f', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', '7d56517974154390a685780e9bb40048');
INSERT INTO `ipaddrs` VALUES ('83143298592d4c4286cdfa5d56a4a160', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', '0e5e131c70d843e1b09af783c5021807');
INSERT INTO `ipaddrs` VALUES ('83d77d504e124552baa3128a109c8321', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', '3c6cc7bbf2044cff9931491917ffdc1c');
INSERT INTO `ipaddrs` VALUES ('84e54390be9e4cb1b2ca54d7f9f736f2', '192.168.0.66-192.168.0.67', '192.168.0.66', '21', 'f21bdbec55124b80bff8607324a7c166');
INSERT INTO `ipaddrs` VALUES ('86173af6d7384549998377e6d846c909', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', '19003bd23f2b481897df59618979d498');
INSERT INTO `ipaddrs` VALUES ('87334adeb2e341da9b2e88b390bca331', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', '96fc8149eb4442e0977328d5fa757d85');
INSERT INTO `ipaddrs` VALUES ('8a470d41dfe744499cf3f767ab0ec94c', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', '1504320ca1bd49a8894c3a8c5d07e7bf');
INSERT INTO `ipaddrs` VALUES ('8abc8d79956b433d8b26b5ed915e5840', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', '4a75bc47aedd44dbb85a8d9e5c28da72');
INSERT INTO `ipaddrs` VALUES ('8cb9ea09c77d4caea2a14888c561c516', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', '96fc8149eb4442e0977328d5fa757d85');
INSERT INTO `ipaddrs` VALUES ('8cba5854f6bb4af88260d39cb1378bac', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', '5749ad1c0cf2477b86e3299256dea01e');
INSERT INTO `ipaddrs` VALUES ('8dba4466bde34789b4a9a3d802db6f67', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', '9e5bb69322e04e81a77427768e180e49');
INSERT INTO `ipaddrs` VALUES ('8ec34401f2a2484f8839fe12ec6d82e1', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', '7d56517974154390a685780e9bb40048');
INSERT INTO `ipaddrs` VALUES ('8f47b6123310497fbcd033f52edc2624', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', '85b1adcd86c64cb3818fd6c7f6b5f683');
INSERT INTO `ipaddrs` VALUES ('8f5e8a593e104d07aace9b77de857b77', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', '96fc8149eb4442e0977328d5fa757d85');
INSERT INTO `ipaddrs` VALUES ('903a2371323044c3b5dd11c51b0bf89c', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', '4d788f01f2084088910f610c5161369d');
INSERT INTO `ipaddrs` VALUES ('90b89077fd0244bdb89a36578b5af335', '192.168.0.194-192.168.0.199', '192.168.0.194', '21', 'e2037212d5b34cbab0dc13eb1c778151');
INSERT INTO `ipaddrs` VALUES ('90f1908e31ae404e8ab08962781c6192', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', 'f5c7a24b48b14301813294c2a96714a0');
INSERT INTO `ipaddrs` VALUES ('91712854039d419395814d753b6883ab', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', 'bb597db0d51c49f1b01ca148d119be1e');
INSERT INTO `ipaddrs` VALUES ('91ae001d642d4f9c906122c29b240fa4', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', '1504320ca1bd49a8894c3a8c5d07e7bf');
INSERT INTO `ipaddrs` VALUES ('92be2226743f46d59b81b501733a7beb', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', 'ee23c8b1dc2847eaa7c708de577323da');
INSERT INTO `ipaddrs` VALUES ('948e6c3c7d014cfa97c7774437e2ec4e', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', '5749ad1c0cf2477b86e3299256dea01e');
INSERT INTO `ipaddrs` VALUES ('94da723f5bff4b0a9c6a6036948ae353', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', '8a5c862c962746c0bb5fb7b904a4cd84');
INSERT INTO `ipaddrs` VALUES ('9555d4f1c0d24379bcb4ac02dea605bb', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', '9e116ba92f334065a2e264be0d06413a');
INSERT INTO `ipaddrs` VALUES ('95f298c651764507b3622bbc98139db6', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', 'f63a5ee04fb545aba31940895357fa5a');
INSERT INTO `ipaddrs` VALUES ('96c59bacfda945d7b35fcef74edd5cf4', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', '9e5bb69322e04e81a77427768e180e49');
INSERT INTO `ipaddrs` VALUES ('9809195ba38c4340963739a5babc3730', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', '897387c5d7074386b853ee852973a2c5');
INSERT INTO `ipaddrs` VALUES ('982a55a4859c44a0b11ca99653fb5a3f', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', '0e5e131c70d843e1b09af783c5021807');
INSERT INTO `ipaddrs` VALUES ('98fd0f0d0c37462ab48fefc350da60e9', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', 'eae6347b21194993b567da51f2d9fee9');
INSERT INTO `ipaddrs` VALUES ('995521c304b24fc1a92644029fcacb1f', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', '9862a587af3440cc9e7f870e43205203');
INSERT INTO `ipaddrs` VALUES ('996a4ddbaa68422f961de1de0120df94', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', 'f5c7a24b48b14301813294c2a96714a0');
INSERT INTO `ipaddrs` VALUES ('9980a49cac374154b5e69303c1bb3256', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', 'ee23c8b1dc2847eaa7c708de577323da');
INSERT INTO `ipaddrs` VALUES ('99d1a58a610e4efdadff7b0ba8bacbac', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', '897387c5d7074386b853ee852973a2c5');
INSERT INTO `ipaddrs` VALUES ('9a1e2d4baa6d48a591fa0ed66a76f47e', '192.168.0.194-192.168.0.199', '192.168.0.194', '21', '874bef9da03445779cf405ea825b230e');
INSERT INTO `ipaddrs` VALUES ('9a792eba273c4638b61906b028cf627d', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', 'bb597db0d51c49f1b01ca148d119be1e');
INSERT INTO `ipaddrs` VALUES ('9afc286866934d5b9817bab2200f780c', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', '3c6cc7bbf2044cff9931491917ffdc1c');
INSERT INTO `ipaddrs` VALUES ('9dd8bcc9667b4eb6bacaa19d621ccd37', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', 'f9210810e9194541a8dec75c1138d449');
INSERT INTO `ipaddrs` VALUES ('9df734cf074949d78d6286b5f54e0b0e', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', '0e5e131c70d843e1b09af783c5021807');
INSERT INTO `ipaddrs` VALUES ('9e73da40a28f47e3b723fca052b9ab13', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', '19003bd23f2b481897df59618979d498');
INSERT INTO `ipaddrs` VALUES ('9f20bbd043924427ac3179f6a0367c9e', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', 'e3596cdbf61e48578e9bc9fe45625fb0');
INSERT INTO `ipaddrs` VALUES ('a064c697b5d646538817b4706b677c28', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', '4d788f01f2084088910f610c5161369d');
INSERT INTO `ipaddrs` VALUES ('a09aaa7b26c24040bcea58c91e119131', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', 'e9f33e1e129d4e65bb1d7a13c986e93a');
INSERT INTO `ipaddrs` VALUES ('a17b873fd09c4e03b1d9208dc6698160', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', '8a5c862c962746c0bb5fb7b904a4cd84');
INSERT INTO `ipaddrs` VALUES ('a2621e294dfa4a7fa5bdcddee6681eb4', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', '897387c5d7074386b853ee852973a2c5');
INSERT INTO `ipaddrs` VALUES ('a31b11ceb551481d93d7df26baad83a2', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', 'fc88443889954febac1ea384e3b1b049');
INSERT INTO `ipaddrs` VALUES ('a37ebdb21d0143e299897f8cd3ddf21e', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', 'c776ff51fe2342fea4c4b5375825a398');
INSERT INTO `ipaddrs` VALUES ('a403f641a4304cbbaee0802c4ee87840', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', 'b8f59ef15eb24d1481d71b9a5857c94c');
INSERT INTO `ipaddrs` VALUES ('a405025a9a734611b1aaeb24e23b3aa5', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', 'e9f33e1e129d4e65bb1d7a13c986e93a');
INSERT INTO `ipaddrs` VALUES ('a42a09efe97f4b6d8d674d4be48388c2', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', 'accd51cddf2d496ca8ee61d6d452c75f');
INSERT INTO `ipaddrs` VALUES ('a4598c707f2647fd8e638d508068a56d', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', '67bdcea31d7a46acb0580ac5926d2aab');
INSERT INTO `ipaddrs` VALUES ('a56b1f0fbcf34e1b86ebf44ee23c08bb', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', 'e5307d46bc8446909474a9639743e845');
INSERT INTO `ipaddrs` VALUES ('a681c79c79034237a0ac8eef30971835', '192.168.0.194-192.168.0.199', '192.168.0.198', '21', '874bef9da03445779cf405ea825b230e');
INSERT INTO `ipaddrs` VALUES ('a6aa6faa57f54d28a4cfd9b529665009', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', 'f5c7a24b48b14301813294c2a96714a0');
INSERT INTO `ipaddrs` VALUES ('a6bf9ea136234cb588fc232fbe795a69', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', 'fc88443889954febac1ea384e3b1b049');
INSERT INTO `ipaddrs` VALUES ('a7676409f0694a55a7ece4420b5d98ea', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', '8a5c862c962746c0bb5fb7b904a4cd84');
INSERT INTO `ipaddrs` VALUES ('a794f291e7ba4e49812fcffa82893bb6', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', 'f9210810e9194541a8dec75c1138d449');
INSERT INTO `ipaddrs` VALUES ('a9f308637c994446af060dc1cce90015', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', '30f57ab43420494484ba3f1d3f88d2c1');
INSERT INTO `ipaddrs` VALUES ('aa3c3f4db99b4d109147cf09b0e9b435', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', '897387c5d7074386b853ee852973a2c5');
INSERT INTO `ipaddrs` VALUES ('aa54127e11414e0a8262ce20e8a39314', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', '2636ad4b856240d3a0af09aa52c7f01a');
INSERT INTO `ipaddrs` VALUES ('aab02546d91f4d8696ba4c00f7ab2e3b', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', 'e3596cdbf61e48578e9bc9fe45625fb0');
INSERT INTO `ipaddrs` VALUES ('ab0d084ed5104e3b8d4130029f49ef90', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', '33a3d3ee93c149c595d23962d9f844da');
INSERT INTO `ipaddrs` VALUES ('ac561b54d7d74dc198d0f6f3fc378bdd', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', 'b8f59ef15eb24d1481d71b9a5857c94c');
INSERT INTO `ipaddrs` VALUES ('acb3c66a272244a69f631e5200c4136e', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', 'bb597db0d51c49f1b01ca148d119be1e');
INSERT INTO `ipaddrs` VALUES ('acba1358536947a7bc404dd2ceed2474', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', '8a5c862c962746c0bb5fb7b904a4cd84');
INSERT INTO `ipaddrs` VALUES ('ad474a14fa384d07b841ab9b9817b5f6', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', '9862a587af3440cc9e7f870e43205203');
INSERT INTO `ipaddrs` VALUES ('adcae00e21914e4593ee4354d18be0c9', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', '2636ad4b856240d3a0af09aa52c7f01a');
INSERT INTO `ipaddrs` VALUES ('ae10211bb8ee44a39d172f5863d986c2', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', 'fc88443889954febac1ea384e3b1b049');
INSERT INTO `ipaddrs` VALUES ('ae1df3f230924b6783c16cf1ae807d66', '192.168.0.194-192.168.0.199', '192.168.0.196', '21', '874bef9da03445779cf405ea825b230e');
INSERT INTO `ipaddrs` VALUES ('af372d9d414d47ce8ee200f8d7b8204e', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', '9e116ba92f334065a2e264be0d06413a');
INSERT INTO `ipaddrs` VALUES ('b01b60cb82a3458da5634b042a81ee66', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', 'e9f33e1e129d4e65bb1d7a13c986e93a');
INSERT INTO `ipaddrs` VALUES ('b0a5950665cb492a8f13e693ff09baa0', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', '19003bd23f2b481897df59618979d498');
INSERT INTO `ipaddrs` VALUES ('b0f33851123d44f68d89f063f6af9793', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', '8a5c862c962746c0bb5fb7b904a4cd84');
INSERT INTO `ipaddrs` VALUES ('b1b7d1a88ebd4d23b41a785c4af0a629', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', '1504320ca1bd49a8894c3a8c5d07e7bf');
INSERT INTO `ipaddrs` VALUES ('b32c8486a61b4b9a8fb19753ca94337d', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', '85b1adcd86c64cb3818fd6c7f6b5f683');
INSERT INTO `ipaddrs` VALUES ('b3f411ff4b224a4aa33b861d59b1115f', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', 'eae6347b21194993b567da51f2d9fee9');
INSERT INTO `ipaddrs` VALUES ('b44c89b262fd48ccb9ed5f592ca12e4f', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', '96fc8149eb4442e0977328d5fa757d85');
INSERT INTO `ipaddrs` VALUES ('b456d1bc0d00434ebc14b6d28d366782', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', 'accd51cddf2d496ca8ee61d6d452c75f');
INSERT INTO `ipaddrs` VALUES ('b531acda13744a4992bc006975fd9768', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', 'e5307d46bc8446909474a9639743e845');
INSERT INTO `ipaddrs` VALUES ('b59d62d8689241208bc84d4c24b42170', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', 'ee23c8b1dc2847eaa7c708de577323da');
INSERT INTO `ipaddrs` VALUES ('b6d19950e07b4c7d9f93c341ac128e19', '192.168.0.6-192.168.0.9', '192.168.0.6', '23', '35fddf7948614ce1aa0cc48805a93527');
INSERT INTO `ipaddrs` VALUES ('b7444d2cd41048809ec3daa27fb18af0', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', 'b8f59ef15eb24d1481d71b9a5857c94c');
INSERT INTO `ipaddrs` VALUES ('b7474e33695545429917514c9c8f8988', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', 'eae6347b21194993b567da51f2d9fee9');
INSERT INTO `ipaddrs` VALUES ('b751fcbbbda842c8b7a08f6efe00980c', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', '96fc8149eb4442e0977328d5fa757d85');
INSERT INTO `ipaddrs` VALUES ('b768816a2b754375a60e20ccaf3df857', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', 'f62d7093594c4df4ba283f55aa1b9fd8');
INSERT INTO `ipaddrs` VALUES ('b79e5a3c52a24dbbb06d6b007dd012cb', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', 'accd51cddf2d496ca8ee61d6d452c75f');
INSERT INTO `ipaddrs` VALUES ('b875d070c15344afa74c43af549c86dc', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', '5749ad1c0cf2477b86e3299256dea01e');
INSERT INTO `ipaddrs` VALUES ('b988a6609b454badb408fdbcae0fe8f2', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', 'b6f7dbe642fe4b53a4bed62edfc56f22');
INSERT INTO `ipaddrs` VALUES ('b99a75f38ea54d819719e6dbae36dc32', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', '3c6cc7bbf2044cff9931491917ffdc1c');
INSERT INTO `ipaddrs` VALUES ('ba0d6ac0443048099bd420fe23803b0e', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', '85b1adcd86c64cb3818fd6c7f6b5f683');
INSERT INTO `ipaddrs` VALUES ('bb5b5570caba4d748a394d0ccb55f164', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', '33a3d3ee93c149c595d23962d9f844da');
INSERT INTO `ipaddrs` VALUES ('bb5fec4918c04b03b8ad5ff557ab6e09', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', 'e3596cdbf61e48578e9bc9fe45625fb0');
INSERT INTO `ipaddrs` VALUES ('bc28c98960ec4a3e990143f97167f9bb', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', '4a75bc47aedd44dbb85a8d9e5c28da72');
INSERT INTO `ipaddrs` VALUES ('bdda56621b154136a47e9f84b3a1e6c6', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', 'f9210810e9194541a8dec75c1138d449');
INSERT INTO `ipaddrs` VALUES ('be13baaeb67d4baabf549aa282e44bd3', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', 'accd51cddf2d496ca8ee61d6d452c75f');
INSERT INTO `ipaddrs` VALUES ('be989a38cb0a4d5082ed48f9dd754d57', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', '9862a587af3440cc9e7f870e43205203');
INSERT INTO `ipaddrs` VALUES ('bf08a14ab93c4b6c84ed1c00925a2f91', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', '67bdcea31d7a46acb0580ac5926d2aab');
INSERT INTO `ipaddrs` VALUES ('c1164c0597214511904dd55490d83cae', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', '67bdcea31d7a46acb0580ac5926d2aab');
INSERT INTO `ipaddrs` VALUES ('c16491f59f0e46cda9a6aca2675f4b50', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', '67bdcea31d7a46acb0580ac5926d2aab');
INSERT INTO `ipaddrs` VALUES ('c17c369bee3d4f42a83db251f5dc52be', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', 'e3596cdbf61e48578e9bc9fe45625fb0');
INSERT INTO `ipaddrs` VALUES ('c1e3d1c5e35d43eea933acbe2ec48381', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', '96fc8149eb4442e0977328d5fa757d85');
INSERT INTO `ipaddrs` VALUES ('c1f216d804e14aec92fe49e4c91ce49b', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', 'c776ff51fe2342fea4c4b5375825a398');
INSERT INTO `ipaddrs` VALUES ('c261d3c203864e7899b3cace10d083ab', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', 'b6f7dbe642fe4b53a4bed62edfc56f22');
INSERT INTO `ipaddrs` VALUES ('c2b8368bc44643d3bf4248c2454991ef', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', '8a5c862c962746c0bb5fb7b904a4cd84');
INSERT INTO `ipaddrs` VALUES ('c345d34da060408f979bb9f0ee0cf573', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', 'e3596cdbf61e48578e9bc9fe45625fb0');
INSERT INTO `ipaddrs` VALUES ('c3809c573f904facbd8b9f078cd589a5', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', 'e5307d46bc8446909474a9639743e845');
INSERT INTO `ipaddrs` VALUES ('c413eb95370e4703913be80a1bf7a1e3', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', '85b1adcd86c64cb3818fd6c7f6b5f683');
INSERT INTO `ipaddrs` VALUES ('c509175f7e954ca6ac3fb12a1a4bbe6c', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', '30f57ab43420494484ba3f1d3f88d2c1');
INSERT INTO `ipaddrs` VALUES ('c543b5d88c9c4a8da1808c0cb7005cd3', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', '9e116ba92f334065a2e264be0d06413a');
INSERT INTO `ipaddrs` VALUES ('c58a88c7476945cb9efa6a5fac16c05d', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', 'f63a5ee04fb545aba31940895357fa5a');
INSERT INTO `ipaddrs` VALUES ('c5dd532ea3bc4c3f8015fd9660b8c33d', '192.168.0.66-192.168.0.67', '192.168.0.67', '21', 'f21bdbec55124b80bff8607324a7c166');
INSERT INTO `ipaddrs` VALUES ('c68f9e8ee1404df1927bae37749f832b', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', 'e5307d46bc8446909474a9639743e845');
INSERT INTO `ipaddrs` VALUES ('c6946daec5c64dc49afe1d6dd6426a83', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', 'b8f59ef15eb24d1481d71b9a5857c94c');
INSERT INTO `ipaddrs` VALUES ('c800b713be0645f880fa5583a6cb70dc', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', '2636ad4b856240d3a0af09aa52c7f01a');
INSERT INTO `ipaddrs` VALUES ('c806eda8b2eb4137bf0019b318dcc4d3', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', 'f9210810e9194541a8dec75c1138d449');
INSERT INTO `ipaddrs` VALUES ('c93b526d9eb14a2885e0bba041fa6d4f', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', '9e5bb69322e04e81a77427768e180e49');
INSERT INTO `ipaddrs` VALUES ('ca6724ba329547eeb3f3c7542bcbff2f', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', '65577a2286ea4402b278f5344e8dc49e');
INSERT INTO `ipaddrs` VALUES ('caaf3deed55b4341b88d9f9bbc8c1670', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', '4d788f01f2084088910f610c5161369d');
INSERT INTO `ipaddrs` VALUES ('cbbea630f8bd4b709dd6e09bdc7d0e99', '192.168.0.185-192.168.0.190', '192.168.0.187', '21', '0aeb3d649f1146ac90f83e5e452b4d1b');
INSERT INTO `ipaddrs` VALUES ('cc54814718644c1fb0b0cac1cefd1362', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', 'f62d7093594c4df4ba283f55aa1b9fd8');
INSERT INTO `ipaddrs` VALUES ('cc6bda4d5a794a2c83f6a7bba4ff1bcb', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', 'f9210810e9194541a8dec75c1138d449');
INSERT INTO `ipaddrs` VALUES ('cd17eacfec8d414488e4769babd4a600', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', 'bb597db0d51c49f1b01ca148d119be1e');
INSERT INTO `ipaddrs` VALUES ('cd90f48e5778447892e2a8e11deae7d5', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', '19003bd23f2b481897df59618979d498');
INSERT INTO `ipaddrs` VALUES ('cda269e911b44038b15bd3462eb5a855', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', '5749ad1c0cf2477b86e3299256dea01e');
INSERT INTO `ipaddrs` VALUES ('cdcc3d79c63b426294675852f933a9b9', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', '9e5bb69322e04e81a77427768e180e49');
INSERT INTO `ipaddrs` VALUES ('ce5f367a78174cd0ae7796323bf1a10f', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', 'e3596cdbf61e48578e9bc9fe45625fb0');
INSERT INTO `ipaddrs` VALUES ('d048d1c9d5094ff5843d0d28be8bd030', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', 'f62d7093594c4df4ba283f55aa1b9fd8');
INSERT INTO `ipaddrs` VALUES ('d060591d6fab46cfbf7f16f371f6359e', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', '3c6cc7bbf2044cff9931491917ffdc1c');
INSERT INTO `ipaddrs` VALUES ('d0766dd708f1423098de98a64f73a7b2', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', '4a75bc47aedd44dbb85a8d9e5c28da72');
INSERT INTO `ipaddrs` VALUES ('d08009aef9d44ae684fb17ddbf6bacc9', '192.168.0.185-192.168.0.190', '192.168.0.189', '23', '0aeb3d649f1146ac90f83e5e452b4d1b');
INSERT INTO `ipaddrs` VALUES ('d0947d8cc92f4dc7a3347d02e50c03f1', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', '19003bd23f2b481897df59618979d498');
INSERT INTO `ipaddrs` VALUES ('d18ac813179948a29a5c89bbfa796e75', '192.168.0.110-192.168.0.120', '192.168.0.119', '21', 'eae6347b21194993b567da51f2d9fee9');
INSERT INTO `ipaddrs` VALUES ('d18edcfa842441018d0d21d447f64283', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', 'e5307d46bc8446909474a9639743e845');
INSERT INTO `ipaddrs` VALUES ('d1b50cde963c4019abed215075822765', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', '9862a587af3440cc9e7f870e43205203');
INSERT INTO `ipaddrs` VALUES ('d48a031460ab4cd3ae71d1e10880f443', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', '0e5e131c70d843e1b09af783c5021807');
INSERT INTO `ipaddrs` VALUES ('d4b170a9bf374a17b4c9255b8b92fab4', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', '9e116ba92f334065a2e264be0d06413a');
INSERT INTO `ipaddrs` VALUES ('d51e92e3b26e4195bc035a04e5e0370b', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', '61d94caed483472ba8904603192d026c');
INSERT INTO `ipaddrs` VALUES ('d6e48777ccee4b0687eb49853c11148f', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', 'bb597db0d51c49f1b01ca148d119be1e');
INSERT INTO `ipaddrs` VALUES ('d75002dcb54746f9aabfbf91dd22db22', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', '8a5c862c962746c0bb5fb7b904a4cd84');
INSERT INTO `ipaddrs` VALUES ('d8b3e6433f1849aaaab7ad929b30f5ab', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', 'b8f59ef15eb24d1481d71b9a5857c94c');
INSERT INTO `ipaddrs` VALUES ('d8b956795584440a82dd94f8686add04', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', '9e5bb69322e04e81a77427768e180e49');
INSERT INTO `ipaddrs` VALUES ('d9a096246ee444dda86e429ddcf75d9a', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', 'f63a5ee04fb545aba31940895357fa5a');
INSERT INTO `ipaddrs` VALUES ('da94f6c885cd4cb6add68b099955e5ce', '192.168.0.194-192.168.0.199', '192.168.0.195', '21', '8fd3eb48a25641179ce9fa673b74131e');
INSERT INTO `ipaddrs` VALUES ('dac9b892ff914d14b5cdfe8970c8bc14', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', 'f5c7a24b48b14301813294c2a96714a0');
INSERT INTO `ipaddrs` VALUES ('dbdbeecf57014804abe40ce8b28f77c9', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', '65577a2286ea4402b278f5344e8dc49e');
INSERT INTO `ipaddrs` VALUES ('dc367abf984e4230af4dd1ba750cdc4b', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', '65577a2286ea4402b278f5344e8dc49e');
INSERT INTO `ipaddrs` VALUES ('dcb3ca9a659b4ffa8f8c028ce6514f34', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', '33a3d3ee93c149c595d23962d9f844da');
INSERT INTO `ipaddrs` VALUES ('ddfd4985dce9483f939fe72021623fd5', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', '33a3d3ee93c149c595d23962d9f844da');
INSERT INTO `ipaddrs` VALUES ('de43af1936e94a72a15b1b9cc9cea9ee', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', 'fc88443889954febac1ea384e3b1b049');
INSERT INTO `ipaddrs` VALUES ('df5eb6c2865e464ea9c05dbeccaefab0', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', '7d56517974154390a685780e9bb40048');
INSERT INTO `ipaddrs` VALUES ('e1a290b3668c43deaffb336067c968b8', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', '9e5bb69322e04e81a77427768e180e49');
INSERT INTO `ipaddrs` VALUES ('e1cc758d88084211b6740cb2442c6359', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', '5749ad1c0cf2477b86e3299256dea01e');
INSERT INTO `ipaddrs` VALUES ('e1fbb32ef8804f8c83288d5ca627182a', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', '1504320ca1bd49a8894c3a8c5d07e7bf');
INSERT INTO `ipaddrs` VALUES ('e20fdc19f2dc4e1998ed50fef4117ce3', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', 'eae6347b21194993b567da51f2d9fee9');
INSERT INTO `ipaddrs` VALUES ('e2b38e01254a4c22b553c420fd5921ba', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', 'f5c7a24b48b14301813294c2a96714a0');
INSERT INTO `ipaddrs` VALUES ('e2b8bcf44af94ad691abe337dffbdc7a', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', 'c776ff51fe2342fea4c4b5375825a398');
INSERT INTO `ipaddrs` VALUES ('e2c37941d078448294acfa435569ae6c', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', 'f9210810e9194541a8dec75c1138d449');
INSERT INTO `ipaddrs` VALUES ('e3251e41cc6d46d7b2a8ba04681315ce', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', 'e5307d46bc8446909474a9639743e845');
INSERT INTO `ipaddrs` VALUES ('e3f1075a5ca242a6a25701b0be03d219', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', '30f57ab43420494484ba3f1d3f88d2c1');
INSERT INTO `ipaddrs` VALUES ('e45793bcb40c4919b9aa120e907f41c0', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', '9862a587af3440cc9e7f870e43205203');
INSERT INTO `ipaddrs` VALUES ('e4b5ed295c73440a927666ec79cc4676', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', '9e5bb69322e04e81a77427768e180e49');
INSERT INTO `ipaddrs` VALUES ('e4df9e1005544287904a0fc841186c95', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', '85b1adcd86c64cb3818fd6c7f6b5f683');
INSERT INTO `ipaddrs` VALUES ('e5732d390790421890d2191e1ea26956', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', 'b8f59ef15eb24d1481d71b9a5857c94c');
INSERT INTO `ipaddrs` VALUES ('e5a1aed802fd41389adad825ce4aa5b5', '192.168.0.185-192.168.0.190', '192.168.0.190', '23', '0aeb3d649f1146ac90f83e5e452b4d1b');
INSERT INTO `ipaddrs` VALUES ('e6534e6e036046c0b19fcb00bbebf6af', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', '19003bd23f2b481897df59618979d498');
INSERT INTO `ipaddrs` VALUES ('e7c0ce4f84aa42a18159e63c4f22b808', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', '4a75bc47aedd44dbb85a8d9e5c28da72');
INSERT INTO `ipaddrs` VALUES ('e869815808b94a5ba68e46f8e18a69c7', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', '19003bd23f2b481897df59618979d498');
INSERT INTO `ipaddrs` VALUES ('e97268fb0eb748dc96416babdee14cb4', '192.168.0.194-192.168.0.199', '192.168.0.198', '21', '8fd3eb48a25641179ce9fa673b74131e');
INSERT INTO `ipaddrs` VALUES ('e98045dc9a4749cbbb6a74e08642506f', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', '7d56517974154390a685780e9bb40048');
INSERT INTO `ipaddrs` VALUES ('e9aa1766434944cca6a9ac02698b74b6', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', 'f62d7093594c4df4ba283f55aa1b9fd8');
INSERT INTO `ipaddrs` VALUES ('e9d416f2bcc64bda84ab989d2d830931', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', 'b8f59ef15eb24d1481d71b9a5857c94c');
INSERT INTO `ipaddrs` VALUES ('eab2fd63e05d44cf99dcf246f5344e3b', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', '1504320ca1bd49a8894c3a8c5d07e7bf');
INSERT INTO `ipaddrs` VALUES ('ec63a7c2737f4cc099f115ae8f9fda7f', '192.168.0.185-192.168.0.190', '192.168.0.185', '21', '0aeb3d649f1146ac90f83e5e452b4d1b');
INSERT INTO `ipaddrs` VALUES ('ecb24b8cd28a455fa7be06b0e363e7a3', '192.168.0.194-192.168.0.199', '192.168.0.196', '21', 'e2037212d5b34cbab0dc13eb1c778151');
INSERT INTO `ipaddrs` VALUES ('ed861c22764a4d32a0f81b1335107d99', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', '96fc8149eb4442e0977328d5fa757d85');
INSERT INTO `ipaddrs` VALUES ('f0437d53d15a46e59ad904513accbf34', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', '4d788f01f2084088910f610c5161369d');
INSERT INTO `ipaddrs` VALUES ('f08431df3c524c6ba27067e7c4cc2450', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', '9862a587af3440cc9e7f870e43205203');
INSERT INTO `ipaddrs` VALUES ('f19e5e1abbbf41cfaf69e6866b240357', '192.168.0.194-192.168.0.199', '192.168.0.199', '21', 'e2037212d5b34cbab0dc13eb1c778151');
INSERT INTO `ipaddrs` VALUES ('f2294e6cadb74f839d5c58dfe774578a', '192.168.0.194-192.168.0.199', '192.168.0.195', '21', 'e2037212d5b34cbab0dc13eb1c778151');
INSERT INTO `ipaddrs` VALUES ('f2b661879c924cd68060cc68f42d276a', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', 'e3596cdbf61e48578e9bc9fe45625fb0');
INSERT INTO `ipaddrs` VALUES ('f2d7c2a7f90b4176a495a8224512c803', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', '0e5e131c70d843e1b09af783c5021807');
INSERT INTO `ipaddrs` VALUES ('f3566dd016ba42edb668caed0e5d34c9', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', '61d94caed483472ba8904603192d026c');
INSERT INTO `ipaddrs` VALUES ('f3adfbd6dfdc4036903bb82a849e9006', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', 'ee23c8b1dc2847eaa7c708de577323da');
INSERT INTO `ipaddrs` VALUES ('f426d7f76c884ed28165cc0c05efb2cc', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', 'f5c7a24b48b14301813294c2a96714a0');
INSERT INTO `ipaddrs` VALUES ('f5628e5bece642fc86de01d22aeb5856', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', 'f63a5ee04fb545aba31940895357fa5a');
INSERT INTO `ipaddrs` VALUES ('f5a0f5b7b3c34ea0818096e0090e3396', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', '85b1adcd86c64cb3818fd6c7f6b5f683');
INSERT INTO `ipaddrs` VALUES ('f5a785fbf9bd4961a1780a814c8d6b6c', '192.168.0.110-192.168.0.120', '192.168.0.110', '21', '7d56517974154390a685780e9bb40048');
INSERT INTO `ipaddrs` VALUES ('f5e1d2223eba444299297926c6847d6c', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', 'e9f33e1e129d4e65bb1d7a13c986e93a');
INSERT INTO `ipaddrs` VALUES ('f70b34f4feb0422aab2aafb808c3d4a1', '192.168.0.194-192.168.0.199', '192.168.0.199', '21', '874bef9da03445779cf405ea825b230e');
INSERT INTO `ipaddrs` VALUES ('f762b9ac3dd041fa9ff7039cca2e1429', '192.168.0.110-192.168.0.120', '192.168.0.113', '21', '8a5c862c962746c0bb5fb7b904a4cd84');
INSERT INTO `ipaddrs` VALUES ('f798361d7f354f919fa0b57df3dad0b2', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', '3c6cc7bbf2044cff9931491917ffdc1c');
INSERT INTO `ipaddrs` VALUES ('f912b4cdef224affaeac0ac8f818a9c1', '192.168.0.110-192.168.0.120', '192.168.0.112', '21', 'c776ff51fe2342fea4c4b5375825a398');
INSERT INTO `ipaddrs` VALUES ('fa96a47206b440d8948ab6365f516e41', '192.168.0.6-192.168.0.9', '192.168.0.8', '24', '35fddf7948614ce1aa0cc48805a93527');
INSERT INTO `ipaddrs` VALUES ('fabdb3b165f248f497fc5a9aad6a5a31', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', '19003bd23f2b481897df59618979d498');
INSERT INTO `ipaddrs` VALUES ('fb1a66d790a94128962614d5d2f7a196', '192.168.0.110-192.168.0.120', '192.168.0.118', '21', '33a3d3ee93c149c595d23962d9f844da');
INSERT INTO `ipaddrs` VALUES ('fb8fccf02edf4051a977f0b1178edce4', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', '1504320ca1bd49a8894c3a8c5d07e7bf');
INSERT INTO `ipaddrs` VALUES ('fbaa8145883e4b2b8ed776218f11dcb4', '192.168.0.110-192.168.0.120', '192.168.0.111', '21', '0e5e131c70d843e1b09af783c5021807');
INSERT INTO `ipaddrs` VALUES ('fd9843a71ed84f389e70644a60f27489', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', 'f9210810e9194541a8dec75c1138d449');
INSERT INTO `ipaddrs` VALUES ('fe2831e7ecd14061beeb5dcdf205e14d', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', 'c776ff51fe2342fea4c4b5375825a398');
INSERT INTO `ipaddrs` VALUES ('fe58c0d88b7f48eca7e8433fcef2708a', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', '0e5e131c70d843e1b09af783c5021807');
INSERT INTO `ipaddrs` VALUES ('fe93ded7333641aabc5cf89cca535bf1', '192.168.0.110-192.168.0.120', '192.168.0.115', '21', 'e9f33e1e129d4e65bb1d7a13c986e93a');
INSERT INTO `ipaddrs` VALUES ('fea1d55978fd4569b7f8d1f96ec22e3e', '192.168.0.110-192.168.0.120', '192.168.0.120', '21', '9e116ba92f334065a2e264be0d06413a');
INSERT INTO `ipaddrs` VALUES ('fec126f7fedd4d05b132b683e059843b', '192.168.0.110-192.168.0.120', '192.168.0.114', '21', 'b6f7dbe642fe4b53a4bed62edfc56f22');
INSERT INTO `ipaddrs` VALUES ('ff6fdc2b0a644053aca99efd62177a9e', '192.168.0.110-192.168.0.120', '192.168.0.117', '21', '9862a587af3440cc9e7f870e43205203');
INSERT INTO `ipaddrs` VALUES ('ffdb731595fa488d9dee3e95bed16ca9', '192.168.0.110-192.168.0.120', '192.168.0.116', '21', 'bb597db0d51c49f1b01ca148d119be1e');

-- ----------------------------
-- Table structure for modules
-- ----------------------------
DROP TABLE IF EXISTS `modules`;
CREATE TABLE `modules` (
  `uuid` varchar(32) NOT NULL,
  `module_name` varchar(45) DEFAULT NULL,
  `module_desc` varchar(45) DEFAULT NULL,
  `module_type_uuid` varchar(32) DEFAULT NULL,
  `os_template_type_uuid` varchar(32) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `app_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of modules
-- ----------------------------
INSERT INTO `modules` VALUES ('04cafee8817d4ef086f3b1cd184b8d4f', 'jboss', 'jboss', '53', '44', 'error.txt', 'http://localhost:9090/ops_gui/#/app/application_add');
INSERT INTO `modules` VALUES ('3fe308b65efd4d59a6d3b88c8d48244c', 'sys_httpd', 'sys_httpd', '52', '41', 'sys_httpd.tgz', 'http://ad.funshion.org.cn/u/index.html?s=10001&w=300&h=250&pvid=1468067759859_953350095');
INSERT INTO `modules` VALUES ('41a0a3a6783e4cbb9e251621ccd27a4e', 'SSH服务', 'SSH服务', '52', '47', 'SSH服务.sh', 'www.baidu.com');
INSERT INTO `modules` VALUES ('87f521f4df1f4f7f8caab3b4a39e216e', '内核参数', '内核参数', '51', '47', '内核参数.sh', 'www.baidu.com');
INSERT INTO `modules` VALUES ('a4441522b3ba4546837646e5df57f8ed', 'sys_ftpd', 'sys_ftpd', '52', '41', 'sys_ftpd.tgz', 'http://ad.funshion.org.cn/u/index.html?s=10001&w=300&h=250&pvid=1468067759859_953350095');
INSERT INTO `modules` VALUES ('a48aaaba23e3455c85661c0f54514ab9', 'os_tuning', 'os_tuning', '51', '41', 'os_tuning.tgz', 'http://ad.funshion.org.cn/u/index.html?s=10001&w=300&h=250&pvid=1468067759859_953350095');
INSERT INTO `modules` VALUES ('a739c2fc72a043a38d704a66dc5039fa', 'Tomcat', 'Tomcat', '53', '47', 'Tomcat.sh', 'www.baidu.com');
INSERT INTO `modules` VALUES ('d86910053f23400d9935bd2bf1fd1999', 'os_security', 'os_security', '51', '41', 'os_security.tgz', 'http://ad.funshion.org.cn/u/index.html?s=10001&w=300&h=250&pvid=1468067759859_953350095');
INSERT INTO `modules` VALUES ('da7513379b4240f7be707e1a6ea680bb', 'JBoss', 'JBoss', '53', '47', 'JBoss.sh', 'www.baidu.com');
INSERT INTO `modules` VALUES ('e12f147bb5c043718b989027af86a7f4', 'app_tomcat', 'app_tomcat', '53', '41', 'app_tomcat.tgz', 'http://ad.funshion.org.cn/u/index.html?s=10001&w=300&h=250&pvid=1468067759859_953350095');

-- ----------------------------
-- Table structure for ostemplate
-- ----------------------------
DROP TABLE IF EXISTS `ostemplate`;
CREATE TABLE `ostemplate` (
  `uuid` varchar(32) NOT NULL,
  `dc_os_template_name` varchar(45) DEFAULT NULL,
  `dc_os_template_disk` varchar(45) DEFAULT NULL,
  `template_name` varchar(45) DEFAULT NULL,
  `template_desc` varchar(45) DEFAULT NULL,
  `os_template_type_uuid` varchar(32) DEFAULT NULL,
  `is_used` tinyint(1) DEFAULT NULL COMMENT '是否被使用\n1是已被使用\n0是未被使用',
  `source_uuid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ostemplate
-- ----------------------------
INSERT INTO `ostemplate` VALUES ('1fd9f904bd0a46bb96e3e4ab7495d05b', '192template', '50', '模版2', '模版描绘', '47', '0', '4adfbe184b2a4062b44bf8829dbe766c');
INSERT INTO `ostemplate` VALUES ('23f42502b4b045f58465bf5b3dd84ad1', '191template', '6', '191', '', '41', '0', '8fd3eb48a25641179ce9fa673b74131e');
INSERT INTO `ostemplate` VALUES ('244212059bc84189943e47ea4ee3d4eb', '191template', '6', 'm1', 'test', '41', '0', '0aeb3d649f1146ac90f83e5e452b4d1b');
INSERT INTO `ostemplate` VALUES ('29fadf647d734f48a4ef7ab5795907c5', 'RHEL66Template', '6', '模板2', '模板2', '41', '0', '333b8b97a06b434097e089810a2601fe');
INSERT INTO `ostemplate` VALUES ('331482a6b4864df0961b967bbbd9b298', '191template', '6', 'ww', 'www', '41', '0', 'f21bdbec55124b80bff8607324a7c166');
INSERT INTO `ostemplate` VALUES ('417e514bafee4b42945fb0284dcb2cee', '191template', '6', '模板1', '模板1', '47', '0', '333b8b97a06b434097e089810a2601fe');
INSERT INTO `ostemplate` VALUES ('5af9aaada53f48e0a6b3bdc7d665220b', 'RHEL66Template', '6', 'pp', 'pppp', '43', '0', 'f21bdbec55124b80bff8607324a7c166');
INSERT INTO `ostemplate` VALUES ('8a6e765ca8c945c7809cd2870297ac27', 'RHEL66Template', '50', '模版1', '模版的描述', '41', '0', '4adfbe184b2a4062b44bf8829dbe766c');
INSERT INTO `ostemplate` VALUES ('aad1fa2f9ab54bd29077b6312d042ea8', 'RHEL66Template', '6', 'mmm', 'mmm', '42', '0', '1d1f62c97a374973aed64d91bffa7543');
INSERT INTO `ostemplate` VALUES ('d38ed46a23104469af91d77bd93de730', 'RHEL66Template', '6', '192', '', '42', '0', '8fd3eb48a25641179ce9fa673b74131e');
INSERT INTO `ostemplate` VALUES ('d7def83241134d6fb18c59d7052cc287', '191template', '6', 'mm', 'mm', '42', '0', '1d1f62c97a374973aed64d91bffa7543');
INSERT INTO `ostemplate` VALUES ('fade8af499e447d8ae669b65d895e482', 'RHEL66Template', '6', 'm2', 'test', '47', '0', '0aeb3d649f1146ac90f83e5e452b4d1b');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `uuid` varchar(32) NOT NULL,
  `project_name` varchar(45) DEFAULT NULL,
  `project_desc` varchar(255) DEFAULT NULL,
  `cpu_used` int(11) unsigned zerofill DEFAULT '00000000000' COMMENT '		',
  `cpu_all` int(11) unsigned zerofill DEFAULT '00000000000',
  `mem_used` int(11) unsigned zerofill DEFAULT '00000000000',
  `mem_all` int(11) unsigned zerofill DEFAULT '00000000000',
  `disk_used` int(11) unsigned zerofill DEFAULT '00000000000',
  `disk_all` int(11) unsigned zerofill DEFAULT '00000000000',
  `ip_count` int(11) unsigned zerofill DEFAULT '00000000000',
  `app_count` int(11) unsigned zerofill DEFAULT '00000000000',
  `project_status_uuid` varchar(32) DEFAULT NULL,
  `user_uuid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('137ab63487fd4391982db24f500a80fa', 'project 3', '我的项目233', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '61', '090c6e01a3c54d768ce27fe143551f79');
INSERT INTO `project` VALUES ('23e7338f18dc42528bd05977e4979468', 'hhh', 'hhhh', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '61', '388c9242e49142998cba43a54a729f0e');
INSERT INTO `project` VALUES ('2b5999395f904919a04956cd5dd3b0e8', 'project', 'test project', null, null, null, null, null, null, '00000000000', '00000000000', '61', 'dc1d14d6677d48f3958685143a7f480d');
INSERT INTO `project` VALUES ('48c5448d3c3c4321b9eb332cfed5a9d3', 'new', 'new', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '61', '090c6e01a3c54d768ce27fe143551f79');
INSERT INTO `project` VALUES ('589937a466d64fc2a0c1b4677aca57e0', 'aaa', 'aaa', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '61', '388c9242e49142998cba43a54a729f0e');
INSERT INTO `project` VALUES ('66e0a2d5ebf74ae49bc517a46ffe5860', 'test', 'test', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '61', 'dc1d14d6677d48f3958685143a7f480d');
INSERT INTO `project` VALUES ('83e37ba3f7a74d8a802a80d89746c65a', 'ddd', 'ddd', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '61', '388c9242e49142998cba43a54a729f0e');
INSERT INTO `project` VALUES ('950ab083eda1438a9cfb499fe3c91e99', 'efe', 'fefe', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '61', '388c9242e49142998cba43a54a729f0e');
INSERT INTO `project` VALUES ('9f4f0e6b001f4fc489fe048d3ba99adf', 'sss', 'sss', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '61', '388c9242e49142998cba43a54a729f0e');
INSERT INTO `project` VALUES ('a3a3433929564653959934793d113288', 'My Project', '我的项目', '00000000001', '00000000005', '00000000001', '00000000009', '00000000006', '00000000013', '00000000002', '00000000002', '61', '090c6e01a3c54d768ce27fe143551f79');
INSERT INTO `project` VALUES ('b6a8c871e0694d48ae03e84f79a6c263', 'vvv', 'vvv', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '61', '388c9242e49142998cba43a54a729f0e');
INSERT INTO `project` VALUES ('ba682e57ddcb49e1886e47ffb17774af', '项目2', '项目2的主要描述', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '61', '388c9242e49142998cba43a54a729f0e');
INSERT INTO `project` VALUES ('bb966a046be743a5a99f799fdd713019', '切切切', 'qqqq', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '61', '388c9242e49142998cba43a54a729f0e');
INSERT INTO `project` VALUES ('c2ec1cf90cc74bd4bcaf4c8b93ade7a4', '项目1', '小灌木每次都能', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '61', '388c9242e49142998cba43a54a729f0e');
INSERT INTO `project` VALUES ('c93030c93674434bb086f13f6ec62cff', 'wpTest', 'wpTest', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '00000000000', '61', '388c9242e49142998cba43a54a729f0e');

-- ----------------------------
-- Table structure for property
-- ----------------------------
DROP TABLE IF EXISTS `property`;
CREATE TABLE `property` (
  `uuid` varchar(32) NOT NULL COMMENT 'UUID可使用Java程序生成，也可以使用MySQL自带UUID函数或者UUID_SHORT函数生成',
  `ppe_name` varchar(45) DEFAULT NULL COMMENT '属性名称',
  `ppe_group` varchar(45) DEFAULT NULL COMMENT '属性所属分组名称',
  `isenable` tinyint(1) DEFAULT NULL COMMENT '是否启用\n0是未启用\n1是启用',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of property
-- ----------------------------
INSERT INTO `property` VALUES ('1', 'VMwaver5', 'source_type', '0');
INSERT INTO `property` VALUES ('11', '正常', 'source_status', '0');
INSERT INTO `property` VALUES ('12', '失败', 'source_status', '0');
INSERT INTO `property` VALUES ('2', 'OpenStack', 'source_type', '1');
INSERT INTO `property` VALUES ('21', '空闲', 'ipaddr_status', '0');
INSERT INTO `property` VALUES ('22', '已用', 'ipaddr_status', '0');
INSERT INTO `property` VALUES ('23', '锁定', 'ipaddr_status', '0');
INSERT INTO `property` VALUES ('24', '不可用', 'ipaddr_status', '0');
INSERT INTO `property` VALUES ('3', 'Other', 'source_type', '0');
INSERT INTO `property` VALUES ('31', '本地网络', 'network_type', '0');
INSERT INTO `property` VALUES ('41', 'REL6-64', 'os_template_type', '0');
INSERT INTO `property` VALUES ('42', 'REL6-32', 'os_template_type', '0');
INSERT INTO `property` VALUES ('43', 'REL5-64', 'os_template_type', '0');
INSERT INTO `property` VALUES ('44', 'Slaris10', 'os_template_type', '0');
INSERT INTO `property` VALUES ('45', 'Slaris9', 'os_template_type', '0');
INSERT INTO `property` VALUES ('46', 'Slaris8', 'os_template_type', '0');
INSERT INTO `property` VALUES ('47', 'Windows Server 2008', 'os_template_type', '0');
INSERT INTO `property` VALUES ('51', '系统配置', 'module_type', '0');
INSERT INTO `property` VALUES ('52', '系统服务', 'module_type', '0');
INSERT INTO `property` VALUES ('53', '第三方应用', 'module_type', '0');
INSERT INTO `property` VALUES ('61', '运行中', 'project_status', '0');
INSERT INTO `property` VALUES ('62', '挂起', 'project_status', '0');
INSERT INTO `property` VALUES ('71', '停止', 'app_status', '0');
INSERT INTO `property` VALUES ('72', '运行', 'app_status', '0');
INSERT INTO `property` VALUES ('73', '挂起', 'app_status', '0');
INSERT INTO `property` VALUES ('74', '创建中', 'app_status', '0');
INSERT INTO `property` VALUES ('75', '创建失败', 'app_status', '0');
INSERT INTO `property` VALUES ('81', '管理员', 'user_role', '0');
INSERT INTO `property` VALUES ('82', '普通用户', 'user_role', '0');
INSERT INTO `property` VALUES ('91', '执行中', 'task_status', '0');
INSERT INTO `property` VALUES ('92', '待审批', 'task_status', '0');
INSERT INTO `property` VALUES ('93', '完成', 'task_status', '0');
INSERT INTO `property` VALUES ('94', '审批未通过', 'task_status', '0');
INSERT INTO `property` VALUES ('95', '失败', 'task_status', '0');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `uuid` varchar(32) NOT NULL,
  `role_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for self_report
-- ----------------------------
DROP TABLE IF EXISTS `self_report`;
CREATE TABLE `self_report` (
  `uuid` varchar(32) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `dimension` varchar(32) DEFAULT NULL COMMENT '维度',
  `self_condition` varchar(255) DEFAULT NULL COMMENT '条件',
  `user_uuid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of self_report
-- ----------------------------
INSERT INTO `self_report` VALUES ('5badcae4ad234acab363a675c429ce02', 'new2', 'source', '090c6e01a3c54d768ce27fe143551f79,333b8b97a06b434097e089810a2601fe,0aeb3d649f1146ac90f83e5e452b4d1b', '1');
INSERT INTO `self_report` VALUES ('cf959571ffc0477caa4ba684eb1d3c66', 'wpTest', 'user', '333b8b97a06b434097e089810a2601fe,090c6e01a3c54d768ce27fe143551f79', '1');
INSERT INTO `self_report` VALUES ('856c5edff8504aadbfc5cc4436a0d419', 'wppp', 'source', '090c6e01a3c54d768ce27fe143551f79,333b8b97a06b434097e089810a2601fe,0aeb3d649f1146ac90f83e5e452b4d1b', '1');
INSERT INTO `self_report` VALUES ('f5c6369b11e94d23b2a83f88bebe4391', 'save', 'user', '333b8b97a06b434097e089810a2601fe,1,090c6e01a3c54d768ce27fe143551f79', '1');
INSERT INTO `self_report` VALUES ('2fc98ecb7f7b4d9a90b87b17a2a0087d', 'rrrr', 'user', '333b8b97a06b434097e089810a2601fe,090c6e01a3c54d768ce27fe143551f79', '1');

-- ----------------------------
-- Table structure for source
-- ----------------------------
DROP TABLE IF EXISTS `source`;
CREATE TABLE `source` (
  `uuid` varchar(32) NOT NULL COMMENT 'UUID可使用Java程序生成，也可以使用MySQL自带UUID函数或者UUID_SHORT函数生成',
  `source_name` varchar(45) DEFAULT NULL COMMENT '资源池名称',
  `source_desc` varchar(255) DEFAULT NULL COMMENT '资源描述',
  `source_type_uuid` varchar(32) DEFAULT NULL,
  `is_limit` tinyint(1) DEFAULT NULL COMMENT '是否为受限资源池\n1表示受限\n0表示不受限',
  `network_name` varchar(45) DEFAULT NULL,
  `network_type_uuid` varchar(32) DEFAULT NULL,
  `source_status_uuid` varchar(32) DEFAULT NULL COMMENT '资源池状态',
  `source_status_reason` varchar(255) DEFAULT NULL COMMENT '状态原因',
  `cpu_run` varchar(45) DEFAULT NULL,
  `cpu_used` varchar(45) DEFAULT NULL,
  `cpu_all` varchar(45) DEFAULT NULL,
  `mem_run` varchar(45) DEFAULT NULL,
  `mem_used` varchar(45) DEFAULT NULL,
  `mem_all` varchar(45) DEFAULT NULL,
  `disk_run` varchar(45) DEFAULT NULL,
  `disk_used` varchar(45) DEFAULT NULL,
  `disk_all` varchar(45) DEFAULT NULL,
  `ip_used` varchar(45) DEFAULT NULL,
  `ip_all` varchar(45) DEFAULT NULL,
  `dc_name` varchar(45) DEFAULT NULL COMMENT 'DataCenter名称',
  `dc_vm_id` varchar(45) DEFAULT NULL COMMENT 'DataCenter虚拟机上的名称或者唯一ID',
  `sourceconnection_uuid` varchar(32) DEFAULT NULL,
  `task_uuid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of source
-- ----------------------------
INSERT INTO `source` VALUES ('0aeb3d649f1146ac90f83e5e452b4d1b', '需审批资源池', '需审批', '1', '1', 'VM Network', null, '11', null, '0', '9.16', '4', '0', '10.06', '16', '0', '321.29', '384.5', '4', '6', 'Cluster-1', 'Cluster-1', '088e6b8286744bf88c0a72cc8d5418d7', '074942dfdb144535ab8fd538d943cd92');
INSERT INTO `source` VALUES ('1d1f62c97a374973aed64d91bffa7543', 'source-2', 'source-2', '1', '0', 'VM Network', null, '11', null, null, '0', '4', null, '0', '16', null, '339.4', '384.5', '0', '2', 'Cluster-1', 'Cluster-1', '4ef2e1e60f34497294ab303f5169f773', 'd4bc88fe99064f1aaf62348a1ba99ab3');
INSERT INTO `source` VALUES ('333b8b97a06b434097e089810a2601fe', '测试用资源池', '正确数据', '1', '0', 'VM Network', null, '11', null, '1', '5', '4', '1', '9', '16', '6', '13', '384.5', '4', '6', 'Cluster-1', 'Cluster-1', 'd89c7597790542e394ddff3a0fea43b1', '779c262fb3f24bac85b8ecb1a8b1744c');
INSERT INTO `source` VALUES ('35fddf7948614ce1aa0cc48805a93527', 'source-1', '资源池太大了', '1', '0', 'VM Network', null, '11', null, '0', '9.16', '4', '0', '10.06', '16', '0', '322.54', '253952', '4', '4', 'Cluster-1', 'Cluster-1', '5772b845aafe4bcba68be14c4c84f7af', '883da302139a4c09909892c56193cb54');
INSERT INTO `source` VALUES ('8fd3eb48a25641179ce9fa673b74131e', 'testSource', 'testSource', '1', '0', 'VM Network', null, '11', null, '0', '9.16', '4', '0', '10.06', '16', '0', '334.42', '384.5', '0', '6', 'Cluster-1', 'Cluster-1', 'ffa0454da4b74d80ac9b9917081ca9ba', '871ce74470194bec90e663fb18593b8f');
INSERT INTO `source` VALUES ('f21bdbec55124b80bff8607324a7c166', 'wp-Test', 'sdsdsd', '1', '0', 'VM Network', null, '11', null, null, '0', '4', null, '0', '16', null, '339.4', '384.5', '0', '2', 'Cluster-1', 'Cluster-1', '21fd488d34764aac861660cf1b3f8d64', '00ae93c819a14bb1954574ae9ca72b7b');

-- ----------------------------
-- Table structure for sourceconnection
-- ----------------------------
DROP TABLE IF EXISTS `sourceconnection`;
CREATE TABLE `sourceconnection` (
  `uuid` varchar(32) NOT NULL,
  `ipaddr` varchar(45) DEFAULT NULL,
  `port` varchar(45) DEFAULT NULL,
  `source_username` varchar(45) DEFAULT NULL,
  `source_passwd` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sourceconnection
-- ----------------------------
INSERT INTO `sourceconnection` VALUES ('04574ca1f3114141b59c1d7ef0c39929', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('088e6b8286744bf88c0a72cc8d5418d7', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('0ce6fd2d120f4476a64015a0fbb54fde', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('1154b5b56cbb462fbbfbebe1ba8a8f96', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('12264a9b88414c7d82809e0cc95f2fa1', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('1d7d08aea9db46caae2dea38435ea42c', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('1ec6cba906814fbc94736e240858149f', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('1f48ac83df23418c925bf5edb5bfd9f4', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('21fd488d34764aac861660cf1b3f8d64', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('28d572337894436d9cd3c5896796775f', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('2baaa4826efb4671ba7aead9efd01f55', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('32f85116f260428c82c70690443b5deb', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('3b484ccc0302461c9bed849e9a5a505e', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('3cd434ef8792449c9b9ff685175c220d', '137.208.26', '8080', 'admin', '123456');
INSERT INTO `sourceconnection` VALUES ('4ef2e1e60f34497294ab303f5169f773', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('5772b845aafe4bcba68be14c4c84f7af', '192.168.0.6', '8080', 'admin', '123123');
INSERT INTO `sourceconnection` VALUES ('5fe94fa174af466da0ff6716db72f44d', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('605bff7d014843c987a845924891a14d', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('6206af2f2b5842029102118ff54f90c2', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('6297e5d05b56483e99611f66c7e40781', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('76352ba0e4d64402853facfb58122517', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('7819232a091a4a49b4bb51ab4472b585', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('78ccd7724f894128b5ec0d158e92e108', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('80b84b9234304c01864ba460768dbb42', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('8bdae2ebab1740c4add114aaf49b923e', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('8c303b8e3b5148299eb3a199f6c41540', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('918db2b28211443d9303281e7ffa9505', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('94944156edee4202909057e057733f82', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('95d5d24dd4fe4b9bab2ff61b548de812', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('9d6d063fdb3e4a3cbe89bd466983c8fc', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('a08d80d6ef474482b72bd445d5fa5e89', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('a8af24f8b0e74e9c8dabe2a4547d2ed2', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('b69df4aa5dc84c8aa4eb6c6f1fd5d61f', '137.208.26', '8080', 'admin', '123456');
INSERT INTO `sourceconnection` VALUES ('ba479d04f37e4b9ca3cd72ab85a7ae98', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('d127994903614857871233d8de9d6334', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('d5b31ab9147f43919a754b4519b0dd10', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('d733378d718443369de11d58f49b0c06', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('d89c7597790542e394ddff3a0fea43b1', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('dd0a29f978e84828ac587f41f3f61d63', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('dd54112475ce4182b0299f220d52a260', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('df291d2bd1e945fa9f8cc987eafb927e', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('e0053eb38c4d41f98991c3a1f283d38e', '137.208.26.4', '8080', 'admin', '123456');
INSERT INTO `sourceconnection` VALUES ('ef3a08d7c5d24827a50191429694917e', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('f2d36726295e463c90f070cc351abd4c', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('fcb20eeb0b3a4f6fb024e1772febe988', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('fd432e1c078e478eb224a68c5788d35a', '192.168.0.190', '443', 'root', 'vmware');
INSERT INTO `sourceconnection` VALUES ('ffa0454da4b74d80ac9b9917081ca9ba', '192.168.0.190', '443', 'root', 'vmware');

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `uuid` varchar(32) NOT NULL COMMENT 'UUID可使用Java程序生成，也可以使用MySQL自带UUID函数或者UUID_SHORT函数生成',
  `tag_name` varchar(45) DEFAULT NULL COMMENT '标签名称',
  `tag_type` varchar(45) DEFAULT NULL COMMENT '标签类型，值为数据库表名称',
  `target_uuid` varchar(32) DEFAULT NULL COMMENT '标签目标UUID',
  `user_uuid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES ('041a683feee843edb9ae069782397aec', 'wpTest', 'application', '10f77360d91b429cba41076617393ec6', '090c6e01a3c54d768ce27fe143551f79');
INSERT INTO `tags` VALUES ('08e295c5140a4fb0aab2db8e5feca5b8', 'hhh', 'application', 'f4028df596934fce9c9cdca815b5da1c', '090c6e01a3c54d768ce27fe143551f79');
INSERT INTO `tags` VALUES ('0f46b0e93a9849f99632a2390ea43217', 'jj', 'application', '9489f70a22fb4016ac8f521717be2a82', '090c6e01a3c54d768ce27fe143551f79');
INSERT INTO `tags` VALUES ('1', '标签1', 'application', '77a7fcf157f64b30ad4aaee5a624ec26', '090c6e01a3c54d768ce27fe143551f79');
INSERT INTO `tags` VALUES ('2', '标签2', 'application', '77a7fcf157f64b30ad4aaee5a624ec26', '090c6e01a3c54d768ce27fe143551f79');
INSERT INTO `tags` VALUES ('25f6307cb39e47859ab8e0a4fcfe1d57', 'test', 'application', '没有可用的IP地址请重新创建应用', 'dc1d14d6677d48f3958685143a7f480d');
INSERT INTO `tags` VALUES ('28483b2ca68e416396d70a19f4bb5bcd', 'test', 'application', '没有可用的IP地址请重新创建应用', 'dc1d14d6677d48f3958685143a7f480d');
INSERT INTO `tags` VALUES ('3', '标签3', 'application', '77a7fcf157f64b30ad4aaee5a624ec26', '090c6e01a3c54d768ce27fe143551f79');
INSERT INTO `tags` VALUES ('48a6c739e4104fd9ac801f0c08d911a0', 'test', 'application', '没有可用的IP地址请重新创建应用', 'dc1d14d6677d48f3958685143a7f480d');
INSERT INTO `tags` VALUES ('5f6ed2085fb842cc944f95eb94a6f571', 'test', 'application', '168ea118621f4daa808ec3fe7d2954d6', 'dc1d14d6677d48f3958685143a7f480d');
INSERT INTO `tags` VALUES ('6706321d39f94a928387bcf85cb4ae24', 'test', 'application', '没有可用的IP地址请重新创建应用', 'dc1d14d6677d48f3958685143a7f480d');
INSERT INTO `tags` VALUES ('864a8a52929243ed836d54d80c4ff082', 'mytest', 'application', '没有可用的IP地址请重新创建应用', 'dc1d14d6677d48f3958685143a7f480d');
INSERT INTO `tags` VALUES ('88057cb6e46847c3a8a3ff768f3ad8e0', '3333', 'application', '52843b0c6f1540ee8638c613d5f96d3e', '090c6e01a3c54d768ce27fe143551f79');
INSERT INTO `tags` VALUES ('a52e4aea938142ffaad0d4461902726e', 'aaa', 'application', 'bce40d465743498babd69ee5a13960ea', '090c6e01a3c54d768ce27fe143551f79');
INSERT INTO `tags` VALUES ('ab51540da15942b18420293429a8206e', 'www', 'application', 'b34005a2a7f44e1abdffd645107941bd', '090c6e01a3c54d768ce27fe143551f79');
INSERT INTO `tags` VALUES ('ca9175d361e049b9bc8ea4d3425ae19b', 'zzz', 'application', '1902375a88f94af5afa177e693efc288', '090c6e01a3c54d768ce27fe143551f79');
INSERT INTO `tags` VALUES ('d83a79649b08443794714fe5964615f7', 'test', 'application', '没有可用的IP地址请重新创建应用', 'dc1d14d6677d48f3958685143a7f480d');
INSERT INTO `tags` VALUES ('d89e7594118c4e809ea6d08e85f9a68e', 'www', 'application', '75b9fc79749646feaec3ee7c1b4d0f92', '090c6e01a3c54d768ce27fe143551f79');
INSERT INTO `tags` VALUES ('efc7cad362e24fe3b9bc16291b26b37c', '333', 'application', '52843b0c6f1540ee8638c613d5f96d3e', '090c6e01a3c54d768ce27fe143551f79');

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
  `uuid` varchar(32) NOT NULL,
  `task_name` varchar(255) DEFAULT NULL,
  `task_type` varchar(45) DEFAULT NULL,
  `task_user_uuid` varchar(45) DEFAULT NULL,
  `task_user_name_cn` varchar(45) DEFAULT NULL,
  `task_begin_time` timestamp NULL DEFAULT NULL,
  `task_end_time` timestamp NULL DEFAULT NULL,
  `task_status` varchar(32) DEFAULT NULL COMMENT '任务状态\n0待审批\n1执行中\n2完成\n\n或者夜放到系统属性表',
  `task_detail` text,
  `vm_uuid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tasks
-- ----------------------------
INSERT INTO `tasks` VALUES ('00ae93c819a14bb1954574ae9ca72b7b', '资源添加-wp-Test', '资源添加', '1', '系统管理员', '2016-09-08 18:39:51', '2016-09-08 18:39:51', '93', null, null);
INSERT INTO `tasks` VALUES ('066d3039c67b44eb97b8b91ccd1b23ee', '应用创建-newVM150', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-18 11:24:29', null, '93', null, '500f0e3b-a19c-1417-5822-ff6cf30910c6');
INSERT INTO `tasks` VALUES ('074942dfdb144535ab8fd538d943cd92', '资源添加-需审批资源池', '资源添加', '1', '系统管理员', '2016-08-17 15:44:42', '2016-08-17 15:44:42', '93', null, null);
INSERT INTO `tasks` VALUES ('0902c7ed46d948e5880621ae03261fb6', '应用创建-newvm34', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-09-08 11:48:19', '2016-09-08 11:52:15', '93', null, '500f058c-3a79-8ea3-0fb8-9fd4989c1e4c');
INSERT INTO `tasks` VALUES ('1350521697b94c19b70844f32c4cd338', '资源添加-new', '资源添加', '1', '系统管理员', '2016-08-30 16:21:59', '2016-08-30 16:21:59', '93', null, null);
INSERT INTO `tasks` VALUES ('136179aa9ad84fa2b1595aff6173c908', '应用创建-newvm25', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-31 15:30:03', '2016-08-31 15:33:16', '93', null, '500fce4b-5c6d-da76-f6ec-c3f1059df2f6');
INSERT INTO `tasks` VALUES ('15f30101c4a34303b3315c68be610efb', '应用创建-newVM170', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-25 18:07:21', '2016-08-25 18:11:27', '93', null, '500ff11c-3c58-ba4e-8034-d4c7de6819db');
INSERT INTO `tasks` VALUES ('1a62a7a7024d46cb91eb061fff1d72b3', '资源添加-wpTest', '资源添加', '1', '系统管理员', '2016-08-22 10:30:28', '2016-08-22 10:30:28', '93', null, null);
INSERT INTO `tasks` VALUES ('20b6cf667de644da813860c976788389', '应用创建-wptest', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-25 18:19:11', null, '95', null, '500f21c1-a980-75f6-981b-bd45ee828505');
INSERT INTO `tasks` VALUES ('2e53e4cff5e24145bf256ec846510ce9', '应用创建-newVM173', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-26 15:34:37', '2016-08-26 15:37:54', '93', null, '500fdc46-2306-52eb-1844-ce7d4834c418');
INSERT INTO `tasks` VALUES ('303024c58354461694b9d5429b5845f2', '应用创建-newVM154', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-22 14:32:43', null, '93', null, '500fd65d-1cdc-f6c5-78d5-aeadaf85a799');
INSERT INTO `tasks` VALUES ('326871efd79042898ef422575d71afbb', '资源添加-wpTest1', '资源添加', '1', '系统管理员', '2016-08-19 15:48:09', '2016-08-19 15:48:09', '93', null, null);
INSERT INTO `tasks` VALUES ('32d41c076c0641ccb35051758fcbd565', '应用创建-newvm0', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-25 17:56:24', '2016-08-25 18:01:48', '93', null, '500f3e47-e29b-a226-54ca-6911d36e7f28');
INSERT INTO `tasks` VALUES ('3301704157bf4893a44a68cc8df243d3', '应用创建-newvm3', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-23 14:54:37', null, '91', null, null);
INSERT INTO `tasks` VALUES ('3d08af1121654128b14156e238ab19e7', '应用创建-newvm4', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-24 15:12:49', null, '91', null, null);
INSERT INTO `tasks` VALUES ('3eb70bdd3f6349a3bd409d3fa362ff8f', '应用创建-newvm8', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-24 18:05:51', '2016-08-24 18:09:32', '93', null, '500fb720-9dad-8ab1-e723-66be790e437d');
INSERT INTO `tasks` VALUES ('4529d093acd34727b9fce2fc5eb9644b', '应用创建-newvm13', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-26 10:41:01', '2016-08-26 10:48:14', '93', null, '500f244b-47e7-7233-de05-d7b6fb978b9f');
INSERT INTO `tasks` VALUES ('45841e2695914384a88d40b9918b1186', '资源添加-test', '资源添加', '1', '系统管理员', '2016-09-08 15:43:18', '2016-09-08 15:43:18', '93', null, null);
INSERT INTO `tasks` VALUES ('45e3638d4e344c0d826ecd5ddf7f7f66', '应用创建-newvm7', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-24 18:03:46', null, '94', null, null);
INSERT INTO `tasks` VALUES ('464075f825ff4d6c8736dcc3043f7ab4', '应用创建-hehe', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-19 17:35:32', null, '93', null, '500f5701-3752-f6f1-5d47-2e0f20e2327a');
INSERT INTO `tasks` VALUES ('46f9bbc5fd3b424c8cfddb85ff986a64', '应用创建-newvm3', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-23 14:58:56', null, '91', null, null);
INSERT INTO `tasks` VALUES ('47590c28e3b641a6b5124a3606ea86bd', '资源添加-wpTest', '资源添加', '1', '系统管理员', '2016-08-19 13:59:44', '2016-08-19 13:59:44', '93', null, null);
INSERT INTO `tasks` VALUES ('4fcf1b7135764789b938826739d47fb7', '应用创建-newvm9', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-24 18:14:05', '2016-08-24 18:17:16', '93', null, '500f1c75-cb3d-e18f-cd65-8e849029d112');
INSERT INTO `tasks` VALUES ('52cd7c48ae9843f19bac558d34816636', '应用创建-newVM161', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-22 16:36:33', null, '93', null, '500f7083-ba6e-d956-7849-725f01bced85');
INSERT INTO `tasks` VALUES ('5542839c994c4023ab25b1353bf91222', '资源添加-test', '资源添加', '1', '系统管理员', '2016-08-23 14:52:08', '2016-08-23 14:52:08', '93', null, null);
INSERT INTO `tasks` VALUES ('55ee9142f5ed44358bbad9c38e8fddd2', '应用创建-newvm1', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-22 16:36:30', null, '93', null, '500fd85a-d560-84be-4702-25821b63d1df');
INSERT INTO `tasks` VALUES ('5628cfff3fda488892597d8fa01a6b13', '应用创建-hehe', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-19 16:50:22', null, '95', null, '500fdd96-cea0-1bf7-0f52-e6dd28adf746');
INSERT INTO `tasks` VALUES ('562dbdfad1674b79955a379948d01912', '应用创建-test', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-19 16:31:21', null, '93', null, '500fe151-8e46-000e-d930-8a90f5a5650f');
INSERT INTO `tasks` VALUES ('5990332e3b514a6ead0fa0ce9015b446', '应用创建-newVM205', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-24 15:10:29', null, '93', null, '500fdc11-b9d8-e2c7-e6c0-3bbb9cb5ae9c');
INSERT INTO `tasks` VALUES ('59c6710307a149fd8e7461903f38ed35', '应用创建-newVM169', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-25 17:54:07', '2016-08-25 18:00:22', '93', null, '500fdeaf-415e-7638-0af1-72ac582dec7f');
INSERT INTO `tasks` VALUES ('5d02250c90fd4b80a92dbffd3b11e5e5', '应用创建-wwb', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-22 15:57:30', null, '93', null, '500fec45-cd1f-0b43-c0f9-1398550db7af');
INSERT INTO `tasks` VALUES ('5d25bbdd249449958984b73ba4f2eedb', '应用创建-newvm6', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-24 17:58:33', '2016-08-24 18:01:58', '93', null, '500f425a-5a80-98be-894e-1f113b31d723');
INSERT INTO `tasks` VALUES ('5ef66671e67e40ac9deedc0b7d10833a', '应用创建-TestWp', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-22 10:04:57', null, '95', null, '500fdd34-9745-460b-5f72-d5ee4a7ea81e');
INSERT INTO `tasks` VALUES ('5f6fc4c52a904e54a391cea9a9cb31e1', '应用创建-test2', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-25 18:21:16', null, '95', null, '500f0753-9f2b-bc82-01e1-6118996d7b19');
INSERT INTO `tasks` VALUES ('6033ad3e103f4b388ad8a7cbd7f14bc0', '应用创建-newVM204', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-24 14:55:31', null, '93', null, '500f2a08-f0b4-339c-564c-045b67d2ee73');
INSERT INTO `tasks` VALUES ('62793d423276432d99f5f5de38477c18', '应用创建-newvm28', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-09-06 16:02:58', null, '91', null, '500ff2cc-93fc-9f22-86f9-9c3f63c408ab');
INSERT INTO `tasks` VALUES ('64c5fb051540452a82a1c8954fe56f23', '应用创建-newvm23', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-26 16:54:07', null, '95', null, '500f338a-49c2-6ca5-0dad-c7a05f9c53b0');
INSERT INTO `tasks` VALUES ('6808507f33d5440cbe693c2bbf280eba', '应用创建-haha', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-19 16:20:50', null, '95', null, '500f5571-a9ff-ba1c-a637-219759b5b3cf');
INSERT INTO `tasks` VALUES ('6a8db03fc1cb47e698fe6e3f4da04057', '应用创建-newvm3', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-23 14:57:31', null, '91', null, null);
INSERT INTO `tasks` VALUES ('6b526ce981794f46be06c682c35dfd84', '应用创建-newvm16', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-26 11:10:05', null, '91', null, '500f4af0-f66d-c4b3-96a8-decdd5747bb7');
INSERT INTO `tasks` VALUES ('708b1a42a55745a48353435f69e9cea3', '应用创建-newvm26', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-09-06 11:04:08', '2016-09-06 11:08:16', '93', null, '500f3577-f08c-eb32-73ca-2d457ac91c0d');
INSERT INTO `tasks` VALUES ('71e90589accc41dc8b2fb019c195e343', '应用创建-ww', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-26 14:29:57', '2016-08-26 14:35:59', '93', null, '500feb9e-335a-c653-83eb-530edce3b7d6');
INSERT INTO `tasks` VALUES ('73244eb397834110b2d6ce17b3958bcf', '应用创建-newVM162', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-23 11:31:22', null, '93', null, '500f3630-b3a6-8251-2ce0-83700b162a3d');
INSERT INTO `tasks` VALUES ('76c2111f9bb242f5b283ee7036b0f327', '应用创建-newVM163', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-25 16:26:52', null, '91', null, null);
INSERT INTO `tasks` VALUES ('76c4aeec6a8f4510a142c97fa3e91c36', '应用创建-newVM120', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-09-07 15:01:23', '2016-09-07 15:11:54', '93', null, '500f0e8c-3f9b-c6bf-3d47-b008671f3fff');
INSERT INTO `tasks` VALUES ('77215097cb7642109d5d45cde81cc1b6', '应用创建-newVM166', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-25 17:08:16', null, '91', null, null);
INSERT INTO `tasks` VALUES ('779c262fb3f24bac85b8ecb1a8b1744c', '资源添加-测试用资源池', '资源添加', '1', '系统管理员', '2016-08-12 10:02:50', '2016-08-12 10:02:50', '93', null, null);
INSERT INTO `tasks` VALUES ('7b674e1b980948fb8256f955aaac6310', '应用创建-newVM164', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-25 16:32:55', null, '91', null, null);
INSERT INTO `tasks` VALUES ('81283ec71f3e464ababcf908eb7c5ce0', '应用创建-newvm15', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-26 10:48:22', '2016-08-26 10:51:43', '93', null, '500f57be-da0b-0d4c-1a5a-a03671be3533');
INSERT INTO `tasks` VALUES ('83346e2cf3c14087858c8d6b0e608521', '应用创建-newvm24', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-30 10:45:20', '2016-08-30 10:48:28', '93', null, '500fd517-d6a2-7276-74da-6c5475e8531e');
INSERT INTO `tasks` VALUES ('871ce74470194bec90e663fb18593b8f', '资源添加-testSource', '资源添加', '1', '系统管理员', '2016-08-24 18:12:58', '2016-08-24 18:12:58', '93', null, null);
INSERT INTO `tasks` VALUES ('8911b59950e34308a3e651a04a0e8abd', '应用创建-newvm22', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-26 15:38:51', '2016-08-26 15:41:52', '93', null, '500f2ebe-c88b-33be-2816-34485aeca601');
INSERT INTO `tasks` VALUES ('8bf193f27ce54c9792fcdf44395ba4d2', '应用创建-newvm3', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-23 14:58:53', null, '91', null, null);
INSERT INTO `tasks` VALUES ('9171391073cf4ceab14297812629d6fb', '应用创建-Test', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-22 10:08:45', null, '93', null, '500f5c09-f221-d4ee-3189-72533c2a829e');
INSERT INTO `tasks` VALUES ('9352fb439cd14692b5915c3666deb9f0', '应用创建-newvm2', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-22 17:53:01', null, '91', null, null);
INSERT INTO `tasks` VALUES ('94957e149ee444aea3a7ee9b9fcd6fa0', '资源添加-test', '资源添加', '1', '系统管理员', '2016-09-08 11:23:45', '2016-09-08 11:23:45', '93', null, null);
INSERT INTO `tasks` VALUES ('94ce538164b74c6f93c4c3e02282d481', '应用创建-newVM172', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-26 10:41:00', '2016-08-26 10:48:06', '93', null, '500fa574-66ed-072e-0eb9-a504ab027e2f');
INSERT INTO `tasks` VALUES ('9557ef2d4be149f5ad04dd33207f9325', '应用创建-newvm32', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-09-07 16:38:43', '2016-09-07 16:42:43', '93', null, '500ffbe7-03c0-f1c7-5d0d-0a7b6612316e');
INSERT INTO `tasks` VALUES ('981547186a064e92987bd1ac00a7e109', '资源添加-wpTest', '资源添加', '1', '系统管理员', '2016-08-19 14:09:10', '2016-08-19 14:09:10', '93', null, null);
INSERT INTO `tasks` VALUES ('9835658c16554a95b20cb2622dfd80a5', '应用创建-newvm35', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-09-08 15:45:54', '2016-09-08 15:48:39', '93', null, '500f8c15-ef5d-1d39-b400-1b42e76ad1b8');
INSERT INTO `tasks` VALUES ('9fcb481e1cae4c90915b24a8537b20d4', '应用创建-test', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-22 15:32:45', null, '91', null, null);
INSERT INTO `tasks` VALUES ('9fcea9e0d994406bbe340ab7be330297', '应用创建-newVM167', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-25 17:17:10', '2016-08-25 17:21:46', '93', null, '500f8365-58bb-70b6-656d-8d3b87a2a572');
INSERT INTO `tasks` VALUES ('a0d5921182c24da3865cb859fbae7e19', '应用创建-newVM151', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-18 17:44:51', null, '93', null, '500f8b13-7211-bf5d-46ab-5fdc2f974b6d');
INSERT INTO `tasks` VALUES ('a35d3f6d1f7d4af2a2813acf7936c94b', '资源添加-8.8新建source', '资源添加', '1', '系统管理员', '2016-08-08 10:44:10', '2016-08-08 10:44:10', '93', null, null);
INSERT INTO `tasks` VALUES ('a4fee99ad1c5410a981b5d9a9580c7a8', '应用创建-newvm5', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-24 17:55:25', null, '91', null, null);
INSERT INTO `tasks` VALUES ('a75b1fcaf73045e6970c4443e3ad323b', '资源添加-测试数据source', '资源添加', '1', '系统管理员', '2016-08-04 18:00:12', '2016-08-04 18:00:12', '93', null, null);
INSERT INTO `tasks` VALUES ('a772a4dc3432405b8776120bea272371', '应用创建-newvm19', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-26 12:02:24', null, '95', null, '500f4e56-f472-cb8d-e985-65ed84b5b663');
INSERT INTO `tasks` VALUES ('aa2e9435981842948d086faf924f04f3', '资源添加-test', '资源添加', '1', '系统管理员', '2016-09-08 11:15:47', '2016-09-08 11:15:47', '93', null, null);
INSERT INTO `tasks` VALUES ('ac4ef85557c54afeb685ac956fb7eb58', '应用创建-newVM152', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-22 12:09:12', null, '91', null, null);
INSERT INTO `tasks` VALUES ('ac53539e95e14f17bccff2cbff1f3a4f', '应用创建-newvm12', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-25 18:19:15', '2016-08-25 18:29:59', '93', null, '500ff6e6-3590-000f-4d1b-440df3aff3ca');
INSERT INTO `tasks` VALUES ('b2adbe2b4b924e2fb621bf809f01ef64', '应用创建-newvm21', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-26 12:09:19', '2016-08-26 12:12:31', '93', null, '500f7ff5-caec-5256-f206-7d2fae619d71');
INSERT INTO `tasks` VALUES ('b2feff66c88a44c0a357f2edc43c9c7c', '应用创建-newvm30', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-09-07 14:58:39', null, '91', null, null);
INSERT INTO `tasks` VALUES ('b4e2756b32194638ba963d2fbf9234eb', '资源添加-wpTest', '资源添加', '1', '系统管理员', '2016-08-22 10:23:14', '2016-08-22 10:23:14', '93', null, null);
INSERT INTO `tasks` VALUES ('b6a178ea24ea4135bfe7dd54521f77d0', '应用创建-newVM160', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-22 15:32:41', null, '91', null, null);
INSERT INTO `tasks` VALUES ('b6cc137bd9254b19b13251491342fc2b', '应用创建-newVM201', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-24 10:58:41', null, '91', null, null);
INSERT INTO `tasks` VALUES ('b970f1cdea2847a3852e0358f7003832', '应用创建-newVM147', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-19 17:35:00', null, '93', null, '500f2aeb-7a9c-a1b0-226c-01c28d2aa7b7');
INSERT INTO `tasks` VALUES ('bda17ef30e6f4c39b7d1d73976b319b2', '资源添加-1234', '资源添加', '1', '系统管理员', '2016-08-05 16:58:58', '2016-08-05 16:58:58', '93', null, null);
INSERT INTO `tasks` VALUES ('c6afc643b18b42009c9a359856a1ddd4', '应用创建-newVM202', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-24 11:05:23', null, '94', null, null);
INSERT INTO `tasks` VALUES ('c94a9e0faaca4b94b8b2c6a2dba47148', '应用创建-newVM200', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-17 15:45:55', null, '94', null, null);
INSERT INTO `tasks` VALUES ('ccd3b19aa97e4bdf9dd7b7da761824a0', '应用创建-newvm18', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-26 11:14:51', null, '91', null, '500fb783-7f6d-db0d-db1d-58e46f4987b8');
INSERT INTO `tasks` VALUES ('cfd0fd515ee043ecbb6f4d6cb798fc13', '资源添加-Test', '资源添加', '1', '系统管理员', '2016-08-26 11:46:50', '2016-08-26 11:46:50', '93', null, null);
INSERT INTO `tasks` VALUES ('d4032ed7807449b190a7f7de6fec8a51', '资源添加-testSource', '资源添加', '1', '系统管理员', '2016-08-24 15:11:27', '2016-08-24 15:11:27', '93', null, null);
INSERT INTO `tasks` VALUES ('d4bc88fe99064f1aaf62348a1ba99ab3', '资源添加-source-2', '资源添加', '1', '系统管理员', '2016-09-12 16:49:58', '2016-09-12 16:49:58', '93', null, null);
INSERT INTO `tasks` VALUES ('db9830e7c5754f5ba164d7ea1f50fa3e', '应用创建-newvm29', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-09-07 14:46:05', '2016-09-07 14:50:04', '93', null, '500f12cc-dab1-33f4-e3ce-5b561ceacc41');
INSERT INTO `tasks` VALUES ('dc76ae92b0fa4b4bb7771678c001720f', '应用创建-newvm36', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-09-08 16:10:23', null, '95', null, '500f9823-765a-6d18-1638-fb4edbf4f326');
INSERT INTO `tasks` VALUES ('e3a3c924611a419db40706557d261f1b', '应用创建-newvm27', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-09-06 14:54:54', '2016-09-06 14:59:31', '93', null, '500f4dc8-bccb-37e5-9987-2f4771079065');
INSERT INTO `tasks` VALUES ('e79c8e226a5546e78707e6dea849808d', '应用创建-newVM203', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-24 12:06:14', null, '94', null, null);
INSERT INTO `tasks` VALUES ('ea79d6334a4d4703bd2b7a39bea3cb8c', '应用创建-test', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-22 15:32:43', null, '91', null, null);
INSERT INTO `tasks` VALUES ('eadfd333f7b345b895ca3ce99977201d', '应用创建-newVM168', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-25 17:51:28', null, '91', null, null);
INSERT INTO `tasks` VALUES ('ebd1a454b46a4d568d8510d801051273', '应用创建-newVM146', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-19 16:50:21', null, '93', null, '500f1ac8-4024-ed91-3c60-1dec6e9142c9');
INSERT INTO `tasks` VALUES ('f39cf69fc74044f4997de5c505559127', '应用创建-newVM152', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-18 14:09:06', null, '93', null, '500fbdc2-7970-98e9-f354-70410ea7dbbd');
INSERT INTO `tasks` VALUES ('f5411132d4154828ab66fcfb46d963a2', '应用创建-newVM171', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-25 18:14:01', '2016-08-25 18:17:34', '93', null, '500fa83c-8f4a-c432-2077-cb8f1e74d9a2');
INSERT INTO `tasks` VALUES ('f81ff363ccea415a90ab52fe1d6bf305', '应用创建-newvm3', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-23 14:55:44', null, '91', null, null);
INSERT INTO `tasks` VALUES ('f9fd5380d94143138481f3d79acb01da', '应用创建-newVM165', '应用创建', '090c6e01a3c54d768ce27fe143551f79', 'hanyumeng', '2016-08-25 16:35:24', null, '91', null, null);
INSERT INTO `tasks` VALUES ('fa1dfcf9cbe14c9d9821b106dea62be3', '应用创建-newvm3', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-23 14:57:28', null, '91', null, null);
INSERT INTO `tasks` VALUES ('fbb896c0bbc14395bf15a51678a5b9bf', '应用创建-newvm31', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-09-07 15:06:40', '2016-09-07 15:12:49', '93', null, '500fa75f-42a5-ecc1-555a-06b71b18f20d');
INSERT INTO `tasks` VALUES ('fbe16d6ba3e943988ef54382c4189bf9', '应用创建-newvm2', '应用创建', 'dc1d14d6677d48f3958685143a7f480d', '王万斌', '2016-08-22 17:52:57', null, '93', null, '500fe497-b38f-da41-a1d9-2771aa2f19d5');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `uuid` varchar(32) NOT NULL COMMENT 'UUID可使用Java程序生成，也可以使用MySQL自带UUID函数或者UUID_SHORT函数生成',
  `login_name` varchar(45) DEFAULT NULL COMMENT '用户登录id',
  `login_passwd` varchar(45) DEFAULT NULL COMMENT '用户登录密码',
  `user_name_cn` varchar(45) DEFAULT NULL COMMENT '用户中文名',
  `user_dept_uuid` varchar(32) DEFAULT NULL COMMENT '用户部门ID',
  `user_role_uuid` varchar(32) DEFAULT NULL COMMENT '用户权限ID',
  `user_mobile` varchar(11) DEFAULT NULL,
  `user_weixin` varchar(45) DEFAULT NULL,
  `user_email` varchar(45) DEFAULT NULL,
  `available_cpu` int(11) DEFAULT NULL,
  `available_mem` int(11) DEFAULT NULL,
  `available_disk` int(11) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  UNIQUE KEY `login_name_UNIQUE` (`login_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('090c6e01a3c54d768ce27fe143551f79', 'hym', '96E79218965EB72C92A549DD5A330112', 'hanyumeng', '1', '82', '18021257106', 'wwww', '111@s', '4', '16', '400');
INSERT INTO `users` VALUES ('1', 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', '系统管理员', '1', '81', '13722035367', 'weixin123456', '123456@qq.com', '4', '100', '2000');
INSERT INTO `users` VALUES ('388c9242e49142998cba43a54a729f0e', 'wp', '96E79218965EB72C92A549DD5A330112', 'wangping', '1', '82', '18347281494', '1234567', '1174388960@qq.com', '4', '100', '400');
INSERT INTO `users` VALUES ('9e2b52304d44452fb296da1b98407215', 'Test', '670B14728AD9902AECBA32E22FA4F6BD', 'Test', '1', '82', '18347266877', 'Test', '111@s', '1', '1', '1');
INSERT INTO `users` VALUES ('dc1d14d6677d48f3958685143a7f480d', 'wwb', '96E79218965EB72C92A549DD5A330112', '王万斌', '1', '82', '18323442311', 'test', '464405870@qq.com', '5', '10', '500');
DROP TRIGGER IF EXISTS `up_project_insert`;
DELIMITER ;;
CREATE TRIGGER `up_project_insert` AFTER INSERT ON `application` FOR EACH ROW begin
declare b int;
declare c int;
declare d int;
declare e int;
set b=( select sum(app_disk) from application where app_project_uuid=new.app_project_uuid AND app_status_uuid in ('72') );
set c=( select sum(app_disk) from application where app_project_uuid=new.app_project_uuid AND app_status_uuid in ('71','72','73') );
update project set disk_all=(c+(select sum(add_disk) from application where app_project_uuid=new.app_project_uuid AND app_status_uuid in ('71','72','73'))) where uuid=new.app_project_uuid;
update project set disk_used=(b+(select sum(add_disk) from application where app_project_uuid=new.app_project_uuid AND app_status_uuid in ('72'))) where uuid=new.app_project_uuid;
update project set ip_count=(select count(app_ipaddr) from application where app_project_uuid=new.app_project_uuid AND app_status_uuid in ('71','72','73')) where uuid=new.app_project_uuid;
update project set app_count=(select count(*) from application where app_project_uuid=new.app_project_uuid AND app_status_uuid in ('71','72','73')) where uuid=new.app_project_uuid;
update project set cpu_all=(select sum(app_cpu) from application where app_project_uuid=new.app_project_uuid AND app_status_uuid in ('71','72','73')) where uuid=new.app_project_uuid;
update project set mem_all=(select sum(app_mem) from application where app_project_uuid=new.app_project_uuid AND app_status_uuid in ('71','72','73')) where uuid=new.app_project_uuid;
update project set cpu_used=(select sum(app_cpu) from application where app_project_uuid=new.app_project_uuid AND app_status_uuid in ('72')) where uuid=new.app_project_uuid;
update project set mem_used=(select sum(app_mem) from application where app_project_uuid=new.app_project_uuid AND app_status_uuid in ('72')) where uuid=new.app_project_uuid;


set d=( select sum(add_disk) from application where app_source_uuid=new.app_source_uuid AND app_status_uuid in ('71','72','73') );
set e=( select sum(add_disk) from application where app_source_uuid=new.app_source_uuid AND app_status_uuid in ('72') );
update source set cpu_used =(select sum(app_cpu) from application where app_source_uuid=new.app_source_uuid AND app_status_uuid in ('71','72','73')) where uuid=new.app_source_uuid;
update source set mem_used =(select sum(app_mem) from application where app_source_uuid=new.app_source_uuid AND app_status_uuid in ('71','72','73')) where uuid=new.app_source_uuid;
update source set disk_used =(select sum(app_disk) from application where app_source_uuid=new.app_source_uuid AND app_status_uuid in ('71','72','73')) where uuid=new.app_source_uuid;
update source set cpu_run =(select sum(app_cpu) from application where app_source_uuid=new.app_source_uuid AND app_status_uuid in ('72')) where uuid=new.app_source_uuid;
update source set mem_run =(select sum(app_mem) from application where app_source_uuid=new.app_source_uuid AND app_status_uuid in ('72')) where uuid=new.app_source_uuid;
update source set disk_run =(select sum(app_disk) from application where app_source_uuid=new.app_source_uuid AND app_status_uuid in ('72')) where uuid=new.app_source_uuid;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `up_project_update`;
DELIMITER ;;
CREATE TRIGGER `up_project_update` AFTER UPDATE ON `application` FOR EACH ROW begin
declare b int;
declare c int;
declare d int;
declare e int;
set b=( select sum(app_disk) from application where app_project_uuid=new.app_project_uuid AND app_status_uuid in ('72') );
set c=( select sum(app_disk) from application where app_project_uuid=new.app_project_uuid AND app_status_uuid in ('71','72','73') );
update project set disk_all=(c+(select sum(add_disk) from application where app_project_uuid=new.app_project_uuid AND app_status_uuid in ('71','72','73'))) where uuid=new.app_project_uuid;
update project set disk_used=(b+(select sum(add_disk) from application where app_project_uuid=new.app_project_uuid AND app_status_uuid in ('72'))) where uuid=new.app_project_uuid;
update project set ip_count=(select count(app_ipaddr) from application where app_project_uuid=new.app_project_uuid AND app_status_uuid in ('71','72','73')) where uuid=new.app_project_uuid;
update project set app_count=(select count(*) from application where app_project_uuid=new.app_project_uuid AND app_status_uuid in ('71','72','73')) where uuid=new.app_project_uuid;
update project set cpu_all=(select sum(app_cpu) from application where app_project_uuid=new.app_project_uuid AND app_status_uuid in ('71','72','73')) where uuid=new.app_project_uuid;
update project set mem_all=(select sum(app_mem) from application where app_project_uuid=new.app_project_uuid AND app_status_uuid in ('71','72','73')) where uuid=new.app_project_uuid;
update project set cpu_used=(select sum(app_cpu) from application where app_project_uuid=new.app_project_uuid AND app_status_uuid in ('72')) where uuid=new.app_project_uuid;
update project set mem_used=(select sum(app_mem) from application where app_project_uuid=new.app_project_uuid AND app_status_uuid in ('72')) where uuid=new.app_project_uuid;

set d=( select sum(add_disk) from application where app_source_uuid=new.app_source_uuid AND app_status_uuid in ('71','72','73') );
set e=( select sum(add_disk) from application where app_source_uuid=new.app_source_uuid AND app_status_uuid in ('72') );
update source set cpu_used =(select sum(app_cpu) from application where app_source_uuid=new.app_source_uuid AND app_status_uuid in ('71','72','73')) where uuid=new.app_source_uuid;
update source set mem_used =(select sum(app_mem) from application where app_source_uuid=new.app_source_uuid AND app_status_uuid in ('71','72','73')) where uuid=new.app_source_uuid;
update source set disk_used =(d+(select sum(app_disk) from application where app_source_uuid=new.app_source_uuid AND app_status_uuid in ('71','72','73'))) where uuid=new.app_source_uuid;
update source set cpu_run =(select sum(app_cpu) from application where app_source_uuid=new.app_source_uuid AND app_status_uuid in ('72')) where uuid=new.app_source_uuid;
update source set mem_run =(select sum(app_mem) from application where app_source_uuid=new.app_source_uuid AND app_status_uuid in ('72')) where uuid=new.app_source_uuid;
update source set disk_run =(e+(select sum(app_disk) from application where app_source_uuid=new.app_source_uuid AND app_status_uuid in ('72'))) where uuid=new.app_source_uuid;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `up_project_delete`;
DELIMITER ;;
CREATE TRIGGER `up_project_delete` AFTER DELETE ON `application` FOR EACH ROW begin
declare b int;
declare c int;
declare d int;
declare e int;
set b=( select sum(app_disk) from application where app_project_uuid=old.app_project_uuid AND app_status_uuid in ('72') );
set c=( select sum(app_disk) from application where app_project_uuid=old.app_project_uuid AND app_status_uuid in ('71','72','73') );
update project set disk_all=(c+(select sum(add_disk) from application where app_project_uuid=old.app_project_uuid AND app_status_uuid in ('71','72','73'))) where uuid=old.app_project_uuid;
update project set disk_used=(b+(select sum(add_disk) from application where app_project_uuid=old.app_project_uuid AND app_status_uuid in ('72'))) where uuid=old.app_project_uuid;
update project set ip_count=(select count(app_ipaddr) from application where app_project_uuid=old.app_project_uuid AND app_status_uuid in ('71','72','73')) where uuid=old.app_project_uuid;
update project set app_count=(select count(*) from application where app_project_uuid=old.app_project_uuid AND app_status_uuid in ('71','72','73')) where uuid=old.app_project_uuid;
update project set cpu_all=(select sum(app_cpu) from application where app_project_uuid=old.app_project_uuid AND app_status_uuid in ('71','72','73')) where uuid=old.app_project_uuid;
update project set mem_all=(select sum(app_mem) from application where app_project_uuid=old.app_project_uuid AND app_status_uuid in ('71','72','73')) where uuid=old.app_project_uuid;
update project set cpu_used=(select sum(app_cpu) from application where app_project_uuid=old.app_project_uuid AND app_status_uuid in ('72')) where uuid=old.app_project_uuid;
update project set mem_used=(select sum(app_mem) from application where app_project_uuid=old.app_project_uuid AND app_status_uuid in ('72')) where uuid=old.app_project_uuid;

set d=( select sum(add_disk) from application where app_source_uuid=old.app_source_uuid AND app_status_uuid in ('71','72','73') );
set e=( select sum(add_disk) from application where app_source_uuid=old.app_source_uuid AND app_status_uuid in ('72') );
update source set cpu_used =(select sum(app_cpu) from application where app_source_uuid=old.app_source_uuid AND app_status_uuid in ('71','72','73')) where uuid=old.app_source_uuid;
update source set mem_used =(select sum(app_mem) from application where app_source_uuid=old.app_source_uuid AND app_status_uuid in ('71','72','73')) where uuid=old.app_source_uuid;
update source set disk_used =(d+(select sum(app_disk) from application where app_source_uuid=old.app_source_uuid AND app_status_uuid in ('71','72','73'))) where uuid=old.app_source_uuid;
update source set cpu_run =(select sum(app_cpu) from application where app_source_uuid=old.app_source_uuid AND app_status_uuid in ('72')) where uuid=old.app_source_uuid;
update source set mem_run =(select sum(app_mem) from application where app_source_uuid=old.app_source_uuid AND app_status_uuid in ('72')) where uuid=old.app_source_uuid;
update source set disk_run =(e+(select sum(app_disk) from application where app_source_uuid=old.app_source_uuid AND app_status_uuid in ('72'))) where uuid=old.app_source_uuid;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `up_ip`;
DELIMITER ;;
CREATE TRIGGER `up_ip` AFTER UPDATE ON `ipaddrs` FOR EACH ROW begin
declare c int;
set c = (select count(*) from ipaddrs where ipaddr_status_uuid in ('22','23','24') and source_uuid=new.source_uuid);
update source set ip_used = c  where uuid = new.source_uuid;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `del_chil`;
DELIMITER ;;
CREATE TRIGGER `del_chil` AFTER DELETE ON `tasks` FOR EACH ROW delete from child_task where task_uuid = OLD.uuid
;;
DELIMITER ;
