-- phpMyAdmin SQL Dump
-- version 5.0.4deb2ubuntu5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 27, 2022 at 01:06 PM
-- Server version: 8.0.28-0ubuntu0.21.10.3
-- PHP Version: 8.0.8
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;
/*!40101 SET NAMES utf8mb4 */
;
--
-- Database: `GESCOM`
--
-- --------------------------------------------------------
--
-- Table structure for table `categories`
--
CREATE TABLE `categories` (
  `cat_id` int NOT NULL,
  `cat_name` varchar(200) DEFAULT NULL,
  `cat_parent_id` int DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
-- --------------------------------------------------------
--
-- Table structure for table `customers`
--
CREATE TABLE `customers` (
  CREATE USER 'nom_utilisateur' @'adresse_ip' IDENTIFIED BY 'mot_de_passe';
`cus_id` int NOT NULL,
`cus_lastname` varchar(50) NOT NULL,
`cus_firstname` varchar(50) NOT NULL,
`cus_address` varchar(150) NOT NULL,
`cus_zipcode` varchar(5) NOT NULL,
`cus_city` varchar(50) NOT NULL,
`cus_mail` varchar(75) DEFAULT NULL,
`cus_phone` int DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
-- --------------------------------------------------------
--
-- Table structure for table `details`
--
CREATE TABLE `details` (
  `det_id` int NOT NULL,
  `det_price` decimal(6, 2) NOT NULL,
  `det_quantity` int NOT NULL,
  `pro_id` int NOT NULL,
  `ord_id` int NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
-- --------------------------------------------------------
--
-- Table structure for table `orders`
--
CREATE TABLE `orders` (
  `ord_id` int NOT NULL,
  `ord_order_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ord_ship_date` date DEFAULT NULL,
  `ord_bill_date` date DEFAULT NULL,
  `ord_reception_date` date DEFAULT NULL,
  `ord_status` varchar(25) NOT NULL,
  `cus_id` int NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
-- --------------------------------------------------------
--
-- Table structure for table `products`
--
CREATE TABLE `products` (
  `pro_id` int NOT NULL,
  `pro_ref` varchar(10) NOT NULL,
  `pro_name` varchar(200) NOT NULL,
  `pro_desc` text NOT NULL,
  `pro_price` decimal(6, 2) NOT NULL,
  `pro_stock` smallint DEFAULT NULL,
  `pro_color` varchar(30) DEFAULT NULL,
  `pro_picture` varchar(40) DEFAULT NULL,
  `pro_add_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pro_update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pro_publish` tinyint(1) NOT NULL,
  `cat_id` int NOT NULL,
  `sup_id` int NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
-- --------------------------------------------------------
--
-- Table structure for table `suppliers`
--
CREATE TABLE `suppliers` (
  `sup_id` int NOT NULL,
  `sup_name` varchar(50) NOT NULL,
  `sup_city` varchar(50) NOT NULL,
  `sup_address` varchar(150) NOT NULL,
  `sup_mail` varchar(75) DEFAULT NULL,
  `sup_phone` varchar(10) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
--
-- Indexes for dumped tables
--
--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
ADD PRIMARY KEY (`cat_id`),
  ADD KEY `categories_ibfk_1` (`cat_parent_id`);
--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
ADD PRIMARY KEY (`cus_id`);
--
-- Indexes for table `details`
--
ALTER TABLE `details`
ADD PRIMARY KEY (`det_id`),
  ADD KEY `pro_id` (`pro_id`),
  ADD KEY `ord_id` (`ord_id`);
--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
ADD PRIMARY KEY (`ord_id`),
  ADD KEY `cus_id` (`cus_id`);
--
-- Indexes for table `products`
--
ALTER TABLE `products`
ADD PRIMARY KEY (`pro_id`);
--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
ADD PRIMARY KEY (`sup_id`);
--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
MODIFY `cat_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
MODIFY `cus_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
MODIFY `det_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
MODIFY `ord_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
MODIFY `pro_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
MODIFY `sup_id` int NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--
--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`cat_parent_id`) REFERENCES `categories` (`cat_id`) ON DELETE
SET NULL ON UPDATE
SET NULL;
--
-- Constraints for table `details`
--
ALTER TABLE `details`
ADD CONSTRAINT `details_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `products` (`pro_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `details_ibfk_2` FOREIGN KEY (`ord_id`) REFERENCES `orders` (`ord_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`cus_id`) REFERENCES `customers` (`cus_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;