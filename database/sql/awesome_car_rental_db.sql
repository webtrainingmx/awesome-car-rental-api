-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 28, 2018 at 07:27 PM
-- Server version: 5.7.20
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `awesome_car_rental_db`
--
CREATE DATABASE IF NOT EXISTS `awesome_car_rental_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `awesome_car_rental_db`;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
CREATE TABLE `manufacturers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'BMW', 'BMW.', '2018-05-24 23:18:04', '2018-05-24 23:18:04'),
(2, 'Toyota', 'Toyota.', '2018-05-24 23:19:11', '2018-05-24 23:19:11'),
(3, 'Audi', 'Audi.', '2018-05-24 23:19:39', '2018-05-24 23:19:39'),
(4, 'Honda', 'Honda.', '2018-05-24 23:20:00', '2018-05-24 23:20:00'),
(5, 'Nissan', 'Nissan', '2018-05-24 23:22:56', '2018-05-24 23:22:56'),
(6, 'Chevrolet', 'Chevrolet', '2018-05-24 23:22:56', '2018-05-24 23:22:56'),
(7, 'Subaru', 'Subaru', '2018-05-24 23:22:56', '2018-05-24 23:22:56'),
(8, 'Ford', 'Ford', '2018-05-24 23:22:56', '2018-05-24 23:22:56');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_05_24_191108_create_manufacturers_table', 2),
(4, '2018_05_24_191451_create_vehicles_table', 3),
(5, '2018_05_28_174047_create_user_vehicle_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Esmeralda', 'esmeralda@webtraining.zone', '$2y$10$jDqiWMI.brCVc.LJduHiauek9WyGISWeSFEOTcNdVitcxUFPIF.WK', NULL, '2018-05-24 23:01:48', '2018-05-24 23:01:48');

-- --------------------------------------------------------

--
-- Table structure for table `user_vehicle`
--

DROP TABLE IF EXISTS `user_vehicle`;
CREATE TABLE `user_vehicle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `vehicle_id` int(10) UNSIGNED NOT NULL,
  `starts_on` datetime NOT NULL,
  `ends_on` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_vehicle`
--

INSERT INTO `user_vehicle` (`id`, `user_id`, `vehicle_id`, `starts_on`, `ends_on`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2018-05-28 00:00:00', '2018-05-31 00:00:00', '2018-05-28 05:00:00', '2018-05-28 05:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles` (
  `id` int(10) UNSIGNED NOT NULL,
  `manufacturer_id` int(10) UNSIGNED NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int(10) UNSIGNED NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rented` tinyint(1) NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `manufacturer_id`, `model`, `year`, `price`, `link`, `image`, `rented`, `thumbnail`, `created_at`, `updated_at`) VALUES
(1, 5, 'GT-R', 2018, '250.00', 'http://en.wikipedia.org/wiki/Nissan_Gt-r', 'Nissan-GT-R.jpg', 1, 'Nissan-GT-R-thumbnail.jpg', '2018-05-24 23:22:20', '2018-05-24 23:22:20'),
(2, 1, 'M3', 2017, '150.00', 'http://en.wikipedia.org/wiki/Bmw_m3', 'BMW-M3.jpg', 0, 'BMW-M3-thumbnail.jpg', '2018-05-24 16:22:20', '2018-05-24 16:22:20'),
(3, 3, 'TT', 2017, '220.00', 'http://en.wikipedia.org/wiki/Audi_TT', 'Audi-TT.jpg', 0, 'Audi-TT-thumbnail.jpg', '2018-04-24 16:22:20', '2018-04-24 16:22:20'),
(4, 3, 'S5', 2018, '220.00', 'http://en.wikipedia.org/wiki/Audi_S5#Audi_S5', 'Audi-S5.jpg', 0, 'Audi-S5-thumbnail.jpg', '2018-04-30 16:22:20', '2018-04-30 16:22:20'),
(5, 4, 'Civic Type-R', 2018, '98.00', 'https://en.wikipedia.org/wiki/Honda_Civic_Type_R', 'Civic-Type-R.jpg', 0, 'Civic-Type-R-thumbnail.jpg', '2018-05-30 16:22:20', '2018-05-30 16:22:20'),
(6, 2, 'Camry', 2018, '86.00', 'https://en.wikipedia.org/wiki/Toyota_Camry', 'Camry.jpg', 0, 'Camry-thumbnail.jpg', '2018-05-15 16:22:20', '2018-05-15 16:22:20'),
(7, 2, 'Prius', 2017, '78.00', 'https://en.wikipedia.org/wiki/Toyota_Prius', 'Prius.jpg', 0, 'Prius-thumbnail.jpg', '2018-05-18 16:22:20', '2018-05-18 16:22:20'),
(8, 6, 'Spark', 2017, '48.00', 'https://en.wikipedia.org/wiki/Chevrolet_Spark', 'Spark.jpg', 0, 'Spark-thumbnail.jpg', '2018-05-21 16:22:20', '2018-05-21 16:22:20'),
(9, 7, 'XV', 2017, '90.00', 'https://de.wikipedia.org/wiki/Subaru_XV', 'XV.jpg', 0, 'XV-thumbnail.jpg', '2018-05-21 16:22:20', '2018-05-21 16:22:20'),
(10, 7, 'Impreza', 2017, '60.00', 'https://en.wikipedia.org/wiki/Subaru_Impreza', 'Impreza.jpg', 0, 'Impreza-thumbnail.jpg', '2018-05-21 16:22:20', '2018-05-21 16:22:20'),
(11, 8, 'Focus', 205, '54.00', 'https://en.wikipedia.org/wiki/Ford_Focus', 'Focus.jpg', 0, 'Focus-thumbnail.jpg', '2018-05-21 16:22:20', '2018-05-21 16:22:20'),
(12, 2, 'Rav 4', 2017, '88.00', 'https://en.wikipedia.org/wiki/Toyota_RAV4', 'Rav4.jpg', 0, 'Rav4-thumbnail.jpg', '2018-05-18 16:22:20', '2018-05-18 16:22:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_vehicle`
--
ALTER TABLE `user_vehicle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_vehicle_user_id_foreign` (`user_id`),
  ADD KEY `user_vehicle_vehicle_id_foreign` (`vehicle_id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_vehicle`
--
ALTER TABLE `user_vehicle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_vehicle`
--
ALTER TABLE `user_vehicle`
  ADD CONSTRAINT `user_vehicle_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_vehicle_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
