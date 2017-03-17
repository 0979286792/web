-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- 主機: 127.0.0.1
-- 產生時間： 2017-03-17 16:34:53
-- 伺服器版本: 10.1.19-MariaDB
-- PHP 版本： 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `activity`
--

-- --------------------------------------------------------

--
-- 資料表結構 `activity`
--

CREATE TABLE `activity` (
  `activity_ID` int(11) NOT NULL,
  `activity_Name` varchar(15) NOT NULL,
  `activity_Content` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 資料表的匯出資料 `activity`
--

INSERT INTO `activity` (`activity_ID`, `activity_Name`, `activity_Content`) VALUES
(101, '生物辨識', 'test');

-- --------------------------------------------------------

--
-- 資料表結構 `animal`
--

CREATE TABLE `animal` (
  `classification_ID` int(11) NOT NULL,
  `animal_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 資料表的匯出資料 `animal`
--

INSERT INTO `animal` (`classification_ID`, `animal_ID`) VALUES
(13, 101);

-- --------------------------------------------------------

--
-- 資料表結構 `classification`
--

CREATE TABLE `classification` (
  `activity_ID` int(11) NOT NULL,
  `classification_ID` int(11) NOT NULL,
  `classification_Name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `classification`
--

INSERT INTO `classification` (`activity_ID`, `classification_ID`, `classification_Name`) VALUES
(101, 11, 'fungi'),
(101, 12, 'protozoa'),
(101, 13, 'animal'),
(101, 14, 'plant');

-- --------------------------------------------------------

--
-- 資料表結構 `crab`
--

CREATE TABLE `crab` (
  `crab_ID` int(11) NOT NULL,
  `animal_ID` int(11) NOT NULL,
  `crab_Name` varchar(15) NOT NULL,
  `crab_Subject` varchar(50) NOT NULL,
  `crab_Feature` varchar(500) NOT NULL,
  `crab_Habits` varchar(300) NOT NULL,
  `crab_GPSLocation` varchar(100) NOT NULL,
  `crab_Picture` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(50) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `users`
--

INSERT INTO `users` (`username`, `password`, `email`, `enabled`) VALUES
('root', 'e10adc3949ba59abbe56e057f20f883e', 'mkyong@test.org.tw', 1),
('alex', 'e10adc3949ba59abbe56e057f20f883e', 'alex@test.org.tw', 1),
('maokao', 'e10adc3949ba59abbe56e057f20f883e', 'asdfs@123.123.213', 1),
('amelia', 'e10adc3949ba59abbe56e057f20f883e', 'adf@123.123.123', 1),
('ranma', 'e10adc3949ba59abbe56e057f20f883e', 'maokao25@gmail.com', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `user_roles`
--

CREATE TABLE `user_roles` (
  `user_role_id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `user_roles`
--

INSERT INTO `user_roles` (`user_role_id`, `username`, `role`) VALUES
(1, 'root', 'ROLE_USER'),
(2, 'root', 'ROLE_ADMIN'),
(3, 'alex', 'ROLE_USER'),
(4, 'maokao', 'ROLE_ADMIN'),
(5, 'amelia', 'ROLE_ADMIN');

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`activity_ID`);

--
-- 資料表索引 `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`animal_ID`),
  ADD KEY `classification_ID` (`classification_ID`),
  ADD KEY `animal_ID` (`animal_ID`),
  ADD KEY `animal_ID_2` (`animal_ID`);

--
-- 資料表索引 `classification`
--
ALTER TABLE `classification`
  ADD PRIMARY KEY (`classification_ID`),
  ADD KEY `activity_ID` (`activity_ID`),
  ADD KEY `classification_ID` (`classification_ID`);

--
-- 資料表索引 `crab`
--
ALTER TABLE `crab`
  ADD UNIQUE KEY `crab_ID_2` (`crab_ID`),
  ADD KEY `animal_ID` (`animal_ID`),
  ADD KEY `crab_ID` (`crab_ID`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- 資料表索引 `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_role_id`),
  ADD UNIQUE KEY `uni_username_role` (`role`,`username`),
  ADD KEY `fk_username_idx` (`username`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `activity`
--
ALTER TABLE `activity`
  MODIFY `activity_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
--
-- 使用資料表 AUTO_INCREMENT `animal`
--
ALTER TABLE `animal`
  MODIFY `classification_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- 使用資料表 AUTO_INCREMENT `classification`
--
ALTER TABLE `classification`
  MODIFY `activity_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
--
-- 使用資料表 AUTO_INCREMENT `crab`
--
ALTER TABLE `crab`
  MODIFY `crab_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `user_role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 已匯出資料表的限制(Constraint)
--

--
-- 資料表的 Constraints `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`classification_ID`) REFERENCES `classification` (`classification_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的 Constraints `classification`
--
ALTER TABLE `classification`
  ADD CONSTRAINT `classification_ibfk_1` FOREIGN KEY (`activity_ID`) REFERENCES `activity` (`activity_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的 Constraints `crab`
--
ALTER TABLE `crab`
  ADD CONSTRAINT `crab_ibfk_1` FOREIGN KEY (`animal_ID`) REFERENCES `animal` (`animal_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
