-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 01, 2024 lúc 04:05 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dss`
--
CREATE DATABASE IF NOT EXISTS `dss` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dss`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `diseases`
--

CREATE TABLE `diseases` (
  `Benh_ID` int(11) NOT NULL,
  `Ten_benh` text NOT NULL,
  `Nguyen_nhan` text DEFAULT NULL,
  `Thuoc` text DEFAULT NULL,
  `Luu_y` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `diseases`
--

INSERT INTO `diseases` (`Benh_ID`, `Ten_benh`, `Nguyen_nhan`, `Thuoc`, `Luu_y`) VALUES
(1, 'Tiểu đường', 'Ít vận động, Chế độ ăn không lành mạnh, Stress, Thiếu ngủ', 'Insulin', NULL),
(2, 'Đau lưng', 'Ngồi lâu một chỗ, tư thế ngồi không đúng; Sử dụng máy tính trong thời gian dài mà không nghỉ ngơi đúng cách', 'Paracetamol', NULL),
(3, 'Mỏi mắt', 'Sử dụng màn hình máy tính, điện thoại trong thời gian dài; Ánh sáng xanh từ màn hình', 'Thuốc nhỏ mắt', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `disease_symptoms`
--

CREATE TABLE `disease_symptoms` (
  `Benh_ID` int(11) NOT NULL,
  `Trieu_chung_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `disease_symptoms`
--

INSERT INTO `disease_symptoms` (`Benh_ID`, `Trieu_chung_ID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(2, 7),
(2, 8),
(2, 9),
(3, 5),
(3, 10),
(3, 11);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `symptoms`
--

CREATE TABLE `symptoms` (
  `Trieu_chung_ID` int(11) NOT NULL,
  `Ten_trieu_chung` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `symptoms`
--

INSERT INTO `symptoms` (`Trieu_chung_ID`, `Ten_trieu_chung`) VALUES
(1, 'Khát nước nhiều'),
(2, 'Đi tiểu thường xuyên'),
(3, 'Mệt mỏi'),
(4, 'Giảm cân không rõ nguyên nhân'),
(5, 'Mờ mắt'),
(6, 'Lâu lành vết thương'),
(7, 'Đau nhức ở lưng dưới, vai, cổ'),
(8, 'Căng cơ, cứng cơ'),
(9, 'Đau lan xuống cánh tay hoặc chân'),
(10, 'mỏi mắt, khô mắt, nhức mắt'),
(11, 'đau đầu');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `diseases`
--
ALTER TABLE `diseases`
  ADD PRIMARY KEY (`Benh_ID`);

--
-- Chỉ mục cho bảng `disease_symptoms`
--
ALTER TABLE `disease_symptoms`
  ADD PRIMARY KEY (`Benh_ID`,`Trieu_chung_ID`),
  ADD KEY `Trieu_chung_ID` (`Trieu_chung_ID`);

--
-- Chỉ mục cho bảng `symptoms`
--
ALTER TABLE `symptoms`
  ADD PRIMARY KEY (`Trieu_chung_ID`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `disease_symptoms`
--
ALTER TABLE `disease_symptoms`
  ADD CONSTRAINT `disease_symptoms_ibfk_1` FOREIGN KEY (`Benh_ID`) REFERENCES `diseases` (`Benh_ID`),
  ADD CONSTRAINT `disease_symptoms_ibfk_2` FOREIGN KEY (`Trieu_chung_ID`) REFERENCES `symptoms` (`Trieu_chung_ID`);
--
-- Cơ sở dữ liệu: `olesdata`
--
CREATE DATABASE IF NOT EXISTS `olesdata` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `olesdata`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `Name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Address` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Email` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Tel01` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Func1` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Func2` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Func3` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Func4` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Func5` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Func6` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Use_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Pass1` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Pass2` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Security` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`Name`, `Address`, `Email`, `Tel01`, `Func1`, `Func2`, `Func3`, `Func4`, `Func5`, `Func6`, `Use_name`, `Pass1`, `Pass2`, `Security`) VALUES
('NGUYỄN HỮU THÀNH ĐẠT', 'Thanh Hoá', 'hd@gmail.com', '0345854512', '2', NULL, NULL, '10/17/2023', NULL, '0', 'a', '1', '1', '11'),
('NGUYỄN HỮU THÀNH ĐẠT', 'Thanh Hoá', 'hd@gmail.com', '0345854512', '1', NULL, NULL, '10/17/2023', NULL, '0', 'Admin', 'admin', 'admin', '11'),
('NGUYỄN HỮU THÀNH ĐẠT', 'Thanh Hoá', 'hd@gmail.com', '0345854512', '1', NULL, NULL, '10/20/2023', NULL, '0', 'b', '1', '1', '11'),
('NGUYỄN VĂN LONG', 'CT. ABC', 'eh20023@gmail.com', '0999999999', '3', NULL, NULL, '10/27/2023', NULL, '0', 'c', '1', '1', '11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `certificate`
--

CREATE TABLE `certificate` (
  `ID` int(10) DEFAULT NULL,
  `ThreadParent` int(10) DEFAULT NULL,
  `Username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Hoten` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Sinhngay` datetime DEFAULT NULL,
  `Coquan` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Quequan` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Diachi` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CCCD` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NgaycapCCCD` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NoiCapCCCD` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Sobaodanh` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Email` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Yeucau1` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Yeucau2` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Yeucau3` tinyint(1) DEFAULT NULL,
  `Hinhthuc_TT1` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Hinhthuc_TT_Khac` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Noidung` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Monhoc` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Ngay_thi` datetime DEFAULT NULL,
  `Date_Time_login_thi` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Madethi` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Diem_thi` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Xep_loai` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Lan_thi` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NienKhoa` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SohieuCC` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Dacap_cc` tinyint(1) DEFAULT NULL,
  `Ngaycap` datetime DEFAULT NULL,
  `Ngaynhan` datetime DEFAULT NULL,
  `Lephi` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DaTT` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ChuaTT` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Vaoso_ngay` datetime DEFAULT NULL,
  `Ngaynhan_khach` datetime DEFAULT NULL,
  `Noidung_khach` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Da_ky_CC` tinyint(1) DEFAULT NULL,
  `Ngaygui_CC` datetime DEFAULT NULL,
  `Chungtugui` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Content` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `certificate`
--

INSERT INTO `certificate` (`ID`, `ThreadParent`, `Username`, `Hoten`, `Sinhngay`, `Coquan`, `Quequan`, `Diachi`, `CCCD`, `NgaycapCCCD`, `NoiCapCCCD`, `Sobaodanh`, `Email`, `Yeucau1`, `Yeucau2`, `Yeucau3`, `Hinhthuc_TT1`, `Hinhthuc_TT_Khac`, `Noidung`, `Monhoc`, `Ngay_thi`, `Date_Time_login_thi`, `Madethi`, `Diem_thi`, `Xep_loai`, `Lan_thi`, `NienKhoa`, `SohieuCC`, `Dacap_cc`, `Ngaycap`, `Ngaynhan`, `Lephi`, `DaTT`, `ChuaTT`, `Vaoso_ngay`, `Ngaynhan_khach`, `Noidung_khach`, `Da_ky_CC`, `Ngaygui_CC`, `Chungtugui`, `Content`) VALUES
(154, 0, NULL, 'NGUYỄN HỮU THÀNH ĐẠT', '2000-01-01 00:00:00', NULL, NULL, 'Trường ĐH Kiến Trúc Hà Nội', '111222333', '26/11/1999', 'Thanh Hóa', '250', 'nhh20000@gmail.com ', NULL, NULL, 0, NULL, NULL, NULL, 'Lập trình Javascript căn bản', '2023-10-19 00:00:00', NULL, '09', '460', 'Khá', '1', 'K-001', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(155, 0, NULL, 'NGUYỄN HỮU THÀNH ĐẠT', '2000-01-01 00:00:00', NULL, NULL, 'Trường ĐH Kiến Trúc Hà Nội', '111222333', '26/11/1999', 'Thanh Hóa', '251', 'nhh20000@gmail.com ', NULL, NULL, 0, NULL, NULL, NULL, 'Lập trình Javascript căn bản', '2023-10-19 00:00:00', NULL, '23', '400', 'Khá', '1', 'K-001', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(156, 0, NULL, 'NGUYỄN HỮU THÀNH ĐẠT', '2000-01-01 00:00:00', NULL, NULL, 'Trường ĐH Kiến Trúc Hà Nội', '111222333', '26/11/1999', 'Thanh Hóa', '252', 'nhh20000@gmail.com ', NULL, NULL, 0, NULL, NULL, NULL, 'Lập trình Javascript căn bản', '2023-10-19 00:00:00', NULL, '57', '520', 'Giỏi', '1', 'K-001', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(157, 0, NULL, 'NGUYỄN HỮU THÀNH ĐẠT', '2000-01-01 00:00:00', 'Thanh Hóa', NULL, 'Trường ĐH Kiến Trúc Hà Nội', '111222333', '26/11/1999', 'Thanh Hóa', '255', 'nhh20000@gmail.com ', NULL, NULL, 0, NULL, NULL, NULL, 'Lập trình Javascript căn bản', '2023-10-19 00:00:00', NULL, '35', '460', 'Khá', '9', 'K-001', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(158, 0, NULL, 'NGUYỄN HỮU THÀNH ĐẠT', '2000-01-01 00:00:00', 'Thanh Hóa', NULL, 'Trường ĐH Kiến Trúc Hà Nội', '111222333', '26/11/1999', 'Thanh Hóa', '256', 'nhh20000@gmail.com ', NULL, NULL, 0, NULL, NULL, NULL, 'Lập trình Javascript căn bản', '2023-10-19 00:00:00', NULL, '21', '430', 'Khá', '10', 'K-001', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(159, 0, NULL, 'NGUYỄN HỮU THÀNH ĐẠT', '2000-01-01 00:00:00', 'Thanh Hóa', NULL, 'Trường ĐH Kiến Trúc Hà Nội', '111222333', '26/11/1999', 'Thanh Hóa', '257', 'nhh20000@gmail.com ', NULL, NULL, 0, NULL, NULL, NULL, 'Lập trình Javascript căn bản', '2023-10-19 00:00:00', NULL, '26', '470', 'Khá', '11', 'K-001', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(160, 0, NULL, 'NGUYỄN HỮU THÀNH ĐẠT', '2000-01-01 00:00:00', NULL, NULL, 'Trường ĐH Kiến Trúc Hà Nội', '111222333', '26/11/1999', 'Thanh Hóa', '272', 'nhh20000@gmail.com ', NULL, NULL, 0, NULL, NULL, NULL, 'Lập trình Javascript căn bản', '2023-10-22 00:00:00', NULL, '03', '390', 'Khá', '1', 'K-001', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(161, 0, NULL, 'NGUYỄN HỮU THÀNH ĐẠT', '2000-01-01 00:00:00', NULL, NULL, 'Trường ĐH Kiến Trúc Hà Nội', '111222333', '26/11/1999', 'Thanh Hóa', '273', 'nhh20000@gmail.com ', NULL, NULL, 0, NULL, NULL, NULL, 'Lập trình Javascript căn bản', '2023-10-22 00:00:00', NULL, '27', '420', 'Khá', '1', 'K-001', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(162, 0, NULL, 'NGUYỄN HỮU THÀNH ĐẠT', '2000-01-01 00:00:00', NULL, NULL, 'Trường ĐH Kiến Trúc Hà Nội', '111222333', '26/11/1999', 'Thanh Hóa', '274', 'nhh20000@gmail.com ', NULL, NULL, 0, NULL, NULL, NULL, 'Lập trình Javascript căn bản', '2023-10-22 00:00:00', NULL, 'C11', '430', 'Khá', '1', 'K-001', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(163, 0, NULL, 'NGUYỄN HỮU THÀNH ĐẠT', '2000-01-01 00:00:00', NULL, NULL, 'Trường ĐH Kiến Trúc Hà Nội', '111222333', '26/11/1999', 'Thanh Hóa', '278', 'nhh20000@gmail.com ', NULL, NULL, 0, NULL, NULL, NULL, 'Lập trình Javascript căn bản', '2023-10-22 00:00:00', NULL, 'A00', '680', 'Khá', '1', 'K-001', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(164, 0, NULL, 'NGUYỄN HỮU THÀNH ĐẠT', '2000-01-01 00:00:00', NULL, NULL, 'Trường ĐH Kiến Trúc Hà Nội', '111222333', '26/11/1999', 'Thanh Hóa', '324', 'nhh20000@gmail.com ', NULL, NULL, 0, NULL, NULL, NULL, 'Lập trình Javascript căn bản', '2023-10-22 00:00:00', NULL, 'A00', '650', 'Khá', '1', 'K-001', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(165, 0, NULL, 'NGUYỄN HỮU THÀNH ĐẠT', '2000-01-01 00:00:00', NULL, NULL, 'Trường ĐH Kiến Trúc Hà Nội', '111222333', '26/11/1999', 'Thanh Hóa', '401', 'nhh20000@gmail.com ', NULL, NULL, 0, NULL, NULL, NULL, 'Lập trình Javascript căn bản', '2023-10-29 00:00:00', NULL, 'B35', '6.18', 'Trung bình', '1', 'K-001', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(168, 0, NULL, 'NGUYỄN HỮU THÀNH ĐẠT', '2000-01-01 00:00:00', NULL, NULL, 'Trường ĐH Kiến Trúc Hà Nội', '111222333', '26/11/1999', 'Thanh Hóa', '475', 'nhh20000@gmail.com ', NULL, NULL, 0, NULL, NULL, NULL, 'Lập trình Javascript căn bản', '2023-11-03 00:00:00', NULL, 'A48', '10', 'Giỏi', '1', 'K-001', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(169, 0, NULL, 'NGUYỄN HỮU THÀNH ĐẠT', '2000-01-01 00:00:00', NULL, NULL, 'Trường ĐH Kiến Trúc Hà Nội', '111222333', '26/11/1999', 'Thanh Hóa', '477', 'nhh20000@gmail.com ', NULL, NULL, 0, NULL, NULL, NULL, 'Lập trình Javascript căn bản', '2023-11-03 00:00:00', NULL, 'B22', '9.64', 'Giỏi', '1', 'K-001', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(170, 0, NULL, 'NGUYỄN HỮU THÀNH ĐẠT', '2000-01-01 00:00:00', NULL, NULL, 'Trường ĐH Kiến Trúc Hà Nội', '111222333', '26/11/1999', 'Thanh Hóa', '478', 'nhh20000@gmail.com ', NULL, NULL, 0, NULL, NULL, NULL, 'Lập trình Javascript căn bản', '2023-11-03 00:00:00', NULL, 'C34', '9.64', 'Giỏi', '1', 'K-001', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(171, 0, NULL, 'NGUYỄN HỮU THÀNH ĐẠT', '2000-01-01 00:00:00', NULL, NULL, 'Trường ĐH Kiến Trúc Hà Nội', '111222333', '26/11/1999', 'Thanh Hóa', '515', 'nhh20000@gmail.com ', NULL, NULL, 0, NULL, NULL, NULL, 'Lập trình Javascript căn bản', '2023-11-03 00:00:00', NULL, 'C54', '10', 'Giỏi', '1', 'K-001', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(52, 0, NULL, 'LÊ VĂN NAM', '1989-05-19 00:00:00', 'Thanh Hóa', 'Thanh Hóa', 'Thanh Hóa', '645464656', '26/11/1999', 'Thanh Hóa', '0048', 'nhh20000@gmail.com', NULL, NULL, 0, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, NULL, NULL, '540', 'Giỏi', '1', NULL, '0048', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(148, 0, NULL, 'NGUYỄN HỮU THÀNH ĐẠT', '2000-01-01 00:00:00', 'k345', 'Trà Vinh', 'Trường ĐH Kiến Trúc Hà Nội', '111222333', '26/11/1999', 'Thanh Hóa', '192', 'nhh20000@gmail.com ', NULL, NULL, 0, NULL, NULL, NULL, 'Lập trình Javascript căn bản', '2023-10-08 00:00:00', NULL, '42', '470', 'Khá', '2', 'K-001', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(149, 0, NULL, 'NGUYỄN HỮU THÀNH ĐẠT', '2000-01-01 00:00:00', 'k345', 'Trà Vinh', 'Trường ĐH Kiến Trúc Hà Nội', '111222333', '26/11/1999', 'Thanh Hóa', '212', 'nhh20000@gmail.com ', NULL, NULL, 0, NULL, NULL, NULL, 'Lập trình Javascript căn bản', '2023-10-17 00:00:00', NULL, '41', '440', 'Khá', '3', 'K-001', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(150, 0, 'Z', 'NGUYỄN HỮU THÀNH ĐẠT', '2000-01-01 00:00:00', 'k345', 'Trà Vinh', 'Trường ĐH Kiến Trúc Hà Nội', '111222333', '26/11/1999', 'Thanh Hóa', '213', 'nhh20000@gmail.com ', NULL, NULL, 0, NULL, NULL, NULL, 'Lập trình Javascript căn bản', '2023-10-17 00:00:00', NULL, '46', '500', 'Khá', '1', 'K-001', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(151, 0, 'Z', 'NGUYỄN HỮU THÀNH ĐẠT', '2000-01-01 00:00:00', 'k345', 'Trà Vinh', 'Trường ĐH Kiến Trúc Hà Nội', '111222333', '26/11/1999', 'Thanh Hóa', '214', 'nhh20000@gmail.com ', NULL, NULL, 0, NULL, NULL, NULL, 'Lập trình Javascript căn bản', '2023-10-17 00:00:00', NULL, '50', '490', 'Khá', '1', 'K-001', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(152, 0, NULL, 'NGUYỄN HỮU THÀNH ĐẠT', '2000-01-01 00:00:00', NULL, NULL, 'Trường ĐH Kiến Trúc Hà Nội', '111222333', '26/11/1999', 'Thanh Hóa', '248', 'nhh20000@gmail.com ', NULL, NULL, 0, NULL, NULL, NULL, 'Lập trình Javascript căn bản', '2023-10-19 00:00:00', NULL, '32', '490', 'Khá', '1', 'K-001', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(153, 0, NULL, 'NGUYỄN HỮU THÀNH ĐẠT', '2000-01-01 00:00:00', NULL, NULL, 'Trường ĐH Kiến Trúc Hà Nội', '111222333', '26/11/1999', 'Thanh Hóa', '249', 'nhh20000@gmail.com ', NULL, NULL, 0, NULL, NULL, NULL, 'Lập trình Javascript căn bản', '2023-10-19 00:00:00', NULL, '11', '460', 'Khá', '1', 'K-001', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(166, 0, NULL, 'NGUYỄN HỮU THÀNH ĐẠT', '2000-01-01 00:00:00', NULL, NULL, 'Trường ĐH Kiến Trúc Hà Nội', '111222333', '26/11/1999', 'Thanh Hóa', '410', 'nhh20000@gmail.com ', NULL, NULL, 0, NULL, NULL, NULL, 'Lập trình Javascript căn bản', '2023-10-30 00:00:00', NULL, 'C23', '7.82', 'Khá', '1', 'K-001', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(167, 0, NULL, 'NGUYỄN HỮU THÀNH ĐẠT', '2000-01-01 00:00:00', NULL, NULL, 'Trường ĐH Kiến Trúc Hà Nội', '111222333', '26/11/1999', 'Thanh Hóa', '474', 'nhh20000@gmail.com ', NULL, NULL, 0, NULL, NULL, NULL, 'Lập trình Javascript căn bản', '2023-11-03 00:00:00', NULL, 'B28', '9.64', 'Giỏi', '1', 'K-001', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(172, 0, NULL, 'NGUYỄN HỮU THÀNH ĐẠT', '2000-01-01 00:00:00', NULL, NULL, 'Trường ĐH Kiến Trúc Hà Nội', '1112223383', '11/26/1999', 'Thanh Hóa', '315', 'nhh20000@gmail.com ', NULL, NULL, 0, NULL, NULL, NULL, 'Lập trình Javascript căn bản', '2023-12-06 00:00:00', NULL, 'B ', '6.25', 'Trung bình', '1', 'K-001', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(173, 0, NULL, 'NGUYỄN VĂN TAM', '1999-04-03 00:00:00', NULL, NULL, 'Trường ĐH Kiến Trúc Hà Nội', '65464687', '1/10/2000', 'Thừa Thiên Huế', '348', 'eh20023@gmail.com ', NULL, NULL, 0, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '2023-12-21 00:00:00', NULL, 'A ', '5.5', 'Trung bình', '1', 'K-001', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `code_cards_hoc`
--

CREATE TABLE `code_cards_hoc` (
  `ID` int(10) DEFAULT NULL,
  `ThreadParent` int(10) DEFAULT NULL,
  `Comments` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Serial_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `code01` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Hinhthuc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Mon_hocphan` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Time_use` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Timer` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Han_sd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `thoi_han_thi` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `thoi_han_thi_kt` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tgian_thi` int(10) DEFAULT NULL,
  `Datepost` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Status` int(10) DEFAULT NULL,
  `DaSD` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `code_cards_hoc`
--

INSERT INTO `code_cards_hoc` (`ID`, `ThreadParent`, `Comments`, `Serial_no`, `code01`, `Hinhthuc`, `Mon_hocphan`, `Time_use`, `Timer`, `Han_sd`, `thoi_han_thi`, `thoi_han_thi_kt`, `tgian_thi`, `Datepost`, `Status`, `DaSD`) VALUES
(4, 0, NULL, 'K000A05103', 'KND3', 'HỌC', NULL, '300', '60', '11/11/2023', '1', '15', 3600, NULL, 0, 0),
(5, 0, '', 'K000C05131', 'FDC3', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(7, 0, NULL, 'K000C05132', 'E7HG', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 1, 1),
(8, 0, NULL, 'K000C05133', 'UPT6', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 1, 1),
(9, 0, NULL, 'K000C05134', 'HEUD', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 1, 1),
(10, 0, NULL, 'K000C05135', 'T2UP', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 1, 1),
(11, 0, NULL, 'K000C05136', 'Y5TM', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 1, 1),
(12, 0, NULL, 'K000C05137', '3AH8', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(13, 0, NULL, 'K000C05138', 'VMPU', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(14, 0, NULL, 'K000C05139', 'TRXZ', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(15, 0, NULL, 'K000C05140', 'RD4C', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(16, 0, NULL, 'K000C05141', 'YMFC', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(17, 0, NULL, 'K000C05142', 'RUCD', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(18, 0, NULL, 'K000C05143', 'F7BM', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(19, 0, NULL, 'K000C05144', 'H2BM', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(20, 0, NULL, 'K000C05145', 'T2FR', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(21, 0, NULL, 'K000C05146', 'XHE6', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(22, 0, NULL, 'K000C05147', '6DAV', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(23, 0, NULL, 'K000C05148', 'XGE6', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(24, 0, NULL, 'K000C05149', '5APE', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(25, 0, NULL, 'K000C05150', 'TXG7', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(26, 0, NULL, 'K000C05151', 'GTXP', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(27, 0, NULL, 'K000C05152', 'UOPC', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(28, 0, NULL, 'K000C05153', 'XJOP', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(29, 0, NULL, 'K000C05154', 'KBM5', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(30, 0, NULL, 'K000C05155', 'H2PA', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(31, 0, NULL, 'K000C05157', 'NAPL', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(32, 0, NULL, 'K000C05158', '7FVE', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(33, 0, NULL, 'K000C05159', 'A7MG', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(34, 0, NULL, 'K000C05160', 'BTAK', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(35, 0, NULL, 'K000C05161', 'HJA6', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(36, 0, NULL, 'K000C05162', 'YU6M', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(37, 0, NULL, 'K000C05163', 'JYME', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(38, 0, NULL, 'K000C05164', 'CVA6', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(39, 0, NULL, 'K000C05165', 'GLTU', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(40, 0, NULL, 'K000C05166', 'GE2L', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(41, 0, NULL, 'K000C05167', 'GRT5', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(42, 0, NULL, 'K000C05168', 'FETD', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(43, 0, NULL, 'K000C05169', 'V5MD', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(45, 0, NULL, 'K000C05171', 'UT6X', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(46, 0, NULL, 'K000C05172', 'YTU6', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(47, 0, NULL, 'K000C05173', 'T2KW', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(48, 0, NULL, 'K000C05174', 'FEK6', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(49, 0, NULL, 'K000C05175', 'TXH9', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(50, 0, NULL, 'K000C05176', 'NADK', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(52, 0, NULL, 'K000C05178', 'HRMY', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(53, 0, NULL, 'K000C05179', 'AMC5', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(54, 0, NULL, 'K000C05180', 'FDT3', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(55, 0, NULL, 'K000C05181', 'HFC3', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(56, 0, NULL, 'K000C05182', 'GQVU', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(57, 0, NULL, 'K000C05183', 'VFA5', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(58, 0, NULL, 'K000C05184', 'NB2J', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(59, 0, NULL, 'K000C05185', 'VMAU', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(60, 0, NULL, 'K000C05186', 'FOP6', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(61, 0, NULL, 'K000C05187', 'N3HS', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(62, 0, NULL, 'K000C05188', 'MSC8', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(63, 0, NULL, 'K000C05189', 'R4NZ', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(64, 0, NULL, 'K000C05190', 'GJEB', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(65, 0, NULL, 'K000C05191', '4HCV', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(66, 0, NULL, 'K000C05192', 'FCNU', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(67, 0, NULL, 'K000C05193', 'RNYE', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(68, 0, NULL, 'K000C05194', 'V7TY', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(69, 0, NULL, 'K000C05195', 'DHEC', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(71, 0, NULL, 'K000C05197', 'FZCM', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(72, 0, NULL, 'K000C05198', 'FM1G', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(73, 0, NULL, 'K000C05199', 'CNRF', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(74, 0, NULL, 'K000C05200', 'BCJU', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(75, 0, NULL, 'K000C05201', 'TXE8', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(76, 0, NULL, 'K000C05202', 'DCIP', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(77, 0, NULL, 'K000C05203', 'N5RX', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(78, 0, NULL, 'K000C05204', 'HCRT', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(79, 0, NULL, 'K000C05205', 'GUEY', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(80, 0, NULL, 'K000C05206', 'J5DE', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(81, 0, NULL, 'K000C05207', 'T5EC', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(82, 0, NULL, 'K000C05208', 'YC6M', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(83, 0, NULL, 'K000C05209', 'YALE', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(86, 0, NULL, 'K000C05212', 'RGB8', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(87, 0, NULL, 'K000C05213', 'HM92', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(89, 0, NULL, 'K000C05215', 'HXL3', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(90, 0, NULL, 'K000C05217', 'U2YH', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(91, 0, NULL, 'K000C05218', 'GRC8', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(92, 0, NULL, 'K000C05219', 'TC7M', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(93, 0, NULL, 'K000C05220', 'YX6M', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(94, 0, NULL, 'K000C05221', 'T3SB', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(95, 0, NULL, 'K000C05222', 'GTM7', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(97, 0, NULL, 'K000C05224', 'BMTD', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(98, 0, NULL, 'K000C05225', 'MTZL', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(99, 0, NULL, 'K000C05226', 'HG5M', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(101, 0, NULL, 'K000C05228', 'EMH3', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(102, 0, NULL, 'K000C05229', 'TCM7', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(103, 0, NULL, 'K000C05230', 'THYN', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(104, 0, NULL, 'K000C05231', 'HRME', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(105, 0, NULL, 'K000C05232', 'HM4F', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(106, 0, NULL, 'K000C05233', 'GHYB', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(107, 0, NULL, 'K000C05234', 'FCM8', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(108, 0, NULL, 'K000C05235', 'YB8C', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(109, 0, NULL, 'K000C05237', 'UNT3', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(110, 0, NULL, 'K000C05238', 'JB2X', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(111, 0, NULL, 'K000C05239', 'YMT2', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(112, 0, NULL, 'K000C05240', 'GBU7', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(113, 0, NULL, 'K000C05241', 'YMP2', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(114, 0, NULL, 'K000C05242', 'UM2P', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(115, 0, NULL, 'K000C05243', 'RTM2', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(116, 0, NULL, 'K000C05244', 'YXPU', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(117, 0, NULL, 'K000C05245', 'REKM', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(118, 0, NULL, 'K000C05247', 'EGM9', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(119, 0, NULL, 'K000C05248', 'RJ4M', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(121, 0, NULL, 'K000C05250', 'GZ5P', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(122, 0, NULL, 'K000C05251', 'UB7H', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(123, 0, NULL, 'K000C05252', 'P8VK', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(124, 0, NULL, 'K000C05253', 'PME9', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(125, 0, NULL, 'K000C05254', 'PWCM', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(126, 0, NULL, 'K000C05255', 'TABI', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(127, 0, NULL, 'K000C05257', 'LWDC', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(128, 0, NULL, 'K000C05258', 'TNYD', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(129, 0, NULL, 'K000C05259', 'KPRM', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(130, 0, NULL, 'K000C05260', 'PEQ8', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(131, 0, NULL, 'K000C05261', 'RXTM', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(132, 0, NULL, 'K000C05262', 'ZXCY', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(133, 0, NULL, 'K000C05263', 'YZF9', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(134, 0, NULL, 'K000C05264', 'VZUP', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(135, 0, NULL, 'K000C05265', 'HZP5', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(136, 0, NULL, 'K000C05267', 'HS6M', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(137, 0, NULL, 'K000C05268', 'HWTK', 'HỌC - THI', NULL, '200', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(138, 0, NULL, 'K000C05269', 'TCKD', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(139, 0, NULL, 'K000C05270', 'TZU9', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(140, 0, NULL, 'K000C05271', 'U6HB', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(141, 0, NULL, 'K000C05272', 'YLRE', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(142, 0, NULL, 'K000C05273', 'TVA7', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(143, 0, NULL, 'K000C05274', 'TXP2', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(144, 0, NULL, 'K000C05275', 'DBT3', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(145, 0, NULL, 'K000C05277', 'TH5G', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(146, 0, NULL, 'K000C05278', 'RZE6', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(147, 0, NULL, 'K000C05279', 'TUBC', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(148, 0, NULL, 'K000C05280', '8CH3', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(149, 0, NULL, 'K000C05291', 'ZC7H', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(150, 0, NULL, 'K000C05292', 'TU6Q', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(151, 0, NULL, 'K000C05293', 'TB3C', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(152, 0, NULL, 'K000C05294', 'R1CY', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(153, 0, NULL, 'K000C05295', 'TSP4', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(154, 0, NULL, 'K000C05297', 'CA3K', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(155, 0, NULL, 'K000C05298', 'ZAK5', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(156, 0, NULL, 'K000C05299', 'CNK6', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(157, 0, NULL, 'K000C05300', 'XZYH', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(158, 0, NULL, 'K000C05301', 'ZS8M', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(159, 0, NULL, 'K000C05302', 'RZBT', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(160, 0, NULL, 'K000C05303', 'RZKL', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(161, 0, NULL, 'K000C05304', '4AKQ', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(162, 0, NULL, 'K000C05305', 'XBS6', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(163, 0, NULL, 'K000C05307', 'ZDF4', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(164, 0, NULL, 'K000C05308', 'XZAP', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(165, 0, NULL, 'K000C05309', 'T6ZX', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(167, 0, NULL, 'K000C05311', 'RXA5', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(170, 0, NULL, 'K000C05314', 'V8ME', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(171, 0, NULL, 'K000C05315', 'FAJ9', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(174, 0, NULL, 'K000C05319', 'TMJ3', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(175, 0, NULL, 'K000C05320', 'GTAV', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(176, 0, NULL, 'K000C05321', 'T3UD', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(177, 0, NULL, 'K000C05322', 'HJPX', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(178, 0, NULL, 'K000C05323', 'RW6H', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(179, 0, NULL, 'K000C05324', 'GZP5', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(180, 0, NULL, 'K000C05325', 'WHOM', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(181, 0, NULL, 'K000C05327', 'DAHJ', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(182, 0, NULL, 'K000C05328', 'YBMP', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(183, 0, NULL, 'K000C05329', 'JRG3', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(184, 0, NULL, 'K000C05330', 'YBF6', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(186, 0, NULL, 'S000B00110', 'KT91', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(187, 0, NULL, 'S000B00111', 'Z8XU', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(188, 0, NULL, 'S000B00112', 'FHS7', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(189, 0, NULL, 'S000B00113', 'AG2Q', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(190, 0, NULL, 'S000B00114', 'FA6L', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(191, 0, NULL, 'S000B00115', 'W6HK', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(192, 0, NULL, 'S000B00116', 'HYT9', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(193, 0, NULL, 'S000B00117', 'YH7D', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(194, 0, NULL, 'S000B00118', 'QYKA', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(195, 0, NULL, 'S000B00119', 'TDHQ', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(196, 0, NULL, 'S000B00120', 'SH6K', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(198, 0, NULL, 'S000B00122', 'KA9T', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(199, 0, NULL, 'S000B00123', 'SKDJ', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(200, 0, NULL, 'S000B00124', 'XVC9', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(201, 0, NULL, 'S000B00125', 'KGB8', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(202, 0, NULL, 'S000B00126', 'CVJL', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(203, 0, NULL, 'S000B00127', 'Z5TK', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(204, 0, NULL, 'S000B00128', 'B8MD', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(205, 0, NULL, 'S000B00129', '4KWZ', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(207, 0, NULL, 'S000B00133', 'DP1B', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(214, 0, NULL, 'S000B00140', 'WGAP', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(215, 0, NULL, 'S000B00141', 'SKD9', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(216, 0, NULL, 'S000B00142', 'BH9J', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(217, 0, NULL, 'S000B00143', 'SA1G', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(218, 0, NULL, 'S000B00144', 'G3LE', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(219, 0, NULL, 'S000B00145', 'LM3Q', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(220, 0, NULL, 'S000B00146', 'UB6H', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(221, 0, NULL, 'S000B00147', 'GB7J', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(222, 0, NULL, 'S000B00148', 'GV2H', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(223, 0, NULL, 'S000B00149', 'NG5T', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(224, 0, NULL, 'S000B00150', 'MCTO', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(225, 0, NULL, 'S000B00151', 'MXRI', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(226, 0, NULL, 'S000B00152', 'VXOB', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(227, 0, NULL, 'S000B00153', 'MVBQ', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(228, 0, NULL, 'S000B00154', 'RYV9', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(229, 0, NULL, 'S000B00155', 'UIPV', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(230, 0, NULL, 'S000B00156', 'GD2M', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(231, 0, NULL, 'S000B00157', 'AD3V', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(232, 0, NULL, 'S000B00158', 'XOVP', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(233, 0, NULL, 'S000B00159', 'TFR9', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(242, 0, NULL, 'S000B00169', 'VTM8', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(244, 0, NULL, 'S000B00171', 'FM8D', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(245, 0, NULL, 'S000B00172', 'KZRD', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(246, 0, NULL, 'S000B00173', 'EBGD', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(247, 0, NULL, 'S000B00174', 'RWTC', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(248, 0, NULL, 'S000B00175', 'VQA1', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(249, 0, NULL, 'S000B00176', 'ACH4', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(250, 0, NULL, 'S000B00177', 'Q9TD', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(251, 0, NULL, 'S000B00178', 'BCUM', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(252, 0, NULL, 'S000B00179', 'JVME', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(263, 0, NULL, 'S000B00190', 'AC7K', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(264, 0, NULL, 'S000B00191', 'ACMP', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(265, 0, NULL, 'S000B00192', 'DWUC', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(266, 0, NULL, 'S000B00193', 'VB2X', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(267, 0, NULL, 'S000B00194', 'WA8P', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(268, 0, NULL, 'S000B00195', 'G9SF', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(269, 0, NULL, 'S000B00196', 'YCPB', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(270, 0, NULL, 'S000B00197', 'GK4Z', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(271, 0, NULL, 'S000B00198', 'TABK', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(272, 0, NULL, 'S000B00199', 'EKAT', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(273, 0, NULL, 'S000B00200', 'HTC7', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(274, 0, NULL, 'S000B00130', 'H5AK', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(275, 0, NULL, 'S000B00201', 'KEZO', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(276, 0, NULL, 'S000B00202', 'W2TA', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(277, 0, NULL, 'S000B00203', 'ND3X', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(278, 0, NULL, 'S000B00204', 'DAVK', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(279, 0, NULL, 'S000B00205', 'EA4Z', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(280, 0, NULL, 'S000B00206', 'FCJV', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(281, 0, NULL, 'S000B00207', 'HXGM', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(282, 0, NULL, 'S000B00208', '5KED', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(283, 0, NULL, 'S000B00209', '3GCJ', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(284, 0, NULL, 'S000B00210', 'V8FH', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(285, 0, NULL, 'S000B00211', 'XBD7', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(286, 0, NULL, 'S000B00212', '3L6K', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(287, 0, NULL, 'S000B00213', 'WDLA', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(288, 0, NULL, 'S000B00214', 'CBAP', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(289, 0, NULL, 'S000B00215', 'AMYH', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(293, 0, NULL, 'S000B00219', 'ZPLM', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(294, 0, NULL, 'S000B00220', 'ETKD', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(295, 0, NULL, 'S000B00221', 'AHUE', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(296, 0, NULL, 'S000B00222', 'EATG', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(297, 0, NULL, 'S000B00223', '9ATH', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(298, 0, NULL, 'S000B00224', 'KCRE', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(299, 0, NULL, 'S000B00225', 'Q2K8', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(300, 0, NULL, 'S000B00226', 'E5M9', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(301, 0, NULL, 'S000B00227', '8FZK', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(302, 0, NULL, 'S000B00228', 'MBGD', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(303, 0, NULL, 'S000B00229', 'DX5K', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(306, 0, NULL, 'S000B00232', 'CADT', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(314, 0, NULL, 'S000B00240', '3AT8', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(318, 0, NULL, 'S000B00244', 'TXA3', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(320, 0, NULL, 'S000B00246', 'H7RU', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(334, 0, NULL, 'S000B00260', 'EYT5', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(335, 0, NULL, 'S000B00261', 'D2VT', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(336, 0, NULL, 'S000B00262', 'K5YC', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(337, 0, NULL, 'S000B00263', 'TVBM', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(338, 0, NULL, 'S000B00264', 'HNA7', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(339, 0, NULL, 'S000B00265', 'K3LE', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(340, 0, NULL, 'S000B00266', 'XMV6', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(341, 0, NULL, 'S000B00267', 'BG3P', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(342, 0, NULL, 'S000B00268', '5CRE', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(343, 0, NULL, 'S000B00269', 'GLA8', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(354, 0, NULL, 'S000B00280', 'RB6K', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(355, 0, NULL, 'S000B00281', 'D3CG', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(356, 0, NULL, 'S000B00282', 'LQDC', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(357, 0, NULL, 'S000B00283', 'TZ8R', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(358, 0, NULL, 'S000B00284', 'R7HE', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(359, 0, NULL, 'S000B00285', 'U8PD', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(360, 0, NULL, 'S000B00286', 'CE62', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(361, 0, NULL, 'S000B00287', 'YUTE', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(362, 0, NULL, 'S000B00288', 'GKZ1', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(363, 0, NULL, 'S000B00289', 'BTEY', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(364, 0, NULL, 'S000B00290', 'TE6U', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(366, 0, NULL, 'S000B00292', 'J9YF', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(373, 0, NULL, 'S000B00299', '3UV8', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(374, 0, NULL, 'S000B00300', '4CXP', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(375, 0, NULL, 'S000B00301', 'RMAY', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(376, 0, NULL, 'S000B00302', 'W8GP', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(377, 0, NULL, 'S000B00303', 'EMR7', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(378, 0, NULL, 'S000B00304', 'X5VB', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(379, 0, NULL, 'S000B00305', 'YPXR', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(380, 0, NULL, 'S000B00306', 'LDXE', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(381, 0, NULL, 'S000B00307', 'BMZ8', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(382, 0, NULL, 'S000B00308', 'A6BT', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0),
(383, 0, NULL, 'S000B00309', '2GTV', 'HỌC - THI', NULL, '300', '60', NULL, '1', '15', 3600, '11/21/2023', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `level01`
--

CREATE TABLE `level01` (
  `ID` int(11) DEFAULT NULL,
  `MaDe` varchar(5) DEFAULT NULL,
  `TgianLapDe` datetime DEFAULT NULL,
  `TotalQues` int(11) DEFAULT NULL,
  `c1` text DEFAULT NULL,
  `c2` text DEFAULT NULL,
  `c3` text DEFAULT NULL,
  `c4` text DEFAULT NULL,
  `c5` text DEFAULT NULL,
  `c6` text DEFAULT NULL,
  `c7` text DEFAULT NULL,
  `c8` text DEFAULT NULL,
  `c9` text DEFAULT NULL,
  `c10` text DEFAULT NULL,
  `c11` text DEFAULT NULL,
  `c12` text DEFAULT NULL,
  `c13` text DEFAULT NULL,
  `c14` text DEFAULT NULL,
  `c15` text DEFAULT NULL,
  `c16` text DEFAULT NULL,
  `c17` text DEFAULT NULL,
  `c18` text DEFAULT NULL,
  `c19` text DEFAULT NULL,
  `c20` text DEFAULT NULL,
  `c21` text DEFAULT NULL,
  `c22` text DEFAULT NULL,
  `c23` text DEFAULT NULL,
  `c24` text DEFAULT NULL,
  `c25` text DEFAULT NULL,
  `c26` text DEFAULT NULL,
  `c27` text DEFAULT NULL,
  `c28` text DEFAULT NULL,
  `c29` text DEFAULT NULL,
  `c30` text DEFAULT NULL,
  `c31` text DEFAULT NULL,
  `c32` text DEFAULT NULL,
  `c33` text DEFAULT NULL,
  `c34` text DEFAULT NULL,
  `c35` text DEFAULT NULL,
  `c36` text DEFAULT NULL,
  `c37` text DEFAULT NULL,
  `c38` text DEFAULT NULL,
  `c39` text DEFAULT NULL,
  `c40` text DEFAULT NULL,
  `TenMon` text DEFAULT NULL,
  `qq1` varchar(5) DEFAULT NULL,
  `qq2` varchar(5) DEFAULT NULL,
  `qq3` varchar(5) DEFAULT NULL,
  `qq4` varchar(5) DEFAULT NULL,
  `qq5` varchar(5) DEFAULT NULL,
  `qq6` varchar(5) DEFAULT NULL,
  `qq7` varchar(5) DEFAULT NULL,
  `qq8` varchar(5) DEFAULT NULL,
  `qq9` varchar(5) DEFAULT NULL,
  `qq10` varchar(5) DEFAULT NULL,
  `qq11` varchar(5) DEFAULT NULL,
  `qq12` varchar(5) DEFAULT NULL,
  `qq13` varchar(5) DEFAULT NULL,
  `qq14` varchar(5) DEFAULT NULL,
  `qq15` varchar(5) DEFAULT NULL,
  `qq16` varchar(5) DEFAULT NULL,
  `qq17` varchar(5) DEFAULT NULL,
  `qq18` varchar(5) DEFAULT NULL,
  `qq19` varchar(5) DEFAULT NULL,
  `qq20` varchar(5) DEFAULT NULL,
  `qq21` varchar(5) DEFAULT NULL,
  `qq22` varchar(5) DEFAULT NULL,
  `qq23` varchar(5) DEFAULT NULL,
  `qq24` varchar(5) DEFAULT NULL,
  `qq25` varchar(5) DEFAULT NULL,
  `qq26` varchar(5) DEFAULT NULL,
  `qq27` varchar(5) DEFAULT NULL,
  `qq28` varchar(5) DEFAULT NULL,
  `qq29` varchar(5) DEFAULT NULL,
  `qq30` varchar(5) DEFAULT NULL,
  `qq31` varchar(5) DEFAULT NULL,
  `qq32` varchar(5) DEFAULT NULL,
  `qq33` varchar(5) DEFAULT NULL,
  `qq34` varchar(5) DEFAULT NULL,
  `qq35` varchar(5) DEFAULT NULL,
  `qq36` varchar(5) DEFAULT NULL,
  `qq37` varchar(5) DEFAULT NULL,
  `qq38` varchar(5) DEFAULT NULL,
  `qq39` varchar(5) DEFAULT NULL,
  `qq40` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `level01r`
--

CREATE TABLE `level01r` (
  `ID` int(10) DEFAULT NULL,
  `Time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Ngay_lap_de` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Nguoi_lap_de` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `c1` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `c2` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `c3` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `c4` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `c5` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Mon_hp` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Codes` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `qq1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `qq2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `qq3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `qq4` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `qq5` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CustomerID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `level01r`
--

INSERT INTO `level01r` (`ID`, `Time`, `Ngay_lap_de`, `Nguoi_lap_de`, `c1`, `c2`, `c3`, `c4`, `c5`, `Mon_hp`, `Codes`, `qq1`, `qq2`, `qq3`, `qq4`, `qq5`, `CustomerID`) VALUES
(1, '7:03:20 PM', '11/11/2023', NULL, 'Javascript là ngôn ng&#7919; x&#7917; lý &#7903; &#273;âu?<br>\r\nA. Client	          <br>B. Server	\r\n<br>C. Client/Server	  <br>D. Không có d&#7841;ng nào', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '1'),
(2, '7:03:20 PM', '11/11/2023', NULL, 'Cho &#273;o&#7841;n code sau, k&#7871;t qu&#7843; là<br>\r\n   const a = {<br>\r\n      stringField: \'Joe\',<br>\r\n      nestedField: { field: \'Nested\' },<br>\r\n      functionField: () =&gt; \'aReturn\'<br>\r\n   };<br>\r\n   const b = Object.assign([], a);<br>\r\n   b.stringField = \'Bob\',<br>\r\n   b.nestedField.field = \'Changed\',<br>\r\n   b.functionField = () =&gt; \'bReturn\';<br>\r\n   console.log(<br>\r\n      a.stringField,<br>\r\n      a.nestedField.field,<br>\r\n      a.functionField()<br>\r\n   );<br>\r\n<br>\r\nA. Joe Nested aReturn<br>\r\nB. Bob Changed bReturn<br>\r\nC. Joe Changed aReturn<br>\r\nD. Bob Nested bReturn', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '2'),
(3, '7:03:20 PM', '11/11/2023', NULL, 'Ch&#7885;n phát bi&#7875;u &#273;úng<br>\r\n   &lt;script&gt; <br>\r\n      function dtb(toan, ly, hoa) {<br>\r\n         var t = (toan + ly + hoa)/3;<br>\r\n         return t;<br>\r\n      }<br>\r\n      var dtb = dtb(9, 3, 7);<br>\r\n   &lt;/script&gt;<br>\r\n<br>\r\n   &lt;div id=&quot;diem&quot;&gt;<br>\r\n   &lt;script&gt; <br>\r\n      document.write(&quot;&#272;i&#7875;mTB = &quot; + dtb.toFixed(2) ); <br>\r\n   &lt;/script&gt;<br>\r\n&lt;/div&gt;<br>\r\n<br>\r\nA. Code l&#7895;i vì không có hàm toFixed()<br>\r\nB. Code l&#7895;i gì bi&#7873;n dtb trùng tên hàm dtb()<br>\r\nC. K&#7871;t qu&#7843; xu&#7845;t ra &#273;i&#7875;m trung bình v&#7899;i 2 s&#7889; l&#7867;<br>\r\nD. Xu&#7845;t ra &#273;i&#7875;m trung bình nhân v&#7899;i 2', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '3'),
(4, '7:03:20 PM', '11/11/2023', NULL, 'Cho &#273;o&#7841;n code sau, k&#7871;t qu&#7843; là<br>\r\n   const url = \'quiz.duthaho.com\';<br>\r\n   const { length: ln, [ln - 1]: domain = \'quiz\' } = url.split(\'.\').filter(Boolean);<br>\r\n   console.log(domain);<br>\r\n<br>\r\nA. &quot;quiz&quot;<br>\r\nB. &quot;duthaho&quot;<br>\r\nC. &quot;com&quot;<br>\r\nD. undefined', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '4'),
(5, '7:03:20 PM', '11/11/2023', NULL, 'Ki&#7875;u gán nào sau &#273;ây trong Javascript là không h&#7907;p l&#7879;?&nbsp;<br>\r\nA. x = x - y+&nbsp;<br>\r\nB. x *= y&nbsp;&nbsp;<br>\r\nC.&nbsp; x = x + +y&nbsp;&nbsp;<br>\r\nD.&nbsp; x -*= y', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '5'),
(6, '7:03:20 PM', '11/11/2023', NULL, '&#272;o&#7841;n code sau có k&#7871;t qu&#7843; là<br>\r\n   const obj = {<br>\r\n      1: 1,<br>\r\n      2: 2,<br>\r\n      3: 3<br>\r\n   };<br>\r\n   console.log(Object.keys(obj), Object.values(obj));<br>\r\n      A.&nbsp;[1, 2, 3] [&quot;1&quot;, &quot;2&quot;, &quot;3&quot;]<br>\r\n      B.&nbsp;[&quot;1&quot;, &quot;2&quot;, &quot;3&quot;] [1, 2, 3]<br>\r\n      C.&nbsp;[&quot;1&quot;, &quot;2&quot;, &quot;3&quot;] [&quot;1&quot;, &quot;2&quot;, &quot;3&quot;]<br>\r\n      D.', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '6'),
(7, '7:03:20 PM', '11/11/2023', NULL, 'K&#7871;t qu&#7843; c&#7911;a &#273;o&#7841;n code là<br>\r\n   const user = {<br>\r\n      name: \'lao Hac\',<br>\r\n      age: 69,<br>\r\n      pet: {<br>\r\n         type: \'cho\',<br>\r\n         name: \'vang\'<br>\r\n      }<br>\r\n   };<br>\r\n   Object.freeze(user);<br>\r\n   user.pet.name = \'shiba\';<br>\r\n   console.log(user.pet.name);<br>\r\n      A. shiba<br>\r\n      B. vang<br>\r\n      C. An error is thrown<br>\r\n      D.', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '7'),
(8, '7:03:20 PM', '11/11/2023', NULL, '&#272;o&#7841;n code sau s&#7869; cho k&#7871;t qu&#7843;<br>\r\n   const scrambled = {<br>\r\n      2: \'e\',<br>\r\n      5: \'o\',<br>\r\n      1: \'h\',<br>\r\n      4: \'l\',<br>\r\n      3: \'l\'<br>\r\n   };\r\n      <p>const result = Object.values(scrambled).reduce(<br>\r\n      (agg, el) =&amp;gt; agg + el,<br>\r\n      \'\'<br>\r\n   );<br>\r\n   console.log(result);&nbsp;<br>\r\n   \r\n      A. hello<br>\r\n      B. eohll<br>\r\n      C. C&#7843; A, B &#273;&#7873;u &#273;úng<br>\r\n      D. C&#7843; A, B &#273;&#7873;u sai', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '8'),
(9, '7:03:20 PM', '11/11/2023', NULL, 'Javascript là ngôn ng&#7919; thông d&#7883;ch hay biên d&#7883;ch?<br>\r\nA. Thông d&#7883;ch	  <br>B. Biên d&#7883;ch	\r\n<br>C. C&#7843; 2 d&#7841;ng	  <br>D. Không có d&#7841;ng nào &#7903; trên', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '9'),
(10, '7:03:20 PM', '11/11/2023', NULL, 'Cho bi&#7871;t &#273;o&#7841;n code sau s&#7869; có k&#7871;t qu&#7843; nh&#432; th&#7871; nào n&#7871;u nh&#7853;p vào ch&#7919; a<br>\r\n   &lt;script&gt;<br>\r\n      var x = prompt(&quot;B&#7841;n bao nhiêu tu&#7893;i?&quot;);<br>\r\n      if (isNaN(x) == true) alert(&quot;Tr&#7901;i &#417;i! Nh&#7853;p s&#7889; á!);<br>\r\n      else alert(&quot;C&#7843;m &#417;n&quot;);<br>\r\n   &lt;/script&gt;&nbsp;<br>\r\nA. Tr&#7901;i &#417;i! Nh&#7853;p s&#7889; á&nbsp;<br>\r\nB. L&#7895;i&nbsp;<br>\r\nC. C&#7843;m &#417;n&nbsp;<br>\r\nD. Không hi&#7879;n gì c&#7843;', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '10'),
(11, '3:36:14 PM', '11/11/2023', NULL, 'K&#7871;t qu&#7843; &#273;o&#7841;n code sau là?<br>\r\n   function withVar() {<br>\r\n      const b = () =&gt; a;<br>\r\n      var a = 24;<br>\r\n      return b;<br>\r\n   }<br>\r\n<br>\r\n   function withLet() {<br>\r\n      const b = () =&gt; a;<br>\r\n      let a = 24;<br>\r\n      return b;<br>\r\n   }<br>\r\n<br>\r\n   function  changingValue() {<br>\r\n      let a = 24;<br>\r\n      const b = () =&gt; a;<br>\r\n      a = 42;<br>\r\n      return b;<br>\r\n   }<br>\r\n<br>\r\n   console.log(withVar()();<br>\r\n   console.log(withLet()());<br>\r\n   console.log(changingValue()());<br>\r\n<br>\r\nA. undefined Error 42<br>\r\nB. 24 Error 24<br>\r\nC. 24 24 42<br>\r\nD. undefined Error 24', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '11'),
(12, '3:11:21 PM', '11/11/2023', NULL, 'Hàm alert() dùng &#273;&#7875; làm gì?	<br>\r\nA. Dùng &#273;&#7875; hi&#7879;n m&#7897;t thông báo	        <br>B. Dùng &#273;&#7875; hi&#7879;n m&#7897;t thông báo nh&#7853;p	\r\n<br>C. Dùng &#273;&#7875; chuy&#7875;n &#273;&#7893;i s&#7889; sang ch&#7919;	<br>D. T&#7845;t c&#7843; các d&#7841;ng trên', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '12'),
(13, '3:36:14 PM', '11/11/2023', NULL, 'Javascript có các ki&#7875;u d&#7919; li&#7879;u c&#7911;a bi&#7871;n là gì?	<br>\r\nA. Number, String, Boolean	          <br>B. Null, Object\r\n<br>C. Array, Function	                  <br>D. T&#7845;t c&#7843; các lo&#7841;i trên', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '13'),
(14, '3:36:14 PM', '11/11/2023', NULL, 'Ph&#432;&#417;ng th&#7913;c vi&#7871;t ch&#432;&#417;ng trình c&#7911;a Javascript nh&#432; th&#7871; nào?<br>\r\nA. Vi&#7871;t riêng m&#7897;t trang	<br>B. Vi&#7871;t chung v&#7899;i HTML	\r\n<br>C. C&#7843; 2 d&#7841;ng A và B	        <br>DKhông có d&#7841;ng nào', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '14'),
(15, '3:36:14 PM', '11/11/2023', NULL, 'Trong Javascript hàm parseInt() dùng &#273;&#7875; làm gì?	<br>\r\nA. Chuy&#7875;n m&#7897;t chu&#7895;i thành s&#7889;	        <br>B. Chuy&#7875;n m&#7897;t chu&#7895;i thành s&#7889; nguyên	\r\n<br>C. Chuy&#7875;n m&#7897;t chu&#7895;i thành s&#7889; th&#7921;c	<br>D. Chuy&#7875;n m&#7897;t s&#7889; nguyên thành m&#7897;t chu&#7895;I', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '15'),
(16, '3:36:14 PM', '11/11/2023', NULL, 'Trong Javascript s&#7921; ki&#7879;n Onload th&#7921;c hi&#7879;n khi?	<br>\r\nA. Khi b&#7855;t &#273;&#7847;u ch&#432;&#417;ng trình ch&#7841;y	        <br>B. Khi click chu&#7897;t	\r\n<br>C. Khi k&#7871;t thúc m&#7897;t ch&#432;&#417;ng trình	        <br>D. Khi di chuy&#7875;n chu&#7897;t qua', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '16'),
(17, '3:36:14 PM', '11/11/2023', NULL, 'Trong Javascript s&#7921; ki&#7879;n OnUnload th&#7921;c hi&#7879;n khi nào?	<br>\r\nA. Khi b&#7855;t &#273;&#7847;u ch&#432;&#417;ng trình ch&#7841;y	       <br>B. Khi click chu&#7897;t	\r\n<br>C. Khi k&#7871;t thúc m&#7897;t ch&#432;&#417;ng trình	       <br>D. Khi di chuy&#7875;n chu&#7897;t qua', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '17'),
(18, '3:36:14 PM', '11/11/2023', NULL, 'Trong Javascript s&#7921; ki&#7879;n OnMouseOver th&#7921;c hi&#7879;n khi nào?	<br>\r\nA. Khi m&#7897;t &#273;&#7889;i t&#432;&#7907;ng trong form m&#7845;t focus	                     <br>B. Khi m&#7897;t &#273;&#7889;i t&#432;&#7907;ng trong form có focus	\r\n<br>C. Khi di chuy&#7875;n con chu&#7897;t qua m&#7897;t &#273;&#7889;i t&#432;&#7907;ng trong form    <br>D. Khi click chu&#7897;t vào nút l&#7879;nh', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '18'),
(19, '5:46:21 PM', '11/11/2023', NULL, 'Trong Javascript, &#273;o&#7841;n mã\r\nsau cho ra k&#7871;t qu&#7843; gì?<br>&nbsp;\r\n&lt; script &gt;<br>\r\nfunction kiemtra() {<br>\r\nwindow.open(&quot;&quot;http://www.vnn.vn&quot;&quot;,&quot;&quot;Chao&quot;&quot;);<br>\r\n}<br>\r\n&lt; / script &gt;\r\n<br>\r\n&lt; head &gt;<br>\r\n&lt; body onload=&quot;&quot;kiemtra()&quot;&quot; &gt;&lt; /body &gt;<br>\r\n&lt; /head &gt;.&nbsp; <br>A.Khi ch&#7841;y thì m&#7897;t trang khác (VNN)\r\n&#273;&#432;&#7907;c hi&#7879;n ra <br>B. Không ch&#7841;y &#273;&#432;&#7907;c vì\r\n&#273;&#7873; sai <br>C. Khi k&#7871;t thúc thì m&#7897;t site khác hi&#7879;n ra<br>\r\nD. Hi&#7879;n m&#7897;t trang vnn duy nh&#7845;t.', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '19'),
(20, '5:46:21 PM', '11/11/2023', NULL, 'Trong Javascript s&#7921; ki&#7879;n Onclick th&#7921;c hi&#7879;n khi nào?	<br>\r\nA. Khi m&#7897;t &#273;&#7889;i t&#432;&#7907;ng trong form m&#7845;t focus	                <br>B. Khi m&#7897;t &#273;&#7889;i t&#432;&#7907;ng trong form có focus	\r\n<br>C. Khi click con chu&#7897;t qua m&#7897;t &#273;&#7889;i t&#432;&#7907;ng trong form	<br>D. Khi click chu&#7897;t vào nút l&#7879;nh', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '20'),
(21, '5:46:21 PM', '11/11/2023', NULL, 'L&#7879;nh l&#7863;p for có d&#7841;ng nh&#432; th&#7871; nào?	<br>\r\nA. For (bi&#7871;n = giá tr&#7883; &#273;&#7847;u, &#273;i&#7873;u ki&#7879;n, giá tr&#7883; t&#259;ng)	<br>B. For (bi&#7871;n = giá tr&#7883; &#273;&#7847;u, giá tr&#7883; t&#259;ng, &#273;i&#7873;u ki&#7879;n)	<br>C. For (bi&#7871;n = &#273;i&#7873;u ki&#7879;n, giá tr&#7883; t&#259;ng, giá tr&#7883; cu&#7889;i)	<br>D. T&#7845;t c&#7843; các d&#7841;ng trên', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '21'),
(22, '5:46:21 PM', '11/11/2023', NULL, 'Vòng l&#7863;p (Do…while) là d&#7841;ng vòng l&#7863;p?	<br>\r\nA. Không xác &#273;&#7883;nh và xét &#273;i&#7873;u ki&#7879;n r&#7891;i m&#7899;i l&#7863;p	<br>B. Không xác &#273;&#7883;nh và l&#7863;p r&#7891;i m&#7899;i xét &#273;i&#7873;u ki&#7879;n	<br>C. C&#7843; 2 d&#7841;ng trên	                                        <br>D. Không t&#7891;n t&#7841;i d&#7841;ng nào &#7903; trên', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '22'),
(23, '8:02:32 PM', '11/11/2023', NULL, 'Trong Javascript hàm parseFloat() dùng &#273;&#7875; làm gì?	<br>\r\nA. Chuy&#7875;n m&#7897;t chu&#7895;i thành s&#7889;	        <br>B. Chuy&#7875;n m&#7897;t chu&#7895;i thành s&#7889; th&#7921;c	\r\n<br>C. Chuy&#7875;n m&#7897;t chu&#7895;i thành s&#7889; nguyên	<br>D. Chuy&#7875;n m&#7897;t s&#7889; th&#7921;c thành m&#7897;t chu&#7895;i', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '23'),
(24, '8:02:32 PM', '11/11/2023', NULL, 'L&#7879;nh break k&#7871;t h&#7907;p v&#7899;i vòng for dùng &#273;&#7875;?	<br>\r\nA. Ng&#432;ng vòng for n&#7871;u g&#7863;p l&#7879;nh này	<br>B. Không có ý ngh&#297;a trong vòng l&#7863;p	\r\n<br>C. Nh&#7843;y &#273;&#7871;n m&#7897;t t&#7853;p l&#7879;nh khác	        <br>D. Không th&#7875; k&#7871;t h&#7907;p &#273;&#432;&#7907;c', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '24'),
(25, '8:02:32 PM', '11/11/2023', NULL, '&#272;o&#7841;n code sau &#273;&#432;&#7907;c vi&#7871;t trong trang web c&#7911;a b&#7841;n. Chuy&#7879;n gì x&#7843;y ra n&#7871;u user vào xem lúc 5 gi&#7901; chi&#7873;u?<br>\r\n   &lt;script&gt;<br>\r\n      var d = new Date();<br>\r\n      if (d.getHours() &lt; 12)<br>\r\n         document.getElementById(&quot;chao&quot;).innerHTML = &quot;&lt;b&gt;Hôm nay c&#7889; g&#7855;ng nhé&lt;/b&gt;&quot;;<br>\r\n      else<br>\r\n         document.getElementById(&quot;chao&quot;).innerHTML = &quot;&lt;i&gt; Chi&#7873;u nay b&#7841;n th&#7871; nào?&lt;/i&gt;&quot;;<br>\r\n   &lt;/script&gt;<br>\r\n<br>\r\nA. Code b&#7883; l&#7895;i<br>\r\nB. User s&#7869; th&#7845;y l&#7901;i chào v&#7899;i ch&#7919; &#273;&#7853;m: Hôm nay c&#7889; g&#7855;ng nhé<br>\r\nC. User s&#7869; th&#7845;y l&#7901;i chào v&#7899;i ch&#7919; &#273;&#7853;m: Chi&#7873;u nay b&#7841;n th&#7871; nào?<br>\r\nD. User s&#7869; th&#7845;y l&#7901;i chào v&#7899;i ch&#7919; nghiêng: Chi&#7873;u nay b&#7841;n th&#7871; nào?', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '25'),
(26, '8:02:32 PM', '11/11/2023', NULL, 'Trong Javascript s&#7921; ki&#7879;n Onchange x&#7843;y ra khi nào trong các tr&#432;&#7901;ng h&#7907;p sau:	<br>\r\nA. Khi m&#7897;t &#273;&#7889;i t&#432;&#7907;ng trong form m&#7845;t focus	<br>\r\nB. Khi click chu&#7897;t vào nút l&#7879;nh	<br>\r\nC. X&#7843;y ra khi giá tr&#7883; c&#7911;a m&#7897;t tr&#432;&#7901;ng trong form &#273;&#432;&#7907;c ng&#432;&#7901;i dùng thay &#273;&#7893;i d&#7919; li&#7879;u	<br>\r\nD. Khi m&#7897;t &#273;&#7889;i t&#432;&#7907;ng trong form nh&#7853;n focus', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '26'),
(27, '8:02:32 PM', '11/11/2023', NULL, 'Làm cách nào &#273;&#7875; g&#7885;i m&#7897;t hàm myFunction trong Javascript?	<br>\r\nA. call function myFunction()	<br>B. call myFunction()	\r\n<br>C. myFunction()	                        <br>D. C&#7843; A, B, C &#273;&#7873;u &#273;úng', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '27'),
(28, '8:02:32 PM', '11/11/2023', NULL, 'N&#417;i b&#7841;n có th&#7875; &#273;&#7863;t code Javascript trong trang web?	<br>\r\nA. Có th&#7875; &#273;&#7863;t trong ph&#7847;n &lt;head&gt; ho&#7863;c &lt;body&gt;	<br>\r\nB. Ch&#7881; trong ph&#7847;n &lt;head&gt;	<br>\r\nC. Ch&#7881; trong ph&#7847;n &lt;body&gt;', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '28'),
(29, '8:02:32 PM', '11/11/2023', NULL, 'Câu l&#7879;nh nào &#273;úng th&#7921;c hi&#7879;n vi&#7879;c g&#7885;i m&#7897;t script t&#7915; bên ngoài có tên là script.js?	<br>\r\nA. &lt;script src=&quot;script.js&quot;&gt; &lt;/script&gt;	<br>\r\nB. &lt;script name=&quot;script.js&quot;&gt; &lt;/script&gt;	<br>\r\nC. &lt;script href=&quot;script.js&quot;&gt; &lt;/script&gt;', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '29'),
(30, '8:02:32 PM', '11/11/2023', NULL, '&#272;&#7875; khai báo m&#7843;ng trong Javascript ta dùng ký hi&#7879;u?	<br>\r\nA. ( )	                           <br>B. [( )]	\r\n<br>C. { }	                   <br>D. [ ]', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '30'),
(31, '8:02:32 PM', '11/11/2023', NULL, 'Làm cách nào có th&#7875; bi&#7871;t &#273;&#432;&#7907;c trình duy&#7879;t &#273;ang &#273;&#432;&#7907;c s&#7917; d&#7909;ng t&#7841;i máy client?	<br>\r\nA. browser.name	<br>\r\nB. client.navName	<br>\r\nC. navigator.appName', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '31'),
(32, '8:02:32 PM', '11/11/2023', NULL, 'S&#7921; ki&#7879;n nào x&#7843;y ra khi ng&#432;&#7901;i dùng click vào m&#7897;t ph&#7847;n t&#7917; HTML trên trang?	<br>\r\nA. onclick	                   <br>B. onmouseover	\r\n<br>C. onchange	           <br>D. onmouseclick', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '32'),
(33, '8:02:32 PM', '11/11/2023', NULL, 'Câu l&#7879;nh nào khai báo m&#7897;t bi&#7871;n trong Javascript?	<br>\r\nA. v carName;	<br>\r\nB. var carName;	<br>\r\nC. variable carName;', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '33'),
(34, '8:02:32 PM', '11/11/2023', NULL, 'Ngôn ng&#7919; Javascript có phân bi&#7879;t ch&#7919; hoa ch&#7919; th&#432;&#7901;ng không?	<br>\r\nA.Có	<br>\r\nB. Không', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '34'),
(35, '6:42:22 PM', '11/11/2023', NULL, 'Trong Javascript s&#7921; ki&#7879;n Onblur th&#7921;c hi&#7879;n khi nào?	<br>\r\nA. Khi m&#7897;t &#273;&#7889;i t&#432;&#7907;ng trong form m&#7845;t focus	    <br>B. Khi m&#7897;t &#273;&#7889;i t&#432;&#7907;ng trong form có focus	\r\n<br>C. Khi di chuy&#7875;n con chu&#7897;t qua form	            <br>D. Khi click chu&#7897;t vào nút l&#7879;nh', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '35'),
(36, '6:42:22 PM', '11/11/2023', NULL, 'Cách vi&#7871;t câu l&#7879;nh IF nào sau &#273;ây là &#273;úng?	<br>\r\nA. if i = 5 then	             <br>B. if (i == 5)	\r\n<br>C. if i == 5 then	             <br>D. if i = 5', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '36'),
(37, '6:42:22 PM', '11/11/2023', NULL, 'Cách nào &#273;&#7875; làm tròn 7.25 t&#7899;i s&#7889; nguyên g&#7847;n nh&#7845;t trong Javascript?	<br>\r\nA. rnd(7.25)	           <br>B. round(7.25)	\r\n<br>C. Math.round(7.25)	   <br>D. Math.rnd(7.25)', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '37'),
(38, '6:42:22 PM', '11/11/2023', NULL, 'Phát bi&#7875;u nào sau &#273;ây &#273;úng?	<br>\r\nA. Javascript là m&#7897;t trong ba k&#7929; thu&#7853;t c&#417; b&#7843;n &#273;&#7875; t&#7841;o nên trang web	<br>\r\nB. Javascript là ngôn ng&#7919; l&#7853;p trình, giúp vi&#7871;t code trong trang web &#273;&#7875; th&#7921;c hi&#7879;n tính toán, x&#7917; lý n&#7897;i dung và &#273;&#7883;nh d&#7841;ng trang web	<br>\r\nC. HTML giúp b&#7889; trí thông tin, CSS giúp &#273;&#7883;nh d&#7841;ng thông tin, Javascript giúp tính toán và t&#7841;o hành &#273;&#7897;ng theo tình hu&#7889;ng	<br>\r\nD. T&#7845;t c&#7843; &#273;&#7873;u &#273;úng', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '38'),
(39, '6:42:22 PM', '11/11/2023', NULL, 'M&#7909;c &#273;ích c&#7911;a Javascript	<br>\r\nA. Javascript &#273;&#432;&#7907;c t&#7841;o ra v&#7899;i m&#7909;c &#273;ích x&#7917; lý các tác v&#7909; phía Client	<br>\r\nB. Javascript &#273;&#432;&#7907;c t&#7841;o ra v&#7899;i m&#7909;c &#273;ích t&#7841;o nên tính t&#432;&#417;ng tác cho trang web	<br>\r\nC. Hai phát bi&#7875;u &#273;&#7873;u &#273;úng	<br>\r\nD. Hai phát bi&#7875;u &#273;&#7873;u sai', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '39'),
(40, '8:02:32 PM', '11/11/2023', NULL, 'Javascript có th&#7875; làm gì trong trang web?	<br>\r\nA. T&#7841;o menu x&#7893; xu&#7889;ng (menu con) trong thanh menu	<br>\r\nB. T&#7841;o các hi&#7879;u &#7913;ng trong trang web nh&#432; slide show, carousel tab,...	<br>\r\nC. &#7848;n hi&#7879;n hình, &#273;&#7893;i hình khi &#273;&#432;a chu&#7897;t vào	<br>\r\nD. Ba phát bi&#7875;u trên &#273;&#7873;u &#273;úng', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '40'),
(41, '6:42:22 PM', '11/11/2023', NULL, 'Javascript là ngôn ng&#7919; k&#7883;ch b&#7843;n có d&#7845;u &#273;&#432;&#7907;c mã ngu&#7891;n không?<br>\r\nA. Không d&#7845;u &#273;&#432;&#7907;c vì các k&#7883;ch b&#7843;n ch&#7841;y &#7903; client	<br>\r\nB. D&#7845;u &#273;&#432;&#7907;c vì ch&#432;&#417;ng trình ho&#7841;t &#273;&#7897;ng &#273;&#7897;c l&#7853;p v&#7899;i trình duy&#7879;t	<br>\r\nC. Hai phát bi&#7875;u &#273;&#7873;u sai	<br>\r\nD. Hai phát bi&#7875;u &#273;&#7873;u &#273;úng', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '41'),
(42, '6:42:22 PM', '11/11/2023', NULL, 'Vòng l&#7863;p While là d&#7841;ng vòng l&#7863;p?	<br>\r\nA. Không xác &#273;&#7883;nh và xét &#273;i&#7873;u ki&#7879;n r&#7891;i m&#7899;i l&#7863;p	<br>B. Không xác &#273;&#7883;nh và l&#7863;p r&#7891;i m&#7899;i xét &#273;i&#7873;u ki&#7879;n	<br>C. C&#7843; 2 d&#7841;ng trên	                                        <br>D. Không t&#7891;n t&#7841;i d&#7841;ng nào &#7903; trên', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '42'),
(43, '8:34:50 PM', '11/11/2023', NULL, 'Cách khai b&#7843;o m&#7843;ng nào trong Javascript là &#273;úng?	<br>\r\nA. var colors = 1 = (&quot;red&quot;), 2 = (&quot;green&quot;), 3 = (&quot;blue&quot;)	<br>\r\nB. var colors = [&quot;red&quot;, &quot;green&quot;, &quot;blue&quot;]	<br>\r\nC. var colors = (1:&quot;red&quot;, 2:&quot;green&quot;, 3:&quot;blue&quot;)	<br>\r\nD. var colors = &quot;red&quot;, &quot;green&quot;, &quot;blue&quot;', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '43'),
(44, '8:34:50 PM', '11/11/2023', NULL, 'Cách nào &#273;&#7875; thêm m&#7897;t comment nhi&#7873;u dòng trong Javascript?	<br>\r\nA. /* … */	        <br>B. // … //	 <br>C. &lt;!...--&gt;   <br>D. C&#7843; A, B, C &#273;&#7873;u &#273;úng', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '44'),
(45, '8:02:32 PM', '11/11/2023', NULL, 'Cách nào t&#7841;o m&#7897;t hàm trong Javascript	<br>\r\nA. function:myFunction()	<br>B. function = myFunction()	\r\n<br>C. function myFunction()	<br>D. C&#7843; A, B, C &#273;&#7873;u &#273;úng', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '45'),
(46, '8:34:50 PM', '11/11/2023', NULL, 'Trong Javascript s&#7921; ki&#7879;n OnMouseOver x&#7843;y ra khi nào trong các tr&#432;&#7901;ng h&#7907;p sau:	<br>\r\nA. Khi di chuy&#7875;n con chu&#7897;t qua m&#7897;t &#273;&#7889;i t&#432;&#7907;ng trong form	<br>\r\nB. Khi m&#7897;t &#273;&#7889;i t&#432;&#7907;ng trong form nh&#7853;n focus	<br>\r\nC. Khi m&#7897;t &#273;&#7889;i t&#432;&#7907;ng trong form m&#7845;t focus	<br>\r\nD. Khi click chu&#7897;t vào nút l&#7879;nh', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '46'),
(47, '8:34:50 PM', '11/11/2023', NULL, 'Hàm getElementsByTagName giúp làm gì<br>\r\n   &lt;span class=&quot;txt&quot; name=&quot;lk&quot;&gt; H&#7885;c mi&#7879;t mài&lt;/span&gt; &lt;br&gt;<br>\r\n   &lt;span class=&quot;txt&quot; name=&quot;lk&quot;&gt; Ng&#7891;i ng&#7851;m l&#7841;i ho&#7841;t &#273;&#7897;ng c&#7911;a các ch&#7913;c m&#7899;i th&#7921;c t&#7853;p&lt;/span&gt; &lt;br&gt;<br>\r\n   &lt;span class=&quot;txt&quot; name=&quot;lk&quot;&gt; Mu&#7889;n gi&#7887;i: m&#7891; hôi &#273;&#7893;&lt;/span&gt; &lt;br&gt;<br>\r\n   &lt;span class=&quot;txt&quot; name=&quot;lk&quot;&gt; Nên h&#7885;c nhóm&lt;/span&gt; &lt;br&gt;<br>\r\n   &lt;script&gt;<br>\r\n      var arr = document.getElementsByTagName(\'span\');<br>\r\n   &lt;/script&gt;<br>\r\n<br>\r\nA. Ch&#7885;n 1 node trong DOM theo tag ch&#7881; ra. Ví d&#7909; img, a<br>\r\nB. Ch&#7885;n các node trong DOM theo class css c&#7911;a nó<br>\r\nC. Ch&#7885;n các node trong DOM theo class css<br>\r\nD. Ch&#7885;n các node trong DOM có tag t&#432;&#417;ng &#7913;ng', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '47'),
(48, '8:34:50 PM', '11/11/2023', NULL, 'Hàm getElementsByClassName là gì?<br>\r\n   &lt;span class=&quot;txt&quot; name=&quot;lk&quot;&gt; H&#7885;c mi&#7879;t mài&lt;/span&gt; &lt;br&gt;<br>\r\n   &lt;span class=&quot;txt&quot; name=&quot;lk&quot;&gt; Ng&#7891;i ng&#7851;m l&#7841;i ho&#7841;t &#273;&#7897;ng c&#7911;a các ch&#7913;c m&#7899;i th&#7921;c t&#7853;p&lt;/span&gt; &lt;br&gt;<br>\r\n   &lt;span class=&quot;txt&quot; name=&quot;lk&quot;&gt; Mu&#7889;n gi&#7887;i: m&#7891; hôi &#273;&#7893;&lt;/span&gt; &lt;br&gt;<br>\r\n   &lt;span class=&quot;txt&quot; name=&quot;lk&quot;&gt; Nên h&#7885;c nhóm&lt;/span&gt; &lt;br&gt;<br>\r\n   &lt;script&gt;<br>\r\n      var arr = document.getElementsByClassName(\'txt\');<br>\r\n   &lt;/script&gt;<br>\r\n<br>\r\nA. Giúp ch&#7885;n các node theo tag name<br>\r\nB. Giúp ch&#7885;n các node theo id<br>\r\nC. Giúp ch&#7885;n các node theo class css<br>\r\nD. Giúp ch&#7885;n các node theo name', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '48'),
(49, '8:34:50 PM', '11/11/2023', NULL, 'Javascript là ngôn ng&#7919; k&#7883;ch b&#7843;n có d&#7845;u &#273;&#432;&#7907;c mã ngu&#7891;n không?<br>\r\nA. Không d&#7845;u &#273;&#432;&#7907;c vì các k&#7883;ch b&#7843;n ch&#7841;y &#7903; client	<br>\r\nB. D&#7845;u &#273;&#432;&#7907;c vì ch&#432;&#417;ng trình ho&#7841;t &#273;&#7897;ng &#273;&#7897;c l&#7853;p v&#7899;i trình duy&#7879;t	<br>\r\nC. Hai phát bi&#7875;u &#273;&#7873;u sai	<br>\r\nD. Hai phát bi&#7875;u &#273;&#7873;u &#273;úng', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '49'),
(50, '8:02:32 PM', '11/11/2023', NULL, 'Ngôn ng&#7919; k&#7883;ch b&#7843;n Javascript g&#7847;n gi&#7889;ng v&#7899;i ngôn ng&#7919; nào sau &#273;ây?<br>\r\nA. Pascal<br>\r\nB. Visual Basic<br>\r\nC. C++<br>\r\nD. Foxpro', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '50'),
(51, '8:34:50 PM', '11/11/2023', NULL, '&#272;&#7875; ki&#7875;m tra user có ch&#7885;n h&#7885;c k&#7923; nào không. L&#7879;nh nào b&#7841;n s&#7869; ch&#7885;n &#273;&#7875; &#273;&#7863;t &#7903; v&#7883; trí zzz<br>\r\n   &lt;form name=&quot;frm&quot; onsubmit=&quot;return kiemtra()&quot;&gt;<br>\r\n      B&#7841;n &#273;ang &#7903; h&#7885;c k&#7923; nào:&lt;br&gt;<br>\r\n      &lt;input type=&quot;radio&quot; value=&quot;1&quot; name=&quot;hk&quot;/&gt; HK 1&lt;br&gt;<br>\r\n      &lt;input type=&quot;radio&quot; value=&quot;2&quot; name=&quot;hk&quot; /&gt;HK 2&lt;br&gt;<br>\r\n      &lt;input type=&quot;radio&quot; value=&quot;3&quot; name=&quot;hk&quot; /&gt;HK 3&lt;br&gt; <br>\r\n      &lt;button type=&quot;submit&quot;&gt;Send&lt;/button&gt;<br>\r\n   &lt;/form&gt;<br>\r\n   &lt;script&gt;<br>\r\n      function kiemtra(){   <br>\r\n         if (zzz) {\r\n            alert(&quot;Ch&#7885;n h&#7885;c k&#7923; &#273;i nhé&quot;);<br>\r\n           return false;<br>\r\n         }<br>\r\n      return true;<br>\r\n      }<br>\r\n   &lt;/script&gt;<br>\r\n<br>\r\nA. document.frm.hk.checked==false<br>\r\nB. document.frm.hk.checked==true<br>\r\nC. document.frm.hk.length==0<br>\r\nD. document.frm.hk.value==0', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '51'),
(52, '8:34:50 PM', '11/11/2023', NULL, 'Có nh&#7919;ng cách nào vi&#7871;t code Javascript &#273;&#7875; ch&#7841;y trong trang web?<br>\r\n\r\nA. Vi&#7871;t chung v&#7899;i HTML<br>\r\nB. Không thu&#7897;c d&#7841;ng nào<br>\r\nC. C&#7843; hai d&#7841;ng vi&#7871;t t&#7879;p riêng ho&#7863;c vi&#7871;t trong trang HTML<br>\r\nD. Vi&#7871;t trên m&#7897;t t&#7879;p riêng', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '52'),
(53, '8:34:50 PM', '11/11/2023', NULL, 'Hàm prompt() trong Javascript dùng &#273;&#7875; làm gì?<br>\r\n\r\nA. Hi&#7875;n th&#7883; thông báo nh&#7853;p thông tin<br>\r\nB. Hi&#7875;n th&#7883; m&#7897;t thông báo YES/NO<br>\r\nC. C&#7843; 2 d&#7841;ng trên<br>\r\nD. Không ph&#432;&#417;ng án nào &#273;úng', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '53'),
(54, '7:13:13 PM', '11/10/2023', NULL, 'Javascript có th&#7875; làm gì trong trang web?<br>\r\n\r\nA. Javascript dùng &#273;&#7875; vi&#7871;t game trong trang web<br>\r\nB. Ki&#7875;m tra h&#7907;p l&#7879; d&#7919; li&#7879;u trong form<br>\r\nC. Giúp &#273;&#7893;i n&#7897;i dung trang, &#273;&#7883;nh d&#7841;ng c&#7911;a trang<br>\r\nD. Các &#273;áp án trên &#273;&#7873;u &#273;úng', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '54'),
(55, '7:13:13 PM', '11/10/2023', NULL, 'Công c&#7909; vi&#7871;t code Javascript là?<br>\r\n\r\nA. Notepad++<br>\r\nB. Visual Studio Code<br>\r\nC. Sublime<br>\r\nD. T&#7845;t c&#7843; ch&#432;&#417;ng trình trên', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '55'),
(56, '7:13:13 PM', '11/10/2023', NULL, 'Ch&#7885;n l&#7879;nh Javascript dùng &#273;&#7875; xu&#7845;t trang web giá tr&#7883; bi&#7871;n x<br>\r\n\r\nA. document.getElementById(&amp;quot;kq&amp;quot;.innerHTML = x; <br>\r\nB. windows.write(x); <br>\r\nC. console.write(x); <br>\r\nD. document.write(x);', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '56'),
(57, '7:13:13 PM', '11/10/2023', NULL, '&#272;o&#7841;n code sau s&#7869; cho ra k&#7871;t qu&#7843; bao nhiêu n&#7871;u nh&#7853;p l&#7847;n l&#432;&#7907;t 20 và 18?<br>\r\n   &lt;script&gt;<br>\r\n      var xx = prompt(&quot;B&#7841;n bao nhiêu tu&#7893;i v&#7853;y?&quot;);<br>\r\n      var xy = prompt(&quot;Còn ng&#432;&#7901;i yêu b&#7841;n bao nhiêu tu&#7893;i?&quot;);<br>\r\n      var tong = xx + yy;<br>\r\n      alert(tong);<br>\r\n   &lt;/script&gt;<br>\r\nA. 38 <br>\r\nB. 2018 <br>\r\nC. L&#7895;i <br>\r\nD. 1820', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '57'),
(58, '7:13:13 PM', '11/10/2023', NULL, 'Ch&#7885;n phát bi&#7875;u &#273;úng\r\n   &lt;script&gt;<br>\r\n      var qt = [&quot;Nhân&quot;, &quot;L&#7877;&quot;, &quot;Ngh&#297;a&quot;, &quot;Trí&quot;, &quot;Tín&quot;];<br>\r\n      for (var i = 0; i &lt; qt.length; i++)<br>\r\n         document.write(&quot;&lt;p&gt;&quot; + qt[i] + &quot;&lt;/p&gt;&quot;);<br>\r\n      document.write(&quot;&lt;hr&gt;&quot;);<br>\r\n   &lt;/script&gt;<br>\r\nA. L&#7863;p qua m&#7843;ng, m&#7895;i ph&#7847;n t&#7917; &#273;&#7863;t trong tag p và hr<br>\r\nB. L&#7863;p bi&#7871;n i, hi&#7879;n m&#7895;i ph&#7847;n t&#7917; c&#7911;a i trong tag p<br>\r\nC. Code l&#7895;i cú pháp<br>\r\nD. L&#7863;p qua m&#7843;ng qt, m&#7895;i ph&#7847;n t&#7917; &#273;&#7863;t trong tag p, k&#7871;t thúc l&#7863;p xu&#7845;t ra tag hr', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '58'),
(59, '7:13:13 PM', '11/10/2023', NULL, '&#272;o&#7841;n code sau s&#7869; cho ra k&#7871;t qu&#7843; bao nhiêu n&#7871;u nh&#7853;p l&#7847;n l&#432;&#7907;t 19 và 20?<br>\r\n   var ny1 = prompt(&quot;B&#7841;n bao nhiêu tu&#7893;i v&#7853;y?&quot;);<br>\r\n   var ny2 = prompt(&quot;Còn ng&#432;&#7901;i yêu b&#7841;n bao nhiêu tu&#7893;i?&quot;);<br>\r\n   var tong = ny1 + ny2;<br>\r\n   alert(tong);<br>\r\nA. 1920 <br>\r\nB. 39 <br>\r\nC. L&#7895;i <br>\r\nD. 0', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '59'),
(60, '6:14:40 PM', '11/11/2023', NULL, 'Phát bi&#7875;u nào &#273;úng v&#7873; &#273;o&#7841;n code sau:<br>\r\n   &lt;script&gt;<br>\r\n      heSoA = Math.round(Math.random()*100);<br>\r\n   &lt;/script&gt;<br>\r\n   \r\nA. Code sai cú pháp <br>\r\nB. T&#7841;o ra 1 chu&#7895;i s&#7889; nguyên ng&#7851;u nhiên t&#7915; 0 &#273;&#7871;n 100 <br>\r\nC. T&#7841;o ra 1 chu&#7895;i ng&#7851;u nhiên dài t&#7889;i &#273;a 100 ký t&#7921; <br>\r\nD. Bi&#7871;n heSoA s&#7869; có giá tr&#7883; là 100', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '60'),
(61, '6:14:40 PM', '11/11/2023', NULL, 'K&#7871;t qu&#7843; c&#7911;a l&#7879;nh console.log cho b&#7841;n k&#7871;t qu&#7843; nh&#432; th&#7871; nào?<br>\r\n   &lt;script&gt;<br>\r\n      var dt = [&quot;Chân thành&quot;, &quot;Nh&#432;&#7901;ng nh&#7883;n&quot;];<br>\r\n      dt[2] = &quot;Khiêm t&#7889;n&quot;;<br>\r\n      dt.push(&quot;M&#7841;nh m&#7869;&quot;);<br>\r\n      console.log(dt, dt.length);<br>\r\n   &lt;/script&gt;<br>\r\n   \r\nA. [&quot;Chân thành&quot;, &quot;Nh&#432;&#7901;ng nh&#7883;n&quot;] <br>\r\nB. [&quot;Chân thành&quot;, &quot;Nh&#432;&#7901;ng nh&#7883;n&quot;, &quot;Khiêm t&#7889;n&quot;, &quot;M&#7841;nh m&#7869;&quot;] 4 <br>\r\nC. M&#7841;nh m&#7869; <br>\r\nD. L&#7895;i', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '61'),
(62, '6:14:40 PM', '11/11/2023', NULL, 'Phát bi&#7875;u nào &#273;úng v&#7873; &#273;o&#7841;n code sau: <br>\r\n   &lt;script&gt;<br>\r\n      n = 1;<br>\r\n      while (n &lt;= 31) {<br>\r\n         document.write(&quot;Ngày &quot; + n + &quot;&quot;);<br>\r\n         n++<br>\r\n      }<br>\r\n   &lt;/script&gt;<br>\r\n   \r\nA. Code &#273;úng và hi&#7879;n các ngày c&#7911;a tháng t&#7915; 1 &#273;&#7871;n 31 trong tag select <br>\r\nB. Code l&#7895;i do bi&#7871;n n ch&#432;a khai báo<br>\r\nC. Code hi&#7879;n các ngày c&#7911;a tháng t&#7915; 1 &#273;&#7871;n 30 trong tag select<br>\r\nD. Code l&#7895;i do javascript không vi&#7871;t trong tag select &#273;&#432;&#7907;c', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '62'),
(63, '6:14:40 PM', '11/11/2023', NULL, '&#272;o&#7841;n code sau làm gì? <br>\r\n   &lt;script&gt;<br>\r\n      var x = 0;<br>\r\n      do {<br>\r\n         a = prompt(&quot;Nh&#7853;p giá tr&#7883; bi&#7871;n a &#273;i b&#7891;&quot;);<br>\r\n      } while (isNaN(a) == true || a &lt; 0 || a &gt; 10);<br>\r\n   &lt;/script&gt;<br>\r\n   \r\nA.  B&#7855;t bu&#7897;c nh&#7853;p cho &#273;&#7871;n khi a ph&#7843;i là s&#7889; và giá tr&#7883; c&#7911;a a ph&#7843;i t&#7915; 0 &#273;&#7871;n 10<br>\r\nB. &#272;o&#7841;n code có l&#7895;i<br>\r\nC. B&#7855;t bu&#7897;c nh&#7853;p a ph&#7843;i là ch&#7919;<br>\r\nD. B&#7855;t bu&#7897;c nh&#7853;p bi&#7871;n x là s&#7889;, giá tr&#7883; nh&#7853;p t&#7915; 0 &#273;&#7871;n 10', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '63'),
(64, '6:14:40 PM', '11/11/2023', NULL, '&#272;o&#7841;n code d&#432;&#7899;i &#273;ây làm gì? <br>\r\n   &lt;h1 id=&quot;so&quot;&gt;&lt;/h1&gt;<br>\r\n   &lt;script&gt;<br>\r\n      dh = setInterval(&quot;hienso()&quot;, 2000);    <br>\r\n      function hienso(){        <br>\r\n         n = Math.round(Math.random()*31);<br>\r\n         document.getElementById(\'so\').innerText= n;        <br>\r\n      }<br>\r\n   &lt;/script&gt;<br>\r\n<br>\r\n   \r\nA.  Hi&#7879;n 1 l&#7847;n m&#7897;t giá tr&#7883; ng&#7851;u nhiên t&#7915; 0 &#273;&#7871;n 31 r&#7891;i d&#7915;ng l&#7841;i không hi&#7879;n n&#7919;a<br>\r\nB. Code l&#7895;i, không ch&#7841;y &#273;&#432;&#7907;c<br>\r\nC. &#272;&#7883;nh k&#7923; c&#7913; 2 giây hi&#7879;n 1 s&#7889; nguyên ng&#7851;u nhiên t&#7915; 0 &#273;&#7871;n 31<br>\r\nD. &#272;&#7883;nh k&#7923; c&#7913; 20 giây hi&#7879;n 1 s&#7889; ng&#7851;u nhiên t&#7915; 0 &#273;&#7871;n 31', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '64'),
(65, '6:14:40 PM', '11/11/2023', NULL, 'Phát bi&#7875;u nào sau &#273;ây &#273;úng?<br>\r\n   &lt;script&gt;<br>\r\n      setInterval(&quot;alert(\'&#272;&#7901;i vui l&#7855;m em có bi&#7871;t không?\')&quot;, 500)<br>\r\n   &lt;/script&gt;<br>\r\n   \r\nA.  Code l&#7895;i sai cú pháp<br>\r\nB. Code trên hi&#7879;n ra 500 l&#7847;n ch&#7919;: &#272;&#7901;i vui l&#7855;m em có bi&#7871;t không?<br>\r\nC. Code trên &#273;&#7907;i 500 miligiây và hi&#7879;n ra 1 l&#7847;n ch&#7919;: &#272;&#7901;i vui l&#7855;m em có bi&#7871;t không?<br>\r\nD. Code trên &#273;&#7883;nh k&#7923; n&#7917;a giây thì hi&#7879;n ra ch&#7919;: &#272;&#7901;i vui l&#7855;m em có bi&#7871;t không?', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '65'),
(66, '6:14:40 PM', '11/11/2023', NULL, 'Code sau làm gì?<br>\r\n   &lt;input value=&quot;Tu&#7893;i&quot; onblur=&quot;this.className=\'x\'&quot; onfocus=&quot;this.className=\'d\'&quot;&gt;<br>\r\n   &lt;style&gt;<br>\r\n      .x { background:blue; color: white;}<br>\r\n      .d { background:red; color: yellow;}<br>\r\n   &lt;/style&gt;<br>\r\n   \r\nA.  Khi nh&#7855;p chu&#7897;t vào thì ô Tu&#7893;i có n&#7873;n xanh ch&#7919; tr&#7855;ng còn khi nh&#7855;p ra ngoài thì ô tu&#7893;i s&#7869; có n&#7873;n &#273;&#7887; ch&#7919; vàng<br>\r\nB. Code sai không ch&#7841;y<br>\r\nC. Khi nh&#7855;p chu&#7897;t vào thì ô Tu&#7893;i có n&#7873;n &#273;&#7887; ch&#7919; vàng còn khi nh&#7855;p ra ngoài thì ô tu&#7893;i s&#7869; có n&#7873;n xanh ch&#7919; tr&#7855;ng<br>\r\nD. Khi nh&#7855;p &#273;úp chu&#7897;t vào thì ô Tu&#7893;i có n&#7873;n &#273;&#7887; ch&#7919; vàng', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '66'),
(67, '6:14:40 PM', '11/11/2023', NULL, 'L&#7879;nh nào dùng &#273;&#7875; t&#7841;o ra &#273;&#7889;i t&#432;&#7907;ng có 2 thu&#7897;c tính ho và ten<br>\r\nA. &lt;script&gt; var nv = [ ho:&quot;L&#7845;p La&quot;, ten: &quot;L&#7845;p Lánh&quot; ] &lt;/script&gt;<br>\r\nB. &lt;script&gt;  var nv = { ho:&quot;L&#7845;p La&quot;, ten: &quot;L&#7845;p Lánh&quot; } &lt;/script&gt;<br>\r\nC. &lt;script&gt; var nv = { ho=&quot;L&#7845;p La&quot; , ten= &quot;L&#7845;p Lánh&quot; } &lt;/script&gt;<br>\r\nD.&lt;script&gt; var nv = [&quot;L&#7845;p La&quot; , &quot;L&#7845;p Lánh&quot; ] &lt;/script&gt;<br>\r\n <br>  \r\nA.  D<br>\r\nB. B<br>\r\nC. A<br>\r\nD. C', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '67'),
(68, '6:14:40 PM', '11/11/2023', NULL, '&#272;&#7889;i t&#432;&#7907;ng trong javascript &#273;&#432;&#7907;c t&#7841;o ra &#273;&#7875; làm gì? <br>\r\n   \r\nA. C&#7843; 2 &#273;&#7873;u sai<br>\r\nB. &#272;&#7875; vi&#7879;c l&#7853;p trình thêm rõ ràng<br>\r\nC. C&#7843; 2 &#273;&#7873;u &#273;úng<br>\r\nD. &#272;&#7875; mô ph&#7887;ng các bi&#7871;n có nhi&#7873;u thông tin', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '68'),
(69, '6:14:40 PM', '11/11/2023', NULL, 'Nút nào b&#7841;n s&#7869; dùng khi mu&#7889;n có 1 nút b&#7845;m &#273;&#7875; in trang web?<br>\r\n   &lt;button type=&quot;button&quot; onclick=&quot;window.print&quot;&gt;In ra gi&#7845;y&lt;/button&gt;<br>\r\n   &lt;button type=&quot;button&quot; onclick=&quot;document.print()&quot;&gt;In trang web&lt;/button&gt;<br>\r\n   &lt;button type=&quot;button&quot; onclick=&quot;window.print()&quot;&gt;In &#7845;n&lt;/button&gt;<br>\r\n   &lt;button type=&quot;button&quot; onclick=&quot;print&quot;&gt;In trang này&lt;/button<br>\r\n   \r\nA. In ra gi&#7845;y<br>\r\nB. In trang này<br>\r\nC. In &#7845;n<br>\r\nD. In trang web', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '69'),
(70, '6:14:40 PM', '11/11/2023', NULL, 'Gi&#7843; s&#7917; l&#7879;nh sau &#273;&#432;&#7907;c thêm vào tag head c&#7911;a 1 trang web.<br>\r\n   &lt;script&gt; setTimeout(&quot;location.reload()&quot;, 1800000);&lt;/script&gt;<br>\r\n   \r\nA. L&#7879;nh l&#7895;i, không ch&#7841;y vì location không có hàm reload<br>\r\nB. Yêu c&#7847;u trình duy&#7879;t &#273;óng l&#7841;i sau 180 phút<br>\r\nC. Yêu c&#7847;u trình duy&#7879;t n&#7841;p l&#7841;i trang web 18 phút sau<br>\r\nD. Yêu c&#7847;u trình duy&#7879;t c&#7913; 30 phút sau khi n&#7841;p trang, s&#7869; n&#7841;p l&#7841;i chính trang web &#273;ó', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '70'),
(71, '2:34:28 PM', '11/11/2023', NULL, '&#272;&#7875; chèn thêm 1 ký t&#7921; l&#7841; trong Javascript, ví d&#7909; d&#7845;u &quot; ta vi&#7871;t theo cách nào?	</br>\r\nA. document.write(&quot; \\&quot;This text inside quotes.\\&quot; &quot;);</br>\r\nB. document.write(&quot; \\&quot;This text inside quotes.&quot;\\ &quot;);</br>\r\nC. document.write(&quot; \\This text inside quotes.\\ &quot;);</br>\r\nD. document.write(&quot;This text inside quotes.&quot;);', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '71'),
(72, '6:14:40 PM', '11/11/2023', NULL, 'C&#7847;n ki&#7875;m tra user có ch&#7885;n size nào không. B&#7841;n ch&#7885;n l&#7879;nh nào &#273;i&#7873;n vào v&#7883; trí zzz<br>\r\n   &lt;form name=&quot;frm&quot; onsubmit=&quot;return kiemtra()&quot;&gt; <br>\r\n      Ch&#7885;n size b&#7841;n nhé: <br>\r\n         &lt;input type=&quot;radio&quot; value=&quot;L&#7899;n&quot; name=&quot;co&quot;/&gt;L&#7899;n&lt;br&gt;<br>\r\n         &lt;input type=&quot;radio&quot; value=&quot;V&#7915;a&quot; name=&quot;co&quot; /&gt;V&#7915;a&lt;br&gt;<br>\r\n         &lt;input type=&quot;radio&quot; value=&quot;Nh&#7887;&quot; name=&quot;co&quot; /&gt;Nh&#7887;&lt;br&gt; <br>\r\n         &lt;button type=&quot;submit&quot;&gt;Send&lt;/button&gt;<br>\r\n   &lt;/form&gt;<br>\r\n   &lt;script&gt;<br>\r\n      function kiemtra(){<br>\r\n         if ( zzz ) {<br>\r\n           alert(&quot;Ch&#7885;n size &#273;i b&#7841;n &#417;i&quot;);<br>\r\n           return false;<br>\r\n         }<br>\r\n      return true;<br>\r\n      }<br>\r\n   &lt;/script&gt;<br>\r\n<br>\r\nA. document.getElementsByName(&quot;co&quot;)[0].checked==false  &&   document.getElementsByName(&quot;co&quot;)[1].checked==false &&    document.getElementsByName(&quot;co&quot;)[2].checked==false<br>\r\nB. document.getElementsByName(&quot;co&quot;)[0].checked==true &&   document.getElementsByName(&quot;co&quot;)[1].checked==true &&    document.getElementsByName(&quot;co&quot;)[2].checked==true<br>\r\nC. document.getElementsByName(&quot;co&quot;)[.checked==false<br>\r\nD. document.getElementsByName(&quot;co&quot;)[0].checked==false  ||   document.getElementsByName(&quot;co&quot;)[1].checked==false  ||   document.getElementsByName(&quot;co&quot;)[2].checked==false', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '72'),
(73, '6:14:40 PM', '11/11/2023', NULL, 'Hàm getElementById dùng &#273;&#7875; làm gì nh&#7881;?<br>\r\n   &lt;input class=&quot;txt&quot; name=&quot;u&quot; id=&quot;username&quot;&gt;<br>\r\n   &lt;script&gt;<br>\r\n      var u = document.getElementById(\'username\');<br>\r\n   &lt;/script&gt;<br>\r\n   \r\nA. Ch&#7885;n node trong DOM theo class css<br>\r\nB. Ch&#7885;n node trong DOM theo id<br>\r\nC. Ch&#7885;n node trong DOM theo tagname<br>\r\nD. Ch&#7885;n node trong DOM theo name', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '73'),
(74, '6:14:40 PM', '11/11/2023', NULL, '&#272;o&#7841;n code sau s&#7869; có k&#7871;t qu&#7843;<br>\r\n   const a = {<br>\r\n      stringField: \'loe\',<br>\r\n      numberField: 123,<br>\r\n      dateField: new Date(\'1995-12-17T03:24:00\'),<br>\r\n      nestedField: { field: \'Nested\' }<br>\r\n   }<br>\r\n   const b = JSON.parse(JSON.stringify(a));<br>\r\n   console.log(<br>\r\n      a.stringField === b.stringField,<br>\r\n      a.numberField === b.numberField,<br>\r\n      a.dateField === b.dateField,<br>\r\n      a.nestedField.field === b.nestedField.field<br>\r\n   };<br>\r\n<br>\r\nA. true true true true<br>\r\nB. true true true false<br>\r\nC. true true false true<br>\r\nD. false false false false', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '74'),
(75, '6:14:40 PM', '11/11/2023', NULL, 'Gi&#7843; s&#7917; b&#7841;n có code nh&#432; bên d&#432;&#7899;i. C&#7847;n ki&#7875;m tra giá tr&#7883; nh&#7853;p trong soluong ph&#7843;i nh&#7887; h&#417;n 10. B&#7841;n ch&#7885;n l&#7879;nh nào &#273;&#7875; &#273;i&#7873;n vào v&#7883; trí zzz <br>\r\n   &lt;form name=&quot;frm&quot; onsubmit=&quot;return kiemtra()&quot;&gt; <br>\r\n      &lt;input name=&quot;x&quot;&gt; <br>\r\n   &lt;/form&gt;<br>\r\n   &lt;script&gt;<br>\r\n      function kiemtra(){<br>\r\n         if ( zzz ) {<br>\r\n            alert(&quot;Loi&quot;);<br>\r\n            return false;<br>\r\n         }<br>\r\n      }<br>\r\n   &lt;/script&gt;<br>\r\n<br>   \r\nA. document.frm.x.value.length&lt;10<br>\r\nB. document.frm.x.value &lt;10<br>\r\nC. document.frm.x.value &gt;=10<br>\r\nD. document.frm.x.value.length&gt;=10', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '75'),
(76, '6:14:40 PM', '11/11/2023', NULL, '&#272;&#7875; hi&#7879;n l&#7895;i khi nh&#7853;p hoten, b&#7841;n ch&#7885;n l&#7879;nh nào cho v&#7883; trí zzz ? <br>\r\n   &lt;form name=&quot;frm1&quot;&gt;<br>\r\n      &lt;input name=&quot;hoten&quot; required minlength=&quot;3&quot;&gt; <br>\r\n      &lt;span zzz &gt; Nh&#7853;p h&#7885; tên t&#7915; 3 ký t&#7921; tr&#7903; lên nhé &lt;/span&gt;<br>\r\n   &lt;/form&gt; <br>   \r\nA. ng-if=&quot;frm1.hoten.$invalid&quot;<br>\r\nB. ng-if=&quot;frm1.hoten.$valid&quot;<br>\r\nC. ng-if=&quot;frm1.hoten.$pristine&quot;<br>\r\nD. if = &quot;hoten.$invalid&quot;', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '76'),
(77, '6:14:40 PM', '11/11/2023', NULL, '&#272;&#7875; hi&#7879;n l&#7895;i khi user ch&#432;a ch&#7885;n t&#7881;nh, b&#7841;n ch&#7885;n l&#7879;nh nào cho v&#7883; trí zzz ?<br>\r\n   &lt;form name=&quot;frm1&quot;&gt;<br>\r\n      &lt;select name=&quot;t&quot; ng-model=&quot;tinh&quot;&gt;<br>\r\n         &lt;option value=&quot;0&quot;&gt;Ch&#7885;n t&#7881;nh&lt;/option&gt;<br>\r\n         &lt;option value=&quot;1&quot;&gt;TP HCM&lt;/option&gt;<br>\r\n         &lt;option value=&quot;2&quot;&gt;Ti&#7873;n giang&lt;/option&gt;<br>\r\n         &lt;option value=&quot;3&quot;&gt;Long An&lt;/option&gt;<br>\r\n      &lt;/select&gt;<br>\r\n      &lt;em zzz &gt;Hãy ch&#7885;n t&#7881;nh&lt;/em&gt;<br>\r\n   &lt;/form&gt;<br>\r\n   <br>   \r\nA. ng-if=&quot;tinh &gt;0&quot;<br>\r\nB. if=&quot;!tinh || tinh==0&quot;<br>\r\nC. ng-if=&quot;!tinh || tinh==0&quot;<br>\r\nD. ng-if=&quot;!t || t==0&quot;', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '77'),
(78, '6:14:40 PM', '11/11/2023', NULL, '&#272;&#7875; hi&#7879;n l&#7895;i bu&#7897;c user ph&#7843;i nh&#7853;p tu&#7893;i t&#7915; 6 &#273;&#7871;n 18, b&#7841;n code th&#7871; nào trong v&#7883; trí zzz ? <br>\r\n   &lt;form name=&quot;frm1&quot;&gt;<br>\r\n      &lt;input name=&quot;tuoi&quot; ng-model=&quot;tuoi&quot; required type=&quot;number&quot;&gt;<br>\r\n      &lt;em ng-if= zzz &gt;Nh&#7853;p tu&#7893;i t&#7915; 6 &#273;&#7871;n 18 nhé&lt;/em&gt;<br>\r\n   &lt;/form&gt;<br>\r\n   <br>   \r\nA. &quot;frm1.tuoi.$invalid && 6 &lt;=tuoi &lt; = 18&quot;<br>\r\nB. &quot;frm1.tuoi.$valid || tuoi&gt;=6 || tuoi &lt; =18&quot;<br>\r\nC. &quot;frm1.tuoi.$invalid || tuoi = 18 &quot;<br>\r\nD. &quot;frm1.tuoi.$invalid || tuoi &lt; 6 || tuoi &gt; 18 &quot;', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '78'),
(79, '6:14:40 PM', '11/11/2023', NULL, 'Th&#7921;c hi&#7879;n ki&#7875;m tra n&#7871;u bi&#7871;n i không b&#7857;ng 5, câu l&#7879;nh nào &#273;úng? <br>   \r\nA. if (i != 5)<br>\r\nB. if i =! 5 then<br>\r\nC. if i &lt;&gt; 5<br>\r\nD. if (i &lt;&gt; 5)', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '79'),
(80, '6:14:40 PM', '11/11/2023', NULL, 'K&#7871;t qu&#7843; c&#7911;a &#273;o&#7841;n code sau là: <br>\r\n  var a = [1, 2, 3];<br>\r\n  var b = [1, 2, 3];<br>\r\n  var c = \'1,2,3\';<br>\r\n  <br>\r\n  console.log(a == c);<br>\r\n  console.log(b == c);<br>\r\n  console.log(a == b); <br>   \r\n  <br>\r\nA. true, true, false<br>\r\nB. true, true, true<br>\r\nC. true, false, false<br>\r\nD. false, false, false', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '80'),
(81, '2:34:28 PM', '11/11/2023', NULL, 'K&#7871;t qu&#7843; c&#7911;a &#273;o&#7841;n code sau là:<br>\r\n  var a = [9];<br>\r\n  var b = [10];<br>\r\n<br>\r\n  console.log(a == 9);<br>\r\n  console.log(b == 10);<br>\r\n  console.log(a &lt; b); <br>\r\n  <br>\r\nA. true, true, true<br>\r\nB. false, false, false<br>\r\nC. true, true, false<br>\r\nD. false, false, true', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '81'),
(82, '6:14:40 PM', '11/11/2023', NULL, 'K&#7871;t qu&#7843; c&#7911;a &#273;o&#7841;n code sau là:<br>\r\n  let i = 0;<br>\r\n  const arr = new Array(5);<br>\r\n  arr.forEach(() =&gt; i++);<br>\r\n  console.log(i);<br>\r\n  <br>\r\nA. 0<br>\r\nB. 1<br>\r\nC. 4<br>\r\nD. 5', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '82');
INSERT INTO `level01r` (`ID`, `Time`, `Ngay_lap_de`, `Nguoi_lap_de`, `c1`, `c2`, `c3`, `c4`, `c5`, `Mon_hp`, `Codes`, `qq1`, `qq2`, `qq3`, `qq4`, `qq5`, `CustomerID`) VALUES
(83, '6:14:40 PM', '11/11/2023', NULL, 'Hàm greatestNumberInArrray d&#432;&#7899;i &#273;ây có get &#273;&#432;&#7907;c ph&#7847;n t&#7917; l&#7899;n nh&#7845;t cho m&#7885;i array không?<br>\r\n  function greatestNummberInArray(arr) {<br>\r\n    let greatest = 0;<br>\r\n    for (let i = 0; i &lt; arr.length; i++) {<br>\r\n         if (greatest &lt; arr[i]) {<br>\r\n              greatest = arr[i];<br>\r\n         }<br>\r\n     }<br>\r\n     return greatest;<br>\r\n}<br>\r\n  <br>\r\nA. Yes<br>\r\nB. No', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '83'),
(84, '6:14:40 PM', '11/11/2023', NULL, 'Hai cách a và b d&#432;&#7899;i &#273;ây &#273;&#7873;u tr&#7843; v&#7873; m&#7897;t object có cùng thu&#7897;c tính và giá tr&#7883;. Theo b&#7841;n thì cách nào t&#7889;i &#432;u h&#417;n?<br>\r\n   const arr = [1, 2, 3];<br>\r\n<br>\r\n   const a = arr.reduce(<br>\r\n      (acc, el, i) =&gt; ({...acc, [el]: i}),<br>\r\n      {}<br>\r\n   }<br>\r\n<br>\r\n   const b = 0;<br>\r\n   for (let i = 0; i &lt; arr.length; i++) {<br>\r\n      b[arr[i]] = i;<br>\r\n   }<br>\r\n  <br>\r\nA. a<br>\r\nB. b', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '84'),
(85, '6:14:40 PM', '11/11/2023', NULL, 'Thu&#7897;c\r\n      tính method c&#7911;a form ch&#7881; ra ph&#432;&#417;ng th&#7913;c mà\r\n      d&#7919; li&#7879;u s&#7869; &#273;&#432;&#7907;c chuy&#7875;n t&#7899;i\r\n      Server. N&#7871;u giá tr&#7883; là _____, d&#7919; li&#7879;u trên form\r\n      s&#7869; &#273;&#432;&#7907;c g&#7917;i nh&#432; m&#7897;t kh&#7889;i\r\n      d&#7919; li&#7879;u. N&#7871;u giá tr&#7883; là _____ thì trình\r\n      duy&#7879;t s&#7869; g&#7917;i d&#7919; li&#7879;u b&#7857;ng cách\r\n      t&#7841;o m&#7897;t truy v&#7845;n bao g&#7891;m url, tên các &#273;i&#7873;u\r\n      khi&#7875;n và các giá tr&#7883; c&#7911;a các &#273;i&#7873;u\r\n      khi&#7875;n trên form.<br>\r\n      A. Post/Get<br>\r\n      B. Get/Post<br>\r\n      C. Post/none<br>\r\n      D. Get/none', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '85'),
(86, '6:14:40 PM', '11/11/2023', NULL, 'K&#7871;t qu&#7843; là:<br>\r\n   const arr = [<br>\r\n      x =&gt; x * 1,<br>\r\n      x =&gt; x * 2,<br>\r\n      x =&gt; x * 3,<br>\r\n      x =&gt; x * 4<br>\r\n   ];<br>\r\n<br>\r\n   console.log(arr.reduce((agg, el) =&gt; agg + el(agg), 1));<br>\r\n  <br>\r\nA. 1<br>\r\nB. 60<br>\r\nC. 100<br>\r\nD. 120', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '86'),
(87, '6:14:40 PM', '11/11/2023', NULL, 'Cho &#273;o&#7841;n code sau. K&#7871;t qu&#7843; là:<br>\r\n   const arr1 = [\'a\', \'b\', \'c\'];<br>\r\n   const arr2 = [\'b\', \'c\', \'a\'];<br>\r\n<br>\r\n   console.log(<br>\r\n      arr1.sort() === arr1,<br>\r\n      arr2.sort() === arr2,<br>\r\n      arr1.sort() === arr2.sort()<br>\r\n   );<br>\r\n  <br>\r\nA. true true true<br>\r\nB. true true false<br>\r\nC. false false false<br>\r\nD. true false true', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '87'),
(88, '6:14:40 PM', '11/11/2023', NULL, 'Cho &#273;o&#7841;n code sau. K&#7871;t qu&#7843; là:<br>\r\n   function ArrayBoolean() {<br>\r\n      if ([] == true && [1] == true) return [true, true];<br>\r\n      else if ([] == true && [1] == false) return [true, false];<br>\r\n      else if ([] == false && [1] == true) return [false, true];<br>\r\n      else return [false, false];<br>\r\n   }<br>\r\n   ArrayBoolean();<br>\r\n  <br>\r\nA. [true, true]<br>\r\nB. [true, false]<br>\r\nC. [false, true]<br>\r\nD. [false, false]', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '88'),
(89, '6:14:40 PM', '11/11/2023', NULL, 'Cho &#273;o&#7841;n code sau. K&#7871;t qu&#7843; là:<br>\r\n   let dog = {<br>\r\n      breed: \'Border Collie\',<br>\r\n      sound: \'Wooh\',<br>\r\n      getBreed: () =&gt; {<br>\r\n         return this.breed;<br>\r\n      },<br>\r\n      getSound: function() {<br>\r\n         return this.sound;<br>\r\n      }<br>\r\n   };<br>\r\n   console.log(dog.getBreed(), dog.getSound());<br>\r\n  <br>\r\nA. Border Collie, Wooh<br>\r\nB. Border Collie, undefined<br>\r\nC. undefined, Wooh<br>\r\nD. undefined, undefined', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '89'),
(90, '6:14:40 PM', '11/11/2023', NULL, '&#272;o&#7841;n code sau s&#7869; cho k&#7871;t qu&#7843;<br>\r\n   bar();<br>\r\n   var bar;<br>\r\n   function bar() {<br>\r\n      console.log(\'first\');<br>\r\n   }<br>\r\n<br>\r\n   bar = function () {<br>\r\n      console.log(\'second\');<br>\r\n   }<br>\r\n   bar();<br>\r\n   foo();<br>\r\n<br>\r\n   function foo() {<br>\r\n      console.log(1);<br>\r\n   }<br>\r\n<br>\r\n   function foo() {<br>\r\n      console.log(1);<br>\r\n   }<br>\r\n<br>\r\n   function foo() {<br>\r\n      console.log(1);<br>\r\n   }<br>\r\n   foo();<br>\r\n\r\nA. second first 1 3<br>\r\nB. first second 3 2<br>\r\nC. second first 3 3<br>\r\nD. first second 3 3', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '90'),
(91, '2:34:28 PM', '11/11/2023', NULL, '&#272;o&#7841;n code sau s&#7869; cho k&#7871;t qu&#7843; nh&#432; th&#7871; nào?<br>\r\n   const person = { name: \'duthaho\' };<br>\r\n   function sayHi(age) {<br>\r\n      return \'${this.name} is ${age}\';<br>\r\n   }<br>\r\n   console.log(sayHi.call(person, 69));<br>\r\n   console.log(sayHi.bind(person, 69));<br>\r\n  <br>\r\nA. undefined is 69 duthaho is 69<br>\r\nB. function function<br>\r\nC. duthaho is 69 duthaho is 69<br>\r\nD. duthaho is 69 function', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '91'),
(92, '6:14:40 PM', '11/11/2023', NULL, 'K&#7871;t qu&#7843; c&#7911;a &#273;o&#7841;n code sau là: <br>\r\n   let a = new Date(\'2024,1,1\').toLocaleDateString();<br>\r\n   let b = new Date(2024, 1, 1).toLocaleDateString();<br>\r\n   console.log(a, b)<br>\r\n  <br>\r\nA. 1/1/2024 2/1/2024<br>\r\nB. 1/1/2014 1/1/2024', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '92'),
(93, '6:14:40 PM', '11/11/2023', NULL, 'K&#7871;t qu&#7843; c&#7911;a câu l&#7879;nh sau: <br>\r\n   console.log(fetch);<br>\r\n  <br>\r\nA. The fetch function<br>\r\nB. A reference error<br>\r\nC. It depends', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '93'),
(94, '6:14:40 PM', '11/11/2023', NULL, 'Cho &#273;o&#7841;n code sau. K&#7871;t qu&#7843; là: <br>\r\n   const a = 0.1;<br>\r\n   const b = 0.2;<br>\r\n   const c = 0.3;<br>\r\n<br>\r\n   console.log(a + b === c);<br>\r\n  <br>\r\nA. TRUE<br>\r\nB. FALSE', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '94'),
(95, '8:02:32 PM', '11/11/2023', NULL, '&#272;o&#7841;n code sau s&#7869; có k&#7871;t qu&#7843; là: <br>\r\n   function Person(firstName, lastName) {<br>\r\n      this.firstName = firstName;<br>\r\n      this.lastName = lastName;<br>\r\n   }<br>\r\n<br>\r\n   const ti = new Person(\'du\', \'ti\');<br>\r\n   const teo = Person(\'du\', \'teo\');<br>\r\n<br>\r\n   console.log(ti);<br>\r\n   console.log(teo);<br>\r\n  <br>\r\nA. Person {firstName: \'du\', lastName: \'ti\'}<br>\r\nB. Person {firstName: \'du\', lastName: \'ti\'}<br>\r\nC. Person {firstName: \'du\', lastName: \'ti\'}<br>\r\nD. Person {firstName: \'du\', lastName: \'ti\'}', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '95'),
(96, '6:14:40 PM', '11/11/2023', NULL, 'Cho &#273;o&#7841;n code sau. K&#7871;t qu&#7843; là:<br>\r\n   function sayHI() {<br>\r\n      return (() =&gt; 0) ();<br>\r\n   }<br>\r\n   console.log(typeof sayHi());<br>\r\n  <br>\r\nA. object<br>\r\nB. number<br>\r\nC. function<br>\r\nD. undefined', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '96'),
(97, '6:14:40 PM', '11/11/2023', NULL, '&#272;o&#7841;n code trên s&#7869; có k&#7871;t qu&#7843;: <br>\r\n   const notifications = 1;<br>\r\n   console.log(<br>\r\n      \'You have ${notifications} notification${notification !== 1 && \'s\'}\'<br>\r\n   );<br>\r\n  <br>\r\nA. You have 1 notification<br>\r\nB. You have 1 notifications<br>\r\nC. You have 1 notificationfalse', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '97'),
(98, '6:14:40 PM', '11/11/2023', NULL, 'Cho &#273;o&#7841;n code sau, k&#7871;t qu&#7843; là: <br>\r\n   const n = 5;<br>\r\n   console.log(1..5);<br>\r\n  <br>\r\nA. [1, 2, 3, 4, 5]<br>\r\nB. undefined<br>\r\nC. Syntax error', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '98'),
(99, '6:14:40 PM', '11/11/2023', NULL, 'Câu l&#7879;nh Javascript nào là &#273;úng &#273;&#7875; th&#7921;c hi&#7879;n thay &#273;&#7893;i n&#7897;i dung trong ph&#7847;n t&#7917; HTML d&#432;&#7899;i &#273;ây?<br>\r\n   &lt;p id=&quot;demo&quot;&gt;Website oles.edu.vn.&lt;/p&gt;<br>\r\n    \r\nA. document.getElementById(&quot;demo&quot;).innerHTML = &quot;Chào m&#7915;ng b&#7841;n &#273;&#7871;n v&#7899;i oles.edu.vn!&quot;;<br>\r\nB. #demo.innerHTML = &quot;Chào m&#7915;ng b&#7841;n &#273;&#7871;n v&#7899;i oles.edu.vn!&quot;;<br>\r\nC. document.getElement(&quot;p&quot;).innerHTML = &quot;Chào m&#7915;ng b&#7841;n &#273;&#7871;n v&#7899;i oles.edu.vn!&quot;;<br>\r\nD. document.getElementByName(&quot;p&quot;).innerHTML = &quot;Chào m&#7915;ng b&#7841;n &#273;&#7871;n v&#7899;i oles.edu.vn!&quot;;', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '99'),
(100, '6:14:40 PM', '11/11/2023', NULL, 'Cho &#273;o&#7841;n code sau, k&#7871;t qu&#7843; là: <br>\r\n   const obj = { a: \'one\', b: \'two\', a:\'three\' };<br>\r\n   console.log(obj);<br>\r\n  <br>\r\nA. {a: &quot;one&quot;, b: &quot;two&quot; }<br>\r\nB. {b: &quot;two&quot;, a: &quot;three&quot; }<br>\r\nC. {a: &quot;three&quot;, b: &quot;two&quot; }<br>\r\nD. SyntaxError', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '100'),
(101, '6:14:40 PM', '11/11/2023', NULL, '&#272;o&#7841;n code sau s&#7869; cho k&#7871;t qu&#7843;:<br>\r\n   let b = \'4\';<br>\r\n   console.log(b++ +3, b);<br>\r\n  <br>\r\nA. 44 4<br>\r\nB. 8 5<br>\r\nC. 7 5<br>\r\nD. 43 5', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '101'),
(102, '8:29:55 PM', '11/10/2023', NULL, 'Javascript &#273;&#432;&#7907;c &#273;&#7863;t trong c&#7863;p th&#7867; nào?<br>\r\nA. &lt;script&gt; ... &lt;/script&gt;	 <br>B. &lt;Javascript&gt; ... &lt;Javascript&gt;	\r\n<br>C. &lt;java&gt; ... &lt;/java&gt;	         <br>D. T&#7845;t c&#7843; các d&#7841;ng trên', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '102'),
(103, '8:29:55 PM', '11/10/2023', NULL, '&#272;o&#7841;n code sau s&#7869; cho k&#7871;t qu&#7843;:<br>\r\n   console,log(1 &lt; 2 &lt; 3);<br>\r\n   console.log(3 &gt; 2 &gt; 1);<br>\r\n  <br>\r\nA. true true<br>\r\nB. true false<br>\r\nC. false false<br>\r\nD. undefined undefined', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '103'),
(104, '8:29:55 PM', '11/10/2023', NULL, 'S&#7921; ki&#7879;n _____ c&#7911;a ph&#7847;n t&#7917; body s&#7869; &#273;&#432;&#7907;c kích ho&#7841;t khi trang &#273;&#432;&#7907;c n&#7841;p xong<br>\r\n  <br>\r\nA. Onfocus<br>\r\nB. Onblur<br>\r\nC. Onload<br>\r\nD. Onsubmit', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '104'),
(105, '8:29:55 PM', '11/10/2023', NULL, 'S&#7921; ki&#7879;n _____ s&#7869; &#273;&#432;&#7907;c kích ho&#7841;t khi con tr&#7887; chu&#7897;t di chuy&#7875;n lên m&#7897;t ph&#7847;n t&#7917;<br>\r\n  <br>\r\nA. Onsubmit<br>\r\nB. Onmouseup<br>\r\nC. Onmouseout<br>\r\nD. Onmouseocer', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '105'),
(106, '8:29:55 PM', '11/10/2023', NULL, '&quot;apthech&quot;.length tr&#7843; l&#7841;i giá tr&#7883; là _____<br>\r\n  <br>\r\nA. 5<br>\r\nB. 6<br>\r\nC. 7<br>\r\nD. Error', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '106'),
(107, '8:29:55 PM', '11/10/2023', NULL, 'Bi&#7871;n trong Javascript &#273;&#432;&#7907;c khai báo nh&#432; th&#7871; nào?<br>\r\n  <br>\r\nA. dim x=5 dim x<br>\r\nB. var x=5; var x;<br>\r\nC. dime x=5 dime x<br>\r\nD. var $x=5 var $x', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '107'),
(108, '8:29:55 PM', '11/10/2023', NULL, '&#272;&#7875; nhúng mã Javascript trong HTML ta ph&#7843;i &#273;&#7863;t vào v&#7883; trí nào sau &#273;ây?<br>\r\n  <br>\r\nA. Trong th&#7867; &lt;body&gt;<br>\r\nB. Ngay tr&#432;&#7899;c &lt;body&gt;<br>\r\nC. Trong th&#7867; &lt;head&gt;<br>\r\nD. T&#7845;t c&#7843;', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '108'),
(109, '8:29:55 PM', '11/10/2023', NULL, '&#272;&#7875; liên k&#7871;t các dòng l&#7879;nh trong Javascirpt thành kh&#7889;i ta s&#7917; d&#7909;ng cách nào?<br>\r\n  <br>\r\nA. {}<br>\r\nB. Không &#273;&#432;&#7907;c s&#7917; d&#7909;ng script<br>\r\nC. []<br>\r\nD. ()', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '109'),
(110, '3:11:21 PM', '11/11/2023', NULL, '&#272;&#7875; g&#7897;p chu&#7895;i trong Javascript ta s&#7917; d&#7909;ng ký hi&#7879;u nào?<br>\r\n  <br>\r\nA. +<br>\r\nB. &&<br>\r\nC. ++<br>\r\nD. and', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '110'),
(111, '8:29:55 PM', '11/10/2023', NULL, 'Cho &#273;o&#7841;n code sau. K&#7871;t qu&#7843; là:<br>\r\n   const ar = [5, 1, 3, 7, 25];<br>\r\n   const ar1 = ar;<br>\r\n   console.log(ar1.sort());<br>\r\n   ([5, 25].indexOf(ar[1]) != -1 && console.log(ar.reverse())) || (ar[3] == 25 && console.log(ar));<br>\r\n   console.log(ar1);<br>\r\n<br>\r\nA. [1, 3, 5, 7, 25] [7, 5, 3, 25, 1] [1, 25, 3, 5, 7] [1, 25, 3, 5, 7]<br>\r\nB. [1, 25, 3, 5, 7] [5, 1, 3, 7, 25]<br>\r\nC. [1, 25, 3, 5, 7] [7, 5, 3, 25, 1] [7, 5, 3, 25, 1] [7, 5, 3, 25, 1]<br>\r\nD. Có l&#7895;i x&#7843;y ra', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '111'),
(112, '8:29:55 PM', '11/10/2023', NULL, 'S&#7921; ki&#7879;n Onblur x&#7843;y ra khi nào?<br>\r\n  <br>\r\nA. X&#7843;y ra khi thành ph&#7847;n c&#7911;a form &#273;&#432;&#7907;c focus<br>\r\nB. X&#7843;y ra khi giá tr&#7883; c&#7911;a thành ph&#7847;n &#273;&#432;&#7907;c ch&#7885;n thay &#273;&#7893;i<br>\r\nC. X&#7843;y ra khi ng&#432;&#7901;i dùng click vào các thành ph&#7847;n hay liên k&#7871;t c&#7911;a form<br>\r\nD. X&#7843;y ra khi input focus b&#7883; xóa thành ph&#7847;n form', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '112'),
(113, '8:29:55 PM', '11/10/2023', NULL, 'S&#7921; ki&#7879;n nào sau không có trong Form?<br>\r\n  <br>\r\nA. Onclick<br>\r\nB. Onblur<br>\r\nC. Onsubmit<br>\r\nD. Oncharge', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '113'),
(114, '8:29:55 PM', '11/10/2023', NULL, '&#272;&#7863;c tính nào sau &#273;ây không ph&#7843;i là &#273;&#7863;c tính c&#417; b&#7843;n c&#7911;a Javascript?<br>\r\n  <br>\r\nA. &#272;&#417;n gi&#7843;n<br>\r\nB. Tr&#7921;c quan cao<br>\r\nC. H&#432;&#7899;ng &#273;&#7889;i t&#432;&#7907;ng<br>\r\nD. &#272;&#7897;ng', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '114'),
(115, '8:29:55 PM', '11/10/2023', NULL, 'T&#7915; khóa This trong Javascript th&#7875; hi&#7879;n?<br>\r\n  <br>\r\nA. &#272;&#432;&#7907;c s&#7917; d&#7909;ng &#273;&#7875; thi&#7871;t l&#7853;p &#273;&#7889;i t&#432;&#7907;ng ng&#7847;m &#273;&#7883;nh cho m&#7897;t nhóm các l&#7879;nh, b&#7841;n có th&#7875; s&#7917; d&#7909;ng các thu&#7897;c tính mà không &#273;&#7873; c&#7853;p &#273;&#7871;n &#273;&#7889;i t&#432;&#7907;ng<br>\r\nB. &#272;&#432;&#7907;c s&#7917; d&#7909;ng &#273;&#7875; ch&#7881; &#273;&#7889;i t&#432;&#7907;ng hi&#7879;n th&#7901;i. &#272;&#7889;i t&#432;&#7907;ng &#273;&#432;&#7907;c g&#7885;i th&#432;&#7901;ng là &#273;&#7889;i t&#432;&#7907;ng hi&#7879;n th&#7901;i trong ph&#432;&#417;ng th&#7913;c ho&#7863;c hàm<br>\r\nC. &#272;&#432;&#7907;c s&#7917; d&#7909;ng &#273;&#7875; th&#7921;c hi&#7879;n t&#7841;o ra m&#7897;t th&#7875; hi&#7879;n m&#7899;i c&#7911;a m&#7897;t &#273;&#7889;i t&#432;&#7907;ng<br>\r\nD. T&#7845;t c&#7843; &#273;&#7873;u &#273;úng', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '115'),
(116, '8:29:55 PM', '11/10/2023', NULL, '&#272;&#7875; t&#7841;o m&#7897;t kho&#7843;ng tr&#7855;ng m&#7899;i ta dùng ký hi&#7879;u nào sau &#273;ây?<br>\r\n  <br>\r\nA. \\f<br>\r\nB. \\b<br>\r\nC. \\r<br>\r\nD. \\n', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '116'),
(117, '8:29:55 PM', '11/10/2023', NULL, '&#272;&#7875; t&#7841;o m&#7897;t tab m&#7899;i ta dùng ký hi&#7879;u nào sau &#273;ây?<br>\r\n  <br>\r\nA. \\r<br>\r\nB. \\t<br>\r\nC. \\r<br>\r\nD. \\n', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '117'),
(118, '8:29:55 PM', '11/10/2023', NULL, 'T&#7915; khóa nào sau &#273;ây không ph&#7843;i là t&#7915; khóa trong Javascript?<br>\r\n  <br>\r\nA. parseInt<br>\r\nB. parseFloat<br>\r\nC. const<br>\r\nD. contunues', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '118'),
(119, '8:29:55 PM', '11/10/2023', NULL, 'Ngôn ng&#7919; k&#7883;ch b&#7843;n Javascript &#273;&#432;&#7907;c vi&#7871;t theo<br>\r\n  <br>\r\nA. VBScript<br>\r\nB. JavaScirpt<br>\r\nC. C&#7843; JavaScript và VBScript<br>\r\nD. HTML', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '119'),
(120, '3:36:14 PM', '11/11/2023', NULL, 'Ngôn ng&#7919; k&#7883;ch b&#7843;n Javascirpt và Java có gi&#7889;ng nhau không?<br>\r\n  <br>\r\nA. Có vì java c&#361;ng là ngôn ng&#7919; l&#7853;p trình web<br>\r\nB. Không gi&#7889;ng nhau, Java là ngôn ng&#7919; do Sun Microsystems phát tri&#7875;n<br>\r\nC. Có, Javascirpt là m&#7897;t nhánh c&#7911;a l&#7853;p trình Java<br>\r\nD. Không vì Java không ph&#7843;i là ngôn ng&#7919; l&#7853;p trình', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '120'),
(121, '2:18:25 PM', '11/10/2023', NULL, 'L&#7879;nh prompt trong Javascript dùng &#273;&#7875; làm gì?	<br>\r\nA. Hi&#7879;n m&#7897;t thông báo nh&#7853;p thông tin <br>	B. Hi&#7879;n m&#7897;t thông báo d&#7841;ng YES/NO	<br>\r\nC. C&#7843; 2 d&#7841;ng trên	    <br>                    D. Không có l&#7879;nh nào &#273;úng', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '121'),
(122, '5:46:21 PM', '11/11/2023', NULL, '&#272;o&#7841;n code sau s&#7869; cho ra k&#7871;t qu&#7843; bao nhiêu? <br>\r\npublic class Main {<br>\r\n  public static void main(String[] args) {<br>\r\n    int myNum = 15;<br>\r\n    System.out.println(myNum);<br>\r\n  }<br>\r\n}<br>\r\n<br>\r\n\r\nA. 15<br>\r\nB. 30<br>\r\nC. 40<br>\r\nD. Error', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '122'),
(123, '2:34:28 PM', '11/11/2023', NULL, '&#272;o&#7841;n code sau s&#7869; cho ra k&#7871;t qu&#7843; bao nhiêu ? <br>\r\npublic class Main {<br>\r\n  public static void main(String[] args) {<br>\r\n    int myNum = 15;<br>\r\n    myNum = 20;  <br>\r\n    System.out.println(myNum);<br>\r\n  }<br>\r\n} <br>\r\n  <br>\r\nA. 15<br>\r\nB. 20<br>\r\nC. 35<br>\r\nD. Error', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '123'),
(124, '8:29:55 PM', '11/10/2023', NULL, 'Cho &#273;o&#7841;n code sau, k&#7871;t qu&#7843; là:<br>\r\npublic class Main {<br>\r\n  public static void main(String[] args) {<br>\r\n    boolean isJavaFun = true;<br>\r\n    boolean isFishTasty = false;    <br>\r\n    System.out.println(isJavaFun);<br>\r\n    System.out.println(isFishTasty);<br>\r\n  }<br>\r\n}<br>\r\n  <br>\r\nA. false<br>\r\nB. false true<br>\r\nC. Error<br>\r\nD. true false', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '124'),
(125, '3:11:21 PM', '11/11/2023', NULL, 'Cho &#273;o&#7841;n code sau, k&#7871;t qu&#7843; là:<br>\r\npublic class Main {<br>\r\n  public static void main(String[] args) {<br>\r\n    System.out.println(Math.abs(-4.7));  <br>\r\n  }<br>\r\n}<br>\r\n  <br>\r\nA. 0<br>\r\nB. -4.7<br>\r\nC. Error<br>\r\nD. 4.7', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '125'),
(126, '3:11:21 PM', '11/11/2023', NULL, 'Cho &#273;o&#7841;n code sau, k&#7871;t qu&#7843; là:<br>\r\npublic class Main {<br>\r\n  public static void main(String[] args) {<br>\r\n<br>\r\n    int x = 100\r\n<br>\r\n    System.out.println(x);<br>\r\n  }<br>\r\n}<br>\r\n  <br>\r\nA. 100<br>\r\nB. -100<br>\r\nC. error', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '126'),
(127, '3:11:21 PM', '11/11/2023', NULL, '&#272;o&#7841;n code sau s&#7869; cho k&#7871;t qu&#7843;<br>\r\n   bar();<br>\r\n   var bar;<br>\r\n   function bar() {<br>\r\n      console.log(\'first\');<br>\r\n   }<br>\r\n<br>\r\n   bar = function () {<br>\r\n      console.log(\'second\');<br>\r\n   }<br>\r\n   bar();<br>\r\n   foo();<br>\r\n<br>\r\n   function foo() {<br>\r\n      console.log(1);<br>\r\n   }<br>\r\n<br>\r\n   function foo() {<br>\r\n      console.log(1);<br>\r\n   }<br>\r\n<br>\r\n   function foo() {<br>\r\n      console.log(1);<br>\r\n   }<br>\r\n   foo();<br>\r\n\r\nA. first second 3 2<br>\r\nB. second first 1 3<br>\r\nC. second first 3 3<br>\r\nD. first second 3 3', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '127'),
(128, '3:11:21 PM', '11/11/2023', NULL, 'Cho &#273;o&#7841;n code sau, k&#7871;t qu&#7843; là: <br>\r\npublic class Main {<br>\r\n  public static void main(String[] args) {<br>\r\n    String[] cars = {&quot;Volvo&quot;, &quot;BMW&quot;, &quot;Ford&quot;, &quot;Mazda&quot;};<br>\r\n    System.out.println(cars[0]);<br>\r\n  }<br>\r\n}<br>\r\n<br>\r\n  <br>\r\nA. BMW<br>\r\nB. Volvo<br>\r\nC. Ford<br>\r\nD. Mazda', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '128'),
(129, '2:02:54 PM', '11/11/2023', NULL, 'Cho &#273;o&#7841;n code sau, k&#7871;t qu&#7843; là:<br>\r\npublic class Main {<br>\r\n  public static void main(String[] args) {<br>\r\n    String[] cars = {&quot;Volvo&quot;, &quot;BMW&quot;, &quot;Ford&quot;, &quot;Mazda&quot;};<br>\r\n    System.out.println(cars.length);<br>\r\n  }<br>\r\n}<br>\r\n  <br>\r\nA. 0<br>\r\nB. 4<br>\r\nC. Error', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '129'),
(130, '3:11:21 PM', '11/11/2023', NULL, 'Cho &#273;o&#7841;n code sau, k&#7871;t qu&#7843; là: <br>\r\npublic class Main {<br>\r\n  public static void main(String[] args) {<br>\r\n    for (int i = 0; i < 5; i++) {<br>\r\n      System.out.println(i);<br>\r\n    }  <br>\r\n  }<br>\r\n}<br>\r\n<br>\r\n  <br>\r\nA. \r\n   0<br>\r\n     &nbsp;&nbsp;&nbsp;&nbsp;1<br>\r\n     &nbsp;&nbsp;&nbsp;&nbsp;2<br>\r\n    &nbsp;&nbsp;&nbsp;&nbsp;3<br>\r\n    &nbsp;&nbsp;&nbsp;&nbsp;4<br>\r\nB. \r\n     1<br>\r\n     &nbsp;&nbsp;&nbsp;&nbsp;2<br>\r\n     &nbsp;&nbsp;&nbsp;&nbsp;3<br>\r\n     &nbsp;&nbsp;&nbsp;&nbsp;4<br>\r\n     &nbsp;&nbsp;&nbsp;&nbsp;5<br>\r\nC. Error', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '130'),
(131, '3:36:14 PM', '11/11/2023', NULL, 'Cho &#273;o&#7841;n code sau, k&#7871;t qu&#7843; là: <br>\r\npublic class Main {<br>\r\n  public static void main(String[] args) {<br>\r\n    for (int i = 0; i <= 10; i = i + 2) {<br>\r\n      System.out.println(i);<br>\r\n    }  <br>\r\n  }<br>\r\n}<br>\r\n  <br>\r\nA. \r\n   1<br>\r\n     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2<br>\r\n     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4<br>\r\n     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5<br>\r\n     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6<br>\r\n     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8<br>\r\n     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10<br>    \r\nB. \r\n     1<br>\r\n     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2<br>\r\n     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3<br>\r\n     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4<br>\r\n     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8<br>\r\n     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10<br>\r\nC. \r\n     0<br>\r\n     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2<br>\r\n     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4<br>\r\n     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6<br>\r\n     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8<br>\r\n     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10<br>\r\nD. Error', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '131'),
(132, '3:11:21 PM', '11/11/2023', NULL, 'Cho &#273;o&#7841;n code sau, k&#7871;t qu&#7843; là: <br>\r\npublic class Main {<br>\r\n  final int x = 10;<br>\r\n<br>\r\n  public static void main(String[] args) {<br>\r\n    Main myObj = new Main();<br>\r\n    myObj.x = 25; <br>\r\n    System.out.println(myObj.x); <br>\r\n  }<br>\r\n}<br>\r\n  <br>\r\nA. 25<br>\r\nB. 250<br>\r\nC. Error<br>\r\nD. 10', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '132'),
(133, '3:11:21 PM', '11/11/2023', NULL, 'Cho &#273;o&#7841;n code sau, k&#7871;t qu&#7843; là:<br>\r\n   function ArrayBoolean() {<br>\r\n      if ([] == true && [1] == true) return [true, true];<br>\r\n      else if ([] == true && [1] == false) return [true, false];<br>\r\n      else if ([] == false && [1] == true) return [false, true];<br>\r\n      else return [false, false];<br>\r\n   }<br>\r\n   ArrayBoolean();<br>\r\n  <br>\r\nA. [false, true]<br>\r\nB. [true, false]<br>\r\nC. [true, true]<br>\r\nD. [false, false]', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '133'),
(134, '3:11:21 PM', '11/11/2023', NULL, 'Hàm getElementsByTagName giúp làm gì<br>\r\n   &lt;span class=&quot;txt&quot; name=&quot;lk&quot;&gt; H&#7885;c mi&#7879;t mài&lt;/span&gt; &lt;br&gt;<br>\r\n   &lt;span class=&quot;txt&quot; name=&quot;lk&quot;&gt; Ng&#7891;i ng&#7851;m l&#7841;i ho&#7841;t &#273;&#7897;ng c&#7911;a các ch&#7913;c m&#7899;i th&#7921;c t&#7853;p&lt;/span&gt; &lt;br&gt;<br>\r\n   &lt;span class=&quot;txt&quot; name=&quot;lk&quot;&gt; Mu&#7889;n gi&#7887;i: m&#7891; hôi &#273;&#7893;&lt;/span&gt; &lt;br&gt;<br>\r\n   &lt;span class=&quot;txt&quot; name=&quot;lk&quot;&gt; Nên h&#7885;c nhóm&lt;/span&gt; &lt;br&gt;<br>\r\n   &lt;script&gt;<br>\r\n      var arr = document.getElementsByTagName(\'span\');<br>\r\n   &lt;/script&gt;<br>\r\n<br>\r\nA. Ch&#7885;n các node trong DOM có tag t&#432;&#417;ng &#7913;ng<br>\r\nB. Ch&#7885;n các node trong DOM theo class css c&#7911;a nó<br>\r\nC. Ch&#7885;n các node trong DOM theo class css<br>\r\nD. Ch&#7885;n 1 node trong DOM theo tag ch&#7881; ra. Ví d&#7909; img, a', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '134'),
(135, '2:02:54 PM', '11/11/2023', NULL, 'Cho &#273;o&#7841;n code sau, k&#7871;t qu&#7843; là:<br>\r\n   &lt;script&gt;<br>\r\n      setInterval(&quot;alert(\'&#272;&#7901;i vui l&#7855;m em có bi&#7871;t không?\')&quot; / 1000)<br>\r\n   &lt;/script&gt;<br>\r\n  <br>\r\nA. Code l&#7895;i sai cú pháp<br>\r\nB. Code trên hi&#7879;n ra 1000 l&#7847;n ch&#7919;: &#272;&#7901;i vui l&#7855;m em có bi&#7871;t không?<br>\r\nC. Code trên &#273;&#7907;i 1000 miligiây và hi&#7879;n ra 1 l&#7847;n ch&#7919;: &#272;&#7901;i vui l&#7855;m em có bi&#7871;t không?<br>\r\nD. Code trên &#273;&#7883;nh k&#7923; n&#7917;a giây thì hi&#7879;n ra ch&#7919;: &#272;&#7901;i vui l&#7855;m em có bi&#7871;t không?', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '135'),
(136, '3:36:14 PM', '11/11/2023', NULL, 'Thêm vào tag head c&#7911;a 1 trang web &#273;o&#7841;n code sau, s&#7869; x&#7843;y ra &#273;i&#7873;u gì?<br>\r\n   &lt;script&gt; setTimeout(&quot;location.reload()&quot;, 360000);&lt;/script&gt;<br>\r\n  <br>\r\nA. Trình duy&#7879;t c&#7913; 60 phút sau khi n&#7841;p trang, s&#7869; n&#7841;p l&#7841;i chính trang web &#273;ó<br>\r\nB. Yêu c&#7847;u trình duy&#7879;t &#273;óng l&#7841;i sau 36 phút<br>\r\nC. Yêu c&#7847;u trình duy&#7879;t n&#7841;p l&#7841;i trang web 36 phút sau<br>\r\nD. L&#7879;nh l&#7895;i, không ch&#7841;y vì location không có hàm reload', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '136'),
(137, '3:36:14 PM', '11/11/2023', NULL, 'Trong Javascript, t&#7915; khóa This th&#7875; hi&#7879;n &#273;i&#7873;u gì?<br>\r\n  <br>\r\nA. &#272;&#432;&#7907;c s&#7917; d&#7909;ng &#273;&#7875; thi&#7871;t l&#7853;p &#273;&#7889;i t&#432;&#7907;ng ng&#7847;m &#273;&#7883;nh cho m&#7897;t nhóm các l&#7879;nh, b&#7841;n có th&#7875; s&#7917; d&#7909;ng các thu&#7897;c tính mà không &#273;&#7873; c&#7853;p &#273;&#7871;n &#273;&#7889;i t&#432;&#7907;ng<br>\r\nB. &#272;&#432;&#7907;c s&#7917; d&#7909;ng &#273;&#7875; th&#7921;c hi&#7879;n t&#7841;o ra m&#7897;t th&#7875; hi&#7879;n m&#7899;i c&#7911;a m&#7897;t &#273;&#7889;i t&#432;&#7907;ng ho&#7863;c hàm<br>\r\nC. &#272;&#432;&#7907;c s&#7917; d&#7909;ng &#273;&#7875; ch&#7881; &#273;&#7889;i t&#432;&#7907;ng hi&#7879;n th&#7901;i. &#272;&#7889;i t&#432;&#7907;ng &#273;&#432;&#7907;c g&#7885;i th&#432;&#7901;ng là &#273;&#7889;i t&#432;&#7907;ng hi&#7879;n th&#7901;i trong ph&#432;&#417;ng th&#7913;c<br>\r\nD. T&#7845;t c&#7843; &#273;&#7873;u &#273;úng', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '137'),
(138, '3:36:14 PM', '11/11/2023', NULL, ' Do…while là d&#7841;ng vòng l&#7863;p nào sau &#273;ây?<br>\r\n  <br>\r\nA. Không xác &#273;&#7883;nh và l&#7863;p r&#7891;i m&#7899;i xét &#273;i&#7873;u ki&#7879;n<br>\r\nB. Không xác &#273;&#7883;nh và xét &#273;i&#7873;u ki&#7879;n r&#7891;i m&#7899;i l&#7863;p<br>\r\nC. C&#7843; 2 d&#7841;ng trên<br>\r\nD. Không t&#7891;n t&#7841;i d&#7841;ng nào &#7903; trên', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '138'),
(139, '3:36:14 PM', '11/11/2023', NULL, '&#272;o&#7841;n code sau có k&#7871;t qu&#7843; là:<br>\r\n   const ar = [5, 1, 3, 7, 25];<br>\r\n   const ar1 = ar;<br>\r\n   console.log(ar1.sort());<br>\r\n   ([5, 25].indexOf(ar[1]) != -1 && console.log(ar.reverse())) || (ar[3] == 25 && console.log(ar));<br>\r\n   console.log(ar1);<br>\r\n  <br>\r\nA. [1, 25, 3, 5, 7] [5, 1, 3, 7, 25]<br>\r\nB. [1, 3, 5, 7, 25] [7, 5, 3, 25, 1] [1, 25, 3, 5, 7] [1, 25, 3, 5, 7]<br>\r\nC. Có l&#7895;i x&#7843;y ra<br>\r\nD. [1, 25, 3, 5, 7] [7, 5, 3, 25, 1] [7, 5, 3, 25, 1] [7, 5, 3, 25, 1]', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '139'),
(140, '3:36:14 PM', '11/11/2023', NULL, '&#272;o&#7841;n code sau có k&#7871;t qu&#7843; là:<br>\r\n   const ar = [5, 1, 3, 7, 25];<br>\r\n   const ar1 = ar;<br>\r\n   console.log(ar1.sort());<br>\r\n   ([5, 25].indexOf(ar[1]) != -1 && console.log(ar.reverse) || (ar[3] == 25 && console.log(ar));<br>\r\n   console.log(ar1);<br>\r\n  <br>\r\nA. [1, 25, 3, 5, 7] [5, 1, 3, 7, 25]<br>\r\nB. [1, 3, 5, 7, 25] [7, 5, 3, 25, 1] [1, 25, 3, 5, 7] [1, 25, 3, 5, 7]<br>\r\nC. Có l&#7895;i x&#7843;y ra<br>\r\nD. [1, 25, 3, 5, 7] [7, 5, 3, 25, 1] [7, 5, 3, 25, 1] [7, 5, 3, 25, 1]', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '140'),
(141, '3:36:14 PM', '11/11/2023', NULL, 'Javascript dùng l&#7879;nh nào &#273;&#7875; xu&#7845;t trang web giá tr&#7883; bi&#7871;n x ?<br>\r\n  <br>\r\nA. windows.write(x);<br>\r\nB. document.write(x);<br>\r\nC. console.write(x);<br>\r\nD. document.getElementById(&quot;kq&quot;.innerHTML = x;', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '141'),
(142, '3:36:14 PM', '11/11/2023', NULL, '&#272;o&#7841;n code sau k&#7871;t qu&#7843; nào sau &#273;ây?<br>\r\n   const n = 5;<br>\r\n   console.log(1;5);<br>\r\n  <br>\r\nA. undefined<br>\r\nB. [1, 2, 3, 4, 5]<br>\r\nC. Syntax error', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '142'),
(143, '3:36:14 PM', '11/11/2023', NULL, 'C&#7863;p th&#7867; nào &#273;&#432;&#7907;c &#273;&#7863;t trong Javascript?<br>\r\n  <br>\r\nA. &lt;java&gt; ... &lt;/java&gt;<br>\r\nB. &lt;Javascript&gt; ... &lt;Javascript&gt;<br>\r\nC. &lt;script&gt; ... &lt;/script&gt;<br>\r\nD. T&#7845;t c&#7843; các d&#7841;ng trên', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '143'),
(144, '3:36:14 PM', '11/11/2023', NULL, 'Trong Javascript, dùng ký hi&#7879;u nào &#273;&#7875; khai báo m&#7843;ng?<br>\r\n  <br>\r\nA. {}<br>\r\nB. [ ]<br>\r\nC. ( )<br>\r\nD. T&#7845;t c&#7843; các d&#7841;ng trên', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '144'),
(145, '3:36:14 PM', '11/11/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\nint a = 11;<br>\r\nint b = 4;<br>\r\nint c = 2 * a % b + 4;<br>\r\nSystem.out.print(c);<br>\r\n  <br>\r\nA. 8<br>\r\nB. 6<br>\r\nC. 4', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '145'),
(146, '3:36:14 PM', '11/11/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\nSystem.out.print(23  +  02 + &quot;ZendVN&quot; + 89);<br>\r\n  <br>\r\nA. 25ZendVN<br>\r\nB. Syntax error<br>\r\nC. 25endZVN89<br>\r\nD. 25ZendVN89', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '146'),
(147, '3:11:21 PM', '11/11/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\nint result = 2 * 3 % 4 + 8 - (int)2.7;<br>\r\nSystem.out.print(result);<br>\r\n  <br>\r\nA. 8<br>\r\nB. 6<br>\r\nC. Syntax error', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '147'),
(148, '3:36:14 PM', '11/11/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\nint yourAge = 20;<br>\r\nString yourName = &quot;hailan&quot;;<br>\r\nSystem.out.printf(&quot;Born: %d, name: %s&quot;, 2022 - yourAge,  yourName);<br>\r\n<br>\r\nA. 2002<br>\r\nB. Born: 2002<br>\r\nC. Syntax error<br>\r\nD. Born: 2002, name: hailan', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '148'),
(149, '3:36:14 PM', '11/11/2023', NULL, 'Hàm getElementsByName giúp b&#7841;n làm gì<br>\r\n   &lt;span class=&quot;txt&quot; name=&quot;lk&quot;&gt; H&#7885;c mi&#7879;t mài&lt;/span&gt; &lt;br&gt;<br>\r\n   &lt;span class=&quot;txt&quot; name=&quot;lk&quot;&gt; Ng&#7891;i ng&#7851;m l&#7841;i ho&#7841;t &#273;&#7897;ng c&#7911;a các ch&#7913;c m&#7899;i th&#7921;c t&#7853;p&lt;/span&gt; &lt;br&gt;<br>\r\n   &lt;span class=&quot;txt&quot; name=&quot;lk&quot;&gt; Mu&#7889;n gi&#7887;i: m&#7891; hôi &#273;&#7893;&lt;/span&gt; &lt;br&gt;<br>\r\n   &lt;span class=&quot;txt&quot; name=&quot;lk&quot;&gt; Nên h&#7885;c nhóm&lt;/span&gt; &lt;br&gt;\r\n   &lt;script&gt;<br>\r\n      var arr = document.getElementsByName(\'lk\');<br>\r\n   &lt;/script&gt;<br>\r\n<br>\r\nA. Ch&#7885;n các node trong DOM theo name c&#7911;a nó<br>\r\nB. Ch&#7885;n 1 node trong DOM theo name c&#7911;a nó<br>\r\nC. Ch&#7885;n node trong DOM theo tag name<br>\r\nD. Ch&#7885;n các node trong DOM theo class css c&#7911;a nó', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '149'),
(150, '3:36:14 PM', '11/11/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\nint yourAge = 20;<br>\r\nSystem.out.print(yourAge++ + &quot;-&quot; + (++yourAge * 2));<br>\r\n<br>\r\nA. 22-40<br>\r\nB. 20-44<br>\r\nC. Syntax error<br>\r\nD. 20-42', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '150'),
(151, '3:36:14 PM', '11/11/2023', NULL, 'Javascript có các ki&#7875;u d&#7919; li&#7879;u c&#7911;a bi&#7871;n là gì?	<br>\r\nA. Number, String, Boolean	          <br>B. Null, Object\r\n<br>C. Array, Function	                  <br>D. T&#7845;t c&#7843; các lo&#7841;i trên', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '151'),
(152, '3:36:14 PM', '11/11/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\nboolean yourSex = false;<br>\r\nString result = yourSex ? &quot;Male&quot; : &quot;Female&quot;;<br>\r\nSystem.out.println(result);<br>\r\n<br>\r\nA. Female<br>\r\nB. Male<br>\r\nC. Female : Male<br>\r\nD. Có l&#7895;i x&#7843;y ra', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '152'),
(153, '3:36:14 PM', '11/11/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\nint number        = 3;<br>\r\nif(number == 3 ) System.out.print(&quot;A&quot;);<br>\r\nelse if(number >= 3){<br>\r\n    System.out.print(&quot;B&quot;);<br>\r\n}else System.out.print(&quot;C&quot;);<br>\r\n<br>\r\nA. B<br>\r\nB. A<br>\r\nC. Syntax error<br>\r\nD. C', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '153'),
(154, '3:36:14 PM', '11/11/2023', NULL, 'Xem code sau và cho bi&#7871;t k&#7871;t qu&#7843; ti&#7873;n b&#7857;ng bao nhiêu s&#7869; &#273;&#432;&#7907;c xu&#7845;t ra trang web?<br>\r\n   &lt;script&gt;<br>\r\n      var laptop = {<br>\r\n         ten:&quot;Lenovo ThinkBook 15IIL&quot;,<br>\r\n         gia: 12990000,<br>\r\n         soluong: 3,<br>\r\n         khuyenmai: function() { if (this.soluong&gt;2) return 10; else return 5;},<br>\r\n         tien : function(){<br>\r\n            km = this.khuyenmai();<br>\r\n            t = this.soluong*this.gia;<br>\r\n            return t*km/100;<br>\r\n         }<br>\r\n      }; <br>\r\n   &lt;/script&gt;<br>\r\n   &lt;h3&gt;Ti&#7873;n = &lt;script&gt;document.write(laptop.tien() ) &lt;/script&gt;<br>\r\n<br>\r\nA. Ti&#7873;n = 37021500<br>\r\nB. Ti&#7873;n = 38970000<br>\r\nC. Ti&#7873;n = 35073000<br>\r\nD. Code sai không ch&#7841;y', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '154'),
(155, '3:36:14 PM', '11/11/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\nswitch(1) {<br>\r\n    case 1: System.out.print(&quot;Book&quot;);<br>\r\n    case 2: System.out.print(&quot;Author&quot;);<br>\r\n    default: System.out.print(&quot;Missing&quot;);<br>\r\n}<br>\r\n<br>\r\nA. BookAuthorMissing<br>\r\nB. Book<br>\r\nC. Syntax error<br>\r\nD. AuthorMissingBook', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '155'),
(156, '3:36:14 PM', '11/11/2023', NULL, '&#272;o&#7841;n code sau s&#7869; cho k&#7871;t qu&#7843; là<br>\r\n   const a = {};<br>\r\n   const b = { key: \'b\' };<br>\r\n   const c = { key: \'c\' };<br>\r\n      <br>\r\n      &nbsp;&nbsp; a[b] = 123;<br>\r\n      &nbsp;&nbsp; a[c] = 456;<br>\r\n      <br>\r\n      A. 123<br>\r\n      B. 456<br>\r\n      C. undefined<br>\r\n      D. ReferenceError', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '156'),
(157, '3:11:21 PM', '11/11/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\nint number = 3;<br>\r\nString result = &quot;&quot;;<br>\r\nswitch (number) {<br>\r\n    case 2:<br>\r\n        result = &quot;A&quot;;<br>\r\n    case 3:<br>\r\n        result = &quot;B&quot;;<br>\r\n    case 4:<br>\r\n        result = &quot;C&quot;;<br>\r\n        break;<br>\r\n    default:<br>\r\n        result = &quot;Invalid&quot;;<br>\r\n}<br>\r\nSystem.out.println(result);<br>\r\n<br>\r\nA. B<br>\r\nB. A<br>\r\nC. Có l&#7895;i x&#7843;y ra<br>\r\nD. C', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '157'),
(158, '3:36:14 PM', '11/11/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\nint yourNumber     = 7;<br>\r\nint yourAge     = 20;<br>\r\nString result   = &quot;one&quot;;<br>\r\nif(yourNumber % 2 == 0 || yourAge <= 30) {<br>\r\n    if(yourAge >= yourNumber * 2){<br>\r\n        result   = &quot;two&quot;;<br>\r\n    }else {<br>\r\n        result   = &quot;four&quot;;<br>\r\n    }<br>\r\n}else{<br>\r\n    result   = &quot;three&quot;;<br>\r\n}<br>\r\nSystem.out.print(result);<br>\r\n<br>\r\nA. four<br>\r\nB. three<br>\r\nC. one<br>\r\nD. two', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '158'),
(159, '3:36:14 PM', '11/11/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\nint a;<br>\r\nfor(a = 1; a <= 9; a++) {<br>\r\n    if(a % 3 == 0) continue; <br>\r\n    System.out.print(a);<br>\r\n}<br>\r\n<br>\r\nA. 124587<br>\r\nB. 124578<br>\r\nC. 123578<br>\r\nD. Có l&#7895;i x&#7843;y ra', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '159'),
(160, '8:29:55 PM', '11/10/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\nint i = 0;<br>\r\nwhile (i < 6) {<br>\r\n    i+=2;<br>\r\n    if (i == 4) {<br>\r\n        break;<br>\r\n    }<br>\r\n    System.out.print(i);<br>\r\n} <br>\r\n<br>\r\nA. 4<br>\r\nB. 6<br>\r\nC. Có l&#7895;i x&#7843;y ra<br>\r\nD.  2', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '160'),
(161, '3:36:14 PM', '11/11/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\nfor(int j = 0; j <= 10; j+=2){<br>\r\n    if(j == 2) continue;<br>\r\n    if(j == 4) break;<br>\r\n    System.out.print(2*j);<br>\r\n}<br>\r\n<br>\r\nA. 0<br>\r\nB. 2<br>\r\nC. 10<br>\r\nD.  Có l&#7895;i x&#7843;y ra', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '161'),
(162, '3:11:21 PM', '11/11/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\nint number = 5;<br>\r\nwhile (number >= 1) {<br>\r\n    if (number == 2 || number == 4) {<br>\r\n        number--;<br>\r\n        continue;<br>\r\n    }<br>\r\n    System.out.print(number + &quot;-&quot;);<br>\r\n    number--;<br>\r\n} <br>\r\n<br>\r\nA. 4-1-5<br>\r\nB. 1-5-3<br>\r\nC. 5-3-1-<br>\r\nD.  Có l&#7895;i x&#7843;y ra', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '162'),
(163, '3:36:14 PM', '11/11/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\nfor(int a = 1;a <= 5; a++) {<br>\r\n    if(a % 2 == 1) System.out.print(a + 1);<br>\r\n    if(a == 5) a = 2;<br>\r\n    if(a == 4) break;<br>\r\n    if(a == 2) continue;<br>\r\n} <br>\r\n<br>\r\nA. 10<br>\r\nB. 12<br>\r\nC. 24-<br>\r\nD.  Có l&#7895;i x&#7843;y ra', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '163'),
(164, '3:36:14 PM', '11/11/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\nint number = 6, sum = 0;<br>\r\ndo {<br>\r\n    sum  += number;<br>\r\n    number--;<br>\r\n}<br>\r\nwhile (number  > 2);<br>\r\nSystem.out.print(&quot;Sum:&quot; + sum); <br>\r\n<br>\r\nA. 18<br>\r\nB. Sum:18<br>\r\nC. Sum:12-<br>\r\nD.  Có l&#7895;i x&#7843;y ra', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '164'),
(165, '3:36:14 PM', '11/11/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\nfor(int a = 1;a <= 2; a++) {<br>\r\n    for(int b = 2*a; b > a; b--){<br>\r\n        System.out.print(a+b);<br>\r\n    }<br>\r\n} <br>\r\n<br>\r\nA. Có l&#7895;i x&#7843;y ra<br>\r\nB. 365<br>\r\nC. 360<br>\r\nD.  260', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '165'),
(166, '3:36:14 PM', '11/11/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\nint[] arrInt    = {1, 2, 5, 8, 3};<br>\r\nSystem.out.print(arrInt[3] * arrInt[2] - arrInt[arrInt.length  - 1]); <br>\r\n<br>\r\nA. Có l&#7895;i x&#7843;y ra<br>\r\nB. 60<br>\r\nC. 47<br>\r\nD. 37', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '166'),
(167, '3:36:14 PM', '11/11/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\nint[] arrInt = {1, 2, 3, 4, 5, 6};<br>\r\nSystem.out.print(arrInt[arrInt[arrInt[arrInt[2]]]]); <br>\r\n<br>\r\nA. Có l&#7895;i x&#7843;y ra<br>\r\nB. 6<br>\r\nC. 5<br>\r\nD. 4', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '167'),
(168, '3:36:14 PM', '11/11/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\nString[] arrCourseName = {&quot;Java&quot;, &quot;Frontend&quot;, &quot;PHP&quot;};<br>\r\nfor (String courseName : arrCourseName) {<br>\r\n    System.out.print(courseName + &quot;-&quot;);<br>\r\n} <br>\r\n<br>\r\nA. Java-Frontend-PHP<br>\r\nB. Có l&#7895;i x&#7843;y ra<br>\r\nC. Java-Frontend<br>\r\nD. Java-Frontend-PHP-', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '168'),
(169, '5:46:21 PM', '11/11/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\nint[] arrInt = {1, 2, 3, 5, 8, 13, 21, 34, 55};<br>\r\nint sum = 0;<br>\r\nfor (int i = 0; i < 3; i++) { <br>\r\n    sum += arrInt[arrInt[i]];    <br>\r\n}<br>\r\nSystem.out.print(sum); <br>\r\n<br>\r\nA. 10<br>\r\nB. Có l&#7895;i x&#7843;y ra<br>\r\nC. 13<br>\r\nD. 55', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '169'),
(170, '5:46:21 PM', '11/11/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\nint[] arrInt             = {1, 2, 5};<br>\r\nString arrString[]     = { &quot;A&quot;, &quot;B&quot;, &quot;C&quot;, &quot;D&quot; };<br>\r\nint sumEven            = 0;<br>\r\n<br>\r\nfor(int i=0; i< arrInt.length; i++) {<br>\r\n    if( arrInt[i] %2 == 0 ) sumEven += arrInt[i]; <br>\r\n    arrString[i] += sumEven;<br>\r\n}<br>\r\nSystem.out.print(arrString[0] +  arrInt[1] + arrString[2]); <br>\r\n<br>\r\nA. C20A2<br>\r\nB. Có l&#7895;i x&#7843;y ra<br>\r\nC. A02C2<br>\r\nD. C2A02', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '170'),
(171, '2:34:28 PM', '11/11/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\nString str = &quot;JAVA&quot;;<br>\r\nSystem.out.printf(&quot;-%s-%d&quot;, str, str.length()); <br>\r\n<br>\r\nA. JAVA<br>\r\nB. Có l&#7895;i x&#7843;y ra<br>\r\nC. JAVA-4<br>\r\nD. -JAVA-4', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '171'),
(172, '2:34:28 PM', '11/11/2023', NULL, '&#272;&#7875; ki&#7875;m tra user có ch&#7885;n t&#7881;nh ch&#432;a. L&#7879;nh nào b&#7841;n s&#7869; ch&#7885;n &#273;&#7875; &#273;&#7863;t &#7903; v&#7883; trí zzz<br>\r\n   &lt;form name=&quot;frm&quot; onsubmit=&quot;return kiemtra()&quot;&gt; <br>\r\n      &lt;select name=&quot;chontinh&quot;&gt;<br>\r\n         &lt;option value=&quot;chuachon&quot;&gt;B&#7841;n &#7903; t&#7881;nh nào?&lt;/option&gt;<br>\r\n         &lt;option value=&quot;bentre&quot;&gt;B&#7871;n Tre&lt;/option&gt;<br>\r\n         &lt;option value=&quot;hcm&quot;&gt;H&#7891; Chí Minh&lt;/option&gt;<br>\r\n         &lt;option value=&quot;hanoi&quot;&gt;Hà N&#7897;i&lt;/option&gt;        <br>\r\n      &lt;/select&gt;<br>\r\n      &lt;button type=&quot;submit&quot;&gt;Send&lt;/button&gt;<br>\r\n   &lt;/form&gt;<br>\r\n   &lt;script&gt;<br>\r\n      function kiemtra(){       <br>\r\n         if ( zzz ) {<br>\r\n            alert(&quot;B&#7841;n ch&#432;a ch&#7885;n t&#7881;nh&quot;);<br>\r\n            return false;<br>\r\n         }<br>\r\n         return true;<br>\r\n      }<br>\r\n   &lt;/script&gt;<br>\r\n<br>\r\nA. document.frm.chontinh==&quot;chuachon&quot;<br>\r\nB. document.getElementById(\'chontinh\').value == &quot;chuachon&quot;<br>\r\nC. document.getElementById(\'chontinh\') == &quot;chuachon&quot;<br>\r\nD. document.frm.chontinh.value==&quot;chuachon&quot;', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '172');
INSERT INTO `level01r` (`ID`, `Time`, `Ngay_lap_de`, `Nguoi_lap_de`, `c1`, `c2`, `c3`, `c4`, `c5`, `Mon_hp`, `Codes`, `qq1`, `qq2`, `qq3`, `qq4`, `qq5`, `CustomerID`) VALUES
(173, '2:34:28 PM', '11/11/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\nString str = &quot;89&quot;;<br>\r\nSystem.out.print(&quot;Java &quot;.trim().concat(str));<br>\r\n<br>\r\nA. 89<br>\r\nB. Java<br>\r\nC. Java89<br>\r\nD. Có l&#7895;i x&#7843;y ra', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '173'),
(174, '5:46:21 PM', '11/11/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\nString str1    = &quot;ab&quot;;<br>\r\nString str2    = &quot;cd&quot;;<br>\r\nstr1           = str1 + str2;<br>\r\nString str3 = &quot;abc&quot;;<br>\r\nstr1 += str3.charAt(1);<br>\r\nSystem.out.print(str1);<br>\r\n<br>\r\nA. abcdbab<br>\r\nB. abcdb<br>\r\nC. abdcb<br>\r\nD. Có l&#7895;i x&#7843;y ra', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'B', NULL, NULL, NULL, NULL, '174'),
(175, '5:46:21 PM', '11/11/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\npublic static void main(String[] args) { <br>\r\n    String name = &quot;john&quot;;<br>\r\n    int age = 2;<br>\r\n    String result = myPrint(name.concat(&quot;-ok&quot;), age + 4);<br>\r\n<br>\r\n    System.out.print(result);<br>\r\n}<br>\r\npublic static String myPrint(String name, int age){<br>\r\n    return name.concat(&quot;+&quot;) + age * 2;<br>\r\n}<br>\r\n<br>\r\nA. john-ok12<br>\r\nB. john-ok-12<br>\r\nC. Có l&#7895;i x&#7843;y ra<br>\r\nD. john-ok+12', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '175'),
(176, '5:46:21 PM', '11/11/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\npublic static void main(String[] args) {    <br>\r\n    String str1         = createString(\'+\');<br>\r\n    String str2         = createString(\'-\');<br>\r\n    System.out.println(str1 + &quot;+&quot; + str2);<br>\r\n}<br>\r\npublic static String createString(char c) { <br>\r\n    return c + &quot;+&quot;;<br>\r\n}<br>\r\n<br>\r\nA. ++++-<br>\r\nB. ++-++<br>\r\nC. +++++<br>\r\nD. +++-+', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '176'),
(177, '5:46:21 PM', '11/11/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\nint arrOne[] = { 1, 2, 3, 4, 5, 6 };<br>\r\nString arrTwo[] = { &quot;a&quot;, &quot;b&quot;, &quot;c&quot; };<br>\r\nString result    = &quot;&quot;;<br>\r\nfor(int i = 0;i < arrTwo.length; i++) {<br>\r\n    result += arrOne[i] + arrTwo[i] + arrOne[i+1];<br>\r\n}<br>\r\nSystem.out.print(result.charAt(result.length()-2) + &quot;zvn&quot;.toUpperCase()); <br>\r\n<br>\r\nA. cZVN<br>\r\nB. ZVN<br>\r\nC. ZVNc<br>\r\nD. Có l&#7895;i x&#7843;y ra', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'A', NULL, NULL, NULL, NULL, '177'),
(178, '5:46:21 PM', '11/11/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\nString str         = &quot;hailan&quot;;    <br>\r\nint arrOne[]          = { 1, 2, 3};<br>\r\nString result         = &quot;&quot;;<br>\r\nfor(int i = 1;i < arrOne.length; i++) {<br>\r\n    result += str.charAt(arrOne[i]) ;<br>\r\n}<br>\r\nSystem.out.print(result); <br>\r\n<br>\r\nA. li<br>\r\nB. hailan<br>\r\nC. lan<br>\r\nD. il', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '178'),
(179, '5:46:21 PM', '11/11/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\nString str         = &quot;hailan&quot;;    <br>\r\nint arrOne[]     = { 1, 2, 3, 4, 5};<br>\r\nString[] result= { &quot;a&quot;, &quot;b&quot;, &quot;c&quot;, &quot;d&quot;};<br>\r\nfor(int i = 1;i < arrOne.length; i+=2) {<br>\r\n    result[i] += str.charAt(str.length() - i);<br>\r\n}<br>\r\nSystem.out.print(String.join(&quot;-&quot;, result)); <br>\r\n<br>\r\nA. abnc-dl<br>\r\nB. abn-c-dl<br>\r\nC. a-bn-c-dl<br>\r\nD. a-bn-cdl', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'C', NULL, NULL, NULL, NULL, '179'),
(180, '7:03:20 PM', '11/11/2023', NULL, 'Trong Java, sau khi th&#7921;c hi&#7879;n &#273;o&#7841;n mã k&#7871;t qu&#7843; hi&#7875;n th&#7883; s&#7869; là gì?<br>\r\nString str     = &quot;vOryoasy!&quot;;<br>\r\nSystem.out.print(str.replace(&quot;o&quot;, &quot;e&quot;));  <br>\r\n<br>\r\nA. vOryeasy<br>\r\nB. vOryeasyo<br>\r\nC. Có l&#7895;i x&#7843;y ra<br>\r\nD. vOryeasy!', NULL, NULL, NULL, NULL, 'Lập trình Javascript căn bản', NULL, 'D', NULL, NULL, NULL, NULL, '180');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `level02`
--

CREATE TABLE `level02` (
  `ID` int(11) DEFAULT NULL,
  `MaDe` varchar(5) DEFAULT NULL,
  `TgianLapDe` datetime DEFAULT NULL,
  `TotalQues` int(11) DEFAULT NULL,
  `c1` text DEFAULT NULL,
  `c2` text DEFAULT NULL,
  `c3` text DEFAULT NULL,
  `c4` text DEFAULT NULL,
  `c5` text DEFAULT NULL,
  `c6` text DEFAULT NULL,
  `c7` text DEFAULT NULL,
  `c8` text DEFAULT NULL,
  `c9` text DEFAULT NULL,
  `c10` text DEFAULT NULL,
  `c11` text DEFAULT NULL,
  `c12` text DEFAULT NULL,
  `c13` text DEFAULT NULL,
  `c14` text DEFAULT NULL,
  `c15` text DEFAULT NULL,
  `c16` text DEFAULT NULL,
  `c17` text DEFAULT NULL,
  `c18` text DEFAULT NULL,
  `c19` text DEFAULT NULL,
  `c20` text DEFAULT NULL,
  `c21` text DEFAULT NULL,
  `c22` text DEFAULT NULL,
  `c23` text DEFAULT NULL,
  `c24` text DEFAULT NULL,
  `c25` text DEFAULT NULL,
  `c26` text DEFAULT NULL,
  `c27` text DEFAULT NULL,
  `c28` text DEFAULT NULL,
  `c29` text DEFAULT NULL,
  `c30` text DEFAULT NULL,
  `c31` text DEFAULT NULL,
  `c32` text DEFAULT NULL,
  `c33` text DEFAULT NULL,
  `c34` text DEFAULT NULL,
  `c35` text DEFAULT NULL,
  `c36` text DEFAULT NULL,
  `c37` text DEFAULT NULL,
  `c38` text DEFAULT NULL,
  `c39` text DEFAULT NULL,
  `c40` text DEFAULT NULL,
  `TenMon` text DEFAULT NULL,
  `qq1` varchar(5) DEFAULT NULL,
  `qq2` varchar(5) DEFAULT NULL,
  `qq3` varchar(5) DEFAULT NULL,
  `qq4` varchar(5) DEFAULT NULL,
  `qq5` varchar(5) DEFAULT NULL,
  `qq6` varchar(5) DEFAULT NULL,
  `qq7` varchar(5) DEFAULT NULL,
  `qq8` varchar(5) DEFAULT NULL,
  `qq9` varchar(5) DEFAULT NULL,
  `qq10` varchar(5) DEFAULT NULL,
  `qq11` varchar(5) DEFAULT NULL,
  `qq12` varchar(5) DEFAULT NULL,
  `qq13` varchar(5) DEFAULT NULL,
  `qq14` varchar(5) DEFAULT NULL,
  `qq15` varchar(5) DEFAULT NULL,
  `qq16` varchar(5) DEFAULT NULL,
  `qq17` varchar(5) DEFAULT NULL,
  `qq18` varchar(5) DEFAULT NULL,
  `qq19` varchar(5) DEFAULT NULL,
  `qq20` varchar(5) DEFAULT NULL,
  `qq21` varchar(5) DEFAULT NULL,
  `qq22` varchar(5) DEFAULT NULL,
  `qq23` varchar(5) DEFAULT NULL,
  `qq24` varchar(5) DEFAULT NULL,
  `qq25` varchar(5) DEFAULT NULL,
  `qq26` varchar(5) DEFAULT NULL,
  `qq27` varchar(5) DEFAULT NULL,
  `qq28` varchar(5) DEFAULT NULL,
  `qq29` varchar(5) DEFAULT NULL,
  `qq30` varchar(5) DEFAULT NULL,
  `qq31` varchar(5) DEFAULT NULL,
  `qq32` varchar(5) DEFAULT NULL,
  `qq33` varchar(5) DEFAULT NULL,
  `qq34` varchar(5) DEFAULT NULL,
  `qq35` varchar(5) DEFAULT NULL,
  `qq36` varchar(5) DEFAULT NULL,
  `qq37` varchar(5) DEFAULT NULL,
  `qq38` varchar(5) DEFAULT NULL,
  `qq39` varchar(5) DEFAULT NULL,
  `qq40` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `level02r`
--

CREATE TABLE `level02r` (
  `ID` smallint(5) DEFAULT NULL,
  `Time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Ngay_lap_de` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Nguoi_lap_de` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `c1` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `c2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `c3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `c4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `c5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Mon_hp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Codes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `qq1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `qq2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `qq3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `qq4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `qq5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CustomerID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `level02r`
--

INSERT INTO `level02r` (`ID`, `Time`, `Ngay_lap_de`, `Nguoi_lap_de`, `c1`, `c2`, `c3`, `c4`, `c5`, `Mon_hp`, `Codes`, `qq1`, `qq2`, `qq3`, `qq4`, `qq5`, `CustomerID`) VALUES
(80, '10:13:02 AM', '11/17/2023', '', 'L&#7879;nh SQL nào sau &#273;ây vi&#7871;t &#273;úng cú pháp?<br>	\nA. SELECT * <br>\nFROM Table1 <br>\nWHERE Column1 =&gt; 10<br>\nB. SELECT * <br>\nFROM Table1 <br>\nWHERE Column1 == 10<br>\nC. SELECT * <br>\nFROM Table1 <br>\nWHERE Column1 &gt;= 10<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '80'),
(81, '10:21:06 AM', '11/17/2023', '', 'Y&#7871;u t&#7889; nào n&#7857;m sau m&#7879;nh &#273;&#7873; WHERE trong SQL?<br>	\nA. Tên b&#7843;ng &#273;ang s&#7917; d&#7909;ng &#273;&#7875; l&#7845;y b&#7843;n ghi<br>	\nB. &#272;i&#7873;u ki&#7879;n c&#7847;n &#273;áp &#7913;ng cho các hàng &#273;&#432;&#7907;c tr&#7843; v&#7873;<br>	\nC. Danh sách các c&#7897;t &#273;&#432;&#7907;c ch&#7885;n<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '81'),
(82, '10:54:51 AM', '11/17/2023', '', 'Câu l&#7879;nh SQL nào sau &#273;ây xóa t&#7845;t c&#7843; các b&#7843;n ghi trong b&#7843;ng Sales?<br>	\nA. DELETE FROM Sales<br>	\nB. DELETE Sales<br>	\nC. DELETE * FROM Sales<br>	\nD. DELETE ALL Sales<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '82'),
(83, '11:13:07 AM', '11/17/2023', '', 'L&#7879;nh INSERT &#273;&#432;&#7907;c s&#7917; d&#7909;ng &#273;&#7875; làm gì?<br>	\nA. &#272;&#7875; l&#7845;y d&#7919; li&#7879;u<br>\nB. &#272;&#7875; chèn d&#7919; li&#7879;u<br>	\nC. &#272;&#7875; s&#7917;a &#273;&#7893;i d&#7919; li&#7879;u<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '83'),
(84, '2:46:47 PM', '11/17/2023', '', 'Th&#7913; t&#7921; &#273;úng c&#7911;a toán t&#7917; &quot;&gt;&quot; và &quot;=&quot; là gì khi mu&#7889;n ch&#7881; &#273;&#7883;nh &#273;i&#7873;u ki&#7879;n tìm ki&#7871;m l&#7899;n h&#417;n ho&#7863;c b&#7857;ng nhau?<br>	\nA. &gt;=<br>	\nB. =&gt;<br>	\nC. C&#7843; 2 &#273;áp án &#273;&#7873;u &#273;úng<br>	\nD. C&#7843; 2 &#273;áp án &#273;&#7873;u sai<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '84'),
(85, '2:57:47 PM', '11/17/2023', '', 'L&#7879;nh UNION &#273;&#432;&#7907;c s&#7917; d&#7909;ng &#273;&#7875; k&#7871;t h&#7907;p các k&#7871;t qu&#7843; t&#7915; nhi&#7873;u truy v&#7845;n vào m&#7897;t t&#7853;p k&#7871;t qu&#7843;. &#272;ÚNG hay SAI?<br>	\nA. &#272;úng<br>	\nB. Sai<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '85'),
(86, '3:09:41 PM', '11/17/2023', '', 'Trong các hàm d&#432;&#7899;i &#273;ây, &#273;âu là hàm t&#7853;p h&#7907;p trong SQL?<br>	\nA. CURDATE()<br>	\nB. COUNT<br>	\nC. AVERAGE<br>	\nD. MAXIMUM<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '86'),
(87, '3:22:38 PM', '11/17/2023', '', 'L&#7879;nh GROUP BY không th&#7875; s&#7917; d&#7909;ng v&#7899;i các hàm t&#7853;p h&#7907;p. &#272;ÚNG hay SAI?<br>	\nA. &#272;úng<br>	\nB. Sai<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '87'),
(88, '3:34:30 PM', '11/17/2023', '', 'Câu l&#7879;nh nào sau &#273;ây s&#7869; th&#7921;c thi thành công?<br>	\nA. SELECT customer <br>\nFROM customer_name;<br>\nB. SELECT <br>\nFROM customers customer name;<br>\nC. SELECT customer_name <br>\nFROM customers <br>\nORDER BY zone <br>\nWHERE cat_id = 12;<br>\nD. SELECT customer_name <br>\nFROM customers <br>\nWHERE cat_id = 12 <br>\nORDER BY cat_id;<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '88'),
(89, '3:42:11 PM', '11/17/2023', '', 'M&#7879;nh &#273;&#7873; ORDER &#273;&#432;&#7907;c s&#7917; d&#7909;ng &#273;&#7875; s&#7855;p x&#7871;p các b&#7843;n ghi theo th&#7913; t&#7921; t&#259;ng d&#7847;n ho&#7863;c gi&#7843;m d&#7847;n. &#272;ÚNG hay SAI?<br>	\nA. &#272;úng<br>	\nB. Sai<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '89'),
(90, '3:52:09 PM', '11/17/2023', '', 'Câu l&#7879;nh SQL nào sau &#273;ây s&#7869; phát sinh l&#7895;i khi th&#7921;c thi?<br>	\nA. CREATE DATABASE students<br>	\nB. CREATE DATABASE students;<br>	\nC. create database if not exists students<br>	\nD. IF NOT EXISTS CREATE DATABASE STUDENTS;<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '90'),
(91, '8:40:53 PM', '11/14/2023', '', 'DML &#273;&#432;&#7907;c vi&#7871;t t&#7855;t b&#7903;i...<br>	\nA. Different Mode Level<br>	\nB. Data Manipulation Language<br>	\nC. Data Mode Lane<br>	\nD. Data Model Language<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '91'),
(92, '11:13:38 AM', '11/16/2023', '', 'SQL &#273;&#7841;t chu&#7849;n qu&#7889;c t&#7871; nào?<br>	\nA. ISO<br>	\nB. ANSI<br>	\nC. C&#7843; ISO và ANSI<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '92'),
(93, '11:23:02 AM', '11/16/2023', '', 'VIEW trong SQL có ngh&#297;a là gì?<br>	\nA. Là m&#7897;t s&#417; &#273;&#7891; c&#417; s&#7903; d&#7919; li&#7879;u<br>	\nB. Là m&#7897;t b&#7843;ng &#7843;o trong c&#417; s&#7903; d&#7919; li&#7879;u có n&#7897;i dung &#273;&#432;&#7907;c &#273;&#7883;nh ngh&#297;a thông qua m&#7897;t câu l&#7879;nh SQL nào &#273;ó<br>	\nC. Là m&#7897;t th&#7911; t&#7909;c &#273;&#432;&#7907;c l&#432;u tr&#7919; &#273;&#7863;c bi&#7879;t th&#7921;c hi&#7879;n khi s&#7921; ki&#7879;n nào &#273;ó x&#7843;y ra<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '93'),
(94, '8:07:26 PM', '11/16/2023', '', 'T&#7915; khóa SQL nào &#273;&#432;&#7907;c s&#7917; d&#7909;ng &#273;&#7875; ch&#7881; truy xu&#7845;t các giá tr&#7883; duy nh&#7845;t?<br>	\nA. DISTINCTIVE<br>	\nB. UNIQUE<br>	\nC. DISTINCT<br>	\nD. DIFFERENT<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '94'),
(95, '8:20:31 PM', '11/16/2023', '', 'Câu l&#7879;nh SQL nào sau &#273;ây có cú pháp &#273;úng?<br>	\nA. SELECT Username, Password <br>\nWHERE Username=&apos;user1&apos;<br>\nB. SELECT Username AND Password <br>\nFROM Users<br>\nC. SELECT Username, Password <br>\nFROM Users<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '95'),
(161, '5:14:39 PM', '11/17/2023', '', 'DML là vi&#7871;t t&#7855;t c&#7911;a: <br>\n		A. Dedicated Manipulation Language <br>\n		B. Data Management Language <br>\n		C. Data Manipulation Language <br>\n		D. Data Markup Language', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '161'),
(162, '12:16:26 AM', '11/18/2023', '', 'R&#7855;c r&#7889;i nào x&#7843;y ra khi primary key cho phép có giá tr&#7883; NULL: <br>\n		A. Khó xác &#273;&#7883;nh tính duy nh&#7845;t c&#7911;a các hàng <br>\n		B. Khó xác &#273;&#7883;nh tính duy nh&#7845;t c&#7911;a các c&#7897;t <br>\n		C. Khó k&#7871;t n&#7889;i các b&#7843;ng <br>\n		D. Khó xác &#273;&#7883;nh foreign key ', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '162'),
(163, '9:02:06 AM', '11/18/2023', '', 'B&#7843;ng tmpCount &#273;&#432;&#7907;c t&#7841;o ra v&#7899;i khoá chính ID là tr&#432;&#7901;ng s&#7889; t&#7921; &#273;&#7897;ng và \n		tr&#432;&#7901;ng page (s&#7889; trang) ph&#7843;i nh&#7887; h&#417;n 50. L&#7879;nh nào sau &#273;ây là h&#7907;p l&#7879;: <br>\n		A. Create table tmpCount (id int identity(1,1), page int constraint \n		check page between 1 and 49) <br>\n		B. Create table tmpCount (id int identity(1,1), page char constraint \n		check page between 1 and 49) <br>\n		C. Create table tmpCount (id char identity(1,1), page int constraint \n		check page between 1 and 49) <br>\n		D. Create table tmpCount (id int identity(1,1), page int constraint \n		check page between 1 and 50)&nbsp;', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '163'),
(164, '9:01:30 AM', '11/18/2023', '', 'Các ch&#7881; m&#7909;c (Index) &#273;&#432;&#7907;c xây d&#7921;ng d&#7921;a trên m&#7897;t hay m&#7897;t s&#7889; Field trong \n		table. Khi &#273;ó các Field này &#273;&#432;&#7907;c g&#7885;i là: <br>\n		A. The secondary key <br>\n		B. The primary key <br>\n		C. The major key <br>\n		D. The index key ', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '164'),
(165, '9:08:20 AM', '11/18/2023', '', 'Trong SQL Server , &#273;&#7875; t&#7841;o và xoá m&#7897;t user_defined data type , ta có th&#7875; \n		s&#7917; d&#7909;ng: <br>\n		A. CREATE UDDT and DROP UDDT <br>\n		B. sp_addtype and sp_unbindtype <br>\n		C. sp_bindtype and sp_droptype <br>\n		D. sp_addtype and sp_droptype', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '165'),
(166, '9:18:23 AM', '11/18/2023', '', 'Index có th&#7875; &#273;&#432;&#7907;c t&#7841;o trên lo&#7841;i &#273;&#7889;i t&#432;&#7907;ng: <br>\n		A. Temporary table và view <br>\n		B. Table và view <br>\n		C. View <br>\n		D. Table', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '166'),
(167, '9:37:02 AM', '11/18/2023', '', 'DDL là vi&#7871;t t&#7855;t c&#7911;a: <br>\n		A. Data Definition Language <br>\n		B. Data Design Language <br>\n		C. Data Development Language <br>\n		D. Data Diagnostic Language', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '167'),
(168, '9:57:03 AM', '11/18/2023', '', 'B&#7841;n &#273;ang qu&#7843;n tr&#7883; m&#7897;t Database server. Server ch&#7913;a nhi&#7873;u database c&#7911;a \n		nhi&#7873;u khách hàng. M&#7897;t vài database không còn s&#7917; d&#7909;ng n&#7919;a. B&#7841;n quy&#7871;t &#273;&#7883;nh \n		xóa 3 database là Student1, Student2, Student3 &#273;&#7875; gi&#7843;i phóng không gian \n		l&#432;u tr&#7919; trên &#273;&#297;a. L&#7879;nh nào b&#7841;n s&#7869; ch&#7885;n &#273;&#7875; th&#7921;c hi&#7879;n vi&#7879;c này: <br>\n		A. DELETE Student1<br>\n		GO<br>\n		DELETE Student2<br>\n		GO<br>\n		DELETE Student3<br>\n		B. EXEC sp_dropdatabase Student1<br>\n		EXEC sp_dropdatabase Student2<br>\n		EXEC sp_dropdatabase Student3<br>\n		C. DROP DATABASE \'Student%\'<br>\n		D. DROP DATABASE Student1, Student2, Student3', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '168'),
(169, '10:08:07 AM', '11/18/2023', '', 'B&#7841;n &#273;ã t&#7841;o m&#7897;t database cho &#7913;ng d&#7909;ng Qu&#7843;n lý Hi&#7879;u su&#7845;t công vi&#7879;c c&#7911;a \n		công ty NorthWind Trader. <br>\n		CREATE DATABASE Efficiency <br>\n		ON PRIMARY <br>\n		( NAME = EfficiencyData, <br>\n		FILENAME = N\'c:\\data\\EfficiencyData.mdf\', <br>\n		SIZE = 200, <br>\n		MAXSIZE = 400, <br>\n		FILEGROWTH = 10) <br>\n		LOG ON <br>\n		( NAME = EfficiencyLog, <br>\n		FILENAME = N\'d:\\data\\EfficiencyLog.ldf\', <br>\n		SIZE = 50, <br>\n		MAXSIZE = 100, <br>\n		FILEGROWTH = 10) <br>\n		Sau m&#7897;t th&#7901;i gian s&#7917; d&#7909;ng, b&#7841;n th&#7845;y c&#7847;n ph&#7843;i t&#259;ng kích th&#432;&#7899;c cho data \n		file &#273;&#7871;n 500MB. Câu l&#7879;nh nào giúp b&#7841;n th&#7921;c hi&#7879;n vi&#7879;c này: <br>\n		A. MODIFY FILE <br>\n		(NAME = EfficiencyData, <br>\n		MAXSIZE = 500MB) <br>\n		B. ALTER FILE EfficiencyData <br>\n		(MAXSIZE = 500MB) <br>\n		C. sp_filemaxsize EfficiencyData, 500 <br>\n		D. INCREASE FILE EfficiencyData TO 500MB', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '169'),
(170, '10:13:46 AM', '11/18/2023', '', 'Phát bi&#7875;u nào sau &#273;ây là &#273;úng khi nói v&#7873; ch&#7881; m&#7909;c nonclustered: <br>\n		A. Ch&#7881; m&#7909;c nonclustered &#273;&#432;&#7907;c t&#7841;o ch&#7911; y&#7871;u là trên khoá ngo&#7841;i <br>\n		B. Ch&#7881; có duy nh&#7845;t m&#7897;t ch&#7881; m&#7909;c nonclustered cho m&#7895;i b&#7843;ng <br>\n		C. Ch&#7881; m&#7909;c nonclustered nên &#273;&#432;&#7907;c t&#7841;o tr&#432;&#7899;c khi t&#7841;o ch&#7881; m&#7909;c clustered <br>\n		D. Ch&#7881; m&#7909;c nonclustered không b&#7855;t bu&#7897;c tính duy nh&#7845;t c&#7911;a các b&#7843;n ghi ', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '170'),
(171, '5:14:39 PM', '11/17/2023', '', 'Th&#7911; t&#7909;c h&#7879; th&#7889;ng nào &#273;&#432;&#7907;c dùng &#273;&#7875; xem thông tin v&#7873; các &#273;&#7889;i t&#432;&#7907;ng c&#7911;a \n		Database c&#361;ng nh&#432; lo&#7841;i d&#7919; li&#7879;u c&#7911;a ng&#432;&#7901;i dùng: <br>\n		A. sp_lock <br>\n		B. sp_helptext <br>\n		C. sp_help <br>\n		D. sp_helpuser', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '171'),
(172, '12:16:26 AM', '11/18/2023', '', 'Trong câu l&#7879;nh INSERT, t&#7915; khoá DEFAULT &#273;&#432;&#7907;c s&#7917; d&#7909;ng trong m&#7879;nh &#273;&#7873; VALUES \n		&#273;&#432;&#7907;c dùng v&#7899;i m&#7909;c &#273;ích gì? <br>\n		A. &#272;&#7883;nh ngh&#297;a m&#7897;t giá tr&#7883; default cho m&#7897;t c&#7897;t <br>\n		B. Ch&#7881; &#273;&#7883;nh l&#7879;nh &#273;&#432;&#7907;c s&#7917; d&#7909;ng giá tr&#7883; Default nh&#7853;p vào cho m&#7897;t c&#7897;t <br>\n		C. Ch&#7881; &#273;&#7883;nh l&#7879;nh &#273;&#432;&#7907;c s&#7917; d&#7909;ng giá tr&#7883; Default &#273;&#7875; nh&#7853;p cho t&#7845;t c&#7843; các c&#7897;t\n		<br>\n		D. Ch&#7881; &#273;&#7883;nh l&#7879;nh &#273;&#432;&#7907;c s&#7917; d&#7909;ng giá tr&#7883; Default &#273;&#7875; nh&#7853;p cho m&#7897;t c&#7897;t n&#7871;u \n		c&#7897;t ch&#7845;p nh&#7853;n tr&#7883; NULL ', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '172'),
(173, '9:02:06 AM', '11/18/2023', '', 'L&#7879;nh Insert &#273;&#432;&#7907;c dùng &#273;&#7875; nh&#7853;p d&#7919; li&#7879;u vào b&#7843;ng. B&#7841;n có th&#7875; vi&#7871;t trong \n		m&#7879;nh &#273;&#7873; insert m&#7897;t danh sách các c&#7897;t c&#7911;a b&#7843;ng. &#272;i&#7873;u này có ý ngh&#297;a gì?\n		<br>\n		A. Ch&#7881; &#273;&#7883;nh danh sách các c&#7897;t mà d&#7919; li&#7879;u s&#7869; &#273;&#432;&#7907;c nh&#7853;p vào <br>\n		B. Ch&#7881; &#273;&#7883;nh các giá tr&#7883; s&#7869; &#273;&#432;&#7907;c nh&#7853;p vào b&#7843;ng <br>\n		C. Ch&#7881; &#273;&#7883;nh danh sách các c&#7897;t mà d&#7919; li&#7879;u s&#7869; không &#273;&#432;&#7907;c nh&#7853;p vào <br>\n		D. T&#7845;t c&#7843; các câu trên &#273;&#7873;u sai', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '173'),
(174, '9:01:30 AM', '11/18/2023', '', 'Xem xét l&#7879;nh t&#7841;o b&#7843;ng R:&nbsp; <br>\n		CREATE TABLE R <br>\n		( <br>\n		a int IDENTITY (1,1), <br>\n		b int , <br>\n		c int DEFAULT(100) <br>\n		) <br>\n		N&#7871;u thi hành m&#7897;t l&#7879;nh INSERT b&#7887; qua danh sách c&#7897;t trong m&#7879;nh &#273;&#7873; Insert (ví \n		d&#7909; nh&#432;: INSERT R VALUES …..) thì b&#7841;n c&#7847;n ph&#7843;i li&#7879;t kê nh&#7919;ng c&#7897;t nào \n		trong m&#7879;nh &#273;&#7873; values? <br>\n		(Gi&#7843; &#273;&#7883;nh thu&#7897;c tính IDENTITY_INSERT &#273;ang &#273;&#432;&#7907;c set là OFF) <br>\n		A. T&#7845;t c&#7843; các c&#7897;t c&#7911;a b&#7843;ng <br>\n		B. T&#7845;t c&#7843; các c&#7897;t c&#7911;a b&#7843;ng tr&#7915; c&#7897;t IDENTITY <br>\n		C. T&#7845;t c&#7843; các c&#7897;t c&#7911;a b&#7843;ng tr&#7915; c&#7897;t ch&#7845;p nh&#7853;n tr&#7883; NULL <br>\n		D. T&#7845;t c&#7843; các c&#7897;t c&#7911;a b&#7843;ng tr&#7915; c&#7897;t có giá tr&#7883; DEFAULT', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '174'),
(175, '9:08:20 AM', '11/18/2023', '', 'B&#7841;n &#273;ang vi&#7871;t m&#7897;t câu l&#7879;nh Insert &#273;&#7875; nh&#7853;p t&#7915;ng row vào b&#7843;ng Customers. \n		Câu l&#7879;nh s&#7869; &#273;&#432;&#7907;c &#273;&#7863;t trong m&#7897;t store procedure, và các giá tr&#7883; nh&#7853;p &#273;&#432;&#7907;c \n		truy&#7873;n d&#432;&#7899;i d&#7841;ng tham s&#7889;. B&#7841;n mu&#7889;n l&#7879;nh thi hành k&#7875; c&#7843; khi ch&#432;a nh&#7853;n \n		&#273;&#432;&#7907;c &#273;&#7911; các giá tr&#7883; &#7913;ng v&#7899;i các c&#7897;t trong b&#7843;ng. Bi&#7871;t r&#7857;ng b&#7843;ng Customers \n		&#273;ã &#273;&#432;&#7907;c thi&#7871;t k&#7871; v&#7899;i t&#7845;t c&#7843; các c&#7897;t &#273;&#7873;u có giá tr&#7883; Default. Hãy ch&#7881; ra \n		câu l&#7879;nh nào sau là &#273;úng v&#7899;i tr&#432;&#7901;ng h&#7907;p này: <br>\n		A. INSERT Customers (Name, CID, *) VALUES (@c, @id, DEFAULT) <br>\n		B. INSERT Customers DEFAULTS EXCEPT (Name = @c, CID = @id) <br>\n		C. INSERT Customers (Name, CID) VALUES (@c, @id) WITH DEFAULT <br>\n		D. INSERT Customers (Name, CID) VALUES (@c, @id) ', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '175'),
(176, '9:18:23 AM', '11/18/2023', '', 'L&#7879;nh nào có công d&#7909;ng sao chép d&#7919; li&#7879;u c&#7911;a m&#7897;t b&#7843;ng sang m&#7897;t b&#7843;ng khác?\n		<br>\n		A. L&#7879;nh SELECT INTO <br>\n		B. L&#7879;nh INSERT INTO <br>\n		C. L&#7879;nh UPDATE INTO <br>\n		D. C&#7843; hai l&#7879;nh INSERT INTO và SELECT INTO', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '176'),
(128, '9:57:03 AM', '11/18/2023', '', 'Câu l&#7879;nh SQL nào s&#7917; d&#7909;ng &#273;&#7875; xóa hàng có ID_SACH=15?<br>	\nA. TRUNCATE TABLE THONGTIN_SACH<br>\nWHERE ID_SACH = 15;<br>\nB. DELETE FROM THONGTIN_SACH<br>\nWHERE ID_SACH = 15;<br>\nC. DROP THONGTIN_SACH<br>\nWHERE ID_SACH = 15;<br>\nD. TRUNCATE THONGTIN_SACH<br>\nWHERE ID_SACH = 15;<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '128'),
(129, '10:08:07 AM', '11/18/2023', '', 'Câu l&#7879;nh SQL nào s&#7917; d&#7909;ng &#273;&#7875; thay &#273;&#7893;i giá cho SACH có tiêu &#273;&#7873; &apos;HOC SQL TU W3SCHOOL.COM&apos; THÀNH 200000?<br>\nA. UPDATE THONGTIN_SACH<br>\nSET GIA = 200000<br>\nWHERE TEN_SACH = &apos;HOC SQL TU W3SCHOOL.COM&apos;;<br>\nB. UPDATE TABLE THONGTIN_SACH<br>\nSET GIA = 200000<br>\nWHERE TEN_SACH = &apos;HOC SQL TU W3SCHOOL.COM&apos;;<br>\nC. UPDATE THONGTIN_SACH<br>\nCHANGE GIA = 200000<br>\nWHERE TEN_SACH = &apos;HOC SQL TU W3SCHOOL.COM&apos;;<br>\nD. UPDATE TABLE THONGTIN_SACH<br>\nSET GIA = 200000<br>\nWHERE ID_SACH = &apos;HOC SQL TU W3SCHOOL.COM&apos;;<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '129'),
(130, '10:13:46 AM', '11/18/2023', '', 'Câu l&#7879;nh SQL nào cho phép tìm giá cao nh&#7845;t t&#7915; b&#7843;ng THONGTIN_SACH?<br>	\nA. SELECT ID_SACH, TEN_SACH, MAX(GIA)<br>\nFROM THONGTIN_SACH;<br>\nB. SELECT MAX(GIA)<br>\nFROM THONGTIN_SACH;<br>\nC. SELECT MAXIMUM(GIA)<br>\nFROM THONGTIN_SACH;<br>\nD. SELECT GIA<br>\nFROM THONGTIN_SACH<br>\nORDER BY GIA DESC;<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '130'),
(131, '5:14:39 PM', '11/17/2023', '', 'Câu l&#7879;nh SQL nào cho phép tìm t&#7845;t c&#7843; các sách có giá t&#7915; 150000 &#273;&#7871;n 200000?<br>	\nA. SELECT ID_SACH, TEN_SACH, GIA<br>\nFROM THONGTIN_SACH<br>\nWHERE GIA IS BETWEEN 150000 AND 200000;<br>\nB. SELECT ID_SACH, TEN_SACH, GIA<br>\nFROM THONGTIN_SACH<br>\nHAVING GIA IS BETWEEN 150000 AND 200000;<br>\nC. SELECT ID_SACH, TEN_SACH, GIA<br>\nFROM THONGTIN_SACH<br>\nWHERE GIA BETWEEN 150000 AND 200000;<br>\nD. SELECT ID_SACH, TEN_SACH, GIA<br>\nFROM THONGTIN_SACH<br>\nHAVING GIA BETWEEN 150000 AND 200000;<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '131'),
(132, '12:16:26 AM', '11/18/2023', '', 'Hãy ch&#7885;n ph&#432;&#417;ng án &#273;úng nh&#7845;t v&#7873; khái ni&#7879;m c&#7911;a DBMS<br>	\nA. T&#7841;o c&#7845;u trúc d&#7919; li&#7879;u t&#432;&#417;ng &#7913;ng v&#7899;i mô hình d&#7919; li&#7879;u<br>	\nB. C&#7853;p nh&#7853;t, chèn thêm, lo&#7841;i b&#7887; hay s&#7917;a &#273;&#7893;i d&#7919; li&#7879;u m&#7913;c t&#7879;p<br>	\nC. &#272;&#7843;m b&#7843;o an toàn, b&#7843;o m&#7853;t d&#7919; li&#7879;u và tính toàn v&#7865;n d&#7919; li&#7879;u<br>	\nD. H&#7879; th&#7889;ng ph&#7847;n m&#7873;m &#273;i&#7873;u khi&#7875;n các chi&#7871;n l&#432;&#7907;c t&#7911;y nh&#7853;p và t&#7893; ch&#7913;c l&#432;u tr&#7919; CSDL<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '132'),
(133, '9:02:06 AM', '11/18/2023', '', 'S&#7889; &#7845;n b&#7843;n c&#7911;a SQL Server 2014 là<br>	\nA. 6<br>	B. 5<br>	C. 4<br>	D. 3<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '133'),
(134, '9:01:30 AM', '11/18/2023', '', 'Hãy ch&#7885;n ph&#432;&#417;ng án &#273;úng &#7913;ng v&#7899;i &#7845;n b&#7843;n c&#7911;a SQL Server 2014<br>	\nA. SQL Server Enterpise Edition, SQL Server Standard Edition, SQL Server Business Intelligence Edition<br>	\nB. SQL Server Enterpise Edition, SQL Server Standard Edition<br>	\nC. SQL Server Enterpise Edition, SQL Server Standard Edition, SQL Server Developer Edition<br>\nD. T&#7845;t c&#7843; &#273;&#7873;u sai<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '134'),
(135, '9:08:20 AM', '11/18/2023', '', '&#7844;n b&#7843;n SQL Server Express là<br>	\nA. &#7844;n b&#7843;n ki&#7875;m tra &#7913;ng d&#7909;ng<br>	\nB. T&#7845;t c&#7843; &#273;&#7873;u sai<br>	\nC. &#7844;n b&#7843;n ph&#7909;c v&#7909; cho qu&#7843;n tr&#7883; và phân tích d&#7919; li&#7879;u<br>	\nD. &#7844;n b&#7843;n mi&#7877;n phí<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '135'),
(136, '9:18:23 AM', '11/18/2023', '', '&#7844;n b&#7843;n SQL Server Standard Edition là &#7845;n b&#7843;n<br>	\nA. Ph&#7909;c v&#7909; cho qu&#7843;n tr&#7883; và phân tích d&#7919; li&#7879;u<br>	\nB. &#272;&#432;&#7907;c s&#7917; d&#7909;ng trong doanh nghi&#7879;p, t&#7893; ch&#7913;c có m&#7913;c yêu c&#7847;u x&#7917; lý giao di&#7879;n tr&#7921;c tuy&#7871;n<br>	\nC. Mi&#7877;n phí<br>	\nD. Ki&#7875;m tra &#7913;ng d&#7909;ng<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '136'),
(154, '9:01:30 AM', '11/18/2023', '', '&#272;&#7875; thêm b&#7843;n ghi vào m&#7897;t b&#7843;ng, chúng ta c&#7847;n s&#7917; d&#7909;ng câu l&#7879;nh nào?<br>	\nA. INSERT INTO table_name<br>\nVALUE (value1, value2,...)<br>\nB. ADD INTO table_name<br>\nVALUES (value1, value2,...)<br>\nC. INSERT INTO table_name<br>\nVALUES (value1, value2,...)<br>\nD. INSERT IN table_name<br>\nVALUE (value1, value2,...)<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '154'),
(155, '9:08:20 AM', '11/18/2023', '', 'Câu l&#7879;nh sau có ý ngh&#297;a gì?<br>\nDELETE FROM sinhvien<br>\nWHERE gt is null<br>\nA. S&#7917; d&#7909;ng &#273;&#7875; xóa m&#7897;t ho&#7863;c nhi&#7873;u dòng t&#7915; m&#7897;t b&#7843;ng d&#7921;a trên &#273;i&#7873;u ki&#7879;n gt &#273;&#7875; tr&#7889;ng<br>	\nB. S&#7917; d&#7909;ng &#273;&#7875; s&#7917;a m&#7897;t ho&#7863;c nhi&#7873;u dòng t&#7915; m&#7897;t b&#7843;ng d&#7921;a trên nh&#7919;ng &#273;i&#7873;u ki&#7879;n gt &#273;&#7875; tr&#7889;ng<br>\nC. S&#7917; d&#7909;ng &#273;&#7875; thêm m&#7897;t ho&#7863;c nhi&#7873;u dòng t&#7915; m&#7897;t b&#7843;ng d&#7921;a trên nh&#7919;ng &#273;i&#7873;u ki&#7879;n gt &#273;&#7875; tr&#7889;ng<br>	\nD. S&#7917; d&#7909;ng &#273;&#7875; xóa m&#7897;t ho&#7863;c nhi&#7873;u dòng t&#7915; m&#7897;t b&#7843;ng d&#7921;a trên nh&#7919;ng &#273;i&#7873;u ki&#7879;n gt b&#7857;ng 0<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '155'),
(156, '9:18:23 AM', '11/18/2023', '', 'Th&#7913; t&#7921; các m&#7879;nh &#273;&#7873; trong câu l&#7879;nh SQL SELECT là?<br>	\nA. SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY<br>	\nB. SELECT, FROM, WHERE, HAVING, GROUP BY, ORDER BY<br>	\nC. SELECT, FROM, GROUP BY, ORDER BY, WHERE<br>	\nD. FROM, SELECT, WHERE, GROUP BY, HAVING, ORDER BY<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '156'),
(157, '9:37:02 AM', '11/18/2023', '', 'Hãy ch&#7885;n ph&#432;&#417;ng án &#273;úng v&#7899;i tác d&#7909;ng c&#7911;a câu l&#7879;nh DELETE<br>	\nA. Xóa 1 s&#7889; ho&#7863;c t&#7845;t c&#7843; các hàng t&#7915; m&#7897;t b&#7843;ng d&#7921;a trên nh&#7919;ng &#273;i&#7873;u ki&#7879;n &#273;&#432;&#7907;c ch&#7881; &#273;&#7883;nh. Các b&#7843;n ghi này c&#361;ng có th&#7875; &#273;&#432;&#7907;c h&#7891;i ph&#7909;c l&#7841;i (Roll Back)<br>	\nB. Xóa 1 hàng t&#7915; m&#7897;t b&#7843;ng d&#7921;a trên nh&#7919;ng &#273;i&#7873;u ki&#7879;n &#273;&#432;&#7907;c ch&#7881; &#273;&#7883;nh. Các b&#7843;n ghi này c&#361;ng có th&#7875; &#273;&#432;&#7907;c h&#7891;i ph&#7909;c l&#7841;i (Roll Back)<br>\nC. Thêm 1 s&#7889; ho&#7863;c t&#7845;t c&#7843; các hàng t&#7915; m&#7897;t b&#7843;ng d&#7921;a trên nh&#7919;ng &#273;i&#7873;u ki&#7879;n &#273;&#432;&#7907;c ch&#7881; &#273;&#7883;nh. Các b&#7843;n ghi này c&#361;ng có th&#7875; &#273;&#432;&#7907;c h&#7891;i ph&#7909;c l&#7841;i (Roll Back)<br>	\nD. Xóa 1 s&#7889; ho&#7863;c t&#7845;t c&#7843; các hàng t&#7915; m&#7897;t b&#7843;ng d&#7921;a trên nh&#7919;ng &#273;i&#7873;u ki&#7879;n &#273;&#432;&#7907;c ch&#7881; &#273;&#7883;nh. Các b&#7843;n ghi này không th&#7875; &#273;&#432;&#7907;c h&#7891;i ph&#7909;c l&#7841;i (Roll Back)<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '157'),
(158, '9:57:03 AM', '11/18/2023', '', '&#272;&#7875; t&#7841;o 1 b&#7843;ng Khoa g&#7891;m (makhoa char(10), tenkhoa char(30), dienthoai char(10)) trong &#273;ó makhoa là khóa chính dùng l&#7879;nh nào d&#432;&#7899;i &#273;ây<br>	\nA. Create table Khoa (<br>\nmakhoa char(10),<br>\ntenkhoa char(30),<br>\ndienthoai char(10)<br>\n)<br>\nB. Create table Khoa (<br>\nmakhoa char(10) not null,<br>\ntenkhoa char(30),<br>\ndienthoai char(10),<br>\nconstraint khoachinh foreign key(makhoa)<br>\n)<br>\nC. Create table Khoa (<br>\nmakhoa char(10) null primary key,<br>\ntenkhoa char(30),<br>\ndienthoai char(10)<br>\n)<br>\nD. Create table Khoa (<br>\nmakhoa char(10) not null primary key,<br>\ntenkhoa char(30),<br>\ndienthoai char(10)<br>\n)<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '158'),
(159, '10:08:07 AM', '11/18/2023', '', 'Câu l&#7879;nh thêm m&#7897;t c&#7897;t vào m&#7897;t b&#7843;ng trong SQL là<br>	\nA. Alter table &lt;tên b&#7843;ng&gt;<br>\nAdd &lt;tên c&#7897;t m&#7899;i&gt; &lt;ki&#7875;u d&#7919; li&#7879;u&gt; [ràng bu&#7897;c]<br>\nB. Alter table &lt;tên b&#7843;ng&gt; &lt;tên c&#7897;t m&#7899;i&gt; &lt;ki&#7875;u d&#7919; li&#7879;u&gt; [ràng bu&#7897;c]<br>	\nC. Insert table &lt;tên b&#7843;ng&gt; &lt;tên c&#7897;t m&#7899;i&gt; &lt;ki&#7875;u d&#7919; li&#7879;u&gt; [ràng bu&#7897;c]<br>	\nD. Add &lt;tên b&#7843;ng&gt; &lt;tên c&#7897;t m&#7899;i&gt; &lt;ki&#7875;u d&#7919; li&#7879;u&gt; [ràng bu&#7897;c]<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '159'),
(160, '10:13:46 AM', '11/18/2023', '', 'Câu l&#7879;nh SELECT...FROM k&#7871;t h&#7907;p v&#7899;i m&#7879;nh &#273;&#7873; nào &#273;&#7875; l&#7885;c các dòng d&#7919; li&#7879;u bên trong b&#7843;ng th&#7887;a mãn &#273;i&#7873;u ki&#7879;n cho tr&#432;&#7899;c?<br>	\nA. GROUP BY<br>	\nB. WHERE...ORDER BY...GROUP BY<br>	\nC. WHERE...GROUP BY...ORDER BY<br>	\nD. WHERE<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '160'),
(48, '9:25:36 AM', '11/14/2023', '', 'Jenny mu&#7889;n l&#432;u tr&#7919; chi ti&#7871;t các nhà cung c&#7845;p v&#7853;t li&#7879;u cho nhà máy cô \n		&#273;ang làm vi&#7879;c. Cô t&#7841;o ra 1 lo&#7841;i d&#7919; li&#7879;u c&#7911;a ng&#432;&#7901;i dùng (user-defined \n		datatype) dùng cho c&#7897;t address_details và &#273;ã t&#7841;o ra 1 rule g&#7855;n k&#7871;t vào \n		c&#7897;t này. Phát bi&#7875;u nào sau &#273;ây là &#273;úng trong ng&#7919; c&#7843;nh này: <br>\n		A. Rule s&#7869; &#7843;nh h&#432;&#7903;ng &#273;&#7871;n t&#7845;t c&#7843; các c&#7897;t trong CSDL <br>\n		B. Rule s&#7869; &#7843;nh h&#432;&#7903;ng &#273;&#7871;n t&#7845;t c&#7843; các b&#7843;ng mà có c&#7897;t c&#361;ng dùng cùng ki&#7875;u \n		d&#7919; li&#7879;u ng&#432;&#7901;i dùng này <br>\n		C. Rule s&#7869; &#7843;nh h&#432;&#7903;ng &#273;&#7871;n t&#7845;t c&#7843; các b&#7843;ng trong CSDL <br>\n		D. Rule s&#7869; ch&#7881; &#7843;nh h&#432;&#7903;ng &#273;&#7871;n các b&#7843;ng mà tên c&#7911;a nó &#273;&#432;&#7907;c xác &#273;&#7883;nh trong \n		lúc g&#7855;n k&#7871;t (binding) ', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '48'),
(49, '9:42:25 AM', '11/14/2023', '', 'B&#7841;n &#273;ang thi&#7871;t k&#7871; database cho &#7913;ng d&#7909;ng qu&#7843;n lý Thuê xe. Database g&#7891;m \n		các b&#7843;ng Khách hàng (Customers), H&#7907;p &#273;&#7891;ng (Argreements), Xe (Cars). M&#7895;i \n		khách hàng có th&#7875; thuê m&#7897;t hay nhi&#7873;u xe. M&#7895;i xe ch&#7881; có th&#7875; &#273;&#432;&#7907;c thuê b&#7903;i \n		m&#7897;t khách hàng trong m&#7897;t th&#7901;i &#273;i&#7875;m. B&#7841;n c&#7847;n thi&#7871;t l&#7853;p m&#7897;t ràng bu&#7897;c gi&#7919;a \n		b&#7843;ng H&#7907;p &#273;&#7891;ng và b&#7843;ng Xe. B&#7841;n s&#7869; ch&#7885;n cách nào &#273;&#7875; th&#7921;c hi&#7879;n vi&#7879;c này:\n		<br>\n		A. Thêm m&#7897;t ràng bu&#7897;c CHECK trên c&#7897;t AgreementID <br>\n		B. Thêm field CarID vào b&#7843;ng Agreements v&#7899;i m&#7897;t ràng bu&#7897;c FOREIGN KEY \n		tham chi&#7871;u t&#7899;i b&#7843;ng Cars <br>\n		C. Thêm field AgreementID vào b&#7843;ng Cars v&#7899;i m&#7897;t ràng bu&#7897;c FOREIGN KEY \n		tham chi&#7871;u t&#7899;i b&#7843;ng Agreements <br>\n		D. Thêm m&#7897;t trigger ki&#7875;m soát thao tác Insert vào table Cars ', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '49'),
(50, '2:19:04 PM', '11/14/2023', '', 'Xác &#273;&#7883;nh lo&#7841;i b&#7843;o toàn d&#7919; li&#7879;u (data integrity) nào &#273;&#432;&#7907;c xác &#273;&#7883;nh b&#7903;i \n		thu&#7897;c tính primary key <br>\n		A. B&#7843;o toàn tham chi&#7871;u (referential integrity) <br>\n		B. B&#7843;o toàn th&#7921;c th&#7875; (entity integrity) <br>\n		C. B&#7843;o toàn mi&#7873;n (Domain integrity) <br>\n		D. B&#7843;o toàn &#273;&#432;&#7907;c xác &#273;&#7883;nh b&#7903;i ng&#432;&#7901;i dùng (user-defined integrity)', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '50'),
(51, '2:29:16 PM', '11/14/2023', '', 'Trong các phát bi&#7875;u sau, phát bi&#7875;u nào là SAI: <br>\n		A. M&#7897;t ch&#7881; m&#7909;c &#273;&#432;&#7907;c t&#7921; &#273;&#7897;ng t&#7841;o trên c&#7897;t làm khoá chính khi th&#7921;c hi&#7879;n \n		l&#7879;nh t&#7841;o table <br>\n		B. Có hai lo&#7841;i ch&#7881; m&#7909;c là Clustered index và Nonclusterd index <br>\n		C. Trong m&#7897;t table, có th&#7875; t&#7841;o nhi&#7873;u Clustered index, và m&#7897;t \n		Nonclustered index <br>\n		D. Trong m&#7897;t table, ch&#7881; có th&#7875; t&#7841;o m&#7897;t Clusterd index, và nhi&#7873;u \n		Nonclustered index', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '51'),
(52, '2:38:26 PM', '11/14/2023', '', 'Lo&#7841;i b&#7843;o toàn d&#7919; li&#7879;u nào b&#7843;o &#273;&#7843;m m&#7889;i quan h&#7879; gi&#7919;a các b&#7843;ng &#273;&#432;&#7907;c b&#7843;o t&#7891;n \n		khi các b&#7843;n ghi &#273;&#432;&#7907;c thêm vào hay xóa &#273;i: <br>\n		A. B&#7843;o toàn th&#7921;c th&#7875; (Entity Integrity) <br>\n		B. B&#7843;o toàn mi&#7873;n giá tr&#7883; (Domain Integrity) <br>\n		C. B&#7843;o toàn tham chi&#7871;u (Referential Integrity)<br>\n		D. B&#7843;o toàn quy lu&#7853;t c&#7911;a ng&#432;&#7901;i dùng (User-defined Integrity)', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '52'),
(53, '2:47:18 PM', '11/14/2023', '', 'L&#7879;nh nào sau &#273;ây là không &#273;úng khi nói v&#7873; tính b&#7843;o toàn d&#7919; li&#7879;u? <br>\n		A. Ràng bu&#7897;c PRIMARY KEY &#273;&#432;&#7907;c dùng &#273;&#7875; b&#7843;o &#273;&#7843;m là không có giá tr&#7883; NULL \n		hay trùng nhau trong 1 hàng &#273;ã cho c&#7911;a b&#7843;ng <br>\n		B. Ràng bu&#7897;c CHECK &#273;&#432;&#7907;c dùng &#273;&#7875; b&#7843;o &#273;&#7843;m là ch&#7881; có 1 b&#7897; các giá tr&#7883; xác \n		&#273;&#7883;nh &#273;&#432;&#7907;c phép nh&#7853;p vào 1 c&#7897;t &#273;ã cho c&#7911;a b&#7843;ng <br>\n		C. Ràng bu&#7897;c UNIQUE KEY &#273;&#432;&#7907;c dùng &#273;&#7875; b&#7843;o &#273;&#7843;m là các c&#7897;t gi&#7889;ng nhau trong \n		b&#7843;ng ch&#7913;a các giá tr&#7883; gi&#7889;ng nhau <br>\n		D. Ràng bu&#7897;c DEFAULT &#273;&#7875; b&#7843;o &#273;&#7843;m là 1 giá tr&#7883; h&#7857;ng s&#7869; &#273;&#432;&#7907;c &#273;&#432;a vào 1 c&#7897;t \n		khi ng&#432;&#7901;i dùng không xác &#273;&#7883;nh nó', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '53'),
(54, '2:55:16 PM', '11/14/2023', '', 'Trong m&#7897;t phát bi&#7875;u SELECT, ta mu&#7889;n tính tr&#7883; trung bình b&#7857;ng hàm AVG thì \n		hàm này &#273;&#432;&#7907;c &#273;&#7863;t <br>\n		A. trong m&#7879;nh &#273;&#7873; SELECT <br>\n		B. trong m&#7879;nh &#273;&#7873; FROM <br>\n		C. trong m&#7879;nh &#273;&#7873; WHERE <br>\n		D. trong m&#7879;nh &#273;&#7873; GROUP BY', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '54'),
(55, '3:05:51 PM', '11/14/2023', '', 'DML &#273;&#432;&#7907;c dùng &#273;&#7875; <br>\n		A. thay &#273;&#7893;i n&#7897;i dung m&#7897;t dòng <br>\n		B. &#273;&#7893;i tên m&#7897;t b&#7843;ng <br>\n		C. &#273;&#7893;i tên m&#7897;t c&#7897;t <br>\n		D. DML có th&#7875; th&#7921;c hi&#7879;n c&#7843; ba nhi&#7879;m v&#7909; trên.', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '55'),
(56, '3:45:47 PM', '11/14/2023', '', 'N&#7871;u trong phát bi&#7875;u SELECT không có m&#7879;nh &#273;&#7873; WHERE thì <br>\n		A. k&#7871;t qu&#7843; không ch&#7913;a b&#7897; nào <br>\n		B. k&#7871;t qu&#7843; ch&#7913;a t&#7845;t c&#7843; các b&#7897; trong b&#7843;ng truy v&#7845;n <br>\n		C. k&#7871;t qu&#7843; ch&#7913;a t&#7845;t c&#7843; các c&#7897;t trong b&#7843;ng truy v&#7845;n <br>\n		D. xu&#7845;t hi&#7879;n thông báo l&#7895;i', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '56'),
(57, '4:02:48 PM', '11/14/2023', '', 'Giá tr&#7883; m&#7863;c &#273;&#7883;nh c&#7911;a m&#7897;t c&#7897;t (n&#7871;u có), &#273;&#432;&#7907;c quy &#273;&#7883;nh b&#7857;ng <br>\n		A. DDL <br>\n		B. DCL <br>\n		C. DML <br>\n		D. ch&#432;&#417;ng trình &#7913;ng d&#7909;ng', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '57'),
(58, '4:16:05 PM', '11/14/2023', '', 'T&#7915; khóa HAVING &#273;&#432;&#7907;c dùng trong m&#7879;nh &#273;&#7873; <br>\n		A. GROUP BY <br>\n		B. ORDER BY <br>\n		C. SORT BY <br>\n		D. m&#7897;t m&#7879;nh &#273;&#7873; khác', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '58'),
(59, '4:27:24 PM', '11/14/2023', '', '&#272;&#7875; s&#7855;p x&#7871;p th&#7913; t&#7921; trong k&#7871;t qu&#7843; truy v&#7845;n, ta s&#7917; d&#7909;ng m&#7879;nh &#273;&#7873; <br>\n		A. GROUP BY <br>\n		B. ORDER BY <br>\n		C. SORT BY <br>\n		D. m&#7897;t m&#7879;nh &#273;&#7873; khác ', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '59'),
(60, '4:43:49 PM', '11/14/2023', '', '&#272;&#7875; xây d&#7921;ng t&#7915; &#273;i&#7875;n c&#7911;a c&#417; s&#7903; d&#7919; li&#7879;u, ta s&#7917; d&#7909;ng <br>\n		A. DDL <br>\n		B. DCL <br>\n		C. DML <br>\n		D. ch&#432;&#417;ng trình &#7913;ng d&#7909;ng', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '60'),
(61, '8:40:53 PM', '11/14/2023', '', 'Trong SQL, m&#7879;nh &#273;&#7873; ALTER TABLE dùng &#273;&#7875; làm gì?<br>	\nA. Dùng &#273;&#7875; thêm, xóa và s&#7917;a &#273;&#7893;i các c&#7897;t trong m&#7897;t b&#7843;ng &#273;ã có<br>	\nB. Dùng &#273;&#7875; chèn d&#7919; li&#7879;u vào b&#7843;ng trong c&#417; s&#7903; d&#7919; li&#7879;u<br>	\nC. Dùng &#273;&#7875; xóa b&#7843;ng trong c&#417; s&#7903; d&#7919; li&#7879;u<br>	\nD. Dùng &#273;&#7875; xóa d&#7919; li&#7879;u kh&#7887;i b&#7843;ng trong c&#417; s&#7903; d&#7919; li&#7879;u<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '61'),
(62, '11:13:38 AM', '11/16/2023', '', 'M&#7879;nh &#273;&#7873; HAVING ch&#7881; có th&#7875; &#273;&#432;&#7907;c s&#7917; d&#7909;ng v&#7899;i...<br>	\nA. INSERT<br>	\nB. JOIN<br>	\nC. DELETE<br>	\nD. SELECT<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '62'),
(63, '11:23:02 AM', '11/16/2023', '', 'Kh&#7859;ng &#273;&#7883;nh nào sau &#273;ây là &#273;úng?<br>	\nA. TRUNCATE TABLE ph&#7843;i &#273;&#432;&#7907;c s&#7917; d&#7909;ng cùng v&#7899;i m&#7879;nh &#273;&#7873; WHERE<br>	\nB. TRUNCATE TABLE có ch&#7913;c n&#259;ng t&#432;&#417;ng t&#7921; nh&#432; l&#7879;nh DELETE nh&#432;ng không có m&#7879;nh &#273;&#7873; WHERE và &#273;&#7873;u &#273;&#432;&#7907;c s&#7917; d&#7909;ng &#273;&#7875; xóa các b&#7843;n ghi t&#7915; m&#7897;t b&#7843;ng &#273;ang t&#7891;n t&#7841;i trong SQL<br>	\nC. TRUNCATE TABLE xóa b&#7843;ng kh&#7887;i c&#417; s&#7903; d&#7919; li&#7879;u<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '63'),
(64, '8:07:26 PM', '11/16/2023', '', 'Câu l&#7879;nh SQL nào sau &#273;ây là &#273;úng?<br>	\nA. SELECT * FROM Sales <br>\nWHERE Date BETWEEN &apos;10/12/2005&apos; AND &apos;01/01/2006&apos;<br>	\nB. SELECT FROM Sales <br>\nWHERE Date BETWEEN &apos;10/12/2005&apos; AND &apos;01/01/2006&apos;<br>\nC. SELECT FROM Sales <br>\nWHERE Date BETWEEN (&apos;10/12/2005&apos;, &apos;01/01/2006&apos;)<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '64'),
(65, '8:20:31 PM', '11/16/2023', '', 'Câu l&#7879;nh CREATE TABLE dùng &#273;&#7875; làm gì?<br>	\nA. T&#7841;o m&#7897;t b&#7843;ng c&#417; s&#7903; d&#7919; li&#7879;u m&#7899;i<br>	\nB. T&#7841;o m&#7897;t th&#7911; t&#7909;c l&#432;u tr&#7919;<br>	\nC. T&#7841;o ch&#7871; &#273;&#7897; xem c&#417; s&#7903; d&#7919; li&#7879;u<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '65'),
(66, '8:31:10 PM', '11/16/2023', '', 'RDBMS là vi&#7871;t t&#7855;t c&#7911;a...<br>	\nA. Real Database Management System<br>	\nB. Relational Database Management System<br>	\nC. Read Database Master System<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '66'),
(67, '8:39:10 PM', '11/16/2023', '', 'Hàm nào d&#432;&#7899;i &#273;ây là hàm t&#7853;p h&#7907;p trong SQL?<br>	\nA. AVG<br>	\nB. LEN<br>	\nC. JOIN<br>	\nD. LEFT<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '67'),
(68, '8:57:36 PM', '11/16/2023', '', 'L&#7879;nh SQL nào sau &#273;ây l&#7845;y ra chu&#7895;i &apos;Success&apos;?<br>	\nA. SELECT &apos; Success &apos;<br>	\nB. SELECT &apos;Success&apos;<br>	\nC. SELECT LEFT(&apos;Succes&apos; is all I need.&apos;, 15)<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '68'),
(69, '9:43:06 PM', '11/16/2023', '', 'Câu l&#7879;nh SQL sau &#273;ây làm gì?<br>\nSELECT Khachhang, <br>\nCOUNT(Dondathang) <br>\nFROM Sales  <br>\nGROUP BY Khachhang <br>\nHAVING COUNT (Dondathang) &gt; 5<br>\nA. Ch&#7885;n t&#7845;t c&#7843; khách hàng t&#7915; b&#7843;ng Sales &#273;ã th&#7921;c hi&#7879;n h&#417;n 5 &#273;&#417;n hàng<br>	\nB. Ch&#7885;n t&#7845;t c&#7843; khách hàng t&#7915; b&#7843;ng Sales<br>	\nC. Ch&#7885;n t&#7893;ng s&#7889; &#273;&#417;n &#273;&#7863;t hàng t&#7915; b&#7843;ng Sales, n&#7871;u s&#7889; này l&#7899;n h&#417;n 5<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '69'),
(70, '11:05:06 PM', '11/16/2023', '', 'Câu l&#7879;nh SQL nào sau &#273;ây s&#7869; ch&#7885;n t&#7845;t c&#7843; các b&#7843;n ghi v&#7899;i t&#7845;t c&#7843; các c&#7897;t c&#7911;a chúng t&#7915; m&#7897;t b&#7843;ng có tên là Sales?<br>	\nA. DELETE FROM Sales<br>	\nB. SELECT * <br>\nFROM SALES <br>\nWHERE OrderID &lt; 1<br>\nC. SELECT * <br>\nFROM Sales<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '70'),
(71, '11:20:09 PM', '11/16/2023', '', 'Y&#7871;u t&#7889; nào &#273;&#7913;ng sau câu l&#7879;nh SELECT trong SQL?<br>	\nA. Tên b&#7843;ng trong c&#417; s&#7903; d&#7919; li&#7879;u s&#7869; l&#7845;y ra các b&#7843;n ghi<br>	\nB. Danh sách các c&#7897;t &#273;&#432;&#7907;c ch&#7885;n ho&#7863;c ký hi&#7879;u *<br>	\nC. M&#7879;nh &#273;&#7873; JOIN<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '71'),
(72, '11:33:46 PM', '11/16/2023', '', 'Index trong SQL là gì?<br>	\nA. Là m&#7897;t thu&#7897;c tính b&#7843;ng c&#417; s&#7903; d&#7919; li&#7879;u, giúp t&#259;ng t&#7889;c tìm ki&#7871;m d&#7919; li&#7879;u trong m&#7897;t b&#7843;ng<br>	\nB. Là m&#7897;t ph&#432;&#417;ng pháp &#273;&#7875; join 2 hay nhi&#7873;u b&#7843;ng v&#7899;i nhau<br>	\nC. Ch&#7913;c n&#259;ng t&#432;&#417;ng t&#7921; nh&#432; Alias<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '72'),
(73, '11:42:31 PM', '11/16/2023', '', 'N&#7871;u không ch&#7881; &#273;&#7883;nh ASC ho&#7863;c DESC sau m&#7879;nh &#273;&#7873; ORDER BY thì t&#7915; khóa nào &#273;&#432;&#7907;c s&#7917; d&#7909;ng theo m&#7863;c &#273;&#7883;nh?<br>	\nA. ASC<br>	\nB. DESC<br>	\nC. DOWN<br>	\nD. Không có giá tr&#7883; m&#7863;c &#273;&#7883;nh<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '73'),
(74, '8:20:47 AM', '11/17/2023', '', 'Có th&#7875; s&#7917; d&#7909;ng c&#7843; m&#7879;nh &#273;&#7873; SQL HAVING và WHERE trong cùng m&#7897;t câu l&#7879;nh không?<br>	\nA. Có th&#7875;<br>	\nB. Không th&#7875;<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '74'),
(75, '8:29:55 AM', '11/17/2023', '', '&#272;âu là kh&#7859;ng &#273;&#7883;nh &#273;úng khi nói v&#7873; AS trong SQL?<br>	\nA. M&#7879;nh &#273;&#7873; AS ch&#7881; &#273;&#432;&#7907;c s&#7917; d&#7909;ng v&#7899;i m&#7879;nh &#273;&#7873; JOIN<br>	\nB. M&#7879;nh &#273;&#7873; AS khai báo m&#7897;t &#273;i&#7873;u ki&#7879;n tìm ki&#7871;m<br>	\nC. M&#7879;nh &#273;&#7873; AS &#273;&#432;&#7907;c s&#7917; d&#7909;ng &#273;&#7875; thay &#273;&#7893;i tên m&#7897;t c&#7897;t trong t&#7853;p k&#7871;t qu&#7843; ho&#7863;c &#273;&#7875; gán tên cho m&#7897;t c&#7897;t d&#7851;n xu&#7845;t<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '75'),
(76, '8:35:07 AM', '11/17/2023', '', '&#272;âu không ph&#7843;i là m&#7897;t t&#7915; khóa ho&#7863;c m&#7879;nh &#273;&#7873; trong SQL?<br>	\nA. INSERT<br>	\nB. SELECT<br>	\nC. INVERT<br>	\nD. UPDATE<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '76'),
(77, '8:55:57 AM', '11/17/2023', '', 'Hàm ABS trong SQL &#273;&#432;&#7907;c s&#7917; d&#7909;ng &#273;&#7875; làm gì?<br>	\nA. Tr&#7843; v&#7873; giá tr&#7883; tuy&#7879;t &#273;&#7889;i c&#7911;a bi&#7875;u th&#7913;c s&#7889;<br>	\nB. Tr&#7843; v&#7873; giá tr&#7883; t&#7889;i thi&#7875;u c&#7911;a bi&#7875;u th&#7913;c s&#7889;<br>	\nC. Tr&#7843; v&#7873; giá tr&#7883; t&#7889;i &#273;a c&#7911;a bi&#7875;u th&#7913;c s&#7889;<br>	\nD. Tr&#7843; v&#7873; giá tr&#7883; trung bình c&#7911;a bi&#7875;u th&#7913;c s&#7889;<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '77'),
(78, '9:48:29 AM', '11/17/2023', '', 'LIKE &#273;&#432;&#7907;c s&#7917; d&#7909;ng cùng v&#7899;i m&#7879;nh &#273;&#7873; nào?<br>	\nA. WHERE<br>	\nB. GROUP BY<br>	\nC. JOIN<br>	\nD. ORDER BY<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '78'),
(79, '10:01:04 AM', '11/17/2023', '', 'BETWEEN trong SQL &#273;&#432;&#7907;c s&#7917; d&#7909;ng &#273;&#7875;...<br>	\nA. Ch&#7881; &#273;&#7883;nh m&#7897;t c&#7897;t làm khóa chính<br>	\nB. Ch&#7881; &#273;&#7883;nh các b&#7843;ng s&#7869; s&#7917; d&#7909;ng<br>	\nC. Ch&#7881; &#273;&#7883;nh m&#7897;t ph&#7841;m vi &#273;&#7875; ki&#7875;m tra<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '79'),
(137, '9:37:02 AM', '11/18/2023', '', '&#7844;n b&#7843;n SQL Server Developer Edition là &#7845;n b&#7843;n<br>	\nA. Phát tri&#7875;n và ki&#7875;m tra &#7913;ng d&#7909;ng<br>	\nB. &#272;&#432;&#7907;c s&#7917; d&#7909;ng trong doanh nghi&#7879;p, t&#7893; ch&#7913;c có m&#7913;c yêu c&#7847;u x&#7917; lý giao di&#7879;n tr&#7921;c tuy&#7871;n<br>	\nC. Ph&#7909;c v&#7909; cho qu&#7843;n tr&#7883; và phân tích d&#7919; li&#7879;u<br>	\nD. Mi&#7877;n phi<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '137'),
(138, '9:57:03 AM', '11/18/2023', '', 'Các thành ph&#7847;n c&#417; b&#7843;n c&#7911;a m&#7897;t CSDL trong SQL là?<br>	\nA. Tables, View, Synonyms, Programmablity, Form<br>	\nB. Tables, View, Synonyms, Programmablity, Security<br>	\nC. Tables, Query, Synonyms, Programmablity, Security<br>	\nD. Tables, View, Synonyms, Programmablity, Report<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '138'),
(139, '10:08:07 AM', '11/18/2023', '', 'Table là gì?<br>	\nA. Là &#273;&#7889;i t&#432;&#7907;ng CSDL ch&#7913;a các câu l&#7879;nh SELECT<br>	\nB. Là &#273;&#7889;i t&#432;&#7907;ng ch&#7913;a các t&#7853;p l&#7879;nh c&#7911;a T-SQL<br>	\nC. Là &#273;&#7889;i t&#432;&#7907;ng l&#432;u tr&#7919; d&#7919; li&#7879;u c&#7911;a CSDL<br>	\nD. Không ph&#7843;i là &#273;&#7889;i t&#432;&#7907;ng l&#432;u tr&#7919; d&#7919; li&#7879;u c&#7911;a CSDL<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '139'),
(140, '10:13:46 AM', '11/18/2023', '', 'Trong Table, ch&#7913;c n&#259;ng c&#7911;a SET Primary Key là gì?<br>	\nA. Ki&#7875;u d&#7919; li&#7879;u<br>	B. T&#7841;o khóa<br>	C. Chú thích<br>	D. S&#7917;a b&#7843;ng<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '140'),
(141, '5:14:39 PM', '11/17/2023', '', 'View là gì?<br>	\nA. Là &#273;&#7889;i t&#432;&#7907;ng ch&#7913;a các t&#7853;p l&#7879;nh c&#7911;a T-SQL<br>	\nB. Là &#273;&#7889;i t&#432;&#7907;ng CSDL ch&#7913;a các câu l&#7879;nh SELECT<br>	\nC. Không ph&#7843;i là &#273;&#7889;i t&#432;&#7907;ng l&#432;u tr&#7919; d&#7919; li&#7879;u c&#7911;a CSDL<br>	\nD. Là &#273;&#7889;i t&#432;&#7907;ng l&#432;u tr&#7919; d&#7919; li&#7879;u c&#7911;a CSDL<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '141'),
(142, '12:16:26 AM', '11/18/2023', '', 'Trong Table thì Data Type là gì?<br>	\nA. Là ki&#7875;u d&#7919; li&#7879;u<br>	\nB. Là &#273;&#7889;i t&#432;&#7907;ng ch&#7913;a các t&#7853;p l&#7879;nh c&#7911;a T-SQL<br>	\nC. Là &#273;&#7889;i t&#432;&#7907;ng CSDL ch&#7913;a các câu l&#7879;nh SELECT<br>	\nD. Không ph&#7843;i là &#273;&#7889;i t&#432;&#7907;ng l&#432;u tr&#7919; d&#7919; li&#7879;u c&#7911;a CSDL<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '142'),
(143, '9:02:06 AM', '11/18/2023', '', '&#272;âu là các CSDL h&#7879; th&#7889;ng?<br>	\nA. Master, msdb, html, tempdb<br>	B. Master, msdb, model, tempdb<br>	\nC. Mdb, msdb, model, tempdb<br>	D. Master, pdf, model, tempdb<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '143'),
(144, '9:01:30 AM', '11/18/2023', '', 'CSDL Master dùng &#273;&#7875; làm gì?<br>	\nA. CSDL m&#7851;u &#273;&#7875; t&#7841;o ra các CSDL ng&#432;&#7901;i dùng<br>	\nB. L&#432;u tr&#7919; các &#273;&#7889;i t&#432;&#7907;ng t&#7841;m th&#7901;i<br>	\nC. &#272;&#7875; l&#7853;p l&#7883;ch ho&#7863;c 1 s&#7889; công vi&#7879;c th&#432;&#7901;ng nh&#7853;t<br>	\nD. L&#432;u tr&#7919; t&#7845;t c&#7843; thông tin h&#7879; th&#7889;ng c&#7911;a SQL Server<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '144'),
(145, '9:08:20 AM', '11/18/2023', '', 'CSDL MSDB dùng &#273;&#7875; làm gì?<br>	\nA. CSDL m&#7851;u &#273;&#7875; t&#7841;o ra các CSDL ng&#432;&#7901;i dùng<br>	\nB. L&#432;u tr&#7919; các &#273;&#7889;i t&#432;&#7907;ng t&#7841;m th&#7901;i<br>	\nC. L&#432;u tr&#7919; t&#7845;t c&#7843; thông tin h&#7879; th&#7889;ng c&#7911;a SQL Server<br>	\nD. Là CSDL &#273;&#432;&#7907;c s&#7917; d&#7909;ng b&#7903;i SQL Server Agent: &#273;&#7875; l&#7853;p l&#7883;ch ho&#7863;c 1 s&#7889; công vi&#7879;c th&#432;&#7901;ng nh&#7853;t<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '145');
INSERT INTO `level02r` (`ID`, `Time`, `Ngay_lap_de`, `Nguoi_lap_de`, `c1`, `c2`, `c3`, `c4`, `c5`, `Mon_hp`, `Codes`, `qq1`, `qq2`, `qq3`, `qq4`, `qq5`, `CustomerID`) VALUES
(146, '9:18:23 AM', '11/18/2023', '', 'CSDL Model dùng &#273;&#7875; làm gì?<br>	\nA. &#272;&#7875; l&#7853;p l&#7883;ch ho&#7863;c 1 s&#7889; công vi&#7879;c th&#432;&#7901;ng nh&#7853;t<br>	\nB. CSDL m&#7851;u &#273;&#7875; t&#7841;o ra các CSDL ng&#432;&#7901;i dùng<br>	\nC. L&#432;u tr&#7919; các &#273;&#7889;i t&#432;&#7907;ng t&#7841;m th&#7901;i<br>	\nD. L&#432;u tr&#7919; t&#7845;t c&#7843; thông tin h&#7879; th&#7889;ng c&#7911;a SQL Server<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '146'),
(147, '9:37:02 AM', '11/18/2023', '', 'CSDL Tempdb dùng &#273;&#7875; làm gì?<br>	\nA. &#272;&#7875; l&#7853;p l&#7883;ch ho&#7863;c 1 s&#7889; công vi&#7879;c th&#432;&#7901;ng nh&#7853;t<br>	\nB. L&#432;u tr&#7919; các &#273;&#7889;i t&#432;&#7907;ng t&#7841;m th&#7901;i<br>	\nC. CSDL m&#7851;u &#273;&#7875; t&#7841;o ra các CSDL ng&#432;&#7901;i dùng<br>	\nD. L&#432;u tr&#7919; t&#7845;t c&#7843; thông tin h&#7879; th&#7889;ng c&#7911;a SQL Server<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '147'),
(148, '9:57:03 AM', '11/18/2023', '', '&#272;âu là ph&#432;&#417;ng án &#273;úng &#7913;ng v&#7899;i thao tác t&#7841;o CSDL trong SQL Server?<br>	\nA. Right Click Database / Attach...<br>	\nB. Left Click Database / New Database<br>	\nC. Right Click Database / New Database<br>	\nD. Right Click Database / Restore Database<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '148'),
(149, '10:08:07 AM', '11/18/2023', '', '&#272;âu là ph&#432;&#417;ng án &#7913;ng v&#7899;i quy trình các b&#432;&#7899;c ph&#7909;c h&#7891;i CSDL?<br>	\nA. Left Click Database / New Database<br>	\nB. Right Click Database / New Database<br>\nC. Right Click Database / Restore Database<br>	\nD. Right Click Database / Attach...<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '149'),
(150, '10:13:46 AM', '11/18/2023', '', 'Mu&#7889;n xóa CSDL ta th&#7921;c hi&#7879;n các b&#432;&#7899;c nh&#432; th&#7871; nào?<br>	\nA. Chu&#7897;t ph&#7843;i vào tên CSDL / Properties<br>	\nB. Chu&#7897;t ph&#7843;i vào tên CSDL / Delete<br>	\nC. Chu&#7897;t ph&#7843;i vào tên CSDL / Task<br>	\nD. Chu&#7897;t ph&#7843;i vào tên CSDL / Rename<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '150'),
(151, '5:14:39 PM', '11/17/2023', '', 'Mu&#7889;n t&#7841;o b&#7843;ng CSDL ta th&#7921;c hi&#7879;n các b&#432;&#7899;c nh&#432; th&#7871; nào?<br>	\nA. Database / Table / click ph&#7843;i / New Table<br>	\nB. Database / Table / click ph&#7843;i / New Properties<br>	\nC. Database / Table / click ph&#7843;i / Refes<br>	\nD. Database / Table / click ph&#7843;i / Filter<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '151'),
(152, '12:16:26 AM', '11/18/2023', '', 'Trong các ph&#7847;n m&#7873;m sau &#273;ây, ph&#7847;n m&#7873;m nào không ph&#7843;i là h&#7879; qu&#7843;n tr&#7883; CSDL quan h&#7879;?<br>	\nA. Microsoft Excel<br>	B. Oracle<br>	\nC. Microsoft Access<br>	D. Microsoft SQL Server<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '152'),
(153, '9:02:06 AM', '11/18/2023', '', '&#272;&#7875; l&#7845;y &#273;&#432;&#7907;c t&#7845;t c&#7843; các b&#7843;n ghi t&#7915; m&#7897;t b&#7843;ng, chúng ta c&#7847;n s&#7917; d&#7909;ng câu l&#7879;nh nào?<br>	\nA. SELECT?<br>\nFROM table_name<br>\nB. SELECT *<br>\nFROM column_name<br>\nC. SELECT *<br>\nFROM table_name<br>\nD. SELECT %<br>\nFROM table_name<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '153'),
(1, '8:35:41 AM', '11/12/2023', '', 'SQL là t&#7915; vi&#7871;t t&#7855;t c&#7911;a<br>        \nA. Strong Question Language<br>        \nB. Structured Question Language<br>        \nC. Structured Query Language<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '1'),
(2, '9:20:34 AM', '11/12/2023', '', 'Câu l&#7879;nh nào &#273;&#432;&#7907;c dùng &#273;&#7875; trích xu&#7845;t d&#7919; li&#7879;u t&#7915; database?<br>        \nA. GET<br>        B. OPEN<br>       C. EXTRACT<br>        D. SELECT<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '2'),
(3, '8:46:05 AM', '11/16/2023', '', 'Câu l&#7879;nh nào &#273;&#432;&#7907;c dùng &#273;&#7875; c&#7853;p nh&#7853;t d&#7919; li&#7879;u t&#7915; database?<br>        \nA. UPDATE<br>        B. SAVE AS<br>        C. MODIFY<br>        D. SAVE<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '3'),
(4, '11:28:32 AM', '11/12/2023', '', 'Câu l&#7879;nh nào &#273;&#432;&#7907;c dùng &#273;&#7875; xóa d&#7919; li&#7879;u t&#7915; database?<br>        \nA. TRUNCATE<br>        B. DELETE<br>        C. REMOVE<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '4'),
(5, '3:17:54 PM', '11/12/2023', '', 'Câu l&#7879;nh nào &#273;&#432;&#7907;c s&#7917; d&#7909;ng &#273;&#7875; chèn thêm d&#7919; li&#7879;u vào database?<br>	\nA. ADD RECORD<br>	B. ADD INTO<br>	C. INSERT<br>	D. ADD NEW<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '5'),
(6, '3:34:28 PM', '11/12/2023', '', 'Trong SQL, làm th&#7871; nào &#273;&#7875; ch&#7885;n c&#7897;t d&#7919; li&#7879;u có tên FirstName t&#7915; b&#7843;ng Persons?<br>        \nA. EXTRACT FirstName<br> \nFROM Persons<br>\nB. SELECT FirstName <br>\nFROM Persons<br>\nC. SELECT Persons.FirstName<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '6'),
(7, '3:46:23 PM', '11/12/2023', '', 'Trong SQL, làm th&#7871; nào &#273;&#7875; ch&#7885;n t&#7845;t c&#7843; các c&#7897;t d&#7919; li&#7879;u trong b&#7843;ng Persons?<br>	\nA. SELECT [all] <br>\nFROM Persons<br>\nB. SELECT All Persons<br>	\nC. SELECT *.Persons<br>	\nD. SELECT * <br>\nFROM Persons<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '7'),
(8, '4:23:59 PM', '11/12/2023', '', 'Trong SQL, làm th&#7871; nào &#273;&#7875; ch&#7885;n t&#7845;t c&#7843; các b&#7843;n ghi t&#7915; b&#7843;ng Persons v&#7899;i giá tr&#7883; trong c&#7897;t FirstName là Peter?<br>	\nA. SELECT [all] <br>\nFROM Persons <br>\nWHERE FirstName=&apos;Peter&apos;<br>\nB. SELECT * <br>\nFROM Persons<br> \nWHERE FirstName LIKE&apos;Peter&apos;<br>\nC. SELECT [all] <br>\nFROM Persons <br>\nWHERE FirstName LIKE&apos;Peter&apos;<br>\nD. SELECT * <br>\nFROM Persons <br>\nWHERE FirstName=&apos;Peter&apos;<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '8'),
(9, '4:41:27 PM', '11/12/2023', '', 'Trong SQL, làm th&#7871; nào &#273;&#7875; ch&#7885;n t&#7845;t c&#7843; các b&#7843;n ghi t&#7915; b&#7843;ng Persons v&#7899;i giá tr&#7883; trong c&#7897;t FirstName b&#7855;t &#273;&#7847;u b&#7857;ng giá tr&#7883; a?<br>	\nA. SELECT * <br>\nFROM Persons<br> \nWHERE FirstName=&apos;%a%&apos;<br>\nB. SELECT * <br>\nFROM Persons <br>\nWHERE FirstNameLIKE %<br>\nC. SELECT * <br>\nFROM Persons <br>\nWHERE FirstName=&apos;a&apos;<br>\nD. SELECT * <br>\nFROM Persons <br>\nWHERE FirstName=&apos;a%&apos;<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '9'),
(10, '4:56:18 PM', '11/12/2023', '', 'M&#7879;nh &#273;&#7873; OR s&#7869; hi&#7875;n th&#7883; b&#7843;n ghi n&#7871;u b&#7845;t k&#7923; &#273;i&#7873;u ki&#7879;n nào d&#432;&#7899;i &#273;ây là &#273;úng. M&#7879;nh &#273;&#7873; AND s&#7869; hi&#7875;n th&#7883; b&#7843;n ghi n&#7871;u t&#7845;t c&#7843; &#273;i&#7873;u ki&#7879;n d&#432;&#7899;i &#273;ây là &#273;úng. &#272;ÚNG hay SAI?<br>	\nA. &#272;úng<br>	B. Sai<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '10'),
(11, '5:31:50 PM', '11/12/2023', '', 'Trong SQL, làm th&#7871; nào &#273;&#7875; ch&#7885;n t&#7845;t c&#7843; các b&#7843;n ghi t&#7915; b&#7843;ng Persons v&#7899;i giá tr&#7883; trong c&#7897;t FirstName là Peter và LastName là Jackson?<br>	\nA. SELECT * <br>\nFROM Persons <br>\nWHERE FirstName LIKE &apos;Peter&apos; AND LastName LIKE &apos;Jackson&apos;<br>\nB. SELECT * <br>\nFROM Persons <br>\nWHERE FirstName=&apos;Peter&apos; AND LastName=&apos;Jackson&apos;<br>\nC. SELECT FirstName=&apos;Peter&apos;,  LastName=&apos;Jackson&apos; <br>\nFROM Persons<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '11'),
(12, '8:32:50 AM', '11/16/2023', '', 'Trong SQL, làm th&#7871; nào &#273;&#7875; ch&#7885;n t&#7845;t c&#7843; các b&#7843;n ghi t&#7915; b&#7843;ng Persons v&#7899;i giá tr&#7883; trong c&#7897;t FirstName &#273;&#432;&#7907;c s&#7855;p x&#7871;p theo th&#7913; t&#7921; b&#7843;ng ch&#7919; cái n&#7857;m gi&#7919;a (và bao g&#7891;m) Hansen và Pettersen?<br>\nA. SELECT LastName&gt;&apos;Hansen&apos; AND LastName&lt;&apos;Pettersen&apos; <br>\nFROM Persons<br>\nB. SELECT * <br>\nFROM Persons <br>\nWHERE LastName BETWEEN &apos;Hansen&apos; AND &apos;Pettersen&apos;<br>\nC. SELECT * <br>\nFROM Persons <br>\nWHERE LastName&gt;&apos;Hansen&apos; AND<br> LastName&lt;&apos;Pettersen&apos;<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '12'),
(13, '8:09:36 PM', '11/12/2023', '', 'Cú pháp SQL nào &#273;&#432;&#7907;c dùng &#273;&#7875; tr&#7843; v&#7873; nh&#7919;ng giá tr&#7883; khác nhau<br>	\nA. SELECT UNIQUE<br>	B. SELECT INDENTITY<br>	\nC. SELECT DIFFERNT<br>	D. SELECT DISTINCT<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '13'),
(14, '8:33:48 AM', '11/13/2023', '', 'T&#7915; khóa SQL nào &#273;&#432;&#7907;c s&#7917; d&#7909;ng &#273;&#7875; s&#7855;p x&#7871;p danh sách k&#7871;t qu&#7843;?<br>	\nA. SORT BY<br>	B. ORDER<br>	C. ORDER BY<br>	D. SORT<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '14'),
(15, '8:49:37 AM', '11/13/2023', '', 'Trong SQL, làm th&#7871; nào &#273;&#7875; tr&#7843; v&#7873; t&#7845;t c&#7843; các b&#7843;ng d&#7919; li&#7879;u t&#7915; b&#7843;n ghi t&#7915; b&#7843;ng Persons theo th&#7913; t&#7921; s&#7855;p x&#7871;p gi&#7843;m d&#7847;n trong c&#7897;t FirstName?<br>	\nA. SELECT * <br>\nFROM Persons <br>\nSORT BY &apos;FirstName&apos; DESC<br>\nB. SELECT * <br>\nFROM Persons <br>\nORDER BY &apos;FirstName&apos; DESC<br>\nC. SELECT * <br>\nFROM Persons <br>\nORDER &apos;FirstName&apos; DESC<br>\nD. SELECT * <br>\nFROM Persons <br>\nSORT &apos;FirstName&apos; DESC<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '15'),
(16, '9:44:44 PM', '11/13/2023', '', 'Trong SQL, làm th&#7871; nào &#273;&#7875; chèn thêm b&#7843;n ghi m&#7899;i vào b&#7843;ng Persons?<br>	\nA. INSERT INTO Persons VALUES (&apos;Jimmy&apos;, &apos;Jackson&apos;)<br>	\nB. INSERT (&apos;Jimmy&apos;, &apos;Jackson&apos;) INTO Persons<br>	\nC. INSERT VALUES (&apos;Jimmy&apos;, &apos;Jackson&apos;) INTO Persons<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '16'),
(17, '10:43:31 AM', '11/15/2023', '', 'Trong SQL, làm th&#7871; nào &#273;&#7875; chèn Olsen vào c&#7897;t LastName trong b&#7843;ng Person?<br>       \nA. INSERT INTO Persons (LastName) VALUES (&apos;Olsen&apos;)<br>        \nB. INSERT (&apos;Olsen&apos;) INTO Persons (LastName)<br>        \nC. INSERT INTO Persons (&apos;Olsen&apos;) INTO (LastName)<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '17'),
(18, '9:25:36 AM', '11/14/2023', '', 'Làm th&#7871; nào &#273;&#7875; chuy&#7875;n hóa Hansen thành Nilsen trong c&#7897;t LastName c&#7911;a b&#7843;ng Persons?<br>\nA. UPDATE Persons <br>\nSET LastName=&apos;Hansen&apos; <br>\nINTO LastName=&apos;Nilsen&apos;<br>\nB. UPDATE Persons <br>\nSET LastName=&apos;Nilsen&apos; <br>\nWHERE LastName=&apos;Hansen&apos;<br>\nC. MODIFY Persons <br>\nSET LastName=&apos;Hansen&apos; <br>\nINTO LastName=&apos;Nilsen&apos;<br>\nD. MODIFY Persons <br>\nSET LastName=&apos;Nilsen&apos; <br>\nWHERE LastName=&apos;Hansen&apos;<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '18'),
(19, '9:42:25 AM', '11/14/2023', '', 'Trong SQL, làm th&#7871; nào &#273;&#7875; xóa b&#7843;n ghi Peter trong c&#7897;t FirstName c&#7911;a b&#7843;ng Persons?<br>	\nA. DELETE FROM Persons <br>\nWHERE FirstName=&apos;Peter&apos;<br>\nB. DELETE ROW FIRSTNAME=&apos;Peter&apos; <br>\nFROM Persons<br>\nC. DELETE FirstName=&apos;Peter&apos; <br>\nFROM Persons<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '19'),
(20, '2:19:04 PM', '11/14/2023', '', 'Trong SQL, làm th&#7871; nào &#273;&#7875; tr&#7843; v&#7873; s&#7889; l&#432;&#7907;ng các b&#7843;n ghi trong b&#7843;ng Persons?<br>	\nA. SELECT COLUMNS () <br>\nFROM Persons<br>\nB. SELECT COUNT (*)<br> \nFROM Persons<br>\nC. SELECT COLUMNS (*) <br>\nFROM Persons<br>\nD. SELECT COUNT () <br>\nFROM Persons<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '20'),
(21, '2:29:16 PM', '11/14/2023', '', 'Trong cú pháp câu l&#7879;nh ràng bu&#7897;c Forein Key, t&#7915; khóa On Update có ý ngh&#297;a gì?<br>	\nA. Là ràng bu&#7897;c &#273;&#432;&#7907;c phép c&#7853;p nh&#7853;t khóa Forein Key<br>	\nB. Là ràng bu&#7897;c &#273;&#432;&#7907;c phép c&#7853;p nh&#7853;t khóa Primary Key<br>	\nC. Là ràng bu&#7897;c &#273;&#432;&#7907;c phép c&#7853;p nh&#7853;t Check Key<br>	\nD. Là ràng bu&#7897;c &#273;&#432;&#7907;c phép xóa khóa Forein Key<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '21'),
(22, '2:38:26 PM', '11/14/2023', '', 'K&#7871;t qu&#7843; c&#7911;a m&#7879;nh &#273;&#7873; SELECT có th&#7875; ch&#7913;a các dòng d&#7919; li&#7879;u trùng nhau. &#272;ÚNG hay SAI?<br>	\nA. &#272;úng<br>	B. Sai<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '22'),
(23, '2:47:18 PM', '11/14/2023', '', '&#272;ôi khi, cú pháp &quotSELECT COUNT (*)&quot s&#7869; tr&#7843; v&#7873; giá tr&#7883; ít h&#417;n so v&#7899;i &quotSELECT COUNT(VALUE)&quot. &#272;ÚNG hay SAI?<br>	A. &#272;úng<br>	B. Sai<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '23'),
(24, '2:55:16 PM', '11/14/2023', '', 'Ki&#7875;u khóa nào sau &#273;ây s&#7869; ng&#259;n ch&#7863;n b&#7845;t k&#7923; ng&#432;&#7901;i dùng nào truy c&#7853;p vào d&#7919; li&#7879;u?<br>	\nA. EXPLICIT<br>	B. IMPLICIT<br>	C. EXCLUSIVE<br>	D. SHARED<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '24'),
(25, '3:05:51 PM', '11/14/2023', '', 'Câu l&#7879;nh SQL nào sau &#273;ây &#273;&#432;&#7907;c dùng &#273;&#7875; xóa các dòng d&#7919; li&#7879;u kh&#7887;i b&#7843;ng?<br>	\nA. DROP<br>	B. REMOVE ROW<br>	C. DELETE<br>	D. DELETE ROW<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '25'),
(26, '3:45:47 PM', '11/14/2023', '', 'Cách duy nh&#7845;t &#273;&#7875; liên k&#7871;t 2 b&#7843;ng d&#7919; li&#7879;u v&#7899;i nhau là s&#7917; d&#7909;ng cú pháp chu&#7849;n ANSI. &#272;ÚNG hay SAI?<br>	A. &#272;úng<br>	B. Sai<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '26'),
(27, '4:02:48 PM', '11/14/2023', '', 'Giá tr&#7883; NULL &#273;&#432;&#7907;c coi là r&#7895;ng ho&#7863;c b&#7843;ng 0. &#272;ÚNG hay SAI?<br>	A. &#272;úng<br>	B. Sai<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '27'),
(28, '4:16:05 PM', '11/14/2023', '', 'Let outer join là 1 d&#7841;ng c&#7911;a outer join. 1 d&#7841;ng khác là<br>	\nA. Right<br>	B. Right outer<br>	C. Full outer<br>	D. T&#7845;t c&#7843; các &#273;áp án trên<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '28'),
(29, '4:27:24 PM', '11/14/2023', '', 'Câu l&#7879;nh SQL nào &#273;&#432;&#7907;c s&#7917; d&#7909;ng &#273;&#7875; l&#7845;y d&#7919; li&#7879;u t&#7915; c&#417; s&#7903; d&#7919; li&#7879;u?<br>	\nA. GET<br>	B. OPEN<br>	C. SELECT<br>	D. EXTRACT<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '29'),
(30, '4:43:49 PM', '11/14/2023', '', 'Câu l&#7879;nh SQL nào &#273;&#432;&#7907;c s&#7917; d&#7909;ng &#273;&#7875; c&#7853;p nh&#7853;t d&#7919; li&#7879;u trong c&#417; s&#7903; d&#7919; li&#7879;u?<br>	\nA. MODIFY<br>	B. SAVE AS<br>	C. SAVE<br>	D. UPDATE<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '30'),
(31, '8:35:41 AM', '11/12/2023', '', 'Câu l&#7879;nh SQL nào &#273;&#432;&#7907;c s&#7917; d&#7909;ng &#273;&#7875; xóa d&#7919; li&#7879;u kh&#7887;i c&#417; s&#7903; d&#7919; li&#7879;u?<br>	\nA. REMOVE<br>	B. DELETE<br>	C. COLLAPSE<br>	D. DROP<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '31'),
(32, '9:20:34 AM', '11/12/2023', '', 'Câu l&#7879;nh SQL nào &#273;&#432;&#7907;c s&#7917; d&#7909;ng &#273;&#7875; thêm d&#7919; li&#7879;u m&#7899;i vào c&#417; s&#7903; d&#7919; li&#7879;u?<br>	\nA. ADD RECORD<br>	B. ADD NEW<br>	C. INSERT INTO<br>	D. INSERT NEW<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '32'),
(33, '10:02:45 AM', '11/12/2023', '', 'Trong SQL, làm th&#7871; nào &#273;&#7875; ch&#7885;n m&#7897;t c&#7897;t có tên &quotFirstName&quot t&#7915; b&#7843;ng Persons?<br>	\nA. EXTRACT FirstName<br> \nFROM Persons<br>\nB. SELECT FirstName <br>\nFROM Persons<br>\nC. SELECT Persons.FirstName<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '33'),
(34, '11:28:32 AM', '11/12/2023', '', 'Trong SQL, làm th&#7871; nào &#273;&#7875; ch&#7885;n t&#7845;t c&#7843; các c&#7897;t t&#7915; b&#7843;ng Persons?<br>	\nA. SELECT [all] <br>\nFROM Persons<br>\nB. SELECT * <br>\nFROM Persons<br>\nC. SELECT *.Persons<br>	\nD. SELECT Persons<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '34'),
(35, '3:17:54 PM', '11/12/2023', '', 'Trong SQL, làm th&#7871; nào &#273;&#7875; ch&#7885;n t&#7845;t c&#7843; các b&#7843;n ghi t&#7915; b&#7843;ng Persons trong &#273;ó giá tr&#7883; c&#7911;a c&#7897;t FirstName là &quotPeter&quot?<br>	\nA. SELECT [all] <br>\nFROM Persons <br>\nWHERE FirstName=&apos;Peter&apos;<br>\nB. SELECT [all] <br>\nFROM Persons <br>\nWHERE FirstName LIKE &apos;Peter&apos;<br>\nC. SELECT * <br>\nFROM Persons <br>\nWHERE FirstName&lt;&gt;&apos;Peter&apos;<br>\nD. SELECT * <br>\nFROM Persons <br>\nWHERE FirstName=&apos;Peter&apos;<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '35'),
(36, '3:34:28 PM', '11/12/2023', '', '&#272;âu là l&#7841;i JOIN ph&#7893; bi&#7871;n nh&#7845;t?<br>	\nA. INNER JOIN<br>	B. INSIDE JOIN<br>	C. JOINED TABLE<br>	D. JOINED<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '36'),
(37, '3:46:23 PM', '11/12/2023', '', 'Toán t&#7917; nào &#273;&#432;&#7907;c s&#7917; d&#7909;ng &#273;&#7875; l&#7845;y d&#7919; li&#7879;u trong m&#7897;t b&#7843;ng?<br>	\nA. RANGE<br>	B. BETWEEN<br>	C. WITHIN<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '37'),
(38, '4:23:59 PM', '11/12/2023', '', 'Ràng bu&#7897;c NOT NULL không ch&#7845;p nh&#7853;n m&#7897;t c&#7897;t có giá tr&#7883; null. &#272;ÚNG hay SAI?<br>	\nA. &#272;úng<br>	B. Sai<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '38'),
(39, '4:41:27 PM', '11/12/2023', '', 'M&#7879;nh &#273;&#7873; nào &#273;&#432;&#7907;c s&#7917; d&#7909;ng &#273;&#7875; tìm ki&#7871;m giá tr&#7883; theo m&#7851;u nh&#7845;t &#273;&#7883;nh?<br>	\nA. LIKE<br>	B.GET<br>	C. FROM<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '39'),
(40, '4:56:18 PM', '11/12/2023', '', 'Câu l&#7879;nh nào &#273;&#432;&#7907;c s&#7917; d&#7909;ng &#273;&#7875; t&#7841;o b&#7843;ng trong c&#417; s&#7903; d&#7919; li&#7879;u?<br>	\nA. CREATE DB<br>	B. CREATE TABLE<br>	\nC. CREATE DATABASE TAB<br>	D. CREATE DATABASE TABLE<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '40'),
(41, '5:31:50 PM', '11/12/2023', '', 'Hãy ch&#7885;n t&#7915;/c&#7909;m t&#7915; t&#432;&#417;ng &#7913;ng &#273;&#7875; hoàn thi&#7879;n kh&#7859;ng &#273;&#7883;nh sau: <br>\n		N&#7871;u trong câu l&#7879;nh SELECT có ch&#7913;a GROUP BY, h&#7879; th&#7889;ng s&#7869; ... và th&#7921;c hi&#7879;n \n		các phép g&#7897;p nhóm. <br>\n		A. Phân ho&#7841;ch quan h&#7879; thành nhi&#7873;u nhóm tách bi&#7879;t nhau <br>\n		B. Th&#7921;c hi&#7879;n vi&#7879;c s&#7855;p x&#7871;p theo ch&#7881; d&#7851;n sau m&#7879;nh &#273;&#7873; ORDER BY <br>\n		C. Th&#7921;c hi&#7879;n phép ch&#7885;n sau m&#7879;nh &#273;&#7873; WHERE <br>\n		D. Th&#7921;c hi&#7879;n phép chi&#7871;u sau m&#7879;nh &#273;&#7873; SELECT ', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '41'),
(42, '7:59:54 PM', '11/12/2023', '', 'Cho quan h&#7879; R g&#7891;m các thu&#7897;c tính: K# mã thuê bao, TB tên thuê bao, SDT \n		s&#7889; &#273;i&#7879;n tho&#7841;i, DC &#273;&#7883;a ch&#7881;. Ch&#7885;n câu &#273;úng sau &#273;ây khi tính t&#7893;ng các thuê \n		bao có cùng tên là Lê Ng&#7885;c Hà? <br>\n		A. SELECT COUNT(*) FROM R WHERE TB = &quot;Lê Ng&#7885;c Hà&quot; <br>\n		B. SELECT TB, DC FROM R WHERE TB = &quot;Lê Ng&#7885;c Hà&quot; <br>\n		C. SELECT * FROM R WHERE TB = &quot;Lê Ng&#7885;c Hà&quot;&nbsp; <br>\n		D. SELECT * FROM R WHERE TB = &quot;Lê Ng&#7885;c Hà&quot; GROUP BY TB ', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '42'),
(43, '8:09:36 PM', '11/12/2023', '', 'Cho quan h&#7879; R g&#7891;m các thu&#7897;c tính: K# mã thuê bao, TB tên thuê bao, SDT \n		s&#7889; &#273;i&#7879;n tho&#7841;i, DC &#273;&#7883;a ch&#7881;. Ch&#7885;n câu &#273;úng sau &#273;ây khi tính t&#7893;ng có bao \n		nhiêu thuê bao trên &quot;&#272;&#432;&#7901;ng Nguy&#7877;n Trãi&quot;? <br>\n		A. SELECT * FROM R <br>\n		B. SELECT * FROM R GROUP BY TB HAVING DC = &quot;&#272;&#432;&#7901;ng Nguy&#7877;n Trãi&quot; <br>\n		C. SELECT COUNT(*) FROM R WHERE DC = &quot;&#272;&#432;&#7901;ng Nguy&#7877;n Trãi&quot; <br>\n		D. SELECT * FROM R WHERE DC = &quot;&#272;&#432;&#7901;ng Nguy&#7877;n Trãi&quot;', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '43'),
(44, '8:33:48 AM', '11/13/2023', '', 'Trong database Sales có b&#7843;ng Khachhang và b&#7843;ng Hoadon. M&#7895;i m&#7897;t hoá &#273;&#417;n \n		ch&#7881; bán cho m&#7897;t khách hàng, và m&#7895;i m&#7897;t khách hàng có th&#7875; không có ho&#7863;c \n		có nhi&#7873;u hoá &#273;&#417;n. Nên ch&#7885;n các c&#7897;t làm khóa chính và khoá ngo&#7841;i trong \n		các b&#7843;ng nh&#432; th&#7871; nào? <br>\n		A. Trong b&#7843;ng Khachhang ch&#7885;n khoá chính là Mã hóa &#273;&#417;n (MaHD). Trong b&#7843;ng \n		Hoadon ch&#7885;n khoá chính là Mã khách hàng (MaKH) <br>\n		B. Trong b&#7843;ng Khachhang ch&#7885;n khoá chính là Mã khách hàng (MaKH). Trong \n		b&#7843;ng Hoadon ch&#7885;n khoá chính là Mã khách hàng (MaKH) <br>\n		C. Trong b&#7843;ng Khachhang ch&#7885;n khoá chính là Mã khách hàng (MaKH). Trong \n		b&#7843;ng Hoadon ch&#7885;n khoá ngo&#7841;i là Mã hoa don (MaHD) <br>\n		D Trong b&#7843;ng Khachhang ch&#7885;n khoá chính là Mã khách hàng (MaKH). Trong \n		b&#7843;ng Hoadon ch&#7885;n khoá ngo&#7841;i là Mã khách hàng (MaKH) ', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '44'),
(45, '8:49:37 AM', '11/13/2023', '', 'John mu&#7889;n t&#7841;o thêm 1 ràng bu&#7897;c CHECK mà ràng bu&#7897;c này s&#7869; b&#7887; qua không \n		ki&#7875;m tra &#273;i&#7873;u ki&#7879;n c&#7911;a các hàng &#273;ã có s&#7861;n trong 1 b&#7843;ng. Tùy ch&#7885;n nào nên \n		&#273;&#432;&#7907;c dùng trong khi t&#7841;o ràng bu&#7897;c này? <br>\n		A. WITH NOCHECK <br>\n		B.WITH CHECK <br>\n		C. WITH RECOMPILE <br>\n		D. NOCHECK', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '45'),
(46, '9:44:44 PM', '11/13/2023', '', 'Sara mu&#7889;n b&#7843;o &#273;&#7843;m r&#7857;ng ch&#7881; có 1 m&#7897;t b&#7843;n ghi cho m&#7895;i sinh viên trong b&#7843;ng \n		students. Lo&#7841;i b&#7843;o toàn d&#7919; li&#7879;u nào sau &#273;ây &#273;&#432;&#7907;c s&#7917; d&#7909;ng: <br>\n		A. B&#7843;o toàn th&#7921;c th&#7875; (Entity integrity) <br>\n		B. B&#7843;o toàn mi&#7873;n (Domain integrity) <br>\n		C. B&#7843;o toàn tham chi&#7871;u (Referential integrity) <br>\n		D. B&#7843;o toàn th&#7911; t&#7909;c ( Procedure integrity)', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '46'),
(47, '11:05:28 PM', '11/13/2023', '', 'Constraint nào &#273;&#432;&#7907;c dùng &#273;&#7875; gán giá tr&#7883; h&#7857;ng cho 1 c&#7897;t? <br>\n		A. PRIMARY KEY <br>\n		B. UNIQUE <br>\n		C. CHECK <br>\n		D. DEFAULT', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '47'),
(96, '8:31:10 PM', '11/16/2023', '', 'Câu l&#7879;nh SQL nào chèn d&#7919; li&#7879;u vào b&#7843;ng Project?<br>	\nA. SAVE INTO Projects (ProjectName, ProjectDesscription) <br>\nVALUES (&apos;Content Development&apos;, &apos;Website content development project&apos;)<br>\nB. INSERT Projects <br>\nVALUES (&apos;Content Development&apos;, &apos;Website content development project&apos;)<br>\nC. INSERT Projects (&apos;Content Development&apos;, &apos;Website content development project&apos;)<br>\nD. INSERT INTO Projects (ProjectName, ProjectDesscription) <br>\nVALUES (&apos;Content Development&apos;, &apos;Website content development project&apos;)<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '96'),
(97, '8:39:10 PM', '11/16/2023', '', 'Câu l&#7879;nh SQL nào sau &#273;ây có cú pháp &#273;úng?<br>	\nA. SELECT CustomerName <br>\nCOUNT (CustomerName) <br>\nFROM Orders <br>\nORDER BY CustomerName<br>\nB. SELECT CustomerName <br>\nCOUNT (CustomerName) <br>\nFROM Orders <br>\nGROUP BY CustomerName<br>\nC. SELECT CustomerName <br>\nCOUNT (CustomerName) <br>\nFROM Orders<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '97'),
(98, '8:57:36 PM', '11/16/2023', '', 'Câu l&#7879;nh SQL nào ch&#7885;n t&#7845;t c&#7843; các hàng t&#7915; b&#7843;ng Products và s&#7855;p x&#7871;p k&#7871;t qu&#7843; theo c&#7897;t ProductID?<br>	\nA. SELECT * <br>\nFROM Products <br>\nORDERED BY ProductID<br>\nB. SELECT * <br>\nFROM Products <br>\nORDER BY ProductID<br>\nC. SELECT * <br>\nFROM Products <br>\nWHERE ProductID &gt; 200<br>\nD. SELECT ProductID<br>\nFROM Products<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '98'),
(99, '9:43:06 PM', '11/16/2023', '', 'M&#7879;nh &#273;&#7873; SQL nào sau &#273;ây &#273;&#432;&#7907;c s&#7917; d&#7909;ng &#273;&#7875; ch&#7885;n d&#7919; li&#7879;u t&#7915; 2 b&#7843;ng tr&#7903; lên?<br>	\nA. WHERE<br>	\nB. JOIN<br>	\nC. HAVING<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '99'),
(100, '11:05:06 PM', '11/16/2023', '', '&#272;âu là t&#7915; khóa xác &#273;&#7883;nh ki&#7875;u s&#7855;p x&#7871;p c&#7911;a t&#7853;p k&#7871;t qu&#7843; &#273;&#432;&#7907;c truy xu&#7845;t trong m&#7879;nh &#273;&#7873; ORDER BY?<br>	\nA. HIGH và LOW<br>	\nB. ASC và DESC<br>	\nC. UP và DOWN<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '100'),
(101, '11:20:09 PM', '11/16/2023', '', 'K&#7871;t qu&#7843; c&#7911;a phát bi&#7875;u SELECT &#273;&#432;&#7907;c xem là <br>\n		A. m&#7897;t b&#7897; <br>\n		B. m&#7897;t tr&#432;&#7901;ng <br>\n		C. m&#7897;t quan h&#7879; <br>\n		D. m&#7897;t thu&#7897;c tính', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '101'),
(102, '11:33:46 PM', '11/16/2023', '', 'Trong m&#7897;t phát bi&#7875;u SELECT, ng&#432;&#7901;i ta th&#7845;y có m&#7879;nh &#273;&#7873; <br>\n		&#8195; WHERE HoTen LIKE &quot;% Hoàng %&quot; ; <br>\n		H&#7885; tên nào sau &#273;ây có trong k&#7871;t qu&#7843;: <br>\n		A. Hoàng H&#7919;u Phúc <br>\n		B. Lê Hoàng Phúc <br>\n		C. Tr&#7883;nh Công Hoàng <br>\n		D. C&#7843; ba &#273;&#7873;u có trong k&#7871;t qu&#7843;.', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '102'),
(103, '11:42:31 PM', '11/16/2023', '', 'Trong phát bi&#7875;u SELECT, m&#7879;nh &#273;&#7873; WHERE dùng &#273;&#7875; <br>\n		A. lo&#7841;i b&#7899;t m&#7897;t s&#7889; c&#7897;t <br>\n		B. lo&#7841;i b&#7899;t m&#7897;t s&#7889; dòng <br>\n		C. lo&#7841;i b&#7899;t c&#7843; dòng và c&#7897;t <br>\n		D. m&#7879;nh &#273;&#7873; WHERE dùng cho các nhi&#7879;m v&#7909; khác.', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '103'),
(104, '8:20:47 AM', '11/17/2023', '', 'Phát bi&#7875;u ALTER có th&#7875; <br>\n		A. dùng &#273;&#7875; &#273;&#7893;i tên c&#7911;a m&#7897;t c&#7897;t <br>\n		B. dùng &#273;&#7875; &#273;&#7893;i n&#7897;i dung c&#7911;a m&#7897;t dòng <br>\n		C. th&#7921;c hi&#7879;n c&#7843; hai nhi&#7879;m v&#7909; trên <br>\n		D. không th&#7875; th&#7921;c hi&#7879;n nhi&#7879;m v&#7909; nào trong hai nhi&#7879;m v&#7909; trên', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '104'),
(105, '8:29:55 AM', '11/17/2023', '', '&#272;&#7875; &#273;i&#7873;u ch&#7881;nh &#273;i&#7875;m môn Toán cho sinh viên X, ta s&#7917; d&#7909;ng <br>\n		A. DCL <br>\n		B. DDL <br>\n		C. DML <br>\n		D. ch&#432;&#417;ng trình &#7913;ng d&#7909;ng', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '105'),
(106, '8:35:07 AM', '11/17/2023', '', 'S&#7921; khác bi&#7879;t gi&#7919;a DDL (ph&#7847;n &#273;&#7883;nh ngh&#297;a d&#7919; li&#7879;u c&#7911;a SQL) và DML (ph&#7847;n \n		thao tác d&#7919; li&#7879;u c&#7911;a SQL) là: <br>\n		A. DDL dùng &#273;&#7875; thêm m&#7897;t dòng vào b&#7843;ng d&#7919; li&#7879;u, DML dùng &#273;&#7875; thêm m&#7897;t c&#7897;t \n		vào b&#7843;ng d&#7919; li&#7879;u. <br>\n		B. DDL dùng &#273;&#7875; thêm m&#7897;t c&#7897;t vào b&#7843;ng d&#7919; li&#7879;u, DML dùng &#273;&#7875; thêm m&#7897;t dòng \n		vào b&#7843;ng d&#7919; li&#7879;u. <br>\n		C. C&#7843; DDL và DML &#273;&#7873;u không th&#7875; th&#7921;c hi&#7879;n hai nhi&#7879;m v&#7909; trên. <br>\n		D. &#272;&#7875; th&#7921;c hi&#7879;n hai nhi&#7879;m v&#7909; trên, ta s&#7917; d&#7909;ng m&#7897;t thành ph&#7847;n khác c&#7911;a \n		SQL.', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '106'),
(107, '8:55:57 AM', '11/17/2023', '', 'Phát bi&#7875;u nào sau &#273;ây là SAI: <br>\n		A. C&#7845;u trúc l&#432;u tr&#7919; c&#7911;a m&#7897;t database g&#7891;m t&#7889;i thi&#7875;u m&#7897;t Data file, m&#7897;t \n		Log file <br>\n		B. C&#7845;u trúc l&#432;u tr&#7919; c&#7911;a m&#7897;t database g&#7891;m t&#7889;i thi&#7875;u m&#7897;t Data file &#273;&#432;&#7907;c \n		&#273;&#7863;t trong các data file thu&#7897;c Primary filegroup <br>\n		C. M&#7897;t Data file ch&#7881; thu&#7897;c v&#7873; m&#7897;t filegroup. M&#7897;t Log file không khi nào \n		thu&#7897;c m&#7897;t filegroup. <br>\n		D. Các file và filegroup c&#7911;a m&#7897;t database không th&#7875; dùng chung v&#7899;i \n		database khác', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '107'),
(108, '9:48:29 AM', '11/17/2023', '', 'Ed là 1 nhà qu&#7843;n tr&#7883; CSDL c&#7911;a công ty FlyFastCourier. Công ty &#273;ang c&#7853;p \n		nh&#7853;t l&#7841;i SQL server c&#7911;a h&#7885; và mu&#7889;n l&#432;u tr&#7919; các chi ti&#7871;t nh&#432; kích c&#7905; và \n		các thông tin khác c&#7911;a DB. Hãy giúp Ed xem các thông tin này <br>\n		A. sp_helptext <br>\n		B. sp_databases <br>\n		C. sp_help <br>\n		D. sp_helpdb', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '108'),
(109, '10:01:04 AM', '11/17/2023', '', 'M&#7897;t filegroup là: <br>\n		A. Là 1 t&#7853;p h&#7907;p các file s&#417; c&#7845;p (primary) và th&#7913; c&#7845;p (secondary) <br>\n		B. Có th&#7875; t&#7891;n t&#7841;i 1 cách &#273;&#7897;c l&#7853;p <br>\n		C. Có th&#7875; ch&#7913;a các file transaction <br>\n		D. Ch&#7913;a thông tin v&#7873; các file, kích c&#7905; file và t&#7927; l&#7879; gia t&#259;ng file', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '109'),
(110, '10:13:02 AM', '11/17/2023', '', 'Mô hình client/server thu&#7897;c ki&#7871;n trúc nào sau &#273;ây: <br>\n		A. Ki&#7871;n trúc 1 l&#7899;p (single-tier) <br>\n		B. Ki&#7871;n trúc 2 l&#7899;p (Two-tier) <br>\n		C. Ki&#7871;n trúc 3 l&#7899;p (Three-tier) <br>\n		D. &#272;a ki&#7871;n trúc (multi-tier)', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '110'),
(111, '10:21:06 AM', '11/17/2023', '', 'DB nào &#273;&#432;&#7907;c dùng b&#7903;i SQL server &#273;&#7875; s&#7855;p x&#7871;p d&#7919; li&#7879;u tr&#432;&#7899;c khi tr&#7843; k&#7871;t qu&#7843; \n		v&#7873; cho ng&#432;&#7901;i dùng <br>\n		A. master <br>\n		B. msdb <br>\n		C. tempdb <br>\n		D. model', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '111'),
(112, '10:54:51 AM', '11/17/2023', '', 'Vi&#7879;c l&#432;u tr&#7919; d&#7919; li&#7879;u trong m&#7897;t c&#417; s&#7903; d&#7919; li&#7879;u &#273;&#432;&#7907;c th&#7921;c hi&#7879;n thông qua 3 \n		lo&#7841;i file: s&#417; c&#7845;p (.mdf), th&#7913; c&#7845;p (.ndf) và nh&#7853;t ký (.log). N&#7871;u t&#7853;p tin \n		th&#7913; c&#7845;p b&#7883; &#273;&#7847;y, b&#7841;n s&#7869; l&#432;u tr&#7919; d&#7919; li&#7879;u phát sinh thêm nh&#432; th&#7871; nào vào \n		CSDL? <br>\n		A. T&#7841;o m&#7897;t file s&#417; c&#7845;p khác <br>\n		B. T&#7841;o 1 file th&#7913; c&#7845;p khác <br>\n		C. T&#7841;o 1 file nh&#7853;t ký khác <br>\n		D. T&#7841;o thêm 1 file s&#417; c&#7845;p và th&#7913; c&#7845;p', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '112'),
(113, '11:13:07 AM', '11/17/2023', '', 'Sau khi th&#7921;c thi l&#7879;nh DROP DATABASE &#273;&#7875; xóa m&#7897;t database, B&#7841;n c&#7847;n th&#7921;c \n		hi&#7879;n thao tác nào ti&#7871;p theo &#273;&#7875; gi&#7843;i phóng ch&#7895; tr&#7889;ng trên &#273;&#297;a? <br>\n		A. Xóa các database file <br>\n		B. Xóa các database file t&#7915; Enterprise Manager , r&#7891;i xóa các file này \n		m&#7897;t l&#7847;n n&#7919;a b&#7857;ng Windows Explorer <br>\n		C. Không ph&#7843;i làm gì n&#7919;a <br>\n		D. S&#7917; d&#7909;ng DBCC SHRINKDATABASE ', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '113'),
(114, '2:46:47 PM', '11/17/2023', '', 'Các System Table và các System Object khác trong m&#7897;t User_defined \n		Database &#273;&#432;&#7907;c &#273;&#7863;t trong các data file thu&#7897;c filegroup nào: <br>\n		A. Primary filegroup <br>\n		B. Default filegroup <br>\n		C. User_defined filegroup <br>\n		D. Secondary filegroup', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '114'),
(115, '2:57:47 PM', '11/17/2023', '', 'B&#7843;ng Customers s&#7869; &#273;&#432;&#7907;c &#273;&#7863;t trong các data file thu&#7897;c filegroup nào, sau \n		khi th&#7921;c thi l&#7879;nh: <br>\n		CREATE TABLE Customers <br>\n		(CustomerID nchar (5) NOT NULL IDENTITY(1, 1), <br>\n		LastName nvarchar (40) NOT NULL, <br>\n		FirstName nvarchar (30) NULL, <br>\n		MiddleInitial nvarchar (3) NULL, <br>\n		ContactTitle nvarchar (30) NULL, <br>\n		Address nvarchar (60) NULL, <br>\n		City nvarchar (15) NULL, <br>\n		CONSTRAINT PK_Customers PRIMARY KEY CLUSTERED (CustomerID) <br>\n		) <br>\n		A. Primary filegroup <br>\n		B. default filegroup <br>\n		C. user_defined filegroup <br>\n		D. Không &#273;&#432;&#7907;c &#273;&#7863;t trong filegroup nào ', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '115'),
(116, '3:09:41 PM', '11/17/2023', '', 'B&#7841;n v&#7915;a t&#7841;o database Customers b&#7857;ng l&#7879;nh sau: <br>\n		CREATE DATABASE Customers <br>\n		ON PRIMARY <br>\n		( NAME = CustData, <br>\n		FILENAME = N\'c:\\Data\\CustData.mdf\', <br>\n		SIZE = 200 <br>\n		) <br>\n		LOG ON <br>\n		( NAME = CustLog, <br>\n		FILENAME = N\'d:\\data\\CustLog.ldf\' <br>\n		) <br>\n		B&#7841;n phát hi&#7879;n &#273;ã quên không &#273;&#7863;t m&#7897;t s&#7889; tham s&#7889; vào trong l&#7879;nh ví d&#7909; nh&#432; \n		kích th&#432;&#7899;c t&#7889;i &#273;a, …Có v&#7845;n &#273;&#7873; gì &#7903; &#273;ây? <br>\n		A. Database &#273;&#432;&#7907;c t&#7841;o v&#7899;i tham s&#7889; default <br>\n		B. Database &#273;&#432;&#7907;c t&#7841;o v&#7899;i giá tr&#7883; các tham s&#7889; không xác &#273;&#7883;nh <br>\n		C. Database &#273;&#432;&#7907;c t&#7841;o v&#7899;i giá tr&#7883; các tham s&#7889; &#273;&#432;&#7907;c xác &#273;&#7883;nh theo database \n		Model <br>\n		D. L&#7879;nh th&#7921;c thi database không thành công ', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '116'),
(117, '3:22:38 PM', '11/17/2023', '', 'L&#7879;nh nào dùng &#273;&#7875; thêm c&#7897;t Emp_EmailId vào b&#7843;ng Emp_details v&#7899;i ki&#7875;u d&#7919; \n		li&#7879;u là varchar và kích c&#7905; là 20: <br>\n		A. Alter COLUMN EMP_Details ADD (Emp_EmailId) vchar(10) NOT NULL <br>\n		B. Alter COLUMN EMP_Details ADD (Emp_EmailId) varchar(10) <br>\n		C. Alter EMP_Details ADD Emp_EmailId varchar(10) <br>\n		D. Alter Table EMP_Details ADD Emp_EmailId varchar(10) ', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '117'),
(118, '3:34:30 PM', '11/17/2023', '', '&#272;&#7889;i t&#432;&#7907;ng nào sau &#273;ây &#273;&#7875; t&#259;ng t&#7889;c truy tìm các hàng trong 1 b&#7843;ng hay \n		view <br>\n		A. Ràng bu&#7897;c (constraints) <br>\n		B. Triggers <br>\n		C. Stored procedures <br>\n		D. Ch&#7881; m&#7909;c (Indexes)', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '118'),
(119, '3:42:11 PM', '11/17/2023', '', 'Xác &#273;&#7883;nh th&#7911; t&#7909;c h&#7879; th&#7889;ng nào &#273;&#432;&#7907;c dùng &#273;&#7875; t&#7841;o lo&#7841;i d&#7919; li&#7879;u c&#7911;a ng&#432;&#7901;i \n		dùng: <br>\n		A. sp_addtype <br>\n		B. sp_droptype <br>\n		C. sp_bindrule <br>\n		D. sp_unbindrule', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '119'),
(120, '3:52:09 PM', '11/17/2023', '', 'Xác &#273;&#7883;nh tùy ch&#7885;n nào &#273;úng khi nói v&#7873; nonclustered index <br>\n		A. D&#7919; li&#7879;u &#273;&#432;&#7907;c s&#7855;p x&#7871;p 1 cách v&#7853;t lý <br>\n		B. Th&#7913; t&#7921; c&#7911;a index gi&#7889;ng nh&#432; th&#7913; t&#7921; v&#7853;t lý c&#7911;a các hàng trong b&#7843;ng <br>\n		C. Th&#7913; t&#7921; c&#7911;a index không gi&#7889;ng nh&#432; th&#7913; t&#7921; v&#7853;t lý c&#7911;a các hàng trong \n		b&#7843;ng <br>\n		D. Nonclustered index không &#273;&#432;&#7907;c t&#7841;o ra trên các c&#7897;t &#273;ã &#273;&#432;&#7907;c dùng trong \n		các m&#7879;nh &#273;&#7873; JOIN và WHERE', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '120'),
(121, '5:14:39 PM', '11/17/2023', '', 'Câu l&#7879;nh SQL nào ch&#7885;n t&#7845;t c&#7843; các hàng t&#7915; b&#7843;ng Contest v&#7899;i c&#7897;t ContestDate có giá tr&#7883; l&#7899;n h&#417;n ho&#7863;c b&#7857;ng ngày 25/3/2019?<br>	\nA. SELECT * <br>\nFROM Contest <br>\nWHERE ContestDate &gt;= &apos;03/25/2019&apos;<br>\nB. SELECT * <br>\nFROM Contest <br>\nWHERE ContestDate &lt; &apos;03/25/2019&apos;<br>\nC. SELECT * <br>\nFROM Contest <br>\nHAVING ContestDate &gt;= &apos;03/25/2019&apos;<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '121'),
(122, '12:16:26 AM', '11/18/2023', '', 'TRANSACTION trong SQL có các thu&#7897;c tính th&#432;&#7901;ng &#273;&#432;&#7907;c vi&#7871;t t&#7855;t là ACID ngh&#297;a là gi?<br>\nA. Access<br>\nConsistency<br>\nIsolation<br>\nData<br>\nB. Access<br>\nConstraint<br>\nIndex<br>\nData<br>\nC. Atomicity<br>\nConsistency<br>\nIsolation<br>\nDurability<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '122'),
(123, '9:02:06 AM', '11/18/2023', '', 'Câu l&#7879;nh SQL nào s&#7869; s&#7917; d&#7909;ng &#273;&#7875; ch&#7885;n t&#7845;t c&#7843; các c&#7897;t t&#7915; b&#7843;ng THONGTIN_SACH có các c&#7897;t là ID_SACH, TEN_SACH, GIA?<br>	\nA. SELECT ID_SACH + GIA<br>\nFROM THONGTIN_SACH;<br>\nB. SELECT *<br>\nFROM THONGTIN_SACH;<br>\nC. SELECT ALL<br>\nFROM THONGTIN_SACH;<br>\nD. SELECT ALL COLUMNS<br>\nFROM THONGTIN_SACH;<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '123'),
(124, '9:01:30 AM', '11/18/2023', '', 'Câu l&#7879;nh SQL nào s&#7917; d&#7909;ng &#273;&#7875; ch&#7885;n t&#7845;t c&#7843; các sách có giá cao h&#417;n 200000?<br>	\nA. SELECT ID_SACH<br>\nFROM THONGTIN_SACH<br>\nHAVING GIA &gt; 200000;<br>\nB. SELECT ID_SACH<br>\nFROM THONGTIN_SACH<br>\nONLY GIA &gt; 200000;<br>\nC. SELECT ID_SACH<br>\nFROM THONGTIN_SACH<br>\nWHERE ID_SACH &gt; 200000;<br>\nD. SELECT ID_SACH<br>\nFROM THONGTIN_SACH<br>\nWHERE GIA &gt; 200000;<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '124'),
(125, '9:08:20 AM', '11/18/2023', '', 'Câu l&#7879;nh SQL nào cho phép s&#7855;p x&#7871;p t&#7845;t c&#7843; các sách theo giá t&#7915; cao &#273;&#7871;n th&#7845;p?<br>	\nA. SELECT ID_SACH, TEN_SACH, GIA<br>\nFROM THONGTIN_SACH<br>\nORDER BY GIA DESC;<br>\nB. SELECT ID_SACH, TEN_SACH, GIA<br>\nFROM THONGTIN_SACH<br>\nSORT BY GIA DESC;<br>\nC. SELECT ID_SACH, TEN_SACH, GIA<br>\nFROM THONGTIN_SACH<br>\nSORT BY GIA ASC;<br>\nD. SELECT ID_SACH, TEN_SACH, GIA<br>\nFROM THONGTIN_SACH<br>\nORDER BY GIA ASC;<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '125'),
(126, '9:18:23 AM', '11/18/2023', '', 'Câu l&#7879;nh SQL nào cho phép chèn &#273;o&#7841;n d&#7919; li&#7879;u sau vào b&#7843;ng THONGTIN_SACH?<br>\nID_SACH=20<br>\nTEN_SACH=&apos;HOC SQL TU W3SCHOOL.COM&apos;<br>\nGIA=150000<br>\nA. ADD INTO THONGTIN_SACH<br>\nWITH (20, &apos;HOC SQL TU W3SCHOOL.COM&apos;, 150000)<br>\nB. INSERT INTO THONGTIN_SACH<br>\nUSING (20, &apos;HOC SQL TU W3SCHOOL.COM&apos;, 150000)<br>\nC. INSERT INTO THONGTIN_SACH<br>\nVALUES (20, &apos;HOC SQL TU W3SCHOOL.COM&apos;, 150000)<br>\nD. ADD INTO THONGTIN_SACH<br>\nVALUES (20, &apos;HOC SQL TU W3SCHOOL.COM&apos;, 150000)<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '126'),
(127, '9:37:02 AM', '11/18/2023', '', 'Câu l&#7879;nh SQL nào cho phép xóa b&#7843;ng THONGTIN_SACH kh&#7887;i c&#417; s&#7903; d&#7919; li&#7879;u?<br>	\nA. DROP THONGTIN_SACH;<br>	\nB. DELETE TABLE THONGTIN_SACH;<br>	\nC. TRUNCATE TABLE THONGTIN_SACH;<br>	\nD. DROP TABLE THONGTIN_SACH;<br>', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'D', NULL, NULL, NULL, NULL, '127'),
(177, '9:37:02 AM', '11/18/2023', '', 'B&#7841;n c&#7847;n hi&#7875;n th&#7883; t&#7845;t c&#7843; các t&#7893; h&#7907;p có th&#7875; có gi&#7919;a các nhân viên và các \n		công vi&#7879;c trong công ty. Có 10 nhân viên &#273;&#432;&#7907;c l&#432;u trong b&#7843;ng Nhanvien và \n		6 công vi&#7879;c &#273;&#432;&#7907;c l&#432;u trong b&#7843;ng Congviec.<br>\n		B&#7841;n ch&#7885;n query nào &#273;&#7875; th&#7921;c hi&#7879;n yêu c&#7847;u trên: <br>\n		A. SELECT * FROM nhanvien nv , congviec wk WHERE nv.MaNV = wk.MaCV <br>\n		B. SELECT * FROM nhanvien nv , congviec wk <br>\n		C. SELECT * FROM nhanvien nv LEFT OUTER JOIN congviec wk ON nv.MaNV = \n		wk.MaCV <br>\n		D. SELECT * FROM nhanvien nv FULL OUTER JOIN congviec wk ON nv.MaNV = \n		wk.MaCV', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '177'),
(178, '9:57:03 AM', '11/18/2023', '', 'Xem xét hai câu l&#7879;nh sau cùng th&#7921;c hi&#7879;n trên table R:&nbsp; <br>\n		Câu 1: SELECT * FROM R&nbsp; <br>\n		Câu 2: SELECT * FROM R&nbsp; <br>\n		UNION <br>\n		SELECT * FROM R <br>\n		Nh&#7853;n xét nào là &#273;úng? <br>\n		A. Câu 1 và Câu 2 &#273;&#7873;u tr&#7843; v&#7873; t&#7853;p record gi&#7889;ng nhau <br>\n		B. Câu 1 và Câu 2 tr&#7843; v&#7873; t&#7853;p record không gi&#7889;ng nhau <br>\n		C. Câu 1 tr&#7843; v&#7873; t&#7853;p record n&#7857;m trong t&#7853;p record c&#7911;a Câu 2 <br>\n		D. Câu 2 tr&#7843; v&#7873; t&#7853;p record n&#7857;m trong t&#7853;p record c&#7911;a Câu 1', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'A', NULL, NULL, NULL, NULL, '178'),
(179, '10:08:07 AM', '11/18/2023', '', 'Câu l&#7879;nh nào sau &#273;ây dùng &#273;&#7875; xóa các record trong table Hóa &#273;&#417;n (Orders) \n		mà không có record t&#432;&#417;ng &#7913;ng trong Chi ti&#7871;t hoá &#273;&#417;n (OrderLine)?&nbsp; <br>\n		A. DELETE Orders WHERE OrderLine.OrderID Is NULL <br>\n		B. DELETE Orders WHERE OrderID NOT IN ( SELECT OrderID from OrderLine)\n		<br>\n		C. DELETE Orders FROM OrderLine WHERE OrderLine.OrderID Is NULL <br>\n		D. DELETE Orders FROM OrderLine ol, Orders o WHERE o.OrderID = \n		ol.OrderID', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'B', NULL, NULL, NULL, NULL, '179'),
(180, '10:13:46 AM', '11/18/2023', '', 'Phiên b&#7843;n Enterprise c&#7911;a SQL Server ch&#7913;a &#273;&#7847;y &#273;&#7911; các &#273;&#7863;c tr&#432;ng c&#7911;a SQL \n		Server và có th&#7875; ch&#7841;y t&#7889;t trên h&#7879; th&#7889;ng lên &#273;&#7871;n: <br>\n		A. 4 CPU và 2 GB RAM <br>\n		B. 16 CPUs và 32 GB RAM <br>\n		C. 32 CPUs và 64 GB RAM <br>\n		D. 64 CPUs và 128 GB RAM', NULL, NULL, NULL, NULL, 'Thực hành thiết kế dữ liệu với SQL', '', 'C', NULL, NULL, NULL, NULL, '180');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifi_1`
--

CREATE TABLE `notifi_1` (
  `ID` int(10) DEFAULT NULL,
  `ParentMessage` int(10) DEFAULT NULL,
  `ThreadParent` int(10) DEFAULT NULL,
  `AuthorName` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AuthorEmail` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `comments` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Topic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ReplyCount` int(10) DEFAULT NULL,
  `LastThreadPost` datetime DEFAULT NULL,
  `DatePosted` datetime DEFAULT NULL,
  `Contents1` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Contents2` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Contents3` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Contents4` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Contents5` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Contents20` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Contents21` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Contents22` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Contents23` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Contents24` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Contents25` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Contents26` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Contents27` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Contents28` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Contents29` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Contents30` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Contents31` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Contents32` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Contents33` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Contents40` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `notifi_1`
--

INSERT INTO `notifi_1` (`ID`, `ParentMessage`, `ThreadParent`, `AuthorName`, `AuthorEmail`, `comments`, `Topic`, `ReplyCount`, `LastThreadPost`, `DatePosted`, `Contents1`, `Contents2`, `Contents3`, `Contents4`, `Contents5`, `Contents20`, `Contents21`, `Contents22`, `Contents23`, `Contents24`, `Contents25`, `Contents26`, `Contents27`, `Contents28`, `Contents29`, `Contents30`, `Contents31`, `Contents32`, `Contents33`, `Contents40`) VALUES
(16, 0, 16, NULL, 'Admin', 'Cộng fsdfsdfs', 'Cộng AABC344', 1, '2023-10-04 20:30:47', '2023-10-04 20:30:47', 'Admin', NULL, NULL, NULL, NULL, 'Nguyễn Hữu Thành Đạt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 0, 17, NULL, 'Admin', 'Cộng fsdfsdfs', 'Cộng AABC344', 1, '2023-10-04 20:30:50', '2023-10-04 20:30:50', 'Admin', NULL, NULL, NULL, NULL, 'Nguyễn Hữu Thành Đạt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 0, 18, NULL, 'Admin', 'Cộng fsdfsdfs', 'Cộng AABC344', 1, '2023-10-04 20:30:54', '2023-10-04 20:30:54', 'Admin', NULL, NULL, NULL, NULL, 'Nguyễn Hữu Thành Đạt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 0, 19, NULL, 'Admin', 'FSDSDFSDSFSDF\r\nHFGHFGHF', 'C&#7897;ng NNNN', 0, '2023-10-04 22:21:35', '2023-10-04 22:21:35', 'Admin', NULL, NULL, NULL, NULL, 'Nguyễn Hữu Thành Đạt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 0, 28, NULL, 'Admin', 'FSDSDFSDSFSDF\r\nHFGHFGHF', 'C&#7897;ng NNNN', 0, '2023-10-04 22:28:10', '2023-10-04 22:28:10', 'Admin', NULL, NULL, NULL, NULL, 'Nguyễn Hữu Thành Đạt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 0, 29, NULL, 'Admin', 'FSDSDFSDSFSDF\r\nHFGHFGHF', 'C&#7897;ng NNNN', 0, '2023-10-04 22:29:33', '2023-10-04 22:29:33', 'Admin', NULL, NULL, NULL, NULL, 'Nguyễn Hữu Thành Đạt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 0, 30, NULL, 'Admin', 'fgdgsd', 'Thông báo tuyển sinh tháng 10', 0, '2023-10-05 08:24:44', '2023-10-05 08:24:44', 'Admin', NULL, NULL, NULL, NULL, 'Nguyễn Hữu Thành Đạt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 0, 30, NULL, 'Admin', 'zq', 'Thông báo tuyển sinh tháng 10', 0, '2023-10-05 08:38:20', '2023-10-05 08:38:20', 'Admin', NULL, NULL, NULL, NULL, 'Nguyễn Hữu Thành Đạt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 0, 1, ' ', 'Admin', 'Thí sinh đã tốt nghiệp THPT hoặc trung cấp. Người tốt nghiệp trung cấp nhưng chưa có bằng tốt nghiệp THPT phải học và được công nhận đã hoàn thành các môn văn hóa THPT theo quy định. Tuyển sinh trên cả nước Chúng tôi sẽ thông báo ngưỡng đảm bảo chất lượng đầu vào trên trang thông tin điện tử của Nhà trường tại địa chỉ http://www.hau.edu.vn và trên trang thông tin tuyển sinh của Trường tại địa chỉ http://tuyensinh.hau.edu.vn trước thời gian kết thúc đăng ký dự tuyển ít nhất 10 ngày  ', 'Thông báo tuyển sinh', 0, '2023-09-27 22:47:55', '2023-09-26 22:47:55', 'A', '2', '––', '–', '–', 'Nguyễn Hữu Thành Đạt', 'hd@gmail.com', '665565', '09443591475', 'TH', '24234234', 'HN', 'HN', '65646456', '0', 'False', '–', NULL, 'hd', '–'),
(2, 0, 2, ' ', 'Admin', 'Nghỉ ngày 2/9 và 01 ngày trước đó (tức thứ 6 và thứ 7) và nghỉ 01 ngày nghỉ hằng tuần (chủ nhật). Tức nghỉ từ 1/9 đến 3/9  ', 'Thông báo nghỉ lễ', 1, '2023-09-21 18:35:18', '2023-09-20 07:56:39', 'B', '2', '–', '–', '–', 'Nguyễn Hữu Thành Đạt', 'hd@gmail.com', '5656565', '53554554554', 'TH', '53453455', 'HN', 'HN', '654654654', '0', 'False', '–', NULL, 'hd', '-'),
(3, 0, 3, ' ', 'Admin', 'Hệ thống mở cổng đăng kí thi kết thúc học phần chung đợt 7 (ngày thi 31/7-02/8). Sinh viên các đơn vị đào tạo truy cập hệ thống\r\nlàm khảo sát trước khi đăng kí ca thi  ', 'Thông báo thi môn Triết học Mác - Lênin', 0, '2023-09-19 08:16:05', '2023-09-19 08:15:05', 'G', '2', '–', '–', '–', 'Nguyễn Hữu Thành Đạt', 'hd@gmail.com', '5656565', '53453435554', 'TH', '64564656', 'HN', 'HN', '6546546', '0', 'False', '–', NULL, 'hd', '–'),
(4, 0, 4, NULL, 'Admin', 'Cộng fsdfsdfs', 'Cộng AABC344', 1, '2023-10-04 20:30:09', '2023-10-04 20:30:09', 'Admin', NULL, NULL, NULL, NULL, 'Nguyễn Hữu Thành Đạt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 0, 5, NULL, 'Admin', 'Cộng fsdfsdfs', 'Cộng AABC344', 1, '2023-10-04 20:30:13', '2023-10-04 20:30:13', 'Admin', NULL, NULL, NULL, NULL, 'Nguyễn Hữu Thành Đạt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 0, 6, NULL, 'Admin', 'Cộng fsdfsdfs', 'Cộng AABC344', 1, '2023-10-04 20:30:16', '2023-10-04 20:30:16', 'Admin', NULL, NULL, NULL, NULL, 'Nguyễn Hữu Thành Đạt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 0, 7, NULL, 'Admin', 'Cộng fsdfsdfs', 'Cộng AABC344', 1, '2023-10-04 20:30:19', '2023-10-04 20:30:19', 'Admin', NULL, NULL, NULL, NULL, 'Nguyễn Hữu Thành Đạt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 0, 8, NULL, 'Admin', 'Cộng fsdfsdfs', 'Cộng AABC344', 1, '2023-10-04 20:30:22', '2023-10-04 20:30:22', 'Admin', NULL, NULL, NULL, NULL, 'Nguyễn Hữu Thành Đạt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 0, 9, NULL, 'Admin', 'Cộng fsdfsdfs', 'Cộng AABC344', 1, '2023-10-04 20:30:25', '2023-10-04 20:30:25', 'Admin', NULL, NULL, NULL, NULL, 'Nguyễn Hữu Thành Đạt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 10, NULL, 'Admin', 'Cộng fsdfsdfs', 'Cộng AABC344', 1, '2023-10-04 20:30:29', '2023-10-04 20:30:29', 'Admin', NULL, NULL, NULL, NULL, 'Nguyễn Hữu Thành Đạt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 0, 11, NULL, 'Admin', 'Cộng fsdfsdfs', 'Cộng AABC344', 1, '2023-10-04 20:30:32', '2023-10-04 20:30:32', 'Admin', NULL, NULL, NULL, NULL, 'Nguyễn Hữu Thành Đạt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 0, 12, NULL, 'Admin', 'Cộng fsdfsdfs', 'Cộng AABC344', 1, '2023-10-04 20:30:35', '2023-10-04 20:30:35', 'Admin', NULL, NULL, NULL, NULL, 'Nguyễn Hữu Thành Đạt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 0, 13, NULL, 'Admin', 'Cộng fsdfsdfs', 'Cộng AABC344', 1, '2023-10-04 20:30:38', '2023-10-04 20:30:38', 'Admin', NULL, NULL, NULL, NULL, 'Nguyễn Hữu Thành Đạt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 0, 14, NULL, 'Admin', 'Cộng fsdfsdfs', 'Cộng AABC344', 1, '2023-10-04 20:30:41', '2023-10-04 20:30:41', 'Admin', NULL, NULL, NULL, NULL, 'Nguyễn Hữu Thành Đạt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 0, 15, NULL, 'Admin', 'Cộng fsdfsdfs', 'Cộng AABC344', 1, '2023-10-04 20:30:43', '2023-10-04 20:30:43', 'Admin', NULL, NULL, NULL, NULL, 'Nguyễn Hữu Thành Đạt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reg01`
--

CREATE TABLE `reg01` (
  `ID` int(10) DEFAULT NULL,
  `SophieuDK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ThreadParent` int(10) DEFAULT NULL,
  `PARENTMESSAGE` int(10) DEFAULT NULL,
  `Comments` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Hoten` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Sinhngay` date DEFAULT NULL,
  `Topic` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Diachi` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Email` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CCCD` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NgayCCCD` date DEFAULT NULL,
  `NoiCapCCCD` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Hinhthuc` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Hinhthuc_2` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Hinhthuc_3` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Hinhthuc_4` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Hinhthuc_5` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MaID_mon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Mon_Hocphan` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Mon_Hocphan2` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Mon_Hocphan3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Mon_Hocphan4` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Mon_Hocphan5` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Muc` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Muc_2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Muc_3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Muc_4` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Muc_5` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NgayDK` datetime DEFAULT NULL,
  `NgayDK_2` datetime DEFAULT NULL,
  `NgayDK_3` datetime DEFAULT NULL,
  `NgayDK_4` datetime DEFAULT NULL,
  `NgayDK_5` datetime DEFAULT NULL,
  `Time_DK` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Nien_khoa` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Nien_khoa_2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Nien_khoa_3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Nien_khoa_4` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Nien_khoa_5` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Donvi_DT` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DatePosted` datetime DEFAULT NULL,
  `DatePosted_2` datetime DEFAULT NULL,
  `DatePosted_3` datetime DEFAULT NULL,
  `DatePosted_4` datetime DEFAULT NULL,
  `DatePosted_5` datetime DEFAULT NULL,
  `LastThreadPost` datetime DEFAULT NULL,
  `Username` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Pass1` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Pass2` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Security` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QuyenSD1` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QuyenSD2` tinyint(1) DEFAULT NULL,
  `QuyenSD3` tinyint(1) DEFAULT NULL,
  `QuyenSD4` tinyint(1) DEFAULT NULL,
  `Date_Time_login_hoc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `lan_sd_hoc` int(10) DEFAULT NULL,
  `lan_sd_thi` int(10) DEFAULT NULL,
  `lan_sd_thi_2` int(10) DEFAULT NULL,
  `lan_sd_thi_3` int(10) DEFAULT NULL,
  `lan_sd_thi_4` int(10) DEFAULT NULL,
  `lan_sd_thi_5` int(10) DEFAULT NULL,
  `lan_sd_thi_kt` int(10) DEFAULT NULL,
  `lan_sd_thi_kt_2` int(10) DEFAULT NULL,
  `lan_sd_thi_kt_3` int(10) DEFAULT NULL,
  `lan_sd_thi_kt_4` int(10) DEFAULT NULL,
  `lan_sd_thi_kt_5` int(10) DEFAULT NULL,
  `thoi_han1` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `thoi_han2` int(10) DEFAULT NULL,
  `thoi_han3` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `thoi_han_thi` int(10) DEFAULT NULL,
  `thoi_han_thi_2` int(10) DEFAULT NULL,
  `thoi_han_thi_3` int(10) DEFAULT NULL,
  `thoi_han_thi_4` int(10) DEFAULT NULL,
  `thoi_han_thi_5` int(10) DEFAULT NULL,
  `thoi_han_thi_kt` int(10) DEFAULT NULL,
  `thoi_han_thi_kt_2` int(10) DEFAULT NULL,
  `thoi_han_thi_kt_3` int(10) DEFAULT NULL,
  `thoi_han_thi_kt_4` int(10) DEFAULT NULL,
  `thoi_han_thi_kt_5` int(10) DEFAULT NULL,
  `link_lt1` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `link_lt2` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `link_lt3` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `link_lt4` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `link_lt5` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `link_lt6` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `link_lt7` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `link_lt8` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `link_lt9` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `link_lt10` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `serialno` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `code` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `hinhthuc_dk` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Contents0` int(10) DEFAULT NULL,
  `Contents1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Contents5` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Contents20` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Contents21` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Contents24` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Contents40` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AuthorName` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ycau` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ycau_2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ycau_3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ycau_4` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TotalQues` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `reg01`
--

INSERT INTO `reg01` (`ID`, `SophieuDK`, `ThreadParent`, `PARENTMESSAGE`, `Comments`, `Hoten`, `Sinhngay`, `Topic`, `Diachi`, `Email`, `CCCD`, `NgayCCCD`, `NoiCapCCCD`, `Hinhthuc`, `Hinhthuc_2`, `Hinhthuc_3`, `Hinhthuc_4`, `Hinhthuc_5`, `MaID_mon`, `Mon_Hocphan`, `Mon_Hocphan2`, `Mon_Hocphan3`, `Mon_Hocphan4`, `Mon_Hocphan5`, `Muc`, `Muc_2`, `Muc_3`, `Muc_4`, `Muc_5`, `NgayDK`, `NgayDK_2`, `NgayDK_3`, `NgayDK_4`, `NgayDK_5`, `Time_DK`, `Nien_khoa`, `Nien_khoa_2`, `Nien_khoa_3`, `Nien_khoa_4`, `Nien_khoa_5`, `Donvi_DT`, `DatePosted`, `DatePosted_2`, `DatePosted_3`, `DatePosted_4`, `DatePosted_5`, `LastThreadPost`, `Username`, `Pass1`, `Pass2`, `Security`, `QuyenSD1`, `QuyenSD2`, `QuyenSD3`, `QuyenSD4`, `Date_Time_login_hoc`, `lan_sd_hoc`, `lan_sd_thi`, `lan_sd_thi_2`, `lan_sd_thi_3`, `lan_sd_thi_4`, `lan_sd_thi_5`, `lan_sd_thi_kt`, `lan_sd_thi_kt_2`, `lan_sd_thi_kt_3`, `lan_sd_thi_kt_4`, `lan_sd_thi_kt_5`, `thoi_han1`, `thoi_han2`, `thoi_han3`, `thoi_han_thi`, `thoi_han_thi_2`, `thoi_han_thi_3`, `thoi_han_thi_4`, `thoi_han_thi_5`, `thoi_han_thi_kt`, `thoi_han_thi_kt_2`, `thoi_han_thi_kt_3`, `thoi_han_thi_kt_4`, `thoi_han_thi_kt_5`, `link_lt1`, `link_lt2`, `link_lt3`, `link_lt4`, `link_lt5`, `link_lt6`, `link_lt7`, `link_lt8`, `link_lt9`, `link_lt10`, `serialno`, `code`, `hinhthuc_dk`, `Contents0`, `Contents1`, `Contents5`, `Contents20`, `Contents21`, `Contents24`, `Contents40`, `AuthorName`, `ycau`, `ycau_2`, `ycau_3`, `ycau_4`, `TotalQues`) VALUES
(11, '11', 0, 0, '11/4/2023', 'NGUYỄN VĂN TAM', '1999-04-03', NULL, 'Trường ĐH Kiến Trúc Hà Nội', 'eh20023@gmail.com', '65464687', '2000-01-10', 'Thừa Thiên Huế', 'HỌC - THI', NULL, NULL, NULL, NULL, '5', 'Thực hành thiết kế dữ liệu với SQL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 00:00:00', NULL, NULL, NULL, NULL, NULL, 'K-001', NULL, NULL, NULL, NULL, NULL, '2023-11-04 00:00:00', NULL, NULL, NULL, NULL, '2023-11-04 00:00:00', 'T8', '1', '1', 'Ngủ', 'Chính thức', 0, 0, 0, '2/12/2023 - 10:36:23 PM', 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 300, '60', 1, 0, 0, 0, 0, 15, 0, 0, 0, 0, '../../lear/main/', '/home/login/notelink/', '/home/login/notelink/', '/home/login/notelink/', '/home/examp/try_test/', '/home/examp.ran/officialexam/checkinfo/', 'Z2', NULL, NULL, NULL, NULL, NULL, NULL, 0, '3600', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '40'),
(12, '12', 0, 0, '11/19/2023', 'LÊ  MINH QUANG', '2023-11-19', NULL, 'Tự do', NULL, '123456789123', '2023-11-19', NULL, 'HỌC - THI', NULL, NULL, NULL, NULL, '6', 'Lập trình Javascript căn bản', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 00:00:00', NULL, NULL, NULL, NULL, NULL, 'K-001', NULL, NULL, NULL, NULL, NULL, '2023-11-19 00:00:00', NULL, NULL, NULL, NULL, '2023-11-19 00:00:00', 'k2', '1', '1', 'Ngủ', 'Chính thức', 0, 0, 0, NULL, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 300, '60', 1, 0, 0, 0, 0, 15, 0, 0, 0, 0, '../../lear/main/', NULL, '../../lear_main.use/exercises_questions/', '../../lear_main.use/exercises_questions/', '/home/examp/try_test/', '/home/examp.ran/officialexam/checkinfo/', 'Z3', NULL, NULL, NULL, 'K000C05140', 'RD4C', NULL, 0, '3600', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '40'),
(13, '13', 0, 0, '11/19/2023', 'NGUYỄN VĂN LONG', '2023-11-19', NULL, 'Trường ĐH Kiến Trúc Hà Nội', NULL, '654646', '2023-11-19', NULL, 'HỌC - THI', NULL, NULL, NULL, NULL, '5', 'Thực hành thiết kế dữ liệu với SQL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-11-19 00:00:00', NULL, NULL, NULL, NULL, NULL, 'K-001', NULL, NULL, NULL, NULL, NULL, '2023-11-19 00:00:00', NULL, NULL, NULL, NULL, '2023-11-19 00:00:00', 'k3', '1', '1', 'Ngủ', 'Chính thức', 0, 0, 0, '3/12/2023 - 2:13:49 PM', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 300, '60', 1, 0, 0, 0, 0, 15, 0, 0, 0, 0, '../../lear/main/', '/home/login/notelink/', '/home/login/notelink/', '../../lear_main.use/exercises_questions/', '/home/examp/try_test/', '/home/examp.ran/officialexam/checkinfo/', 'Z2', NULL, NULL, NULL, 'K000C05149', '5APE', NULL, 0, '3600', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '40'),
(14, '14', 0, 0, '12/1/2023', 'NGUYỄN VĂN Y', '2023-11-30', NULL, 'Trường ĐH Kiến Trúc Hà Nội', 'abcd@yahoo.com', '654646', '2023-12-01', NULL, 'HỌC - THI', NULL, NULL, NULL, NULL, '6', 'Lập trình Javascript căn bản', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-12 00:00:00', NULL, NULL, NULL, NULL, NULL, 'K-001', NULL, NULL, NULL, NULL, NULL, '2023-12-01 00:00:00', NULL, NULL, NULL, NULL, '2023-12-01 00:00:00', 'A12', '1', '1', 'Ngủ', 'Chính thức', 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 300, '60', 1, 0, 0, 0, 0, 15, 0, 0, 0, 0, '../../lear/main/', NULL, '../../lear_main.use/exercises_questions/', '../../lear_main.use/exercises_questions/', '/home/examp/try_test/', '/home/examp.ran/officialexam/checkinfo/', 'Z3', NULL, NULL, NULL, 'K000C05148', 'XGE6', NULL, 0, '3600', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '40'),
(15, '15', 0, 0, '12/1/2023', 'LÊ  MINH LINH', '2023-12-01', NULL, 'Tự do', NULL, '123456789123', '2023-12-09', NULL, 'HỌC - THI', NULL, NULL, NULL, NULL, '5', 'Thực hành thiết kế dữ liệu với SQL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 00:00:00', NULL, NULL, NULL, NULL, NULL, 'K-001', NULL, NULL, NULL, NULL, NULL, '2023-12-01 00:00:00', NULL, NULL, NULL, NULL, '2023-12-01 00:00:00', 'A2', '1', '1', 'Ngủ', 'Chính thức', 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 300, '60', 1, 0, 0, 0, 0, 15, 0, 0, 0, 0, '../../lear/main/', '/home/login/notelink/', '/home/login/notelink/', '/home/login/notelink/', '/home/login/notelink/', '/home/login/notelink/', 'Z2', NULL, NULL, NULL, 'K000C05150', 'TXG7', NULL, 0, '3600', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '40'),
(1, '1', 0, 0, '11/17/2023', 'LÊ THỊ SEN', '2023-11-17', NULL, 'Tự do', 'a20023@gmail.com', '6750099', '2023-11-17', 'TP Hồ Chí Minh', 'HỌC - THI', NULL, NULL, NULL, NULL, '6', 'Lập trình Javascript căn bản', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-23 00:00:00', NULL, NULL, NULL, NULL, NULL, 'K-001', NULL, NULL, NULL, NULL, NULL, '2023-11-17 00:00:00', NULL, NULL, NULL, NULL, '2023-10-25 00:00:00', 'T3', '1', '1', 'Ngủ', 'Chính thức', 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 300, '60', 1, 0, 0, 0, 0, 15, 0, 0, 0, 0, '../../lear/main/', NULL, '../../lear_main.use/exercises_questions/', '../../lear_main.use/exercises_questions/', '/home/examp/try_test/', '/home/examp.ran/officialexam/checkinfo/', 'Z3', NULL, NULL, NULL, NULL, NULL, NULL, 0, '3600', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '40'),
(2, '2', 0, 0, '10/25/2023', 'LÊ THỊ THẢO VÂN', '1999-04-03', NULL, 'Trường ĐH Kiến Trúc Hà Nội', 'eh20023@gmail.com', '654646899', '2000-01-10', 'TP Hồ Chí Minh', 'HỌC - THI', NULL, NULL, NULL, NULL, '6', 'Lập trình Javascript căn bản', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-25 00:00:00', NULL, NULL, NULL, NULL, NULL, 'K-001', NULL, NULL, NULL, NULL, NULL, '2023-10-25 00:00:00', NULL, NULL, NULL, NULL, '2023-10-25 00:00:00', 'T4', '1', '1', 'Ngủ', 'Chính thức', 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 300, '60', 1, 0, 0, 0, 0, 15, 0, 0, 0, 0, '../../lear/main/', NULL, NULL, '../../lear_main.use/exercises_questions/', '/home/examp/try_test/', '/home/examp.ran/officialexam/checkinfo/', 'Z3', NULL, NULL, NULL, NULL, NULL, NULL, 0, '3600', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '40'),
(3, '3', 0, 0, '10/25/2023', 'LÊ THỊ AN', '1999-04-03', NULL, 'Tự do', 'abcd@yahoo.com', '654646899', '2000-01-10', NULL, 'THI', NULL, NULL, NULL, NULL, '6', 'Lập trình Javascript căn bản', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-25 00:00:00', NULL, NULL, NULL, NULL, NULL, 'K-001', NULL, NULL, NULL, NULL, NULL, '2023-10-25 00:00:00', NULL, NULL, NULL, NULL, '2023-10-25 00:00:00', 'T2', '1', '1', 'Ngủ', 'Dùng thử', 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '60', 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '../../lear/main/', NULL, NULL, '/home/login/limitacctes.use/', '/home/examp/try_test/', '/home/examp.ran/officialexam/checkinfo/', 'Z3', NULL, NULL, NULL, NULL, NULL, NULL, 0, '3600', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '40'),
(4, '4', 0, 0, '10/25/2023', 'LÊ VĂN NAM', '1999-12-10', NULL, 'Trường ĐH Kiến Trúc Hà Nội', 'aa@yahoo.com', '121212121212', '2000-10-20', 'Thanh Hóa', 'HỌC - THI', NULL, NULL, NULL, NULL, '6', 'Lập trình Javascript căn bản', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-15 00:00:00', NULL, NULL, NULL, NULL, NULL, 'K-001', NULL, NULL, NULL, NULL, NULL, '2023-09-15 00:00:00', NULL, NULL, NULL, NULL, '2023-10-04 00:00:00', 'Giangvien', '11111', '11111', 'Ngủ', 'Chính thức', 0, 0, 0, '23/9/2023 - 4:33:46 PM', 16, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '10/10/2025', 900, '60', 1, 0, 0, 0, 0, 50, 0, 0, 0, 0, '../../lear/main/', NULL, NULL, '../../lear_main.use/exercises_questions/', '/home/examp/try_test/', '/home/examp.ran/officialexam/checkinfo/', 'Z3', NULL, NULL, NULL, '–', '–', 'TK-GV', 0, '3600', '–', '–', '–', '–', NULL, NULL, NULL, NULL, NULL, NULL, '40'),
(5, '5', 0, 0, '10/25/2023', 'NGUYỄN HỮU THÀNH ĐẠT', '2000-01-01', NULL, 'Trường ĐH Kiến Trúc Hà Nội', 'nhh20000@gmail.com', '1112223383', '1999-11-26', 'Thanh Hóa', 'HỌC - THI', NULL, NULL, NULL, NULL, '6', 'Lập trình Javascript căn bản', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-29 00:00:00', NULL, NULL, NULL, NULL, NULL, 'K-001', NULL, NULL, NULL, NULL, NULL, '2023-09-29 00:00:00', NULL, NULL, NULL, NULL, '2023-10-04 00:00:00', 'Z', '1', '1', 'Ngủ', 'Chính thức', 0, 0, 0, '14/10/2023 - 4:17:30 PM', 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 300, '60', 1, 0, 0, 0, 0, 15, 0, 0, 0, 0, '../../lear/main/', NULL, NULL, '../../lear_main.use/exercises_questions/', '/home/examp/try_test/', '/home/examp.ran/officialexam/checkinfo/', 'Z3', NULL, NULL, NULL, '–', 'Thu00-0000', NULL, 0, '3600', '–', '–', '–', '–', NULL, NULL, '0', NULL, NULL, NULL, '40'),
(16, '17', 0, 0, '12/3/2023', 'Anonymous', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HỌC - THI', NULL, NULL, NULL, NULL, '5', 'Thực hành thiết kế dữ liệu với SQL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-12 00:00:00', NULL, NULL, NULL, NULL, NULL, 'K-001', NULL, NULL, NULL, NULL, NULL, '2023-12-03 00:00:00', NULL, NULL, NULL, NULL, '2023-12-03 00:00:00', 'Z1', '1', '1', 'Ngủ', 'Dùng thử', 0, 0, 0, '3/12/2023 - 2:21:55 PM', 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 20, '20', 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, '../../lear/main/', '/home/login/notelink/', '../../lear_main.use/exercises_questions/', '../../lear_main.use/exercises_questions/', '/home/examp/try_test/', '/home/examp.ran/officialexam/checkinfo/', 'Z2', NULL, NULL, NULL, NULL, NULL, NULL, 0, '3600', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '40'),
(17, '18', 0, 0, '12/9/2023', 'NGUYỄN VĂN SINH', '2001-12-30', NULL, 'Trường ĐH Kiến Trúc Hà Nội', 'eh20023@gmail.com', '1112223383', '2020-12-25', NULL, 'HỌC - THI', NULL, NULL, NULL, NULL, '5', 'Thực hành thiết kế dữ liệu với SQL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-12 00:00:00', NULL, NULL, NULL, NULL, NULL, 'K-001', NULL, NULL, NULL, NULL, NULL, '2023-12-09 00:00:00', NULL, NULL, NULL, NULL, '2023-12-09 00:00:00', 'Z2', '1', '1', 'Ngủ', 'Chính thức', 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 300, '60', 1, 0, 0, 0, 0, 15, 0, 0, 0, 0, '../../lear/main/', '/home/login/notelink/', '../../lear_main.use/exercises_questions/', '../../lear_main.use/exercises_questions/', '/home/examp/try_test/', '/home/examp.ran/officialexam/checkinfo/', 'Z2', NULL, NULL, NULL, 'K000C05135', 'T2UP', NULL, 0, '3600', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '40'),
(6, '6', 0, 0, '10/23/2023', 'LÊ THỊ NA', '1967-04-03', NULL, 'Tự do', 'nhh20000@gmail.com', '65464689', '2000-01-10', 'Vĩnh Phúc', 'THI', NULL, NULL, NULL, NULL, '6', 'Lập trình Javascript căn bản', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-23 00:00:00', NULL, NULL, NULL, NULL, NULL, 'K-001', NULL, NULL, NULL, NULL, NULL, '2023-10-23 00:00:00', NULL, NULL, NULL, NULL, '2023-10-23 00:00:00', 'T', '1', '1', 'Ngủ', 'Chính thức', 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '30', 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '../../lear/main/', NULL, NULL, '../../lear_main.use/exercises_questions/', '/home/examp/try_test/', '/home/examp.ran/officialexam/checkinfo/', 'Z3', NULL, NULL, NULL, NULL, NULL, NULL, 0, '3600', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '40'),
(7, '7', 0, 0, '10/23/2023', 'LÊ THỊ LAN', '1967-04-03', NULL, 'Trường ĐH Kiến Trúc Hà Nội', 'nhh20023@gmail.com', '654646', '2000-01-10', 'Tây Ninh', 'HỌC - THI', NULL, NULL, NULL, NULL, '6', 'Lập trình Javascript căn bản', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-23 00:00:00', NULL, NULL, NULL, NULL, NULL, 'K-001', NULL, NULL, NULL, NULL, NULL, '2023-10-23 00:00:00', NULL, NULL, NULL, NULL, '2023-10-23 00:00:00', 'T1', '1', '1', 'Nhảy cao', 'Chính thức', 0, 0, 0, '19/12/2023 - 10:25:45 PM', 6, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, NULL, 300, '60', 1, 0, 0, 0, 0, 15, 0, 0, 0, 0, '../../lear/main/', NULL, NULL, '../../lear_main.use/exercises_questions/', '/home/examp/try_test/', '/home/examp.ran/officialexam/checkinfo/', 'Z3', NULL, NULL, NULL, NULL, NULL, NULL, 0, '3600', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '40'),
(8, '8', 0, 0, '10/28/2023', 'LÊ BINH', '2000-01-01', NULL, 'Tự do', ' ', '12345689', '2003-01-02', 'Vĩnh Long', 'HỌC - THI', NULL, NULL, NULL, NULL, '6', 'Lập trình Javascript căn bản', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-28 00:00:00', NULL, NULL, NULL, NULL, NULL, 'K-001', NULL, NULL, NULL, NULL, NULL, '2023-10-28 00:00:00', NULL, NULL, NULL, NULL, '2023-10-28 00:00:00', 'T5', '1', '1', 'Ngủ', 'Chính thức', 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 300, '60', 1, 0, 0, 0, 0, 15, 0, 0, 0, 0, '../../lear/main/', NULL, '../../lear_main.use/exercises_questions/', '../../lear_main.use/exercises_questions/', '/home/examp/try_test/', '/home/examp.ran/officialexam/checkinfo/', 'Z3', NULL, NULL, NULL, NULL, NULL, NULL, 0, '3600', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '40'),
(9, '9', 0, 0, '11/3/2023', 'NGUYỄN VĂN LINH', '1999-03-04', NULL, 'Trường ĐH Kiến Trúc Hà Nội', '330000@gmail.com', '6546467567', '2000-01-10', 'TP Hồ Chí Minh', 'HỌC - THI', NULL, NULL, NULL, NULL, '6', 'Lập trình Javascript căn bản', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-11 00:00:00', NULL, NULL, NULL, NULL, NULL, 'K-001', NULL, NULL, NULL, NULL, NULL, '2023-11-03 00:00:00', NULL, NULL, NULL, NULL, '2023-11-03 00:00:00', 'T6', '1', '1', 'Ngủ', 'Chính thức', 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 300, '60', 1, 0, 0, 0, 0, 15, 0, 0, 0, 0, '../../lear/main/', NULL, '../../lear_main.use/exercises_questions/', '../../lear_main.use/exercises_questions/', '/home/examp/try_test/', '/home/examp.ran/officialexam/checkinfo/', 'Z3', NULL, NULL, NULL, NULL, NULL, NULL, 0, '3600', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '40'),
(10, '10', 0, 0, '11/3/2023', 'NGUYỄN VĂN LY', '1999-04-03', NULL, 'Tự do', 'eh20023@gmail.com', '67674677', '2000-01-10', NULL, 'THI', NULL, NULL, NULL, NULL, '6', 'Lập trình Javascript căn bản', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-11 00:00:00', NULL, NULL, NULL, NULL, NULL, 'K-001', NULL, NULL, NULL, NULL, NULL, '2023-11-03 00:00:00', NULL, NULL, NULL, NULL, '2023-11-03 00:00:00', 'T7', '1', '1', 'Ngủ', 'Dùng thử', 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '/home/login/limitacctes.use/', NULL, NULL, '/home/login/limitacctes.use/', '/home/examp/try_test/', '/home/examp.ran/officialexam/checkinfo/', 'Z3', NULL, NULL, NULL, NULL, NULL, NULL, 0, '3600', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '40'),
(26, '55', 0, 0, '2/8/2024', 'NGUYỄN HỮU THÀNH ĐẠT', '2003-08-17', NULL, 'Thanh Hóa', 'huudatnh178@gmail.com', '038203010645', '2021-12-21', NULL, 'HỌC - THI', NULL, NULL, NULL, NULL, '6', 'Lập trình Javascript căn bản', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-02 00:00:00', NULL, NULL, NULL, NULL, NULL, 'K-001', NULL, NULL, NULL, NULL, NULL, '2024-02-08 00:00:00', NULL, NULL, NULL, NULL, '2024-02-08 00:00:00', 'tk4', '1', '1', 'Cờ vua', 'Chính thức', 0, 0, 0, '8/2/2024 - 3:31:13 PM', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 300, '60', 1, 0, 0, 0, 0, 15, 0, 0, 0, 0, '../../lear/main/', NULL, '../../lear_main.use/exercises_questions/', '../../lear_main.use/exercises_questions/', '/home/examp/try_test/', '/home/examp.ran/officialexam/checkinfo/', 'Z3', NULL, NULL, NULL, 'K000C05134', 'HEUD', NULL, 0, '3600', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '40'),
(18, '25', 0, 0, '12/18/2023', 'NGUYỄN HỮU THÀNH ĐẠT', '2003-08-17', NULL, 'Thanh Hóa', 'huudatnh178@gmail.com', '012345678910', '2021-12-21', NULL, 'HỌC - THI', NULL, NULL, NULL, NULL, '6', 'Lập trình Javascript căn bản', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-18 00:00:00', NULL, NULL, NULL, NULL, NULL, 'K-001', NULL, NULL, NULL, NULL, NULL, '2023-12-18 00:00:00', NULL, NULL, NULL, NULL, '2023-12-18 00:00:00', 'tk1', '1', '1', 'Võ thuật', 'Chính thức', 0, 0, 0, '18/12/2023 - 10:26:39 PM', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 300, '60', 1, 0, 0, 0, 0, 15, 0, 0, 0, 0, '../../lear/main/', NULL, '../../lear_main.use/exercises_questions/', '../../lear_main.use/exercises_questions/', '/home/examp/try_test/', '/home/examp.ran/officialexam/checkinfo/', 'Z3', NULL, NULL, NULL, 'K000C05132', 'E7HG', NULL, 0, '3600', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '40'),
(20, '34', 0, 0, '12/22/2023', 'Anonymous', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HỌC - THI', NULL, NULL, NULL, NULL, '6', 'Lập trình Javascript căn bản', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-22 00:00:00', NULL, NULL, NULL, NULL, NULL, 'K-001', NULL, NULL, NULL, NULL, NULL, '2023-12-22 00:00:00', NULL, NULL, NULL, NULL, '2023-12-22 00:00:00', 'tk6', '1', '1', 'Cờ tướng', 'Dùng thử', 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 20, '20', 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, '../../lear/main/', NULL, '../../lear_main.use/exercises_questions/', '../../lear_main.use/exercises_questions/', '/home/examp/try_test/', '/home/examp.ran/officialexam/checkinfo/', 'Z3', NULL, NULL, NULL, NULL, NULL, NULL, 0, '3600', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '40'),
(21, '35', 0, 0, '12/22/2023', 'NGUYỄN MẠNH ĐỨC', '2003-01-28', NULL, 'Thanh Hóa', 'ngmduc2801@gmail.com', '12345678910', '2021-12-21', NULL, 'HỌC - THI', NULL, NULL, NULL, NULL, '6', 'Lập trình Javascript căn bản', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-22 00:00:00', NULL, NULL, NULL, NULL, NULL, 'K-001', NULL, NULL, NULL, NULL, NULL, '2023-12-22 00:00:00', NULL, NULL, NULL, NULL, '2023-12-22 00:00:00', 'tk7', '1', '1', 'Nhảy xa', 'Chính thức', 0, 0, 0, '8/5/2024 - 3:42:48 PM', 2, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 300, '60', 1, 0, 0, 0, 0, 15, 0, 0, 0, 0, '../../lear/main/', NULL, '../../lear_main.use/exercises_questions/', '../../lear_main.use/exercises_questions/', '/home/examp/try_test/', '/home/examp.ran/officialexam/checkinfo/', 'Z3', NULL, NULL, NULL, 'K000C05136', 'Y5TM', NULL, 0, '3600', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '40'),
(24, '52', 0, 0, '1/25/2024', 'Anonymous', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HỌC - THI', NULL, NULL, NULL, NULL, '6', 'Lập trình Javascript căn bản', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-25 00:00:00', NULL, NULL, NULL, NULL, NULL, 'K-001', NULL, NULL, NULL, NULL, NULL, '2024-01-25 00:00:00', NULL, NULL, NULL, NULL, '2024-01-25 00:00:00', 'tk2', '1', '1', 'Đi bộ', 'Dùng thử', 0, 0, 0, '6/2/2024 - 3:46:29 PM', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 20, '20', 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, '../../lear/main/', NULL, '../../lear_main.use/exercises_questions/', '../../lear_main.use/exercises_questions/', '/home/examp/try_test/', '/home/examp.ran/officialexam/checkinfo/', 'Z3', NULL, NULL, NULL, NULL, NULL, NULL, 0, '3600', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '40'),
(25, '53', 0, 0, '1/25/2024', 'NGUYỄN HỮU THÀNH ĐẠT', '2003-08-17', NULL, 'Thanh Hóa', 'huudatnh178@gmail.com', '038203010645', '2021-12-21', NULL, 'HỌC - THI', NULL, NULL, NULL, NULL, '6', 'Lập trình Javascript căn bản', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-25 00:00:00', NULL, NULL, NULL, NULL, NULL, 'K-001', NULL, NULL, NULL, NULL, NULL, '2024-01-25 00:00:00', NULL, NULL, NULL, NULL, '2024-01-25 00:00:00', 'tk3', '1', '1', 'Leo núi', 'Chính thức', 0, 0, 0, '14/2/2024 - 10:41:01 AM', 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 300, '60', 1, 0, 0, 0, 0, 15, 0, 0, 0, 0, '../../lear/main/', NULL, '../../lear_main.use/exercises_questions/', '../../lear_main.use/exercises_questions/', '/home/examp/try_test/', '/home/examp.ran/officialexam/checkinfo/', 'Z3', NULL, NULL, NULL, 'K000C05133', 'UPT6', NULL, 0, '3600', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '40');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `results_level01`
--

CREATE TABLE `results_level01` (
  `NienKhoa` varchar(50) DEFAULT NULL,
  `IE_TT` int(11) DEFAULT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `HoTen` varchar(255) DEFAULT NULL,
  `NgaySinh` date DEFAULT NULL,
  `DiaChi` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `SoCCCD` varchar(50) DEFAULT NULL,
  `NgayCCCD` varchar(50) DEFAULT NULL,
  `TenMon` text DEFAULT NULL,
  `NgayDK` date DEFAULT NULL,
  `NgayThi` date DEFAULT NULL,
  `MaDe` varchar(50) DEFAULT NULL,
  `TgianThi` int(11) DEFAULT NULL,
  `SBD` varchar(50) DEFAULT NULL,
  `CamKet` int(11) DEFAULT NULL,
  `c1` varchar(5) DEFAULT NULL,
  `c2` varchar(5) DEFAULT NULL,
  `c3` varchar(5) DEFAULT NULL,
  `c4` varchar(5) DEFAULT NULL,
  `c5` varchar(5) DEFAULT NULL,
  `c6` varchar(5) DEFAULT NULL,
  `c7` varchar(5) DEFAULT NULL,
  `c8` varchar(5) DEFAULT NULL,
  `c9` varchar(5) DEFAULT NULL,
  `c10` varchar(5) DEFAULT NULL,
  `c11` varchar(5) DEFAULT NULL,
  `c12` varchar(5) DEFAULT NULL,
  `c13` varchar(5) DEFAULT NULL,
  `c14` varchar(5) DEFAULT NULL,
  `c15` varchar(5) DEFAULT NULL,
  `c16` varchar(5) DEFAULT NULL,
  `c17` varchar(5) DEFAULT NULL,
  `c18` varchar(5) DEFAULT NULL,
  `c19` varchar(5) DEFAULT NULL,
  `c20` varchar(5) DEFAULT NULL,
  `c21` varchar(5) DEFAULT NULL,
  `c22` varchar(5) DEFAULT NULL,
  `c23` varchar(5) DEFAULT NULL,
  `c24` varchar(5) DEFAULT NULL,
  `c25` varchar(5) DEFAULT NULL,
  `c26` varchar(5) DEFAULT NULL,
  `c27` varchar(5) DEFAULT NULL,
  `c28` varchar(5) DEFAULT NULL,
  `c29` varchar(5) DEFAULT NULL,
  `c30` varchar(5) DEFAULT NULL,
  `c31` varchar(5) DEFAULT NULL,
  `c32` varchar(5) DEFAULT NULL,
  `c33` varchar(5) DEFAULT NULL,
  `c34` varchar(5) DEFAULT NULL,
  `c35` varchar(5) DEFAULT NULL,
  `c36` varchar(5) DEFAULT NULL,
  `c37` varchar(5) DEFAULT NULL,
  `c38` varchar(5) DEFAULT NULL,
  `c39` varchar(5) DEFAULT NULL,
  `c40` varchar(5) DEFAULT NULL,
  `t1` varchar(5) DEFAULT NULL,
  `t2` varchar(5) DEFAULT NULL,
  `t3` varchar(5) DEFAULT NULL,
  `t4` varchar(5) DEFAULT NULL,
  `t5` varchar(5) DEFAULT NULL,
  `t6` varchar(5) DEFAULT NULL,
  `t7` varchar(5) DEFAULT NULL,
  `t8` varchar(5) DEFAULT NULL,
  `t9` varchar(5) DEFAULT NULL,
  `t10` varchar(5) DEFAULT NULL,
  `t11` varchar(5) DEFAULT NULL,
  `t12` varchar(5) DEFAULT NULL,
  `t13` varchar(5) DEFAULT NULL,
  `t14` varchar(5) DEFAULT NULL,
  `t15` varchar(5) DEFAULT NULL,
  `t16` varchar(5) DEFAULT NULL,
  `t17` varchar(5) DEFAULT NULL,
  `t18` varchar(5) DEFAULT NULL,
  `t19` varchar(5) DEFAULT NULL,
  `t20` varchar(5) DEFAULT NULL,
  `t21` varchar(5) DEFAULT NULL,
  `t22` varchar(5) DEFAULT NULL,
  `t23` varchar(5) DEFAULT NULL,
  `t24` varchar(5) DEFAULT NULL,
  `t25` varchar(5) DEFAULT NULL,
  `t26` varchar(5) DEFAULT NULL,
  `t27` varchar(5) DEFAULT NULL,
  `t28` varchar(5) DEFAULT NULL,
  `t29` varchar(5) DEFAULT NULL,
  `t30` varchar(5) DEFAULT NULL,
  `t31` varchar(5) DEFAULT NULL,
  `t32` varchar(5) DEFAULT NULL,
  `t33` varchar(5) DEFAULT NULL,
  `t34` varchar(5) DEFAULT NULL,
  `t35` varchar(5) DEFAULT NULL,
  `t36` varchar(5) DEFAULT NULL,
  `t37` varchar(5) DEFAULT NULL,
  `t38` varchar(5) DEFAULT NULL,
  `t39` varchar(5) DEFAULT NULL,
  `t40` varchar(5) DEFAULT NULL,
  `SoLanThi` int(11) DEFAULT NULL,
  `Diem` float DEFAULT NULL,
  `XepLoai` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `results_level02`
--

CREATE TABLE `results_level02` (
  `NienKhoa` varchar(50) DEFAULT NULL,
  `IE_TT` int(11) DEFAULT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `HoTen` varchar(255) DEFAULT NULL,
  `NgaySinh` date DEFAULT NULL,
  `DiaChi` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `SoCCCD` varchar(50) DEFAULT NULL,
  `NgayCCCD` varchar(50) DEFAULT NULL,
  `TenMon` varchar(50) DEFAULT NULL,
  `NgayDK` date DEFAULT NULL,
  `NgayThi` date DEFAULT NULL,
  `MaDe` varchar(50) DEFAULT NULL,
  `TgianThi` int(11) DEFAULT NULL,
  `SBD` varchar(50) DEFAULT NULL,
  `CamKet` int(11) DEFAULT NULL,
  `c1` varchar(5) DEFAULT NULL,
  `c2` varchar(5) DEFAULT NULL,
  `c3` varchar(5) DEFAULT NULL,
  `c4` varchar(5) DEFAULT NULL,
  `c5` varchar(5) DEFAULT NULL,
  `c6` varchar(5) DEFAULT NULL,
  `c7` varchar(5) DEFAULT NULL,
  `c8` varchar(5) DEFAULT NULL,
  `c9` varchar(5) DEFAULT NULL,
  `c10` varchar(5) DEFAULT NULL,
  `c11` varchar(5) DEFAULT NULL,
  `c12` varchar(5) DEFAULT NULL,
  `c13` varchar(5) DEFAULT NULL,
  `c14` varchar(5) DEFAULT NULL,
  `c15` varchar(5) DEFAULT NULL,
  `c16` varchar(5) DEFAULT NULL,
  `c17` varchar(5) DEFAULT NULL,
  `c18` varchar(5) DEFAULT NULL,
  `c19` varchar(5) DEFAULT NULL,
  `c20` varchar(5) DEFAULT NULL,
  `c21` varchar(5) DEFAULT NULL,
  `c22` varchar(5) DEFAULT NULL,
  `c23` varchar(5) DEFAULT NULL,
  `c24` varchar(5) DEFAULT NULL,
  `c25` varchar(5) DEFAULT NULL,
  `c26` varchar(5) DEFAULT NULL,
  `c27` varchar(5) DEFAULT NULL,
  `c28` varchar(5) DEFAULT NULL,
  `c29` varchar(5) DEFAULT NULL,
  `c30` varchar(5) DEFAULT NULL,
  `c31` varchar(5) DEFAULT NULL,
  `c32` varchar(5) DEFAULT NULL,
  `c33` varchar(5) DEFAULT NULL,
  `c34` varchar(5) DEFAULT NULL,
  `c35` varchar(5) DEFAULT NULL,
  `c36` varchar(5) DEFAULT NULL,
  `c37` varchar(5) DEFAULT NULL,
  `c38` varchar(5) DEFAULT NULL,
  `c39` varchar(5) DEFAULT NULL,
  `c40` varchar(5) DEFAULT NULL,
  `t1` varchar(5) DEFAULT NULL,
  `t2` varchar(5) DEFAULT NULL,
  `t3` varchar(5) DEFAULT NULL,
  `t4` varchar(5) DEFAULT NULL,
  `t5` varchar(5) DEFAULT NULL,
  `t6` varchar(5) DEFAULT NULL,
  `t7` varchar(5) DEFAULT NULL,
  `t8` varchar(5) DEFAULT NULL,
  `t9` varchar(5) DEFAULT NULL,
  `t10` varchar(5) DEFAULT NULL,
  `t11` varchar(5) DEFAULT NULL,
  `t12` varchar(5) DEFAULT NULL,
  `t13` varchar(5) DEFAULT NULL,
  `t14` varchar(5) DEFAULT NULL,
  `t15` varchar(5) DEFAULT NULL,
  `t16` varchar(5) DEFAULT NULL,
  `t17` varchar(5) DEFAULT NULL,
  `t18` varchar(5) DEFAULT NULL,
  `t19` varchar(5) DEFAULT NULL,
  `t20` varchar(5) DEFAULT NULL,
  `t21` varchar(5) DEFAULT NULL,
  `t22` varchar(5) DEFAULT NULL,
  `t23` varchar(5) DEFAULT NULL,
  `t24` varchar(5) DEFAULT NULL,
  `t25` varchar(5) DEFAULT NULL,
  `t26` varchar(5) DEFAULT NULL,
  `t27` varchar(5) DEFAULT NULL,
  `t28` varchar(5) DEFAULT NULL,
  `t29` varchar(5) DEFAULT NULL,
  `t30` varchar(5) DEFAULT NULL,
  `t31` varchar(5) DEFAULT NULL,
  `t32` varchar(5) DEFAULT NULL,
  `t33` varchar(5) DEFAULT NULL,
  `t34` varchar(5) DEFAULT NULL,
  `t35` varchar(5) DEFAULT NULL,
  `t36` varchar(5) DEFAULT NULL,
  `t37` varchar(5) DEFAULT NULL,
  `t38` varchar(5) DEFAULT NULL,
  `t39` varchar(5) DEFAULT NULL,
  `t40` varchar(5) DEFAULT NULL,
  `SoLanThi` int(11) DEFAULT NULL,
  `Diem` float DEFAULT NULL,
  `XepLoai` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subjects_levels`
--

CREATE TABLE `subjects_levels` (
  `ID` int(10) DEFAULT NULL,
  `ma` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tenmon` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `gvien` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `lev` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `gchu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `link_lt1` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `link_lt2` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `link_bt1` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ten_bt1` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `link_bt2` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ten_bt2` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `link_kt` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `link_thi` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ma_dthi` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Numofquest` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `subjects_levels`
--

INSERT INTO `subjects_levels` (`ID`, `ma`, `tenmon`, `gvien`, `lev`, `gchu`, `link_lt1`, `link_lt2`, `link_bt1`, `ten_bt1`, `link_bt2`, `ten_bt2`, `link_kt`, `link_thi`, `ma_dthi`, `Numofquest`) VALUES
(1, '1', 'Lập trình PHP căn bản', 'Nhiều tác giả', '1', NULL, '/home/login/notelink/', '/home/login/notelink/', '/home/login/notelink/', NULL, '/home/login/notelink/', NULL, '/home/login/notelink/', '/home/login/notelink/', 'Z1', '40'),
(5, '2', 'Thực hành thiết kế dữ liệu với SQL', 'Nhiều tác giả', '2', NULL, '../../lear/main/', '/home/login/notelink/', '../../lear_main.use/exercises_questions/', NULL, '/home/login/notelink/', NULL, '/home/examp/try_test/', '/home/examp.ran/officialexam/checkinfo/', 'Z2', '40'),
(6, '3', 'Lập trình Javascript căn bản', 'Dư Thanh Được', '2', 'OK', '../../lear/main/', NULL, '../../lear_main.use/exercises_questions/', NULL, NULL, NULL, '/home/examp/try_test/', '/home/examp.ran/officialexam/checkinfo/', 'Z3', '40');
--
-- Cơ sở dữ liệu: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Đang đổ dữ liệu cho bảng `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"sinhvien\",\"table\":\"SinhVien\"},{\"db\":\"sinhvien\",\"table\":\"MonHoc\"},{\"db\":\"quanlycuahang\",\"table\":\"DONHANG\"},{\"db\":\"quanlycuahang\",\"table\":\"HANGHOA\"},{\"db\":\"quanlycuahang\",\"table\":\"KHACH\"}]');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Đang đổ dữ liệu cho bảng `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-06-01 02:05:17', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"vi\"}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Chỉ mục cho bảng `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Chỉ mục cho bảng `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Chỉ mục cho bảng `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Chỉ mục cho bảng `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Chỉ mục cho bảng `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Chỉ mục cho bảng `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Chỉ mục cho bảng `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Chỉ mục cho bảng `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Chỉ mục cho bảng `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Chỉ mục cho bảng `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Chỉ mục cho bảng `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Chỉ mục cho bảng `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Chỉ mục cho bảng `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Cơ sở dữ liệu: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
