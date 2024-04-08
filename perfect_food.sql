-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 09, 2024 at 01:02 AM
-- Server version: 8.0.36-0ubuntu0.22.04.1
-- PHP Version: 8.1.27

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
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int NOT NULL,
  `date` date NOT NULL,
  `type` enum('event','table') NOT NULL,
  `event_name` varchar(100) DEFAULT NULL,
  `table_numbers` varchar(255) DEFAULT NULL,
  `status` enum('pending','confirmed','cancelled') NOT NULL,
  `customer_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int NOT NULL,
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
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `email`, `password`, `city`, `street`, `house_number`, `created_at`) VALUES
(1, 'Demetria', 'Whitfield', 'admin@perfect-food.localhost', '$2y$10$xK7H74tVHNO58p9xpDTDTuirWiXjFiFx9JPSTN3htZNklXdfTyqRK', 'Enim minima ullam ip', 'Qui rem amet ea in ', '111', '2024-04-07 00:15:28'),
(3, 'Brian', 'Stanton', 'jydepuj@testing-mail.com', '$2y$10$/2JlB4iF9aGWWfkGmFuFlOEP.OcFO9TE.vZM.cyL08h2ksKq1vbV.', 'Rerum aperiam veniam', 'Nesciunt non maxime', '224', '2024-04-07 09:23:40'),
(13, 'Isabelle', 'Dawson', 'dozisetehi@testing-mail.com', '$2y$10$NixFT/nZIQyXoYA0Mj7p0uJwUyx5MkEYFR8uyoajPuKziA84nIOGK', 'Ex adipisicing dolor', 'Magni dolor pariatur', '614', '2024-04-07 09:44:32'),
(14, 'Raphael', 'Jennings', 'sopeq@testing-mail.com', '$2y$10$Q4.q.2PXi/Podi9GkFv2Fef4If5cVHkdI7T4diygk3EfDygftdYDa', 'Sed id dolores labo', 'Distinctio Non laud', '612', '2024-04-07 20:49:56');

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
(1, 'Classic Pancakes', 'Fluffy pancakes served with maple syrup', '/assets/images/1.jpeg', '9.99', 1, 1),
(2, 'Avocado Toast', 'Sliced avocado on toasted bread with poached eggs', '/assets/images/2.jpeg', '12.99', 1, 1),
(3, 'Club Sandwich', 'Triple-decker sandwich with turkey, bacon, lettuce, and tomato', '/assets/images/3.jpg', '11.99', 2, 1),
(4, 'Caesar Salad', 'Romaine lettuce, croutons, Parmesan cheese, and Caesar dressing', '/assets/images/4.jpg', '8.99', 2, 1),
(5, 'Grilled Salmon', 'Fresh Atlantic salmon fillet grilled to perfection', '/assets/images/5.jpg', '17.99', 3, 1),
(6, 'Ribeye Steak', 'Juicy ribeye steak cooked to your liking', '/assets/images/6.jpg', '24.99', 3, 1),
(7, 'Iced Coffee', 'Chilled coffee served over ice with milk or cream', '/assets/images/7.jpg', '4.99', 4, 1),
(8, 'Fresh Orange Juice', 'Cold-pressed orange juice made from freshly squeezed oranges', '/assets/images/8.webp', '3.99', 4, 1),
(9, 'Chocolate Brownie', 'Rich and fudgy chocolate brownie topped with vanilla ice cream', '/assets/images/9.webp', '6.99', 5, 1),
(10, 'New York Cheesecake', 'Creamy cheesecake with a graham cracker crust', '/assets/images/10.jpg', '7.99', 5, 1),
(11, 'Mango Sorbet', 'Refreshing mango sorbet made with ripe mangoes', '/assets/images/11.jpg', '5.99', 5, 1),
(12, 'Quinoa Salad', 'Healthy salad with quinoa, mixed greens, and veggies', '/assets/images/12.jpeg', '10.99', 6, 1),
(13, 'Vegetable Stir-Fry', 'Assorted vegetables stir-fried in a savory sauce', '/assets/images/13.jpg', '9.99', 6, 1),
(14, 'Chicken Tenders', 'Breaded and fried chicken tenders served with dipping sauce', '/assets/images/14.jpg', '6.99', 7, 1),
(15, 'Macaroni and Cheese', 'Creamy macaroni pasta with melted cheese', '/assets/images/15.jpg', '5.99', 7, 1),
(16, 'Cheese Pizza', 'Classic cheese pizza with tomato sauce and mozzarella cheese', '/assets/images/16.webp', '8.99', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `time` datetime NOT NULL,
  `status` enum('pending','completed') NOT NULL,
  `customer_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `menu_item_id` int NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `phones`
--

CREATE TABLE `phones` (
  `id` int NOT NULL,
  `customer_id` int NOT NULL,
  `phone_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `phones`
--

INSERT INTO `phones` (`id`, `customer_id`, `phone_number`) VALUES
(1, 14, '+1 (792) 616-9299'),
(2, 14, '+1 (749) 911-8653'),
(3, 14, '+1 (509) 894-8982');

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` int NOT NULL,
  `branch_name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `city` varchar(50) NOT NULL,
  `street` varchar(100) NOT NULL,
  `number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

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
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `menu_item_id` (`menu_item_id`);

--
-- Indexes for table `phones`
--
ALTER TABLE `phones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`);

--
-- Constraints for table `phones`
--
ALTER TABLE `phones`
  ADD CONSTRAINT `phones_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
