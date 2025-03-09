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
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='购物车';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
INSERT INTO `shopping_cart` VALUES (88,'王老吉','https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png',6,46,NULL,'{}',14,6.00,'2025-02-03 21:57:58'),(89,'北冰洋','https://sky-itcast.oss-cn-beijing.aliyuncs.com/4451d4be-89a2-4939-9c69-3a87151cb979.png',6,47,NULL,'{}',12,4.00,'2025-02-03 21:57:59'),(90,'雪花啤酒','https://sky-itcast.oss-cn-beijing.aliyuncs.com/bf8cbfc1-04d2-40e8-9826-061ee41ab87c.png',6,48,NULL,'{}',5,4.00,'2025-02-03 21:58:01'),(91,'米饭','https://sky-itcast.oss-cn-beijing.aliyuncs.com/76752350-2121-44d2-b477-10791c23a8ec.png',6,49,NULL,'{}',2,2.00,'2025-02-03 21:58:03'),(92,'馒头','https://sky-itcast.oss-cn-beijing.aliyuncs.com/475cc599-8661-4899-8f9e-121dd8ef7d02.png',6,50,NULL,'{}',1,1.00,'2025-02-03 21:58:05'),(93,'老坛酸菜鱼','https://sky-itcast.oss-cn-beijing.aliyuncs.com/4a9cefba-6a74-467e-9fde-6e687ea725d7.png',6,51,NULL,'{\"忌口\":\"不要香菜\",\"辣度\":\"重辣\"}',3,56.00,'2025-02-03 21:58:09'),(94,'蜀味水煮草鱼','https://sky-itcast.oss-cn-beijing.aliyuncs.com/a6953d5a-4c18-4b30-9319-4926ee77261f.png',6,53,NULL,'{\"忌口\":\"不要香菜\",\"辣度\":\"中辣\"}',2,38.00,'2025-02-03 21:58:19'),(95,'蒜蓉娃娃菜','https://sky-itcast.oss-cn-beijing.aliyuncs.com/4879ed66-3860-4b28-ba14-306ac025fdec.png',6,55,NULL,'{\"忌口\":\"不要香菜\",\"辣度\":\"中辣\"}',7,18.00,'2025-02-03 21:58:21'),(96,'清炒西兰花','https://sky-itcast.oss-cn-beijing.aliyuncs.com/e9ec4ba4-4b22-4fc8-9be0-4946e6aeb937.png',6,56,NULL,'{\"忌口\":\"不要辣\",\"辣度\":\"中辣\"}',5,18.00,'2025-02-03 21:58:28'),(97,'炝炒圆白菜','https://sky-itcast.oss-cn-beijing.aliyuncs.com/22f59feb-0d44-430e-a6cd-6a49f27453ca.png',6,57,NULL,'{\"忌口\":\"不要辣\",\"辣度\":\"中辣\"}',4,18.00,'2025-02-03 21:58:57'),(98,'奶茶','https://sky-take-out-wb333.oss-cn-beijing.aliyuncs.com/c7ba9ce3-00bd-41b0-ae72-c1858274035c.jpeg',6,70,NULL,'{\"甜味\":\"全糖\",\"温度\":\"多冰\"}',1,8.00,'2025-02-04 17:50:18'),(99,'奶茶2','https://sky-take-out-cwj333.oss-cn-beijing.aliyuncs.com/c5865efe-6ceb-4666-bb0b-2721da1639ef.jpg',6,73,NULL,'{}',1,14.00,'2025-02-04 17:54:57'),(100,'奶茶2','https://sky-take-out-cwj333.oss-cn-beijing.aliyuncs.com/c5865efe-6ceb-4666-bb0b-2721da1639ef.jpg',6,73,NULL,'{\"甜味\":\"无糖\",\"温度\":\"热饮\"}',2,14.00,'2025-02-04 17:55:26'),(101,'奶茶','https://sky-take-out-wb333.oss-cn-beijing.aliyuncs.com/c7ba9ce3-00bd-41b0-ae72-c1858274035c.jpeg',6,70,NULL,'{\"甜味\":\"无糖\",\"温度\":\"热饮\"}',4,8.00,'2025-02-04 18:01:31'),(102,'奶茶','https://sky-take-out-wb333.oss-cn-beijing.aliyuncs.com/c7ba9ce3-00bd-41b0-ae72-c1858274035c.jpeg',6,70,NULL,'{}',5,8.00,'2025-02-04 18:23:35'),(103,'奶茶','https://sky-take-out-wb333.oss-cn-beijing.aliyuncs.com/c7ba9ce3-00bd-41b0-ae72-c1858274035c.jpeg',6,70,NULL,'{\"温度\":\"去冰\",\"甜味\":\"全糖\"}',3,8.00,'2025-02-04 18:30:06'),(104,'猪脚饭','https://sky-take-out-cwj333.oss-cn-beijing.aliyuncs.com/de833fda-0e7a-4706-8c9e-4dff4b010668.png',6,71,NULL,'{\"温度\":\"去冰\",\"甜味\":\"全糖\"}',1,12.00,'2025-02-04 18:30:11'),(105,'奶茶','https://sky-take-out-wb333.oss-cn-beijing.aliyuncs.com/c7ba9ce3-00bd-41b0-ae72-c1858274035c.jpeg',6,70,NULL,'{\"温度\":\"常温\",\"甜味\":\"全糖\"}',2,8.00,'2025-02-04 18:34:40'),(106,'奶茶','https://sky-take-out-wb333.oss-cn-beijing.aliyuncs.com/c7ba9ce3-00bd-41b0-ae72-c1858274035c.jpeg',6,70,NULL,'{\"甜味\":\"全糖\",\"温度\":\"常温\"}',4,8.00,'2025-02-04 18:39:57'),(107,'奶茶','https://sky-take-out-wb333.oss-cn-beijing.aliyuncs.com/c7ba9ce3-00bd-41b0-ae72-c1858274035c.jpeg',6,70,NULL,'{\"甜味\":\"全糖\",\"温度\":\"少冰\"}',2,8.00,'2025-02-04 19:28:00'),(108,'奶茶','https://sky-take-out-wb333.oss-cn-beijing.aliyuncs.com/c7ba9ce3-00bd-41b0-ae72-c1858274035c.jpeg',6,70,NULL,'{\"甜味\":\"半糖\",\"温度\":\"多冰\"}',1,8.00,'2025-02-04 19:32:08'),(109,'奶茶2','https://sky-take-out-cwj333.oss-cn-beijing.aliyuncs.com/c5865efe-6ceb-4666-bb0b-2721da1639ef.jpg',6,73,NULL,'{\"甜味\":\"无糖\",\"温度\":\"多冰\"}',1,14.00,'2025-02-04 19:33:44'),(110,'奶茶2','https://sky-take-out-cwj333.oss-cn-beijing.aliyuncs.com/c5865efe-6ceb-4666-bb0b-2721da1639ef.jpg',6,73,NULL,'{\"甜味\":\"无糖\",\"温度\":\"少冰\"}',1,14.00,'2025-03-01 17:35:57');
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-09 16:15:28
