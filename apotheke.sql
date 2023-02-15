-- MySQL dump 10.13  Distrib 8.0.32, for macos13 (x86_64)
--
-- Host: localhost    Database: apotheke
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `hersteller`
--

DROP TABLE IF EXISTS `hersteller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hersteller` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `plz` int NOT NULL,
  `ort` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hersteller`
--

LOCK TABLES `hersteller` WRITE;
/*!40000 ALTER TABLE `hersteller` DISABLE KEYS */;
INSERT INTO `hersteller` VALUES (1,'GlaxoSmithKlein',80258,'München'),(2,'TAD Pharma',27472,'Cuxhaven'),(3,'Stada',61118,'Bad Vilbel'),(4,'Ratiopharm GmbH',89079,'Ulm'),(5,'P&G Health Germany GmbH',64289,'Darmstadt');
/*!40000 ALTER TABLE `hersteller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lager`
--

DROP TABLE IF EXISTS `lager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lager` (
  `id` int NOT NULL AUTO_INCREMENT,
  `einheiten` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lager`
--

LOCK TABLES `lager` WRITE;
/*!40000 ALTER TABLE `lager` DISABLE KEYS */;
INSERT INTO `lager` VALUES (1,48),(2,653),(3,276),(4,50),(5,1000),(6,23),(7,110),(8,39);
/*!40000 ALTER TABLE `lager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medikament`
--

DROP TABLE IF EXISTS `medikament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medikament` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `medikament_typ_id` int NOT NULL,
  `hersteller_id` int NOT NULL,
  `lager_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `medikament_typ_id` (`medikament_typ_id`),
  KEY `hersteller_id` (`hersteller_id`),
  KEY `lager_id` (`lager_id`),
  CONSTRAINT `fk_hersteller_id` FOREIGN KEY (`hersteller_id`) REFERENCES `hersteller` (`id`),
  CONSTRAINT `fk_lager_id` FOREIGN KEY (`lager_id`) REFERENCES `lager` (`id`),
  CONSTRAINT `fk_medikament_typ_id` FOREIGN KEY (`medikament_typ_id`) REFERENCES `medikament_typ` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medikament`
--

LOCK TABLES `medikament` WRITE;
/*!40000 ALTER TABLE `medikament` DISABLE KEYS */;
INSERT INTO `medikament` VALUES (1,'Voltaren',2,1,1),(2,'Pantoprazol TAD 40mg',1,2,3),(3,'Oralpädon',3,3,2),(4,'Paracetamol 500 mg',1,4,4),(5,'Vigantolvit',1,5,5),(6,'Ambirix',4,1,6),(7,'Cetebe',5,1,7),(8,'MCP',7,3,8);
/*!40000 ALTER TABLE `medikament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medikament_typ`
--

DROP TABLE IF EXISTS `medikament_typ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medikament_typ` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medikament_typ`
--

LOCK TABLES `medikament_typ` WRITE;
/*!40000 ALTER TABLE `medikament_typ` DISABLE KEYS */;
INSERT INTO `medikament_typ` VALUES (1,'Tablet'),(2,'Gel'),(3,'Beutel'),(4,'Impfstoff'),(5,'Kapseln'),(6,'Lösung'),(7,'Tropfen');
/*!40000 ALTER TABLE `medikament_typ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warenbestand`
--

DROP TABLE IF EXISTS `warenbestand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warenbestand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `medikament_ID` int NOT NULL,
  `ablauf_datum` date NOT NULL,
  `verkaufspreis` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `medikament_id` (`medikament_ID`),
  CONSTRAINT `fk_medikament_id` FOREIGN KEY (`medikament_ID`) REFERENCES `medikament` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warenbestand`
--

LOCK TABLES `warenbestand` WRITE;
/*!40000 ALTER TABLE `warenbestand` DISABLE KEYS */;
INSERT INTO `warenbestand` VALUES (1,1,'2025-08-31',0.75),(2,3,'2030-09-30',2),(3,2,'2023-12-31',3.64),(4,4,'2027-06-30',0.2),(5,5,'2025-05-31',0.11),(6,6,'2022-11-30',20),(7,7,'2030-01-31',5),(8,8,'2023-01-31',3.9);
/*!40000 ALTER TABLE `warenbestand` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed 

