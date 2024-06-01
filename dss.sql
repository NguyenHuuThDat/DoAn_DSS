-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 01, 2024 lúc 04:29 AM
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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
