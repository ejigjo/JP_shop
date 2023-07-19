-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (arm64)
--
-- Host: localhost    Database: reggie
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `address_book`
--

DROP TABLE IF EXISTS `address_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_book` (
  `id` bigint NOT NULL COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `consignee` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '收货人',
  `sex` tinyint NOT NULL COMMENT '性别 0 女 1 男',
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
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  `is_deleted` int NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='地址管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_book`
--

LOCK TABLES `address_book` WRITE;
/*!40000 ALTER TABLE `address_book` DISABLE KEYS */;
INSERT INTO `address_book` VALUES (1417414526093082626,1417012167126876162,'小明',1,'13812345678',NULL,NULL,NULL,NULL,NULL,NULL,'昌平区金燕龙办公楼','公司',1,'2021-07-20 17:22:12','2021-07-20 17:26:33',1417012167126876162,1417012167126876162,0),(1417414926166769666,1417012167126876162,'小李',1,'13512345678',NULL,NULL,NULL,NULL,NULL,NULL,'测试','家',0,'2021-07-20 17:23:47','2021-07-20 17:23:47',1417012167126876162,1417012167126876162,0);
/*!40000 ALTER TABLE `address_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL COMMENT '主键',
  `type` int DEFAULT NULL COMMENT '类型   1 菜品分类 2 套餐分类',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '分类名称',
  `sort` int NOT NULL DEFAULT '0' COMMENT '顺序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `update_user` bigint DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_category_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='菜品及套餐分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1397844263642378242,1,'上衣類',1,'2021-05-27 09:16:58','2021-07-15 20:25:23',1,1),(1397844303408574465,1,'襯衫類',2,'2021-05-27 09:17:07','2021-06-02 14:27:22',1,1),(1397844391040167938,1,'外套類',3,'2021-05-27 09:17:28','2021-07-09 14:37:13',1,1),(1413341197421846529,1,'下身類',11,'2021-07-09 11:36:15','2021-07-09 14:39:15',1,1),(1413342269393674242,1,'家居服',5,'2021-07-09 11:40:30','2021-07-09 14:43:45',1,1),(1413384954989060097,2,'配件類',12,'2021-07-09 14:30:07','2023-07-16 23:58:33',1,1),(1413386191767674881,1,'內衣類',6,'2021-07-09 14:35:02','2021-07-09 14:39:05',1,1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish`
--

DROP TABLE IF EXISTS `dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish` (
  `id` bigint NOT NULL COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '菜品名称',
  `category_id` bigint NOT NULL COMMENT '菜品分类id',
  `price` decimal(10,2) DEFAULT NULL COMMENT '菜品价格',
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '商品码',
  `image` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '图片',
  `description` varchar(400) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '描述信息',
  `status` int NOT NULL DEFAULT '1' COMMENT '0 停售 1 起售',
  `sort` int NOT NULL DEFAULT '0' COMMENT '顺序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  `is_deleted` int DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_dish_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='菜品管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` VALUES (1397849739276890114,'聯名短T',1397844263642378242,780.00,'222222222','https://s1.lativ.com.tw/i/60324/6032401_M_03_0_n.jpg','迪士尼系列竹節棉寬版T恤-女',1,0,'2021-05-27 09:38:43','2021-05-27 09:38:43',1,1,0),(1397850140982161409,'聯名長T',1397844263642378242,680.00,'123412341234','https://s1.lativ.com.tw/i/62917/6291701_M_02_n.jpg','迪士尼系列長袖印花T恤-11-女',1,0,'2021-05-27 09:40:19','2021-05-27 09:40:19',1,1,0),(1397850392090947585,'短袖上衣',1397844263642378242,480.00,'123412341234','https://s1.lativ.com.tw/i/61139/61139_M_01_0_n.jpg','棉質印花短版上衣-女',1,0,'2021-05-27 09:41:19','2021-05-27 09:41:19',1,1,0),(1397850851245600769,'五/七分袖',1397844263642378242,800.00,'123412341234','https://s4.lativ.com.tw/i/61150/61150_M_01_1_n.jpg','華夫格圓領七分袖T恤-女',1,0,'2021-05-27 09:43:08','2021-05-27 09:43:08',1,1,0),(1397851099502260226,'長版上衣',1397844263642378242,1180.00,'23412341234','https://s2.lativ.com.tw/i/60325/60325_M_16_n.jpg','竹節棉寬鬆長版T恤-女',1,0,'2021-05-27 09:44:08','2021-05-27 09:44:08',1,1,0),(1397851370462687234,'竹節棉系列',1397844263642378242,1800.00,'1246812345678','https://s1.lativ.com.tw/i/61419/61419_M_02_n.jpg','竹節棉寬鬆長版T恤-女',1,0,'2021-05-27 09:45:12','2021-05-27 09:45:12',1,1,0),(1397851668262465537,'亞麻/棉麻襯衫',1397844303408574465,1680.00,'1234567812345678','https://s1.lativ.com.tw/i/60711/60711_M_01_n.jpg','竹節棉動物繡花T恤-女',1,0,'2021-05-27 09:46:23','2021-05-27 09:46:23',1,1,0),(1397852391150759938,'嫘縈/雪紡',1397844263642378242,880.00,'2346812468','https://s1.lativ.com.tw/i/60704/60704_M_17_n.jpg','亞麻混紡泡泡袖上衣-女',1,0,'2021-05-27 09:49:16','2021-05-27 09:49:16',1,1,0),(1397853183287013378,'格紋襯衫',1397844303408574465,9800.00,'123456787654321','https://s1.lativ.com.tw/i/60607/60607_M_18_n.jpg','亞麻混紡寬版V領襯衫-女',1,0,'2021-05-27 09:52:24','2021-05-27 09:52:24',1,1,0),(1397853709101740034,'牛仔襯衫',1397844303408574465,900.00,'1234321234321','https://s2.lativ.com.tw/i/60580/60580_M_51_n.jpg','牛仔長袖襯衫-女',1,0,'2021-05-27 09:54:30','2021-05-27 09:54:30',1,1,0),(1397853890262118402,'抗UV系列',1397844303408574465,3800.00,'1234212321234','https://s1.lativ.com.tw/i/TagPicture/60314/60314_M_02_1_tag_n.jpg','抗UV輕型風衣外套-女',1,0,'2021-05-27 09:55:13','2021-05-27 09:55:13',1,1,0),(1397854652581064706,'機能外套',1397844391040167938,1480.00,'2345312·345321','https://s1.lativ.com.tw/i/TagPicture/60314/60314_M_01_tag_n.jpg','抗UV輕型風衣外套-女',1,0,'2021-05-27 09:58:15','2021-05-27 09:58:15',1,1,0),(1397854865672679425,'休閒外套',1397844391040167938,2000.00,'23456431·23456','https://s4.lativ.com.tw/i/60315/60315_M_19_n.jpg','絲光寬版荷葉袖上衣-女',1,0,'2021-05-27 09:59:06','2021-05-27 09:59:06',1,1,0),(1397860242057375745,'短褲',1413341197421846529,1800.00,'123456786543213456','https://s1.lativ.com.tw/i/60249/60249_M_01_1_n.jpg','透膚寬版連帽外套-女',1,0,'2021-05-27 10:20:27','2021-05-27 10:20:27',1,1,0),(1397860578738352129,'七/九分褲',1413341197421846529,6600.00,'12345678654','https://s4.lativ.com.tw/i/60171/60171_M_17_0_n.jpg','卡其短褲-女',1,0,'2021-05-27 10:21:48','2021-05-27 10:21:48',1,1,0),(1397860792492666881,'休閒長褲',1413341197421846529,3800.00,'213456432123456','https://s1.lativ.com.tw/i/60699/60699_M_51_n.jpg','彈力七分內搭褲-女',1,0,'2021-05-27 10:22:39','2021-05-27 10:22:39',1,1,0),(1397860963880316929,'家居套裝',1397844391040167938,108.00,'1234563212345','https://s2.lativ.com.tw/i/60750/60750_M_04_n.jpg','棉質鬆緊九分褲-女',1,0,'2021-05-27 10:23:19','2021-05-27 10:23:19',1,1,0),(1397861683434139649,'家居洋裝',1397844391040167938,388.00,'1234567876543213456','https://s4.lativ.com.tw/i/60547/6054702_M_02_n.jpg','史努比系列嫘縈套裝-01-女',1,0,'2021-05-27 10:26:11','2021-05-27 10:26:11',1,1,0),(1397862198033297410,'抗UV輕型長版風衣外套',1397844391040167938,498.00,'123456786532455','0770fd38-61d8-4be2-a899-e4579666a72e.jpg','',1,0,'2021-05-27 10:28:14','2023-07-17 17:02:17',1,1,0),(1397862477831122945,'柔軟羅紋短版針織外套',1397844391040167938,1088.00,'1234567865432','1f029b38-f099-4511-a7d8-d4b9b701db35.jpg','',1,0,'2021-05-27 10:29:20','2023-07-17 17:00:19',1,1,0),(1413342036832100354,'彈力打褶短褲',1413341197421846529,199.00,'','3bf44259-af7b-4bce-83ab-cc13fb11b103.jpg','無',1,0,'2021-07-09 11:39:35','2023-07-17 16:57:24',1,1,0),(1413384757047271425,'袖套',1413341197421846529,5.00,'','02e882a7-bbab-4bda-83d1-f6863088f6e8.jpg','輕涼抗UV套指式袖套-中性款',1,0,'2021-07-09 14:29:20','2023-07-17 16:41:45',1,1,0),(1413385247889891330,'鞋類',1413384954989060097,2.00,'','83ee2da5-08a7-48e3-9efa-beb80ef4bfdd.jpg','防潑水休閒鞋',1,0,'2021-07-09 14:31:17','2023-07-17 16:42:34',1,1,0),(1680820238393802754,'迪士尼系列印花T恤',1397844263642378242,300.00,'','46e0fc11-f040-4048-899b-573e000217c7.jpg','無',1,0,'2023-07-17 14:02:28','2023-07-17 14:02:28',1,1,0),(1680835517203132417,'迪士尼系列竹節棉寬版T恤',1397844263642378242,299.00,'','3aa97d8d-a16a-4b59-b283-c50e5223b978.jpg','無',1,0,'2023-07-17 15:03:10','2023-07-17 15:03:10',1,1,0),(1680835848955801601,'迪士尼系列寬長版印花T恤',1397844263642378242,399.00,'','808aed75-c761-4bb4-8ffd-6755606db909.jpg','無',1,0,'2023-07-17 15:04:29','2023-07-17 15:04:29',1,1,0),(1680836093211095041,'亞麻混紡寬版V領襯衫',1397844303408574465,590.00,'','1b923cc3-9665-4d36-939f-6ab5d05c09a8.jpg','無',1,0,'2023-07-17 15:05:28','2023-07-17 15:05:28',1,1,0),(1680836348577099777,'抗UV輕型風衣外套',1397844391040167938,450.00,'','c7d281ae-21db-48f4-9fbd-5079e9df29a2.jpg','抗UV輕型風衣',1,0,'2023-07-17 15:06:29','2023-07-17 15:06:29',1,1,0),(1680843111158267906,'涼感抗UV連帽外套',1397844391040167938,6.90,'','1ffecc27-ea8e-4815-9ae4-1f08253c17c1.jpg','',1,0,'2023-07-17 15:33:21','2023-07-17 16:38:58',1,1,0),(1680853945200730113,'西裝寬版五分褲',1413341197421846529,450.00,'','e8c046a0-6f6c-40b0-ae96-15bcc06e8a46.jpg','無',1,0,'2023-07-17 16:16:24','2023-07-17 16:16:24',1,1,0),(1680859460517519362,'棉質羅紋圓領七分袖T恤',1397844263642378242,599.00,'','12c26f8a-0378-4030-ade0-e2639fb8b333.jpg','',1,0,'2023-07-17 16:38:19','2023-07-17 16:38:19',1,1,0),(1680920803551518721,'商務彈性短袖襯衫',1397844303408574465,499.00,'','619a4c2c-1cc5-4606-a7f6-d81ad1da9537.jpg','',1,0,'2023-07-17 20:42:04','2023-07-17 20:42:04',1,1,0),(1680920944291389442,'彈性西裝外套',1397844391040167938,690.00,'','452581f7-d177-4b9d-899b-4865fc66ceff.jpg','',1,0,'2023-07-17 20:42:38','2023-07-17 20:42:38',1,1,0),(1680921193017810945,'輕便休閒短褲',1413341197421846529,499.00,'','05a87b98-9cce-4dc5-a5f1-b5f6f747a166.jpg','',1,0,'2023-07-17 20:43:37','2023-07-17 20:43:37',1,1,0),(1680934137353027585,'棉質鬆緊九分褲',1413341197421846529,590.00,'','ccd1b536-f446-4926-88dc-2c4ad07ef281.jpg','',1,0,'2023-07-17 21:35:03','2023-07-17 21:35:03',1,1,0),(1680934298150060034,'亞麻混紡泡泡袖上衣',1397844263642378242,499.00,'','7c2a26a0-092a-4e38-9a4f-bc0a77bca8e7.jpg','',1,0,'2023-07-17 21:35:42','2023-07-17 21:35:42',1,1,0);
/*!40000 ALTER TABLE `dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish_flavor`
--

DROP TABLE IF EXISTS `dish_flavor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish_flavor` (
  `id` bigint NOT NULL COMMENT '主键',
  `dish_id` bigint NOT NULL COMMENT '菜品',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '口味名称',
  `value` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '口味数据list',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  `is_deleted` int NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='菜品口味关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish_flavor`
--

LOCK TABLES `dish_flavor` WRITE;
/*!40000 ALTER TABLE `dish_flavor` DISABLE KEYS */;
INSERT INTO `dish_flavor` VALUES (1397850630755233794,1397850630700707841,'亞麻','[\'S\',\'M\',\'L\',\'XL\']','2021-05-27 09:42:16','2021-05-27 09:42:16',1,1,0),(1397850851274960898,1397850851245600769,'棉麻','[\'S\',\'M\',\'L\',\'XL\']','2021-05-27 09:43:08','2021-05-27 09:43:08',1,1,0),(1397850851283349505,1397850851245600769,'亞麻','[\'S\',\'M\',\'L\',\'XL\']','2021-05-27 09:43:08','2021-05-27 09:43:08',1,1,0),(1397851099523231745,1397851099502260226,'棉麻','[\'S\',\'M\',\'L\',\'XL\']','2021-05-27 09:44:08','2021-05-27 09:44:08',1,1,0),(1397851099527426050,1397851099502260226,'亞麻','[\'S\',\'M\',\'L\',\'XL\']','2021-05-27 09:44:08','2021-05-27 09:44:08',1,1,0),(1397851370483658754,1397851370462687234,'竹節棉','[\'S\',\'M\',\'L\',\'XL\']','2021-05-27 09:45:12','2021-05-27 09:45:12',1,1,0),(1397851370483658755,1397851370462687234,'棉麻','[\'S\',\'M\',\'L\',\'XL\']','2021-05-27 09:45:12','2021-05-27 09:45:12',1,1,0),(1397851370483658756,1397851370462687234,'亞麻','[\'S\',\'M\',\'L\',\'XL\']','2021-05-27 09:45:12','2021-05-27 09:45:12',1,1,0),(1397851668283437058,1397851668262465537,'竹節棉','[\'S\',\'M\',\'L\',\'XL\']','2021-05-27 09:46:23','2021-05-27 09:46:23',1,1,0),(1397852391180120065,1397852391150759938,'棉麻','[\'S\',\'M\',\'L\',\'XL\']','2021-05-27 09:49:16','2021-05-27 09:49:16',1,1,0),(1397852391196897281,1397852391150759938,'亞麻','[\'S\',\'M\',\'L\',\'XL\']','2021-05-27 09:49:16','2021-05-27 09:49:16',1,1,0),(1397853183307984898,1397853183287013378,'亞麻','[\'S\',\'M\',\'L\',\'XL\']','2021-05-27 09:52:24','2021-05-27 09:52:24',1,1,0),(1397853423486414850,1397853423461249026,'亞麻','[\'S\',\'M\',\'L\',\'XL\']','2021-05-27 09:53:22','2021-05-27 09:53:22',1,1,0),(1397853709126905857,1397853709101740034,'棉麻','[\'S\',\'M\',\'L\',\'XL\']','2021-05-27 09:54:30','2021-05-27 09:54:30',1,1,0),(1397853890283089922,1397853890262118402,'亞麻','[\'S\',\'M\',\'L\',\'XL\']','2021-05-27 09:55:13','2021-05-27 09:55:13',1,1,0),(1397854133632413697,1397854133603053569,'竹節棉','[\'S\',\'M\',\'L\',\'XL\']','2021-05-27 09:56:11','2021-05-27 09:56:11',1,1,0),(1397854652623007745,1397854652581064706,'棉麻','[\'S\',\'M\',\'L\',\'XL\']','2021-05-27 09:58:15','2021-05-27 09:58:15',1,1,0),(1397854652635590658,1397854652581064706,'亞麻','[\'S\',\'M\',\'L\',\'XL\']','2021-05-27 09:58:15','2021-05-27 09:58:15',1,1,0),(1397854865735593986,1397854865672679425,'亞麻','[\'S\',\'M\',\'L\',\'XL\']','2021-05-27 09:59:06','2021-05-27 09:59:06',1,1,0),(1397855742303186946,1397855742273826817,'亞麻','[\'S\',\'M\',\'L\',\'XL\']','2021-05-27 10:02:35','2021-05-27 10:02:35',1,1,0),(1397855906497605633,1397855906468245506,'棉麻','[\'S\',\'M\',\'L\',\'XL\']','2021-05-27 10:03:14','2021-05-27 10:03:14',1,1,0),(1397856190573621250,1397856190540066818,'亞麻','[\'S\',\'M\',\'L\',\'XL\']','2021-05-27 10:04:21','2021-05-27 10:04:21',1,1,0),(1397859056709316609,1397859056684150785,'亞麻','[\'S\',\'M\',\'L\',\'XL\']','2021-05-27 10:15:45','2021-05-27 10:15:45',1,1,0),(1680835517287018497,1680835517203132417,'竹節棉','[\"M\",\"L\",\"XL\"]','2023-07-17 15:03:10','2023-07-17 15:03:10',1,1,0),(1680835517295407106,1680835517203132417,'','[]','2023-07-17 15:03:10','2023-07-17 15:03:10',1,1,0),(1680835848989356033,1680835848955801601,'亞麻','[\"M\",\"L\",\"XL\"]','2023-07-17 15:04:29','2023-07-17 15:04:29',1,1,0),(1680836093232066561,1680836093211095041,'亞麻','[\"S\",\"M\",\"XL\"]','2023-07-17 15:05:28','2023-07-17 15:05:28',1,1,0),(1680836348598071297,1680836348577099777,'','[]','2023-07-17 15:06:29','2023-07-17 15:06:29',1,1,0),(1680843111229571073,1680843111158267906,'','[]','2023-07-17 16:38:58','2023-07-17 16:38:58',1,1,0),(1680853945280421890,1680853945200730113,'SIZE','[\"S\",\"M\"]','2023-07-17 16:16:24','2023-07-17 16:16:24',1,1,0),(1680853945284616194,1680853945200730113,'材質','[\"亞麻\",\"棉麻\",\"厚綿\"]','2023-07-17 16:16:24','2023-07-17 16:16:24',1,1,0),(1680853945288810497,1680853945200730113,'風格','[\"家居\",\"清涼\",\"休閒\"]','2023-07-17 16:16:24','2023-07-17 16:16:24',1,1,0),(1680853945293004802,1680853945200730113,'類別','[\"下身\",\"內衣\",\"配飾\"]','2023-07-17 16:16:24','2023-07-17 16:16:24',1,1,0),(1680859460567851010,1680859460517519362,'SIZE','[\"S\",\"M\",\"L\",\"XL\"]','2023-07-17 16:38:19','2023-07-17 16:38:19',1,1,0),(1680859460572045314,1680859460517519362,'材質','[\"亞麻\",\"棉麻\",\"竹節棉\",\"厚綿\"]','2023-07-17 16:38:19','2023-07-17 16:38:19',1,1,0),(1680859460576239617,1680859460517519362,'風格','[\"家居\",\"清涼\",\"休閒\",\"商務\"]','2023-07-17 16:38:19','2023-07-17 16:38:19',1,1,0),(1680859460576239618,1680859460517519362,'類別','[\"上身\",\"下身\",\"內衣\",\"配飾\"]','2023-07-17 16:38:19','2023-07-17 16:38:19',1,1,0),(1680864264690102274,1413342036832100354,'SIZE','[\"XL\"]','2023-07-17 16:57:24','2023-07-17 16:57:24',1,1,0),(1680864264698490881,1413342036832100354,'材質','[\"棉麻\",\"竹節棉\",\"厚綿\"]','2023-07-17 16:57:24','2023-07-17 16:57:24',1,1,0),(1680864264702685186,1413342036832100354,'風格','[\"家居\",\"清涼\",\"商務\"]','2023-07-17 16:57:24','2023-07-17 16:57:24',1,1,0),(1680864264702685187,1413342036832100354,'類別','[\"上身\",\"內衣\",\"配飾\"]','2023-07-17 16:57:24','2023-07-17 16:57:24',1,1,0),(1680864996461932546,1397862477831122945,'SIZE','[\"S\",\"M\"]','2023-07-17 17:00:19','2023-07-17 17:00:19',1,1,0),(1680864996474515458,1397862477831122945,'材質','[\"亞麻\",\"棉麻\",\"竹節棉\"]','2023-07-17 17:00:19','2023-07-17 17:00:19',1,1,0),(1680865492560015362,1397862198033297410,'SIZE','[\"S\",\"XL\"]','2023-07-17 17:02:17','2023-07-17 17:02:17',1,1,0),(1680865492564209665,1397862198033297410,'材質','[\"棉麻\",\"竹節棉\",\"厚綿\"]','2023-07-17 17:02:17','2023-07-17 17:02:17',1,1,0),(1680865492568403970,1397862198033297410,'風格','[\"家居\",\"清涼\",\"商務\"]','2023-07-17 17:02:17','2023-07-17 17:02:17',1,1,0),(1680920803656376321,1680920803551518721,'風格','[\"家居\",\"清涼\",\"休閒\"]','2023-07-17 20:42:04','2023-07-17 20:42:04',1,1,0),(1680921193042976770,1680921193017810945,'風格','[\"家居\",\"清涼\",\"休閒\"]','2023-07-17 20:43:37','2023-07-17 20:43:37',1,1,0),(1680934137445302274,1680934137353027585,'SIZE','[\"S\",\"XL\"]','2023-07-17 21:35:03','2023-07-17 21:35:03',1,1,0),(1680934137449496577,1680934137353027585,'材質','[\"亞麻\",\"竹節棉\",\"厚綿\"]','2023-07-17 21:35:03','2023-07-17 21:35:03',1,1,0),(1680934137453690881,1680934137353027585,'風格','[\"家居\",\"清涼\",\"商務\"]','2023-07-17 21:35:03','2023-07-17 21:35:03',1,1,0),(1680934298187808770,1680934298150060034,'SIZE','[\"S\",\"L\",\"XL\"]','2023-07-17 21:35:42','2023-07-17 21:35:42',1,1,0),(1680934298187808771,1680934298150060034,'材質','[\"棉麻\",\"竹節棉\",\"厚綿\"]','2023-07-17 21:35:42','2023-07-17 21:35:42',1,1,0),(1680934298196197377,1680934298150060034,'風格','[\"家居\",\"清涼\",\"商務\"]','2023-07-17 21:35:42','2023-07-17 21:35:42',1,1,0);
/*!40000 ALTER TABLE `dish_flavor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` bigint NOT NULL COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '姓名',
  `username` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '身份证号',
  `status` int NOT NULL DEFAULT '1' COMMENT '状态 0:禁用，1:正常',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `update_user` bigint DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='员工信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'管理員','admin','e10adc3949ba59abbe56e057f20f883e','0932365152','1','H124205042',1,'2021-05-06 17:20:07','2021-05-10 02:24:09',1,1),(1674889045579321345,'張君雅','watatawa','e10adc3949ba59abbe56e057f20f883e','0932365153','1','H124205043',1,'2023-07-01 05:14:01','2023-07-01 05:14:01',1,1),(1675064285656563713,'張曉明','xiaoming','e10adc3949ba59abbe56e057f20f883e','0932365154','1','H124205044',1,'2023-07-01 16:50:22','2023-07-01 16:50:22',1,1),(1678928950752112642,'黃文到','TRD111','e10adc3949ba59abbe56e057f20f883e','0932365151','1','H124205045',1,'2023-07-12 08:47:10','2023-07-12 08:47:10',1,1),(1678947995392061442,'林雨霞','Link0033','e10adc3949ba59abbe56e057f20f883e','0912345678','0','A123456789',1,'2023-07-12 10:02:50','2023-07-16 19:31:45',1,1),(1678948237546008578,'陳美玲','Marry888','e10adc3949ba59abbe56e057f20f883e','0987654321','0','C234567890',1,'2023-07-12 10:03:48','2023-07-12 10:03:48',1,1),(1678948540932599809,'黃志偉','Yellowman321','e10adc3949ba59abbe56e057f20f883e','0921876543','1','J109876543',1,'2023-07-12 10:05:00','2023-07-12 10:05:00',1,1),(1678948811045777410,'劉雅文','Long345','e10adc3949ba59abbe56e057f20f883e','0954321098','0','A123456782',1,'2023-07-12 10:06:05','2023-07-12 13:12:18',1,1),(1679020170976215042,'王烏賊','sss111','e10adc3949ba59abbe56e057f20f883e','0934343454','1','H123214567',1,'2023-07-12 14:49:38','2023-07-16 15:07:40',1,1),(1680473702564638721,'劉玄德','leader01','e10adc3949ba59abbe56e057f20f883e','0912345678','1','H123456789',1,'2023-07-16 15:05:27','2023-07-16 19:59:41',1,1),(1680473876821192705,'關雲長','RedFace002','e10adc3949ba59abbe56e057f20f883e','0912345679','1','H123456780',1,'2023-07-16 15:06:09','2023-07-16 15:06:09',1,1),(1680474036963913729,'張翼德','BigBeer003','e10adc3949ba59abbe56e057f20f883e','0923456789','1','H123456788',1,'2023-07-16 15:06:47','2023-07-16 15:06:47',1,1),(1680540397572476930,'趙子龍','WhiteHourse005','e10adc3949ba59abbe56e057f20f883e','0987654321','1','H124232145',1,'2023-07-16 19:30:28','2023-07-16 19:30:28',1,1),(1680547570805379074,'王大錘','Dum001','e10adc3949ba59abbe56e057f20f883e','0912321234','1','H112245567',1,'2023-07-16 19:58:59','2023-07-19 11:56:05',1,1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` bigint NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '名字',
  `image` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '图片',
  `order_id` bigint NOT NULL COMMENT '订单id',
  `dish_id` bigint DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT '1' COMMENT '数量',
  `amount` decimal(10,2) NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='订单明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL COMMENT '主键',
  `number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '订单号',
  `status` int NOT NULL DEFAULT '1' COMMENT '订单状态 1待付款，2待派送，3已派送，4已完成，5已取消',
  `user_id` bigint NOT NULL COMMENT '下单用户',
  `address_book_id` bigint NOT NULL COMMENT '地址id',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `checkout_time` datetime NOT NULL COMMENT '结账时间',
  `pay_method` int NOT NULL DEFAULT '1' COMMENT '支付方式 1微信,2支付宝',
  `amount` decimal(10,2) NOT NULL COMMENT '实收金额',
  `remark` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '备注',
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `consignee` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setmeal`
--

DROP TABLE IF EXISTS `setmeal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setmeal` (
  `id` bigint NOT NULL COMMENT '主键',
  `category_id` bigint NOT NULL COMMENT '菜品分类id',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '套餐名称',
  `price` decimal(10,2) NOT NULL COMMENT '套餐价格',
  `status` int DEFAULT NULL COMMENT '状态 0:停用 1:启用',
  `code` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '编码',
  `description` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '描述信息',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '图片',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  `is_deleted` int NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_setmeal_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='套餐';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setmeal`
--

LOCK TABLES `setmeal` WRITE;
/*!40000 ALTER TABLE `setmeal` DISABLE KEYS */;
INSERT INTO `setmeal` VALUES (1680921834331086849,1413384954989060097,'商務西裝套裝',2999.00,1,'','','17439044-3ac3-4641-9f45-2af5682c38dd.jpg','2023-07-17 20:46:10','2023-07-17 20:46:10',1,1,0),(1680934811545452545,1413384954989060097,'亞麻混紡休閒套裝',110000.00,1,'','','2ee012e1-6ed5-4d98-b154-83d29a7bcc1c.jpg','2023-07-17 21:37:44','2023-07-17 21:37:44',1,1,0);
/*!40000 ALTER TABLE `setmeal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setmeal_dish`
--

DROP TABLE IF EXISTS `setmeal_dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setmeal_dish` (
  `id` bigint NOT NULL COMMENT '主键',
  `setmeal_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '套餐id ',
  `dish_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '菜品id',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '菜品名称 （冗余字段）',
  `price` decimal(10,2) DEFAULT NULL COMMENT '菜品原价（冗余字段）',
  `copies` int NOT NULL COMMENT '份数',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  `is_deleted` int NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='套餐菜品关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setmeal_dish`
--

LOCK TABLES `setmeal_dish` WRITE;
/*!40000 ALTER TABLE `setmeal_dish` DISABLE KEYS */;
INSERT INTO `setmeal_dish` VALUES (1415580119052894209,'1415580119015145474','1397862198033297410','老火靓汤',49800.00,1,0,'2021-07-15 15:52:55','2021-07-15 15:52:55',1415576781934608386,1415576781934608386,0),(1415580119061282817,'1415580119015145474','1413342036832100354','北冰洋',500.00,1,0,'2021-07-15 15:52:55','2021-07-15 15:52:55',1415576781934608386,1415576781934608386,0),(1415580119069671426,'1415580119015145474','1413385247889891330','米饭',200.00,1,0,'2021-07-15 15:52:55','2021-07-15 15:52:55',1415576781934608386,1415576781934608386,0),(1680921834394001410,'1680921834331086849','1680920944291389442','彈性西裝外套',690.00,1,0,'2023-07-17 20:46:10','2023-07-17 20:46:10',1,1,0),(1680921834402390018,'1680921834331086849','1680920803551518721','商務彈性短袖襯衫',499.00,1,0,'2023-07-17 20:46:10','2023-07-17 20:46:10',1,1,0),(1680921834406584321,'1680921834331086849','1680853945200730113','西裝寬版五分褲',450.00,1,0,'2023-07-17 20:46:10','2023-07-17 20:46:10',1,1,0),(1680934811604172802,'1680934811545452545','1680934298150060034','亞麻混紡泡泡袖上衣',499.00,1,0,'2023-07-17 21:37:44','2023-07-17 21:37:44',1,1,0),(1680934811612561410,'1680934811545452545','1680934137353027585','棉質鬆緊九分褲',590.00,1,0,'2023-07-17 21:37:44','2023-07-17 21:37:44',1,1,0);
/*!40000 ALTER TABLE `setmeal_dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart` (
  `id` bigint NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '名称',
  `image` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '图片',
  `user_id` bigint NOT NULL COMMENT '主键',
  `dish_id` bigint DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT '1' COMMENT '数量',
  `amount` decimal(10,2) NOT NULL COMMENT '金额',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='购物车';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '姓名',
  `phone` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '身份证号',
  `avatar` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '头像',
  `status` int DEFAULT '0' COMMENT '状态 0:禁用，1:正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='用户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'reggie'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-19 15:29:56
