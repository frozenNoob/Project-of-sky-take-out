-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sky-admin
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Current Database: `sky-admin`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sky-admin` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `sky-admin`;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '姓名',
  `username` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '身份证号',
  `status` int NOT NULL DEFAULT '1' COMMENT '状态 0:禁用，1:启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `update_user` bigint DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='员工信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'管理员','admin','e10adc3949ba59abbe56e057f20f883e','13812312312','1','110101199001010047',1,'2022-02-15 15:51:20','2022-02-17 09:16:20',10,1),(2,'xiaoho','原始人','e10adc3949ba59abbe56e057f20f883e','17818100976','1','112233445566778899',1,'2024-08-16 17:13:25','2024-08-16 17:13:25',1,2),(3,'吴辉','lili','e10adc3949ba59abbe56e057f20f883e','17818100911','1','431126200410300151',1,'2024-08-16 17:17:17','2024-08-16 17:17:17',3,5),(6,'迈克尔的杰克孙','jack','e10adc3949ba59abbe56e057f20f883e','13812344321','1','111222333444555666',1,'2024-08-16 21:49:22','2024-08-18 21:55:25',1,1),(7,'吴小','wuxiao','e10adc3949ba59abbe56e057f20f883e','17818100975','0','431126200410300152',0,'2024-11-06 22:02:59','2024-11-06 22:02:59',1,1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `sky-cart`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sky-cart` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `sky-cart`;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '商品名称',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '图片',
  `user_id` bigint NOT NULL COMMENT '主键',
  `dish_id` bigint DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT '1' COMMENT '数量',
  `amount` decimal(10,2) NOT NULL COMMENT '金额',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='购物车';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
INSERT INTO `shopping_cart` VALUES (111,'北冰洋2','https://sky-itcast.oss-cn-beijing.aliyuncs.com/4451d4be-89a2-4939-9c69-3a87151cb979.png',7,47,NULL,'{}',12,4.00,'2025-02-03 21:57:59');
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `undo_log`
--

DROP TABLE IF EXISTS `undo_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `undo_log` (
  `branch_id` bigint NOT NULL COMMENT 'branch transaction id',
  `xid` varchar(128) NOT NULL COMMENT 'global transaction id',
  `context` varchar(128) NOT NULL COMMENT 'undo_log context,such as serialization',
  `rollback_info` longblob NOT NULL COMMENT 'rollback info',
  `log_status` int NOT NULL COMMENT '0:normal status,1:defense status',
  `log_created` datetime(6) NOT NULL COMMENT 'create datetime',
  `log_modified` datetime(6) NOT NULL COMMENT 'modify datetime',
  UNIQUE KEY `ux_undo_log` (`xid`,`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='AT transaction mode undo table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `undo_log`
--

LOCK TABLES `undo_log` WRITE;
/*!40000 ALTER TABLE `undo_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `undo_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `sky-item`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sky-item` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `sky-item`;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int DEFAULT NULL COMMENT '类型   1 菜品分类 2 套餐分类',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '分类名称',
  `sort` int NOT NULL DEFAULT '0' COMMENT '顺序',
  `status` int DEFAULT NULL COMMENT '分类状态 0:禁用，1:启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `update_user` bigint DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_category_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='菜品及套餐分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (11,1,'酒水饮料',10,1,'2022-06-09 22:09:18','2022-06-09 22:09:18',1,1),(12,1,'传统主食',9,1,'2022-06-09 22:09:32','2022-06-09 22:18:53',1,1),(13,2,'人气王套餐plus',12,1,'2022-06-09 22:11:38','2024-08-18 22:39:29',1,1),(15,2,'商务套餐',13,1,'2022-06-09 22:14:10','2022-06-10 11:04:48',1,1),(16,1,'蜀味烤鱼',4,1,'2022-06-09 22:15:37','2022-08-31 14:27:25',1,1),(17,1,'蜀味牛蛙',5,1,'2022-06-09 22:16:14','2022-08-31 14:39:44',1,1),(18,1,'特色蒸菜',6,1,'2022-06-09 22:17:42','2022-06-09 22:17:42',1,1),(19,1,'新鲜时蔬',7,1,'2022-06-09 22:18:12','2022-06-09 22:18:28',1,1),(20,1,'水煮鱼',8,1,'2022-06-09 22:22:29','2022-06-09 22:23:45',1,1),(21,1,'汤类',11,1,'2022-06-10 10:51:47','2022-06-10 10:51:47',1,1),(23,1,'酸味烤鱼',0,0,'2024-08-18 22:24:59','2024-08-18 22:24:59',1,1),(24,1,'原味酸奶',1,0,'2024-08-18 22:37:53','2024-08-18 22:37:53',1,1),(25,2,'酸奶',3,1,'2024-08-18 22:38:02','2024-08-18 22:39:55',1,1),(26,1,'草莓味酸奶',2,0,'2024-08-18 22:38:21','2024-08-18 22:38:21',1,1),(28,1,'芒果味酸奶',6,0,'2024-08-21 17:13:21','2024-08-21 17:13:21',1,1),(29,2,'双拼套餐',1,1,'2024-11-04 18:03:57','2024-11-04 18:06:50',1,1),(30,1,'肉类',1,1,'2024-11-04 18:10:36','2024-11-04 18:11:03',1,1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish`
--

DROP TABLE IF EXISTS `dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '菜品名称',
  `category_id` bigint NOT NULL COMMENT '菜品分类id',
  `price` decimal(10,2) DEFAULT NULL COMMENT '菜品价格',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '图片',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '描述信息',
  `status` int DEFAULT '1' COMMENT '0 停售 1 起售',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `update_user` bigint DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dish_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='菜品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` VALUES (46,'王老吉',11,6.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png','',1,'2022-06-09 22:40:47','2022-06-09 22:40:47',1,1),(47,'北冰洋',11,4.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4451d4be-89a2-4939-9c69-3a87151cb979.png','还是小时候的味道',1,'2022-06-10 09:18:49','2022-06-10 09:18:49',1,1),(48,'雪花啤酒',11,4.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/bf8cbfc1-04d2-40e8-9826-061ee41ab87c.png','',1,'2022-06-10 09:22:54','2022-06-10 09:22:54',1,1),(49,'米饭',12,2.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/76752350-2121-44d2-b477-10791c23a8ec.png','精选五常大米',1,'2022-06-10 09:30:17','2022-06-10 09:30:17',1,1),(50,'馒头',12,1.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/475cc599-8661-4899-8f9e-121dd8ef7d02.png','优质面粉',1,'2022-06-10 09:34:28','2022-06-10 09:34:28',1,1),(51,'老坛酸菜鱼',20,56.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4a9cefba-6a74-467e-9fde-6e687ea725d7.png','原料：汤，草鱼，酸菜',1,'2022-06-10 09:40:51','2024-08-23 23:18:13',1,1),(52,'经典酸菜鮰鱼',20,66.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/5260ff39-986c-4a97-8850-2ec8c7583efc.png','原料：酸菜，江团，鮰鱼',1,'2022-06-10 09:46:02','2022-06-10 09:46:02',1,1),(53,'蜀味水煮草鱼',20,38.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a6953d5a-4c18-4b30-9319-4926ee77261f.png','原料：草鱼，汤',1,'2022-06-10 09:48:37','2022-06-10 09:48:37',1,1),(54,'清炒小油菜',19,18.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/3613d38e-5614-41c2-90ed-ff175bf50716.png','原料：小油菜',1,'2022-06-10 09:51:46','2022-06-10 09:51:46',1,1),(55,'蒜蓉娃娃菜',19,18.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4879ed66-3860-4b28-ba14-306ac025fdec.png','原料：蒜，娃娃菜',1,'2022-06-10 09:53:37','2022-06-10 09:53:37',1,1),(56,'清炒西兰花',19,18.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/e9ec4ba4-4b22-4fc8-9be0-4946e6aeb937.png','原料：西兰花',1,'2022-06-10 09:55:44','2022-06-10 09:55:44',1,1),(57,'炝炒圆白菜',19,18.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/22f59feb-0d44-430e-a6cd-6a49f27453ca.png','原料：圆白菜',1,'2022-06-10 09:58:35','2022-06-10 09:58:35',1,1),(58,'清蒸鲈鱼',18,98.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c18b5c67-3b71-466c-a75a-e63c6449f21c.png','原料：鲈鱼',1,'2022-06-10 10:12:28','2022-06-10 10:12:28',1,1),(59,'东坡肘子',18,138.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a80a4b8c-c93e-4f43-ac8a-856b0d5cc451.png','原料：猪肘棒',1,'2022-06-10 10:24:03','2022-06-10 10:24:03',1,1),(60,'梅菜扣肉',18,58.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/6080b118-e30a-4577-aab4-45042e3f88be.png','原料：猪肉，梅菜',1,'2022-06-10 10:26:03','2022-06-10 10:26:03',1,1),(61,'剁椒鱼头',18,66.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/13da832f-ef2c-484d-8370-5934a1045a06.png','原料：鲢鱼，剁椒',1,'2022-06-10 10:28:54','2022-06-10 10:28:54',1,1),(63,'香锅牛蛙',17,88.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/f5ac8455-4793-450c-97ba-173795c34626.png','配料：鲜活牛蛙，莲藕，青笋',1,'2022-06-10 10:35:40','2022-06-10 10:35:40',1,1),(65,'草鱼2斤',16,68.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/b544d3ba-a1ae-4d20-a860-81cb5dec9e03.png','原料：草鱼，黄豆芽，莲藕',1,'2022-06-10 10:41:08','2024-08-23 23:17:33',1,1),(66,'江团鱼2斤',16,119.00,'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a101a1e9-8f8b-47b2-afa4-1abd47ea0a87.png','配料：江团鱼，黄豆芽，莲藕',1,'2022-06-10 10:42:42','2022-06-10 10:42:42',1,1),(70,'奶茶',11,8.00,'https://sky-take-out-wb333.oss-cn-beijing.aliyuncs.com/c7ba9ce3-00bd-41b0-ae72-c1858274035c.jpeg','',1,'2024-08-22 18:37:07','2024-08-23 15:49:50',1,1),(71,'猪脚饭',30,12.00,'https://sky-take-out-cwj333.oss-cn-beijing.aliyuncs.com/de833fda-0e7a-4706-8c9e-4dff4b010668.png','',1,'2024-11-04 18:11:42','2024-11-04 18:12:33',1,1),(72,'奶茶1',11,12.00,'https://sky-take-out-cwj333.oss-cn-beijing.aliyuncs.com/65130814-239b-4a2b-b946-00ac22da8fd1.jpg','',1,'2024-11-28 23:32:29','2024-11-28 23:32:29',1,1),(73,'奶茶2',11,14.00,'https://sky-take-out-cwj333.oss-cn-beijing.aliyuncs.com/c5865efe-6ceb-4666-bb0b-2721da1639ef.jpg','',1,'2024-11-28 23:49:25','2025-02-04 19:33:06',1,1);
/*!40000 ALTER TABLE `dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish_flavor`
--

DROP TABLE IF EXISTS `dish_flavor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish_flavor` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dish_id` bigint NOT NULL COMMENT '菜品',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '口味名称',
  `value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '口味数据list',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='菜品口味关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish_flavor`
--

LOCK TABLES `dish_flavor` WRITE;
/*!40000 ALTER TABLE `dish_flavor` DISABLE KEYS */;
INSERT INTO `dish_flavor` VALUES (40,10,'甜味','[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]'),(41,7,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(42,7,'温度','[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]'),(45,6,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(46,6,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(47,5,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(48,5,'甜味','[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]'),(49,2,'甜味','[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]'),(50,4,'甜味','[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]'),(51,3,'甜味','[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]'),(52,3,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(86,52,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(87,52,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(88,51,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(89,51,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(92,53,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(93,53,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(94,54,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\"]'),(95,56,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(96,57,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(97,60,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(101,66,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(103,65,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(106,70,'甜味','[\"无糖\",\"少糖\",\"半糖\",\"全糖\"]'),(107,70,'温度','[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]'),(108,71,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(109,72,'甜味','[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]'),(112,73,'甜味','[\"无糖\",\"少糖\",\"半糖\"]'),(113,73,'温度','[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]');
/*!40000 ALTER TABLE `dish_flavor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setmeal`
--

DROP TABLE IF EXISTS `setmeal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setmeal` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` bigint NOT NULL COMMENT '菜品分类id',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '套餐名称',
  `price` decimal(10,2) NOT NULL COMMENT '套餐价格',
  `status` int DEFAULT '1' COMMENT '售卖状态 0:停售 1:起售',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '描述信息',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '图片',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `update_user` bigint DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_setmeal_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='套餐';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setmeal`
--

LOCK TABLES `setmeal` WRITE;
/*!40000 ALTER TABLE `setmeal` DISABLE KEYS */;
INSERT INTO `setmeal` VALUES (33,15,'鱼多多',9899.00,1,'鱼越多越便宜','https://sky-take-out-wb333.oss-cn-beijing.aliyuncs.com/643a286c-f354-4a6c-9d06-3d2892ba45d0.jpeg','2024-08-23 22:23:02','2024-08-23 23:18:18',1,1),(34,15,'全是蔬菜',55.00,1,'','https://sky-take-out-wb333.oss-cn-beijing.aliyuncs.com/414f094a-5489-4cb7-be71-f9f5731f48f1.jpeg','2024-08-23 22:24:18','2024-11-04 17:38:35',1,1),(35,29,'猪脚饭拼腊肠',20.00,1,'测试用','https://sky-take-out-cwj333.oss-cn-beijing.aliyuncs.com/56e8ea31-e11a-4f43-abb0-7e695af0e042.png','2024-11-04 18:08:10','2024-11-04 18:13:07',1,1);
/*!40000 ALTER TABLE `setmeal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setmeal_dish`
--

DROP TABLE IF EXISTS `setmeal_dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setmeal_dish` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `setmeal_id` bigint DEFAULT NULL COMMENT '套餐id',
  `dish_id` bigint DEFAULT NULL COMMENT '菜品id',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '菜品名称 （冗余字段）',
  `price` decimal(10,2) DEFAULT NULL COMMENT '菜品单价（冗余字段）',
  `copies` int DEFAULT NULL COMMENT '菜品份数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='套餐菜品关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setmeal_dish`
--

LOCK TABLES `setmeal_dish` WRITE;
/*!40000 ALTER TABLE `setmeal_dish` DISABLE KEYS */;
INSERT INTO `setmeal_dish` VALUES (53,34,54,'清炒小油菜',18.00,4),(54,34,55,'蒜蓉娃娃菜',18.00,1),(55,34,56,'清炒西兰花',18.00,1),(56,33,51,'老坛酸菜鱼',56.00,2),(57,33,52,'经典酸菜鮰鱼',66.00,1),(60,35,71,'猪脚饭',12.00,1),(61,35,48,'雪花啤酒',4.00,1),(62,35,49,'米饭',2.00,1);
/*!40000 ALTER TABLE `setmeal_dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `undo_log`
--

DROP TABLE IF EXISTS `undo_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `undo_log` (
  `branch_id` bigint NOT NULL COMMENT 'branch transaction id',
  `xid` varchar(128) NOT NULL COMMENT 'global transaction id',
  `context` varchar(128) NOT NULL COMMENT 'undo_log context,such as serialization',
  `rollback_info` longblob NOT NULL COMMENT 'rollback info',
  `log_status` int NOT NULL COMMENT '0:normal status,1:defense status',
  `log_created` datetime(6) NOT NULL COMMENT 'create datetime',
  `log_modified` datetime(6) NOT NULL COMMENT 'modify datetime',
  UNIQUE KEY `ux_undo_log` (`xid`,`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='AT transaction mode undo table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `undo_log`
--

LOCK TABLES `undo_log` WRITE;
/*!40000 ALTER TABLE `undo_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `undo_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `sky-order`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sky-order` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `sky-order`;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '名字',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '图片',
  `order_id` bigint NOT NULL COMMENT '订单id',
  `dish_id` bigint DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '口味（如全糖少冰），注意区分这不是dish_flavor表中的那种全范围的value',
  `number` int NOT NULL DEFAULT '1' COMMENT '数量',
  `amount` decimal(10,2) NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='订单明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (5,'鱼多多','https://sky-take-out-wb333.oss-cn-beijing.aliyuncs.com/643a286c-f354-4a6c-9d06-3d2892ba45d0.jpeg',4,NULL,33,NULL,1,9899.00),(6,'王老吉','https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png',5,46,NULL,'{}',1,6.00),(7,'奶茶','https://sky-take-out-wb333.oss-cn-beijing.aliyuncs.com/c7ba9ce3-00bd-41b0-ae72-c1858274035c.jpeg',5,70,NULL,'{\"甜味\":\"少糖\",\"温度\":\"多冰\"}',1,8.00),(8,'王老吉','https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png',6,46,NULL,'{}',1,6.00),(9,'北冰洋','https://sky-itcast.oss-cn-beijing.aliyuncs.com/4451d4be-89a2-4939-9c69-3a87151cb979.png',6,47,NULL,'{}',2,4.00),(10,'奶茶','https://sky-take-out-wb333.oss-cn-beijing.aliyuncs.com/c7ba9ce3-00bd-41b0-ae72-c1858274035c.jpeg',7,70,NULL,'{\"甜味\":\"半糖\",\"温度\":\"少冰\"}',3,8.00),(11,'猪脚饭','https://sky-take-out-cwj333.oss-cn-beijing.aliyuncs.com/de833fda-0e7a-4706-8c9e-4dff4b010668.png',7,71,NULL,'{\"甜味\":\"半糖\",\"温度\":\"少冰\",\"辣度\":\"重辣\"}',3,12.00),(12,'奶茶1','https://sky-take-out-cwj333.oss-cn-beijing.aliyuncs.com/65130814-239b-4a2b-b946-00ac22da8fd1.jpg',8,72,NULL,'{\"甜味\":\"少糖\"}',3,12.00),(13,'猪脚饭拼腊肠','https://sky-take-out-cwj333.oss-cn-beijing.aliyuncs.com/56e8ea31-e11a-4f43-abb0-7e695af0e042.png',8,NULL,35,NULL,2,20.00),(14,'猪脚饭拼腊肠','https://sky-take-out-cwj333.oss-cn-beijing.aliyuncs.com/56e8ea31-e11a-4f43-abb0-7e695af0e042.png',9,NULL,35,NULL,9,20.00),(15,'蜀味水煮草鱼','https://sky-itcast.oss-cn-beijing.aliyuncs.com/a6953d5a-4c18-4b30-9319-4926ee77261f.png',9,53,NULL,'{\"忌口\":\"不要香菜\",\"辣度\":\"中辣\"}',2,38.00),(16,'鱼多多','https://sky-take-out-wb333.oss-cn-beijing.aliyuncs.com/643a286c-f354-4a6c-9d06-3d2892ba45d0.jpeg',9,NULL,33,NULL,1,9899.00),(17,'炝炒圆白菜','https://sky-itcast.oss-cn-beijing.aliyuncs.com/22f59feb-0d44-430e-a6cd-6a49f27453ca.png',9,57,NULL,'{\"忌口\":\"不要香菜\"}',1,18.00),(18,'全是蔬菜','https://sky-take-out-wb333.oss-cn-beijing.aliyuncs.com/414f094a-5489-4cb7-be71-f9f5731f48f1.jpeg',10,NULL,34,NULL,1,55.00),(19,'王老吉','https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png',10,46,NULL,'{}',1,6.00),(20,'经典酸菜鮰鱼','https://sky-itcast.oss-cn-beijing.aliyuncs.com/5260ff39-986c-4a97-8850-2ec8c7583efc.png',11,52,NULL,'{\"忌口\":\"不要蒜\",\"辣度\":\"重辣\"}',1,66.00),(21,'王老吉','https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png',11,46,NULL,'{}',1,6.00),(22,'北冰洋','https://sky-itcast.oss-cn-beijing.aliyuncs.com/4451d4be-89a2-4939-9c69-3a87151cb979.png',11,47,NULL,'{}',1,4.00),(23,'王老吉','https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png',12,46,NULL,'{}',5,6.00),(24,'炝炒圆白菜','https://sky-itcast.oss-cn-beijing.aliyuncs.com/22f59feb-0d44-430e-a6cd-6a49f27453ca.png',12,57,NULL,'{\"忌口\":\"不要蒜\"}',1,18.00),(25,'东坡肘子','https://sky-itcast.oss-cn-beijing.aliyuncs.com/a80a4b8c-c93e-4f43-ac8a-856b0d5cc451.png',12,59,NULL,'{\"忌口\":\"不要蒜\"}',1,138.00),(26,'奶茶1','https://sky-take-out-cwj333.oss-cn-beijing.aliyuncs.com/65130814-239b-4a2b-b946-00ac22da8fd1.jpg',12,72,NULL,'{\"忌口\":\"不要蒜\",\"甜味\":\"半糖\"}',1,12.00),(27,'猪脚饭','https://sky-take-out-cwj333.oss-cn-beijing.aliyuncs.com/de833fda-0e7a-4706-8c9e-4dff4b010668.png',12,71,NULL,'{\"忌口\":\"不要蒜\",\"甜味\":\"半糖\",\"辣度\":\"重辣\"}',1,12.00),(28,'全是蔬菜','https://sky-take-out-wb333.oss-cn-beijing.aliyuncs.com/414f094a-5489-4cb7-be71-f9f5731f48f1.jpeg',12,NULL,34,NULL,3,55.00),(29,'猪脚饭拼腊肠','https://sky-take-out-cwj333.oss-cn-beijing.aliyuncs.com/56e8ea31-e11a-4f43-abb0-7e695af0e042.png',12,NULL,35,NULL,2,20.00),(30,'鱼多多','https://sky-take-out-wb333.oss-cn-beijing.aliyuncs.com/643a286c-f354-4a6c-9d06-3d2892ba45d0.jpeg',12,NULL,33,NULL,3,9899.00),(31,'蒜蓉娃娃菜','https://sky-itcast.oss-cn-beijing.aliyuncs.com/4879ed66-3860-4b28-ba14-306ac025fdec.png',12,55,NULL,'{}',1,18.00),(32,'炝炒圆白菜','https://sky-itcast.oss-cn-beijing.aliyuncs.com/22f59feb-0d44-430e-a6cd-6a49f27453ca.png',12,57,NULL,'{\"忌口\":\"不要香菜\"}',1,18.00),(33,'东坡肘子','https://sky-itcast.oss-cn-beijing.aliyuncs.com/a80a4b8c-c93e-4f43-ac8a-856b0d5cc451.png',12,59,NULL,'{\"忌口\":\"不要香菜\"}',1,138.00),(34,'王老吉','https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png',13,46,NULL,'{}',14,6.00),(35,'北冰洋','https://sky-itcast.oss-cn-beijing.aliyuncs.com/4451d4be-89a2-4939-9c69-3a87151cb979.png',13,47,NULL,'{}',12,4.00),(36,'王老吉','https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png',14,46,NULL,'{}',14,6.00),(37,'王老吉','https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png',15,46,NULL,'{}',14,6.00),(38,'王老吉','https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png',16,46,NULL,'{}',14,6.00);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '订单号',
  `status` int NOT NULL DEFAULT '1' COMMENT '订单状态 1待付款 2待接单 3已接单 4派送中 5已完成 6已取消 7退款',
  `user_id` bigint NOT NULL COMMENT '下单用户',
  `address_book_id` bigint NOT NULL COMMENT '地址id',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `checkout_time` datetime DEFAULT NULL COMMENT '结账时间',
  `pay_method` int NOT NULL DEFAULT '1' COMMENT '支付方式 1微信,2支付宝',
  `pay_status` tinyint NOT NULL DEFAULT '0' COMMENT '支付状态 0未支付 1已支付 2退款',
  `amount` decimal(10,2) NOT NULL COMMENT '实收金额',
  `remark` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '备注',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '手机号',
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '地址',
  `user_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '用户名称',
  `consignee` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '收货人',
  `cancel_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '订单取消原因',
  `rejection_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '订单拒绝原因',
  `cancel_time` datetime DEFAULT NULL COMMENT '订单取消时间',
  `estimated_delivery_time` datetime DEFAULT NULL COMMENT '预计送达时间',
  `delivery_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '配送状态  1立即送出  0选择具体时间',
  `delivery_time` datetime DEFAULT NULL COMMENT '送达时间',
  `pack_amount` int DEFAULT NULL COMMENT '打包费',
  `tableware_number` int DEFAULT NULL COMMENT '餐具数量',
  `tableware_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '餐具数量状态  1按餐量提供  0选择具体数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (4,'1728293243093',6,4,2,'2024-10-07 17:27:23',NULL,1,0,9906.00,'','17818100976','111',NULL,'hh','订单超时，自动取消',NULL,'2024-10-07 17:47:00','2024-10-07 18:27:00',0,NULL,1,0,0),(5,'1733414428954',6,6,4,'2024-12-06 00:00:29',NULL,1,0,14.00,'备注1','13680581802','小区1',NULL,'收货人XX','订单超时，自动取消',NULL,'2024-12-06 00:16:00','2024-12-05 17:00:28',0,NULL,0,1,0),(6,'1733414491096',6,6,4,'2024-12-06 00:01:31',NULL,1,0,14.00,'备注1','13680581802','小区1',NULL,'收货人XX','订单超时，自动取消',NULL,'2024-12-06 00:17:00','2024-12-05 17:01:31',0,NULL,0,1,0),(7,'1733423197773',6,6,4,'2024-12-06 02:26:38',NULL,1,0,60.00,'备注1','13680581802','小区1',NULL,'收货人XX','订单超时，自动取消',NULL,'2024-12-06 02:42:00','2024-12-05 19:26:37',0,NULL,0,1,0),(8,'1733423842111',5,6,4,'2024-12-06 02:37:22',NULL,1,0,76.00,'备注1','13680581802','小区1',NULL,'收货人XX','订单超时，自动取消',NULL,'2024-12-06 02:53:00','2024-12-05 19:37:22',0,'2025-01-31 01:08:20',0,1,0),(9,'1733480341806',5,6,4,'2024-12-06 18:19:02',NULL,1,0,10173.00,'备注1','13680581802','小区1',NULL,'收货人XX','订单超时，自动取消',NULL,'2024-12-06 18:35:00','2024-12-06 11:19:01',0,'2025-01-30 20:32:57',0,1,0),(10,'1734050267075',5,6,4,'2024-12-13 08:37:47',NULL,1,0,61.00,'备注1','13680581802','小区1',NULL,'收货人XX',NULL,NULL,NULL,'2024-12-13 01:37:46',0,'2025-01-30 20:15:48',0,1,0),(11,'1734059254006',3,6,4,'2024-12-13 11:07:34',NULL,1,0,76.00,'备注1','13680581802','小区1',NULL,'收货人XX',NULL,NULL,NULL,'2024-12-13 04:07:33',0,'2025-01-30 20:32:55',0,1,0),(12,'1738587662036',6,6,4,'2025-02-03 21:01:02',NULL,1,0,30286.00,'备注1','13680581802','小区1',NULL,'收货人XX','订单超时，自动取消',NULL,'2025-02-03 21:56:00','2025-02-03 14:01:06',0,NULL,0,1,0),(13,'1741626408662',1,6,21,'2025-03-11 01:06:49',NULL,1,0,80.00,'备注2','13680581803','阳光小区',NULL,'收货人zero',NULL,NULL,NULL,'2025-02-03 21:01:02',1,NULL,1,1,1),(14,'1741661439150',1,6,21,'2025-03-11 10:50:39',NULL,1,0,80.00,'备注2','13680581803','阳光小区',NULL,'收货人zero',NULL,NULL,NULL,'2025-02-03 21:01:02',1,NULL,1,1,1),(15,'1741677828872',1,6,21,'2025-03-11 15:23:49',NULL,1,0,80.00,'备注2','13680581803','阳光小区',NULL,'收货人zero',NULL,NULL,NULL,'2025-02-03 21:01:02',1,NULL,1,1,1),(16,'1741688212384',1,6,21,'2025-03-11 18:16:52',NULL,1,0,80.00,'备注2','13680581803','阳光小区',NULL,'收货人zero',NULL,NULL,NULL,'2025-02-03 21:01:02',1,NULL,1,1,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `undo_log`
--

DROP TABLE IF EXISTS `undo_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `undo_log` (
  `branch_id` bigint NOT NULL COMMENT 'branch transaction id',
  `xid` varchar(128) NOT NULL COMMENT 'global transaction id',
  `context` varchar(128) NOT NULL COMMENT 'undo_log context,such as serialization',
  `rollback_info` longblob NOT NULL COMMENT 'rollback info',
  `log_status` int NOT NULL COMMENT '0:normal status,1:defense status',
  `log_created` datetime(6) NOT NULL COMMENT 'create datetime',
  `log_modified` datetime(6) NOT NULL COMMENT 'modify datetime',
  UNIQUE KEY `ux_undo_log` (`xid`,`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='AT transaction mode undo table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `undo_log`
--

LOCK TABLES `undo_log` WRITE;
/*!40000 ALTER TABLE `undo_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `undo_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `sky-user`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sky-user` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `sky-user`;

--
-- Table structure for table `address_book`
--

DROP TABLE IF EXISTS `address_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_book` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `consignee` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '收货人',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '性别',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '手机号',
  `province_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '省级区划编号',
  `province_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '省级名称',
  `city_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '市级区划编号',
  `city_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '市级名称',
  `district_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '区级区划编号',
  `district_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '区级名称',
  `detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '详细地址',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '标签',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '默认 0 否 1是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='地址簿';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_book`
--

LOCK TABLES `address_book` WRITE;
/*!40000 ALTER TABLE `address_book` DISABLE KEYS */;
INSERT INTO `address_book` VALUES (2,4,'hh','0','17818100976','44','广东省','4401','广州市','440103','荔湾区','111','1',1),(3,6,'明小','0','17818100976','44','广东省','4401','广州市','440103','荔湾区','华南小院','1',0),(4,6,'收货人XX',NULL,'13680581802',NULL,NULL,NULL,NULL,NULL,NULL,'小区1',NULL,1),(5,6,'收货人2',NULL,'13680581802',NULL,NULL,NULL,NULL,NULL,NULL,'小区222',NULL,0),(6,6,'收货人2',NULL,'13680581801',NULL,NULL,NULL,NULL,NULL,NULL,'小区3',NULL,0),(21,6,'收货人zero','1','13680581803','2','2','2','2','2','2','阳光小区','这是测试用的',0);
/*!40000 ALTER TABLE `address_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '姓名',
  `username` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '用户名，即手机号',
  `password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '123456',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '身份证号',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_u` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='用户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (6,'明非','17818100976','e10adc3949ba59abbe56e057f20f883e','1','431126200410300130','2024-10-07 20:46:37'),(7,'xx','17818100975','123456','1','431126200410300131','2025-03-10 20:40:55');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-15 23:03:57
