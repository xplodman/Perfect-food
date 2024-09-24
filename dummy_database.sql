-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 24, 2024 at 07:48 PM
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
(1, 7, NULL, 5, 'خدمة استثنائية وطعام رائع! مكان يجب زيارته في القاهرة.', '2024-09-24 19:48:17'),
(2, 8, NULL, 5, 'خدمة استثنائية وطعام رائع! مكان يجب زيارته في القاهرة.', '2024-09-24 19:48:17'),
(3, 10, NULL, 5, 'خدمة استثنائية وطعام رائع! مكان يجب زيارته في القاهرة.', '2024-09-24 19:48:17'),
(4, 18, NULL, 5, 'خدمة استثنائية وطعام رائع! مكان يجب زيارته في القاهرة.', '2024-09-24 19:48:17'),
(5, 20, NULL, 5, 'خدمة استثنائية وطعام رائع! مكان يجب زيارته في القاهرة.', '2024-09-24 19:48:17'),
(6, 25, NULL, 5, 'خدمة استثنائية وطعام رائع! مكان يجب زيارته في القاهرة.', '2024-09-24 19:48:17'),
(7, 26, NULL, 5, 'خدمة استثنائية وطعام رائع! مكان يجب زيارته في القاهرة.', '2024-09-24 19:48:17'),
(8, 29, NULL, 5, 'خدمة استثنائية وطعام رائع! مكان يجب زيارته في القاهرة.', '2024-09-24 19:48:17'),
(9, 32, NULL, 5, 'خدمة استثنائية وطعام رائع! مكان يجب زيارته في القاهرة.', '2024-09-24 19:48:17');

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
(1, 3, 'أنور', 'عبد اللطيف', 'elshamy.dina@hotmail.com', 'غمرة', 'طريق بشرى الكفراوي', '80', '1120789726', NULL, NULL, '2024-09-24 19:48:17', 'in_progress'),
(2, 3, 'اديب', 'فواز', 'mostafa06@selim.eg', 'العاشر من رمضان', 'طريق علا عبد المطلب', '61', '1078164747', NULL, NULL, '2024-09-24 19:48:17', 'pending'),
(3, 3, 'سالم', 'السايس', 'mostafa.dina@fahmy.come.eg', 'العاشر من رمضان', 'شارع مدحت كاظم', '69', '1209078920', NULL, NULL, '2024-09-24 19:48:17', 'cancelled'),
(4, 3, 'رضوان', 'مهران', 'youssef.basma@hotmail.com', 'الظاهر', 'طريق فاطمة عبد المطلب', '51', '1259962247', NULL, NULL, '2024-09-24 19:48:17', 'in_progress'),
(5, 3, 'شهم', 'الكفراوي', 'dina66@hotmail.com', 'التجمع الخامس', 'شارع كريم عبد الرحيم', '36', '1274938007', NULL, NULL, '2024-09-24 19:48:17', 'cancelled'),
(6, 4, 'شهد', 'رجائي', 'mohamed03@gmail.com', 'المعصرة', 'شارع عفاف غالب', '37', '1040439392', NULL, NULL, '2024-09-24 19:48:17', 'in_progress'),
(7, 4, 'سكينة', 'الكفراوي', 'wehab@bayoumi.org', 'روكسي', 'ممر فريال السعيد', '78', '1244384974', NULL, NULL, '2024-09-24 19:48:17', 'completed'),
(8, 4, 'سعيد', 'نجيب', 'ahmed62@mahmoud.net', 'مدينة نصر', 'شارع حنان السعيد', '62', '1229697115', NULL, NULL, '2024-09-24 19:48:17', 'completed'),
(9, 4, 'إخلاص', 'عبد الحميد', 'hashem.karim@karam.info', 'باب الشعرية', 'شارع عوف عبد الناصر', '42', '1241917318', NULL, NULL, '2024-09-24 19:48:17', 'cancelled'),
(10, 4, 'فاطمة', 'عز الدين', 'hfahmy@hotmail.com', 'الجزيرة', 'شارع نعيم جمال الدين', '22', '1029234974', NULL, NULL, '2024-09-24 19:48:17', 'completed'),
(11, 4, 'أمين', 'السايس', 'hazem.ramah@bayoumi.come.eg', 'الرحاب', 'ممر أريج السويلم', '27', '1593122466', NULL, NULL, '2024-09-24 19:48:17', 'pending'),
(12, 4, 'هاني', 'عبد الكريم', 'bayoumi.hashem@gmail.com', 'العباسية', 'شارع عصام جمال الدين', '96', '1581930529', NULL, NULL, '2024-09-24 19:48:17', 'pending'),
(13, 4, 'مختار', 'عبد المطلب', 'hashem52@mostafa.org', 'المعصرة', 'ممر توفيق عز العرب', '18', '1094925330', NULL, NULL, '2024-09-24 19:48:17', 'pending'),
(14, 4, 'هشام', 'عبد العزيز', 'ebayoumi@selim.org', 'الأزبكية', 'شارع ايوب عبد المهيمن', '13', '1233739741', NULL, NULL, '2024-09-24 19:48:17', 'pending'),
(15, 4, 'ديما', 'عبد الهادي', 'ramah.dina@fahmy.info', 'فيصل', 'ممر نعمه عبد اللطيف', '90', '1240701579', NULL, NULL, '2024-09-24 19:48:17', 'in_progress'),
(16, 5, 'ساجدة', 'عبد الرؤوف', 'hazem.karim@hotmail.com', 'فيصل', 'ممر ليندا رجائي', '52', '1263860916', NULL, NULL, '2024-09-24 19:48:17', 'pending'),
(17, 5, 'حبيبة', 'جبر', 'aramah@yahoo.com', 'الوايلي', 'ممر لبيب السعيد', '68', '1192338966', NULL, NULL, '2024-09-24 19:48:17', 'pending'),
(18, 5, 'ريما', 'السقا', 'maged38@yahoo.com', 'النزهة الجديدة', 'شارع مياده عبد القادر', '98', '1050174753', NULL, NULL, '2024-09-24 19:48:17', 'completed'),
(19, 5, 'هادي', 'عبد الناصر', 'fahmy.hashem@hotmail.com', 'الساحل', 'شارع اياس مجاهد', '40', '1220591332', NULL, NULL, '2024-09-24 19:48:17', 'cancelled'),
(20, 5, 'لبنا', 'عبد الباسط', 'kyoussef@carmen.come.eg', 'السلام', 'طريق حياة السقا', '34', '1587853876', NULL, NULL, '2024-09-24 19:48:17', 'completed'),
(21, 5, 'سليم', 'الكفراوي', 'iahmed@rakeen.come.eg', 'باب اللوق', 'طريق محي عبد اللطيف', '13', '1243362288', NULL, NULL, '2024-09-24 19:48:17', 'cancelled'),
(22, 5, 'هيثم', 'شافع', 'ehab.dina@hotmail.com', 'العباسية', 'طريق عدلي الصعيدي', '35', '1577440330', NULL, NULL, '2024-09-24 19:48:17', 'in_progress'),
(23, 5, 'حامد', 'طلال', 'hani.ahmed@gmail.com', 'المظلات', 'طريق ميادة مكي', '78', '1162739128', NULL, NULL, '2024-09-24 19:48:17', 'in_progress'),
(24, 5, 'مياده', 'مظهر', 'selim.ahmed@mostafa.come.eg', 'الأزبكية', 'طريق عماد مجاهد', '49', '1274543623', NULL, NULL, '2024-09-24 19:48:17', 'cancelled'),
(25, 5, 'ميرا', 'عبد الحليم', 'mahmoud.ehab@ezz.net', 'التجمع التالت', 'شارع عمر صدام', '6', '1014661817', NULL, NULL, '2024-09-24 19:48:17', 'completed'),
(26, 6, 'يارا', 'الداوود', 'belsherbiny@gmail.com', 'سراي القبة', 'شارع أبراهيم فواز', '33', '1265987568', NULL, NULL, '2024-09-24 19:48:17', 'completed'),
(27, 6, 'راجح', 'جمال الدين', 'dina.younes@elshamy.biz', 'المطرية', 'ممر نعمه رجائي', '21', '1014034989', NULL, NULL, '2024-09-24 19:48:17', 'cancelled'),
(28, 6, 'دنيا', 'عبد الناصر', 'maged60@yahoo.com', 'ثكنات المعادي', 'ممر ميرفت جمال الدين', '58', '1558922216', NULL, NULL, '2024-09-24 19:48:17', 'cancelled'),
(29, 6, 'اسماعيل', 'غانم', 'saif.bayoumi@ehab.biz', 'فيصل', 'ممر قارس عبد المعطي', '12', '1239474319', NULL, NULL, '2024-09-24 19:48:17', 'completed'),
(30, 6, 'تقوى', 'رجائي', 'trizk@ramzy.info', 'العتبة', 'طريق شهاب الداوود', '39', '1258811879', NULL, NULL, '2024-09-24 19:48:17', 'pending'),
(31, 6, 'سيما', 'عبد الرزاق', 'dina.karam@tharwat.info', 'عزبة النخل', 'شارع مشيرة جمال الدين', '72', '1257316599', NULL, NULL, '2024-09-24 19:48:17', 'in_progress'),
(32, 6, 'رأفت', 'عبد الرحمن', 'hashem27@hotmail.com', 'هارون', 'طريق ضرغام الصعيدي', '10', '1587669877', NULL, NULL, '2024-09-24 19:48:17', 'completed'),
(33, 6, 'مريام', 'عمران', 'wahmed@yahoo.com', 'جسر السويس', 'ممر هانى حارث', '44', '1291119764', NULL, NULL, '2024-09-24 19:48:17', 'cancelled'),
(34, 6, 'ميار', 'عبد المجيد', 'basma.mahmoud@tharwat.come.eg', 'عبده باشا', 'ممر صبرين رجائي', '49', '1021532532', NULL, NULL, '2024-09-24 19:48:17', 'in_progress'),
(35, 6, 'أريج', 'عبد الجواد', 'tharwat.hashem@hotmail.com', 'كلية البنات', 'طريق رويدة عبد الكريم', '55', '1082819466', NULL, NULL, '2024-09-24 19:48:17', 'pending');

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
(1, 1, 3, 4, '31.00', '29.45'),
(2, 1, 15, 2, '25.00', '23.75'),
(3, 2, 11, 5, '39.00', '35.10'),
(4, 2, 14, 1, '41.00', '36.90'),
(5, 3, 14, 5, '41.00', '36.90'),
(6, 4, 16, 5, '46.00', '36.80'),
(7, 4, 4, 2, '45.00', '36.00'),
(8, 5, 11, 5, '39.00', '31.20'),
(9, 5, 1, 4, '33.00', '26.40'),
(10, 5, 10, 4, '45.00', '36.00'),
(11, 6, 9, 2, '35.00', '33.25'),
(12, 6, 2, 4, '30.00', '28.50'),
(13, 7, 11, 5, '39.00', '37.05'),
(14, 8, 13, 1, '22.00', '20.90'),
(15, 8, 1, 4, '33.00', '31.35'),
(16, 9, 6, 1, '31.00', '29.45'),
(17, 9, 11, 4, '39.00', '37.05'),
(18, 10, 5, 1, '49.00', '44.10'),
(19, 10, 4, 3, '45.00', '40.50'),
(20, 10, 12, 2, '38.00', '34.20'),
(21, 11, 2, 1, '30.00', '28.50'),
(22, 11, 5, 3, '49.00', '46.55'),
(23, 12, 14, 4, '41.00', '32.80'),
(24, 12, 7, 5, '20.00', '16.00'),
(25, 12, 4, 3, '45.00', '36.00'),
(26, 13, 3, 3, '31.00', '31.00'),
(27, 14, 7, 4, '20.00', '16.00'),
(28, 14, 10, 1, '45.00', '36.00'),
(29, 14, 12, 5, '38.00', '30.40'),
(30, 15, 4, 3, '45.00', '36.00'),
(31, 15, 11, 4, '39.00', '31.20'),
(32, 15, 4, 3, '45.00', '36.00'),
(33, 16, 11, 1, '39.00', '39.00'),
(34, 16, 7, 1, '20.00', '20.00'),
(35, 17, 8, 1, '48.00', '48.00'),
(36, 17, 10, 1, '45.00', '45.00'),
(37, 18, 5, 4, '49.00', '39.20'),
(38, 18, 10, 5, '45.00', '36.00'),
(39, 19, 13, 5, '22.00', '20.90'),
(40, 19, 2, 1, '30.00', '28.50'),
(41, 20, 13, 4, '22.00', '19.80'),
(42, 20, 8, 2, '48.00', '43.20'),
(43, 20, 15, 4, '25.00', '22.50'),
(44, 21, 4, 1, '45.00', '45.00'),
(45, 21, 7, 1, '20.00', '20.00'),
(46, 22, 1, 1, '33.00', '33.00'),
(47, 23, 4, 2, '45.00', '42.75'),
(48, 23, 8, 1, '48.00', '45.60'),
(49, 23, 4, 1, '45.00', '42.75'),
(50, 24, 9, 4, '35.00', '28.00'),
(51, 24, 11, 5, '39.00', '31.20'),
(52, 24, 10, 5, '45.00', '36.00'),
(53, 25, 13, 3, '22.00', '22.00'),
(54, 26, 7, 4, '20.00', '19.00'),
(55, 26, 2, 4, '30.00', '28.50'),
(56, 27, 10, 4, '45.00', '42.75'),
(57, 28, 11, 5, '39.00', '37.05'),
(58, 29, 13, 4, '22.00', '20.90'),
(59, 29, 15, 4, '25.00', '23.75'),
(60, 30, 12, 4, '38.00', '36.10'),
(61, 31, 3, 4, '31.00', '24.80'),
(62, 31, 4, 1, '45.00', '36.00'),
(63, 31, 4, 3, '45.00', '36.00'),
(64, 32, 7, 2, '20.00', '20.00'),
(65, 32, 3, 1, '31.00', '31.00'),
(66, 33, 9, 3, '35.00', '33.25'),
(67, 33, 1, 1, '33.00', '31.35'),
(68, 33, 14, 1, '41.00', '38.95'),
(69, 34, 3, 5, '31.00', '24.80'),
(70, 34, 11, 4, '39.00', '31.20'),
(71, 35, 11, 2, '39.00', '39.00');

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
(1, 3, '01563921706'),
(2, 3, '01563921706'),
(3, 3, '01563921706'),
(4, 4, '01133007160'),
(5, 4, '01133007160'),
(6, 4, '01133007160'),
(7, 5, '01550154203'),
(8, 5, '01550154203'),
(9, 6, '01137513033'),
(10, 6, '01137513033'),
(11, 6, '01137513033');

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
(3, 'customer', 'راغب', 'عز الدين', 'customer1@perfect-food.com', '$2y$10$e1XzBt99GLMhZcMRBllSGu8smWaHoNn6PJYBOjDovMCJJjpLiNTyO', 'عزبة النخل', 'شارع اسماعيل عز العرب', '52', '2024-09-24 19:48:17'),
(4, 'customer', 'ديما', 'عبد القادر', 'customer2@perfect-food.com', '$2y$10$lFfUXpmK0hFmIcBdXWiCfOpLI1mp3ICsV2Ft5OusrV2e714QDz3IO', 'المقطم', 'طريق وسيم عبد السلام', '92', '2024-09-24 19:48:17'),
(5, 'customer', 'منتصر', 'عبد الحليم', 'customer3@perfect-food.com', '$2y$10$kM9NDAOfcMVdINVDLgbYIOuyG0HGHWLCgfmggA0JVUzhQ8ZtGICFO', 'السلام', 'طريق ضحى عبد الجواد', '29', '2024-09-24 19:48:17'),
(6, 'customer', 'رانا', 'عبد الكريم', 'customer4@perfect-food.com', '$2y$10$jZVANP6zKQ3..0k8tYeT7uG/ivxzaoMqFmXxeJ0WOFmTCEl/3BdWW', 'هارون', 'ممر رولى عبد المهيمن', '69', '2024-09-24 19:48:17');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `phones`
--
ALTER TABLE `phones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
