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
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `id_genero` int NOT NULL,
  `genero` varchar(50) NOT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Acción'),(2,'Aventuras'),(3,'Bélica'),(4,'Ciencia-Ficción'),(5,'Comedia'),(6,'Drama'),(7,'Erótica'),(8,'Histórica'),(9,'Infantil'),(10,'Musical'),(11,'Oeste'),(12,'Suspense'),(13,'Terror'),(14,'Thriller'),(15,'Literatura Juvenil, Novela'),(16,'Narrativa, Literaria'),(17,'Literatura Juvenil'),(18,'Novela Juvenil, Romantica'),(19,'Novela ,Ciencia Ficcion'),(20,'Fantasia'),(21,'Literatura Juvenil, Ciencia Ficción'),(22,'Novela Romántica, Erótica'),(23,'Novela Erótica'),(24,'Literatura Distópica'),(25,'Literatura Distópica Y Novela Juvenil'),(26,'Literatura Juvenil, Novela, Ficción Histórica'),(27,'Novela'),(28,'Estilo Poetico'),(29,'Novelas, Relatos'),(30,'Accion, Misterio'),(31,'Literatura Posmoderna'),(32,'Realismo Mágico'),(33,'Ficción Histórica'),(34,'Accion'),(35,'Tecno-Thriller'),(36,'Ficción'),(37,'Novela De Terror'),(38,'Misterio'),(39,'Aventuras'),(40,'Juvenil'),(41,'Drama'),(42,'sin genero');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-17 21:11:57
