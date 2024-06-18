-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2024 at 02:07 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbhotel_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `cleaning_service`
--

CREATE TABLE `cleaning_service` (
  `kamar_id` int(11) NOT NULL,
  `karyawan_id` int(11) NOT NULL,
  `status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cleaning_service`
--

INSERT INTO `cleaning_service` (`kamar_id`, `karyawan_id`, `status`) VALUES
(1, 1, 'Bersih'),
(2, 2, 'Bersih'),
(3, 3, 'Bersih'),
(4, 4, 'Bersih'),
(5, 5, 'Bersih'),
(6, 6, 'Bersih'),
(7, 7, 'Bersih'),
(8, 8, 'Bersih'),
(9, 9, 'Bersih'),
(10, 10, 'Bersih');

-- --------------------------------------------------------

--
-- Table structure for table `gudang`
--

CREATE TABLE `gudang` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tersedia` int(1) NOT NULL,
  `karyawan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gudang`
--

INSERT INTO `gudang` (`id`, `nama`, `jumlah`, `tersedia`, `karyawan_id`) VALUES
(1, 'Handuk', 500, 1, 1),
(2, 'Seprai', 300, 1, 2),
(3, 'Bantal', 400, 1, 3),
(4, 'Sabun', 600, 1, 4),
(5, 'Shampo', 400, 1, 5),
(6, 'Tisu', 800, 1, 6),
(7, 'Pembersih lantai', 200, 1, 7),
(8, 'Deterjen', 300, 1, 8),
(9, 'Pengharum ruangan', 150, 1, 9),
(10, 'Pembersih kaca', 250, 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `id` int(11) NOT NULL,
  `kode` varchar(10) NOT NULL,
  `kelas` varchar(45) NOT NULL,
  `tersedia` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kamar`
--

INSERT INTO `kamar` (`id`, `kode`, `kelas`, `tersedia`) VALUES
(1, 'A101', 'Standard Room', 1),
(2, 'A102', 'Superior Room', 1),
(3, 'A103', 'Deluxe Room', 1),
(4, 'A104', 'Suite Room', 1),
(5, 'A105', 'Family Room', 1),
(6, 'A106', 'Executive Room', 1),
(7, 'A107', 'Presidential Suite', 1),
(8, 'A108', 'Honeymoon Suite', 1),
(9, 'A109', 'Accessible Room', 1),
(10, 'A110', 'Business Suite', 1);

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `no_hp` varchar(14) NOT NULL,
  `alamat` text NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id`, `nama`, `no_hp`, `alamat`, `role_id`) VALUES
(1, 'Ahmad Rizki', '+628123456789', 'Jl. Raya Bogor Km. 20, Depok', 10),
(2, 'Siti Nurhaliza', '+628987654321', 'Jl. Raya Bekasi Timur No. 67, Bekasi', 1),
(3, 'Budi Santoso', '+628555123456', 'Jl. Kemang Raya No. 45, Jakarta Selatan', 2),
(4, 'Rina Kusuma', '+628789012345', 'Jl. Raya Serpong No. 89, Tangerang Selatan', 4),
(5, 'Joko Prasetyo', '+628567891234', 'Jl. Kyai Tapa No. 123, Jakarta Barat', 3),
(6, 'Dewi Lestari', '+628901234567', 'Jl. Raya Bogor Km. 15, Depok', 6),
(7, 'Rudi Hartono', '+628765432109', 'Jl. Raya Serpong No. 321, Tangerang', 5),
(8, 'Sari Kusmawati', '+628109876543', 'Jl. Raya Bekasi Barat No. 45, Bekasi', 8),
(9, 'Bambang Susilo', '+628543216789', 'Jl. Kemang Raya No. 67, Jakarta Selatan', 7),
(10, 'Indah Permatasari', '+628987610234', 'Jl. Kyai Tapa No. 89, Jakarta Barat', 9);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `gender` enum('Laki-laki','Perempuan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `nama`, `gender`) VALUES
(1, 'Resepsionis', 'Perempuan'),
(2, 'Housekeeping', 'Laki-laki'),
(3, 'Teknisi', 'Laki-laki'),
(4, 'Pelayan Restoran', 'Perempuan'),
(5, 'Koki', 'Laki-laki'),
(6, 'Konsierge', 'Perempuan'),
(7, 'Petugas Keamanan', 'Laki-laki'),
(8, 'Terapis Spa', 'Perempuan'),
(9, 'Koordinator Acara', 'Perempuan'),
(10, 'Teknisi IT', 'Laki-laki');

-- --------------------------------------------------------

--
-- Table structure for table `tamu`
--

CREATE TABLE `tamu` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `nik` varchar(17) NOT NULL,
  `no_hp` varchar(14) NOT NULL,
  `alamat` text NOT NULL,
  `tgl_check_in` datetime NOT NULL,
  `tgl_check_out` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tamu`
--

INSERT INTO `tamu` (`id`, `nama`, `nik`, `no_hp`, `alamat`, `tgl_check_in`, `tgl_check_out`) VALUES
(1, 'Budi Santoso', '3175062406850001', '+628123456789', 'Jl. Sudirman No. 10, Jakarta Pusat', '2023-06-01 14:00:00', '2023-06-05 11:00:00'),
(2, 'Siti Fatimah', '3671074508700002', '+628987654321', 'Jl. Raya Bogor Km. 25, Depok', '2023-06-02 16:30:00', '2023-06-06 10:00:00'),
(3, 'Andi Wijaya', '3201061106880003', '+628555123456', 'Jl. Raya Serpong No. 123, Tangerang Selatan', '2023-06-03 12:00:00', '2023-06-07 09:30:00'),
(4, 'Rina Kusuma', '3671012212850004', '+628789012345', 'Jl. Raya Bekasi Timur No. 45, Bekasi', '2023-06-04 15:00:00', '2023-06-08 11:00:00'),
(5, 'Joko Prasetyo', '3175041509790005', '+628567891234', 'Jl. Kemang Raya No. 67, Jakarta Selatan', '2023-06-05 10:30:00', '2023-06-09 14:00:00'),
(6, 'Dewi Lestari', '3201065507860006', '+628901234567', 'Jl. Raya Serpong No. 321, Tangerang', '2023-06-06 13:00:00', '2023-06-10 12:00:00'),
(7, 'Rudi Hartono', '3671071208750007', '+628765432109', 'Jl. Raya Bogor Km. 15, Depok', '2023-06-07 16:00:00', '2023-06-11 10:30:00'),
(8, 'Sari Kusmawati', '3175062709880008', '+628109876543', 'Jl. Kyai Tapa No. 89, Jakarta Barat', '2023-06-08 11:00:00', '2023-06-12 09:00:00'),
(9, 'Bambang Susilo', '3201011112700009', '+628543216789', 'Jl. Raya Serpong No. 567, Tangerang Selatan', '2023-06-09 14:30:00', '2023-06-13 12:00:00'),
(10, 'Indah Permatasari', '3671073009900010', '+628987610234', 'Jl. Raya Bekasi Barat No. 12, Bekasi', '2023-06-10 09:00:00', '2023-06-14 11:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tamu_has_kamar`
--

CREATE TABLE `tamu_has_kamar` (
  `tamu_id` int(11) NOT NULL,
  `kamar_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tamu_has_kamar`
--

INSERT INTO `tamu_has_kamar` (`tamu_id`, `kamar_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cleaning_service`
--
ALTER TABLE `cleaning_service`
  ADD PRIMARY KEY (`kamar_id`,`karyawan_id`),
  ADD KEY `karyawan_id` (`karyawan_id`);

--
-- Indexes for table `gudang`
--
ALTER TABLE `gudang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `karyawan_id` (`karyawan_id`);

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_hp` (`no_hp`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tamu`
--
ALTER TABLE `tamu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nik` (`nik`),
  ADD UNIQUE KEY `no_hp` (`no_hp`);

--
-- Indexes for table `tamu_has_kamar`
--
ALTER TABLE `tamu_has_kamar`
  ADD PRIMARY KEY (`tamu_id`,`kamar_id`),
  ADD KEY `kamar_id` (`kamar_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gudang`
--
ALTER TABLE `gudang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kamar`
--
ALTER TABLE `kamar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tamu`
--
ALTER TABLE `tamu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cleaning_service`
--
ALTER TABLE `cleaning_service`
  ADD CONSTRAINT `cleaning_service_ibfk_1` FOREIGN KEY (`kamar_id`) REFERENCES `kamar` (`id`),
  ADD CONSTRAINT `cleaning_service_ibfk_2` FOREIGN KEY (`karyawan_id`) REFERENCES `karyawan` (`id`);

--
-- Constraints for table `gudang`
--
ALTER TABLE `gudang`
  ADD CONSTRAINT `gudang_ibfk_1` FOREIGN KEY (`karyawan_id`) REFERENCES `karyawan` (`id`);

--
-- Constraints for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `karyawan_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tamu_has_kamar`
--
ALTER TABLE `tamu_has_kamar`
  ADD CONSTRAINT `tamu_has_kamar_ibfk_1` FOREIGN KEY (`tamu_id`) REFERENCES `tamu` (`id`),
  ADD CONSTRAINT `tamu_has_kamar_ibfk_2` FOREIGN KEY (`kamar_id`) REFERENCES `kamar` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
