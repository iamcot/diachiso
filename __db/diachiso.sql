-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 29, 2013 at 05:49 PM
-- Server version: 5.6.14
-- PHP Version: 5.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `diachiso`
--

-- --------------------------------------------------------

--
-- Table structure for table `dacomment`
--

CREATE TABLE IF NOT EXISTS `dacomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `daserviceplace_id` int(11) NOT NULL,
  `dastatus` int(11) NOT NULL,
  `dacontent` text COLLATE utf8_unicode_ci NOT NULL,
  `dacreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dadeal`
--

CREATE TABLE IF NOT EXISTS `dadeal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `daserviceplace_id` int(11) NOT NULL,
  `dalong_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `daurl` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `datype` int(11) NOT NULL,
  `daamount` int(11) NOT NULL,
  `daedit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dacreate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dadeleted` int(11) NOT NULL,
  `dafrom` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dato` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dadeal_user`
--

CREATE TABLE IF NOT EXISTS `dadeal_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dadeal_id` int(11) NOT NULL,
  `dauser_id` int(11) NOT NULL,
  `dacreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dadelete` int(11) NOT NULL,
  `dacomment` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dadistrict`
--

CREATE TABLE IF NOT EXISTS `dadistrict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dalong_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `daurl` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `dainfo` text COLLATE utf8_unicode_ci NOT NULL,
  `damap` text COLLATE utf8_unicode_ci NOT NULL,
  `dadeleted` tinyint(4) NOT NULL,
  `daprovince_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `dadistrict`
--

INSERT INTO `dadistrict` (`id`, `dalong_name`, `daurl`, `dainfo`, `damap`, `dadeleted`, `daprovince_id`) VALUES
(1, 'Bình Thạnh', 'binh-thanh', 'bt2', 'mapbbbb', 0, 2),
(2, 'Hai Bà Trưng', 'hai-ba-trung', '', '', 0, 1),
(3, 'Hoàn Kiếm', 'hoan-kiem', '', '', 0, 1),
(4, 'Tây Hồ', 'tay-ho', '', '', 0, 1),
(5, 'Tân Bình', 'tan-binh', '', '', 0, 2),
(6, 'Phú Nhuận', 'phu-nhuan', '', '', 0, 2),
(7, 'Quận 1', 'quan-1', '', '', 0, 2),
(8, 'Quận 2', 'quan-2', '', '', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `dapic`
--

CREATE TABLE IF NOT EXISTS `dapic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `daserviceplace_id` int(11) NOT NULL,
  `dauser_id` int(11) NOT NULL,
  `dacontent` text COLLATE utf8_unicode_ci NOT NULL,
  `dacreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `daprovince`
--

CREATE TABLE IF NOT EXISTS `daprovince` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `dalong_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `daurl` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dainfo` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `damap` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dadeleted` tinyint(4) NOT NULL,
  `daorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `daprovince`
--

INSERT INTO `daprovince` (`id`, `dalong_name`, `daurl`, `dainfo`, `damap`, `dadeleted`, `daorder`) VALUES
(1, 'Hà Nội', 'ha-noi', 'Thủ đô Hà Nội', 'map', 0, 1),
(2, 'Sài Gòn', 'sai-gon', 'Thành phố Hồ Chí Minh', '', 0, 1),
(3, 'Đồng Tháp', 'dong-thap', 'Tỉnh Đồng Tháp', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `darate`
--

CREATE TABLE IF NOT EXISTS `darate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `daserviceplace_id` int(11) NOT NULL,
  `dauser_id` int(11) NOT NULL,
  `darate` int(11) NOT NULL,
  `dacreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `daservice`
--

CREATE TABLE IF NOT EXISTS `daservice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dalong_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `daurl` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dainfo` text COLLATE utf8_unicode_ci NOT NULL,
  `dashowhome` tinyint(4) NOT NULL,
  `dadeleted` tinyint(4) NOT NULL,
  `daservicegroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `daservice_group`
--

CREATE TABLE IF NOT EXISTS `daservice_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dalong_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `daurl` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dainfo` text COLLATE utf8_unicode_ci NOT NULL,
  `dashowhome` tinyint(4) NOT NULL,
  `dadeleted` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `daservice_news`
--

CREATE TABLE IF NOT EXISTS `daservice_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `daserviceplace_id` int(11) NOT NULL,
  `dalong_name` text COLLATE utf8_unicode_ci NOT NULL,
  `daurl` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `daedit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dacreate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dacontent` text COLLATE utf8_unicode_ci NOT NULL,
  `dacontent_short` text COLLATE utf8_unicode_ci NOT NULL,
  `dadeleted` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `daservice_place`
--

CREATE TABLE IF NOT EXISTS `daservice_place` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dalong_name` text COLLATE utf8_unicode_ci NOT NULL,
  `daurl` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dainfo` text COLLATE utf8_unicode_ci NOT NULL,
  `damap` text COLLATE utf8_unicode_ci NOT NULL,
  `dadeleted` tinyint(4) NOT NULL,
  `dastreet_id` int(11) NOT NULL,
  `daservice_id` int(11) NOT NULL,
  `dapic` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `daaddr` text COLLATE utf8_unicode_ci NOT NULL,
  `datel` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `damobi` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `dafax` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `daview` int(11) NOT NULL,
  `dacomment` int(11) NOT NULL,
  `dalike` int(11) NOT NULL,
  `daedit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dacreate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `daprovince_id` int(11) NOT NULL DEFAULT '0',
  `dadistrict_id` int(11) NOT NULL DEFAULT '0',
  `daward_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dastreet`
--

CREATE TABLE IF NOT EXISTS `dastreet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dalong_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `daurl` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `dainfo` text COLLATE utf8_unicode_ci NOT NULL,
  `damap` text COLLATE utf8_unicode_ci NOT NULL,
  `dadeleted` tinyint(4) NOT NULL,
  `daward_id` int(11) NOT NULL,
  `daprovince_id` int(11) NOT NULL DEFAULT '0',
  `dadistrict_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `dastreet`
--

INSERT INTO `dastreet` (`id`, `dalong_name`, `daurl`, `dainfo`, `damap`, `dadeleted`, `daward_id`, `daprovince_id`, `dadistrict_id`) VALUES
(1, 'Duong cay me 2', 'duong-cay-me2', '', '', 0, 2, 0, 0),
(2, 'Duong Vui Ve', 'duong-vui-ve2', 'info', 'map', 1, 5, 0, 0),
(3, 'Duong cay Tram', 'cay-tram', 'info', 'map', 0, 2, 0, 0),
(4, 'Duong abc', 'duong-abc', '', '', 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dauser`
--

CREATE TABLE IF NOT EXISTS `dauser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dausername` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `dapassword` int(50) NOT NULL,
  `daavatar` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `darole` int(11) NOT NULL,
  `dastatus` int(11) NOT NULL,
  `daedit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dacreate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `damobi` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `daemail` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `daaddr` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `daward`
--

CREATE TABLE IF NOT EXISTS `daward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dalong_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `daurl` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `dainfo` text COLLATE utf8_unicode_ci NOT NULL,
  `damap` text COLLATE utf8_unicode_ci NOT NULL,
  `dadeleted` tinyint(4) NOT NULL,
  `dadistrict_id` int(11) NOT NULL,
  `daprovince_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `daward`
--

INSERT INTO `daward` (`id`, `dalong_name`, `daurl`, `dainfo`, `damap`, `dadeleted`, `dadistrict_id`, `daprovince_id`) VALUES
(1, 'Phuong 1', 'phuong-1', '', '', 0, 2, 0),
(2, 'Phuong 1', 'phuong-1', '', '', 0, 5, 0),
(3, 'Phuong 2', 'phuong-2', '', '', 0, 5, 0),
(4, 'Phuong 3', 'phuong-3', 'info 4', 'map 3', 0, 5, 0),
(5, 'phuong 12', 'phuong-12', '', '', 0, 1, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
