-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: hotel_db
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `ADDRESS_ID` int NOT NULL AUTO_INCREMENT,
  `STREET_NAME` varchar(45) NOT NULL,
  `BUILDING_NUMBER` varchar(45) NOT NULL,
  `APARTMENT_NUMBER` varchar(45) DEFAULT NULL,
  `CITY_ID` int NOT NULL,
  PRIMARY KEY (`ADDRESS_ID`),
  UNIQUE KEY `ADDRESS_ID_UNIQUE` (`ADDRESS_ID`),
  KEY `fk_address_city1_idx` (`CITY_ID`),
  CONSTRAINT `fk_address_city1` FOREIGN KEY (`CITY_ID`) REFERENCES `city` (`CITY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Politechniczna','8B','15',2),(2,'Polanka','12',NULL,2),(3,'Katowicka','75','43',2),(4,'Marszałkowska','13','12',1),(5,'Krakowska','72D',NULL,3),(6,'Mickiewicza','120D','15',3),(7,'Hotelowa','2',NULL,2);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `LOGIN` varchar(45) NOT NULL,
  `PASSWORD` varchar(45) NOT NULL,
  `FIRST_NAME` varchar(45) NOT NULL,
  `LAST_NAME` varchar(45) NOT NULL,
  `LAST_LOGIN` timestamp NOT NULL,
  PRIMARY KEY (`LOGIN`),
  UNIQUE KEY `LOGIN_UNIQUE` (`LOGIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('LOGINJAKUBA','HASLOJAKUBA','Jakub','Wróbel','2022-03-03 15:35:27'),('loginn','haslooo','noweimie','nowenazwisko','2022-03-06 16:19:27'),('LOGINPRZEMKA','HASLOPRZEMKA','Przemysław','Woźniak','2022-02-03 15:35:45');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `CATEGORY_ID` int NOT NULL AUTO_INCREMENT,
  `CATEGORY_NAME` varchar(45) NOT NULL,
  `START_SERVING_TIME` int NOT NULL,
  `END_SERVING_TIME` int NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`),
  UNIQUE KEY `idCATEGORIES_UNIQUE` (`CATEGORY_NAME`),
  UNIQUE KEY `CATEGORY_ID_UNIQUE` (`CATEGORY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'BREAKFAST',8,12),(2,'LUNCH',12,18),(3,'DINNER',18,22);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `CITY_ID` int NOT NULL AUTO_INCREMENT,
  `CITY_NAME` varchar(45) NOT NULL,
  `COUNTRY_ID` int NOT NULL,
  PRIMARY KEY (`CITY_ID`),
  UNIQUE KEY `CITY_ID_UNIQUE` (`CITY_ID`),
  UNIQUE KEY `CITY_NAME_UNIQUE` (`CITY_NAME`),
  KEY `fk_citycountry_1_idx` (`COUNTRY_ID`),
  CONSTRAINT `fk_citycountry_1` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'WARSZAWA',1),(2,'POZNAN',1),(3,'SZCZECIN',1),(4,'CIESZYN',1),(5,'KRAKOW',1),(6,'GDANSK',1),(7,'KATOWICE',1),(8,'BYDGOSZCZ',1),(9,'TORUN',1),(10,'RADOM',1),(11,'LODZ',1),(12,'WROCLAW',1),(13,'LUBLIN',1),(14,'BIALYSTOK',1),(15,'GDYNIA',1),(16,'CZESTOCHOWA',1),(17,'SOSNOWIEC',1),(18,'KIELCE',1),(19,'RZESZOW',1),(20,'GLIWICE',1),(21,'BERLIN',2),(22,'HAMBURG',2),(23,'MUNICH',2),(24,'COLOGNE',2),(25,'FRANKFURT',2),(26,'STUTTGART',2),(27,'DUSSELDORF',2),(28,'DORTMUND',2),(29,'ESSEN',2),(30,'LEIPZIG',2),(31,'STOCKHOLM',3),(32,'GOTHENBURG',3),(33,'MALMO',3),(34,'UPPSALA',3),(35,'VASTERAS',3),(36,'OREBRO',3),(37,'LINKOPING',3),(38,'HELSINGBORG',3),(39,'JONKOPING',3),(40,'NORRKOPING',3);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `COUNTRY_ID` int NOT NULL AUTO_INCREMENT,
  `COUNTRY_NAME` varchar(45) NOT NULL,
  PRIMARY KEY (`COUNTRY_ID`),
  UNIQUE KEY `COUNTRY_ID_UNIQUE` (`COUNTRY_ID`),
  UNIQUE KEY `COUNTRY_NAME_UNIQUE` (`COUNTRY_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (2,'GERMANY'),(1,'POLAND'),(3,'SWEDEN');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest` (
  `GUEST_ID` int NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` varchar(45) NOT NULL,
  `LAST_NAME` varchar(45) NOT NULL,
  `DATE_OF_BIRTH` date NOT NULL,
  `TELEPHONE` varchar(11) NOT NULL,
  `ADDRESS_ID` int NOT NULL,
  PRIMARY KEY (`GUEST_ID`,`ADDRESS_ID`),
  UNIQUE KEY `GUEST_ID_UNIQUE` (`GUEST_ID`),
  KEY `fk_GUESTS_ADDRESSES1_idx` (`ADDRESS_ID`),
  CONSTRAINT `fk_GUESTS_ADDRESSES1` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `address` (`ADDRESS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest`
--

LOCK TABLES `guest` WRITE;
/*!40000 ALTER TABLE `guest` DISABLE KEYS */;
INSERT INTO `guest` VALUES (1,'JAN','KOWALSKI','1993-03-12','505876142',7),(2,'KACPER','NOWACZKIEWICZ','1990-05-16','123456788',2),(3,'MICHAŁ','NOWAK','1950-05-12','785423123',3),(4,'MACIEJ','POZNAŃSKI','1995-12-12','517662353',4),(5,'ALBERT','WIŚNIEWSKI','2000-05-05','645723465',5),(6,'JAKUB','WRÓBEL','2000-11-12','123456789',6);
/*!40000 ALTER TABLE `guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `HOTEL_ID` int NOT NULL AUTO_INCREMENT,
  `HOTEL_NAME` varchar(45) NOT NULL,
  `HOTEL_RATING` int NOT NULL,
  `TELEPHONE` varchar(11) NOT NULL,
  `ADDRESS_ID` int NOT NULL,
  PRIMARY KEY (`HOTEL_ID`,`ADDRESS_ID`),
  UNIQUE KEY `HOTEL_ID_UNIQUE` (`HOTEL_ID`),
  KEY `fk_HOTELS_ADDRESSES1_idx` (`ADDRESS_ID`),
  CONSTRAINT `fk_HOTELS_ADDRESSES1` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `address` (`ADDRESS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (1,'HOTEL_SQL',5,'123456789',1);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `ORDER_ID` int NOT NULL AUTO_INCREMENT,
  `TOTAL_ORDER_PRICE` float NOT NULL,
  `TIME_OF_ORDER` timestamp NOT NULL,
  `RESERVATION_ID` int NOT NULL,
  `GUEST_ID` int NOT NULL,
  PRIMARY KEY (`ORDER_ID`,`RESERVATION_ID`,`GUEST_ID`),
  UNIQUE KEY `idORDERS_UNIQUE` (`ORDER_ID`),
  KEY `fk_ORDERS_RESERVATIONS1_idx` (`RESERVATION_ID`,`GUEST_ID`),
  KEY `FK9a6r14tc1hcc0ubieytllvdki` (`GUEST_ID`),
  CONSTRAINT `FK9a6r14tc1hcc0ubieytllvdki` FOREIGN KEY (`GUEST_ID`) REFERENCES `guest` (`GUEST_ID`),
  CONSTRAINT `fk_ORDERS_RESERVATIONS1` FOREIGN KEY (`RESERVATION_ID`, `GUEST_ID`) REFERENCES `reservation` (`RESERVATION_ID`, `GUEST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,0,'2021-05-17 13:00:00',1,1),(2,0,'2021-07-03 07:00:00',2,2),(3,0,'2021-08-17 13:00:00',4,4),(4,0,'2021-11-14 14:00:00',4,4),(5,0,'2021-12-23 14:00:00',5,5),(6,0,'2022-02-10 04:00:00',1,1),(7,300,'2022-02-10 04:00:00',1,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AddOrderToReservation` AFTER UPDATE ON `orders` FOR EACH ROW BEGIN

    UPDATE reservation

    SET PRICE = PRICE + NEW.TOTAL_ORDER_PRICE - OLD.TOTAL_ORDER_PRICE

    WHERE RESERVATION_ID = NEW.RESERVATION_ID;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `DeleteOrderFromReservation` AFTER DELETE ON `orders` FOR EACH ROW BEGIN

    UPDATE reservation

    SET PRICE = PRICE - OLD.TOTAL_ORDER_PRICE

    WHERE RESERVATION_ID = OLD.RESERVATION_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_method` (
  `PAYMENT_METHOD_ID` int NOT NULL AUTO_INCREMENT,
  `PAYMENT_METHOD_NAME` varchar(45) NOT NULL,
  PRIMARY KEY (`PAYMENT_METHOD_ID`),
  UNIQUE KEY `PAYMENT_METHOD_NAME_UNIQUE` (`PAYMENT_METHOD_NAME`),
  UNIQUE KEY `PAYMENT_METHOD_ID_UNIQUE` (`PAYMENT_METHOD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method`
--

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
INSERT INTO `payment_method` VALUES (1,'CARD'),(2,'CASH'),(3,'CHECK');
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `PRODUCT_ID` int NOT NULL AUTO_INCREMENT,
  `PRODUCT_NAME` varchar(45) NOT NULL,
  `PRODUCT_PRICE` float NOT NULL,
  `CATEGORY_ID` int NOT NULL,
  PRIMARY KEY (`PRODUCT_ID`),
  UNIQUE KEY `PRODUCT_NAME_UNIQUE` (`PRODUCT_NAME`),
  UNIQUE KEY `PRODUCT_ID_UNIQUE` (`PRODUCT_ID`),
  KEY `fk_product_category1_idx` (`CATEGORY_ID`),
  CONSTRAINT `fk_product_category1` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`CATEGORY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'SCRAMBLED EGGS',5,1),(2,'PANCAKES',10,1),(3,'PORRIDGE',10,1),(4,'SALMON',25,2),(5,'STEAK',20,2),(6,'CHICKEN SOUP',15,2),(7,'BEEF TARTARE',20,3),(8,'TOMATO SOUP',12,3);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_in_order`
--

DROP TABLE IF EXISTS `product_in_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_in_order` (
  `PRODUCT_IN_ORDER_ID` int NOT NULL AUTO_INCREMENT,
  `PRODUCT_QUANTITY` int NOT NULL,
  `PRODUCT_SUBTOTAL_PRICE` float NOT NULL,
  `SERVICE_TIME` timestamp NOT NULL,
  `ORDER_ID` int NOT NULL,
  `RESERVATION_ID` int NOT NULL,
  `GUEST_ID` int NOT NULL,
  `PRODUCT_ID` int NOT NULL,
  PRIMARY KEY (`PRODUCT_IN_ORDER_ID`,`ORDER_ID`,`RESERVATION_ID`,`GUEST_ID`,`PRODUCT_ID`),
  KEY `fk_PRODUCTS_IN_ORDERS_ORDERS1_idx` (`ORDER_ID`,`RESERVATION_ID`,`GUEST_ID`),
  KEY `fk_product_in_order_product1_idx` (`PRODUCT_ID`),
  KEY `FKrnvde3kbf8vtf0wgtysmxmweu` (`GUEST_ID`),
  KEY `FKrkc25j3u622vr2db5pk7hg37e` (`RESERVATION_ID`),
  CONSTRAINT `fk_product_in_order_product1` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`),
  CONSTRAINT `fk_PRODUCTS_IN_ORDERS_ORDERS1` FOREIGN KEY (`ORDER_ID`, `RESERVATION_ID`, `GUEST_ID`) REFERENCES `orders` (`ORDER_ID`, `RESERVATION_ID`, `GUEST_ID`),
  CONSTRAINT `FKrkc25j3u622vr2db5pk7hg37e` FOREIGN KEY (`RESERVATION_ID`) REFERENCES `reservation` (`RESERVATION_ID`),
  CONSTRAINT `FKrnvde3kbf8vtf0wgtysmxmweu` FOREIGN KEY (`GUEST_ID`) REFERENCES `guest` (`GUEST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_in_order`
--

LOCK TABLES `product_in_order` WRITE;
/*!40000 ALTER TABLE `product_in_order` DISABLE KEYS */;
INSERT INTO `product_in_order` VALUES (1,2,50,'2021-05-17 15:00:00',1,1,1,4),(2,2,10,'2021-07-03 10:00:00',2,2,2,1),(3,1,20,'2021-07-03 10:00:00',2,2,2,2),(4,2,30,'2021-08-17 14:00:00',3,4,4,6),(5,2,30,'2021-08-17 15:00:00',3,4,4,6),(7,1,100,'2022-02-10 04:00:00',7,1,1,2),(8,4,200,'2022-03-01 09:00:00',7,1,1,8);
/*!40000 ALTER TABLE `product_in_order` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AddProductToOrder` AFTER INSERT ON `product_in_order` FOR EACH ROW BEGIN

    UPDATE orders

    SET TOTAL_ORDER_PRICE = TOTAL_ORDER_PRICE + NEW.PRODUCT_SUBTOTAL_PRICE

    WHERE ORDER_ID = NEW.ORDER_ID;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `RESERVATION_ID` int NOT NULL AUTO_INCREMENT,
  `NUMBER_OF_GUESTS` int NOT NULL,
  `PRICE` float NOT NULL,
  `START_DATE` date NOT NULL,
  `END_DATE` date NOT NULL,
  `GUEST_ID` int NOT NULL,
  `HOTEL_ID` int NOT NULL,
  `HOTEL_ADDRESS_ID` int NOT NULL,
  `RESERVATION_STATE_ID` int NOT NULL,
  `PAYMENT_METHOD_ID` int NOT NULL,
  PRIMARY KEY (`RESERVATION_ID`,`GUEST_ID`,`HOTEL_ID`,`HOTEL_ADDRESS_ID`),
  KEY `fk_RESERVATIONS_GUESTS1_idx` (`GUEST_ID`),
  KEY `fk_RESERVATIONS_HOTELS1_idx` (`HOTEL_ID`,`HOTEL_ADDRESS_ID`),
  KEY `fk_reservation_reservation_state1_idx` (`RESERVATION_STATE_ID`),
  KEY `fk_reservation_payment_method1_idx` (`PAYMENT_METHOD_ID`),
  KEY `FKjv40e8oug4ndbr1yxtknlaw3l` (`HOTEL_ADDRESS_ID`),
  CONSTRAINT `fk_reservation_payment_method1` FOREIGN KEY (`PAYMENT_METHOD_ID`) REFERENCES `payment_method` (`PAYMENT_METHOD_ID`),
  CONSTRAINT `fk_reservation_reservation_state1` FOREIGN KEY (`RESERVATION_STATE_ID`) REFERENCES `reservation_state` (`RESERVATION_STATE_ID`),
  CONSTRAINT `fk_RESERVATIONS_GUESTS1` FOREIGN KEY (`GUEST_ID`) REFERENCES `guest` (`GUEST_ID`),
  CONSTRAINT `fk_RESERVATIONS_HOTELS1` FOREIGN KEY (`HOTEL_ID`, `HOTEL_ADDRESS_ID`) REFERENCES `hotel` (`HOTEL_ID`, `ADDRESS_ID`),
  CONSTRAINT `FKjv40e8oug4ndbr1yxtknlaw3l` FOREIGN KEY (`HOTEL_ADDRESS_ID`) REFERENCES `address` (`ADDRESS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,2,0,'2021-05-15','2021-05-25',1,1,1,3,1),(2,2,0,'2021-07-01','2021-07-05',2,1,1,2,2),(3,4,0,'2021-08-17','2021-08-18',3,1,1,3,2),(4,7,0,'2021-11-12','2021-11-15',4,1,1,2,3),(5,1,0,'2021-12-22','2021-12-25',5,1,1,3,1),(6,1,0,'2022-03-21','2021-03-28',6,1,1,1,1),(7,2,500,'2022-03-02','2022-03-06',1,1,1,1,1);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_state`
--

DROP TABLE IF EXISTS `reservation_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_state` (
  `RESERVATION_STATE_ID` int NOT NULL AUTO_INCREMENT,
  `RESERVATION_STATE_NAME` varchar(45) NOT NULL,
  PRIMARY KEY (`RESERVATION_STATE_ID`),
  UNIQUE KEY `RESERVATION_STATE_NAAME_UNIQUE` (`RESERVATION_STATE_NAME`),
  UNIQUE KEY `RESERVATION_STATE_ID_UNIQUE` (`RESERVATION_STATE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_state`
--

LOCK TABLES `reservation_state` WRITE;
/*!40000 ALTER TABLE `reservation_state` DISABLE KEYS */;
INSERT INTO `reservation_state` VALUES (1,'BOOKED'),(2,'CANCELED'),(3,'COMPLETED'),(4,'IN_PROGRESS');
/*!40000 ALTER TABLE `reservation_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `ROOM_NUMBER` int NOT NULL,
  `ROOM_NAME` varchar(45) NOT NULL,
  `FLOOR` int NOT NULL,
  `PRICE_PER_NIGHT` float NOT NULL,
  `SINGLE_BEDS` int NOT NULL,
  `DOUBLE_BEDS` int NOT NULL,
  `HOTEL_ID` int NOT NULL,
  PRIMARY KEY (`ROOM_NUMBER`,`HOTEL_ID`),
  UNIQUE KEY `idROOMS_UNIQUE` (`ROOM_NUMBER`),
  KEY `fk_ROOMS_HOTELS1_idx` (`HOTEL_ID`),
  CONSTRAINT `fk_ROOMS_HOTELS1` FOREIGN KEY (`HOTEL_ID`) REFERENCES `hotel` (`HOTEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'VIP Lounge',5,1000,0,1,1),(2,'Economy Lounge',0,200,3,0,1),(3,'Standard Big Room',7,500,5,2,1),(4,'Solo Premium Room',2,150,1,0,1);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_in_reservation`
--

DROP TABLE IF EXISTS `room_in_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_in_reservation` (
  `ROOM_IN_RESERVATION_ID` int NOT NULL AUTO_INCREMENT,
  `ROOM_TOTAL_PRICE` float NOT NULL,
  `RESERVATION_ID` int NOT NULL,
  `GUEST_ID` int NOT NULL,
  `ROOM_NUMBER` int NOT NULL,
  `HOTEL_ID` int NOT NULL,
  PRIMARY KEY (`ROOM_IN_RESERVATION_ID`,`RESERVATION_ID`,`GUEST_ID`,`ROOM_NUMBER`,`HOTEL_ID`),
  KEY `fk_room_in_reservation_reservation1_idx` (`RESERVATION_ID`,`GUEST_ID`),
  KEY `fk_room_in_reservation_room1_idx` (`ROOM_NUMBER`,`HOTEL_ID`),
  KEY `FKfrmau4b3dpcouku8enio8w0ng` (`GUEST_ID`),
  KEY `FK47mj43or3pg0e839ynr0fjuvk` (`HOTEL_ID`),
  CONSTRAINT `FK47mj43or3pg0e839ynr0fjuvk` FOREIGN KEY (`HOTEL_ID`) REFERENCES `hotel` (`HOTEL_ID`),
  CONSTRAINT `fk_room_in_reservation_reservation1` FOREIGN KEY (`RESERVATION_ID`, `GUEST_ID`) REFERENCES `reservation` (`RESERVATION_ID`, `GUEST_ID`),
  CONSTRAINT `fk_room_in_reservation_room1` FOREIGN KEY (`ROOM_NUMBER`, `HOTEL_ID`) REFERENCES `room` (`ROOM_NUMBER`, `HOTEL_ID`),
  CONSTRAINT `FKfrmau4b3dpcouku8enio8w0ng` FOREIGN KEY (`GUEST_ID`) REFERENCES `guest` (`GUEST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_in_reservation`
--

LOCK TABLES `room_in_reservation` WRITE;
/*!40000 ALTER TABLE `room_in_reservation` DISABLE KEYS */;
INSERT INTO `room_in_reservation` VALUES (5,1500,1,1,4,1),(6,800,2,2,2,1),(7,2000,2,2,3,1),(8,500,3,3,3,1),(9,1000,3,3,1,1),(10,3000,4,4,1,1),(11,600,5,5,2,1),(12,400,7,1,3,1);
/*!40000 ALTER TABLE `room_in_reservation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AddRoomToReservation` AFTER UPDATE ON `room_in_reservation` FOR EACH ROW BEGIN

    UPDATE reservation

    SET PRICE = PRICE + NEW.ROOM_TOTAL_PRICE

    WHERE RESERVATION_ID = NEW.RESERVATION_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'hotel_db'
--

--
-- Dumping routines for database 'hotel_db'
--
/*!50003 DROP FUNCTION IF EXISTS `AVAILABILITY` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `AVAILABILITY`(SELECTED_NUMBER INT, START_DATE_WANTED DATE, END_DATE_WANTED DATE) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	
    DECLARE START_DATE2 DATE;
    DECLARE END_DATE2 DATE;
    DECLARE finished INTEGER DEFAULT 0;
    DECLARE ROOM_NO INTEGER;
    DECLARE RES_ID INTEGER;
    
    DECLARE room_cursor CURSOR FOR SELECT ROOM_NUMBER, RESERVATION_ID FROM room_in_reservation;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
    
    OPEN room_cursor;
    
    room_cursor: LOOP
	
		FETCH room_cursor INTO ROOM_NO, RES_ID;
        IF finished = 1 THEN
			LEAVE room_cursor;
		END IF;
        
        IF ROOM_NO = SELECTED_NUMBER THEN
			SELECT START_DATE, END_DATE INTO START_DATE2, END_DATE2 FROM reservation WHERE reservation.RESERVATION_ID = RES_ID;
            IF START_DATE_WANTED < END_DATE2 AND END_DATE_WANTED > START_DATE2 THEN
				RETURN FALSE;
			END IF;
		END IF;
        
	END LOOP room_cursor;
    CLOSE room_cursor;
    RETURN TRUE;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `CALCULATE_CAPACITY` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CALCULATE_CAPACITY`(ROOM_NUMBER INT) RETURNS int
    DETERMINISTIC
BEGIN

	DECLARE SUM_OF_SINGLE_BEDS INT;
    DECLARE SUM_OF_DOUBLE_BEDS INT;
    
    SELECT SINGLE_BEDS , DOUBLE_BEDS * 2 INTO @SUM_OF_SINGLE_BEDS, @SUM_OF_DOUBLE_BEDS FROM room WHERE room.ROOM_NUMBER = ROOM_NUMBER;
	
	/* SUM_OF_DOUBLE_BEDS = SUM_OF_DOUBLE_BEDS * 2; */

	RETURN (@SUM_OF_SINGLE_BEDS + @SUM_OF_DOUBLE_BEDS);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SET_FULL_ROOM_PRICE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SET_FULL_ROOM_PRICE`(START_DATE DATE, END_DATE DATE, vROOM_NUMBER INT, vRIR_ID INT)
BEGIN
	
    DECLARE vPrice FLOAT;
    DECLARE vDaysBetween INT;
    DECLARE vTotal FLOAT;

    SELECT PRICE_PER_NIGHT INTO vPrice FROM room WHERE room.ROOM_NUMBER = vROOM_NUMBER;

    SELECT datediff(DATE_FORMAT(END_DATE, '%Y-%m-%d'), DATE_FORMAT(START_DATE, '%Y-%m-%d')) INTO vDaysBetween;
    
    SET vTotal = (vDaysBetween * vPrice);
    
    UPDATE room_in_reservation SET ROOM_TOTAL_PRICE = (vDaysBetween * vPrice) WHERE room_in_reservation.ROOM_IN_RESERVATION_ID = vRIR_ID;
    
    SELECT @vTotal;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-07 10:17:16
