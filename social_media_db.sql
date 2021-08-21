-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: social_media_db
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_post` int NOT NULL,
  `username` varchar(30) NOT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `attachment` varchar(300) DEFAULT NULL,
  `hashtag` varchar(30) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `comment_fk0` (`id_post`),
  KEY `comment_fk1` (`username`),
  CONSTRAINT `comment_fk0` FOREIGN KEY (`id_post`) REFERENCES `post` (`id`),
  CONSTRAINT `comment_fk1` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,'aikriwn','Semangat',NULL,NULL,'2021-08-20 20:05:35'),(8,1,'aikriwn','Semangat #kamupastibisa',NULL,'#kamupastibisa','2021-08-20 20:18:40'),(9,1,'aikriwn','Semangat #kamupastibisa','./media/data.csv','#kamupastibisa','2021-08-20 20:26:27'),(10,1,'aikriwn','Semangat #gigih','./media/data.csv','#gigih','2021-08-20 20:38:03'),(11,1,'aikriwn','semangat','./media/data.csv',NULL,'2021-08-21 16:07:24'),(12,1,'aikriwn','semangat','./media/data.csv','#pastibisa','2021-08-21 16:08:16'),(13,1,'aikriwn','semangat','./media/data.csv','#pastibisa','2021-08-21 16:11:30'),(14,1,'aikriwn','semangat','./media/data.csv','#pastibisa','2021-08-21 16:13:48'),(15,1,'aikriwn','semangat','./media/data.csv','#pastibisa','2021-08-21 16:16:05'),(16,1,'aikriwn','semangat','./media/data.csv',NULL,'2021-08-21 16:16:05'),(17,1,'aikriwn','semangat','./media/data.csv','#pastibisa','2021-08-21 16:16:26'),(18,1,'aikriwn','semangat','./media/data.csv',NULL,'2021-08-21 16:16:26'),(19,1,'aikriwn','semangat',NULL,NULL,'2021-08-21 16:16:26'),(20,1,'aikriwn','semangat','./media/data.csv','#pastibisa','2021-08-21 16:16:49'),(21,1,'aikriwn','semangat','./media/data.csv',NULL,'2021-08-21 16:16:49'),(22,1,'aikriwn','semangat',NULL,NULL,'2021-08-21 16:16:49');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `caption` varchar(1000) NOT NULL,
  `attachment` varchar(300) DEFAULT NULL,
  `user_id` int NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hashtag` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_fk0` (`user_id`),
  CONSTRAINT `post_fk0` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'pagi yang cerah',NULL,1,'2021-08-19 23:23:38',NULL),(2,'pagi yang indah',NULL,1,'2021-08-19 23:23:55',NULL),(10,'saya akan belajar giat','./media/Screenshot (2).png',1,'2021-08-20 09:37:28',NULL),(11,'saya akan belajar giat',NULL,1,'2021-08-20 09:38:08',NULL),(21,'saya akan belajar dengan tekun','./media/social_media_mysql_create.sql',1,'2021-08-20 11:27:15',NULL),(22,'saya akan belajar dengan tekun','./media/social_media_mysql_create.sql',1,'2021-08-20 11:28:25',NULL),(23,'saya akan belajar dengan tekun','./media/social_media_mysql_create.sql',1,'2021-08-20 11:29:37',NULL),(24,'saya akan belajar dengan tekun #semangat','./media/social_media_mysql_create.sql',1,'2021-08-20 16:17:44','#semangat'),(25,'saya akan belajar dengan sunguh-sungguh #gigih',NULL,1,'2021-08-20 16:19:07','#gigih'),(26,'saya akan belajar dengan sunguh-sungguh #gigih',NULL,1,'2021-08-20 16:21:40','#gigih.downcase!'),(27,'saya akan belajar dengan sunguh-sungguh #GIGIH',NULL,1,'2021-08-20 16:21:58','#GIGIH.downcase!'),(28,'saya akan belajar dengan sunguh-sungguh #GIGIH',NULL,1,'2021-08-20 16:22:34','#gigih'),(29,'Saya akan semangat','./media/data.csv',1,'2021-08-21 08:48:12',NULL),(30,'Saya akan semangat','./media/data.csv',1,'2021-08-21 15:20:49',NULL);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(12) NOT NULL,
  `email` varchar(30) NOT NULL,
  `bio` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'aikriwn','arifkurniawan96@gmail.com','Saya akan belajar dengan giat'),(4,'thomas12','thomas12@gmail.com','thomas adalah teman arif');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-21 19:14:09
