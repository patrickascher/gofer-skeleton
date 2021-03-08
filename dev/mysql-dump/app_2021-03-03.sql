# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.29)
# Database: app
# Generation Time: 2021-03-08 13:06:02 +0000
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
	(46,43),
	(46,52);

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
	(51,55,'Test',NULL,1,NULL),
	(52,84,'Translation','mdi-translate',5,NULL);

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

LOCK TABLES `refresh_tokens` WRITE;
/*!40000 ALTER TABLE `refresh_tokens` DISABLE KEYS */;

INSERT INTO `refresh_tokens` (`id`, `token`, `user_id`, `expire`)
VALUES
	(5,'1pLKaPheAilHyzKsLIrofmFnru8',1,'2021-04-05 01:38:55'),
	(6,'1pLKaMA44iZsG53Duj6CbhiMOTT',1,'2021-04-05 01:38:55'),
	(7,'1pLKbEGY0BeLQSACY650eS8dio4',1,'2021-04-05 01:39:02'),
	(8,'1pLKehxqo6uDX7PeEJIhhVnX6dn',1,'2021-04-05 01:39:31'),
	(10,'1pLKpVDOftvX3Vbcl1hrkKanqNS',1,'2021-04-05 01:40:57'),
	(13,'1pLL0DXrgAElXxMVKj8puEM3Nkg',1,'2021-04-05 01:42:21'),
	(15,'1pLLVXRxPVkADJwnaiJLoiEKbD3',1,'2021-04-05 01:46:30'),
	(16,'1pLLkqLqBKJvUJ25XszMzfm3vXJ',1,'2021-04-05 01:48:33'),
	(19,'1pLLzPcMa9XVap2GjSNH9BxaqrW',1,'2021-04-05 01:50:29'),
	(20,'1pLM8iQDqrwGxicCMmNA4O02S8X',1,'2021-04-05 01:51:43'),
	(22,'1pLOpZuE1WzHG8vMmyleHiRfGu1',1,'2021-04-05 02:13:51'),
	(25,'1pLOxU4T1PPibjW9wOvlxt5KwL2',1,'2021-04-05 02:14:54'),
	(27,'1pLP9e7SkTHdZQo3wMYK2mIyylY',1,'2021-04-05 02:16:29'),
	(29,'1pLPL8Z5EhW0NutxPZb2ULHTWet',1,'2021-04-05 02:18:01'),
	(31,'1pLPXL6LNoI4sdG28rSviy4dJDA',1,'2021-04-05 02:19:39'),
	(32,'1pLPlj4dQbpDPIilkNCyqcjIjMI',1,'2021-04-05 02:21:33'),
	(34,'1pLQ0OTFfwQUWkClXIYr0C3zgIG',1,'2021-04-05 02:23:29'),
	(39,'1pLUrXqTSHqxLxE7duGro6Ndvsq',1,'2021-04-05 03:03:25'),
	(41,'1pLV4Fe2cw62v1k9Y6PcZrHcCLr',1,'2021-04-05 03:05:07'),
	(43,'1pLWEkXndzAWAaZ86JIA4SjpjJy',1,'2021-04-05 03:14:44'),
	(44,'1pLX1CrTetSXDjeCMpTsQYKICbz',1,'2021-04-05 03:21:10'),
	(46,'1pLXNeZwm102JFdc7TvfNLDkWGe',1,'2021-04-05 03:24:09'),
	(49,'1pLXj2ZP8R0VEVpg3YPGM5fRUdT',1,'2021-04-05 03:26:59'),
	(51,'1pLXtGMWyVNjEm3Vso7fLZZeBsD',1,'2021-04-05 03:28:19'),
	(52,'1pLY6iHZqZDp7nYXd0odTH3ed4I',1,'2021-04-05 03:30:07'),
	(55,'1pLYHTUOZt5Vw2ThhrkxrmSRpc3',1,'2021-04-05 03:31:33'),
	(56,'1pLYPTTVs90eoK7blkw34frfBGz',1,'2021-04-05 03:32:37'),
	(57,'1pLYPT7BxjXQl7DKwgpvwqrnj16',1,'2021-04-05 03:32:37'),
	(58,'1pLtAi8Tcua3LB6LI6P1gf8GMwx',1,'2021-04-05 06:23:19'),
	(62,'1pM1sG2taPC5AtbSmL9Y88Mj7Jd',1,'2021-04-05 07:34:53'),
	(68,'1pM5NN9vJlw1Xo58MacF1Qgfl2A',1,'2021-04-05 08:03:40'),
	(70,'1pM7072c7ZYRweAgSysnqaJX426',1,'2021-04-05 08:17:03'),
	(73,'1pM8eeH0YbiuZYxZByCgj9ZyTg3',1,'2021-04-05 08:30:38'),
	(75,'1pM8pphOBV6w7sT3JimKcRkDgHQ',1,'2021-04-05 08:32:07'),
	(77,'1pM9IYzP2c4CAV0cMVXfL9EQfiE',1,'2021-04-05 08:35:56'),
	(80,'1pM9owJTkEIivjge7G7UdRgtaa0',1,'2021-04-05 08:40:14'),
	(82,'1pMA9oBjogOajy92pU8F0b9xmqK',1,'2021-04-05 08:42:59'),
	(83,'1pMAIZILDs52Hnk0iOGWjuwXcGg',1,'2021-04-05 08:44:09'),
	(87,'1pMB9u1FpQBzYOs6bye2wtc6DlX',1,'2021-04-05 08:51:14'),
	(89,'1pMBwyHQezix4vE7dZOn8C1ERAL',1,'2021-04-05 08:57:43'),
	(92,'1pMCjpz0HH70HT830Obk5J1exqQ',1,'2021-04-05 09:04:12'),
	(94,'1pMD1BYLZXOfqzDwae9aU9CULkO',1,'2021-04-05 09:06:31'),
	(97,'1pMDCMAOE13Xb3tvmEdeY2mRRsj',1,'2021-04-05 09:08:00'),
	(101,'1pMF9rYpoehSKz8Lbhb2tBNN3zw',1,'2021-04-05 09:24:06'),
	(105,'1pMFWzOWaNOPoKbWR7EqWTctfZv',1,'2021-04-05 09:27:11'),
	(108,'1pMGHEM4LW0s0KOVjxZPspG2RvW',1,'2021-04-05 09:33:19'),
	(110,'1pMGPg7Ywi8BfdJ4DUb6JjMTVhi',1,'2021-04-05 09:34:26'),
	(116,'1pMHnWwUiQO5dQSsEpgQmRvBf6K',1,'2021-04-05 09:45:49'),
	(117,'1pMHxs23w6yoAl6Xbowxj9zgSvN',1,'2021-04-05 09:47:11'),
	(120,'1pMI8UWiTARS10mAS9eSvOR7oda',1,'2021-04-05 09:48:36'),
	(122,'1pMIpHrenkSEIc1Lwb73XL17CvX',1,'2021-04-05 09:54:16'),
	(127,'1pMJfbY7eM9f8ihW2JarVxiQobW',1,'2021-04-05 10:01:13'),
	(128,'1pMLSlgsDIbW1MG49y3hhsU6pU7',1,'2021-04-05 10:15:58'),
	(130,'1pMLaYQcziDaIUb4c8XHwz0TLZF',1,'2021-04-05 10:17:00'),
	(133,'1pMLmfq2wjocGtX7u3OGRzTa9cY',1,'2021-04-05 10:18:36'),
	(135,'1pMMFd5LMdQCFgleHLTDFAc4e1U',1,'2021-04-05 10:22:26'),
	(139,'1pMO8Cf1Fk4rBlBbsGdXKySqEcP',1,'2021-04-05 10:37:54'),
	(141,'1pMRD50YiHbMV5WFVi70m5K0gEm',1,'2021-04-05 11:03:12'),
	(147,'1pMS0E4zhsEeyfk0Y76VGYqb4Rw',1,'2021-04-05 11:09:43'),
	(149,'1pMSJWkCPoFeA5wd3gNhpfTCm23',1,'2021-04-05 11:12:18'),
	(151,'1pMSeI3cl5215andUyQ4NyZbrLq',1,'2021-04-05 11:15:03'),
	(154,'1pMTsnyKDwmiHEC1YhvP7YpdnnN',1,'2021-04-05 11:25:12'),
	(156,'1pMU1HbL72Cz3yX1HY5kLnYMTaO',1,'2021-04-05 11:26:19'),
	(158,'1pMUM454ANf1OREeZ5NHPljpKrH',1,'2021-04-05 11:29:04'),
	(159,'1pMUUufp5Ndlkdu89z1ncSbng0W',1,'2021-04-05 11:30:15'),
	(162,'1pMUjUoVBLlb2tQ7Mvk0qwKmfoz',1,'2021-04-05 11:32:10'),
	(164,'1pMUsF5xxKeskO1VDEnZ0eBxM1c',1,'2021-04-05 11:33:21'),
	(165,'1pMV55WSMlsGIBtB5YJNNGMfDi5',1,'2021-04-05 11:35:03'),
	(169,'1pMVLdZsVlaWAFDlkMX4yTuF9cK',1,'2021-04-05 11:37:15'),
	(171,'1pMVbd3A0D1y9yxDmO9striusxp',1,'2021-04-05 11:39:22'),
	(173,'1pMVvAdOxC30OkHgdNWxf90UpdD',1,'2021-04-05 11:41:57'),
	(175,'1pMW3q0sYkLn6aYx8P0ArLT48TA',1,'2021-04-05 11:43:06'),
	(177,'1pMXnCqIJRcLReg5CPnHBrzmwhZ',1,'2021-04-05 11:57:21'),
	(182,'1pMYFIpQGahTf38yj5Nk8GAsCNU',1,'2021-04-05 12:01:04'),
	(184,'1pMYQpf1E0sr2qUdmLPZcIljyQs',1,'2021-04-05 12:02:36'),
	(190,'1pNZRGFUR5WGUVGnoJFBp3SuoGf',1,'2021-04-05 20:40:42'),
	(193,'1pNZmgvIEpvs7DIS7QK9FjgwVcz',1,'2021-04-05 20:43:32'),
	(194,'1pNZutl8yeVpsvY9zqh09TSoGxI',1,'2021-04-05 20:44:37'),
	(197,'1pNaAXevqmsbuV2bCt7eWCkFnh6',1,'2021-04-05 20:46:42'),
	(199,'1pNfaC74HTGw3sy0CvGp8KNeLf5',1,'2021-04-05 21:31:13'),
	(202,'1pNg7VCePiUmxCgqDQQ8HlNxryF',1,'2021-04-05 21:35:37'),
	(205,'1pNgZTiwh6BmA8VKQnrZf67fyOd',1,'2021-04-05 21:39:20'),
	(207,'1pNhWcGO3Sohn4MvFSRxGnGsQJC',1,'2021-04-05 21:47:11'),
	(211,'1pNi7XOWVcKGh5KZP4xpQvSGAQD',1,'2021-04-05 21:52:05'),
	(213,'1pNiZrEg3p7b120j6VTCKczshI3',1,'2021-04-05 21:55:49'),
	(214,'1pNiZpxvq8wPNDEB0G4mL6amY91',1,'2021-04-05 21:55:49'),
	(216,'1pNik6DNr0NeL4SoDeM6wkh4CBP',1,'2021-04-05 21:57:12'),
	(221,'1pNjKmFk6ViCkBw2Vmyo26HIWha',1,'2021-04-05 22:02:04'),
	(223,'1pNjTezGvpPByJerBA2p9weORjc',1,'2021-04-05 22:03:14'),
	(224,'1pNjbm5WJdyebpFVoqTc3JxzyJ2',1,'2021-04-05 22:04:18'),
	(226,'1pNjoj0z4mcVRZa3rGmMtxNlA32',1,'2021-04-05 22:06:01'),
	(230,'1pNkVPIHFWVZBZtPm82XKkqxIdK',1,'2021-04-05 22:11:42'),
	(234,'1pNkpJFBlncAInYu1CNdhsJs2Mo',1,'2021-04-05 22:14:20'),
	(236,'1pNkz8QBT8W5L26sdBGcODKve1s',1,'2021-04-05 22:15:37'),
	(247,'1pNmzxT3OVIDCsVchARMSgh5ciO',1,'2021-04-05 22:32:10'),
	(248,'1pNnDLPkZbr6gVXtlY2gQmtYT63',1,'2021-04-05 22:33:57'),
	(252,'1pNnafgvMaHPMpOYGou2n3AICs1',1,'2021-04-05 22:37:04'),
	(259,'1pNoWxrxVAUcxVThahVUrXrTlrC',1,'2021-04-05 22:44:47'),
	(265,'1pNsLntaDSkwxvtbKJvz8g9BKc3',1,'2021-04-05 23:16:12'),
	(268,'1pNsrgYrkWWnktWgEKkA47ZWwUd',1,'2021-04-05 23:20:25'),
	(269,'1pNt01nBp5eqSQLNkBZk4CF8KNh',1,'2021-04-05 23:21:32'),
	(273,'1pNtQQ48RelBgErfbYzyYncceV7',1,'2021-04-05 23:25:01'),
	(276,'1pNvkpu2RLYOaY9LvMMVIEJ60WD',1,'2021-04-05 23:44:10'),
	(283,'1pNwwYJmd8exlDEE76CpkXRXzj0',1,'2021-04-05 23:53:58'),
	(285,'1pNx51bUgMjKxV77sqACxDHt3ar',1,'2021-04-05 23:55:04'),
	(289,'1pO0j4pOpNBuk1mrbCcYmPgK7AW',1,'2021-04-06 00:25:03'),
	(292,'1pO0txR3HEO050jSM9fOlSoqbdH',1,'2021-04-06 00:26:30'),
	(295,'1pO2kWDj2zdY8tUj1BzhVAdFgZl',1,'2021-04-06 00:41:42'),
	(301,'1pO48XnEhyqYh5onV23O5o6RS2J',1,'2021-04-06 00:53:07'),
	(304,'1pO4oLWoea3MAtqvRCEU44bufwd',1,'2021-04-06 00:58:40'),
	(307,'1pO56sSER7BN35ALpTGIR9rxJxF',1,'2021-04-06 01:01:06'),
	(309,'1pO5EtjlbalHfQzh9SXGomHmXJv',1,'2021-04-06 01:02:11'),
	(310,'1pO5f1GkvKR1Y1H4QIbA4pHFBJO',1,'2021-04-06 01:05:38'),
	(313,'1pO61iMKP29dxX9bHz3Rv6wzUu8',1,'2021-04-06 01:08:39'),
	(321,'1pO7n22G2V1IG2p9lCcZUlUmmZT',1,'2021-04-06 01:23:09'),
	(324,'1pO8IfTaC3xPjc9N61GBAsoYfBF',1,'2021-04-06 01:27:21'),
	(325,'1pO8VHCg14FIYFzdDYxvjE6Lfgs',1,'2021-04-06 01:29:01'),
	(331,'1pO9YTbQnpsN3p4Dl2ptg1ib3dK',1,'2021-04-06 01:37:40'),
	(333,'1pO9l04Coi47GH7cgSQ7W9y1jSR',1,'2021-04-06 01:39:20'),
	(337,'1pOLZgTccFr2zR4WZAmRdhbB583',1,'2021-04-06 03:16:30'),
	(339,'1pOMWK4BAEl9qGqezPbFqnGxS8m',1,'2021-04-06 03:24:17'),
	(340,'1pOMnAOqw5fqc0eVRIgpxBevqF5',1,'2021-04-06 03:26:30'),
	(343,'1pONSc4LCFAyNHX5mpOvKw6dryP',1,'2021-04-06 03:32:01'),
	(345,'1pONeERydzeI63Sa1Ex4aa8zTqZ',1,'2021-04-06 03:33:32'),
	(347,'1pOOOnMb5DeCdW4tXmUZv4JcLL5',1,'2021-04-06 03:39:44'),
	(350,'1pOOYVywsQbMn7ZZ9Z0bEH4fbzk',1,'2021-04-06 03:41:00'),
	(352,'1pOPJcuzFBcl5AI003K92aqzSeE',1,'2021-04-06 03:47:16'),
	(354,'1pOQRlXZPrIt6MyjlaO2yCUnM6d',1,'2021-04-06 03:56:34'),
	(356,'1pORDKozMZeYyJL77PEjce6rklH',1,'2021-04-06 04:02:52'),
	(357,'1pOfcfvqAcQAuGHr0h9K1k72BDk',1,'2021-04-06 06:01:21'),
	(360,'1pOfr35EjypZtQ6Zt9UT5s3Eeqb',1,'2021-04-06 06:03:15'),
	(363,'1pOgeIvcYMnbZ0zYxCFidYWsel9',1,'2021-04-06 06:09:48'),
	(365,'1pOh77cU3MyX4ZknJnh7jxv1GiL',1,'2021-04-06 06:13:36'),
	(367,'1pOhjOEdaQgq7U4wPHjW0ldISBi',1,'2021-04-06 06:18:41'),
	(369,'1pOhtbPMnVH0i4as3ipdmw2oKpw',1,'2021-04-06 06:20:03'),
	(371,'1pOi1iUnRkxFEIUB9IERLD4Bu1y',1,'2021-04-06 06:21:06'),
	(372,'1pOj0yZ6agroLrYMR02VweHWGBd',1,'2021-04-06 06:29:14'),
	(375,'1pOoSYZNw13CkPvOvvf8LfeOVq6',1,'2021-04-06 07:14:01'),
	(379,'1pOuEAMD3b4ceRAnOv0BSUJNs9f',1,'2021-04-06 08:01:27'),
	(381,'1pOvAdnsTaYN8ksCJWzfI4FCo4o',1,'2021-04-06 08:09:11'),
	(385,'1pOxPlwuocx72uRsDVDjXyFKEnV',1,'2021-04-06 08:27:38'),
	(387,'1pOxZ3sLMGtlC6neclykS1xhq8Z',1,'2021-04-06 08:28:53'),
	(391,'1pP8sXMdtltbyJknIPRSHbUQmIl',1,'2021-04-06 10:01:54'),
	(393,'1pPDCZocCpHkj5N6mVTqYypThEp',1,'2021-04-06 10:37:27'),
	(395,'1pPDlSPlMLmezPwM6zGt0QNtPIn',1,'2021-04-06 10:42:06'),
	(397,'1pPEn4BHaMRaVJS3Dx1bBVnIzhL',1,'2021-04-06 10:50:31'),
	(402,'1pPGFubRhnD6NC9iNKPY8KgHmSF',1,'2021-04-06 11:02:35'),
	(404,'1pPGPE7QNKbpY7YxijUbjwgnt5L',1,'2021-04-06 11:03:48'),
	(409,'1pPH6oRgGsRnRc2ppzoZKuz4gCw',1,'2021-04-06 11:09:36'),
	(411,'1pPHEqKkwxMjtSANG97Pr3KpfN1',1,'2021-04-06 11:10:39'),
	(414,'1pPHfesQNCSVkF5uqwfHmwQjPgz',1,'2021-04-06 11:14:12'),
	(415,'1pPHuXBVvbvXsPrCyhiMSoFz9h8',1,'2021-04-06 11:16:11'),
	(419,'1pPIHNebWF6Zmy3RavOXipNp5Ih',1,'2021-04-06 11:19:13'),
	(422,'1pPIYjtPfSMCqJVBbkK8CCGhlNK',1,'2021-04-06 11:21:31'),
	(424,'1pPJ6YgjKFhyuI5DHJGM2Q0JRhA',1,'2021-04-06 11:26:00'),
	(426,'1pPK0ZFnUGhAZMHHOb76fxSG01X',1,'2021-04-06 11:33:25'),
	(428,'1pPKTB79zIHP1n2Zq69P248e0wD',1,'2021-04-06 11:37:14'),
	(430,'1pPKczCPTJ1QBxEEHNzmJjAs0FJ',1,'2021-04-06 11:38:32'),
	(435,'1pPLGvo6zMPCbSX4CUAf2wQBXlS',1,'2021-04-06 11:43:49'),
	(436,'1pPMOQpP14ypHrhPBkotYsPOSkd',1,'2021-04-06 11:53:03'),
	(438,'1pPMWqRzeZUDt1fFDT4uEOhbVUm',1,'2021-04-06 11:54:10'),
	(441,'1pPO2YPxfjYnaUrCsDxIF0sFx6E',1,'2021-04-06 12:06:35'),
	(442,'1pPOAGtQypTdFqLrV8yjXTFZuJP',1,'2021-04-06 12:07:37'),
	(445,'1pPOLVYYCAoYdXlTEVER3kkpcaM',1,'2021-04-06 12:09:05'),
	(448,'1pPOfwu04KEMgDgu1icarbLtRHt',1,'2021-04-06 12:11:48'),
	(450,'1pPPyRKnzVXFqzExo1qphRoiOAL',1,'2021-04-06 12:22:28'),
	(452,'1pPQ8E83x4yS1x7hUCAbsNgZsXs',1,'2021-04-06 12:23:47'),
	(454,'1pPQJAUYG4OqLwBcXrWkzkfmjwn',1,'2021-04-06 12:25:14'),
	(457,'1pPQcu4FjS6UZaYPQDgVWzFlO1K',1,'2021-04-06 12:27:50'),
	(458,'1pPQrMBehcXf5vEs3k2EoNb6tu6',1,'2021-04-06 12:29:45'),
	(460,'1pPR0qrD73fNhGmKN4PYEUJ3MSn',1,'2021-04-06 12:31:02'),
	(462,'1pPRP1dKGb054LgETkH23prRoiH',1,'2021-04-06 12:34:14'),
	(465,'1pPRp7xub46SyV0u0LM8uVWgK0T',1,'2021-04-06 12:37:41'),
	(467,'1pPRxARy8IpjItTkHus6Iu6EvQc',1,'2021-04-06 12:38:46'),
	(468,'1pPTbijX5RDbSfDSY4jkaykAzzE',1,'2021-04-06 12:52:22'),
	(470,'1pPTuZI0Y3WXryu4mU6tCwn8OER',1,'2021-04-06 12:54:51'),
	(473,'1pPUIsY7GdXxaIcVYrHOpldtrG8',1,'2021-04-06 12:58:05'),
	(475,'1pPUjux27BFf6yZI4syuBkDYYFx',1,'2021-04-06 13:01:41'),
	(478,'1pPV5fi7PXF9FKldvOy4gBGtO0o',1,'2021-04-06 13:04:33'),
	(480,'1pPVXLIn92b9WzDfufcwaxUUaTp',1,'2021-04-06 13:08:13'),
	(482,'1pPWBMj4nc0wcKrWwdMXN9BVEad',1,'2021-04-06 13:13:32'),
	(484,'1pPWJKPAhUD43aKTSu9oo1OwXQL',1,'2021-04-06 13:14:36'),
	(486,'1pPWX9iIyl4SOTieoFhs2iMNXdP',1,'2021-04-06 13:16:25'),
	(488,'1pPWfOY4V1ncnUDvO02EDWTT2OO',1,'2021-04-06 13:17:31'),
	(490,'1pPX5LD4ulhUaPjgxeqFziSFAbb',1,'2021-04-06 13:20:58'),
	(492,'1pPXJeiQ99hsXtbx2fIsEFCqs6z',1,'2021-04-06 13:22:51'),
	(494,'1pPXTeh8RIQLxjPLPlUgcl0KbjD',1,'2021-04-06 13:24:10'),
	(499,'1pPYVr0Bbfp6F48PbcANHzQURst',1,'2021-04-06 13:32:42'),
	(505,'1pQUeVtbXd6GBr2O0WrtmTjbpWB',1,'2021-04-06 21:30:45'),
	(507,'1pQUo2o27JpgEKktCw9cprrTFHa',1,'2021-04-06 21:32:02'),
	(509,'1pQUwhctjFtdmyjBqX1xxnnZL63',1,'2021-04-06 21:33:11'),
	(511,'1pQVRi0weuiQ683QWs6J4RU5OlV',1,'2021-04-06 21:37:18'),
	(515,'1pQVnLCoDHO2l60AjuQ5VoDiqKI',1,'2021-04-06 21:40:09'),
	(516,'1pQVvXspbc4Uc1xOB4VUKPz3lfv',1,'2021-04-06 21:41:15'),
	(518,'1pQW9mf3Mvt3oR6rv5JRhW399f0',1,'2021-04-06 21:43:09'),
	(522,'1pQWe5CCWYUiaNU8cwOGsX3dsJ7',1,'2021-04-06 21:47:09'),
	(525,'1pQWv6DYSIlTiZvTGq6pBUX1Mh0',1,'2021-04-06 21:49:24'),
	(526,'1pQX7YPLECdGDNA7AcqUB5x1EvU',1,'2021-04-06 21:51:04'),
	(530,'1pQYQQpxtPvD0Gis1caeoTu9XWx',1,'2021-04-06 22:01:47'),
	(533,'1pQYsADphfzDN5TCetmExwdI7uQ',1,'2021-04-06 22:05:28'),
	(534,'1pQZ1SHR57Z3nLEI8I2X8jeKF1f',1,'2021-04-06 22:06:41'),
	(537,'1pQZc1CZcDyknQAvc4WW6RVVwrp',1,'2021-04-06 22:11:33'),
	(540,'1pQZuxSPSgs65V2NeRlifa1FwvF',1,'2021-04-06 22:14:03'),
	(544,'1pQaQd3ActhbOsnqExpfjj8qTTq',1,'2021-04-06 22:18:15'),
	(547,'1pQanXIagBfHZIhBerGLdsklSbR',1,'2021-04-06 22:21:18'),
	(548,'1pQb0VZVIFAUBQ2odNa5lvRumfA',1,'2021-04-06 22:23:01'),
	(552,'1pQbLT0t9Q3T43S8YOyAgXBJ4nz',1,'2021-04-06 22:25:48'),
	(554,'1pQbfX7WBIiPwapv5VXJpYqOG9X',1,'2021-04-06 22:28:28'),
	(555,'1pQbo0XP3DTE6AQLPAVFQlUT2FD',1,'2021-04-06 22:29:35'),
	(558,'1pQc3g9WtPT0IpomkEaZgs3EKga',1,'2021-04-06 22:31:39'),
	(562,'1pQcLonfndLk2HVeQGUo8FslrGy',1,'2021-04-06 22:34:03'),
	(565,'1pQcoz5oivd9ojULM1ibsUJhBK3',1,'2021-04-06 22:37:57'),
	(566,'1pQd37t3kpYKJTVG82skMY1IvdS',1,'2021-04-06 22:39:49'),
	(572,'1pQeQEVkNbs9qzDVPxfyeaFZdMI',1,'2021-04-06 22:51:06'),
	(575,'1pQhztznzGFqbMM9h7xsmjL6bKV',1,'2021-04-06 23:20:30'),
	(578,'1pQjjkMVTBVNKrxepGWgtcPbAwx',1,'2021-04-06 23:34:48'),
	(580,'1pQjrQKNz2eFJRZNXVX1V7vfMJu',1,'2021-04-06 23:35:49');

/*!40000 ALTER TABLE `refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;


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
	(40,1,82,'Backend'),
	(41,1,81,'Backend'),
	(42,1,83,'Backend'),
	(43,1,84,'Frontend'),
	(44,1,85,'Backend');

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
	(81,'controller.TestController::Test','/test/*grid',0,0,'2021-02-25 09:39:39','2021-03-05 14:16:55',NULL,'DELETE,GET,HEAD,OPTIONS,PATCH,POST,PUT'),
	(84,'Translation','/dash/translation',0,1,'2021-03-05 21:03:56',NULL,NULL,''),
	(85,'locale.Controller::Translation','/settings/translation/*params',0,0,'2021-03-05 21:21:12','2021-03-05 21:34:32',NULL,'DELETE,GET,HEAD,OPTIONS,PATCH,POST,PUT'),
	(88,'','/lang',1,0,'2021-03-06 20:00:35',NULL,NULL,'GET');

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

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;

INSERT INTO `tests` (`id`, `name`)
VALUES
	(1,'asdas');

/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `translations`;

CREATE TABLE `translations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` varchar(250) NOT NULL DEFAULT '',
  `lang` varchar(10) NOT NULL DEFAULT '',
  `description` varchar(250) DEFAULT NULL,
  `zero` varchar(250) DEFAULT NULL,
  `one` varchar(250) DEFAULT NULL,
  `two` varchar(250) DEFAULT NULL,
  `few` varchar(250) DEFAULT NULL,
  `many` varchar(250) DEFAULT NULL,
  `other` varchar(500) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;

INSERT INTO `translations` (`id`, `message_id`, `lang`, `description`, `zero`, `one`, `two`, `few`, `many`, `other`, `created_at`, `updated_at`)
VALUES
	(834,'GRID.NoData','raw','Text if no data is available.',NULL,NULL,NULL,NULL,NULL,'No data','2021-03-05 17:10:14','2021-03-07 11:08:09'),
	(836,'GRID.RowsPerPage','raw','Pagination info',NULL,NULL,NULL,NULL,NULL,'Rows per page','2021-03-05 17:10:14','2021-03-07 11:08:09'),
	(837,'GRID.XofY','raw','Pagination info',NULL,NULL,NULL,NULL,NULL,'of','2021-03-05 17:10:14','2021-03-07 11:08:09'),
	(839,'GRID.ItemDeleted','raw','Alert text after a item got deleted.',NULL,NULL,NULL,NULL,NULL,'Item deleted!','2021-03-05 17:10:14','2021-03-07 11:08:09'),
	(925,'COMMON.Language','raw',NULL,NULL,NULL,NULL,NULL,NULL,'Language','2021-03-06 14:44:29','2021-03-07 11:01:35'),
	(926,'COMMON.Add','raw',NULL,NULL,NULL,NULL,NULL,NULL,'Add','2021-03-06 14:44:29','2021-03-07 11:01:35'),
	(927,'COMMON.Save','raw',NULL,NULL,NULL,NULL,NULL,NULL,'Save','2021-03-06 14:44:29','2021-03-07 11:01:35'),
	(928,'COMMON.Close','raw',NULL,NULL,NULL,NULL,NULL,NULL,'Close','2021-03-06 14:44:29','2021-03-07 11:01:35'),
	(929,'COMMON.Delete','raw',NULL,NULL,NULL,NULL,NULL,NULL,'Delete','2021-03-06 14:44:29','2021-03-07 11:01:35'),
	(930,'COMMON.DeleteItem','raw',NULL,NULL,NULL,NULL,NULL,NULL,'Are you sure to delete this item?','2021-03-06 14:44:29','2021-03-07 11:01:35'),
	(931,'COMMON.NoChanges','raw',NULL,NULL,NULL,NULL,NULL,NULL,'The form has no changes!','2021-03-06 14:44:29','2021-03-07 11:01:35'),
	(951,'ORM.controller.Test.ID','raw','Field ID of model controller.Test',NULL,NULL,NULL,NULL,NULL,'ID','2021-03-06 23:28:40','2021-03-06 23:33:16'),
	(952,'ORM.controller.Test.Name','raw','Field Name of model controller.Test',NULL,NULL,NULL,NULL,NULL,'Name','2021-03-06 23:28:40','2021-03-06 23:33:16'),
	(954,'NAVIGATION.Accounts','raw','Navigation endpoint of Accounts (/dash/accounts)',NULL,NULL,NULL,NULL,NULL,'Accounts','2021-03-07 00:08:17','2021-03-07 00:13:00'),
	(955,'NAVIGATION.Navigation','raw','Navigation endpoint of Navigation (/dash/navigation)',NULL,NULL,NULL,NULL,NULL,'Navigation','2021-03-07 00:08:17','2021-03-07 00:13:00'),
	(956,'NAVIGATION.Roles','raw','Navigation endpoint of Roles (/dash/roles)',NULL,NULL,NULL,NULL,NULL,'Roles','2021-03-07 00:08:17','2021-03-07 00:13:00'),
	(957,'NAVIGATION.Routes','raw','Navigation endpoint of Routes (/dash/routes)',NULL,NULL,NULL,NULL,NULL,'Routes','2021-03-07 00:08:17','2021-03-07 00:13:00'),
	(958,'NAVIGATION.Settings','raw','Navigation endpoint of Settings',NULL,NULL,NULL,NULL,NULL,'Settings','2021-03-07 00:08:17',NULL),
	(959,'NAVIGATION.Test','raw','Navigation endpoint of Test (/dash/test)',NULL,NULL,NULL,NULL,NULL,'Test','2021-03-07 00:08:17','2021-03-07 00:13:00'),
	(960,'NAVIGATION.Translation','raw','Navigation endpoint of Translation (/dash/translation)',NULL,NULL,NULL,NULL,NULL,'Translation','2021-03-07 00:08:17','2021-03-07 00:13:00'),
	(997,'CONTROLLER.auth.Controller.Accounts.Description','raw','Description of controller auth.Controller action Accounts',NULL,NULL,NULL,NULL,NULL,'Description of Accounts','2021-03-07 00:34:40',NULL),
	(998,'CONTROLLER.auth.Controller.Accounts.Title','raw','Title of controller auth.Controller action Accounts',NULL,NULL,NULL,NULL,NULL,'Accounts','2021-03-07 00:34:40',NULL),
	(999,'CONTROLLER.auth.Controller.Login.Description','raw','Description of controller auth.Controller action Login',NULL,NULL,NULL,NULL,NULL,'Description of Login','2021-03-07 00:34:40',NULL),
	(1000,'CONTROLLER.auth.Controller.Login.Title','raw','Title of controller auth.Controller action Login',NULL,NULL,NULL,NULL,NULL,'Login','2021-03-07 00:34:40',NULL),
	(1001,'CONTROLLER.auth.Controller.Logout.Description','raw','Description of controller auth.Controller action Logout',NULL,NULL,NULL,NULL,NULL,'Description of Logout','2021-03-07 00:34:40',NULL),
	(1002,'CONTROLLER.auth.Controller.Logout.Title','raw','Title of controller auth.Controller action Logout',NULL,NULL,NULL,NULL,NULL,'Logout','2021-03-07 00:34:40',NULL),
	(1003,'CONTROLLER.auth.Controller.Nav.Description','raw','Description of controller auth.Controller action Nav',NULL,NULL,NULL,NULL,NULL,'Description of Nav','2021-03-07 00:34:40',NULL),
	(1004,'CONTROLLER.auth.Controller.Nav.Title','raw','Title of controller auth.Controller action Nav',NULL,NULL,NULL,NULL,NULL,'Nav','2021-03-07 00:34:40',NULL),
	(1005,'CONTROLLER.auth.Controller.Navigation.Description','raw','Description of controller auth.Controller action Navigation',NULL,NULL,NULL,NULL,NULL,'Description of Navigation','2021-03-07 00:34:40',NULL),
	(1006,'CONTROLLER.auth.Controller.Navigation.Title','raw','Title of controller auth.Controller action Navigation',NULL,NULL,NULL,NULL,NULL,'Navigation','2021-03-07 00:34:40',NULL),
	(1007,'CONTROLLER.auth.Controller.Roles.Description','raw','Description of controller auth.Controller action Roles',NULL,NULL,NULL,NULL,NULL,'Description of Roles','2021-03-07 00:34:40',NULL),
	(1008,'CONTROLLER.auth.Controller.Roles.Title','raw','Title of controller auth.Controller action Roles',NULL,NULL,NULL,NULL,NULL,'Roles','2021-03-07 00:34:40',NULL),
	(1009,'CONTROLLER.auth.Controller.Routes.Description','raw','Description of controller auth.Controller action Routes',NULL,NULL,NULL,NULL,NULL,'Description of Routes','2021-03-07 00:34:40',NULL),
	(1010,'CONTROLLER.auth.Controller.Routes.Title','raw','Title of controller auth.Controller action Routes',NULL,NULL,NULL,NULL,NULL,'Routes','2021-03-07 00:34:40',NULL),
	(1011,'CONTROLLER.controller.TestController.Test.Description','raw','Description of controller controller.TestController action Test',NULL,NULL,NULL,NULL,NULL,'Description of Test','2021-03-07 00:34:40',NULL),
	(1012,'CONTROLLER.controller.TestController.Test.Title','raw','Title of controller controller.TestController action Test',NULL,NULL,NULL,NULL,NULL,'Test','2021-03-07 00:34:40',NULL),
	(1013,'CONTROLLER.locale.Controller.Translation.Description','raw','Description of controller locale.Controller action Translation',NULL,NULL,NULL,NULL,NULL,'Description of Translation','2021-03-07 00:34:40',NULL),
	(1014,'CONTROLLER.locale.Controller.Translation.Title','raw','Title of controller locale.Controller action Translation',NULL,NULL,NULL,NULL,NULL,'Translation','2021-03-07 00:34:40',NULL),
	(1015,'CONTROLLER.locale.Controller.Translation.AddLanguage','raw',NULL,NULL,NULL,NULL,NULL,NULL,'Add language','2021-03-07 00:40:30','2021-03-07 00:50:06'),
	(1016,'CONTROLLER.locale.Controller.Translation.ID','raw',NULL,NULL,NULL,NULL,NULL,NULL,'ID','2021-03-07 00:40:30','2021-03-07 00:50:06'),
	(1017,'CONTROLLER.locale.Controller.Translation.Translation','raw',NULL,NULL,NULL,NULL,NULL,NULL,'Translation','2021-03-07 00:40:30','2021-03-07 00:50:06'),
	(1030,'COMMON.Back','raw',NULL,NULL,NULL,NULL,NULL,NULL,'Back','2021-03-07 11:01:35',NULL),
	(1031,'COMMON.Export','raw',NULL,NULL,NULL,NULL,NULL,NULL,'Export','2021-03-07 11:01:35',NULL),
	(1032,'COMMON.NotValid','raw',NULL,NULL,NULL,NULL,NULL,NULL,'The form is not valid!','2021-03-07 11:01:35',NULL),
	(1033,'GRID.LoadingData','raw','Text while the data is fetched.',NULL,NULL,NULL,NULL,NULL,'Loading data...','2021-03-07 11:01:35','2021-03-07 11:08:09'),
	(1034,'GRID.ItemSaved','raw','Alert text after a item got saved.',NULL,NULL,NULL,NULL,NULL,'Item saved!','2021-03-07 11:11:01',NULL),
	(1039,'ORM.auth.Navigation.ID','raw','Field ID of model auth.Navigation',NULL,NULL,NULL,NULL,NULL,'ID','2021-03-07 11:52:10',NULL),
	(1040,'ORM.auth.Navigation.Icon','raw','Field Icon of model auth.Navigation',NULL,NULL,NULL,NULL,NULL,'Icon','2021-03-07 11:52:10',NULL),
	(1041,'ORM.auth.Navigation.Note','raw','Field Note of model auth.Navigation',NULL,NULL,NULL,NULL,NULL,'Note','2021-03-07 11:52:10',NULL),
	(1042,'ORM.auth.Navigation.Position','raw','Field Position of model auth.Navigation',NULL,NULL,NULL,NULL,NULL,'Position','2021-03-07 11:52:10',NULL),
	(1043,'ORM.auth.Navigation.RouteID','raw','Field RouteID of model auth.Navigation',NULL,NULL,NULL,NULL,NULL,'RouteID','2021-03-07 11:52:10',NULL),
	(1044,'ORM.auth.Navigation.Title','raw','Field Title of model auth.Navigation',NULL,NULL,NULL,NULL,NULL,'Title','2021-03-07 11:52:10',NULL),
	(1045,'ORM.auth.Role.Description','raw','Field Description of model auth.Role',NULL,NULL,NULL,NULL,NULL,'Description','2021-03-07 11:52:10',NULL),
	(1046,'ORM.auth.Role.ID','raw','Field ID of model auth.Role',NULL,NULL,NULL,NULL,NULL,'ID','2021-03-07 11:52:10',NULL),
	(1047,'ORM.auth.Role.Name','raw','Field Name of model auth.Role',NULL,NULL,NULL,NULL,NULL,'Name','2021-03-07 11:52:10',NULL),
	(1048,'ORM.auth.User.FailedLogins','raw','Field FailedLogins of model auth.User',NULL,NULL,NULL,NULL,NULL,'FailedLogins','2021-03-07 11:52:10',NULL),
	(1049,'ORM.auth.User.ID','raw','Field ID of model auth.User',NULL,NULL,NULL,NULL,NULL,'ID','2021-03-07 11:52:10',NULL),
	(1050,'ORM.auth.User.LastFailedLogin','raw','Field LastFailedLogin of model auth.User',NULL,NULL,NULL,NULL,NULL,'LastFailedLogin','2021-03-07 11:52:10',NULL),
	(1051,'ORM.auth.User.LastLogin','raw','Field LastLogin of model auth.User',NULL,NULL,NULL,NULL,NULL,'LastLogin','2021-03-07 11:52:10',NULL),
	(1052,'ORM.auth.User.Login','raw','Field Login of model auth.User',NULL,NULL,NULL,NULL,NULL,'Login','2021-03-07 11:52:10',NULL),
	(1053,'ORM.auth.User.Name','raw','Field Name of model auth.User',NULL,NULL,NULL,NULL,NULL,'Name','2021-03-07 11:52:10',NULL),
	(1054,'ORM.auth.User.Salutation','raw','Field Salutation of model auth.User',NULL,NULL,NULL,NULL,NULL,'Salutation','2021-03-07 11:52:10',NULL),
	(1055,'ORM.auth.User.State','raw','Field State of model auth.User',NULL,NULL,NULL,NULL,NULL,'State','2021-03-07 11:52:10',NULL),
	(1056,'ORM.auth.User.Surname','raw','Field Surname of model auth.User',NULL,NULL,NULL,NULL,NULL,'Surname','2021-03-07 11:52:10',NULL),
	(1057,'ORM.server.Route.CreatedAt','raw','Field CreatedAt of model server.Route',NULL,NULL,NULL,NULL,NULL,'CreatedAt','2021-03-07 11:52:10',NULL),
	(1058,'ORM.server.Route.DeletedAt','raw','Field DeletedAt of model server.Route',NULL,NULL,NULL,NULL,NULL,'DeletedAt','2021-03-07 11:52:10',NULL),
	(1059,'ORM.server.Route.Frontend','raw','Field Frontend of model server.Route',NULL,NULL,NULL,NULL,NULL,'Frontend','2021-03-07 11:52:10',NULL),
	(1060,'ORM.server.Route.ID','raw','Field ID of model server.Route',NULL,NULL,NULL,NULL,NULL,'ID','2021-03-07 11:52:10',NULL),
	(1061,'ORM.server.Route.Method','raw','Field Method of model server.Route',NULL,NULL,NULL,NULL,NULL,'Method','2021-03-07 11:52:10',NULL),
	(1062,'ORM.server.Route.Name','raw','Field Name of model server.Route',NULL,NULL,NULL,NULL,NULL,'Name','2021-03-07 11:52:10',NULL),
	(1063,'ORM.server.Route.Pattern','raw','Field Pattern of model server.Route',NULL,NULL,NULL,NULL,NULL,'Pattern','2021-03-07 11:52:10',NULL),
	(1064,'ORM.server.Route.Public','raw','Field Public of model server.Route',NULL,NULL,NULL,NULL,NULL,'Public','2021-03-07 11:52:10',NULL),
	(1065,'ORM.server.Route.UpdatedAt','raw','Field UpdatedAt of model server.Route',NULL,NULL,NULL,NULL,NULL,'UpdatedAt','2021-03-07 11:52:10',NULL),
	(1066,'ORM.auth.Navigation.Children','raw','Field Children of model auth.Navigation',NULL,NULL,NULL,NULL,NULL,'Children','2021-03-07 11:56:41',NULL),
	(1067,'ORM.auth.Navigation.Route','raw','Field Route of model auth.Navigation',NULL,NULL,NULL,NULL,NULL,'Route','2021-03-07 11:56:41',NULL),
	(1068,'ORM.auth.Role.Backend','raw','Field Backend of model auth.Role',NULL,NULL,NULL,NULL,NULL,'Backend','2021-03-07 11:56:41',NULL),
	(1069,'ORM.auth.Role.Children','raw','Field Children of model auth.Role',NULL,NULL,NULL,NULL,NULL,'Children','2021-03-07 11:56:41',NULL),
	(1070,'ORM.auth.Role.Frontend','raw','Field Frontend of model auth.Role',NULL,NULL,NULL,NULL,NULL,'Frontend','2021-03-07 11:56:41',NULL),
	(1071,'ORM.auth.User.Options','raw','Field Options of model auth.User',NULL,NULL,NULL,NULL,NULL,'Options','2021-03-07 11:56:41',NULL),
	(1072,'ORM.auth.User.RefreshTokens','raw','Field RefreshTokens of model auth.User',NULL,NULL,NULL,NULL,NULL,'RefreshTokens','2021-03-07 11:56:41',NULL),
	(1073,'ORM.auth.User.Roles','raw','Field Roles of model auth.User',NULL,NULL,NULL,NULL,NULL,'Roles','2021-03-07 11:56:41',NULL),
	(1075,'COMMON.Add','en',NULL,NULL,NULL,NULL,NULL,NULL,'Add','2021-03-07 12:16:20',NULL),
	(1076,'COMMON.Login','raw',NULL,NULL,NULL,NULL,NULL,NULL,'Login','2021-03-07 12:26:39',NULL),
	(1077,'COMMON.Password','raw',NULL,NULL,NULL,NULL,NULL,NULL,'Password','2021-03-07 12:26:39',NULL),
	(1078,'CONTROLLER.auth.Controller.Login.ErrLoginRequired','raw',NULL,NULL,NULL,NULL,NULL,NULL,'Login is mandatory','2021-03-07 12:26:39',NULL),
	(1079,'CONTROLLER.auth.Controller.Login.ErrPasswordLength','raw',NULL,NULL,NULL,NULL,NULL,NULL,'Password length min 7 chars.','2021-03-07 12:26:39',NULL),
	(1080,'CONTROLLER.auth.Controller.Login.ErrPasswordRequired','raw',NULL,NULL,NULL,NULL,NULL,NULL,'Password is mandatory','2021-03-07 12:26:39',NULL),
	(1081,'CONTROLLER.auth.Controller.Login.Impress','raw',NULL,NULL,NULL,NULL,NULL,NULL,' ','2021-03-07 12:26:39','2021-03-07 12:29:56'),
	(1082,'CONTROLLER.auth.Controller.Login.Privacy','raw',NULL,NULL,NULL,NULL,NULL,NULL,'user admin,pw admin123','2021-03-07 12:26:39',NULL);

/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;


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
	(5,1,'RefreshToken',NULL,'2021-03-03 14:55:27'),
	(6,1,'RefreshTokenInvalid',NULL,'2021-03-04 22:11:53'),
	(7,1,'RefreshTokenInvalid',NULL,'2021-03-04 22:11:55'),
	(8,1,'RefreshTokenInvalid',NULL,'2021-03-04 22:11:56'),
	(9,1,'RefreshTokenInvalid',NULL,'2021-03-04 22:11:56'),
	(10,1,'RefreshTokenInvalid',NULL,'2021-03-04 22:11:57'),
	(11,1,'RefreshTokenInvalid',NULL,'2021-03-04 22:12:00'),
	(12,1,'Login',NULL,'2021-03-04 22:12:04'),
	(13,1,'RefreshToken',NULL,'2021-03-05 08:44:20'),
	(14,1,'RefreshToken',NULL,'2021-03-05 09:13:13'),
	(15,1,'RefreshToken',NULL,'2021-03-05 10:08:30'),
	(16,1,'RefreshToken',NULL,'2021-03-05 15:09:52'),
	(17,1,'RefreshToken',NULL,'2021-03-05 15:09:52'),
	(18,1,'Login',NULL,'2021-03-05 15:09:59'),
	(19,1,'Login',NULL,'2021-03-05 15:10:28'),
	(20,1,'Login',NULL,'2021-03-05 15:10:48'),
	(21,1,'RefreshToken',NULL,'2021-03-05 15:11:53'),
	(22,1,'RefreshToken',NULL,'2021-03-05 15:11:53'),
	(23,1,'RefreshToken',NULL,'2021-03-05 15:13:18'),
	(24,1,'RefreshToken',NULL,'2021-03-05 15:13:18'),
	(25,1,'RefreshToken',NULL,'2021-03-05 15:17:27'),
	(26,1,'RefreshToken',NULL,'2021-03-05 15:17:27'),
	(27,1,'RefreshToken',NULL,'2021-03-05 15:19:29'),
	(28,1,'RefreshToken',NULL,'2021-03-05 15:19:29'),
	(29,1,'RefreshToken',NULL,'2021-03-05 15:21:26'),
	(30,1,'RefreshToken',NULL,'2021-03-05 15:21:26'),
	(31,1,'RefreshToken',NULL,'2021-03-05 15:22:40'),
	(32,1,'RefreshToken',NULL,'2021-03-05 15:22:40'),
	(33,1,'RefreshToken',NULL,'2021-03-05 15:44:48'),
	(34,1,'RefreshToken',NULL,'2021-03-05 15:44:48'),
	(35,1,'RefreshToken',NULL,'2021-03-05 15:45:51'),
	(36,1,'RefreshToken',NULL,'2021-03-05 15:45:51'),
	(37,1,'RefreshToken',NULL,'2021-03-05 15:47:26'),
	(38,1,'RefreshToken',NULL,'2021-03-05 15:47:26'),
	(39,1,'RefreshToken',NULL,'2021-03-05 15:48:58'),
	(40,1,'RefreshToken',NULL,'2021-03-05 15:48:58'),
	(41,1,'RefreshToken',NULL,'2021-03-05 15:50:35'),
	(42,1,'RefreshToken',NULL,'2021-03-05 15:50:35'),
	(43,1,'RefreshToken',NULL,'2021-03-05 15:52:30'),
	(44,1,'RefreshToken',NULL,'2021-03-05 15:52:30'),
	(45,1,'RefreshToken',NULL,'2021-03-05 15:54:26'),
	(46,1,'RefreshToken',NULL,'2021-03-05 15:54:26'),
	(47,1,'RefreshToken',NULL,'2021-03-05 16:16:59'),
	(48,1,'RefreshToken',NULL,'2021-03-05 16:18:00'),
	(49,1,'RefreshToken',NULL,'2021-03-05 16:34:22'),
	(50,1,'RefreshToken',NULL,'2021-03-05 16:34:22'),
	(51,1,'RefreshToken',NULL,'2021-03-05 16:36:04'),
	(52,1,'RefreshToken',NULL,'2021-03-05 16:36:04'),
	(53,1,'RefreshToken',NULL,'2021-03-05 16:45:41'),
	(54,1,'RefreshToken',NULL,'2021-03-05 16:45:41'),
	(55,1,'RefreshToken',NULL,'2021-03-05 16:52:07'),
	(56,1,'RefreshToken',NULL,'2021-03-05 16:52:07'),
	(57,1,'RefreshToken',NULL,'2021-03-05 16:55:06'),
	(58,1,'RefreshToken',NULL,'2021-03-05 16:55:06'),
	(59,1,'RefreshToken',NULL,'2021-03-05 16:57:55'),
	(60,1,'RefreshToken',NULL,'2021-03-05 16:57:55'),
	(61,1,'RefreshToken',NULL,'2021-03-05 16:59:16'),
	(62,1,'RefreshToken',NULL,'2021-03-05 16:59:16'),
	(63,1,'RefreshToken',NULL,'2021-03-05 17:01:04'),
	(64,1,'RefreshToken',NULL,'2021-03-05 17:01:04'),
	(65,1,'RefreshToken',NULL,'2021-03-05 17:02:30'),
	(66,1,'RefreshToken',NULL,'2021-03-05 17:02:30'),
	(67,1,'RefreshToken',NULL,'2021-03-05 17:03:34'),
	(68,1,'RefreshToken',NULL,'2021-03-05 17:03:34'),
	(69,1,'RefreshTokenInvalid',NULL,'2021-03-05 17:03:35'),
	(70,1,'RefreshTokenInvalid',NULL,'2021-03-05 17:03:35'),
	(71,1,'RefreshTokenInvalid',NULL,'2021-03-05 17:04:38'),
	(72,1,'RefreshTokenInvalid',NULL,'2021-03-05 17:04:38'),
	(73,1,'RefreshTokenInvalid',NULL,'2021-03-05 17:04:43'),
	(74,1,'Login',NULL,'2021-03-05 19:54:16'),
	(75,1,'Login',NULL,'2021-03-05 21:03:15'),
	(76,1,'RefreshToken',NULL,'2021-03-05 21:04:47'),
	(77,1,'RefreshToken',NULL,'2021-03-05 21:05:49'),
	(78,1,'RefreshToken',NULL,'2021-03-05 21:05:49'),
	(79,1,'RefreshToken',NULL,'2021-03-05 21:12:13'),
	(80,1,'RefreshToken',NULL,'2021-03-05 21:15:52'),
	(81,1,'RefreshToken',NULL,'2021-03-05 21:17:03'),
	(82,1,'RefreshToken',NULL,'2021-03-05 21:19:35'),
	(83,1,'RefreshToken',NULL,'2021-03-05 21:20:45'),
	(84,1,'RefreshToken',NULL,'2021-03-05 21:34:37'),
	(85,1,'RefreshToken',NULL,'2021-03-05 21:34:37'),
	(86,1,'RefreshToken',NULL,'2021-03-05 21:48:00'),
	(87,1,'RefreshToken',NULL,'2021-03-05 21:48:00'),
	(88,1,'RefreshToken',NULL,'2021-03-05 22:01:34'),
	(89,1,'RefreshToken',NULL,'2021-03-05 22:01:34'),
	(90,1,'RefreshToken',NULL,'2021-03-05 22:03:04'),
	(91,1,'RefreshToken',NULL,'2021-03-05 22:03:04'),
	(92,1,'RefreshToken',NULL,'2021-03-05 22:06:52'),
	(93,1,'RefreshToken',NULL,'2021-03-05 22:06:52'),
	(94,1,'RefreshToken',NULL,'2021-03-05 22:09:48'),
	(95,1,'RefreshTokenInvalid',NULL,'2021-03-05 22:09:48'),
	(96,1,'RefreshToken',NULL,'2021-03-05 22:11:10'),
	(97,1,'RefreshToken',NULL,'2021-03-05 22:11:10'),
	(98,1,'RefreshToken',NULL,'2021-03-05 22:13:56'),
	(99,1,'RefreshToken',NULL,'2021-03-05 22:13:56'),
	(100,1,'RefreshToken',NULL,'2021-03-05 22:15:06'),
	(101,1,'RefreshToken',NULL,'2021-03-05 22:15:06'),
	(102,1,'RefreshToken',NULL,'2021-03-05 22:20:53'),
	(103,1,'RefreshTokenInvalid',NULL,'2021-03-05 22:20:53'),
	(104,1,'RefreshToken',NULL,'2021-03-05 22:22:11'),
	(105,1,'RefreshToken',NULL,'2021-03-05 22:22:11'),
	(106,1,'RefreshToken',NULL,'2021-03-05 22:28:40'),
	(107,1,'RefreshToken',NULL,'2021-03-05 22:28:40'),
	(108,1,'RefreshToken',NULL,'2021-03-05 22:31:51'),
	(109,1,'RefreshToken',NULL,'2021-03-05 22:35:09'),
	(110,1,'RefreshToken',NULL,'2021-03-05 22:35:09'),
	(111,1,'RefreshToken',NULL,'2021-03-05 22:36:22'),
	(112,1,'RefreshTokenInvalid',NULL,'2021-03-05 22:36:23'),
	(113,1,'RefreshToken',NULL,'2021-03-05 22:37:28'),
	(114,1,'RefreshToken',NULL,'2021-03-05 22:37:28'),
	(115,1,'RefreshToken',NULL,'2021-03-05 22:38:57'),
	(116,1,'RefreshToken',NULL,'2021-03-05 22:38:57'),
	(117,1,'RefreshToken',NULL,'2021-03-05 22:43:19'),
	(118,1,'RefreshTokenInvalid',NULL,'2021-03-05 22:43:19'),
	(119,1,'RefreshToken',NULL,'2021-03-05 22:47:57'),
	(120,1,'RefreshTokenInvalid',NULL,'2021-03-05 22:47:57'),
	(121,1,'RefreshToken',NULL,'2021-03-05 22:53:29'),
	(122,1,'RefreshToken',NULL,'2021-03-05 22:55:03'),
	(123,1,'RefreshToken',NULL,'2021-03-05 22:55:03'),
	(124,1,'RefreshToken',NULL,'2021-03-05 22:56:46'),
	(125,1,'RefreshToken',NULL,'2021-03-05 22:56:46'),
	(126,1,'RefreshToken',NULL,'2021-03-05 22:58:08'),
	(127,1,'RefreshToken',NULL,'2021-03-05 22:58:08'),
	(128,1,'RefreshToken',NULL,'2021-03-05 22:59:09'),
	(129,1,'RefreshToken',NULL,'2021-03-05 23:04:16'),
	(130,1,'RefreshToken',NULL,'2021-03-05 23:04:16'),
	(131,1,'RefreshToken',NULL,'2021-03-05 23:05:23'),
	(132,1,'RefreshToken',NULL,'2021-03-05 23:05:23'),
	(133,1,'RefreshToken',NULL,'2021-03-05 23:06:24'),
	(134,1,'RefreshToken',NULL,'2021-03-05 23:12:02'),
	(135,1,'RefreshToken',NULL,'2021-03-05 23:15:01'),
	(136,1,'RefreshTokenInvalid',NULL,'2021-03-05 23:15:01'),
	(137,1,'RefreshToken',NULL,'2021-03-05 23:16:46'),
	(138,1,'RefreshToken',NULL,'2021-03-05 23:16:46'),
	(139,1,'RefreshToken',NULL,'2021-03-05 23:18:08'),
	(140,1,'RefreshToken',NULL,'2021-03-05 23:18:08'),
	(141,1,'RefreshToken',NULL,'2021-03-05 23:19:33'),
	(142,1,'RefreshToken',NULL,'2021-03-05 23:19:33'),
	(143,1,'RefreshToken',NULL,'2021-03-05 23:22:04'),
	(144,1,'RefreshTokenInvalid',NULL,'2021-03-05 23:22:04'),
	(145,1,'RefreshToken',NULL,'2021-03-05 23:25:13'),
	(146,1,'RefreshToken',NULL,'2021-03-05 23:25:13'),
	(147,1,'RefreshToken',NULL,'2021-03-05 23:29:37'),
	(148,1,'RefreshTokenInvalid',NULL,'2021-03-05 23:29:37'),
	(149,1,'RefreshToken',NULL,'2021-03-05 23:30:55'),
	(150,1,'RefreshTokenInvalid',NULL,'2021-03-05 23:30:55'),
	(151,1,'RefreshToken',NULL,'2021-03-05 23:32:10'),
	(152,1,'RefreshToken',NULL,'2021-03-05 23:32:10'),
	(153,1,'RefreshToken',NULL,'2021-03-05 23:46:55'),
	(154,1,'RefreshToken',NULL,'2021-03-05 23:46:55'),
	(155,1,'RefreshToken',NULL,'2021-03-05 23:47:57'),
	(156,1,'RefreshToken',NULL,'2021-03-05 23:47:57'),
	(157,1,'RefreshToken',NULL,'2021-03-05 23:49:33'),
	(158,1,'RefreshToken',NULL,'2021-03-05 23:49:33'),
	(159,1,'RefreshToken',NULL,'2021-03-05 23:53:23'),
	(160,1,'RefreshToken',NULL,'2021-03-05 23:53:23'),
	(161,1,'RefreshToken',NULL,'2021-03-05 23:54:25'),
	(162,1,'RefreshTokenInvalid',NULL,'2021-03-05 23:54:26'),
	(163,1,'RefreshToken',NULL,'2021-03-06 00:02:02'),
	(164,1,'RefreshToken',NULL,'2021-03-06 00:07:16'),
	(165,1,'RefreshTokenInvalid',NULL,'2021-03-06 00:07:16'),
	(166,1,'RefreshToken',NULL,'2021-03-06 00:08:51'),
	(167,1,'RefreshToken',NULL,'2021-03-06 00:08:51'),
	(168,1,'RefreshToken',NULL,'2021-03-06 00:34:09'),
	(169,1,'RefreshToken',NULL,'2021-03-06 00:34:09'),
	(170,1,'RefreshToken',NULL,'2021-03-06 00:35:21'),
	(171,1,'RefreshToken',NULL,'2021-03-06 00:36:22'),
	(172,1,'RefreshTokenInvalid',NULL,'2021-03-06 00:36:22'),
	(173,1,'RefreshToken',NULL,'2021-03-06 00:37:26'),
	(174,1,'RefreshToken',NULL,'2021-03-06 00:40:40'),
	(175,1,'RefreshToken',NULL,'2021-03-06 00:40:40'),
	(176,1,'RefreshToken',NULL,'2021-03-06 00:43:15'),
	(177,1,'RefreshToken',NULL,'2021-03-06 00:43:15'),
	(178,1,'RefreshToken',NULL,'2021-03-06 00:46:00'),
	(179,1,'RefreshToken',NULL,'2021-03-06 00:46:00'),
	(180,1,'RefreshToken',NULL,'2021-03-06 00:54:27'),
	(181,1,'RefreshToken',NULL,'2021-03-06 00:56:09'),
	(182,1,'RefreshToken',NULL,'2021-03-06 00:56:09'),
	(183,1,'RefreshToken',NULL,'2021-03-06 00:57:16'),
	(184,1,'RefreshToken',NULL,'2021-03-06 00:57:16'),
	(185,1,'RefreshToken',NULL,'2021-03-06 01:00:01'),
	(186,1,'RefreshToken',NULL,'2021-03-06 01:00:01'),
	(187,1,'RefreshToken',NULL,'2021-03-06 01:01:11'),
	(188,1,'RefreshToken',NULL,'2021-03-06 01:01:12'),
	(189,1,'RefreshToken',NULL,'2021-03-06 01:03:07'),
	(190,1,'RefreshToken',NULL,'2021-03-06 01:03:07'),
	(191,1,'RefreshToken',NULL,'2021-03-06 01:04:18'),
	(192,1,'RefreshToken',NULL,'2021-03-06 01:04:18'),
	(193,1,'RefreshToken',NULL,'2021-03-06 01:06:00'),
	(194,1,'RefreshToken',NULL,'2021-03-06 01:06:00'),
	(195,1,'RefreshToken',NULL,'2021-03-06 01:07:07'),
	(196,1,'RefreshTokenInvalid',NULL,'2021-03-06 01:07:07'),
	(197,1,'RefreshToken',NULL,'2021-03-06 01:08:12'),
	(198,1,'RefreshToken',NULL,'2021-03-06 01:08:12'),
	(199,1,'RefreshToken',NULL,'2021-03-06 01:10:19'),
	(200,1,'RefreshToken',NULL,'2021-03-06 01:10:19'),
	(201,1,'RefreshToken',NULL,'2021-03-06 01:12:54'),
	(202,1,'RefreshToken',NULL,'2021-03-06 01:12:54'),
	(203,1,'RefreshToken',NULL,'2021-03-06 01:14:02'),
	(204,1,'RefreshToken',NULL,'2021-03-06 01:14:02'),
	(205,1,'RefreshToken',NULL,'2021-03-06 01:16:07'),
	(206,1,'RefreshToken',NULL,'2021-03-06 01:28:18'),
	(207,1,'RefreshToken',NULL,'2021-03-06 01:28:18'),
	(208,1,'RefreshToken',NULL,'2021-03-06 01:29:22'),
	(209,1,'RefreshToken',NULL,'2021-03-06 01:30:24'),
	(210,1,'RefreshToken',NULL,'2021-03-06 01:32:01'),
	(211,1,'RefreshToken',NULL,'2021-03-06 01:32:01'),
	(212,1,'RefreshToken',NULL,'2021-03-06 01:33:33'),
	(213,1,'RefreshToken',NULL,'2021-03-06 01:33:33'),
	(214,1,'RefreshToken',NULL,'2021-03-06 01:47:37'),
	(215,1,'RefreshToken',NULL,'2021-03-06 10:04:33'),
	(216,1,'RefreshToken',NULL,'2021-03-06 10:06:30'),
	(217,1,'RefreshToken',NULL,'2021-03-06 10:09:11'),
	(218,1,'RefreshToken',NULL,'2021-03-06 10:10:17'),
	(219,1,'RefreshToken',NULL,'2021-03-06 10:11:39'),
	(220,1,'RefreshToken',NULL,'2021-03-06 10:11:39'),
	(221,1,'RefreshToken',NULL,'2021-03-06 10:14:28'),
	(222,1,'RefreshToken',NULL,'2021-03-06 10:14:28'),
	(223,1,'RefreshToken',NULL,'2021-03-06 10:15:34'),
	(224,1,'RefreshToken',NULL,'2021-03-06 10:15:34'),
	(225,1,'RefreshToken',NULL,'2021-03-06 10:17:39'),
	(226,1,'RefreshToken',NULL,'2021-03-06 10:17:39'),
	(227,1,'RefreshToken',NULL,'2021-03-06 10:21:12'),
	(228,1,'RefreshToken',NULL,'2021-03-06 11:02:09'),
	(229,1,'RefreshToken',NULL,'2021-03-06 11:02:09'),
	(230,1,'RefreshToken',NULL,'2021-03-06 11:06:34'),
	(231,1,'RefreshToken',NULL,'2021-03-06 11:06:34'),
	(232,1,'RefreshToken',NULL,'2021-03-06 11:08:04'),
	(233,1,'RefreshToken',NULL,'2021-03-06 11:10:17'),
	(234,1,'RefreshToken',NULL,'2021-03-06 11:10:17'),
	(235,1,'RefreshToken',NULL,'2021-03-06 11:18:08'),
	(236,1,'RefreshToken',NULL,'2021-03-06 11:18:08'),
	(237,1,'RefreshToken',NULL,'2021-03-06 11:19:30'),
	(238,1,'RefreshToken',NULL,'2021-03-06 11:21:09'),
	(239,1,'RefreshToken',NULL,'2021-03-06 11:23:02'),
	(240,1,'RefreshToken',NULL,'2021-03-06 11:23:02'),
	(241,1,'RefreshToken',NULL,'2021-03-06 11:24:15'),
	(242,1,'RefreshToken',NULL,'2021-03-06 11:26:46'),
	(243,1,'RefreshToken',NULL,'2021-03-06 11:26:46'),
	(244,1,'RefreshTokenInvalid',NULL,'2021-03-06 11:26:48'),
	(245,1,'RefreshTokenInvalid',NULL,'2021-03-06 11:26:48'),
	(246,1,'RefreshTokenInvalid',NULL,'2021-03-06 11:26:52'),
	(247,1,'RefreshTokenInvalid',NULL,'2021-03-06 11:26:52'),
	(248,1,'RefreshTokenInvalid',NULL,'2021-03-06 11:26:54'),
	(249,1,'RefreshTokenInvalid',NULL,'2021-03-06 11:26:54'),
	(250,1,'RefreshTokenInvalid',NULL,'2021-03-06 11:26:56'),
	(251,1,'Login',NULL,'2021-03-06 11:27:01'),
	(252,1,'RefreshToken',NULL,'2021-03-06 11:28:09'),
	(253,1,'RefreshToken',NULL,'2021-03-06 11:28:09'),
	(254,1,'RefreshToken',NULL,'2021-03-06 11:30:13'),
	(255,1,'RefreshTokenInvalid',NULL,'2021-03-06 11:30:13'),
	(256,1,'RefreshToken',NULL,'2021-03-06 11:31:37'),
	(257,1,'RefreshToken',NULL,'2021-03-06 11:33:01'),
	(258,1,'RefreshToken',NULL,'2021-03-06 11:33:01'),
	(259,1,'RefreshToken',NULL,'2021-03-06 11:34:11'),
	(260,1,'RefreshToken',NULL,'2021-03-06 11:34:11'),
	(261,1,'RefreshToken',NULL,'2021-03-06 11:35:15'),
	(262,1,'RefreshToken',NULL,'2021-03-06 11:35:15'),
	(263,1,'RefreshToken',NULL,'2021-03-06 11:36:58'),
	(264,1,'RefreshToken',NULL,'2021-03-06 11:36:58'),
	(265,1,'RefreshToken',NULL,'2021-03-06 11:38:54'),
	(266,1,'RefreshToken',NULL,'2021-03-06 11:39:55'),
	(267,1,'RefreshToken',NULL,'2021-03-06 11:42:39'),
	(268,1,'RefreshToken',NULL,'2021-03-06 11:42:39'),
	(269,1,'RefreshToken',NULL,'2021-03-06 11:44:06'),
	(270,1,'RefreshTokenInvalid',NULL,'2021-03-06 11:44:06'),
	(271,1,'RefreshToken',NULL,'2021-03-06 11:45:17'),
	(272,1,'RefreshToken',NULL,'2021-03-06 11:45:17'),
	(273,1,'RefreshToken',NULL,'2021-03-06 11:46:34'),
	(274,1,'RefreshToken',NULL,'2021-03-06 11:46:34'),
	(275,1,'RefreshToken',NULL,'2021-03-06 11:49:05'),
	(276,1,'RefreshTokenInvalid',NULL,'2021-03-06 11:49:05'),
	(277,1,'RefreshToken',NULL,'2021-03-06 11:50:07'),
	(278,1,'RefreshToken',NULL,'2021-03-06 11:51:25'),
	(279,1,'RefreshToken',NULL,'2021-03-06 11:54:22'),
	(280,1,'RefreshToken',NULL,'2021-03-06 11:55:56'),
	(281,1,'RefreshToken',NULL,'2021-03-06 11:57:03'),
	(282,1,'RefreshToken',NULL,'2021-03-06 11:58:29'),
	(283,1,'RefreshToken',NULL,'2021-03-06 11:59:35'),
	(284,1,'RefreshToken',NULL,'2021-03-06 12:01:06'),
	(285,1,'RefreshToken',NULL,'2021-03-06 12:03:07'),
	(286,1,'RefreshToken',NULL,'2021-03-06 12:03:07'),
	(287,1,'RefreshToken',NULL,'2021-03-06 12:04:54'),
	(288,1,'RefreshToken',NULL,'2021-03-06 12:04:54'),
	(289,1,'RefreshToken',NULL,'2021-03-06 12:06:29'),
	(290,1,'RefreshToken',NULL,'2021-03-06 12:08:01'),
	(291,1,'RefreshToken',NULL,'2021-03-06 12:08:01'),
	(292,1,'RefreshToken',NULL,'2021-03-06 12:09:10'),
	(293,1,'RefreshToken',NULL,'2021-03-06 12:11:16'),
	(294,1,'RefreshToken',NULL,'2021-03-06 12:11:16'),
	(295,1,'RefreshToken',NULL,'2021-03-06 12:12:30'),
	(296,1,'RefreshToken',NULL,'2021-03-06 12:13:42'),
	(297,1,'RefreshTokenInvalid',NULL,'2021-03-06 12:13:42'),
	(298,1,'RefreshToken',NULL,'2021-03-06 12:14:42'),
	(299,1,'RefreshToken',NULL,'2021-03-06 12:15:44'),
	(300,1,'RefreshToken',NULL,'2021-03-06 12:15:44'),
	(301,1,'RefreshToken',NULL,'2021-03-06 12:16:45'),
	(302,1,'RefreshToken',NULL,'2021-03-06 12:43:13'),
	(303,1,'RefreshToken',NULL,'2021-03-06 12:44:16'),
	(304,1,'RefreshToken',NULL,'2021-03-06 12:47:09'),
	(305,1,'RefreshToken',NULL,'2021-03-06 12:47:09'),
	(306,1,'RefreshToken',NULL,'2021-03-06 12:48:54'),
	(307,1,'RefreshToken',NULL,'2021-03-06 12:51:22'),
	(308,1,'RefreshToken',NULL,'2021-03-06 12:51:22'),
	(309,1,'RefreshToken',NULL,'2021-03-06 12:52:29'),
	(310,1,'RefreshToken',NULL,'2021-03-06 12:52:29'),
	(311,1,'RefreshToken',NULL,'2021-03-06 12:54:42'),
	(312,1,'RefreshTokenInvalid',NULL,'2021-03-06 12:54:42'),
	(313,1,'RefreshToken',NULL,'2021-03-06 12:55:58'),
	(314,1,'RefreshToken',NULL,'2021-03-06 12:55:58'),
	(315,1,'RefreshToken',NULL,'2021-03-06 12:57:03'),
	(316,1,'RefreshToken',NULL,'2021-03-06 13:15:07'),
	(317,1,'RefreshToken',NULL,'2021-03-06 13:15:07'),
	(318,1,'RefreshToken',NULL,'2021-03-06 13:16:55'),
	(319,1,'RefreshToken',NULL,'2021-03-06 13:19:07'),
	(320,1,'RefreshToken',NULL,'2021-03-06 13:20:20'),
	(321,1,'RefreshToken',NULL,'2021-03-06 13:21:21'),
	(322,1,'RefreshToken',NULL,'2021-03-06 13:22:34'),
	(323,1,'RefreshToken',NULL,'2021-03-06 13:24:55'),
	(324,1,'RefreshToken',NULL,'2021-03-06 13:24:55'),
	(325,1,'RefreshToken',NULL,'2021-03-06 13:26:01'),
	(326,1,'RefreshToken',NULL,'2021-03-06 13:26:01'),
	(327,1,'RefreshToken',NULL,'2021-03-06 13:27:16'),
	(328,1,'RefreshToken',NULL,'2021-03-06 13:29:08'),
	(329,1,'RefreshToken',NULL,'2021-03-06 13:30:10'),
	(330,1,'RefreshToken',NULL,'2021-03-06 13:56:00'),
	(331,1,'RefreshToken',NULL,'2021-03-06 13:56:00'),
	(332,1,'RefreshToken',NULL,'2021-03-06 13:57:27'),
	(333,1,'RefreshToken',NULL,'2021-03-06 13:57:27'),
	(334,1,'RefreshToken',NULL,'2021-03-06 14:11:27'),
	(335,1,'RefreshToken',NULL,'2021-03-06 14:11:27'),
	(336,1,'RefreshToken',NULL,'2021-03-06 14:12:38'),
	(337,1,'RefreshToken',NULL,'2021-03-06 14:12:38'),
	(338,1,'RefreshToken',NULL,'2021-03-06 14:13:50'),
	(339,1,'RefreshToken',NULL,'2021-03-06 14:13:50'),
	(340,1,'RefreshToken',NULL,'2021-03-06 14:21:19'),
	(341,1,'RefreshToken',NULL,'2021-03-06 14:24:04'),
	(342,1,'RefreshToken',NULL,'2021-03-06 14:24:04'),
	(343,1,'RefreshToken',NULL,'2021-03-06 14:25:04'),
	(344,1,'RefreshToken',NULL,'2021-03-06 14:27:03'),
	(345,1,'RefreshToken',NULL,'2021-03-06 14:29:37'),
	(346,1,'RefreshToken',NULL,'2021-03-06 14:29:37'),
	(347,1,'RefreshToken',NULL,'2021-03-06 14:32:03'),
	(348,1,'RefreshToken',NULL,'2021-03-06 14:32:03'),
	(349,1,'RefreshToken',NULL,'2021-03-06 14:33:08'),
	(350,1,'RefreshToken',NULL,'2021-03-06 14:33:08'),
	(351,1,'RefreshToken',NULL,'2021-03-06 14:36:35'),
	(352,1,'RefreshToken',NULL,'2021-03-06 14:36:35'),
	(353,1,'RefreshToken',NULL,'2021-03-06 14:38:30'),
	(354,1,'RefreshTokenInvalid',NULL,'2021-03-06 14:38:30'),
	(355,1,'RefreshToken',NULL,'2021-03-06 14:39:36'),
	(356,1,'RefreshToken',NULL,'2021-03-06 14:39:36'),
	(357,1,'RefreshToken',NULL,'2021-03-06 14:40:57'),
	(358,1,'RefreshToken',NULL,'2021-03-06 14:44:42'),
	(359,1,'RefreshToken',NULL,'2021-03-06 14:45:43'),
	(360,1,'RefreshToken',NULL,'2021-03-06 14:48:37'),
	(361,1,'RefreshToken',NULL,'2021-03-06 14:50:44'),
	(362,1,'RefreshToken',NULL,'2021-03-06 14:54:06'),
	(363,1,'RefreshToken',NULL,'2021-03-06 14:54:06'),
	(364,1,'RefreshToken',NULL,'2021-03-06 14:56:17'),
	(365,1,'RefreshToken',NULL,'2021-03-06 14:58:18'),
	(366,1,'RefreshToken',NULL,'2021-03-06 14:58:18'),
	(367,1,'RefreshToken',NULL,'2021-03-06 14:59:58'),
	(368,1,'RefreshToken',NULL,'2021-03-06 14:59:58'),
	(369,1,'RefreshToken',NULL,'2021-03-06 15:02:38'),
	(370,1,'RefreshToken',NULL,'2021-03-06 15:03:47'),
	(371,1,'RefreshToken',NULL,'2021-03-06 15:04:55'),
	(372,1,'RefreshToken',NULL,'2021-03-06 15:06:30'),
	(373,1,'RefreshToken',NULL,'2021-03-06 15:08:37'),
	(374,1,'RefreshToken',NULL,'2021-03-06 15:08:37'),
	(375,1,'RefreshToken',NULL,'2021-03-06 15:10:17'),
	(376,1,'RefreshToken',NULL,'2021-03-06 15:10:17'),
	(377,1,'RefreshToken',NULL,'2021-03-06 15:11:18'),
	(378,1,'RefreshToken',NULL,'2021-03-06 16:47:27'),
	(379,1,'RefreshToken',NULL,'2021-03-06 16:47:27'),
	(380,1,'RefreshToken',NULL,'2021-03-06 16:55:14'),
	(381,1,'RefreshToken',NULL,'2021-03-06 16:55:14'),
	(382,1,'RefreshToken',NULL,'2021-03-06 16:57:27'),
	(383,1,'RefreshToken',NULL,'2021-03-06 16:57:27'),
	(384,1,'RefreshToken',NULL,'2021-03-06 17:02:58'),
	(385,1,'RefreshToken',NULL,'2021-03-06 17:02:58'),
	(386,1,'RefreshToken',NULL,'2021-03-06 17:04:29'),
	(387,1,'RefreshToken',NULL,'2021-03-06 17:04:29'),
	(388,1,'RefreshToken',NULL,'2021-03-06 17:09:06'),
	(389,1,'RefreshToken',NULL,'2021-03-06 17:10:41'),
	(390,1,'RefreshToken',NULL,'2021-03-06 17:10:41'),
	(391,1,'RefreshToken',NULL,'2021-03-06 17:11:57'),
	(392,1,'RefreshToken',NULL,'2021-03-06 17:11:57'),
	(393,1,'RefreshToken',NULL,'2021-03-06 17:18:13'),
	(394,1,'RefreshToken',NULL,'2021-03-06 17:18:13'),
	(395,1,'RefreshToken',NULL,'2021-03-06 17:27:31'),
	(396,1,'RefreshToken',NULL,'2021-03-06 17:27:31'),
	(397,1,'RefreshToken',NULL,'2021-03-06 17:33:49'),
	(398,1,'RefreshToken',NULL,'2021-03-06 17:33:49'),
	(399,1,'RefreshToken',NULL,'2021-03-06 19:32:18'),
	(400,1,'RefreshToken',NULL,'2021-03-06 19:32:18'),
	(401,1,'RefreshToken',NULL,'2021-03-06 19:34:12'),
	(402,1,'RefreshToken',NULL,'2021-03-06 19:34:12'),
	(403,1,'RefreshToken',NULL,'2021-03-06 19:39:41'),
	(404,1,'RefreshToken',NULL,'2021-03-06 19:40:45'),
	(405,1,'RefreshToken',NULL,'2021-03-06 19:40:45'),
	(406,1,'RefreshToken',NULL,'2021-03-06 19:44:33'),
	(407,1,'RefreshToken',NULL,'2021-03-06 19:44:33'),
	(408,1,'RefreshToken',NULL,'2021-03-06 19:49:37'),
	(409,1,'RefreshToken',NULL,'2021-03-06 19:49:38'),
	(410,1,'RefreshToken',NULL,'2021-03-06 19:51:00'),
	(411,1,'RefreshToken',NULL,'2021-03-06 19:51:00'),
	(412,1,'RefreshToken',NULL,'2021-03-06 19:52:03'),
	(413,1,'RefreshToken',NULL,'2021-03-06 19:52:03'),
	(414,1,'RefreshToken',NULL,'2021-03-06 20:00:11'),
	(415,1,'RefreshToken',NULL,'2021-03-06 20:00:11'),
	(416,1,'RefreshToken',NULL,'2021-03-06 20:43:19'),
	(417,1,'RefreshToken',NULL,'2021-03-06 20:44:58'),
	(418,1,'RefreshToken',NULL,'2021-03-06 20:44:58'),
	(419,1,'RefreshToken',NULL,'2021-03-06 20:46:03'),
	(420,1,'RefreshToken',NULL,'2021-03-06 21:32:24'),
	(421,1,'RefreshToken',NULL,'2021-03-06 21:32:24'),
	(422,1,'RefreshToken',NULL,'2021-03-06 21:33:37'),
	(423,1,'RefreshToken',NULL,'2021-03-06 21:40:08'),
	(424,1,'RefreshToken',NULL,'2021-03-06 21:40:08'),
	(425,1,'RefreshToken',NULL,'2021-03-06 21:44:48'),
	(426,1,'RefreshToken',NULL,'2021-03-06 21:58:35'),
	(427,1,'RefreshToken',NULL,'2021-03-06 21:58:35'),
	(428,1,'RefreshToken',NULL,'2021-03-06 21:59:49'),
	(429,1,'RefreshToken',NULL,'2021-03-06 21:59:49'),
	(430,1,'RefreshToken',NULL,'2021-03-06 22:05:26'),
	(431,1,'RefreshToken',NULL,'2021-03-06 23:28:53'),
	(432,1,'RefreshToken',NULL,'2021-03-06 23:32:51'),
	(433,1,'RefreshToken',NULL,'2021-03-06 23:32:51'),
	(434,1,'RefreshToken',NULL,'2021-03-07 00:01:44'),
	(435,1,'RefreshToken',NULL,'2021-03-07 00:08:24'),
	(436,1,'RefreshToken',NULL,'2021-03-07 00:08:24'),
	(437,1,'RefreshToken',NULL,'2021-03-07 00:13:03'),
	(438,1,'RefreshToken',NULL,'2021-03-07 00:13:03'),
	(439,1,'RefreshToken',NULL,'2021-03-07 00:21:28'),
	(440,1,'RefreshToken',NULL,'2021-03-07 00:21:28'),
	(441,1,'RefreshToken',NULL,'2021-03-07 00:28:01'),
	(442,1,'RefreshToken',NULL,'2021-03-07 00:32:18'),
	(443,1,'RefreshToken',NULL,'2021-03-07 00:33:32'),
	(444,1,'RefreshToken',NULL,'2021-03-07 00:33:32'),
	(445,1,'RefreshToken',NULL,'2021-03-07 00:34:45'),
	(446,1,'RefreshToken',NULL,'2021-03-07 00:34:45'),
	(447,1,'RefreshToken',NULL,'2021-03-07 00:35:47'),
	(448,1,'RefreshToken',NULL,'2021-03-07 00:37:43'),
	(449,1,'RefreshToken',NULL,'2021-03-07 00:39:26'),
	(450,1,'RefreshToken',NULL,'2021-03-07 00:40:33'),
	(451,1,'RefreshToken',NULL,'2021-03-07 00:40:33'),
	(452,1,'RefreshToken',NULL,'2021-03-07 00:41:36'),
	(453,1,'RefreshToken',NULL,'2021-03-07 00:41:36'),
	(454,1,'RefreshToken',NULL,'2021-03-07 00:43:09'),
	(455,1,'RefreshToken',NULL,'2021-03-07 00:45:09'),
	(456,1,'RefreshToken',NULL,'2021-03-07 00:45:09'),
	(457,1,'RefreshToken',NULL,'2021-03-07 00:47:08'),
	(458,1,'RefreshToken',NULL,'2021-03-07 00:47:08'),
	(459,1,'RefreshToken',NULL,'2021-03-07 00:48:46'),
	(460,1,'RefreshToken',NULL,'2021-03-07 00:50:09'),
	(461,1,'RefreshToken',NULL,'2021-03-07 00:50:09'),
	(462,1,'RefreshToken',NULL,'2021-03-07 00:51:22'),
	(463,1,'RefreshToken',NULL,'2021-03-07 00:52:27'),
	(464,1,'RefreshToken',NULL,'2021-03-07 00:52:28'),
	(465,1,'RefreshToken',NULL,'2021-03-07 00:54:54'),
	(466,1,'RefreshToken',NULL,'2021-03-07 00:56:57'),
	(467,1,'RefreshToken',NULL,'2021-03-07 00:56:57'),
	(468,1,'RefreshToken',NULL,'2021-03-07 01:04:22'),
	(469,1,'RefreshToken',NULL,'2021-03-07 01:04:22'),
	(470,1,'RefreshToken',NULL,'2021-03-07 01:08:11'),
	(471,1,'RefreshToken',NULL,'2021-03-07 01:08:11'),
	(472,1,'RefreshToken',NULL,'2021-03-07 01:09:29'),
	(473,1,'RefreshToken',NULL,'2021-03-07 01:09:29'),
	(474,1,'RefreshToken',NULL,'2021-03-07 01:10:52'),
	(475,1,'RefreshToken',NULL,'2021-03-07 01:10:52'),
	(476,1,'RefreshToken',NULL,'2021-03-07 01:14:46'),
	(477,1,'RefreshToken',NULL,'2021-03-07 01:14:46'),
	(478,1,'RefreshToken',NULL,'2021-03-07 01:24:00'),
	(479,1,'RefreshToken',NULL,'2021-03-07 01:24:00'),
	(480,1,'RefreshToken',NULL,'2021-03-07 01:25:07'),
	(481,1,'RefreshToken',NULL,'2021-03-07 01:25:07'),
	(482,1,'RefreshToken',NULL,'2021-03-07 01:37:32'),
	(483,1,'RefreshToken',NULL,'2021-03-07 01:37:32'),
	(484,1,'RefreshToken',NULL,'2021-03-07 01:38:34'),
	(485,1,'RefreshToken',NULL,'2021-03-07 01:38:34'),
	(486,1,'RefreshToken',NULL,'2021-03-07 01:40:02'),
	(487,1,'RefreshToken',NULL,'2021-03-07 01:40:02'),
	(488,1,'RefreshToken',NULL,'2021-03-07 01:41:08'),
	(489,1,'RefreshToken',NULL,'2021-03-07 01:42:45'),
	(490,1,'RefreshToken',NULL,'2021-03-07 01:42:45'),
	(491,1,'RefreshToken',NULL,'2021-03-07 01:43:48'),
	(492,1,'RefreshToken',NULL,'2021-03-07 01:53:25'),
	(493,1,'RefreshToken',NULL,'2021-03-07 01:53:25'),
	(494,1,'RefreshToken',NULL,'2021-03-07 01:54:44'),
	(495,1,'RefreshToken',NULL,'2021-03-07 01:54:44'),
	(496,1,'RefreshToken',NULL,'2021-03-07 01:56:11'),
	(497,1,'RefreshToken',NULL,'2021-03-07 01:56:11'),
	(498,1,'RefreshToken',NULL,'2021-03-07 01:58:47'),
	(499,1,'RefreshToken',NULL,'2021-03-07 01:58:47'),
	(500,1,'RefreshToken',NULL,'2021-03-07 02:00:42'),
	(501,1,'RefreshToken',NULL,'2021-03-07 02:00:42'),
	(502,1,'RefreshToken',NULL,'2021-03-07 02:01:59'),
	(503,1,'RefreshToken',NULL,'2021-03-07 02:01:59'),
	(504,1,'RefreshToken',NULL,'2021-03-07 02:05:11'),
	(505,1,'RefreshToken',NULL,'2021-03-07 02:05:11'),
	(506,1,'RefreshToken',NULL,'2021-03-07 02:08:38'),
	(507,1,'RefreshToken',NULL,'2021-03-07 02:08:38'),
	(508,1,'RefreshToken',NULL,'2021-03-07 02:09:43'),
	(509,1,'RefreshToken',NULL,'2021-03-07 02:09:43'),
	(510,1,'RefreshToken',NULL,'2021-03-07 02:23:19'),
	(511,1,'RefreshToken',NULL,'2021-03-07 02:23:19'),
	(512,1,'RefreshToken',NULL,'2021-03-07 02:25:48'),
	(513,1,'RefreshToken',NULL,'2021-03-07 02:25:48'),
	(514,1,'RefreshToken',NULL,'2021-03-07 02:26:53'),
	(515,1,'RefreshTokenInvalid',NULL,'2021-03-07 02:26:53'),
	(516,1,'RefreshToken',NULL,'2021-03-07 02:29:02'),
	(517,1,'RefreshToken',NULL,'2021-03-07 02:29:02'),
	(518,1,'RefreshToken',NULL,'2021-03-07 02:32:38'),
	(519,1,'RefreshToken',NULL,'2021-03-07 02:32:38'),
	(520,1,'RefreshToken',NULL,'2021-03-07 02:35:30'),
	(521,1,'RefreshToken',NULL,'2021-03-07 02:35:30'),
	(522,1,'RefreshToken',NULL,'2021-03-07 02:39:10'),
	(523,1,'RefreshToken',NULL,'2021-03-07 02:39:10'),
	(524,1,'RefreshToken',NULL,'2021-03-07 02:44:29'),
	(525,1,'RefreshToken',NULL,'2021-03-07 02:44:29'),
	(526,1,'RefreshToken',NULL,'2021-03-07 02:45:33'),
	(527,1,'RefreshToken',NULL,'2021-03-07 02:45:33'),
	(528,1,'RefreshToken',NULL,'2021-03-07 02:47:22'),
	(529,1,'RefreshToken',NULL,'2021-03-07 02:47:22'),
	(530,1,'RefreshToken',NULL,'2021-03-07 02:48:28'),
	(531,1,'RefreshToken',NULL,'2021-03-07 02:48:28'),
	(532,1,'RefreshToken',NULL,'2021-03-07 02:50:45'),
	(533,1,'RefreshToken',NULL,'2021-03-07 02:51:55'),
	(534,1,'RefreshToken',NULL,'2021-03-07 02:51:55'),
	(535,1,'RefreshToken',NULL,'2021-03-07 02:53:48'),
	(536,1,'RefreshToken',NULL,'2021-03-07 02:53:48'),
	(537,1,'RefreshToken',NULL,'2021-03-07 02:55:07'),
	(538,1,'RefreshToken',NULL,'2021-03-07 02:55:07'),
	(539,1,'RefreshToken',NULL,'2021-03-07 02:56:13'),
	(540,1,'RefreshToken',NULL,'2021-03-07 03:02:01'),
	(541,1,'RefreshToken',NULL,'2021-03-07 03:03:38'),
	(542,1,'RefreshToken',NULL,'2021-03-07 03:03:38'),
	(543,1,'RefreshToken',NULL,'2021-03-07 03:20:16'),
	(544,1,'RefreshToken',NULL,'2021-03-07 10:47:24'),
	(545,1,'RefreshToken',NULL,'2021-03-07 10:48:46'),
	(546,1,'RefreshToken',NULL,'2021-03-07 10:50:23'),
	(547,1,'RefreshToken',NULL,'2021-03-07 11:01:42'),
	(548,1,'RefreshToken',NULL,'2021-03-07 11:01:42'),
	(549,1,'RefreshToken',NULL,'2021-03-07 11:02:58'),
	(550,1,'RefreshToken',NULL,'2021-03-07 11:02:58'),
	(551,1,'RefreshToken',NULL,'2021-03-07 11:04:08'),
	(552,1,'RefreshToken',NULL,'2021-03-07 11:04:08'),
	(553,1,'RefreshToken',NULL,'2021-03-07 11:05:09'),
	(554,1,'RefreshToken',NULL,'2021-03-07 11:08:15'),
	(555,1,'RefreshToken',NULL,'2021-03-07 11:08:15'),
	(556,1,'RefreshToken',NULL,'2021-03-07 11:09:51'),
	(557,1,'RefreshToken',NULL,'2021-03-07 11:11:06'),
	(558,1,'RefreshToken',NULL,'2021-03-07 11:11:06'),
	(559,1,'RefreshToken',NULL,'2021-03-07 11:12:12'),
	(560,1,'Login',NULL,'2021-03-07 11:12:23'),
	(561,1,'RefreshToken',NULL,'2021-03-07 11:14:06'),
	(562,1,'Login',NULL,'2021-03-07 11:14:17'),
	(563,1,'RefreshToken',NULL,'2021-03-07 11:15:21'),
	(564,1,'RefreshToken',NULL,'2021-03-07 11:18:06'),
	(565,1,'RefreshToken',NULL,'2021-03-07 11:18:06'),
	(566,1,'RefreshToken',NULL,'2021-03-07 11:19:18'),
	(567,1,'RefreshToken',NULL,'2021-03-07 11:20:21'),
	(568,1,'RefreshToken',NULL,'2021-03-07 11:20:21'),
	(569,1,'RefreshToken',NULL,'2021-03-07 11:22:01'),
	(570,1,'RefreshToken',NULL,'2021-03-07 11:22:01'),
	(571,1,'RefreshToken',NULL,'2021-03-07 11:28:57'),
	(572,1,'RefreshToken',NULL,'2021-03-07 11:29:58'),
	(573,1,'RefreshToken',NULL,'2021-03-07 11:32:44'),
	(574,1,'RefreshToken',NULL,'2021-03-07 11:32:44'),
	(575,1,'RefreshToken',NULL,'2021-03-07 11:36:25'),
	(576,1,'RefreshToken',NULL,'2021-03-07 11:36:25'),
	(577,1,'RefreshToken',NULL,'2021-03-07 11:37:38'),
	(578,1,'RefreshToken',NULL,'2021-03-07 11:37:38'),
	(579,1,'RefreshToken',NULL,'2021-03-07 11:39:06'),
	(580,1,'RefreshToken',NULL,'2021-03-07 11:42:30'),
	(581,1,'RefreshToken',NULL,'2021-03-07 11:42:30'),
	(582,1,'RefreshToken',NULL,'2021-03-07 11:43:30'),
	(583,1,'RefreshToken',NULL,'2021-03-07 11:45:00'),
	(584,1,'RefreshToken',NULL,'2021-03-07 11:45:00'),
	(585,1,'RefreshToken',NULL,'2021-03-07 11:46:08'),
	(586,1,'RefreshToken',NULL,'2021-03-07 11:48:08'),
	(587,1,'RefreshToken',NULL,'2021-03-07 11:49:12'),
	(588,1,'RefreshToken',NULL,'2021-03-07 11:49:12'),
	(589,1,'RefreshToken',NULL,'2021-03-07 11:52:15'),
	(590,1,'RefreshToken',NULL,'2021-03-07 11:52:15'),
	(591,1,'RefreshToken',NULL,'2021-03-07 11:53:58'),
	(592,1,'RefreshToken',NULL,'2021-03-07 11:53:58'),
	(593,1,'RefreshToken',NULL,'2021-03-07 11:54:59'),
	(594,1,'RefreshToken',NULL,'2021-03-07 11:56:44'),
	(595,1,'RefreshToken',NULL,'2021-03-07 11:56:44'),
	(596,1,'RefreshToken',NULL,'2021-03-07 11:59:25'),
	(597,1,'RefreshToken',NULL,'2021-03-07 11:59:25'),
	(598,1,'RefreshToken',NULL,'2021-03-07 12:00:32'),
	(599,1,'RefreshToken',NULL,'2021-03-07 12:00:32'),
	(600,1,'RefreshToken',NULL,'2021-03-07 12:01:32'),
	(601,1,'RefreshToken',NULL,'2021-03-07 12:02:36'),
	(602,1,'RefreshToken',NULL,'2021-03-07 12:02:36'),
	(603,1,'RefreshToken',NULL,'2021-03-07 12:03:39'),
	(604,1,'RefreshToken',NULL,'2021-03-07 12:05:00'),
	(605,1,'RefreshToken',NULL,'2021-03-07 12:05:00'),
	(606,1,'RefreshToken',NULL,'2021-03-07 12:06:10'),
	(607,1,'RefreshToken',NULL,'2021-03-07 12:08:53'),
	(608,1,'RefreshToken',NULL,'2021-03-07 12:08:53'),
	(609,1,'RefreshToken',NULL,'2021-03-07 12:10:46'),
	(610,1,'RefreshToken',NULL,'2021-03-07 12:10:46'),
	(611,1,'RefreshToken',NULL,'2021-03-07 12:11:52'),
	(612,1,'RefreshToken',NULL,'2021-03-07 12:12:57'),
	(613,1,'RefreshToken',NULL,'2021-03-07 12:15:27'),
	(614,1,'RefreshToken',NULL,'2021-03-07 12:16:28'),
	(615,1,'RefreshToken',NULL,'2021-03-07 12:22:03'),
	(616,1,'Login',NULL,'2021-03-07 12:30:04'),
	(617,1,'RefreshToken',NULL,'2021-03-07 12:32:11'),
	(618,1,'RefreshToken',NULL,'2021-03-07 12:51:26'),
	(619,1,'RefreshToken',NULL,'2021-03-07 12:51:26'),
	(620,1,'RefreshToken',NULL,'2021-03-07 13:00:50'),
	(621,1,'RefreshToken',NULL,'2021-03-07 13:05:45'),
	(622,1,'RefreshToken',NULL,'2021-03-07 13:05:45'),
	(623,1,'RefreshToken',NULL,'2021-03-07 13:06:46');

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
	(1,'admin','MALE','John','Doe','ACTIVE','2021-03-07 13:06:46',0,NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
