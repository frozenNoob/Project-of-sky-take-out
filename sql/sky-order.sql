-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sky_take_out
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
  `dish_flavor` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL COMMENT '口味（如全糖少冰），注意区分这不是dish_flavor表中的那种全范围的value',
  `number` int NOT NULL DEFAULT '1' COMMENT '数量',
  `amount` decimal(10,2) NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='订单明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (5,'鱼多多','https://sky-take-out-wb333.oss-cn-beijing.aliyuncs.com/643a286c-f354-4a6c-9d06-3d2892ba45d0.jpeg',4,NULL,33,NULL,1,9899.00),(6,'王老吉','https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png',5,46,NULL,'{}',1,6.00),(7,'奶茶','https://sky-take-out-wb333.oss-cn-beijing.aliyuncs.com/c7ba9ce3-00bd-41b0-ae72-c1858274035c.jpeg',5,70,NULL,'{\"甜味\":\"少糖\",\"温度\":\"多冰\"}',1,8.00),(8,'王老吉','https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png',6,46,NULL,'{}',1,6.00),(9,'北冰洋','https://sky-itcast.oss-cn-beijing.aliyuncs.com/4451d4be-89a2-4939-9c69-3a87151cb979.png',6,47,NULL,'{}',2,4.00),(10,'奶茶','https://sky-take-out-wb333.oss-cn-beijing.aliyuncs.com/c7ba9ce3-00bd-41b0-ae72-c1858274035c.jpeg',7,70,NULL,'{\"甜味\":\"半糖\",\"温度\":\"少冰\"}',3,8.00),(11,'猪脚饭','https://sky-take-out-cwj333.oss-cn-beijing.aliyuncs.com/de833fda-0e7a-4706-8c9e-4dff4b010668.png',7,71,NULL,'{\"甜味\":\"半糖\",\"温度\":\"少冰\",\"辣度\":\"重辣\"}',3,12.00),(12,'奶茶1','https://sky-take-out-cwj333.oss-cn-beijing.aliyuncs.com/65130814-239b-4a2b-b946-00ac22da8fd1.jpg',8,72,NULL,'{\"甜味\":\"少糖\"}',3,12.00),(13,'猪脚饭拼腊肠','https://sky-take-out-cwj333.oss-cn-beijing.aliyuncs.com/56e8ea31-e11a-4f43-abb0-7e695af0e042.png',8,NULL,35,NULL,2,20.00),(14,'猪脚饭拼腊肠','https://sky-take-out-cwj333.oss-cn-beijing.aliyuncs.com/56e8ea31-e11a-4f43-abb0-7e695af0e042.png',9,NULL,35,NULL,9,20.00),(15,'蜀味水煮草鱼','https://sky-itcast.oss-cn-beijing.aliyuncs.com/a6953d5a-4c18-4b30-9319-4926ee77261f.png',9,53,NULL,'{\"忌口\":\"不要香菜\",\"辣度\":\"中辣\"}',2,38.00),(16,'鱼多多','https://sky-take-out-wb333.oss-cn-beijing.aliyuncs.com/643a286c-f354-4a6c-9d06-3d2892ba45d0.jpeg',9,NULL,33,NULL,1,9899.00),(17,'炝炒圆白菜','https://sky-itcast.oss-cn-beijing.aliyuncs.com/22f59feb-0d44-430e-a6cd-6a49f27453ca.png',9,57,NULL,'{\"忌口\":\"不要香菜\"}',1,18.00),(18,'全是蔬菜','https://sky-take-out-wb333.oss-cn-beijing.aliyuncs.com/414f094a-5489-4cb7-be71-f9f5731f48f1.jpeg',10,NULL,34,NULL,1,55.00),(19,'王老吉','https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png',10,46,NULL,'{}',1,6.00),(20,'经典酸菜鮰鱼','https://sky-itcast.oss-cn-beijing.aliyuncs.com/5260ff39-986c-4a97-8850-2ec8c7583efc.png',11,52,NULL,'{\"忌口\":\"不要蒜\",\"辣度\":\"重辣\"}',1,66.00),(21,'王老吉','https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png',11,46,NULL,'{}',1,6.00),(22,'北冰洋','https://sky-itcast.oss-cn-beijing.aliyuncs.com/4451d4be-89a2-4939-9c69-3a87151cb979.png',11,47,NULL,'{}',1,4.00),(23,'王老吉','https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png',12,46,NULL,'{}',5,6.00),(24,'炝炒圆白菜','https://sky-itcast.oss-cn-beijing.aliyuncs.com/22f59feb-0d44-430e-a6cd-6a49f27453ca.png',12,57,NULL,'{\"忌口\":\"不要蒜\"}',1,18.00),(25,'东坡肘子','https://sky-itcast.oss-cn-beijing.aliyuncs.com/a80a4b8c-c93e-4f43-ac8a-856b0d5cc451.png',12,59,NULL,'{\"忌口\":\"不要蒜\"}',1,138.00),(26,'奶茶1','https://sky-take-out-cwj333.oss-cn-beijing.aliyuncs.com/65130814-239b-4a2b-b946-00ac22da8fd1.jpg',12,72,NULL,'{\"忌口\":\"不要蒜\",\"甜味\":\"半糖\"}',1,12.00),(27,'猪脚饭','https://sky-take-out-cwj333.oss-cn-beijing.aliyuncs.com/de833fda-0e7a-4706-8c9e-4dff4b010668.png',12,71,NULL,'{\"忌口\":\"不要蒜\",\"甜味\":\"半糖\",\"辣度\":\"重辣\"}',1,12.00),(28,'全是蔬菜','https://sky-take-out-wb333.oss-cn-beijing.aliyuncs.com/414f094a-5489-4cb7-be71-f9f5731f48f1.jpeg',12,NULL,34,NULL,3,55.00),(29,'猪脚饭拼腊肠','https://sky-take-out-cwj333.oss-cn-beijing.aliyuncs.com/56e8ea31-e11a-4f43-abb0-7e695af0e042.png',12,NULL,35,NULL,2,20.00),(30,'鱼多多','https://sky-take-out-wb333.oss-cn-beijing.aliyuncs.com/643a286c-f354-4a6c-9d06-3d2892ba45d0.jpeg',12,NULL,33,NULL,3,9899.00),(31,'蒜蓉娃娃菜','https://sky-itcast.oss-cn-beijing.aliyuncs.com/4879ed66-3860-4b28-ba14-306ac025fdec.png',12,55,NULL,'{}',1,18.00),(32,'炝炒圆白菜','https://sky-itcast.oss-cn-beijing.aliyuncs.com/22f59feb-0d44-430e-a6cd-6a49f27453ca.png',12,57,NULL,'{\"忌口\":\"不要香菜\"}',1,18.00),(33,'东坡肘子','https://sky-itcast.oss-cn-beijing.aliyuncs.com/a80a4b8c-c93e-4f43-ac8a-856b0d5cc451.png',12,59,NULL,'{\"忌口\":\"不要香菜\"}',1,138.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (4,'1728293243093',6,4,2,'2024-10-07 17:27:23',NULL,1,0,9906.00,'','17818100976','111',NULL,'hh','订单超时，自动取消',NULL,'2024-10-07 17:47:00','2024-10-07 18:27:00',0,NULL,1,0,0),(5,'1733414428954',6,6,4,'2024-12-06 00:00:29',NULL,1,0,14.00,'备注1','13680581802','小区1',NULL,'收货人XX','订单超时，自动取消',NULL,'2024-12-06 00:16:00','2024-12-05 17:00:28',0,NULL,0,1,0),(6,'1733414491096',6,6,4,'2024-12-06 00:01:31',NULL,1,0,14.00,'备注1','13680581802','小区1',NULL,'收货人XX','订单超时，自动取消',NULL,'2024-12-06 00:17:00','2024-12-05 17:01:31',0,NULL,0,1,0),(7,'1733423197773',6,6,4,'2024-12-06 02:26:38',NULL,1,0,60.00,'备注1','13680581802','小区1',NULL,'收货人XX','订单超时，自动取消',NULL,'2024-12-06 02:42:00','2024-12-05 19:26:37',0,NULL,0,1,0),(8,'1733423842111',5,6,4,'2024-12-06 02:37:22',NULL,1,0,76.00,'备注1','13680581802','小区1',NULL,'收货人XX','订单超时，自动取消',NULL,'2024-12-06 02:53:00','2024-12-05 19:37:22',0,'2025-01-31 01:08:20',0,1,0),(9,'1733480341806',5,6,4,'2024-12-06 18:19:02',NULL,1,0,10173.00,'备注1','13680581802','小区1',NULL,'收货人XX','订单超时，自动取消',NULL,'2024-12-06 18:35:00','2024-12-06 11:19:01',0,'2025-01-30 20:32:57',0,1,0),(10,'1734050267075',5,6,4,'2024-12-13 08:37:47',NULL,1,0,61.00,'备注1','13680581802','小区1',NULL,'收货人XX',NULL,NULL,NULL,'2024-12-13 01:37:46',0,'2025-01-30 20:15:48',0,1,0),(11,'1734059254006',3,6,4,'2024-12-13 11:07:34',NULL,1,0,76.00,'备注1','13680581802','小区1',NULL,'收货人XX',NULL,NULL,NULL,'2024-12-13 04:07:33',0,'2025-01-30 20:32:55',0,1,0),(12,'1738587662036',6,6,4,'2025-02-03 21:01:02',NULL,1,0,30286.00,'备注1','13680581802','小区1',NULL,'收货人XX','订单超时，自动取消',NULL,'2025-02-03 21:56:00','2025-02-03 14:01:06',0,NULL,0,1,0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-09 16:13:49
