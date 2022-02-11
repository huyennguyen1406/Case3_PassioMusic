CREATE DATABASE  IF NOT EXISTS `case_modules_3` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `case_modules_3`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: case_modules_3
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `tbl_account`
--

DROP TABLE IF EXISTS `tbl_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_account` (
  `id_acc` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) NOT NULL,
  `passWord` varchar(50) NOT NULL,
  `id_role` int DEFAULT NULL,
  PRIMARY KEY (`id_acc`),
  KEY `id_role` (`id_role`),
  CONSTRAINT `tbl_account_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `tbl_roles` (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_account`
--

LOCK TABLES `tbl_account` WRITE;
/*!40000 ALTER TABLE `tbl_account` DISABLE KEYS */;
INSERT INTO `tbl_account` VALUES (1,'haotran','1',1),(2,'duonghoang','1',1),(3,'trihoang','1',1),(4,'huyennguyen','1',1),(5,'adele','123',2),(6,'edsheran','123',2),(7,'chipu','123',2),(8,'minhquang','234',3),(9,'ducdau','234',3),(10,'tiennguyen','234',3),(11,'quanle','234',3),(12,'toannguyen','234',3);
/*!40000 ALTER TABLE `tbl_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bill`
--

DROP TABLE IF EXISTS `tbl_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bill` (
  `id_bill` int NOT NULL AUTO_INCREMENT,
  `id_cart` int NOT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id_bill`),
  KEY `id_cart` (`id_cart`),
  CONSTRAINT `tbl_bill_ibfk_1` FOREIGN KEY (`id_cart`) REFERENCES `tbl_cart` (`id_cart`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bill`
--

LOCK TABLES `tbl_bill` WRITE;
/*!40000 ALTER TABLE `tbl_bill` DISABLE KEYS */;
INSERT INTO `tbl_bill` VALUES (1,1,'2022-02-11'),(2,2,'2022-01-11'),(3,3,'2022-03-11');
/*!40000 ALTER TABLE `tbl_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cart`
--

DROP TABLE IF EXISTS `tbl_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cart` (
  `id_cart` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  PRIMARY KEY (`id_cart`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `tbl_cart_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cart`
--

LOCK TABLES `tbl_cart` WRITE;
/*!40000 ALTER TABLE `tbl_cart` DISABLE KEYS */;
INSERT INTO `tbl_cart` VALUES (1,8),(2,9),(3,10);
/*!40000 ALTER TABLE `tbl_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cartdetail`
--

DROP TABLE IF EXISTS `tbl_cartdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cartdetail` (
  `id_song` int NOT NULL,
  `id_cart` int NOT NULL,
  PRIMARY KEY (`id_song`,`id_cart`),
  KEY `id_cart` (`id_cart`),
  CONSTRAINT `tbl_cartdetail_ibfk_1` FOREIGN KEY (`id_song`) REFERENCES `tbl_song` (`id_song`),
  CONSTRAINT `tbl_cartdetail_ibfk_2` FOREIGN KEY (`id_cart`) REFERENCES `tbl_cart` (`id_cart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cartdetail`
--

LOCK TABLES `tbl_cartdetail` WRITE;
/*!40000 ALTER TABLE `tbl_cartdetail` DISABLE KEYS */;
INSERT INTO `tbl_cartdetail` VALUES (1,1),(2,1),(2,2),(3,2),(1,3),(4,3),(5,3),(6,3);
/*!40000 ALTER TABLE `tbl_cartdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_playlist`
--

DROP TABLE IF EXISTS `tbl_playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_playlist` (
  `id_playlist` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  PRIMARY KEY (`id_playlist`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `tbl_playlist_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_playlist`
--

LOCK TABLES `tbl_playlist` WRITE;
/*!40000 ALTER TABLE `tbl_playlist` DISABLE KEYS */;
INSERT INTO `tbl_playlist` VALUES (1,8),(2,9),(3,10);
/*!40000 ALTER TABLE `tbl_playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_playlistdetail`
--

DROP TABLE IF EXISTS `tbl_playlistdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_playlistdetail` (
  `id_song` int NOT NULL,
  `id_playlist` int NOT NULL,
  PRIMARY KEY (`id_song`,`id_playlist`),
  KEY `id_playlist` (`id_playlist`),
  CONSTRAINT `tbl_playlistdetail_ibfk_1` FOREIGN KEY (`id_song`) REFERENCES `tbl_song` (`id_song`),
  CONSTRAINT `tbl_playlistdetail_ibfk_2` FOREIGN KEY (`id_playlist`) REFERENCES `tbl_playlist` (`id_playlist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_playlistdetail`
--

LOCK TABLES `tbl_playlistdetail` WRITE;
/*!40000 ALTER TABLE `tbl_playlistdetail` DISABLE KEYS */;
INSERT INTO `tbl_playlistdetail` VALUES (1,1),(2,1),(2,2),(3,2),(1,3),(4,3),(5,3),(6,3);
/*!40000 ALTER TABLE `tbl_playlistdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_roles`
--

DROP TABLE IF EXISTS `tbl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_roles` (
  `id_role` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_roles`
--

LOCK TABLES `tbl_roles` WRITE;
/*!40000 ALTER TABLE `tbl_roles` DISABLE KEYS */;
INSERT INTO `tbl_roles` VALUES (1,'Admin'),(2,'Singer'),(3,'User');
/*!40000 ALTER TABLE `tbl_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_singer`
--

DROP TABLE IF EXISTS `tbl_singer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_singer` (
  `id_sing` int NOT NULL,
  `sing_name` varchar(50) DEFAULT NULL,
  `sing_phoneNumber` varchar(50) DEFAULT NULL,
  `sing_email` varchar(50) DEFAULT NULL,
  `sing_address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_sing`),
  UNIQUE KEY `sing_phoneNumber` (`sing_phoneNumber`),
  UNIQUE KEY `sing_email` (`sing_email`),
  CONSTRAINT `tbl_singer_ibfk_1` FOREIGN KEY (`id_sing`) REFERENCES `tbl_account` (`id_acc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_singer`
--

LOCK TABLES `tbl_singer` WRITE;
/*!40000 ALTER TABLE `tbl_singer` DISABLE KEYS */;
INSERT INTO `tbl_singer` VALUES (5,'Adele','0987868686','adele@gmail.com','USA'),(6,'Ed Sheran','0989868686','edsheran@gmail.com','ENG'),(7,'Chi Pu','0988868686','chipu@gmail.com','VN');
/*!40000 ALTER TABLE `tbl_singer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_song`
--

DROP TABLE IF EXISTS `tbl_song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_song` (
  `id_song` int NOT NULL AUTO_INCREMENT,
  `song_name` varchar(50) NOT NULL,
  `id_sing` int DEFAULT NULL,
  `song_link` varchar(50) DEFAULT NULL,
  `song_img` varchar(200) DEFAULT NULL,
  `song_price` double DEFAULT '0',
  PRIMARY KEY (`id_song`),
  KEY `id_sing` (`id_sing`),
  CONSTRAINT `tbl_song_ibfk_1` FOREIGN KEY (`id_sing`) REFERENCES `tbl_singer` (`id_sing`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_song`
--

LOCK TABLES `tbl_song` WRITE;
/*!40000 ALTER TABLE `tbl_song` DISABLE KEYS */;
INSERT INTO `tbl_song` VALUES (1,'Easy On Me',5,'https://www.youtube.com/watch?v=YQHsXMglC9A','https://i.ytimg.com/vi/X-yIEMduRXk/maxresdefault.jpg',100000),(2,'Hello',5,'https://www.youtube.com/watch?v=YQHsXMglC9A','https://kenh14cdn.com/203336854389633024/2021/10/25/photo-1-1635164509999875832467.png',150000),(3,'Bad Habits',6,'https://www.youtube.com/watch?v=orJSJGHjBLI','https://avatar-ex-swe.nixcdn.com/playlist/2021/08/26/0/1/b/b/1629953972084_500.jpg',120000),(4,'Shape Of You',6,'https://www.youtube.com/watch?v=JGwWNGJdvx8','https://upload.wikimedia.org/wikipedia/vi/a/a3/Shape_of_You_cover.jpg',90000),(5,'Anh Ơi Ở Lại',7,'https://www.youtube.com/watch?v=3fi7uwBU-CE','https://i.ytimg.com/vi/3fi7uwBU-CE/maxresdefault.jpg',40000),(6,'Mời Anh Vào Team',7,'https://www.youtube.com/watch?v=AhNMmPuHt_8','https://i.ytimg.com/vi/gHufnnNG8B0/maxresdefault.jpg',50000);
/*!40000 ALTER TABLE `tbl_song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user` (
  `id_user` int NOT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `user_phoneNumber` varchar(50) DEFAULT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `user_phoneNumber` (`user_phoneNumber`),
  UNIQUE KEY `user_email` (`user_email`),
  CONSTRAINT `tbl_user_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tbl_account` (`id_acc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (8,'Nguyễn Minh Quang','0111111111','quang@mail.com','HN'),(9,'Đậu Anh Đức','0222222222','duc@mail.com','HT'),(10,'Nguyễn Minh Tiến','0333333333','tien@mail.com','TN'),(11,'Lê Hồng Quân','0444444444','quan@mail.com','TB'),(12,'Nguyễn Mạnh Toàn','0555555555','toan@mail.com','TN');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'case_modules_3'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-11  0:36:05
