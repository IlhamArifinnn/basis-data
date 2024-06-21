-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: dbhotel_project
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cleaning_service`
--

DROP TABLE IF EXISTS `cleaning_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cleaning_service` (
  `kamar_id` int(11) NOT NULL,
  `karyawan_id` int(11) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`kamar_id`,`karyawan_id`),
  KEY `karyawan_id` (`karyawan_id`),
  CONSTRAINT `cleaning_service_ibfk_1` FOREIGN KEY (`kamar_id`) REFERENCES `kamar` (`id`),
  CONSTRAINT `cleaning_service_ibfk_2` FOREIGN KEY (`karyawan_id`) REFERENCES `karyawan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cleaning_service`
--

LOCK TABLES `cleaning_service` WRITE;
/*!40000 ALTER TABLE `cleaning_service` DISABLE KEYS */;
INSERT INTO `cleaning_service` VALUES (1,1,'Bersih'),(2,2,'Bersih'),(3,3,'Bersih'),(4,4,'Bersih'),(5,5,'Bersih'),(6,6,'Bersih'),(7,7,'Bersih'),(8,8,'Bersih'),(9,9,'Bersih'),(10,10,'Bersih');
/*!40000 ALTER TABLE `cleaning_service` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER kurangiJumlah
AFTER INSERT ON cleaning_service
FOR EACH ROW
BEGIN
UPDATE gudang SET jumlah = jumlah - 1
WHERE id IS NOT NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `gudang`
--

DROP TABLE IF EXISTS `gudang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gudang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(45) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tersedia` int(1) NOT NULL,
  `karyawan_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `karyawan_id` (`karyawan_id`),
  CONSTRAINT `gudang_ibfk_1` FOREIGN KEY (`karyawan_id`) REFERENCES `karyawan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gudang`
--

LOCK TABLES `gudang` WRITE;
/*!40000 ALTER TABLE `gudang` DISABLE KEYS */;
INSERT INTO `gudang` VALUES (1,'Handuk',500,1,1),(2,'Seprai',300,1,2),(3,'Bantal',400,1,3),(4,'Sabun',600,1,4),(5,'Shampo',400,1,5),(6,'Tisu',800,1,6),(7,'Pembersih lantai',200,1,7),(8,'Deterjen',300,1,8),(9,'Pengharum ruangan',150,1,9),(10,'Pembersih kaca',250,1,10);
/*!40000 ALTER TABLE `gudang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kamar`
--

DROP TABLE IF EXISTS `kamar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kamar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `kelas` varchar(45) NOT NULL,
  `tersedia` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kamar`
--

LOCK TABLES `kamar` WRITE;
/*!40000 ALTER TABLE `kamar` DISABLE KEYS */;
INSERT INTO `kamar` VALUES (1,'A101','Standard Room',1),(2,'A102','Superior Room',1),(3,'A103','Deluxe Room',1),(4,'A104','Suite Room',1),(5,'A105','Family Room',1),(6,'A106','Executive Room',1),(7,'A107','Presidential Suite',1),(8,'A108','Honeymoon Suite',1),(9,'A109','Accessible Room',1),(10,'A110','Business Suite',1);
/*!40000 ALTER TABLE `kamar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `karyawan`
--

DROP TABLE IF EXISTS `karyawan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `karyawan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(45) NOT NULL,
  `no_hp` varchar(14) NOT NULL,
  `alamat` text NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `no_hp` (`no_hp`),
  KEY `role_id` (`role_id`),
  KEY `karyawan_idx` (`nama`),
  CONSTRAINT `karyawan_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `karyawan`
--

LOCK TABLES `karyawan` WRITE;
/*!40000 ALTER TABLE `karyawan` DISABLE KEYS */;
INSERT INTO `karyawan` VALUES (1,'Ahmad Rizki','+628123456789','Jl. Raya Bogor Km. 20, Depok',10),(2,'Siti Nurhaliza','+628987654321','Jl. Raya Bekasi Timur No. 67, Bekasi',1),(3,'Budi Santoso','+628555123456','Jl. Kemang Raya No. 45, Jakarta Selatan',2),(4,'Rina Kusuma','+628789012345','Jl. Raya Serpong No. 89, Tangerang Selatan',4),(5,'Joko Prasetyo','+628567891234','Jl. Kyai Tapa No. 123, Jakarta Barat',3),(6,'Dewi Lestari','+628901234567','Jl. Raya Bogor Km. 15, Depok',6),(7,'Rudi Hartono','+628765432109','Jl. Raya Serpong No. 321, Tangerang',5),(8,'Sari Kusmawati','+628109876543','Jl. Raya Bekasi Barat No. 45, Bekasi',8),(9,'Bambang Susilo','+628543216789','Jl. Kemang Raya No. 67, Jakarta Selatan',7),(10,'Indah Permatasari','+628987610234','Jl. Kyai Tapa No. 89, Jakarta Barat',9),(11,'joger','+6285187654321','depok',1),(12,'Herman','+6282184656378','depok',7);
/*!40000 ALTER TABLE `karyawan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `karyawan_v`
--

DROP TABLE IF EXISTS `karyawan_v`;
/*!50001 DROP VIEW IF EXISTS `karyawan_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `karyawan_v` AS SELECT
 1 AS `nama`,
  1 AS `no_hp`,
  1 AS `alamat`,
  1 AS `pekerjaan` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(45) NOT NULL,
  `gender` enum('Laki-laki','Perempuan') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Resepsionis','Perempuan'),(2,'Housekeeping','Laki-laki'),(3,'Teknisi','Laki-laki'),(4,'Pelayan Restoran','Perempuan'),(5,'Koki','Laki-laki'),(6,'Konsierge','Perempuan'),(7,'Petugas Keamanan','Laki-laki'),(8,'Terapis Spa','Perempuan'),(9,'Koordinator Acara','Perempuan'),(10,'Teknisi IT','Laki-laki');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tamu`
--

DROP TABLE IF EXISTS `tamu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tamu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(45) NOT NULL,
  `nik` varchar(17) NOT NULL,
  `no_hp` varchar(14) NOT NULL,
  `alamat` text NOT NULL,
  `tgl_check_in` datetime NOT NULL,
  `tgl_check_out` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nik` (`nik`),
  UNIQUE KEY `no_hp` (`no_hp`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tamu`
--

LOCK TABLES `tamu` WRITE;
/*!40000 ALTER TABLE `tamu` DISABLE KEYS */;
INSERT INTO `tamu` VALUES (1,'Budi Santoso','3175062406850001','+628123456789','Jl. Sudirman No. 10, Jakarta Pusat','2023-06-01 14:00:00','2023-06-05 11:00:00'),(2,'Siti Fatimah','3671074508700002','+628987654321','Jl. Raya Bogor Km. 25, Depok','2023-06-02 16:30:00','2023-06-06 10:00:00'),(3,'Andi Wijaya','3201061106880003','+628555123456','Jl. Raya Serpong No. 123, Tangerang Selatan','2023-06-03 12:00:00','2023-06-07 09:30:00'),(4,'Rina Kusuma','3671012212850004','+628789012345','Jl. Raya Bekasi Timur No. 45, Bekasi','2023-06-04 15:00:00','2023-06-08 11:00:00'),(5,'Joko Prasetyo','3175041509790005','+628567891234','Jl. Kemang Raya No. 67, Jakarta Selatan','2023-06-05 10:30:00','2023-06-09 14:00:00'),(6,'Dewi Lestari','3201065507860006','+628901234567','Jl. Raya Serpong No. 321, Tangerang','2023-06-06 13:00:00','2023-06-10 12:00:00'),(7,'Rudi Hartono','3671071208750007','+628765432109','Jl. Raya Bogor Km. 15, Depok','2023-06-07 16:00:00','2023-06-11 10:30:00'),(8,'Sari Kusmawati','3175062709880008','+628109876543','Jl. Kyai Tapa No. 89, Jakarta Barat','2023-06-08 11:00:00','2023-06-12 09:00:00'),(9,'Bambang Susilo','3201011112700009','+628543216789','Jl. Raya Serpong No. 567, Tangerang Selatan','2023-06-09 14:30:00','2023-06-13 12:00:00'),(10,'Indah Permatasari','3671073009900010','+628987610234','Jl. Raya Bekasi Barat No. 12, Bekasi','2023-06-10 09:00:00','2023-06-14 11:00:00');
/*!40000 ALTER TABLE `tamu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tamu_has_kamar`
--

DROP TABLE IF EXISTS `tamu_has_kamar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tamu_has_kamar` (
  `tamu_id` int(11) NOT NULL,
  `kamar_id` int(11) NOT NULL,
  PRIMARY KEY (`tamu_id`,`kamar_id`),
  KEY `kamar_id` (`kamar_id`),
  CONSTRAINT `tamu_has_kamar_ibfk_1` FOREIGN KEY (`tamu_id`) REFERENCES `tamu` (`id`),
  CONSTRAINT `tamu_has_kamar_ibfk_2` FOREIGN KEY (`kamar_id`) REFERENCES `kamar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tamu_has_kamar`
--

LOCK TABLES `tamu_has_kamar` WRITE;
/*!40000 ALTER TABLE `tamu_has_kamar` DISABLE KEYS */;
INSERT INTO `tamu_has_kamar` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `tamu_has_kamar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `karyawan_v`
--

/*!50001 DROP VIEW IF EXISTS `karyawan_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `karyawan_v` AS select `karyawan`.`nama` AS `nama`,`karyawan`.`no_hp` AS `no_hp`,`karyawan`.`alamat` AS `alamat`,`role`.`nama` AS `pekerjaan` from (`karyawan` join `role` on(`role`.`id` = `karyawan`.`role_id`)) */;
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

-- Dump completed on 2024-06-21 14:00:13
