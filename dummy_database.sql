-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 24, 2024 at 06:32 PM
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
(1, 4, 3, '2024-10-09', '17:42:05', 6, '2024-09-24 18:31:52', 'pending'),
(2, 5, 3, '2024-10-19', '05:38:12', 7, '2024-09-24 18:31:52', 'in_progress'),
(3, 5, 4, '2024-09-27', '12:39:50', 3, '2024-09-24 18:31:52', 'in_progress'),
(4, 6, 1, '2024-08-30', '15:45:11', 6, '2024-09-24 18:31:52', 'completed'),
(5, 6, 5, '2024-10-10', '17:59:55', 2, '2024-09-24 18:31:52', 'in_progress'),
(6, 6, 2, '2024-10-06', '01:50:43', 1, '2024-09-24 18:31:52', 'in_progress'),
(7, 3, 5, '2024-10-08', '13:22:20', 3, '2024-09-24 18:31:52', 'in_progress'),
(8, 4, 5, '2024-08-29', '10:31:44', 7, '2024-09-24 18:31:52', 'completed'),
(9, 3, 3, '2024-08-29', '09:48:50', 9, '2024-09-24 18:31:52', 'completed'),
(10, 5, 4, '2024-10-15', '02:53:21', 10, '2024-09-24 18:31:52', 'in_progress'),
(11, 4, 1, '2024-08-28', '12:29:02', 10, '2024-09-24 18:31:52', 'completed'),
(12, 4, 5, '2024-09-26', '10:33:49', 7, '2024-09-24 18:31:52', 'pending'),
(13, 4, 3, '2024-08-26', '20:35:13', 7, '2024-09-24 18:31:52', 'completed'),
(14, 4, 4, '2024-09-27', '05:58:36', 8, '2024-09-24 18:31:52', 'pending'),
(15, 3, 1, '2024-10-15', '07:07:13', 1, '2024-09-24 18:31:52', 'in_progress'),
(16, 6, 1, '2024-10-23', '22:21:02', 7, '2024-09-24 18:31:52', 'pending'),
(17, 3, 2, '2024-09-06', '19:20:52', 8, '2024-09-24 18:31:52', 'cancelled'),
(18, 5, 3, '2024-09-16', '00:48:17', 4, '2024-09-24 18:31:52', 'completed'),
(19, 5, 3, '2024-08-27', '16:19:53', 9, '2024-09-24 18:31:52', 'completed'),
(20, 4, 1, '2024-09-07', '17:25:58', 6, '2024-09-24 18:31:52', 'cancelled'),
(21, 3, 4, '2024-08-25', '11:48:00', 3, '2024-09-24 18:31:52', 'cancelled'),
(22, 5, 3, '2024-09-19', '16:52:01', 7, '2024-09-24 18:31:52', 'cancelled'),
(23, 4, 4, '2024-09-05', '05:58:37', 3, '2024-09-24 18:31:52', 'cancelled'),
(24, 6, 4, '2024-10-22', '18:53:52', 4, '2024-09-24 18:31:52', 'pending'),
(25, 6, 3, '2024-09-23', '03:37:43', 9, '2024-09-24 18:31:52', 'completed'),
(26, 5, 2, '2024-08-27', '11:13:04', 10, '2024-09-24 18:31:52', 'completed'),
(27, 4, 5, '2024-10-23', '15:45:42', 9, '2024-09-24 18:31:52', 'in_progress'),
(28, 3, 1, '2024-10-08', '05:42:43', 2, '2024-09-24 18:31:52', 'pending'),
(29, 3, 1, '2024-10-04', '04:15:12', 5, '2024-09-24 18:31:52', 'in_progress'),
(30, 5, 5, '2024-10-05', '14:09:03', 2, '2024-09-24 18:31:52', 'pending'),
(31, 3, 3, '2024-10-14', '04:36:28', 7, '2024-09-24 18:31:52', 'pending'),
(32, 6, 5, '2024-09-14', '08:32:45', 7, '2024-09-24 18:31:52', 'completed'),
(33, 4, 4, '2024-09-20', '03:07:59', 5, '2024-09-24 18:31:52', 'cancelled'),
(34, 3, 2, '2024-09-30', '10:01:14', 9, '2024-09-24 18:31:52', 'pending'),
(35, 3, 1, '2024-10-04', '19:35:10', 7, '2024-09-24 18:31:52', 'in_progress'),
(36, 6, 4, '2024-09-29', '01:39:30', 2, '2024-09-24 18:31:52', 'pending');

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
(1, 6, NULL, 5, 'خدمة استثنائية وطعام رائع! مكان يجب زيارته في القاهرة.', '2024-09-24 18:31:50'),
(2, 8, NULL, 5, 'خدمة استثنائية وطعام رائع! مكان يجب زيارته في القاهرة.', '2024-09-24 18:31:50'),
(3, 10, NULL, 5, 'خدمة استثنائية وطعام رائع! مكان يجب زيارته في القاهرة.', '2024-09-24 18:31:50'),
(4, 13, NULL, 5, 'خدمة استثنائية وطعام رائع! مكان يجب زيارته في القاهرة.', '2024-09-24 18:31:50'),
(5, 14, NULL, 5, 'خدمة استثنائية وطعام رائع! مكان يجب زيارته في القاهرة.', '2024-09-24 18:31:50'),
(6, 16, NULL, 5, 'خدمة استثنائية وطعام رائع! مكان يجب زيارته في القاهرة.', '2024-09-24 18:31:50'),
(7, 20, NULL, 5, 'خدمة استثنائية وطعام رائع! مكان يجب زيارته في القاهرة.', '2024-09-24 18:31:50'),
(8, 25, NULL, 5, 'خدمة استثنائية وطعام رائع! مكان يجب زيارته في القاهرة.', '2024-09-24 18:31:51'),
(9, NULL, 4, 5, 'خدمة استثنائية وطعام رائع!', '2024-09-24 18:31:52'),
(10, NULL, 8, 5, 'خدمة استثنائية وطعام رائع!', '2024-09-24 18:31:52'),
(11, NULL, 9, 1, 'أسوأ تجربة تناول طعام مررت بها في مصر.', '2024-09-24 18:31:52'),
(12, NULL, 11, 4, 'تجربة جيدة جدًا، لكن الانتظار كان طويلاً قليلاً.', '2024-09-24 18:31:52'),
(13, NULL, 13, 2, 'مخيبة للآمال. الخدمة كانت بطيئة والطعام كان بارداً.', '2024-09-24 18:31:52'),
(14, NULL, 18, 2, 'مخيبة للآمال. الخدمة كانت بطيئة والطعام كان بارداً.', '2024-09-24 18:31:52'),
(15, NULL, 19, 3, 'تجربة عادية، لا شيء مميز حقًا.', '2024-09-24 18:31:52'),
(16, NULL, 25, 2, 'مخيبة للآمال. الخدمة كانت بطيئة والطعام كان بارداً.', '2024-09-24 18:31:52'),
(17, NULL, 26, 1, 'أسوأ تجربة تناول طعام مررت بها في مصر.', '2024-09-24 18:31:52'),
(18, NULL, 32, 2, 'مخيبة للآمال. الخدمة كانت بطيئة والطعام كان بارداً.', '2024-09-24 18:31:52');

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
(1, 3, 'غادة', 'فواز', 'prakeen@gmail.com', 'عزبة النخل', 'شارع باسم عبد المعطي', '85', '0123456789', NULL, NULL, '2024-09-24 18:31:50', 'pending'),
(2, 3, 'فدوى', 'عبد الله', 'fahmy.ahmed@gmail.com', 'إمبابة', 'شارع أنس عبد الحميد', '85', '0123456789', NULL, NULL, '2024-09-24 18:31:50', 'cancelled'),
(3, 3, 'زياد', 'عبد الجليل', 'maged.hazem@ahmed.eg', 'السلام', 'طريق نصار عبد العزيز', '38', '0123456789', NULL, NULL, '2024-09-24 18:31:50', 'cancelled'),
(4, 3, 'غسان', 'عمران', 'lramzy@hazem.org', 'الدقي', 'طريق مهدي عزام', '79', '0123456789', NULL, NULL, '2024-09-24 18:31:50', 'in_progress'),
(5, 3, 'سهام', 'عبد الناصر', 'mohamed.abdulaziz@yahoo.com', 'جاردن سيتي', 'شارع مجد عمران', '78', '0123456789', NULL, NULL, '2024-09-24 18:31:50', 'cancelled'),
(6, 3, 'سهام', 'عز الدين', 'maged.rakeen@yahoo.com', 'حدائق المعادي', 'ممر قاسم السقا', '51', '0123456789', NULL, NULL, '2024-09-24 18:31:50', 'completed'),
(7, 3, 'فادي', 'عزام', 'hashem.karim@gmail.com', 'العاشر من رمضان', 'شارع هيفاء جمال الدين', '10', '0123456789', NULL, NULL, '2024-09-24 18:31:50', 'pending'),
(8, 3, 'أمنة', 'عبد الباسط', 'dina.abdulaziz@gmail.com', 'المنيب', 'شارع عصام مجاهد', '62', '0123456789', NULL, NULL, '2024-09-24 18:31:50', 'completed'),
(9, 3, 'أحمد', 'عبد السلام', 'imahmoud@rakeen.net', 'هارون', 'ممر مايا عبد الرحيم', '1', '0123456789', NULL, NULL, '2024-09-24 18:31:50', 'pending'),
(10, 4, 'ميساء', 'طلال', 'elsherbiny.saif@tharwat.org', 'زهراء المعادي', 'شارع ميسره عزام', '25', '0123456789', NULL, NULL, '2024-09-24 18:31:50', 'completed'),
(11, 4, 'ماهر', 'رجائي', 'youssef.ramah@ahmed.info', 'المنيل', 'طريق غازي زين العابدين', '25', '0123456789', NULL, NULL, '2024-09-24 18:31:50', 'in_progress'),
(12, 4, 'غيداء', 'عبد الرزاق', 'yramzy@ramah.biz', 'العتبة', 'ممر مراد عزمي', '81', '0123456789', NULL, NULL, '2024-09-24 18:31:50', 'in_progress'),
(13, 4, 'مجدي', 'الداوود', 'abdulaziz.youssef@selim.eg', 'الجزيرة', 'طريق إسماعيل عبد الهادي', '81', '0123456789', NULL, NULL, '2024-09-24 18:31:50', 'completed'),
(14, 4, 'لارا', 'عبد السلام', 'rbayoumi@hotmail.com', 'الوايلي', 'طريق ليليان عمران', '28', '0123456789', NULL, NULL, '2024-09-24 18:31:50', 'completed'),
(15, 4, 'آمال', 'عمران', 'dina51@hotmail.com', 'السيدة زينب', 'شارع ادهم جبر', '93', '0123456789', NULL, NULL, '2024-09-24 18:31:50', 'in_progress'),
(16, 4, 'يعقوب', 'طلال', 'okaram@karim.net', 'المنيب', 'طريق بليغ عبد الحليم', '20', '0123456789', NULL, NULL, '2024-09-24 18:31:50', 'completed'),
(17, 4, 'زينات', 'نجيب', 'hashem.bayoumi@selim.net', 'جاردن سيتي', 'طريق مهاب الداوود', '51', '0123456789', NULL, NULL, '2024-09-24 18:31:50', 'in_progress'),
(18, 5, 'مراد', 'عبد المطلب', 'ehab.saif@hotmail.com', 'حدائق المعادي', 'ممر عزت عز العرب', '100', '0123456789', NULL, NULL, '2024-09-24 18:31:50', 'pending'),
(19, 5, 'قاسم', 'عبد الجليل', 'elshamy.ahmed@abdulaziz.info', 'الساحل', 'ممر داوود رجائي', '95', '0123456789', NULL, NULL, '2024-09-24 18:31:50', 'cancelled'),
(20, 5, 'راية', 'الكفراوي', 'ahmed.ehab@hotmail.com', 'المعادي', 'طريق صبا السويلم', '46', '0123456789', NULL, NULL, '2024-09-24 18:31:50', 'completed'),
(21, 5, 'نعيم', 'عبد الرؤوف', 'youssef73@karam.come.eg', 'غمرة', 'شارع طالب عزمي', '36', '0123456789', NULL, NULL, '2024-09-24 18:31:50', 'in_progress'),
(22, 5, 'لنا', 'الصعيدي', 'rakeen.dina@ramah.come.eg', 'المطار', 'شارع سهام عبد القادر', '39', '0123456789', NULL, NULL, '2024-09-24 18:31:50', 'cancelled'),
(23, 6, 'دياب', 'عمران', 'nkarim@gmail.com', 'الزاوية الحمراء', 'ممر زايد عبد الله', '81', '0123456789', NULL, NULL, '2024-09-24 18:31:51', 'pending'),
(24, 6, 'عدلي', 'عبد اللطيف', 'ehab.ramzy@hemeida.biz', 'حلمية الزيتون', 'ممر ريان عمران', '56', '0123456789', NULL, NULL, '2024-09-24 18:31:51', 'pending'),
(25, 6, 'ماجد', 'نجيب', 'youssef.basma@ehab.eg', 'الزاوية الحمراء', 'شارع ريتا عبد الرحمن', '65', '0123456789', NULL, NULL, '2024-09-24 18:31:51', 'completed'),
(26, 6, 'اسحاق', 'عبد المجيد', 'basma.mahmoud@ezz.com', 'ألف مسكن', 'شارع ماهر عبد المجيد', '7', '0123456789', NULL, NULL, '2024-09-24 18:31:51', 'cancelled'),
(27, 6, 'مريم', 'عبد الجواد', 'ptharwat@karam.biz', 'إمبابة', 'ممر منير عبد الرحيم', '61', '0123456789', NULL, NULL, '2024-09-24 18:31:51', 'in_progress'),
(28, 6, 'سحر', 'عبد المجيد', 'dfahmy@gmail.com', 'جاردن سيتي', 'شارع باسل رسلان', '48', '0123456789', NULL, NULL, '2024-09-24 18:31:51', 'cancelled'),
(29, 6, 'ولاء', 'عزيز', 'xkaram@ahmed.info', 'التجمع التالت', 'شارع صفاء عبد الحليم', '63', '0123456789', NULL, NULL, '2024-09-24 18:31:51', 'cancelled');

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
(1, 1, 4, 1, '45.00', '42.75'),
(2, 1, 2, 3, '30.00', '28.50'),
(3, 1, 4, 1, '45.00', '42.75'),
(4, 2, 7, 2, '20.00', '18.00'),
(5, 2, 16, 2, '46.00', '41.40'),
(6, 2, 2, 5, '30.00', '27.00'),
(7, 3, 2, 5, '30.00', '28.50'),
(8, 4, 2, 3, '30.00', '27.00'),
(9, 4, 9, 1, '35.00', '31.50'),
(10, 4, 1, 5, '33.00', '29.70'),
(11, 5, 15, 2, '25.00', '25.00'),
(12, 6, 9, 2, '35.00', '35.00'),
(13, 7, 14, 2, '41.00', '41.00'),
(14, 8, 9, 4, '35.00', '33.25'),
(15, 9, 13, 2, '22.00', '22.00'),
(16, 10, 13, 1, '22.00', '19.80'),
(17, 10, 10, 1, '45.00', '40.50'),
(18, 10, 2, 5, '30.00', '27.00'),
(19, 11, 12, 3, '38.00', '30.40'),
(20, 11, 1, 5, '33.00', '26.40'),
(21, 11, 14, 2, '41.00', '32.80'),
(22, 12, 3, 5, '31.00', '27.90'),
(23, 12, 3, 2, '31.00', '27.90'),
(24, 13, 13, 1, '22.00', '22.00'),
(25, 14, 7, 4, '20.00', '18.00'),
(26, 14, 3, 4, '31.00', '27.90'),
(27, 15, 4, 1, '45.00', '45.00'),
(28, 15, 12, 1, '38.00', '38.00'),
(29, 16, 11, 3, '39.00', '35.10'),
(30, 16, 8, 2, '48.00', '43.20'),
(31, 17, 14, 3, '41.00', '38.95'),
(32, 18, 10, 4, '45.00', '40.50'),
(33, 18, 10, 2, '45.00', '40.50'),
(34, 19, 2, 5, '30.00', '28.50'),
(35, 20, 8, 1, '48.00', '43.20'),
(36, 20, 13, 2, '22.00', '19.80'),
(37, 20, 1, 4, '33.00', '29.70'),
(38, 21, 13, 4, '22.00', '22.00'),
(39, 22, 13, 3, '22.00', '20.90'),
(40, 22, 1, 1, '33.00', '31.35'),
(41, 22, 3, 3, '31.00', '29.45'),
(42, 23, 9, 2, '35.00', '33.25'),
(43, 23, 15, 3, '25.00', '23.75'),
(44, 24, 10, 1, '45.00', '42.75'),
(45, 24, 11, 2, '39.00', '37.05'),
(46, 25, 2, 3, '30.00', '24.00'),
(47, 25, 9, 5, '35.00', '28.00'),
(48, 25, 8, 3, '48.00', '38.40'),
(49, 26, 5, 1, '49.00', '46.55'),
(50, 26, 2, 4, '30.00', '28.50'),
(51, 27, 15, 5, '25.00', '22.50'),
(52, 27, 3, 5, '31.00', '27.90'),
(53, 28, 2, 2, '30.00', '27.00'),
(54, 28, 8, 1, '48.00', '43.20'),
(55, 28, 3, 4, '31.00', '27.90'),
(56, 29, 16, 4, '46.00', '41.40'),
(57, 29, 6, 1, '31.00', '27.90');

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
(1, 3, '01125920592'),
(2, 4, '01296767447'),
(3, 4, '01296767447'),
(4, 5, '01194396660'),
(5, 6, '01119126964'),
(6, 6, '01119126964'),
(7, 6, '01119126964');

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
(3, 'customer', 'نضال', 'عبد الفتاح', 'maged80@mostafa.eg', '$2y$10$l2nrhLrRFXQ4MlDJF.voX.XcB9jb.YjVo/H79iyViGdsrr9kPSNni', 'العتبة', 'طريق راجي عبد الرزاق', '43', '2024-09-24 18:31:50'),
(4, 'customer', 'سندس', 'غانم', 'hazem76@yahoo.com', '$2y$10$Dhxm7MnyIEspSacbJLxepunxXIIuqyz7ROYu.wudw7fYT8BEfYkv.', 'العاشر من رمضان', 'طريق سميرة فواز', '28', '2024-09-24 18:31:50'),
(5, 'customer', 'أكثم', 'مهران', 'ehab83@rizk.come.eg', '$2y$10$yUWCYVkSTt1eIHWPygzJ9uJyiZcJp72rr0TSWm/1R1tysW.q.w37u', 'عبده باشا', 'شارع ادهم عبد الباسط', '9', '2024-09-24 18:31:50'),
(6, 'customer', 'سماح', 'عبد المجيد', 'karim.hemeida@gmail.com', '$2y$10$26gFrmeVJfa9BsTpB1dbqOzTFuEFgnHErReHsQvDjANPWmkGdsyaG', 'عين شمس', 'شارع دانية عز الدين', '57', '2024-09-24 18:31:51');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `evaluations`
--
ALTER TABLE `evaluations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

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
