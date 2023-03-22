CREATE DATABASE  IF NOT EXISTS `LittleLemonDB` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `LittleLemonDB`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: LittleLemonDB
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.22.04.2

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
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Address` (
  `AddressID` int NOT NULL AUTO_INCREMENT,
  `Street` varchar(255) DEFAULT NULL,
  `Street2` varchar(255) DEFAULT NULL,
  `PostalCode` varchar(45) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AddressID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES (1,'724, Parsley Lane',' Old Town','PO1985','Chicago'),(2,'334, Dill Square',' Lincoln Park',NULL,'Chicago'),(3,'879 Sage Street',' West Loop',NULL,'Chicago'),(4,'132  Bay Lane','NULL',NULL,'Chicago'),(5,'989 Thyme Square',' EdgeWater',NULL,'Chicago'),(6,'245 Dill Square',' Lincoln Park',NULL,'Chicago');
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bookings`
--

DROP TABLE IF EXISTS `Bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bookings` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `BookingDate` datetime NOT NULL,
  `TableNo` int DEFAULT NULL,
  `NoOfGuests` int DEFAULT '1',
  `CustomerID` int DEFAULT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `bookings_customer_id_fk_idx` (`CustomerID`),
  CONSTRAINT `bookings_customer_id_fk` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bookings`
--

LOCK TABLES `Bookings` WRITE;
/*!40000 ALTER TABLE `Bookings` DISABLE KEYS */;
INSERT INTO `Bookings` VALUES (1,'2023-03-17 15:30:00',1,2,2),(2,'2023-03-17 18:30:00',2,5,5),(3,'2023-03-18 18:30:00',1,2,3),(4,'2023-03-17 19:00:00',4,4,7),(5,'2023-03-17 19:30:00',6,2,8),(6,'2023-03-17 19:30:00',6,1,9),(7,'2023-03-17 19:30:00',8,2,10),(8,'2023-03-23 16:00:00',3,1,NULL);
/*!40000 ALTER TABLE `Bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cuisine`
--

DROP TABLE IF EXISTS `Cuisine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cuisine` (
  `CuisineID` int NOT NULL AUTO_INCREMENT,
  `Cuisine` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CuisineID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cuisine`
--

LOCK TABLES `Cuisine` WRITE;
/*!40000 ALTER TABLE `Cuisine` DISABLE KEYS */;
INSERT INTO `Cuisine` VALUES (1,'Greek'),(2,'Italian'),(3,'Turkish');
/*!40000 ALTER TABLE `Cuisine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Phone` varchar(45) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `AddressID` int DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  KEY `customer_address_id_fk_idx` (`AddressID`),
  CONSTRAINT `customer_address_id_fk` FOREIGN KEY (`AddressID`) REFERENCES `Address` (`AddressID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES (1,'Vanessa','McCarthy','757536378','vanessam@gmail.com',NULL),(2,'Marcos','Romero','757536379','marcosr@gmail.com',NULL),(3,'Hiroki','Yamane','757536376','hirokiy@gmail.com',NULL),(4,'Anna','Iverson','757536375','annai@gmail.com',NULL),(5,'Diana','Pinto','757536374','dianap@gmail.com',NULL),(6,'Altay','Ayhan','757636378','altaya@gmail.com',NULL),(7,'Jane','Murphy','753536379','janem@gmail.com',NULL),(8,'Laurina','Delgado','754536376','laurinad@gmail.com',NULL),(9,'Mike','Edwards','757236375','mikee@gmail.com',NULL),(10,'Karl','Pederson','757936374','karlp@gmail.com',NULL);
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Delivery`
--

DROP TABLE IF EXISTS `Delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Delivery` (
  `DeliveryID` int NOT NULL,
  `DeliveryStatus` varchar(45) NOT NULL,
  `DeliveryDate` datetime NOT NULL,
  `CustomerID` int NOT NULL,
  `AddressID` int DEFAULT NULL,
  `OrderID` int NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  KEY `delivery_order_id_fk_idx` (`OrderID`),
  KEY `delivery_address_id_fk_idx` (`AddressID`),
  CONSTRAINT `delivery_address_id_fk` FOREIGN KEY (`AddressID`) REFERENCES `Address` (`AddressID`) ON UPDATE CASCADE,
  CONSTRAINT `delivery_order_id_fk` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Delivery`
--

LOCK TABLES `Delivery` WRITE;
/*!40000 ALTER TABLE `Delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `Delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Drinks`
--

DROP TABLE IF EXISTS `Drinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Drinks` (
  `DrinkID` varchar(7) NOT NULL DEFAULT '0',
  `Drink` varchar(100) NOT NULL,
  `DrinkPrice` decimal(10,2) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DrinkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Drinks`
--

LOCK TABLES `Drinks` WRITE;
/*!40000 ALTER TABLE `Drinks` DISABLE KEYS */;
INSERT INTO `Drinks` VALUES ('DR:0001','Water',1.99,'Non-alcohol'),('DR:0002','Soda',3.99,'Non-alcohol'),('DR:0003','Heineken',5.00,'Alc0hol'),('DR:0004','Stout',7.99,'Alcohol'),('DR:0005','Calorosi red',30.00,'Red wine'),('DR:0006','Calorosi white',30.00,'White wine'),('DR:0007','Athens White wine',25.00,'wine'),('DR:0008','Corfu Red Wine',30.00,'Wine'),('DR:0009','Turkish Coffee',10.00,'Coffee'),('DR:0010','Turkish Coffee',10.00,'Coffee');
/*!40000 ALTER TABLE `Drinks` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `Drinks_BEFORE_INSERT` BEFORE INSERT ON `Drinks` FOR EACH ROW BEGIN
insert into KeyGen values (null);
set new.DrinkID = concat('DR:', lpad(last_insert_id(), 4, '0'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Employment`
--

DROP TABLE IF EXISTS `Employment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employment` (
  `EmploymentID` int NOT NULL AUTO_INCREMENT,
  `StaffID` int NOT NULL,
  `NewRoleID` int NOT NULL,
  `StartDate` date NOT NULL DEFAULT (curdate()),
  PRIMARY KEY (`EmploymentID`),
  KEY `employment_role_id_fk_idx` (`NewRoleID`),
  KEY `employment_staff_id_fk` (`StaffID`),
  CONSTRAINT `employment_role_id_fk` FOREIGN KEY (`NewRoleID`) REFERENCES `Role` (`RoleID`) ON UPDATE CASCADE,
  CONSTRAINT `employment_staff_id_fk` FOREIGN KEY (`StaffID`) REFERENCES `Staff` (`StaffID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employment`
--

LOCK TABLES `Employment` WRITE;
/*!40000 ALTER TABLE `Employment` DISABLE KEYS */;
INSERT INTO `Employment` VALUES (1,1,1,'2023-03-19'),(2,2,2,'2023-03-19'),(3,3,3,'2023-03-19'),(4,4,4,'2023-03-19'),(5,5,5,'2023-03-19'),(6,6,6,'2023-03-19'),(7,9,7,'2023-03-19');
/*!40000 ALTER TABLE `Employment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `HouseMenu`
--

DROP TABLE IF EXISTS `HouseMenu`;
/*!50001 DROP VIEW IF EXISTS `HouseMenu`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `HouseMenu` AS SELECT 
 1 AS `MenuID`,
 1 AS `MenuTitle`,
 1 AS `Cuisine`,
 1 AS `Price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Ingredients`
--

DROP TABLE IF EXISTS `Ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ingredients` (
  `IngredientID` int NOT NULL,
  `IngName` varchar(255) DEFAULT NULL,
  `Unit` varchar(45) DEFAULT NULL,
  `Qty` decimal(10,2) DEFAULT NULL,
  `Cost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`IngredientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ingredients`
--

LOCK TABLES `Ingredients` WRITE;
/*!40000 ALTER TABLE `Ingredients` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KeyGen`
--

DROP TABLE IF EXISTS `KeyGen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KeyGen` (
  `ID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KeyGen`
--

LOCK TABLES `KeyGen` WRITE;
/*!40000 ALTER TABLE `KeyGen` DISABLE KEYS */;
INSERT INTO `KeyGen` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27);
/*!40000 ALTER TABLE `KeyGen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Menu`
--

DROP TABLE IF EXISTS `Menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Menu` (
  `MenuID` varchar(10) NOT NULL DEFAULT '0',
  `MenuTitle` varchar(255) DEFAULT NULL,
  `CuisineID` int DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`MenuID`),
  UNIQUE KEY `MenuTitle_UNIQUE` (`MenuTitle`),
  KEY `menu_cuisine_id_fk_idx` (`CuisineID`),
  CONSTRAINT `menu_cuisine_id_fk` FOREIGN KEY (`CuisineID`) REFERENCES `Cuisine` (`CuisineID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Menu`
--

LOCK TABLES `Menu` WRITE;
/*!40000 ALTER TABLE `Menu` DISABLE KEYS */;
INSERT INTO `Menu` VALUES ('ME:0011','Yogurt delight',1,2.00),('ME:0012','Cream cookies',1,63.00),('ME:0013','Cheese cake & syrup',2,4.00),('ME:0014','Greek sally & olives',1,16.99),('ME:0015','Bean & bread',3,112.00),('ME:0016','Fam-fav pizza',2,18.00),('ME:0017','Corn kabasa',3,5.00),('ME:0018','Steamed rice & chicken',2,18.00),('ME:0019','Greek yoghurt',1,7.00),('ME:0020','Ice cream',3,60.00),('ME:0021','Cheesecake',1,4.00),('ME:0022','Greek salad',1,15.00),('ME:0023','Bean soup',3,12.00),('ME:0024','Pizza',2,15.00),('ME:0025','Kabasa',3,17.00),('ME:0026','Fruit salad',1,2.00),('ME:0027','Chocolate cookies',2,3.00);
/*!40000 ALTER TABLE `Menu` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `Menu_Keygen` BEFORE INSERT ON `Menu` FOR EACH ROW BEGIN
insert into KeyGen values (null);
set new.MenuID = concat('ME:', lpad(last_insert_id(), 4, '0'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `MenuItems`
--

DROP TABLE IF EXISTS `MenuItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MenuItems` (
  `MenuItemID` int NOT NULL AUTO_INCREMENT,
  `MenuID` varchar(7) NOT NULL,
  `RecipeID` int NOT NULL,
  PRIMARY KEY (`MenuItemID`),
  KEY `menu_id_fk_idx` (`MenuID`),
  KEY `menuitems_recipe_id_fk_idx` (`RecipeID`),
  CONSTRAINT `menu_id_fk` FOREIGN KEY (`MenuID`) REFERENCES `Menu` (`MenuID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `menuitems_recipe_id_fk` FOREIGN KEY (`RecipeID`) REFERENCES `RecipeItems` (`RecipeID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MenuItems`
--

LOCK TABLES `MenuItems` WRITE;
/*!40000 ALTER TABLE `MenuItems` DISABLE KEYS */;
INSERT INTO `MenuItems` VALUES (1,'ME:0012',2),(2,'ME:0013',3),(3,'ME:0011',16),(4,'ME:0012',17),(5,'ME:0014',4),(6,'ME:0014',19),(7,'ME:0015',5),(8,'ME:0015',11),(9,'ME:0016',20),(10,'ME:0016',6),(11,'ME:0017',21),(12,'ME:0018',22),(13,'ME:0018',23),(14,'ME:0019',1),(15,'ME:0020',2),(16,'ME:0021',3),(17,'ME:0022',4),(18,'ME:0023',5),(19,'ME:0024',6),(20,'ME:0025',7),(21,'ME:0026',16),(22,'ME:0027',17);
/*!40000 ALTER TABLE `MenuItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int NOT NULL,
  `ItemID` varchar(7) DEFAULT NULL,
  `MenuID` varchar(7) DEFAULT (if((substr(`ItemID`,1,2) = _utf8mb3'ME'),`ItemID`,NULL)),
  `DrinkID` varchar(7) DEFAULT (if((substr(`ItemID`,1,2) = _utf8mb3'DR'),`ItemID`,NULL)),
  `ItemQty` int NOT NULL,
  `OrderDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ItemPrice` decimal(10,2) DEFAULT NULL,
  `TotalCost` decimal(10,2) GENERATED ALWAYS AS ((`ItemPrice` * `ItemQty`)) STORED,
  PRIMARY KEY (`OrderID`),
  KEY `orders_customer_id_fk_idx` (`CustomerID`),
  KEY `orders_drink_id_fk_idx` (`DrinkID`),
  KEY `orders_menu_id_fk` (`MenuID`),
  CONSTRAINT `orders_customer_id_fk` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`) ON UPDATE CASCADE,
  CONSTRAINT `orders_drink_id_fk` FOREIGN KEY (`DrinkID`) REFERENCES `Drinks` (`DrinkID`) ON UPDATE CASCADE,
  CONSTRAINT `orders_menu_id_fk` FOREIGN KEY (`MenuID`) REFERENCES `Menu` (`MenuID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` (`OrderID`, `CustomerID`, `ItemID`, `MenuID`, `DrinkID`, `ItemQty`, `OrderDate`, `ItemPrice`) VALUES (3,3,'DR:0003',NULL,NULL,4,'2023-03-18 16:52:08',100.00),(4,3,'ME:0013',NULL,NULL,4,'2023-03-18 16:53:22',200.00),(5,3,'ME:0013',NULL,NULL,1,'2023-03-18 17:00:43',200.00),(6,7,'DR:0004',NULL,NULL,2,'2023-03-19 10:21:36',7.99);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `Update_ItemPrice` BEFORE INSERT ON `Orders` FOR EACH ROW BEGIN
if new.ItemID like 'ME%' then set new.ItemPrice = 
(select Price from Menu where Menu.MenuID = new.ItemID); 
else if new.ItemID like 'DR%' then set new.ItemPrice = 
(select DrinkPrice from Drinks where Drinks.DrinkID = new.ItemID);
end if;
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `OrdersView`
--

DROP TABLE IF EXISTS `OrdersView`;
/*!50001 DROP VIEW IF EXISTS `OrdersView`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `OrdersView` AS SELECT 
 1 AS `OrderID`,
 1 AS `ItemQty`,
 1 AS `TotalCost`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `RecipeIngredients`
--

DROP TABLE IF EXISTS `RecipeIngredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RecipeIngredients` (
  `RecipeIngredientID` int NOT NULL,
  `RecipeID` int NOT NULL,
  `IngredientID` int NOT NULL,
  PRIMARY KEY (`RecipeIngredientID`),
  KEY `ing_id_fk_idx` (`IngredientID`),
  KEY `recipeingr_recipe_id_fk_idx` (`RecipeID`),
  CONSTRAINT `ingredient_id_fk` FOREIGN KEY (`IngredientID`) REFERENCES `Ingredients` (`IngredientID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recipeingr_recipe_id_fk` FOREIGN KEY (`RecipeID`) REFERENCES `RecipeItems` (`RecipeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RecipeIngredients`
--

LOCK TABLES `RecipeIngredients` WRITE;
/*!40000 ALTER TABLE `RecipeIngredients` DISABLE KEYS */;
/*!40000 ALTER TABLE `RecipeIngredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RecipeItems`
--

DROP TABLE IF EXISTS `RecipeItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RecipeItems` (
  `RecipeID` int NOT NULL AUTO_INCREMENT,
  `RecipeName` varchar(45) NOT NULL,
  `RecipePrice` decimal(10,2) NOT NULL,
  `RecipeCourse` varchar(45) NOT NULL,
  PRIMARY KEY (`RecipeID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RecipeItems`
--

LOCK TABLES `RecipeItems` WRITE;
/*!40000 ALTER TABLE `RecipeItems` DISABLE KEYS */;
INSERT INTO `RecipeItems` VALUES (1,'Greek yoghurt',7.00,'Desserts'),(2,'Ice cream',60.00,'Desserts'),(3,'Cheesecake',4.00,'Desserts'),(4,'Greek salad',15.00,'Main Courses'),(5,'Bean soup',12.00,'Main Courses'),(6,'Pizza',15.00,'Main Courses'),(7,'Kabasa',17.00,'Main Courses'),(8,'Olives',5.00,'Starters'),(9,'Flatbread',5.00,'Starters'),(10,'Minestrone',8.00,'Starters'),(11,'Tomato bread',100.00,'Starters'),(12,'Falafel',7.00,'Starters'),(13,'Hummus',5.00,'Starters'),(16,'Fruit salad',2.00,'Desserts'),(17,'Chocolate cookies',3.00,'Desserts'),(18,'Almond syrup',1.00,'Toppings'),(19,'Olives',1.99,'Sides'),(20,'Milk shake',3.00,'Sides'),(21,'Corn soup',5.00,'Starters'),(22,'Rice',8.00,'Sides'),(23,'Chicken',10.00,'Sides');
/*!40000 ALTER TABLE `RecipeItems` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `RecipeItems_AFTER_UPDATE` AFTER UPDATE ON `RecipeItems` FOR EACH ROW BEGIN
update Menu, HouseMenu set Menu.Price = HouseMenu.Price where Menu.MenuID = HouseMenu.MenuID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Role` (
  `RoleID` int NOT NULL AUTO_INCREMENT,
  `Role` varchar(45) DEFAULT NULL,
  `Description` text,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
INSERT INTO `Role` VALUES (1,'Manager',NULL),(2,'Assistant Manager',NULL),(3,'Head Chef',NULL),(4,'Assistant Chef',NULL),(5,'Head Waiter',NULL),(6,'Receptionist',NULL),(7,'Data Engineer',NULL);
/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Staff` (
  `StaffID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Role` varchar(45) DEFAULT NULL,
  `RoleID` int DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Email` varchar(100) GENERATED ALWAYS AS (concat(`FirstName`,substr(`LastName`,1,1),_utf8mb3'@littlelemon.org')) STORED,
  `AddressID` int DEFAULT NULL,
  PRIMARY KEY (`StaffID`),
  UNIQUE KEY `StaffEmail_UNIQUE` (`Email`),
  KEY `addressID_idx` (`AddressID`),
  KEY `staff_role_id_fk_idx` (`RoleID`),
  CONSTRAINT `staff_address_id_fk` FOREIGN KEY (`AddressID`) REFERENCES `Address` (`AddressID`) ON UPDATE CASCADE,
  CONSTRAINT `staff_role_id_fk` FOREIGN KEY (`RoleID`) REFERENCES `Role` (`RoleID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
INSERT INTO `Staff` (`StaffID`, `FirstName`, `LastName`, `Role`, `RoleID`, `Salary`, `Phone`, `AddressID`) VALUES (1,'Mario','Gollini','Manager',1,50000.00,'351258074',1),(2,'Adrian','Gollini','Assistant Manager',2,45000.00,'351474048',2),(3,'Giorgos','Dioudis','Head Chef',3,45000.00,'351970582',3),(4,'Fatma','Kaya','Assistant Chef',4,35000.00,'351963569',4),(5,'Elena','Salvai','Head Waiter',5,33000.00,'351074198',5),(6,'John','Millar','Receptionist',6,30000.00,'351584508',6),(9,'Oseloka','Iweka','Data Engineer',7,100000.00,'352584859',NULL);
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `Staff_BEFORE_INSERT` BEFORE INSERT ON `Staff` FOR EACH ROW BEGIN
if new.Role <> any (select Role from Role)
then insert into Role(RoleID, Role) values (new.RoleID, new.Role);
end if;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `Staff_AFTER_INSERT` AFTER INSERT ON `Staff` FOR EACH ROW BEGIN
insert into Employment (StaffID, NewRoleID) values (new.StaffID, new.RoleID);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `role_change` BEFORE UPDATE ON `Staff` FOR EACH ROW BEGIN
if new.RoleID <> old.RoleID then
insert into Employment (StaffID, NewRoleID) select StaffID, new.RoleID from Staff;
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'LittleLemonDB'
--

--
-- Dumping routines for database 'LittleLemonDB'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `AddBooking`(IN new_DateTime DATETIME, IN new_tableNo INT, IN new_NoOfGuests INT, IN new_CustomerID INT)
BEGIN
    DECLARE booked_tableNo INT; 
    START TRANSACTION;
    SET booked_tableNo =(
        SELECT DISTINCT TableNO 
        FROM Bookings 
        WHERE DATE(BookingDate) = DATE(new_DateTime) 
        AND TableNo = new_tableNo); 
    INSERT INTO Bookings (BookingDate, TableNO, NoOfGuests, CustomerID) VALUES (new_DateTime, new_tableNo, new_NoOfGuests, new_CustomerID);
    IF booked_tableNo is NOT NULL THEN 
        SELECT CONCAT('Table ',new_tableNo,' is already booked for ',DATE(new_DateTime),' - booking cancelled') 
        AS 'Booking status'; 
        ROLLBACK;
    ELSE 
        SELECT 'New booking added' AS 'Booking Confirmation'; 
        COMMIT;
    END IF; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddValidBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `AddValidBooking`(IN new_DateTime DATETIME, IN new_tableNo INT)
BEGIN
    DECLARE booked_tableNo INT; 
    
    START TRANSACTION;
    
    SET booked_tableNo =(
        SELECT DISTINCT TableNO 
        FROM Bookings 
        WHERE DATE(BookingDate) = DATE(new_DateTime) 
        AND TableNo = new_tableNo); 
        
    INSERT INTO Bookings (BookingDate, TableNO) VALUES (new_DateTime, new_tableNo);
    
    IF booked_tableNo is NOT NULL THEN 
        SELECT CONCAT('Table ',new_tableNo,' is already booked for ',DATE(new_DateTime),' - booking cancelled') 
        AS 'Booking status'; 
        ROLLBACK;
        
    ELSE 
        SELECT CONCAT('Table ',new_tableNo,' is available for ', DATE(new_DateTime),' - booking accepted') 
        AS 'Booking status'; 
        COMMIT;
        
    END IF; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CancelBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `CancelBooking`(IN InBookingID INT)
BEGIN
    IF InBookingID IN (SELECT BookingID FROM Bookings) THEN 
        SELECT CONCAT('Booking ID ',InbookingID,' cancelled') 
        AS 'Booking Confirmation'; 
        DELETE FROM Bookings WHERE BookingID = InBookingID;
    ELSE 
        SELECT concat('Booking ID ',InBookingID,' does not exist') 
        AS 'Booking Confirmation'; 
    END IF; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CancelOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `CancelOrder`(in id int)
begin delete from Orders where OrderID = id; select concat('Order ',id,' is cancelled') as Confirmation; end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CheckBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `CheckBooking`(IN new_Date DATE, IN new_tableNo INT)
BEGIN 
    DECLARE booked_tableNo INT; 
    SET booked_tableNo =(
        SELECT DISTINCT TableNO 
        FROM Bookings 
        WHERE DATE(BookingDate) = new_Date 
        AND TableNo = new_tableNo); 
    IF booked_tableNo is not null THEN 
        SELECT CONCAT('Table ',new_tableNo,' is already booked for ',new_Date) 
        AS 'Booking status'; 
    ELSE 
    SELECT CONCAT('Table ',new_tableNo,' is available for ', new_Date) 
    AS 'Booking status'; 
    END IF; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMaxQty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `GetMaxQty`()
select max(ItemQty) as 'Max Quantity in Orders' from Orders ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OrderQty_over` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `OrderQty_over`(in amount int)
begin select M.MenuTitle as Product from Menu M inner join Orders O on M.MenuID = O.ItemID where M.MenuID = any (select ItemID from Orders where ItemID like 'ME%' and ItemQty >= amount) union select D.Drink as Product from Drinks D inner join Orders O on D.DrinkID = O.ItemID where D.DrinkID = any (select ItemID from Orders where ItemID like 'DR%' and ItemQty >= amount); end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Show_Order_Over` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `Show_Order_Over`(in amount int)
begin 
        select C.CustomerID, concat(C.FirstName, ' ',C.LastName) as FullName,
        O.OrderID, O.TotalCost, D.Drink as Product 
        from Customers C inner join Orders O 
        on C.CustomerID = O.CustomerID inner join Drinks D 
        on D.DrinkID = O.ItemID 
        where O.TotalCost >= amount
        union
        select C.CustomerID, concat(C.FirstName, ' ',C.LastName) as FullName,
        O.OrderID, O.TotalCost, M.MenuTitle as Product 
        from Customers C inner join Orders O 
        on C.CustomerID = O.CustomerID inner join Menu M 
        on M.MenuID = O.ItemID 
        where O.TotalCost >= amount
   ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `UpdateBooking`(IN InBookingID INT, IN InBookingDate DATETIME)
BEGIN     START TRANSACTION;     UPDATE Bookings SET BookingDate = InBookingDate WHERE BookingID = InBookingID;     IF InBookingID = ANY (SELECT BookingID FROM Bookings) THEN          SELECT CONCAT('Booking ID ',InBookingID,' updated')          AS 'Booking Confirmation';          COMMIT;     ELSE          SELECT 'Booking ID does not exist' AS 'Booking Confirmation';          ROLLBACK;     END IF;  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `HouseMenu`
--

/*!50001 DROP VIEW IF EXISTS `HouseMenu`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `HouseMenu` AS select `Menu`.`MenuID` AS `MenuID`,`Menu`.`MenuTitle` AS `MenuTitle`,`Cuisine`.`Cuisine` AS `Cuisine`,sum(`RecipeItems`.`RecipePrice`) AS `Price` from (((`Cuisine` join `Menu` on((`Cuisine`.`CuisineID` = `Menu`.`CuisineID`))) join `MenuItems` on((`Menu`.`MenuID` = `MenuItems`.`MenuID`))) join `RecipeItems` on((`MenuItems`.`RecipeID` = `RecipeItems`.`RecipeID`))) group by `MenuItems`.`MenuID` order by `Menu`.`MenuID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `OrdersView`
--

/*!50001 DROP VIEW IF EXISTS `OrdersView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `OrdersView` AS select `Orders`.`OrderID` AS `OrderID`,`Orders`.`ItemQty` AS `ItemQty`,`Orders`.`TotalCost` AS `TotalCost` from `Orders` where (`Orders`.`ItemQty` >= 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-22 22:08:32
