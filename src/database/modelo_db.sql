-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: product
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Portátiles','2024-07-07 17:31:57','2024-07-07 17:31:57'),(2,'Computadoras de Escritorio','2024-07-07 17:31:57','2024-07-07 17:31:57'),(3,'Impresoras','2024-07-07 17:31:57','2024-07-07 17:31:57'),(4,'Almacenamiento','2024-07-07 17:31:57','2024-07-07 17:31:57'),(5,'Componentes','2024-07-07 17:31:57','2024-07-07 17:31:57');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'88eb1422-b2ed-45b1-9a8c-e246c4188356',10,'2024-07-07 17:38:36','2024-07-07 17:38:36','2024-07-07 17:38:36'),(2,'b171e16f-16b9-4623-91ad-46a7880688c6',5,'2024-07-07 17:38:36','2024-07-07 17:38:36','2024-07-07 17:38:36'),(3,'e15bdc5d-8581-4f68-a5d1-219c2751cce6',7,'2024-07-07 17:38:36','2024-07-07 17:38:36','2024-07-07 17:38:36'),(4,'e3d8392e-3387-486b-a051-587a6402832f',20,'2024-07-07 17:38:36','2024-07-07 17:38:36','2024-07-07 17:38:36'),(5,'f159ba87-c3e8-442e-a7a6-4f35441f8a6b',15,'2024-07-07 17:38:36','2024-07-07 17:38:36','2024-07-07 17:38:36'),(6,'f62c6683-2726-465c-9ac6-a0ce2b94019a',30,'2024-07-07 17:38:36','2024-07-07 17:38:36','2024-07-07 17:38:36');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_categories` (
  `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `category_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_categories_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `product_categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES ('88eb1422-b2ed-45b1-9a8c-e246c4188356',1,'2024-07-07 17:46:20','2024-07-07 17:46:20'),('b171e16f-16b9-4623-91ad-46a7880688c6',2,'2024-07-07 17:46:20','2024-07-07 17:46:20'),('e15bdc5d-8581-4f68-a5d1-219c2751cce6',3,'2024-07-07 17:46:20','2024-07-07 17:46:20'),('e3d8392e-3387-486b-a051-587a6402832f',4,'2024-07-07 17:46:20','2024-07-07 17:46:20'),('f159ba87-c3e8-442e-a7a6-4f35441f8a6b',4,'2024-07-07 17:46:20','2024-07-07 17:46:20'),('f62c6683-2726-465c-9ac6-a0ce2b94019a',5,'2024-07-07 17:46:20','2024-07-07 17:46:20');
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_suppliers`
--

DROP TABLE IF EXISTS `product_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_suppliers` (
  `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`product_id`,`supplier_id`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `product_suppliers_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `product_suppliers_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_suppliers`
--

LOCK TABLES `product_suppliers` WRITE;
/*!40000 ALTER TABLE `product_suppliers` DISABLE KEYS */;
INSERT INTO `product_suppliers` VALUES ('88eb1422-b2ed-45b1-9a8c-e246c4188356',1,'2024-07-07 17:41:28','2024-07-07 17:41:28'),('b171e16f-16b9-4623-91ad-46a7880688c6',2,'2024-07-07 17:41:28','2024-07-07 17:41:28'),('e15bdc5d-8581-4f68-a5d1-219c2751cce6',3,'2024-07-07 17:41:28','2024-07-07 17:41:28'),('e3d8392e-3387-486b-a051-587a6402832f',4,'2024-07-07 17:41:28','2024-07-07 17:41:28'),('f159ba87-c3e8-442e-a7a6-4f35441f8a6b',4,'2024-07-07 17:41:28','2024-07-07 17:41:28'),('f62c6683-2726-465c-9ac6-a0ce2b94019a',5,'2024-07-07 17:41:28','2024-07-07 17:41:28');
/*!40000 ALTER TABLE `product_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `is_stock` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('88eb1422-b2ed-45b1-9a8c-e246c4188356','Notebook',106.00,0,'2024-06-15 19:53:58','2024-06-15 19:53:58'),('b171e16f-16b9-4623-91ad-46a7880688c6','PC',5.12,1,'2024-06-15 20:33:46','2024-06-15 20:33:46'),('e15bdc5d-8581-4f68-a5d1-219c2751cce6','Impresora',40.00,0,'2024-06-15 19:47:36','2024-06-15 19:47:36'),('e3d8392e-3387-486b-a051-587a6402832f','Disco Duro',98.00,1,'2024-06-15 19:25:07','2024-06-15 19:25:07'),('f159ba87-c3e8-442e-a7a6-4f35441f8a6b','SSD',567.00,0,'2024-06-15 19:54:00','2024-06-15 19:54:00'),('f62c6683-2726-465c-9ac6-a0ce2b94019a','Memoria RAM',597.00,1,'2024-06-15 19:47:30','2024-06-15 19:47:30');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(255) NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Proveedor 1','contacto1@example.com','2024-07-07 17:35:27','2024-07-07 17:35:27'),(2,'Proveedor 2','contacto2@example.com','2024-07-07 17:35:27','2024-07-07 17:35:27'),(3,'Proveedor 3','contacto3@example.com','2024-07-07 17:35:27','2024-07-07 17:35:27'),(4,'Proveedor 4','contacto4@example.com','2024-07-07 17:35:27','2024-07-07 17:35:27'),(5,'Proveedor 5','contacto5@example.com','2024-07-07 17:35:27','2024-07-07 17:35:27');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-08 19:11:32
