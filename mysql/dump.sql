CREATE DATABASE  IF NOT EXISTS `quiz` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `quiz`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: quiz
-- ------------------------------------------------------
-- Server version	5.7.24

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
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `description` varchar(200) NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_idx` (`question_id`),
  CONSTRAINT `id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (1,1,'answer1',0),(2,1,'answer2',0),(3,1,'answer3',1),(4,1,'answer4',0),(69,24,'answer1',0),(70,24,'answer2',0),(71,24,'answer3',1),(72,24,'answer4',0),(125,40,'Send query to REST API endpoint',0),(126,40,'Search DOM using CSS selector',1),(127,40,'Create database query',0),(128,40,'Create <select> element in DOM',0),(129,41,'<li>',0),(130,41,'<ul>',1),(131,41,'<p>',0),(132,41,'<ol>',0),(133,42,'First in, first out',1),(134,42,'Last in, first out',0),(135,42,'Randomly',0),(136,42,'Based on the object\'s hash',0),(137,43,'Compile code',0),(138,43,'Start a program',0),(139,43,'Run the main() method',0),(140,43,'Initialize an object',1),(141,44,'true',0),(142,44,'false',1),(143,45,'12',0),(144,45,'39',0),(145,45,'57',1),(146,45,'NaN',0),(147,46,'HTML',0),(148,46,'Java',1),(149,46,'CSS',0),(150,46,'Javascript',0),(151,47,'.js',1),(152,47,'.script',0),(153,47,'.py',0),(154,47,'none',0),(155,48,'Java',0),(156,48,'C++',0),(157,48,'python',0),(158,48,'ECMAScript',1),(159,49,'Compiling code',0),(160,49,'Writing web applications',0),(161,49,'Version control',1),(162,49,'Monitoring web servers',0);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_info`
--

DROP TABLE IF EXISTS `contact_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_info` (
  `identity_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `contact` smallint(1) NOT NULL,
  PRIMARY KEY (`identity_id`),
  CONSTRAINT `contact_identity_id` FOREIGN KEY (`identity_id`) REFERENCES `identity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_info`
--

LOCK TABLES `contact_info` WRITE;
/*!40000 ALTER TABLE `contact_info` DISABLE KEYS */;
INSERT INTO `contact_info` VALUES (1,'Sarah Ansnes','sarah@gmail.com',NULL,1),(3,'Bentein Vathne Thomassen','benteinvathnethomassen@gmail.com','+4795008504',1),(19,'Bentein ','benteinvt@gmail.com',NULL,1),(25,'Bentein Thomassen','benteinvt@gmail.com',NULL,1),(27,'Bentein','benteinvt@gmail.com',NULL,1),(28,'Tester','aslkdjasdklj',NULL,1),(29,'Bentein','bentein@gmail.com',NULL,0),(30,'asdas','dasdasd',NULL,1),(31,'Bentein','bentein@gmail.com',NULL,1),(32,'Bentein','bentein@gmail.com','95008504',0),(34,'Bentein','bentein@dnb.no','95008504',1);
/*!40000 ALTER TABLE `contact_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identity`
--

DROP TABLE IF EXISTS `identity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identity`
--

LOCK TABLES `identity` WRITE;
/*!40000 ALTER TABLE `identity` DISABLE KEYS */;
INSERT INTO `identity` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36);
/*!40000 ALTER TABLE `identity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) NOT NULL,
  `difficulty` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'test question','MEDIUM'),(24,'test','HARD'),(40,'What is the purpose of the querySelector() method in javascript?','EASY'),(41,'Which HTML tag is used to wrap an unsorted list?','EASY'),(42,'In what order are objects removed from a queue?','EASY'),(43,'What does a constructor do?','EASY'),(44,'What is the value of !true?','EASY'),(45,'What is the result of 3+2+\"7\" in javascript?','EASY'),(46,'Which of the following is not a core technology of the web?','EASY'),(47,'What is the file extension for javascript files?','EASY'),(48,'Which of the following is javascript based on?','EASY'),(49,'Which of the following best describes the function of git?','EASY');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identity_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `difficulty` varchar(10) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `registration_identity_id_idx` (`identity_id`),
  CONSTRAINT `registration_identity_id` FOREIGN KEY (`identity_id`) REFERENCES `identity` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` VALUES (7,1,'Sarah','MEDIUM',1543419355181),(8,3,'Kule Bentein','MEDIUM',1543422272691),(9,3,'Kule Bentein','MEDIUM',1543422370750),(10,3,'Kule Bentein','MEDIUM',1543422371496),(11,3,'Kule Bentein','MEDIUM',1543422372240),(12,3,'Kule Bentein','MEDIUM',1543477333939),(13,19,'Bentein','EASY',1544000651182),(14,19,'Bentein','EASY',1544000657907),(15,19,'Bentein','EASY',1544000659047),(16,19,'Bentein','EASY',1544000702269),(17,19,'Bentein','EASY',1544000738332),(18,19,'Bentein','MEDIUM',1544000746341),(19,19,'Bentein','HARD',1544000750220),(20,19,'Bentein','EASY',1544000918516),(21,19,'Bentein','EASY',1544000966291),(22,19,'Bentein','HARD',1544000975693),(23,19,'Bentein','HARD',1544001124683),(24,19,'Bentein','EASY',1544001155659),(25,19,'Bentein','EASY',1544001226141),(26,19,'Bentein','HARD',1544001230654),(27,19,'Bentein','HARD',1544001239011),(28,19,'Bentein','MEDIUM',1544001378011),(29,19,'Bentein','HARD',1544001383755),(30,19,'Bentein','EASY',1544001599583),(31,19,'Bentein','EASY',1544001614840),(32,25,'Bentein','EASY',1544001698370),(33,25,'Bentein','HARD',1544001795928),(34,25,'Bentein','EASY',1544001839118),(35,25,'Bentein','EASY',1544001885225),(36,25,'Bentein','EASY',1544002475844),(37,25,'Bentein','EASY',1544002775539),(38,25,'Bentein','EASY',1544002825232),(39,25,'Bentein','EASY',1544002849904),(40,25,'Bentein','EASY',1544003726973),(41,25,'Bentein','EASY',1544003948423),(42,25,'Bentein','EASY',1544008220702),(43,26,'','EASY',1544008873137),(44,26,'','EASY',1544008892495),(45,27,'Demo','EASY',1544010176772),(46,28,'Tester','MEDIUM',1544010817293),(47,29,'Tester','EASY',1544011050518),(48,30,'','EASY',1544011143767),(49,31,'Bentein','EASY',1544011192016),(50,32,'Bentein','EASY',1544011264568),(51,33,'','EASY',1544011736471),(52,33,'','EASY',1544011741467),(53,33,'Bentein','EASY',1544011842308),(54,34,'Bentein','EASY',1544013224019),(55,34,'Bentein','MEDIUM',1544013332529),(56,35,'Bentein','EASY',1544015121390),(57,35,'Bentein','EASY',1544015164950),(58,35,'Bentein','EASY',1544015182980),(59,35,'Bentein','MEDIUM',1544015185436),(60,35,'Bentein','EASY',1544170306177),(61,35,'Bentein','EASY',1544170409837),(62,35,'Bentein','EASY',1544170468777),(63,35,'Bentein','EASY',1544171244426),(64,35,'Bentein','EASY',1544171274246),(65,35,'Bentein','EASY',1544174723165),(66,35,'Bentein','MEDIUM',1544174832627),(67,35,'Bentein','HARD',1544174920960),(68,35,'Bentein','EASY',1544175011629),(69,36,'Bentein','EASY',1544182270695);
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `response`
--

DROP TABLE IF EXISTS `response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `response` (
  `question_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `registration_id` int(11) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  PRIMARY KEY (`question_id`,`registration_id`),
  KEY `question_id_idx` (`question_id`),
  KEY `answer_id_idx` (`answer_id`),
  KEY `registration_id_idx` (`registration_id`),
  CONSTRAINT `answer_id` FOREIGN KEY (`answer_id`) REFERENCES `answer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `question_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `registration_id` FOREIGN KEY (`registration_id`) REFERENCES `registration` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `response`
--

LOCK TABLES `response` WRITE;
/*!40000 ALTER TABLE `response` DISABLE KEYS */;
INSERT INTO `response` VALUES (1,3,8,1543484034704),(1,1,28,1544001379446),(1,1,46,1544010818708),(1,1,55,1544013334044),(1,1,59,1544015186177),(1,3,66,1544174833267),(24,69,8,1543422272699),(24,72,22,1544000978897),(24,70,23,1544001125830),(24,69,26,1544001231699),(24,72,27,1544001239619),(24,72,29,1544001386380),(24,69,33,1544001797193),(24,70,67,1544174921976),(40,126,40,1544003746801),(40,126,41,1544003995253),(40,126,42,1544008240796),(40,126,43,1544008874261),(40,126,44,1544008894364),(40,126,45,1544010180179),(40,125,47,1544011055576),(40,126,48,1544011146212),(40,125,49,1544011194265),(40,127,50,1544011265512),(40,125,52,1544011746069),(40,126,53,1544011844340),(40,126,54,1544013233897),(40,126,56,1544015124653),(40,126,57,1544015165695),(40,125,60,1544170310311),(40,126,61,1544170411111),(40,126,62,1544170469536),(40,126,65,1544174723831),(40,126,68,1544175012254),(40,126,69,1544182272689),(41,130,40,1544003749729),(41,130,41,1544004005601),(41,130,42,1544008259577),(41,131,43,1544008875462),(41,132,44,1544008895083),(41,130,45,1544010186272),(41,130,47,1544011056489),(41,129,48,1544011147735),(41,129,49,1544011195014),(41,130,50,1544011266116),(41,130,52,1544011746728),(41,130,53,1544011846349),(41,130,54,1544013236380),(41,129,56,1544015125402),(41,129,57,1544015167195),(41,129,60,1544170311120),(41,130,61,1544170411860),(41,129,62,1544170470053),(41,130,65,1544174724438),(41,130,68,1544175012878),(41,129,69,1544182273810),(42,133,40,1544003756763),(42,133,41,1544004008115),(42,136,43,1544008877741),(42,134,44,1544008895677),(42,133,45,1544010196541),(42,133,47,1544011056914),(42,133,48,1544011148203),(42,133,49,1544011195716),(42,133,50,1544011266590),(42,133,52,1544011747243),(42,133,53,1544011847454),(42,133,54,1544013237409),(42,135,56,1544015126073),(42,133,57,1544015167709),(42,133,60,1544170311838),(42,134,61,1544170412321),(42,134,62,1544170470648),(42,134,65,1544174725072),(42,134,68,1544175013481),(42,135,69,1544182274667),(43,140,40,1544003759228),(43,140,41,1544004012580),(43,137,43,1544008878944),(43,139,44,1544008896239),(43,140,45,1544010198770),(43,137,47,1544011057488),(43,137,48,1544011148774),(43,137,49,1544011196552),(43,137,50,1544011267089),(43,139,52,1544011749793),(43,140,53,1544011852134),(43,140,54,1544013239414),(43,137,56,1544015126616),(43,137,57,1544015168325),(43,137,60,1544170315595),(43,138,61,1544170412835),(43,137,62,1544170471132),(43,138,65,1544174725622),(43,138,68,1544175013997),(43,138,69,1544182275592),(44,142,40,1544003762029),(44,142,41,1544004014658),(44,141,43,1544008879786),(44,141,44,1544008897524),(44,142,45,1544010200605),(44,141,47,1544011059586),(44,141,48,1544011149800),(44,141,49,1544011197622),(44,141,50,1544011268111),(44,142,52,1544011750288),(44,142,53,1544011853651),(44,142,54,1544013240672),(44,142,56,1544015127179),(44,141,57,1544015169271),(44,141,60,1544170316636),(44,141,61,1544170413321),(44,141,62,1544170471617),(44,141,65,1544174726231),(44,141,68,1544175014528),(44,142,69,1544182276328),(45,145,40,1544003764337),(45,145,41,1544004016284),(45,145,43,1544008880678),(45,146,44,1544008898112),(45,145,45,1544010201962),(45,144,47,1544011060102),(45,144,48,1544011150516),(45,143,49,1544011198954),(45,143,50,1544011268624),(45,145,52,1544011750742),(45,145,54,1544013241895),(45,144,56,1544015127786),(45,143,57,1544015170151),(45,143,60,1544170317336),(45,144,61,1544170413822),(45,143,62,1544170472216),(45,144,65,1544174726848),(45,144,68,1544175015154),(45,143,69,1544182277168),(46,148,40,1544003766732),(46,148,41,1544004019443),(46,149,43,1544008881680),(46,147,44,1544008898708),(46,148,45,1544010203901),(46,148,47,1544011060534),(46,148,48,1544011151268),(46,148,49,1544011199627),(46,147,50,1544011269125),(46,149,52,1544011751195),(46,148,54,1544013243160),(46,149,56,1544015128324),(46,147,57,1544015170883),(46,147,60,1544170318198),(46,148,61,1544170414305),(46,148,62,1544170472764),(46,148,65,1544174727456),(46,148,68,1544175015615),(46,149,69,1544182278376),(47,151,41,1544004021458),(47,152,43,1544008882509),(47,153,44,1544008899288),(47,151,45,1544010205649),(47,152,47,1544011061222),(47,152,48,1544011151972),(47,151,49,1544011200186),(47,151,50,1544011269639),(47,153,52,1544011751618),(47,151,54,1544013244378),(47,151,56,1544015132107),(47,151,57,1544015171709),(47,151,60,1544170318917),(47,152,61,1544170414868),(47,151,62,1544170473213),(47,152,65,1544174728050),(47,152,68,1544175016107),(47,151,69,1544182279330),(48,158,41,1544004024719),(48,157,43,1544008883418),(48,156,44,1544008899864),(48,158,45,1544010208317),(48,156,47,1544011061940),(48,156,48,1544011152689),(48,155,49,1544011201013),(48,155,50,1544011270284),(48,157,52,1544011752085),(48,158,54,1544013247075),(48,156,56,1544015132809),(48,155,57,1544015172416),(48,155,60,1544170319749),(48,156,61,1544170415414),(48,156,62,1544170473776),(48,156,65,1544174728803),(48,156,68,1544175016607),(48,156,69,1544182280161),(49,161,41,1544004041558),(49,160,43,1544008885059),(49,162,44,1544008900462),(49,159,45,1544010210818),(49,160,47,1544011062741),(49,159,48,1544011153501),(49,159,49,1544011201748),(49,159,50,1544011270938),(49,161,52,1544011752480),(49,161,54,1544013299300),(49,159,56,1544015133883),(49,159,57,1544015173100),(49,159,60,1544170320588),(49,160,61,1544170415961),(49,159,62,1544170474336),(49,160,65,1544174729779),(49,160,68,1544175017114),(49,159,69,1544182281123);
/*!40000 ALTER TABLE `response` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `quiz`.`response_BEFORE_INSERT` BEFORE INSERT ON `response` FOR EACH ROW
BEGIN
	IF ((SELECT question_id FROM quiz.answer WHERE id = NEW.answer_id) != NEW.question_id) THEN
		SIGNAL SQLSTATE '45000' SET message_text = "Provided answer not associated with provided question";
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `quiz`.`response_BEFORE_UPDATE` BEFORE UPDATE ON `response` FOR EACH ROW
BEGIN
	IF ((SELECT question_id FROM quiz.answer WHERE id = NEW.answer_id) != NEW.question_id) THEN
		SIGNAL SQLSTATE '45000' SET message_text = "Provided answer not associated with provided question";
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `score` (
  `registration_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`registration_id`),
  CONSTRAINT `score_registration_id` FOREIGN KEY (`registration_id`) REFERENCES `registration` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES (7,12),(8,2),(9,25),(10,50),(11,-2),(24,3),(25,-1),(26,-3),(27,-2),(28,-1),(29,-3),(30,-1),(31,3),(32,3),(33,-3),(34,3),(35,3),(36,3),(37,0),(38,0),(39,-4),(40,21),(41,30),(43,-2),(44,-6),(45,26),(46,-1),(47,2),(48,2),(49,2),(50,2),(52,10),(53,15),(54,30),(55,-1),(56,2),(57,2),(59,-1),(60,-2),(61,2),(62,2),(65,2),(66,3),(67,-1),(68,2),(69,2);
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-19  7:54:42
