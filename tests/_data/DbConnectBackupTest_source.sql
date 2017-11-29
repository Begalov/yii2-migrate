/* Открытие сеанса "openserver" */
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='archdeco_backup';
SHOW TABLE STATUS FROM `archdeco_backup`;
SHOW FUNCTION STATUS WHERE `Db`='archdeco_backup';
SHOW PROCEDURE STATUS WHERE `Db`='archdeco_backup';
SHOW TRIGGERS FROM `archdeco_backup`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='archdeco_backup';
USE `archdeco`;
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='archdeco';
SHOW TABLE STATUS FROM `archdeco`;
SHOW FUNCTION STATUS WHERE `Db`='archdeco';
SHOW PROCEDURE STATUS WHERE `Db`='archdeco';
SHOW TRIGGERS FROM `archdeco`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='archdeco';
SHOW VARIABLES LIKE 'collation_server';
CREATE DATABASE `archdeco_test` /*!40100 COLLATE 'utf8_general_ci' */;
SHOW DATABASES;
/* Открытие сеанса "openserver" */
USE `archdeco_test`;
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='archdeco_test';
SHOW TABLE STATUS FROM `archdeco_test`;
SHOW FUNCTION STATUS WHERE `Db`='archdeco_test';
SHOW PROCEDURE STATUS WHERE `Db`='archdeco_test';
SHOW TRIGGERS FROM `archdeco_test`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='archdeco_test';
SHOW DATABASES;
/* Открытие сеанса "openserver" */
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='archdeco_test';
SHOW TABLE STATUS FROM `archdeco_test`;
SHOW FUNCTION STATUS WHERE `Db`='archdeco_test';
SHOW PROCEDURE STATUS WHERE `Db`='archdeco_test';
SHOW TRIGGERS FROM `archdeco_test`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='archdeco_test';
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='archdeco';
SHOW TABLE STATUS FROM `archdeco`;
SHOW FUNCTION STATUS WHERE `Db`='archdeco';
SHOW PROCEDURE STATUS WHERE `Db`='archdeco';
SHOW TRIGGERS FROM `archdeco`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='archdeco';
USE `archdeco`;
SHOW CHARSET;
SELECT 'archdeco' AS `Database`, 'ad_album' AS `Table`, 3 AS `Rows`, 0 AS `Duration`;
/*!40101 SET @OLD_LOCAL_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
SHOW CREATE TABLE `archdeco`.`ad_album`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`ad_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `name_ru` varchar(255) DEFAULT NULL,
  `path` varchar(50) DEFAULT NULL,
  `images_ids` text,
  `created_by` int(11) DEFAULT NULL COMMENT 'Autor',
  `created_at` int(11) DEFAULT NULL COMMENT 'UTC of create',
  `updated_at` int(11) DEFAULT NULL COMMENT 'UTC of update',
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
DELETE FROM `archdeco_test`.`ad_album`;
/*!40000 ALTER TABLE `archdeco_test`.`ad_album` DISABLE KEYS */;
SELECT * FROM `archdeco`.`ad_album` LIMIT 19201;
INSERT INTO `archdeco_test`.`ad_album` (`id`, `type`, `status`, `project_id`, `name_en`, `name_ru`, `path`, `images_ids`, `created_by`, `created_at`, `updated_at`, `updated_by`) VALUES
	(3, 2, 4, NULL, 'Landing page backgrounds', 'Фоны главной страницы', NULL, NULL, NULL, 1442312335, 1446046915, NULL),
	(24, 0, 2, NULL, '', 'Альбом 1', NULL, NULL, 1, 1454918364, 1454918409, 1),
	(25, 0, 1, NULL, '', 'Альбом 2', NULL, NULL, 1, 1455046816, 1455046816, 1);
/*!40000 ALTER TABLE `archdeco_test`.`ad_album` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'ad_catalog' AS `Table`, 0 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`ad_catalog`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`ad_catalog` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DELETE FROM `archdeco_test`.`ad_catalog`;
/*!40000 ALTER TABLE `archdeco_test`.`ad_catalog` DISABLE KEYS */;
SELECT * FROM `archdeco`.`ad_catalog` LIMIT 104857600;
/*!40000 ALTER TABLE `archdeco_test`.`ad_catalog` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'ad_comment' AS `Table`, 0 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`ad_comment`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`ad_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
DELETE FROM `archdeco_test`.`ad_comment`;
/*!40000 ALTER TABLE `archdeco_test`.`ad_comment` DISABLE KEYS */;
SELECT * FROM `archdeco`.`ad_comment` LIMIT 104857600;
INSERT INTO `archdeco_test`.`ad_comment` (`id`, `content`, `created_by`) VALUES
	(1, 'Test', 1);
/*!40000 ALTER TABLE `archdeco_test`.`ad_comment` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'ad_contact' AS `Table`, 18 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`ad_contact`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`ad_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_last` varchar(50) DEFAULT NULL COMMENT 'Фамилия',
  `name_first` varchar(50) DEFAULT NULL COMMENT 'Имя',
  `name_middle` varchar(50) DEFAULT NULL COMMENT 'Отчество',
  `company` varchar(50) DEFAULT NULL COMMENT 'Организация',
  `post` varchar(50) DEFAULT NULL COMMENT 'Должность',
  `photo` varchar(250) DEFAULT NULL COMMENT 'Фото',
  `email` varchar(250) DEFAULT NULL COMMENT 'Электронная почта',
  `phone` char(11) DEFAULT NULL COMMENT 'Телефон',
  `birth` date DEFAULT NULL COMMENT 'День рождения',
  `group` varchar(250) DEFAULT NULL COMMENT 'Группы',
  `created_by` int(11) DEFAULT NULL COMMENT 'Создал',
  `created_at` int(11) DEFAULT NULL COMMENT 'Создано',
  `updated_at` int(11) DEFAULT NULL COMMENT 'Обновлено',
  `updated_by` int(11) DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  `description` text COMMENT 'Примечание',
  PRIMARY KEY (`id`),
  KEY `FK_ad_contact_ad_user` (`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;
DELETE FROM `archdeco_test`.`ad_contact`;
/*!40000 ALTER TABLE `archdeco_test`.`ad_contact` DISABLE KEYS */;
SELECT * FROM `archdeco`.`ad_contact` LIMIT 115228;
INSERT INTO `archdeco_test`.`ad_contact` (`id`, `name_last`, `name_first`, `name_middle`, `company`, `post`, `photo`, `email`, `phone`, `birth`, `group`, `created_by`, `created_at`, `updated_at`, `updated_by`, `frequency`, `description`) VALUES
	(1, 'Бегалов', 'Рубен', 'Давидович', 'Арх-Деко (ООО)', 'Генеральный директор', NULL, 'begalov@gmail.com', '9185551151', '1984-07-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 'Бегалова', 'Светлана\r\n', 'Игоревна', 'Арх-Деко (ООО)', 'Главный архитектор', NULL, 'begalova.archdeco@gmail.com', '9282290003', '1952-02-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 'Доценко', 'Ольга', 'Петровна', 'Арх-Деко (ООО)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 'Михальцова', 'Вера', 'Ивановна', 'Арх-Деко (ООО)', 'Архитектор', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 'Пятовский', 'Александр', NULL, 'Арх-Деко (ООО)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(6, 'Ерофеева', 'Наталья', NULL, 'Арх-Деко (ООО)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(7, 'Ковтун', 'Андрей', 'Геннадьевич', 'Бегалова С.И. (ИП)', 'Архитектор', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, ''),
	(8, 'Босов', 'Александр', NULL, 'Арх-Деко (ООО)', 'Конструктор', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 'Четин', 'Алексей', NULL, 'Арх-Деко (ООО)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 'Михайлов', 'Влад', NULL, 'Арх-Деко (ООО)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 'Резницкая', 'Лариса', NULL, 'Арх-Деко (ООО)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(12, NULL, 'Марина', NULL, 'Арх-Деко (ООО)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(13, 'Родионов', 'Александр', 'Сергеевич', 'Арх-Деко (ООО)', 'Архитектор', NULL, 'gvixs/* большой запрос SQL (2,7 KiB), ограничен 2 000 символами */
/*!40000 ALTER TABLE `archdeco_test`.`ad_contact` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'ad_contract' AS `Table`, 0 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`ad_contract`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`ad_contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `data` int(11) DEFAULT NULL,
  `cteated_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='contracts table\r\n';
DELETE FROM `archdeco_test`.`ad_contract`;
/*!40000 ALTER TABLE `archdeco_test`.`ad_contract` DISABLE KEYS */;
SELECT * FROM `archdeco`.`ad_contract` LIMIT 104857600;
/*!40000 ALTER TABLE `archdeco_test`.`ad_contract` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'ad_definitions' AS `Table`, 3 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`ad_definitions`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`ad_definitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `defName` varchar(255) DEFAULT NULL,
  `definition` text NOT NULL,
  `author_id` int(11) DEFAULT NULL COMMENT 'autor of project',
  `parent_id` int(11) DEFAULT NULL COMMENT 'link to',
  `status` int(1) DEFAULT NULL COMMENT 'active, inactive',
  `role` int(1) DEFAULT NULL COMMENT 'worker, manager, top',
  `create` int(11) DEFAULT NULL COMMENT 'UTC',
  `update` int(11) DEFAULT NULL COMMENT 'UTC',
  `close` int(11) DEFAULT NULL COMMENT 'UTC',
  `description` text,
  `log` text COMMENT 'editing log',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;
DELETE FROM `archdeco_test`.`ad_definitions`;
/*!40000 ALTER TABLE `archdeco_test`.`ad_definitions` DISABLE KEYS */;
SELECT * FROM `archdeco`.`ad_definitions` LIMIT 19201;
INSERT INTO `archdeco_test`.`ad_definitions` (`id`, `defName`, `definition`, `author_id`, `parent_id`, `status`, `role`, `create`, `update`, `close`, `description`, `log`) VALUES
	(100, 'Работа [Work]', 'непрерывное физическое или умственное усилие, направленное на преодоление препятствий и достижение целей или результатов; специфическая задача, обязанность, функция или задание, часто являющиеся частью фазы или другой, большей по объему работы; что-то, производимое или выполняемое в результате усилия или применения навыков (квалификации)', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(101, 'Декомпозиция [Breakdown]', 'разделение на части или категории, выделение простых составляющих.', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(1000, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `archdeco_test`.`ad_definitions` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'ad_equipment' AS `Table`, 0 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`ad_equipment`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`ad_equipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `sn` varchar(250) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DELETE FROM `archdeco_test`.`ad_equipment`;
/*!40000 ALTER TABLE `archdeco_test`.`ad_equipment` DISABLE KEYS */;
SELECT * FROM `archdeco`.`ad_equipment` LIMIT 104857600;
/*!40000 ALTER TABLE `archdeco_test`.`ad_equipment` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'ad_file' AS `Table`, 18 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`ad_file`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`ad_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseName` varchar(250) DEFAULT NULL,
  `extension` varchar(250) DEFAULT NULL,
  `parent` varchar(250) DEFAULT NULL,
  `newName` varchar(250) DEFAULT NULL COMMENT 'adler32',
  `path` varchar(50) DEFAULT NULL,
  `hash` varchar(250) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `storage` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `uploaded_at` int(11) DEFAULT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `updater` (`updated_by`),
  KEY `uploader` (`uploaded_by`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
DELETE FROM `archdeco_test`.`ad_file`;
/*!40000 ALTER TABLE `archdeco_test`.`ad_file` DISABLE KEYS */;
SELECT * FROM `archdeco`.`ad_file` LIMIT 115228;
INSERT INTO `archdeco_test`.`ad_file` (`id`, `baseName`, `extension`, `parent`, `newName`, `path`, `hash`, `type`, `storage`, `size`, `status`, `uploaded_at`, `uploaded_by`, `updated_at`, `updated_by`) VALUES
	(1, 'sqre', 'jpg', NULL, 'dc61bfd4', '70\\f40\\91f', 'c0e52c095bffdb6e7072d75ea6f0f0b5', 'image/jpeg', 0, 604975, NULL, NULL, NULL, NULL, NULL),
	(2, 'sqre', 'jpg', NULL, 'dc61bfd4', '70\\f40\\91f', 'c0e52c095bffdb6e7072d75ea6f0f0b5', 'image/jpeg', 0, 604975, NULL, NULL, NULL, NULL, NULL),
	(3, 'emil', 'jpg', NULL, 'e07161ac', '70\\f40\\91f', '9ccb1140687449eee0abc49f00fc859d', 'image/jpeg', 0, 5311305, NULL, NULL, NULL, NULL, NULL),
	(4, 'large', 'jpg', NULL, '404830bf', '70\\f40\\91f', '4f497e3e9e5b7bcc6699eb32605c87ab', 'image/jpeg', 0, 4839617, NULL, NULL, NULL, NULL, NULL),
	(5, 'medium', 'jpg', NULL, '18b1bd80', '70\\f40\\91f', 'cbcf598e7d8099dea6c4338e8a4b5ea7', 'image/jpeg', 0, 708762, NULL, NULL, NULL, NULL, NULL),
	(6, 'P-15-M02 sattelite', 'jpg', NULL, 'c2cb1219', '05\\695\\8e5', 'c4f6cfe7f3e52ce2e7c9f62b27e10586', 'image/jpeg', 0, 554487, NULL, NULL, NULL, NULL, NULL),
	(7, 'P-15-M02 sattelite', 'jpg', NULL, 'c2cb1219', '05\\695\\8e5', 'c4f6cfe7f3e52ce2e7c9f62b27e10586', 'image/jpeg', 0, 554487, NULL, NULL, NULL, NULL, NULL),
	(8, 'P-15-M02 sattelite', 'jpg', NULL, 'c2cb1219', 'aa\\2cf\\eec', 'c4f6cfe7f3e52ce2e7c9f62b27e10586', 'image/jpeg', 0, 554487, 0, NULL, NULL, NULL, NULL),
	(9, 'P-15-M02 sattelite', 'jpg', NULL, 'c2cb1219', 'aa\\2cf\\eec', 'c4f6cfe7f3e52ce2e7c9f62b27e10586', 'image/jpeg', 0, 554487, 0, NULL, NULL, NULL, NULL),
	(10, 'P-15-M02 sattelite', 'jpg', NULL, 'c2cb1219', 'aa\\2cf\\eec', 'c4f6cfe7f3e52ce2e7c9f62b27e10586', 'image/jpeg', 0, 554487, 0, NULL, NULL, NULL, NULL),
	(11, 'P-15-M02 sattelite', 'jpg', NULL, 'c2cb1219', 'aa\\2cf\\eec', 'c4f6cfe7f3e52ce2e7c9f62b27e10586', 'image/jpeg', 0, 554487, NULL, NULL, NULL, NULL, NULL),
	(12, 'P-15-M02 sattelite', 'jpg', NULL, 'c2cb1219', 'aa\\2cf\\eec', 'c4f6cfe7f3e52ce2e7c9f/* большой запрос SQL (2,9 KiB), ограничен 2 000 символами */
/*!40000 ALTER TABLE `archdeco_test`.`ad_file` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'ad_guide' AS `Table`, 7 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`ad_guide`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`ad_guide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guideName` varchar(255) DEFAULT NULL,
  `guideData` text NOT NULL,
  `author_id` int(11) DEFAULT NULL COMMENT 'autor of project',
  `parent_id` int(11) DEFAULT NULL COMMENT 'link to instruct',
  `children_id` text,
  `status` int(1) DEFAULT NULL COMMENT 'active, inactive',
  `role` int(1) DEFAULT NULL COMMENT 'worker, manager, top',
  `created_at` int(11) DEFAULT NULL COMMENT 'UTC',
  `updated_at` int(11) DEFAULT NULL COMMENT 'UTC',
  `close` int(11) DEFAULT NULL COMMENT 'UTC',
  `frequency` int(11) DEFAULT NULL,
  `description` text,
  `log` text COMMENT 'editing log',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
DELETE FROM `archdeco_test`.`ad_guide`;
/*!40000 ALTER TABLE `archdeco_test`.`ad_guide` DISABLE KEYS */;
SELECT * FROM `archdeco`.`ad_guide` LIMIT 44811;
INSERT INTO `archdeco_test`.`ad_guide` (`id`, `guideName`, `guideData`, `author_id`, `parent_id`, `children_id`, `status`, `role`, `created_at`, `updated_at`, `close`, `frequency`, `description`, `log`) VALUES
	(900, 'Первичная документация', 'К первичной документации относятся договора, задания на проектирование, счета, акты и прочее.', 1, NULL, '', NULL, 5, NULL, 1446921055, NULL, NULL, '', 'manual'),
	(901, 'Счета', 'Код счёта: [Код проекта]+ Номер счёта', 1, 900, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, 'manual'),
	(995, 'Ранги', 'Сотрудник, Лидер, Менеджер, Топ', NULL, 996, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL),
	(996, 'Проекты', '', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL),
	(997, 'Структура папок', '', 1, 999, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 'manual'),
	(998, 'Резервное копирование', '', 1, 999, NULL, 1, 6, NULL, NULL, NULL, NULL, NULL, 'manual'),
	(999, 'Сервер', '', 1, NULL, NULL, 1, 7, NULL, NULL, NULL, NULL, NULL, 'manual');
/*!40000 ALTER TABLE `archdeco_test`.`ad_guide` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'ad_img' AS `Table`, 10 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`ad_img`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`ad_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `format` int(11) DEFAULT NULL,
  `crop` varchar(250) DEFAULT NULL,
  `aspectRatio` varchar(250) DEFAULT NULL,
  `owner_type` varchar(250) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `refreshed_at` int(11) DEFAULT NULL,
  `refreshed_by` int(11) DEFAULT NULL,
  `exif` text COMMENT 'exif custom data',
  `iptc` text,
  `frequency` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `album_id` (`owner_id`),
  KEY `file_id` (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
DELETE FROM `archdeco_test`.`ad_img`;
/*!40000 ALTER TABLE `archdeco_test`.`ad_img` DISABLE KEYS */;
SELECT * FROM `archdeco`.`ad_img` LIMIT 64016;
INSERT INTO `archdeco_test`.`ad_img` (`id`, `file_id`, `height`, `width`, `format`, `crop`, `aspectRatio`, `owner_type`, `owner_id`, `created_at`, `created_by`, `refreshed_at`, `refreshed_by`, `exif`, `iptc`, `frequency`) VALUES
	(1, 1, NULL, NULL, NULL, NULL, NULL, 'album', 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 2, NULL, NULL, NULL, NULL, NULL, 'album', 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 3, NULL, NULL, NULL, NULL, NULL, 'album', 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 4, NULL, NULL, NULL, NULL, NULL, 'album', 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 5, NULL, NULL, NULL, NULL, NULL, 'album', 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(6, 6, NULL, NULL, NULL, NULL, NULL, 'album', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(7, 7, NULL, NULL, NULL, NULL, NULL, 'album', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 8, 916, 1888, 1, NULL, '472:229', 'album', 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 9, 916, 1888, 1, NULL, '472:229', 'album', 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 10, 916, 1888, 1, NULL, '472:229', 'album', 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 11, 916, 1888, 1, NULL, '472:229', 'album', 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(12, 15, 600, 745, 1, NULL, '149:120', 'album', 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `archdeco_test`.`ad_img` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'ad_letter' AS `Table`, 0 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`ad_letter`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`ad_letter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) DEFAULT NULL,
  `letterName` varchar(250) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL COMMENT 'link to project',
  `author_id` int(11) DEFAULT NULL COMMENT 'link to autor',
  `letter_id` int(11) DEFAULT NULL COMMENT 'link to reply',
  `create` int(11) DEFAULT NULL COMMENT 'UTC',
  `link` text COMMENT 'link to file',
  `description` text,
  `log` text COMMENT 'editing log',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DELETE FROM `archdeco_test`.`ad_letter`;
/*!40000 ALTER TABLE `archdeco_test`.`ad_letter` DISABLE KEYS */;
SELECT * FROM `archdeco`.`ad_letter` LIMIT 104857600;
/*!40000 ALTER TABLE `archdeco_test`.`ad_letter` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'ad_order' AS `Table`, 0 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`ad_order`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`ad_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `subject` varchar(250) DEFAULT NULL,
  `message` text,
  `created_at` int(11) DEFAULT NULL,
  `created_ip` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DELETE FROM `archdeco_test`.`ad_order`;
/*!40000 ALTER TABLE `archdeco_test`.`ad_order` DISABLE KEYS */;
SELECT * FROM `archdeco`.`ad_order` LIMIT 104857600;
/*!40000 ALTER TABLE `archdeco_test`.`ad_order` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'ad_partner' AS `Table`, 8 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`ad_partner`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`ad_partner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partnerName` char(125) DEFAULT NULL COMMENT 'Наименование',
  `fullPartnerName` varchar(250) DEFAULT NULL COMMENT 'Полное наименование',
  `form` char(50) DEFAULT NULL COMMENT 'Правовая форма собственности',
  `inn` char(11) DEFAULT NULL COMMENT 'Идентификационный номер налогоплательщика',
  `kpp` char(11) DEFAULT NULL COMMENT 'Код причины постановки на учёт',
  `ogrn` char(12) DEFAULT NULL COMMENT 'Основной государственный регистрационный номер',
  `bik` char(8) DEFAULT NULL COMMENT 'Банковский идентификационный код',
  `rs` char(19) DEFAULT NULL COMMENT 'Расчётный счёт',
  `ks` char(19) DEFAULT NULL COMMENT 'Корреспондентский счёт',
  `bankName` varchar(250) DEFAULT NULL COMMENT 'Наименование банка',
  `uadress` varchar(500) DEFAULT NULL COMMENT 'Юридический адрес',
  `fadress` varchar(500) DEFAULT NULL COMMENT 'Физический адрес',
  `head_id` int(11) DEFAULT NULL COMMENT 'Ссылка на руководителя',
  `company_id` int(11) DEFAULT NULL COMMENT 'Ссылка на организацию',
  `author_id` int(11) DEFAULT NULL COMMENT 'autor of project',
  `projects_id` varchar(250) DEFAULT NULL COMMENT 'Ссылки на проекты через '',''',
  `create` int(11) DEFAULT NULL COMMENT 'UTC',
  `update` int(11) DEFAULT NULL COMMENT 'UTC',
  `frequency` int(11) DEFAULT NULL,
  `description` text,
  `log` text COMMENT 'editing log',
  PRIMARY KEY (`id`),
  KEY `head` (`head_id`),
  KEY `company` (`company_id`),
  KEY `FK_ad_partner_ad_user` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;
DELETE FROM `archdeco_test`.`ad_partner`;
/*!40000 ALTER TABLE `archdeco_test`.`ad_partner` DISABLE KEYS */;
SELECT * FROM `archdeco`.`ad_partner` LIMIT 51200;
INSERT INTO `archdeco_test`.`ad_partner` (`id`, `partnerName`, `fullPartnerName`, `form`, `inn`, `kpp`, `ogrn`, `bik`, `rs`, `ks`, `bankName`, `uadress`, `fadress`, `head_id`, `company_id`, `author_id`, `projects_id`, `create`, `update`, `frequency`, `description`, `log`) VALUES
	(1, 'Арх-Деко', 'Арх-Деко', 'ООО', '6167095152', '616701001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
	(2, 'Бегалова С.И.', 'Бегалова Светлана Игоревна', 'ИП', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
	(101, 'ЮНКТАД', NULL, 'ЗАО', '6167055618', '616701001', '102610414343', NULL, NULL, NULL, NULL, NULL, NULL, 102, 101, 1, '999', NULL, NULL, 3, NULL, NULL),
	(102, 'Аэропорт РнД', 'Аэропорт Ростов-на-Дону', 'ОАО', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL),
	(114, 'Православный Приход храма Покрова Пресвятой Богородицы', 'Местная религиозная организация «Православный Приход храма Покрова Пресвятой Богородицы»  г.Ростова-на-Дону  Религиозной  организации  «Ростовская-на-Дону Епархия Русской Православной Церкви (Московский Патриархат)»', 'МРО', '6161019148', '616101001', '', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL),
	(119, 'Сорокин А.В.', NULL, 'ФЛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL),
	(120, 'Дон Текс', NULL, 'ЗАО', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL),
	(121, 'БТК групп', '', 'ОАО', '7816043890', '781601001', '102780798987', NULL, NULL, NULL, NULL, '192241 г. Санкт-Петербург, ул. Пражская, д.10, Россия ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'ОКПО: 00302907\r\nРуководитель Проекта Харсиев Иса Ахметович, действующий на основании доверенности серия 78 АА № 4944376 от 14.10.2013 г., удостоверенной Прокопенко С.С., временно исполн/* большой запрос SQL (2,1 KiB), ограничен 2 000 символами */
/*!40000 ALTER TABLE `archdeco_test`.`ad_partner` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'ad_price' AS `Table`, 0 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`ad_price`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`ad_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DELETE FROM `archdeco_test`.`ad_price`;
/*!40000 ALTER TABLE `archdeco_test`.`ad_price` DISABLE KEYS */;
SELECT * FROM `archdeco`.`ad_price` LIMIT 104857600;
/*!40000 ALTER TABLE `archdeco_test`.`ad_price` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'ad_project' AS `Table`, 27 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`ad_project`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`ad_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `own` char(1) DEFAULT NULL COMMENT 'Owner',
  `year` char(2) DEFAULT NULL COMMENT 'Year',
  `number` int(3) DEFAULT NULL COMMENT 'Main number',
  `number_add` int(3) DEFAULT NULL COMMENT 'Additional number',
  `projectName` varchar(125) DEFAULT NULL COMMENT 'Project name',
  `fullProjectName` varchar(500) DEFAULT NULL,
  `adress` varchar(250) DEFAULT NULL,
  `date` date DEFAULT NULL COMMENT 'Date',
  `until` date DEFAULT NULL COMMENT 'UTC of untill end',
  `deadline` int(1) DEFAULT NULL COMMENT 'Days of deadline',
  `partner_id` int(11) DEFAULT NULL,
  `inwork` int(1) DEFAULT NULL COMMENT 'Status: in work',
  `inarchive` int(1) DEFAULT NULL COMMENT 'Status: in archive',
  `isdelete` int(1) DEFAULT NULL COMMENT 'Status: deleted',
  `isdone` int(1) DEFAULT NULL,
  `priority` float DEFAULT NULL COMMENT 'Priority',
  `cover` varchar(250) DEFAULT NULL COMMENT 'old Thumbnail',
  `folder` varchar(250) DEFAULT NULL COMMENT 'Folder name',
  `curator_id` int(11) DEFAULT NULL COMMENT 'Leader of project',
  `created_by` int(11) DEFAULT NULL COMMENT 'Autor',
  `updated_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL COMMENT 'UTC of create',
  `updated_at` int(11) DEFAULT NULL COMMENT 'UTC of update',
  `closed` int(11) DEFAULT NULL COMMENT 'UTC of close',
  `price` int(11) DEFAULT NULL COMMENT 'Price',
  `frequency` int(11) DEFAULT NULL,
  `description` text COMMENT 'Description',
  `log` text COMMENT 'Editing log',
  PRIMARY KEY (`id`),
  KEY `author_id` (`created_by`),
  KEY `partner_id` (`partner_id`),
  KEY `curator_id` (`curator_id`),
  CONSTRAINT `author_id` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `curator_id` FOREIGN KEY (`curator_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `partner_id` FOREIGN KEY (`partner_id`) REFERENCES /* большой запрос SQL (2,1 KiB), ограничен 2 000 символами */
DELETE FROM `archdeco_test`.`ad_project`;
/*!40000 ALTER TABLE `archdeco_test`.`ad_project` DISABLE KEYS */;
SELECT * FROM `archdeco`.`ad_project` LIMIT 173032;
INSERT INTO `archdeco_test`.`ad_project` (`id`, `own`, `year`, `number`, `number_add`, `projectName`, `fullProjectName`, `adress`, `date`, `until`, `deadline`, `partner_id`, `inwork`, `inarchive`, `isdelete`, `isdone`, `priority`, `cover`, `folder`, `curator_id`, `created_by`, `updated_by`, `created_at`, `updated_at`, `closed`, `price`, `frequency`, `description`, `log`) VALUES
	(450, 'А', '11', 31, 2, 'Гинза - Бамбук', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(600, 'А', '13', 13, 2, 'Аэропорт РнД - Лестница', '', 'Ростов-на-Дону', '2014-04-24', '2014-05-24', NULL, NULL, 0, 1, 0, NULL, 0.5, NULL, '\\\\AD-SERVER\\Work\\2013\\А-13-013-2 Аэропорт РнД - Лестница', NULL, 1, NULL, NULL, 1406199399, NULL, NULL, NULL, '', 'Заказчик | (ИП)'),
	(601, 'А', '14', 24, 1, 'Юнктад на Доватора 148', '', '', '2014-05-29', NULL, 7, NULL, 0, 1, 0, NULL, 0.5, NULL, '\\\\AD-SERVER\\Work\\2014\\А-14-024 Юнктад', NULL, 1, NULL, 2014, 1407138260, NULL, 139000, NULL, '', 'manual'),
	(650, 'А', '14', 5, 1, 'жд на Мечникова 39', 'Многоэтажный\r\nжилой дом с офисными помещениями в первом этаже и подземной парковкой по адресу г.\r\nРостов-на-Дону, ул. Мечникова №39В', 'г. Ростов-на-Дону, ул. Мечникова №39В', '2014-04-28', '2014-07-28', NULL, 119, 1, 0, 0, NULL, 0.75, NULL, '\\\\AD-SERVER\\Work\\2014\\А-14-005 жд на Мечникова 39', NULL, 1, NULL, NULL, 1406283634, NULL, NULL, NULL, '', NULL),
	(660, 'А', '14', 9, 1, 'Маг Соколова', '', '', '2014-03-27', '2014-04-30', NULL, NULL, 0, 0, 0, NULL, 0.5, NULL, '\\\\AD-SERVER\\Work\\2014\\А-14-009 Маг Соколова', NULL, 1, NULL, NULL, 1406047969, NULL, NULL, NULL, '', NULL),
	(661, 'Б', '14', 21, 1, 'Храм Курган', 'Эскизный  проект  реконструкции  Храма «Успения Пресвятой Богородицы»', ' Ростовская область, х. Курган', '2014-05-23', '2014-06-23', NULL, 114, 1, 0, 0, NULL, 0.5, NULL, '\\\\AD-SERVER\\Work\\2014\\Б-14-021 Храм Курган', NULL, NULL, NULL, NULL/* большой запрос SQL (7,3 KiB), ограничен 2 000 символами */
/*!40000 ALTER TABLE `archdeco_test`.`ad_project` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'ad_service' AS `Table`, 3 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`ad_service`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`ad_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(50) NOT NULL,
  `name_ru` varchar(50) NOT NULL,
  `desc_en` text,
  `desc_ru` text,
  `created` datetime DEFAULT NULL,
  `expired` datetime DEFAULT NULL,
  `status` int(1) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='List of services\r\nLanguage En, Ru';
DELETE FROM `archdeco_test`.`ad_service`;
/*!40000 ALTER TABLE `archdeco_test`.`ad_service` DISABLE KEYS */;
SELECT * FROM `archdeco`.`ad_service` LIMIT 19201;
INSERT INTO `archdeco_test`.`ad_service` (`id`, `name_en`, `name_ru`, `desc_en`, `desc_ru`, `created`, `expired`, `status`) VALUES
	(1, 'Estimation of design possibilities', 'Оценка перспектив проектирования', NULL, NULL, NULL, NULL, 1),
	(2, 'Architectural design', 'Архитектурное проектирование', 'Individual houses,\r\nApartment and office buildings,\r\nShopping malls,\r\nIndustrial and storage facilities..', 'индивидуальных жилых домов,\r\nмногоквартирных и офисных зданий,\r\nторгово-развлекательных комплексов,\r\nпромышленных и складских сооружений:\r\n Эскизный проект\r\n Проектная и рабочая документация', NULL, NULL, 1),
	(3, 'Interior design', 'Дизайн интерьера', 'Individual and Public Spaces', 'индивидуальных и общественных помещений', NULL, NULL, 1);
/*!40000 ALTER TABLE `archdeco_test`.`ad_service` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'ad_style' AS `Table`, 38 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`ad_style`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`ad_style` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) DEFAULT NULL,
  `name_ru` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='Architectual and design styles\r\nhttp://www.vizir.ru/design.htm';
DELETE FROM `archdeco_test`.`ad_style`;
/*!40000 ALTER TABLE `archdeco_test`.`ad_style` DISABLE KEYS */;
SELECT * FROM `archdeco`.`ad_style` LIMIT 243289;
INSERT INTO `archdeco_test`.`ad_style` (`id`, `name_en`, `name_ru`, `type`, `frequency`) VALUES
	(1, 'egipt', 'египедский', NULL, NULL),
	(2, 'front asia', 'передней азии ', NULL, NULL),
	(3, NULL, 'персицкий', NULL, NULL),
	(4, NULL, 'индийский', NULL, NULL),
	(5, NULL, 'китайский', NULL, NULL),
	(6, NULL, 'японский', NULL, NULL),
	(7, NULL, 'греческий', NULL, NULL),
	(8, NULL, 'римский', NULL, NULL),
	(9, NULL, 'романский', NULL, NULL),
	(10, NULL, 'готика', NULL, NULL),
	(11, NULL, 'ренессанс', NULL, NULL),
	(12, NULL, 'маньеризм', NULL, NULL),
	(13, NULL, 'барокко', NULL, NULL),
	(14, NULL, 'рококо', NULL, NULL),
	(15, NULL, 'классицизм', NULL, NULL),
	(16, NULL, 'ампир', NULL, NULL),
	(17, NULL, 'эклектика', NULL, NULL),
	(18, NULL, 'модерн', NULL, NULL),
	(19, NULL, 'неоклассицизм', NULL, NULL),
	(20, NULL, 'неорусский', NULL, NULL),
	(21, NULL, 'функционализм', NULL, NULL),
	(22, NULL, 'неопластицизм', NULL, NULL),
	(23, NULL, 'рационализм', NULL, NULL),
	(24, NULL, 'поп-арт', NULL, NULL),
	(25, NULL, 'хай-тек', NULL, NULL),
	(26, NULL, 'деконструктивизм', NULL, NULL),
	(27, NULL, 'китч', NULL, NULL),
	(28, NULL, 'стиллизация', NULL, NULL),
	(29, NULL, 'ар-деко', NULL, NULL),
	(30, NULL, 'минимализм', NULL, NULL),
	(31, NULL, 'романтизм', NULL, NULL),
	(32, NULL, 'этнический', NULL, NULL),
	(33, NULL, 'кантри', NULL, NULL),
	(34, NULL, 'английский', NULL, NULL),
	(35, 'provence ', 'прованс', NULL, NULL),
	(36, NULL, 'японский модерн', NULL, NULL),
	(37, NULL, 'восточный модерн', NULL, NULL),
	(38, 'loft', 'лофт', NULL, NULL);
/*!40000 ALTER TABLE `archdeco_test`.`ad_style` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'ad_supplies' AS `Table`, 0 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`ad_supplies`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`ad_supplies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `added_at` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DELETE FROM `archdeco_test`.`ad_supplies`;
/*!40000 ALTER TABLE `archdeco_test`.`ad_supplies` DISABLE KEYS */;
SELECT * FROM `archdeco`.`ad_supplies` LIMIT 104857600;
/*!40000 ALTER TABLE `archdeco_test`.`ad_supplies` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'ad_tag' AS `Table`, 0 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`ad_tag`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`ad_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_ru` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `cat` varchar(255) NOT NULL,
  `raw_data` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DELETE FROM `archdeco_test`.`ad_tag`;
/*!40000 ALTER TABLE `archdeco_test`.`ad_tag` DISABLE KEYS */;
SELECT * FROM `archdeco`.`ad_tag` LIMIT 104857600;
/*!40000 ALTER TABLE `archdeco_test`.`ad_tag` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'ad_tag_assign' AS `Table`, 0 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`ad_tag_assign`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`ad_tag_assign` (
  `item` int(11) DEFAULT NULL,
  `cat` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DELETE FROM `archdeco_test`.`ad_tag_assign`;
/*!40000 ALTER TABLE `archdeco_test`.`ad_tag_assign` DISABLE KEYS */;
SELECT * FROM `archdeco`.`ad_tag_assign` LIMIT 104857600;
/*!40000 ALTER TABLE `archdeco_test`.`ad_tag_assign` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'ad_task' AS `Table`, 3 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`ad_task`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`ad_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL COMMENT 'link to project',
  `parent_id` int(11) DEFAULT NULL,
  `taskName` varchar(250) DEFAULT NULL,
  `priority` int(1) DEFAULT NULL,
  `doer_id` int(11) DEFAULT NULL COMMENT 'link to doer',
  `created_by` int(11) DEFAULT NULL COMMENT 'link to autor',
  `created_at` int(11) DEFAULT NULL COMMENT 'UTC',
  `deadline` int(1) DEFAULT NULL COMMENT 'in minutes',
  `until` int(11) DEFAULT NULL COMMENT 'UTC',
  `updated_at` int(11) DEFAULT NULL COMMENT 'UTC',
  `status` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  `description` text,
  `log` text COMMENT 'editing log',
  PRIMARY KEY (`id`),
  KEY `FK_ad_task_ad_task` (`parent_id`),
  KEY `FK_ad_task_ad_project` (`project_id`),
  KEY `FK_ad_task_ad_user` (`created_by`),
  KEY `FK_ad_task_ad_user_2` (`doer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
DELETE FROM `archdeco_test`.`ad_task`;
/*!40000 ALTER TABLE `archdeco_test`.`ad_task` DISABLE KEYS */;
SELECT * FROM `archdeco`.`ad_task` LIMIT 19201;
INSERT INTO `archdeco_test`.`ad_task` (`id`, `project_id`, `parent_id`, `taskName`, `priority`, `doer_id`, `created_by`, `created_at`, `deadline`, `until`, `updated_at`, `status`, `active`, `frequency`, `description`, `log`) VALUES
	(10, NULL, NULL, 'Эскизный проект', 5, NULL, NULL, NULL, 10080, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(11, NULL, NULL, 'Проектная документация', 5, NULL, NULL, NULL, 10080, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(12, NULL, NULL, 'Рабочая документация', 5, NULL, NULL, NULL, 10080, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `archdeco_test`.`ad_task` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'ad_update' AS `Table`, 81 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`ad_update`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`ad_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_id` int(11) NOT NULL DEFAULT '0',
  `model_data` longtext COLLATE utf8_unicode_ci,
  `model_data_old` longtext COLLATE utf8_unicode_ci,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `updater-user_id` (`updated_by`),
  CONSTRAINT `updater-user_id` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
DELETE FROM `archdeco_test`.`ad_update`;
/*!40000 ALTER TABLE `archdeco_test`.`ad_update` DISABLE KEYS */;
SELECT * FROM `archdeco`.`ad_update` LIMIT 129614;
INSERT INTO `archdeco_test`.`ad_update` (`id`, `type`, `model`, `model_id`, `model_data`, `model_data_old`, `updated_by`, `updated_at`) VALUES
	(1, 1, 'corp\\models\\Project', 693, 'a:14:{s:3:"own";s:2:"А";s:4:"year";s:2:"15";s:8:"isdelete";i:0;s:6:"number";s:1:"2";s:10:"number_add";s:0:"";s:11:"projectName";s:23:"Новый проект";s:15:"fullProjectName";s:0:"";s:6:"adress";s:0:"";s:4:"date";s:0:"";s:5:"until";s:0:"";s:11:"description";s:0:"";s:10:"created_at";i:1444830641;s:10:"updated_at";i:1444830641;s:2:"id";i:693;}', 'N;', NULL, 1444830641),
	(2, 1, 'corp\\models\\Project', 694, 'a:14:{s:3:"own";s:2:"А";s:4:"year";s:2:"15";s:8:"isdelete";i:0;s:6:"number";s:1:"2";s:10:"number_add";s:0:"";s:11:"projectName";s:23:"Новый проект";s:15:"fullProjectName";s:0:"";s:6:"adress";s:0:"";s:4:"date";s:0:"";s:5:"until";s:0:"";s:11:"description";s:0:"";s:10:"created_at";i:1444830701;s:10:"updated_at";i:1444830701;s:2:"id";i:694;}', 'N;', NULL, 1444830701),
	(3, 1, 'corp\\models\\Project', 695, 'a:14:{s:3:"own";s:2:"А";s:4:"year";s:2:"15";s:8:"isdelete";i:0;s:6:"number";s:1:"2";s:10:"number_add";s:0:"";s:11:"projectName";s:23:"Новый проект";s:15:"fullProjectName";s:0:"";s:6:"adress";s:0:"";s:4:"date";s:0:"";s:5:"until";s:0:"";s:11:"description";s:0:"";s:10:"created_at";i:1444830746;s:10:"updated_at";i:1444830746;s:2:"id";i:695;}', 'N;', 1, 1444830746),
	(4, 1, 'corp\\models\\Project', 696, 'a:14:{s:3:"own";s:2:"А";s:4:"year";s:2:"15";s:8:"isdelete";i:0;s:6:"number";s:1:"2";s:10:"number_add";s:0:"";s:11:"projectName";s:23:"Новый проект";s:15:"fullProjectName";s:0:"";s:6:"adress";s:0:"";s:4:"date";s:0:"";s:5:"until";s:0:"";s:11:"description";s:0:"";s:10:"created_at";i:1444830754;s:10:"updated_at";i:1444830754;s:2:"id";i:696;}', 'N;', 1, 1444830754),
	(5, 2, 'corp\\models\\Project', 696, 'a:7:{s:6:"number";s:1:"2";s:10:"number_add";s:0:"";s:11:"projectName";s:25:"Новый проект 2";s:15:"fullProjectName";s:49:"Новый проект Новый проект 2";s:4:"date";s:0:"";s:5:"until";s:0:"";s:10:"up/* большой запрос SQL (25,0 KiB), ограничен 2 000 символами */
/*!40000 ALTER TABLE `archdeco_test`.`ad_update` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'article' AS `Table`, 1 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`article`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `summary` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
DELETE FROM `archdeco_test`.`article`;
/*!40000 ALTER TABLE `archdeco_test`.`article` DISABLE KEYS */;
SELECT * FROM `archdeco`.`article` LIMIT 6400;
INSERT INTO `archdeco_test`.`article` (`id`, `user_id`, `title`, `summary`, `content`, `status`, `category`, `created_at`, `updated_at`) VALUES
	(1, 1, '1', '1', '<p>Приветсятвую тебя, человек</p>\r\n\r\n<div class="navbar-header" style="box-sizing: border-box; float: left; margin-right: 0px; margin-left: 0px; color: rgb(200, 200, 200); font-family: \'Open Sans\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 20px; background-color: rgb(44, 44, 44);"><a class="navbar-brand" href="http://yii2-advanced-template/" style="box-sizing: border-box; color: rgb(200, 200, 200); text-decoration: none; float: left; padding: 15px; font-size: 18px; height: 50px; margin-left: -15px; background-color: transparent;">My Company</a>\r\n\r\n<div>&nbsp;</div>\r\n</div>\r\n\r\n<div class="collapse navbar-collapse" id="w1-collapse" style="box-sizing: border-box; padding-right: 0px; padding-left: 0px; border-top-width: 0px; border-color: rgb(43, 46, 50); -webkit-box-shadow: none; box-shadow: none; width: auto; padding-bottom: 0px; max-height: 340px; margin-right: 0px; margin-left: 0px; color: rgb(200, 200, 200); font-family: \'Open Sans\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 20px; visibility: visible !important; overflow: visible !important; height: auto !important; background-color: rgb(44, 44, 44);">\r\n<ul>\r\n	<li>&nbsp;</li>\r\n</ul>\r\n</div>\r\n\r\n<p>&nbsp;</p>\r\n', 1, 1, 1436970795, 1436970795);
/*!40000 ALTER TABLE `archdeco_test`.`article` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'auth_assignment' AS `Table`, 8 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`auth_assignment`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
DELETE FROM `archdeco_test`.`auth_assignment`;
/*!40000 ALTER TABLE `archdeco_test`.`auth_assignment` DISABLE KEYS */;
SELECT * FROM `archdeco`.`auth_assignment` LIMIT 51200;
INSERT INTO `archdeco_test`.`auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
	('account', 4, NULL),
	('custmer', 8, NULL),
	('manager', 6, NULL),
	('member', 7, NULL),
	('admin', 2, NULL),
	('theCreator', 1, 1440407329),
	('visitor', 9, NULL),
	('worker', 5, NULL);
/*!40000 ALTER TABLE `archdeco_test`.`auth_assignment` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'auth_item' AS `Table`, 20 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`auth_item`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
DELETE FROM `archdeco_test`.`auth_item`;
/*!40000 ALTER TABLE `archdeco_test`.`auth_item` DISABLE KEYS */;
SELECT * FROM `archdeco`.`auth_item` LIMIT 128031;
INSERT INTO `archdeco_test`.`auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
	('account', 1, 'accountants', NULL, NULL, 1440246700, 1440772244),
	('createArticle', 2, 'Allows editor+ roles to create articles', NULL, NULL, 1440246700, 1440246700),
	('createProject', 2, '', NULL, NULL, 1449063156, 1449063156),
	('custmer', 1, 'Заказчики проектов', NULL, NULL, 1440246700, 1441013090),
	('deleteArticle', 2, 'Allows admin+ roles to delete articles', NULL, NULL, 1440246700, 1440246700),
	('lawyer', 1, 'lawyers', NULL, NULL, 1440246700, 1440668200),
	('leader', 1, 'team leaders', NULL, NULL, 1440246700, 1440246700),
	('manager', 1, 'projects managers', NULL, NULL, 1440246700, 1449063213),
	('manageUsers', 2, 'Allows admin+ roles to manage users', NULL, NULL, 1440246700, 1440246700),
	('member', 1, 'Registered users, members of this site', NULL, NULL, 1440246700, 1440246700),
	('premium', 1, 'projects premium members', NULL, NULL, 1440246700, 1440604217),
	('admin', 1, 'technical assistant', NULL, NULL, 1440246700, 1440434153),
	('adminArticle', 2, 'Allows admin+ roles to manage articles', NULL, NULL, 1440246700, 1440246700),
	('theCreator', 1, 'You!', NULL, NULL, 1440246700, 1449063521),
	('topman', 1, 'top-managers', NULL, NULL, 1440246700, 1441009476),
	('updateArticle', 2, 'Allows editor+ roles to update articles', NULL, NULL, 1440246700, 1440246700),
	('updateOwnArticle', 2, 'Update own article', 'isAuthor', NULL, 1440246700, 1440246700),
	('usePremium', 2, 'Allows premium+ roles to use premium content', NULL, NULL, 1440246700, 1440246700),
	('visitor', 1, 'Visitor of our site', NULL, NULL, 1449058641, 1449058641),
	('worker', 1, 'workers', NULL, NULL, 1440246700, 1440772425);
/*!40000 ALTER TABLE `archdeco_test`.`auth_item` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'auth_item_child' AS `Table`, 14 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`auth_item_child`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
DELETE FROM `archdeco_test`.`auth_item_child`;
/*!40000 ALTER TABLE `archdeco_test`.`auth_item_child` DISABLE KEYS */;
SELECT * FROM `archdeco`.`auth_item_child` LIMIT 89622;
INSERT INTO `archdeco_test`.`auth_item_child` (`parent`, `child`) VALUES
	('topman', 'account'),
	('manager', 'createProject'),
	('premium', 'custmer'),
	('topman', 'lawyer'),
	('manager', 'leader'),
	('account', 'manager'),
	('topman', 'manager'),
	('custmer', 'member'),
	('theCreator', 'admin'),
	('admin', 'topman'),
	('updateOwnArticle', 'updateArticle'),
	('premium', 'usePremium'),
	('lawyer', 'worker'),
	('leader', 'worker');
/*!40000 ALTER TABLE `archdeco_test`.`auth_item_child` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'auth_rule' AS `Table`, 1 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`auth_rule`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
DELETE FROM `archdeco_test`.`auth_rule`;
/*!40000 ALTER TABLE `archdeco_test`.`auth_rule` DISABLE KEYS */;
SELECT * FROM `archdeco`.`auth_rule` LIMIT 6400;
INSERT INTO `archdeco_test`.`auth_rule` (`name`, `data`, `created_at`, `updated_at`) VALUES
	('isAuthor', 'O:28:"common\\rbac\\rules\\AuthorRule":3:{s:4:"name";s:8:"isAuthor";s:9:"createdAt";i:1440246700;s:9:"updatedAt";i:1440246700;}', 1440246700, 1440246700);
/*!40000 ALTER TABLE `archdeco_test`.`auth_rule` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'config' AS `Table`, 0 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`config`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DELETE FROM `archdeco_test`.`config`;
/*!40000 ALTER TABLE `archdeco_test`.`config` DISABLE KEYS */;
SELECT * FROM `archdeco`.`config` LIMIT 104857600;
/*!40000 ALTER TABLE `archdeco_test`.`config` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'log' AS `Table`, 0 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`log`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_time` double DEFAULT NULL,
  `prefix` text COLLATE utf8_unicode_ci,
  `message` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_log_level` (`level`),
  KEY `idx_log_category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
DELETE FROM `archdeco_test`.`log`;
/*!40000 ALTER TABLE `archdeco_test`.`log` DISABLE KEYS */;
SELECT * FROM `archdeco`.`log` LIMIT 104857600;
/*!40000 ALTER TABLE `archdeco_test`.`log` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'migration' AS `Table`, 7 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`migration`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DELETE FROM `archdeco_test`.`migration`;
/*!40000 ALTER TABLE `archdeco_test`.`migration` DISABLE KEYS */;
SELECT * FROM `archdeco`.`migration` LIMIT 44811;
INSERT INTO `archdeco_test`.`migration` (`version`, `apply_time`) VALUES
	('m000000_000000_base', 1436960779),
	('m140506_102106_rbac_init', 1440087656),
	('m141022_115823_create_user_table', 1436960785),
	('m141022_115912_create_rbac_tables', 1436960785),
	('m141022_115922_create_session_table', 1436960785),
	('m141106_185632_log_init', 1441549422),
	('m150104_153617_create_article_table', 1436960785);
/*!40000 ALTER TABLE `archdeco_test`.`migration` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'session' AS `Table`, 3 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`session`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`session` (
  `id` char(64) COLLATE utf8_unicode_ci NOT NULL,
  `expire` int(11) NOT NULL,
  `data` longblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
DELETE FROM `archdeco_test`.`session`;
/*!40000 ALTER TABLE `archdeco_test`.`session` DISABLE KEYS */;
SELECT * FROM `archdeco`.`session` LIMIT 19201;
INSERT INTO `archdeco_test`.`session` (`id`, `expire`, `data`) VALUES
	('a1eeds698mnbomgqphgs1o53o0', 1454918615, _binary 0x5F5F666C6173687C613A303A7B7D5F5F69647C693A313B),
	('hvmqeck8qct1sr40hghm7sj331', 1455051321, _binary 0x5F5F666C6173687C613A303A7B7D5F5F69647C693A313B),
	('ih3bs4eoi9d0m2grkj2farrli4', 1454949466, _binary 0x5F5F666C6173687C613A303A7B7D5F5F69647C693A313B);
/*!40000 ALTER TABLE `archdeco_test`.`session` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'user' AS `Table`, 8 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`user`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_activation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_primary` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
DELETE FROM `archdeco_test`.`user`;
/*!40000 ALTER TABLE `archdeco_test`.`user` DISABLE KEYS */;
SELECT * FROM `archdeco`.`user` LIMIT 51200;
INSERT INTO `archdeco_test`.`user` (`id`, `username`, `email`, `password_hash`, `status`, `auth_key`, `password_reset_token`, `account_activation_token`, `group`, `role_primary`, `created_at`, `updated_at`) VALUES
	(1, 'Бегалов Р.Д.', 'creator@example.com', '$2y$13$zUi7.KrRybmU8tAGPGiIiea2QOoDBpHpWHMKzzJg3H/J6QHCUipwi', 10, '8QcTRbD5UxYkaJ9calSahAvXd_GMPIcS', '', '', NULL, NULL, 1413919102, 1413919102),
	(2, 'admin', 'admin@admin.admin', '$2y$13$ssg/MpgvPKd0YNPH.yUALeYslCMQknFi4vWon5HTtVSd23fd1CrrS', 10, 'XTXELOT8VKEojl4hpov-gT7Fj2Rs2MX-', 'geGUnapFHpJWdztNKS4nj4Eb404Q1il1_1412606164', '', NULL, NULL, 1413919102, 1447502630),
	(4, 'tester', 'tester@example.com', '$2y$13$2LMw9VkXE9ISxke8QFyPh.3OUadr0CzLS83GUQAqS13SAu2W5Qgpe', 10, 'AxCA1v9zj3183w1bttOIcsGGrvrwkm-u', 'OZdsAZ6RgiYbe08y8DOAwfUo6bnJvfed_1412601762', NULL, NULL, 'account', 1413919102, 1449062848),
	(5, 'worker', 'worker@worker.work', '$2y$13$dzqXnS0QcU5CAp0ueoFjLO42Xs7gsR952XkpurkrQn0CIkl8lo86.', 10, 'U_XewxQxeM1JjHYuz36_a7-KQ2ih3PLy', NULL, NULL, NULL, NULL, 1443879318, 1448456081),
	(6, 'manager', 'manager@manager.manager', '$2y$13$JHhjzsFJ4mkVLIMIH2zFLuFfX6E7lnow6LSloNIOHvVAyu1MV6YSi', 10, 'NXwbCPUZqJ2wUprFpubMA2Gb_wXTL5y2', NULL, NULL, NULL, NULL, 1447502418, 1447502418),
	(7, 'member', 'member@member.member', '$2y$13$Dlq.2vPMWn6BHF5yZ0cZo.BnIbjxFrWDW.lvC86pSLsmdzqGiWn9O', 10, 'ws2qZTEwptlcYCiU4JC9cDKN7aD3Dt8T', NULL, NULL, NULL, 'member', 1448459166, 1450361338),
	(8, 'account', 'account@account.account', '$2y$13$z/gmmPNLbYvDHnICCgTf/uOThE5jSMM6hPySHDqYXudFIoJtSeQAO', 10, 'mGo1BvdYF-H4CEm2ARjCjf7JckR2e-cT', NULL, NULL, NULL, NULL, 1448459249, 1449059199),
	(9, 'Inactive', 'Inactive@Inactive.Inactive', '$2y$13$F.MfU1FLiJxjBgBo/f0zuemINmOogpn6eA5Mq5YUcBwC2IOm17GDa', 10, 'ViqgzLotQIQlXwrGMqmg2EewxbkQon_S', NULL, NULL, NULL, 'visitor', 1450360380, 1450366338);
/*!40000 ALTER TABLE `archdeco_test`.`user` ENABLE KEYS */;
SELECT 'archdeco' AS `Database`, 'user_message' AS `Table`, 1 AS `Rows`, 0 AS `Duration`;
SHOW CREATE TABLE `archdeco`.`user_message`;
CREATE TABLE IF NOT EXISTS `archdeco_test`.`user_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) DEFAULT NULL COMMENT 'Отправитель',
  `recipient_id` int(11) DEFAULT NULL COMMENT 'Получатель',
  `create` int(11) DEFAULT NULL COMMENT 'Создано',
  `readed` int(1) DEFAULT NULL COMMENT 'Прочитано',
  `subject` varchar(50) DEFAULT NULL COMMENT 'Тема',
  `message` text COMMENT 'Сообщение',
  `log` text COMMENT 'Лог',
  PRIMARY KEY (`id`),
  KEY `sender` (`sender_id`),
  KEY `recipient` (`recipient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
DELETE FROM `archdeco_test`.`user_message`;
/*!40000 ALTER TABLE `archdeco_test`.`user_message` DISABLE KEYS */;
SELECT * FROM `archdeco`.`user_message` LIMIT 6400;
INSERT INTO `archdeco_test`.`user_message` (`id`, `sender_id`, `recipient_id`, `create`, `readed`, `subject`, `message`, `log`) VALUES
	(2, 1, 1, 1406663946, 0, 'Проблема', 'Парадокс: \r\nПроекты - Индекс:\r\nПри сортировке по вработе вархиве присутствует состояние отсутствия.', '\n192.168.1.99');
/*!40000 ALTER TABLE `archdeco_test`.`user_message` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_LOCAL_SQL_MODE, '') */;