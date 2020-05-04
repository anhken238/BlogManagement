-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nameCategories` varchar(50) NOT NULL,
  `creator` varchar(50) NOT NULL DEFAULT 'Admin',
  `dateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `finalEditor` varchar(50) DEFAULT 'Admin',
  `lastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Javascript','rong9x','2019-06-26 00:00:00','admin','2020-03-05 00:56:03'),(2,'Java','Admin','2019-06-27 11:29:55','Admin','2019-06-27 11:29:55'),(4,'Python','Admin','2019-06-27 11:30:27','Admin','2019-06-27 11:30:27'),(11,'Asp.Net core','Admin','2020-02-24 15:02:49','Admin','2020-02-24 15:02:49');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contents` text NOT NULL,
  `dateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `idUsers` int(11) DEFAULT NULL,
  `idPosts` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idPosts` (`idPosts`),
  KEY `idUsers` (`idUsers`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`idPosts`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`idUsers`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (58,'comment by user 666','2020-03-15 17:28:59','2020-03-15 17:28:59',6,4),(59,'Mình thấy nên cải thiện lại','2020-03-15 17:29:05','2020-03-15 17:29:05',6,4),(61,'comment by ad666','2020-03-18 09:45:54','2020-03-18 09:45:54',6,1),(65,'admin nay','2020-03-19 00:58:34','2020-03-19 00:58:34',6,1),(66,'ahihihi','2020-05-04 10:20:42','2020-05-04 10:20:42',12,1),(67,'abcdef','2020-05-04 10:21:39','2020-05-04 10:21:39',13,1);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `introduce` text NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `creator` varchar(50) NOT NULL DEFAULT 'rong9x',
  `dateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `finalEditor` varchar(50) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `idCategories` int(11) NOT NULL,
  `idUsers` int(11) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idCategories` (`idCategories`),
  KEY `idUsers` (`idUsers`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`idCategories`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`idUsers`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Java for beginer','<p>1 Introduce of Java Java is a popular programming language, created in 1995.</p>\r\n','<p>What is Java? Java is a popular programming language, created in 1995. It is owned by Oracle, and more than 3 billion devices run Java. It is used for: Mobile applications (specially Android apps) Desktop applications Web applications Web servers and application servers Games Database connection And much, much more! Why Use Java? Java works on different platforms (Windows, Mac, Linux, Raspberry Pi, etc.) It is one of the most popular programming language in the world It is easy to learn and simple to use It is open-source and free It is secure, fast and powerful It has a huge community support (tens of millions of developers) Java is an object oriented language which gives a clear structure to programs and allows code to be reused, lowering development costs As Java is close to C++ and C#, it makes it easy for programmers to switch to Java or vice versa</p>\r\n','sample-image.jpg','rong9x','2019-06-26 00:00:00','admin','2020-05-03 04:35:08',2,6,'C:\\Users\\Administrator\\Desktop\\MyProject\\Blog\\web\\images\\',4),(4,'Java Tutorial','<p>Java is a programming language. Java is used to develop mobile apps, web apps, desktop apps, games and much more.</p>\r\n','<p>Java is a programming language. Java is used to develop mobile apps, web apps, desktop apps, games and much more. Java is a programming language. Java is used to develop mobile apps, web apps, desktop apps, games and much more. Java is a programming language. Java is used to develop mobile apps, web apps, desktop apps, games and much more.</p>\r\n','user-03.png','rong9x','2019-06-27 14:41:21','admin','2020-05-03 04:35:19',2,6,'C:\\Users\\Administrator\\Desktop\\MyProject\\Blog\\web\\images\\',2),(5,'PHP 5 Tutorial','<p>PHP is a server scripting language, and a powerful tool for making dynamic and interactive Web pages. PHP is a widely-used, free, and efficient alternative to competitors such as Microsoft&#39;s ASP.</p>\r\n','<p>PHP is a server scripting language, and a powerful tool for making dynamic and interactive Web pages. PHP is a widely-used, free, and efficient alternative to competitors such as Microsoft&#39;s ASP. PHP is a server scripting language, and a powerful tool for making dynamic and interactive Web pages. PHP is a widely-used, free, and efficient alternative to competitors such as Microsoft&#39;s ASP. PHP is a server scripting language, and a powerful tool for making dynamic and interactive Web pages. PHP is a widely-used, free, and efficient alternative to competitors such as Microsoft&#39;s ASP.</p>\r\n','user-02.png','rong9x','2019-06-27 14:43:31','admin','2020-05-03 04:10:23',11,6,'C:\\Users\\Administrator\\Desktop\\MyProject\\Blog\\web\\images\\',0),(6,'Python test','<p>Lap Trinh Python</p>\r\n','<p>Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python</p>\r\n','sample-image.jpg','rong9x','2019-07-01 08:46:45','admin','2020-03-02 23:13:28',4,6,'C:\\Users\\Administrator\\Desktop\\MyProject\\Blog\\web\\images\\',0),(35,'tesst anh','<p><strong>tesst anhtesst anhtesst anhtesst anhtesst anh&nbsp;<img alt=\"heart\" src=\"http://localhost:8080/ckeditor/plugins/smiley/images/heart.png\" style=\"height:23px; width:23px\" title=\"heart\" /></strong></p>\r\n','<p>tesst anhtesst anhtesst anhtesst anh</p>\r\n','sample-image.jpg','admin','2020-02-28 01:14:37','admin','2020-03-02 16:35:35',1,6,'C:\\Users\\Administrator\\Desktop\\MyProject\\Blog\\web\\images\\sample-image.jpg',0),(38,'Python page 2','<p>python la 1 ngon ngu lap trinh</p>\r\n','<p>python la 1 ngon ngu lap trinhpython la 1 ngon ngu lap trinhpython la 1 ngon ngu lap trinhpython la 1 ngon ngu lap trinhpython la 1 ngon ngu lap trinh</p>\r\n','sample-image.jpg','admin','2020-03-03 19:17:10',NULL,'2020-03-03 19:17:10',4,6,'C:\\Users\\Administrator\\Desktop\\MyProject\\Blog\\web\\images\\sample-image.jpg',0);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(15) NOT NULL DEFAULT 'user',
  `salt` varchar(33) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'noavatar.png',
  `creator` varchar(50) DEFAULT 'user',
  `dateCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `finalEditor` varchar(50) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'rong9x','123','admin','','null','1','2019-06-25 00:00:00','1','2019-06-25 00:00:00'),(4,'nhat2508','C203D4DE356528618626901F98F63AC2','admin','ÙâZ9@Ô','noavatar.png','user','2019-06-27 20:45:08',NULL,'2019-06-27 20:45:08'),(6,'admin','E56EE12838439FF0DD02C9084C05513A','admin','ÍUßr¢I','noavatar.png','admin','2019-06-27 21:28:40',NULL,'2019-06-27 21:28:40'),(12,'nguyenducanh','A52F6D610EFBEBF117191FCF357C1027','user','Rb½ö§˜½','noavatar.png','user','2020-01-08 19:59:58',NULL,'2020-05-03 09:23:20'),(13,'ducanhpxu','EDA8A8E2A1ED5C23D3DFAD5D0FBC602D','user','ÛÂQtx\"','noavatar.png','user','2020-02-21 16:06:27',NULL,'2020-02-21 16:06:27'),(15,'cnttk14','EA6443AF8932BA5C24AEA0B8B44FA6D3','user','Z¥*¥âò','noavatar.png','user','2020-03-18 21:34:42',NULL,'2020-03-18 21:34:42');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'blog'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-04 12:47:16
