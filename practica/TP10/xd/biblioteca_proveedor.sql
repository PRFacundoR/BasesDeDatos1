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
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `dni` varchar(8) NOT NULL,
  `domicilio` varchar(100) NOT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`),
  UNIQUE KEY `dni` (`dni`),
  UNIQUE KEY `telefono` (`telefono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Abaca, Amado Daniel','29608470',' Rivadavia 1266','913270012'),(2,'Aballay, Hugo Hector','13601726',' Santa Fe 266','913224578'),(3,'Abdo, Fco. Enrique','17531657',' M. Moreno','913232367'),(4,'Abila, Antonio Enrique','20191194',' BÂ°El Carmen-Alvarado 2424','913231212'),(5,'Abrahan, Medardo Manuel','11705042',' Ameghino 407','913224451'),(6,'Abregu, Luis Jose','5944406',' Sgo Del Estero 1687','913270765'),(7,'Acosta, Magdalena Maria','17659734',' San Juan 2400-Bk.H-Dt.101','913259633'),(8,'Aguero, Pablo Jose','13835586',' EspaÃ±a 253','913235847'),(9,'Aguilar, Dario Oscar','24837296',' Olavarria 873','913226878'),(10,'Aguilar, Jose Juan','11300774',' Alvarado 70','913761221'),(11,'Alderete, Alberto Jorge','16260406',' BÂ°Postal Pje U Casa 2','913274556'),(12,'Alfaro, Elena Luisa','11407748',' Sgo Del Estero 1121','913236594'),(13,'Alfaro, Francisco Felix','14291044',' Mendoza 1235','913277415'),(14,'Alfaro, Delfin Mario','16563588',' Pje. Las Piedras 2356','913278394'),(15,'Alvarez, Isidro Gabriel','10401834',' Pje Publico Mz.A C.6','916548911'),(16,'Amaya, Froilan Mario','24186200',' Macueta','916654320'),(17,'Amaya, M. Orlando','16336594',' Los Crisantemos 55','912347865'),(18,'Aranda, Oscar Alberto','20775459',' Las Margaritas 245','913564895'),(19,'Arguello, Antonio Rolando','13390359',' Urquiza 1456','917654329'),(20,'Arrieta, Antonio Hector','13835657',' BÂ°100 Viv. Mz.C Casa 14','913235568');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-17 21:11:56
