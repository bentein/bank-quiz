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
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (1,1,'answer1',0),(2,1,'answer2',0),(3,1,'answer3',1),(4,1,'answer4',0),(69,24,'answer1',0),(70,24,'answer2',0),(71,24,'answer3',1),(72,24,'answer4',0),(125,40,'Send query to REST API endpoint',0),(126,40,'Search DOM using CSS selector',1),(127,40,'Create database query',0),(128,40,'Create <select> element in DOM',0),(129,41,'<li>',0),(130,41,'<ul>',1),(131,41,'<p>',0),(132,41,'<ol>',0),(133,42,'First in, first out',1),(134,42,'Last in, first out',0),(135,42,'Randomly',0),(136,42,'Based on the object\'s hash',0),(137,43,'Compile code',0),(138,43,'Start a program',0),(139,43,'Run the main() method',0),(140,43,'Initialize an object',1),(141,44,'true',0),(142,44,'false',1),(143,45,'12',0),(144,45,'39',0),(145,45,'57',1),(146,45,'NaN',0),(147,46,'HTML',0),(148,46,'Java',1),(149,46,'CSS',0),(150,46,'Javascript',0),(151,47,'.js',1),(152,47,'.script',0),(153,47,'.py',0),(154,47,'none',0),(155,48,'Java',0),(156,48,'C++',0),(157,48,'python',0),(158,48,'ECMAScript',1),(159,49,'Compiling code',0),(160,49,'Writing web applications',0),(161,49,'Version control',1),(162,49,'Monitoring web servers',0),(163,50,'<li>',0),(164,50,'<ul>',0),(165,50,'<p>',0),(166,50,'<ol>',1),(167,51,'<li>',1),(168,51,'<ul>',0),(169,51,'<p>',0),(170,51,'<ol>',0),(171,52,'First in, first out',0),(172,52,'Last in, first out',1),(173,52,'Randomly',0),(174,52,'Based on the object\'s hash',0),(175,53,'0',1),(176,53,'1',0),(177,53,'Depends on implementation',0),(178,53,'Arrays have no explicit start index',0),(179,54,'true',0),(180,54,'1',0),(181,54,'null',1),(182,54,'\"string\"',0),(183,55,'When the condition is checked',1),(184,55,'Nothing',0),(185,56,'2,147,483,647',0),(186,56,'4,294,967,295',1),(187,56,'65,535',0),(188,56,'There\'s no upper bound',0),(189,57,'2,147,483,647',1),(190,57,'4,294,967,295',0),(191,57,'65,535',0),(192,57,'There\'s no upper bound',0),(193,58,'String',0),(194,58,'int',1),(195,58,'ArrayList',0),(196,58,'Boolean',0),(197,59,'java.lang.Object',1),(198,59,'java.lang.Class',0),(199,59,'java',0),(200,59,'There is no universal base class',0),(201,60,'array.get(2)',0),(202,60,'array.get(1)',0),(203,60,'array[1]',1),(204,60,'array[2]',0),(205,61,'Styling HTML elements',1),(206,61,'Coding algorithms',0),(207,61,'Catching javascript errors',0),(208,61,'Writing pretty javascript',0),(209,62,'for',0),(210,62,'while',0),(211,62,'do-while',0),(212,62,'if-else',1),(213,63,'A basic data type in Java that is not an object',1),(214,63,'Strings, integers and chars',0),(215,63,'An object with no methods',0),(216,63,'Integer, float and double',0),(217,64,'<javascript>',0),(218,64,'<script>',1),(219,64,'<scripting>',0),(220,64,'<js>',0),(221,65,'Testing inequality',1),(222,65,'Testing equality',0),(223,65,'Assignment',0),(224,65,'String concatenation',0),(225,66,'Testing inequality',0),(226,66,'Testing equality',0),(227,66,'Assignment',1),(228,66,'String concatenation',0),(229,67,'Comparison operators',0),(230,67,'Logical operators',1),(231,67,'Assigment operators',0),(232,67,'Arithmetic operators',0),(233,68,'<!-- comment -->',0),(234,68,'//comment',1),(235,68,'#comment',0),(236,68,'comment',0),(237,69,'onchange',0),(238,69,'onmouseover',0),(239,69,'onmouseclick',0),(240,69,'onclick',1),(241,70,'\"a\" + \"b\"',1),(242,70,'\"a\", \"b\"',0),(243,70,'\"a\" * \"b\"',0),(244,70,'\"a\".concatenate(\"b\")',0),(245,71,'<h1>',1),(246,71,'<h6>',0),(247,71,'<h7>',0),(248,71,'<heading>',0),(249,72,'Just a Simple Object Notation',0),(250,72,'Java Simplistic Object Notation',0),(251,72,'JavaScript Object Notation',1),(252,72,'Java Source Opening Network',0),(253,73,'object',0),(254,73,'array',0),(255,73,'string',0),(256,73,'undefined',1),(257,74,'last()',0),(258,74,'get()',0),(259,74,'pop()',1),(260,74,'None of the above',0),(261,75,'toValue()',0),(262,75,'toString()',1),(263,75,'toText()',0),(264,75,'asString()',0),(265,76,'void',1),(266,76,'null',0),(267,76,'undefined',0),(268,76,'Blank type',0),(269,77,'for (a in aray) {}',1),(270,77,'for (int i = 0; i > -1; i++) {}',0),(271,77,'for (a:array) {}',0),(272,77,'while (true) {}',0),(273,78,'console.log(\"a\")',0),(274,78,'print(\"a\")',0),(275,78,'cout << \"a\"',0),(276,78,'System.out.println(\"a\")',1),(277,79,'array.put(elem)',0),(278,79,'array[0] = elem',1),(279,79,'array.push(elem)',0),(280,79,'None of the above',0);
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
  CONSTRAINT `contact_identity_id` FOREIGN KEY (`identity_id`) REFERENCES `identity` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_info`
--

LOCK TABLES `contact_info` WRITE;
/*!40000 ALTER TABLE `contact_info` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identity`
--

LOCK TABLES `identity` WRITE;
/*!40000 ALTER TABLE `identity` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'test question','MEDIUM'),(24,'test','HARD'),(40,'What is the purpose of the querySelector() method in javascript?','EASY'),(41,'Which HTML tag is used to wrap an unsorted list?','EASY'),(42,'In what order are objects removed from a queue?','EASY'),(43,'What does a constructor do?','EASY'),(44,'What is the value of !true?','EASY'),(45,'What is the result of 3+2+\"7\" in javascript?','EASY'),(46,'Which of the following is not a core technology of the web?','EASY'),(47,'What is the file extension for javascript files?','EASY'),(48,'Which of the following is javascript based on?','EASY'),(49,'Which of the following best describes the function of git?','EASY'),(50,'Which HTML tag is used to wrap a sorted list?','EASY'),(51,'Which HTML tag is used to create a list item?','EASY'),(52,'In what order are objects removed from a stack?','EASY'),(53,'At what index does an array start in Java?','EASY'),(54,'Which of the following is considered false by javascript?','EASY'),(55,'What distinguishes while and a do-while loops from each other?','EASY'),(56,'What\'s the upper bound of an unsigned int?','EASY'),(57,'What\'s the upper bound of a signed int?','EASY'),(58,'Which of the following does not inherit java.lang.Object?','EASY'),(59,'What is the base class of all classes in Java?','EASY'),(60,'Which of the following gets the 2nd element from a Java array?','EASY'),(61,'What is CSS used for?','EASY'),(62,'Which of the following is not a looping structure in Java?','EASY'),(63,'What is a primitive type?','EASY'),(64,'Which HTML element should contain javascript code?','EASY'),(65,'What is the != operator used for?','EASY'),(66,'What is the = operator used for?','EASY'),(67,'What group of operators are &&, || and ! part of?','EASY'),(68,'Which of the following is a javascript comment?','EASY'),(69,'Which event occurs when an HTML element is clicked?','EASY'),(70,'Which of the following concatenates two javascript strings?','EASY'),(71,'Which of the following is the largest HTML heading?','EASY'),(72,'What does JSON stand for?','EASY'),(73,'Which of the following is an invalid JSON data type?','EASY'),(74,'Which method removes and returns the last element of a js array?','EASY'),(75,'Which method returns a string representation of a Java object?','EASY'),(76,'Which keyword signifies a java method with no return value?','EASY'),(77,'Which is not a valid Java loop?','EASY'),(78,'Which of the following prints to the Java console?','EASY'),(79,'Which of the following puts an element in a Java array?','EASY');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'quiz'
--

--
-- Dumping routines for database 'quiz'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-14 14:10:42
