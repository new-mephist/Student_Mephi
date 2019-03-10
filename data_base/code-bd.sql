-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 09 2019 г., 08:05
-- Версия сервера: 5.7.24
-- Версия PHP: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `09032019`
--

-- --------------------------------------------------------

--
-- Структура таблицы `bonus`
--

DROP TABLE IF EXISTS `bonus`;
CREATE TABLE IF NOT EXISTS `bonus` (
  `Code_bonus` int(11) NOT NULL AUTO_INCREMENT,
  `Name` char(36) CHARACTER SET utf8 DEFAULT NULL,
  `Score` int(11) DEFAULT NULL,
  PRIMARY KEY (`Code_bonus`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `bonus`
--

INSERT INTO `bonus` (`Code_bonus`, `Name`, `Score`) VALUES
(1, 'Комментраий', 2),
(2, 'Материал', 10);

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

--
-- Дамп данных таблицы `bonus_user`
--

INSERT INTO `bonus_user` (`Code_bonus`, `ID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `citation`
--

DROP TABLE IF EXISTS `citation`;
CREATE TABLE IF NOT EXISTS `citation` (
  `ID_citation` char(18) CHARACTER SET utf8 NOT NULL,
  `ID_teacher` int(11) DEFAULT NULL,
  `Content` char(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID_citation`),
  KEY `ID_teacher` (`ID_teacher`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `citation`
--

INSERT INTO `citation` (`ID_citation`, `ID_teacher`, `Content`) VALUES
('1', 1, 'Крутой'),
('2', 1, 'Плохой'),
('3', 2, 'Так себе');

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `comment_code` int(11) NOT NULL AUTO_INCREMENT,
  `news_code` int(11) NOT NULL,
  `content` varchar(300) CHARACTER SET utf8 NOT NULL,
  `creation_date` date NOT NULL,
  `score` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_code`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `comment`
--

INSERT INTO `comment` (`comment_code`, `news_code`, `content`, `creation_date`, `score`, `user_id`) VALUES
(1, 1, 'Блаббла', '2019-03-12', 5, 1),
(2, 2, 'ффвфвф', '2019-02-05', 10, 1),
(3, 1, 'оепопо', '2019-02-12', 5, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `group`
--

DROP TABLE IF EXISTS `group`;
CREATE TABLE IF NOT EXISTS `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8 NOT NULL,
  `institute_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `group`
--

INSERT INTO `group` (`id`, `name`, `institute_id`) VALUES
(1, 'Б14-506', 1),
(2, 'Б14-507', 1),
(3, 'Б14-501', 2),
(4, 'Б14-503', 3),
(5, 'Б14-512', 4),
(6, 'Б14-516', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `institute`
--

DROP TABLE IF EXISTS `institute`;
CREATE TABLE IF NOT EXISTS `institute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `institute`
--

INSERT INTO `institute` (`id`, `description`) VALUES
(1, 'ИИКС'),
(2, 'ИФЭБ'),
(3, 'ИМО'),
(4, 'ЛАПЛАЗ');

-- --------------------------------------------------------

--
-- Структура таблицы `material`
--

DROP TABLE IF EXISTS `material`;
CREATE TABLE IF NOT EXISTS `material` (
  `Code_material` int(11) NOT NULL AUTO_INCREMENT,
  `Code_subj` int(11) DEFAULT NULL,
  `File` blob,
  `Type` char(18) CHARACTER SET utf8 DEFAULT NULL,
  `Department` int(11) DEFAULT NULL,
  `Semestr` int(11) DEFAULT NULL,
  `disk` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`Code_material`),
  KEY `Code_subj` (`Code_subj`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `material`
--

INSERT INTO `material` (`Code_material`, `Code_subj`, `File`, `Type`, `Department`, `Semestr`, `disk`) VALUES
(1, 1, NULL, 'Лекция', 1, 1, 'ыасываыа'),
(2, 1, NULL, 'Лекция', 2, 1, 'вфвфвфв'),
(3, 2, NULL, 'Семенар', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `news_code` int(11) NOT NULL AUTO_INCREMENT,
  `source_code` int(11) NOT NULL,
  `title` varchar(20) CHARACTER SET utf8 NOT NULL,
  `author` varchar(25) CHARACTER SET utf8 NOT NULL,
  `content` varchar(300) CHARACTER SET utf8 NOT NULL,
  `creation_date` date NOT NULL,
  PRIMARY KEY (`news_code`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`news_code`, `source_code`, `title`, `author`, `content`, `creation_date`) VALUES
(1, 1, 'авфывф', 'вфвф', 'фвфвфв', '2019-02-12'),
(2, 1, 'вфвфв', 'вфвф', 'фвфвф', '2019-01-08'),
(3, 2, 'вфв', 'вфвф', 'вфвйф', '2018-12-03');

-- --------------------------------------------------------

--
-- Структура таблицы `source`
--

DROP TABLE IF EXISTS `source`;
CREATE TABLE IF NOT EXISTS `source` (
  `Code_source` int(11) NOT NULL AUTO_INCREMENT,
  `Name` char(100) CHARACTER SET utf8 NOT NULL,
  `link1` varchar(100) CHARACTER SET utf8 NOT NULL,
  `link2` varchar(100) CHARACTER SET utf8 NOT NULL,
  `description` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`Code_source`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `source`
--

INSERT INTO `source` (`Code_source`, `Name`, `link1`, `link2`, `description`) VALUES
(1, 'авфыв', 'фвфв', 'вфвф', 'вфвф'),
(2, 'фввф', 'вфвф', 'вфвф', 'фвфв'),
(3, 'фвфв', 'вфвф', 'фввф', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `Code_subj` int(11) NOT NULL AUTO_INCREMENT,
  `Name` char(25) CHARACTER SET utf8 DEFAULT NULL,
  `Semestr` int(11) DEFAULT NULL,
  PRIMARY KEY (`Code_subj`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `subject`
--

INSERT INTO `subject` (`Code_subj`, `Name`, `Semestr`) VALUES
(1, 'Дискретная математика', 1),
(2, 'Дискретная математика', 2),
(3, 'Физика', 1),
(4, 'Физика', 2);

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

--
-- Дамп данных таблицы `subject_teacher`
--

INSERT INTO `subject_teacher` (`Code_subj`, `ID_teacher`) VALUES
(1, 1),
(1, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_num` int(11) DEFAULT NULL,
  `photo` blob,
  `fio` varchar(40) CHARACTER SET utf8 NOT NULL,
  `institute_id` int(11) NOT NULL,
  `description` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `is_added` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `teacher`
--

INSERT INTO `teacher` (`id`, `department_num`, `photo`, `fio`, `institute_id`, `description`, `is_added`) VALUES
(1, 1, NULL, 'вфв', 1, 'фвфвфвф', 0),
(2, 2, NULL, 'вфвф', 1, 'вфвфвфвф', 0),
(3, 2, NULL, 'фввфвф', 2, 'вфвфвфв', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `group` int(11) DEFAULT NULL,
  `password` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `role` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `year` smallint(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `group`, `password`, `role`, `remember_token`, `year`, `created_at`, `updated_at`) VALUES
(1, 'a', 'dada', 1, '11111', 'user', 'adada', 2015, '2019-03-03 21:00:00', '2019-03-03 21:00:00'),
(2, 'b', 'addada', 1, '2222', 'user', NULL, 2015, '2019-02-28 21:00:00', '2019-02-28 21:00:00'),
(3, 'c', 'aaddad', 2, 'dadad', 'user', NULL, 2016, '2019-02-11 21:00:00', '2019-02-21 21:00:00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
