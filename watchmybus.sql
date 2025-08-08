-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2025 at 06:39 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `watchmybus`
--

-- --------------------------------------------------------

--
-- Table structure for table `bus_routes`
--

CREATE TABLE `bus_routes` (
  `id` int(11) NOT NULL,
  `busStops` longtext DEFAULT NULL,
  `endPoint` varchar(255) DEFAULT NULL,
  `routeName` varchar(255) DEFAULT NULL,
  `startPoint` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus_routes`
--

INSERT INTO `bus_routes` (`id`, `busStops`, `endPoint`, `routeName`, `startPoint`) VALUES
(3, 'Hadakhed,', 'Palasner', 'Agara Highway', 'Shirpur'),
(4, 'Pharmacy college,Anand Creation', 'Karvand', 'Karvand Naka road', 'Karvand Naka'),
(5, 'Baker point,Nimzari naka', 'RCPIT College', 'Nimzari Naka Road', 'Karvand naka'),
(6, 'Trends,jai-laxmi', 'Bus stand', 'Bus-stand road', 'Karvand naka');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `contact` bigint(20) NOT NULL,
  `busNumber` varchar(255) DEFAULT NULL,
  `currentLocation` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `routeId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`contact`, `busNumber`, `currentLocation`, `email`, `name`, `password`, `routeId`) VALUES
(8639567456, '45-105', 'Karvand naka', 'satyam@gmail.com', 'Satyam', '1234', 5),
(8967845698, '45-104', 'Highway', 'om@gmail.com', 'Om', '1234', 3),
(9172623917, '45-103', 'Shirpur', 'kulashri@gmail.com', 'Kulashri', '1234', 6),
(9172623918, '45-103', 'Shirpur', 'kulashri@gmail.com', 'Kulashri', '1234', 6),
(9968963254, '45-102', 'Shirpur', 'darshana@gmail.com', 'Darshana', '1234', 3);

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE `parent` (
  `name` varchar(255) NOT NULL,
  `busNumber` varchar(255) DEFAULT NULL,
  `childName` varchar(255) DEFAULT NULL,
  `contact` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `routeId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parent`
--

INSERT INTO `parent` (`name`, `busNumber`, `childName`, `contact`, `email`, `password`, `routeId`) VALUES
('Madhavi', '45-104', 'Nora', 9856369851, 'madhavi@gmail.com', '1234', 3),
('Rekha', '45-108', 'Sattu', 7507716924, 'rekha@gmail.com', '1234', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bus_routes`
--
ALTER TABLE `bus_routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`contact`),
  ADD KEY `FKkocx6t7bh1nnbokptbfdtxpmy` (`routeId`);

--
-- Indexes for table `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`name`),
  ADD KEY `FKdpjhhpjpfp8394kqscovqi389` (`routeId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bus_routes`
--
ALTER TABLE `bus_routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `FKkocx6t7bh1nnbokptbfdtxpmy` FOREIGN KEY (`routeId`) REFERENCES `bus_routes` (`id`);

--
-- Constraints for table `parent`
--
ALTER TABLE `parent`
  ADD CONSTRAINT `FKdpjhhpjpfp8394kqscovqi389` FOREIGN KEY (`routeId`) REFERENCES `bus_routes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
