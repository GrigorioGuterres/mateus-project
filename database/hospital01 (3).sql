-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2024 at 07:12 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital01`
--

-- --------------------------------------------------------

--
-- Table structure for table `detallu_aimoruk`
--

CREATE TABLE `detallu_aimoruk` (
  `id_detallu` int(11) NOT NULL,
  `id_aimoruk` int(11) DEFAULT NULL,
  `tipu_aimoruk` int(11) DEFAULT NULL,
  `stok_aimoruk` int(11) DEFAULT NULL,
  `obs` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detallu_aimoruk`
--

INSERT INTO `detallu_aimoruk` (`id_detallu`, `id_aimoruk`, `tipu_aimoruk`, `stok_aimoruk`, `obs`) VALUES
(3, 3, 2, 6, 'DIK'),
(5, 2, 3, 30, 'ladiak'),
(10, 1, 1, 56, 'diak'),
(11, 2, 1, 50, 'diak');

-- --------------------------------------------------------

--
-- Table structure for table `t_aimoruk`
--

CREATE TABLE `t_aimoruk` (
  `id_aimoruk` int(11) NOT NULL,
  `naran_aimoruk` varchar(255) DEFAULT NULL,
  `obs` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_aimoruk`
--

INSERT INTO `t_aimoruk` (`id_aimoruk`, `naran_aimoruk`, `obs`) VALUES
(1, 'KAPSUL', 'DIAK'),
(2, 'AMPICILIN', 'DIAK'),
(3, 'IBU-PROFEN', 'DIAK');

-- --------------------------------------------------------

--
-- Table structure for table `t_klinika`
--

CREATE TABLE `t_klinika` (
  `id_klinika` int(11) NOT NULL,
  `naran_klinika` varchar(255) DEFAULT NULL,
  `obs` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_klinika`
--

INSERT INTO `t_klinika` (`id_klinika`, `naran_klinika`, `obs`) VALUES
(2, 'Klinika Lavateri', 'diak');

-- --------------------------------------------------------

--
-- Table structure for table `t_prosesu_aimoruk`
--

CREATE TABLE `t_prosesu_aimoruk` (
  `id_prosesu_aimoruk` int(11) NOT NULL,
  `id_staf` int(11) DEFAULT NULL,
  `id_detallu` int(11) DEFAULT NULL,
  `kuantidade` int(11) DEFAULT NULL,
  `id_klinika` int(11) DEFAULT NULL,
  `data_prosesu` date DEFAULT NULL,
  `obs` text DEFAULT NULL,
  `sisa_stok` int(11) DEFAULT NULL,
  `stok_atual` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_prosesu_aimoruk`
--

INSERT INTO `t_prosesu_aimoruk` (`id_prosesu_aimoruk`, `id_staf`, `id_detallu`, `kuantidade`, `id_klinika`, `data_prosesu`, `obs`, `sisa_stok`, `stok_atual`) VALUES
(64, 2, 3, 10, 2, '2024-02-15', 'diak', 10, 20);

-- --------------------------------------------------------

--
-- Table structure for table `t_staf`
--

CREATE TABLE `t_staf` (
  `id_staf` int(11) NOT NULL,
  `naran_staf` varchar(255) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `hela_fatin` varchar(255) DEFAULT NULL,
  `nmr_tlfne` varchar(20) DEFAULT NULL,
  `obs` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_staf`
--

INSERT INTO `t_staf` (`id_staf`, `naran_staf`, `sexo`, `hela_fatin`, `nmr_tlfne`, `obs`) VALUES
(2, 'Grigorio guterres', 'm', 'baguia', '7657557', 'diak');

-- --------------------------------------------------------

--
-- Table structure for table `t_tipu_aimoruk`
--

CREATE TABLE `t_tipu_aimoruk` (
  `id_tipu_aimoruk` int(11) NOT NULL,
  `naran_tipu_aimoruk` varchar(255) DEFAULT NULL,
  `obs` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_tipu_aimoruk`
--

INSERT INTO `t_tipu_aimoruk` (`id_tipu_aimoruk`, `naran_tipu_aimoruk`, `obs`) VALUES
(1, 'UUT', 'DIAK\r\n'),
(2, 'BEEM', 'DIAK'),
(3, 'MUSAN', 'DIAK'),
(4, 'hbjbh', 'bjhbhbj'),
(5, 'ben', 'diak');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detallu_aimoruk`
--
ALTER TABLE `detallu_aimoruk`
  ADD PRIMARY KEY (`id_detallu`),
  ADD KEY `id_aimoruk` (`id_aimoruk`),
  ADD KEY `tipu_aimoruk` (`tipu_aimoruk`);

--
-- Indexes for table `t_aimoruk`
--
ALTER TABLE `t_aimoruk`
  ADD PRIMARY KEY (`id_aimoruk`);

--
-- Indexes for table `t_klinika`
--
ALTER TABLE `t_klinika`
  ADD PRIMARY KEY (`id_klinika`);

--
-- Indexes for table `t_prosesu_aimoruk`
--
ALTER TABLE `t_prosesu_aimoruk`
  ADD PRIMARY KEY (`id_prosesu_aimoruk`),
  ADD KEY `id_staf` (`id_staf`),
  ADD KEY `id_detallu` (`id_detallu`),
  ADD KEY `id_klinika` (`id_klinika`);

--
-- Indexes for table `t_staf`
--
ALTER TABLE `t_staf`
  ADD PRIMARY KEY (`id_staf`);

--
-- Indexes for table `t_tipu_aimoruk`
--
ALTER TABLE `t_tipu_aimoruk`
  ADD PRIMARY KEY (`id_tipu_aimoruk`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detallu_aimoruk`
--
ALTER TABLE `detallu_aimoruk`
  MODIFY `id_detallu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `t_aimoruk`
--
ALTER TABLE `t_aimoruk`
  MODIFY `id_aimoruk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `t_klinika`
--
ALTER TABLE `t_klinika`
  MODIFY `id_klinika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `t_prosesu_aimoruk`
--
ALTER TABLE `t_prosesu_aimoruk`
  MODIFY `id_prosesu_aimoruk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `t_staf`
--
ALTER TABLE `t_staf`
  MODIFY `id_staf` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_tipu_aimoruk`
--
ALTER TABLE `t_tipu_aimoruk`
  MODIFY `id_tipu_aimoruk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detallu_aimoruk`
--
ALTER TABLE `detallu_aimoruk`
  ADD CONSTRAINT `detallu_aimoruk_ibfk_1` FOREIGN KEY (`id_aimoruk`) REFERENCES `t_aimoruk` (`id_aimoruk`),
  ADD CONSTRAINT `detallu_aimoruk_ibfk_2` FOREIGN KEY (`tipu_aimoruk`) REFERENCES `t_tipu_aimoruk` (`id_tipu_aimoruk`);

--
-- Constraints for table `t_prosesu_aimoruk`
--
ALTER TABLE `t_prosesu_aimoruk`
  ADD CONSTRAINT `t_prosesu_aimoruk_ibfk_1` FOREIGN KEY (`id_staf`) REFERENCES `t_staf` (`id_staf`),
  ADD CONSTRAINT `t_prosesu_aimoruk_ibfk_2` FOREIGN KEY (`id_detallu`) REFERENCES `detallu_aimoruk` (`id_detallu`),
  ADD CONSTRAINT `t_prosesu_aimoruk_ibfk_3` FOREIGN KEY (`id_klinika`) REFERENCES `t_klinika` (`id_klinika`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
