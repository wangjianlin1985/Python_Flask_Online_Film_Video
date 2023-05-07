/*
Navicat MySQL Data Transfer

Source Server         : mysql5.6
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : movie_db

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2020-06-23 23:59:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `is_super` smallint(6) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `role_id` (`role_id`),
  KEY `ix_admin_addtime` (`addtime`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'pbkdf2:sha256:50000$TkDYOzbu$fb0c5b1d67dfced7d8e7ceaf0bb382845d88d75d4fac77467699d5c1428bd666', '0', '1', '2020-06-23 17:08:22');
INSERT INTO `admin` VALUES ('2', 'syl', 'pbkdf2:sha256:50000$71CUEfvb$59b7fb4e2227bfe7a22be84cfeaab845f04783a72ed97c328d608f6de0c210cf', '1', '1', '2020-06-23 19:47:34');

-- ----------------------------
-- Table structure for `adminlog`
-- ----------------------------
DROP TABLE IF EXISTS `adminlog`;
CREATE TABLE `adminlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `ix_adminlog_addtime` (`addtime`),
  CONSTRAINT `adminlog_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adminlog
-- ----------------------------
INSERT INTO `adminlog` VALUES ('1', '1', '127.0.0.1', '2020-06-23 17:17:07');
INSERT INTO `adminlog` VALUES ('2', '1', '127.0.0.1', '2020-06-23 17:19:32');
INSERT INTO `adminlog` VALUES ('3', '1', '127.0.0.1', '2020-06-23 17:43:04');
INSERT INTO `adminlog` VALUES ('4', '1', '127.0.0.1', '2020-06-23 18:25:19');
INSERT INTO `adminlog` VALUES ('5', '1', '127.0.0.1', '2020-06-23 18:25:19');
INSERT INTO `adminlog` VALUES ('6', '1', '127.0.0.1', '2020-06-23 19:38:10');
INSERT INTO `adminlog` VALUES ('7', '1', '127.0.0.1', '2020-06-23 22:48:22');
INSERT INTO `adminlog` VALUES ('8', '1', '127.0.0.1', '2020-06-23 23:43:25');

-- ----------------------------
-- Table structure for `auth`
-- ----------------------------
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `url` (`url`),
  KEY `ix_auth_addtime` (`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth
-- ----------------------------

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `movie_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `user_id` (`user_id`),
  KEY `ix_comment_addtime` (`addtime`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '这个电影很好看啊！', '1', '1', '2020-06-23 19:33:28');
INSERT INTO `comment` VALUES ('2', '这个电影很好看啊！', '1', '1', '2020-06-23 19:33:29');
INSERT INTO `comment` VALUES ('3', '好精彩的电影', '1', '2', '2020-06-23 19:43:47');
INSERT INTO `comment` VALUES ('5', '很好的！', '3', '1', '2020-06-23 23:42:23');

-- ----------------------------
-- Table structure for `movie`
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `info` text,
  `logo` varchar(255) DEFAULT NULL,
  `star` smallint(6) DEFAULT NULL,
  `playnum` bigint(20) DEFAULT NULL,
  `commentnum` bigint(20) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `release_time` date DEFAULT NULL,
  `length` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `url` (`url`),
  UNIQUE KEY `logo` (`logo`),
  KEY `tag_id` (`tag_id`),
  KEY `ix_movie_addtime` (`addtime`),
  CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES ('1', '蜘蛛侠英雄归来', '20200623174554ea22a54d88b74e969cff091af7fb7e37.mp4', '彼得帕克在内战后受到了钢铁侠托尼斯塔克的赏识，表面上，彼得进入托尼的公司成为了一名实习生，实际上，他和复仇者联盟的成员们一起接受了各种各样的训练。托尼虽然欣赏彼得的勇敢和正直，却并不认为他目前已经拥有加入复联的实力，他派出了特工哈皮暗中观察，这让十分想证明自己的彼得感到万分焦躁。在对付两个银行劫匪的过程中，彼得发现劫匪们使用的是一种前所未见的新型武器，他孤身一人深入敌后顺藤摸瓜找到了幕后主使秃鹰，让他彼得没有想到的是，秃鹰竟然是他爱慕的女生利兹的父亲。', '202006231815220a6174c62ad94f04979d0a06993da5a5.jpg', '4', '31', '3', '1', '中国', '2020-06-19', '120', '2020-06-23 17:45:54');
INSERT INTO `movie` VALUES ('2', '最强铁血奶爸', '20200623182853f14cdc780c714fb5a050e625cd2483b9.mp4', '一队特种兵在公海上执行解救人质的行动匪徒中，队员周勇的失误导致其他队员全部牺牲。周勇从此内疚消沉，直到两年后的一天，曾经牺牲队长陈鹏的八岁女儿小米和两岁儿子小豆主动找上门来，周勇被迫做起了临时奶爸，硬着头皮对付两个孩子。两年前那次任务结下的仇人匪徒逐渐逼近周勇，并把复仇的魔爪伸向了孩子。周勇点燃了心中的怒火，为了保护孩子们，也为了曾经牺牲的队友们，和悍匪展开一场残酷的生死对决。', '202006231828531360bcda935b4848bbf610667ec5df6b.jpg', '5', '0', '0', '3', '中国', '2020-06-27', '120', '2020-06-23 18:28:53');
INSERT INTO `movie` VALUES ('3', '意外英雄', '202006231835229f6bbbb9b207456ea6e268c9f5640f54.mp4', '草根男齐圣为父还债接受了一项神秘任务，租下豪华别墅寻找遗嘱。在此过程中结识房主千金江新，却不料接二连三的意外事件房主变成了房客，两人意外同居。与江新的朝夕相处中发现了她的单纯和善良，落难的江新与自己的任务似乎息息相关，他的雇主究竟是谁？一个更大的阴谋渐渐浮出水面，生性懦弱的齐圣面对爱情与金钱该何去何从，他的内心已经有了答案', '20200623183522bc18725dbaa4413e8c968c3854374f41.jpg', '4', '5', '1', '1', '美国', '2020-06-13', '126', '2020-06-23 18:35:23');
INSERT INTO `movie` VALUES ('4', '捍战', '20200623183711f5118d874d4a48c69a996c0d70079c11.mp4', '文睿(林哲熹 饰)是一名前途似锦的职业篮球选手，因丑闻事件被逐出篮坛，没名没利没朋友，文睿生活陷入困境，庞大的赔偿金让他铤而走险与窃车集团合作，身边只剩女性好友昕洁(李千娜 饰)始终关心他。 某天文睿一如往常寻找目标，意外发现全身是血的雅惠(谢欣颖 饰)，正当他想一探究竟，却被人称｢雨衣大盗｣的标哥(吴慷仁 饰)挟持，从此被当成雨衣大盗的同伙。 老练刑警陈木(高捷 饰)，立刻盯上了这条线索，唯一能证明自己清白的雅惠仍昏迷不醒，被迫逃亡的文睿逐渐对标哥产生英雄相惜的情感，两个穷途末路的人，为了突破现况，决定一起干一票大的！', '2020062318371111f811020fbb42648ae7caa8c20814da.jpg', '5', '0', '0', '3', '美国', '2020-06-22', '130', '2020-06-23 18:37:12');
INSERT INTO `movie` VALUES ('5', '疯魔神丐苏乞儿', '20200623183831ede1ab3acf564930a471e739583fdfbf.mp4', '《疯魔神丐苏乞儿》讲述了主人公武状元苏灿打压贩卖大烟的天门教时意外受伤失忆，流落街头沦为乞丐苏乞儿，在做乞丐的时候被金枝和小果母女收留。因为鸦片烟膏泄露，小果被天门教抓走，苏乞儿为了救照顾自己的小女孩小果，破坏了天门教的阴谋，最终与官府一起铲除天门教的故事。', '20200623183831c4876bd5e2a4478ea23af0e2eb97b96d.jpg', '4', '2', '0', '3', '中国', '2020-06-24', '120', '2020-06-23 18:38:32');

-- ----------------------------
-- Table structure for `moviecol`
-- ----------------------------
DROP TABLE IF EXISTS `moviecol`;
CREATE TABLE `moviecol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `user_id` (`user_id`),
  KEY `ix_moviecol_addtime` (`addtime`),
  CONSTRAINT `moviecol_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  CONSTRAINT `moviecol_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of moviecol
-- ----------------------------
INSERT INTO `moviecol` VALUES ('1', '1', '1', '2020-06-23 19:35:57');
INSERT INTO `moviecol` VALUES ('2', '3', '1', '2020-06-23 19:36:06');
INSERT INTO `moviecol` VALUES ('3', '1', '2', '2020-06-23 19:44:09');
INSERT INTO `moviecol` VALUES ('4', '5', '1', '2020-06-23 23:42:55');

-- ----------------------------
-- Table structure for `oplog`
-- ----------------------------
DROP TABLE IF EXISTS `oplog`;
CREATE TABLE `oplog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `reason` varchar(600) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `ix_oplog_addtime` (`addtime`),
  CONSTRAINT `oplog_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oplog
-- ----------------------------
INSERT INTO `oplog` VALUES ('1', '1', '127.0.0.1', '添加标签:经典搞笑', '2020-06-23 17:23:06');
INSERT INTO `oplog` VALUES ('2', '1', '127.0.0.1', '添加标签:教学视频', '2020-06-23 17:43:23');
INSERT INTO `oplog` VALUES ('3', '1', '127.0.0.1', '添加电影:《鱼香茄子制作视频》', '2020-06-23 17:45:54');
INSERT INTO `oplog` VALUES ('4', '1', '127.0.0.1', '添加标签:动作', '2020-06-23 17:53:29');
INSERT INTO `oplog` VALUES ('5', '1', '127.0.0.1', '添加标签:科幻', '2020-06-23 17:53:43');
INSERT INTO `oplog` VALUES ('6', '1', '127.0.0.1', '添加标签:恐怖', '2020-06-23 17:53:49');
INSERT INTO `oplog` VALUES ('7', '1', '127.0.0.1', '添加预告:蜘蛛侠英雄归来', '2020-06-23 18:00:07');
INSERT INTO `oplog` VALUES ('8', '1', '127.0.0.1', '添加预告:最强铁血奶爸', '2020-06-23 18:03:50');
INSERT INTO `oplog` VALUES ('9', '1', '127.0.0.1', '添加预告:意外英雄', '2020-06-23 18:06:17');
INSERT INTO `oplog` VALUES ('10', '1', '127.0.0.1', '添加预告:捍战', '2020-06-23 18:10:47');
INSERT INTO `oplog` VALUES ('11', '1', '127.0.0.1', '添加预告:疯魔神丐苏乞儿', '2020-06-23 18:12:05');
INSERT INTO `oplog` VALUES ('12', '1', '127.0.0.1', '添加电影:《最强铁血奶爸》', '2020-06-23 18:28:53');
INSERT INTO `oplog` VALUES ('13', '1', '127.0.0.1', '添加电影:《意外英雄》', '2020-06-23 18:35:23');
INSERT INTO `oplog` VALUES ('14', '1', '127.0.0.1', '添加电影:《捍战》', '2020-06-23 18:37:12');
INSERT INTO `oplog` VALUES ('15', '1', '127.0.0.1', '添加电影:《疯魔神丐苏乞儿》', '2020-06-23 18:38:32');

-- ----------------------------
-- Table structure for `preview`
-- ----------------------------
DROP TABLE IF EXISTS `preview`;
CREATE TABLE `preview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `logo` (`logo`),
  KEY `ix_preview_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of preview
-- ----------------------------
INSERT INTO `preview` VALUES ('1', '蜘蛛侠英雄归来', '20200623180006c0160251197842e78a037d8f3b6696ed.jpg', '2020-06-23 18:00:07');
INSERT INTO `preview` VALUES ('2', '最强铁血奶爸', '20200623180350558bf995f4ba42578edb04f18addb09b.jpg', '2020-06-23 18:03:50');
INSERT INTO `preview` VALUES ('3', '意外英雄', '20200623180617d89bf93164ce472cbd947bafb5e0458a.jpg', '2020-06-23 18:06:17');
INSERT INTO `preview` VALUES ('4', '捍战', '20200623181046d66cd407922642f5b388a3939b0ec9e1.jpg', '2020-06-23 18:10:47');
INSERT INTO `preview` VALUES ('5', '疯魔神丐苏乞儿', '2020062318120552ce6c7542ab4c4686e80c83e9067102.jpg', '2020-06-23 18:12:05');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `auths` varchar(600) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `ix_role_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '', '2020-06-23 17:08:22');

-- ----------------------------
-- Table structure for `tag`
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `ix_tag_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('1', '爱情', '2020-06-23 17:23:06');
INSERT INTO `tag` VALUES ('2', '教学', '2020-06-23 17:43:23');
INSERT INTO `tag` VALUES ('3', '动作', '2020-06-23 17:53:29');
INSERT INTO `tag` VALUES ('4', '科幻', '2020-06-23 17:53:43');
INSERT INTO `tag` VALUES ('5', '恐怖', '2020-06-23 17:53:49');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `info` text,
  `face` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `face` (`face`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `ix_user_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '汪大神', 'pbkdf2:sha256:50000$oRYF9CWK$592f6bca5582b0f01047d7e7a806731fba80b28318c03c0b3f890e2523512825', '254540457@qq.com', '13508120834', '我是大神啊啊啊', '202006231935061b6065c481d048948234e3f11fe188e9.jpg', '2020-06-23 17:38:07', 'e9ad1b4fd7554508b8c9679ef1d01c2e');
INSERT INTO `user` VALUES ('2', '双鱼林', 'pbkdf2:sha256:50000$Q2RYm4gN$b6113fa12ab42cb2f64163766d4c9a8a2718a00dd7fc317705c9d04a3f7a774f', 'dashen@126.com', '13500830934', '牛人', '202006231943260e9ee2fbf5f74e3fa030e442d6e69213.jpg', '2020-06-23 19:42:44', 'fe98b6318e394756b4e4f934566b90c4');

-- ----------------------------
-- Table structure for `userlog`
-- ----------------------------
DROP TABLE IF EXISTS `userlog`;
CREATE TABLE `userlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `ix_userlog_addtime` (`addtime`),
  CONSTRAINT `userlog_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userlog
-- ----------------------------
INSERT INTO `userlog` VALUES ('1', '1', '127.0.0.1', '2020-06-23 17:42:19');
INSERT INTO `userlog` VALUES ('2', '1', '127.0.0.1', '2020-06-23 17:42:19');
INSERT INTO `userlog` VALUES ('3', '1', '127.0.0.1', '2020-06-23 19:26:50');
INSERT INTO `userlog` VALUES ('4', '2', '127.0.0.1', '2020-06-23 19:43:00');
INSERT INTO `userlog` VALUES ('5', '2', '127.0.0.1', '2020-06-23 19:43:01');
INSERT INTO `userlog` VALUES ('6', '1', '127.0.0.1', '2020-06-23 23:41:46');
