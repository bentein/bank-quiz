CREATE DATABASE  IF NOT EXISTS `quiz` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `quiz`;
-- MySQL dump 10.13  Distrib 8.0.13, for macos10.14 (x86_64)
--
-- Host: 0.0.0.0    Database: quiz
-- ------------------------------------------------------
-- Server version	5.7.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `description` varchar(200) NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_idx` (`question_id`),
  CONSTRAINT `id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=571 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (163,51,'array.get(2);',0),(164,51,'array.get(1);',0),(165,51,'array[1]',1),(166,51,'array[2]',0),(167,52,'A basic data type that is not an object',1),(168,52,'Strings, integers and chars',0),(169,52,'An object with no methods',0),(170,52,'None of the above',0),(171,53,'void',1),(172,53,'null',0),(173,53,'undefined',0),(174,53,'Blank type',0),(175,54,'for (a in array) {}',1),(176,54,'for (int i = 0; i < 1; i++) {}',0),(177,54,'for (a:array) {}',0),(178,54,'while (bool) {}',0),(179,55,'array.put(elem);',0),(180,55,'array[0] = elem;',1),(181,55,'array.push(elem);',0),(182,55,'None of the above',0),(183,56,'String',0),(184,56,'int',1),(185,56,'ArrayList',0),(186,56,'Boolean',0),(187,57,'0',1),(188,57,'1',0),(189,57,'Depends on implementation',0),(190,57,'Arrays have no explicit start index',0),(191,58,'Compile code',0),(192,58,'Start a program',0),(193,58,'Run the main() method',0),(194,58,'Initialize an object',1),(195,59,'toValue()',0),(196,59,'toString()',1),(197,59,'toText()',0),(198,59,'asString()',0),(199,60,'console.log(\"a\");',0),(200,60,'print(\"a\");',0),(201,60,'cout << \"a\";',0),(202,60,'System.out.println(\"a\");',1),(203,61,'java.lang.Object',1),(204,61,'java.lang.Class',0),(205,61,'java',0),(206,61,'There is no universal base class',0),(207,62,'string.substring(\'D\',\'B\')',0),(208,62,'string.substring(1,4)',0),(209,62,'substring(string, 0, 3)',0),(210,62,'string.substring(0,3)',1),(211,63,'<javascript>',0),(212,63,'<script>',1),(213,63,'<scripting>',0),(214,63,'<js>',0),(215,64,'<li>',0),(216,64,'<ul>',1),(217,64,'<p>',0),(218,64,'<ol>',0),(219,65,'onchange',0),(220,65,'onmouseover',0),(221,65,'onmouseclick',0),(222,65,'onclick',1),(223,66,'<li>',0),(224,66,'<ul>',0),(225,66,'<p>',0),(226,66,'<ol>',1),(227,67,'<h1>',1),(228,67,'<h6>',0),(229,67,'<h7>',0),(230,67,'<heading>',0),(231,68,'<li>',1),(232,68,'<ul>',0),(233,68,'<p>',0),(234,68,'<ol>',0),(235,69,'Styling HTML elements',1),(236,69,'Coding algorithms',0),(237,69,'Catching javascript errors',0),(238,69,'Writing pretty javascript',0),(239,70,'#main {}',0),(240,70,'.main {}',1),(241,70,'class(main) {}',0),(242,70,'main {}',0),(243,71,'.header {}',0),(244,71,'id(header) {}',0),(245,71,'#header {}',1),(246,71,'id.header {}',0),(247,72,'finder',1),(248,72,'hover',0),(249,72,'active',0),(250,72,'link',0),(251,73,'Send query to REST API endpoint',0),(252,73,'Search DOM for elements matching CSS selector',1),(253,73,'Create database query',0),(254,73,'Create <select> element in DOM',0),(255,74,'true',0),(256,74,'1',0),(257,74,'null',1),(258,74,'\"string\"',0),(259,75,'12',0),(260,75,'39',0),(261,75,'57',1),(262,75,'NaN',0),(263,76,'.js',1),(264,76,'.script',0),(265,76,'.py',0),(266,76,'.ts',0),(267,77,'Java',0),(268,77,'Smalltalk',0),(269,77,'python',0),(270,77,'ECMAScript',1),(271,78,'last()',0),(272,78,'get()',0),(273,78,'pop()',1),(274,78,'None of the above',0),(275,79,'object',0),(276,79,'array',0),(277,79,'string',0),(278,79,'undefined',1),(279,80,'Just a Simple Object Notation',0),(280,80,'Java Simplistic Object Notation',0),(281,80,'JavaScript Object Notation',1),(282,80,'Java Source Opening Network',0),(283,81,'<!-- comment -->',0),(284,81,'//comment',1),(285,81,'#comment',0),(286,81,'comment',0),(287,82,'String Query Language',0),(288,82,'Structured Query Language',1),(289,82,'Structured Question Language',0),(290,82,'String Question Language',0),(291,83,'GET',0),(292,83,'EXTRACT',0),(293,83,'SELECT',1),(294,83,'OPEN',0),(295,84,'EXTRACT table.id',0),(296,84,'SELECT id FROM table',1),(297,84,'GET table.id',0),(298,84,'OPEN id FROM table',0),(299,85,'Compiling code',0),(300,85,'Writing web applications',0),(301,85,'Version control',1),(302,85,'Monitoring web servers',0),(303,86,'When the condition is checked',1),(304,86,'Nothing',0),(305,86,'Everything',0),(306,86,'None of the above',0),(307,87,'for',0),(308,87,'while',0),(309,87,'do-while',0),(310,87,'if-else',1),(311,88,'true',0),(312,88,'false',1),(313,88,'Runtime error',0),(314,88,'Will not compile',0),(315,89,'HTML',0),(316,89,'Java',1),(317,89,'CSS',0),(318,89,'Javascript',0),(319,90,'First in, first out',0),(320,90,'Last in, first out',1),(321,90,'Randomly',0),(322,90,'Based on the object\'s hash',0),(323,91,'First in, first out',1),(324,91,'Last in, first out',0),(325,91,'Randomly',0),(326,91,'Based on the object\'s hash',0),(327,92,'Testing inequality',1),(328,92,'Testing equality',0),(329,92,'Assignment',0),(330,92,'String concatenation',0),(331,93,'Testing inequality',0),(332,93,'Testing equality',0),(333,93,'Assignment',1),(334,93,'String concatenation',0),(335,94,'Comparison operators',0),(336,94,'Logical operators',1),(337,94,'Assigment operators',0),(338,94,'Arithmetic operators',0),(339,95,'\"a\" + \"b\"',1),(340,95,'\"a\", \"b\"',0),(341,95,'\"a\" * \"b\"',0),(342,95,'\"a\".concatenate(\"b\")',0),(343,96,'JQuery',1),(344,96,'Haskell',0),(345,96,'Python',0),(346,96,'Objective C',0),(347,97,'Object Oriented Programming',0),(348,97,'JavaScript',1),(349,97,'The cheese slicer',0),(350,97,'CSS',0),(351,99,'Internship and 100\'000,-',1),(352,99,'Internship',0),(353,99,'10\'000,-',0),(354,99,'Internship and 10\'000,-',0),(355,100,'Microsoft Azure',0),(356,100,'Amazon Web Services',1),(357,100,'Google Cloud',0),(358,100,'IBM Cloud Services',0),(359,101,'2019-02-21',1),(360,101,'2019-02-21',1),(361,101,'2019-02-21',1),(362,101,'2019-02-21',1),(363,102,'Oslo',1),(364,102,'Bergen',0),(365,102,'London',0),(366,102,'Stavanger',0),(367,103,'1-2 people',1),(368,103,'1 person',0),(369,103,'2-4 people',0),(370,103,'5-10 people',0),(371,104,'It\'s a List of characters',0),(372,104,'It\'s a primitive data type',0),(373,104,'It\'s a unique identifier for a heap resource',0),(374,104,'It is an array of chars',1),(375,105,'A method using too many resources',0),(376,105,'Overriding a method with a new implementation',0),(377,105,'When one class has several methods with the same name',1),(378,105,'Using a method\'s result as a parameter in another method',0),(379,106,'Other variables can not be assigned a final variable',0),(380,106,'Final variables can not be used as parameters',0),(381,106,'Final variables can not be reassigned',1),(382,106,'Final variables can not be modified in any way',0),(383,107,'Forcing a method to stop',0),(384,107,'Skipping a method during runtime',0),(385,107,'Chaining two or more methods',0),(386,107,'Providing a new implementaiton for an inherited method',1),(387,108,'1',1),(388,108,'2',0),(389,108,'Any number',0),(390,108,'None of the above',0),(391,109,'It is mutable',0),(392,109,'It is immutable',1),(393,109,'It inherits java.lang.Array',0),(394,109,'It is a primitive',0),(395,110,'Nothing',0),(396,110,'Their respective max and min values',0),(397,110,'Integer is signed, int isn\'t',0),(398,110,'Integer is an object, int isn\'t',1),(399,111,'Java Data Basin Connection',0),(400,111,'Java Database Connectivity',1),(401,111,'Java Downgradable Boot Container',0),(402,111,'None of the above',0),(403,112,'@Override',0),(404,112,'@Deprecated',0),(405,112,'@Entity',1),(406,112,'@SuppressWarnings',0),(407,113,'annotation',0),(408,113,'class',0),(409,113,'interface',0),(410,113,'@interface',1),(411,114,'abstract',0),(412,114,'default',0),(413,114,'volatile',0),(414,114,'character',1),(415,115,'Java Virtual Machine',1),(416,115,'Java View Model',0),(417,115,'Javascript Variable Manager',0),(418,115,'Javascript View Metrics',0),(419,116,'It is an object',0),(420,116,'It can be caught in a try-catch block',0),(421,116,'It is a subclass of java.lang.Throwable',0),(422,116,'It cannot be recovered from once it occurs',1),(423,117,'The current method',0),(424,117,'The current application context',0),(425,117,'The current object',1),(426,117,'The current class',0),(427,118,'Code optimization',0),(428,118,'Calculations with SI units',0),(429,118,'Catching errors in Java',0),(430,118,'Unit testing in Java',1),(431,119,'A Java object bound by no special restrictions',1),(432,119,'An object that can jump between threads',0),(433,119,'A Pure Objective Java Object',0),(434,119,'A specific type of Java Bean',0),(435,120,'list.shuffle();',0),(436,120,'List.shuffle(list);',0),(437,120,'Collections.shuffle(list);',1),(438,120,'Collections.randomize(list);',0),(439,121,'space-around',0),(440,121,'flex-end',0),(441,121,'flex-middle',1),(442,121,'space-between',0),(443,122,'~',0),(444,122,'<',1),(445,122,'>',0),(446,122,'*',0),(447,123,'rgb()',0),(448,123,'hue()',1),(449,123,'hsl()',0),(450,123,'rgba()',0),(451,124,'Sets the vertical header\'s baseline to 50',0),(452,124,'Sets the element\'s height to half of the viewport height',1),(453,124,'Sets the height of all parent elements to 50',0),(454,124,'Sets the element\'s width to half of the viewport height',0),(455,125,'When the await function has returned \'false\'',0),(456,125,'Immediatly',0),(457,125,'When the corresponding resolve method is finished',1),(458,125,'When the await function has returned \'true\'',0),(459,126,'Java',0),(460,126,'Javascript',1),(461,126,'Python',0),(462,126,'None of the above',0),(463,127,'Compare value',0),(464,127,'Compare type',0),(465,127,'Compare value and type',1),(466,127,'Assign a new value to a variable',0),(467,128,'It\'s a Javascript run-time environment',1),(468,128,'It\'s server software',0),(469,128,'It\'s Chrome\'s javascript implementation',0),(470,128,'It\'s a package manager',0),(471,129,'XMLHttpRequest',0),(472,129,'Fetch',1),(473,129,'AJAX',0),(474,129,'QuickGet',0),(475,130,'setInterval(function() {}, 2)',0),(476,130,'timeOutRepeat(function() {}, 2)',0),(477,130,'setInterval(function() {}, 2000)',1),(478,130,'setTimeout(function() {},2000)',0),(479,131,'()=>{}',1),(480,131,'()->{}',0),(481,131,'function() -> {}',0),(482,131,'function() => {}',0),(483,132,'var i = 1/0;',0),(484,132,'for(i in [1,2,3,4,5]) { console.log(\"Hello World\") } ',0),(485,132,'if(2 = 2) { console.log(\"Hello World\" }',1),(486,132,'var i = 1 < 2 ? 1 : 0',0),(487,133,'filter()',1),(488,133,'reduce()',0),(489,133,'map()',0),(490,133,'sort()',0),(491,134,'undefined',1),(492,134,'string',0),(493,134,'number',1),(494,134,'varchar',0),(495,135,'CHANGE column',0),(496,135,'ALTER column',1),(497,135,'ADD column',0),(498,135,'EDIT column',0),(499,136,'It references another resource',0),(500,136,'It can be null',0),(501,136,'It is a unique identifier',1),(502,136,'It is generated by the database',0),(503,137,'DROP table',0),(504,137,'TRUNCATE table',1),(505,137,'DROP INSIDE table',0),(506,137,'REMOVE IN table',0),(507,138,'ADD INTO',0),(508,138,'PLACE INTO',0),(509,138,'PUT INTO',0),(510,138,'INSERT INTO',1),(511,139,'UNIQUE',0),(512,139,'DISTINCT',1),(513,139,'EXCLUSIVE',0),(514,139,'SINGLE',0),(515,140,'Accessing data from a database, etc.',1),(516,140,'Decentralizing autonomous objects',0),(517,140,'Ensuring data saturation in embedded systems',0),(518,140,'Directing objects to appropriate classes',0),(519,141,'The order of operations of a function',0),(520,141,'The computational complexity of a function',1),(521,141,'Number of IO operations for a function',0),(522,141,'Network load for a given network function',0),(523,142,'GET',0),(524,142,'POST',0),(525,142,'LIST',1),(526,142,'OPTIONS',0),(527,143,'(a != b)',1),(528,143,'(a || b) && (a && b)',0),(529,143,'(a * b)',0),(530,143,'(a <> b)',0),(531,144,'2,147,483,647',0),(532,144,'4,294,967,295',1),(533,144,'0',0),(534,144,'There\'s no upper bound',0),(535,145,'super',0),(536,145,'sudo',1),(537,145,'adm',0),(538,145,'root',0),(539,146,'Free or Open Source Software',1),(540,146,'Forward Operating System Specification',0),(541,146,'Foreign Operation Super System',0),(542,146,'File Origin System Source',0),(543,147,'Binary tree sort',0),(544,147,'Merge sort',0),(545,147,'Bubble sort',1),(546,147,'Quicksort',0),(547,148,'Undefined',0),(548,148,'1',0),(549,148,'0',0),(550,148,'-1',1),(551,149,'1',0),(552,149,'0',1),(553,149,'Undefined',0),(554,149,'-1',0),(555,150,'11',0),(556,150,'5',0),(557,150,'63',1),(558,150,'64',0),(559,151,'7',0),(560,151,'8',0),(561,151,'15',1),(562,151,'16',0),(563,152,'Bubblesort',0),(564,152,'Insertionsort',0),(565,152,'Shell Sort',0),(566,152,'Quicksort',1),(567,153,'Bubblesort',1),(568,153,'Quicksort',0),(569,153,'Mergesort',0),(570,153,'Radixsort',0);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_info`
--

DROP TABLE IF EXISTS `contact_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `identity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quiz_id` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_quiz_id_idx` (`quiz_id`),
  CONSTRAINT `question_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (51,'hvlquizeasy','MULTIPLE_CHOICE','Which of the following gets the 2nd element from a Java array?'),(52,'hvlquizeasy','MULTIPLE_CHOICE','What is a primitive type in Java?'),(53,'hvlquizeasy','MULTIPLE_CHOICE','Which keyword signifies a Java method with no return value?'),(54,'hvlquizeasy','MULTIPLE_CHOICE','Which is NOT a valid Java loop?'),(55,'hvlquizeasy','MULTIPLE_CHOICE','Which of the following puts an element in a Java array?'),(56,'hvlquizeasy','MULTIPLE_CHOICE','Which of the following is not an object in Java?'),(57,'hvlquizeasy','MULTIPLE_CHOICE','At what index does an array start in Java?'),(58,'hvlquizeasy','MULTIPLE_CHOICE','What does a constructor do in Java?'),(59,'hvlquizeasy','MULTIPLE_CHOICE','Which method returns a string representation of a Java object?'),(60,'hvlquizeasy','MULTIPLE_CHOICE','Which of the following prints to the Java console?'),(61,'hvlquizeasy','MULTIPLE_CHOICE','What is the base class of all classes in Java?'),(62,'hvlquizeasy','MULTIPLE_CHOICE','Which of the following returns the first 3 letters of the string \"DNB is best\"?'),(63,'hvlquizeasy','MULTIPLE_CHOICE','Which HTML element should contain javascript code?'),(64,'hvlquizeasy','MULTIPLE_CHOICE','Which HTML tag is used to create an unordered list?'),(65,'hvlquizeasy','MULTIPLE_CHOICE','Which event occurs when an HTML element is clicked?'),(66,'hvlquizeasy','MULTIPLE_CHOICE','Which HTML tag is used to create an ordered list?'),(67,'hvlquizeasy','MULTIPLE_CHOICE','Which of the following is the largest HTML heading?'),(68,'hvlquizeasy','MULTIPLE_CHOICE','Which HTML tag is used to create a list item?'),(69,'hvlquizeasy','MULTIPLE_CHOICE','What is CSS used for?'),(70,'hvlquizeasy','MULTIPLE_CHOICE','Which of the following CSS selectors selects the \"main\" class?'),(71,'hvlquizeasy','MULTIPLE_CHOICE','Which of the following CSS selectors selects the \"header\" id?'),(72,'hvlquizeasy','MULTIPLE_CHOICE','Which of these is not a CSS pseudo class?'),(73,'hvlquizeasy','MULTIPLE_CHOICE','What is the purpose of the querySelector() method in javascript?'),(74,'hvlquizeasy','MULTIPLE_CHOICE','Which of the following is considered false by javascript?'),(75,'hvlquizeasy','MULTIPLE_CHOICE','What is the result of 3+2+\"7\" in javascript?'),(76,'hvlquizeasy','MULTIPLE_CHOICE','What is the file extension for javascript files?'),(77,'hvlquizeasy','MULTIPLE_CHOICE','Which of the following is javascript based on?'),(78,'hvlquizeasy','MULTIPLE_CHOICE','Which method removes and returns the last element of a js array?'),(79,'hvlquizeasy','MULTIPLE_CHOICE','Which of the following is NOT a valid JSON data type?'),(80,'hvlquizeasy','MULTIPLE_CHOICE','What does JSON stand for?'),(81,'hvlquizeasy','MULTIPLE_CHOICE','Which of the following is a javascript comment?'),(82,'hvlquizeasy','MULTIPLE_CHOICE','What does SQL stand for?'),(83,'hvlquizeasy','MULTIPLE_CHOICE','Which SQL statement extracts data from a database?'),(84,'hvlquizeasy','MULTIPLE_CHOICE','Which of the following extracts the id column from a table?'),(85,'hvlquizeasy','MULTIPLE_CHOICE','Which of the following best describes what git and SVN used for?'),(86,'hvlquizeasy','MULTIPLE_CHOICE','What distinguishes while and do-while loops?'),(87,'hvlquizeasy','MULTIPLE_CHOICE','Which of the following is not a looping structure?'),(88,'hvlquizeasy','MULTIPLE_CHOICE','What is the value of !true?'),(89,'hvlquizeasy','MULTIPLE_CHOICE','Which of the following is not a core technology of the web?'),(90,'hvlquizeasy','MULTIPLE_CHOICE','In what order are objects removed from a stack?'),(91,'hvlquizeasy','MULTIPLE_CHOICE','In what order are objects removed from a queue?'),(92,'hvlquizeasy','MULTIPLE_CHOICE','What is the != operator used for?'),(93,'hvlquizeasy','MULTIPLE_CHOICE','What is the = operator used for?'),(94,'hvlquizeasy','MULTIPLE_CHOICE','Which group of operators are &&, || and ! Part of?'),(95,'hvlquizeasy','MULTIPLE_CHOICE','Which of the following concatenates two javascript strings?'),(96,'hvlquizeasy','MULTIPLE_CHOICE','Which of the following is NOT a programming language?'),(97,'hvlquizeasy','MULTIPLE_CHOICE','Which of these technologies was not invented by a Norwegian?'),(98,'hvlquizchocolate','FREE_TEXT','How many chocolates?'),(99,'hvlquizeasy','MULTIPLE_CHOICE','What can you win at Digital Challenge hosted by DNB?'),(100,'hvlquizeasy','MULTIPLE_CHOICE','Which cloud service does DNB use?'),(101,'hvlquizeasy','MULTIPLE_CHOICE','When is the registration deadline for Digital Challenge?'),(102,'hvlquizeasy','MULTIPLE_CHOICE','In which city will the final of Digital Challenge happen?'),(103,'hvlquizeasy','MULTIPLE_CHOICE','What is the allowed team size for Digital Challenge?'),(104,'hvlquizhard','MULTIPLE_CHOICE','Which of the following describes a String in Java?'),(105,'hvlquizhard','MULTIPLE_CHOICE','What is method overloading?'),(106,'hvlquizhard','MULTIPLE_CHOICE','What is the purpose of the final keyword on a variable in Java?'),(107,'hvlquizhard','MULTIPLE_CHOICE','What is method overriding?'),(108,'hvlquizhard','MULTIPLE_CHOICE','How many public classes can a Java file contain at most?'),(109,'hvlquizhard','MULTIPLE_CHOICE','Which of the following is true for a Java String?'),(110,'hvlquizhard','MULTIPLE_CHOICE','What is the difference between an int and an Integer in Java?'),(111,'hvlquizhard','MULTIPLE_CHOICE','What does JDBC stand for?'),(112,'hvlquizhard','MULTIPLE_CHOICE','Which of the following is NOT a built-in Java annotation?'),(113,'hvlquizhard','MULTIPLE_CHOICE','Which keyword is used to define a Java annotation?'),(114,'hvlquizhard','MULTIPLE_CHOICE','Which of the following is not a Java keyword?'),(115,'hvlquizhard','MULTIPLE_CHOICE','What does JVM stand for?'),(116,'hvlquizhard','MULTIPLE_CHOICE','Which of the following is true for errors but not exceptions in Java?'),(117,'hvlquizhard','MULTIPLE_CHOICE','What does the \"this\" keyword refer to in Java?'),(118,'hvlquizhard','MULTIPLE_CHOICE','What is JUnit used for?'),(119,'hvlquizhard','MULTIPLE_CHOICE','What is a POJO?'),(120,'hvlquizhard','MULTIPLE_CHOICE','Which of the following shuffles a Java List?'),(121,'hvlquizhard','MULTIPLE_CHOICE','Which of the following is NOT a valid CSS justify-content value?'),(122,'hvlquizhard','MULTIPLE_CHOICE','Which of these operators does not exist in CSS?'),(123,'hvlquizhard','MULTIPLE_CHOICE','Which of these color functions does not exist in CSS?'),(124,'hvlquizhard','MULTIPLE_CHOICE','In CSS, what does \'height: 50vh\' do?'),(125,'hvlquizhard','MULTIPLE_CHOICE','When will function in javascript continue after an \'await\' statement?'),(126,'hvlquizhard','MULTIPLE_CHOICE','In which of the following languages is division by zero legal?'),(127,'hvlquizhard','MULTIPLE_CHOICE','What does the === operator do in javascript?'),(128,'hvlquizhard','MULTIPLE_CHOICE','Which of the following best describes node.js?'),(129,'hvlquizhard','MULTIPLE_CHOICE','Which of the following is the newest HTTP request API in javascript?'),(130,'hvlquizhard','MULTIPLE_CHOICE','Which of the following methods can be used to run a function every other second?'),(131,'hvlquizhard','MULTIPLE_CHOICE','Which of the following is a valid arrow function in javascript?'),(132,'hvlquizhard','MULTIPLE_CHOICE','Which of these will cause an exception in JavaScript?'),(133,'hvlquizhard','MULTIPLE_CHOICE','Which of these is not a stream() function in JavaScript?'),(134,'hvlquizhard','MULTIPLE_CHOICE','What is the instance-type of NaN in javascript?'),(135,'hvlquizhard','MULTIPLE_CHOICE','Which SQL command can change the settings for a column?'),(136,'hvlquizhard','MULTIPLE_CHOICE','Which of the following is true for ALL primary keys?'),(137,'hvlquizhard','MULTIPLE_CHOICE','Which of the following SQL statements deletes all data in a table?'),(138,'hvlquizhard','MULTIPLE_CHOICE','Which SQL statement adds a new row to a database?'),(139,'hvlquizhard','MULTIPLE_CHOICE','What SQL keyword is used to extracts only unique rows?'),(140,'hvlquizhard','MULTIPLE_CHOICE','What is a DAO used for?'),(141,'hvlquizhard','MULTIPLE_CHOICE','What does Big O notation describe?'),(142,'hvlquizhard','MULTIPLE_CHOICE','Which of the following is not an HTTP method?'),(143,'hvlquizhard','MULTIPLE_CHOICE','Which of the following is an XOR statement?'),(144,'hvlquizhard','MULTIPLE_CHOICE','What\'s the upper bound of an unsigned 32 bit integer?'),(145,'hvlquizhard','MULTIPLE_CHOICE','Which Unix program allows you to run programs as the superuser?'),(146,'hvlquizhard','MULTIPLE_CHOICE','What does FOSS stand for?'),(147,'hvlquizhard','MULTIPLE_CHOICE','Which of the following sorting algorithms is slowest on average?'),(148,'hvlquizhard','MULTIPLE_CHOICE','What is the height of an empty tree?'),(149,'hvlquizhard','MULTIPLE_CHOICE','What is the depth of the root node of a tree?'),(150,'hvlquizhard','MULTIPLE_CHOICE','How many nodes are in a perfect binary tree of height 5?'),(151,'hvlquizhard','MULTIPLE_CHOICE','What is the highest decimal value representable by 4 unsigned bits?'),(152,'hvlquizhard','MULTIPLE_CHOICE','Which of the following sorting methods has the best Big-O time complexity?'),(153,'hvlquizhard','MULTIPLE_CHOICE','Which of the following sorting methods has the best Big-O space complexity?');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `quiz` (
  `id` varchar(20) NOT NULL,
  `owner` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `attempts` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
INSERT INTO `quiz` VALUES ('hvlquizchocolate',NULL,NULL,1),('hvlquizeasy',NULL,NULL,0),('hvlquizhard',NULL,NULL,0);
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identity_id` int(11) NOT NULL,
  `quiz_id` varchar(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `registration_identity_id_idx` (`identity_id`),
  KEY `registration_quiz_id_idx` (`quiz_id`),
  CONSTRAINT `registration_identity_id` FOREIGN KEY (`identity_id`) REFERENCES `identity` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `registration_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `response` (
  `question_id` int(11) NOT NULL,
  `registration_id` int(11) NOT NULL,
  `answer_id` int(11) DEFAULT NULL,
  `free_text` varchar(200) DEFAULT NULL,
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
	IF (NEW.answer_id != null) THEN
		IF ((SELECT question_id FROM quiz.answer WHERE id = NEW.answer_id) != NEW.question_id) THEN
			SIGNAL SQLSTATE '45000' SET message_text = "Provided answer not associated with provided question";
		END IF;
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
	IF (NEW.answer_id != null) THEN
		IF ((SELECT question_id FROM quiz.answer WHERE id = NEW.answer_id) != NEW.question_id) THEN
			SIGNAL SQLSTATE '45000' SET message_text = "Provided answer not associated with provided question";
		END IF;
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
 SET character_set_client = utf8mb4 ;
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

-- Dump completed on 2019-02-19 14:17:11
