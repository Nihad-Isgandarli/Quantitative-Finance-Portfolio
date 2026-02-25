CREATE DATABASE  IF NOT EXISTS `online_retail` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `online_retail`;
-- MySQL dump 10.13  Distrib 8.0.44, for macos15 (arm64)
--
-- Host: localhost    Database: online_retail
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Dumping data for table `bank_account`
--

LOCK TABLES `bank_account` WRITE;
/*!40000 ALTER TABLE `bank_account` DISABLE KEYS */;
INSERT INTO `bank_account` VALUES ('CH11-0001','UBS'),('CH22-0002','Suisse'),('CH33-0003','Lugano bank'),('CH44-0004','Deutsche Bank'),('CH55-0005','Raiffeisen'),('CH66-0006','ZKB'),('DE11-2001','Commerzbank'),('IT11-1001','UniCredit');
/*!40000 ALTER TABLE `bank_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Nihad Isgandarli','Lugano, Switzerland','nihad@example.com'),(2,'Alice Rossi','Milano, Italy','alice@example.com'),(3,'Bob Smith','Zurich, Switzerland','bob@example.com'),(4,'Marco Bianchi','Roma, Italy','marco@example.com'),(5,'Nihad Isgandarli','Lugano, Switzerland','nihad@example.com'),(6,'Alice Rossi','Milano, Italy','alice@example.com'),(7,'Bob Smith','Zurich, Switzerland','bob@example.com'),(8,'Marco Bianchi','Roma, Italy','marco@example.com'),(9,'Laura Conti','Torino, Italy','laura@example.com'),(10,'David Müller','Bern, Switzerland','david@example.com'),(11,'Sara Keller','Basel, Switzerland','sara@example.com'),(12,'John Weber','Munich, Germany','john@example.com'),(13,'Nihad Isgandarli','Lugano, Switzerland','nihad@example.com'),(14,'Alice Rossi','Milano, Italy','alice@example.com'),(15,'Bob Smith','Zurich, Switzerland','bob@example.com'),(16,'Marco Bianchi','Roma, Italy','marco@example.com'),(17,'Laura Conti','Torino, Italy','laura@example.com'),(18,'David Müller','Bern, Switzerland','david@example.com'),(19,'Sara Keller','Basel, Switzerland','sara@example.com'),(20,'John Weber','Munich, Germany','john@example.com'),(21,'Elena Romano','Napoli, Italy','elena@example.com'),(22,'Mert Yilmaz','Istanbul, Turkey','mert@example.com'),(23,'Sofia Costa','Lisbon, Portugal','sofia@example.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (100,50,5.00,1),(200,20,40.00,1),(300,70,56.00,2),(400,100,78.00,3),(500,30,120.00,3),(600,15,250.00,3),(700,80,15.00,1),(800,60,35.00,2),(900,25,60.00,2),(1000,10,500.00,3),(1100,100,8.50,1),(1200,45,42.00,2);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `item_class`
--

LOCK TABLES `item_class` WRITE;
/*!40000 ALTER TABLE `item_class` DISABLE KEYS */;
INSERT INTO `item_class` VALUES (1,'bad'),(2,'Standard'),(3,'good');
/*!40000 ALTER TABLE `item_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `provide`
--

LOCK TABLES `provide` WRITE;
/*!40000 ALTER TABLE `provide` DISABLE KEYS */;
INSERT INTO `provide` VALUES (1,'CH11-0001'),(5,'CH11-0001'),(1,'CH22-0002'),(6,'CH22-0002'),(2,'CH33-0003'),(3,'CH44-0004'),(2,'CH55-0005'),(3,'CH66-0006'),(7,'DE11-2001'),(4,'IT11-1001');
/*!40000 ALTER TABLE `provide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (1,100),(3,100),(1,200),(2,200),(1,300),(2,300),(1,400),(3,400),(1,500),(6,500),(2,600),(7,600),(1,700),(5,700),(3,800),(5,800),(2,900),(5,900),(4,1000),(3,1100),(6,1100),(4,1200);
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reg_customer`
--

LOCK TABLES `reg_customer` WRITE;
/*!40000 ALTER TABLE `reg_customer` DISABLE KEYS */;
INSERT INTO `reg_customer` VALUES (1,'nihad01','20030103'),(2,'alice99','password'),(3,'bob77','bob2522'),(4,'marco_b','roma123'),(5,'laura_c','torino456'),(6,'david_m','bern789'),(7,'sara_k','basel000');
/*!40000 ALTER TABLE `reg_customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-12 21:32:33
