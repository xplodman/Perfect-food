-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 24, 2024 at 07:51 PM
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
(1, 4, 5, '2024-10-16', '02:36:25', 7, '2024-09-24 19:51:52', 'pending'),
(2, 5, 1, '2024-10-21', '05:10:33', 10, '2024-09-24 19:51:52', 'pending'),
(3, 3, 4, '2024-08-27', '21:33:54', 1, '2024-09-24 19:51:52', 'cancelled'),
(4, 3, 1, '2024-09-06', '00:54:13', 9, '2024-09-24 19:51:52', 'completed'),
(5, 4, 2, '2024-10-21', '11:10:47', 6, '2024-09-24 19:51:52', 'in_progress'),
(6, 4, 5, '2024-10-20', '11:53:47', 3, '2024-09-24 19:51:52', 'pending'),
(7, 5, 4, '2024-10-09', '04:11:59', 9, '2024-09-24 19:51:52', 'pending'),
(8, 6, 5, '2024-09-13', '06:40:28', 10, '2024-09-24 19:51:52', 'completed'),
(9, 4, 1, '2024-10-23', '04:06:25', 7, '2024-09-24 19:51:52', 'in_progress'),
(10, 4, 3, '2024-10-09', '18:11:22', 4, '2024-09-24 19:51:52', 'pending'),
(11, 3, 1, '2024-08-31', '08:46:33', 2, '2024-09-24 19:51:52', 'cancelled'),
(12, 8, 5, '2024-10-13', '07:05:25', 7, '2024-09-24 19:51:52', 'pending'),
(13, 4, 2, '2024-09-17', '18:56:51', 6, '2024-09-24 19:51:52', 'cancelled'),
(14, 5, 1, '2024-09-21', '21:53:28', 3, '2024-09-24 19:51:52', 'completed'),
(15, 7, 4, '2024-09-28', '06:40:35', 8, '2024-09-24 19:51:52', 'pending'),
(16, 3, 5, '2024-10-17', '05:44:24', 10, '2024-09-24 19:51:52', 'in_progress'),
(17, 3, 1, '2024-10-01', '10:50:16', 5, '2024-09-24 19:51:52', 'in_progress'),
(18, 4, 3, '2024-09-25', '11:16:01', 10, '2024-09-24 19:51:52', 'pending'),
(19, 6, 1, '2024-09-11', '04:29:47', 8, '2024-09-24 19:51:52', 'completed'),
(20, 8, 3, '2024-10-22', '20:02:45', 8, '2024-09-24 19:51:52', 'pending'),
(21, 3, 2, '2024-10-18', '02:29:49', 4, '2024-09-24 19:51:52', 'in_progress'),
(22, 7, 1, '2024-09-19', '04:27:59', 7, '2024-09-24 19:51:52', 'completed'),
(23, 8, 3, '2024-10-14', '10:22:17', 1, '2024-09-24 19:51:52', 'in_progress'),
(24, 5, 2, '2024-09-22', '10:16:36', 4, '2024-09-24 19:51:52', 'completed'),
(25, 6, 2, '2024-09-03', '12:07:04', 6, '2024-09-24 19:51:52', 'completed'),
(26, 6, 2, '2024-09-03', '21:01:16', 3, '2024-09-24 19:51:52', 'completed'),
(27, 6, 4, '2024-10-02', '08:02:47', 3, '2024-09-24 19:51:52', 'in_progress'),
(28, 5, 5, '2024-08-28', '11:22:31', 7, '2024-09-24 19:51:52', 'completed'),
(29, 4, 4, '2024-09-30', '17:06:30', 3, '2024-09-24 19:51:53', 'pending'),
(30, 4, 1, '2024-09-11', '04:08:38', 6, '2024-09-24 19:51:53', 'cancelled'),
(31, 5, 2, '2024-10-24', '10:31:55', 6, '2024-09-24 19:51:53', 'in_progress'),
(32, 3, 3, '2024-10-03', '11:55:39', 5, '2024-09-24 19:51:53', 'pending'),
(33, 8, 1, '2024-10-08', '03:26:21', 9, '2024-09-24 19:51:53', 'in_progress'),
(34, 8, 5, '2024-09-13', '12:02:34', 7, '2024-09-24 19:51:53', 'cancelled'),
(35, 4, 1, '2024-09-12', '09:57:39', 5, '2024-09-24 19:51:53', 'completed'),
(36, 7, 1, '2024-10-17', '02:31:47', 6, '2024-09-24 19:51:53', 'in_progress'),
(37, 6, 2, '2024-10-01', '21:07:41', 9, '2024-09-24 19:51:53', 'pending');

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
(1, 5, NULL, 3, 'مكان متوسط، الخدمة كانت مقبولة.', '2024-09-24 19:51:51'),
(2, 10, NULL, 2, 'كانت زيارة مخيبة. تحتاج إلى تحسين.', '2024-09-24 19:51:51'),
(3, 15, NULL, 4, 'قيمة جيدة مقابل المال، استمتعت بالأجواء المحلية.', '2024-09-24 19:51:51'),
(4, 16, NULL, 5, 'أحببتها تمامًا! الأجواء والموظفون كانوا ممتازين.', '2024-09-24 19:51:51'),
(5, 19, NULL, 5, 'أحببتها تمامًا! الأجواء والموظفون كانوا ممتازين.', '2024-09-24 19:51:51'),
(6, 22, NULL, 5, 'خدمة استثنائية وطعام رائع! مكان يجب زيارته في القاهرة.', '2024-09-24 19:51:51'),
(7, 23, NULL, 4, 'تجربة جيدة، لكن الطعام كان يحتاج إلى مزيد من النكهة.', '2024-09-24 19:51:51'),
(8, 28, NULL, 1, 'خدمة العملاء كانت سيئة للغاية، لم أستمتع بزيارتي.', '2024-09-24 19:51:51'),
(9, 29, NULL, 5, 'أحببتها تمامًا! الأجواء والموظفون كانوا ممتازين.', '2024-09-24 19:51:51'),
(10, 32, NULL, 4, 'موقع رائع وأطباق لذيذة، سأعود مرة أخرى!', '2024-09-24 19:51:51'),
(11, 43, NULL, 3, 'تجربة عادية، لا شيء مميز حقًا.', '2024-09-24 19:51:51'),
(12, 44, NULL, 3, 'جيد، لكنني وجدت خيارات أفضل في الجوار.', '2024-09-24 19:51:51'),
(13, NULL, 4, 1, 'أسوأ تجربة تناول طعام مررت بها في مصر.', '2024-09-24 19:51:52'),
(14, NULL, 8, 5, 'خدمة استثنائية وطعام رائع!', '2024-09-24 19:51:52'),
(15, NULL, 14, 3, 'تجربة عادية، لا شيء مميز حقًا.', '2024-09-24 19:51:52'),
(16, NULL, 19, 2, 'مخيبة للآمال. الخدمة كانت بطيئة والطعام كان بارداً.', '2024-09-24 19:51:52'),
(17, NULL, 22, 4, 'تجربة جيدة جدًا، لكن الانتظار كان طويلاً قليلاً.', '2024-09-24 19:51:52'),
(18, NULL, 24, 1, 'أسوأ تجربة تناول طعام مررت بها في مصر.', '2024-09-24 19:51:52'),
(19, NULL, 25, 5, 'خدمة استثنائية وطعام رائع!', '2024-09-24 19:51:52'),
(20, NULL, 26, 1, 'أسوأ تجربة تناول طعام مررت بها في مصر.', '2024-09-24 19:51:52'),
(21, NULL, 28, 5, 'خدمة استثنائية وطعام رائع!', '2024-09-24 19:51:53'),
(22, NULL, 35, 5, 'خدمة استثنائية وطعام رائع!', '2024-09-24 19:51:53');

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
(1, 3, 'صفا', 'غالب', 'ahmed02@elshamy.com', 'إمبابة', 'ممر ميادة عبد الحليم', '59', '1034026370', NULL, NULL, '2024-09-24 19:51:51', 'in_progress'),
(2, 3, 'إخلاص', 'السايس', 'ramah.maged@gmail.com', 'الموسكي', 'شارع صفية عبد الكريم', '44', '1159506447', NULL, NULL, '2024-09-24 19:51:51', 'in_progress'),
(3, 3, 'فهد', 'طلال', 'ahmed.youssef@bayoumi.org', 'عين شمس', 'ممر سماح السايس', '59', '1504624618', NULL, NULL, '2024-09-24 19:51:51', 'cancelled'),
(4, 3, 'وداد', 'جمال الدين', 'ramah.karim@abdulaziz.net', 'العباسية', 'طريق جلال عمران', '23', '1590611088', NULL, NULL, '2024-09-24 19:51:51', 'cancelled'),
(5, 3, 'سالم', 'مجاهد', 'carmen.hani@ezz.org', 'زهراء المعادي', 'طريق طاهر السايس', '95', '1084628884', NULL, NULL, '2024-09-24 19:51:51', 'completed'),
(6, 3, 'غيداء', 'كاظم', 'jfahmy@yahoo.com', 'ثكنات المعادي', 'طريق غازي مظهر', '85', '1049913295', NULL, NULL, '2024-09-24 19:51:51', 'cancelled'),
(7, 3, 'فراس', 'عمران', 'bayoumi.karim@gmail.com', 'الأزبكية', 'شارع حبيبة عبد المجيد', '56', '1519736291', NULL, NULL, '2024-09-24 19:51:51', 'cancelled'),
(8, 4, 'حسان', 'عبد المجيد', 'eezz@gmail.com', 'المعادي', 'شارع أنس حارث', '78', '1514577977', NULL, NULL, '2024-09-24 19:51:51', 'pending'),
(9, 4, 'مصطفى', 'عبد الباسط', 'hani.abdulaziz@tharwat.org', 'شبرا', 'ممر هدى رسلان', '37', '1212143951', NULL, NULL, '2024-09-24 19:51:51', 'in_progress'),
(10, 4, 'لمى', 'فواز', 'hazem.karim@hotmail.com', 'الجيش', 'ممر لبيب عبد الحليم', '91', '1195561906', NULL, NULL, '2024-09-24 19:51:51', 'completed'),
(11, 4, 'معتز', 'مظهر', 'otharwat@gmail.com', 'الزاوية الحمراء', 'ممر ملاك عبد الجواد', '71', '1562195438', NULL, NULL, '2024-09-24 19:51:51', 'cancelled'),
(12, 4, 'ديانا', 'كاظم', 'syounes@hotmail.com', 'الوايلي', 'طريق ريان عبد السلام', '24', '1005617128', NULL, NULL, '2024-09-24 19:51:51', 'pending'),
(13, 4, 'ادم', 'عز الدين', 'mahmoud.rakeen@mahmoud.org', 'المنيب', 'شارع اسلام السقا', '31', '1026717611', NULL, NULL, '2024-09-24 19:51:51', 'cancelled'),
(14, 4, 'إنعام', 'عبد الجليل', 'ahmed64@hotmail.com', 'المطرية', 'شارع هاشم عبد الحليم', '91', '1526330442', NULL, NULL, '2024-09-24 19:51:51', 'pending'),
(15, 4, 'هنا', 'عز الدين', 'hani29@karam.org', 'باب اللوق', 'طريق إيناس جمال الدين', '75', '1070960025', NULL, NULL, '2024-09-24 19:51:51', 'completed'),
(16, 4, 'لونا', 'عز العرب', 'shazem@hotmail.com', 'الدقي', 'شارع لميس عبد الرزاق', '34', '1033253746', NULL, NULL, '2024-09-24 19:51:51', 'completed'),
(17, 4, 'فريدة', 'عز الدين', 'mohamed04@yahoo.com', 'عبود', 'شارع صلاح السقا', '61', '1016186089', NULL, NULL, '2024-09-24 19:51:51', 'in_progress'),
(18, 5, 'فيفيان', 'هوساوي', 'ehab85@yahoo.com', 'السلام', 'ممر سجى عبد العزيز', '66', '1565652026', NULL, NULL, '2024-09-24 19:51:51', 'in_progress'),
(19, 5, 'نوال', 'الكفراوي', 'maged19@yahoo.com', 'العباسية', 'شارع سهير حارث', '19', '1584353597', NULL, NULL, '2024-09-24 19:51:51', 'completed'),
(20, 5, 'صفوان', 'عبد العزيز', 'hashem94@yahoo.com', 'زهراء المعادي', 'طريق لورينا عبد المطلب', '8', '1154917180', NULL, NULL, '2024-09-24 19:51:51', 'in_progress'),
(21, 5, 'علياء', 'عبد الرحيم', 'mostafa80@hotmail.com', 'هارون', 'طريق وحيد عبد الحليم', '84', '1299991541', NULL, NULL, '2024-09-24 19:51:51', 'cancelled'),
(22, 5, 'مديحة', 'غانم', 'ehab73@yahoo.com', 'فيصل', 'شارع علاء السباعي', '3', '1562206772', NULL, NULL, '2024-09-24 19:51:51', 'completed'),
(23, 5, 'شفاء', 'الداوود', 'ehab.dina@gmail.com', 'حلمية الزيتون', 'ممر نبيله عبد الرحيم', '43', '1292278398', NULL, NULL, '2024-09-24 19:51:51', 'completed'),
(24, 5, 'شهد', 'عمران', 'rselim@yahoo.com', 'العباسية', 'طريق دينا عبد المعطي', '92', '1132817189', NULL, NULL, '2024-09-24 19:51:51', 'pending'),
(25, 5, 'سلمان', 'عزيز', 'karim01@hemeida.com', 'الكيت كات', 'شارع أميرة عز العرب', '10', '1592487817', NULL, NULL, '2024-09-24 19:51:51', 'pending'),
(26, 5, 'هدى', 'عبد العزيز', 'yelshamy@yahoo.com', 'الساحل', 'شارع شادي الكفراوي', '1', '1553916601', NULL, NULL, '2024-09-24 19:51:51', 'pending'),
(27, 6, 'رائد', 'عبد المهيمن', 'mostafa.ehab@elshamy.eg', 'باب اللوق', 'شارع اسامة عز العرب', '80', '1218782503', NULL, NULL, '2024-09-24 19:51:51', 'cancelled'),
(28, 6, 'نادية', 'رسلان', 'maged.abdulaziz@karam.eg', 'الدقي', 'طريق جميل عز العرب', '97', '1089752224', NULL, NULL, '2024-09-24 19:51:51', 'completed'),
(29, 6, 'عهد', 'عبد اللطيف', 'qelshamy@hotmail.com', 'المعادي', 'طريق مبارك رسلان', '94', '1516033493', NULL, NULL, '2024-09-24 19:51:51', 'completed'),
(30, 6, 'شهم', 'عبد الله', 'karim.ehab@ezz.com', 'المطرية', 'شارع مهاب عبد الحميد', '65', '1168115188', NULL, NULL, '2024-09-24 19:51:51', 'in_progress'),
(31, 6, 'لمى', 'عبد اللطيف', 'ahmed.rakeen@hazem.eg', 'عبود', 'شارع جلال عبد الرؤوف', '66', '1128635976', NULL, NULL, '2024-09-24 19:51:51', 'cancelled'),
(32, 6, 'ميساء', 'عبد السلام', 'hashem16@yahoo.com', 'الظاهر', 'طريق أمين الكفراوي', '44', '1004530053', NULL, NULL, '2024-09-24 19:51:51', 'completed'),
(33, 6, 'أسيل', 'هوساوي', 'rakeen.maged@youssef.org', 'المظلات', 'طريق صباح عز العرب', '67', '1236312233', NULL, NULL, '2024-09-24 19:51:51', 'pending'),
(34, 6, 'احسان', 'السقا', 'fahmy.saif@hotmail.com', 'عزبة النخل', 'طريق اديب عبد الله', '85', '1082872432', NULL, NULL, '2024-09-24 19:51:51', 'in_progress'),
(35, 7, 'هنا', 'عبد الكريم', 'younes.mahmoud@bayoumi.org', 'الرحاب', 'طريق صادق السايس', '91', '1071117468', NULL, NULL, '2024-09-24 19:51:51', 'pending'),
(36, 7, 'خلف', 'السعيد', 'xehab@ramzy.biz', 'ثكنات المعادي', 'شارع صلاح الدين عبد القادر', '81', '1553247648', NULL, NULL, '2024-09-24 19:51:51', 'cancelled'),
(37, 7, 'إخلاص', 'فواز', 'rbayoumi@yahoo.com', 'الزاوية الحمراء', 'ممر صفاء عبد الناصر', '61', '1271760645', NULL, NULL, '2024-09-24 19:51:51', 'in_progress'),
(38, 7, 'مؤمن', 'زين العابدين', 'mtharwat@ezz.org', 'التجمع التالت', 'ممر راغب عبد الفتاح', '90', '1246467580', NULL, NULL, '2024-09-24 19:51:51', 'cancelled'),
(39, 7, 'لؤي', 'الكفراوي', 'saif61@yahoo.com', 'عزبة النخل', 'ممر إيمان مكي', '96', '1172976885', NULL, NULL, '2024-09-24 19:51:51', 'in_progress'),
(40, 8, 'رامز', 'زين العابدين', 'maged78@yahoo.com', 'شبرا', 'ممر أفنان الداوود', '92', '1501838384', NULL, NULL, '2024-09-24 19:51:51', 'cancelled'),
(41, 8, 'معتز', 'مجاهد', 'ahmed20@ahmed.come.eg', 'الموسكي', 'ممر ماهر السايس', '96', '1535845780', NULL, NULL, '2024-09-24 19:51:51', 'cancelled'),
(42, 8, 'غيث', 'زين العابدين', 'iyounes@karim.org', 'عزبة النخل', 'ممر آية صدام', '5', '1065111738', NULL, NULL, '2024-09-24 19:51:51', 'in_progress'),
(43, 8, 'تقوى', 'حارث', 'dina75@hotmail.com', 'المرج', 'طريق علياء هوساوي', '54', '1577727340', NULL, NULL, '2024-09-24 19:51:51', 'completed'),
(44, 8, 'نادين', 'جبر', 'karim.hashem@ramah.info', 'السيدة زينب', 'طريق مجد عبد القادر', '36', '1563908996', NULL, NULL, '2024-09-24 19:51:51', 'completed'),
(45, 8, 'تقى', 'عبد السلام', 'ezz.ehab@abdulaziz.eg', 'الزاوية الحمراء', 'شارع سجى عبد الجواد', '22', '1591832087', NULL, NULL, '2024-09-24 19:51:51', 'cancelled'),
(46, 8, 'رنده', 'مظهر', 'rramah@elshamy.info', 'العاشر من رمضان', 'ممر نانسي عبد الكريم', '80', '1566362686', NULL, NULL, '2024-09-24 19:51:51', 'cancelled'),
(47, 8, 'رغد', 'عبد السلام', 'hashem80@mahmoud.org', 'السيدة زينب', 'ممر حبيب الصعيدي', '68', '1168934627', NULL, NULL, '2024-09-24 19:51:51', 'in_progress');

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
(1, 1, 10, 4, '45.00', '40.50'),
(2, 1, 6, 3, '31.00', '27.90'),
(3, 2, 16, 1, '46.00', '43.70'),
(4, 2, 4, 3, '45.00', '42.75'),
(5, 3, 13, 1, '22.00', '20.90'),
(6, 3, 13, 4, '22.00', '20.90'),
(7, 4, 7, 3, '20.00', '16.00'),
(8, 4, 9, 1, '35.00', '28.00'),
(9, 4, 5, 5, '49.00', '39.20'),
(10, 5, 10, 4, '45.00', '36.00'),
(11, 5, 7, 5, '20.00', '16.00'),
(12, 5, 13, 2, '22.00', '17.60'),
(13, 6, 6, 3, '31.00', '29.45'),
(14, 6, 2, 3, '30.00', '28.50'),
(15, 7, 7, 1, '20.00', '20.00'),
(16, 8, 6, 4, '31.00', '29.45'),
(17, 9, 1, 2, '33.00', '29.70'),
(18, 9, 10, 4, '45.00', '40.50'),
(19, 10, 11, 2, '39.00', '39.00'),
(20, 11, 10, 1, '45.00', '45.00'),
(21, 12, 9, 4, '35.00', '31.50'),
(22, 12, 14, 2, '41.00', '36.90'),
(23, 13, 11, 2, '39.00', '35.10'),
(24, 13, 3, 5, '31.00', '27.90'),
(25, 14, 15, 1, '25.00', '25.00'),
(26, 15, 6, 2, '31.00', '24.80'),
(27, 15, 8, 3, '48.00', '38.40'),
(28, 15, 16, 4, '46.00', '36.80'),
(29, 16, 1, 3, '33.00', '26.40'),
(30, 16, 8, 5, '48.00', '38.40'),
(31, 17, 13, 4, '22.00', '22.00'),
(32, 18, 15, 1, '25.00', '20.00'),
(33, 18, 16, 5, '46.00', '36.80'),
(34, 18, 8, 5, '48.00', '38.40'),
(35, 19, 16, 4, '46.00', '41.40'),
(36, 19, 9, 3, '35.00', '31.50'),
(37, 20, 16, 3, '46.00', '36.80'),
(38, 20, 12, 5, '38.00', '30.40'),
(39, 21, 1, 5, '33.00', '26.40'),
(40, 21, 4, 4, '45.00', '36.00'),
(41, 22, 13, 4, '22.00', '20.90'),
(42, 22, 7, 1, '20.00', '19.00'),
(43, 23, 13, 1, '22.00', '19.80'),
(44, 23, 16, 4, '46.00', '41.40'),
(45, 23, 5, 1, '49.00', '44.10'),
(46, 24, 8, 1, '48.00', '48.00'),
(47, 25, 13, 1, '22.00', '17.60'),
(48, 25, 14, 5, '41.00', '32.80'),
(49, 25, 6, 4, '31.00', '24.80'),
(50, 26, 9, 5, '35.00', '31.50'),
(51, 26, 13, 4, '22.00', '19.80'),
(52, 27, 3, 2, '31.00', '27.90'),
(53, 27, 14, 3, '41.00', '36.90'),
(54, 27, 13, 3, '22.00', '19.80'),
(55, 28, 8, 1, '48.00', '48.00'),
(56, 29, 2, 5, '30.00', '27.00'),
(57, 29, 8, 1, '48.00', '43.20'),
(58, 29, 1, 2, '33.00', '29.70'),
(59, 30, 7, 2, '20.00', '19.00'),
(60, 30, 2, 3, '30.00', '28.50'),
(61, 31, 8, 5, '48.00', '38.40'),
(62, 31, 12, 2, '38.00', '30.40'),
(63, 32, 6, 1, '31.00', '29.45'),
(64, 32, 6, 5, '31.00', '29.45'),
(65, 33, 16, 2, '46.00', '46.00'),
(66, 34, 12, 4, '38.00', '30.40'),
(67, 34, 15, 2, '25.00', '20.00'),
(68, 34, 16, 4, '46.00', '36.80'),
(69, 35, 7, 2, '20.00', '20.00'),
(70, 35, 16, 1, '46.00', '46.00'),
(71, 36, 1, 5, '33.00', '31.35'),
(72, 37, 5, 3, '49.00', '44.10'),
(73, 37, 7, 4, '20.00', '18.00'),
(74, 38, 7, 5, '20.00', '20.00'),
(75, 39, 13, 5, '22.00', '20.90'),
(76, 39, 13, 4, '22.00', '20.90'),
(77, 40, 3, 3, '31.00', '29.45'),
(78, 40, 1, 2, '33.00', '31.35'),
(79, 41, 9, 4, '35.00', '28.00'),
(80, 41, 16, 1, '46.00', '36.80'),
(81, 41, 12, 5, '38.00', '30.40'),
(82, 42, 6, 1, '31.00', '24.80'),
(83, 42, 1, 4, '33.00', '26.40'),
(84, 42, 16, 3, '46.00', '36.80'),
(85, 43, 8, 2, '48.00', '48.00'),
(86, 44, 1, 5, '33.00', '31.35'),
(87, 45, 12, 5, '38.00', '34.20'),
(88, 45, 8, 1, '48.00', '43.20'),
(89, 45, 1, 1, '33.00', '29.70'),
(90, 46, 2, 5, '30.00', '28.50'),
(91, 46, 14, 1, '41.00', '38.95'),
(92, 47, 8, 2, '48.00', '38.40'),
(93, 47, 2, 3, '30.00', '24.00'),
(94, 47, 1, 4, '33.00', '26.40');

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
(1, 3, '01517451676'),
(2, 3, '01517451676'),
(3, 3, '01517451676'),
(4, 4, '01250228007'),
(5, 4, '01250228007'),
(6, 5, '01049162003'),
(7, 6, '01214581025'),
(8, 7, '01561284594'),
(9, 8, '01058186405'),
(10, 8, '01058186405');

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
(3, 'customer', 'أسيل', 'الكفراوي', 'customer1@perfect-food.com', '$2y$10$CIio0BZ5Y2gXtAsNqkkJHe32Du8F93Yd6.THcMyMxpmQuriq78S5y', 'كوتسيكا', 'ممر رامي جبر', '5', '2024-09-24 19:51:51'),
(4, 'customer', 'شيماء', 'رسلان', 'customer2@perfect-food.com', '$2y$10$D5PbCS5U0SRsG/.Y38zUqOfohFHqPD11H8JqYRASVssVNAMZE/ea2', 'التجمع التالت', 'طريق وصفي عبد الفتاح', '90', '2024-09-24 19:51:51'),
(5, 'customer', 'أحلام', 'عزمي', 'customer3@perfect-food.com', '$2y$10$5uqZFagB8JCrzUyChMtz2egvzMJC/zh1RX/uRBZdL7TB3yKgKKGDy', 'ألف مسكن', 'طريق آية عبد الرحيم', '22', '2024-09-24 19:51:51'),
(6, 'customer', 'محمد ', 'رجائي', 'customer4@perfect-food.com', '$2y$10$nzLQlwDGusb3njkHldOXYOd.ecEItnvoqzsvH2ZMmCKtAs8s/7.k2', 'عبود', 'شارع عصام عبد السلام', '8', '2024-09-24 19:51:51'),
(7, 'customer', 'مرام', 'السباعي', 'customer5@perfect-food.com', '$2y$10$cHk2Ndmoc2hSLjAAxoxO/OGnmYh0KtiKjirX5BCTrttfsATZfc9Z2', 'الشيخ زايد', 'شارع ماهر السايس', '100', '2024-09-24 19:51:51'),
(8, 'customer', 'فاطمة', 'عبد الناصر', 'customer6@perfect-food.com', '$2y$10$VBrCt2H57Q75UA3Ag4cHHOVOqoQZG4rxMbDLqlMdTS6mMXyxSY0gq', 'جاردن سيتي', 'ممر إخلاص عبد الجليل', '39', '2024-09-24 19:51:51');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `evaluations`
--
ALTER TABLE `evaluations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `phones`
--
ALTER TABLE `phones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
