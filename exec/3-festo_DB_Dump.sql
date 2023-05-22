CREATE DATABASE  IF NOT EXISTS `festo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `festo`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: k8c106.p.ssafy.io    Database: festo
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `booth`
--

DROP TABLE IF EXISTS `booth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booth` (
  `booth_id` bigint NOT NULL AUTO_INCREMENT,
  `booth_description` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `close_time` time NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `location_description` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `open_time` time NOT NULL,
  `festival_id` bigint DEFAULT NULL,
  `owner_id` bigint DEFAULT NULL,
  PRIMARY KEY (`booth_id`),
  KEY `FKrcg3hhtj8m6obw4x71nfynpc5` (`festival_id`),
  KEY `FK5t6hcteu1y9ppy051opnpbw0j` (`owner_id`),
  CONSTRAINT `FK5t6hcteu1y9ppy051opnpbw0j` FOREIGN KEY (`owner_id`) REFERENCES `member` (`id`),
  CONSTRAINT `FKrcg3hhtj8m6obw4x71nfynpc5` FOREIGN KEY (`festival_id`) REFERENCES `festival` (`festival_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booth`
--

LOCK TABLES `booth` WRITE;
/*!40000 ALTER TABLE `booth` DISABLE KEYS */;
INSERT INTO `booth` VALUES (1,'마라탕이 맛있는 미미가입니다!','CLOSE','18:00:00','https://festo-s3.s3.ap-northeast-2.amazonaws.com/festo/booth/1/booth1.png','수완지구 128-5','오예','08:00:00',1,2),(2,'맛있는 돼지고기','CLOSE','18:51:00','https://festo-s3.s3.ap-northeast-2.amazonaws.com/festo/booth/2/JaudlPaMxzH-kbYH_b788UT_sX47F_ajB1hFH7s37d5CZUqOfA6vcoXMiW3E4--hG_PwgDcvQ6Hi021KyzghLQ.webp','채은이방','돼지숯불구이','11:51:00',1,1),(3,'마라탕이 맛있는 미미가입니다!','OPEN','18:00:00','https://festo-s3.s3.ap-northeast-2.amazonaws.com/festo/booth/3/booth1.png','수완지구 128-5','오예','08:00:00',2,2),(4,'없는게 없는 집','CLOSE','23:20:00','https://festo-s3.s3.ap-northeast-2.amazonaws.com/boothDefault.png','싸피 222','진문1','06:15:00',3,3),(5,'유도 천재 장진문이 만드는 떡볶이 맛집','CLOSE','08:40:00','https://festo-s3.s3.ap-northeast-2.amazonaws.com/boothDefault.png','장덕동','또리아빠네','02:40:00',3,2),(6,'ㅇㅇㅇ','CLOSE','18:20:00','https://festo-s3.s3.ap-northeast-2.amazonaws.com/boothDefault.png','ㅇㅇ','테스트1','15:20:00',1,2),(7,'집가자요','CLOSE','23:26:00','https://festo-s3.s3.ap-northeast-2.amazonaws.com/boothDefault.png','집','진문2','20:20:00',1,3),(8,'ㅇㅇㅇ','CLOSE','18:54:00','https://festo-s3.s3.ap-northeast-2.amazonaws.com/boothDefault.png','ㅇㅇㅇ','타코야끼맛집','15:54:00',1,2),(9,'채은이는 참 열심히한다','CLOSE','03:21:00','https://festo-s3.s3.ap-northeast-2.amazonaws.com/festo/booth/9/%EB%8B%A4%EC%9A%B4%EB%A1%9C%EB%93%9C.jpeg','상무지구','채은이짱짱맨','20:20:00',1,1),(10,'마라탕이 맛있는 미미가입니다!','CLOSE','03:00:00','https://festo-s3.s3.ap-northeast-2.amazonaws.com/festo/booth/10/booth1.png','수완지구 128-5','테스트ㅇㅇ','17:00:00',2,2),(11,'축제는 치킨이지! 두 마리 같은 한 마리!!!','OPEN','20:00:00','https://cdn.imweb.me/thumbnail/20180814/5b7287fdc19c4.jpg','입구에서 5번 째 부스','포라코','10:00:00',4,4),(12,'닭꼬치 양이 아쉬웠던 분들 주목!','CLOSE','20:00:00','https://cdn.imweb.me/thumbnail/20220608/40eb972c2be39.jpg','입구에서 7번 째 부스','먹깨비','10:00:00',4,4),(13,'타코야키가 된 문어의 가슴 시린 사연...','CLOSE','20:00:00','https://cdn.imweb.me/thumbnail/20220608/0d664b56b5ce9.jpg','입구에서 10번 째 부스','타코스토리','10:00:00',4,4),(14,'소개 없음','CLOSE','20:00:00','https://cdn.imweb.me/thumbnail/20220525/deb2b2e4cefc1.jpg','입구에서 7번 째 부스','널부르는트럭','10:00:00',4,4),(15,'닭꼬치 팔아요','CLOSE','20:00:00','https://cdn.imweb.me/thumbnail/20220525/23ebf13dcd387.jpg','입구에서 2번 째 부스','짱츄닭','10:00:00',4,4),(16,'새우 원툴','CLOSE','20:00:00','https://cdn.imweb.me/thumbnail/20181008/5bbabec54e8c1.jpeg','입구에서 10번 째 부스','BAM MA SIL(밤마실)','10:00:00',4,4),(17,'야식 취저!','CLOSE','20:00:00','https://cdn.imweb.me/thumbnail/20181008/5bbaba0aab8b5.jpg','입구에서 1번 째 부스','미드나잇','10:00:00',4,4),(18,'신라호텔 주방장 출신이 되고 싶었던 한 남자의 푸드트럭','CLOSE','20:00:00','https://cdn.imweb.me/thumbnail/20180807/5b692481888f7.jpg','입구에서 6번 째 부스','YO! Chef!','10:00:00',4,4),(19,'너는 누구냐','CLOSE','20:00:00','https://cdn.imweb.me/thumbnail/20180704/5b3c23bcbcce0.jpg','입구에서 3번 째 부스','나는 닭강정 이다','10:00:00',4,4),(20,'누들 없음','CLOSE','20:00:00','https://cdn.imweb.me/thumbnail/20180703/5b3b4d6790b54.jpg','입구에서 7번 째 부스','오산누들','10:00:00',4,4),(21,'축제엔 츄러스다 진짜','CLOSE','20:00:00','https://cdn.imweb.me/thumbnail/20180703/5b3b3d3a3a69e.jpg','입구에서 1번 째 부스','마이츄러스','10:00:00',4,4),(22,'핫도그와 타코야키가 있답니다','CLOSE','20:00:00','https://cdn.imweb.me/thumbnail/20180620/5b29feb975079.jpg','입구에서 1번 째 부스','아라푸드','10:00:00',4,4),(23,'바게트 샌드위치로 겨루는 진검승부!!','CLOSE','20:00:00','https://cdn.imweb.me/thumbnail/20171009/59db1d57ce663.jpg','입구에서 1번 째 부스','필살 샌드위치','10:00:00',4,4),(24,'축제는 치킨이지! 두 마리 같은 한 마리!!!','CLOSE','03:00:00','https://festo-s3.s3.ap-northeast-2.amazonaws.com/festo/booth/24/booth1.png','광주광역시 서구 128-5','포라코','17:00:00',2,2);
/*!40000 ALTER TABLE `booth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fcm_device_token`
--

DROP TABLE IF EXISTS `fcm_device_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fcm_device_token` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fcm_device_token`
--

LOCK TABLES `fcm_device_token` WRITE;
/*!40000 ALTER TABLE `fcm_device_token` DISABLE KEYS */;
INSERT INTO `fcm_device_token` VALUES (1,1,''),(2,2,'fyJXQDfiS0uIKSLUQSn32m:APA91bHaezJ0TETaWdFNqxCiGLgaa0dRK6liQHiUknL7gzhw64n7x2LvkOs4DEA92t9S849esvbhdNyie4PP_60LBnjxOehm39_MEADMX-nauApGYcZ2vRH9bG6oUyVUJpMxI6Nwe1gI'),(3,3,'cMqRdVseQ122BFgEBh6Lfe:APA91bHZ82yYkVO-ebPA4Ut0XaY4JHvME6mIPx-gb-L71E5XkUQzbPyl5i6kXtr8YBmKjtMU4v-XuWhAhIofI8-6Q_SGTIJDI_S7GmpStFbwB7VrVD9TkYmI9u9yHYMhb-qd1QoqUVsZ'),(4,4,'fyJXQDfiS0uIKSLUQSn32m:APA91bHaezJ0TETaWdFNqxCiGLgaa0dRK6liQHiUknL7gzhw64n7x2LvkOs4DEA92t9S849esvbhdNyie4PP_60LBnjxOehm39_MEADMX-nauApGYcZ2vRH9bG6oUyVUJpMxI6Nwe1gI'),(5,5,'dFP8ayijSJqs2YEqo1DLlC:APA91bHhkucksSDzry0PEpOTtTn1QKYJbtkv7a76jgwCWCvsbv16O83bqJENKrKccw9gsLuy1dcyLvCeapIyWb5io0boI20_V2w6CNReSlUASIZS1XodKEYeoFpBxs7lCM7UxgMyHl0k');
/*!40000 ALTER TABLE `fcm_device_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `festival`
--

DROP TABLE IF EXISTS `festival`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `festival` (
  `festival_id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `end_date` date NOT NULL,
  `status` varchar(255) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `invite_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `manager_id` bigint DEFAULT NULL,
  PRIMARY KEY (`festival_id`),
  UNIQUE KEY `UK_l8t01p5ymq4egk71nq8eexsk4` (`invite_code`),
  KEY `FKcgwbfhsguei6bvqfcfvk67xv4` (`manager_id`),
  CONSTRAINT `FKcgwbfhsguei6bvqfcfvk67xv4` FOREIGN KEY (`manager_id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `festival`
--

LOCK TABLES `festival` WRITE;
/*!40000 ALTER TABLE `festival` DISABLE KEYS */;
INSERT INTO `festival` VALUES (1,'광양 정채은집','숯불향이 솔솔','2023-05-31','CLOSE','https://festo-s3.s3.ap-northeast-2.amazonaws.com/festivalDefault.png','299162','광양숯불구이축제','2023-05-16',1),(2,'진주 남강로 128-5','진주의 자랑 진주의 유등 축제!','2023-06-01','CLOSE','https://festo-s3.s3.ap-northeast-2.amazonaws.com/festo/festival/2/festival.png','498657','진주남강유등축','2023-05-05',2),(3,'싸피 221','부럽부럽','2023-05-20','CLOSE','https://festo-s3.s3.ap-northeast-2.amazonaws.com/festivalDefault.png','276247','진문축제	','2023-05-16',3),(4,'서울랜드','국내 최고 EDM 페스티벌 월드디제이페스티벌이 Special Edition으로 돌아옵니다! 뜨거운 더위를 시원하게 날려버릴 더 특별해진 월디페와 함께하세요!','2023-05-24','CLOSE','https://festo-s3.s3.ap-northeast-2.amazonaws.com/festo/festival/4/%EC%B6%95%EC%A0%9C%EC%82%AC%EC%A7%84.jpg','677304','World DJ Festival','2023-05-17',4);
/*!40000 ALTER TABLE `festival` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `auth_id` bigint NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `profile_image_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_slxrx0npbedl2g36lara0ere` (`auth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,2781896553,'정무남','https://k.kakaocdn.net/dn/dpk9l1/btqmGhA2lKL/Oz0wDuJn1YV2DIn92f6DVK/img_640x640.jpg'),(2,2763834095,'정채은','https://k.kakaocdn.net/dn/bV4jTH/btr8XzsQPnp/PTgzuroqt6wmsz1JXLNdmK/img_640x640.jpg'),(3,2761657509,'장진문','https://k.kakaocdn.net/dn/LIiZs/btseoWRtvQz/OIKdSm44LY30tFIHg10L6k/img_640x640.jpg'),(4,2793845431,'이충무','https://k.kakaocdn.net/dn/dpk9l1/btqmGhA2lKL/Oz0wDuJn1YV2DIn92f6DVK/img_640x640.jpg'),(5,2794353447,'진문','https://k.kakaocdn.net/dn/dpk9l1/btqmGhA2lKL/Oz0wDuJn1YV2DIn92f6DVK/img_640x640.jpg');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `time_stamp` bigint NOT NULL,
  `booth_id` bigint DEFAULT NULL,
  `festival_id` bigint DEFAULT NULL,
  `order_id` bigint NOT NULL,
  `receiver_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKn2iacunvg8twyqu9wb8709ydh` (`booth_id`),
  KEY `FK6cwjfces4s4mq725n9qam8lue` (`festival_id`),
  KEY `FK8ec3mroggermua3g3dsm618ad` (`order_id`),
  KEY `FK1jpw68rbaxvu8u5l1dniain1l` (`receiver_id`),
  CONSTRAINT `FK1jpw68rbaxvu8u5l1dniain1l` FOREIGN KEY (`receiver_id`) REFERENCES `member` (`id`),
  CONSTRAINT `FK6cwjfces4s4mq725n9qam8lue` FOREIGN KEY (`festival_id`) REFERENCES `festival` (`festival_id`),
  CONSTRAINT `FK8ec3mroggermua3g3dsm618ad` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `FKn2iacunvg8twyqu9wb8709ydh` FOREIGN KEY (`booth_id`) REFERENCES `booth` (`booth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'새로운 주문이 들어왔어요!',1684205584161,2,1,1,1),(2,'주문이 수락되었어요! 금방 준비할게요:)',1684205605473,2,1,1,3),(3,'상품이 준비되었어요!',1684205615096,2,1,1,3),(4,'새로운 주문이 들어왔어요!',1684205667296,2,1,2,1),(5,'주문이 수락되었어요! 금방 준비할게요:)',1684205746352,2,1,2,3),(6,'상품이 준비되었어요!',1684206021743,2,1,2,3),(7,'새로운 주문이 들어왔어요!',1684206129055,1,1,3,2),(8,'주문이 수락되었어요! 금방 준비할게요:)',1684206147569,1,1,3,3),(9,'새로운 주문이 들어왔어요!',1684206229264,1,1,4,2),(10,'주문이 수락되었어요! 금방 준비할게요:)',1684206244047,1,1,4,3),(11,'새로운 주문이 들어왔어요!',1684206885389,2,1,5,1),(12,'상품 수령이 완료되었습니다!',1684212499336,2,1,1,3),(13,'상품 수령이 완료되었습니다!',1684212499336,2,1,1,1),(14,'새로운 주문이 들어왔어요!',1684214018777,3,2,6,2),(15,'주문이 수락되었어요! 금방 준비할게요:)',1684214045580,3,2,6,2),(16,'상품이 준비되었어요!',1684214046256,3,2,6,2),(17,'상품 수령이 완료되었습니다!',1684214046863,3,2,6,2),(18,'상품 수령이 완료되었습니다!',1684214046863,3,2,6,2),(19,'새로운 주문이 들어왔어요!',1684214106671,3,2,7,2),(20,'새로운 주문이 들어왔어요!',1684214207464,3,2,8,2),(21,'주문이 수락되었어요! 금방 준비할게요:)',1684214237534,3,2,7,3),(22,'상품이 준비되었어요!',1684214247498,3,2,7,3),(23,'새로운 주문이 들어왔어요!',1684214280237,3,2,9,2),(24,'새로운 주문이 들어왔어요!',1684214711128,4,3,10,3),(25,'새로운 주문이 들어왔어요!',1684214720271,3,2,11,2),(26,'새로운 주문이 들어왔어요!',1684214721641,3,2,12,2),(27,'새로운 주문이 들어왔어요!',1684218193638,2,1,13,1),(28,'새로운 주문이 들어왔어요!',1684218336075,2,1,14,1),(29,'새로운 주문이 들어왔어요!',1684218682966,2,1,15,1),(30,'주문이 수락되었어요! 금방 준비할게요:)',1684245873531,4,3,10,2),(31,'상품이 준비되었어요!',1684245881475,4,3,10,2),(32,'새로운 주문이 들어왔어요!',1684246357944,2,1,16,1),(33,'주문이 수락되었어요! 금방 준비할게요:)',1684246370183,2,1,16,3),(34,'상품이 준비되었어요!',1684246376541,2,1,16,3),(35,'새로운 주문이 들어왔어요!',1684246474536,4,3,17,3),(36,'주문이 수락되었어요! 금방 준비할게요:)',1684246489021,4,3,17,1),(37,'상품이 준비되었어요!',1684246527349,4,3,17,1),(38,'상품 수령이 완료되었습니다!',1684246542243,4,3,17,1),(39,'상품 수령이 완료되었습니다!',1684246542243,4,3,17,3),(40,'새로운 주문이 들어왔어요!',1684282112355,3,2,18,2),(41,'새로운 주문이 들어왔어요!',1684282546112,4,3,19,3),(42,'상품이 준비되었어요!',1684288110877,1,1,4,3),(43,'새로운 주문이 들어왔어요!',1684307927987,11,4,20,4),(44,'새로운 주문이 들어왔어요!',1684308086158,11,4,21,4),(45,'새로운 주문이 들어왔어요!',1684308152916,11,4,22,4),(46,'주문이 수락되었어요! 금방 준비할게요:)',1684308176359,11,4,20,2),(47,'상품이 준비되었어요!',1684308177211,11,4,20,2),(48,'상품 수령이 완료되었습니다!',1684308178753,11,4,20,2),(49,'상품 수령이 완료되었습니다!',1684308178753,11,4,20,4),(50,'주문이 수락되었어요! 금방 준비할게요:)',1684308187209,11,4,21,2),(51,'상품이 준비되었어요!',1684308188333,11,4,21,2),(52,'주문이 수락되었어요! 금방 준비할게요:)',1684308190612,11,4,22,2),(53,'상품 수령이 완료되었습니다!',1684309174925,11,4,21,2),(54,'상품 수령이 완료되었습니다!',1684309174925,11,4,21,4),(55,'상품이 준비되었어요!',1684309175811,11,4,22,2),(56,'상품 수령이 완료되었습니다!',1684309186359,11,4,22,2),(57,'상품 수령이 완료되었습니다!',1684309186359,11,4,22,4),(58,'새로운 주문이 들어왔어요!',1684310628608,24,2,23,2),(59,'새로운 주문이 들어왔어요!',1684314013238,1,1,24,2),(60,'상품 수령이 완료되었습니다!',1684334680097,2,1,16,3),(61,'상품 수령이 완료되었습니다!',1684334680097,2,1,16,1),(62,'주문이 수락되었어요! 금방 준비할게요:)',1684334681454,2,1,15,2);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_line`
--

DROP TABLE IF EXISTS `order_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_line` (
  `order_number` bigint NOT NULL,
  `amounts` int NOT NULL,
  `menu_id` bigint DEFAULT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  `line_idx` int NOT NULL,
  PRIMARY KEY (`order_number`,`line_idx`),
  CONSTRAINT `FK9ljecg035nd78m2y3y1wnink4` FOREIGN KEY (`order_number`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line`
--

LOCK TABLES `order_line` WRITE;
/*!40000 ALTER TABLE `order_line` DISABLE KEYS */;
INSERT INTO `order_line` VALUES (1,2000,1,2000,1,0),(2,4000,1,2000,2,0),(3,2000,2,2000,1,0),(4,2000,2,2000,1,0),(5,2000,1,2000,1,0),(6,4000,3,2000,2,0),(6,12000,4,4000,3,1),(6,12000,5,4000,3,2),(6,4000,6,4000,1,3),(6,4000,7,4000,1,4),(7,4000,3,2000,2,0),(7,8000,5,4000,2,1),(8,4000,7,4000,1,0),(8,12000,8,4000,3,1),(9,4000,6,4000,1,0),(9,4000,7,4000,1,1),(9,4000,8,4000,1,2),(10,36000,10,4000,9,0),(11,4000,7,4000,1,0),(11,12000,8,4000,3,1),(12,4000,3,2000,2,0),(12,8000,5,4000,2,1),(13,12000,3,2000,6,0),(14,12000,3,2000,6,0),(15,12000,3,2000,6,0),(16,2000,1,2000,1,0),(16,40000,12,40000,1,1),(17,8000,10,4000,2,0),(18,6000,3,2000,3,0),(19,8000,10,4000,2,0),(20,21000,19,7000,3,0),(21,20000,20,10000,2,0),(22,20000,20,10000,2,0),(23,28000,57,4000,7,0),(23,15000,58,3000,5,1),(23,60000,59,5000,12,2),(23,33000,60,3000,11,3),(24,4000,2,2000,2,0);
/*!40000 ALTER TABLE `order_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` bigint NOT NULL AUTO_INCREMENT,
  `order_number` int NOT NULL,
  `status` varchar(255) NOT NULL,
  `order_time` datetime(6) DEFAULT NULL,
  `total_amounts` int NOT NULL,
  `booth_id` bigint NOT NULL,
  `orderer_id` bigint DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FKrbycyieq755q4xvwgsu5t62nn` (`booth_id`),
  KEY `FKn7utyv8a953cnex3o1dhh9gg5` (`orderer_id`),
  CONSTRAINT `FKn7utyv8a953cnex3o1dhh9gg5` FOREIGN KEY (`orderer_id`) REFERENCES `member` (`id`),
  CONSTRAINT `FKrbycyieq755q4xvwgsu5t62nn` FOREIGN KEY (`booth_id`) REFERENCES `booth` (`booth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'COMPLETE','2023-05-16 08:53:04.111436',2000,2,3),(2,2,'WAITING_RECEIVE','2023-05-16 11:54:27.287901',4000,2,3),(3,1,'PREPARING_ORDER','2023-05-16 12:02:09.046174',2000,1,3),(4,2,'WAITING_RECEIVE','2023-05-16 12:03:49.253994',2000,1,3),(5,3,'WAITING_ACCEPTANCE','2023-05-16 12:14:45.380626',2000,2,3),(6,1,'COMPLETE','2023-05-16 14:13:38.744797',36000,3,2),(7,2,'WAITING_RECEIVE','2023-05-16 14:15:06.660516',12000,3,3),(8,3,'WAITING_ACCEPTANCE','2023-05-16 14:16:47.443748',16000,3,3),(9,4,'WAITING_ACCEPTANCE','2023-05-16 14:18:00.222816',12000,3,3),(10,1,'WAITING_RECEIVE','2023-05-16 14:25:11.118113',36000,4,2),(11,5,'WAITING_ACCEPTANCE','2023-05-16 14:25:20.258380',16000,3,3),(12,6,'WAITING_ACCEPTANCE','2023-05-16 14:25:21.630952',12000,3,3),(13,4,'WAITING_ACCEPTANCE','2023-05-16 15:23:13.540264',12000,2,2),(14,5,'WAITING_ACCEPTANCE','2023-05-16 15:25:36.022396',12000,2,2),(15,6,'PREPARING_ORDER','2023-05-16 15:31:22.901333',12000,2,2),(16,7,'COMPLETE','2023-05-16 23:12:37.928602',42000,2,3),(17,2,'COMPLETE','2023-05-16 23:14:34.525633',8000,4,1),(18,7,'WAITING_ACCEPTANCE','2023-05-17 09:08:32.343106',6000,3,2),(19,3,'WAITING_ACCEPTANCE','2023-05-17 09:15:46.103726',8000,4,3),(20,1,'COMPLETE','2023-05-17 16:18:47.957090',21000,11,2),(21,2,'COMPLETE','2023-05-17 16:21:26.147773',20000,11,2),(22,3,'COMPLETE','2023-05-17 16:22:32.905489',20000,11,2),(23,1,'WAITING_ACCEPTANCE','2023-05-17 17:03:48.594006',136000,24,2),(24,3,'WAITING_ACCEPTANCE','2023-05-17 18:00:13.228675',4000,1,2);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` bigint NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `booth_id` bigint NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FKe4dyyjct0j6bcenubf80rklpm` (`booth_id`),
  CONSTRAINT `FKe4dyyjct0j6bcenubf80rklpm` FOREIGN KEY (`booth_id`) REFERENCES `booth` (`booth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'https://festo-s3.s3.ap-northeast-2.amazonaws.com/festo/product/1/20230515_151916.jpg','아아아샷추',2000,2),(2,'https://festo-s3.s3.ap-northeast-2.amazonaws.com/festo/product/2/menu3.png','타코야',2000,1),(3,'https://festo-s3.s3.ap-northeast-2.amazonaws.com/festo/product/3/menu3.png','타코야',2000,3),(4,'https://festo-s3.s3.ap-northeast-2.amazonaws.com/festo/product/4/menu2.png','떡볶',4000,3),(5,'https://festo-s3.s3.ap-northeast-2.amazonaws.com/festo/product/5/menu2.png','순대',4000,3),(6,'https://festo-s3.s3.ap-northeast-2.amazonaws.com/productDefault.png','튀김',4000,3),(7,'https://festo-s3.s3.ap-northeast-2.amazonaws.com/productDefault.png','김밥',4000,3),(8,'https://festo-s3.s3.ap-northeast-2.amazonaws.com/productDefault.png','쫄면',4000,3),(9,'https://festo-s3.s3.ap-northeast-2.amazonaws.com/productDefault.png','팥빙수',4000,3),(10,'https://festo-s3.s3.ap-northeast-2.amazonaws.com/productDefault.png','채은이사료',4000,4),(11,'https://festo-s3.s3.ap-northeast-2.amazonaws.com/productDefault.png','팥빙수',4000,5),(12,'https://festo-s3.s3.ap-northeast-2.amazonaws.com/festo/product/12/20230515_151916.jpg','아아아아아아아아아아아',40000,2),(13,'https://festo-s3.s3.ap-northeast-2.amazonaws.com/festo/product/13/41m5230m0_1.jpg','으아아아아아',5000,2),(14,'https://festo-s3.s3.ap-northeast-2.amazonaws.com/festo/product/14/20230509_163307.jpg','내키보드',999999,2),(15,'https://festo-s3.s3.ap-northeast-2.amazonaws.com/productDefault.png','타코야	',4000,6),(16,'https://festo-s3.s3.ap-northeast-2.amazonaws.com/productDefault.png','타코야',4000,8),(17,'https://festo-s3.s3.ap-northeast-2.amazonaws.com/festo/product/17/20230515_151916.jpg','타코야',1000,9),(18,'https://festo-s3.s3.ap-northeast-2.amazonaws.com/productDefault.png','타코',4000,7),(19,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/5b72895296f52.jpg','치킨(소)',7000,11),(20,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/5b72895296f52.jpg','치킨(대)',10000,11),(21,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/340c7a8af745b.jpg','롱점보닭꼬치',4000,12),(22,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/a23717fdf3bbf.jpg','타코야끼 10알',5000,13),(23,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/5d4b6fcca5798.jpg','소떡소떡 1개',3000,13),(24,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/95436354151cc.jpg','멘보샤 6개',8000,13),(25,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/9d62924679b81.jpg','수제타코야끼',5000,14),(26,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/a43529d196c4f.jpg','닭꼬치',4000,15),(27,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/5bbabb2166f15.jpeg','칠리쉬림프',7000,16),(28,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/5bbabb0a22554.jpeg','갈릭버터쉬림프',7000,16),(29,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/5bbabb0a3b6d8.jpeg','레몬크림쉬림프',7000,16),(30,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/5bbab9cbe4716.jpg','새우플레이트',9000,17),(31,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/5bbab9cc01cc0.jpg','마약옥수수',4000,17),(32,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/5b69232cebc4c.jpg','마요롱닭꼬치',3500,18),(33,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/5b6923294c311.jpg','매운롱닭꼬치',3500,18),(34,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/5b69232ac677b.jpg','데리롱닭꼬치',3500,18),(35,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/5b69232e5b30e.jpg','치즈롱닭꼬치',4500,18),(36,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/5b692326aca73.jpg','갈비꼬치',4500,18),(37,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/5b6923da0cc51.jpg','스테이크꼬치',5500,18),(38,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/5b6923281c127.jpg','쏘떡쏘떡',3000,18),(39,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/5b3c2204a844a.jpg','닭강정(작은컵)',5000,19),(40,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/5b3c2204a844a.jpg','닭강정(큰컵)',10000,19),(41,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/5b3b47ef78d02.jpg','여왕오징어튀김',7000,20),(42,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/5b3b47ef3904d.jpg','왕새우튀김',7000,20),(43,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/5b3b47ef449f3.jpg','무뼈닭발',10000,20),(44,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/5b3b47ef6983f.jpg','순쌀떡볶이',4000,20),(45,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/5b3b47ef8a2d5.png','옛날핫도그',2500,20),(46,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/5b3b3c88e3a4f.jpg','츄러스',3000,21),(47,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/5b3b3c89081b1.jpg','회오리감자',3000,21),(48,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/5b29fe616ba0a.png','아라 핫도그',4000,22),(49,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/5b29fdff08b7c.jpg','타코야키 7개',3000,22),(50,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/5b29fdff08b7c.jpg','타코야키 12개',5000,22),(51,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/5b29fdff08b7c.jpg','타코야키 20개',8000,22),(52,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/5b29fdfeec02e.jpg','슬러시',2000,22),(53,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/5b29fdff1b6d9.jpg','임실치즈아이스크림',3500,22),(54,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/59db193f2cd91.jpg','필리 치즈 스테이크 샌드위치',7900,23),(55,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/59db194fd7511.jpg','연어 샌드위치',8500,23),(56,'https://cdn.imweb.me/upload/S2017041358eed92818b4f/59db195ce1a51.jpg','닭발 샌드위치',8500,23),(57,'https://festo-s3.s3.ap-northeast-2.amazonaws.com/festo/product/57/m1.png','닭강정',4000,24),(58,'https://festo-s3.s3.ap-northeast-2.amazonaws.com/festo/product/58/m2.png','콜팝',3000,24),(59,'https://festo-s3.s3.ap-northeast-2.amazonaws.com/festo/product/59/m3.png','조각피자',5000,24),(60,'https://festo-s3.s3.ap-northeast-2.amazonaws.com/festo/product/60/m4.png','닭꼬치',3000,24);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-18 10:26:09
