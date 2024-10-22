--
-- Table structure for table `penjualan`
--

-- Untuk Case pada soal nomor 2, jika memiliki data sebanyak 50 Juta, maka akan lebih mudah jika menggunakan partition by
-- pada table penjualan, saat ini saya gunakanan zonasi pada tanggal_beli agar mempermudah penarikan data

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
