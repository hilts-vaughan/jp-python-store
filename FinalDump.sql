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
INSERT INTO `cartitem` VALUES (1,5,41,32);
INSERT INTO `cartitem` VALUES (2,7,11,36);
INSERT INTO `cartitem` VALUES (3,7,37,40);
INSERT INTO `cartitem` VALUES (4,4,38,26);
INSERT INTO `cartitem` VALUES (5,6,38,37);
INSERT INTO `cartitem` VALUES (6,7,30,43);
INSERT INTO `cartitem` VALUES (7,6,8,42);
INSERT INTO `cartitem` VALUES (8,3,42,27);
INSERT INTO `cartitem` VALUES (9,4,48,9);
INSERT INTO `cartitem` VALUES (10,5,39,8);
INSERT INTO `cartitem` VALUES (11,4,16,32);
INSERT INTO `cartitem` VALUES (12,3,38,30);
INSERT INTO `cartitem` VALUES (13,7,9,13);
INSERT INTO `cartitem` VALUES (14,5,11,44);
INSERT INTO `cartitem` VALUES (15,6,42,27);
INSERT INTO `cartitem` VALUES (16,1,15,10);
INSERT INTO `cartitem` VALUES (17,2,29,22);
INSERT INTO `cartitem` VALUES (18,7,33,37);
INSERT INTO `cartitem` VALUES (19,4,10,43);
INSERT INTO `cartitem` VALUES (20,1,21,17);
INSERT INTO `cartitem` VALUES (21,7,36,1);
INSERT INTO `cartitem` VALUES (22,5,1,44);
INSERT INTO `cartitem` VALUES (23,1,29,24);
INSERT INTO `cartitem` VALUES (24,7,12,42);
INSERT INTO `cartitem` VALUES (25,5,40,17);
INSERT INTO `cartitem` VALUES (26,1,38,45);
INSERT INTO `cartitem` VALUES (27,7,1,13);
INSERT INTO `cartitem` VALUES (28,1,1,26);
INSERT INTO `cartitem` VALUES (29,5,7,3);
INSERT INTO `cartitem` VALUES (30,7,1,20);
INSERT INTO `cartitem` VALUES (31,2,16,5);
INSERT INTO `cartitem` VALUES (32,6,27,34);
INSERT INTO `cartitem` VALUES (33,4,49,30);
INSERT INTO `cartitem` VALUES (34,6,22,26);
INSERT INTO `cartitem` VALUES (35,3,19,7);
INSERT INTO `cartitem` VALUES (36,4,17,18);
INSERT INTO `cartitem` VALUES (37,6,25,43);
INSERT INTO `cartitem` VALUES (38,7,15,39);
INSERT INTO `cartitem` VALUES (39,6,18,45);
INSERT INTO `cartitem` VALUES (40,4,14,14);
INSERT INTO `cartitem` VALUES (41,3,23,45);
INSERT INTO `cartitem` VALUES (42,3,3,15);
INSERT INTO `cartitem` VALUES (43,1,39,2);
INSERT INTO `cartitem` VALUES (44,2,28,23);
INSERT INTO `cartitem` VALUES (45,7,43,17);
INSERT INTO `cartitem` VALUES (46,2,4,24);
INSERT INTO `cartitem` VALUES (47,4,6,4);
INSERT INTO `cartitem` VALUES (48,1,43,36);
INSERT INTO `cartitem` VALUES (49,6,23,25);
INSERT INTO `cartitem` VALUES (50,5,17,43);
INSERT INTO `cartitem` VALUES (51,3,52,52);
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
INSERT INTO `category` VALUES (1,'LightNovel','A short book');
INSERT INTO `category` VALUES (2,'Manga','Comic book');
INSERT INTO `category` VALUES (3,'Anime','animation');
INSERT INTO `category` VALUES (4,'T-shirt','A shirt');
INSERT INTO `category` VALUES (5,'Key chain','a keychain');
INSERT INTO `category` VALUES (6,'plushie','stuffed animal');
INSERT INTO `category` VALUES (7,'figurine','Action figure');
INSERT INTO `category` VALUES (8,'Movie','A movie');
INSERT INTO `category` VALUES (9,'Tapastry','wall scroll');
INSERT INTO `category` VALUES (10,'poster','a poster...');
INSERT INTO `category` VALUES (11,'video game','video games');
INSERT INTO `category` VALUES (12,'misc','other uncovered goods');
INSERT INTO `category` VALUES (13,'Food','snack food');
INSERT INTO `category` VALUES (14,'magazine','shonen jump');
INSERT INTO `category` VALUES (15,'manhwa','Korean manga');
INSERT INTO `category` VALUES (16,'Post cards','mailable cards');
INSERT INTO `category` VALUES (17,'Art books','book of art');
INSERT INTO `category` VALUES (18,'wallets','Container for money');
INSERT INTO `category` VALUES (19,'pillows','A pillow');
INSERT INTO `category` VALUES (20,'bedsheets','Bedsheets');
INSERT INTO `category` VALUES (21,'pants','Leg wear');
INSERT INTO `category` VALUES (22,'Cosplay','costumes');
INSERT INTO `category` VALUES (23,'Glass wear','Cups');
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
INSERT INTO `customeraccount` VALUES (1,'Douglas','Gonzalez','895 Towne Trail','7-(064)484-0092');
INSERT INTO `customeraccount` VALUES (2,'Sara','Schmidt','329 Leroy Way','0-(617)468-0102');
INSERT INTO `customeraccount` VALUES (3,'Steven','Roberts','2 Rigney Court','2-(910)735-8811');
INSERT INTO `customeraccount` VALUES (4,'Jason','Oliver','1080 Commercial Junction','6-(762)613-4286');
INSERT INTO `customeraccount` VALUES (5,'Gregory','Dean','41777 Kinsman Crossing','7-(285)761-6389');
INSERT INTO `customeraccount` VALUES (6,'Kevin','Bowman','542 Summerview Center','6-(793)466-4428');
INSERT INTO `customeraccount` VALUES (7,'Dennis','Morris','46878 Evergreen Circle','4-(751)462-1796');
INSERT INTO `customeraccount` VALUES (8,'Larry','Stevens','8 Scofield Terrace','7-(944)692-7640');
INSERT INTO `customeraccount` VALUES (9,'Craig','Fernandez','63 Oxford Park','7-(327)023-1186');
INSERT INTO `customeraccount` VALUES (10,'Rachel','Montgomery','959 3rd Street','0-(356)287-0733');
INSERT INTO `customeraccount` VALUES (11,'Margaret','Collins','0158 Basil Point','4-(078)488-1231');
INSERT INTO `customeraccount` VALUES (12,'Jean','Webb','4917 Mcbride Street','8-(032)858-7046');
INSERT INTO `customeraccount` VALUES (13,'Kimberly','Simpson','6078 High Crossing Junction','9-(999)896-4320');
INSERT INTO `customeraccount` VALUES (14,'Virginia','Wright','9 Daystar Drive','6-(950)715-0007');
INSERT INTO `customeraccount` VALUES (15,'Dorothy','Hughes','5 Onsgard Street','1-(195)465-5362');
INSERT INTO `customeraccount` VALUES (16,'Stephen','Harrison','006 Maple Center','7-(805)034-5475');
INSERT INTO `customeraccount` VALUES (17,'Frank','Watson','872 Village Green Way','4-(480)252-0422');
INSERT INTO `customeraccount` VALUES (18,'Carlos','Grant','262 Valley Edge Drive','2-(535)894-5482');
INSERT INTO `customeraccount` VALUES (19,'Sarah','Day','444 Northridge Crossing','6-(901)230-8451');
INSERT INTO `customeraccount` VALUES (20,'Douglas','Burke','16 Corben Junction','2-(608)291-0338');
INSERT INTO `customeraccount` VALUES (21,'Angela','Anderson','0 Farmco Avenue','7-(334)159-2480');
INSERT INTO `customeraccount` VALUES (22,'Helen','Ford','83727 Menomonie Court','0-(904)554-6019');
INSERT INTO `customeraccount` VALUES (23,'Timothy','Romero','2 Farwell Pass','9-(565)570-8397');
INSERT INTO `customeraccount` VALUES (24,'Jessica','Warren','23236 Miller Alley','5-(582)252-6836');
INSERT INTO `customeraccount` VALUES (25,'Willie','White','75471 Maple Wood Terrace','0-(791)815-3270');
INSERT INTO `customeraccount` VALUES (26,'Philip','Morgan','9 Spohn Court','6-(080)172-6356');
INSERT INTO `customeraccount` VALUES (27,'Vaughan','Zenith','89 Cloud Zero','1-(364)424-2701');
INSERT INTO `customeraccount` VALUES (28,'Juan','Robertson','44 Little Fleur Avenue','5-(713)281-9250');
INSERT INTO `customeraccount` VALUES (29,'Christopher','Reid','1 Tennessee Circle','6-(479)345-8829');
INSERT INTO `customeraccount` VALUES (30,'Shawn','Nichols','0630 Shoshone Drive','5-(132)461-3606');
INSERT INTO `customeraccount` VALUES (31,'Ruth','Olson','97011 4th Avenue','7-(562)853-5795');
INSERT INTO `customeraccount` VALUES (32,'Dennis','Long','84 Pawling Road','6-(598)145-8266');
INSERT INTO `customeraccount` VALUES (33,'Robert','Patterson','85846 Mariners Cove Trail','4-(980)784-3378');
INSERT INTO `customeraccount` VALUES (34,'Antonio','Brooks','85399 Moulton Lane','6-(314)216-6856');
INSERT INTO `customeraccount` VALUES (35,'Martha','Allen','7 La Follette Place','2-(636)855-2186');
INSERT INTO `customeraccount` VALUES (36,'Willie','Rogers','60261 Dexter Plaza','3-(372)116-0238');
INSERT INTO `customeraccount` VALUES (37,'Peter','Hamilton','488 Lindbergh Center','0-(556)359-9582');
INSERT INTO `customeraccount` VALUES (38,'Paul','Bishop','45503 Debs Center','3-(335)407-8573');
INSERT INTO `customeraccount` VALUES (39,'Michael','Wheeler','35 Roxbury Place','1-(932)647-5554');
INSERT INTO `customeraccount` VALUES (40,'Ann','Mason','6 Hazelcrest Crossing','0-(107)442-4056');
INSERT INTO `customeraccount` VALUES (41,'Jessica','Kennedy','5 Stephen Crossing','6-(295)705-7238');
INSERT INTO `customeraccount` VALUES (42,'David','Stewart','95190 Bayside Avenue','5-(073)161-6580');
INSERT INTO `customeraccount` VALUES (43,'Robert','Hall','29980 Ruskin Center','9-(550)676-7850');
INSERT INTO `customeraccount` VALUES (44,'Ralph','Robinson','8 Helena Crossing','7-(200)783-6084');
INSERT INTO `customeraccount` VALUES (45,'Carolyn','Cole','1231 Gulseth Point','7-(725)949-1271');
INSERT INTO `customeraccount` VALUES (46,'Marie','Banks','15524 Dexter Place','2-(719)975-7950');
INSERT INTO `customeraccount` VALUES (47,'Billy','Hudson','14284 Packers Way','3-(395)751-4833');
INSERT INTO `customeraccount` VALUES (48,'Anna','Spencer','7 Knutson Pass','4-(877)165-4416');
INSERT INTO `customeraccount` VALUES (49,'Annie','Arnold','83806 Anderson Avenue','2-(460)188-5118');
INSERT INTO `customeraccount` VALUES (50,'Brandon','Smith','Here','123456789');
INSERT INTO `customeraccount` VALUES (51,'Vaughan','Hilts','HILT2740@mylaurier.ca','(519) 654 2738');
INSERT INTO `customeraccount` VALUES (52,'Vaughan','Hilts','786 Elgin Street','519 654 2738');
INSERT INTO `customeraccount` VALUES (53,'V','V','V','V');
INSERT INTO `customeraccount` VALUES (54,'Bill','Cosby','Here','12345');
INSERT INTO `customeraccount` VALUES (55,'Brandon','Smith','Testing','');
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
INSERT INTO `genre` VALUES ('Action');
INSERT INTO `genre` VALUES ('Adventure');
INSERT INTO `genre` VALUES ('Comedy');
INSERT INTO `genre` VALUES ('Doujinshi');
INSERT INTO `genre` VALUES ('Drama');
INSERT INTO `genre` VALUES ('Ecchi');
INSERT INTO `genre` VALUES ('Fantasy');
INSERT INTO `genre` VALUES ('Gender Bender');
INSERT INTO `genre` VALUES ('Harem');
INSERT INTO `genre` VALUES ('Historical');
INSERT INTO `genre` VALUES ('Horror');
INSERT INTO `genre` VALUES ('Josei');
INSERT INTO `genre` VALUES ('Martial Arts');
INSERT INTO `genre` VALUES ('Mature');
INSERT INTO `genre` VALUES ('Mecha');
INSERT INTO `genre` VALUES ('Mystery');
INSERT INTO `genre` VALUES ('Psychology');
INSERT INTO `genre` VALUES ('Romace');
INSERT INTO `genre` VALUES ('Romance');
INSERT INTO `genre` VALUES ('School Life');
INSERT INTO `genre` VALUES ('Sci-fi');
INSERT INTO `genre` VALUES ('Seinen');
INSERT INTO `genre` VALUES ('Shotacon');
INSERT INTO `genre` VALUES ('Shoujo');
INSERT INTO `genre` VALUES ('Shoujo Ai');
INSERT INTO `genre` VALUES ('Shounen');
INSERT INTO `genre` VALUES ('Shounen Ai');
INSERT INTO `genre` VALUES ('Slice of Life');
INSERT INTO `genre` VALUES ('Supernatural');
INSERT INTO `genre` VALUES ('Tragedy');
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
INSERT INTO `order` VALUES (1,'84456 Karstens Lane','2/24/2015','9/27/2014',NULL,37);
INSERT INTO `order` VALUES (2,'62710 Service Place','12/7/2014','1/4/2015',NULL,23);
INSERT INTO `order` VALUES (3,'7 Sutteridge Junction','7/16/2014','9/23/2014',NULL,49);
INSERT INTO `order` VALUES (4,'877 Granby Terrace','2/7/2015','5/24/2014',NULL,25);
INSERT INTO `order` VALUES (5,'005 Eagan Point','7/13/2014','1/13/2015',NULL,18);
INSERT INTO `order` VALUES (6,'2 Darwin Parkway','10/9/2014','11/4/2014',NULL,26);
INSERT INTO `order` VALUES (7,'952 Iowa Circle','11/17/2014','7/22/2014','3/15/2014',49);
INSERT INTO `order` VALUES (8,'46050 South Trail','5/9/2014','10/27/2014',NULL,7);
INSERT INTO `order` VALUES (9,'45870 Carey Court','5/19/2014','1/13/2015','11/21/2014',32);
INSERT INTO `order` VALUES (10,'2966 Arapahoe Drive','11/9/2014','3/29/2014',NULL,21);
INSERT INTO `order` VALUES (11,'495 Lotheville Court','3/25/2014','6/26/2014',NULL,38);
INSERT INTO `order` VALUES (12,'84 Morningstar Court','8/25/2014','5/23/2014',NULL,31);
INSERT INTO `order` VALUES (13,'013 Goodland Center','4/27/2014','9/7/2014',NULL,3);
INSERT INTO `order` VALUES (14,'64122 Starling Trail','10/10/2014','9/23/2014','2/14/2015',13);
INSERT INTO `order` VALUES (15,'0267 Westridge Road','8/18/2014','12/5/2014',NULL,41);
INSERT INTO `order` VALUES (16,'6812 Grover Parkway','2/12/2015','8/27/2014','10/8/2014',19);
INSERT INTO `order` VALUES (17,'5 Londonderry Point','5/24/2014','11/29/2014','3/22/2014',20);
INSERT INTO `order` VALUES (18,'79378 Dovetail Place','5/22/2014','5/13/2014',NULL,15);
INSERT INTO `order` VALUES (19,'09325 Meadow Valley Lane','10/19/2014','10/26/2014',NULL,19);
INSERT INTO `order` VALUES (20,'08329 Chive Junction','11/5/2014','3/11/2014',NULL,30);
INSERT INTO `order` VALUES (21,'96599 Nevada Junction','9/28/2014','8/24/2014','7/18/2014',46);
INSERT INTO `order` VALUES (22,'1 Holmberg Center','6/9/2014','4/17/2014',NULL,35);
INSERT INTO `order` VALUES (23,'880 Golf Course Point','4/3/2014','3/2/2015',NULL,7);
INSERT INTO `order` VALUES (24,'41737 Calypso Junction','10/27/2014','6/15/2014','12/27/2014',16);
INSERT INTO `order` VALUES (25,'415 Straubel Circle','6/7/2014','3/4/2015',NULL,27);
INSERT INTO `order` VALUES (26,'7 Jenna Avenue','6/19/2014','9/22/2014','6/14/2014',2);
INSERT INTO `order` VALUES (27,'371 Petterle Junction','12/5/2014','6/1/2014',NULL,35);
INSERT INTO `order` VALUES (28,'798 Badeau Lane','12/11/2014','4/18/2014','11/2/2014',20);
INSERT INTO `order` VALUES (29,'372 Duke Place','8/6/2014','10/11/2014',NULL,15);
INSERT INTO `order` VALUES (30,'8824 Arizona Lane','1/25/2015','11/1/2014',NULL,1);
INSERT INTO `order` VALUES (31,'61291 Fallview Way','11/26/2014','1/24/2015',NULL,49);
INSERT INTO `order` VALUES (32,'77 Arapahoe Street','12/4/2014','1/9/2015',NULL,20);
INSERT INTO `order` VALUES (33,'3939 Schmedeman Center','11/7/2014','3/4/2015','9/18/2014',13);
INSERT INTO `order` VALUES (34,'7333 Duke Avenue','6/5/2014','12/15/2014',NULL,35);
INSERT INTO `order` VALUES (35,'7 Sundown Hill','2/21/2015','9/26/2014',NULL,7);
INSERT INTO `order` VALUES (36,'09563 Straubel Drive','2/7/2015','11/22/2014','10/10/2014',8);
INSERT INTO `order` VALUES (37,'05 Ruskin Trail','10/30/2014','2/10/2015','8/18/2014',3);
INSERT INTO `order` VALUES (38,'119 Annamark Road','8/7/2014','3/3/2015','6/20/2014',12);
INSERT INTO `order` VALUES (39,'625 Logan Plaza','8/6/2014','2/15/2015',NULL,48);
INSERT INTO `order` VALUES (40,'77622 Norway Maple Terrace','5/23/2014','1/26/2015',NULL,41);
INSERT INTO `order` VALUES (41,'228 Autumn Leaf Court','12/16/2014','1/16/2015','3/11/2014',15);
INSERT INTO `order` VALUES (42,'7 Kim Trail','9/26/2014','1/1/2015',NULL,50);
INSERT INTO `order` VALUES (43,'271 Maple Way','6/15/2014','2/5/2015',NULL,4);
INSERT INTO `order` VALUES (44,'8 Tennyson Street','6/22/2014','10/6/2014',NULL,36);
INSERT INTO `order` VALUES (45,'425 Anzinger Avenue','11/18/2014','6/9/2014','4/24/2014',7);
INSERT INTO `order` VALUES (46,'99 Welch Parkway','8/23/2014','11/29/2014','1/17/2015',6);
INSERT INTO `order` VALUES (47,'70151 Columbus Plaza','6/10/2014','5/2/2014',NULL,33);
INSERT INTO `order` VALUES (48,'1209 American Ash Center','9/16/2014','12/15/2014',NULL,12);
INSERT INTO `order` VALUES (49,'52938 Hallows Alley','3/7/2014','12/29/2014',NULL,48);
INSERT INTO `order` VALUES (50,'93 Melrose Lane','12/8/2014','10/22/2014',NULL,18);
INSERT INTO `order` VALUES (51,'79 Cottonwood Way','1/26/2015','3/10/2014','11/11/2014',38);
INSERT INTO `order` VALUES (52,'1 Michigan Place','1/8/2015','2/23/2015','2/22/2015',7);
INSERT INTO `order` VALUES (53,'09233 Calypso Junction','3/26/2014','12/27/2014','1/18/2015',36);
INSERT INTO `order` VALUES (54,'435 Spenser Park','8/9/2014','3/2/2015',NULL,21);
INSERT INTO `order` VALUES (55,'96106 Transport Junction','12/25/2014','6/10/2014',NULL,21);
INSERT INTO `order` VALUES (56,'1928 Artisan Center','11/29/2014','1/8/2015',NULL,49);
INSERT INTO `order` VALUES (57,'9 Fisk Plaza','6/11/2014','9/26/2014',NULL,48);
INSERT INTO `order` VALUES (58,'649 Marquette Court','11/20/2014','7/23/2014',NULL,48);
INSERT INTO `order` VALUES (59,'3 Northridge Circle','2/9/2015','6/13/2014',NULL,17);
INSERT INTO `order` VALUES (60,'7142 Kingsford Alley','2/16/2015','5/26/2014','1/7/2015',1);
INSERT INTO `order` VALUES (61,'1 Norway Maple Hill','10/2/2014','6/3/2014','3/16/2014',44);
INSERT INTO `order` VALUES (62,'05 Steensland Avenue','7/26/2014','10/1/2014',NULL,15);
INSERT INTO `order` VALUES (63,'2839 Rigney Terrace','6/13/2014','9/28/2014',NULL,28);
INSERT INTO `order` VALUES (64,'1637 Clarendon Crossing','1/10/2015','3/10/2014','9/8/2014',49);
INSERT INTO `order` VALUES (65,'788 7th Point','3/26/2014','3/19/2014',NULL,49);
INSERT INTO `order` VALUES (66,'760 Amoth Center','2/24/2015','6/9/2014',NULL,7);
INSERT INTO `order` VALUES (67,'497 Ridge Oak Park','12/12/2014','2/17/2015',NULL,3);
INSERT INTO `order` VALUES (68,'34835 Veith Circle','6/22/2014','3/4/2015',NULL,21);
INSERT INTO `order` VALUES (69,'1258 Farragut Junction','7/26/2014','4/25/2014',NULL,35);
INSERT INTO `order` VALUES (70,'93892 Kings Terrace','2/17/2015','8/17/2014',NULL,5);
INSERT INTO `order` VALUES (71,'1539 Loomis Drive','4/11/2014','1/30/2015','8/26/2014',49);
INSERT INTO `order` VALUES (72,'90 3rd Avenue','9/1/2014','11/9/2014',NULL,26);
INSERT INTO `order` VALUES (73,'0336 Pond Center','5/13/2014','1/19/2015','1/24/2015',22);
INSERT INTO `order` VALUES (74,'7383 Michigan Pass','1/20/2015','4/1/2014',NULL,14);
INSERT INTO `order` VALUES (75,'8 Tomscot Crossing','11/12/2014','12/18/2014','4/8/2014',25);
INSERT INTO `order` VALUES (76,'3095 Gateway Hill','2/28/2014','10/16/2014',NULL,45);
INSERT INTO `order` VALUES (77,'86632 Gale Crossing','7/22/2014','10/17/2014',NULL,17);
INSERT INTO `order` VALUES (78,'5489 Warbler Lane','5/5/2014','10/19/2014','5/25/2014',3);
INSERT INTO `order` VALUES (79,'9996 Acker Center','2/19/2015','4/1/2014',NULL,24);
INSERT INTO `order` VALUES (80,'6579 Lukken Parkway','6/29/2014','7/8/2014',NULL,10);
INSERT INTO `order` VALUES (81,'5759 Veith Lane','11/10/2014','6/2/2014',NULL,21);
INSERT INTO `order` VALUES (82,'1952 Amoth Parkway','12/9/2014','11/28/2014',NULL,16);
INSERT INTO `order` VALUES (83,'0907 Saint Paul Lane','5/1/2014','11/6/2014',NULL,50);
INSERT INTO `order` VALUES (84,'866 Mcguire Avenue','2/12/2015','11/16/2014',NULL,42);
INSERT INTO `order` VALUES (85,'64766 Canary Court','7/2/2014','11/12/2014',NULL,17);
INSERT INTO `order` VALUES (86,'448 Warbler Pass','8/4/2014','2/1/2015',NULL,39);
INSERT INTO `order` VALUES (87,'76197 Red Cloud Junction','9/13/2014','9/23/2014',NULL,4);
INSERT INTO `order` VALUES (88,'1 Bartelt Center','8/4/2014','10/6/2014',NULL,41);
INSERT INTO `order` VALUES (89,'640 Mallory Way','10/31/2014','7/1/2014',NULL,2);
INSERT INTO `order` VALUES (90,'49484 Steensland Avenue','8/25/2014','4/22/2014','4/9/2014',50);
INSERT INTO `order` VALUES (91,'861 Sachs Avenue','9/5/2014','11/14/2014','8/7/2014',32);
INSERT INTO `order` VALUES (92,'1553 Maywood Junction','11/7/2014','3/29/2014',NULL,31);
INSERT INTO `order` VALUES (93,'85610 Golden Leaf Road','6/18/2014','5/22/2014',NULL,15);
INSERT INTO `order` VALUES (94,'307 Blue Bill Park Trail','1/28/2015','2/10/2015',NULL,45);
INSERT INTO `order` VALUES (95,'704 Stang Way','7/21/2014','1/10/2015','2/2/2015',27);
INSERT INTO `order` VALUES (96,'25 Melvin Plaza','11/17/2014','9/28/2014',NULL,37);
INSERT INTO `order` VALUES (97,'427 Dennis Center','4/3/2014','4/18/2014',NULL,36);
INSERT INTO `order` VALUES (98,'84487 Ramsey Pass','4/2/2014','9/21/2014',NULL,38);
INSERT INTO `order` VALUES (99,'582 Stoughton Lane','6/27/2014','12/6/2014',NULL,4);
INSERT INTO `order` VALUES (100,'270 Arrowood Alley','7/27/2014','8/3/2014',NULL,5);
INSERT INTO `order` VALUES (101,'2331 Village Park','1/13/2015','9/27/2014','6/23/2014',32);
INSERT INTO `order` VALUES (102,'698 Ludington Lane','12/4/2014','7/19/2014','9/14/2014',3);
INSERT INTO `order` VALUES (103,'8 Charing Cross Park','4/10/2014','5/22/2014','11/20/2014',48);
INSERT INTO `order` VALUES (104,'7 Arkansas Lane','5/23/2014','3/25/2014',NULL,20);
INSERT INTO `order` VALUES (105,'03047 Golf View Terrace','1/25/2015','8/26/2014',NULL,26);
INSERT INTO `order` VALUES (106,'045 Bluestem Circle','1/31/2015','2/15/2015',NULL,8);
INSERT INTO `order` VALUES (107,'850 4th Junction','5/11/2014','1/20/2015',NULL,27);
INSERT INTO `order` VALUES (108,'786 Elgin Street','21/03/2015','0','0',52);
INSERT INTO `order` VALUES (109,'786 Elgin Street','21/03/2015','0','0',52);
INSERT INTO `order` VALUES (110,'Here','21/03/2015','0','0',50);
INSERT INTO `order` VALUES (111,'Here','21/03/2015','0','0',50);
INSERT INTO `order` VALUES (112,'786 Elgin Street','22/03/2015','0','0',52);
INSERT INTO `order` VALUES (113,'786 Elgin Street','22/03/2015','0','0',52);
INSERT INTO `order` VALUES (114,'There','22/03/2015','0','0',54);
INSERT INTO `order` VALUES (115,'There','22/03/2015','0','0',54);
INSERT INTO `order` VALUES (116,'There','22/03/2015','0','0',54);
INSERT INTO `order` VALUES (117,'Somewhere','22/03/2015','0','0',54);
INSERT INTO `order` VALUES (118,'Somewhere','22/03/2015','0','0',54);
INSERT INTO `order` VALUES (119,'Here','22/03/2015','0','0',54);
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
INSERT INTO `orderitem` VALUES (1,4,40,1);
INSERT INTO `orderitem` VALUES (2,3,50,2);
INSERT INTO `orderitem` VALUES (3,1,43,3);
INSERT INTO `orderitem` VALUES (4,3,5,4);
INSERT INTO `orderitem` VALUES (5,3,43,5);
INSERT INTO `orderitem` VALUES (6,3,38,6);
INSERT INTO `orderitem` VALUES (7,1,13,7);
INSERT INTO `orderitem` VALUES (8,4,33,8);
INSERT INTO `orderitem` VALUES (9,3,36,9);
INSERT INTO `orderitem` VALUES (10,4,3,10);
INSERT INTO `orderitem` VALUES (11,2,45,11);
INSERT INTO `orderitem` VALUES (12,1,10,12);
INSERT INTO `orderitem` VALUES (13,2,10,13);
INSERT INTO `orderitem` VALUES (14,3,50,14);
INSERT INTO `orderitem` VALUES (15,4,18,15);
INSERT INTO `orderitem` VALUES (16,1,30,16);
INSERT INTO `orderitem` VALUES (17,3,12,17);
INSERT INTO `orderitem` VALUES (18,1,6,18);
INSERT INTO `orderitem` VALUES (19,4,47,19);
INSERT INTO `orderitem` VALUES (20,4,13,20);
INSERT INTO `orderitem` VALUES (21,4,8,21);
INSERT INTO `orderitem` VALUES (22,3,39,22);
INSERT INTO `orderitem` VALUES (23,4,11,23);
INSERT INTO `orderitem` VALUES (24,4,33,24);
INSERT INTO `orderitem` VALUES (25,3,7,25);
INSERT INTO `orderitem` VALUES (26,2,28,26);
INSERT INTO `orderitem` VALUES (27,2,29,27);
INSERT INTO `orderitem` VALUES (28,2,32,28);
INSERT INTO `orderitem` VALUES (29,1,1,29);
INSERT INTO `orderitem` VALUES (30,1,1,30);
INSERT INTO `orderitem` VALUES (31,4,42,31);
INSERT INTO `orderitem` VALUES (32,3,17,32);
INSERT INTO `orderitem` VALUES (33,1,29,33);
INSERT INTO `orderitem` VALUES (34,1,42,34);
INSERT INTO `orderitem` VALUES (35,3,19,35);
INSERT INTO `orderitem` VALUES (36,1,2,36);
INSERT INTO `orderitem` VALUES (37,2,26,37);
INSERT INTO `orderitem` VALUES (38,3,7,38);
INSERT INTO `orderitem` VALUES (39,3,48,39);
INSERT INTO `orderitem` VALUES (40,4,45,40);
INSERT INTO `orderitem` VALUES (41,3,21,41);
INSERT INTO `orderitem` VALUES (42,4,5,42);
INSERT INTO `orderitem` VALUES (43,2,40,43);
INSERT INTO `orderitem` VALUES (44,4,13,44);
INSERT INTO `orderitem` VALUES (45,3,30,45);
INSERT INTO `orderitem` VALUES (46,1,27,46);
INSERT INTO `orderitem` VALUES (47,3,45,47);
INSERT INTO `orderitem` VALUES (48,3,6,48);
INSERT INTO `orderitem` VALUES (49,4,40,49);
INSERT INTO `orderitem` VALUES (50,3,5,50);
INSERT INTO `orderitem` VALUES (51,2,10,51);
INSERT INTO `orderitem` VALUES (52,2,9,52);
INSERT INTO `orderitem` VALUES (53,1,8,53);
INSERT INTO `orderitem` VALUES (54,2,49,54);
INSERT INTO `orderitem` VALUES (55,2,46,55);
INSERT INTO `orderitem` VALUES (56,2,32,56);
INSERT INTO `orderitem` VALUES (57,4,6,57);
INSERT INTO `orderitem` VALUES (58,1,17,58);
INSERT INTO `orderitem` VALUES (59,3,40,59);
INSERT INTO `orderitem` VALUES (60,4,15,60);
INSERT INTO `orderitem` VALUES (61,3,1,61);
INSERT INTO `orderitem` VALUES (62,1,30,62);
INSERT INTO `orderitem` VALUES (63,1,22,63);
INSERT INTO `orderitem` VALUES (64,4,44,64);
INSERT INTO `orderitem` VALUES (65,2,8,65);
INSERT INTO `orderitem` VALUES (66,4,6,66);
INSERT INTO `orderitem` VALUES (67,3,45,67);
INSERT INTO `orderitem` VALUES (68,2,47,68);
INSERT INTO `orderitem` VALUES (69,4,50,69);
INSERT INTO `orderitem` VALUES (70,3,18,70);
INSERT INTO `orderitem` VALUES (71,1,42,71);
INSERT INTO `orderitem` VALUES (72,1,50,72);
INSERT INTO `orderitem` VALUES (73,2,17,73);
INSERT INTO `orderitem` VALUES (74,3,21,74);
INSERT INTO `orderitem` VALUES (75,1,5,75);
INSERT INTO `orderitem` VALUES (76,4,43,76);
INSERT INTO `orderitem` VALUES (77,2,31,77);
INSERT INTO `orderitem` VALUES (78,1,12,78);
INSERT INTO `orderitem` VALUES (79,4,48,79);
INSERT INTO `orderitem` VALUES (80,1,48,80);
INSERT INTO `orderitem` VALUES (81,2,7,81);
INSERT INTO `orderitem` VALUES (82,4,2,82);
INSERT INTO `orderitem` VALUES (83,4,41,83);
INSERT INTO `orderitem` VALUES (84,4,50,84);
INSERT INTO `orderitem` VALUES (85,2,47,85);
INSERT INTO `orderitem` VALUES (86,1,5,86);
INSERT INTO `orderitem` VALUES (87,1,47,87);
INSERT INTO `orderitem` VALUES (88,4,30,88);
INSERT INTO `orderitem` VALUES (89,1,24,89);
INSERT INTO `orderitem` VALUES (90,1,21,90);
INSERT INTO `orderitem` VALUES (91,4,26,91);
INSERT INTO `orderitem` VALUES (92,3,18,92);
INSERT INTO `orderitem` VALUES (93,4,14,93);
INSERT INTO `orderitem` VALUES (94,4,42,94);
INSERT INTO `orderitem` VALUES (95,2,35,95);
INSERT INTO `orderitem` VALUES (96,4,9,96);
INSERT INTO `orderitem` VALUES (97,3,26,97);
INSERT INTO `orderitem` VALUES (98,4,26,98);
INSERT INTO `orderitem` VALUES (99,4,11,99);
INSERT INTO `orderitem` VALUES (100,1,26,100);
INSERT INTO `orderitem` VALUES (101,4,5,101);
INSERT INTO `orderitem` VALUES (102,1,34,102);
INSERT INTO `orderitem` VALUES (103,2,2,103);
INSERT INTO `orderitem` VALUES (104,2,41,104);
INSERT INTO `orderitem` VALUES (105,1,4,105);
INSERT INTO `orderitem` VALUES (106,4,26,106);
INSERT INTO `orderitem` VALUES (107,4,43,107);
INSERT INTO `orderitem` VALUES (108,12,43,107);
INSERT INTO `orderitem` VALUES (109,3,52,109);
INSERT INTO `orderitem` VALUES (110,3,50,111);
INSERT INTO `orderitem` VALUES (111,3,52,113);
INSERT INTO `orderitem` VALUES (112,2,53,114);
INSERT INTO `orderitem` VALUES (113,2,53,116);
INSERT INTO `orderitem` VALUES (114,2,50,117);
INSERT INTO `orderitem` VALUES (115,3,51,118);
INSERT INTO `orderitem` VALUES (116,4,48,118);
INSERT INTO `orderitem` VALUES (117,2,55,119);
INSERT INTO `orderitem` VALUES (118,3,50,119);
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
INSERT INTO `product` VALUES (1,6,'Sailor Moon Blu-ray/DVD Set 1 (Hyb) Limited Edition','Contains episodes 1-23 plus an 88-page',94,13,3);
INSERT INTO `product` VALUES (2,82,'Dragon Ball Z Figurine Capsule Set (7 figures): Series 3','Each box contains seven capsules with one of eight possible figures inside.',58,13,3);
INSERT INTO `product` VALUES (3,51,'Spice and Wolf Graphic Novel 1','Kraft Lawrence has been walking the lonely path of the itinerant merchant for seven years. His life changes forever when he meets Holo',103,15,3);
INSERT INTO `product` VALUES (4,42,'Spice and Wolf Graphic Novel 2','Kraft Lawrence has been walking the lonely path of the itinerant merchant for seven years. His life changes forever when he meets Holo',101,2,3);
INSERT INTO `product` VALUES (5,41,'Spice and Wolf Graphic Novel 3','Kraft Lawrence has been walking the lonely path of the itinerant merchant for seven years. His life changes forever when he meets Holo',149,6,3);
INSERT INTO `product` VALUES (6,88,'Spice and Wolf Graphic Novel 4','Kraft Lawrence has been walking the lonely path of the itinerant merchant for seven years. His life changes forever when he meets Holo',72,17,5);
INSERT INTO `product` VALUES (7,70,'Spice and Wolf Graphic Novel 5','Kraft Lawrence has been walking the lonely path of the itinerant merchant for seven years. His life changes forever when he meets Holo',74,19,5);
INSERT INTO `product` VALUES (8,49,'Japanese T-Shirt - I Would Die for Haruhi - Blue - S','A T-Shirt',173,1,5);
INSERT INTO `product` VALUES (9,0,'Certain Magical Index',' A Novel 1',62,1,7);
INSERT INTO `product` VALUES (10,71,'Accel World Cup with Lid: Kuroyukihime','Note: Not dishwasher or microwave safe.',112,12,4);
INSERT INTO `product` VALUES (11,93,'Nisekoi: False Love Graphic Novel 9','Raku\'s crush',175,12,4);
INSERT INTO `product` VALUES (12,86,'Outbreak Company Blu-ray Complete Collection (Hyb)','Contains episodes 1-12',139,4,2);
INSERT INTO `product` VALUES (13,21,'Spirited Away: Art of Spirited Away Artbook','Collects the color illustrations of Spirited Away (Sen to Chihiro no Kamikakushi) for the first time in an English edition! Includes paintings and designs from the new animated film from the director of Kiki\'s Delivery Service and Princess Mononoke.',6,12,2);
INSERT INTO `product` VALUES (14,87,'Spirited Away DVD (Hyb)','From Hayao Miyazaki (Princess Mononoke',117,5,9);
INSERT INTO `product` VALUES (15,1,'Bleach Armband: Squad Five','Cosplay',21,6,8);
INSERT INTO `product` VALUES (16,27,'Bleach Armband: Squad Four','Cosplay',131,7,7);
INSERT INTO `product` VALUES (17,88,'Bleach Armband: Squad One','Cosplay',68,1,6);
INSERT INTO `product` VALUES (18,1,'Blue Exorcist Pin: Academy Instructor\'s Badge','Cosplay',61,3,5);
INSERT INTO `product` VALUES (19,72,'Dragon Ball Z Costume: Trunk\'s Jacket - L','Cosplay',24,4,1);
INSERT INTO `product` VALUES (20,14,'.hack//Roots DVD 3 (Hyb)','DVD Features: Japanese DVD Release Announcement',77,5,4);
INSERT INTO `product` VALUES (21,47,'Persona 3 The Movie 2: Midsummer Knight\'s Dream Blu-ray (S) (Import) Collector\'s','Special Features: Audio Commentary',22,1,3);
INSERT INTO `product` VALUES (22,49,'Sword Art Online Girl\'s Fitted T-Shirt: Asuna - M','',121,2,3);
INSERT INTO `product` VALUES (23,50,'LiSA CD: crossing field (Import) + DVD Limited Edition','12 tracks',161,3,4);
INSERT INTO `product` VALUES (24,52,'Fate/Zero Poster','31 x 43 in',29,4,5);
INSERT INTO `product` VALUES (25,73,'Fate/Stay Night Poster','31 x 43 in',137,5,5);
INSERT INTO `product` VALUES (26,0,'Sword Art Online Poster','31 x 43 in',91,6,8);
INSERT INTO `product` VALUES (27,93,'Certain Magical Index',' A the Movie: Miracle of Endymion DVD/Blu-ray (Hyb)',175,1,7);
INSERT INTO `product` VALUES (28,20,'Howl\'s Moving Castle DVD (Hyb)','Spoken Languages: English',21,6,6);
INSERT INTO `product` VALUES (29,93,'One Piece Postcard Set: New World (4 Postcards)','N/A',139,12,5);
INSERT INTO `product` VALUES (30,48,'Bleach Postcard Set (4 Postcards)','N/A',58,17,4);
INSERT INTO `product` VALUES (31,81,'Bleach Plush: Ulquiorra (8 in)','N/A',132,18,2);
INSERT INTO `product` VALUES (32,84,'Accel World Blu-ray Set 1 (Hyb)','Special Features: Character Art Gallery',54,20,2);
INSERT INTO `product` VALUES (33,55,'Accel World Blu-ray Set 2 (Hyb)','Special Features: Character Art Gallery',174,4,1);
INSERT INTO `product` VALUES (34,73,'Bakemonogatari Blu-ray Complete Set (S) Limited Edition','Spoken Languages: Japanese',177,5,1);
INSERT INTO `product` VALUES (35,56,'Eden of the East Pillow: Noblesse Oblige','Special Features: Air Communication Prequel Movie (TV Series Summary)',104,1,1);
INSERT INTO `product` VALUES (36,44,'Eden of the East Fabric Poster: Carousel','Special Features: Air Communication Prequel Movie (TV Series Summary)',164,2,8);
INSERT INTO `product` VALUES (37,52,'Eden of the East Movie 1: King of Eden DVD/Blu-ray (Hyb)','Special Features: Air Communication Prequel Movie (TV Series Summary)',146,3,8);
INSERT INTO `product` VALUES (38,11,'Eden of the East Movie 2: Paradise Lost DVD/Blu-ray (Hyb)','Special Features: Air Communication Prequel Movie (TV Series Summary)',37,5,8);
INSERT INTO `product` VALUES (39,42,'Eden of the East DVD Complete Series (Hyb) - Anime Classics','Special Features: Air Communication Prequel Movie (TV Series Summary)',165,3,8);
INSERT INTO `product` VALUES (40,73,'Tales of Xillia','A Tales of video game RPG (PS3)',104,7,7);
INSERT INTO `product` VALUES (41,83,'Tales of Xillia 2','A Tales of video game RPG (PS3)',112,2,6);
INSERT INTO `product` VALUES (42,95,'Sword Art Online - Infinity Moment','A game based on the popular VRMMO anime and light novel for the PSP system',137,6,5);
INSERT INTO `product` VALUES (43,68,'Sword Art Online - Hollow Fragment','A game based on the popular VRMMO anime and light novel for the PS Vita system',94,7,3);
INSERT INTO `product` VALUES (44,52,'Garden of Words',' The Blu-ray (Hyb)',98,5,3);
INSERT INTO `product` VALUES (45,11,'Garden of Words',' The Graphic Novel',45,7,4);
INSERT INTO `product` VALUES (46,15,'Aldnoah.Zero CD: Original Soundtrack (Import)','N/A',127,8,4);
INSERT INTO `product` VALUES (47,28,'Noblesse Volume 1','Noblesse is about a powerful noble awakening from his slumber after many',78,4,4);
INSERT INTO `product` VALUES (48,75,'Noblesse Volume 1','Noblesse is about a powerful noble awakening from his slumber after many',89,4,6);
INSERT INTO `product` VALUES (49,62,'PSYCHO-PASS Plush: Akane (8 in)','N/A',102,3,5);
INSERT INTO `product` VALUES (50,50,'Sword Art Online Keychain','N/A',88,3,4);
INSERT INTO `product` VALUES (51,50,'Setsuna','Setsuna',50,6,16);
INSERT INTO `product` VALUES (52,100,'White Album 2 (CD)','A beautiful arrangement of the White Album collection',120,12,14);
INSERT INTO `product` VALUES (53,2,'NewName','Now with more New',5001,19,12);
INSERT INTO `product` VALUES (54,3,'Good','A good thing',100,21,12);
INSERT INTO `product` VALUES (55,4,'Bye','Exit',18,23,18);
INSERT INTO `product` VALUES (56,5,'Proof','End',15,23,20);
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
INSERT INTO `product_has_genre` VALUES (2,'Adventure');
INSERT INTO `product_has_genre` VALUES (3,'Action');
INSERT INTO `product_has_genre` VALUES (3,'Seinen');
INSERT INTO `product_has_genre` VALUES (4,'Romance');
INSERT INTO `product_has_genre` VALUES (5,'Comedy');
INSERT INTO `product_has_genre` VALUES (5,'Romance');
INSERT INTO `product_has_genre` VALUES (6,'Comedy');
INSERT INTO `product_has_genre` VALUES (9,'Romance');
INSERT INTO `product_has_genre` VALUES (11,'Comedy');
INSERT INTO `product_has_genre` VALUES (11,'Romance');
INSERT INTO `product_has_genre` VALUES (12,'Comedy');
INSERT INTO `product_has_genre` VALUES (12,'Drama');
INSERT INTO `product_has_genre` VALUES (12,'Seinen');
INSERT INTO `product_has_genre` VALUES (13,'Comedy');
INSERT INTO `product_has_genre` VALUES (13,'Drama');
INSERT INTO `product_has_genre` VALUES (13,'Romance');
INSERT INTO `product_has_genre` VALUES (14,'Drama');
INSERT INTO `product_has_genre` VALUES (14,'Historical');
INSERT INTO `product_has_genre` VALUES (14,'Romance');
INSERT INTO `product_has_genre` VALUES (15,'Drama');
INSERT INTO `product_has_genre` VALUES (15,'Romance');
INSERT INTO `product_has_genre` VALUES (16,'Romance');
INSERT INTO `product_has_genre` VALUES (18,'Action');
INSERT INTO `product_has_genre` VALUES (18,'Comedy');
INSERT INTO `product_has_genre` VALUES (20,'Action');
INSERT INTO `product_has_genre` VALUES (20,'Josei');
INSERT INTO `product_has_genre` VALUES (20,'Romance');
INSERT INTO `product_has_genre` VALUES (29,'Horror');
INSERT INTO `product_has_genre` VALUES (30,'Action');
INSERT INTO `product_has_genre` VALUES (30,'Adventure');
INSERT INTO `product_has_genre` VALUES (30,'Josei');
INSERT INTO `product_has_genre` VALUES (32,'Adventure');
INSERT INTO `product_has_genre` VALUES (32,'Romance');
INSERT INTO `product_has_genre` VALUES (33,'Romance');
INSERT INTO `product_has_genre` VALUES (34,'Adventure');
INSERT INTO `product_has_genre` VALUES (34,'Fantasy');
INSERT INTO `product_has_genre` VALUES (35,'Seinen');
INSERT INTO `product_has_genre` VALUES (36,'Comedy');
INSERT INTO `product_has_genre` VALUES (36,'Historical');
INSERT INTO `product_has_genre` VALUES (36,'Mystery');
INSERT INTO `product_has_genre` VALUES (37,'Action');
INSERT INTO `product_has_genre` VALUES (37,'Horror');
INSERT INTO `product_has_genre` VALUES (38,'Fantasy');
INSERT INTO `product_has_genre` VALUES (38,'Horror');
INSERT INTO `product_has_genre` VALUES (38,'Mystery');
INSERT INTO `product_has_genre` VALUES (39,'Fantasy');
INSERT INTO `product_has_genre` VALUES (39,'Romance');
INSERT INTO `product_has_genre` VALUES (40,'Drama');
INSERT INTO `product_has_genre` VALUES (40,'Tragedy');
INSERT INTO `product_has_genre` VALUES (44,'Fantasy');
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
INSERT INTO `product_has_supplier` VALUES (16,1);
INSERT INTO `product_has_supplier` VALUES (42,1);
INSERT INTO `product_has_supplier` VALUES (4,4);
INSERT INTO `product_has_supplier` VALUES (9,4);
INSERT INTO `product_has_supplier` VALUES (45,4);
INSERT INTO `product_has_supplier` VALUES (12,5);
INSERT INTO `product_has_supplier` VALUES (14,5);
INSERT INTO `product_has_supplier` VALUES (21,5);
INSERT INTO `product_has_supplier` VALUES (6,6);
INSERT INTO `product_has_supplier` VALUES (24,6);
INSERT INTO `product_has_supplier` VALUES (10,7);
INSERT INTO `product_has_supplier` VALUES (31,7);
INSERT INTO `product_has_supplier` VALUES (37,7);
INSERT INTO `product_has_supplier` VALUES (15,8);
INSERT INTO `product_has_supplier` VALUES (35,8);
INSERT INTO `product_has_supplier` VALUES (36,8);
INSERT INTO `product_has_supplier` VALUES (11,9);
INSERT INTO `product_has_supplier` VALUES (19,9);
INSERT INTO `product_has_supplier` VALUES (38,9);
INSERT INTO `product_has_supplier` VALUES (13,10);
INSERT INTO `product_has_supplier` VALUES (25,11);
INSERT INTO `product_has_supplier` VALUES (34,11);
INSERT INTO `product_has_supplier` VALUES (5,12);
INSERT INTO `product_has_supplier` VALUES (1,13);
INSERT INTO `product_has_supplier` VALUES (7,13);
INSERT INTO `product_has_supplier` VALUES (27,13);
INSERT INTO `product_has_supplier` VALUES (48,14);
INSERT INTO `product_has_supplier` VALUES (47,15);
INSERT INTO `product_has_supplier` VALUES (49,15);
INSERT INTO `product_has_supplier` VALUES (2,16);
INSERT INTO `product_has_supplier` VALUES (28,16);
INSERT INTO `product_has_supplier` VALUES (18,17);
INSERT INTO `product_has_supplier` VALUES (23,17);
INSERT INTO `product_has_supplier` VALUES (41,17);
INSERT INTO `product_has_supplier` VALUES (3,18);
INSERT INTO `product_has_supplier` VALUES (44,19);
INSERT INTO `product_has_supplier` VALUES (46,19);
INSERT INTO `product_has_supplier` VALUES (40,20);
INSERT INTO `product_has_supplier` VALUES (50,21);
INSERT INTO `product_has_supplier` VALUES (33,22);
INSERT INTO `product_has_supplier` VALUES (26,23);
INSERT INTO `product_has_supplier` VALUES (8,24);
INSERT INTO `product_has_supplier` VALUES (22,25);
INSERT INTO `product_has_supplier` VALUES (30,28);
INSERT INTO `product_has_supplier` VALUES (20,29);
INSERT INTO `product_has_supplier` VALUES (17,30);
INSERT INTO `product_has_supplier` VALUES (29,30);
INSERT INTO `product_has_supplier` VALUES (32,30);
INSERT INTO `product_has_supplier` VALUES (39,30);
INSERT INTO `product_has_supplier` VALUES (43,30);
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
INSERT INTO `publisher` VALUES (1,'5 POINTS ');
INSERT INTO `publisher` VALUES (2,'801 MEDIA ');
INSERT INTO `publisher` VALUES (3,'JAPANIME ');
INSERT INTO `publisher` VALUES (4,'IMAGE ENTERTAINMENT ');
INSERT INTO `publisher` VALUES (5,'SENTAI FILMWORKS ');
INSERT INTO `publisher` VALUES (6,'Yen Press');
INSERT INTO `publisher` VALUES (7,'SHOUT FACTORY ');
INSERT INTO `publisher` VALUES (8,'SUNRISE INC. ');
INSERT INTO `publisher` VALUES (9,'White Fox');
INSERT INTO `publisher` VALUES (10,'Aniplex');
INSERT INTO `publisher` VALUES (11,'VIZ ');
INSERT INTO `publisher` VALUES (12,'VIZ BOOKS ');
INSERT INTO `publisher` VALUES (13,'YESJAPAN ');
INSERT INTO `publisher` VALUES (14,'PONYCAN ');
INSERT INTO `publisher` VALUES (15,'MAIDEN JAPAN ');
INSERT INTO `publisher` VALUES (16,'MAGNOLIA ');
INSERT INTO `publisher` VALUES (17,'FANTAGRAPHICS ');
INSERT INTO `publisher` VALUES (18,'DARK HORSE ');
INSERT INTO `publisher` VALUES (19,'ABC Corp');
INSERT INTO `publisher` VALUES (20,'Other');
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
INSERT INTO `series` VALUES (1,'Spice and Wolf');
INSERT INTO `series` VALUES (2,'Sword Art Online');
INSERT INTO `series` VALUES (3,'Index Series');
INSERT INTO `series` VALUES (4,'White Album 2');
INSERT INTO `series` VALUES (5,'Accel World');
INSERT INTO `series` VALUES (6,'Fairy Tail');
INSERT INTO `series` VALUES (7,'Haruhi');
INSERT INTO `series` VALUES (8,'Nagato-chan');
INSERT INTO `series` VALUES (9,'Psycho Pass');
INSERT INTO `series` VALUES (10,'Problem Children?');
INSERT INTO `series` VALUES (11,'Dragon Ball Z');
INSERT INTO `series` VALUES (12,'Inuyasha');
INSERT INTO `series` VALUES (13,'Noblesse');
INSERT INTO `series` VALUES (14,'Eden of the East');
INSERT INTO `series` VALUES (15,'Howl\'s Moving Castle');
INSERT INTO `series` VALUES (16,'Garden of Words');
INSERT INTO `series` VALUES (17,'Free!');
INSERT INTO `series` VALUES (18,'Naruto');
INSERT INTO `series` VALUES (19,'No Game No life');
INSERT INTO `series` VALUES (20,'Attack on Titan');
INSERT INTO `series` VALUES (21,'Anohana');
INSERT INTO `series` VALUES (22,'Guilty Crown');
INSERT INTO `series` VALUES (23,'Magi');
INSERT INTO `series` VALUES (24,'Tokyo Ghoul');
INSERT INTO `series` VALUES (25,'Madoka Magica');
INSERT INTO `series` VALUES (26,'Another');
INSERT INTO `series` VALUES (27,'Death Parade');
INSERT INTO `series` VALUES (28,'Akame Ga Kill');
INSERT INTO `series` VALUES (29,'Clannad');
INSERT INTO `series` VALUES (30,'Golden Time');
INSERT INTO `series` VALUES (31,'Your Lie In April');
INSERT INTO `series` VALUES (32,'Nisekoi');
INSERT INTO `series` VALUES (33,'Death Note');
INSERT INTO `series` VALUES (34,'Hamatora');
INSERT INTO `series` VALUES (35,'Log Horizon');
INSERT INTO `series` VALUES (36,'Katangatari');
INSERT INTO `series` VALUES (37,'Love Lab');
INSERT INTO `series` VALUES (38,'Evangelion');
INSERT INTO `series` VALUES (39,'Date A Live');
INSERT INTO `series` VALUES (40,'Cardcaptor Sakura');
INSERT INTO `series` VALUES (41,'Angel Beats!');
INSERT INTO `series` VALUES (42,'Bleach');
INSERT INTO `series` VALUES (43,'Air');
INSERT INTO `series` VALUES (44,'Fate/Zero');
INSERT INTO `series` VALUES (45,'Fate/Stay Night');
INSERT INTO `series` VALUES (46,'Noragami');
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
INSERT INTO `series_has_product` VALUES (1,12);
INSERT INTO `series_has_product` VALUES (1,14);
INSERT INTO `series_has_product` VALUES (1,33);
INSERT INTO `series_has_product` VALUES (2,20);
INSERT INTO `series_has_product` VALUES (2,21);
INSERT INTO `series_has_product` VALUES (3,2);
INSERT INTO `series_has_product` VALUES (3,12);
INSERT INTO `series_has_product` VALUES (3,20);
INSERT INTO `series_has_product` VALUES (3,25);
INSERT INTO `series_has_product` VALUES (4,7);
INSERT INTO `series_has_product` VALUES (4,11);
INSERT INTO `series_has_product` VALUES (4,18);
INSERT INTO `series_has_product` VALUES (5,18);
INSERT INTO `series_has_product` VALUES (5,40);
INSERT INTO `series_has_product` VALUES (5,49);
INSERT INTO `series_has_product` VALUES (6,3);
INSERT INTO `series_has_product` VALUES (6,22);
INSERT INTO `series_has_product` VALUES (6,44);
INSERT INTO `series_has_product` VALUES (7,15);
INSERT INTO `series_has_product` VALUES (7,18);
INSERT INTO `series_has_product` VALUES (7,39);
INSERT INTO `series_has_product` VALUES (8,13);
INSERT INTO `series_has_product` VALUES (8,36);
INSERT INTO `series_has_product` VALUES (9,7);
INSERT INTO `series_has_product` VALUES (9,30);
INSERT INTO `series_has_product` VALUES (9,37);
INSERT INTO `series_has_product` VALUES (10,32);
INSERT INTO `series_has_product` VALUES (10,33);
INSERT INTO `series_has_product` VALUES (10,49);
INSERT INTO `series_has_product` VALUES (11,28);
INSERT INTO `series_has_product` VALUES (11,31);
INSERT INTO `series_has_product` VALUES (11,47);
INSERT INTO `series_has_product` VALUES (12,11);
INSERT INTO `series_has_product` VALUES (12,26);
INSERT INTO `series_has_product` VALUES (12,45);
INSERT INTO `series_has_product` VALUES (12,48);
INSERT INTO `series_has_product` VALUES (13,14);
INSERT INTO `series_has_product` VALUES (13,42);
INSERT INTO `series_has_product` VALUES (13,47);
INSERT INTO `series_has_product` VALUES (14,9);
INSERT INTO `series_has_product` VALUES (14,30);
INSERT INTO `series_has_product` VALUES (14,42);
INSERT INTO `series_has_product` VALUES (15,11);
INSERT INTO `series_has_product` VALUES (15,24);
INSERT INTO `series_has_product` VALUES (15,32);
INSERT INTO `series_has_product` VALUES (16,23);
INSERT INTO `series_has_product` VALUES (16,29);
INSERT INTO `series_has_product` VALUES (17,5);
INSERT INTO `series_has_product` VALUES (17,15);
INSERT INTO `series_has_product` VALUES (17,38);
INSERT INTO `series_has_product` VALUES (18,12);
INSERT INTO `series_has_product` VALUES (18,24);
INSERT INTO `series_has_product` VALUES (18,40);
INSERT INTO `series_has_product` VALUES (19,5);
INSERT INTO `series_has_product` VALUES (19,15);
INSERT INTO `series_has_product` VALUES (19,50);
INSERT INTO `series_has_product` VALUES (20,6);
INSERT INTO `series_has_product` VALUES (20,25);
INSERT INTO `series_has_product` VALUES (20,50);
INSERT INTO `series_has_product` VALUES (21,4);
INSERT INTO `series_has_product` VALUES (21,11);
INSERT INTO `series_has_product` VALUES (21,13);
INSERT INTO `series_has_product` VALUES (21,19);
INSERT INTO `series_has_product` VALUES (22,16);
INSERT INTO `series_has_product` VALUES (22,35);
INSERT INTO `series_has_product` VALUES (22,49);
INSERT INTO `series_has_product` VALUES (23,3);
INSERT INTO `series_has_product` VALUES (23,29);
INSERT INTO `series_has_product` VALUES (23,35);
INSERT INTO `series_has_product` VALUES (23,44);
INSERT INTO `series_has_product` VALUES (24,41);
INSERT INTO `series_has_product` VALUES (24,45);
INSERT INTO `series_has_product` VALUES (25,17);
INSERT INTO `series_has_product` VALUES (25,18);
INSERT INTO `series_has_product` VALUES (25,44);
INSERT INTO `series_has_product` VALUES (26,23);
INSERT INTO `series_has_product` VALUES (26,26);
INSERT INTO `series_has_product` VALUES (26,37);
INSERT INTO `series_has_product` VALUES (27,11);
INSERT INTO `series_has_product` VALUES (27,46);
INSERT INTO `series_has_product` VALUES (27,50);
INSERT INTO `series_has_product` VALUES (28,11);
INSERT INTO `series_has_product` VALUES (28,25);
INSERT INTO `series_has_product` VALUES (28,35);
INSERT INTO `series_has_product` VALUES (29,9);
INSERT INTO `series_has_product` VALUES (29,20);
INSERT INTO `series_has_product` VALUES (29,34);
INSERT INTO `series_has_product` VALUES (30,28);
INSERT INTO `series_has_product` VALUES (30,31);
INSERT INTO `series_has_product` VALUES (30,48);
INSERT INTO `series_has_product` VALUES (31,12);
INSERT INTO `series_has_product` VALUES (31,44);
INSERT INTO `series_has_product` VALUES (31,47);
INSERT INTO `series_has_product` VALUES (32,10);
INSERT INTO `series_has_product` VALUES (32,11);
INSERT INTO `series_has_product` VALUES (32,14);
INSERT INTO `series_has_product` VALUES (33,22);
INSERT INTO `series_has_product` VALUES (33,32);
INSERT INTO `series_has_product` VALUES (33,46);
INSERT INTO `series_has_product` VALUES (34,16);
INSERT INTO `series_has_product` VALUES (34,31);
INSERT INTO `series_has_product` VALUES (34,44);
INSERT INTO `series_has_product` VALUES (35,27);
INSERT INTO `series_has_product` VALUES (35,31);
INSERT INTO `series_has_product` VALUES (35,47);
INSERT INTO `series_has_product` VALUES (36,24);
INSERT INTO `series_has_product` VALUES (36,36);
INSERT INTO `series_has_product` VALUES (36,50);
INSERT INTO `series_has_product` VALUES (37,25);
INSERT INTO `series_has_product` VALUES (37,28);
INSERT INTO `series_has_product` VALUES (37,33);
INSERT INTO `series_has_product` VALUES (38,5);
INSERT INTO `series_has_product` VALUES (38,24);
INSERT INTO `series_has_product` VALUES (38,25);
INSERT INTO `series_has_product` VALUES (39,27);
INSERT INTO `series_has_product` VALUES (39,37);
INSERT INTO `series_has_product` VALUES (39,41);
INSERT INTO `series_has_product` VALUES (40,14);
INSERT INTO `series_has_product` VALUES (40,27);
INSERT INTO `series_has_product` VALUES (40,39);
INSERT INTO `series_has_product` VALUES (41,28);
INSERT INTO `series_has_product` VALUES (41,31);
INSERT INTO `series_has_product` VALUES (41,41);
INSERT INTO `series_has_product` VALUES (42,24);
INSERT INTO `series_has_product` VALUES (42,25);
INSERT INTO `series_has_product` VALUES (42,37);
INSERT INTO `series_has_product` VALUES (43,10);
INSERT INTO `series_has_product` VALUES (43,20);
INSERT INTO `series_has_product` VALUES (43,47);
INSERT INTO `series_has_product` VALUES (44,21);
INSERT INTO `series_has_product` VALUES (44,29);
INSERT INTO `series_has_product` VALUES (44,50);
INSERT INTO `series_has_product` VALUES (45,6);
INSERT INTO `series_has_product` VALUES (45,33);
INSERT INTO `series_has_product` VALUES (45,37);
INSERT INTO `series_has_product` VALUES (46,30);
INSERT INTO `series_has_product` VALUES (46,32);
INSERT INTO `series_has_product` VALUES (46,36);
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
INSERT INTO `supplier` VALUES (1,'90777 Arapahoe Street','China','Omba','6-(407)461-2383');
INSERT INTO `supplier` VALUES (2,'9 Forest Dale Lane','Japan','Fanoodle','6-(392)159-5923');
INSERT INTO `supplier` VALUES (3,'960 Utah Trail','Japan','Midel','7-(233)119-4707');
INSERT INTO `supplier` VALUES (4,'393 Eagan Parkway','Japan','Tagfeed','8-(740)843-3036');
INSERT INTO `supplier` VALUES (5,'429 Tennessee Trail','Japan','Voonyx','5-(551)115-8192');
INSERT INTO `supplier` VALUES (6,'94850 Express Crossing','Japan','Topicblab','8-(953)528-0016');
INSERT INTO `supplier` VALUES (7,'7880 Lighthouse Bay Pass','Peru','Tazz','7-(212)577-8139');
INSERT INTO `supplier` VALUES (8,'9 Northland Park','Russia','Jaxworks','1-(689)471-2027');
INSERT INTO `supplier` VALUES (9,'1957 Fremont Crossing','Guinea-Bissau','Divape','8-(927)860-1593');
INSERT INTO `supplier` VALUES (10,'5 Brentwood Drive','Brazil','Dabjam','1-(589)742-1252');
INSERT INTO `supplier` VALUES (11,'93946 Drewry Court','Indonesia','Chatterbridge','4-(958)132-3576');
INSERT INTO `supplier` VALUES (12,'338 Lyons Hill','Russia','Yombu','8-(046)150-8541');
INSERT INTO `supplier` VALUES (13,'502 Myrtle Pass','Portugal','Zazio','6-(063)120-6005');
INSERT INTO `supplier` VALUES (14,'8 Roth Lane','Canada','Realpoint','1-(682)503-2893');
INSERT INTO `supplier` VALUES (15,'3097 Birchwood Drive','Canada','Divanoodle','1-(236)460-6370');
INSERT INTO `supplier` VALUES (16,'8 Kipling Junction','Canada','Dabtype','1-(438)873-2165');
INSERT INTO `supplier` VALUES (17,'9668 School Drive','China','Edgepulse','8-(805)932-1219');
INSERT INTO `supplier` VALUES (18,'6782 Mccormick Crossing','Russia','Fanoodle','3-(403)455-0705');
INSERT INTO `supplier` VALUES (19,'3003 Pierstorff Street','Guatemala','Buzzbean','3-(402)998-2474');
INSERT INTO `supplier` VALUES (20,'8327 Jenifer Alley','Indonesia','Snaptags','3-(969)277-9426');
INSERT INTO `supplier` VALUES (21,'50798 Birchwood Junction','Palestinian Territory','Quinu','6-(650)476-5269');
INSERT INTO `supplier` VALUES (22,'6505 Victoria Way','China','Kazio','0-(096)987-3750');
INSERT INTO `supplier` VALUES (23,'11381 Ruskin Center','Netherlands','Dabtype','2-(637)959-3862');
INSERT INTO `supplier` VALUES (24,'204 Jana Way','Mexico','Skimia','8-(579)904-3854');
INSERT INTO `supplier` VALUES (25,'76119 Farmco Road','China','Quimm','7-(984)527-9074');
INSERT INTO `supplier` VALUES (26,'282 Grayhawk Court','Peru','Yadel','9-(483)713-5901');
INSERT INTO `supplier` VALUES (27,'024 Veith Avenue','Indonesia','Feednation','4-(873)192-3711');
INSERT INTO `supplier` VALUES (28,'1418 Lake View Lane','France','Oozz','9-(237)106-6148');
INSERT INTO `supplier` VALUES (29,'5366 Fisk Lane','Indonesia','Dabshots','6-(436)599-7073');
INSERT INTO `supplier` VALUES (30,'123 NewStreet','New Contry','Sup','1234567');
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

-- Dump completed on 2015-03-22 21:18:55
