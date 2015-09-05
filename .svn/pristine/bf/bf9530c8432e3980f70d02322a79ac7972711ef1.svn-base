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

/*Table structure for table `fl_ trainplan` */

DROP TABLE IF EXISTS `fl_ trainplan`;

CREATE TABLE `fl_ trainplan` (
  `tranPlanID` int(11) NOT NULL AUTO_INCREMENT,
  `studentID` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `teachCheck` enum('是','否') COLLATE utf8_unicode_ci NOT NULL DEFAULT '否' COMMENT '是否审核',
  `isModify` enum('是','否') COLLATE utf8_unicode_ci NOT NULL DEFAULT '否' COMMENT '是否被导师修改',
  `isSubmit` enum('是','否') COLLATE utf8_unicode_ci NOT NULL DEFAULT '否' COMMENT '是否提交',
  PRIMARY KEY (`tranPlanID`),
  KEY `fk_tp_studentID` (`studentID`),
  CONSTRAINT `fk_tp_studentID` FOREIGN KEY (`studentID`) REFERENCES `fl_user` (`loginName`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='(培养方案)';

/*Table structure for table `fl_bigclassname` */

DROP TABLE IF EXISTS `fl_bigclassname`;

CREATE TABLE `fl_bigclassname` (
  `bigClassID` int(11) NOT NULL AUTO_INCREMENT COMMENT '学科大类ID',
  `bigClassName` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '学科大类名称',
  `descript` text COLLATE utf8_unicode_ci COMMENT '描述',
  PRIMARY KEY (`bigClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='学科大类';

/*Table structure for table `fl_courses` */

DROP TABLE IF EXISTS `fl_courses`;

CREATE TABLE `fl_courses` (
  `courseID` varchar(12) COLLATE utf8_unicode_ci NOT NULL COMMENT '课程编号',
  `courseName` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '课程名',
  `credit` decimal(3,1) NOT NULL DEFAULT '0.0' COMMENT '学分',
  PRIMARY KEY (`courseID`),
  KEY `scend` (`courseName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='课程信息';

/*Table structure for table `fl_notice` */

DROP TABLE IF EXISTS `fl_notice`;

CREATE TABLE `fl_notice` (
  `noticeID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '标题',
  `content` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT '内容',
  `pdate` datetime NOT NULL COMMENT '发布时间',
  `skipNum` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  PRIMARY KEY (`noticeID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='通知';

/*Table structure for table `fl_pcourse` */

DROP TABLE IF EXISTS `fl_pcourse`;

CREATE TABLE `fl_pcourse` (
  `pcourseID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '课程流水账号',
  `loginName` varchar(12) COLLATE utf8_unicode_ci NOT NULL COMMENT '学生ID',
  `courseID` varchar(12) COLLATE utf8_unicode_ci NOT NULL COMMENT '课程编号',
  `score` decimal(4,1) NOT NULL DEFAULT '0.0' COMMENT '成绩',
  `credit` decimal(3,1) NOT NULL DEFAULT '0.0' COMMENT '学分',
  PRIMARY KEY (`pcourseID`),
  KEY `fk_pcourseID` (`courseID`),
  CONSTRAINT `fk_pcourseID` FOREIGN KEY (`courseID`) REFERENCES `fl_courses` (`courseID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='（学生先修课程）';

/*Table structure for table `fl_researchtrain` */

DROP TABLE IF EXISTS `fl_researchtrain`;

CREATE TABLE `fl_researchtrain` (
  `researchTrainID` int(11) NOT NULL AUTO_INCREMENT,
  `tranPlanID` int(11) NOT NULL COMMENT '培养计划ID',
  `demand` text COLLATE utf8_unicode_ci COMMENT '导师要求',
  PRIMARY KEY (`researchTrainID`),
  KEY `fk_rt_trainPlanID` (`tranPlanID`),
  CONSTRAINT `fk_rt_trainPlanID` FOREIGN KEY (`tranPlanID`) REFERENCES `fl_ trainplan` (`tranPlanID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='(科研训练)';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='专业';

/*Table structure for table `fl_student` */

DROP TABLE IF EXISTS `fl_student`;

CREATE TABLE `fl_student` (
  `loginName` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `grade` year(4) NOT NULL COMMENT '年级',
  `class` int(20) NOT NULL COMMENT '班级',
  `specialtyID` int(11) DEFAULT NULL COMMENT '专业编号',
  `sixGrade` decimal(6,1) DEFAULT '0.0' COMMENT '六级最高成绩',
  `self_rec` mediumtext COLLATE utf8_unicode_ci COMMENT '自荐书',
  `checked` enum('true','false') COLLATE utf8_unicode_ci DEFAULT 'false' COMMENT '是否审核',
  PRIMARY KEY (`loginName`),
  KEY `fk_spc_student` (`specialtyID`),
  CONSTRAINT `fk_spc_student` FOREIGN KEY (`specialtyID`) REFERENCES `fl_specialty` (`specialtyID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_student` FOREIGN KEY (`loginName`) REFERENCES `fl_user` (`loginName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='学生信息';

/*Table structure for table `fl_trainplan_courses` */

DROP TABLE IF EXISTS `fl_trainplan_courses`;

CREATE TABLE `fl_trainplan_courses` (
  `trainCourseID` int(11) NOT NULL,
  `courseID` varchar(12) COLLATE utf8_unicode_ci NOT NULL COMMENT '课程编号',
  `tranPlanID` int(11) NOT NULL COMMENT '培养方案ID',
  `scorce` decimal(4,1) NOT NULL DEFAULT '0.0' COMMENT '成绩',
  `semester` enum('1','2','3','4','5','6','7','8') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '开课学期',
  PRIMARY KEY (`trainCourseID`),
  KEY `fk_tpc_courseID` (`courseID`),
  KEY `fk_tpc_trainPlanID` (`tranPlanID`),
  CONSTRAINT `fk_tpc_courseID` FOREIGN KEY (`courseID`) REFERENCES `fl_courses` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tpc_trainPlanID` FOREIGN KEY (`tranPlanID`) REFERENCES `fl_ trainplan` (`tranPlanID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='(培养方案课程)';

/*Table structure for table `fl_trainplan_courses_other` */

DROP TABLE IF EXISTS `fl_trainplan_courses_other`;

CREATE TABLE `fl_trainplan_courses_other` (
  `trainCourseOID` int(11) NOT NULL AUTO_INCREMENT,
  `tranPlanID` int(11) NOT NULL COMMENT '培养方案ID',
  `courseName` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '课程名',
  `credit` decimal(3,1) NOT NULL DEFAULT '0.0' COMMENT '学分',
  `scorce` decimal(4,1) NOT NULL DEFAULT '0.0' COMMENT '成绩',
  `semester` enum('1','2','3','4','5','6','7','8') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '开课学期',
  PRIMARY KEY (`trainCourseOID`),
  KEY `fk_tpo_trainPlanID` (`tranPlanID`),
  CONSTRAINT `fk_tpo_trainPlanID` FOREIGN KEY (`tranPlanID`) REFERENCES `fl_ trainplan` (`tranPlanID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='手动输入课程';

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
  PRIMARY KEY (`loginName`),
  KEY `fk_spc_tutor` (`specialtyID`),
  CONSTRAINT `fk_spc_tutor` FOREIGN KEY (`specialtyID`) REFERENCES `fl_specialty` (`specialtyID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_tutor` FOREIGN KEY (`loginName`) REFERENCES `fl_user` (`loginName`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='导师信息';

/*Table structure for table `fl_tutortostudent` */

DROP TABLE IF EXISTS `fl_tutortostudent`;

CREATE TABLE `fl_tutortostudent` (
  `ttsID` int(11) NOT NULL AUTO_INCREMENT,
  `tutorID` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `studentID` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ttsID`),
  KEY `fk_tts_tutor` (`tutorID`),
  KEY `fk_tts_student` (`studentID`),
  CONSTRAINT `fk_tts_student` FOREIGN KEY (`studentID`) REFERENCES `fl_user` (`loginName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tts_tutor` FOREIGN KEY (`tutorID`) REFERENCES `fl_user` (`loginName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='导师学生';

/*Table structure for table `fl_user` */

DROP TABLE IF EXISTS `fl_user`;

CREATE TABLE `fl_user` (
  `loginName` varchar(12) COLLATE utf8_unicode_ci NOT NULL COMMENT '登录名，学号、工号、admin、yadmin',
  `role` enum('student','tutor','admin','yadmin') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'student' COMMENT '角色',
  `passwd` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `uName` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `sex` enum('男','女') COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qq` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `webAddr` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '个人网站',
  PRIMARY KEY (`loginName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户信息';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
