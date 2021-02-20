-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.7.19 - MySQL Community Server (GPL)
-- Операционная система:         Win64
-- HeidiSQL Версия:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных mephist
CREATE DATABASE IF NOT EXISTS `mephist` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mephist`;

-- Дамп структуры для таблица mephist.teachers
CREATE TABLE IF NOT EXISTS `teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `desc` varchar(50) NOT NULL DEFAULT '0',
  KEY `PK_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы mephist.teachers: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` (`id`, `name`, `desc`) VALUES
	(1, 'Телек', 'Мужик'),
	(2, 'Рыба', 'Валит'),
	(3, 'Рыбас', 'agent 007');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;

-- Дамп структуры для таблица mephist.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `group` int(11) unsigned DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `role` varchar(30) NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) DEFAULT NULL,
  `year` smallint(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;