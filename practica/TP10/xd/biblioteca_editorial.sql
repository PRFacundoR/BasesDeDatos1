-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: biblioteca
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `editorial`
--

DROP TABLE IF EXISTS `editorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editorial` (
  `id_editorial` int NOT NULL,
  `editorial` varchar(100) DEFAULT NULL,
  `tipo` int NOT NULL,
  PRIMARY KEY (`id_editorial`),
  UNIQUE KEY `editorial` (`editorial`),
  KEY `fktipoE` (`tipo`),
  CONSTRAINT `fktipoE` FOREIGN KEY (`tipo`) REFERENCES `tipoe` (`id_tipoE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editorial`
--

LOCK TABLES `editorial` WRITE;
/*!40000 ALTER TABLE `editorial` DISABLE KEYS */;
INSERT INTO `editorial` VALUES (1,'Editorial Mirahadas',1),(2,'Editorial Errata Naturae',1),(3,'Editorial Pre-textos',1),(4,'Editorial Sexto Piso',1),(5,'Editorial Nórdica',1),(6,'Editorial Acantilado',1),(7,'Editorial de Conatus',1),(8,'Editorial Cabaret Voltaire',1),(9,'Editorial La Huerta Grande',1),(10,'Editorial Impedimenta',1),(11,'Libros de la Umbría y la Solana',1),(12,'Blackie Books',1),(13,'Editorial Caro Raggio',1),(14,'Libros del Asteroide',1),(15,'Editorial Renacimiento',1),(16,'Editorial Pálido Fuego',1),(17,'Editorial Páginas de Espuma',1),(18,'Editorial Menoscuarto',1),(19,'Editorial Periférica',1),(20,'Editorial Visor',1),(21,'Editorial La Línea del Horizonte',1),(22,'Editorial El Ático de los Libros',1),(23,'Editorial Hiperon',1),(24,'Editorial Minúscula',1),(25,'Editorial Baile del Sol',1),(26,'Editorial La Isla de Sitolá',1),(27,'Editorial Hoja de Lata',1),(28,'Nube de Tinta ',1),(29,'Montena',1),(30,'Alfaguara ',1),(31,'Plataforma ',1),(32,'Planeta ',1),(33,'Molino ',1),(34,'Molina ',1),(35,'Salamandra ',1),(36,'Chicken House ',1),(37,'Grijalbo ',1),(38,'Lumen ',1),(39,'Debolsillo ',1),(40,'Alianza',1),(41,'Planeta',1),(42,'Seix Barral ',1),(43,'Books4pocket ',1),(44,'Hispanomerica ',1),(45,'Divisa',2),(46,'Filmax',2),(47,'Warner',2),(48,'Fox',2),(49,'JRB',2),(50,'Buena Vista',2),(51,'Universal',2),(52,'Sogepaq',2),(53,'Columbia',2),(54,'Lauren',2),(55,'Paramount',2),(56,'Sony Pictures',2),(57,'Manga',2),(58,'Tecmo',2),(59,'Hispano Films',2),(60,'Walt Disney',2),(61,'Fernando Trueba P.C.',2),(62,'Screen Gems',2),(63,'MGM',2),(64,'Weinstein',2),(65,'Lakeshore',2),(66,'Screen',2),(67,'Miramax',2),(68,'Aurum',2),(69,'Disney',2),(70,'Century Fox',2),(71,'Lola Films',2),(72,'Amblin Entertainment',2),(73,'Paramount Pictures',2),(74,'Columbia Pictures',2),(75,'Fox Searchlight Pictures',2),(76,'Walt Disney Pictures',2),(77,'Universal Pictures',2),(78,'Warner Bros. Pictures',2),(79,'MediaPro-Future Films',2),(80,'Universal Studios',2),(81,'UIP',2),(82,'Warner Bros',2),(83,'Touchstone Pictures',2);
/*!40000 ALTER TABLE `editorial` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-17 21:11:59
