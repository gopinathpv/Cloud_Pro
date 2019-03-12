/*
SQLyog Community v8.4 RC2
MySQL - 5.0.15-nt : Database - consistency
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`consistency` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `consistency`;

/*Table structure for table `file_details` */

DROP TABLE IF EXISTS `file_details`;

CREATE TABLE `file_details` (
  `id` int(11) NOT NULL auto_increment,
  `owner` varchar(30) default NULL,
  `filename` varchar(90) default NULL,
  `private_key` varchar(90) default NULL,
  `public_key` varchar(30) default NULL,
  `secret_key` varchar(30) default NULL,
  `split1` varchar(30) default NULL,
  `split2` varchar(30) default NULL,
  `split3` varchar(30) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `file_details` */

insert  into `file_details`(`id`,`owner`,`filename`,`private_key`,`public_key`,`secret_key`,`split1`,`split2`,`split3`) values (1,'admin','E:/oruta_1_1/build/web/main/tests.sql','102192','1809133445','1455','40','60','32'),(2,'admin','E:/oruta_1_1/build/web/main/dinesh.txt','102019','-68007503','0','null','null','null'),(3,'admin','C:/Documents and Settings/Mahesh/Desktop/oruta/build/web/main/pdf content.txt','416639','-325861567','213','71','71','71');

/*Table structure for table `filedetails` */

DROP TABLE IF EXISTS `filedetails`;

CREATE TABLE `filedetails` (
  `filename` varchar(50) default NULL,
  `id` int(5) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `filedetails` */

insert  into `filedetails`(`filename`,`id`) values ('Bank.java',0),('Balance.java',0),('SerialDemo.java',0),('Withdraw.java',0),('Existing.java',0),('Withdraw.java',0),('AlertDialog.java',0),('Deposite.java',0),('Withdraw.java',0),('fingerprint.java',0),('Own Project Details.txt',0),('dbfile.sql',1),('DB_MRI.sql',0),('Fees Modification.txt',0),('iriscode.txt',0),('build.xml',0),('svm_node.java',0),('svm_problem.java',0),('svm_node.java',0),('RUNNING.txt',0),('color code links.txt',0),('Fees Modification.txt',0),('dbfile.sql',1),('A.java',0),('Fees Modification.txt',0),('null',0),('db.sql',0),('null',0),('iriscode.txt',0),('null',0),('oruta.sql',0),('null',0),('query.txt',0),('null',0),('dbfile.sql',1),('null',0),('iriscode.txt',0),('null',0),('RUNNING.txt',0),('null',0),('Fees Modification.txt',0),('null',0),('consistency.sql',0),('null',0),('Fees Modification.txt',0),('null',0),('consistency.sql',0),('null',0);

/*Table structure for table `newuser` */

DROP TABLE IF EXISTS `newuser`;

CREATE TABLE `newuser` (
  `username` varchar(20) default NULL,
  `password` varchar(20) default NULL,
  `mailid` varchar(40) default NULL,
  `mnumber` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `newuser` */

insert  into `newuser`(`username`,`password`,`mailid`,`mnumber`) values ('w`\\I\" ï5Û‹»Ãpþ','w`\\I\" ï5Û‹»Ãpþ','b1<Ô¡{‹|B¡~','aÕÖWA¥®$×­x’ËŠà'),(':\rï~E\Z²%éðS!)',':\rï~E\Z²%éðS!)','á|mªªa$#,° E½¥Å','¦à\nÝ©ÈeûÐ9µ„');

/*Table structure for table `shared` */

DROP TABLE IF EXISTS `shared`;

CREATE TABLE `shared` (
  `FileName` varchar(40) default '',
  `EmailId` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shared` */

insert  into `shared`(`FileName`,`EmailId`) values ('SerialDemo.java','mahesh@uniqtechnologies.co.in'),('SerialDemo.java','mahesh@uniqtechnologies.co.in'),('Withdraw.java','mahesh@uniqtechnologies.co.in'),('Existing.java','mahesh@uniqtechnologies.co.in'),('Withdraw.java','mahesh@uniqtechnologies.co.in'),('AlertDialog.java','mahesh@uniqtechnologies.co.in'),('null','mahesh@uniqtechnologies.co.in'),('Deposite.java','mahesh@uniqtechnologies.co.in'),('Withdraw.java','mahesh@uniqtechnologies.co.in'),('fingerprint.java','mahesh@uniqtechnologies.co.in'),('Own Project Details.txt','geetha@uniqtechnologies.co.in'),('dbfile.sql','geetha@uniqtechnologies.co.in'),('Fees Modification.txt','geetha@uniqtechnologies.co.in'),('iriscode.txt','mahesh@uniqtechnologies.co.in'),('iriscode.txt','mahesh@uniqtechnologies.co.in'),('iriscode.txt','mahesh@uniqtechnologies.co.in'),('build.xml','mahesh@uniqtechnologies.co.in'),('svm_node.java','mahesh@uniqtechnologies.co.in'),('svm_problem.java','poornimabharathi@gmail.com'),('null','poornimabharathi@gmail.com'),('null','poornimabharathi@gmail.com'),('null','poornimabharathi@gmail.com'),('svm_node.java','poornimabharathi@gmail.com'),('svm_node.java','priyanka@gmail.com'),('RUNNING.txt','naveenmohan43@outlook.com'),('color code links.txt','mahesh@uniqtechnologies.co.in'),('Fees Modification.txt','mahesh@uniqtechnologies.co.in'),('db.sql','a@gmail.com'),('iriscode.txt','mahesh@uniqtechnologies.co.in'),('oruta.sql','geetha@uniqtechnologies.co.in'),('query.txt','geetha@uniqtechnologies.co.in'),('dbfile.sql','poornima@gmail.com'),('RUNNING.txt','priya@gmail.com'),('Fees Modification.txt','priya@gmail.com'),('consistency.sql','priya@gmail.com'),('Fees Modification.txt','poornima@gmail.com'),('consistency.sql','mahi@gmail.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
