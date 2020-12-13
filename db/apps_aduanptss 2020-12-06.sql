-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2020 at 01:46 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apps_aduanptss`
--

-- --------------------------------------------------------

--
-- Table structure for table `aduan`
--

CREATE TABLE `aduan` (
  `idaduan` int(11) NOT NULL,
  `pengadu` int(11) NOT NULL,
  `ringkasan` text NOT NULL,
  `jabatan` int(11) NOT NULL,
  `lampiran` varchar(250) NOT NULL,
  `tarikhaduan` date NOT NULL,
  `status` varchar(15) NOT NULL,
  `noruj` varchar(100) DEFAULT NULL,
  `pegawai` int(11) DEFAULT NULL,
  `jenis` varchar(30) DEFAULT NULL,
  `tarikhterima` date DEFAULT NULL,
  `punca` text,
  `pembetulan` text,
  `pegawaipelaksana` int(11) DEFAULT NULL,
  `tarikhpelaksana` date DEFAULT NULL,
  `disahkanoleh` int(11) DEFAULT NULL,
  `tarikhdisahkan` date DEFAULT NULL,
  `pemantauan` text,
  `statustindakan` text,
  `tarikhjawapankjku` date DEFAULT NULL,
  `tajuksuratjawapan` varchar(250) DEFAULT NULL,
  `jawapanrasmi` text,
  `tarikhjawapanrasmi` date DEFAULT NULL,
  `namappa` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `jabatan`
-- (See below for the actual view)
--
CREATE TABLE `jabatan` (
`idjabatan` int(11)
,`namajabatan` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `jawatan`
-- (See below for the actual view)
--
CREATE TABLE `jawatan` (
`idjawatan` int(11)
,`namajawatan` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pegawai`
-- (See below for the actual view)
--
CREATE TABLE `pegawai` (
`idpegawai` int(11)
,`jabatan` int(11)
,`jawatan` int(11)
,`namapegawai` varchar(100)
,`nokppegawai` varchar(12)
,`kata` varchar(250)
,`emelpegawai` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `pengadu`
--

CREATE TABLE `pengadu` (
  `idpengadu` int(11) NOT NULL,
  `namapengadu` varchar(100) NOT NULL,
  `nokppengadu` varchar(12) NOT NULL,
  `alamatpengadu` varchar(250) NOT NULL,
  `telefonpengadu` varchar(15) NOT NULL,
  `emailpengadu` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure for view `jabatan`
--
DROP TABLE IF EXISTS `jabatan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `jabatan`  AS  select `apps_kolam`.`kods_jabatan`.`idjabatan` AS `idjabatan`,`apps_kolam`.`kods_jabatan`.`namajabatan` AS `namajabatan` from `apps_kolam`.`kods_jabatan` ;

-- --------------------------------------------------------

--
-- Structure for view `jawatan`
--
DROP TABLE IF EXISTS `jawatan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `jawatan`  AS  select `apps_kolam`.`kods_jawatan`.`idjawatan` AS `idjawatan`,`apps_kolam`.`kods_jawatan`.`namajawatan` AS `namajawatan` from `apps_kolam`.`kods_jawatan` ;

-- --------------------------------------------------------

--
-- Structure for view `pegawai`
--
DROP TABLE IF EXISTS `pegawai`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pegawai`  AS  select `apps_kolam`.`staf`.`idstaf` AS `idpegawai`,`apps_kolam`.`staf`.`jabatan` AS `jabatan`,`apps_kolam`.`staf`.`jawatan` AS `jawatan`,`apps_kolam`.`staf`.`namastaf` AS `namapegawai`,`apps_kolam`.`staf`.`nokpstaf` AS `nokppegawai`,`apps_kolam`.`staf`.`kata` AS `kata`,`apps_kolam`.`staf`.`emailstaf` AS `emelpegawai` from `apps_kolam`.`staf` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aduan`
--
ALTER TABLE `aduan`
  ADD PRIMARY KEY (`idaduan`);

--
-- Indexes for table `pengadu`
--
ALTER TABLE `pengadu`
  ADD PRIMARY KEY (`idpengadu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aduan`
--
ALTER TABLE `aduan`
  MODIFY `idaduan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pengadu`
--
ALTER TABLE `pengadu`
  MODIFY `idpengadu` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
