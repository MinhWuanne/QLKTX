-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 26, 2024 lúc 08:22 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanlykytuc1`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--

CREATE TABLE `bills` (
  `id` int(11) NOT NULL,
  `roomId` int(11) DEFAULT NULL,
  `waterUnitPrice` int(11) DEFAULT 7000,
  `electricityUnitPrice` int(11) DEFAULT 3000,
  `oldWaterNumber` int(11) DEFAULT NULL,
  `newWaterNumber` int(11) DEFAULT 0,
  `oldElectricityNumber` int(11) DEFAULT NULL,
  `newElectricityNumber` int(11) DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(10) DEFAULT 'Pending',
  `payDate` date DEFAULT NULL,
  `servicesPrice` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contracts`
--

CREATE TABLE `contracts` (
  `id` int(11) NOT NULL,
  `studentId` int(11) DEFAULT NULL,
  `roomId` int(11) DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cancelledAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `contracts`
--

INSERT INTO `contracts` (`id`, `studentId`, `roomId`, `endDate`, `startDate`, `created_at`, `updated_at`, `cancelledAt`) VALUES
(1, 1, 1, '2023-09-25', '2023-03-25', '2024-06-01 14:32:40', '2024-06-01 14:32:40', NULL),
(2, 2, 1, '2023-12-27', '2023-09-27', '2024-06-01 14:32:40', '2024-06-01 14:32:40', NULL),
(3, 3, 1, '2023-12-27', '2023-09-27', '2024-06-01 14:32:40', '2024-06-01 14:32:40', NULL),
(4, 4, 1, '2023-12-27', '2023-09-27', '2024-06-01 14:32:40', '2024-06-01 14:32:40', NULL),
(5, 5, 1, '2023-12-27', '2023-09-27', '2024-06-01 14:32:40', '2024-06-01 14:32:40', NULL),
(6, 6, 1, '2023-12-27', '2023-09-27', '2024-06-01 14:32:40', '2024-06-01 14:32:40', NULL),
(7, 7, 3, '2023-12-27', '2023-09-27', '2024-06-01 14:32:40', '2024-06-01 14:32:40', NULL),
(8, 8, 3, '2023-12-27', '2023-09-27', '2024-06-01 14:32:40', '2024-06-01 14:32:40', NULL),
(9, 9, 2, '2023-12-27', '2023-09-27', '2024-06-01 14:32:40', '2024-06-01 14:32:40', NULL),
(10, 10, 2, '2023-12-27', '2023-09-27', '2024-06-01 14:32:40', '2024-06-01 14:32:40', NULL),
(11, 11, 2, '2023-12-27', '2023-09-27', '2024-06-01 14:32:40', '2024-06-01 14:32:40', NULL),
(12, 12, 2, '2023-12-27', '2023-09-27', '2024-06-01 14:32:40', '2024-06-01 14:32:40', NULL),
(13, 13, 2, '2023-12-27', '2023-09-27', '2024-06-01 14:32:40', '2024-06-01 14:32:40', NULL),
(14, 14, 2, '2023-12-27', '2023-09-27', '2024-06-01 14:32:40', '2024-06-01 14:32:40', NULL),
(15, 15, 13, '2023-12-27', '2023-09-27', '2024-06-01 14:32:40', '2024-06-01 14:32:40', NULL),
(16, 16, 13, '2023-12-27', '2023-09-27', '2024-06-01 14:32:40', '2024-06-01 14:32:40', NULL),
(17, 17, 13, '2023-12-27', '2023-09-27', '2024-06-01 14:32:40', '2024-06-01 14:32:40', NULL),
(18, 18, 13, '2023-12-27', '2023-09-27', '2024-06-01 14:32:40', '2024-06-01 14:32:40', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `finesticket`
--

CREATE TABLE `finesticket` (
  `id` int(11) NOT NULL,
  `studentId` int(11) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `status` varchar(10) DEFAULT 'Pending',
  `maxDate` date DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `payDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `finesticket`
--

INSERT INTO `finesticket` (`id`, `studentId`, `description`, `type`, `price`, `status`, `maxDate`, `createdAt`, `payDate`) VALUES
(1, 1, 'Làm hỏng chân giường', 'Làm hư hỏng tài sản', 50000, 'Success', '2023-10-10', '2023-09-29 16:10:07', NULL),
(2, 2, 'Làm hỏng quạt trần', 'Làm hư hỏng tài sản', 50000, 'OutDate', '2023-09-28', '2023-09-30 09:42:35', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `numberOfEmptyBed` int(11) NOT NULL,
  `roomTypeId` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `numberOfEmptyBed`, `roomTypeId`, `created_at`, `updated_at`) VALUES
(1, 'A101', 2, 1, '2024-06-01 14:32:39', '2024-06-01 14:32:39'),
(2, 'A102', 2, 1, '2024-06-01 14:32:39', '2024-06-01 14:32:39'),
(3, 'A103', 1, 1, '2024-06-01 14:32:39', '2024-06-02 01:09:18'),
(4, 'A104', 8, 1, '2024-06-01 14:32:39', '2024-06-01 14:32:39'),
(5, 'A105', 8, 1, '2024-06-01 14:32:39', '2024-06-01 14:32:39'),
(6, 'A106', 8, 1, '2024-06-01 14:32:39', '2024-06-01 14:32:39'),
(7, 'A201', 10, 2, '2024-06-01 14:32:39', '2024-06-01 14:32:39'),
(8, 'A202', 10, 2, '2024-06-01 14:32:39', '2024-06-01 14:32:39'),
(9, 'A203', 10, 2, '2024-06-01 14:32:39', '2024-06-01 14:32:39'),
(10, 'A204', 4, 3, '2024-06-01 14:32:39', '2024-06-01 14:32:39'),
(11, 'A205', 4, 3, '2024-06-01 14:32:39', '2024-06-01 14:32:39'),
(12, 'A206', 4, 3, '2024-06-01 14:32:39', '2024-06-01 14:32:39'),
(13, 'B301', 4, 1, '2024-06-01 14:32:39', '2024-06-01 14:32:39'),
(14, 'B302', 8, 1, '2024-06-01 14:32:39', '2024-06-01 14:32:39'),
(15, 'B303', 8, 1, '2024-06-01 14:32:39', '2024-06-01 14:32:39'),
(16, 'B304', 8, 1, '2024-06-01 14:32:39', '2024-06-01 14:32:39'),
(17, 'B305', 8, 1, '2024-06-01 14:32:39', '2024-06-01 14:32:39'),
(18, 'B306', 8, 1, '2024-06-01 14:32:39', '2024-06-01 14:32:39'),
(19, 'B401', 10, 2, '2024-06-01 14:32:39', '2024-06-01 14:32:39'),
(20, 'B402', 10, 2, '2024-06-01 14:32:39', '2024-06-01 14:32:39'),
(21, 'B403', 10, 2, '2024-06-01 14:32:39', '2024-06-01 14:32:39'),
(22, 'B404', 4, 3, '2024-06-01 14:32:39', '2024-06-01 14:32:39'),
(23, 'B405', 4, 3, '2024-06-01 14:32:39', '2024-06-01 14:32:39'),
(24, 'B406', 4, 3, '2024-06-01 14:32:39', '2024-06-01 14:32:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `room_types`
--

CREATE TABLE `room_types` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `maxNumberOfBed` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `room_types`
--

INSERT INTO `room_types` (`id`, `name`, `price`, `maxNumberOfBed`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Phòng loại 1', 2000000, 8, 'Phòng 8 bạn, giường tầng, 2 quạt trần, nhà vệ sinh khép kín, 2 gương lớn. Trong nhà tắm có trang bị bình nóng lạnh', '2024-06-01 14:32:39', '2024-06-01 14:32:39'),
(2, 'Phòng loại 2', 2000000, 10, 'Phòng 10 bạn, giường tầng, 2 quạt trần, nhà vệ sinh khép kín, 2 gương lớn.', '2024-06-01 14:32:39', '2024-06-01 14:32:39'),
(3, 'Phòng loại 3', 2000000, 4, 'Phòng 4 bạn, giường tầng, 2 quạt trần, nhà vệ sinh khép kín, 2 gương lớn. Trong nhà tắm có trang bị bình nóng lạnh. Có trang bị điều hoà.', '2024-06-01 14:32:39', '2024-06-01 14:32:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `isRequired` bit(1) DEFAULT b'0',
  `price` int(11) DEFAULT NULL,
  `deletedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `services`
--

INSERT INTO `services` (`id`, `name`, `isRequired`, `price`, `deletedAt`) VALUES
(1, 'Wifi', b'1', 20000, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `image_path` varchar(50) DEFAULT NULL,
  `MSV` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `sex` varchar(6) NOT NULL,
  `phoneNumber` varchar(20) DEFAULT NULL,
  `class` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `students`
--

INSERT INTO `students` (`id`, `image_path`, `MSV`, `name`, `birthday`, `sex`, `phoneNumber`, `class`, `created_at`, `updated_at`) VALUES
(1, 'demo.jpeg', '72DCTT20063', 'Hà Quang Anh', '2003-01-01', 'male', '01239', '72DCTT22', '2024-06-01 14:32:23', '2024-06-02 02:06:09'),
(2, 'demo.jpeg', '72DCTT20224', 'Lê Hải Anh', '2003-01-01', 'male', '0123456789', '72DCTT22', '2024-06-01 14:32:23', '2024-06-01 14:32:23'),
(3, 'demo.jpeg', '72DCTT20219', 'Bùi Sơn Dương', '2003-01-01', 'male', '0123456789', '72DCTT22', '2024-06-01 14:32:23', '2024-06-01 14:32:23'),
(4, 'demo.jpeg', '72DCTT20095', 'Nguyễn Hữu Đức Anh', '2003-01-01', 'male', '0123456789', '72DCTT22', '2024-06-01 14:32:23', '2024-06-01 14:32:23'),
(5, 'demo.jpeg', '72DCTT20084', 'Nguyễn Thế Anh', '2003-01-01', 'male', '0123456789', '72DCTT22', '2024-06-01 14:32:23', '2024-06-01 14:32:23'),
(6, 'demo.jpeg', '72DCTT20065', 'Đào Thị Ngọc Chiêm', '2003-01-01', 'female', '0123456789', '72DCTT22', '2024-06-01 14:32:23', '2024-06-09 09:20:54'),
(7, 'demo.jpeg', '72DCTT20101', 'Dương Minh Cường', '2003-01-01', 'male', '0123456789', '72DCTT22', '2024-06-01 14:32:23', '2024-06-09 09:21:28'),
(8, 'demo.jpeg', '72DCTT20215', 'Nguyễn Đức Cường', '2003-01-01', 'male', '0123456789', '72DCTT22', '2024-06-01 14:32:23', '2024-06-01 14:32:23'),
(9, 'demo.jpeg', '72DCTT20075', 'Nguyễn Thành Doanh', '2003-01-01', 'male', '0123456789', '72DCTT22', '2024-06-01 14:32:23', '2024-06-01 14:32:23'),
(10, 'demo.jpeg', '72DCTT20102', 'Bùi Quang Dũng', '2003-01-01', 'male', '0123456789', '72DCTT22', '2024-06-01 14:32:23', '2024-06-09 09:21:35'),
(11, 'demo.jpeg', '72DCTT20222', 'Tạ Tiến Dũng', '2003-01-01', 'male', '0123456789', '72DCTT22', '2024-06-01 14:32:23', '2024-06-01 14:32:23'),
(12, 'demo.jpeg', '72DCTT20066', 'Tô Hữu Dũng', '2003-01-01', 'male', '0123456789', '72DCTT22', '2024-06-01 14:32:23', '2024-06-01 14:32:23'),
(13, 'demo.jpeg', '72DCTT20213', 'Hồ Hữu Tiến Duy', '2003-01-01', 'male', '0123456789', '72DCTT22', '2024-06-01 14:32:23', '2024-06-01 14:32:23'),
(14, 'demo.jpeg', '72DCTT20076', 'Nguyễn Châu Anh', '2003-01-01', 'female', '0123456789', '72DCTT22', '2024-06-01 14:32:23', '2024-06-01 14:32:23'),
(15, 'demo.jpeg', '72DCTT20071', 'Hoàng Thu Hiền', '2003-01-01', 'female', '0123456789', '72DCTT22', '2024-06-01 14:32:23', '2024-06-01 14:32:23'),
(16, 'demo.jpeg', '72DCTT20051', 'Nguyễn Thanh Huyền', '2003-01-01', 'female', '0123456789', '72DCTT22', '2024-06-01 14:32:23', '2024-06-01 14:32:23'),
(17, 'demo.jpeg', '72DCTT20074', 'Nguyễn Thị Trà My', '2003-01-01', 'female', '0123456789', '72DCTT22', '2024-06-01 14:32:23', '2024-06-01 14:32:23'),
(18, 'demo.jpeg', '72DCTT20067', 'Phạm Ngọc Phương Nhi', '2003-01-01', 'female', '0123456789', '72DCTT22', '2024-06-01 14:32:23', '2024-06-01 14:32:23');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roomId` (`roomId`);

--
-- Chỉ mục cho bảng `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `studentId` (`studentId`),
  ADD KEY `roomId` (`roomId`);

--
-- Chỉ mục cho bảng `finesticket`
--
ALTER TABLE `finesticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `studentId` (`studentId`);

--
-- Chỉ mục cho bảng `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roomTypeId` (`roomTypeId`);

--
-- Chỉ mục cho bảng `room_types`
--
ALTER TABLE `room_types`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `MSV` (`MSV`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `contracts`
--
ALTER TABLE `contracts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `finesticket`
--
ALTER TABLE `finesticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `room_types`
--
ALTER TABLE `room_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`roomId`) REFERENCES `rooms` (`id`);

--
-- Các ràng buộc cho bảng `contracts`
--
ALTER TABLE `contracts`
  ADD CONSTRAINT `contracts_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contracts_ibfk_2` FOREIGN KEY (`roomId`) REFERENCES `rooms` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `finesticket`
--
ALTER TABLE `finesticket`
  ADD CONSTRAINT `finesticket_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `students` (`id`);

--
-- Các ràng buộc cho bảng `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`roomTypeId`) REFERENCES `room_types` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
