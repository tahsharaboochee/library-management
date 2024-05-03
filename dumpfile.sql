-- MySQL dump 10.13  Distrib 8.3.0, for macos14.2 (x86_64)
--
-- Host: localhost    Database: library_db
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Admin'),(2,'Patron');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,29);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add book',7,'add_book'),(26,'Can change book',7,'change_book'),(27,'Can delete book',7,'delete_book'),(28,'Can view book',7,'view_book'),(29,'Can Edit Books',4,'can_edit_books'),(30,'Can add book',8,'add_book'),(31,'Can change book',8,'change_book'),(32,'Can delete book',8,'delete_book'),(33,'Can view book',8,'view_book'),(34,'Can add circulation',9,'add_circulation'),(35,'Can change circulation',9,'change_circulation'),(36,'Can delete circulation',9,'delete_circulation'),(37,'Can view circulation',9,'view_circulation'),(38,'Can add transaction',10,'add_transaction'),(39,'Can change transaction',10,'change_transaction'),(40,'Can delete transaction',10,'delete_transaction'),(41,'Can view transaction',10,'view_transaction'),(42,'Can add profile',11,'add_profile'),(43,'Can change profile',11,'change_profile'),(44,'Can delete profile',11,'delete_profile'),(45,'Can view profile',11,'view_profile'),(46,'Can add user book',12,'add_userbook'),(47,'Can change user book',12,'change_userbook'),(48,'Can delete user book',12,'delete_userbook'),(49,'Can view user book',12,'view_userbook');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$VeGOB91LeA2L$O3zyG5klmqn+7/ijIg5Wco0Vkvz0MRSWmXg1w6G11TM=','2024-05-03 19:49:00.619579',1,'boocheet','','','boocheet@gmail.com',1,1,'2024-04-29 22:46:55.000000'),(2,'pbkdf2_sha256$180000$1JlXFv6vkwiV$95q2YKZe/cexJMhkERGmr2Crfq06ggulADoz3hBR0Lg=','2024-05-03 14:29:36.925669',0,'Donald','Donald','Duck','',0,1,'2024-04-29 22:51:14.000000'),(3,'pbkdf2_sha256$720000$hrAHaA7Q3afkxvVUZTVRlL$SQJh704AxcLf/fIKKlSPDte9FZfyobWEVsCvzEyLFpQ=','2024-04-29 23:23:14.440464',0,'Mickey','Mickey','Mouse','',0,1,'2024-04-29 22:52:00.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,2,2),(2,3,2);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (23,1,1),(24,1,2),(25,1,3),(26,1,4),(27,1,5),(28,1,6),(29,1,7),(30,1,8),(31,1,9),(32,1,10),(33,1,11),(34,1,12),(35,1,13),(36,1,14),(37,1,15),(38,1,16),(39,1,17),(40,1,18),(41,1,19),(42,1,20),(43,1,21),(44,1,22),(45,1,23),(46,1,24),(47,1,25),(48,1,26),(49,1,27),(50,1,28),(51,1,29),(52,1,30),(53,1,31),(54,1,32),(55,1,33),(56,1,34),(57,1,35),(58,1,36),(59,1,37),(12,2,17),(13,2,18),(14,2,19),(15,2,20),(16,2,21),(17,2,24),(18,2,25),(19,2,26),(20,2,27),(21,2,28),(22,2,29),(1,3,17),(2,3,18),(3,3,19),(4,3,20),(5,3,21),(6,3,23),(7,3,24),(8,3,25),(9,3,26),(10,3,27),(11,3,28);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_book`
--

DROP TABLE IF EXISTS `books_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_book` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `author` varchar(100) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `available` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_book`
--

LOCK TABLES `books_book` WRITE;
/*!40000 ALTER TABLE `books_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `books_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_book`
--

DROP TABLE IF EXISTS `catalog_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_book` (
  `id` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `author` varchar(200) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `publication_year` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `isbn` (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_book`
--

LOCK TABLES `catalog_book` WRITE;
/*!40000 ALTER TABLE `catalog_book` DISABLE KEYS */;
INSERT INTO `catalog_book` VALUES ('','Away! Away!','Jana Beňová','9781937512743',2018);
/*!40000 ALTER TABLE `catalog_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_circulation`
--

DROP TABLE IF EXISTS `catalog_circulation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_circulation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `book_id` varchar(100) NOT NULL,
  `checkout_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `reserved` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_circulation_user_id_9d07a8cd_fk_auth_user_id` (`user_id`),
  CONSTRAINT `catalog_circulation_user_id_9d07a8cd_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_circulation`
--

LOCK TABLES `catalog_circulation` WRITE;
/*!40000 ALTER TABLE `catalog_circulation` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_circulation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_profile`
--

DROP TABLE IF EXISTS `catalog_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `catalog_profile_user_id_7c4daf2b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_profile`
--

LOCK TABLES `catalog_profile` WRITE;
/*!40000 ALTER TABLE `catalog_profile` DISABLE KEYS */;
INSERT INTO `catalog_profile` VALUES (1,'1789 Camden Drive','425-278-1989',1),(2,'1324 Donald Lane','5789234556',2),(3,'','',3);
/*!40000 ALTER TABLE `catalog_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_transaction`
--

DROP TABLE IF EXISTS `catalog_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transaction_type` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `book_id` varchar(100) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_transaction_user_id_a66125e0_fk_auth_user_id` (`user_id`),
  KEY `catalog_transaction_book_id_6d255434_fk` (`book_id`),
  CONSTRAINT `catalog_transaction_book_id_6d255434_fk` FOREIGN KEY (`book_id`) REFERENCES `catalog_book` (`id`),
  CONSTRAINT `catalog_transaction_user_id_a66125e0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_transaction`
--

LOCK TABLES `catalog_transaction` WRITE;
/*!40000 ALTER TABLE `catalog_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_userbook`
--

DROP TABLE IF EXISTS `catalog_userbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_userbook` (
  `book_id` varchar(100) NOT NULL,
  `book_title` varchar(200) NOT NULL,
  `authors` varchar(500) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `description` longtext NOT NULL,
  `publication_year` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `catalog_userbook_book_id_e37f65d8_uniq` (`book_id`),
  KEY `catalog_userbook_user_id_6a381634_fk_auth_user_id` (`user_id`),
  CONSTRAINT `catalog_userbook_user_id_6a381634_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_userbook`
--

LOCK TABLES `catalog_userbook` WRITE;
/*!40000 ALTER TABLE `catalog_userbook` DISABLE KEYS */;
INSERT INTO `catalog_userbook` VALUES ('3GMwQQAACAAJ','Charlotte\'s Web Book and Charm','E. B. White, Kate DiCamillo','9780060527792','Some Pig<p>These are the words in Charlotte\'s web, high in the barn. Her spiderweb tells of her feelings for a little pig named Wilbur, as well as the feelings of a little girl named Fern ... who loves Wilbur, too. Their love has been shared by millions of readers.</p>',2003,2),('f8ANAAAAQAAJ','A Christmas Carol','Charles Dickens','N/A','Everyone is familiar with this classic Christmas story. Ebenezer Scrooge is a miserly, unpleasant man who despises Christmas and overworks his clerk Bob Cratchit. As he prepares for another Christmas Eve without celebration, Scrooge is greeted by his dead business partner, Jacob Marley who warns him that his greed will not go unpunished. At first, Scrooge doesn\'t heed Marley\'s warning, but soon he is visited by the Ghosts of Christmas Past, Present, and Christmas Yet to Come. He is made to face his cruel nature, and to consider whether he should change his ways.<br><br><i>This is a free digital copy of a book that has been carefully scanned by Google as part of a project to make the world\'s books discoverable online. To make this print edition available as an ebook, we have extracted the text using Optical Character Recognition (OCR) technology and submitted it to a review process to ensure its accuracy and legibility across different screen sizes and devices. Google is proud to partner with libraries to make this book available to readers everywhere.</i>',1858,2),('iRwMQVdZegAC','Gilgamesh Epic and Old Testament Parallels','Alexander Heidel','9780226323985','Cuneiform records made some three thousand years ago are the basis for this essay on the ideas of death and the afterlife and the story of the flood which were current among the ancient peoples of the Tigro-Euphrates Valley. With the same careful scholarship shown in his previous volume, <i>The Babylonian Genesis</i>, Heidel interprets the famous Gilgamesh Epic and other related Babylonian and Assyrian documents. He compares them with corresponding portions of the Old Testament in order to determine the inherent historical relationship of Hebrew and Mesopotamian ideas.<br>',1949,1),('kQtnQgAACAAJ','Notting Hill','Richard Curtis','9781405802031','William is single and lives in London\'s Notting Hill with his lodger, Spike. He owns a travel bookshop. One day Anna Scott, the biggest movie star in the world, walks into his shop, buys a book and changes William\'s life forever...This charming and hilarious film starring Hugh Grant and Julia Roberts is by Richard Curtis, the writer of Four Weddings and a Funeral and Love Actually.',2005,1),('LdVZAAAAMAAJ','Donald Duck Joins Up','Richard Shale','9780835713108','Examines the cartoons and movies created by the Walt Disney Studio during World War II.',1982,2),('WcVYvgAACAAJ','Walt Disney Uncle $crooge and Donald Duck','Don Rosa','9781683960065','Every Jewel For Himself! Alexander the Great wasn\'t great enough to find the famous lost city of Shambala - but Scrooge McDuck is here to pick up the slack! An awesome Indian treasure lies ahead...but behind lurks a crooked rajah, out to stop Scrooge at any cost! It\'s Fantagraphics\' seventh complete book of Duck adventures by Don Rosa! Rosa, famed for his \"Life and Times of Scrooge McDuck,\" created over two decades\' worth of ripping Duckburg yarns! In \"A Matter of Some Gravity,\" Magica De Spell turns Scrooge\'s and Donald\'s gravitational field sideways! Then Scrooge and Flintheart Glomgold compete to become \"The Last Lord of Eldorado!\" Remastered with brilliant color and a treasure trove of Rosa\'s cover art and behind-the-scenes factoids, these Scrooge and Donald epics are back in a definitive, comprehensive hardback edition for posterity! -- back cover.',2017,2),('WwN4BgAAQBAJ','Charlotte\'s Web','E. B. White','9780062406781','<p>Don’t miss one of America’s top 100 most-loved novels, selected by PBS’s The Great American Read.</p><p>This beloved book by E. B. White, author of Stuart Little and The Trumpet of the Swan, is a classic of children\'s literature that is \"just about perfect.\" Illustrations in this ebook appear in vibrant full color on a full-color device and in rich black-and-white on all other devices.</p><p>Some Pig. Humble. Radiant. These are the words in Charlotte\'s Web, high up in Zuckerman\'s barn. Charlotte\'s spiderweb tells of her feelings for a little pig named Wilbur, who simply wants a friend. They also express the love of a girl named Fern, who saved Wilbur\'s life when he was born the runt of his litter.</p><p>E. B. White\'s Newbery Honor Book is a tender novel of friendship, love, life, and death that will continue to be enjoyed by generations to come. It contains illustrations by Garth Williams, the acclaimed illustrator of E. B. White\'s Stuart Little and Laura Ingalls Wilder\'s Little House series, among many other books.</p><p>Whether enjoyed in the classroom or for homeschooling or independent reading, Charlotte\'s Web is a proven favorite.</p>',2015,1);
/*!40000 ALTER TABLE `catalog_userbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-04-29 22:51:15.097734','2','Donald',1,'[{\"added\": {}}]',4,1),(2,'2024-04-29 22:52:00.669430','3','Mickey',1,'[{\"added\": {}}]',4,1),(3,'2024-04-29 22:55:26.806050','3','Mickey',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"User permissions\", \"Last login\"]}}]',4,1),(4,'2024-04-29 22:56:31.248973','2','Donald',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Groups\", \"User permissions\", \"Last login\"]}}]',4,1),(5,'2024-04-29 22:56:38.217595','3','Mickey',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(6,'2024-04-29 23:41:57.471312','1','Animal Stories by Maria Hoey and Peter Hoey',1,'[{\"added\": {}}]',8,1),(7,'2024-04-29 23:42:45.870311','2','Ashes by Álvaro Ortiz',1,'[{\"added\": {}}]',8,1),(8,'2024-05-01 02:22:55.806506','1','boocheet',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',4,1),(9,'2024-05-01 02:23:14.237598','1','boocheet',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,1),(10,'2024-05-03 19:49:57.681151','1','Animal Stories by Maria Hoey and Peter Hoey',3,'',8,1),(11,'2024-05-03 19:50:07.931950','2','Ashes by Álvaro Ortiz',3,'',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'books','book'),(8,'catalog','book'),(9,'catalog','circulation'),(11,'catalog','profile'),(10,'catalog','transaction'),(12,'catalog','userbook'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-04-27 00:27:24.931104'),(2,'auth','0001_initial','2024-04-27 00:27:25.132355'),(3,'admin','0001_initial','2024-04-27 00:27:25.188510'),(4,'admin','0002_logentry_remove_auto_add','2024-04-27 00:27:25.191327'),(5,'admin','0003_logentry_add_action_flag_choices','2024-04-27 00:27:25.195432'),(6,'contenttypes','0002_remove_content_type_name','2024-04-27 00:27:25.231447'),(7,'auth','0002_alter_permission_name_max_length','2024-04-27 00:27:25.245198'),(8,'auth','0003_alter_user_email_max_length','2024-04-27 00:27:25.261787'),(9,'auth','0004_alter_user_username_opts','2024-04-27 00:27:25.264752'),(10,'auth','0005_alter_user_last_login_null','2024-04-27 00:27:25.278133'),(11,'auth','0006_require_contenttypes_0002','2024-04-27 00:27:25.278640'),(12,'auth','0007_alter_validators_add_error_messages','2024-04-27 00:27:25.280979'),(13,'auth','0008_alter_user_username_max_length','2024-04-27 00:27:25.296158'),(14,'auth','0009_alter_user_last_name_max_length','2024-04-27 00:27:25.329396'),(15,'auth','0010_alter_group_name_max_length','2024-04-27 00:27:25.337697'),(16,'auth','0011_update_proxy_permissions','2024-04-27 00:27:25.341011'),(17,'auth','0012_alter_user_first_name_max_length','2024-04-27 00:27:25.359743'),(18,'books','0001_initial','2024-04-27 00:27:25.363758'),(19,'sessions','0001_initial','2024-04-27 00:27:25.371315'),(20,'catalog','0001_initial','2024-04-29 23:04:36.953099'),(21,'catalog','0002_circulation','2024-05-01 02:16:58.082969'),(22,'catalog','0003_transaction','2024-05-01 16:59:29.019083'),(23,'catalog','0004_profile','2024-05-01 17:57:12.713452'),(24,'catalog','0005_userbook','2024-05-01 22:10:50.586747'),(25,'catalog','0006_auto_20240503_0244','2024-05-03 02:44:25.161232'),(26,'catalog','0007_auto_20240503_0250','2024-05-03 02:50:39.637216'),(27,'catalog','0008_auto_20240503_0258','2024-05-03 02:58:23.714495'),(28,'catalog','0009_auto_20240503_0317','2024-05-03 03:17:25.061031');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('646mrebght67qc2cxtbyda34wprtra66','NzdjZWY3ZWFkNzY3MTc4MzFiOTYzMGVhNjFjMDY3MGY0NTRkNTI0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzODMxNDc4MTU0MDdlNjcyOTkyOTMwODViYjEwNDg5ZTZkYWUyOGM5In0=','2024-05-17 19:26:08.511218'),('6lv0x21a8dei6f7y2fczzm8mckpy9txc','NzdjZWY3ZWFkNzY3MTc4MzFiOTYzMGVhNjFjMDY3MGY0NTRkNTI0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzODMxNDc4MTU0MDdlNjcyOTkyOTMwODViYjEwNDg5ZTZkYWUyOGM5In0=','2024-05-17 17:59:51.834678'),('84ao2zhd9846v4lhj5wl6lvcoli5tl01','NzdjZWY3ZWFkNzY3MTc4MzFiOTYzMGVhNjFjMDY3MGY0NTRkNTI0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzODMxNDc4MTU0MDdlNjcyOTkyOTMwODViYjEwNDg5ZTZkYWUyOGM5In0=','2024-05-17 18:09:24.942895'),('aoimqdq7b66z2u5djqzc75jg6vo42eow','NzdjZWY3ZWFkNzY3MTc4MzFiOTYzMGVhNjFjMDY3MGY0NTRkNTI0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzODMxNDc4MTU0MDdlNjcyOTkyOTMwODViYjEwNDg5ZTZkYWUyOGM5In0=','2024-05-17 18:57:55.340830'),('b8tik9ldhxbkxg1vm01ooq3zi6gtq1gp','NzdjZWY3ZWFkNzY3MTc4MzFiOTYzMGVhNjFjMDY3MGY0NTRkNTI0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzODMxNDc4MTU0MDdlNjcyOTkyOTMwODViYjEwNDg5ZTZkYWUyOGM5In0=','2024-05-17 19:17:39.469826'),('bbj4a8x9pqo73z8ps4eto78uil0ib639','NzdjZWY3ZWFkNzY3MTc4MzFiOTYzMGVhNjFjMDY3MGY0NTRkNTI0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzODMxNDc4MTU0MDdlNjcyOTkyOTMwODViYjEwNDg5ZTZkYWUyOGM5In0=','2024-05-17 16:57:11.423265'),('dxmtciod215u00x3zt4uqtlthb8si744','NzdjZWY3ZWFkNzY3MTc4MzFiOTYzMGVhNjFjMDY3MGY0NTRkNTI0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzODMxNDc4MTU0MDdlNjcyOTkyOTMwODViYjEwNDg5ZTZkYWUyOGM5In0=','2024-05-17 19:28:47.025154'),('k2enn5a1i37czzpgud5xkvtyu3gco2vj','NzdjZWY3ZWFkNzY3MTc4MzFiOTYzMGVhNjFjMDY3MGY0NTRkNTI0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzODMxNDc4MTU0MDdlNjcyOTkyOTMwODViYjEwNDg5ZTZkYWUyOGM5In0=','2024-05-17 17:42:46.225183'),('l5wfa3xp1p2wefri8bo820cn7rim7xhy','NzdjZWY3ZWFkNzY3MTc4MzFiOTYzMGVhNjFjMDY3MGY0NTRkNTI0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzODMxNDc4MTU0MDdlNjcyOTkyOTMwODViYjEwNDg5ZTZkYWUyOGM5In0=','2024-05-17 19:21:37.355855'),('onf8aisrt4ctqthq2xivwm9k60x3t06k','NzdjZWY3ZWFkNzY3MTc4MzFiOTYzMGVhNjFjMDY3MGY0NTRkNTI0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzODMxNDc4MTU0MDdlNjcyOTkyOTMwODViYjEwNDg5ZTZkYWUyOGM5In0=','2024-05-17 16:35:26.710662'),('xwcz9vuga0fms0a3uyh31aumummi5lc7','NzdjZWY3ZWFkNzY3MTc4MzFiOTYzMGVhNjFjMDY3MGY0NTRkNTI0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzODMxNDc4MTU0MDdlNjcyOTkyOTMwODViYjEwNDg5ZTZkYWUyOGM5In0=','2024-05-17 19:49:00.624375'),('yldqdfw0nj450b470a1cirvvy2z3zqq3','NzdjZWY3ZWFkNzY3MTc4MzFiOTYzMGVhNjFjMDY3MGY0NTRkNTI0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzODMxNDc4MTU0MDdlNjcyOTkyOTMwODViYjEwNDg5ZTZkYWUyOGM5In0=','2024-05-17 17:15:06.947733'),('z2o8k4j30arkbcepx76unt2g8wbx3d4n','NzdjZWY3ZWFkNzY3MTc4MzFiOTYzMGVhNjFjMDY3MGY0NTRkNTI0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzODMxNDc4MTU0MDdlNjcyOTkyOTMwODViYjEwNDg5ZTZkYWUyOGM5In0=','2024-05-17 16:57:43.359049'),('zpj8b9xhjwwszjghnq3ucq3bur0a4if0','NzdjZWY3ZWFkNzY3MTc4MzFiOTYzMGVhNjFjMDY3MGY0NTRkNTI0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzODMxNDc4MTU0MDdlNjcyOTkyOTMwODViYjEwNDg5ZTZkYWUyOGM5In0=','2024-05-17 19:19:08.242411');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-03 14:45:04
