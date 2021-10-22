-- MySQL dump 10.13  Distrib 5.7.34, for Win64 (x86_64)
--
-- Host: localhost    Database: bsy
-- ------------------------------------------------------
-- Server version	5.7.34-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bsyboard`
--

DROP TABLE IF EXISTS `bsyboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bsyboard` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `content` varchar(1024) NOT NULL,
  `boardWriter` varchar(60) NOT NULL,
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `views` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsyboard`
--

LOCK TABLES `bsyboard` WRITE;
/*!40000 ALTER TABLE `bsyboard` DISABLE KEYS */;
INSERT INTO `bsyboard` VALUES (1,'123','123','1','2021-10-09 04:54:22',30),(2,'123','123','admin','2021-10-13 08:45:41',3),(3,'444444444444','555555555555','admin','2021-10-14 09:59:19',5),(4,'아아아ㅏ아아아앙ㅇ아아아아아아아모르겠다','ㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜ\r\n왜 안되지 젠장 등신같은.\r\n','admin','2021-10-19 08:39:43',7),(5,'123','123','10','2021-10-20 02:59:24',1);
/*!40000 ALTER TABLE `bsyboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsyuser`
--

DROP TABLE IF EXISTS `bsyuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bsyuser` (
  `userNum` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phoneNumber` varchar(13) NOT NULL,
  `gender` varchar(2) NOT NULL,
  `email` varchar(40) NOT NULL,
  `birth` varchar(20) NOT NULL,
  PRIMARY KEY (`userNum`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsyuser`
--

LOCK TABLES `bsyuser` WRITE;
/*!40000 ALTER TABLE `bsyuser` DISABLE KEYS */;
INSERT INTO `bsyuser` VALUES (1,'admin','admin','01072721823','m','se01163@naver.com','940412'),(8,'10','0','0','m','se01163@naver.com','940412'),(10,'1','0','0','m','se01163@naver.com','940412'),(11,'2','8888888888888888','8888888888','f','8888@8888','888888888'),(19,'p','0','0','m','se01163@naver.com','940412'),(21,'q','0','0','m','se01163@naver.com','940412'),(22,'v','0','0','m','se01163@naver.com','940412'),(23,'z','0','0','m','se01163@naver.com','940412'),(24,'n','0','0','f','se01163@naver.com','940412');
/*!40000 ALTER TABLE `bsyuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `commentNum` int(11) NOT NULL AUTO_INCREMENT,
  `commentContent` varchar(1024) NOT NULL,
  `commentWriter` varchar(50) NOT NULL,
  `commentRegDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `boardNum` int(11) NOT NULL,
  PRIMARY KEY (`commentNum`),
  KEY `fk_commentNum` (`boardNum`),
  CONSTRAINT `fk_commentNum` FOREIGN KEY (`boardNum`) REFERENCES `bsyboard` (`num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'안녕하세요','백승엽','2021-10-18 09:06:30',1),(2,'바이','GD','2021-10-19 09:38:27',1),(3,'123','admin','2021-10-19 10:36:57',1),(4,'진짜 되나','admin','2021-10-19 10:38:04',1),(5,'진짜 되나','admin','2021-10-19 10:38:06',1),(6,'123','admin','2021-10-19 10:38:13',1),(7,'123','admin','2021-10-20 02:46:59',4),(8,'이제 댓글써진다','admin','2021-10-20 02:47:11',4),(9,'78123','admin','2021-10-20 02:48:07',4);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-20 14:22:52
