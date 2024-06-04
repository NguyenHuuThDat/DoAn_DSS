-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 04, 2024 lúc 02:52 AM
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
(4, 'Mất ngủ', '- Căng thẳng, lo âu\r\n- Chế độ sống không cân đối\r\n- Rối loạn giấc ngủ\r\n- Thay đổi hormone', 'Diphenhydramine (Benadryl)', 'Liều lượng sử dụng:\r\n• Người lớn: 25-50 mg mỗi 4-6 giờ khi cần, không quá 300 mg mỗi ngày.\r\n• Trẻ em: Liều lượng phụ thuộc vào tuổi và trọng lượng, cần tham khảo hướng dẫn của bác sĩ.\r\n\r\nLưu ý:\r\n• Tránh lái xe hoặc vận hành máy móc khi sử dụng do thuốc có thể gây buồn ngủ.\r\n• Không nên sử dụng đồng thời với rượu hoặc các thuốc ức chế thần kinh trung ương khác.\r\n\r\nTác dụng phụ:\r\n• Buồn ngủ, chóng mặt.\r\n• Khô miệng, họng, mũi.\r\n• Táo bón, tiểu khó.\r\n• Mờ mắt.\r\n'),
(5, 'Đau dạ dày', '- Vi khuẩn Helicobacter pylori gây viêm loét dạ dày\r\n- Sử dụng thuốc kháng viêm không steroid như ibuprofen, aspirin có thể gây viêm loét dạ dày\r\n- Căng thẳng, stress\r\n- Chế độ ăn uống không lành mạnh', '- Thuốc kháng axit: Giảm lượng axit trong dạ dày, giảm đau và khó chịu như Maalox, Mylanta\r\n- Thuốc ức chế bơm proton (PPI): Giảm sản xuất axit trong dạ dày như omeprazole, esomeprazole.\r\n- Thuốc kháng H2: Giảm sản xuất axit bằng cách chặn histamine như ranitidine, famotidine.\r\n- Kháng sinh: Dùng để diệt vi khuẩn Helicobacter pylori, thường kết hợp hai hoặc ba loại kháng sinh như amoxicillin, clarithromycin, metronidazole.\r\n- Thuốc bảo vệ niêm mạc dạ dày như sucralfate hoặc bismuth subsalicylate, giúp bảo vệ niêm mạc dạ dày khỏi axit.', '- Tuân thủ chỉ định của bác sĩ: Uống thuốc đúng liều lượng và thời gian theo hướng dẫn của bác sĩ.\r\n- Kiểm tra tác dụng phụ: Một số thuốc có thể gây ra tác dụng phụ như tiêu chảy, táo bón, đau đầu.\r\n- Không tự ý ngừng thuốc: Ngay cả khi triệu chứng đã giảm, cần hoàn thành liệu trình điều trị.\r\n- Tránh sử dụng NSAID: Nếu có tiền sử viêm loét dạ dày, cần tránh sử dụng thuốc kháng viêm không steroid.\r\n- Thay đổi lối sống: Ăn uống lành mạnh, tránh thức ăn gây kích ứng, không hút thuốc, giảm stress.'),
(6, 'Viêm xoang', '- Nhiễm virus: Cảm lạnh thông thường là nguyên nhân phổ biến nhất gây viêm xoang cấp tính.\r\n- Nhiễm vi khuẩn: Khi nhiễm trùng xoang kéo dài, có thể do vi khuẩn gây ra.\r\n- Dị ứng: Dị ứng với phấn hoa, bụi, nấm mốc có thể gây viêm xoang mãn tính.\r\n- Polyp mũi: Sự phát triển bất thường của mô trong mũi có thể gây tắc nghẽn và viêm xoang.\r\n- Rối loạn miễn dịch: Các bệnh như HIV/AIDS hoặc xơ nang làm tăng nguy cơ viêm xoang.\r\n- Yếu tố môi trường: Khói bụi, ô nhiễm, khói thuốc lá.', '- Thuốc kháng sinh: Dùng trong trường hợp viêm xoang do nhiễm vi khuẩn (như amoxicillin, doxycycline).\r\n- Thuốc kháng viêm: Giảm viêm và sưng (như ibuprofen, naproxen).\r\n- Thuốc kháng histamine: Dùng trong trường hợp viêm xoang do dị ứng (như loratadine, cetirizine).\r\n- Thuốc thông mũi: Giảm nghẹt mũi, có thể dùng dưới dạng xịt hoặc viên nén (như pseudoephedrine, oxymetazoline).\r\n- Thuốc xịt mũi corticosteroid: Giảm viêm trực tiếp trong xoang (như fluticasone, mometasone).\r\n- Dung dịch muối: Xịt hoặc rửa mũi bằng dung dịch muối sinh lý để làm sạch mũi và giảm tắc nghẽn.', '- Tuân thủ chỉ định của bác sĩ: Uống thuốc đúng liều lượng và thời gian theo hướng dẫn.\r\n- Theo dõi tác dụng phụ: Một số thuốc có thể gây tác dụng phụ như khô mũi, chảy máu mũi, tăng huyết áp.\r\n- Không tự ý ngừng thuốc: Đặc biệt là kháng sinh, cần hoàn thành liệu trình điều trị để tránh tình trạng kháng thuốc.\r\n- Không lạm dụng thuốc thông mũi: Sử dụng quá nhiều thuốc thông mũi có thể gây nghẹt mũi tái phát.\r\n- Thay đổi lối sống: Giữ môi trường sống sạch sẽ, tránh các chất gây dị ứng, uống nhiều nước và giữ ẩm cho không khí.'),
(7, 'Cao huyết áp', '- Di truyền: Gia đình có người bị cao huyết áp.\r\n- Chế độ ăn uống không lành mạnh: Nhiều muối, ít kali, nhiều chất béo bão hòa.\r\n- Thiếu vận động: Không tập thể dục thường xuyên.\r\n- Thừa cân hoặc béo phì.\r\n- Sử dụng thuốc lá và rượu bia.\r\n- Căng thẳng, stress: Ảnh hưởng tiêu cực đến hệ thần kinh và tim mạch.\r\n- Các bệnh nền: Như bệnh thận, tiểu đường, rối loạn nội tiết.', '- Thuốc lợi tiểu: Giúp cơ thể loại bỏ nước và muối, làm giảm lượng máu trong mạch máu như hydrochlorothiazide, furosemide.\r\n- Thuốc ức chế men chuyển (ACE inhibitors): Giảm sản xuất angiotensin II, làm giãn mạch máu như lisinopril, enalapril.\r\n- Thuốc chẹn thụ thể angiotensin II (ARBs): Ngăn angiotensin II tác động lên mạch máu như losartan, valsartan.\r\n- Thuốc chẹn beta: Giảm nhịp tim và giảm áp lực máu như metoprolol, atenolol.\r\n- Thuốc chẹn kênh canxi: Ngăn canxi vào tế bào cơ tim và mạch máu, giúp giãn mạch như amlodipine, diltiazem.\r\n- Thuốc ức chế renin: Giảm sản xuất renin từ thận, giúp giảm huyết áp như aliskiren.', '- Tuân thủ chỉ định của bác sĩ: Uống thuốc đúng liều lượng và thời gian theo hướng dẫn.\r\n- Theo dõi tác dụng phụ: Một số thuốc có thể gây ra tác dụng phụ như chóng mặt, mệt mỏi, ho khan, hoặc sưng phù.\r\n- Không tự ý ngừng thuốc: Cao huyết áp cần được kiểm soát liên tục, việc ngừng thuốc đột ngột có thể gây nguy hiểm.\r\n- Kiểm tra huyết áp thường xuyên: Để đảm bảo thuốc đang có hiệu quả và điều chỉnh kịp thời nếu cần.\r\n- Kết hợp với lối sống lành mạnh: Chế độ ăn ít muối, nhiều rau quả, tập thể dục đều đặn, duy trì cân nặng hợp lý, hạn chế rượu bia và ngừng hút thuốc.\r\n- Theo dõi và quản lý các bệnh nền: Như tiểu đường, bệnh thận, để kiểm soát huyết áp tốt hơn.'),
(8, 'Huyết áp thấp', '- Mất nước: Khi cơ thể mất nước do không uống đủ nước, tiêu chảy, nôn mửa, hoặc đổ mồ hôi nhiều.\r\n- Vấn đề tim mạch: Như nhịp tim chậm, suy tim, hoặc nhồi máu cơ tim.\r\n- Rối loạn nội tiết: Các bệnh lý như suy giáp, suy thượng thận, hoặc tiểu đường.\r\n- Thiếu dinh dưỡng: Thiếu các chất dinh dưỡng cần thiết như vitamin B12 và folate.\r\n- Thuốc: Một số loại thuốc có thể gây hạ huyết áp như thuốc lợi tiểu, thuốc chẹn beta, thuốc ức chế ACE.\r\n- Nhiễm trùng nặng (sốc nhiễm trùng): Khi nhiễm trùng lan rộng khắp cơ thể.\r\n- Phản ứng dị ứng nghiêm trọng (sốc phản vệ): Gây giãn mạch và giảm huyết áp nhanh chóng.', '- Thuốc co mạch: Như midodrine (Orvaten) giúp tăng huyết áp bằng cách co các mạch máu.\r\n- Fludrocortisone: Một loại corticosteroid giúp cơ thể giữ natri và nước, làm tăng huyết áp.\r\n- Erythropoietin: Được sử dụng nếu huyết áp thấp liên quan đến thiếu máu.\r\n- Thuốc tăng thể tích máu: Như truyền dịch muối sinh lý để tăng thể tích máu và áp lực máu.', '- Tuân thủ chỉ định của bác sĩ: Dùng thuốc đúng liều lượng và thời gian theo hướng dẫn.\r\n- Theo dõi tác dụng phụ: Một số thuốc có thể gây ra tác dụng phụ như đau đầu, tăng huyết áp quá mức, hoặc rối loạn điện giải.\r\n- Không tự ý ngừng thuốc: Ngay cả khi cảm thấy tốt hơn, cần tiếp tục điều trị theo chỉ dẫn của bác sĩ.\r\n- Kiểm tra huyết áp thường xuyên: Để đảm bảo thuốc đang có hiệu quả và điều chỉnh kịp thời nếu cần.\r\n- Thay đổi lối sống: Uống đủ nước, ăn đủ các bữa, tăng cường muối trong chế độ ăn nếu không có chống chỉ định, tránh đứng dậy quá nhanh.\r\n- Hạn chế rượu bia: Rượu có thể làm giảm huyết áp thêm.\r\n- Mang vớ y khoa: Vớ ép y khoa có thể giúp tăng huyết áp bằng cách ngăn máu dồn xuống chân.');

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
(4, 20),
(5, 21),
(5, 22),
(5, 23),
(5, 24),
(5, 25),
(6, 26),
(6, 27),
(6, 28),
(6, 29),
(6, 30),
(7, 31),
(7, 32),
(7, 33),
(7, 34),
(7, 35),
(7, 36),
(7, 37),
(8, 38),
(8, 39),
(8, 40),
(8, 41),
(8, 42),
(8, 43),
(8, 44);

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
(20, 'Cảm giác mệt mỏi'),
(21, 'Đau bụng trên'),
(22, 'Ợ chua, ợ nóng'),
(23, 'Buồn nôn, nôn'),
(24, 'Chán ăn'),
(25, 'Đầy hơi, khó tiêu'),
(26, 'Đau, áp lực ở mặt'),
(27, 'Nghẹt mũi'),
(28, 'Chảy mũi'),
(29, 'Suy giảm khứu giác'),
(30, 'Đau họng'),
(31, 'Đau đầu nghiêm trọng'),
(32, 'Chóng mặt'),
(33, 'Nhìn mờ hoặc thay đổi thị lực'),
(34, 'Đau ngực'),
(35, 'Khó thở'),
(36, 'Đánh trống ngực'),
(37, 'Chảy máu cam'),
(38, 'Chóng mặt, choáng váng'),
(39, 'Ngất xỉu'),
(40, 'Mờ mắt'),
(41, 'Buồn nôn'),
(42, 'Mệt mỏi'),
(43, 'Khó tập trung'),
(44, 'Da lạnh, nhợt nhạt');

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
