-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.26 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for mdt
DROP DATABASE IF EXISTS `mdt`;
CREATE DATABASE IF NOT EXISTS `mdt` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `mdt`;

-- Dumping structure for table mdt.gradle
DROP TABLE IF EXISTS `gradle`;
CREATE TABLE IF NOT EXISTS `gradle` (
  `id_gradle` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name_gradle` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_gradle`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mdt.gradle: ~5 rows (approximately)
DELETE FROM `gradle`;
/*!40000 ALTER TABLE `gradle` DISABLE KEYS */;
INSERT INTO `gradle` (`id_gradle`, `name_gradle`) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5);
/*!40000 ALTER TABLE `gradle` ENABLE KEYS */;

-- Dumping structure for table mdt.student
DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `id_student` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name_student` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_univer` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id_student`),
  KEY `FK_student_university` (`id_univer`),
  CONSTRAINT `FK_student_university` FOREIGN KEY (`id_univer`) REFERENCES `university` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mdt.student: ~10 rows (approximately)
DELETE FROM `student`;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`id_student`, `name_student`, `id_univer`) VALUES
	(1, 'Iqbolshoh', 1),
	(2, 'Imron', 1),
	(3, 'Saidakbar', 3),
	(4, 'Muhammad', 2),
	(5, 'Firuz', 2),
	(8, 'Farrukh', 2),
	(9, 'Johid', 4),
	(10, 'hushnud', 3),
	(11, 'Jobir', 4),
	(12, 'Akbar', 2);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;

-- Dumping structure for table mdt.student_sub_gradle
DROP TABLE IF EXISTS `student_sub_gradle`;
CREATE TABLE IF NOT EXISTS `student_sub_gradle` (
  `id_stud` int(3) unsigned NOT NULL,
  `id_sub` int(3) unsigned NOT NULL,
  `id_gradle` int(3) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mdt.student_sub_gradle: ~8 rows (approximately)
DELETE FROM `student_sub_gradle`;
/*!40000 ALTER TABLE `student_sub_gradle` DISABLE KEYS */;
INSERT INTO `student_sub_gradle` (`id_stud`, `id_sub`, `id_gradle`) VALUES
	(1, 1, 3),
	(1, 3, 5),
	(1, 9, 3),
	(2, 1, 1),
	(2, 5, 1),
	(3, 4, 1),
	(3, 3, 1),
	(1, 7, 2);
/*!40000 ALTER TABLE `student_sub_gradle` ENABLE KEYS */;

-- Dumping structure for table mdt.subject
DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `id_sub` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name_sub` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_sub`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mdt.subject: ~9 rows (approximately)
DELETE FROM `subject`;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` (`id_sub`, `name_sub`) VALUES
	(1, 'Сотсиология'),
	(2, 'Сиёсатшиноси'),
	(3, 'Фалсафа'),
	(4, 'Математика'),
	(5, 'Забони англиси'),
	(6, 'Забони руси'),
	(7, 'Python'),
	(8, 'Информатика'),
	(9, 'C#');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;

-- Dumping structure for table mdt.teacher
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `id_t` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name_t` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `last_name_t` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_t`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mdt.teacher: ~7 rows (approximately)
DELETE FROM `teacher`;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` (`id_t`, `name_t`, `last_name_t`) VALUES
	(1, 'Беҳзод', 'Раҳмонов'),
	(2, 'Дилшод', 'Музафаров'),
	(3, 'Ҷамшед', 'Раҳимов'),
	(4, 'Дилноза', 'Исмоилова'),
	(5, 'Аъзам', 'Саидвалиев'),
	(6, 'Гулнора', 'Узоқова'),
	(7, 'Маҳбуба', 'Фозилова');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;

-- Dumping structure for table mdt.teacher_sub
DROP TABLE IF EXISTS `teacher_sub`;
CREATE TABLE IF NOT EXISTS `teacher_sub` (
  `id_t` int(3) unsigned NOT NULL,
  `id_sub` int(3) unsigned NOT NULL,
  KEY `FK_teacher_sub_teacher` (`id_t`),
  KEY `FK_teacher_sub_subject` (`id_sub`),
  CONSTRAINT `FK_teacher_sub_subject` FOREIGN KEY (`id_sub`) REFERENCES `subject` (`id_sub`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_teacher_sub_teacher` FOREIGN KEY (`id_t`) REFERENCES `teacher` (`id_t`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mdt.teacher_sub: ~8 rows (approximately)
DELETE FROM `teacher_sub`;
/*!40000 ALTER TABLE `teacher_sub` DISABLE KEYS */;
INSERT INTO `teacher_sub` (`id_t`, `id_sub`) VALUES
	(1, 2),
	(1, 1),
	(2, 8),
	(2, 9),
	(2, 7),
	(6, 5),
	(6, 6),
	(6, 2);
/*!40000 ALTER TABLE `teacher_sub` ENABLE KEYS */;

-- Dumping structure for table mdt.university
DROP TABLE IF EXISTS `university`;
CREATE TABLE IF NOT EXISTS `university` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mdt.university: ~4 rows (approximately)
DELETE FROM `university`;
/*!40000 ALTER TABLE `university` DISABLE KEYS */;
INSERT INTO `university` (`id`, `name`) VALUES
	(1, 'HGU'),
	(2, 'TGU'),
	(3, 'Politech'),
	(4, 'DMT');
/*!40000 ALTER TABLE `university` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
