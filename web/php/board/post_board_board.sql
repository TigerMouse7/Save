-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: post_board
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `pw` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `date` date NOT NULL,
  `hit` int NOT NULL DEFAULT '0',
  `lock_post` int DEFAULT NULL,
  `file` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'ㅁ','$2y$10$MZ6pZozjY8GBwXEVinF9MueSacLGXerqUGeO3AbCi7YX9VaP5snuu','ㅁ','ㅁ','2021-02-08',0,NULL,NULL),(2,'ㅁ','$2y$10$FVhLcg/g138zqvRwjptKi.5qbjjjwwrncONvAY2tdczvnQaoqKkGC','ㅁ','ㅁ','2021-02-08',0,NULL,NULL),(5,'ㅁ','$2y$10$MZ6pZozjY8GBwXEVinF9MueSacLGXerqUGeO3AbCi7YX9VaP5snuu','ㅁ','ㅁ','2021-02-08',0,NULL,NULL),(7,'asasdasdasd','$2y$10$mRaRLbvD/7ntTCVu9wVTJ.ff2Kx/e.D/cmxeGnmTx.jGJxf70fR6i','asdasasdasd','asasasdas','2021-02-08',3,NULL,NULL),(8,'asdasd','$2y$10$nKy6R9sXG0Ply9Q9T6wnpeVMfd5m4Erse5Y/wdoU.lPbR01eHqVZa','asdasd','asdasd','2021-02-08',3,NULL,NULL),(10,'ㅁㅁㄴㅇ','$2y$10$rlSLZRfNhYQvCNqQdlgNhuGi8TnXLTiqqj0.4ON5t4/CyAfnVC2g.','ㅁ','ㅁㄴㅇㅁㄴㅇ','2021-02-08',3,NULL,NULL),(13,'a','$2y$10$RpfT7zzJANT5cTpIS2IFweBs3777.CNFIxAkI.5AdSY9T4Fa7/FWS','a','a','2021-02-09',2,NULL,NULL),(14,'asd','$2y$10$GNmTfnofXx/N43lUeP.yfuEcvwqJma5.h9TY5N/9UTK39HfgIUfLu','asd','asd','2021-02-09',13,NULL,NULL),(16,'adad','$2y$10$iBV8GkD5pCElDuQCqFxarOHv2Wqkwowd14heuiUvyqprQuBehP/.K','adad','adad','2021-02-09',3,1,NULL),(17,'aaa','$2y$10$xh.kKV46K1CnV7btU7xOju1ev1tAu3unnHlxWlDeBp/ckI/af.kV2','aaa','aaa','2021-02-09',5,0,NULL),(18,'asdasd','$2y$10$ukdCI6b5DEgpaKH1XnAG4eGVofUbd./CukgnHg0MIxOpJcCAQHPiy','asdasd','asdasd','2021-02-10',12,0,NULL),(19,'SS','$2y$10$TRpsKeXwCvHp3dkB0q2SXu26p92KthWUKxbbUF0WjzaxkKFmB3k9e','SS','SS','2021-02-15',1,0,''),(20,'ss','$2y$10$32iI0rDrMmJjtYJUYifGG.RdSgbp5avrrECckL/4aFoY0PIlo8Qw2','ss','ss','2021-02-15',1,0,''),(21,'dd','$2y$10$uTWNp8exZ4UgHolsb495kuH6nrpAgATmWwMXwHwZdJ44iib6ee3Ri','dd','dd','2021-02-15',1,0,''),(22,'dd','$2y$10$tLqc5xMp7MF8MB1tBPUMdOaliFHl1X4PJ8Oh4Ybc6OGtCdbt13MjC','dd','dd','2021-02-15',2,0,''),(23,'ad','$2y$10$1C6bR.7wD5GtL5AGYLdMyuDq.IQGL154uWmf04TTCjHFfVyxbIWmy','ad','ad','2021-02-15',1,0,''),(24,'ㅁㄴㅇ','$2y$10$rL4w45zLjZHLyP5W6gyZs.l68idzkHCMNEg4/2PqGHVk4IdfIQcmq','ㅁㄴㅇ','ㅁㄴㅇ','2021-02-15',1,0,''),(25,'asd','$2y$10$5C2k3QgQP9B2hGVGRp9Pxu6.DQhKNoH0WWqI16uueRWyInv6DE1/u','asd','asd','2021-02-15',1,0,''),(26,'dd','$2y$10$MYjCir2nN/lGISCY5GCCa.d8MspZSzo5GKM9q.HgdSVbY2V99jkIm','dd','dd','2021-02-15',1,0,''),(27,'123','$2y$10$I9IbweXMq87X4KLaIYCyQ.7eien60x0wzXkIJkJZnjvrjF3MTEXya','123','23','2021-02-15',1,0,''),(28,'121','$2y$10$ezEwLo/h5GGFwvWlZ9J/5.yDFZ5ow5D6/NAvO7ERrDkh1hX9dTrxe','121','121','2021-02-15',1,0,''),(29,'122','$2y$10$1Ox0CR5MtaI6xxlxlkYmruYBWF1lA4KLZDdTjL5UqEyktLw3dQDx2','122','122','2021-02-15',1,0,''),(30,'qe','$2y$10$ZJRoK9TcbboZGyAZlITMruYKzCciRSU9oz7Zfdd.97D5mQigOsOcu','qe','qe','2021-02-15',1,0,''),(31,'rt','$2y$10$CwZWV7Z5DR1qHEu0SSdwxOeTHh2LNREareYm2dM1aH85M9URRasnm','rt','rt','2021-02-15',1,0,''),(32,'1q','$2y$10$V7lzWmUbnXH1xxiFRnSB3OyzcLrnoWQH2EWTHheuRm9KsBXcmk1ZW','1q','1q','2021-02-15',0,0,''),(33,'2w','$2y$10$gdIyIuaJjhFx50fIAnyEyOpg3NCVBUrb3y3ZHf/0Oi4mPet6AddjK','2w','2w','2021-02-15',0,0,''),(35,'qe','$2y$10$WXxyie.cAKiysZRX0p3Vtudn/eHGCe5bl7fPuBPkhKq6DxIrNrCuC','qe','qe','2021-02-15',2,0,'cQ.png'),(37,'3434','$2y$10$IUlK3LiW0hlPel9CMDAcqOODF0S1MJ.d2ILH25WmYVGznNjBI1qjq','3434','3434','2021-02-16',2,0,'');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-18 17:33:20
