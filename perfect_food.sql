-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2024 at 08:29 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

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
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `booking_date` date NOT NULL,
  `booking_time` time NOT NULL,
  `guests` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `status` varchar(50) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `branch_id`, `booking_date`, `booking_time`, `guests`, `created_at`, `status`) VALUES
(3, 16, 2, '1986-08-01', '15:02:00', 619, '2024-04-11 18:42:55', 'completed'),
(4, 16, 3, '1974-07-27', '21:54:00', 18, '2024-04-11 19:19:11', 'in_progress'),
(5, 16, 2, '2014-12-20', '05:03:00', 291, '2024-04-11 19:19:13', 'completed'),
(6, 16, 3, '1987-06-03', '04:55:00', 409, '2024-04-11 23:01:12', 'cancelled'),
(7, 16, 4, '1985-06-21', '19:02:00', 812, '2024-04-11 23:24:37', 'in_progress'),
(8, 17, 2, '2024-04-16', '23:40:00', 20, '2024-04-12 19:38:59', 'completed'),
(9, 16, 5, '2023-08-14', '20:44:00', 148, '2024-04-13 20:22:54', 'pending'),
(10, 16, 3, '1990-03-10', '06:14:00', 432, '2024-04-13 20:23:23', 'pending'),
(11, 16, 5, '1976-09-11', '03:50:00', 822, '2024-04-13 20:23:27', 'pending'),
(12, 16, 3, '2000-05-30', '09:44:00', 173, '2024-04-13 20:23:58', 'pending'),
(13, 16, 2, '1979-12-29', '03:03:00', 614, '2024-04-13 20:24:14', 'pending'),
(14, 16, 1, '2008-05-12', '18:06:00', 693, '2024-04-14 10:05:58', 'cancelled'),
(15, 16, 4, '2024-04-16', '17:43:00', 13, '2024-04-16 15:44:12', 'pending'),
(16, 16, 2, '2024-04-30', '21:20:00', 11, '2024-04-17 16:19:42', 'pending'),
(19, 16, 4, '2024-05-10', '15:32:00', 55, '2024-04-23 19:25:49', 'pending'),
(20, 16, 5, '2024-04-28', '20:30:00', 23, '2024-04-23 19:26:22', 'pending'),
(21, 16, 4, '2024-05-06', '13:29:00', 26, '2024-04-23 19:26:48', 'pending'),
(22, 16, 4, '2024-04-26', '17:00:00', 10, '2024-04-24 11:57:08', 'pending'),
(23, 16, 1, '2024-04-26', '16:00:00', 15, '2024-04-24 11:57:32', 'pending'),
(24, 16, 2, '2024-05-01', '15:00:00', 5, '2024-04-24 11:57:54', 'pending'),
(25, 16, 1, '2024-05-13', '00:32:00', 20, '2024-05-12 21:33:30', 'pending'),
(26, 16, 1, '2024-05-13', '01:04:00', 20, '2024-05-12 22:04:37', 'pending'),
(27, 16, 1, '2024-05-13', '01:04:00', 20, '2024-05-12 22:05:40', 'pending'),
(28, 16, 5, '2024-05-13', '14:16:00', 50, '2024-05-13 11:16:53', 'pending'),
(29, 16, 3, '2024-05-30', '23:08:00', 30, '2024-05-13 16:09:10', 'completed'),
(30, 16, 1, '2024-05-20', '08:23:00', 60, '2024-05-13 16:23:12', 'completed'),
(31, 16, 3, '2024-05-14', '12:05:00', 80, '2024-05-14 09:06:02', 'pending'),
(32, 16, 1, '2024-05-14', '18:25:00', 50, '2024-05-14 15:25:38', 'pending'),
(33, 16, 1, '2024-05-21', '00:05:00', 100, '2024-05-20 21:05:49', 'pending'),
(34, 16, 1, '2024-05-21', '00:05:00', 100, '2024-05-20 21:06:50', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `location` varchar(255) NOT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `max_guests` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `evaluations`
--

INSERT INTO `evaluations` (`id`, `order_id`, `booking_id`, `rating`, `comment`, `created_at`) VALUES
(1, NULL, 3, 5, 'Very Good', '2024-04-12 20:53:50'),
(2, 11, NULL, 3, 'Good', '2024-04-12 21:04:25'),
(3, 10, NULL, 2, 'Not bad', '2024-04-13 20:14:41'),
(4, NULL, 5, 2, 'Acceptable', '2024-04-16 15:40:29'),
(5, 15, NULL, 3, 'Good', '2024-04-23 19:01:48'),
(6, 32, NULL, 5, 'Very good', '2024-05-12 12:15:58'),
(7, 31, NULL, 2, 'acceptable', '2024-05-12 12:19:30'),
(8, 30, NULL, 5, 'Very good', '2024-05-12 16:49:37');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `name`, `description`, `image`, `price`, `menu_id`, `active`) VALUES
(1, 'Classic Pancakes', 'Fluffy pancakes served with maple syrup', 'assets/images/1.jpg', 9.99, 1, 1),
(2, 'Avocado Toast', 'Sliced avocado on toasted bread with poached eggs', 'assets/images/2.jpeg', 12.99, 1, 1),
(3, 'Club Sandwich', 'Triple-decker sandwich with turkey, bacon, lettuce, and tomato', 'assets/images/3.jpg', 11.99, 2, 1),
(4, 'Caesar Salad', 'Romaine lettuce, croutons, Parmesan cheese, and Caesar dressing', 'assets/images/4.jpg', 8.99, 2, 1),
(5, 'Grilled Salmon', 'Fresh Atlantic salmon fillet grilled to perfection', 'assets/images/5.jpg', 17.99, 3, 1),
(6, 'Ribeye Steak', 'Juicy ribeye steak cooked to your liking', 'assets/images/6.jpg', 24.99, 3, 1),
(7, 'Iced Coffee', 'Chilled coffee served over ice with milk or cream', 'assets/images/7.jpg', 4.99, 4, 1),
(8, 'Fresh Orange Juice', 'Cold-pressed orange juice made from freshly squeezed oranges', 'assets/images/8.webp', 3.99, 4, 1),
(9, 'Chocolate Brownie', 'Rich and fudgy chocolate brownie topped with vanilla ice cream', 'assets/images/9.webp', 6.99, 5, 1),
(10, 'New York Cheesecake', 'Creamy cheesecake with a graham cracker crust', 'assets/images/10.jpg', 7.99, 5, 1),
(11, 'Mango Sorbet', 'Refreshing mango sorbet made with ripe mangoes', 'assets/images/11.jpg', 5.99, 5, 1),
(12, 'Quinoa Salad', 'Healthy salad with quinoa, mixed greens, and veggies', 'assets/images/12.jpeg', 10.99, 6, 1),
(13, 'Vegetable Stir-Fry', 'Assorted vegetables stir-fried in a savory sauce', 'assets/images/13.jpg', 9.99, 6, 1),
(14, 'Chicken Tenders', 'Breaded and fried chicken tenders served with dipping sauce', 'assets/images/14.jpg', 6.99, 7, 1),
(15, 'Macaroni and Cheese', 'Creamy macaroni pasta with melted cheese', 'assets/images/15.jpg', 5.99, 7, 1),
(16, 'Cheese Pizza', 'Classic cheese pizza with tomato sauce and mozzarella cheese', 'assets/images/16.webp', 8.99, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `street` varchar(100) NOT NULL,
  `house_number` varchar(20) NOT NULL,
  `phone_1` varchar(20) NOT NULL,
  `phone_2` varchar(20) DEFAULT NULL,
  `phone_3` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `status` varchar(50) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `first_name`, `last_name`, `email`, `city`, `street`, `house_number`, `phone_1`, `phone_2`, `phone_3`, `created_at`, `status`) VALUES
(10, 16, 'Mohamed', 'Ali', 'hexi@testing-mail.com', 'Cairo', 'Salah-Eldeen', '45', '01027906696', '01127906696', '01227906696', '2024-04-11 18:08:59', 'in_progress'),
(11, 16, 'Mohamed', 'Ali', 'hexi@testing-mail.com', 'Cairo', 'Salah-Eldeen', '45', '01027906696', '01127906696', '01227906696', '2024-04-11 18:59:41', 'pending'),
(12, 16, 'Mohamed', 'Ali', 'hexi@testing-mail.com', 'Cairo', 'Salah-Eldeen', '45', '01027906696', '01127906696', '01227906696', '2024-04-11 19:01:39', 'in_progress'),
(13, 16, 'Mohamed', 'Ali', 'hexi@testing-mail.com', 'Cairo', 'Salah-Eldeen', '45', '01027906696', '01127906696', '01227906696', '2024-04-11 19:18:57', 'cancelled'),
(14, 16, 'Mohamed', 'Ali', 'hexi@testing-mail.com', 'Cairo', 'Salah-Eldeen', '45', '01027906696', '01127906696', '01227906696', '2024-04-11 23:02:01', 'cancelled'),
(15, 16, 'Mohamed', 'Ali', 'hexi@testing-mail.com', 'Cairo', 'Salah-Eldeen', '45', '01027906696', '01127906696', '01227906696', '2024-04-12 02:19:19', 'completed'),
(16, 17, 'Ahmed', 'Essam', 'pykat@testing-mail.com', 'Cairo', 'Al Qasr Al Aini \r\n', '78', '01037906696', '01137906696', '01237906696', '2024-04-12 19:41:05', 'in_progress'),
(18, 16, 'Mohamed', 'Ali', 'customer@perfect-food.com', 'Cairo', 'Salah-Eldeen', '45', '01027906696', '01127906696', '01227906696', '2024-04-18 20:40:33', 'pending'),
(19, 16, 'Mohamed', 'Ali', 'customer@perfect-food.com', 'Cairo', 'Salah-Eldeen', '45', '01027906696', '01127906696', '01227906696', '2024-04-19 09:47:00', 'in_progress'),
(20, 16, 'Mohamed', 'Ali', 'customer@perfect-food.com', 'Cairo', 'Salah-Eldeen', '45', '01027906696', '01127906696', '01227906696', '2024-04-19 09:59:14', 'in_progress'),
(21, 16, 'Mohamed', 'Ali', 'customer@perfect-food.com', 'Cairo', 'Salah-Eldeen', '45', '01027906696', '01127906696', '01227906696', '2024-04-25 12:10:00', 'in_progress'),
(22, 16, 'Mohamed', 'Ali', 'customer@perfect-food.com', 'Cairo', 'Salah-Eldeen', '45', '01027906696', '01127906696', '01227906696', '2024-04-25 12:10:02', 'in_progress'),
(23, 16, 'Mohamed', 'Ali', 'customer@perfect-food.com', 'Cairo', 'Salah-Eldeen', '45', '01027906696', '01127906696', '01227906696', '2024-05-11 10:10:32', 'in_progress'),
(24, 16, 'Mohamed', 'Ali', 'customer@perfect-food.com', 'Cairo', 'Salah-Eldeen', '45', '01027906696', '01127906696', '01227906696', '2024-05-11 10:11:48', 'in_progress'),
(25, 16, 'Mohamed', 'Ali', 'customer@perfect-food.com', 'Cairo', 'Salah-Eldeen', '45', '01027906696', '01127906696', '01227906696', '2024-05-11 10:20:15', 'pending'),
(26, 16, 'Mohamed', 'Ali', 'customer@perfect-food.com', 'Cairo', 'Salah-Eldeen', '45', '01027906696', '01127906696', '01227906696', '2024-05-11 10:32:44', 'in_progress'),
(27, 16, 'Mohamed', 'Ali', 'customer@perfect-food.com', 'Cairo', 'Salah-Eldeen', '45', '01027906696', '01127906696', '01227906696', '2024-05-12 09:46:04', 'pending'),
(28, 16, 'Mohamed', 'Ali', 'customer@perfect-food.com', 'Cairo', 'Salah-Eldeen', '45', '01027906696', '01127906696', '01227906696', '2024-05-12 09:46:28', 'pending'),
(29, 16, 'Mohamed', 'Ali', 'customer@perfect-food.com', 'Cairo', 'Salah-Eldeen', '45', '01027906696', '01127906696', '01227906696', '2024-05-12 09:52:01', 'completed'),
(30, 16, 'Mohamed', 'Ali', 'customer@perfect-food.com', 'Cairo', 'Salah-Eldeen', '45', '01027906696', '01127906696', '01227906696', '2024-05-12 10:31:47', 'completed'),
(31, 16, 'Mohamed', 'Ali', 'customer@perfect-food.com', 'Cairo', 'Salah-Eldeen', '45', '01027906696', '01127906696', '01227906696', '2024-05-12 10:46:50', 'completed'),
(32, 16, 'Mohamed', 'Ali', 'customer@perfect-food.com', 'Cairo', 'Salah-Eldeen', '45', '01027906696', '01127906696', '01227906696', '2024-05-12 10:50:18', 'completed'),
(33, 16, 'Mohamed', 'Ali', 'customer@perfect-food.com', 'Cairo', 'Salah-Eldeen', '45', '01027906696', '01127906696', '01227906696', '2024-05-12 17:55:41', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `item_id`, `quantity`) VALUES
(16, 10, 1, 1),
(17, 10, 2, 1),
(18, 10, 3, 1),
(19, 10, 4, 1),
(20, 11, 1, 1),
(21, 11, 15, 1),
(22, 11, 2, 2),
(23, 11, 3, 2),
(24, 11, 16, 1),
(25, 11, 6, 1),
(26, 11, 4, 1),
(27, 11, 10, 1),
(28, 12, 1, 1),
(29, 13, 9, 1),
(30, 13, 3, 1),
(31, 13, 4, 1),
(32, 13, 2, 1),
(33, 13, 1, 1),
(34, 14, 13, 1),
(35, 15, 3, 1),
(36, 15, 4, 2),
(37, 16, 1, 1),
(38, 16, 2, 1),
(39, 16, 4, 1),
(40, 16, 8, 1),
(43, 18, 10, 1),
(44, 19, 8, 1),
(45, 20, 4, 1),
(46, 21, 2, 1),
(47, 22, 1, 1),
(48, 23, 13, 2),
(49, 23, 1, 1),
(50, 24, 7, 1),
(51, 24, 4, 1),
(52, 25, 3, 1),
(53, 25, 4, 1),
(54, 26, 1, 1),
(55, 26, 2, 1),
(56, 26, 3, 1),
(57, 26, 4, 1),
(58, 26, 5, 1),
(59, 26, 6, 1),
(60, 27, 15, 1),
(61, 27, 7, 1),
(62, 27, 8, 1),
(63, 28, 3, 1),
(65, 30, 5, 1),
(66, 31, 15, 1),
(67, 31, 3, 1),
(68, 31, 13, 1),
(69, 32, 6, 1),
(70, 32, 10, 1),
(71, 33, 10, 1),
(72, 33, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `phones`
--

CREATE TABLE `phones` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phone_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `phones`
--

INSERT INTO `phones` (`id`, `user_id`, `phone_number`) VALUES
(157, 17, '01127906696'),
(158, 17, '01127906696'),
(159, 17, '01127906696'),
(160, 16, '01027906696'),
(161, 16, '01227906696'),
(162, 16, '01227906696'),
(166, 19, '01033906696'),
(167, 19, '01044906696'),
(168, 19, '01044906696');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user',
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `city` varchar(50) NOT NULL,
  `street` varchar(100) NOT NULL,
  `house_number` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `first_name`, `last_name`, `email`, `password`, `city`, `street`, `house_number`, `created_at`) VALUES
(16, 'customer', 'Mohamed', 'Ali', 'customer@perfect-food.com', '$2y$10$XOWEqR4H50n.Caplzd8HmumSqooRUIJE9jjIHWaD/7fg9AheN0Z5S', 'cairo', 'Salah-Eldeen', '45', '2024-04-11 15:37:17'),
(17, 'admin', 'Ahmed', 'Essam', 'admin@perfect-food.com', '$2y$10$XOWEqR4H50n.Caplzd8HmumSqooRUIJE9jjIHWaD/7fg9AheN0Z5S', 'cairo', 'Al Qasr Al Aini ', '78', '2024-04-12 19:36:04'),
(19, 'branch_manager', 'ibrahim', 'kamal', 'branch_manager@perfect-food.com', '$2y$10$XOWEqR4H50n.Caplzd8HmumSqooRUIJE9jjIHWaD/7fg9AheN0Z5S', 'cairo', 'Alazhar', '27', '2024-05-11 10:18:27');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `evaluations`
--
ALTER TABLE `evaluations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `phones`
--
ALTER TABLE `phones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
