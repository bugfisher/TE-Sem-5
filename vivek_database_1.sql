-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: vivek_database
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.16.04.1

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_no` bigint(20) DEFAULT NULL,
  `dob` date NOT NULL,
  `address` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (2,'raju','vivekdarak1000@gmail.com',9834008822,'1999-08-30','Nashik'),(3,'Tom','Tom_email@xyz.com',9988776655,'1989-09-12','Pune'),(4,'sam','sam_email@xyz.com',9878675641,'1999-08-03','Pune'),(5,'Tim','Tim_email@xyz.com',8909897867,'1997-07-05','Mumbai'),(6,'Ram','Ram_email@xyz.com',7890098767,'1996-04-04','Banglore'),(7,'Shyam','Shyam_email@xyz.com',9012345432,'1995-01-01','Nashik'),(8,'Sita','Sita_email@xyz.com',7172737456,'1996-04-03','Pune'),(9,'geeta','Geeta_email@xyz.com',9023467123,'1998-05-05','Mumbai'),(10,'Mohan','Mohan_email@xyz.com',8877665544,'1998-07-07','Banglore'),(11,'raju','Raju_email@xyz.com',9988012221,'1999-06-01','Nashik');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(20) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Laptop',50000,20),(2,'Television',20000,10),(3,'Smartphone',10000,50),(4,'SmartWatch',5000,1000),(5,'Headphones',7000,100),(6,'Speaker',9000,50),(7,'PowerBank',2000,500),(8,'Harddisk',6000,50),(9,'Mouse',600,300),(10,'SelfieStick',100,3000);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_order`
--

DROP TABLE IF EXISTS `product_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_order` (
  `order_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `product_order_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`p_id`),
  CONSTRAINT `product_order_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `customer` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_order`
--

LOCK TABLES `product_order` WRITE;
/*!40000 ALTER TABLE `product_order` DISABLE KEYS */;
INSERT INTO `product_order` VALUES (1,'2019-06-19 12:09:09',2,100000,1,2),(2,'2019-07-02 09:09:10',3,300,10,11),(3,'2019-05-10 10:09:50',2,18000,6,10),(4,'2019-04-15 11:15:18',1,20000,2,9),(5,'2019-04-15 12:15:20',2,10000,4,8),(6,'2019-05-17 12:15:20',3,21000,5,7),(7,'2019-08-29 13:17:21',5,10000,7,6),(8,'2019-08-21 12:17:12',3,18000,8,5),(9,'2019-10-26 14:12:12',4,2400,9,4),(9,'2019-10-26 14:12:12',5,500,10,4),(12,'2019-04-08 12:14:13',3,1500000,1,3),(9,'2019-10-26 14:12:12',25,2500,10,4),(8,'2019-08-21 12:17:12',5,45000,6,5),(13,'1995-11-16 11:15:14',3,300,10,9);
/*!40000 ALTER TABLE `product_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `test_view`
--

DROP TABLE IF EXISTS `test_view`;
/*!50001 DROP VIEW IF EXISTS `test_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `test_view` AS SELECT 
 1 AS `order_id`,
 1 AS `user_name`,
 1 AS `p_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `test_view1`
--

DROP TABLE IF EXISTS `test_view1`;
/*!50001 DROP VIEW IF EXISTS `test_view1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `test_view1` AS SELECT 
 1 AS `order_id`,
 1 AS `user_name`,
 1 AS `p_id`,
 1 AS `user_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `test_view2`
--

DROP TABLE IF EXISTS `test_view2`;
/*!50001 DROP VIEW IF EXISTS `test_view2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `test_view2` AS SELECT 
 1 AS `user_id`,
 1 AS `user_name`,
 1 AS `email`,
 1 AS `phone_no`,
 1 AS `dob`,
 1 AS `address`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `test_view`
--

/*!50001 DROP VIEW IF EXISTS `test_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `test_view` AS select `o`.`order_id` AS `order_id`,`c`.`user_name` AS `user_name`,`p`.`p_id` AS `p_id` from ((`customer` `c` join `product_order` `o` on((`o`.`user_id` = `c`.`user_id`))) join `product` `p` on((`p`.`p_id` = `o`.`product_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `test_view1`
--

/*!50001 DROP VIEW IF EXISTS `test_view1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `test_view1` AS select `o`.`order_id` AS `order_id`,`c`.`user_name` AS `user_name`,`p`.`p_id` AS `p_id`,`c`.`user_id` AS `user_id` from ((`customer` `c` join `product_order` `o` on((`o`.`user_id` = `c`.`user_id`))) join `product` `p` on((`p`.`p_id` = `o`.`product_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `test_view2`
--

/*!50001 DROP VIEW IF EXISTS `test_view2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `test_view2` AS select `customer`.`user_id` AS `user_id`,`customer`.`user_name` AS `user_name`,`customer`.`email` AS `email`,`customer`.`phone_no` AS `phone_no`,`customer`.`dob` AS `dob`,`customer`.`address` AS `address` from `customer` */;
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

-- Dump completed on 2019-07-24 12:51:00
