-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 02 2019 г., 18:52
-- Версия сервера: 5.7.21
-- Версия PHP: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `24022019`
--

-- --------------------------------------------------------

--
-- Структура таблицы `bonus`
--

DROP TABLE IF EXISTS `bonus`;
CREATE TABLE IF NOT EXISTS `bonus` (
  `Code_bonus` int(11) NOT NULL,
  `Name` char(36) DEFAULT NULL,
  `Score` int(11) DEFAULT NULL,
  PRIMARY KEY (`Code_bonus`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `bonus_user`
--

DROP TABLE IF EXISTS `bonus_user`;
CREATE TABLE IF NOT EXISTS `bonus_user` (
  `Code_bonus` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  PRIMARY KEY (`Code_bonus`,`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `citation`
--

DROP TABLE IF EXISTS `citation`;
CREATE TABLE IF NOT EXISTS `citation` (
  `ID_citation` char(18) NOT NULL,
  `ID_teacher` int(11) DEFAULT NULL,
  `Content` char(200) DEFAULT NULL,
  PRIMARY KEY (`ID_citation`),
  KEY `ID_teacher` (`ID_teacher`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `comment_code` int(11) NOT NULL,
  `news_code` int(11) NOT NULL,
  `content` varchar(300) NOT NULL,
  `creation_date` date NOT NULL,
  `score` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `group`
--

DROP TABLE IF EXISTS `group`;
CREATE TABLE IF NOT EXISTS `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `institute_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `institute`
--

DROP TABLE IF EXISTS `institute`;
CREATE TABLE IF NOT EXISTS `institute` (
  `id` int(11) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `material`
--

DROP TABLE IF EXISTS `material`;
CREATE TABLE IF NOT EXISTS `material` (
  `Code_material` int(11) NOT NULL,
  `Code_subj` int(11) DEFAULT NULL,
  `File` blob,
  `Type` char(18) DEFAULT NULL,
  `Department` int(11) DEFAULT NULL,
  `Semestr` int(11) DEFAULT NULL,
  `disk` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Code_material`),
  KEY `Code_subj` (`Code_subj`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `news_code` int(11) NOT NULL,
  `source_code` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `author` varchar(25) NOT NULL,
  `content` varchar(300) NOT NULL,
  `creation_date` date NOT NULL,
  PRIMARY KEY (`news_code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `source`
--

DROP TABLE IF EXISTS `source`;
CREATE TABLE IF NOT EXISTS `source` (
  `Code_source` int(11) NOT NULL,
  `Name` char(100) NOT NULL,
  `link1` varchar(100) NOT NULL,
  `link2` varchar(100) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`Code_source`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `Code_subj` int(11) NOT NULL,
  `Name` char(25) DEFAULT NULL,
  `Semestr` int(11) DEFAULT NULL,
  PRIMARY KEY (`Code_subj`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `subject_teacher`
--

DROP TABLE IF EXISTS `subject_teacher`;
CREATE TABLE IF NOT EXISTS `subject_teacher` (
  `Code_subj` int(11) NOT NULL,
  `ID_teacher` int(11) NOT NULL,
  PRIMARY KEY (`Code_subj`,`ID_teacher`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `id` int(11) NOT NULL,
  `department_num` int(11) DEFAULT NULL,
  `photo` blob,
  `fio` varchar(40) NOT NULL,
  `institute_id` int(11) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `is_added` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `group` int(11) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `role` varchar(30) NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) DEFAULT NULL,
  `year` smallint(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
