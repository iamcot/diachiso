-- phpMyAdmin SQL Dump
-- version 4.0.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 04, 2013 at 05:58 PM
-- Server version: 5.5.32-cll
-- PHP Version: 5.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `nhsaiwhy_saigonhanoi`
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
(1, 'Bình Thạnh', 'binh-thanh', 'bt2', '<img src=http://maps.google.com/maps/api/staticmap?center=10.8105831,106.7091422&zoom=15&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|10.8105831,106.7091422>', 0, 2),
(2, 'Hai Bà Trưng', 'hai-ba-trung', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0040872,105.8554513&zoom=15&size=600x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0040872,105.8554513>', 0, 1),
(3, 'Hoàn Kiếm', 'hoan-kiem', '', '', 0, 1),
(4, 'Tây Hồ', 'tay-ho', '', '', 0, 1),
(5, 'Quận Tân Bình', 'tan-binh', '', '<img src=http://maps.google.com/maps/api/staticmap?center=10.8084306,106.6468148&zoom=15&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|10.8084306,106.6468148>', 0, 2),
(6, 'Phú Nhuận', 'phu-nhuan', '', '<img src=http://maps.google.com/maps/api/staticmap?center=10.7984723,106.67924&zoom=15&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|10.7984723,106.67924>', 0, 2),
(7, 'Quận 1', 'quan-1', '', 'http://maps.google.com/maps/api/staticmap?center=10.7756587,106.7004238&zoom=14&size=200x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|10.7756587,106.7004238', 0, 2),
(8, 'Quận 2', 'quan-2', '', 'http://maps.google.com/maps/api/staticmap?center=10.7967947,106.7588494&zoom=12&size=200x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|10.7967947,106.7588494', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `danews`
--

CREATE TABLE IF NOT EXISTS `danews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `daserviceplace_id` int(11) NOT NULL,
  `dalong_name` text COLLATE utf8_unicode_ci NOT NULL,
  `daurl` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `daedit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dacreate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dacontent` text COLLATE utf8_unicode_ci NOT NULL,
  `dacontent_short` text COLLATE utf8_unicode_ci NOT NULL,
  `dadeleted` tinyint(11) NOT NULL,
  `datype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `dacat` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dapic` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `daview` int(11) DEFAULT NULL,
  `dacomment` int(11) DEFAULT NULL,
  `dalike` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
(1, 'Hà Nội', 'ha-noi', 'Thủ đô Hà Nội', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0333333,105.85&zoom=13&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0333333,105.85>', 0, 3),
(2, 'Hồ Chí Minh', 'ho-chi-minh', 'Thành phố Hồ Chí Minh', '<img src=http://maps.google.com/maps/api/staticmap?center=10.746903,106.676292&zoom=10&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|10.746903,106.676292>', 0, 1),
(3, 'Đồng Tháp', 'dong-thap', 'Tỉnh Đồng Tháp', '<img src=http://maps.google.com/maps/api/staticmap?center=10.4937989,105.6881788&zoom=10&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|10.4937989,105.6881788>', 0, 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `daservice`
--

INSERT INTO `daservice` (`id`, `dalong_name`, `daurl`, `dainfo`, `dashowhome`, `dadeleted`, `daservicegroup_id`) VALUES
(1, 'Trung tâm giáo dục', 'trung-tam-giao-duc', '', 0, 0, 1),
(2, 'Khách sạn 4 sao', 'khach-san-4-sao', '', 0, 0, 2);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `daservice_place`
--

INSERT INTO `daservice_place` (`id`, `dalong_name`, `daurl`, `dainfo`, `damap`, `dadeleted`, `dastreet_id`, `daservice_id`, `dapic`, `daaddr`, `datel`, `damobi`, `dafax`, `daemail`, `daview`, `dacomment`, `dalike`, `daedit`, `dacreate`, `daprovince_id`, `dadistrict_id`, `daward_id`, `dauser_id`, `daservicegroup_id`, `dawebsite`, `dalat`, `dalng`) VALUES
(1, 'Trung Tâm Giáo Dục Bé Thông Minh', 'trung-tam-giao-duc-be-thong-minh', '<p><strong>&nbsp; TRUNG T&Acirc;M B&Eacute; TH&Ocirc;NG MINH - NƠI GI&Uacute;P TRẺ PH&Aacute;T TRIỂN TO&Agrave;N DIỆN</strong><br />\n<br />\n&nbsp;&nbsp;&nbsp;&nbsp; Trung t&acirc;m gi&aacute;o dục B&eacute; Th&ocirc;ng Minh l&agrave; th&agrave;nh vi&ecirc;n của tập đo&agrave;n gi&aacute;o dục IndochinaPro. Từ th&aacute;ng 6 năm 2008, trung t&acirc;m B&eacute; Th&ocirc;ng Minh l&agrave; trung t&acirc;m đầu ti&ecirc;n giảng dạy chương tr&igrave;nh FasTracKids tại H&agrave; Nội. L&agrave; một thương hiệu đ&atilde; được c&aacute;c bậc phụ huynh v&agrave; học sinh tiểu học biết đến với c&aacute;c chương tr&igrave;nh hướng đến sự ph&aacute;t triển to&agrave;n diện của những học sinh ưu t&uacute; nhất, đang vươn tới những th&agrave;nh c&ocirc;ng trong trường học v&agrave; cuộc sống, Trung t&acirc;m B&eacute; Th&ocirc;ng Minh lu&ocirc;n nỗ lực hết m&igrave;nh với mong muốn đem lại những g&igrave; tốt đẹp nhất cho trẻ em H&agrave; Nội n&oacute;i ri&ecirc;ng v&agrave; Việt Nam n&oacute;i chung.<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hiện tại, Trung t&acirc;m B&eacute; Th&ocirc;ng Minh đang ph&aacute;t triển c&aacute;c chương tr&igrave;nh tốt nhất về ph&aacute;t triển tư duy, k&iacute;ch th&iacute;ch sự ph&aacute;t triển của N&atilde;o bộ, r&egrave;n luyện kỹ năng v&agrave; c&aacute;c hoạt động ngoại kh&oacute;a d&agrave;nh cho trẻ từ 4 - 11 tuổi.</p>\n\n<table align="center" border="0" cellpadding="5" cellspacing="5" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-collapse:collapse; border-spacing:0px; border-top-left-radius:0px !important; border-top-right-radius:0px !important; font-family:helvetica neue,helvetica,arial,sans-serif; line-height:20px; max-width:100%; width:100%">\n	<tbody>\n		<tr>\n			<td><img alt="Môi trường tốt nhất cho trẻ phát triển" src="http://diachiso.vn/UserFiles/Image/2013/07/FasTracKids-yet-kieu/Anh-Tinh/FasTracKids%2018%20Y%E1%BA%BFt%20Ki%C3%AAu%201.jpg" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-top-left-radius:0px !important; border-top-right-radius:0px !important; border:0px; height:auto; max-width:100%; vertical-align:middle; width:600px" title="Môi trường tốt nhất cho trẻ phát triển" /></td>\n		</tr>\n		<tr>\n			<td><em>M&ocirc;i trường tốt nhất cho trẻ ph&aacute;t triển</em></td>\n		</tr>\n	</tbody>\n</table>\n\n<p><br />\n<span style="font-family:helvetica neue,helvetica,arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FASTRACKIDS: L&agrave; chương tr&igrave;nh bản quyền từ Hoa Kỳ với nội dung gi&aacute;o dục l&agrave;m gi&agrave;u kiến thức, ph&aacute;t triển tư duy, bồi dưỡng c&aacute;c kỹ năng sống v&agrave; kỹ năng x&atilde; hội cho trẻ. Từ những giờ học kh&aacute;m ph&aacute; v&agrave; trải nghiệm, trẻ sẽ được học c&aacute;ch tập trung suy nghĩ, tự tin thuyết tr&igrave;nh trước c&aacute;c bạn, sử dụng khả năng của N&atilde;o bộ một c&aacute;ch s&aacute;ng tạo, học c&aacute;c kỹ năng lập luận, chuyển giao kiến thức, giao tiếp v&agrave; hợp t&aacute;c hiệu quả với người kh&aacute;c.</span><br />\n<span style="font-family:helvetica neue,helvetica,arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp; Chương tr&igrave;nh FasTracKids d&agrave;nh cho trẻ trong độ từ 4 - 8 tuổi, mỗi tuần học 2 tiếng. Đ&acirc;y l&agrave; một chương tr&igrave;nh học với m&ocirc;i trường s&ocirc;i động v&agrave; l&yacute; th&uacute;, hệ thống trang thiết bị ti&ecirc;n tiến, hiện đại kết hợp c&ugrave;ng c&aacute;c hoạt động tư duy, thảo luận, s&aacute;ng tạo, gi&uacute;p trẻ dần quen với m&ocirc;i trường l&agrave;m việc nh&oacute;m, th&iacute; nghiệm khoa học, l&agrave;m sản phẩm v&agrave; thuyết tr&igrave;nh trước c&aacute;c bạn về những điều mới mẻ&hellip;</span><br />\n&nbsp;</p>\n\n<table align="center" border="0" cellpadding="5" cellspacing="5" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-collapse:collapse; border-spacing:0px; border-top-left-radius:0px !important; border-top-right-radius:0px !important; font-family:helvetica neue,helvetica,arial,sans-serif; line-height:20px; max-width:100%; width:100%">\n	<tbody>\n		<tr>\n			<td><img alt=" Buổi học Fastrackids" src="http://diachiso.vn/UserFiles/Image/2013/07/FasTracKids-yet-kieu/Anh-Tinh/FasTracKids%2018%20Y%E1%BA%BFt%20Ki%C3%AAu.jpg" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-top-left-radius:0px !important; border-top-right-radius:0px !important; border:0px; height:auto; max-width:100%; vertical-align:middle; width:600px" title=" Buổi học Fastrackids" /></td>\n		</tr>\n		<tr>\n			<td><em>Buổi học Fastrackids</em></td>\n		</tr>\n	</tbody>\n</table>\n\n<p><br />\n<span style="font-family:helvetica neue,helvetica,arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp; MATHKIDS &ndash; Gi&uacute;p con giỏi To&aacute;n: Đ&acirc;y l&agrave; chương tr&igrave;nh To&aacute;n Học Vui do Trung t&acirc;m v&agrave; c&aacute;c chuy&ecirc;n gia nghi&ecirc;n cứu đưa v&agrave;o giảng dạy.</span><br />\n<span style="font-family:helvetica neue,helvetica,arial,sans-serif">Tất cả c&aacute;c b&agrave;i học nhằm hướng dẫn trẻ ph&acirc;n t&iacute;ch c&aacute;c t&igrave;nh huống li&ecirc;n quan đến tư duy logic v&agrave; tư duy to&aacute;n học. C&aacute;c b&agrave;i tập về nhận biết h&igrave;nh khối, số lượng, quy luật, kiểu mẫu, tr&igrave;nh tự, ph&acirc;n loại, đếm h&igrave;nh, gi&uacute;p tăng cường khả năng quan s&aacute;t, linh hoạt v&agrave; s&aacute;ng tạo.&nbsp;</span><br />\n<span style="font-family:helvetica neue,helvetica,arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Đ&acirc;y l&agrave; chương tr&igrave;nh học tạo cho trẻ sự năng động, tương t&aacute;c với c&aacute;c bạn khiến trẻ cảm thấy vui vẻ, những ứng dụng của to&aacute;n học trong cuộc sống h&agrave;ng ng&agrave;y sẽ khiến trẻ cảm nhận rằng to&aacute;n học, kiểu mẫu, tr&igrave;nh tự v&agrave; c&aacute;c kh&aacute;i niệm kh&ocirc;ng c&ograve;n kh&ocirc; khan nữa.</span><br />\n&nbsp;</p>\n\n<table align="center" border="0" cellpadding="5" cellspacing="5" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-collapse:collapse; border-spacing:0px; border-top-left-radius:0px !important; border-top-right-radius:0px !important; font-family:helvetica neue,helvetica,arial,sans-serif; line-height:20px; max-width:100%; width:100%">\n	<tbody>\n		<tr>\n			<td><img alt="Mathkids - giúp trẻ giỏi toán" src="http://diachiso.vn/UserFiles/Image/2013/07/FasTracKids-yet-kieu/Anh-Tinh/To%C3%A1n%20tr%E1%BA%BB%20em%2018%20Y%E1%BA%BFt%20Ki%C3%AAu.jpg" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-top-left-radius:0px !important; border-top-right-radius:0px !important; border:0px; height:auto; max-width:100%; vertical-align:middle; width:600px" title="Mathkids - giúp trẻ giỏi toán" /></td>\n		</tr>\n		<tr>\n			<td><em>Mathkids - gi&uacute;p trẻ giỏi to&aacute;n</em></td>\n		</tr>\n	</tbody>\n</table>\n\n<p><br />\n<span style="font-family:helvetica neue,helvetica,arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp; MIDA &ndash; Ph&aacute;t triển tr&iacute; th&ocirc;ng minh đa dạng: Ở lứa tuổi 8 &ndash; 12, trẻ c&oacute; những thay đổi rất lớn về tư duy, bắt đầu khẳng định năng lực của bản th&acirc;n, c&oacute; ch&iacute;nh kiến, sống nội t&acirc;m hơn v&agrave; cần chuẩn bị cho m&igrave;nh nhiều năng lượng v&agrave; kỹ năng cho việc chuyển cấp.&nbsp;</span><br />\n<span style="font-family:helvetica neue,helvetica,arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp; Với mong muốn gi&uacute;p trẻ kh&aacute;m ph&aacute; v&agrave; ph&aacute;t huy được hết tiềm năng v&agrave; sức mạnh của bản th&acirc;n, Trung t&acirc;m B&eacute; Th&ocirc;ng Minh dựa tr&ecirc;n những nghi&ecirc;n cứu của Howard Gardner đ&atilde; x&acirc;y dựng chương tr&igrave;nh: Ph&aacute;t triển tr&iacute; th&ocirc;ng minh đa dạng.</span><br />\n<span style="font-family:helvetica neue,helvetica,arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp; Mỗi b&agrave;i học đều bao gồm rất nhiều hoạt động kết hợp cả về ng&ocirc;n ngữ, to&aacute;n học, thể chất, kh&ocirc;ng gian, giao tiếp v&agrave; cảm x&uacute;c của c&aacute; nh&acirc;n, ph&aacute;t triển năng lực hội họa &acirc;m nhạc, t&igrave;m hiểu những điều l&yacute; th&uacute; về tự nhi&ecirc;n v&agrave; n&eacute;t đẹp của cuộc sống xung quanh&hellip; Từ đ&oacute; định hướng cho trẻ ph&aacute;t triển những năng lực tiềm ẩn, ph&aacute;t huy được những thế mạnh của m&igrave;nh trong học tập v&agrave; cuộc sống.</span><br />\n&nbsp;</p>\n\n<table align="center" border="0" cellpadding="5" cellspacing="5" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-collapse:collapse; border-spacing:0px; border-top-left-radius:0px !important; border-top-right-radius:0px !important; font-family:helvetica neue,helvetica,arial,sans-serif; line-height:20px; max-width:100%; width:100%">\n	<tbody>\n		<tr>\n			<td><img alt="Mida - phát triển trí thông minh đa dạng của trẻ" src="http://diachiso.vn/UserFiles/Image/2013/07/FasTracKids-yet-kieu/Anh-Tinh/Ph%C3%A1t%20tri%E1%BB%83n%20tr%C3%AD%20th%C3%B4ng%20minh%20%C4%91a%20d%E1%BA%A1ng%2018%20y%E1%BA%BFt%20ki%C3%AAu.jpg" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-top-left-radius:0px !important; border-top-right-radius:0px !important; border:0px; height:auto; max-width:100%; vertical-align:middle; width:600px" title="Mida - phát triển trí thông minh đa dạng của trẻ" /></td>\n		</tr>\n		<tr>\n			<td><em>Mida - ph&aacute;t triển tr&iacute; th&ocirc;ng minh đa dạng của trẻ</em></td>\n		</tr>\n	</tbody>\n</table>\n\n<p><br />\n<span style="font-family:helvetica neue,helvetica,arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp; HUNA &ndash; Kh&oacute;a học lắp r&aacute;p Robot: Huna l&agrave; chương tr&igrave;nh gi&aacute;o dục phổ cập to&agrave;n H&agrave;n Quốc d&agrave;nh cho trẻ nhỏ được &aacute;p dụng v&agrave;o giảng dạy tại hơn 1.800 trường ở H&agrave;n Quốc v&agrave; nhiều nước trong khu vực ch&acirc;u &Aacute;, đạt ti&ecirc;u chuẩn chất lượng khắt khe của H&agrave;n Quốc v&agrave; Ch&acirc;u &Acirc;u.</span><br />\n<span style="font-family:helvetica neue,helvetica,arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp; Lắp r&aacute;p Robot kh&ocirc;ng chỉ l&agrave; hoạt động của đ&ocirc;i b&agrave;n tay m&agrave; c&ograve;n l&agrave; học Vật l&yacute;, đồng thời ph&aacute;t triển nhận thức qua c&aacute;c hoạt động thực h&agrave;nh như: thiết kế, x&acirc;y dựng, lập tr&igrave;nh cơ bản cho Robot&hellip; Kh&ocirc;ng chỉ học kiến thức, trẻ c&ograve;n học được t&iacute;nh kỷ luật trong nhiều lĩnh vực như khoa học kỹ thuật v&agrave; To&aacute;n học, đồng thời lĩnh hội được nền tảng tuyệt vời về c&aacute;c kỹ năng sống, khả năng nghi&ecirc;n cứu, giải quyết vấn đề, kỹ năng giao tiếp, khả năng suy luận, ph&acirc;n t&iacute;ch, quản l&yacute; v&agrave; thuyết tr&igrave;nh...</span><br />\n<span style="font-family:helvetica neue,helvetica,arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp; Lắp r&aacute;p Robot l&agrave; c&aacute;ch tuyệt nhất để trẻ bắt đầu tạo ra c&aacute;c sản phẩm khoa học v&agrave; To&aacute;n học, đồng thời đ&oacute; cũng l&agrave; c&aacute;ch vui nhất để dạy cho trẻ về c&ocirc;ng nghệ.</span><br />\n&nbsp;</p>\n\n<table align="center" border="0" cellpadding="5" cellspacing="5" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-collapse:collapse; border-spacing:0px; border-top-left-radius:0px !important; border-top-right-radius:0px !important; font-family:helvetica neue,helvetica,arial,sans-serif; line-height:20px; max-width:100%; width:100%">\n	<tbody>\n		<tr>\n			<td><img alt="Huna – giúp trẻ tự tin sáng tạo các mô hình" src="http://diachiso.vn/UserFiles/Image/2013/07/FasTracKids-yet-kieu/Anh-Tinh/HUNA%20-%20L%E1%BA%AFp%20r%C3%A1p%20Robot%20cho%20tr%E1%BA%BB%20nh%E1%BB%8F.jpg" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-top-left-radius:0px !important; border-top-right-radius:0px !important; border:0px; height:auto; max-width:100%; vertical-align:middle; width:600px" title="Huna – giúp trẻ tự tin sáng tạo các mô hình" /></td>\n		</tr>\n		<tr>\n			<td><em>Huna &ndash; gi&uacute;p trẻ tự tin s&aacute;ng tạo c&aacute;c m&ocirc; h&igrave;nh</em></td>\n		</tr>\n	</tbody>\n</table>\n', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0223015,105.8435941&zoom=15&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0223015,105.8435941>', 0, 4, 1, '5e6cfeb9fe4dc2e17fb5f548b7e820f2.jpg', '18', '04) 39 411 316', '', '', 'kids@indochinapro.com', 0, 0, 0, '2013-12-04 09:53:41', '2013-12-04 09:53:41', 1, 3, 6, 1, 1, '', '21.0223015', '105.8435941'),
(2, 'Khách Sạn Sunway', 'khach-san-sunway', '<p><span style="font-family:helvetica neue,helvetica,arial,sans-serif">Kh&aacute;ch sạn Sunway cũng mang tới cho qu&yacute; kh&aacute;ch rất nhiều cơ sở vật chất phục vụ cho c&ocirc;ng t&aacute;c v&agrave; giải tr&iacute;, trong đ&oacute; c&oacute; một trung t&acirc;m sức khỏe, một trung t&acirc;m thương vụ, c&aacute;c trang thiết bị phục vụ hội họp v&agrave; một đội ngũ chăm s&oacute;c kh&aacute;ch h&agrave;ng nhạy b&eacute;n đạt ti&ecirc;u chuẩn quốc tế.</span><br />\n<br />\n<strong><em>Kh&aacute;ch sạn Sunway đ&atilde; được trao giải kh&aacute;ch sạn b&igrave;nh d&acirc;n tốt nhất tại Việt Nam.</em><br />\n<br />\n<strong>Tiện nghi:</strong><br />\n<br />\n<strong>C&aacute;c ph&ograve;ng họp:</strong>&nbsp;Được thiết kế để thỏa m&atilde;n những cuộc hội thảo ti&ecirc;u chuẩn quốc tế, được trang bị internet kh&ocirc;ng d&acirc;y tốc độ cao, hệ thống nghe nh&igrave;n v&agrave; c&aacute;c bảng tin.<br />\n<br />\n<strong>Khu giải kh&aacute;t Club Classic:</strong>&nbsp;Mở cửa cả ng&agrave;y cho kh&aacute;ch của ph&ograve;ng loại Club Classic, mang tới cho qu&yacute; kh&aacute;ch một nơi nghỉ ngơi thư gi&atilde;n tuyệt vời với một bar c&aacute; nh&acirc;n c&oacute; tr&agrave; v&agrave; caf&eacute; miễn ph&iacute; c&ugrave;ng với một ph&ograve;ng d&agrave;nh cho những cuộc gặp mặt đặt biệt.<br />\n<br />\n<strong>Trung t&acirc;m thể chất:</strong>&nbsp;C&oacute; c&aacute;c m&aacute;y tập thể dục tối t&acirc;n cũng như những chương tr&igrave;nh tập luyện được c&aacute;c nh&acirc;n h&oacute;a ph&ugrave; hợp với từng người. C&oacute; ph&ograve;ng x&ocirc;ng hơi v&agrave; sauna ri&ecirc;ng cho nam, nữ.<br />\n<br />\n<strong>Trung t&acirc;m thương vụ:</strong>&nbsp;Trung t&acirc;m thương vụ được trang bị đầy đủ v&agrave; hiện đại, với c&aacute;c dịch vụ: Sao, in, photocopy, m&aacute;y t&iacute;nh, m&aacute;y chiếu, dịch thuật, dịch vụ hướng dẫn du lịch, c&aacute;c ph&ograve;ng họp, internet kh&ocirc;ng d&acirc;y tốc độ cao.<br />\n<br />\n<strong>Nh&agrave; h&agrave;ng v&agrave; bar:</strong><br />\n<br />\n<strong>Nh&agrave; h&agrave;ng Allante:</strong>&nbsp;Được thiết kế tao nh&atilde; với khung cảnh thư th&aacute;i, nh&agrave; h&agrave;ng phục vụ thực kh&aacute;ch theo thực đơn v&agrave; c&oacute; bữa trưa buffet với rất nhiều m&oacute;n ăn ngon miệng của Việt Nam v&agrave; thế giới. Nh&agrave; h&agrave;ng được trang bị hệ thống internet kh&ocirc;ng d&acirc;y tốc độ cao.<br />\n<br />\n<strong>Bar Jazz:</strong>&nbsp;Khu quầy bar v&agrave; giải kh&aacute;t nằm ở sảnh sẽ tạo n&ecirc;n một nơi l&yacute; tưởng để nghỉ ngơi. Một thực đơn ăn nhanh lu&ocirc;n c&oacute; sẵn trong ng&agrave;y để phục vụ bạn. Bar được trang bị internet kh&ocirc;ng d&acirc;y tốc độ cao.<br />\n<br />\n<strong>Tiện nghi &amp; Dịch vụ kh&aacute;c:</strong>&nbsp;<br />\n<br />\n&bull; Dịch vụ tr&ocirc;ng trẻ&nbsp;<br />\n&bull; C&acirc;u lạc bộ khi&ecirc;u vũ&nbsp;<br />\n&bull; Dịch vụ đưa đ&oacute;n s&acirc;n bay&nbsp;<br />\n&bull; C&aacute;c dịch vụ Du lịch&nbsp;<br />\n<br />\n<strong>Ph&ograve;ng:</strong><br />\n<br />\nKh&aacute;ch sạn Sunway c&oacute; 143 ph&ograve;ng nghỉ được chia l&agrave;m 3 loại: Superior, Club Classic v&agrave; Junior Suite. C&aacute;c ph&ograve;ng đều được thiết kế đế đ&aacute;p ứng tốt nhất nhu cầu của qu&yacute; kh&aacute;ch.<br />\n<br />\nB&ecirc;n cạnh đ&oacute;, kh&aacute;ch sạn c&ograve;n c&oacute; một dịch vụ độc đ&aacute;o: &ldquo;All in one&rdquo; - &ldquo;Tất cả trong một&rdquo;, chỉ bằng một c&aacute;i nhấn n&uacute;t v&agrave; bạn đ&atilde; c&oacute; thể tiếp cận được với tất cả c&aacute;c dịch vụ. C&aacute;c ph&ograve;ng đều được trang bị internet tốc độ cao, băng thộng rộng.<br />\n<br />\n<strong>Kh&aacute;ch của loại ph&ograve;ng Club Classic sẽ được hưởng c&aacute;c ưu đ&atilde;i:</strong><br />\n<br />\n&bull; V&agrave;o khu giải kh&aacute;t Club Classic với tr&agrave; v&agrave; caf&eacute; miễn ph&iacute;.<br />\n&bull; Một giờ miễn ph&iacute; sử dụng ph&ograve;ng họp (đặt trước).&nbsp;<br />\n&bull; Một giờ truy cập internet miễn ph&iacute;.&nbsp;<br />\n&bull; C&aacute;c giờ giảm gi&aacute; ở Bar Jazz.&nbsp;<br />\n&bull; Giảm gi&aacute; 10% đồ ăn v&agrave; đồ uống tại nh&agrave; h&agrave;ng Allante.&nbsp;<br />\n&bull; Giảm gi&aacute; 10% cho dịch vụ giặt l&agrave;.<br />\n<br />\n<strong>Tiện nghi ph&ograve;ng:</strong><br />\n<br />\n&bull; Điều h&ograve;a&nbsp;<br />\n&bull; Dụng cụ pha c&agrave; ph&ecirc; v&agrave; tr&agrave;&nbsp;<br />\n&bull; M&aacute;y sấy t&oacute;c&nbsp;<br />\n&bull; Dịch vụ internet&nbsp;<br />\n&bull; Dịch vụ điện thoại quốc tế trực tiếp&nbsp;<br />\n&bull; K&eacute;t an to&agrave;n&nbsp;<br />\n&bull; Tủ lạnh&nbsp;<br />\n&bull; Truyền h&igrave;nh vệ tinh</strong></p>\n', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0165329,105.8578098&zoom=17&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0165329,105.8578098>', 0, 6, 2, '0b6139c5bc921987e6171c892546307a.jpg', '14', '', '', '', '', 0, 0, 0, '2013-12-04 10:07:26', '2013-12-04 10:07:26', 1, 2, 9, 1, 2, '', '21.0165329', '105.8578098');

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
(1, 'Đường Bạch Đằng', 'duong-bach-dang', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0229283,105.8624421&zoom=15&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0229283,105.8624421>', 0, 1, 1, 2),
(2, 'Phố Cảm Hội', 'pho-cam-hoi', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0110947,105.8606107&zoom=15&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0110947,105.8606107>', 0, 1, 1, 2),
(3, 'Đầm Trấu', 'dam-trau', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.011903,105.8652765&zoom=17&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.011903,105.8652765>', 0, 1, 1, 2),
(4, 'Yết Kiêu', 'yet-kieu', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0216445,105.8430918&zoom=15&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0216445,105.8430918>', 0, 6, 1, 3),
(5, 'Mai Hắc Đế', 'mai-hac-de', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0135371,105.8510191&zoom=15&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0135371,105.8510191>', 0, 7, 1, 2),
(6, 'Phạm Đình Hổ', 'pham-dinh-ho', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0166101,105.8575262&zoom=17&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0166101,105.8575262>', 0, 9, 1, 2);

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
(1, 'Quản Trị Viên', '', 'admin', '57f231b1ec41dc6641270cb09a56f897', '615b157b56bf813650a17098d9e79ccb.jpg', 'admin', 0, '2013-12-02 05:49:48', '2013-12-02 05:49:48', '012345', 'thang@gm.c', '123 ntb'),
(2, 'Poster', 'Mr', 'poster', '57f231b1ec41dc6641270cb09a56f897', 'd65ea75a21127bfb7a7fc911ee962e7c.jpg', 'author', 0, '2013-12-02 05:50:31', '2013-12-02 05:50:31', '0123', 'poster@gmail.com', '123'),
(3, 'Member', 'Mrs', 'member', '57f231b1ec41dc6641270cb09a56f897', '3705356ee21f495f0473c043cb4925a6.JPG', 'member', 0, '2013-12-02 05:51:13', '2013-12-02 05:51:13', '123', 'member@gmail.com', '12314');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `daward`
--

INSERT INTO `daward` (`id`, `dalong_name`, `daurl`, `dainfo`, `damap`, `dadeleted`, `dadistrict_id`, `daprovince_id`) VALUES
(1, 'Bạch Đằng', 'bach-dang', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0132507,105.8657274&zoom=15&size=600x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0132507,105.8657274>', 0, 2, 1),
(2, 'Bách Khoa', 'bach-khoa', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0042694,105.8459098&zoom=15&size=600x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0042694,105.8459098>', 0, 2, 1),
(3, 'Bạch Mai', 'bach-mai', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0008143,105.8517814&zoom=15&size=600x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0008143,105.8517814>', 0, 2, 1),
(4, 'Bùi Thị Xuân', 'bui-thi-xuan', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0150437,105.8506805&zoom=15&size=600x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0150437,105.8506805>', 0, 2, 1),
(5, 'Cầu Dền', 'cau-den', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0067485,105.8503135&zoom=15&size=600x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0067485,105.8503135>', 0, 2, 1),
(6, 'Cửa Nam', 'cua-nam', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0252277,105.8426071&zoom=15&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0252277,105.8426071>', 0, 3, 1),
(7, 'Lê Đại Hành', 'le-dai-hanh', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0123071,105.8451758&zoom=15&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0123071,105.8451758>', 0, 2, 1),
(9, 'Phạm Đình Hổ', 'pham-dinh-ho', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0161916,105.8576533&zoom=15&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0161916,105.8576533>', 0, 2, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
