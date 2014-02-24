CREATE DATABASE  IF NOT EXISTS `projects` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `projects`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: projects
-- ------------------------------------------------------
-- Server version	5.5.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `idcompany` int(11) NOT NULL,
  `company` varchar(255) NOT NULL,
  `cif` varchar(9) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idcompany`),
  UNIQUE KEY `cif_UNIQUE` (`cif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'AT servicios','B15151515','Teo','Coruña'),(2,'Otra','B16','Santiago','Coruña');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duties`
--

DROP TABLE IF EXISTS `duties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duties` (
  `idduties` int(11) NOT NULL,
  `duty` varchar(255) NOT NULL,
  PRIMARY KEY (`idduties`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duties`
--

LOCK TABLES `duties` WRITE;
/*!40000 ALTER TABLE `duties` DISABLE KEYS */;
INSERT INTO `duties` VALUES (1,'Jefe de proyecto'),(2,'Programador');
/*!40000 ALTER TABLE `duties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duties_has_projects`
--

DROP TABLE IF EXISTS `duties_has_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duties_has_projects` (
  `duties_idduties` int(11) NOT NULL,
  `projects_idproject` int(11) NOT NULL,
  PRIMARY KEY (`duties_idduties`,`projects_idproject`),
  KEY `fk_duties_has_projects_projects1_idx` (`projects_idproject`),
  KEY `fk_duties_has_projects_duties_idx` (`duties_idduties`),
  CONSTRAINT `fk_duties_has_projects_duties` FOREIGN KEY (`duties_idduties`) REFERENCES `duties` (`idduties`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_duties_has_projects_projects1` FOREIGN KEY (`projects_idproject`) REFERENCES `projects` (`idproject`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duties_has_projects`
--

LOCK TABLES `duties_has_projects` WRITE;
/*!40000 ALTER TABLE `duties_has_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `duties_has_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `idproject` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `alias` varchar(45) NOT NULL,
  `date_ini` date DEFAULT NULL,
  `date_fini` date DEFAULT NULL,
  `description` text,
  `tweet` varchar(45) NOT NULL,
  `companies_idcompany` int(11) NOT NULL,
  `statuses_idstatuses` int(11) NOT NULL,
  PRIMARY KEY (`idproject`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `alias_UNIQUE` (`alias`),
  UNIQUE KEY `tweet_UNIQUE` (`tweet`),
  KEY `fk_projects_companies1_idx` (`companies_idcompany`),
  KEY `fk_projects_statuses1_idx` (`statuses_idstatuses`),
  CONSTRAINT `fk_projects_companies1` FOREIGN KEY (`companies_idcompany`) REFERENCES `companies` (`idcompany`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_projects_statuses1` FOREIGN KEY (`statuses_idstatuses`) REFERENCES `statuses` (`idstatuses`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'Segue chovendo WebService','WSCchovendo','2014-02-01','2014-04-01','Implantación de webservice','WebService para Segue Chovendo',1,2),(2,'22','alias 22','2013-11-01','2014-01-04','imp13','tweet3',2,1),(4,'Nombre4','ALias4','2014-02-01','2014-03-15','larga','desce breve',1,2);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuses` (
  `idstatuses` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`idstatuses`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'Pendiente'),(2,'En curso'),(3,'Cerrado'),(4,'Cancelado');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `projects_idproject` int(11) NOT NULL,
  `users_idusers` int(11) NOT NULL,
  `duties_idduties` int(11) NOT NULL,
  PRIMARY KEY (`projects_idproject`,`users_idusers`,`duties_idduties`),
  KEY `fk_tasks_projects1_idx` (`projects_idproject`),
  KEY `fk_tasks_users1_idx` (`users_idusers`),
  KEY `fk_tasks_duties1_idx` (`duties_idduties`),
  CONSTRAINT `fk_tasks_projects1` FOREIGN KEY (`projects_idproject`) REFERENCES `projects` (`idproject`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tasks_users1` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tasks_duties1` FOREIGN KEY (`duties_idduties`) REFERENCES `duties` (`idduties`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,1,1),(1,2,2);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `idusers` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `tfno` varchar(12) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`idusers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Alvaro','tarela','981','alvaro@mail.com'),(2,'Paloma','Soto','982','paloma@mail.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_has_duties_has_projects`
--

DROP TABLE IF EXISTS `users_has_duties_has_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_has_duties_has_projects` (
  `users_idusers` int(11) NOT NULL,
  `duties_has_projects_duties_idduties` int(11) NOT NULL,
  `duties_has_projects_projects_idproject` int(11) NOT NULL,
  PRIMARY KEY (`users_idusers`,`duties_has_projects_duties_idduties`,`duties_has_projects_projects_idproject`),
  KEY `fk_users_has_duties_has_projects_duties_has_projects1_idx` (`duties_has_projects_duties_idduties`,`duties_has_projects_projects_idproject`),
  KEY `fk_users_has_duties_has_projects_users1_idx` (`users_idusers`),
  CONSTRAINT `fk_users_has_duties_has_projects_users1` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_duties_has_projects_duties_has_projects1` FOREIGN KEY (`duties_has_projects_duties_idduties`, `duties_has_projects_projects_idproject`) REFERENCES `duties_has_projects` (`duties_idduties`, `projects_idproject`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_has_duties_has_projects`
--

LOCK TABLES `users_has_duties_has_projects` WRITE;
/*!40000 ALTER TABLE `users_has_duties_has_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_has_duties_has_projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-24  1:14:11
