-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 08, 2024 at 09:22 PM
-- Server version: 8.0.40-0ubuntu0.22.04.1
-- PHP Version: 8.1.30

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

--
-- Dumping data for table `evaluations`
--

INSERT INTO `evaluations` (`id`, `order_id`, `reservation_id`, `rating`, `comment`, `created_at`) VALUES
(1, 7, NULL, 1, 'سيء جدًا! كان لدي آمال كبيرة، لكن كان خيبة أمل كاملة.', '2024-12-08 19:22:14'),
(2, 14, NULL, 4, 'قيمة جيدة مقابل المال، استمتعت بالأجواء المحلية.', '2024-12-08 19:22:14'),
(3, 19, NULL, 1, 'أسوأ تجربة تناول طعام مررت بها في مصر.', '2024-12-08 19:22:14'),
(4, NULL, 26, 5, 'أحببتها تمامًا! الأجواء والموظفون كانوا ممتازين.', '2024-12-08 19:22:15');

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

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `first_name`, `middle_name`, `last_name`, `email`, `city`, `street`, `house_number`, `phone_1`, `phone_2`, `phone_3`, `created_at`, `status`) VALUES
(1, 2, 'ملك', 'لانا', 'جبر', 'hemeida.hazem@carmen.com', 'المنيل', 'ممر مجد عزيز', '77', '1085148723', NULL, NULL, '2024-12-08 19:22:14', 'in_progress'),
(2, 2, 'مجدولين', 'أمين', 'عبد الوهاب', 'saif.ahmed@hazem.info', 'حلوان', 'ممر ابتهال الكفراوي', '8', '1231412398', NULL, NULL, '2024-12-08 19:22:14', 'in_progress'),
(3, 2, 'رضا', 'نرمين', 'عبد الحليم', 'younes.hani@fahmy.net', 'المرج', 'طريق عنان عبد اللطيف', '54', '1049238774', NULL, NULL, '2024-12-08 19:22:14', 'cancelled'),
(4, 2, 'حسناء', 'منار', 'عبد اللطيف', 'karam.hashem@hotmail.com', 'غمرة', 'ممر لينا عبد الباسط', '38', '1274933472', NULL, NULL, '2024-12-08 19:22:14', 'pending'),
(5, 2, 'عمرو', 'لورينا', 'فواز', 'hashem.rizk@yahoo.com', 'إمبابة', 'ممر نزيه عبد الفتاح', '90', '1211931420', NULL, NULL, '2024-12-08 19:22:14', 'in_progress'),
(6, 2, 'جميلة', 'يونس', 'زين العابدين', 'mahmoud71@ramzy.info', 'كلية البنات', 'شارع بشرى عمران', '100', '1533418218', NULL, NULL, '2024-12-08 19:22:14', 'cancelled'),
(7, 2, 'ضحى', 'هاشم', 'عبد الفتاح', 'youssef46@hotmail.com', 'المطرية', 'طريق أبرار عبد المعطي', '21', '1123765608', NULL, NULL, '2024-12-08 19:22:14', 'completed'),
(8, 2, 'حياة', 'جنى', 'فواز', 'mahmoud.hemeida@mostafa.org', 'عين شمس', 'ممر أروى صدام', '18', '1163908613', NULL, NULL, '2024-12-08 19:22:14', 'pending'),
(9, 2, 'أنور', 'ليان', 'عز العرب', 'gmostafa@rakeen.eg', 'المعادي', 'شارع دعاء عبد الرؤوف', '57', '1124751393', NULL, NULL, '2024-12-08 19:22:14', 'cancelled'),
(10, 2, 'دياب', 'ميان', 'عبد السلام', 'hashem25@hotmail.com', 'الشروق', 'طريق أروى عز الدين', '89', '1009303655', NULL, NULL, '2024-12-08 19:22:14', 'cancelled'),
(11, 2, 'مروة', 'نضال', 'السويلم', 'hashem88@abdulaziz.biz', 'المظلات', 'شارع عاليا عبد العزيز', '64', '1075150430', NULL, NULL, '2024-12-08 19:22:14', 'pending'),
(12, 2, 'صقر', 'كمال', 'هارون', 'hashem.mahmoud@fahmy.net', 'باب اللوق', 'شارع حسني عبد الجواد', '85', '1114432056', NULL, NULL, '2024-12-08 19:22:14', 'cancelled'),
(13, 2, 'نهى', 'ليث', 'شافع', 'ahmed33@hotmail.com', 'كلية البنات', 'طريق كرم السويلم', '79', '1550406292', NULL, NULL, '2024-12-08 19:22:14', 'in_progress'),
(14, 2, 'سيلين', 'مياده', 'عبد المعطي', 'ukaram@abdulaziz.org', 'السيدة زينب', 'ممر سامي عبد الباسط', '73', '1201137726', NULL, NULL, '2024-12-08 19:22:14', 'completed'),
(15, 2, 'زيدان', 'بكر', 'عبد القادر', 'fabdulaziz@mahmoud.org', 'التجمع التالت', 'ممر فارس زين العابدين', '57', '1244624031', NULL, NULL, '2024-12-08 19:22:14', 'in_progress'),
(16, 2, 'زياد', 'ناديه', 'مكي', 'ahmed63@gmail.com', 'ثكنات المعادي', 'طريق ليدا عبد الرحمن', '73', '1089829612', NULL, NULL, '2024-12-08 19:22:14', 'pending'),
(17, 2, 'فرح', 'سيرينا', 'عبد الكريم', 'basma.elsherbiny@gmail.com', 'عبده باشا', 'ممر صقر صدام', '93', '1042037705', NULL, NULL, '2024-12-08 19:22:14', 'cancelled'),
(18, 2, 'بشار', 'سيرينا', 'زين العابدين', 'ahmed.mostafa@hotmail.com', 'إمبابة', 'شارع سليم عبد الرؤوف', '1', '1591888587', NULL, NULL, '2024-12-08 19:22:14', 'in_progress'),
(19, 2, 'نادية', 'زكريا', 'طلال', 'mostafa.mahmoud@yahoo.com', 'المطار', 'شارع غادة عمران', '44', '1505720092', NULL, NULL, '2024-12-08 19:22:14', 'completed'),
(20, 2, 'مها', 'زاهي', 'الكفراوي', 'hkaram@tharwat.come.eg', 'الرحاب', 'طريق لين صدام', '57', '1294827471', NULL, NULL, '2024-12-08 19:22:14', 'pending'),
(21, 2, 'وسام', 'راما', 'عبد الرزاق', 'rramzy@gmail.com', 'كلية البنات', 'طريق ليندا عبد الحميد', '81', '1075592012', NULL, NULL, '2024-12-08 19:22:14', 'pending'),
(22, 2, 'فدوى', 'رجب', 'غانم', 'selim.hashem@hotmail.com', 'التجمع الخامس', 'ممر نانسي عبد المعطي', '6', '1031302651', NULL, NULL, '2024-12-08 19:22:14', 'pending'),
(23, 2, 'رأفت', 'ليلى', 'عزيز', 'hashem.abdulaziz@bayoumi.info', 'قباء', 'طريق راما عبد الجواد', '19', '1553902969', NULL, NULL, '2024-12-08 19:22:14', 'pending'),
(24, 2, 'خديجة', 'حسن', 'عبد الرؤوف', 'tharwat.dina@ezz.info', 'كوتسيكا', 'طريق غزل عبد السلام', '21', '1082500642', NULL, NULL, '2024-12-08 19:22:14', 'in_progress'),
(25, 2, 'هيا', 'نعمة', 'رسلان', 'ehazem@mostafa.come.eg', 'الموسكي', 'شارع أحلام عبد الكريم', '55', '1236835211', NULL, NULL, '2024-12-08 19:22:14', 'in_progress'),
(26, 2, 'دارين', 'هيفاء', 'غالب', 'mahmoud.selim@mahmoud.eg', 'روكسي', 'شارع اسلام السقا', '17', '1209218515', NULL, NULL, '2024-12-08 19:22:14', 'completed'),
(27, 2, 'دنيا', 'كريم', 'عمران', 'elshamy.hazem@gmail.com', 'المقطم', 'شارع رقية عبد الجواد', '27', '1117393323', NULL, NULL, '2024-12-08 19:22:14', 'cancelled'),
(28, 2, 'شيرين', 'أميرة', 'عبد الحميد', 'lyoussef@selim.org', 'الرحاب', 'شارع نزيه الداوود', '54', '1512603052', NULL, NULL, '2024-12-08 19:22:14', 'completed'),
(29, 2, 'سيلين', 'بسام', 'عبد الرزاق', 'hashem.youssef@gmail.com', 'باب الشعرية', 'ممر فريدة عبد الرزاق', '75', '1141446111', NULL, NULL, '2024-12-08 19:22:15', 'pending'),
(30, 2, 'أنس', 'ربى', 'السقا', 'elshamy.mahmoud@gmail.com', 'الدقي', 'ممر عيسى عبد الرزاق', '99', '1152283301', NULL, NULL, '2024-12-08 19:22:15', 'completed');

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
(1, 1, 6, 1, '55.00', '52.25'),
(2, 1, 16, 5, '20.00', '19.00'),
(3, 2, 1, 1, '20.00', '19.00'),
(4, 2, 4, 3, '30.00', '28.50'),
(5, 3, 15, 5, '22.00', '20.90'),
(6, 4, 11, 4, '18.00', '17.10'),
(7, 4, 15, 3, '22.00', '20.90'),
(8, 5, 11, 3, '18.00', '18.00'),
(9, 6, 8, 4, '12.00', '11.40'),
(10, 6, 2, 3, '15.00', '14.25'),
(11, 6, 10, 2, '20.00', '19.00'),
(12, 7, 16, 1, '20.00', '20.00'),
(13, 7, 1, 2, '20.00', '20.00'),
(14, 7, 11, 1, '18.00', '18.00'),
(15, 8, 11, 1, '18.00', '18.00'),
(16, 9, 6, 2, '55.00', '52.25'),
(17, 10, 5, 5, '45.00', '36.00'),
(18, 10, 6, 4, '55.00', '44.00'),
(19, 10, 6, 5, '55.00', '44.00'),
(20, 11, 3, 1, '25.00', '23.75'),
(21, 11, 1, 3, '20.00', '19.00'),
(22, 11, 3, 1, '25.00', '23.75'),
(23, 12, 12, 2, '15.00', '15.00'),
(24, 13, 6, 5, '55.00', '44.00'),
(25, 13, 9, 4, '25.00', '20.00'),
(26, 13, 12, 1, '15.00', '12.00'),
(27, 14, 14, 2, '25.00', '23.75'),
(28, 14, 10, 1, '20.00', '19.00'),
(29, 14, 2, 4, '15.00', '14.25'),
(30, 15, 3, 3, '25.00', '23.75'),
(31, 15, 2, 2, '15.00', '14.25'),
(32, 16, 16, 2, '20.00', '20.00'),
(33, 17, 4, 2, '30.00', '30.00'),
(34, 17, 16, 2, '20.00', '20.00'),
(35, 18, 4, 5, '30.00', '28.50'),
(36, 19, 13, 2, '22.00', '22.00'),
(37, 20, 8, 4, '12.00', '11.40'),
(38, 20, 7, 3, '10.00', '9.50'),
(39, 20, 14, 2, '25.00', '23.75'),
(40, 21, 11, 3, '18.00', '17.10'),
(41, 21, 14, 3, '25.00', '23.75'),
(42, 22, 2, 1, '15.00', '15.00'),
(43, 23, 5, 1, '45.00', '42.75'),
(44, 23, 3, 3, '25.00', '23.75'),
(45, 23, 14, 2, '25.00', '23.75'),
(46, 24, 4, 1, '30.00', '28.50'),
(47, 24, 1, 2, '20.00', '19.00'),
(48, 24, 11, 2, '18.00', '17.10'),
(49, 25, 9, 5, '25.00', '22.50'),
(50, 25, 16, 1, '20.00', '18.00'),
(51, 25, 2, 4, '15.00', '13.50'),
(52, 26, 16, 4, '20.00', '20.00'),
(53, 27, 8, 4, '12.00', '11.40'),
(54, 27, 1, 3, '20.00', '19.00'),
(55, 28, 2, 1, '15.00', '14.25'),
(56, 28, 15, 4, '22.00', '20.90'),
(57, 29, 12, 5, '15.00', '15.00'),
(58, 30, 15, 2, '22.00', '20.90'),
(59, 30, 4, 2, '30.00', '28.50'),
(60, 30, 16, 3, '20.00', '19.00');

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

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `user_id`, `branch_id`, `reservation_date`, `reservation_time`, `guests`, `created_at`, `status`) VALUES
(1, 2, 2, '2025-01-07', '03:04:47', 10, '2024-12-08 19:22:15', 'in_progress'),
(2, 2, 1, '2024-11-14', '22:24:00', 4, '2024-12-08 19:22:15', 'completed'),
(3, 2, 2, '2024-12-18', '04:01:53', 3, '2024-12-08 19:22:15', 'pending'),
(4, 2, 5, '2024-11-29', '01:07:36', 7, '2024-12-08 19:22:15', 'cancelled'),
(5, 2, 5, '2024-12-14', '09:06:00', 5, '2024-12-08 19:22:15', 'pending'),
(6, 2, 2, '2024-12-31', '06:46:09', 4, '2024-12-08 19:22:15', 'pending'),
(7, 2, 4, '2024-12-17', '09:41:34', 1, '2024-12-08 19:22:15', 'pending'),
(8, 2, 1, '2024-11-27', '12:45:07', 5, '2024-12-08 19:22:15', 'cancelled'),
(9, 2, 2, '2024-12-06', '14:08:57', 7, '2024-12-08 19:22:15', 'cancelled'),
(10, 2, 2, '2024-12-31', '13:47:27', 9, '2024-12-08 19:22:15', 'pending'),
(11, 2, 5, '2025-01-04', '09:06:47', 3, '2024-12-08 19:22:15', 'pending'),
(12, 2, 3, '2024-12-02', '21:13:39', 7, '2024-12-08 19:22:15', 'cancelled'),
(13, 2, 3, '2024-11-17', '17:57:44', 10, '2024-12-08 19:22:15', 'cancelled'),
(14, 2, 2, '2024-11-28', '11:35:38', 9, '2024-12-08 19:22:15', 'cancelled'),
(15, 2, 2, '2024-12-16', '17:15:59', 5, '2024-12-08 19:22:15', 'in_progress'),
(16, 2, 3, '2024-12-11', '14:43:38', 7, '2024-12-08 19:22:15', 'in_progress'),
(17, 2, 1, '2024-11-15', '08:15:05', 8, '2024-12-08 19:22:15', 'cancelled'),
(18, 2, 1, '2024-12-27', '18:08:05', 10, '2024-12-08 19:22:15', 'pending'),
(19, 2, 5, '2024-12-10', '10:50:28', 3, '2024-12-08 19:22:15', 'in_progress'),
(20, 2, 3, '2024-11-09', '21:23:55', 9, '2024-12-08 19:22:15', 'cancelled'),
(21, 2, 1, '2024-12-11', '01:52:49', 2, '2024-12-08 19:22:15', 'pending'),
(22, 2, 3, '2024-11-13', '17:21:23', 10, '2024-12-08 19:22:15', 'completed'),
(23, 2, 3, '2024-11-20', '17:38:40', 2, '2024-12-08 19:22:15', 'cancelled'),
(24, 2, 4, '2024-12-20', '22:20:27', 4, '2024-12-08 19:22:15', 'in_progress'),
(25, 2, 1, '2025-01-06', '12:17:03', 5, '2024-12-08 19:22:15', 'in_progress'),
(26, 2, 4, '2024-11-28', '04:56:09', 1, '2024-12-08 19:22:15', 'completed'),
(27, 2, 4, '2024-12-15', '20:43:22', 10, '2024-12-08 19:22:15', 'in_progress'),
(28, 2, 1, '2024-12-02', '11:50:17', 2, '2024-12-08 19:22:15', 'cancelled'),
(29, 2, 1, '2024-12-01', '17:24:42', 6, '2024-12-08 19:22:15', 'completed'),
(30, 2, 4, '2024-12-02', '07:17:31', 3, '2024-12-08 19:22:15', 'cancelled');

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
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `branch_id` (`branch_id`);

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
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `evaluations`
--
ALTER TABLE `evaluations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `phones`
--
ALTER TABLE `phones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

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

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
