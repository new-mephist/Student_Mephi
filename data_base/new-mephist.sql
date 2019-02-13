-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 13 2019 г., 15:24
-- Версия сервера: 5.7.21
-- Версия PHP: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- База данных: `120219`
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
  `ID` char(18) NOT NULL,
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
  PRIMARY KEY (`comment_code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `disk`
--

DROP TABLE IF EXISTS `disk`;
CREATE TABLE IF NOT EXISTS `disk` (
  `Link` char(100) NOT NULL,
  `Code_material` int(11) DEFAULT NULL,
  `Admission_year` int(11) DEFAULT NULL,
  `Completeness_level` float DEFAULT NULL,
  PRIMARY KEY (`Link`),
  KEY `Code_material` (`Code_material`)
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
  PRIMARY KEY (`Code_material`),
  KEY `Code_subj` (`Code_subj`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `material_disk`
--

DROP TABLE IF EXISTS `material_disk`;
CREATE TABLE IF NOT EXISTS `material_disk` (
  `material_code` int(11) NOT NULL,
  `disk_link` int(11) NOT NULL,
  PRIMARY KEY (`disk_link`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `news_code` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `author` varchar(25) NOT NULL,
  `content` varchar(300) NOT NULL,
  `creation_date` date NOT NULL,
  PRIMARY KEY (`news_code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `news_source`
--

DROP TABLE IF EXISTS `news_source`;
CREATE TABLE IF NOT EXISTS `news_source` (
  `Code_news` int(11) NOT NULL,
  `Code_source` int(11) NOT NULL,
  PRIMARY KEY (`Code_news`,`Code_source`)
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
-- Структура таблицы `subject_material`
--

DROP TABLE IF EXISTS `subject_material`;
CREATE TABLE IF NOT EXISTS `subject_material` (
  `material_code` int(11) NOT NULL,
  `subject_code` int(11) NOT NULL,
  PRIMARY KEY (`material_code`)
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
  `description` varchar(300) DEFAULT NULL,
  `is_added` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `teacher_citation`
--

DROP TABLE IF EXISTS `teacher_citation`;
CREATE TABLE IF NOT EXISTS `teacher_citation` (
  `citation_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`citation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` char(18) NOT NULL,
  `password` char(18) NOT NULL,
  `user_group` char(10) NOT NULL,
  `e-mail` int(35) NOT NULL,
  `points` int(11) NOT NULL,
  `extra_info` char(200) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `user_comment`
--

DROP TABLE IF EXISTS `user_comment`;
CREATE TABLE IF NOT EXISTS `user_comment` (
  `user_id` char(18) NOT NULL,
  `comment_code` int(11) NOT NULL,
  PRIMARY KEY (`comment_code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;
