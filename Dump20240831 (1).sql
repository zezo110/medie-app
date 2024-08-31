-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: medie_app
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `cargeories`
--

DROP TABLE IF EXISTS `cargeories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargeories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idx_title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargeories`
--

LOCK TABLES `cargeories` WRITE;
/*!40000 ALTER TABLE `cargeories` DISABLE KEYS */;
INSERT INTO `cargeories` VALUES (4,'Education'),(8,'Entertainment'),(6,'Finance'),(7,'Food'),(2,'Health'),(3,'Lifestyle'),(10,'Politics'),(9,'Sports'),(1,'Technology'),(5,'Travel');
/*!40000 ALTER TABLE `cargeories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `post_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `upbdeted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_post_id` (`post_id`),
  KEY `idx_created_at` (`created_at`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (31,'Great post!',1,1,'2024-08-31 10:41:51','2024-08-31 10:41:51',NULL),(32,'Very informative.',2,2,'2024-08-31 10:41:51','2024-08-31 10:41:51',NULL),(33,'I disagree with this.',3,3,'2024-08-31 10:41:51','2024-08-31 10:41:51',NULL),(34,'Thanks for sharing!',1,4,'2024-08-31 10:41:51','2024-08-31 10:41:51',NULL),(35,'What do you think about this?',2,5,'2024-08-31 10:41:51','2024-08-31 10:41:51',NULL),(36,'Nice article!',3,1,'2024-08-31 10:41:51','2024-08-31 10:41:51',NULL),(37,'Could you elaborate?',1,2,'2024-08-31 10:41:51','2024-08-31 10:41:51',NULL),(38,'I found this helpful.',2,3,'2024-08-31 10:41:51','2024-08-31 10:41:51',NULL),(39,'Interesting perspective.',3,4,'2024-08-31 10:41:51','2024-08-31 10:41:51',NULL),(40,'I learned something new.',1,5,'2024-08-31 10:41:51','2024-08-31 10:41:51',NULL);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file_path` varchar(255) NOT NULL,
  `file_type` varchar(50) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `related_table` varchar(50) NOT NULL,
  `related_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_related_id` (`related_id`),
  KEY `idx_related_table` (`related_table`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (11,'/images/photo1.jpg','image/jpeg',1,'2024-08-31 10:41:22','posts',1),(12,'/videos/video1.mp4','video/mp4',2,'2024-08-31 10:41:22','posts',2),(13,'/documents/doc1.pdf','application/pdf',3,'2024-08-31 10:41:22','posts',3),(14,'/images/photo2.jpg','image/jpeg',4,'2024-08-31 10:41:22','posts',1),(15,'/videos/video2.mp4','video/mp4',5,'2024-08-31 10:41:22','posts',2),(16,'/documents/doc2.pdf','application/pdf',1,'2024-08-31 10:41:22','posts',3),(17,'/images/photo3.jpg','image/jpeg',2,'2024-08-31 10:41:22','posts',1),(18,'/videos/video3.mp4','video/mp4',3,'2024-08-31 10:41:22','posts',2),(19,'/documents/doc3.pdf','application/pdf',4,'2024-08-31 10:41:22','posts',3),(20,'/images/photo4.jpg','image/jpeg',5,'2024-08-31 10:41:22','posts',1);
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `user_id` int DEFAULT NULL,
  `category_at` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `upbdeted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `published` tinyint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_at` (`category_at`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_upbdeted_at` (`upbdeted_at`),
  KEY `idx_published` (`published`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`category_at`) REFERENCES `cargeories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Post 1 Title','Content for post 1.',1,1,'2024-08-31 10:41:32','2024-08-31 10:41:32',0),(2,'Post 2 Title','Content for post 2.',2,2,'2024-08-31 10:41:32','2024-08-31 10:41:32',0),(3,'Post 3 Title','Content for post 3.',3,3,'2024-08-31 10:41:32','2024-08-31 10:41:32',0),(4,'Post 4 Title','Content for post 4.',4,1,'2024-08-31 10:41:32','2024-08-31 10:41:32',0),(5,'Post 5 Title','Content for post 5.',5,2,'2024-08-31 10:41:32','2024-08-31 10:41:32',0),(6,'Post 6 Title','Content for post 6.',1,3,'2024-08-31 10:41:32','2024-08-31 10:41:32',0),(7,'Post 7 Title','Content for post 7.',2,1,'2024-08-31 10:41:32','2024-08-31 10:41:32',0),(8,'Post 8 Title','Content for post 8.',3,2,'2024-08-31 10:41:32','2024-08-31 10:41:32',0),(9,'Post 9 Title','Content for post 9.',4,3,'2024-08-31 10:41:32','2024-08-31 10:41:32',0),(10,'Post 10 Title','Content for post 10.',5,1,'2024-08-31 10:41:32','2024-08-31 10:41:32',0);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_tags`
--

DROP TABLE IF EXISTS `posts_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_tags` (
  `post_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `idx_post_id` (`post_id`),
  KEY `idx_tag_id` (`tag_id`),
  CONSTRAINT `posts_tags_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `posts_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_tags`
--

LOCK TABLES `posts_tags` WRITE;
/*!40000 ALTER TABLE `posts_tags` DISABLE KEYS */;
INSERT INTO `posts_tags` VALUES (1,1),(1,2),(2,3),(2,4),(3,1),(3,5),(4,2),(5,3),(6,4),(7,5);
/*!40000 ALTER TABLE `posts_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `setting_key` varchar(100) NOT NULL,
  `setting_value` varchar(100) NOT NULL,
  PRIMARY KEY (`setting_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES ('admin_email','admin@example.com'),('allow_comments','true'),('default_language','en'),('default_role','reader'),('maintenance_mode','false'),('posts_per_page','10'),('site_description','A blog about various topics.'),('site_name','My Blog'),('theme','default'),('timezone','UTC');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `idx_title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (4,'Education'),(8,'Entertainment'),(6,'Finance'),(7,'Food'),(2,'Health'),(3,'Lifestyle'),(10,'Politics'),(9,'Sports'),(1,'Technology'),(5,'Travel');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `role` enum('admin','author','reader') DEFAULT 'reader',
  `blacod_at` timestamp NULL DEFAULT NULL,
  `blocked_reason` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_username` (`username`),
  KEY `idx_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user1','user1@example.com','hashed_password1','User One','reader',NULL,NULL),(2,'user2','user2@example.com','hashed_password2','User Two','author',NULL,NULL),(3,'user3','user3@example.com','hashed_password3','User Three','admin',NULL,NULL),(4,'user4','user4@example.com','hashed_password4','User Four','reader',NULL,NULL),(5,'user5','user5@example.com','hashed_password5','User Five','author',NULL,NULL),(6,'user6','user6@example.com','hashed_password6','User Six','reader',NULL,NULL),(7,'user7','user7@example.com','hashed_password7','User Seven','author',NULL,NULL),(8,'user8','user8@example.com','hashed_password8','User Eight','admin',NULL,NULL),(9,'user9','user9@example.com','hashed_password9','User Nine','reader',NULL,NULL),(10,'user10','user10@example.com','hashed_password10','User Ten','author',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-31 13:46:39
