-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 02, 2024 lúc 10:05 AM
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
  `Thuoc_chua` text DEFAULT NULL,
  `Luu_y` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `diseases`
--

INSERT INTO `diseases` (`Benh_ID`, `Ten_benh`, `Nguyen_nhan`, `Thuoc_chua`, `Luu_y`) VALUES
(1, 'Tiểu đường', '- Yếu tố di truyền\r\n- Lối sống không lành mạnh\r\n- Béo phì\r\n- Tuổi tác\r\n- Stress\r\n- Bệnh lý khác', 'Humalog', 'Liều lượng: \r\n• Thường được tiêm dưới da trước bữa ăn khoảng 15 phút hoặc ngay sau khi ăn. \r\n• Liều lượng cụ thể phụ thuộc vào chỉ định của bác sĩ và cần được cá nhân hóa dựa trên nhu cầu insulin của bệnh nhân.\r\n\r\nLưu ý:\r\n• Theo dõi đường huyết thường xuyên.\r\n• Điều chỉnh liều lượng khi thay đổi chế độ ăn uống, mức độ hoạt động, hoặc trong trường hợp bệnh tật.\r\n\r\nTác dụng phụ:\r\n• Hạ đường huyết (hypoglycemia).\r\n• Phản ứng tại chỗ tiêm (đau, đỏ, sưng).\r\n• Tăng cân.\r\n• Phản ứng dị ứng nghiêm trọng (hiếm gặp).\r\n'),
(2, 'Đau lưng', '- Căng cơ bắp\r\n- Vấn đề về cột sống\r\n- Vận động mạnh\r\n- Thiếu vận động', 'Thuốc giảm đau: Acetaminophen (Tylenol)\r\nThuốc giãn cơ: Cyclobenzaprine (Flexeril)', '1. Thuốc giảm đau:\r\nLiều lượng sử dụng:\r\n• Người lớn: 325-650 mg mỗi 4-6 giờ khi cần, không quá 3,000-4,000 mg mỗi ngày.\r\n• Trẻ em: Liều lượng phụ thuộc vào trọng lượng và tuổi, cần tham khảo hướng dẫn của bác sĩ.\r\n\r\nLưu ý:\r\n• Không sử dụng đồng thời với các sản phẩm chứa acetaminophen khác để tránh quá liều.\r\n• Cẩn thận khi sử dụng ở những người có bệnh gan.\r\n\r\nTác dụng phụ:\r\n• Phản ứng dị ứng (phát ban, ngứa, sưng).\r\n• Quá liều có thể gây tổn thương gan nghiêm trọng.\r\n\r\n2. Thuốc giãn cơ:\r\nLiều lượng sử dụng:\r\n• Người lớn: 5-10 mg, 3 lần mỗi ngày.\r\n• Không nên sử dụng quá 2-3 tuần trừ khi có chỉ định của bác sĩ.\r\n\r\nLưu ý:\r\n• Tránh lái xe hoặc vận hành máy móc khi sử dụng do thuốc có thể gây buồn ngủ.\r\n• Tránh sử dụng đồng thời với rượu hoặc các thuốc ức chế thần kinh trung ương khác.\r\n\r\nTác dụng phụ:\r\n• Buồn ngủ, chóng mặt.\r\n• Khô miệng.\r\n• Táo bón.\r\n•Tăng nhịp tim.\r\n'),
(3, 'Mỏi mắt', '- Làm việc trước màn hình lâu\r\n- Thiếu nghỉ ngơi\r\n- Ánh sáng môi trường\r\n- Tư thế làm việc không đúng\r\n- Ngủ không đủ giấc', 'TheraTears', 'Liều lượng sử dụng:\r\n• Nhỏ 1-2 giọt vào mắt bị ảnh hưởng khi cần thiết.\r\n• Có thể sử dụng nhiều lần trong ngày tùy theo nhu cầu.\r\n\r\nLưu ý:\r\n• Rửa tay trước khi sử dụng.\r\n• Tránh chạm đầu ống nhỏ mắt vào mắt hoặc bất kỳ bề mặt nào để tránh nhiễm khuẩn.\r\n\r\nTác dụng phụ:\r\n• Kích ứng mắt tạm thời.\r\n• Mờ mắt tạm thời sau khi nhỏ mắt.'),
(4, 'Mất ngủ', '- Căng thẳng, lo âu\r\n- Chế độ sống không cân đối\r\n- Rối loạn giấc ngủ\r\n- Thay đổi hormone', 'Diphenhydramine (Benadryl)', 'Liều lượng sử dụng:\r\n• Người lớn: 25-50 mg mỗi 4-6 giờ khi cần, không quá 300 mg mỗi ngày.\r\n• Trẻ em: Liều lượng phụ thuộc vào tuổi và trọng lượng, cần tham khảo hướng dẫn của bác sĩ.\r\n\r\nLưu ý:\r\n• Tránh lái xe hoặc vận hành máy móc khi sử dụng do thuốc có thể gây buồn ngủ.\r\n• Không nên sử dụng đồng thời với rượu hoặc các thuốc ức chế thần kinh trung ương khác.\r\n\r\nTác dụng phụ:\r\n• Buồn ngủ, chóng mặt.\r\n• Khô miệng, họng, mũi.\r\n• Táo bón, tiểu khó.\r\n• Mờ mắt.\r\n');

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
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(4, 16),
(4, 17),
(4, 18),
(4, 19),
(4, 20);

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
(1, 'Thèm ăn, đói'),
(2, 'Thường xuyên đi tiểu'),
(3, 'Mệt mỏi'),
(4, 'Thèm nước'),
(5, 'Chấm đau và tổn thương không lành'),
(6, 'Đau cơ bắp'),
(7, 'Căng cơ, cứng cơ'),
(8, 'Giảm chức năng vận động'),
(9, 'Vấn đề về cột sống'),
(10, 'Đau kéo dài'),
(11, 'Mắt căng thẳng'),
(12, 'Đau nhức mắt'),
(13, 'Kích ứng mắt'),
(14, 'Chảy nước mắt'),
(15, 'Giảm tập trung'),
(16, 'Khó ngủ'),
(17, 'Thức dậy giữa đêm'),
(18, 'Ngủ không sâu'),
(19, 'Ngủ không đủ giấc'),
(20, 'Cảm giác mệt mỏi');

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
