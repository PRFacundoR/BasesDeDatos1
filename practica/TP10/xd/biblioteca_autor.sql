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
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `id_autor` int NOT NULL,
  `autor` varchar(100) DEFAULT NULL,
  `tipo` int NOT NULL,
  PRIMARY KEY (`id_autor`),
  UNIQUE KEY `autor` (`autor`),
  KEY `fktipo1` (`tipo`),
  CONSTRAINT `fktipo1` FOREIGN KEY (`tipo`) REFERENCES `tipo` (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Alejandro Dumas',2),(2,'Aluisio Azevedo',2),(3,'Angel Rodríguez Kauth',2),(4,'Ann Radcliffe',2),(5,'Arthur Conan Doyle',2),(6,'Arthur Machen',2),(7,'Blue Jeans',2),(8,'Bram Stoker',2),(9,'Charles Dickens',2),(10,'Charles Maturin',2),(11,'Dan Brown ',2),(12,'Dashiel Hammett',2),(13,'E. T. A. Hoffman',2),(14,'E.L.James ',2),(15,'Edgar Alan Poe',2),(16,'Eliza Lynn Linton',2),(17,'Fiódor Dostoyevski',2),(18,'Franz Kafka',2),(19,'G. K. Cherleston',2),(20,'Garcia Marquez ',2),(21,'Gaston Leroux',2),(22,'Gustavo Adolfo Bécquer',2),(23,'Guy De Maupassant',2),(24,'H. P. Lovecraft',2),(25,'Henry James',2),(26,'Horace Walpole',2),(27,'Horacio Quiroga',2),(28,'Horacio Quiroga ',2),(29,'Instituto Educativo Modelo',2),(30,'Irving Washington',2),(31,'J.A.Redmersky',2),(32,'J.K.Rowling ',2),(33,'Jackson Pearce ',2),(34,'James Dashner ',2),(35,'Jhon Green ',2),(36,'Joaquín D’Holdan',2),(37,'Johann Wolfgang Von Goethe',2),(38,'John Boyne ',2),(39,'John Green ',2),(40,'John William Polidori',2),(41,'José Maria Eça De Queirós Y Ramalho Ortigão',2),(42,'Joseph Sheridan Le Fanu',2),(43,'Juan Ruiz ',2),(44,'Julia E. Fernández',2),(45,'Julio Verne',2),(46,'Karla Cárcamo-Pérez',2),(47,'Khaled Hosseini ',2),(48,'León Tolstoi ',2),(49,'M. R. James',2),(50,'Markus Zusak ',2),(51,'Mary Shelley',2),(52,'Nathaniel Hawthorne',2),(53,'Oscar Wilde',2),(54,'Pablo Palacio',2),(55,'Paola Predicadori',2),(56,'Patrick Suskind ',2),(57,'Paul Féval',2),(58,'Paulo Sérgio De Vasconcellos Y Rogério Hafez',2),(59,'Pedro Pablo Sacristán',2),(60,'Pittacus Lore ',2),(61,'Professoras Monique Lima E Priscila Menezes',2),(62,'Richard Matheson',2),(63,'Robert Louis Stevenson',2),(64,'Rubén Darío ',2),(65,'Rudyard Kipling',2),(66,'Sheridan Le Fanu',2),(67,'Silvia Hervas ',2),(68,'Siobhan Vivian ',2),(69,'Sir Arthur Conan Doyle',2),(70,'Steen Steensen Blicher',2),(71,'Stephanie Meyer ',2),(72,'Stephanie Perkins',2),(73,'Suzanne Collins',2),(74,'Théophile Gautier',2),(75,'Tom Clancy ',2),(76,'Universidad Nacional Ecológica',2),(77,'Veronica Roth ',2),(78,'Villa Educación',2),(79,'Wilhan Santin',2),(80,'Wilkie Coliins',2),(81,'William Beckford',2),(82,'Xulio Concepción Suárez',2),(83,'Fritz Lang',1),(84,'Yasujiro Ozu',1),(85,'Akira Kurosawa',1),(86,'Stanley Kubrick',1),(87,'William Friedkin',1),(88,'Ridley Scott',1),(89,'Sam Raimi',1),(90,'Jonathan Demme',1),(91,'Frank Darabont',1),(92,'Roger Allers',1),(93,'Ron Howard',1),(94,'Chris Noonan',1),(95,'Brad Silberling',1),(96,'Álex de la Iglesia',1),(97,'Jerry Zucker',1),(98,'Josiane Balasko',1),(99,'Tim Robbins',1),(100,'David Fincher',1),(101,'Fernando Trueba',1),(102,' Mariano Barroso',1),(103,'Alejandro Amenábar',1),(104,'Robert Rodriguez',1),(105,'Frank Marshall',1),(106,'Santiago Segura',1),(107,'Pedro Almodóvar',1),(108,'Miguel Courtois',1),(109,'Clint Eastwood',1),(110,'Alberto Rodríguez',1),(111,'Corey Yuen',1),(112,'Daniel Burman',1),(113,'Alejandro González Iñárritu',1),(114,'Brian Pimental',1),(115,'Joachim Roenning',1),(116,'David Trueba',1),(117,'Koldo Serra',1),(118,'Tony Giglio',1),(119,'Brian Robbins',1),(120,'John Lasseter',1),(121,'Martin Campbell',1),(122,'Kevin Smith',1),(123,'Michael Mann',1),(124,'Mark Neveldine',1),(125,'Simon West',1),(126,'Sidney Lumet',1),(127,'Liz Friedlander',1),(128,'James Wong',1),(129,'Donald Petrie',1),(130,'Mike Binder',1),(131,'Miguel Santesmases',1),(132,'J.J. Abrams',1),(133,'Gil Kenan',1),(134,'Tom Dey',1),(135,'Adam McKay',1),(136,'Jonathan Dayton',1),(137,'Keenen Ivory Wayans',1),(138,'Gore Verbinski',1),(139,'Spike Lee',1),(140,'Wolfgang Petersen',1),(141,'Robert Towne',1),(142,'Manuel Huerga',1),(143,'Steve \"Spaz\" Williams',1),(144,'Peyton Reed',1),(145,'Christophe Gans',1),(146,'Bryan Singer',1),(147,'Andrew Davis',1),(148,'Joe Russo',1);
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
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
