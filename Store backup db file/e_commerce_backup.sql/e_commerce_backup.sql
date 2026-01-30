-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: localhost    Database: e_commerce
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,4);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item` (
  `cart_id` int NOT NULL,
  `variant_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`cart_id`,`variant_id`),
  UNIQUE KEY `uq_cart_item` (`cart_id`,`variant_id`),
  KEY `variant_id` (`variant_id`),
  CONSTRAINT `cart_item_ibfk_2` FOREIGN KEY (`variant_id`) REFERENCES `product_variant` (`variant_id`),
  CONSTRAINT `fk_cart_item_cart` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
INSERT INTO `cart_item` VALUES (1,1,10);
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` enum('INACTIVE','ACTIVE','BLOCKED','DELETED') DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (4,'Khanh','khanh01','$2a$10$8S9NBHKnssomcOtT4Sm/lO9qBB06e4lwDUPKhr2jj1qZxqWldux3W','khanh01@gmail.com','INACTIVE','2026-01-28 15:19:00',NULL,NULL),(5,'Minh','minh02','$2a$10$CG.yCxDjbzWa8f7/ZNYE3eUclzLWo4.IP72UqOC565GPSYE4Sui0S','minh02@gmail.com','INACTIVE','2026-01-28 15:19:15',NULL,NULL),(6,'Tuan','tuan03','$2a$10$NQ09GZxmZpuQHMmKO80e1OI9XkfJdQn5aarOezaAMMNTDQQnSX9tK','tuan03@gmail.com','INACTIVE','2026-01-28 15:19:29',NULL,NULL),(7,'Hung','hung04','$2a$10$LYd57wwek7HzLazSwiRZg.q2/PfYMe0p0PWdqrSgRWcVs0kMkgfoC','hung04@gmail.com','INACTIVE','2026-01-28 15:19:42',NULL,NULL),(8,'Huy','huy05','$2a$10$iNI0lQZfZyFnUZfVJJhcKOGbyw0Qb4fskbS1hmCxNGMDk0oq27FWW','huy05@gmail.com','INACTIVE','2026-01-28 15:19:57',NULL,NULL),(9,'Nam','nam06','$2a$10$qiz7VQ9oSZZsuAMiJqQF/OgtEo/8OxQ5K3pvzfEGwoXhgTrcYz45y','nam06@gmail.com','INACTIVE','2026-01-28 15:20:11',NULL,NULL),(10,'Long','long07','$2a$10$A8BzJGHjv4YTD7VgJmx7I..i4LmGHumrKYWyVg/BzwtsL9XlffsEu','long07@gmail.com','INACTIVE','2026-01-28 15:20:23',NULL,NULL),(11,'Phuc','phuc08','$2a$10$BaKCGod1RO49R6oVElPhJukltKUBzc9WjKCDp2YdKKREbYZ/2MC1a','phuc08@gmail.com','INACTIVE','2026-01-28 15:20:36',NULL,NULL),(12,'Dat','dat09','$2a$10$NQ/Mqb.34K22PRNrbeITI.YZMO/kIUV6IH4c4Gq/bdy1.mdTPcdx2','dat09@gmail.com','INACTIVE','2026-01-28 15:20:45',NULL,NULL),(13,'An','an10','$2a$10$KA793YNNVdI4NXCypXu/COI3lwVAf0bZZwZ7RbB4PzyuUmsH/pHbi','an10@gmail.com','INACTIVE','2026-01-28 15:21:04',NULL,NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address`
--

DROP TABLE IF EXISTS `customer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_address` (
  `customer_address_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`customer_address_id`),
  KEY `fk_customer_address_customer` (`customer_id`),
  CONSTRAINT `fk_customer_address_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address`
--

LOCK TABLES `customer_address` WRITE;
/*!40000 ALTER TABLE `customer_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_category`
--

DROP TABLE IF EXISTS `global_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` int NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_category`
--

LOCK TABLES `global_category` WRITE;
/*!40000 ALTER TABLE `global_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `global_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_product_review`
--

DROP TABLE IF EXISTS `image_product_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image_product_review` (
  `review_id` int NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`review_id`,`path`),
  CONSTRAINT `fk_image_product_review` FOREIGN KEY (`review_id`) REFERENCES `product_review` (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_product_review`
--

LOCK TABLES `image_product_review` WRITE;
/*!40000 ALTER TABLE `image_product_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_product_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option_group`
--

DROP TABLE IF EXISTS `option_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `option_group` (
  `option_group_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`option_group_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `uk_option_group_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option_group`
--

LOCK TABLES `option_group` WRITE;
/*!40000 ALTER TABLE `option_group` DISABLE KEYS */;
INSERT INTO `option_group` VALUES (1,'COLOR'),(5,'PACKAGE'),(2,'SIZE'),(3,'STORAGE'),(4,'WEIGHT');
/*!40000 ALTER TABLE `option_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option_value`
--

DROP TABLE IF EXISTS `option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `option_value` (
  `option_value_id` int NOT NULL AUTO_INCREMENT,
  `option_group_id` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`option_value_id`),
  UNIQUE KEY `uk_option_value` (`option_group_id`,`name`),
  CONSTRAINT `option_value_ibfk_1` FOREIGN KEY (`option_group_id`) REFERENCES `option_group` (`option_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option_value`
--

LOCK TABLES `option_value` WRITE;
/*!40000 ALTER TABLE `option_value` DISABLE KEYS */;
INSERT INTO `option_value` VALUES (1,1,'DEN'),(3,1,'DO'),(2,1,'TRANG'),(4,1,'XANH'),(7,2,'L'),(6,2,'M'),(5,2,'S'),(8,2,'XL'),(10,3,'128GB'),(11,3,'256GB'),(9,3,'64GB'),(13,4,'1KG'),(12,4,'500G'),(14,4,'5KG'),(16,5,'PREMIUM'),(15,5,'STANDARD');
/*!40000 ALTER TABLE `option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `total_amount` int DEFAULT NULL,
  `status` enum('pending','paid','confirmed','processing','shipping','completed','cancelled','refunded') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `receiver_name` varchar(50) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `variant_id` int DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `unit_price` int NOT NULL,
  `quantity` int NOT NULL,
  `avatar_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `fk_order_id` (`order_id`),
  KEY `fk_order_item_product_variant` (`variant_id`),
  CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_order_item_product_variant` FOREIGN KEY (`variant_id`) REFERENCES `product_variant` (`variant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_voucher`
--

DROP TABLE IF EXISTS `order_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_voucher` (
  `order_id` int NOT NULL,
  `voucher_id` int NOT NULL,
  `discount_amount` int NOT NULL,
  PRIMARY KEY (`order_id`,`voucher_id`),
  KEY `voucher_id` (`voucher_id`),
  CONSTRAINT `order_voucher_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
  CONSTRAINT `order_voucher_ibfk_2` FOREIGN KEY (`voucher_id`) REFERENCES `voucher` (`voucher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_voucher`
--

LOCK TABLES `order_voucher` WRITE;
/*!40000 ALTER TABLE `order_voucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `shop_id` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `base_price` int NOT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT '1',
  `sold` int DEFAULT '0',
  `avg_rating` float DEFAULT '0',
  `num_rating` float DEFAULT '0',
  PRIMARY KEY (`product_id`),
  KEY `fk_shop_id_shop` (`shop_id`),
  CONSTRAINT `fk_shop_id_shop` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,5,'Wireless Bluetooth Headphone',850000,'High quality wireless headphone with noise cancellation','2025-01-01 09:00:00',1,120,5,1),(2,5,'Gaming Mechanical Keyboard',1250000,'RGB mechanical keyboard for gamers','2025-01-01 09:10:00',1,85,0,0),(3,5,'Wireless Mouse',450000,'Ergonomic wireless mouse','2025-01-01 09:20:00',1,200,0,0),(4,5,'USB-C Hub Adapter',390000,'Multi-port USB-C hub adapter','2025-01-01 09:30:00',1,60,0,0),(5,5,'Laptop Stand Aluminum',520000,'Adjustable aluminum laptop stand','2025-01-01 09:40:00',1,45,0,0),(6,6,'Men Basic T-Shirt',199000,'Cotton t-shirt for men','2025-01-02 10:00:00',1,300,0,0),(7,6,'Women Summer Dress',399000,'Elegant summer dress','2025-01-02 10:10:00',1,180,0,0),(8,6,'Unisex Hoodie',499000,'Warm hoodie for daily wear','2025-01-02 10:20:00',1,140,0,0),(9,6,'Jeans Slim Fit',550000,'Slim fit jeans','2025-01-02 10:30:00',1,95,0,0),(10,6,'Baseball Cap',149000,'Fashion baseball cap','2025-01-02 10:40:00',1,220,0,0),(11,7,'Facial Cleanser',159000,'Gentle facial cleanser','2025-01-03 08:00:00',1,400,0,0),(12,7,'Moisturizing Cream',289000,'Daily moisturizing cream','2025-01-03 08:10:00',1,260,0,0),(13,7,'Sunscreen SPF50',199000,'UV protection sunscreen','2025-01-03 08:20:00',1,310,0,0),(14,7,'Lipstick Matte',179000,'Matte lipstick long lasting','2025-01-03 08:30:00',1,190,0,0),(15,7,'Makeup Remover',129000,'Gentle makeup remover','2025-01-03 08:40:00',1,230,0,0),(16,8,'Ceramic Dinner Plate',99000,'High quality ceramic plate','2025-01-04 09:00:00',1,150,0,0),(17,8,'Non-stick Frying Pan',450000,'Durable non-stick pan','2025-01-04 09:10:00',1,110,0,0),(18,8,'Electric Kettle',390000,'Fast boiling electric kettle','2025-01-04 09:20:00',1,170,0,0),(19,8,'Food Storage Box Set',299000,'Plastic food storage box set','2025-01-04 09:30:00',1,90,0,0),(20,8,'Kitchen Knife Set',650000,'Stainless steel knife set','2025-01-04 09:40:00',1,70,0,0),(21,9,'Clean Code Book',320000,'A handbook of agile software craftsmanship','2025-01-05 09:00:00',1,210,0,0),(22,9,'Design Patterns Book',450000,'Elements of reusable object-oriented software','2025-01-05 09:10:00',1,160,0,0),(23,9,'Java Programming Guide',390000,'Comprehensive guide to Java programming','2025-01-05 09:20:00',1,180,0,0),(24,9,'Spring Boot In Action',420000,'Spring Boot practical development book','2025-01-05 09:30:00',1,140,0,0),(25,9,'Data Structures & Algorithms',480000,'Essential data structures and algorithms','2025-01-05 09:40:00',1,195,0,0),(26,10,'Organic Jasmine Rice 5kg',185000,'Premium organic jasmine rice','2025-01-06 08:00:00',1,320,0,0),(27,10,'Pure Honey 500ml',210000,'Natural pure honey from forest','2025-01-06 08:10:00',1,280,0,0),(28,10,'Roasted Coffee Beans 1kg',450000,'High quality roasted coffee beans','2025-01-06 08:20:00',1,350,0,0),(29,10,'Green Tea Leaves 500g',195000,'Fresh green tea leaves','2025-01-06 08:30:00',1,230,0,0),(30,10,'Dried Fruits Mix 1kg',260000,'Healthy mixed dried fruits','2025-01-06 08:40:00',1,190,0,0),(31,11,'Yoga Mat Anti-Slip',290000,'Anti-slip yoga mat for training','2025-01-07 09:00:00',1,260,0,0),(32,11,'Dumbbell Set 10kg',520000,'Home workout dumbbell set','2025-01-07 09:10:00',1,210,0,0),(33,11,'Running Shoes',1250000,'Comfortable running shoes','2025-01-07 09:20:00',1,170,0,0),(34,11,'Fitness Resistance Bands',180000,'Resistance bands for fitness training','2025-01-07 09:30:00',1,240,0,0),(35,11,'Sports Water Bottle',120000,'BPA free water bottle','2025-01-07 09:40:00',1,300,0,0),(36,12,'Dog Dry Food 5kg',480000,'Nutritious dry food for dogs','2025-01-08 08:00:00',1,310,0,0),(37,12,'Cat Wet Food Pack',350000,'Wet food pack for cats','2025-01-08 08:10:00',1,260,0,0),(38,12,'Pet Shampoo',150000,'Gentle shampoo for pets','2025-01-08 08:20:00',1,190,0,0),(39,12,'Dog Leash',180000,'Durable dog leash','2025-01-08 08:30:00',1,220,0,0),(40,12,'Pet Toy Ball',90000,'Funny toy ball for pets','2025-01-08 08:40:00',1,340,0,0),(41,13,'Baby Diapers Size M',320000,'Soft and absorbent baby diapers','2025-01-09 09:00:00',1,420,0,0),(42,13,'Baby Milk Formula 900g',520000,'Nutrition milk formula for baby','2025-01-09 09:10:00',1,360,0,0),(43,13,'Baby Feeding Bottle',180000,'Safe feeding bottle for baby','2025-01-09 09:20:00',1,290,0,0),(44,13,'Baby Wet Wipes Pack',120000,'Gentle wet wipes for baby','2025-01-09 09:30:00',1,410,0,0),(45,13,'Baby Stroller',3200000,'Convenient baby stroller','2025-01-09 09:40:00',1,95,0,0),(46,14,'Phone Case Shockproof',120000,'Shockproof phone case','2025-01-10 10:00:00',1,380,0,0),(47,14,'Wireless Earbuds',950000,'High quality wireless earbuds','2025-01-10 10:10:00',1,260,0,0),(48,14,'Fast Charging Cable',90000,'Type-C fast charging cable','2025-01-10 10:20:00',1,430,0,0),(49,14,'Power Bank 20000mAh',650000,'High capacity power bank','2025-01-10 10:30:00',1,310,0,0),(50,14,'Bluetooth Speaker Mini',780000,'Portable bluetooth speaker','2025-01-10 10:40:00',1,185,0,0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `category_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`category_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_category_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `global_category` (`category_id`),
  CONSTRAINT `product_category_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_image` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `product_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`image_id`),
  KEY `fk_image_product_id_product` (`product_id`),
  CONSTRAINT `fk_image_product_id_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_review`
--

DROP TABLE IF EXISTS `product_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_review` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `order_item_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `rating` int NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  KEY `fk_order_item_id_product_review` (`order_item_id`),
  KEY `fk_customer_id_product_review` (`customer_id`),
  CONSTRAINT `fk_customer_id_product_review` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `fk_order_item_id_product_review` FOREIGN KEY (`order_item_id`) REFERENCES `order_item` (`order_item_id`),
  CONSTRAINT `product_review_chk_1` CHECK (((`rating` >= 0) and (`rating` <= 5)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_review`
--

LOCK TABLES `product_review` WRITE;
/*!40000 ALTER TABLE `product_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variant`
--

DROP TABLE IF EXISTS `product_variant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variant` (
  `variant_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `sku` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  `avatar_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`variant_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_variant_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variant`
--

LOCK TABLES `product_variant` WRITE;
/*!40000 ALTER TABLE `product_variant` DISABLE KEYS */;
INSERT INTO `product_variant` VALUES (1,1,'abs',19000,190,NULL);
/*!40000 ALTER TABLE `product_variant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_voucher`
--

DROP TABLE IF EXISTS `product_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_voucher` (
  `product_id` int NOT NULL,
  `voucher_id` int NOT NULL,
  `discount_amount` int DEFAULT NULL,
  PRIMARY KEY (`product_id`,`voucher_id`),
  KEY `voucher_id` (`voucher_id`),
  CONSTRAINT `product_voucher_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `product_voucher_ibfk_2` FOREIGN KEY (`voucher_id`) REFERENCES `voucher` (`voucher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_voucher`
--

LOCK TABLES `product_voucher` WRITE;
/*!40000 ALTER TABLE `product_voucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment`
--

DROP TABLE IF EXISTS `shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipment` (
  `shipment_id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `shop_id` int DEFAULT NULL,
  `shipping_fee` int NOT NULL,
  `status` enum('PENDING','CONFIRMED','PICKED_UP','IN_TRANSIT','DELIVERED','FAILED','RETURNED','CANCELLED') DEFAULT NULL,
  `shipped_at` timestamp NOT NULL,
  PRIMARY KEY (`shipment_id`),
  KEY `fk_order_id_shipment` (`order_id`),
  KEY `fk_shipmet_shop_id_shop` (`shop_id`),
  CONSTRAINT `fk_order_id_shipment` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
  CONSTRAINT `fk_shipmet_shop_id_shop` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment`
--

LOCK TABLES `shipment` WRITE;
/*!40000 ALTER TABLE `shipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop` (
  `shop_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `avatar_path` varchar(255) DEFAULT NULL,
  `status` enum('PENDING','ACTIVE','SUSPENDED','CLOSED','BANNED') DEFAULT 'PENDING',
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`shop_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop`
--

LOCK TABLES `shop` WRITE;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
INSERT INTO `shop` VALUES (5,'Tech World Store','techworld01','$2a$10$MsnDsvWOzLPYf3BBO4zTauulP8RmnhQtsKM7IqVG19ehCuGnTmKu2','Hanoi','2026-01-28 15:25:49',NULL,'PENDING','techworld01@gmail.com'),(6,'Fashion House','fashion02','$2a$10$TaSI/0rePIDYp12vQLw3vuEA0Qbsv.y0MJaqpr.6knWelqFxwJ17i','Ho Chi Minh City','2026-01-28 15:26:00',NULL,'PENDING','fashion02@gmail.com'),(7,'Beauty Corner','beauty03','$2a$10$76P/48f0DHfE8MalCszlfuhfajajtVHX.rAwLItcY4LrGVImaVC9q','Da Nang','2026-01-28 15:26:10',NULL,'PENDING','beauty03@gmail.com'),(8,'Home Living Store','homeliving04','$2a$10$ew7ROrSELsWlsAvjbOBe9OonYFBuKtyOB9D21KpPWeLDpB5NiVctS','Hai Phong','2026-01-28 15:26:19',NULL,'PENDING','homeliving04@gmail.com'),(9,'Book Station','book05','$2a$10$HACYNkab0iBaWRuqigrj/ePjuHW2CUDWP3zZ4EIeXtkvHvvS.LzIu','Hanoi','2026-01-28 15:26:27',NULL,'PENDING','book05@gmail.com'),(10,'Food Mart Online','foodmart06','$2a$10$AEdU9blcdGrgaj3cmLJHOuKUtzi1s.G9wMpUsUBXDMxlSwfoMvWey','Can Tho','2026-01-28 15:26:37',NULL,'PENDING','foodmart06@gmail.com'),(11,'Sport Active Shop','sport07','$2a$10$hYrqDCtXLJIKHiCZ4x.tOetN28OHuhhJTpgalqguFVR91KnDGflka','Binh Duong','2026-01-28 15:26:47',NULL,'PENDING','sport07@gmail.com'),(12,'Pet Lover Store','pet08','$2a$10$AumJbpMJOVpounRtdLlZIeKGHIcSUYCxH31FnhK2rDUOyKgJQYskO','Dong Nai','2026-01-28 15:26:57',NULL,'PENDING','pet08@gmail.com'),(13,'Baby & Mom Care','baby09','$2a$10$eJOarH7oajCwf9VYc8DOC.QkUtJpsBVbBrK2nxnW09FXyfBUOGmCm','Bac Ninh','2026-01-28 15:27:06',NULL,'PENDING','baby09@gmail.com'),(14,'Digital Accessory Hub','accessory10','$2a$10$cy/Yn.iUlsmWPY4RcwuMaudWHo.RF1oXTQt1pDKIkA64br0FA1IVG','Hue','2026-01-28 15:27:19',NULL,'PENDING','accessory10@gmail.com'),(15,'Digital Accessory Hub 2','accessory11','$2a$10$fo5N85tqIjv7KUyxR3iNKeMhZxtfXKvKdC6mKUnxBtf4sdYPN7m3W','Hue','2026-01-30 15:05:58',NULL,'PENDING','accessory101@gmail.com'),(16,'quyenn','quyen','$2a$10$b/dHNnJu9P0zGgO.L9GA../PnZl2dcvgCOz28pD1xitkflymbzBCK','Hue','2026-01-30 15:22:55',NULL,'PENDING','accessory1012@gmail.com');
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_follower`
--

DROP TABLE IF EXISTS `shop_follower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_follower` (
  `shop_id` int NOT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`shop_id`,`customer_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `shop_follower_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`),
  CONSTRAINT `shop_follower_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_follower`
--

LOCK TABLES `shop_follower` WRITE;
/*!40000 ALTER TABLE `shop_follower` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_follower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variant_option`
--

DROP TABLE IF EXISTS `variant_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variant_option` (
  `variant_id` int NOT NULL,
  `option_value_id` int NOT NULL,
  PRIMARY KEY (`variant_id`,`option_value_id`),
  KEY `option_value_id` (`option_value_id`),
  CONSTRAINT `variant_option_ibfk_1` FOREIGN KEY (`variant_id`) REFERENCES `product_variant` (`variant_id`),
  CONSTRAINT `variant_option_ibfk_2` FOREIGN KEY (`option_value_id`) REFERENCES `option_value` (`option_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variant_option`
--

LOCK TABLES `variant_option` WRITE;
/*!40000 ALTER TABLE `variant_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `variant_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher`
--

DROP TABLE IF EXISTS `voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voucher` (
  `voucher_id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `voucher_type` enum('order','shipping','product','shop') DEFAULT NULL,
  `discount_type` enum('fixed','percent') DEFAULT NULL,
  `discout_value` int NOT NULL,
  `min_order_amount` int DEFAULT NULL,
  `max_discount` int NOT NULL,
  `start_at` timestamp NOT NULL,
  `end_at` timestamp NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher`
--

LOCK TABLES `voucher` WRITE;
/*!40000 ALTER TABLE `voucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-30 13:39:10
