-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 06, 2019 at 02:00 PM
-- Server version: 10.3.14-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id9628365_igrocery`
--
CREATE DATABASE IF NOT EXISTS `id9628365_igrocery` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `id9628365_igrocery`;

-- --------------------------------------------------------

--
-- Table structure for table `CART`
--

DROP TABLE IF EXISTS `CART`;
CREATE TABLE `CART` (
  `PRODID` varchar(10) NOT NULL,
  `USERID` varchar(40) NOT NULL,
  `QUANTITY` varchar(10) NOT NULL,
  `PRICE` varchar(10) NOT NULL,
  `PRODNAME` varchar(30) NOT NULL,
  `STATUS` varchar(20) NOT NULL,
  `GROCID` varchar(10) NOT NULL,
  `ORDERID` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CART`
--

INSERT INTO `CART` (`PRODID`, `USERID`, `QUANTITY`, `PRICE`, `PRODNAME`, `STATUS`, `GROCID`, `ORDERID`) VALUES
('12', '0194702493', '1', '5.50', 'Paneer Masalla', 'paid', '2', '08052019-5R8FLGn'),
('32', '012345678', '1', '', 'Trout', 'not paid', '3', '06062019-Q43mWOf'),
('43', 'ram@gmail.com', '1', '4.00', 'Grapes', 'not paid', '4', '05062019-MUtu5zI'),
('42', '012345678', '1', '2.50', 'apples', 'not paid', '4', '06062019-Q43mWOf'),
('23', '012345678', '1', '', 'Toast', 'not paid', '2', '06062019-Q43mWOf'),
('21', '012345678', '8', '', 'Baguette', 'not paid', '2', '06062019-Q43mWOf'),
('42', '012345678', '1', '', 'apples', 'not paid', '4', '06062019-Q43mWOf'),
('63', '012345678', '1', '6.00', 'Yogurt', 'not paid', '6', '06062019-Q43mWOf'),
('63', '012345678', '1', '6.00', 'Yogurt', 'not paid', '6', '06062019-Q43mWOf'),
('31', '012345678', '1', '', 'salmon', 'not paid', '3', '06062019-Q43mWOf'),
('24', '012345678', '1', '4.50', 'cakes', 'not paid', '2', '06062019-Q43mWOf'),
('43', '012345678', '1', '4.00', 'Grapes', 'not paid', '4', '06062019-Q43mWOf'),
('64', '012345678', '1', '3.50', 'Milk', 'not paid', '6', '06062019-Q43mWOf'),
('42', '012345678', '', '2.50', 'apples', 'not paid', '4', '06062019-Q43mWOf'),
('24', '012345678', '', '4.50', 'cakes', 'not paid', '2', '06062019-Q43mWOf'),
('24', '012345678', '', '', 'cakes', 'not paid', '2', '06062019-Q43mWOf'),
('24', '012345678', '', '4.50', 'cakes', 'not paid', '2', '06062019-Q43mWOf'),
('42', '012345678', '1', '2.50', 'apples', 'not paid', '4', '06062019-Q43mWOf'),
('41', '012345678', '1', '2.50', 'banana', 'not paid', '4', '06062019-Q43mWOf'),
('11', '012345678', '1', '5.00', 'turmeric', 'not paid', '1', '06062019-Q43mWOf'),
('42', '012345678', '1', '', 'apples', 'not paid', '4', '06062019-Q43mWOf'),
('31', '012345678', '1', '2.00', 'salmon', 'not paid', '3', '06062019-Q43mWOf'),
('43', '012345678', '1', '4.00', 'Grapes', 'not paid', '4', '06062019-Q43mWOf'),
('13', '012345678', '1', '3.00', 'fenugreek', 'not paid', '1', '06062019-Q43mWOf'),
('43', '012345678', '1', '4.00', 'Grapes', 'not paid', '4', '06062019-Q43mWOf'),
('42', '012345678', '1', '2.50', 'apples', 'not paid', '4', '06062019-Q43mWOf'),
('12', '012345678', '7', '1.00', 'paprika', 'not paid', '1', '06062019-Q43mWOf'),
('13', '012345678', '6', '3.00', 'fenugreek', 'not paid', '1', '06062019-Q43mWOf'),
('43', '012345678', '1', '4.00', 'Grapes', 'not paid', '4', '06062019-Q43mWOf'),
('22', '012345678', '1', '4.50', 'crossoint', 'not paid', '2', '06062019-Q43mWOf'),
('12', '011456879', '1', '1.00', 'paprika', 'not paid', '1', '06062019-AEj5plN');

-- --------------------------------------------------------

--
-- Table structure for table `GROCERY`
--

DROP TABLE IF EXISTS `GROCERY`;
CREATE TABLE `GROCERY` (
  `GROCID` int(10) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `PHONE` varchar(20) NOT NULL,
  `ADDRESS` varchar(200) NOT NULL,
  `LOCATION` varchar(20) NOT NULL,
  `LATITUDE` varchar(30) NOT NULL,
  `LONGITUDE` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `GROCERY`
--

INSERT INTO `GROCERY` (`GROCID`, `NAME`, `PHONE`, `ADDRESS`, `LOCATION`, `LATITUDE`, `LONGITUDE`) VALUES
(1, 'Spice World', '01934558488', 'PittStreet', 'Penang', '5.4164', '100.3327'),
(2, 'Mr Bread', '01934558478', 'Armenian Street', 'Georgetown', '5.4356', '100.3091'),
(3, 'Fish Store', '01934559648', 'China town', 'Penang', '5.4164', '100.3327'),
(4, 'Fruit Land', '018564646888', 'Jalan Kassime', 'Georgetown', '5.4356', '100.3091'),
(7, 'Crazy Nuts', '0159878654', 'Mccallister Street', 'Perai', '5.38333', '100.38333'),
(6, 'Mama Dairy', '016894845', 'Jalan Mercury', 'Penang', '5.4164', '100.3327');

-- --------------------------------------------------------

--
-- Table structure for table `ORDERED`
--

DROP TABLE IF EXISTS `ORDERED`;
CREATE TABLE `ORDERED` (
  `ORDERID` varchar(20) NOT NULL,
  `USERID` varchar(10) NOT NULL,
  `TOTAL` varchar(10) NOT NULL,
  `DATE` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ORDERED`
--

INSERT INTO `ORDERED` (`ORDERID`, `USERID`, `TOTAL`, `DATE`) VALUES
('08052019-qxgbUmp', '0194702493', '15.5', '2019-05-08 15:22:51.247162'),
('08052019-Oi6XCFF', '0194702493', '37.3', '2019-05-08 16:05:18.157234');

-- --------------------------------------------------------

--
-- Table structure for table `PRODUCT`
--

DROP TABLE IF EXISTS `PRODUCT`;
CREATE TABLE `PRODUCT` (
  `PRODID` int(11) NOT NULL,
  `PRODNAME` varchar(50) NOT NULL,
  `PRODPRICE` varchar(5) NOT NULL,
  `QUANTITY` varchar(5) NOT NULL,
  `GROCID` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PRODUCT`
--

INSERT INTO `PRODUCT` (`PRODID`, `PRODNAME`, `PRODPRICE`, `QUANTITY`, `GROCID`) VALUES
(11, 'turmeric', '5.00', '46', '1'),
(24, 'cakes', '4.50', '18', '2'),
(31, 'salmon', '2.00', '98', '3'),
(41, 'banana', '2.50', '27', '4'),
(61, 'butter', '2.50', '29', '6'),
(71, 'pistacio', '2.50', '29', '7'),
(12, 'paprika', '1.00', '38', '1'),
(22, 'crossoint', '4.50', '27', '2'),
(32, 'Trout', '2.00', '49', '3'),
(42, 'apples', '2.50', '25', '4'),
(62, 'cheese', '5.00', '47', '6'),
(72, 'hazelnut', '4.50', '89', '7'),
(13, 'fenugreek', '3.00', '41', '1'),
(14, 'Cumin', '5.00', '49', '1'),
(15, 'Chilli powder', '2.00', '49', '1'),
(21, 'Baguette', '4.50', '41', '2'),
(23, 'Toast', '2.50', '18', '2'),
(33, 'Cod', '5.00', '49', '3'),
(34, 'Tuna', '19.00', '5', '3'),
(35, 'Mussel', '13.00', '2', '3'),
(36, 'Cuttle Fish', '5.00', '30', '3'),
(37, 'Oyster', '6.00', '30', '3'),
(43, 'Grapes', '4.00', '25', '4'),
(44, 'Blueberries', '4.00', '30', '4'),
(45, 'Oranges', '4.00', '30', '4'),
(46, 'Lemon', '4.00', '30', '4'),
(73, 'Cashew', '7.00', '29', '7'),
(74, 'Almond', '8.00', '30', '7'),
(75, 'Walnut', '6.50', '30', '7'),
(63, 'Yogurt', '6.00', '28', '6'),
(64, 'Milk', '3.50', '29', '6');

-- --------------------------------------------------------

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
CREATE TABLE `USER` (
  `EMAIL` varchar(100) NOT NULL,
  `PASSWORD` varchar(60) NOT NULL,
  `PHONE` varchar(15) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `LOCATION` varchar(15) NOT NULL,
  `LATITUDE` varchar(30) NOT NULL,
  `LONGITUDE` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `USER`
--

INSERT INTO `USER` (`EMAIL`, `PASSWORD`, `PHONE`, `NAME`, `LOCATION`, `LATITUDE`, `LONGITUDE`) VALUES
('slumberjer@gmail.com', '8cb2237d0679ca88db6464eac60da96345513964', '0194702493', 'Ahmad Hanis', 'Changlun', '6.443224050268126', '100.42504772543909'),
('ram@gmail.com', 'ram', '012345678', 'ramana kalidass', 'Penang', '8.498476745475565', '100.47543987549875'),
('ramanakalidass11@gmail.com', 'ramana', '011456879', 'Ramana', 'Penang', '8.498476745475565', '100.47543987549875');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `GROCERY`
--
ALTER TABLE `GROCERY`
  ADD PRIMARY KEY (`GROCID`);

--
-- Indexes for table `PRODUCT`
--
ALTER TABLE `PRODUCT`
  ADD PRIMARY KEY (`PRODID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `GROCERY`
--
ALTER TABLE `GROCERY`
  MODIFY `GROCID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `PRODUCT`
--
ALTER TABLE `PRODUCT`
  MODIFY `PRODID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
