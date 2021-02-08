-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: enterprises
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `companyemployee`
--

DROP TABLE IF EXISTS `companyemployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companyemployee` (
  `companyemployeid` int NOT NULL AUTO_INCREMENT,
  `company` varchar(150) DEFAULT NULL,
  `companyemail` varchar(100) DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `workstartdate` date DEFAULT NULL,
  `workenddate` date DEFAULT NULL,
  `employee_employeeid` int DEFAULT NULL,
  PRIMARY KEY (`companyemployeid`),
  UNIQUE KEY `companyemployeid_UNIQUE` (`companyemployeid`),
  KEY `fk_companyemployee_employee1_idx` (`employee_employeeid`),
  CONSTRAINT `fk_companyemployee_employee1` FOREIGN KEY (`employee_employeeid`) REFERENCES `employee` (`employeeid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyemployee`
--

LOCK TABLES `companyemployee` WRITE;
/*!40000 ALTER TABLE `companyemployee` DISABLE KEYS */;
INSERT INTO `companyemployee` VALUES (1,'Advance','fer@advance.com',3500000,'2021-02-06','2028-12-31',1),(3,'ISA','Ramona@advance.com',5500000,'2021-02-06','2028-12-31',3),(4,'ISA','Arturo@advance.com',5500000,'2021-02-06','2028-12-31',4),(5,'Advance','Arturo@advance.com',5500000,'2021-02-06','2028-12-31',5),(6,'Advance','Benito@advance.com',5500000,'2021-02-06','2028-12-31',6),(12,'ISA','dan@advance.com',5500000,'2021-02-06','2028-12-31',12);
/*!40000 ALTER TABLE `companyemployee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employeeid` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phonenumber` int DEFAULT NULL,
  `adress` varchar(100) DEFAULT NULL,
  `documenttype` varchar(30) DEFAULT NULL,
  `documentnumber` int DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`employeeid`),
  UNIQUE KEY `employeeid_UNIQUE` (`employeeid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Fernando','Rincón ','M','Fer@gmail.com',321456,'por aqui','CC',112,'2021-02-02 12:12:54','2021-02-08 11:07:48'),(3,'Romona','Rios','F','Ramona@gmail.com',356646,'por aqui','CC',1254,NULL,NULL),(4,'Arturo','Avila','M','ART@gmail.com',321,'calle aqui','cc',1121,'2021-02-02 10:12:50','2021-02-02 12:12:50'),(5,'Sebastian','Suarez','M','seb@gmail.com',321,'calle aqui','cc',1121,'2021-02-02 10:12:50','2021-02-02 12:12:50'),(6,'Benito','Bueno','M','ben@gmail.com',321,'calle aqui','cc',1121,'2021-02-02 10:12:50','2021-02-02 12:12:50'),(12,'Daniel','Ruiz','M','dan@gmail.com',321466,'por aqui','cc',112889,'2021-02-08 00:26:11','2021-02-08 11:08:11'),(21,'Danny','Rodriguez','M','Danny@gmail.com',321,'calle aqui','cc',1121,'2021-02-02 10:12:50','2021-02-02 12:12:50');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeacounts`
--

DROP TABLE IF EXISTS `employeeacounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeacounts` (
  `employeeacountsid` int NOT NULL AUTO_INCREMENT,
  `backname` varchar(100) DEFAULT NULL,
  `acountnumber` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `employee_employeeid` int DEFAULT NULL,
  PRIMARY KEY (`employeeacountsid`),
  UNIQUE KEY `employeeacountsid_UNIQUE` (`employeeacountsid`),
  KEY `fk_employeeacounts_employee1_idx` (`employee_employeeid`),
  CONSTRAINT `fk_employeeacounts_employee1` FOREIGN KEY (`employee_employeeid`) REFERENCES `employee` (`employeeid`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeacounts`
--

LOCK TABLES `employeeacounts` WRITE;
/*!40000 ALTER TABLE `employeeacounts` DISABLE KEYS */;
INSERT INTO `employeeacounts` VALUES (123,'fer',123,'activo',1),(124,'Dan',124,'activo',12);
/*!40000 ALTER TABLE `employeeacounts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-08 14:03:19
