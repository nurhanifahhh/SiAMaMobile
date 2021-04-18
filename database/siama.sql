-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2021 at 06:14 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siama`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `id_absen` varchar(50) NOT NULL,
  `nim` varchar(50) NOT NULL,
  `nama_mahasiswa` varchar(50) NOT NULL,
  `kelas` varchar(50) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `tanggal_scan` date NOT NULL,
  `id_matakuliah` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `jadwal kuliah`
--

CREATE TABLE `jadwal kuliah` (
  `id_matakuliah` varchar(50) NOT NULL,
  `nama_matakuliah` varchar(50) NOT NULL,
  `id_jadwalkuliah` varchar(50) NOT NULL,
  `hari` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` varchar(50) NOT NULL,
  `dosen_pengajar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_matakuliah` varchar(50) NOT NULL,
  `nama_matakuliah` varchar(50) NOT NULL,
  `jumlah_sks` varchar(50) NOT NULL,
  `ips` varchar(50) NOT NULL,
  `nilai` varchar(50) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `tahun_ajaran` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `presensi`
--

CREATE TABLE `presensi` (
  `nama_matakuliah` varchar(50) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `tahun_ajaran` varchar(50) NOT NULL,
  `jumlah absen` varchar(50) NOT NULL,
  `id_matakuliah` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user account`
--

CREATE TABLE `user account` (
  `id mahasiswa` int(11) NOT NULL,
  `nim` varchar(50) NOT NULL,
  `nama_mahasiswa` varchar(50) NOT NULL,
  `kelas` varchar(50) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `nomor_telp` varchar(50) NOT NULL,
  `tahun_angkatan` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user account`
--
ALTER TABLE `user account`
  ADD PRIMARY KEY (`id mahasiswa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user account`
--
ALTER TABLE `user account`
  MODIFY `id mahasiswa` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
