CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.5.32

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
-- Table structure for table `cartitem`
--

DROP TABLE IF EXISTS `cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartitem` (
  `CartItemId` int(11) NOT NULL AUTO_INCREMENT,
  `Amount` int(11) NOT NULL,
  `CustomerAccount_CustomerId` int(11) NOT NULL,
  `Product_ProductId` int(11) NOT NULL,
  PRIMARY KEY (`CartItemId`,`CustomerAccount_CustomerId`,`Product_ProductId`),
  KEY `fk_CartItem_Product1_idx` (`Product_ProductId`),
  KEY `fk_CartItem_CustomerAccount_idx` (`CustomerAccount_CustomerId`),
  CONSTRAINT `fk_CartItem_CustomerAccount` FOREIGN KEY (`CustomerAccount_CustomerId`) REFERENCES `customeraccount` (`CustomerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CartItem_Product1` FOREIGN KEY (`Product_ProductId`) REFERENCES `product` (`ProductId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartitem`
--

LOCK TABLES `cartitem` WRITE;
/*!40000 ALTER TABLE `cartitem` DISABLE KEYS */;
INSERT INTO `cartitem` (`CartItemId`, `Amount`, `CustomerAccount_CustomerId`, `Product_ProductId`) VALUES (1,5,41,32),(2,7,11,36),(3,7,37,40),(4,4,38,26),(5,6,38,37),(6,7,30,43),(7,6,8,42),(8,3,42,27),(9,4,48,9),(10,5,39,8),(11,4,16,32),(12,3,38,30),(13,7,9,13),(14,5,11,44),(15,6,42,27),(16,1,15,10),(17,2,29,22),(18,7,33,37),(19,4,10,43),(20,1,21,17),(21,7,36,1),(22,5,1,44),(23,1,29,24),(24,7,12,42),(25,5,40,17),(26,1,38,45),(27,7,1,13),(28,1,1,26),(29,5,7,3),(30,7,1,20),(31,2,16,5),(32,6,27,34),(33,4,49,30),(34,6,22,26),(35,3,19,7),(36,4,17,18),(37,6,25,43),(38,7,15,39),(39,6,18,45),(40,4,14,14),(41,3,23,45),(42,3,3,15),(43,1,39,2),(44,2,28,23),(45,7,43,17),(46,2,4,24),(47,4,6,4),(48,1,43,36),(49,6,23,25),(50,5,17,43),(51,3,52,52);
/*!40000 ALTER TABLE `cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `CategoryId` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`CategoryId`, `Name`, `Description`) VALUES (1,'LightNovel','A short book'),(2,'Manga','Comic book'),(3,'Anime','animation'),(4,'T-shirt','A shirt'),(5,'Key chain','a keychain'),(6,'plushie','stuffed animal'),(7,'figurine','Action figure'),(8,'Movie','A movie'),(9,'Tapastry','wall scroll'),(10,'poster','a poster...'),(11,'video game','video games'),(12,'misc','other uncovered goods'),(13,'Food','snack food'),(14,'magazine','shonen jump'),(15,'manhwa','Korean manga'),(16,'Post cards','mailable cards'),(17,'Art books','book of art'),(18,'wallets','Container for money'),(19,'pillows','A pillow'),(20,'bedsheets','Bedsheets'),(21,'pants','Leg wear'),(22,'Cosplay','costumes'),(23,'Glass wear','Cups');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customeraccount`
--

DROP TABLE IF EXISTS `customeraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customeraccount` (
  `CustomerId` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `MailingAddress` varchar(125) DEFAULT NULL,
  `PhoneNumber` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`CustomerId`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customeraccount`
--

LOCK TABLES `customeraccount` WRITE;
/*!40000 ALTER TABLE `customeraccount` DISABLE KEYS */;
INSERT INTO `customeraccount` (`CustomerId`, `FirstName`, `LastName`, `MailingAddress`, `PhoneNumber`) VALUES (1,'Douglas','Gonzalez','895 Towne Trail','7-(064)484-0092'),(2,'Sara','Schmidt','329 Leroy Way','0-(617)468-0102'),(3,'Steven','Roberts','2 Rigney Court','2-(910)735-8811'),(4,'Jason','Oliver','1080 Commercial Junction','6-(762)613-4286'),(5,'Gregory','Dean','41777 Kinsman Crossing','7-(285)761-6389'),(6,'Kevin','Bowman','542 Summerview Center','6-(793)466-4428'),(7,'Dennis','Morris','46878 Evergreen Circle','4-(751)462-1796'),(8,'Larry','Stevens','8 Scofield Terrace','7-(944)692-7640'),(9,'Craig','Fernandez','63 Oxford Park','7-(327)023-1186'),(10,'Rachel','Montgomery','959 3rd Street','0-(356)287-0733'),(11,'Margaret','Collins','0158 Basil Point','4-(078)488-1231'),(12,'Jean','Webb','4917 Mcbride Street','8-(032)858-7046'),(13,'Kimberly','Simpson','6078 High Crossing Junction','9-(999)896-4320'),(14,'Virginia','Wright','9 Daystar Drive','6-(950)715-0007'),(15,'Dorothy','Hughes','5 Onsgard Street','1-(195)465-5362'),(16,'Stephen','Harrison','006 Maple Center','7-(805)034-5475'),(17,'Frank','Watson','872 Village Green Way','4-(480)252-0422'),(18,'Carlos','Grant','262 Valley Edge Drive','2-(535)894-5482'),(19,'Sarah','Day','444 Northridge Crossing','6-(901)230-8451'),(20,'Douglas','Burke','16 Corben Junction','2-(608)291-0338'),(21,'Angela','Anderson','0 Farmco Avenue','7-(334)159-2480'),(22,'Helen','Ford','83727 Menomonie Court','0-(904)554-6019'),(23,'Timothy','Romero','2 Farwell Pass','9-(565)570-8397'),(24,'Jessica','Warren','23236 Miller Alley','5-(582)252-6836'),(25,'Willie','White','75471 Maple Wood Terrace','0-(791)815-3270'),(26,'Philip','Morgan','9 Spohn Court','6-(080)172-6356'),(27,'Vaughan','Zenith','89 Cloud Zero','1-(364)424-2701'),(28,'Juan','Robertson','44 Little Fleur Avenue','5-(713)281-9250'),(29,'Christopher','Reid','1 Tennessee Circle','6-(479)345-8829'),(30,'Shawn','Nichols','0630 Shoshone Drive','5-(132)461-3606'),(31,'Ruth','Olson','97011 4th Avenue','7-(562)853-5795'),(32,'Dennis','Long','84 Pawling Road','6-(598)145-8266'),(33,'Robert','Patterson','85846 Mariners Cove Trail','4-(980)784-3378'),(34,'Antonio','Brooks','85399 Moulton Lane','6-(314)216-6856'),(35,'Martha','Allen','7 La Follette Place','2-(636)855-2186'),(36,'Willie','Rogers','60261 Dexter Plaza','3-(372)116-0238'),(37,'Peter','Hamilton','488 Lindbergh Center','0-(556)359-9582'),(38,'Paul','Bishop','45503 Debs Center','3-(335)407-8573'),(39,'Michael','Wheeler','35 Roxbury Place','1-(932)647-5554'),(40,'Ann','Mason','6 Hazelcrest Crossing','0-(107)442-4056'),(41,'Jessica','Kennedy','5 Stephen Crossing','6-(295)705-7238'),(42,'David','Stewart','95190 Bayside Avenue','5-(073)161-6580'),(43,'Robert','Hall','29980 Ruskin Center','9-(550)676-7850'),(44,'Ralph','Robinson','8 Helena Crossing','7-(200)783-6084'),(45,'Carolyn','Cole','1231 Gulseth Point','7-(725)949-1271'),(46,'Marie','Banks','15524 Dexter Place','2-(719)975-7950'),(47,'Billy','Hudson','14284 Packers Way','3-(395)751-4833'),(48,'Anna','Spencer','7 Knutson Pass','4-(877)165-4416'),(49,'Annie','Arnold','83806 Anderson Avenue','2-(460)188-5118'),(50,'Brandon','Smith','Here','123456789'),(51,'Vaughan','Hilts','HILT2740@mylaurier.ca','(519) 654 2738'),(52,'Vaughan','Hilts','786 Elgin Street','519 654 2738'),(53,'V','V','V','V'),(54,'Bill','Cosby','Here','12345'),(55,'Brandon','Smith','Testing','');
/*!40000 ALTER TABLE `customeraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre` (
  `Type` varchar(45) NOT NULL,
  PRIMARY KEY (`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` (`Type`) VALUES ('Action'),('Adventure'),('Comedy'),('Doujinshi'),('Drama'),('Ecchi'),('Fantasy'),('Gender Bender'),('Harem'),('Historical'),('Horror'),('Josei'),('Martial Arts'),('Mature'),('Mecha'),('Mystery'),('Psychology'),('Romace'),('Romance'),('School Life'),('Sci-fi'),('Seinen'),('Shotacon'),('Shoujo'),('Shoujo Ai'),('Shounen'),('Shounen Ai'),('Slice of Life'),('Supernatural'),('Tragedy');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `OrderNumber` int(11) NOT NULL AUTO_INCREMENT,
  `ShippingAddress` varchar(45) DEFAULT NULL,
  `DateCreated` varchar(45) DEFAULT NULL,
  `EstimatedDate` varchar(45) DEFAULT NULL,
  `DeliverDate` varchar(45) DEFAULT NULL,
  `CustomerAccount_CustomerId` int(11) NOT NULL,
  PRIMARY KEY (`OrderNumber`),
  KEY `fk_Order_CustomerAccount1_idx` (`CustomerAccount_CustomerId`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` (`OrderNumber`, `ShippingAddress`, `DateCreated`, `EstimatedDate`, `DeliverDate`, `CustomerAccount_CustomerId`) VALUES (1,'84456 Karstens Lane','2/24/2015','9/27/2014',NULL,37),(2,'62710 Service Place','12/7/2014','1/4/2015',NULL,23),(3,'7 Sutteridge Junction','7/16/2014','9/23/2014',NULL,49),(4,'877 Granby Terrace','2/7/2015','5/24/2014',NULL,25),(5,'005 Eagan Point','7/13/2014','1/13/2015',NULL,18),(6,'2 Darwin Parkway','10/9/2014','11/4/2014',NULL,26),(7,'952 Iowa Circle','11/17/2014','7/22/2014','3/15/2014',49),(8,'46050 South Trail','5/9/2014','10/27/2014',NULL,7),(9,'45870 Carey Court','5/19/2014','1/13/2015','11/21/2014',32),(10,'2966 Arapahoe Drive','11/9/2014','3/29/2014',NULL,21),(11,'495 Lotheville Court','3/25/2014','6/26/2014',NULL,38),(12,'84 Morningstar Court','8/25/2014','5/23/2014',NULL,31),(13,'013 Goodland Center','4/27/2014','9/7/2014',NULL,3),(14,'64122 Starling Trail','10/10/2014','9/23/2014','2/14/2015',13),(15,'0267 Westridge Road','8/18/2014','12/5/2014',NULL,41),(16,'6812 Grover Parkway','2/12/2015','8/27/2014','10/8/2014',19),(17,'5 Londonderry Point','5/24/2014','11/29/2014','3/22/2014',20),(18,'79378 Dovetail Place','5/22/2014','5/13/2014',NULL,15),(19,'09325 Meadow Valley Lane','10/19/2014','10/26/2014',NULL,19),(20,'08329 Chive Junction','11/5/2014','3/11/2014',NULL,30),(21,'96599 Nevada Junction','9/28/2014','8/24/2014','7/18/2014',46),(22,'1 Holmberg Center','6/9/2014','4/17/2014',NULL,35),(23,'880 Golf Course Point','4/3/2014','3/2/2015',NULL,7),(24,'41737 Calypso Junction','10/27/2014','6/15/2014','12/27/2014',16),(25,'415 Straubel Circle','6/7/2014','3/4/2015',NULL,27),(26,'7 Jenna Avenue','6/19/2014','9/22/2014','6/14/2014',2),(27,'371 Petterle Junction','12/5/2014','6/1/2014',NULL,35),(28,'798 Badeau Lane','12/11/2014','4/18/2014','11/2/2014',20),(29,'372 Duke Place','8/6/2014','10/11/2014',NULL,15),(30,'8824 Arizona Lane','1/25/2015','11/1/2014',NULL,1),(31,'61291 Fallview Way','11/26/2014','1/24/2015',NULL,49),(32,'77 Arapahoe Street','12/4/2014','1/9/2015',NULL,20),(33,'3939 Schmedeman Center','11/7/2014','3/4/2015','9/18/2014',13),(34,'7333 Duke Avenue','6/5/2014','12/15/2014',NULL,35),(35,'7 Sundown Hill','2/21/2015','9/26/2014',NULL,7),(36,'09563 Straubel Drive','2/7/2015','11/22/2014','10/10/2014',8),(37,'05 Ruskin Trail','10/30/2014','2/10/2015','8/18/2014',3),(38,'119 Annamark Road','8/7/2014','3/3/2015','6/20/2014',12),(39,'625 Logan Plaza','8/6/2014','2/15/2015',NULL,48),(40,'77622 Norway Maple Terrace','5/23/2014','1/26/2015',NULL,41),(41,'228 Autumn Leaf Court','12/16/2014','1/16/2015','3/11/2014',15),(42,'7 Kim Trail','9/26/2014','1/1/2015',NULL,50),(43,'271 Maple Way','6/15/2014','2/5/2015',NULL,4),(44,'8 Tennyson Street','6/22/2014','10/6/2014',NULL,36),(45,'425 Anzinger Avenue','11/18/2014','6/9/2014','4/24/2014',7),(46,'99 Welch Parkway','8/23/2014','11/29/2014','1/17/2015',6),(47,'70151 Columbus Plaza','6/10/2014','5/2/2014',NULL,33),(48,'1209 American Ash Center','9/16/2014','12/15/2014',NULL,12),(49,'52938 Hallows Alley','3/7/2014','12/29/2014',NULL,48),(50,'93 Melrose Lane','12/8/2014','10/22/2014',NULL,18),(51,'79 Cottonwood Way','1/26/2015','3/10/2014','11/11/2014',38),(52,'1 Michigan Place','1/8/2015','2/23/2015','2/22/2015',7),(53,'09233 Calypso Junction','3/26/2014','12/27/2014','1/18/2015',36),(54,'435 Spenser Park','8/9/2014','3/2/2015',NULL,21),(55,'96106 Transport Junction','12/25/2014','6/10/2014',NULL,21),(56,'1928 Artisan Center','11/29/2014','1/8/2015',NULL,49),(57,'9 Fisk Plaza','6/11/2014','9/26/2014',NULL,48),(58,'649 Marquette Court','11/20/2014','7/23/2014',NULL,48),(59,'3 Northridge Circle','2/9/2015','6/13/2014',NULL,17),(60,'7142 Kingsford Alley','2/16/2015','5/26/2014','1/7/2015',1),(61,'1 Norway Maple Hill','10/2/2014','6/3/2014','3/16/2014',44),(62,'05 Steensland Avenue','7/26/2014','10/1/2014',NULL,15),(63,'2839 Rigney Terrace','6/13/2014','9/28/2014',NULL,28),(64,'1637 Clarendon Crossing','1/10/2015','3/10/2014','9/8/2014',49),(65,'788 7th Point','3/26/2014','3/19/2014',NULL,49),(66,'760 Amoth Center','2/24/2015','6/9/2014',NULL,7),(67,'497 Ridge Oak Park','12/12/2014','2/17/2015',NULL,3),(68,'34835 Veith Circle','6/22/2014','3/4/2015',NULL,21),(69,'1258 Farragut Junction','7/26/2014','4/25/2014',NULL,35),(70,'93892 Kings Terrace','2/17/2015','8/17/2014',NULL,5),(71,'1539 Loomis Drive','4/11/2014','1/30/2015','8/26/2014',49),(72,'90 3rd Avenue','9/1/2014','11/9/2014',NULL,26),(73,'0336 Pond Center','5/13/2014','1/19/2015','1/24/2015',22),(74,'7383 Michigan Pass','1/20/2015','4/1/2014',NULL,14),(75,'8 Tomscot Crossing','11/12/2014','12/18/2014','4/8/2014',25),(76,'3095 Gateway Hill','2/28/2014','10/16/2014',NULL,45),(77,'86632 Gale Crossing','7/22/2014','10/17/2014',NULL,17),(78,'5489 Warbler Lane','5/5/2014','10/19/2014','5/25/2014',3),(79,'9996 Acker Center','2/19/2015','4/1/2014',NULL,24),(80,'6579 Lukken Parkway','6/29/2014','7/8/2014',NULL,10),(81,'5759 Veith Lane','11/10/2014','6/2/2014',NULL,21),(82,'1952 Amoth Parkway','12/9/2014','11/28/2014',NULL,16),(83,'0907 Saint Paul Lane','5/1/2014','11/6/2014',NULL,50),(84,'866 Mcguire Avenue','2/12/2015','11/16/2014',NULL,42),(85,'64766 Canary Court','7/2/2014','11/12/2014',NULL,17),(86,'448 Warbler Pass','8/4/2014','2/1/2015',NULL,39),(87,'76197 Red Cloud Junction','9/13/2014','9/23/2014',NULL,4),(88,'1 Bartelt Center','8/4/2014','10/6/2014',NULL,41),(89,'640 Mallory Way','10/31/2014','7/1/2014',NULL,2),(90,'49484 Steensland Avenue','8/25/2014','4/22/2014','4/9/2014',50),(91,'861 Sachs Avenue','9/5/2014','11/14/2014','8/7/2014',32),(92,'1553 Maywood Junction','11/7/2014','3/29/2014',NULL,31),(93,'85610 Golden Leaf Road','6/18/2014','5/22/2014',NULL,15),(94,'307 Blue Bill Park Trail','1/28/2015','2/10/2015',NULL,45),(95,'704 Stang Way','7/21/2014','1/10/2015','2/2/2015',27),(96,'25 Melvin Plaza','11/17/2014','9/28/2014',NULL,37),(97,'427 Dennis Center','4/3/2014','4/18/2014',NULL,36),(98,'84487 Ramsey Pass','4/2/2014','9/21/2014',NULL,38),(99,'582 Stoughton Lane','6/27/2014','12/6/2014',NULL,4),(100,'270 Arrowood Alley','7/27/2014','8/3/2014',NULL,5),(101,'2331 Village Park','1/13/2015','9/27/2014','6/23/2014',32),(102,'698 Ludington Lane','12/4/2014','7/19/2014','9/14/2014',3),(103,'8 Charing Cross Park','4/10/2014','5/22/2014','11/20/2014',48),(104,'7 Arkansas Lane','5/23/2014','3/25/2014',NULL,20),(105,'03047 Golf View Terrace','1/25/2015','8/26/2014',NULL,26),(106,'045 Bluestem Circle','1/31/2015','2/15/2015',NULL,8),(107,'850 4th Junction','5/11/2014','1/20/2015',NULL,27),(108,'786 Elgin Street','21/03/2015','0','0',52),(109,'786 Elgin Street','21/03/2015','0','0',52),(110,'Here','21/03/2015','0','0',50),(111,'Here','21/03/2015','0','0',50),(112,'786 Elgin Street','22/03/2015','0','0',52),(113,'786 Elgin Street','22/03/2015','0','0',52),(114,'There','22/03/2015','0','0',54),(115,'There','22/03/2015','0','0',54),(116,'There','22/03/2015','0','0',54),(117,'Somewhere','22/03/2015','0','0',54),(118,'Somewhere','22/03/2015','0','0',54),(119,'Here','22/03/2015','0','0',54);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderitem` (
  `OrderId` int(11) NOT NULL AUTO_INCREMENT,
  `Quantity` int(11) DEFAULT NULL,
  `Product_ProductId` int(11) NOT NULL,
  `Order_OrderNumber` int(11) NOT NULL,
  PRIMARY KEY (`OrderId`,`Order_OrderNumber`),
  KEY `fk_OrderItem_Product1_idx` (`Product_ProductId`),
  KEY `fk_OrderItem_Order1_idx` (`Order_OrderNumber`),
  CONSTRAINT `fk_OrderItem_Order1` FOREIGN KEY (`Order_OrderNumber`) REFERENCES `order` (`OrderNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderItem_Product1` FOREIGN KEY (`Product_ProductId`) REFERENCES `product` (`ProductId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` (`OrderId`, `Quantity`, `Product_ProductId`, `Order_OrderNumber`) VALUES (1,4,40,1),(2,3,50,2),(3,1,43,3),(4,3,5,4),(5,3,43,5),(6,3,38,6),(7,1,13,7),(8,4,33,8),(9,3,36,9),(10,4,3,10),(11,2,45,11),(12,1,10,12),(13,2,10,13),(14,3,50,14),(15,4,18,15),(16,1,30,16),(17,3,12,17),(18,1,6,18),(19,4,47,19),(20,4,13,20),(21,4,8,21),(22,3,39,22),(23,4,11,23),(24,4,33,24),(25,3,7,25),(26,2,28,26),(27,2,29,27),(28,2,32,28),(29,1,1,29),(30,1,1,30),(31,4,42,31),(32,3,17,32),(33,1,29,33),(34,1,42,34),(35,3,19,35),(36,1,2,36),(37,2,26,37),(38,3,7,38),(39,3,48,39),(40,4,45,40),(41,3,21,41),(42,4,5,42),(43,2,40,43),(44,4,13,44),(45,3,30,45),(46,1,27,46),(47,3,45,47),(48,3,6,48),(49,4,40,49),(50,3,5,50),(51,2,10,51),(52,2,9,52),(53,1,8,53),(54,2,49,54),(55,2,46,55),(56,2,32,56),(57,4,6,57),(58,1,17,58),(59,3,40,59),(60,4,15,60),(61,3,1,61),(62,1,30,62),(63,1,22,63),(64,4,44,64),(65,2,8,65),(66,4,6,66),(67,3,45,67),(68,2,47,68),(69,4,50,69),(70,3,18,70),(71,1,42,71),(72,1,50,72),(73,2,17,73),(74,3,21,74),(75,1,5,75),(76,4,43,76),(77,2,31,77),(78,1,12,78),(79,4,48,79),(80,1,48,80),(81,2,7,81),(82,4,2,82),(83,4,41,83),(84,4,50,84),(85,2,47,85),(86,1,5,86),(87,1,47,87),(88,4,30,88),(89,1,24,89),(90,1,21,90),(91,4,26,91),(92,3,18,92),(93,4,14,93),(94,4,42,94),(95,2,35,95),(96,4,9,96),(97,3,26,97),(98,4,26,98),(99,4,11,99),(100,1,26,100),(101,4,5,101),(102,1,34,102),(103,2,2,103),(104,2,41,104),(105,1,4,105),(106,4,26,106),(107,4,43,107),(108,12,43,107),(109,3,52,109),(110,3,50,111),(111,3,52,113),(112,2,53,114),(113,2,53,116),(114,2,50,117),(115,3,51,118),(116,4,48,118),(117,2,55,119),(118,3,50,119);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `ProductId` int(11) NOT NULL AUTO_INCREMENT,
  `Stock` int(11) DEFAULT NULL,
  `Name` varchar(120) DEFAULT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  `Price` decimal(10,0) DEFAULT NULL,
  `Category_CategoryId` int(11) NOT NULL,
  `Publisher_PublisherId` int(11) NOT NULL,
  PRIMARY KEY (`ProductId`),
  KEY `fk_Product_Category1_idx` (`Category_CategoryId`),
  KEY `fk_Product_Publisher1_idx` (`Publisher_PublisherId`),
  CONSTRAINT `fk_Product_Category1` FOREIGN KEY (`Category_CategoryId`) REFERENCES `category` (`CategoryId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_Publisher1` FOREIGN KEY (`Publisher_PublisherId`) REFERENCES `publisher` (`PublisherId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`ProductId`, `Stock`, `Name`, `Description`, `Price`, `Category_CategoryId`, `Publisher_PublisherId`) VALUES (1,6,'Sailor Moon Blu-ray/DVD Set 1 (Hyb) Limited Edition','Contains episodes 1-23 plus an 88-page',94,13,3),(2,82,'Dragon Ball Z Figurine Capsule Set (7 figures): Series 3','Each box contains seven capsules with one of eight possible figures inside.',58,13,3),(3,51,'Spice and Wolf Graphic Novel 1','Kraft Lawrence has been walking the lonely path of the itinerant merchant for seven years. His life changes forever when he meets Holo',103,15,3),(4,42,'Spice and Wolf Graphic Novel 2','Kraft Lawrence has been walking the lonely path of the itinerant merchant for seven years. His life changes forever when he meets Holo',101,2,3),(5,41,'Spice and Wolf Graphic Novel 3','Kraft Lawrence has been walking the lonely path of the itinerant merchant for seven years. His life changes forever when he meets Holo',149,6,3),(6,88,'Spice and Wolf Graphic Novel 4','Kraft Lawrence has been walking the lonely path of the itinerant merchant for seven years. His life changes forever when he meets Holo',72,17,5),(7,70,'Spice and Wolf Graphic Novel 5','Kraft Lawrence has been walking the lonely path of the itinerant merchant for seven years. His life changes forever when he meets Holo',74,19,5),(8,49,'Japanese T-Shirt - I Would Die for Haruhi - Blue - S','A T-Shirt',173,1,5),(9,0,'Certain Magical Index',' A Novel 1',62,1,7),(10,71,'Accel World Cup with Lid: Kuroyukihime','Note: Not dishwasher or microwave safe.',112,12,4),(11,93,'Nisekoi: False Love Graphic Novel 9','Raku\'s crush',175,12,4),(12,86,'Outbreak Company Blu-ray Complete Collection (Hyb)','Contains episodes 1-12',139,4,2),(13,21,'Spirited Away: Art of Spirited Away Artbook','Collects the color illustrations of Spirited Away (Sen to Chihiro no Kamikakushi) for the first time in an English edition! Includes paintings and designs from the new animated film from the director of Kiki\'s Delivery Service and Princess Mononoke.',6,12,2),(14,87,'Spirited Away DVD (Hyb)','From Hayao Miyazaki (Princess Mononoke',117,5,9),(15,1,'Bleach Armband: Squad Five','Cosplay',21,6,8),(16,27,'Bleach Armband: Squad Four','Cosplay',131,7,7),(17,88,'Bleach Armband: Squad One','Cosplay',68,1,6),(18,1,'Blue Exorcist Pin: Academy Instructor\'s Badge','Cosplay',61,3,5),(19,72,'Dragon Ball Z Costume: Trunk\'s Jacket - L','Cosplay',24,4,1),(20,14,'.hack//Roots DVD 3 (Hyb)','DVD Features: Japanese DVD Release Announcement',77,5,4),(21,47,'Persona 3 The Movie 2: Midsummer Knight\'s Dream Blu-ray (S) (Import) Collector\'s','Special Features: Audio Commentary',22,1,3),(22,49,'Sword Art Online Girl\'s Fitted T-Shirt: Asuna - M','',121,2,3),(23,50,'LiSA CD: crossing field (Import) + DVD Limited Edition','12 tracks',161,3,4),(24,52,'Fate/Zero Poster','31 x 43 in',29,4,5),(25,73,'Fate/Stay Night Poster','31 x 43 in',137,5,5),(26,0,'Sword Art Online Poster','31 x 43 in',91,6,8),(27,93,'Certain Magical Index',' A the Movie: Miracle of Endymion DVD/Blu-ray (Hyb)',175,1,7),(28,20,'Howl\'s Moving Castle DVD (Hyb)','Spoken Languages: English',21,6,6),(29,93,'One Piece Postcard Set: New World (4 Postcards)','N/A',139,12,5),(30,48,'Bleach Postcard Set (4 Postcards)','N/A',58,17,4),(31,81,'Bleach Plush: Ulquiorra (8 in)','N/A',132,18,2),(32,84,'Accel World Blu-ray Set 1 (Hyb)','Special Features: Character Art Gallery',54,20,2),(33,55,'Accel World Blu-ray Set 2 (Hyb)','Special Features: Character Art Gallery',174,4,1),(34,73,'Bakemonogatari Blu-ray Complete Set (S) Limited Edition','Spoken Languages: Japanese',177,5,1),(35,56,'Eden of the East Pillow: Noblesse Oblige','Special Features: Air Communication Prequel Movie (TV Series Summary)',104,1,1),(36,44,'Eden of the East Fabric Poster: Carousel','Special Features: Air Communication Prequel Movie (TV Series Summary)',164,2,8),(37,52,'Eden of the East Movie 1: King of Eden DVD/Blu-ray (Hyb)','Special Features: Air Communication Prequel Movie (TV Series Summary)',146,3,8),(38,11,'Eden of the East Movie 2: Paradise Lost DVD/Blu-ray (Hyb)','Special Features: Air Communication Prequel Movie (TV Series Summary)',37,5,8),(39,42,'Eden of the East DVD Complete Series (Hyb) - Anime Classics','Special Features: Air Communication Prequel Movie (TV Series Summary)',165,3,8),(40,73,'Tales of Xillia','A Tales of video game RPG (PS3)',104,7,7),(41,83,'Tales of Xillia 2','A Tales of video game RPG (PS3)',112,2,6),(42,95,'Sword Art Online - Infinity Moment','A game based on the popular VRMMO anime and light novel for the PSP system',137,6,5),(43,68,'Sword Art Online - Hollow Fragment','A game based on the popular VRMMO anime and light novel for the PS Vita system',94,7,3),(44,52,'Garden of Words',' The Blu-ray (Hyb)',98,5,3),(45,11,'Garden of Words',' The Graphic Novel',45,7,4),(46,15,'Aldnoah.Zero CD: Original Soundtrack (Import)','N/A',127,8,4),(47,28,'Noblesse Volume 1','Noblesse is about a powerful noble awakening from his slumber after many',78,4,4),(48,75,'Noblesse Volume 1','Noblesse is about a powerful noble awakening from his slumber after many',89,4,6),(49,62,'PSYCHO-PASS Plush: Akane (8 in)','N/A',102,3,5),(50,50,'Sword Art Online Keychain','N/A',88,3,4),(51,50,'Setsuna','Setsuna',50,6,16),(52,100,'White Album 2 (CD)','A beautiful arrangement of the White Album collection',120,12,14),(53,2,'NewName','Now with more New',5001,19,12),(54,3,'Good','A good thing',100,21,12),(55,4,'Bye','Exit',18,23,18),(56,5,'Proof','End',15,23,20);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_has_genre`
--

DROP TABLE IF EXISTS `product_has_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_has_genre` (
  `Product_ProductId` int(11) NOT NULL,
  `Genre_Type` varchar(45) NOT NULL,
  PRIMARY KEY (`Product_ProductId`,`Genre_Type`),
  KEY `fk_Product_has_Genre_Genre1_idx` (`Genre_Type`),
  KEY `fk_Product_has_Genre_Product1_idx` (`Product_ProductId`),
  CONSTRAINT `fk_Product_has_Genre_Genre1` FOREIGN KEY (`Genre_Type`) REFERENCES `genre` (`Type`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_has_Genre_Product1` FOREIGN KEY (`Product_ProductId`) REFERENCES `product` (`ProductId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_has_genre`
--

LOCK TABLES `product_has_genre` WRITE;
/*!40000 ALTER TABLE `product_has_genre` DISABLE KEYS */;
INSERT INTO `product_has_genre` (`Product_ProductId`, `Genre_Type`) VALUES (2,'Adventure'),(3,'Action'),(3,'Seinen'),(4,'Romance'),(5,'Comedy'),(5,'Romance'),(6,'Comedy'),(9,'Romance'),(11,'Comedy'),(11,'Romance'),(12,'Comedy'),(12,'Drama'),(12,'Seinen'),(13,'Comedy'),(13,'Drama'),(13,'Romance'),(14,'Drama'),(14,'Historical'),(14,'Romance'),(15,'Drama'),(15,'Romance'),(16,'Romance'),(18,'Action'),(18,'Comedy'),(20,'Action'),(20,'Josei'),(20,'Romance'),(29,'Horror'),(30,'Action'),(30,'Adventure'),(30,'Josei'),(32,'Adventure'),(32,'Romance'),(33,'Romance'),(34,'Adventure'),(34,'Fantasy'),(35,'Seinen'),(36,'Comedy'),(36,'Historical'),(36,'Mystery'),(37,'Action'),(37,'Horror'),(38,'Fantasy'),(38,'Horror'),(38,'Mystery'),(39,'Fantasy'),(39,'Romance'),(40,'Drama'),(40,'Tragedy'),(44,'Fantasy');
/*!40000 ALTER TABLE `product_has_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_has_supplier`
--

DROP TABLE IF EXISTS `product_has_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_has_supplier` (
  `Product_ProductId` int(11) NOT NULL,
  `Supplier_SupplierId` int(11) NOT NULL,
  PRIMARY KEY (`Product_ProductId`,`Supplier_SupplierId`),
  KEY `fk_Product_has_Supplier_Supplier1_idx` (`Supplier_SupplierId`),
  KEY `fk_Product_has_Supplier_Product1_idx` (`Product_ProductId`),
  CONSTRAINT `fk_Product_has_Supplier_Product1` FOREIGN KEY (`Product_ProductId`) REFERENCES `product` (`ProductId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_has_Supplier_Supplier1` FOREIGN KEY (`Supplier_SupplierId`) REFERENCES `supplier` (`SupplierId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_has_supplier`
--

LOCK TABLES `product_has_supplier` WRITE;
/*!40000 ALTER TABLE `product_has_supplier` DISABLE KEYS */;
INSERT INTO `product_has_supplier` (`Product_ProductId`, `Supplier_SupplierId`) VALUES (16,1),(42,1),(4,4),(9,4),(45,4),(12,5),(14,5),(21,5),(6,6),(24,6),(10,7),(31,7),(37,7),(15,8),(35,8),(36,8),(11,9),(19,9),(38,9),(13,10),(25,11),(34,11),(5,12),(1,13),(7,13),(27,13),(48,14),(47,15),(49,15),(2,16),(28,16),(18,17),(23,17),(41,17),(3,18),(44,19),(46,19),(40,20),(50,21),(33,22),(26,23),(8,24),(22,25),(30,28),(20,29),(17,30),(29,30),(32,30),(39,30),(43,30);
/*!40000 ALTER TABLE `product_has_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher` (
  `PublisherId` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PublisherId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` (`PublisherId`, `Name`) VALUES (1,'5 POINTS '),(2,'801 MEDIA '),(3,'JAPANIME '),(4,'IMAGE ENTERTAINMENT '),(5,'SENTAI FILMWORKS '),(6,'Yen Press'),(7,'SHOUT FACTORY '),(8,'SUNRISE INC. '),(9,'White Fox'),(10,'Aniplex'),(11,'VIZ '),(12,'VIZ BOOKS '),(13,'YESJAPAN '),(14,'PONYCAN '),(15,'MAIDEN JAPAN '),(16,'MAGNOLIA '),(17,'FANTAGRAPHICS '),(18,'DARK HORSE '),(19,'ABC Corp'),(20,'Other');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `series` (
  `SeriesId` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`SeriesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
INSERT INTO `series` (`SeriesId`, `Name`) VALUES (1,'Spice and Wolf'),(2,'Sword Art Online'),(3,'Index Series'),(4,'White Album 2'),(5,'Accel World'),(6,'Fairy Tail'),(7,'Haruhi'),(8,'Nagato-chan'),(9,'Psycho Pass'),(10,'Problem Children?'),(11,'Dragon Ball Z'),(12,'Inuyasha'),(13,'Noblesse'),(14,'Eden of the East'),(15,'Howl\'s Moving Castle'),(16,'Garden of Words'),(17,'Free!'),(18,'Naruto'),(19,'No Game No life'),(20,'Attack on Titan'),(21,'Anohana'),(22,'Guilty Crown'),(23,'Magi'),(24,'Tokyo Ghoul'),(25,'Madoka Magica'),(26,'Another'),(27,'Death Parade'),(28,'Akame Ga Kill'),(29,'Clannad'),(30,'Golden Time'),(31,'Your Lie In April'),(32,'Nisekoi'),(33,'Death Note'),(34,'Hamatora'),(35,'Log Horizon'),(36,'Katangatari'),(37,'Love Lab'),(38,'Evangelion'),(39,'Date A Live'),(40,'Cardcaptor Sakura'),(41,'Angel Beats!'),(42,'Bleach'),(43,'Air'),(44,'Fate/Zero'),(45,'Fate/Stay Night'),(46,'Noragami');
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series_has_product`
--

DROP TABLE IF EXISTS `series_has_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `series_has_product` (
  `Series_SeriesId` int(11) NOT NULL,
  `Product_ProductId` int(11) NOT NULL,
  PRIMARY KEY (`Product_ProductId`,`Series_SeriesId`),
  KEY `fk_Series_has_Product_Series1_idx` (`Series_SeriesId`),
  KEY `fk_Series_has_Product_Product1_idx` (`Product_ProductId`),
  CONSTRAINT `fk_Series_has_Product_Product1` FOREIGN KEY (`Product_ProductId`) REFERENCES `product` (`ProductId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Series_has_Product_Series1` FOREIGN KEY (`Series_SeriesId`) REFERENCES `series` (`SeriesId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series_has_product`
--

LOCK TABLES `series_has_product` WRITE;
/*!40000 ALTER TABLE `series_has_product` DISABLE KEYS */;
INSERT INTO `series_has_product` (`Series_SeriesId`, `Product_ProductId`) VALUES (1,12),(1,14),(1,33),(2,20),(2,21),(3,2),(3,12),(3,20),(3,25),(4,7),(4,11),(4,18),(5,18),(5,40),(5,49),(6,3),(6,22),(6,44),(7,15),(7,18),(7,39),(8,13),(8,36),(9,7),(9,30),(9,37),(10,32),(10,33),(10,49),(11,28),(11,31),(11,47),(12,11),(12,26),(12,45),(12,48),(13,14),(13,42),(13,47),(14,9),(14,30),(14,42),(15,11),(15,24),(15,32),(16,23),(16,29),(17,5),(17,15),(17,38),(18,12),(18,24),(18,40),(19,5),(19,15),(19,50),(20,6),(20,25),(20,50),(21,4),(21,11),(21,13),(21,19),(22,16),(22,35),(22,49),(23,3),(23,29),(23,35),(23,44),(24,41),(24,45),(25,17),(25,18),(25,44),(26,23),(26,26),(26,37),(27,11),(27,46),(27,50),(28,11),(28,25),(28,35),(29,9),(29,20),(29,34),(30,28),(30,31),(30,48),(31,12),(31,44),(31,47),(32,10),(32,11),(32,14),(33,22),(33,32),(33,46),(34,16),(34,31),(34,44),(35,27),(35,31),(35,47),(36,24),(36,36),(36,50),(37,25),(37,28),(37,33),(38,5),(38,24),(38,25),(39,27),(39,37),(39,41),(40,14),(40,27),(40,39),(41,28),(41,31),(41,41),(42,24),(42,25),(42,37),(43,10),(43,20),(43,47),(44,21),(44,29),(44,50),(45,6),(45,33),(45,37),(46,30),(46,32),(46,36);
/*!40000 ALTER TABLE `series_has_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `SupplierId` int(11) NOT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `PhoneNumber` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`SupplierId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` (`SupplierId`, `Address`, `Country`, `Name`, `PhoneNumber`) VALUES (1,'90777 Arapahoe Street','China','Omba','6-(407)461-2383'),(2,'9 Forest Dale Lane','Japan','Fanoodle','6-(392)159-5923'),(3,'960 Utah Trail','Japan','Midel','7-(233)119-4707'),(4,'393 Eagan Parkway','Japan','Tagfeed','8-(740)843-3036'),(5,'429 Tennessee Trail','Japan','Voonyx','5-(551)115-8192'),(6,'94850 Express Crossing','Japan','Topicblab','8-(953)528-0016'),(7,'7880 Lighthouse Bay Pass','Peru','Tazz','7-(212)577-8139'),(8,'9 Northland Park','Russia','Jaxworks','1-(689)471-2027'),(9,'1957 Fremont Crossing','Guinea-Bissau','Divape','8-(927)860-1593'),(10,'5 Brentwood Drive','Brazil','Dabjam','1-(589)742-1252'),(11,'93946 Drewry Court','Indonesia','Chatterbridge','4-(958)132-3576'),(12,'338 Lyons Hill','Russia','Yombu','8-(046)150-8541'),(13,'502 Myrtle Pass','Portugal','Zazio','6-(063)120-6005'),(14,'8 Roth Lane','Canada','Realpoint','1-(682)503-2893'),(15,'3097 Birchwood Drive','Canada','Divanoodle','1-(236)460-6370'),(16,'8 Kipling Junction','Canada','Dabtype','1-(438)873-2165'),(17,'9668 School Drive','China','Edgepulse','8-(805)932-1219'),(18,'6782 Mccormick Crossing','Russia','Fanoodle','3-(403)455-0705'),(19,'3003 Pierstorff Street','Guatemala','Buzzbean','3-(402)998-2474'),(20,'8327 Jenifer Alley','Indonesia','Snaptags','3-(969)277-9426'),(21,'50798 Birchwood Junction','Palestinian Territory','Quinu','6-(650)476-5269'),(22,'6505 Victoria Way','China','Kazio','0-(096)987-3750'),(23,'11381 Ruskin Center','Netherlands','Dabtype','2-(637)959-3862'),(24,'204 Jana Way','Mexico','Skimia','8-(579)904-3854'),(25,'76119 Farmco Road','China','Quimm','7-(984)527-9074'),(26,'282 Grayhawk Court','Peru','Yadel','9-(483)713-5901'),(27,'024 Veith Avenue','Indonesia','Feednation','4-(873)192-3711'),(28,'1418 Lake View Lane','France','Oozz','9-(237)106-6148'),(29,'5366 Fisk Lane','Indonesia','Dabshots','6-(436)599-7073'),(30,'123 NewStreet','New Contry','Sup','1234567');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-22 21:08:52
