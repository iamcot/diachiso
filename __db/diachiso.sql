-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 02, 2013 at 02:58 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


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

--
-- Dumping data for table `dacomment`
--


-- --------------------------------------------------------

--
-- Table structure for table `dadeal`
--

CREATE TABLE IF NOT EXISTS `dadeal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `daserviceplace_id` int(11) NOT NULL,
  `dalong_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `daurl` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `datype` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `daamount` int(11) NOT NULL,
  `daedit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dacreate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dadeleted` int(11) NOT NULL,
  `dafrom` int(11) NOT NULL,
  `dato` int(11) NOT NULL,
  `daspecial` text COLLATE utf8_unicode_ci NOT NULL,
  `dacondition` text COLLATE utf8_unicode_ci NOT NULL,
  `daview` int(11) NOT NULL,
  `dacomment` int(11) NOT NULL,
  `dalike` int(11) NOT NULL,
  `dauser_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `dadeal`
--

INSERT INTO `dadeal` (`id`, `daserviceplace_id`, `dalong_name`, `daurl`, `datype`, `daamount`, `daedit`, `dacreate`, `dadeleted`, `dafrom`, `dato`, `daspecial`, `dacondition`, `daview`, `dacomment`, `dalike`, `dauser_id`) VALUES
(1, 5, 'Khuyến mãi tại cửa hàng bánh Kinh Đô', 'khuyen-mai-tai-cua-hang-banh-kinh-do', 'percent', 50, '2013-12-02 02:37:50', '2013-12-02 02:37:50', 0, 1385859001, 1388496602, '<p>ko co gi</p>\n\n<p>sss</p>\n', '<p>thoai mai<br />\nwwww</p>\n', 0, 0, 0, 1);

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

--
-- Dumping data for table `dadeal_user`
--


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
(1, 'Bình Thạnh', 'binh-thanh', 'bt2', 'http://maps.google.com/maps/api/staticmap?center=10.8105831,106.7091422&zoom=13&size=200x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|10.8105831,106.7091422', 0, 2),
(2, 'Hai Bà Trưng', 'hai-ba-trung', '', '', 0, 1),
(3, 'Hoàn Kiếm', 'hoan-kiem', '', '', 0, 1),
(4, 'Tây Hồ', 'tay-ho', '', '', 0, 1),
(5, 'Quận Tân Bình', 'tan-binh', '', '<img src=http://maps.google.com/maps/api/staticmap?center=10.8084306,106.6468148&zoom=15&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|10.8084306,106.6468148>', 0, 2),
(6, 'Phú Nhuận', 'phu-nhuan', '', 'http://maps.google.com/maps/api/staticmap?center=10.7984723,106.67924&zoom=14&size=200x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|10.7984723,106.67924', 0, 2),
(7, 'Quận 1', 'quan-1', '', 'http://maps.google.com/maps/api/staticmap?center=10.7756587,106.7004238&zoom=14&size=200x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|10.7756587,106.7004238', 0, 2),
(8, 'Quận 2', 'quan-2', '', 'http://maps.google.com/maps/api/staticmap?center=10.7967947,106.7588494&zoom=12&size=200x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|10.7967947,106.7588494', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `dapic`
--

CREATE TABLE IF NOT EXISTS `dapic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `daserviceplace_id` int(11) NOT NULL,
  `dauser_id` int(11) NOT NULL DEFAULT '1',
  `dapic` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `dacaption` text COLLATE utf8_unicode_ci NOT NULL,
  `dacreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `dapic`
--

INSERT INTO `dapic` (`id`, `daserviceplace_id`, `dauser_id`, `dapic`, `dacaption`, `dacreate`) VALUES
(1, 4, 1, '6de18d19a3bfbf97be78cb18ebc38d95.jpg', 'a', '2013-11-30 21:58:17'),
(4, 4, 1, '270813b92336465dc7d35b1ce47529ab.jpg', 'váy đỏ', '2013-11-30 22:03:28'),
(11, 4, 1, '447b643981d88492d486dd498b970232.jpg', 'c', '2013-11-30 22:03:01'),
(10, 4, 1, '1046713f0787302e4910079c4a468885.jpg', 'd', '2013-11-30 22:03:01'),
(9, 4, 1, '75485001a75d0b9d44ae6bbf891dc065.jpg', 'e', '2013-11-30 22:03:01'),
(12, 5, 1, 'beaecd7e9814e3616dcf7e03efa53ffb.jpg', 'váy đỏ thời trang', '2013-12-01 01:57:12'),
(13, 5, 1, 'cda159a9fdb487e7f5eb7de973ebacc3.jpg', 'hồng lãng xẹt :v', '2013-12-01 01:57:12');

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
(1, 'Hà Nội', 'ha-noi', 'Thủ đô Hà Nội', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0333333,105.85&zoom=13&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0333333,105.85>', 0, 0),
(2, 'TP Hồ Chí Minh', 'ho-chi-minh', 'Thành phố Hồ Chí Minh', 'http://maps.google.com/maps/api/staticmap?center=10.746903,106.676292&zoom=11&size=200x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|10.746903,106.676292', 0, 1),
(3, 'Đồng Tháp', 'dong-thap', 'Tỉnh Đồng Tháp', 'http://maps.google.com/maps/api/staticmap?center=10.4937989,105.6881788&zoom=8&size=200x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|10.4937989,105.6881788', 0, 0);

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

--
-- Dumping data for table `darate`
--


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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `daservice`
--

INSERT INTO `daservice` (`id`, `dalong_name`, `daurl`, `dainfo`, `dashowhome`, `dadeleted`, `daservicegroup_id`) VALUES
(1, 'Trường cấp 3', 'truong-cap-3', 'aaa', 0, 0, 1),
(2, 'Trường cấp 2', 'truong-cap-2', 'truong cap 2', 0, 0, 1),
(3, 'Shop thời trang', 'shop-thoi-trang', '', 0, 0, 4);

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `daurl` (`daurl`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `daservice_group`
--

INSERT INTO `daservice_group` (`id`, `dalong_name`, `daurl`, `dainfo`, `dashowhome`, `dadeleted`) VALUES
(1, 'Giáo dục', 'giao-duc', '', 1, 0),
(2, 'Khách sạn', 'khach-san', '', 1, 0),
(3, 'Nhà hàng', 'nha-hang', 'thong tin nha hang', 1, 0),
(4, 'Mua sắm', 'mua-sam', '', 0, 0);

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

--
-- Dumping data for table `daservice_news`
--


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
  `daemail` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `daview` int(11) NOT NULL,
  `dacomment` int(11) NOT NULL,
  `dalike` int(11) NOT NULL,
  `daedit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dacreate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `daprovince_id` int(11) NOT NULL DEFAULT '0',
  `dadistrict_id` int(11) NOT NULL DEFAULT '0',
  `daward_id` int(11) NOT NULL DEFAULT '0',
  `dauser_id` int(11) NOT NULL DEFAULT '1',
  `daservicegroup_id` int(11) NOT NULL DEFAULT '0',
  `dawebsite` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dalat` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `dalng` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `daservice_place`
--

INSERT INTO `daservice_place` (`id`, `dalong_name`, `daurl`, `dainfo`, `damap`, `dadeleted`, `dastreet_id`, `daservice_id`, `dapic`, `daaddr`, `datel`, `damobi`, `dafax`, `daemail`, `daview`, `dacomment`, `dalike`, `daedit`, `dacreate`, `daprovince_id`, `dadistrict_id`, `daward_id`, `dauser_id`, `daservicegroup_id`, `dawebsite`, `dalat`, `dalng`) VALUES
(1, 'Truong tieu học', 'tieu-hoc', '<p>erterterterterterterter</p>\n', 'http://maps.google.com/maps/api/staticmap?center=10.8061788,106.7074128&zoom=15&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|10.8061788,106.7074128', 0, 0, 2, '44dee95c54ce7b509e5ddc89b7460893.jpg', '234', '0123456', '', '012222', 'thang102@gmail.com', 0, 0, 0, '2013-12-02 01:06:02', '0000-00-00 00:00:00', 2, 1, 5, 1, 1, '', '10.8061788', '106.7074128'),
(2, 'tr', '1', '8', '7', 0, 5, 2, '6', '2', '3', '', '5', '4', 0, 0, 0, '2013-11-30 01:03:09', '0000-00-00 00:00:00', 2, 5, 2, 1, 1, '', '', ''),
(3, 'truong tieu hoc', '1', '2', '7', 0, 3, 1, '6', '2', '3', '', '5', '4', 0, 0, 0, '2013-11-30 03:07:21', '2013-11-29 19:04:47', 2, 5, 2, 1, 0, '', '', ''),
(4, 'Trường dạy chó số 1', 'truong-day-cho', '', 'http://maps.google.com/maps/api/staticmap?center=21.0149155,105.8525097&zoom=14&size=200x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0149155,105.8525097', 0, 0, 2, '428367ece5a4bf2c820416964fbbae32.jpg', '123', '123', '', '234', 'a@g.c', 0, 0, 0, '2013-12-01 23:51:00', '2013-11-29 21:56:49', 1, 2, 1, 1, 1, '', '', ''),
(5, 'CoSi Shop', 'cosi-shop', '<h1>Th&ocirc;ng b&aacute;o mời thầu</h1>\n\n<p><em><span style="color:#FF0000"><s><u>Th&ocirc;ng b&aacute;o</u></s> mời thầu &aacute;đ&acirc;s</span></em></p>\n\n<p style="text-align:right"><strong>Th&ocirc;ng b&aacute;o mời thầu</strong></p>\n\n<p style="text-align:center">Th&ocirc;ng b&aacute;o <sup>mời thầu</sup></p>\n', '<iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=146+Nguy%E1%BB%85n+%C4%90%C3%ACnh+Chi%E1%BB%83u,+Ho+Chi+Minh+City,+Vietnam&amp;aq=0&amp;oq=146&amp;sll=37.0625,-95.677068&amp;sspn=63.856965,91.494141&amp;ie=UTF8&amp;hq=&amp;hnear=146+Nguy%E1%BB%85n+%C4%90%C3%ACnh+Chi%E1%BB%83u,+6,+H%E1%BB%93+Ch%C3%AD+Minh,+Vietnam&amp;t=m&amp;z=14&amp;ll=10.782352,106.693811&amp;output=embed"></iframe><br /><small><a href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=146+Nguy%E1%BB%85n+%C4%90%C3%ACnh+Chi%E1%BB%83u,+Ho+Chi+Minh+City,+Vietnam&amp;aq=0&amp;oq=146&amp;sll=37.0625,-95.677068&amp;sspn=63.856965,91.494141&amp;ie=UTF8&amp;hq=&amp;hnear=146+Nguy%E1%BB%85n+%C4%90%C3%ACnh+Chi%E1%BB%83u,+6,+H%E1%BB%93+Ch%C3%AD+Minh,+Vietnam&amp;t=m&amp;z=14&amp;ll=10.782352,106.693811" style="color:#0000FF;text-align:left">View Larger Map</a></small>', 0, 6, 3, '67327ac26ccbbe935d79ffa4c83af6fb.jpg', '146', '0983717098', '', '', 'cosishop@gmail.com', 0, 0, 0, '2013-12-02 02:53:52', '2013-11-30 18:57:39', 2, 5, 6, 1, 4, 'http://cosishop.com', '10.7975048', '106.6542334');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `dastreet`
--

INSERT INTO `dastreet` (`id`, `dalong_name`, `daurl`, `dainfo`, `damap`, `dadeleted`, `daward_id`, `daprovince_id`, `dadistrict_id`) VALUES
(1, 'Duong cay me 2', 'duong-cay-me2', '', '', 0, 2, 0, 0),
(2, 'Duong Vui Ve', 'duong-vui-ve2', 'info', 'map', 1, 5, 0, 0),
(3, 'Duong cay Tram', 'cay-tram', 'info', 'map', 0, 2, 0, 0),
(4, 'Duong abc', 'duong-abc', 'abc', '', 0, 1, 0, 0),
(5, 'duong 12', 'duong-12', '', '', 0, 2, 0, 0),
(6, 'Nguyễn Thái Bình', 'nguyen-thai-binh', '', '<img src=http://maps.google.com/maps/api/staticmap?center=10.7951863,106.6504455&zoom=15&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|10.7951863,106.6504455>', 0, 6, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dauser`
--

CREATE TABLE IF NOT EXISTS `dauser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dafname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `dalname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `dausername` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `dapassword` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `daavatar` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `darole` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'member',
  `dadeleted` tinyint(4) NOT NULL,
  `daedit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dacreate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `damobi` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `daemail` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `daaddr` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dausername` (`dausername`),
  UNIQUE KEY `daemail` (`daemail`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `dauser`
--

INSERT INTO `dauser` (`id`, `dafname`, `dalname`, `dausername`, `dapassword`, `daavatar`, `darole`, `dadeleted`, `daedit`, `dacreate`, `damobi`, `daemail`, `daaddr`) VALUES
(1, 'Quản Trị Viên', '', 'admin', '57f231b1ec41dc6641270cb09a56f897', '1f991e31e5e80190054a5d5a64cc77c4.jpg', 'admin', 0, '2013-12-01 16:12:33', '2013-12-01 10:12:33', '012345', 'thang@gm.c', '123 ntb'),
(2, 'Poster', 'Mr', 'poster', '57f231b1ec41dc6641270cb09a56f897', '72944f19a150b3f628056f299031bbf8.jpg', 'author', 0, '2013-12-01 16:12:40', '2013-12-01 10:12:40', '0123', 'poster@gmail.com', '123'),
(3, 'Member', 'Mrs', 'member', '57f231b1ec41dc6641270cb09a56f897', '0b2380468f4546e5f3bb0e66e34c36b4.jpg', 'member', 0, '2013-12-01 16:12:47', '2013-12-01 10:12:47', '123', 'member@gmail.com', '12314');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `daward`
--

INSERT INTO `daward` (`id`, `dalong_name`, `daurl`, `dainfo`, `damap`, `dadeleted`, `dadistrict_id`, `daprovince_id`) VALUES
(1, 'Phuong 1', 'phuong-1', '', '', 0, 2, 0),
(2, 'Phuong 1', 'phuong-1', '', '', 0, 5, 0),
(3, 'Phuong 2', 'phuong-2', '', '', 0, 5, 0),
(4, 'Phuong 3', 'phuong-3', 'info 4', 'map 3', 0, 5, 0),
(5, 'phuong 12', 'phuong-12', '', '', 0, 1, 0),
(6, 'Phường 12', 'phuong-12', '', '<img src=http://maps.google.com/maps/api/staticmap?center=10.7986532,106.6512361&zoom=15&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|10.7986532,106.6512361>', 0, 5, 0);
