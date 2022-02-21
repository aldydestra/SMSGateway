-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2017 at 01:15 PM
-- Server version: 5.5.40
-- PHP Version: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sms_gammu`
--

-- --------------------------------------------------------

--
-- Table structure for table `autoreply`
--

CREATE TABLE IF NOT EXISTS `autoreply` (
  `keyword` varchar(50) NOT NULL DEFAULT '',
  `reply` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `autoreply`
--

INSERT INTO `autoreply` (`keyword`, `reply`) VALUES
('REG', 'Anda Berhasil untuk Berlangganan...'),
('UNREG', 'Anda Berhasil untuk Berhenti Berlangganan...'),
('UDIN', 'Designer Developer & Freelance, Indonesia ');

-- --------------------------------------------------------

--
-- Table structure for table `daemons`
--

CREATE TABLE IF NOT EXISTS `daemons` (
  `Start` text NOT NULL,
  `Info` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gammu`
--

CREATE TABLE IF NOT EXISTS `gammu` (
  `Version` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gammu`
--

INSERT INTO `gammu` (`Version`) VALUES
(11);

-- --------------------------------------------------------

--
-- Table structure for table `inbox`
--

CREATE TABLE IF NOT EXISTS `inbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ReceivingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Text` text NOT NULL,
  `SenderNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` text NOT NULL,
`ID` int(10) unsigned NOT NULL,
  `RecipientID` text NOT NULL,
  `Processed` enum('false','true') NOT NULL DEFAULT 'false'
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `outbox`
--

CREATE TABLE IF NOT EXISTS `outbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Text` text,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text,
  `Class` int(11) DEFAULT '-1',
  `TextDecoded` text NOT NULL,
`ID` int(10) unsigned NOT NULL,
  `MultiPart` enum('false','true') DEFAULT 'false',
  `RelativeValidity` int(11) DEFAULT '-1',
  `SenderID` varchar(255) DEFAULT NULL,
  `SendingTimeOut` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `DeliveryReport` enum('default','yes','no') DEFAULT 'default',
  `CreatorID` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `outbox_multipart`
--

CREATE TABLE IF NOT EXISTS `outbox_multipart` (
  `Text` text,
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text,
  `Class` int(11) DEFAULT '-1',
  `TextDecoded` text,
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SequencePosition` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pbk`
--

CREATE TABLE IF NOT EXISTS `pbk` (
`ID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT '-1',
  `Name` text NOT NULL,
  `Number` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pbk`
--

INSERT INTO `pbk` (`ID`, `GroupID`, `Name`, `Number`) VALUES
(1, 2, 'Tommy Utama', '081363886626'),
(2, 2, 'Willy Fernando', '081268888888'),
(3, 3, 'Roki Aditama', '082167771233'),
(4, 1, 'Andriano Saputra', '087812444555');

-- --------------------------------------------------------

--
-- Table structure for table `pbk_groups`
--

CREATE TABLE IF NOT EXISTS `pbk_groups` (
  `Name` text NOT NULL,
`ID` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pbk_groups`
--

INSERT INTO `pbk_groups` (`Name`, `ID`) VALUES
('Umum', 1),
('Keluarga', 2),
('Kantor', 3);

-- --------------------------------------------------------

--
-- Table structure for table `phones`
--

CREATE TABLE IF NOT EXISTS `phones` (
  `ID` text NOT NULL,
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TimeOut` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Send` enum('yes','no') NOT NULL DEFAULT 'no',
  `Receive` enum('yes','no') NOT NULL DEFAULT 'no',
  `IMEI` varchar(35) NOT NULL,
  `Client` text NOT NULL,
  `Battery` int(11) NOT NULL DEFAULT '0',
  `Signal` int(11) NOT NULL DEFAULT '0',
  `Sent` int(11) NOT NULL DEFAULT '0',
  `Received` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phones`
--

INSERT INTO `phones` (`ID`, `UpdatedInDB`, `InsertIntoDB`, `TimeOut`, `Send`, `Receive`, `IMEI`, `Client`, `Battery`, `Signal`, `Sent`, `Received`) VALUES
('Modem1', '2016-04-26 04:09:15', '2016-04-26 04:08:10', '2016-04-26 04:09:25', 'yes', 'yes', '867749010708695', 'Gammu 1.28.90, Windows Server 2007, GCC 4.4, MinGW 3.13', 0, 33, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `polling`
--

CREATE TABLE IF NOT EXISTS `polling` (
`id_polling` int(5) NOT NULL,
  `keyword` varchar(50) NOT NULL,
  `pilihan` varchar(255) NOT NULL,
  `total` int(5) NOT NULL,
  `aktif` enum('Y','N') NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `polling`
--

INSERT INTO `polling` (`id_polling`, `keyword`, `pilihan`, `total`, `aktif`) VALUES
(1, 'SKom', 'SarjanaKomedi', 1, 'Y'),
(2, 'DW', 'Dewiit Safitri', 1, 'Y'),
(3, 'TU', 'Tommu Utama', 0, 'Y'),
(4, 'WF', 'Willy Fernando', 1, 'Y'),
(5, 'LH', 'Laura Izzatin Nissa', 0, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `sentitems`
--

CREATE TABLE IF NOT EXISTS `sentitems` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DeliveryDateTime` timestamp NULL DEFAULT NULL,
  `Text` text NOT NULL,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SenderID` varchar(255) NOT NULL,
  `SequencePosition` int(11) NOT NULL DEFAULT '1',
  `Status` enum('SendingOK','SendingOKNoReport','SendingError','DeliveryOK','DeliveryFailed','DeliveryPending','DeliveryUnknown','Error') NOT NULL DEFAULT 'SendingOK',
  `StatusError` int(11) NOT NULL DEFAULT '-1',
  `TPMR` int(11) NOT NULL DEFAULT '-1',
  `RelativeValidity` int(11) NOT NULL DEFAULT '-1',
  `CreatorID` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sentitems`
--

INSERT INTO `sentitems` (`UpdatedInDB`, `InsertIntoDB`, `SendingDateTime`, `DeliveryDateTime`, `Text`, `DestinationNumber`, `Coding`, `UDH`, `SMSCNumber`, `Class`, `TextDecoded`, `ID`, `SenderID`, `SequencePosition`, `Status`, `StatusError`, `TPMR`, `RelativeValidity`, `CreatorID`) VALUES
('2016-04-25 16:22:07', '0000-00-00 00:00:00', '2016-04-25 16:22:07', NULL, '00480061006C006F006F0020006400650077006900200073006100790061006E0067006B00750075002C002E002E', '082173054501', 'Default_No_Compression', '', '+6281100000', -1, 'Haloo dewi sayangkuu,..', 1, 'Modem1', 1, 'SendingOKNoReport', -1, 105, 255, 'Gammu 1.28.90'),
('2016-04-25 17:14:05', '0000-00-00 00:00:00', '2016-04-25 17:14:05', NULL, '00530065006C0061006D0061007400200074006900640075007200200073006100790061006E0067006B00750075002C002E002E0020003A002A', '082173054501', 'Default_No_Compression', '', '+6281100000', -1, 'Selamat tidur sayangkuu,.. :*', 2, 'Modem1', 1, 'SendingOKNoReport', -1, 106, 255, 'Gammu 1.28.90'),
('2016-04-26 03:46:34', '0000-00-00 00:00:00', '2016-04-26 03:46:34', NULL, '0044006500770069002000420075007200750061006B002C002E002E', '082173054501', 'Default_No_Compression', '', '+6281100000', -1, 'Dewi Buruak,..', 8, 'Modem1', 1, 'SendingOKNoReport', -1, 108, 255, 'Gammu 1.28.90'),
('2016-04-26 03:46:37', '0000-00-00 00:00:00', '2016-04-26 03:46:37', NULL, '0041007300730061006C0061006D002C00200041006B0075006E00200061006E006400610020007300750064006100680020006B0061006D006900200061006B007400690066006B0061006E002C002E002E', '085728803444', 'Default_No_Compression', '', '+6281100000', -1, 'Assalam, Akun anda sudah kami aktifkan,..', 5, 'Modem1', 1, 'SendingOKNoReport', -1, 109, 255, 'Gammu'),
('2016-04-26 04:08:44', '0000-00-00 00:00:00', '2016-04-26 04:08:44', NULL, '0044006900680061007200610070006B0061006E0020006B00650070006100640061002000730065006D007500610020006F00720061006E006700200074007500610020006C00650062006900680020006D0065006D0070006500720068006100740069006B0061006E0020007000650072006700610075006C0061006E00200061006E0061006B002D0061006E0061006B006E00790061002E', '+6285765456523', 'Default_No_Compression', '', '+6281100000', -1, 'Diharapkan kepada semua orang tua lebih memperhatikan pergaulan anak-anaknya.', 9, 'Modem1', 1, 'SendingOKNoReport', -1, 110, 255, 'Gammu');

-- --------------------------------------------------------

--
-- Table structure for table `sms_inbox`
--

CREATE TABLE IF NOT EXISTS `sms_inbox` (
`id` int(11) NOT NULL,
  `pesan` text,
  `nohp` varchar(20) DEFAULT NULL,
  `waktu` datetime DEFAULT NULL,
  `modem` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_inbox`
--

INSERT INTO `sms_inbox` (`id`, `pesan`, `nohp`, `waktu`, `modem`) VALUES
(2, 'Apakah menerima jasa pembuatan aplikasi?', '+6285765456523', '2016-04-26 10:52:41', 'Modem1'),
(3, 'Bagaimana caranya mendapatkan aplikasi yang ada disitus www.sarjanakomedi.com', '+6285765456523', '2016-04-26 10:56:26', 'Modem1'),
(4, 'Haloo selamat siang mas, bagaimana kabarnya?...', '+6285765456523', '2016-04-26 11:01:39', 'Modem1'),
(5, 'Selamat hari raya idul adha SarjanaKomedi..', '+6285765456523', '2016-04-26 11:07:16', 'Modem1'),
(6, 'REG INFO', '+6285765456523', '2016-04-26 11:08:07', 'Modem1');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id_user` int(5) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(150) NOT NULL,
  `no_telpon` varchar(15) NOT NULL,
  `level` enum('superuser','admin') NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `nama_lengkap`, `no_telpon`, `level`) VALUES
(1, 'superuser', '6a56955b547bd43bfb3279beee2bc7c85fc6758d60842447648549f991074ab931f4ff323e51645839e39d2e5fbb8e2caabddff0daf353c3b2b7d15dcbd55a68', 'SarjanaKomedi', '085728803444', 'superuser');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inbox`
--
ALTER TABLE `inbox`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `outbox`
--
ALTER TABLE `outbox`
 ADD PRIMARY KEY (`ID`), ADD KEY `outbox_date` (`SendingDateTime`,`SendingTimeOut`), ADD KEY `outbox_sender` (`SenderID`);

--
-- Indexes for table `outbox_multipart`
--
ALTER TABLE `outbox_multipart`
 ADD PRIMARY KEY (`ID`,`SequencePosition`);

--
-- Indexes for table `pbk`
--
ALTER TABLE `pbk`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `pbk_groups`
--
ALTER TABLE `pbk_groups`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `phones`
--
ALTER TABLE `phones`
 ADD PRIMARY KEY (`IMEI`);

--
-- Indexes for table `polling`
--
ALTER TABLE `polling`
 ADD PRIMARY KEY (`id_polling`);

--
-- Indexes for table `sentitems`
--
ALTER TABLE `sentitems`
 ADD PRIMARY KEY (`ID`,`SequencePosition`), ADD KEY `sentitems_date` (`DeliveryDateTime`), ADD KEY `sentitems_tpmr` (`TPMR`), ADD KEY `sentitems_dest` (`DestinationNumber`), ADD KEY `sentitems_sender` (`SenderID`);

--
-- Indexes for table `sms_inbox`
--
ALTER TABLE `sms_inbox`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inbox`
--
ALTER TABLE `inbox`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `outbox`
--
ALTER TABLE `outbox`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pbk`
--
ALTER TABLE `pbk`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pbk_groups`
--
ALTER TABLE `pbk_groups`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `polling`
--
ALTER TABLE `polling`
MODIFY `id_polling` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sms_inbox`
--
ALTER TABLE `sms_inbox`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id_user` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
