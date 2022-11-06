-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: car washes
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `brand models`
--

DROP TABLE IF EXISTS `brand models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand models` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `Model name` varchar(100) DEFAULT NULL,
  `Brand Id` bigint NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Brand_models_FK` (`Brand Id`),
  CONSTRAINT `Brand_models_FK` FOREIGN KEY (`Brand Id`) REFERENCES `car brands` (`Column1`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand models`
--

LOCK TABLES `brand models` WRITE;
/*!40000 ALTER TABLE `brand models` DISABLE KEYS */;
INSERT INTO `brand models` VALUES (1,'Rav4',1),(2,'Auris',1),(3,'X5',2),(4,'X6',2),(5,'R8',3),(6,'Q7',3);
/*!40000 ALTER TABLE `brand models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car brands`
--

DROP TABLE IF EXISTS `car brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car brands` (
  `Column1` bigint NOT NULL AUTO_INCREMENT,
  `Brand name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Column1`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car brands`
--

LOCK TABLES `car brands` WRITE;
/*!40000 ALTER TABLE `car brands` DISABLE KEYS */;
INSERT INTO `car brands` VALUES (1,'Toyota'),(2,'BMW'),(3,'Audi');
/*!40000 ALTER TABLE `car brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `City name` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Kharkiv'),(2,'Kiyv'),(3,'Lviv'),(4,'Odesa');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales of services`
--

DROP TABLE IF EXISTS `sales of services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales of services` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `User car Id` bigint NOT NULL,
  `Service id` bigint NOT NULL,
  `Quantity (sec.)` int NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Sales_of_services_FK` (`User car Id`),
  KEY `Sales_of_services_FK_1` (`Service id`),
  CONSTRAINT `Sales_of_services_FK` FOREIGN KEY (`User car Id`) REFERENCES `user cars` (`Id`),
  CONSTRAINT `Sales_of_services_FK_1` FOREIGN KEY (`Service id`) REFERENCES `services` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales of services`
--

LOCK TABLES `sales of services` WRITE;
/*!40000 ALTER TABLE `sales of services` DISABLE KEYS */;
INSERT INTO `sales of services` VALUES (1,1,1,50,'2022-10-15'),(2,1,5,50,'2022-10-15'),(3,1,9,50,'2022-10-15'),(4,1,13,50,'2022-10-15'),(5,3,2,60,'2022-10-14'),(6,3,8,60,'2022-10-14'),(7,3,16,60,'2022-10-14'),(8,4,4,60,'2022-10-14'),(9,4,7,60,'2022-10-14'),(10,4,15,25,'2022-10-14'),(11,2,2,160,'2022-10-13'),(12,5,3,55,'2022-10-13'),(13,5,6,55,'2022-10-13'),(14,5,14,55,'2022-10-13'),(15,6,10,130,'2022-10-13');
/*!40000 ALTER TABLE `sales of services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `Service name` varchar(100) DEFAULT NULL,
  `Price for 1 second` int DEFAULT NULL,
  `City Id` bigint DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Services_FK` (`City Id`),
  CONSTRAINT `Services_FK` FOREIGN KEY (`City Id`) REFERENCES `cities` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Water',1,1),(2,'Water',2,2),(3,'Water',1,3),(4,'Water',1,4),(5,'Foam',5,1),(6,'Foam',5,3),(7,'Foam',5,4),(8,'Foam',6,2),(9,'Hot water',2,1),(10,'Hot water',2,3),(11,'Hot water',2,4),(12,'Hot water',3,2),(13,'Wax',10,1),(14,'Wax',10,3),(15,'Wax',10,4),(16,'Wax',11,2);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user cars`
--

DROP TABLE IF EXISTS `user cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user cars` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `Brand model id` bigint NOT NULL,
  `User Id` bigint NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `User_cars_FK` (`Brand model id`),
  KEY `User_cars_FK_1` (`User Id`),
  CONSTRAINT `User_cars_FK` FOREIGN KEY (`Brand model id`) REFERENCES `brand models` (`Id`),
  CONSTRAINT `User_cars_FK_1` FOREIGN KEY (`User Id`) REFERENCES `users` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user cars`
--

LOCK TABLES `user cars` WRITE;
/*!40000 ALTER TABLE `user cars` DISABLE KEYS */;
INSERT INTO `user cars` VALUES (1,1,1),(2,2,1),(3,3,2),(4,4,3),(5,5,4),(6,6,4);
/*!40000 ALTER TABLE `user cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(200) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Olya','aaa@.gmail.com'),(2,'Petya','bbb@.gmail.com'),(3,'Vasya','bbb@.gmail.com'),(4,'Kolya','bbb@.gmail.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'car washes'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-18 15:46:54
