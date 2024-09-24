-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 24, 2024 at 06:10 PM
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
-- Database: `perfect_food`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `branch_id` int NOT NULL,
  `booking_date` date NOT NULL,
  `booking_time` time NOT NULL,
  `guests` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `branch_id`, `booking_date`, `booking_time`, `guests`, `created_at`, `status`) VALUES
(1, 4, 5, '2024-10-08', '11:52:08', 9, '2024-09-24 18:09:04', 'pending'),
(2, 3, 5, '2024-09-13', '22:05:22', 1, '2024-09-24 18:09:04', 'completed'),
(3, 5, 3, '2024-09-06', '22:13:34', 3, '2024-09-24 18:09:04', 'completed'),
(4, 5, 2, '2024-08-30', '14:37:16', 10, '2024-09-24 18:09:04', 'cancelled'),
(5, 5, 1, '2024-09-12', '12:42:30', 4, '2024-09-24 18:09:04', 'cancelled'),
(6, 4, 2, '2024-08-30', '03:46:51', 4, '2024-09-24 18:09:04', 'completed'),
(7, 5, 5, '2024-10-04', '08:20:17', 5, '2024-09-24 18:09:04', 'in_progress'),
(8, 5, 2, '2024-10-16', '19:17:00', 3, '2024-09-24 18:09:04', 'pending'),
(9, 5, 3, '2024-10-04', '18:21:31', 1, '2024-09-24 18:09:04', 'pending'),
(10, 6, 1, '2024-09-30', '01:44:16', 3, '2024-09-24 18:09:04', 'in_progress'),
(11, 3, 5, '2024-10-15', '10:59:29', 5, '2024-09-24 18:09:04', 'pending'),
(12, 3, 1, '2024-10-08', '11:42:24', 8, '2024-09-24 18:09:04', 'in_progress'),
(13, 5, 5, '2024-10-07', '19:13:02', 9, '2024-09-24 18:09:04', 'in_progress'),
(14, 5, 2, '2024-09-28', '10:19:50', 10, '2024-09-24 18:09:04', 'in_progress'),
(15, 4, 2, '2024-10-12', '00:38:48', 3, '2024-09-24 18:09:04', 'pending'),
(16, 5, 4, '2024-09-30', '18:55:49', 10, '2024-09-24 18:09:04', 'pending'),
(17, 6, 3, '2024-09-24', '00:34:58', 5, '2024-09-24 18:09:04', 'completed'),
(18, 6, 4, '2024-10-04', '18:55:37', 3, '2024-09-24 18:09:04', 'in_progress'),
(19, 5, 3, '2024-08-29', '21:40:17', 5, '2024-09-24 18:09:04', 'completed'),
(20, 6, 2, '2024-10-12', '08:20:01', 1, '2024-09-24 18:09:04', 'in_progress'),
(21, 5, 2, '2024-09-18', '12:43:57', 2, '2024-09-24 18:09:04', 'cancelled'),
(22, 5, 2, '2024-09-24', '00:26:05', 9, '2024-09-24 18:09:04', 'cancelled'),
(23, 6, 1, '2024-09-08', '02:23:14', 7, '2024-09-24 18:09:04', 'cancelled'),
(24, 6, 5, '2024-10-02', '13:50:40', 9, '2024-09-24 18:09:04', 'pending'),
(25, 6, 3, '2024-10-10', '04:57:25', 6, '2024-09-24 18:09:04', 'in_progress');

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
  `booking_id` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `comment` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `evaluations`
--

INSERT INTO `evaluations` (`id`, `order_id`, `booking_id`, `rating`, `comment`, `created_at`) VALUES
(1, 3, NULL, 5, 'خدمة استثنائية وطعام رائع! مكان يجب زيارته في القاهرة.', '2024-09-24 18:08:32'),
(2, 9, NULL, 5, 'خدمة استثنائية وطعام رائع! مكان يجب زيارته في القاهرة.', '2024-09-24 18:08:32'),
(3, 19, NULL, 5, 'خدمة استثنائية وطعام رائع! مكان يجب زيارته في القاهرة.', '2024-09-24 18:08:32'),
(4, 20, NULL, 5, 'خدمة استثنائية وطعام رائع! مكان يجب زيارته في القاهرة.', '2024-09-24 18:08:32'),
(5, 23, NULL, 5, 'خدمة استثنائية وطعام رائع! مكان يجب زيارته في القاهرة.', '2024-09-24 18:08:32'),
(6, NULL, 2, 5, 'خدمة استثنائية وطعام رائع!', '2024-09-24 18:09:04'),
(7, NULL, 3, 3, 'تجربة عادية، لا شيء مميز حقًا.', '2024-09-24 18:09:04'),
(8, NULL, 6, 5, 'خدمة استثنائية وطعام رائع!', '2024-09-24 18:09:04'),
(9, NULL, 17, 5, 'خدمة استثنائية وطعام رائع!', '2024-09-24 18:09:04'),
(10, NULL, 19, 4, 'تجربة جيدة جدًا، لكن الانتظار كان طويلاً قليلاً.', '2024-09-24 18:09:04');

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
(1, 'Breakfast Menu', 'Delicious breakfast options to start your day', 1),
(2, 'Lunch Menu', 'Satisfying lunch options for a midday meal', 1),
(3, 'Dinner Menu', 'Delectable dinner options for a hearty meal', 1),
(4, 'Drinks Menu', 'Refreshing beverages to quench your thirst', 1),
(5, 'Dessert Menu', 'Indulgent treats to satisfy your sweet tooth', 1),
(6, 'Vegetarian Menu', 'Delicious plant-based options for vegetarians', 1),
(7, 'Kids Menu', 'Kid-friendly meals that are sure to please', 1);

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
(1, 'Classic Pancakes', 'Fluffy pancakes served with maple syrup', 'assets/images/1.jpg', '33.00', 1, 1),
(2, 'Avocado Toast', 'Sliced avocado on toasted bread with poached eggs', 'assets/images/2.jpeg', '30.00', 1, 1),
(3, 'Club Sandwich', 'Triple-decker sandwich with turkey, bacon, lettuce, and tomato', 'assets/images/3.jpg', '31.00', 2, 1),
(4, 'Caesar Salad', 'Romaine lettuce, croutons, Parmesan cheese, and Caesar dressing', 'assets/images/4.jpg', '45.00', 2, 1),
(5, 'Grilled Salmon', 'Fresh Atlantic salmon fillet grilled to perfection', 'assets/images/5.jpg', '49.00', 3, 1),
(6, 'Ribeye Steak', 'Juicy ribeye steak cooked to your liking', 'assets/images/6.jpg', '31.00', 3, 1),
(7, 'Iced Coffee', 'Chilled coffee served over ice with milk or cream', 'assets/images/7.jpg', '20.00', 4, 1),
(8, 'Fresh Orange Juice', 'Cold-pressed orange juice made from freshly squeezed oranges', 'assets/images/8.webp', '48.00', 4, 1),
(9, 'Chocolate Brownie', 'Rich and fudgy chocolate brownie topped with vanilla ice cream', 'assets/images/9.webp', '35.00', 5, 1),
(10, 'New York Cheesecake', 'Creamy cheesecake with a graham cracker crust', 'assets/images/10.jpg', '45.00', 5, 1),
(11, 'Mango Sorbet', 'Refreshing mango sorbet made with ripe mangoes', 'assets/images/11.jpg', '39.00', 5, 1),
(12, 'Quinoa Salad', 'Healthy salad with quinoa, mixed greens, and veggies', 'assets/images/12.jpeg', '38.00', 6, 1),
(13, 'Vegetable Stir-Fry', 'Assorted vegetables stir-fried in a savory sauce', 'assets/images/13.jpg', '22.00', 6, 1),
(14, 'Chicken Tenders', 'Breaded and fried chicken tenders served with dipping sauce', 'assets/images/14.jpg', '41.00', 7, 1),
(15, 'Macaroni and Cheese', 'Creamy macaroni pasta with melted cheese', 'assets/images/15.jpg', '25.00', 7, 1),
(16, 'Cheese Pizza', 'Classic cheese pizza with tomato sauce and mozzarella cheese', 'assets/images/16.webp', '46.00', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `first_name` varchar(50) NOT NULL,
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

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `first_name`, `last_name`, `email`, `city`, `street`, `house_number`, `phone_1`, `phone_2`, `phone_3`, `created_at`, `status`) VALUES
(1, 3, 'إسلام', 'عمران', 'mahmoud61@gmail.com', 'المظلات', 'ممر سميرة عبد الرؤوف', '8', '0123456789', NULL, NULL, '2024-09-24 18:08:32', 'in_progress'),
(2, 3, 'صفاء', 'عبد الجواد', 'habdulaziz@hotmail.com', 'عين شمس', 'شارع فهمي مهران', '49', '0123456789', NULL, NULL, '2024-09-24 18:08:32', 'in_progress'),
(3, 3, 'ريما', 'السباعي', 'ramzy.ahmed@hotmail.com', 'السادس من اكتوير', 'طريق لينا عزمي', '71', '0123456789', NULL, NULL, '2024-09-24 18:08:32', 'completed'),
(4, 3, 'ريان', 'عبد الهادي', 'hazem.younes@hotmail.com', 'المرج', 'طريق أمين عبد اللطيف', '15', '0123456789', NULL, NULL, '2024-09-24 18:08:32', 'cancelled'),
(5, 3, 'جهاد', 'عبد الكريم', 'mostafa93@rakeen.eg', 'مدينة نصر', 'ممر زين عبد الرحيم', '89', '0123456789', NULL, NULL, '2024-09-24 18:08:32', 'pending'),
(6, 4, 'سهير', 'عبد الفتاح', 'abdulaziz.hazem@yahoo.com', 'عبود', 'شارع ربيع طلال', '29', '0123456789', NULL, NULL, '2024-09-24 18:08:32', 'in_progress'),
(7, 4, 'شهاب', 'صدام', 'dina.hemeida@selim.org', 'المعصرة', 'ممر نهى عبد العزيز', '27', '0123456789', NULL, NULL, '2024-09-24 18:08:32', 'pending'),
(8, 4, 'حليمة', 'غانم', 'youssef.mostafa@hotmail.com', 'الزهراء', 'شارع نجلاء عزمي', '100', '0123456789', NULL, NULL, '2024-09-24 18:08:32', 'pending'),
(9, 4, 'شيماء', 'الداوود', 'maged.hazem@fahmy.biz', 'الكيت كات', 'طريق سيرينا عبد القادر', '17', '0123456789', NULL, NULL, '2024-09-24 18:08:32', 'completed'),
(10, 4, 'دعاء', 'غالب', 'tmostafa@gmail.com', 'المظلات', 'شارع أنور جمال الدين', '89', '0123456789', NULL, NULL, '2024-09-24 18:08:32', 'cancelled'),
(11, 4, 'محمد ', 'عبد الفتاح', 'lramzy@gmail.com', 'الزهراء', 'شارع مصطفى عبد الفتاح', '13', '0123456789', NULL, NULL, '2024-09-24 18:08:32', 'in_progress'),
(12, 4, 'اسحق', 'عبد العزيز', 'younes.ehab@carmen.org', 'باب اللوق', 'شارع ورود عبد اللطيف', '63', '0123456789', NULL, NULL, '2024-09-24 18:08:32', 'pending'),
(13, 5, 'إنعام', 'عزمي', 'hashem.mostafa@hotmail.com', 'إمبابة', 'ممر فدى عبد الرزاق', '1', '0123456789', NULL, NULL, '2024-09-24 18:08:32', 'pending'),
(14, 5, 'شذى', 'عبد المعطي', 'mostafa.ehab@gmail.com', 'السادس من اكتوير', 'طريق حافظ عبد الرحمن', '12', '0123456789', NULL, NULL, '2024-09-24 18:08:32', 'in_progress'),
(15, 5, 'سنان', 'عبد الناصر', 'hazem65@hotmail.com', 'التجمع التالت', 'ممر عزيزة عبد الجواد', '60', '0123456789', NULL, NULL, '2024-09-24 18:08:32', 'cancelled'),
(16, 5, 'برهان', 'الصعيدي', 'saif.fahmy@rakeen.com', 'كوتسيكا', 'ممر زياد حارث', '38', '0123456789', NULL, NULL, '2024-09-24 18:08:32', 'in_progress'),
(17, 5, 'وجيه', 'السباعي', 'basma.ramah@hazem.org', 'حدائق المعادي', 'شارع فريد عبد الوهاب', '43', '0123456789', NULL, NULL, '2024-09-24 18:08:32', 'in_progress'),
(18, 5, 'يعقوب', 'هوساوي', 'mostafa.karim@hazem.net', 'حلوان', 'طريق ضياء الدين عبد الوهاب', '45', '0123456789', NULL, NULL, '2024-09-24 18:08:32', 'in_progress'),
(19, 5, 'خليل', 'هارون', 'youssef14@gmail.com', 'الأزبكية', 'شارع احمد جبر', '25', '0123456789', NULL, NULL, '2024-09-24 18:08:32', 'completed'),
(20, 6, 'رافت', 'السعيد', 'mohamed.tharwat@mostafa.come.eg', 'المطرية', 'ممر سمية عبد الهادي', '56', '0123456789', NULL, NULL, '2024-09-24 18:08:32', 'completed'),
(21, 6, 'تمارا', 'جمال الدين', 'youssef51@yahoo.com', 'المنيل', 'ممر انيس عبد المعطي', '59', '0123456789', NULL, NULL, '2024-09-24 18:08:32', 'in_progress'),
(22, 6, 'سلام', 'عبد المعطي', 'grizk@hotmail.com', 'التجمع الاول', 'شارع عهد مجاهد', '35', '0123456789', NULL, NULL, '2024-09-24 18:08:32', 'pending'),
(23, 6, 'حميد', 'السباعي', 'ezz.mahmoud@gmail.com', 'شبرا', 'طريق رباب عبد المهيمن', '40', '0123456789', NULL, NULL, '2024-09-24 18:08:32', 'completed'),
(24, 6, 'مريم', 'مكي', 'hemeida.mahmoud@hotmail.com', 'ألف مسكن', 'ممر زيدان مهران', '61', '0123456789', NULL, NULL, '2024-09-24 18:08:32', 'in_progress'),
(25, 6, 'ليث', 'الصعيدي', 'hani87@hotmail.com', 'عزبة النخل', 'طريق عنان عز العرب', '72', '0123456789', NULL, NULL, '2024-09-24 18:08:32', 'pending');

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

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `item_id`, `quantity`, `price`, `price_after_discount`) VALUES
(1, 1, 14, 2, '41.00', '36.90'),
(2, 1, 3, 4, '31.00', '27.90'),
(3, 2, 12, 5, '38.00', '30.40'),
(4, 2, 15, 2, '25.00', '20.00'),
(5, 2, 14, 5, '41.00', '32.80'),
(6, 3, 15, 3, '25.00', '22.50'),
(7, 3, 14, 3, '41.00', '36.90'),
(8, 3, 16, 1, '46.00', '41.40'),
(9, 4, 8, 2, '48.00', '45.60'),
(10, 4, 10, 1, '45.00', '42.75'),
(11, 5, 11, 2, '39.00', '37.05'),
(12, 5, 6, 2, '31.00', '29.45'),
(13, 6, 14, 3, '41.00', '38.95'),
(14, 7, 15, 1, '25.00', '22.50'),
(15, 7, 4, 3, '45.00', '40.50'),
(16, 7, 7, 3, '20.00', '18.00'),
(17, 8, 5, 1, '49.00', '46.55'),
(18, 8, 15, 2, '25.00', '23.75'),
(19, 8, 1, 3, '33.00', '31.35'),
(20, 9, 4, 1, '45.00', '45.00'),
(21, 9, 13, 2, '22.00', '22.00'),
(22, 10, 1, 4, '33.00', '31.35'),
(23, 11, 11, 1, '39.00', '35.10'),
(24, 11, 1, 5, '33.00', '29.70'),
(25, 11, 8, 2, '48.00', '43.20'),
(26, 12, 13, 4, '22.00', '22.00'),
(27, 13, 9, 2, '35.00', '35.00'),
(28, 14, 9, 3, '35.00', '33.25'),
(29, 14, 4, 2, '45.00', '42.75'),
(30, 15, 12, 4, '38.00', '36.10'),
(31, 15, 15, 1, '25.00', '23.75'),
(32, 16, 6, 5, '31.00', '29.45'),
(33, 16, 9, 1, '35.00', '33.25'),
(34, 17, 2, 2, '30.00', '30.00'),
(35, 17, 15, 1, '25.00', '25.00'),
(36, 18, 8, 1, '48.00', '48.00'),
(37, 19, 3, 1, '31.00', '29.45'),
(38, 19, 9, 4, '35.00', '33.25'),
(39, 20, 2, 5, '30.00', '24.00'),
(40, 20, 15, 1, '25.00', '20.00'),
(41, 20, 5, 3, '49.00', '39.20'),
(42, 21, 11, 2, '39.00', '39.00'),
(43, 22, 9, 2, '35.00', '35.00'),
(44, 23, 10, 2, '45.00', '36.00'),
(45, 23, 14, 5, '41.00', '32.80'),
(46, 23, 16, 5, '46.00', '36.80'),
(47, 24, 15, 5, '25.00', '23.75'),
(48, 25, 8, 2, '48.00', '48.00');

-- --------------------------------------------------------

--
-- Table structure for table `phones`
--

CREATE TABLE `phones` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `phone_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `phones`
--

INSERT INTO `phones` (`id`, `user_id`, `phone_number`) VALUES
(1, 3, '351.221.1873'),
(2, 3, '351.221.1873'),
(3, 4, '347-386-3137'),
(4, 4, '347-386-3137'),
(5, 5, '865-579-8375'),
(6, 5, '865-579-8375'),
(7, 6, '346-241-5191');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user',
  `first_name` varchar(50) NOT NULL,
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

INSERT INTO `users` (`id`, `role`, `first_name`, `last_name`, `email`, `password`, `city`, `street`, `house_number`, `created_at`) VALUES
(1, 'admin', 'Ahmed', 'Essam', 'admin@perfect-food.com', '$2y$10$XOWEqR4H50n.Caplzd8HmumSqooRUIJE9jjIHWaD/7fg9AheN0Z5S', 'cairo', 'Al Qasr Al Aini ', '78', '2024-04-12 19:36:04'),
(2, 'branch_manager', 'ibrahim', 'kamal', 'branch_manager@perfect-food.com', '$2y$10$XOWEqR4H50n.Caplzd8HmumSqooRUIJE9jjIHWaD/7fg9AheN0Z5S', 'cairo', 'Alazhar', '27', '2024-05-11 10:18:27'),
(3, 'customer', 'عالية', 'عبد الجليل', 'hramzy@gmail.com', '$2y$10$ceb077y9Z8nMYu.L.qVn9OifIkp6L8l/eIqEs65BPchivGiHVQJ7C', 'الحسين', 'شارع علاء طلال', '40', '2024-09-24 18:08:32'),
(4, 'customer', 'فتحية', 'عبد اللطيف', 'fahmy.ehab@elshamy.info', '$2y$10$0lKUoG5JYbjQSqePd2nQEeDTyjAnJxyONWJoxBmJniO2IIwwCskAS', 'حدائق المعادي', 'شارع مامون جبر', '100', '2024-09-24 18:08:32'),
(5, 'customer', 'عبيدة', 'عبد الجواد', 'mostafa16@hemeida.info', '$2y$10$x8rciaYDMe1lj.Jz8zyvZ.wei0nvHmeI32t9c78mQtGF4hQzJy5ku', 'الأزبكية', 'ممر أزهار عبد اللطيف', '33', '2024-09-24 18:08:32'),
(6, 'customer', 'لانا', 'كاظم', 'ahmed41@hotmail.com', '$2y$10$5XBAZxcvlsPEokMU3YCmze1PpPbLSOTUiXBKYYb5w24Q1amESVnH.', 'المطار', 'شارع ياسمين عبد الهادي', '43', '2024-09-24 18:08:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
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
  ADD KEY `booking_id` (`booking_id`);

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
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `evaluations`
--
ALTER TABLE `evaluations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `phones`
--
ALTER TABLE `phones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `evaluations`
--
ALTER TABLE `evaluations`
  ADD CONSTRAINT `evaluations_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `evaluations_ibfk_2` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`);

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
