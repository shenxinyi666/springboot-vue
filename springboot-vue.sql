/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50533
Source Host           : localhost:3306
Source Database       : springboot-vue

Target Server Type    : MYSQL
Target Server Version : 50533
File Encoding         : 65001

Date: 2021-09-04 20:57:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '作者',
  `create_time` datetime DEFAULT NULL COMMENT '出版日期',
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '封面地址',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', 'Java', '100.00', '管理员', '2021-08-28 00:00:00', 'http://localhost:9090/files/5ba48630deb248b5b5962ec001f495d5', '1');
INSERT INTO `book` VALUES ('2', 'Java核心技术', '200.00', '管理员', '2021-08-28 00:00:00', 'http://localhost:9090/files/54fc8ab4fe034f2b892bc833b6a880b5', '1');
INSERT INTO `book` VALUES ('3', 'C#', '150.00', '张三', '2021-08-28 00:00:00', 'http://localhost:9090/files/fe6ca72515ee452b80299421aa42c4af', '2');
INSERT INTO `book` VALUES ('4', 'C++', '160.00', '张三', '2021-08-28 00:00:00', 'http://localhost:9090/files/a9c7d04395e64d689cfce8e3b9867456', '2');
INSERT INTO `book` VALUES ('5', 'Python', '60.00', '李四', '2021-08-28 00:00:00', 'http://localhost:9090/files/7472a69684cb41b29b95dfc0ade3b9f3', '3');
INSERT INTO `book` VALUES ('6', 'HTML5', '160.00', '李四', '2021-08-28 00:00:00', 'http://localhost:9090/files/9d938eebd1df48fa90e8d9e3a36b3ace', '3');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `pid` int(11) DEFAULT NULL COMMENT '父节点id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '文学', null);
INSERT INTO `category` VALUES ('2', '童书', '1');
INSERT INTO `category` VALUES ('3', '社会科学', '1');
INSERT INTO `category` VALUES ('4', '经济学', '1');
INSERT INTO `category` VALUES ('5', '科普百科', '2');
INSERT INTO `category` VALUES ('7', '法律', '3');

-- ----------------------------
-- Table structure for `fruit`
-- ----------------------------
DROP TABLE IF EXISTS `fruit`;
CREATE TABLE `fruit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `source` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产地',
  `production_date` datetime DEFAULT NULL COMMENT '生产日期',
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fruit
-- ----------------------------
INSERT INTO `fruit` VALUES ('1', '西柚', '10.00', '江苏', '2021-08-18 00:00:00', 'http://localhost:9090/files/af4733dc406c4615b8bda081732702c2', '1');
INSERT INTO `fruit` VALUES ('2', '坚果', '30.00', '浙江', '2021-08-28 00:00:00', 'http://localhost:9090/files/987d06676c7e4bf593c7cf5759065833', '1');
INSERT INTO `fruit` VALUES ('3', '柠檬', '15.00', '台湾', '2021-08-28 00:00:00', 'http://localhost:9090/files/bf237941c6904bef831b0a7ccbefb56f', '1');
INSERT INTO `fruit` VALUES ('4', '芒果', '20.00', '云南', '2021-08-28 00:00:00', 'http://localhost:9090/files/ccf8bf4a219041e09419d1393d4b0314', '1');
INSERT INTO `fruit` VALUES ('5', '橙子', '15.00', '江苏', '2021-08-28 00:00:00', 'http://localhost:9090/files/f87f2a9f7d1e480f9bbc62918e406429', '1');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `content` text CHARACTER SET utf8mb4 COMMENT '内容',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论人',
  `time` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '评论时间',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `foreign_id` bigint(20) DEFAULT '0' COMMENT '关联id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='留言表';

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('22', '老弟', '管理员', '2021-05-22 10:51:07', '21', '0');
INSERT INTO `message` VALUES ('23', '哈哈哈', '张三', '2021-05-24 17:13:45', '22', '0');
INSERT INTO `message` VALUES ('29', 'Hello World！', '张三', '2021-08-31 18:39:34', null, '0');
INSERT INTO `message` VALUES ('32', 'Hello！', '管理员', '2021-09-01 14:15:53', '29', '0');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '作者',
  `time` datetime DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '123', '<p>123</p>', '张三', '2021-07-17 18:55:27');
INSERT INTO `news` VALUES ('2', '123', '<p>123</p>', '管理员', '2021-08-19 17:11:55');

-- ----------------------------
-- Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `total_price` decimal(10,2) DEFAULT NULL COMMENT '总价',
  `pay_price` decimal(10,2) DEFAULT NULL COMMENT '实付款',
  `discount` decimal(10,2) DEFAULT '0.00' COMMENT '优惠金额',
  `transport_price` decimal(10,2) DEFAULT '0.00' COMMENT '运费',
  `order_no` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单编号',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户账户',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `pay_time` timestamp NULL DEFAULT NULL COMMENT '支付时间',
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1', 'Java', '60.00', '60.00', '0.00', '0.00', '1433725938415255552', '1', 'admin', '2021-09-04 20:52:31', null, '0');
INSERT INTO `t_order` VALUES ('2', 'C#', '60.00', '60.00', '0.00', '0.00', '1433726340019830784', '1', 'admin', '2021-09-04 20:52:33', null, '1');
INSERT INTO `t_order` VALUES ('3', 'Python', '60.00', '60.00', '0.00', '0.00', '1433727333361074176', '1', 'admin', '2021-09-03 17:44:27', '2021-09-03 17:44:26', '1');
INSERT INTO `t_order` VALUES ('4', 'Java', '100.00', '100.00', '0.00', '0.00', '1434113995740033024', '2', '张三', '2021-09-04 19:19:55', null, '0');
INSERT INTO `t_order` VALUES ('9', 'C#', '150.00', '150.00', '0.00', '0.00', '1434117294916644864', '1', '管理员', '2021-09-04 19:33:02', null, '0');
INSERT INTO `t_order` VALUES ('25', 'Java', '100.00', '100.00', '0.00', '0.00', '1434132766429134848', '1', '管理员', '2021-09-04 20:36:03', '2021-09-04 20:36:01', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `nick_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `sex` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '性别',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `role` int(11) DEFAULT NULL COMMENT '角色，1：管理员，2：普通用户',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `account` decimal(11,0) DEFAULT NULL COMMENT '账户余额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户信息表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '管理员', '123', '管理员', '20', '男', '北京', '1', 'http://localhost:9090/files/b94dfe76e9d64bea92e608799e95f5fb', '1000');
INSERT INTO `user` VALUES ('2', '张三', '123', '张三', '20', '男', '上海', '2', null, '300');
INSERT INTO `user` VALUES ('3', '李四', '123', '李四', '18', '男', '深圳', '2', null, '600');
