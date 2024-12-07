-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 24, 2024 at 05:42 PM
-- Server version: 8.0.39-0ubuntu0.22.04.1
-- PHP Version: 8.2.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `family_restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `branch_id` int NOT NULL,
  `reservation_date` date NOT NULL,
  `reservation_time` time NOT NULL,
  `guests` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `location` varchar(255) NOT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `max_guests` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `location`, `contact_info`, `max_guests`) VALUES
(1, 'Cairo Central', '13 El-Gomhoreya Street, Downtown, Cairo, Egypt', 'Phone: +20 12 3456 7890, Email: cairocentral@example.com', 100),
(2, 'Cairo East', '5 Salah Salem Street, Nasr City, Cairo, Egypt', 'Phone: +20 12 3456 7891, Email: cairoeast@example.com', 500),
(3, 'Cairo West', '10 El Haram Street, Giza, Cairo, Egypt', 'Phone: +20 10 3456 7892, Email: cairowest@example.com', 52),
(4, 'Cairo North', '30 El Nozha Street, Heliopolis, Cairo, Egypt', 'Phone: +20 11 3456 7893, Email: caironorth@example.com', 20),
(5, 'Cairo South', '25 Corniche El Nil, Maadi, Cairo, Egypt', 'Phone: +20 12 5556 7894, Email: cairosouth@example.com', 5);

-- --------------------------------------------------------

--
-- Table structure for table `evaluations`
--

CREATE TABLE `evaluations` (
  `id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `reservation_id` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `comment` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `description`, `active`) VALUES
(1, 'قائمة الإفطار', 'خيارات إفطار شهية لبدء يومك', 1),
(2, 'قائمة الغداء', 'خيارات غداء مُشبِعة لوجبة منتصف النهار', 1),
(3, 'قائمة العشاء', 'خيارات عشاء لذيذة لوجبة مشبعة', 1),
(4, 'قائمة المشروبات', 'مشروبات منعشة تروي عطشك', 1),
(5, 'قائمة الحلويات', 'حلويات شهية تُرضي شغفك بالسكر', 1),
(6, 'قائمة الطعام النباتي', 'خيارات نباتية لذيذة للنباتيين', 1),
(7, 'قائمة الأطفال', 'وجبات مناسبة للأطفال ستنال إعجابهم', 1);
-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `image` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `menu_id` int NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `name`, `description`, `image`, `price`, `menu_id`, `active`) VALUES
(1, 'فول مدمس', 'طبق مصري تقليدي من الفول مع زيت الزيتون والليمون', 'assets/images/1.jpg', '20.00', 1, 1),
(2, 'طعمية (فلافل)', 'أقراص مقلية من الحمص والفول مغطاة بالسمسم', 'assets/images/2.jpeg', '15.00', 1, 1),
(3, 'كشري', 'طبق مصري شهير مكون من الأرز والمعكرونة والعدس', 'assets/images/3.jpg', '25.00', 2, 1),
(4, 'ملوخية بالأرز', 'شوربة الملوخية الشهيرة مع الأرز والدجاج', 'assets/images/4.jpg', '30.00', 2, 1),
(5, 'فراخ مشوية', 'دجاج مشوي متبل بالأعشاب والبهارات المصرية', 'assets/images/5.jpg', '45.00', 3, 1),
(6, 'كباب وكفتة', 'لحم مشوي متبل على الفحم يقدم مع الأرز والخضروات', 'assets/images/6.jpeg', '55.00', 3, 1),
(7, 'عصير قصب', 'عصير القصب الطازج المنعش', 'assets/images/7.jpg', '10.00', 4, 1),
(8, 'كركديه مثلج', 'مشروب الكركديه المصري المثلج', 'assets/images/8.jpeg', '12.00', 4, 1),
(9, 'أم علي', 'حلوى تقليدية مصرية مكونة من الخبز والحليب والمكسرات', 'assets/images/9.webp', '25.00', 5, 1),
(10, 'بسبوسة', 'حلوى سميد تقليدية مشبعة بالشربات', 'assets/images/10.jpeg', '20.00', 5, 1),
(11, 'زلابية', 'قطع مقلية من العجين الحلو مغطاة بالعسل أو السكر', 'assets/images/11.webp', '18.00', 5, 1),
(12, 'سلطة بلدي', 'سلطة مصرية طازجة مكونة من الطماطم والخيار والبصل', 'assets/images/12.jpg', '15.00', 6, 1),
(13, 'مسقعة', 'شرائح باذنجان مطبوخة مع الطماطم والفلفل الحار', 'assets/images/13.jpg', '22.00', 6, 1),
(14, 'برجر صغير', 'ساندوتش برجر صغير مع البطاطس المقلية', 'assets/images/14.jpg', '25.00', 7, 1),
(15, 'قطع دجاج مقلية', 'قطع دجاج مقلية مقرمشة مع صوص الغمس', 'assets/images/15.jpeg', '22.00', 7, 1),
(16, 'ميني بيتزا', 'ميني بيتزا بالجبن والطماطم', 'assets/images/16.jpg', '20.00', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `street` varchar(100) NOT NULL,
  `house_number` varchar(20) NOT NULL,
  `phone_1` varchar(20) NOT NULL,
  `phone_2` varchar(20) DEFAULT NULL,
  `phone_3` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `item_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `price_after_discount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `phones`
--

CREATE TABLE `phones` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `phone_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user',
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `city` varchar(50) NOT NULL,
  `street` varchar(100) NOT NULL,
  `house_number` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `city`, `street`, `house_number`, `created_at`) VALUES
(1, 'admin', 'Ahmed', 'mohamed elsayed', 'fathy', 'admin@family-restaurant.com', '$2y$10$XOWEqR4H50n.Caplzd8HmumSqooRUIJE9jjIHWaD/7fg9AheN0Z5S', 'cairo', 'Al Qasr Al Aini ', '78', '2024-04-12 19:36:04'),
(2, 'customer', 'ibrahim', 'ahmed mohamed', 'kamal', 'customer@family-restaurant.com', '$2y$10$XOWEqR4H50n.Caplzd8HmumSqooRUIJE9jjIHWaD/7fg9AheN0Z5S', 'cairo', 'Alazhar', '27', '2024-05-11 10:18:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `evaluations`
--
ALTER TABLE `evaluations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `reservation_id` (`reservation_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_ibfk_1` (`order_id`),
  ADD KEY `order_items_ibfk_2` (`item_id`);

--
-- Indexes for table `phones`
--
ALTER TABLE `phones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `evaluations`
--
ALTER TABLE `evaluations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phones`
--
ALTER TABLE `phones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `evaluations`
--
ALTER TABLE `evaluations`
  ADD CONSTRAINT `evaluations_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `evaluations_ibfk_2` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`id`);

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `phones`
--
ALTER TABLE `phones`
  ADD CONSTRAINT `phones_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
