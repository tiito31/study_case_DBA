-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2024 at 07:54 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_penjualan`
--

DROP DATABASE IF EXISTS `db_penjualan`;

CREATE DATABASE `db_penjualan`;


-- --------------------------------------------------------

USE `db_penjualan`;

--
-- Table structure for table `barang`
--

DROP TABLE IF EXISTS `barang`;

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(50) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `Keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`id_barang`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `barang` (`id_barang`, `nama_barang`, `kategori`, `jumlah_barang`, `Keterangan`) VALUES (1, 'Pensi', 'green', 664751051, 'c');
INSERT INTO `barang` (`id_barang`, `nama_barang`, `kategori`, `jumlah_barang`, `Keterangan`) VALUES (2, 'Baju', 'navy', 4, 'a');
INSERT INTO `barang` (`id_barang`, `nama_barang`, `kategori`, `jumlah_barang`, `Keterangan`) VALUES (3, 'Pulpen', 'yellow', 18577, 'a');
INSERT INTO `barang` (`id_barang`, `nama_barang`, `kategori`, `jumlah_barang`, `Keterangan`) VALUES (4, 'Kertas A4', 'silver', 134852961, 'c');
INSERT INTO `barang` (`id_barang`, `nama_barang`, `kategori`, `jumlah_barang`, `Keterangan`) VALUES (5, 'Meja', 'teal', 0, 'b');
INSERT INTO `barang` (`id_barang`, `nama_barang`, `kategori`, `jumlah_barang`, `Keterangan`) VALUES (6, 'Kursi', 'lime', 48, 'a');
INSERT INTO `barang` (`id_barang`, `nama_barang`, `kategori`, `jumlah_barang`, `Keterangan`) VALUES (7, 'Papan tulis', 'blue', 9, 'b');
INSERT INTO `barang` (`id_barang`, `nama_barang`, `kategori`, `jumlah_barang`, `Keterangan`) VALUES (8, 'Buku', 'green', 876869, 'a');
INSERT INTO `barang` (`id_barang`, `nama_barang`, `kategori`, `jumlah_barang`, `Keterangan`) VALUES (9, 'Gelas', 'aqua', 4, 'b');
INSERT INTO `barang` (`id_barang`, `nama_barang`, `kategori`, `jumlah_barang`, `Keterangan`) VALUES (10, 'Tumbler', 'purple', 1, 'a');


-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--

DROP TABLE IF EXISTS `pembeli`;

CREATE TABLE `pembeli` (
  `id_pembeli` int(11) NOT NULL AUTO_INCREMENT,
  `nomor_identitas` int(25) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `nomor_hp` int(15) NOT NULL,
  PRIMARY KEY (`id_pembeli`),
  UNIQUE KEY `nomor_identitas` (`nomor_identitas`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `pembeli` (`id_pembeli`, `nomor_identitas`, `nama`, `jenis_kelamin`, `alamat`, `nomor_hp`) VALUES (21, 6237812, 'Lennie', 'Dr.', '204 Homenick Forks\nRyantown, NC 48625-7188', 424087);
INSERT INTO `pembeli` (`id_pembeli`, `nomor_identitas`, `nama`, `jenis_kelamin`, `alamat`, `nomor_hp`) VALUES (22, 6236988, 'Jesse', 'Prof.', '4896 Jada Valleys\nBryanaport, HI 25492-0492', 1);
INSERT INTO `pembeli` (`id_pembeli`, `nomor_identitas`, `nama`, `jenis_kelamin`, `alamat`, `nomor_hp`) VALUES (23, 6123548, 'Newell', 'Mrs.', '45272 Elizabeth Points\nNorth Tyriquechester, MS 88251', 1);
INSERT INTO `pembeli` (`id_pembeli`, `nomor_identitas`, `nama`, `jenis_kelamin`, `alamat`, `nomor_hp`) VALUES (25, 9665821, 'Weldon', 'Mrs.', '9651 Wisozk Court Suite 482\nNorth Okey, WI 58669', 475741);
INSERT INTO `pembeli` (`id_pembeli`, `nomor_identitas`, `nama`, `jenis_kelamin`, `alamat`, `nomor_hp`) VALUES (28, 1885141, 'Doris', 'Dr.', '3961 Becker Run\nPort Camillachester, OK 43316', 39);
INSERT INTO `pembeli` (`id_pembeli`, `nomor_identitas`, `nama`, `jenis_kelamin`, `alamat`, `nomor_hp`) VALUES (34, 4558139, 'Jerod', 'Miss', '22535 Elizabeth Union\nNienowport, SD 92089', 24);
INSERT INTO `pembeli` (`id_pembeli`, `nomor_identitas`, `nama`, `jenis_kelamin`, `alamat`, `nomor_hp`) VALUES (36, 7562217, 'Denis', 'Dr.', '107 Zoe Mills Suite 354\nRebekahtown, MA 02595-4427', 40);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--
DROP TABLE IF EXISTS `penjualan`;

CREATE TABLE `penjualan` (
  `id_penjualan` int(11) NOT NULL AUTO_INCREMENT,
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `id_pembeli` int(11) NOT NULL,
  `nama_pembeli` varchar(50) NOT NULL,
  `jumlah_beli` int(11) NOT NULL,
  `tanggal_beli` date NOT NULL,
  `id_toko` int(11) NOT NULL,
  `lokasi_toko` varchar(30) NOT NULL,
  UNIQUE KEY (`id_penjualan`, `tanggal_beli`)
) ENGINE=InnoDB PARTITION BY RANGE(MONTH(tanggal_beli)) (
   PARTITION p0 VALUES LESS THAN (2),
   PARTITION p1 VALUES LESS THAN (3),
   PARTITION p2 VALUES LESS THAN (4),
   PARTITION p3 VALUES LESS THAN (5),
   PARTITION p4 VALUES LESS THAN (6),
   PARTITION p5 VALUES LESS THAN (7),
   PARTITION p6 VALUES LESS THAN (8),
   PARTITION p7 VALUES LESS THAN (9),
   PARTITION p8 VALUES LESS THAN (10),
   PARTITION p9 VALUES LESS THAN (11),
   PARTITION p10 VALUES LESS THAN (12),
   PARTITION p11 VALUES LESS THAN (13)
);

-- --------------------------------------------------------

--
-- Table structure for table `toko`
--

DROP TABLE IF EXISTS `toko`;

CREATE TABLE `toko` (
  `id_toko` int(11) NOT NULL AUTO_INCREMENT,
  `nama_toko` varchar(25) NOT NULL,
  `alamat_toko` text NOT NULL,
  PRIMARY KEY (`id_toko`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `toko` (`id_toko`, `nama_toko`, `alamat_toko`) VALUES (1, 'Synergistic executive app', '8060 Stokes Center\nVirginieport, WA 11068-8170');
INSERT INTO `toko` (`id_toko`, `nama_toko`, `alamat_toko`) VALUES (2, 'Managed exuding knowledge', '399 Spinka Centers\nWest Jerome, KS 99189');
INSERT INTO `toko` (`id_toko`, `nama_toko`, `alamat_toko`) VALUES (3, 'Team-oriented empowering ', '568 Justice Vista\nSadieton, NE 53904-4054');
INSERT INTO `toko` (`id_toko`, `nama_toko`, `alamat_toko`) VALUES (4, 'Progressive systemic func', '920 Daugherty Garden\nSouth Shaniaside, RI 46725');
INSERT INTO `toko` (`id_toko`, `nama_toko`, `alamat_toko`) VALUES (5, 'Inverse human-resource ha', '354 Rosendo Crossing Suite 249\nLoniemouth, IA 12295');

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
