/*
SQLyog v10.2 
MySQL - 5.7.4-m14 : Database - flsystem
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`flsystem` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `flsystem`;

/*Table structure for table `control` */

DROP TABLE IF EXISTS `control`;

CREATE TABLE `control` (
  `annual` varchar(4) COLLATE utf8_unicode_ci NOT NULL COMMENT '年度',
  `eachselect` tinyint(4) DEFAULT '0' COMMENT '互选开始：0：未开始，1：开始，2：结束',
  `channelselect` tinyint(4) DEFAULT '0' COMMENT '通道选择：0：未开始，1：开始，2：结束',
  `specSelect` tinyint(4) DEFAULT '0' COMMENT '专业选择：0：未开始，1：开始，2：结束',
  `startTime` datetime DEFAULT NULL COMMENT '开始时间',
  PRIMARY KEY (`annual`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='互选、专业选择控制';

/*Data for the table `control` */

insert  into `control`(`annual`,`eachselect`,`channelselect`,`specSelect`,`startTime`) values ('2012',2,2,0,'2015-01-03 10:20:08'),('2013',1,0,0,'2015-01-05 22:21:26');

/*Table structure for table `fl_bigclassname` */

DROP TABLE IF EXISTS `fl_bigclassname`;

CREATE TABLE `fl_bigclassname` (
  `bigClassID` int(11) NOT NULL AUTO_INCREMENT COMMENT '学科大类ID',
  `bigClassName` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '学科大类名称',
  `descript` text COLLATE utf8_unicode_ci COMMENT '描述',
  PRIMARY KEY (`bigClassID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='学科大类';

/*Data for the table `fl_bigclassname` */

insert  into `fl_bigclassname`(`bigClassID`,`bigClassName`,`descript`) values (1,'生物工程类',NULL),(2,'生物技术类',NULL),(3,'植物科学类',NULL),(4,'动物科学类',NULL);

/*Table structure for table `fl_courses` */

DROP TABLE IF EXISTS `fl_courses`;

CREATE TABLE `fl_courses` (
  `courseID` varchar(12) COLLATE utf8_unicode_ci NOT NULL COMMENT '课程编号',
  `courseName` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '课程名',
  `credit` decimal(3,1) NOT NULL DEFAULT '0.0' COMMENT '学分',
  `courseType` enum('学科大类基础','学科基础课','专业课','集中实践环节','其它') COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '课程类型',
  `courseHours` int(11) DEFAULT NULL COMMENT '学时数',
  PRIMARY KEY (`courseID`),
  KEY `scend` (`courseName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='课程信息';

/*Data for the table `fl_courses` */

insert  into `fl_courses`(`courseID`,`courseName`,`credit`,`courseType`,`courseHours`) values ('04004','动物育种学','4.0','学科大类基础',72),('04006','生物统计学','2.5','学科基础课',48),('04009','动物繁殖学','3.0','学科基础课',56),('04010','动物营养学','3.0','学科基础课',48),('04020','猪生产学','2.0','专业课',32),('04021','羊生产学','2.0','专业课',32),('04022','牛生产学','2.0','专业课',32),('04023','禽生产学','2.0','专业课',32);

/*Table structure for table `fl_notice` */

DROP TABLE IF EXISTS `fl_notice`;

CREATE TABLE `fl_notice` (
  `noticeID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '标题',
  `content` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT '内容',
  `pdate` datetime NOT NULL COMMENT '发布时间',
  `skipNum` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  PRIMARY KEY (`noticeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='通知';

/*Data for the table `fl_notice` */

/*Table structure for table `fl_pcourse` */

DROP TABLE IF EXISTS `fl_pcourse`;

CREATE TABLE `fl_pcourse` (
  `pcourseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程流水账号',
  `loginName` varchar(12) COLLATE utf8_unicode_ci NOT NULL COMMENT '学生ID',
  `courseID` varchar(12) COLLATE utf8_unicode_ci NOT NULL COMMENT '课程编号',
  `score` decimal(4,1) NOT NULL DEFAULT '0.0' COMMENT '成绩',
  `credit` decimal(3,1) NOT NULL DEFAULT '0.0' COMMENT '学分',
  `compulsory` enum('必修','选修') COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否必修',
  PRIMARY KEY (`loginName`,`courseID`),
  UNIQUE KEY `pcourseID` (`pcourseID`),
  KEY `fk_pcourseID` (`courseID`),
  CONSTRAINT `fk_pcourseID` FOREIGN KEY (`courseID`) REFERENCES `fl_courses` (`courseID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='（学生先修课程）';

/*Data for the table `fl_pcourse` */

insert  into `fl_pcourse`(`pcourseID`,`loginName`,`courseID`,`score`,`credit`,`compulsory`) values (5,'2012011001','04004','78.5','0.0','必修'),(6,'2012011002','04010','89.0','0.0','必修');

/*Table structure for table `fl_researchtrain` */

DROP TABLE IF EXISTS `fl_researchtrain`;

CREATE TABLE `fl_researchtrain` (
  `researchTrainID` int(11) NOT NULL AUTO_INCREMENT,
  `tranPlanID` int(11) NOT NULL COMMENT '培养计划ID',
  `demand` text COLLATE utf8_unicode_ci COMMENT '导师要求',
  PRIMARY KEY (`researchTrainID`),
  KEY `fk_rt_trainPlanID` (`tranPlanID`),
  CONSTRAINT `fk_rt_trainPlanID` FOREIGN KEY (`tranPlanID`) REFERENCES `fl_trainplan` (`tranPlanID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='(科研训练)';

/*Data for the table `fl_researchtrain` */

/*Table structure for table `fl_researchtrainstage` */

DROP TABLE IF EXISTS `fl_researchtrainstage`;

CREATE TABLE `fl_researchtrainstage` (
  `stageID` int(11) NOT NULL AUTO_INCREMENT,
  `researchTrainID` int(11) NOT NULL COMMENT '科研训练ID',
  `content` mediumtext COLLATE utf8_unicode_ci COMMENT '汇报内容',
  `isSubmit` enum('是','否') COLLATE utf8_unicode_ci NOT NULL DEFAULT '否' COMMENT '是否提交',
  PRIMARY KEY (`stageID`),
  KEY `fk_rt_reaschTrainID` (`researchTrainID`),
  CONSTRAINT `fk_rt_reaschTrainID` FOREIGN KEY (`researchTrainID`) REFERENCES `fl_researchtrain` (`researchTrainID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='(科研训练阶段汇报)';

/*Data for the table `fl_researchtrainstage` */

/*Table structure for table `fl_sms` */

DROP TABLE IF EXISTS `fl_sms`;

CREATE TABLE `fl_sms` (
  `smsID` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '主题',
  `content` varchar(250) COLLATE utf8_unicode_ci NOT NULL COMMENT '内容',
  `from` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'sys' COMMENT '登录名，或sys(系统)',
  `to` varchar(250) COLLATE utf8_unicode_ci NOT NULL COMMENT '登录名列表，或all',
  `isRead` enum('true','false') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false' COMMENT '是否阅读',
  `pdate` datetime NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`smsID`),
  KEY `fk_sms_loginName` (`to`),
  KEY `fk_from_user` (`from`),
  CONSTRAINT `fk_from_user` FOREIGN KEY (`from`) REFERENCES `fl_user` (`loginName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='站内短信';

/*Data for the table `fl_sms` */

/*Table structure for table `fl_sp_core_courses` */

DROP TABLE IF EXISTS `fl_sp_core_courses`;

CREATE TABLE `fl_sp_core_courses` (
  `spCourseID` int(11) NOT NULL AUTO_INCREMENT,
  `specialtyID` int(11) NOT NULL,
  `courseID` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`spCourseID`),
  KEY `fk_spc_spID` (`specialtyID`),
  KEY `fk_spc_courseID` (`courseID`),
  CONSTRAINT `fk_spc_courseID` FOREIGN KEY (`courseID`) REFERENCES `fl_courses` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_spc_spID` FOREIGN KEY (`specialtyID`) REFERENCES `fl_specialty` (`specialtyID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='(专业核心课程)';

/*Data for the table `fl_sp_core_courses` */

/*Table structure for table `fl_specialty` */

DROP TABLE IF EXISTS `fl_specialty`;

CREATE TABLE `fl_specialty` (
  `specialtyID` int(11) NOT NULL AUTO_INCREMENT COMMENT '专业ID',
  `bigClassID` int(11) NOT NULL COMMENT '所属学科大类ID',
  `specialtyName` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '专业名称',
  `descript` mediumtext COLLATE utf8_unicode_ci COMMENT '专业简介',
  PRIMARY KEY (`specialtyID`),
  KEY `fk_sp_bigClass` (`bigClassID`),
  CONSTRAINT `fk_sp_bigClass` FOREIGN KEY (`bigClassID`) REFERENCES `fl_bigclassname` (`bigClassID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='专业';

/*Data for the table `fl_specialty` */

insert  into `fl_specialty`(`specialtyID`,`bigClassID`,`specialtyName`,`descript`) values (1,1,'草业科学',NULL);

/*Table structure for table `fl_student` */

DROP TABLE IF EXISTS `fl_student`;

CREATE TABLE `fl_student` (
  `loginName` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `grade` char(4) COLLATE utf8_unicode_ci NOT NULL COMMENT '年级',
  `className` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '班级',
  `specialtyID` int(11) DEFAULT NULL COMMENT '专业编号',
  `sixGrade` decimal(6,1) DEFAULT '0.0' COMMENT '六级最高成绩',
  `self_rec` mediumtext COLLATE utf8_unicode_ci COMMENT '自荐书',
  `checked` tinyint(4) DEFAULT '0' COMMENT '自荐书是否提交，0：保存，1：提交',
  `uName` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '姓名',
  `sex` enum('男','女') COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '性别',
  `email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `qq` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'QQ号',
  `webAddr` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '个人网站',
  `phone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话',
  `tutorselected` tinyint(1) DEFAULT '0' COMMENT '选择导师完成，0：未完选择，1：选择导师；2：导师确定，完成互选',
  `bigclassId` int(11) DEFAULT NULL COMMENT '学科大类ID',
  `channel` enum('校内贯通培养','普通本科培养') COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '，',
  `specselected` tinyint(4) DEFAULT '0' COMMENT '选择专业完成，0：未完成，1：学院审核，2：导师审核，3：完成',
  `discipline` enum('有','无') COLLATE utf8_unicode_ci DEFAULT '无' COMMENT '有无违纪',
  `creditscore` decimal(4,1) DEFAULT NULL COMMENT '学分成绩',
  `tutorID` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '导师ID',
  PRIMARY KEY (`loginName`),
  KEY `fk_spc_student` (`specialtyID`),
  KEY `fk_totur_id` (`tutorID`),
  CONSTRAINT `fk_spc_student` FOREIGN KEY (`specialtyID`) REFERENCES `fl_specialty` (`specialtyID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_totur_id` FOREIGN KEY (`tutorID`) REFERENCES `fl_tutor` (`loginName`),
  CONSTRAINT `fk_user_student` FOREIGN KEY (`loginName`) REFERENCES `fl_user` (`loginName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='学生信息';

/*Data for the table `fl_student` */

insert  into `fl_student`(`loginName`,`grade`,`className`,`specialtyID`,`sixGrade`,`self_rec`,`checked`,`uName`,`sex`,`email`,`qq`,`webAddr`,`phone`,`tutorselected`,`bigclassId`,`channel`,`specselected`,`discipline`,`creditscore`,`tutorID`) values ('2012011001','2013','制药工程01',1,'434.0','dsadASDDASD',1,'李静楠j','女',NULL,NULL,NULL,NULL,0,1,'校内贯通培养',3,'有','82.0',NULL),('2012011002','2012','制药工程01',NULL,'434.0',NULL,0,'李静楠','女',NULL,NULL,NULL,NULL,0,1,NULL,0,'无','82.0',NULL),('2012011003','2012','制药工程01',NULL,'434.0',NULL,0,'李静楠','女',NULL,NULL,NULL,NULL,0,1,NULL,0,'无','82.0',NULL),('2012011004','2012','制药工程01',NULL,'434.0',NULL,0,'李静楠','女',NULL,NULL,NULL,NULL,0,1,NULL,0,'无','82.0',NULL),('2012011005','2012','制药工程01',NULL,'434.0',NULL,0,'李静楠','女',NULL,NULL,NULL,NULL,0,1,NULL,0,'无','82.0',NULL),('2012011006','2012','制药工程01',NULL,'434.0',NULL,0,'李静楠','女',NULL,NULL,NULL,NULL,0,1,NULL,0,'无','82.0',NULL),('2012011007','2012','制药工程01',NULL,'434.0',NULL,0,'李静楠','女',NULL,NULL,NULL,NULL,0,1,NULL,0,'无','82.0',NULL),('2012011008','2012','制药工程01',NULL,'434.0',NULL,0,'李静楠','女',NULL,NULL,NULL,NULL,0,1,NULL,0,'无','82.0',NULL),('2012011009','2012','制药工程01',NULL,'434.0',NULL,0,'李静楠','女',NULL,NULL,NULL,NULL,0,1,NULL,0,'无','82.0',NULL),('2012011012','2012','制药工程01',NULL,'434.0',NULL,0,'李静楠','女',NULL,NULL,NULL,NULL,0,1,NULL,0,'无','82.0',NULL),('2012011013','2012','制药工程01',NULL,'434.0',NULL,0,'李静楠','女',NULL,NULL,NULL,NULL,0,1,NULL,0,'无','82.0',NULL),('2012011014','2012','制药工程01',NULL,'434.0',NULL,0,'李静楠','女',NULL,NULL,NULL,NULL,0,1,NULL,0,'无','82.0',NULL),('2012011015','2012','制药工程01',NULL,'434.0',NULL,0,'李静楠','女',NULL,NULL,NULL,NULL,0,1,NULL,0,'无','82.0',NULL),('2012011016','2012','制药工程01',NULL,'434.0',NULL,0,'李静楠','女',NULL,NULL,NULL,NULL,0,1,NULL,0,'无','82.0',NULL),('2012011017','2012','制药工程01',NULL,'434.0',NULL,0,'李静楠','女',NULL,NULL,NULL,NULL,0,1,NULL,0,'无','82.0',NULL),('2012011018','2012','制药工程02',NULL,'434.0',NULL,0,'李静楠','女',NULL,NULL,NULL,NULL,0,1,NULL,0,'无','82.0',NULL),('2012011019','2012','制药工程02',NULL,'434.0',NULL,0,'李静楠','女',NULL,NULL,NULL,NULL,0,1,NULL,0,'无','82.0',NULL),('2012011020','2012','制药工程02',NULL,'434.0',NULL,0,'李静楠','女',NULL,NULL,NULL,NULL,0,1,NULL,0,'无','82.0',NULL),('2012011021','2012','制药工程02',NULL,'434.0',NULL,0,'李静楠','女',NULL,NULL,NULL,NULL,0,1,NULL,0,'无','82.0',NULL),('2012011022','2012','制药工程02',NULL,'434.0',NULL,0,'李静楠','女',NULL,NULL,NULL,NULL,0,1,NULL,0,'无','82.0',NULL),('2012011023','2012','制药工程02',NULL,'434.0',NULL,0,'李静楠','女',NULL,NULL,NULL,NULL,0,1,NULL,0,'无','82.0',NULL),('2012011024','2012','制药工程02',NULL,'434.0',NULL,0,'李静楠','女',NULL,NULL,NULL,NULL,0,1,NULL,0,'无','82.0',NULL),('2012011025','2012','制药工程02',NULL,'434.0',NULL,0,'李静楠','女',NULL,NULL,NULL,NULL,0,1,NULL,0,'无','82.0',NULL),('2012011026','2012','制药工程02',NULL,'434.0',NULL,0,'李静楠','女',NULL,NULL,NULL,NULL,0,1,NULL,0,'无','82.0',NULL),('2012011027','2012','制药工程02',NULL,'434.0',NULL,0,'李静楠','女',NULL,NULL,NULL,NULL,0,1,NULL,0,'无','82.0',NULL),('2012011028','2012','制药工程02',NULL,'434.0',NULL,0,'李静楠','女',NULL,NULL,NULL,NULL,0,1,NULL,0,'无','82.0',NULL),('2012011029','2012','制药工程02',NULL,'434.0',NULL,0,'李静楠','女',NULL,NULL,NULL,NULL,0,1,NULL,0,'无','82.0',NULL);

/*Table structure for table `fl_trainplan` */

DROP TABLE IF EXISTS `fl_trainplan`;

CREATE TABLE `fl_trainplan` (
  `tranPlanID` int(11) NOT NULL AUTO_INCREMENT,
  `studentID` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `teachCheck` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否审核,0:未审核，1：有意见，2：审核通过',
  `isModify` enum('是','否') COLLATE utf8_unicode_ci NOT NULL DEFAULT '否' COMMENT '是否修改',
  `isSubmit` enum('是','否') COLLATE utf8_unicode_ci NOT NULL DEFAULT '否' COMMENT '是否提交',
  `advise` text COLLATE utf8_unicode_ci COMMENT '修改意见',
  PRIMARY KEY (`tranPlanID`),
  KEY `fk_tp_studentID` (`studentID`),
  CONSTRAINT `fk_tp_studentID` FOREIGN KEY (`studentID`) REFERENCES `fl_user` (`loginName`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='(培养方案)';

/*Data for the table `fl_trainplan` */

/*Table structure for table `fl_trainplan_courses` */

DROP TABLE IF EXISTS `fl_trainplan_courses`;

CREATE TABLE `fl_trainplan_courses` (
  `trainCourseID` int(11) NOT NULL,
  `courseID` varchar(12) COLLATE utf8_unicode_ci NOT NULL COMMENT '课程编号',
  `studentID` varchar(12) COLLATE utf8_unicode_ci NOT NULL COMMENT '学生学号',
  `scorce` decimal(4,1) unsigned zerofill NOT NULL DEFAULT '000.0' COMMENT '成绩',
  `semester` enum('1','2','3','4','5','6','7','8') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '开课学期',
  `finished` tinyint(4) DEFAULT '0' COMMENT '是否完成',
  PRIMARY KEY (`trainCourseID`),
  KEY `fk_tpc_courseID` (`courseID`),
  KEY `fk_tpc_trainPlanID` (`studentID`),
  CONSTRAINT `FK_fl_trainplan_courses` FOREIGN KEY (`studentID`) REFERENCES `fl_student` (`loginName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tpc_courseID` FOREIGN KEY (`courseID`) REFERENCES `fl_courses` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='(培养方案课程)';

/*Data for the table `fl_trainplan_courses` */

/*Table structure for table `fl_trainplan_courses_other` */

DROP TABLE IF EXISTS `fl_trainplan_courses_other`;

CREATE TABLE `fl_trainplan_courses_other` (
  `trainCourseOID` int(11) NOT NULL AUTO_INCREMENT,
  `studentID` varchar(12) COLLATE utf8_unicode_ci NOT NULL COMMENT '学生学号',
  `courseName` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '课程名',
  `credit` decimal(3,1) NOT NULL DEFAULT '0.0' COMMENT '学分',
  `scorce` decimal(4,1) NOT NULL DEFAULT '0.0' COMMENT '成绩',
  `semester` enum('1','2','3','4','5','6','7','8') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '开课学期',
  PRIMARY KEY (`trainCourseOID`),
  KEY `fk_tpo_trainPlanID` (`studentID`),
  CONSTRAINT `FK_fl_trainplan_courses_other_stuid` FOREIGN KEY (`studentID`) REFERENCES `fl_student` (`loginName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='手动输入课程';

/*Data for the table `fl_trainplan_courses_other` */

/*Table structure for table `fl_tutor` */

DROP TABLE IF EXISTS `fl_tutor`;

CREATE TABLE `fl_tutor` (
  `loginName` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `specialtyID` int(11) NOT NULL COMMENT '招生专业',
  `res_interests` text COLLATE utf8_unicode_ci COMMENT '研究兴趣',
  `quota` int(11) NOT NULL DEFAULT '0' COMMENT '招生名额',
  `introduce` mediumtext COLLATE utf8_unicode_ci COMMENT '个人简介',
  `photo` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '照片地址',
  `type` enum('博士生导师','硕士生导师') COLLATE utf8_unicode_ci DEFAULT '硕士生导师',
  `checked` enum('true','false') COLLATE utf8_unicode_ci DEFAULT 'false' COMMENT '是否审核',
  `uName` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '姓名',
  `sex` enum('男','女') COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '性别',
  `email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `qq` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'QQ号',
  `webAddr` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '个人网站',
  `phone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话',
  `college` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属学院',
  PRIMARY KEY (`loginName`),
  KEY `fk_spc_tutor` (`specialtyID`),
  CONSTRAINT `fk_spc_tutor` FOREIGN KEY (`specialtyID`) REFERENCES `fl_specialty` (`specialtyID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_tutor` FOREIGN KEY (`loginName`) REFERENCES `fl_user` (`loginName`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='导师信息';

/*Data for the table `fl_tutor` */

/*Table structure for table `fl_tutortostudent` */

DROP TABLE IF EXISTS `fl_tutortostudent`;

CREATE TABLE `fl_tutortostudent` (
  `ttsID` int(11) NOT NULL AUTO_INCREMENT,
  `tutorID` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `studentID` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '学生选导师：1，导师确定学生:2',
  PRIMARY KEY (`ttsID`),
  KEY `fk_tts_tutor` (`tutorID`),
  KEY `fk_tts_student` (`studentID`),
  CONSTRAINT `fk_tts_student` FOREIGN KEY (`studentID`) REFERENCES `fl_user` (`loginName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tts_tutor` FOREIGN KEY (`tutorID`) REFERENCES `fl_user` (`loginName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='导师学生';

/*Data for the table `fl_tutortostudent` */

/*Table structure for table `fl_user` */

DROP TABLE IF EXISTS `fl_user`;

CREATE TABLE `fl_user` (
  `loginName` varchar(12) COLLATE utf8_unicode_ci NOT NULL COMMENT '登录名，学号、工号、admin、yadmin',
  `role` enum('student','tutor','admin','yadmin') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'student' COMMENT '角色',
  `passwd` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`loginName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户信息';

/*Data for the table `fl_user` */

insert  into `fl_user`(`loginName`,`role`,`passwd`) values ('2012011001','student','*3B27E0581282FC745DDF2F4A53D0055780230A56'),('2012011002','student','*CF8B15A67B436DB667B8D533FF9BB4CF7C521900'),('2012011003','student','*4A59D84BDF629ABB2CA5D1243C1537D1720DB615'),('2012011004','student','*2E7E8CC76F5F0BA4660EAF431D929B1866BEF0FB'),('2012011005','student','*A11BF9AF786C026034DE5B4EF45D028D1939E958'),('2012011006','student','*D3C1956DBE6A7A55FED6B0EA0150E63FC96D2E02'),('2012011007','student','*438CB507DEF6ED92B0BBEDD8DCC7DCECDBC5BB3B'),('2012011008','student','*7EA902E6E835757475E984A7568F59859C25ABDC'),('2012011009','student','*FB887B9B6D87DDC23BAC0B5D9743D6AE92962A69'),('2012011012','student','*7ABDA89DD6CCD73D05B3FB42CF2BB9FDDB0D146C'),('2012011013','student','*1835A86A87B323BADCD9367A07914621692DFC92'),('2012011014','student','*73B010E33B0263F71D8830DDBCDCDEADB6E607EF'),('2012011015','student','*C8042B909856E65E63C21A6AD492CB175689B210'),('2012011016','student','*BE3495F8245621695F610E05B76AB40420D696D4'),('2012011017','student','*2CD452FEA787BEA8A49F03B840267290D94EBB70'),('2012011018','student','*42731A47FBEE65416BC5FDEDC23F06AA098B6230'),('2012011019','student','*5271F26A0C690D0C5FD1956F481DAFA65806887B'),('2012011020','student','*ED199BBDE79D722F74245A3585DE21683F1C0D2F'),('2012011021','student','*2AEB804AD874CB46BCFBD96277A2E7AB7DD661EE'),('2012011022','student','*DC64517ED2262BB0DBEEC53CEE6A38E5F3F1BECF'),('2012011023','student','*0F9050EC1BC702C5CE0581F34E13F1510450C8CE'),('2012011024','student','*CAFB2F044B143960154240D4F624103E6AB4084C'),('2012011025','student','*BB9BA596EDF179D993BD17FE8334333C0F2483DF'),('2012011026','student','*94E40CB16D3AF185D798101BB3189FD3C9FC351E'),('2012011027','student','*C56EC9BF3A21DDEC3E8153C808E0771F1FC789EF'),('2012011028','student','*1BAC99E2EA3CD0322B5D3A21397F4DB1DADFDAEA'),('2012011029','student','*E291D675C36DE24E5C6BEFBFA1639D8213FC85C1'),('2012011030','student','*933DE131DB4DD27890E08ECD0A6B8EDFAB5C66D3');

/*Table structure for table `selectannual` */

DROP TABLE IF EXISTS `selectannual`;

CREATE TABLE `selectannual` (
  `annual` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='当前分流年度';

/*Data for the table `selectannual` */

insert  into `selectannual`(`annual`) values ('2013');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
