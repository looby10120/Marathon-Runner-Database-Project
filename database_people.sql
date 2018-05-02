-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2018 at 04:04 PM
-- Server version: 5.5.57-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `database_people`
--

-- --------------------------------------------------------

--
-- Table structure for table `Event`
--

CREATE TABLE IF NOT EXISTS `Event` (
  `Event_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Event_name` varchar(45) NOT NULL,
  `Date` date NOT NULL,
  `Status` binary(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Event_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Event`
--

INSERT INTO `Event` (`Event_ID`, `Event_name`, `Date`, `Status`) VALUES
(1, 'KMUTNB Walk-Run Marathon #1', '2016-01-10', '0'),
(2, 'KMUTNB Walk-Run Marathon #2', '2017-08-15', '1');

-- --------------------------------------------------------

--
-- Table structure for table `Result`
--

CREATE TABLE IF NOT EXISTS `Result` (
  `Result_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Running_no` varchar(45) CHARACTER SET utf8 NOT NULL,
  `Result` time NOT NULL,
  PRIMARY KEY (`Result_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Running_types`
--

CREATE TABLE IF NOT EXISTS `Running_types` (
  `Running_type_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(20) NOT NULL,
  PRIMARY KEY (`Running_type_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `Running_types`
--

INSERT INTO `Running_types` (`Running_type_ID`, `Type`) VALUES
(1, 'FUN'),
(2, 'M10'),
(3, 'M20'),
(4, 'M30'),
(5, 'M40'),
(6, 'M50'),
(7, 'M60'),
(8, 'F10'),
(9, 'F20'),
(10, 'F30'),
(11, 'F40'),
(12, 'F50'),
(13, 'F60');

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE IF NOT EXISTS `User` (
  `User_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Event_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Surname` varchar(255) NOT NULL,
  `Gender` tinyint(1) NOT NULL,
  `Age` int(11) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Address` varchar(1023) NOT NULL,
  `Telephone` varchar(45) NOT NULL,
  `Running_type_ID` int(11) NOT NULL,
  `Running_no` varchar(45) NOT NULL,
  `Created_on` datetime NOT NULL,
  `Updated_on` datetime NOT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`User_ID`, `Event_ID`, `Name`, `Surname`, `Gender`, `Age`, `Email`, `Address`, `Telephone`, `Running_type_ID`, `Running_no`, `Created_on`, `Updated_on`) VALUES
(1, 2, 'David', 'Morgan', 1, 35, 'dm@hotmail.com', '458/963', '0254498731', 0, 'M301', '2018-04-25 02:33:08', '0000-00-00 00:00:00'),
(2, 2, 'Mickey', 'Jackson', 1, 38, 'MJ@hotmail.com', '158/74', '0614875324', 0, 'M30401', '2018-04-25 02:34:27', '0000-00-00 00:00:00'),
(3, 2, 'Susan', 'Strong', 0, 20, 'ss@hotmail.com', '458/796', '028475651', 0, 'F201', '2018-04-25 02:36:19', '0000-00-00 00:00:00'),
(4, 2, 'Lily', 'Potter', 0, 25, 'LP@hotmail.com', '155/748', '0125479963', 0, 'F202', '2018-04-25 02:40:51', '0000-00-00 00:00:00'),
(5, 2, 'fsdf', 'aewgtegw', 0, 28, 'EWWEA', 'EWGRE', '6746848451', 0, 'F203', '2018-04-25 02:54:43', '0000-00-00 00:00:00'),
(6, 2, 'wgew', 'eyrsrutr', 1, 30, 'fwetatr', 'rgesgrev', '5763757538', 0, 'M303', '2018-04-25 02:55:07', '0000-00-00 00:00:00'),
(7, 2, 'efeergew', 'ruytkumyh', 1, 54, 'ewtwytw', 'etruytjykyt', '016874984', 0, 'FUN1', '2018-04-25 02:56:20', '0000-00-00 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
