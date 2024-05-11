-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 11, 2024 at 08:29 PM
-- Server version: 8.0.36-0ubuntu0.22.04.1
-- PHP Version: 7.4.33

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
(3, 16, 2, '1986-08-01', '15:02:00', 619, '2024-04-11 18:42:55', 'completed'),
(4, 16, 3, '1974-07-27', '21:54:00', 18, '2024-04-11 19:19:11', 'in_progress'),
(5, 16, 2, '2014-12-20', '05:03:00', 291, '2024-04-11 19:19:13', 'completed'),
(6, 16, 3, '1987-06-03', '04:55:00', 409, '2024-04-11 23:01:12', 'cancelled'),
(7, 16, 4, '1985-06-21', '19:02:00', 812, '2024-04-11 23:24:37', 'in_progress'),
(8, 17, 2, '2024-04-16', '23:40:00', 20, '2024-04-12 19:38:59', 'in_progress'),
(9, 16, 5, '2023-08-14', '20:44:00', 148, '2024-04-13 20:22:54', 'pending'),
(10, 16, 3, '1990-03-10', '06:14:00', 432, '2024-04-13 20:23:23', 'pending'),
(11, 16, 5, '1976-09-11', '03:50:00', 822, '2024-04-13 20:23:27', 'pending'),
(12, 16, 3, '2000-05-30', '09:44:00', 173, '2024-04-13 20:23:58', 'pending'),
(13, 16, 2, '1979-12-29', '03:03:00', 614, '2024-04-13 20:24:14', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `location` varchar(255) NOT NULL,
  `contact_info` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `location`, `contact_info`) VALUES
(1, 'Cairo Central', '13 El-Gomhoreya Street, Downtown, Cairo, Egypt', 'Phone: +20 12 3456 7890, Email: cairocentral@example.com'),
(2, 'Cairo East', '5 Salah Salem Street, Nasr City, Cairo, Egypt', 'Phone: +20 12 3456 7891, Email: cairoeast@example.com'),
(3, 'Cairo West', '10 El Haram Street, Giza, Cairo, Egypt', 'Phone: +20 12 3456 7892, Email: cairowest@example.com'),
(4, 'Cairo North', '30 El Nozha Street, Heliopolis, Cairo, Egypt', 'Phone: +20 12 3456 7893, Email: caironorth@example.com'),
(5, 'Cairo South', '25 Corniche El Nil, Maadi, Cairo, Egypt', 'Phone: +20 12 3456 7894, Email: cairosouth@example.com');

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
(1, NULL, 3, 1, 'Voluptas rem sapient', '2024-04-12 20:53:50'),
(2, 11, NULL, 5, 'Dolore ut temporibus', '2024-04-12 21:04:25'),
(3, 10, NULL, 5, 'cc', '2024-04-13 20:14:41');

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
(1, 'Classic Pancakes', 'Fluffy pancakes served with maple syrup', 'assets/images/1.jpg', '9.99', 1, 1),
(2, 'Avocado Toast', 'Sliced avocado on toasted bread with poached eggs', 'assets/images/2.jpeg', '12.99', 1, 1),
(3, 'Club Sandwich', 'Triple-decker sandwich with turkey, bacon, lettuce, and tomato', 'assets/images/3.jpg', '11.99', 2, 1),
(4, 'Caesar Salad', 'Romaine lettuce, croutons, Parmesan cheese, and Caesar dressing', 'assets/images/4.jpg', '8.99', 2, 1),
(5, 'Grilled Salmon', 'Fresh Atlantic salmon fillet grilled to perfection', 'assets/images/5.jpg', '17.99', 3, 1),
(6, 'Ribeye Steak', 'Juicy ribeye steak cooked to your liking', 'assets/images/6.jpg', '24.99', 3, 1),
(7, 'Iced Coffee', 'Chilled coffee served over ice with milk or cream', 'assets/images/7.jpg', '4.99', 4, 1),
(8, 'Fresh Orange Juice', 'Cold-pressed orange juice made from freshly squeezed oranges', 'assets/images/8.webp', '3.99', 4, 1),
(9, 'Chocolate Brownie', 'Rich and fudgy chocolate brownie topped with vanilla ice cream', 'assets/images/9.webp', '6.99', 5, 1),
(10, 'New York Cheesecake', 'Creamy cheesecake with a graham cracker crust', 'assets/images/10.jpg', '7.99', 5, 1),
(11, 'Mango Sorbet', 'Refreshing mango sorbet made with ripe mangoes', 'assets/images/11.jpg', '5.99', 5, 1),
(12, 'Quinoa Salad', 'Healthy salad with quinoa, mixed greens, and veggies', 'assets/images/12.jpeg', '10.99', 6, 1),
(13, 'Vegetable Stir-Fry', 'Assorted vegetables stir-fried in a savory sauce', 'assets/images/13.jpg', '9.99', 6, 1),
(14, 'Chicken Tenders', 'Breaded and fried chicken tenders served with dipping sauce', 'assets/images/14.jpg', '6.99', 7, 1),
(15, 'Macaroni and Cheese', 'Creamy macaroni pasta with melted cheese', 'assets/images/15.jpg', '5.99', 7, 1),
(16, 'Cheese Pizza', 'Classic cheese pizza with tomato sauce and mozzarella cheese', 'assets/images/16.webp', '8.99', 7, 1);

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
(10, 16, 'Erin', 'Finley', 'hexi@testing-mail.com', 'Eius et quisquam ani', 'Ut quos eum error qu', '370', '+1 (338) 683-1141', '+1 (623) 468-7946', '+1 (935) 879-7977', '2024-04-11 18:08:59', 'pending'),
(11, 16, 'Erin', 'Finley', 'hexi@testing-mail.com', 'Eius et quisquam ani', 'Ut quos eum error qu', '370', '+1 (338) 683-1141', '+1 (623) 468-7946', '+1 (935) 879-7977', '2024-04-11 18:59:41', 'pending'),
(12, 16, 'Erin', 'Finley', 'hexi@testing-mail.com', 'Eius et quisquam ani', 'Ut quos eum error qu', '370', '+1 (338) 683-1141', '+1 (623) 468-7946', '+1 (935) 879-7977', '2024-04-11 19:01:39', 'in_progress'),
(13, 16, 'Erin', 'Finley', 'hexi@testing-mail.com', 'Eius et quisquam ani', 'Ut quos eum error qu', '370', '+1 (338) 683-1141', '+1 (623) 468-7946', '+1 (935) 879-7977', '2024-04-11 19:18:57', 'cancelled'),
(14, 16, 'Clayton', 'Duncan', 'hexi@testing-mail.com', 'Magni cupidatat sequ', 'Provident a reicien', '889', '+1 (951) 904-4956', '+1 (579) 847-7154', '+1 (807) 544-9348', '2024-04-11 23:02:01', 'cancelled'),
(15, 16, 'Clayton', 'Duncan', 'hexi@testing-mail.com', 'Magni cupidatat sequ', 'Provident a reicien', '889', '+1 (951) 904-4956', '+1 (579) 847-7154', '+1 (807) 544-9348', '2024-04-12 02:19:19', 'completed'),
(16, 17, 'Jeremy', 'Carpenter', 'pykat@testing-mail.com', 'Id consectetur dolo', 'Exercitation fuga O', '310', '+1 (374) 125-1132', '+1 (785) 933-4578', '+1 (952) 879-5332', '2024-04-12 19:41:05', 'in_progress');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `item_id` int NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
(40, 16, 8, 1);

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
(103, 16, '+1 (951) 904-4956'),
(104, 16, '+1 (579) 847-7154'),
(105, 16, '+1 (807) 544-9348'),
(109, 17, '+1 (374) 125-1132'),
(110, 17, '+1 (785) 933-4578'),
(111, 17, '+1 (952) 879-5332'),
(115, 18, '123456789'),
(116, 18, '123456789'),
(117, 18, '123456789');

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
(16, 'customer', 'Clayton', 'Duncan', 'customer@perfect-food.com', '$2y$10$XOWEqR4H50n.Caplzd8HmumSqooRUIJE9jjIHWaD/7fg9AheN0Z5S', 'Magni cupidatat sequ', 'Provident a reicien', '889', '2024-04-11 15:37:17'),
(17, 'admin', 'Jeremy', 'Carpenter', 'admin@perfect-food.com', '$2y$10$TeJvNE3D.LZA7BKML4OGGeuDic9cdY44VILdHLRBvQO4lZAhGQS8C', 'Id consectetur dolo', 'Exercitation fuga O', '310', '2024-04-12 19:36:04'),
(18, 'branch_manager', 'Savannah', 'Mayo', 'branch_manager@perfect-food.com', '$2y$10$wUt62SAmKbygwg6nBwVMs.02c3MQAS05G0hEgh3Bym77qI6zlpOcC', 'Qui rerum et quia ex', 'Quisquam qui autem o', '230', '2024-05-11 17:28:25');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `evaluations`
--
ALTER TABLE `evaluations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `phones`
--
ALTER TABLE `phones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
  ADD CONSTRAINT `evaluations_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `evaluations_ibfk_2` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

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
