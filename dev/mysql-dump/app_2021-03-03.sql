# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.29)
# Database: app
# Generation Time: 2021-03-03 14:56:20 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table navigation_navigations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `navigation_navigations`;

CREATE TABLE `navigation_navigations` (
  `navigation_id` int(11) unsigned NOT NULL,
  `child_id` int(11) unsigned NOT NULL,
  KEY `navigation_id` (`navigation_id`),
  KEY `child_id` (`child_id`),
  CONSTRAINT `navigation_navigations_ibfk_1` FOREIGN KEY (`navigation_id`) REFERENCES `navigations` (`id`),
  CONSTRAINT `navigation_navigations_ibfk_2` FOREIGN KEY (`child_id`) REFERENCES `navigations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `navigation_navigations` WRITE;
/*!40000 ALTER TABLE `navigation_navigations` DISABLE KEYS */;

INSERT INTO `navigation_navigations` (`navigation_id`, `child_id`)
VALUES
	(46,40),
	(46,41),
	(46,42),
	(46,43);

/*!40000 ALTER TABLE `navigation_navigations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table navigations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `navigations`;

CREATE TABLE `navigations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `route_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `note` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `url` (`route_id`),
  CONSTRAINT `navigations_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `navigations` WRITE;
/*!40000 ALTER TABLE `navigations` DISABLE KEYS */;

INSERT INTO `navigations` (`id`, `route_id`, `title`, `icon`, `position`, `note`)
VALUES
	(40,47,'Roles','mdi-ab-testing',0,NULL),
	(41,50,'Routes',NULL,1,NULL),
	(42,52,'Navigation',NULL,2,NULL),
	(43,54,'Accounts',NULL,3,NULL),
	(46,NULL,'Settings','mdi-cog-outline',3,NULL),
	(51,55,'Test',NULL,1,NULL);

/*!40000 ALTER TABLE `navigations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table refresh_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `refresh_tokens`;

CREATE TABLE `refresh_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(250) NOT NULL DEFAULT '',
  `user_id` int(11) unsigned NOT NULL,
  `expire` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `refresh_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table role_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_roles`;

CREATE TABLE `role_roles` (
  `role_id` int(11) unsigned NOT NULL,
  `child_id` int(11) unsigned NOT NULL,
  KEY `role_id` (`role_id`),
  KEY `child_id` (`child_id`),
  CONSTRAINT `role_roles_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `role_roles_ibfk_2` FOREIGN KEY (`child_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table role_routes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_routes`;

CREATE TABLE `role_routes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) unsigned NOT NULL,
  `route_id` int(10) unsigned NOT NULL,
  `route_type` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `role_routes` WRITE;
/*!40000 ALTER TABLE `role_routes` DISABLE KEYS */;

INSERT INTO `role_routes` (`id`, `role_id`, `route_id`, `route_type`)
VALUES
	(2,1,46,'Backend'),
	(3,1,47,'Frontend'),
	(4,1,48,'Backend'),
	(20,1,49,'Backend'),
	(21,1,50,'Frontend'),
	(22,1,51,'Backend'),
	(23,1,52,'Frontend'),
	(24,1,54,'Frontend'),
	(25,1,53,'Backend'),
	(26,1,40,'Backend'),
	(28,1,64,'Backend'),
	(29,1,65,'Backend'),
	(30,1,66,'Backend'),
	(31,1,67,'Frontend'),
	(32,1,68,'Frontend'),
	(33,1,69,'Frontend'),
	(34,1,70,'Backend'),
	(35,1,71,'Backend'),
	(36,1,72,'Backend'),
	(37,1,74,'Backend'),
	(38,1,75,'Frontend'),
	(39,1,55,'Frontend'),
	(40,1,82,'Backend');

/*!40000 ALTER TABLE `role_routes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL DEFAULT '',
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `name`, `description`)
VALUES
	(1,'Admin',NULL);

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table routes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `routes`;

CREATE TABLE `routes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL DEFAULT '',
  `pattern` varchar(250) NOT NULL DEFAULT '',
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `frontend` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `method` set('DELETE','GET','HEAD','OPTIONS','PATCH','POST','PUT') NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;

INSERT INTO `routes` (`id`, `name`, `pattern`, `public`, `frontend`, `created_at`, `updated_at`, `deleted_at`, `method`)
VALUES
	(37,'','/favicon.ico',1,0,'2021-02-11 16:15:08','2021-02-21 17:44:32',NULL,'GET'),
	(41,'auth.Controller::Login','/login',1,0,'2021-02-12 13:39:41','2021-02-16 14:23:50',NULL,'OPTIONS,POST'),
	(43,'auth.Controller::Logout','/logout',0,0,'2021-02-19 18:18:20',NULL,NULL,'GET,OPTIONS'),
	(46,'auth.Controller::Navigation','/navigation',0,0,'2021-02-21 15:48:18','2021-02-21 15:52:17',NULL,'GET,OPTIONS'),
	(47,'Roles','/dash/roles',0,1,NULL,'2021-02-21 15:52:17',NULL,''),
	(48,'auth.Controller::Roles','/settings/roles/*grid',0,0,'2021-02-21 15:48:18','2021-02-21 15:52:17',NULL,'DELETE,GET,HEAD,OPTIONS,PATCH,POST,PUT'),
	(49,'auth.Controller::Routes','/settings/routes/*grid',0,0,'2021-02-21 17:38:09',NULL,NULL,'DELETE,GET,HEAD,OPTIONS,PATCH,POST,PUT'),
	(50,'Routes','/dash/routes',0,1,NULL,NULL,NULL,''),
	(51,'auth.Controller::Nav','/settings/navigations/*grid',0,0,'2021-02-21 17:49:58',NULL,NULL,'DELETE,GET,HEAD,OPTIONS,PATCH,POST,PUT'),
	(52,'Navigation','/dash/navigation',0,1,'2021-02-21 17:50:54',NULL,NULL,''),
	(53,'auth.Controller::Accounts','/settings/accounts/*grid',0,0,'2021-02-21 18:45:12',NULL,NULL,'DELETE,GET,HEAD,OPTIONS,PATCH,POST,PUT'),
	(54,'Accounts','/dash/accounts',0,1,'2021-02-21 18:46:26',NULL,NULL,''),
	(55,'Test','/dash/test',0,1,'2021-02-22 08:58:21',NULL,NULL,''),
	(81,'controller.TestController::Test','/test/*grid',1,0,'2021-02-25 09:39:39',NULL,NULL,'DELETE,GET,HEAD,OPTIONS,PATCH,POST,PUT'),
	(82,'controller.TestController::Test','/test2',0,0,'2021-02-25 09:39:39',NULL,NULL,'DELETE,GET,HEAD,OPTIONS,PATCH,POST,PUT');

/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tests
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tests`;

CREATE TABLE `tests` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table user_options
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_options`;

CREATE TABLE `user_options` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `key` varchar(250) NOT NULL DEFAULT '',
  `value` varchar(250) NOT NULL DEFAULT '',
  `hide` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `user_options` WRITE;
/*!40000 ALTER TABLE `user_options` DISABLE KEYS */;

INSERT INTO `user_options` (`id`, `user_id`, `key`, `value`, `hide`)
VALUES
	(2,1,'phone','111-222-333',0),
	(3,1,'password','$2y$12$H3ff2uvKlcbBhfFtFy.qZesaf7weSXZpYRexZHLxZ4jjsw.NlqHSu ',1);

/*!40000 ALTER TABLE `user_options` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_protocols
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_protocols`;

CREATE TABLE `user_protocols` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `key` varchar(250) NOT NULL DEFAULT '',
  `value` varchar(250) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `user_protocols` WRITE;
/*!40000 ALTER TABLE `user_protocols` DISABLE KEYS */;

INSERT INTO `user_protocols` (`id`, `user_id`, `key`, `value`, `created_at`)
VALUES
	(1,1,'RefreshTokenInvalid',NULL,'2021-03-03 14:52:36'),
	(2,1,'RefreshTokenInvalid',NULL,'2021-03-03 14:52:41'),
	(3,1,'RefreshTokenInvalid',NULL,'2021-03-03 14:53:34'),
	(4,1,'Login',NULL,'2021-03-03 14:53:39'),
	(5,1,'RefreshToken',NULL,'2021-03-03 14:55:27');

/*!40000 ALTER TABLE `user_protocols` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_roles`;

CREATE TABLE `user_roles` (
  `user_id` int(11) unsigned NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;

INSERT INTO `user_roles` (`user_id`, `role_id`)
VALUES
	(1,1);

/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(250) NOT NULL DEFAULT '',
  `salutation` enum('MALE','FEMALE') NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `surname` varchar(250) DEFAULT NULL,
  `state` varchar(250) NOT NULL DEFAULT '',
  `last_login` datetime DEFAULT NULL,
  `failed_logins` tinyint(11) DEFAULT NULL,
  `last_failed_login` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `login`, `salutation`, `name`, `surname`, `state`, `last_login`, `failed_logins`, `last_failed_login`)
VALUES
	(1,'admin','MALE','John','Doe','ACTIVE','2021-03-03 14:55:27',0,NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
