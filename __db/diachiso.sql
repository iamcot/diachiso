-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 06, 2013 at 11:14 AM
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
-- Table structure for table `daconfig`
--

CREATE TABLE IF NOT EXISTS `daconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `daname` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `davalue` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dacomment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
  `daoldprice` int(11) NOT NULL DEFAULT '0',
  `dapic` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `dainfo` text COLLATE utf8_unicode_ci NOT NULL,
  `dapromo` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `dadeal`
--

INSERT INTO `dadeal` (`id`, `daserviceplace_id`, `dalong_name`, `daurl`, `datype`, `daamount`, `daedit`, `dacreate`, `dadeleted`, `dafrom`, `dato`, `daspecial`, `dacondition`, `daview`, `dacomment`, `dalike`, `dauser_id`, `daoldprice`, `dapic`, `dainfo`, `dapromo`) VALUES
(1, 2, 'Giảm giá phòng nhân ngày notel', 'giam-gia-phong-nhan-ngay-notel', 'percent', 50, '2013-12-05 10:59:22', '2013-12-05 09:02:28', 0, 1386201600, 1417410000, '<ul>\n	<li style="text-align:justify">Lẩu thập cẩm nhiều chất đạm, rất bổ dưỡng, ăn no m&agrave; kh&ocirc;ng bi ng&aacute;n. Set ăn gồm: t&ocirc;m, ngao, mực tươi, ếch, b&ograve;, g&agrave; chọi, đậu phụ, mỳ, rau.</li>\n	<li style="text-align:justify">Nh&agrave; h&agrave;ng<strong>&nbsp;Lẩu nướng 24</strong>&nbsp;tọa lạc tại vị tr&iacute; thuận lợi, kh&ocirc;ng gian rộng 1000m<span style="font-size:10px">2</span>.</li>\n	<li style="text-align:justify">Khu&ocirc;n vi&ecirc;n rộng r&atilde;i, tho&aacute;ng m&aacute;t c&oacute; sức &nbsp;chứa lớn, ph&ugrave; hợp với c&aacute;c cuộc gặp gỡ bạn b&egrave;, tổ chức tiệc cưới, hội nghị.</li>\n	<li style="text-align:justify">Lối kiến tr&uacute;c sang trọng, hiện đại.</li>\n	<li style="text-align:justify">Thiết kế ph&ograve;ng ăn đa dạng, đ&aacute;p ứng đầy đủ mọi nhu cầu kh&aacute;ch h&agrave;ng.</li>\n	<li style="text-align:justify">Nh&agrave; h&agrave;ng mang đến những dịch vụ tốt nhất với những thực đơn phong ph&uacute; c&aacute;c m&oacute;n ăn hấp dẫn, mới lạ từ c&aacute;c m&oacute;n lẩu nướng đến đặc sản như&nbsp;<strong>g&agrave; chọi, lợn m&aacute;n, ngỗng&hellip;</strong></li>\n	<li style="text-align:justify">Phong c&aacute;ch phục vụ chu đ&aacute;o, chuy&ecirc;n nghiệp.</li>\n</ul>\n', '<ul>\n	<li style="text-align:justify">&Aacute;p dụng cho:&nbsp;<strong>Set lẩu thập cẩm d&agrave;nh cho 04 người tại nh&agrave; h&agrave;ng Lẩu nướng 24.</strong></li>\n	<li style="text-align:justify">Thời hạn sử dụng Vipon:&nbsp;<strong>31/1/2014.</strong></li>\n	<li style="text-align:justify">Gi&aacute; chưa bao gồm VAT (Kh&aacute;ch c&oacute; nhu c&acirc;̀u xu&acirc;́t h&oacute;a đơn vui l&ograve;ng trả th&ecirc;m 10% VAT tại nh&agrave; h&agrave;ng).</li>\n	<li style="text-align:justify">Một kh&aacute;ch h&agrave;ng được mua nhiều phiếu.</li>\n	<li style="text-align:justify">Sử dụng<strong>&nbsp;01 phiếu /01 Set cho 04 người.&nbsp;</strong></li>\n	<li style="text-align:justify">Phiếu kh&ocirc;ng c&oacute; gi&aacute; trị quy đổi th&agrave;nh tiền mặt, kh&ocirc;ng trả lại tiền thừa.</li>\n	<li style="text-align:justify">Kh&ocirc;ng &aacute;p dụng đồng thời với c&aacute;c chương tr&igrave;nh khuyến m&atilde;i kh&aacute;c.</li>\n	<li style="text-align:justify">Kh&aacute;ch h&agrave;ng gọi th&ecirc;m m&oacute;n ăn ngo&agrave;i Set thanh to&aacute;n theo bảng gi&aacute; ni&ecirc;m yết tại nh&agrave; h&agrave;ng.</li>\n	<li style="text-align:justify">Kh&ocirc;ng &aacute;p dụng cho đồ uống v&agrave; mua mang về.</li>\n	<li style="text-align:justify">Địa điểm sử dụng:&nbsp;<strong>Lẩu nướng 24</strong></li>\n	<li style="text-align:justify"><strong>Địa chỉ:&nbsp;</strong>24K3 &ndash; thị trấn Cầu Diễn &ndash; Từ Li&ecirc;m &ndash; H&agrave; Nội.</li>\n	<li style="text-align:justify"><strong>Điện thoại:&nbsp;</strong>0437.631.389 / 0903.498.325</li>\n	<li style="text-align:justify">Ng&agrave;y &aacute;p dụng trong tuần: Thứ 02 &ndash; Chủ Nhật. Giờ &aacute;p dụng: 08h00 &ndash; 21h00.&nbsp;</li>\n	<li style="text-align:justify">Kh&aacute;ch h&agrave;ng vui l&ograve;ng đặt chỗ trước khi đến để được phục vụ tốt nhất.</li>\n</ul>\n', 26, 0, 0, 1, 200000, '404b6a4f8617c1a2d2ce568b740b39b3.jpg', '<div id="cke_pastebin" style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px; text-align: justify; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important;">V&agrave;o m&ugrave;a lạnh, thưởng thức lẩu chắc chắn l&agrave; lựa chọn tuyệt hảo mỗi dịp tụ tập bạn b&egrave; hay họp mặt gia đ&igrave;nh! Trong thực đơn rất nhiều c&aacute;c m&oacute;n lẩu, c&oacute; một lựa chọn kh&aacute; quen thuộc v&agrave; tưởng chừng như đơn giản, đ&oacute; l&agrave; lẩu thập cẩm.</div>\n\n<div id="cke_pastebin" style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px; text-align: justify; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important;">&nbsp;</div>\n\n<div style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px; text-align: center; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important;"><img alt="" src="http://diachiso.vn/files/images/2013/09/nha-hang-lau-nuong-24/lau-nuong-24-lau-1.jpg" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-top-left-radius:0px !important; border-top-right-radius:0px !important; border:0px; height:386px; max-width:100%; vertical-align:middle; width:600px" /></div>\n\n<div style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px; text-align: justify; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important;">&nbsp;</div>\n\n<div id="cke_pastebin" style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px; text-align: justify; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important;">H&atilde;y đến với Nh&agrave; h&agrave;ng Lẩu nướn 24, bạn v&agrave; gia đ&igrave;nh sẽ được thưởng thức set lẩu thập cẩm d&agrave;nh cho 04 người thơm ngon, chất lượng, với mức gi&aacute; ưu đ&atilde;i:&nbsp;<span style="font-size:14px"><strong>giảm c&ograve;n 135.000 đ</strong></span>.</div>\n\n<div id="cke_pastebin" style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px; text-align: justify; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important;">&nbsp;</div>\n\n<div style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px; text-align: center; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important;"><img alt="" src="http://diachiso.vn/files/images/2013/09/nha-hang-lau-nuong-24/lau-nuong-24-set-an.png" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-top-left-radius:0px !important; border-top-right-radius:0px !important; border:0px; height:368px; max-width:100%; vertical-align:middle; width:520px" /></div>\n\n<div style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px; text-align: center; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important;">&nbsp;</div>\n\n<div style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px; text-align: center; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important;"><img alt="" src="http://diachiso.vn/files/images/2013/09/nha-hang-lau-nuong-24/lau-nuong-24-lau-2.jpg" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-top-left-radius:0px !important; border-top-right-radius:0px !important; border:0px; height:398px; max-width:100%; vertical-align:middle; width:600px" /></div>\n\n<div style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px; text-align: center; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important;">&nbsp;</div>\n\n<div style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px; text-align: center; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important;"><img alt="" src="http://diachiso.vn/files/images/2013/09/nha-hang-lau-nuong-24/lau-nuong-24-lau-7.jpg" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-top-left-radius:0px !important; border-top-right-radius:0px !important; border:0px; height:420px; max-width:100%; vertical-align:middle; width:600px" /></div>\n\n<div style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px; text-align: justify; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important;">&nbsp;</div>\n\n<div id="cke_pastebin" style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px; text-align: justify; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important;">Nước lẩu l&agrave; sự kết hợp tinh tế của ẩm thực, khi ăn, nước lẩu mang vị ngọt từ xương c&ugrave;ng c&aacute;c loại hải sản v&agrave; thịt ăn k&egrave;m: mực, t&ocirc;m, ngao, ếch, b&ograve;, g&agrave; chọi. Khi bắt đầu ăn cho th&ecirc;m nấm, đậu v&agrave; c&aacute;c loại rau v&agrave;o, bạn sẽ cảm nhận thấy vị m&aacute;t, hơi chua v&agrave; th&ecirc;m ch&uacute;t cay cay của sả, ớt&hellip; khiến m&oacute;n n&agrave;y tuy nhiều chất đạm m&agrave; kh&ocirc;ng khiến bạn đầy bụng, ăn tuy no m&agrave; kh&ocirc;ng ng&aacute;n, lại rất bổ dưỡng.</div>\n\n<div id="cke_pastebin" style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px; text-align: justify; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important;">&nbsp;</div>\n\n<div style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px; text-align: center; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important;"><img alt="" src="http://diachiso.vn/files/images/2013/09/nha-hang-lau-nuong-24/lau-nuong-24-lau-9.jpg" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-top-left-radius:0px !important; border-top-right-radius:0px !important; border:0px; height:600px; max-width:100%; vertical-align:middle; width:600px" /></div>\n\n<div style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px; text-align: center; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important;">&nbsp;</div>\n\n<div style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px; text-align: center; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important;"><img alt="" src="http://diachiso.vn/files/images/2013/09/nha-hang-lau-nuong-24/lau-nuong-24-lau-3.jpg" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-top-left-radius:0px !important; border-top-right-radius:0px !important; border:0px; height:385px; max-width:100%; vertical-align:middle; width:600px" /></div>\n\n<div style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px; text-align: center; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important;">&nbsp;</div>\n\n<div style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px; text-align: center; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important;"><img alt="" src="http://diachiso.vn/files/images/2013/09/nha-hang-lau-nuong-24/lau-nuong-24-lau-4.jpg" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-top-left-radius:0px !important; border-top-right-radius:0px !important; border:0px; height:357px; max-width:100%; vertical-align:middle; width:600px" /></div>\n\n<div style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px; text-align: justify; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important;">&nbsp;</div>\n\n<div id="cke_pastebin" style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px; text-align: justify; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important;">Nguồn nguy&ecirc;n liệu được bảo quản với những ti&ecirc;u chuẩn hết sức khắt khe để đảm bảo chất lượng cho từng m&oacute;n ăn. &nbsp;</div>\n\n<div id="cke_pastebin" style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px; text-align: justify; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important;">&nbsp;</div>\n\n<div style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px; text-align: center; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important;"><img alt="" src="http://diachiso.vn/files/images/2013/09/nha-hang-lau-nuong-24/lau-nuong-24-lau-8.jpg" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-top-left-radius:0px !important; border-top-right-radius:0px !important; border:0px; height:288px; max-width:100%; vertical-align:middle; width:600px" /></div>\n\n<div style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px; text-align: center; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important;">&nbsp;</div>\n\n<div style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px; text-align: center; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important;"><img alt="" src="http://diachiso.vn/files/images/2013/09/nha-hang-lau-nuong-24/lau-nuong-24-lau-5.jpg" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-top-left-radius:0px !important; border-top-right-radius:0px !important; border:0px; height:365px; max-width:100%; vertical-align:middle; width:600px" /></div>\n\n<div style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px; text-align: center; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important;">&nbsp;</div>\n\n<div style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px; text-align: center; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important;"><img alt="" src="http://diachiso.vn/files/images/2013/09/nha-hang-lau-nuong-24/lau-nuong-24-lau-6.jpg" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-top-left-radius:0px !important; border-top-right-radius:0px !important; border:0px; height:464px; max-width:100%; vertical-align:middle; width:600px" /></div>\n\n<div style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px; text-align: justify; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important;">&nbsp;</div>\n\n<div id="cke_pastebin" style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px; text-align: justify; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important;">H&atilde;y kh&aacute;m ph&aacute; vị ngon của c&aacute;c loại hải sản v&agrave; thịt ăn k&egrave;m trong Set lẩu đặc biệt n&agrave;y nh&eacute;!</div>\n', 0),
(2, 2, 'Gỉam giá tết', 'giam-gia-tet', 'abs', 50000, '2013-12-06 02:55:04', '2013-12-05 04:51:47', 0, 1388534400, 1391126400, '<ul>\n	<li>1111</li>\n	<li>2222</li>\n	<li>3333</li>\n	<li>44444</li>\n	<li>5555</li>\n</ul>\n', '<ul>\n	<li>5555</li>\n	<li>6666</li>\n	<li>777</li>\n	<li>8888</li>\n	<li>9999</li>\n</ul>\n', 43, 0, 0, 1, 100000, 'c4480b26be966d12353b5ea7d6350776.png', '', 0),
(3, 3, 'Khóa Học Kế Toán Sơ Cấp', 'khoa-hoc-ke-toan-so-cap', 'abs', 900000, '2013-12-05 10:29:39', '2013-12-05 09:51:15', 0, 1385856000, 1388448000, '<ul>\n	<li style="text-align:justify">Vipon &aacute;p dụng cho Kh&oacute;a học kế to&aacute;n sơ cấp &ndash; 8 buổi.</li>\n	<li style="text-align:justify">Kh&oacute;a học gi&uacute;p học vi&ecirc;n trang bị những kiến thức cần thiết về 8 chuy&ecirc;n đề kế to&aacute;n cơ bản.</li>\n	<li style="text-align:justify">Kh&oacute;a học d&agrave;nh cho những người trong ng&agrave;nh kế to&aacute;n hoặc những người tự kinh doanh, tự sản xuất&hellip;</li>\n	<li style="text-align:justify">Gi&uacute;p trang bị những hiểu biết cơ bản nhưng thiết thực nhất, hướng dẫn kỹ thuật t&aacute;c nghiệp thực dụng nhất để sau khi tham gia, học vi&ecirc;n c&oacute; đủ khả năng bắt tay v&agrave;o c&ocirc;ng việc kế to&aacute;n.</li>\n	<li style="text-align:justify">Trung T&acirc;m Đ&agrave;o Tạo Kế To&aacute;n Đức Minh đ&agrave;o tạo nghề kế to&aacute;n với phương ph&aacute;p đ&agrave;o tạo thực tế gi&uacute;p người học c&oacute; thể &aacute;p dụng trực tiếp v&agrave;o thực tế c&ocirc;ng việc.</li>\n	<li style="text-align:justify">Đội ngũ giảng vi&ecirc;n c&oacute; chuy&ecirc;n m&ocirc;n cao, nhiệt t&igrave;nh giảng dạy.</li>\n	<li style="text-align:justify">Cơ sở vật chất hiện đại, đầy đủ theo ti&ecirc;u chuẩn của quốc tế.</li>\n	<li style="text-align:justify">Học vi&ecirc;n b&ugrave; th&ecirc;m&nbsp;<em><strong>450.000 đồng</strong></em>&nbsp;khi đến trung t&acirc;m đăng k&yacute; học.</li>\n	<li style="text-align:justify">Học ph&iacute; bao gồm t&agrave;i liệu, chứng chỉ v&agrave; teabreak giữa giờ.</li>\n	<li style="text-align:justify">Thời gian:&nbsp;<em><strong>8 buổi/ kh&oacute;a, 3h/ buổi.</strong></em></li>\n</ul>\n', '<ul>\n	<li style="text-align:justify">Thời hạn sử dụng voucher:&nbsp;<em><strong>17/06/2014</strong></em></li>\n	<li style="text-align:justify">Địa điểm sử dụng voucher:&nbsp;<em><strong>Trung T&acirc;m Đ&agrave;o Tạo Kế To&aacute;n Đức Minh số 79, Ng&otilde; 82 Phạm Ngọc Thạch, Phường Quang Trung, Quận Đống Đa, H&agrave; Nội</strong></em></li>\n	<li style="text-align:justify">&Aacute;p dụng cho Kh&oacute;a học kế to&aacute;n Sơ cấp &ndash;<em><strong>&nbsp;8 buổi.</strong></em></li>\n	<li style="text-align:justify">&Aacute;p dụng v&agrave;o tất cả c&aacute;c ng&agrave;y trong tuần. Giờ mở cửa:&nbsp;<em><strong>8h00 đ&ecirc;́n 21h00</strong></em>.</li>\n	<li style="text-align:justify">Sử dụng&nbsp;<em><strong>01 thẻ / kh&oacute;a</strong></em>. Học vi&ecirc;n b&ugrave; th&ecirc;m 450.000 đồng khi đến trung t&acirc;m đăng k&yacute; học.</li>\n	<li style="text-align:justify">Học ph&iacute; bao gồm t&agrave;i liệu, chứng chỉ v&agrave; teabreak giữa giờ.</li>\n	<li style="text-align:justify">Thời gian:&nbsp;<em><strong>8 buổi/ kh&oacute;a, 3h/ buổi</strong></em>.</li>\n	<li style="text-align:justify">Kh&ocirc;ng &aacute;p dụng đồng thời với c&aacute;c chương tr&igrave;nh khuyến m&atilde;i kh&aacute;c.</li>\n	<li style="text-align:justify">Thẻ kh&ocirc;ng c&oacute; gi&aacute; trị quy đổi th&agrave;nh tiền mặt, kh&ocirc;ng trả lại tiền thừa.</li>\n</ul>\n', 11, 0, 0, 1, 1000000, 'b6519740cd75bb21b20a3b33181b1283.jpg', '<p style="text-align:justify">Li&ecirc;n quan trực tiếp đến vấn đề t&agrave;i ch&iacute;nh của doanh nghiệp, ngo&agrave;i kiến thức chuy&ecirc;n m&ocirc;n được lĩnh hội khi c&ograve;n học ở m&ocirc;i trường ĐH &ndash; CĐ, nh&acirc;n vi&ecirc;n ng&agrave;nh kế to&aacute;n c&ograve;n phải kh&ocirc;ng ngừng trau dồi cho m&igrave;nh những kiến thức c&oacute; li&ecirc;n quan để trở th&agrave;nh một chuy&ecirc;n vi&ecirc;n kế to&aacute;n thực thụ, được c&aacute;c doanh nghiệp sẵn s&agrave;ng ch&agrave;o đ&oacute;n. Ch&iacute;nh v&igrave; thế, ngay h&ocirc;m nay, h&atilde;y đăng k&yacute; tham gia Kh&oacute;a học kế to&aacute;n sơ cấp gồm 8 buổi tại Trung T&acirc;m Đ&agrave;o Tạo Kế To&aacute;n Đức Minh để trang bị những kiến thức cần thiết về 8 chuy&ecirc;n đề kế to&aacute;n cơ bản, đồng thời cập nhật cho m&igrave;nh những kiến thức kế to&aacute;n thực tiễn.</p>\n\n<p style="text-align:center"><img alt="" src="http://diachiso.vn/files/images/ke%20toan%203.jpg" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-top-left-radius:0px !important; border-top-right-radius:0px !important; border:0px; height:487px; max-width:100%; vertical-align:middle; width:600px" /></p>\n\n<p style="text-align:justify">Kh&oacute;a học kế to&aacute;n sơ cấp gồm 8 buổi sẽ trang bị cho học vi&ecirc;n những kiến thức cần thiết về 8 chuy&ecirc;n đề kế to&aacute;n cơ bản: hệ thống t&agrave;i khoản kế to&aacute;n, định khoản kế to&aacute;n, kế to&aacute;n tiền mặt, kế to&aacute;n vật tư, kế to&aacute;n t&agrave;i sản cố đinh&hellip; Kh&oacute;a học được thiết kế d&agrave;nh cho những người theo chuy&ecirc;n ng&agrave;nh kế to&aacute;n muốn cập nhật kiến thức kế to&aacute;n thực h&agrave;nh, những người tự kinh doanh, tự sản xuất&hellip; Trung T&acirc;m Đ&agrave;o Tạo Kế To&aacute;n Đức Minh đ&agrave;o tạo chuy&ecirc;n ng&agrave;nh kế to&aacute;n với phương ph&aacute;p đ&agrave;o tạo thực tế nhanh nhất sẽ gi&uacute;p học vi&ecirc;n c&oacute; thể &aacute;p dụng trực tiếp ngay v&agrave;o thực tế c&ocirc;ng việc.</p>\n\n<p style="text-align:justify"><em><strong>NỘI DUNG CHƯƠNG TR&Igrave;NH KẾ TO&Aacute;N SƠ CẤP:</strong></em></p>\n\n<p style="text-align:justify">- C&aacute;c nguy&ecirc;n tắc kế to&aacute;n sơ cấp, c&aacute;c chuẩn mực kế to&aacute;n.</p>\n\n<p style="text-align:justify">- Hệ thống t&agrave;i khoản kế to&aacute;n, quy chuẩn, phương ph&aacute;p t&iacute;nh.</p>\n\n<p style="text-align:justify">- Định khoản kế to&aacute;n v&agrave; hướng dẫn ứng dụng hệ thống t&agrave;i khoản.</p>\n\n<p style="text-align:justify">- Kế to&aacute;n tiền mặt, tiền gửi ng&acirc;n h&agrave;ng, c&aacute;c khoản thanh to&aacute;n, c&ocirc;ng nợ phải thu - phải trả.</p>\n\n<p style="text-align:justify">- Kế to&aacute;n vật tư - h&agrave;ng h&oacute;a - th&agrave;nh phẩm (H&agrave;ng tồn kho)</p>\n\n<p style="text-align:justify">- Kế to&aacute;n t&agrave;i sản cố định - C&ocirc;ng cụ dụng cụ - Chi ph&iacute; trả trước (Ngắn hạn v&agrave; d&agrave;i hạn).</p>\n\n<p style="text-align:justify">- Kế to&aacute;n tiền lương v&agrave; c&aacute;c khoản tr&iacute;ch theo lương.</p>\n\n<p style="text-align:justify">- Kế to&aacute;n doanh thu - chi ph&iacute; - Tổng hợp x&aacute;c định kết quả sản xuất kinh doanh.</p>\n\n<p style="text-align:justify">- Hệ thống b&aacute;o c&aacute;o t&agrave;i ch&iacute;nh, b&aacute;o c&aacute;o kế to&aacute;n.</p>\n\n<p style="text-align:justify">- Chứng từ, sổ thẻ kế to&aacute;n: tạo lập - lu&acirc;n chuyển - quản l&yacute; v&agrave; hạch to&aacute;n.</p>\n\n<p style="text-align:center"><img alt="" src="http://diachiso.vn/files/images/ke%20toan%201(1).jpg" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-top-left-radius:0px !important; border-top-right-radius:0px !important; border:0px; height:392px; max-width:100%; vertical-align:middle; width:600px" /></p>\n\n<p style="text-align:justify"><em><strong>Gi&aacute; trị học vi&ecirc;n đạt được sau kh&oacute;a học</strong></em></p>\n\n<p style="text-align:justify">- Hiểu một c&aacute;ch vững v&agrave;ng l&yacute; thuyết kế to&aacute;n căn bản.</p>\n\n<p style="text-align:justify">- Th&agrave;nh thạo việc sử dụng - vận dụng hệ thống t&agrave;i khoản.</p>\n\n<p style="text-align:justify">- Th&agrave;nh thạo định khoản nghiệp vụ kế to&aacute;n.</p>\n\n<p style="text-align:justify">- Nắm bắt được c&aacute;c nghiệp vụ của kế to&aacute;n theo từng phần h&agrave;nh.</p>\n\n<p style="text-align:justify">- C&oacute; thể l&agrave;m kế to&aacute;n vi&ecirc;n trong ph&ograve;ng kế to&aacute;n c&ocirc;ng ty.</p>\n\n<p style="text-align:justify">- Được ưu đãi 10% học ph&iacute; cho kh&oacute;a học tiếp theo.</p>\n\n<p style="text-align:justify">- Được đ&aacute;nh gi&aacute; - x&aacute;c thực năng lực cu&ocirc;́i khóa học.</p>\n\n<p style="text-align:justify">Sau khi học v&agrave; thi đỗ kỳ thi x&aacute;c thực năng lực, học vi&ecirc;n được tiếp tục hỗ trợ trong qu&aacute; tr&igrave;nh học tập v&agrave; l&agrave;m việc của m&igrave;nh. Trong trường hợp học vi&ecirc;n muốn hiểu s&acirc;u sắc hơn để c&oacute; kiến thức vững v&agrave;ng hơn c&oacute; thể tham gia miễn ph&iacute; c&aacute;c chuy&ecirc;n đề tương ứng của kh&oacute;a học tương tự, được tư vấn về c&ocirc;ng việc hoặc lựa chọn lớp tiếp theo, được tham gia c&aacute;c chương tr&igrave;nh hội thảo tư vấn về nghề nghiệp, c&aacute;c hoạt động sinh hoạt chuy&ecirc;n m&ocirc;n, c&aacute;c diễn đ&agrave;n nghề nghiệp&hellip;</p>\n\n<p style="text-align:center"><img alt="" src="http://diachiso.vn/files/images/duc%20minh(1).jpeg" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-top-left-radius:0px !important; border-top-right-radius:0px !important; border:0px; height:428px; max-width:100%; vertical-align:middle; width:600px" /></p>\n\n<p style="text-align:justify">Với đội ngũ giảng vi&ecirc;n chuy&ecirc;n m&ocirc;n cao, nhiệt t&igrave;nh giảng dạy, Trung T&acirc;m Đ&agrave;o Tạo Kế To&aacute;n Đức Minh sẽ trang bị cho bạn những nền tảng vững chắc nhất về lĩnh vực kế to&aacute;n, để bạn tự tin trong h&agrave;nh tr&igrave;nh t&igrave;m việc v&agrave; l&agrave;m việc sau n&agrave;y. Họ l&agrave; những người hoạt động l&acirc;u năm trong nghề kh&ocirc;ng chỉ cung cấp những kiến thức nền cơ bản m&agrave; c&ograve;n mang đến cho người học những chia sẻ, những kinh nghiệm về c&ocirc;ng việc họ đ&atilde; từng trải qua.</p>\n', 0);

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
  `daprefix` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `dadistrict`
--

INSERT INTO `dadistrict` (`id`, `dalong_name`, `daurl`, `dainfo`, `damap`, `dadeleted`, `daprovince_id`, `daprefix`) VALUES
(1, 'Bình Thạnh', 'binh-thanh', 'bt2', '<img src=http://maps.google.com/maps/api/staticmap?center=10.8105831,106.7091422&zoom=15&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|10.8105831,106.7091422>', 0, 2, ''),
(2, 'Hai Bà Trưng', 'hai-ba-trung', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0040872,105.8554513&zoom=15&size=600x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0040872,105.8554513>', 0, 1, 'Quận'),
(3, 'Hoàn Kiếm', 'hoan-kiem', '', '', 0, 1, 'Quận'),
(4, 'Tây Hồ', 'tay-ho', '', '', 0, 1, 'Quận'),
(5, 'Quận Tân Bình', 'tan-binh', '', '<img src=http://maps.google.com/maps/api/staticmap?center=10.8084306,106.6468148&zoom=15&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|10.8084306,106.6468148>', 0, 2, ''),
(6, 'Phú Nhuận', 'phu-nhuan', '', '<img src=http://maps.google.com/maps/api/staticmap?center=10.7984723,106.67924&zoom=15&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|10.7984723,106.67924>', 0, 2, ''),
(7, 'Quận 1', 'quan-1', '', 'http://maps.google.com/maps/api/staticmap?center=10.7756587,106.7004238&zoom=14&size=200x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|10.7756587,106.7004238', 0, 2, ''),
(8, 'Quận 2', 'quan-2', '', 'http://maps.google.com/maps/api/staticmap?center=10.7967947,106.7588494&zoom=12&size=200x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|10.7967947,106.7588494', 0, 2, ''),
(9, 'Đống Đa', 'dong-da', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0134822,105.8269415&zoom=15&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0134822,105.8269415>', 0, 1, 'Quận');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `dapic`
--

INSERT INTO `dapic` (`id`, `daserviceplace_id`, `dauser_id`, `dapic`, `dacaption`, `dacreate`) VALUES
(1, 2, 1, 'dff4ca2a3c58db5b5399a17897513644.jpg', 'oi gai :D', '2013-12-05 02:45:19'),
(2, 2, 1, '02ee3a6cf697170f47384d63eefd8f33.jpg', 'the cao viettel', '2013-12-05 02:45:19'),
(3, 2, 1, '7852a2d6538a77a9bec1d72323adbe70.jpg', 'cover', '2013-12-05 02:45:19');

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
  `daprefix` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `daprovince`
--

INSERT INTO `daprovince` (`id`, `dalong_name`, `daurl`, `dainfo`, `damap`, `dadeleted`, `daorder`, `daprefix`) VALUES
(1, 'Hà Nội', 'ha-noi', 'Thủ đô Hà Nội', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0333333,105.85&zoom=13&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0333333,105.85>', 0, 3, 'Thủ Đô'),
(2, 'Hồ Chí Minh', 'ho-chi-minh', 'Thành phố Hồ Chí Minh', '<img src=http://maps.google.com/maps/api/staticmap?center=10.746903,106.676292&zoom=10&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|10.746903,106.676292>', 0, 1, 'TP'),
(3, 'Đồng Tháp', 'dong-thap', 'Tỉnh Đồng Tháp', '<img src=http://maps.google.com/maps/api/staticmap?center=10.4937989,105.6881788&zoom=10&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|10.4937989,105.6881788>', 0, 0, 'Tỉnh');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `daservice_place`
--

INSERT INTO `daservice_place` (`id`, `dalong_name`, `daurl`, `dainfo`, `damap`, `dadeleted`, `dastreet_id`, `daservice_id`, `dapic`, `daaddr`, `datel`, `damobi`, `dafax`, `daemail`, `daview`, `dacomment`, `dalike`, `daedit`, `dacreate`, `daprovince_id`, `dadistrict_id`, `daward_id`, `dauser_id`, `daservicegroup_id`, `dawebsite`, `dalat`, `dalng`) VALUES
(1, 'Trung Tâm Giáo Dục Bé Thông Minh', 'trung-tam-giao-duc-be-thong-minh', '<p><strong>&nbsp; TRUNG T&Acirc;M B&Eacute; TH&Ocirc;NG MINH - NƠI GI&Uacute;P TRẺ PH&Aacute;T TRIỂN TO&Agrave;N DIỆN</strong><br />\n<br />\n&nbsp;&nbsp;&nbsp;&nbsp; Trung t&acirc;m gi&aacute;o dục B&eacute; Th&ocirc;ng Minh l&agrave; th&agrave;nh vi&ecirc;n của tập đo&agrave;n gi&aacute;o dục IndochinaPro. Từ th&aacute;ng 6 năm 2008, trung t&acirc;m B&eacute; Th&ocirc;ng Minh l&agrave; trung t&acirc;m đầu ti&ecirc;n giảng dạy chương tr&igrave;nh FasTracKids tại H&agrave; Nội. L&agrave; một thương hiệu đ&atilde; được c&aacute;c bậc phụ huynh v&agrave; học sinh tiểu học biết đến với c&aacute;c chương tr&igrave;nh hướng đến sự ph&aacute;t triển to&agrave;n diện của những học sinh ưu t&uacute; nhất, đang vươn tới những th&agrave;nh c&ocirc;ng trong trường học v&agrave; cuộc sống, Trung t&acirc;m B&eacute; Th&ocirc;ng Minh lu&ocirc;n nỗ lực hết m&igrave;nh với mong muốn đem lại những g&igrave; tốt đẹp nhất cho trẻ em H&agrave; Nội n&oacute;i ri&ecirc;ng v&agrave; Việt Nam n&oacute;i chung.<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hiện tại, Trung t&acirc;m B&eacute; Th&ocirc;ng Minh đang ph&aacute;t triển c&aacute;c chương tr&igrave;nh tốt nhất về ph&aacute;t triển tư duy, k&iacute;ch th&iacute;ch sự ph&aacute;t triển của N&atilde;o bộ, r&egrave;n luyện kỹ năng v&agrave; c&aacute;c hoạt động ngoại kh&oacute;a d&agrave;nh cho trẻ từ 4 - 11 tuổi.</p>\n\n<table align="center" border="0" cellpadding="5" cellspacing="5" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-collapse:collapse; border-spacing:0px; border-top-left-radius:0px !important; border-top-right-radius:0px !important; font-family:helvetica neue,helvetica,arial,sans-serif; line-height:20px; max-width:100%; width:100%">\n	<tbody>\n		<tr>\n			<td><img alt="Môi trường tốt nhất cho trẻ phát triển" src="http://diachiso.vn/UserFiles/Image/2013/07/FasTracKids-yet-kieu/Anh-Tinh/FasTracKids%2018%20Y%E1%BA%BFt%20Ki%C3%AAu%201.jpg" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-top-left-radius:0px !important; border-top-right-radius:0px !important; border:0px; height:auto; max-width:100%; vertical-align:middle; width:600px" title="Môi trường tốt nhất cho trẻ phát triển" /></td>\n		</tr>\n		<tr>\n			<td><em>M&ocirc;i trường tốt nhất cho trẻ ph&aacute;t triển</em></td>\n		</tr>\n	</tbody>\n</table>\n\n<p><br />\n<span style="font-family:helvetica neue,helvetica,arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FASTRACKIDS: L&agrave; chương tr&igrave;nh bản quyền từ Hoa Kỳ với nội dung gi&aacute;o dục l&agrave;m gi&agrave;u kiến thức, ph&aacute;t triển tư duy, bồi dưỡng c&aacute;c kỹ năng sống v&agrave; kỹ năng x&atilde; hội cho trẻ. Từ những giờ học kh&aacute;m ph&aacute; v&agrave; trải nghiệm, trẻ sẽ được học c&aacute;ch tập trung suy nghĩ, tự tin thuyết tr&igrave;nh trước c&aacute;c bạn, sử dụng khả năng của N&atilde;o bộ một c&aacute;ch s&aacute;ng tạo, học c&aacute;c kỹ năng lập luận, chuyển giao kiến thức, giao tiếp v&agrave; hợp t&aacute;c hiệu quả với người kh&aacute;c.</span><br />\n<span style="font-family:helvetica neue,helvetica,arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp; Chương tr&igrave;nh FasTracKids d&agrave;nh cho trẻ trong độ từ 4 - 8 tuổi, mỗi tuần học 2 tiếng. Đ&acirc;y l&agrave; một chương tr&igrave;nh học với m&ocirc;i trường s&ocirc;i động v&agrave; l&yacute; th&uacute;, hệ thống trang thiết bị ti&ecirc;n tiến, hiện đại kết hợp c&ugrave;ng c&aacute;c hoạt động tư duy, thảo luận, s&aacute;ng tạo, gi&uacute;p trẻ dần quen với m&ocirc;i trường l&agrave;m việc nh&oacute;m, th&iacute; nghiệm khoa học, l&agrave;m sản phẩm v&agrave; thuyết tr&igrave;nh trước c&aacute;c bạn về những điều mới mẻ&hellip;</span><br />\n&nbsp;</p>\n\n<table align="center" border="0" cellpadding="5" cellspacing="5" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-collapse:collapse; border-spacing:0px; border-top-left-radius:0px !important; border-top-right-radius:0px !important; font-family:helvetica neue,helvetica,arial,sans-serif; line-height:20px; max-width:100%; width:100%">\n	<tbody>\n		<tr>\n			<td><img alt=" Buổi học Fastrackids" src="http://diachiso.vn/UserFiles/Image/2013/07/FasTracKids-yet-kieu/Anh-Tinh/FasTracKids%2018%20Y%E1%BA%BFt%20Ki%C3%AAu.jpg" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-top-left-radius:0px !important; border-top-right-radius:0px !important; border:0px; height:auto; max-width:100%; vertical-align:middle; width:600px" title=" Buổi học Fastrackids" /></td>\n		</tr>\n		<tr>\n			<td><em>Buổi học Fastrackids</em></td>\n		</tr>\n	</tbody>\n</table>\n\n<p><br />\n<span style="font-family:helvetica neue,helvetica,arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp; MATHKIDS &ndash; Gi&uacute;p con giỏi To&aacute;n: Đ&acirc;y l&agrave; chương tr&igrave;nh To&aacute;n Học Vui do Trung t&acirc;m v&agrave; c&aacute;c chuy&ecirc;n gia nghi&ecirc;n cứu đưa v&agrave;o giảng dạy.</span><br />\n<span style="font-family:helvetica neue,helvetica,arial,sans-serif">Tất cả c&aacute;c b&agrave;i học nhằm hướng dẫn trẻ ph&acirc;n t&iacute;ch c&aacute;c t&igrave;nh huống li&ecirc;n quan đến tư duy logic v&agrave; tư duy to&aacute;n học. C&aacute;c b&agrave;i tập về nhận biết h&igrave;nh khối, số lượng, quy luật, kiểu mẫu, tr&igrave;nh tự, ph&acirc;n loại, đếm h&igrave;nh, gi&uacute;p tăng cường khả năng quan s&aacute;t, linh hoạt v&agrave; s&aacute;ng tạo.&nbsp;</span><br />\n<span style="font-family:helvetica neue,helvetica,arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Đ&acirc;y l&agrave; chương tr&igrave;nh học tạo cho trẻ sự năng động, tương t&aacute;c với c&aacute;c bạn khiến trẻ cảm thấy vui vẻ, những ứng dụng của to&aacute;n học trong cuộc sống h&agrave;ng ng&agrave;y sẽ khiến trẻ cảm nhận rằng to&aacute;n học, kiểu mẫu, tr&igrave;nh tự v&agrave; c&aacute;c kh&aacute;i niệm kh&ocirc;ng c&ograve;n kh&ocirc; khan nữa.</span><br />\n&nbsp;</p>\n\n<table align="center" border="0" cellpadding="5" cellspacing="5" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-collapse:collapse; border-spacing:0px; border-top-left-radius:0px !important; border-top-right-radius:0px !important; font-family:helvetica neue,helvetica,arial,sans-serif; line-height:20px; max-width:100%; width:100%">\n	<tbody>\n		<tr>\n			<td><img alt="Mathkids - giúp trẻ giỏi toán" src="http://diachiso.vn/UserFiles/Image/2013/07/FasTracKids-yet-kieu/Anh-Tinh/To%C3%A1n%20tr%E1%BA%BB%20em%2018%20Y%E1%BA%BFt%20Ki%C3%AAu.jpg" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-top-left-radius:0px !important; border-top-right-radius:0px !important; border:0px; height:auto; max-width:100%; vertical-align:middle; width:600px" title="Mathkids - giúp trẻ giỏi toán" /></td>\n		</tr>\n		<tr>\n			<td><em>Mathkids - gi&uacute;p trẻ giỏi to&aacute;n</em></td>\n		</tr>\n	</tbody>\n</table>\n\n<p><br />\n<span style="font-family:helvetica neue,helvetica,arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp; MIDA &ndash; Ph&aacute;t triển tr&iacute; th&ocirc;ng minh đa dạng: Ở lứa tuổi 8 &ndash; 12, trẻ c&oacute; những thay đổi rất lớn về tư duy, bắt đầu khẳng định năng lực của bản th&acirc;n, c&oacute; ch&iacute;nh kiến, sống nội t&acirc;m hơn v&agrave; cần chuẩn bị cho m&igrave;nh nhiều năng lượng v&agrave; kỹ năng cho việc chuyển cấp.&nbsp;</span><br />\n<span style="font-family:helvetica neue,helvetica,arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp; Với mong muốn gi&uacute;p trẻ kh&aacute;m ph&aacute; v&agrave; ph&aacute;t huy được hết tiềm năng v&agrave; sức mạnh của bản th&acirc;n, Trung t&acirc;m B&eacute; Th&ocirc;ng Minh dựa tr&ecirc;n những nghi&ecirc;n cứu của Howard Gardner đ&atilde; x&acirc;y dựng chương tr&igrave;nh: Ph&aacute;t triển tr&iacute; th&ocirc;ng minh đa dạng.</span><br />\n<span style="font-family:helvetica neue,helvetica,arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp; Mỗi b&agrave;i học đều bao gồm rất nhiều hoạt động kết hợp cả về ng&ocirc;n ngữ, to&aacute;n học, thể chất, kh&ocirc;ng gian, giao tiếp v&agrave; cảm x&uacute;c của c&aacute; nh&acirc;n, ph&aacute;t triển năng lực hội họa &acirc;m nhạc, t&igrave;m hiểu những điều l&yacute; th&uacute; về tự nhi&ecirc;n v&agrave; n&eacute;t đẹp của cuộc sống xung quanh&hellip; Từ đ&oacute; định hướng cho trẻ ph&aacute;t triển những năng lực tiềm ẩn, ph&aacute;t huy được những thế mạnh của m&igrave;nh trong học tập v&agrave; cuộc sống.</span><br />\n&nbsp;</p>\n\n<table align="center" border="0" cellpadding="5" cellspacing="5" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-collapse:collapse; border-spacing:0px; border-top-left-radius:0px !important; border-top-right-radius:0px !important; font-family:helvetica neue,helvetica,arial,sans-serif; line-height:20px; max-width:100%; width:100%">\n	<tbody>\n		<tr>\n			<td><img alt="Mida - phát triển trí thông minh đa dạng của trẻ" src="http://diachiso.vn/UserFiles/Image/2013/07/FasTracKids-yet-kieu/Anh-Tinh/Ph%C3%A1t%20tri%E1%BB%83n%20tr%C3%AD%20th%C3%B4ng%20minh%20%C4%91a%20d%E1%BA%A1ng%2018%20y%E1%BA%BFt%20ki%C3%AAu.jpg" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-top-left-radius:0px !important; border-top-right-radius:0px !important; border:0px; height:auto; max-width:100%; vertical-align:middle; width:600px" title="Mida - phát triển trí thông minh đa dạng của trẻ" /></td>\n		</tr>\n		<tr>\n			<td><em>Mida - ph&aacute;t triển tr&iacute; th&ocirc;ng minh đa dạng của trẻ</em></td>\n		</tr>\n	</tbody>\n</table>\n\n<p><br />\n<span style="font-family:helvetica neue,helvetica,arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp; HUNA &ndash; Kh&oacute;a học lắp r&aacute;p Robot: Huna l&agrave; chương tr&igrave;nh gi&aacute;o dục phổ cập to&agrave;n H&agrave;n Quốc d&agrave;nh cho trẻ nhỏ được &aacute;p dụng v&agrave;o giảng dạy tại hơn 1.800 trường ở H&agrave;n Quốc v&agrave; nhiều nước trong khu vực ch&acirc;u &Aacute;, đạt ti&ecirc;u chuẩn chất lượng khắt khe của H&agrave;n Quốc v&agrave; Ch&acirc;u &Acirc;u.</span><br />\n<span style="font-family:helvetica neue,helvetica,arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp; Lắp r&aacute;p Robot kh&ocirc;ng chỉ l&agrave; hoạt động của đ&ocirc;i b&agrave;n tay m&agrave; c&ograve;n l&agrave; học Vật l&yacute;, đồng thời ph&aacute;t triển nhận thức qua c&aacute;c hoạt động thực h&agrave;nh như: thiết kế, x&acirc;y dựng, lập tr&igrave;nh cơ bản cho Robot&hellip; Kh&ocirc;ng chỉ học kiến thức, trẻ c&ograve;n học được t&iacute;nh kỷ luật trong nhiều lĩnh vực như khoa học kỹ thuật v&agrave; To&aacute;n học, đồng thời lĩnh hội được nền tảng tuyệt vời về c&aacute;c kỹ năng sống, khả năng nghi&ecirc;n cứu, giải quyết vấn đề, kỹ năng giao tiếp, khả năng suy luận, ph&acirc;n t&iacute;ch, quản l&yacute; v&agrave; thuyết tr&igrave;nh...</span><br />\n<span style="font-family:helvetica neue,helvetica,arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp; Lắp r&aacute;p Robot l&agrave; c&aacute;ch tuyệt nhất để trẻ bắt đầu tạo ra c&aacute;c sản phẩm khoa học v&agrave; To&aacute;n học, đồng thời đ&oacute; cũng l&agrave; c&aacute;ch vui nhất để dạy cho trẻ về c&ocirc;ng nghệ.</span><br />\n&nbsp;</p>\n\n<table align="center" border="0" cellpadding="5" cellspacing="5" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-collapse:collapse; border-spacing:0px; border-top-left-radius:0px !important; border-top-right-radius:0px !important; font-family:helvetica neue,helvetica,arial,sans-serif; line-height:20px; max-width:100%; width:100%">\n	<tbody>\n		<tr>\n			<td><img alt="Huna – giúp trẻ tự tin sáng tạo các mô hình" src="http://diachiso.vn/UserFiles/Image/2013/07/FasTracKids-yet-kieu/Anh-Tinh/HUNA%20-%20L%E1%BA%AFp%20r%C3%A1p%20Robot%20cho%20tr%E1%BA%BB%20nh%E1%BB%8F.jpg" style="border-bottom-left-radius:0px !important; border-bottom-right-radius:0px !important; border-top-left-radius:0px !important; border-top-right-radius:0px !important; border:0px; height:auto; max-width:100%; vertical-align:middle; width:600px" title="Huna – giúp trẻ tự tin sáng tạo các mô hình" /></td>\n		</tr>\n		<tr>\n			<td><em>Huna &ndash; gi&uacute;p trẻ tự tin s&aacute;ng tạo c&aacute;c m&ocirc; h&igrave;nh</em></td>\n		</tr>\n	</tbody>\n</table>\n', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0223015,105.8435941&zoom=15&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0223015,105.8435941>', 0, 4, 1, '69cab2b16865628ce261f85215fa33cd.jpg', '18', '04) 39 411 316', '', '', 'kids@indochinapro.com', 7, 0, 0, '2013-12-05 09:02:31', '2013-12-04 09:53:41', 1, 3, 6, 1, 1, '', '21.0223015', '105.8435941'),
(2, 'Khách Sạn Sunway', 'khach-san-sunway', '<p><span style="font-family:helvetica neue,helvetica,arial,sans-serif">Kh&aacute;ch sạn Sunway cũng mang tới cho qu&yacute; kh&aacute;ch rất nhiều cơ sở vật chất phục vụ cho c&ocirc;ng t&aacute;c v&agrave; giải tr&iacute;, trong đ&oacute; c&oacute; một trung t&acirc;m sức khỏe, một trung t&acirc;m thương vụ, c&aacute;c trang thiết bị phục vụ hội họp v&agrave; một đội ngũ chăm s&oacute;c kh&aacute;ch h&agrave;ng nhạy b&eacute;n đạt ti&ecirc;u chuẩn quốc tế.</span><br />\n<br />\n<strong><em>Kh&aacute;ch sạn Sunway đ&atilde; được trao giải kh&aacute;ch sạn b&igrave;nh d&acirc;n tốt nhất tại Việt Nam.</em><br />\n<br />\n<strong>Tiện nghi:</strong><br />\n<br />\n<strong>C&aacute;c ph&ograve;ng họp:</strong>&nbsp;Được thiết kế để thỏa m&atilde;n những cuộc hội thảo ti&ecirc;u chuẩn quốc tế, được trang bị internet kh&ocirc;ng d&acirc;y tốc độ cao, hệ thống nghe nh&igrave;n v&agrave; c&aacute;c bảng tin.<br />\n<br />\n<strong>Khu giải kh&aacute;t Club Classic:</strong>&nbsp;Mở cửa cả ng&agrave;y cho kh&aacute;ch của ph&ograve;ng loại Club Classic, mang tới cho qu&yacute; kh&aacute;ch một nơi nghỉ ngơi thư gi&atilde;n tuyệt vời với một bar c&aacute; nh&acirc;n c&oacute; tr&agrave; v&agrave; caf&eacute; miễn ph&iacute; c&ugrave;ng với một ph&ograve;ng d&agrave;nh cho những cuộc gặp mặt đặt biệt.<br />\n<br />\n<strong>Trung t&acirc;m thể chất:</strong>&nbsp;C&oacute; c&aacute;c m&aacute;y tập thể dục tối t&acirc;n cũng như những chương tr&igrave;nh tập luyện được c&aacute;c nh&acirc;n h&oacute;a ph&ugrave; hợp với từng người. C&oacute; ph&ograve;ng x&ocirc;ng hơi v&agrave; sauna ri&ecirc;ng cho nam, nữ.<br />\n<br />\n<strong>Trung t&acirc;m thương vụ:</strong>&nbsp;Trung t&acirc;m thương vụ được trang bị đầy đủ v&agrave; hiện đại, với c&aacute;c dịch vụ: Sao, in, photocopy, m&aacute;y t&iacute;nh, m&aacute;y chiếu, dịch thuật, dịch vụ hướng dẫn du lịch, c&aacute;c ph&ograve;ng họp, internet kh&ocirc;ng d&acirc;y tốc độ cao.<br />\n<br />\n<strong>Nh&agrave; h&agrave;ng v&agrave; bar:</strong><br />\n<br />\n<strong>Nh&agrave; h&agrave;ng Allante:</strong>&nbsp;Được thiết kế tao nh&atilde; với khung cảnh thư th&aacute;i, nh&agrave; h&agrave;ng phục vụ thực kh&aacute;ch theo thực đơn v&agrave; c&oacute; bữa trưa buffet với rất nhiều m&oacute;n ăn ngon miệng của Việt Nam v&agrave; thế giới. Nh&agrave; h&agrave;ng được trang bị hệ thống internet kh&ocirc;ng d&acirc;y tốc độ cao.<br />\n<br />\n<strong>Bar Jazz:</strong>&nbsp;Khu quầy bar v&agrave; giải kh&aacute;t nằm ở sảnh sẽ tạo n&ecirc;n một nơi l&yacute; tưởng để nghỉ ngơi. Một thực đơn ăn nhanh lu&ocirc;n c&oacute; sẵn trong ng&agrave;y để phục vụ bạn. Bar được trang bị internet kh&ocirc;ng d&acirc;y tốc độ cao.<br />\n<br />\n<strong>Tiện nghi &amp; Dịch vụ kh&aacute;c:</strong>&nbsp;<br />\n<br />\n&bull; Dịch vụ tr&ocirc;ng trẻ&nbsp;<br />\n&bull; C&acirc;u lạc bộ khi&ecirc;u vũ&nbsp;<br />\n&bull; Dịch vụ đưa đ&oacute;n s&acirc;n bay&nbsp;<br />\n&bull; C&aacute;c dịch vụ Du lịch&nbsp;<br />\n<br />\n<strong>Ph&ograve;ng:</strong><br />\n<br />\nKh&aacute;ch sạn Sunway c&oacute; 143 ph&ograve;ng nghỉ được chia l&agrave;m 3 loại: Superior, Club Classic v&agrave; Junior Suite. C&aacute;c ph&ograve;ng đều được thiết kế đế đ&aacute;p ứng tốt nhất nhu cầu của qu&yacute; kh&aacute;ch.<br />\n<br />\nB&ecirc;n cạnh đ&oacute;, kh&aacute;ch sạn c&ograve;n c&oacute; một dịch vụ độc đ&aacute;o: &ldquo;All in one&rdquo; - &ldquo;Tất cả trong một&rdquo;, chỉ bằng một c&aacute;i nhấn n&uacute;t v&agrave; bạn đ&atilde; c&oacute; thể tiếp cận được với tất cả c&aacute;c dịch vụ. C&aacute;c ph&ograve;ng đều được trang bị internet tốc độ cao, băng thộng rộng.<br />\n<br />\n<strong>Kh&aacute;ch của loại ph&ograve;ng Club Classic sẽ được hưởng c&aacute;c ưu đ&atilde;i:</strong><br />\n<br />\n&bull; V&agrave;o khu giải kh&aacute;t Club Classic với tr&agrave; v&agrave; caf&eacute; miễn ph&iacute;.<br />\n&bull; Một giờ miễn ph&iacute; sử dụng ph&ograve;ng họp (đặt trước).&nbsp;<br />\n&bull; Một giờ truy cập internet miễn ph&iacute;.&nbsp;<br />\n&bull; C&aacute;c giờ giảm gi&aacute; ở Bar Jazz.&nbsp;<br />\n&bull; Giảm gi&aacute; 10% đồ ăn v&agrave; đồ uống tại nh&agrave; h&agrave;ng Allante.&nbsp;<br />\n&bull; Giảm gi&aacute; 10% cho dịch vụ giặt l&agrave;.<br />\n<br />\n<strong>Tiện nghi ph&ograve;ng:</strong><br />\n<br />\n&bull; Điều h&ograve;a&nbsp;<br />\n&bull; Dụng cụ pha c&agrave; ph&ecirc; v&agrave; tr&agrave;&nbsp;<br />\n&bull; M&aacute;y sấy t&oacute;c&nbsp;<br />\n&bull; Dịch vụ internet&nbsp;<br />\n&bull; Dịch vụ điện thoại quốc tế trực tiếp&nbsp;<br />\n&bull; K&eacute;t an to&agrave;n&nbsp;<br />\n&bull; Tủ lạnh&nbsp;<br />\n&bull; Truyền h&igrave;nh vệ tinh</strong></p>\n', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0165329,105.8578098&zoom=17&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0165329,105.8578098>', 0, 6, 2, '519d9cc76d9257cb0861c610f45215ec.jpg', '14', '', '', '', '', 47, 0, 0, '2013-12-06 02:56:21', '2013-12-04 10:07:26', 1, 2, 9, 1, 2, '', '21.0165329', '105.8578098'),
(3, 'Trung Tâm Đào Tạo Kế Toán Đức Minh', 'trung-tam-dao-tao-ke-toan-duc-minh', '<p><span style="color:rgb(85, 85, 85); font-family:helvetica neue,helvetica,arial,sans-serif">C&ocirc;ng ty đ&agrave;o tạo kế to&aacute;n Đức Minh l&agrave; một trong nhưng trung t&acirc;m c&oacute; tiếng h&agrave;ng đầu tại H&agrave; Nội , c&ugrave;ng với sự ph&aacute;t triển nhanh ch&oacute;ng của c&ocirc;ng ty hiện tại đ&atilde; mở rộng th&ecirc;m địa điểm để thuận tiện cho học vi&ecirc;n đến đăng k&iacute; v&agrave; học . Đức Minh lu&ocirc;n cam kết dạy th&agrave;nh nghề mới k&ecirc;t th&uacute;c. Với gi&aacute; ưu đ&atilde;i rẻ nhất tr&ecirc;n thị trường Đức Minh đang trở th&agrave;nh một địa chỉ tin cậy với kh&aacute;ch h&agrave;ng.</span></p>\n', '<img src=http://maps.google.com/maps/api/staticmap?center=21.007723,105.8330575&zoom=16&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.007723,105.8330575>', 0, 7, 1, 'a4a7ec4c664ec0cef419b83665e62bae.jpg', '79', '', '', '', '', 1, 0, 0, '2013-12-05 10:26:53', '2013-12-05 09:47:54', 1, 9, 10, 1, 1, '', '21.007723', '105.8330575');

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
  `daprefix` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `dastreet`
--

INSERT INTO `dastreet` (`id`, `dalong_name`, `daurl`, `dainfo`, `damap`, `dadeleted`, `daward_id`, `daprovince_id`, `dadistrict_id`, `daprefix`) VALUES
(1, 'Bạch Đằng', 'bach-dang', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0229283,105.8624421&zoom=15&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0229283,105.8624421>', 0, 1, 1, 2, 'Đường'),
(2, 'Cảm Hội', 'cam-hoi', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0110947,105.8606107&zoom=15&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0110947,105.8606107>', 0, 1, 1, 2, 'Phố'),
(3, 'Đầm Trấu', 'dam-trau', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.011903,105.8652765&zoom=17&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.011903,105.8652765>', 0, 1, 1, 2, 'Đường'),
(4, 'Yết Kiêu', 'yet-kieu', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0216445,105.8430918&zoom=15&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0216445,105.8430918>', 0, 6, 1, 3, ''),
(5, 'Mai Hắc Đế', 'mai-hac-de', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0135371,105.8510191&zoom=15&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0135371,105.8510191>', 0, 7, 1, 2, ''),
(6, 'Phạm Đình Hổ', 'pham-dinh-ho', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0166101,105.8575262&zoom=17&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0166101,105.8575262>', 0, 9, 1, 2, 'Đường'),
(7, 'Ngõ 82 Phạm Ngọc Thạch', 'ngo-82-pham-ngoc-tha', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.007723,105.8330575&zoom=16&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.007723,105.8330575>', 0, 10, 1, 9, '');

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
-- Stand-in structure for view `daview_deal`
--
CREATE TABLE IF NOT EXISTS `daview_deal` (
`id` int(11)
,`daserviceplace_id` int(11)
,`dalong_name` varchar(100)
,`daurl` varchar(100)
,`datype` varchar(10)
,`daamount` int(11)
,`daedit` timestamp
,`dacreate` timestamp
,`dadeleted` int(11)
,`dafrom` int(11)
,`dato` int(11)
,`daspecial` text
,`dacondition` text
,`daview` int(11)
,`dacomment` int(11)
,`dalike` int(11)
,`dauser_id` int(11)
,`daoldprice` int(11)
,`dapic` varchar(50)
,`dainfo` text
,`dapromo` int(1)
,`placeid` int(11)
,`provinceid` int(11)
,`provincename` varchar(50)
,`provinceurl` varchar(50)
,`districtname` varchar(50)
,`districturl` varchar(20)
,`servicegroupid` int(11)
,`streetname` varchar(50)
,`streeturl` varchar(20)
,`wardname` varchar(50)
,`wardurl` varchar(20)
,`placeurl` varchar(100)
,`placename` text
,`daaddr` text
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `daview_servicecount`
--
CREATE TABLE IF NOT EXISTS `daview_servicecount` (
`id` int(11)
,`dalong_name` varchar(100)
,`daurl` varchar(100)
,`dainfo` text
,`dashowhome` tinyint(4)
,`dadeleted` tinyint(4)
,`daservicegroup_id` int(11)
,`servicegroupname` varchar(100)
,`numplace` bigint(21)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `daview_serviceplace`
--
CREATE TABLE IF NOT EXISTS `daview_serviceplace` (
`id` int(11)
,`dalong_name` text
,`daurl` varchar(100)
,`dainfo` text
,`damap` text
,`dadeleted` tinyint(4)
,`dastreet_id` int(11)
,`daservice_id` int(11)
,`dapic` varchar(50)
,`daaddr` text
,`datel` varchar(20)
,`damobi` varchar(20)
,`dafax` varchar(20)
,`daemail` varchar(50)
,`daview` int(11)
,`dacomment` int(11)
,`dalike` int(11)
,`daedit` timestamp
,`dacreate` timestamp
,`daprovince_id` int(11)
,`dadistrict_id` int(11)
,`daward_id` int(11)
,`dauser_id` int(11)
,`daservicegroup_id` int(11)
,`dawebsite` varchar(100)
,`dalat` varchar(30)
,`dalng` varchar(30)
,`provincename` varchar(50)
,`provinceurl` varchar(50)
,`districtname` varchar(50)
,`districturl` varchar(20)
,`servicegroupid` int(11)
,`streetname` varchar(50)
,`streeturl` varchar(20)
,`wardname` varchar(50)
,`wardurl` varchar(20)
,`serviceurl` varchar(100)
,`serviceid` int(11)
,`servicename` varchar(100)
,`servicegroupurl` varchar(100)
,`servicegroupname` varchar(100)
);
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
  `daprefix` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `daward`
--

INSERT INTO `daward` (`id`, `dalong_name`, `daurl`, `dainfo`, `damap`, `dadeleted`, `dadistrict_id`, `daprovince_id`, `daprefix`) VALUES
(1, 'Bạch Đằng', 'bach-dang', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0132507,105.8657274&zoom=15&size=600x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0132507,105.8657274>', 0, 2, 1, 'Phường'),
(2, 'Bách Khoa', 'bach-khoa', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0042694,105.8459098&zoom=15&size=600x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0042694,105.8459098>', 0, 2, 1, 'Phường'),
(3, 'Bạch Mai', 'bach-mai', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0008143,105.8517814&zoom=15&size=600x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0008143,105.8517814>', 0, 2, 1, ''),
(4, 'Bùi Thị Xuân', 'bui-thi-xuan', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0150437,105.8506805&zoom=15&size=600x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0150437,105.8506805>', 0, 2, 1, ''),
(5, 'Cầu Dền', 'cau-den', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0067485,105.8503135&zoom=15&size=600x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0067485,105.8503135>', 0, 2, 1, ''),
(6, 'Cửa Nam', 'cua-nam', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0252277,105.8426071&zoom=15&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0252277,105.8426071>', 0, 3, 1, ''),
(7, 'Lê Đại Hành', 'le-dai-hanh', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0123071,105.8451758&zoom=15&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0123071,105.8451758>', 0, 2, 1, ''),
(9, 'Phạm Đình Hổ', 'pham-dinh-ho', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0161916,105.8576533&zoom=15&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0161916,105.8576533>', 0, 2, 1, 'Phường'),
(10, 'Quang Trung', 'quang-trung', '', '<img src=http://maps.google.com/maps/api/staticmap?center=21.0120152,105.8253604&zoom=15&size=400x200&maptype=roadmap&sensor=false&language=&markers=color:red|label:none|21.0120152,105.8253604>', 0, 9, 1, 'Phường');

-- --------------------------------------------------------

--
-- Structure for view `daview_deal`
--
DROP TABLE IF EXISTS `daview_deal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`oxid`@`localhost` SQL SECURITY DEFINER VIEW `daview_deal` AS (select `dl`.`id` AS `id`,`dl`.`daserviceplace_id` AS `daserviceplace_id`,`dl`.`dalong_name` AS `dalong_name`,`dl`.`daurl` AS `daurl`,`dl`.`datype` AS `datype`,`dl`.`daamount` AS `daamount`,`dl`.`daedit` AS `daedit`,`dl`.`dacreate` AS `dacreate`,`dl`.`dadeleted` AS `dadeleted`,`dl`.`dafrom` AS `dafrom`,`dl`.`dato` AS `dato`,`dl`.`daspecial` AS `daspecial`,`dl`.`dacondition` AS `dacondition`,`dl`.`daview` AS `daview`,`dl`.`dacomment` AS `dacomment`,`dl`.`dalike` AS `dalike`,`dl`.`dauser_id` AS `dauser_id`,`dl`.`daoldprice` AS `daoldprice`,`dl`.`dapic` AS `dapic`,`dl`.`dainfo` AS `dainfo`,`dl`.`dapromo` AS `dapromo`,`sp2`.`id` AS `placeid`,`sp2`.`daprovince_id` AS `provinceid`,`sp2`.`provincename` AS `provincename`,`sp2`.`provinceurl` AS `provinceurl`,`sp2`.`districtname` AS `districtname`,`sp2`.`districturl` AS `districturl`,`sp2`.`servicegroupid` AS `servicegroupid`,`sp2`.`streetname` AS `streetname`,`sp2`.`streeturl` AS `streeturl`,`sp2`.`wardname` AS `wardname`,`sp2`.`wardurl` AS `wardurl`,`sp2`.`daurl` AS `placeurl`,`sp2`.`dalong_name` AS `placename`,`sp2`.`daaddr` AS `daaddr` from (`dadeal` `dl` join `daview_serviceplace` `sp2`) where ((`dl`.`dadeleted` = 0) and (`sp2`.`id` = `dl`.`daserviceplace_id`)));

-- --------------------------------------------------------

--
-- Structure for view `daview_servicecount`
--
DROP TABLE IF EXISTS `daview_servicecount`;

CREATE ALGORITHM=UNDEFINED DEFINER=`oxid`@`localhost` SQL SECURITY DEFINER VIEW `daview_servicecount` AS select `s`.`id` AS `id`,`s`.`dalong_name` AS `dalong_name`,`s`.`daurl` AS `daurl`,`s`.`dainfo` AS `dainfo`,`s`.`dashowhome` AS `dashowhome`,`s`.`dadeleted` AS `dadeleted`,`s`.`daservicegroup_id` AS `daservicegroup_id`,`sg`.`daurl` AS `servicegroupname`,(select count(`sp`.`id`) from `daservice_place` `sp` where (`sp`.`daservice_id` = `s`.`id`)) AS `numplace` from (`daservice` `s` join `daservice_group` `sg`) where ((`s`.`dadeleted` = 0) and (`sg`.`id` = `s`.`daservicegroup_id`));

-- --------------------------------------------------------

--
-- Structure for view `daview_serviceplace`
--
DROP TABLE IF EXISTS `daview_serviceplace`;

CREATE ALGORITHM=UNDEFINED DEFINER=`oxid`@`localhost` SQL SECURITY DEFINER VIEW `daview_serviceplace` AS (select `sp`.`id` AS `id`,`sp`.`dalong_name` AS `dalong_name`,`sp`.`daurl` AS `daurl`,`sp`.`dainfo` AS `dainfo`,`sp`.`damap` AS `damap`,`sp`.`dadeleted` AS `dadeleted`,`sp`.`dastreet_id` AS `dastreet_id`,`sp`.`daservice_id` AS `daservice_id`,`sp`.`dapic` AS `dapic`,`sp`.`daaddr` AS `daaddr`,`sp`.`datel` AS `datel`,`sp`.`damobi` AS `damobi`,`sp`.`dafax` AS `dafax`,`sp`.`daemail` AS `daemail`,`sp`.`daview` AS `daview`,`sp`.`dacomment` AS `dacomment`,`sp`.`dalike` AS `dalike`,`sp`.`daedit` AS `daedit`,`sp`.`dacreate` AS `dacreate`,`sp`.`daprovince_id` AS `daprovince_id`,`sp`.`dadistrict_id` AS `dadistrict_id`,`sp`.`daward_id` AS `daward_id`,`sp`.`dauser_id` AS `dauser_id`,`sp`.`daservicegroup_id` AS `daservicegroup_id`,`sp`.`dawebsite` AS `dawebsite`,`sp`.`dalat` AS `dalat`,`sp`.`dalng` AS `dalng`,`p`.`dalong_name` AS `provincename`,`p`.`daurl` AS `provinceurl`,`d`.`dalong_name` AS `districtname`,`d`.`daurl` AS `districturl`,`sp`.`daservicegroup_id` AS `servicegroupid`,coalesce(`s`.`dalong_name`,'') AS `streetname`,coalesce(`s`.`daurl`,'') AS `streeturl`,coalesce(`w`.`dalong_name`,'') AS `wardname`,coalesce(`w`.`daurl`,'') AS `wardurl`,`sv`.`daurl` AS `serviceurl`,`sv`.`id` AS `serviceid`,`sv`.`dalong_name` AS `servicename`,`sg`.`daurl` AS `servicegroupurl`,`sg`.`dalong_name` AS `servicegroupname` from ((((((`daservice_place` `sp` left join `daprovince` `p` on((`sp`.`daprovince_id` = `p`.`id`))) left join `dadistrict` `d` on((`sp`.`dadistrict_id` = `d`.`id`))) left join `daward` `w` on((`sp`.`daward_id` = `w`.`id`))) left join `dastreet` `s` on((`sp`.`dastreet_id` = `s`.`id`))) left join `daservice` `sv` on((`sp`.`daservice_id` = `sv`.`id`))) left join `daservice_group` `sg` on((`sg`.`id` = `sp`.`daservicegroup_id`))) where (`sp`.`dadeleted` = 0));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
