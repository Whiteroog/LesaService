CREATE DATABASE  IF NOT EXISTS `db_lesaservice` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_lesaservice`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: db_lesaservice
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(100) NOT NULL,
  `product_id` int unsigned NOT NULL,
  `payment_status` enum('Ожидайте','Готово','Забран','Отменен') NOT NULL,
  `order_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` int unsigned NOT NULL DEFAULT '1',
  `total_price` float unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ProductFromProducts_idx` (`product_id`),
  KEY `fk_users_to_orders` (`login`),
  CONSTRAINT `fk_products_to_orders` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_users_to_orders` FOREIGN KEY (`login`) REFERENCES `users` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'User1',1,'Ожидайте','2022-07-22 20:23:59',1,101),(2,'User2',2,'Ожидайте','2022-07-22 20:23:59',1,111),(3,'User1',3,'Ожидайте','2022-07-22 20:23:59',1,135),(4,'User2',1,'Ожидайте','2022-07-22 20:23:59',1,101);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parts_in_orders`
--

DROP TABLE IF EXISTS `parts_in_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parts_in_orders` (
  `order_id` int unsigned NOT NULL,
  `part_id` int unsigned NOT NULL,
  `amount` int unsigned NOT NULL DEFAULT '1',
  UNIQUE KEY `order_id_and_part_id_UNIQUE` (`order_id`,`part_id`),
  CONSTRAINT `fk_orders_to_parts_in_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_products_to_parts_in_orders` FOREIGN KEY (`order_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parts_in_orders`
--

LOCK TABLES `parts_in_orders` WRITE;
/*!40000 ALTER TABLE `parts_in_orders` DISABLE KEYS */;
INSERT INTO `parts_in_orders` VALUES (1,7,4),(1,8,1),(1,9,1),(1,10,1),(1,11,1),(1,12,2),(1,13,3),(2,8,1),(2,9,1),(2,11,1),(2,12,2),(2,13,3),(2,14,4),(2,16,1),(3,8,1),(3,9,1),(3,11,1),(3,12,2),(3,14,4),(3,15,3),(3,16,1),(4,7,4),(4,8,1),(4,9,1),(4,10,1),(4,11,1),(4,12,2),(4,13,3);
/*!40000 ALTER TABLE `parts_in_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parts_in_products`
--

DROP TABLE IF EXISTS `parts_in_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parts_in_products` (
  `product_id` int unsigned NOT NULL,
  `part_id` int unsigned NOT NULL,
  `amount` int unsigned NOT NULL DEFAULT '1',
  UNIQUE KEY `product_id_and_part_id_UNIQUE` (`product_id`,`part_id`),
  KEY `fk_products_to_parts_in_products_part` (`part_id`),
  CONSTRAINT `fk_products_to_parts_in_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_products_to_parts_in_products_part` FOREIGN KEY (`part_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parts_in_products`
--

LOCK TABLES `parts_in_products` WRITE;
/*!40000 ALTER TABLE `parts_in_products` DISABLE KEYS */;
INSERT INTO `parts_in_products` VALUES (1,7,4),(1,8,1),(1,9,1),(1,10,1),(1,11,1),(1,12,2),(1,13,3),(2,8,1),(2,9,1),(2,11,1),(2,12,2),(2,13,3),(2,14,4),(2,16,1),(3,8,1),(3,9,1),(3,11,1),(3,12,2),(3,14,4),(3,15,3),(3,16,1);
/*!40000 ALTER TABLE `parts_in_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `category` enum('Запчасть','Конструкция') NOT NULL,
  `product_type` varchar(100) NOT NULL,
  `price` float unsigned NOT NULL DEFAULT '0',
  `description` mediumtext,
  `image_url` varchar(100) NOT NULL DEFAULT 'img/products/not-found.png',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_UNIQUE` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'СЛ-001','Конструкция','Строительные леса',101,NULL,'/img/products/scaffolding_section_1.jpg'),(2,'СЛ-002','Конструкция','Строительные леса',111,NULL,'/img/products/scaffolding_section_1.jpg'),(3,'СЛ-003','Конструкция','Строительные леса',135,NULL,'/img/products/scaffolding_section_1.jpg'),(4,'ВТ-001','Конструкция','Вышка-тура',60,NULL,'/img/products/tower-tour_section_1.jpg'),(5,'ВТ-002','Конструкция','Вышка-тура',75,NULL,'/img/products/tower-tour_section_1.jpg'),(6,'ВТ-003','Конструкция','Вышка-тура',90,NULL,'/img/products/tower-tour_section_1.jpg'),(7,'Башмак','Запчасть','Опора',2,NULL,'/img/products/not-found.png'),(8,'Рама с лестницей','Запчасть','Рама с лестницей',15,NULL,'/img/products/not-found.png'),(9,'Рама проходная','Запчасть','Рама проходная',12,NULL,'/img/products/not-found.png'),(10,'Диагональ','Запчасть','Крепления',5,NULL,'/img/products/not-found.png'),(11,'Горизонталь','Запчасть','Крепления',4,NULL,'/img/products/not-found.png'),(12,'Ригель','Запчасть','Крепления',3,NULL,'/img/products/not-found.png'),(13,'Настил деревянный','Запчасть','Настил',17,NULL,'/img/products/not-found.png'),(14,'Башмак укрепленный','Запчасть','Опора',4,NULL,'/img/products/not-found.png'),(15,'Настил железный','Запчасть','Настил',25,NULL,'/img/products/not-found.png'),(16,'Диагональ укрепленна','Запчасть','Крепления',7,NULL,'/img/products/not-found.png'),(17,'База','Запчасть','Опора',14,NULL,'/img/products/not-found.png'),(18,'Стабилизатор','Запчасть','Опора',30,NULL,'/img/products/not-found.png'),(19,'Лестница секции','Запчасть','Лестница',16,NULL,'/img/products/not-found.png'),(20,'Гантель секции','Запчасть','Крепления',6,NULL,'/img/products/not-found.png'),(21,'Стяжка секции','Запчасть','Крепления',4,NULL,'/img/products/not-found.png'),(22,'Перекладина ограждения','Запчасть','Крепления',4,NULL,'/img/products/not-found.png'),(23,'Стабилизатор укрепленный','Запчасть','Опора',40,NULL,'/img/products/not-found.png'),(24,'База на колесах','Запчасть','Опора',19,NULL,'/img/products/not-found.png');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_parameters`
--

DROP TABLE IF EXISTS `products_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_parameters` (
  `id` int unsigned NOT NULL,
  `parameter` enum('Длина','Высота','Ширина') NOT NULL,
  `value` float unsigned NOT NULL DEFAULT '0',
  KEY `id_and_parameter_UNIQUE` (`id`,`parameter`),
  CONSTRAINT `fk_products_to_products_parameters` FOREIGN KEY (`id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_parameters`
--

LOCK TABLES `products_parameters` WRITE;
/*!40000 ALTER TABLE `products_parameters` DISABLE KEYS */;
INSERT INTO `products_parameters` VALUES (1,'Ширина',0.7),(1,'Длина',1.8),(1,'Высота',1.7),(2,'Ширина',0.8),(2,'Длина',2),(2,'Высота',1.8),(3,'Ширина',0.9),(3,'Длина',2.1),(3,'Высота',2);
/*!40000 ALTER TABLE `products_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `login` varchar(100) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`login`),
  UNIQUE KEY `Email_UNIQUE` (`email`),
  UNIQUE KEY `Phone_UNIQUE` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('User1','$2y$10$9lVk98MPrbSR4KLzMMTAQ.vA4M/yvMi.6I7zgbf.anFZfJX9FTfXu','User1@gmail.com',NULL),('User2','$2y$10$GbP.l5AZf2me7LTVfGh5qukbrH7khotmVhLk0HOZJdpAU94j51/pK',NULL,'7925765825004');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_orders`
--

DROP TABLE IF EXISTS `view_orders`;
/*!50001 DROP VIEW IF EXISTS `view_orders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_orders` AS SELECT 
 1 AS `id`,
 1 AS `login`,
 1 AS `title`,
 1 AS `category`,
 1 AS `product_type`,
 1 AS `order_date`,
 1 AS `amount`,
 1 AS `total_price`,
 1 AS `image_url`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_orders_build_constr_detail`
--

DROP TABLE IF EXISTS `view_orders_build_constr_detail`;
/*!50001 DROP VIEW IF EXISTS `view_orders_build_constr_detail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_orders_build_constr_detail` AS SELECT 
 1 AS `order_id`,
 1 AS `part_id`,
 1 AS `part_title`,
 1 AS `part_category`,
 1 AS `part_type`,
 1 AS `price`,
 1 AS `amount`,
 1 AS `price_package_parts`,
 1 AS `price_package_parts_by_amount_orders`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_products_build_constr_detail`
--

DROP TABLE IF EXISTS `view_products_build_constr_detail`;
/*!50001 DROP VIEW IF EXISTS `view_products_build_constr_detail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_products_build_constr_detail` AS SELECT 
 1 AS `product_id`,
 1 AS `part_id`,
 1 AS `part_title`,
 1 AS `part_category`,
 1 AS `part_type`,
 1 AS `price`,
 1 AS `amount`,
 1 AS `price_package_parts`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_products_parameters`
--

DROP TABLE IF EXISTS `view_products_parameters`;
/*!50001 DROP VIEW IF EXISTS `view_products_parameters`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_products_parameters` AS SELECT 
 1 AS `id`,
 1 AS `parameter`,
 1 AS `value`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'db_lesaservice'
--
/*!50003 DROP FUNCTION IF EXISTS `calc_order_total_price` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calc_order_total_price`(target_id int) RETURNS int
    DETERMINISTIC
BEGIN

RETURN (select sum(price * amount) * (select amount from orders where orders.id = target_id)
			from parts_in_orders, products
				where parts_in_orders.order_id = target_id and 
					products.id = parts_in_orders.part_id
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `calc_product_total_price` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calc_product_total_price`(target_id int) RETURNS int
    DETERMINISTIC
BEGIN

RETURN (select sum(price * amount)
			from products, parts_in_products
				where products.id = parts_in_products.part_id and 
					parts_in_products.product_id = target_id
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_orders`
--

/*!50001 DROP VIEW IF EXISTS `view_orders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_orders` AS select `orders`.`id` AS `id`,`orders`.`login` AS `login`,`products`.`title` AS `title`,`products`.`category` AS `category`,`products`.`product_type` AS `product_type`,`orders`.`order_date` AS `order_date`,`orders`.`amount` AS `amount`,`orders`.`total_price` AS `total_price`,`products`.`image_url` AS `image_url` from (`orders` join `products` on((`orders`.`product_id` = `products`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_orders_build_constr_detail`
--

/*!50001 DROP VIEW IF EXISTS `view_orders_build_constr_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_orders_build_constr_detail` AS select `orders`.`id` AS `order_id`,`products`.`id` AS `part_id`,`products`.`title` AS `part_title`,`products`.`category` AS `part_category`,`products`.`product_type` AS `part_type`,`products`.`price` AS `price`,`parts_in_orders`.`amount` AS `amount`,(select (`products`.`price` * `parts_in_orders`.`amount`)) AS `price_package_parts`,(select ((`products`.`price` * `parts_in_orders`.`amount`) * `orders`.`amount`)) AS `price_package_parts_by_amount_orders` from ((`parts_in_orders` join `orders` on((`parts_in_orders`.`order_id` = `orders`.`id`))) join `products` on((`parts_in_orders`.`part_id` = `products`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_products_build_constr_detail`
--

/*!50001 DROP VIEW IF EXISTS `view_products_build_constr_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_products_build_constr_detail` AS select (select `products`.`id` from `products` where (`parts_in_products`.`product_id` = `products`.`id`)) AS `product_id`,`products`.`id` AS `part_id`,`products`.`title` AS `part_title`,`products`.`category` AS `part_category`,`products`.`product_type` AS `part_type`,`products`.`price` AS `price`,`parts_in_products`.`amount` AS `amount`,(select (`products`.`price` * `parts_in_products`.`amount`)) AS `price_package_parts` from (`products` join `parts_in_products` on((`products`.`id` = `parts_in_products`.`part_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_products_parameters`
--

/*!50001 DROP VIEW IF EXISTS `view_products_parameters`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_products_parameters` AS select `products`.`id` AS `id`,`products_parameters`.`parameter` AS `parameter`,`products_parameters`.`value` AS `value` from (`products` join `products_parameters` on((`products`.`id` = `products_parameters`.`id`))) where (`products`.`category` = 'Конструкция') */;
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

-- Dump completed on 2022-07-23 22:31:30
