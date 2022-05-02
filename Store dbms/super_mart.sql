-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2022 at 04:20 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `super_mart`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_id` int(11) NOT NULL,
  `Fname` varchar(20) DEFAULT NULL,
  `Mname` varchar(20) DEFAULT NULL,
  `Lname` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Contact_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_id`, `Fname`, `Mname`, `Lname`, `Email`, `Contact_number`) VALUES
(1, 'Pratk', 'P', 'Shrivastav', 'xyz@gmail.com', 2147483647),
(2, 'Rajit', NULL, 'Shetty', 'qwe@gmail.com', 2147483647),
(3, 'Juhi', 'B', 'Ramod', 'asd@gmail.com', 2147483647),
(4, 'Shubhom', NULL, 'Rawat', 'poi@gmail.com', 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `Product_Name` varchar(30) DEFAULT NULL,
  `Product_description` varchar(100) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Product_Type` varchar(50) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `Product_Name`, `Product_description`, `Quantity`, `Product_Type`, `Price`) VALUES
(1, 'Buiscuit', 'Good', 100, 'snacks', 50),
(2, 'Sprite', NULL, 100, 'soft-drink', 90),
(3, 'Sugar', NULL, 120, 'ingridents', 20),
(4, 'Chips', NULL, 50, 'Snacks', 10),
(5, 'Broom', NULL, 20, 'Cleaning', 200),
(6, 'rice', NULL, 120, 'Food', 18),
(7, 'soap', NULL, 50, 'utilities', 25),
(8, 'dish wash', NULL, 100, 'utilities', 10),
(9, 'maggie', NULL, 100, 'snacks', 30),
(10, 'Tomato sauce', NULL, 20, 'add on', 40),
(11, 'Oreo', 'nice', 100, 'Biscuits', 20),
(12, 'Bourbon', 'nice', 100, 'Biscuits', 20),
(13, 'milk', 'healty', 20, 'dairy', 23);

-- --------------------------------------------------------

--
-- Table structure for table `provides`
--

CREATE TABLE `provides` (
  `date_of_supply` datetime NOT NULL,
  `product_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `provides`
--

INSERT INTO `provides` (`date_of_supply`, `product_id`, `supplier_id`, `stock`) VALUES
('2022-04-07 00:00:00', 4, 2, 100),
('2022-04-06 00:00:00', 7, 1, 50);

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `date_of_purchase` date DEFAULT NULL,
  `Order_number` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`date_of_purchase`, `Order_number`, `product_id`, `customer_id`) VALUES
('2022-04-08', 100, 5, 2),
('2022-04-08', 101, 9, 4);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `Supplier_id` int(11) NOT NULL,
  `Supplier_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`Supplier_id`, `Supplier_name`) VALUES
(1, 'supplier 1'),
(2, 'supplier 2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `provides`
--
ALTER TABLE `provides`
  ADD KEY `fk_provides` (`product_id`),
  ADD KEY `fk_provides2` (`supplier_id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD UNIQUE KEY `Order_number` (`Order_number`),
  ADD KEY `fk_purchase` (`product_id`),
  ADD KEY `fk_purchase1` (`customer_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`Supplier_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `Order_number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `provides`
--
ALTER TABLE `provides`
  ADD CONSTRAINT `fk_provides` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `fk_provides2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`Supplier_id`);

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `fk_purchase` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `fk_purchase1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`Customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
