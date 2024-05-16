-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2024 at 04:09 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_quanlykho`
--

-- --------------------------------------------------------

--
-- Table structure for table `chitietban`
--

CREATE TABLE `chitietban` (
  `Id` int(11) NOT NULL,
  `IdDonBan` int(11) DEFAULT NULL,
  `IdSP` int(11) DEFAULT NULL,
  `GiaMua` int(11) DEFAULT NULL,
  `GiaBan` int(11) DEFAULT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  `ThanhTien` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `chitietmua`
--

CREATE TABLE `chitietmua` (
  `Id` int(11) NOT NULL,
  `IdDonMua` int(11) DEFAULT NULL,
  `TenSP` varchar(100) DEFAULT NULL,
  `IdDVT` int(11) DEFAULT NULL,
  `GiaMua` int(11) DEFAULT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  `ThanhTien` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `danhsachquyen`
--

CREATE TABLE `danhsachquyen` (
  `Id` int(11) NOT NULL,
  `IdNV` int(11) DEFAULT NULL,
  `IdQuyen` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `danhsachquyen`
--

INSERT INTO `danhsachquyen` (`Id`, `IdNV`, `IdQuyen`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `donban`
--

CREATE TABLE `donban` (
  `Id` int(11) NOT NULL,
  `NgayBan` datetime DEFAULT NULL,
  `IdNV` int(11) DEFAULT NULL,
  `IdKH` int(11) DEFAULT NULL,
  `Tong` int(11) DEFAULT NULL,
  `TrangThai` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `donban`
--

INSERT INTO `donban` (`Id`, `NgayBan`, `IdNV`, `IdKH`, `Tong`, `TrangThai`) VALUES
(2, '2024-05-16 21:02:00', 2, 2, 0, '1');

-- --------------------------------------------------------

--
-- Table structure for table `donmua`
--

CREATE TABLE `donmua` (
  `Id` int(11) NOT NULL,
  `NgayMua` datetime DEFAULT NULL,
  `IdNV` int(11) DEFAULT NULL,
  `IdNCC` int(11) DEFAULT NULL,
  `ThanhTien` int(11) DEFAULT NULL,
  `TrangThai` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `donvitinh`
--

CREATE TABLE `donvitinh` (
  `Id` int(11) NOT NULL,
  `DonVi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `donvitinh`
--

INSERT INTO `donvitinh` (`Id`, `DonVi`) VALUES
(1, 'Chai'),
(2, 'Bao'),
(3, 'Viên');

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

CREATE TABLE `khachhang` (
  `Id` int(11) NOT NULL,
  `TenKH` varchar(100) DEFAULT NULL,
  `DienThoai` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `DiaChi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `khachhang`
--

INSERT INTO `khachhang` (`Id`, `TenKH`, `DienThoai`, `Email`, `DiaChi`) VALUES
(2, 'Nguyễn Minh Tiến', '0365768393', 'nguyemintien@gamil.com', '169 Bạch Đằng');

-- --------------------------------------------------------

--
-- Table structure for table `nhacungcap`
--

CREATE TABLE `nhacungcap` (
  `Id` int(11) NOT NULL,
  `TenNCC` varchar(100) DEFAULT NULL,
  `DienThoai` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `DiaChi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nhacungcap`
--

INSERT INTO `nhacungcap` (`Id`, `TenNCC`, `DienThoai`, `Email`, `DiaChi`) VALUES
(1, 'Đông Á', '1900023', 'donga@gmail.com', '33 XVNT'),
(2, 'Tôn Hoa Sen', '121332323', 'tonhoasen@gmail.com', '121 tphcm');

-- --------------------------------------------------------

--
-- Table structure for table `nhanvien`
--

CREATE TABLE `nhanvien` (
  `Id` int(11) NOT NULL,
  `TenNV` varchar(100) DEFAULT NULL,
  `DienThoai` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `DiaChi` varchar(100) DEFAULT NULL,
  `TaiKhoan` varchar(50) DEFAULT NULL,
  `MatKhau` varchar(50) DEFAULT NULL,
  `IsActive` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nhanvien`
--

INSERT INTO `nhanvien` (`Id`, `TenNV`, `DienThoai`, `Email`, `DiaChi`, `TaiKhoan`, `MatKhau`, `IsActive`) VALUES
(1, 'Nguyen Thanh Binh', '0395342134', 'binhnt.it28', '33 xô viết nghệ tĩnh', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1'),
(2, 'Nguyễn Trần Minh Thuận', '0365768393', 'ntmt260102@gmail.com', '169 Bạch Đằng', 'admin123', '267ccdcccad39d9fdb620f0b748db137', '1');

-- --------------------------------------------------------

--
-- Table structure for table `quyen`
--

CREATE TABLE `quyen` (
  `Id` int(11) NOT NULL,
  `TenQuyen` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quyen`
--

INSERT INTO `quyen` (`Id`, `TenQuyen`) VALUES
(1, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `Id` int(11) NOT NULL,
  `TenSP` varchar(100) DEFAULT NULL,
  `IdDVT` int(11) DEFAULT NULL,
  `IdNCC` int(11) DEFAULT NULL,
  `GiaMua` int(11) DEFAULT NULL,
  `GiaBan` int(11) DEFAULT NULL,
  `SoLuong` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`Id`, `TenSP`, `IdDVT`, `IdNCC`, `GiaMua`, `GiaBan`, `SoLuong`) VALUES
(1, 'Tôn', 1, 1, 15000, 20000, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chitietban`
--
ALTER TABLE `chitietban`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdDonBan` (`IdDonBan`),
  ADD KEY `IdSP` (`IdSP`);

--
-- Indexes for table `chitietmua`
--
ALTER TABLE `chitietmua`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdDonMua` (`IdDonMua`),
  ADD KEY `IdDVT` (`IdDVT`);

--
-- Indexes for table `danhsachquyen`
--
ALTER TABLE `danhsachquyen`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdNV` (`IdNV`),
  ADD KEY `IdQuyen` (`IdQuyen`);

--
-- Indexes for table `donban`
--
ALTER TABLE `donban`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdNV` (`IdNV`),
  ADD KEY `IdKH` (`IdKH`);

--
-- Indexes for table `donmua`
--
ALTER TABLE `donmua`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdNV` (`IdNV`),
  ADD KEY `IdNCC` (`IdNCC`);

--
-- Indexes for table `donvitinh`
--
ALTER TABLE `donvitinh`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `nhacungcap`
--
ALTER TABLE `nhacungcap`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `quyen`
--
ALTER TABLE `quyen`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdDVT` (`IdDVT`),
  ADD KEY `IdNCC` (`IdNCC`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chitietban`
--
ALTER TABLE `chitietban`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chitietmua`
--
ALTER TABLE `chitietmua`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `danhsachquyen`
--
ALTER TABLE `danhsachquyen`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `donban`
--
ALTER TABLE `donban`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `donmua`
--
ALTER TABLE `donmua`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donvitinh`
--
ALTER TABLE `donvitinh`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `nhacungcap`
--
ALTER TABLE `nhacungcap`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `quyen`
--
ALTER TABLE `quyen`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chitietban`
--
ALTER TABLE `chitietban`
  ADD CONSTRAINT `chitietban_ibfk_1` FOREIGN KEY (`IdDonBan`) REFERENCES `donban` (`Id`),
  ADD CONSTRAINT `chitietban_ibfk_2` FOREIGN KEY (`IdSP`) REFERENCES `sanpham` (`Id`);

--
-- Constraints for table `chitietmua`
--
ALTER TABLE `chitietmua`
  ADD CONSTRAINT `chitietmua_ibfk_1` FOREIGN KEY (`IdDonMua`) REFERENCES `donmua` (`Id`),
  ADD CONSTRAINT `chitietmua_ibfk_2` FOREIGN KEY (`IdDVT`) REFERENCES `donvitinh` (`Id`);

--
-- Constraints for table `danhsachquyen`
--
ALTER TABLE `danhsachquyen`
  ADD CONSTRAINT `danhsachquyen_ibfk_1` FOREIGN KEY (`IdNV`) REFERENCES `nhanvien` (`Id`),
  ADD CONSTRAINT `danhsachquyen_ibfk_2` FOREIGN KEY (`IdQuyen`) REFERENCES `quyen` (`Id`);

--
-- Constraints for table `donban`
--
ALTER TABLE `donban`
  ADD CONSTRAINT `donban_ibfk_1` FOREIGN KEY (`IdNV`) REFERENCES `nhanvien` (`Id`),
  ADD CONSTRAINT `donban_ibfk_2` FOREIGN KEY (`IdKH`) REFERENCES `khachhang` (`Id`);

--
-- Constraints for table `donmua`
--
ALTER TABLE `donmua`
  ADD CONSTRAINT `donmua_ibfk_1` FOREIGN KEY (`IdNV`) REFERENCES `nhanvien` (`Id`),
  ADD CONSTRAINT `donmua_ibfk_2` FOREIGN KEY (`IdNCC`) REFERENCES `nhacungcap` (`Id`);

--
-- Constraints for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`IdDVT`) REFERENCES `donvitinh` (`Id`),
  ADD CONSTRAINT `sanpham_ibfk_2` FOREIGN KEY (`IdNCC`) REFERENCES `nhacungcap` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
