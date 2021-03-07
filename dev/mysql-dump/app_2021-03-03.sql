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


/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;


# Dump of table navigation_navigations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `navigation_navigations`;

CREATE TABLE `navigation_navigations`
(
    `navigation_id` int(11) unsigned NOT NULL,
    `child_id`      int(11) unsigned NOT NULL,
    KEY `navigation_id` (`navigation_id`),
    KEY `child_id` (`child_id`),
    CONSTRAINT `navigation_navigations_ibfk_1` FOREIGN KEY (`navigation_id`) REFERENCES `navigations` (`id`),
    CONSTRAINT `navigation_navigations_ibfk_2` FOREIGN KEY (`child_id`) REFERENCES `navigations` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

LOCK TABLES `navigation_navigations` WRITE;
/*!40000 ALTER TABLE `navigation_navigations`
    DISABLE KEYS */;

INSERT INTO `navigation_navigations` (`navigation_id`, `child_id`)
VALUES (46, 40),
       (46, 41),
       (46, 42),
       (46, 43);

/*!40000 ALTER TABLE `navigation_navigations`
    ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table navigations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `navigations`;

CREATE TABLE `navigations`
(
    `id`       int(11) unsigned NOT NULL AUTO_INCREMENT,
    `route_id` int(10) unsigned DEFAULT NULL,
    `title`    varchar(100)     NOT NULL,
    `icon`     varchar(100)     DEFAULT NULL,
    `position` int(11)          NOT NULL,
    `note`     varchar(20)      DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `url` (`route_id`),
    CONSTRAINT `navigations_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

LOCK TABLES `navigations` WRITE;
/*!40000 ALTER TABLE `navigations`
    DISABLE KEYS */;

INSERT INTO `navigations` (`id`, `route_id`, `title`, `icon`, `position`, `note`)
VALUES (40, 47, 'Roles', 'mdi-ab-testing', 0, NULL),
       (41, 50, 'Routes', NULL, 1, NULL),
       (42, 52, 'Navigation', NULL, 2, NULL),
       (43, 54, 'Accounts', NULL, 3, NULL),
       (46, NULL, 'Settings', 'mdi-cog-outline', 3, NULL),
       (51, 55, 'Test', NULL, 1, NULL);

/*!40000 ALTER TABLE `navigations`
    ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table refresh_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `refresh_tokens`;

CREATE TABLE `refresh_tokens`
(
    `id`      int(10) unsigned NOT NULL AUTO_INCREMENT,
    `token`   varchar(250)     NOT NULL DEFAULT '',
    `user_id` int(11) unsigned NOT NULL,
    `expire`  datetime         NOT NULL,
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`),
    CONSTRAINT `refresh_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;



# Dump of table role_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_roles`;

CREATE TABLE `role_roles`
(
    `role_id`  int(11) unsigned NOT NULL,
    `child_id` int(11) unsigned NOT NULL,
    KEY `role_id` (`role_id`),
    KEY `child_id` (`child_id`),
    CONSTRAINT `role_roles_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
    CONSTRAINT `role_roles_ibfk_2` FOREIGN KEY (`child_id`) REFERENCES `roles` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;



# Dump of table role_routes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_routes`;

CREATE TABLE `role_routes`
(
    `id`         int(11) unsigned NOT NULL AUTO_INCREMENT,
    `role_id`    int(11) unsigned NOT NULL,
    `route_id`   int(10) unsigned NOT NULL,
    `route_type` varchar(100)     NOT NULL DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

LOCK TABLES `role_routes` WRITE;
/*!40000 ALTER TABLE `role_routes`
    DISABLE KEYS */;

INSERT INTO `role_routes` (`id`, `role_id`, `route_id`, `route_type`)
VALUES (2, 1, 46, 'Backend'),
       (3, 1, 47, 'Frontend'),
       (4, 1, 48, 'Backend'),
       (20, 1, 49, 'Backend'),
       (21, 1, 50, 'Frontend'),
       (22, 1, 51, 'Backend'),
       (23, 1, 52, 'Frontend'),
       (24, 1, 54, 'Frontend'),
       (25, 1, 53, 'Backend'),
       (26, 1, 40, 'Backend'),
       (28, 1, 64, 'Backend'),
       (29, 1, 65, 'Backend'),
       (30, 1, 66, 'Backend'),
       (31, 1, 67, 'Frontend'),
       (32, 1, 68, 'Frontend'),
       (33, 1, 69, 'Frontend'),
       (34, 1, 70, 'Backend'),
       (35, 1, 71, 'Backend'),
       (36, 1, 72, 'Backend'),
       (37, 1, 74, 'Backend'),
       (38, 1, 75, 'Frontend'),
       (39, 1, 55, 'Frontend'),
       (40, 1, 82, 'Backend');

/*!40000 ALTER TABLE `role_routes`
    ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles`
(
    `id`          int(11) unsigned NOT NULL AUTO_INCREMENT,
    `name`        varchar(250)     NOT NULL DEFAULT '',
    `description` varchar(250)              DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles`
    DISABLE KEYS */;

INSERT INTO `roles` (`id`, `name`, `description`)
VALUES (1, 'Admin', NULL);

/*!40000 ALTER TABLE `roles`
    ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table routes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `routes`;

CREATE TABLE `routes`
(
    `id`         int(11) unsigned                                           NOT NULL AUTO_INCREMENT,
    `name`       varchar(250)                                               NOT NULL DEFAULT '',
    `pattern`    varchar(250)                                               NOT NULL DEFAULT '',
    `public`     tinyint(1)                                                 NOT NULL DEFAULT '0',
    `frontend`   tinyint(1)                                                 NOT NULL DEFAULT '0',
    `created_at` datetime                                                            DEFAULT NULL,
    `updated_at` datetime                                                            DEFAULT NULL,
    `deleted_at` datetime                                                            DEFAULT NULL,
    `method`     set ('DELETE','GET','HEAD','OPTIONS','PATCH','POST','PUT') NOT NULL DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes`
    DISABLE KEYS */;

INSERT INTO `routes` (`id`, `name`, `pattern`, `public`, `frontend`, `created_at`, `updated_at`, `deleted_at`, `method`)
VALUES (37, '', '/favicon.ico', 1, 0, '2021-02-11 16:15:08', '2021-02-21 17:44:32', NULL, 'GET'),
       (41, 'auth.Controller::Login', '/login', 1, 0, '2021-02-12 13:39:41', '2021-02-16 14:23:50', NULL,
        'OPTIONS,POST'),
       (43, 'auth.Controller::Logout', '/logout', 0, 0, '2021-02-19 18:18:20', NULL, NULL, 'GET,OPTIONS'),
       (46, 'auth.Controller::Navigation', '/navigation', 0, 0, '2021-02-21 15:48:18', '2021-02-21 15:52:17', NULL,
        'GET,OPTIONS'),
       (47, 'Roles', '/dash/roles', 0, 1, NULL, '2021-02-21 15:52:17', NULL, ''),
       (48, 'auth.Controller::Roles', '/settings/roles/*grid', 0, 0, '2021-02-21 15:48:18', '2021-02-21 15:52:17', NULL,
        'DELETE,GET,HEAD,OPTIONS,PATCH,POST,PUT'),
       (49, 'auth.Controller::Routes', '/settings/routes/*grid', 0, 0, '2021-02-21 17:38:09', NULL, NULL,
        'DELETE,GET,HEAD,OPTIONS,PATCH,POST,PUT'),
       (50, 'Routes', '/dash/routes', 0, 1, NULL, NULL, NULL, ''),
       (51, 'auth.Controller::Nav', '/settings/navigations/*grid', 0, 0, '2021-02-21 17:49:58', NULL, NULL,
        'DELETE,GET,HEAD,OPTIONS,PATCH,POST,PUT'),
       (52, 'Navigation', '/dash/navigation', 0, 1, '2021-02-21 17:50:54', NULL, NULL, ''),
       (53, 'auth.Controller::Accounts', '/settings/accounts/*grid', 0, 0, '2021-02-21 18:45:12', NULL, NULL,
        'DELETE,GET,HEAD,OPTIONS,PATCH,POST,PUT'),
       (54, 'Accounts', '/dash/accounts', 0, 1, '2021-02-21 18:46:26', NULL, NULL, ''),
       (55, 'Test', '/dash/test', 0, 1, '2021-02-22 08:58:21', NULL, NULL, ''),
       (81, 'controller.TestController::Test', '/test/*grid', 1, 0, '2021-02-25 09:39:39', NULL, NULL,
        'DELETE,GET,HEAD,OPTIONS,PATCH,POST,PUT'),
       (82, 'controller.TestController::Test', '/test2', 0, 0, '2021-02-25 09:39:39', NULL, NULL,
        'DELETE,GET,HEAD,OPTIONS,PATCH,POST,PUT');

/*!40000 ALTER TABLE `routes`
    ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tests
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tests`;

CREATE TABLE `tests`
(
    `id`   int(11) unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(100)     NOT NULL DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;



# Dump of table user_options
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_options`;

CREATE TABLE `user_options`
(
    `id`      int(11) unsigned NOT NULL AUTO_INCREMENT,
    `user_id` int(10) unsigned NOT NULL,
    `key`     varchar(250)     NOT NULL DEFAULT '',
    `value`   varchar(250)     NOT NULL DEFAULT '',
    `hide`    tinyint(1)       NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

LOCK TABLES `user_options` WRITE;
/*!40000 ALTER TABLE `user_options`
    DISABLE KEYS */;

INSERT INTO `user_options` (`id`, `user_id`, `key`, `value`, `hide`)
VALUES (2, 1, 'phone', '111-222-333', 0),
       (3, 1, 'password', '$2y$12$H3ff2uvKlcbBhfFtFy.qZesaf7weSXZpYRexZHLxZ4jjsw.NlqHSu ', 1);

/*!40000 ALTER TABLE `user_options`
    ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_protocols
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_protocols`;

CREATE TABLE `user_protocols`
(
    `id`         int(11) unsigned NOT NULL AUTO_INCREMENT,
    `user_id`    int(10) unsigned NOT NULL,
    `key`        varchar(250)     NOT NULL DEFAULT '',
    `value`      varchar(250)              DEFAULT NULL,
    `created_at` datetime                  DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

LOCK TABLES `user_protocols` WRITE;
/*!40000 ALTER TABLE `user_protocols`
    DISABLE KEYS */;

INSERT INTO `user_protocols` (`id`, `user_id`, `key`, `value`, `created_at`)
VALUES (1, 1, 'RefreshTokenInvalid', NULL, '2021-03-03 14:52:36'),
       (2, 1, 'RefreshTokenInvalid', NULL, '2021-03-03 14:52:41'),
       (3, 1, 'RefreshTokenInvalid', NULL, '2021-03-03 14:53:34'),
       (4, 1, 'Login', NULL, '2021-03-03 14:53:39'),
       (5, 1, 'RefreshToken', NULL, '2021-03-03 14:55:27');

/*!40000 ALTER TABLE `user_protocols`
    ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_roles`;

CREATE TABLE `user_roles`
(
    `user_id` int(11) unsigned NOT NULL,
    `role_id` int(11) unsigned NOT NULL,
    KEY `user_id` (`user_id`),
    KEY `role_id` (`role_id`),
    CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
    CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles`
    DISABLE KEYS */;

INSERT INTO `user_roles` (`user_id`, `role_id`)
VALUES (1, 1);

/*!40000 ALTER TABLE `user_roles`
    ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users`
(
    `id`                int(11) unsigned       NOT NULL AUTO_INCREMENT,
    `login`             varchar(250)           NOT NULL DEFAULT '',
    `salutation`        enum ('MALE','FEMALE') NOT NULL,
    `name`              varchar(250)                    DEFAULT NULL,
    `surname`           varchar(250)                    DEFAULT NULL,
    `state`             varchar(250)           NOT NULL DEFAULT '',
    `last_login`        datetime                        DEFAULT NULL,
    `failed_logins`     tinyint(11)                     DEFAULT NULL,
    `last_failed_login` datetime                        DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users`
    DISABLE KEYS */;

INSERT INTO `users` (`id`, `login`, `salutation`, `name`, `surname`, `state`, `last_login`, `failed_logins`,
                     `last_failed_login`)
VALUES (1, 'admin', 'MALE', 'John', 'Doe', 'ACTIVE', '2021-03-03 14:55:27', 0, NULL);

/*!40000 ALTER TABLE `users`
    ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `translations`;

CREATE TABLE `translations`
(
    `id`          int(11) unsigned NOT NULL AUTO_INCREMENT,
    `message_id`  varchar(250)     NOT NULL DEFAULT '',
    `lang`        varchar(10)      NOT NULL DEFAULT '',
    `description` varchar(250)              DEFAULT NULL,
    `zero`        varchar(250)              DEFAULT NULL,
    `one`         varchar(250)              DEFAULT NULL,
    `two`         varchar(250)              DEFAULT NULL,
    `few`         varchar(250)              DEFAULT NULL,
    `many`        varchar(250)              DEFAULT NULL,
    `other`       varchar(500)              DEFAULT NULL,
    `created_at`  datetime                  DEFAULT NULL,
    `updated_at`  datetime                  DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations`
    DISABLE KEYS */;

INSERT INTO `translations` (`id`, `message_id`, `lang`, `description`, `zero`, `one`, `two`, `few`, `many`, `other`,
                            `created_at`, `updated_at`)
VALUES (834, 'GRID.NoData', 'raw', 'Text if no data is available.', NULL, NULL, NULL, NULL, NULL, 'No data',
        '2021-03-05 17:10:14', '2021-03-07 11:08:09'),
       (836, 'GRID.RowsPerPage', 'raw', 'Pagination info', NULL, NULL, NULL, NULL, NULL, 'Rows per page',
        '2021-03-05 17:10:14', '2021-03-07 11:08:09'),
       (837, 'GRID.XofY', 'raw', 'Pagination info', NULL, NULL, NULL, NULL, NULL, 'of', '2021-03-05 17:10:14',
        '2021-03-07 11:08:09'),
       (839, 'GRID.ItemDeleted', 'raw', 'Alert text after a item got deleted.', NULL, NULL, NULL, NULL, NULL,
        'Item deleted!', '2021-03-05 17:10:14', '2021-03-07 11:08:09'),
       (925, 'COMMON.Language', 'raw', NULL, NULL, NULL, NULL, NULL, NULL, 'Language', '2021-03-06 14:44:29',
        '2021-03-07 11:01:35'),
       (926, 'COMMON.Add', 'raw', NULL, NULL, NULL, NULL, NULL, NULL, 'Add', '2021-03-06 14:44:29',
        '2021-03-07 11:01:35'),
       (927, 'COMMON.Save', 'raw', NULL, NULL, NULL, NULL, NULL, NULL, 'Save', '2021-03-06 14:44:29',
        '2021-03-07 11:01:35'),
       (928, 'COMMON.Close', 'raw', NULL, NULL, NULL, NULL, NULL, NULL, 'Close', '2021-03-06 14:44:29',
        '2021-03-07 11:01:35'),
       (929, 'COMMON.Delete', 'raw', NULL, NULL, NULL, NULL, NULL, NULL, 'Delete', '2021-03-06 14:44:29',
        '2021-03-07 11:01:35'),
       (930, 'COMMON.DeleteItem', 'raw', NULL, NULL, NULL, NULL, NULL, NULL, 'Are you sure to delete this item?',
        '2021-03-06 14:44:29', '2021-03-07 11:01:35'),
       (931, 'COMMON.NoChanges', 'raw', NULL, NULL, NULL, NULL, NULL, NULL, 'The form has no changes!',
        '2021-03-06 14:44:29', '2021-03-07 11:01:35'),
       (951, 'ORM.controller.Test.ID', 'raw', 'Field ID of model controller.Test', NULL, NULL, NULL, NULL, NULL, 'ID',
        '2021-03-06 23:28:40', '2021-03-06 23:33:16'),
       (952, 'ORM.controller.Test.Name', 'raw', 'Field Name of model controller.Test', NULL, NULL, NULL, NULL, NULL,
        'Name', '2021-03-06 23:28:40', '2021-03-06 23:33:16'),
       (954, 'NAVIGATION.Accounts', 'raw', 'Navigation endpoint of Accounts (/dash/accounts)', NULL, NULL, NULL, NULL,
        NULL, 'Accounts', '2021-03-07 00:08:17', '2021-03-07 00:13:00'),
       (955, 'NAVIGATION.Navigation', 'raw', 'Navigation endpoint of Navigation (/dash/navigation)', NULL, NULL, NULL,
        NULL, NULL, 'Navigation', '2021-03-07 00:08:17', '2021-03-07 00:13:00'),
       (956, 'NAVIGATION.Roles', 'raw', 'Navigation endpoint of Roles (/dash/roles)', NULL, NULL, NULL, NULL, NULL,
        'Roles', '2021-03-07 00:08:17', '2021-03-07 00:13:00'),
       (957, 'NAVIGATION.Routes', 'raw', 'Navigation endpoint of Routes (/dash/routes)', NULL, NULL, NULL, NULL, NULL,
        'Routes', '2021-03-07 00:08:17', '2021-03-07 00:13:00'),
       (958, 'NAVIGATION.Settings', 'raw', 'Navigation endpoint of Settings', NULL, NULL, NULL, NULL, NULL, 'Settings',
        '2021-03-07 00:08:17', NULL),
       (959, 'NAVIGATION.Test', 'raw', 'Navigation endpoint of Test (/dash/test)', NULL, NULL, NULL, NULL, NULL, 'Test',
        '2021-03-07 00:08:17', '2021-03-07 00:13:00'),
       (960, 'NAVIGATION.Translation', 'raw', 'Navigation endpoint of Translation (/dash/translation)', NULL, NULL,
        NULL, NULL, NULL, 'Translation', '2021-03-07 00:08:17', '2021-03-07 00:13:00'),
       (997, 'CONTROLLER.auth.Controller.Accounts.Description', 'raw',
        'Description of controller auth.Controller action Accounts', NULL, NULL, NULL, NULL, NULL,
        'Description of Accounts', '2021-03-07 00:34:40', NULL),
       (998, 'CONTROLLER.auth.Controller.Accounts.Title', 'raw', 'Title of controller auth.Controller action Accounts',
        NULL, NULL, NULL, NULL, NULL, 'Accounts', '2021-03-07 00:34:40', NULL),
       (999, 'CONTROLLER.auth.Controller.Login.Description', 'raw',
        'Description of controller auth.Controller action Login', NULL, NULL, NULL, NULL, NULL, 'Description of Login',
        '2021-03-07 00:34:40', NULL),
       (1000, 'CONTROLLER.auth.Controller.Login.Title', 'raw', 'Title of controller auth.Controller action Login', NULL,
        NULL, NULL, NULL, NULL, 'Login', '2021-03-07 00:34:40', NULL),
       (1001, 'CONTROLLER.auth.Controller.Logout.Description', 'raw',
        'Description of controller auth.Controller action Logout', NULL, NULL, NULL, NULL, NULL,
        'Description of Logout', '2021-03-07 00:34:40', NULL),
       (1002, 'CONTROLLER.auth.Controller.Logout.Title', 'raw', 'Title of controller auth.Controller action Logout',
        NULL, NULL, NULL, NULL, NULL, 'Logout', '2021-03-07 00:34:40', NULL),
       (1003, 'CONTROLLER.auth.Controller.Nav.Description', 'raw',
        'Description of controller auth.Controller action Nav', NULL, NULL, NULL, NULL, NULL, 'Description of Nav',
        '2021-03-07 00:34:40', NULL),
       (1004, 'CONTROLLER.auth.Controller.Nav.Title', 'raw', 'Title of controller auth.Controller action Nav', NULL,
        NULL, NULL, NULL, NULL, 'Nav', '2021-03-07 00:34:40', NULL),
       (1005, 'CONTROLLER.auth.Controller.Navigation.Description', 'raw',
        'Description of controller auth.Controller action Navigation', NULL, NULL, NULL, NULL, NULL,
        'Description of Navigation', '2021-03-07 00:34:40', NULL),
       (1006, 'CONTROLLER.auth.Controller.Navigation.Title', 'raw',
        'Title of controller auth.Controller action Navigation', NULL, NULL, NULL, NULL, NULL, 'Navigation',
        '2021-03-07 00:34:40', NULL),
       (1007, 'CONTROLLER.auth.Controller.Roles.Description', 'raw',
        'Description of controller auth.Controller action Roles', NULL, NULL, NULL, NULL, NULL, 'Description of Roles',
        '2021-03-07 00:34:40', NULL),
       (1008, 'CONTROLLER.auth.Controller.Roles.Title', 'raw', 'Title of controller auth.Controller action Roles', NULL,
        NULL, NULL, NULL, NULL, 'Roles', '2021-03-07 00:34:40', NULL),
       (1009, 'CONTROLLER.auth.Controller.Routes.Description', 'raw',
        'Description of controller auth.Controller action Routes', NULL, NULL, NULL, NULL, NULL,
        'Description of Routes', '2021-03-07 00:34:40', NULL),
       (1010, 'CONTROLLER.auth.Controller.Routes.Title', 'raw', 'Title of controller auth.Controller action Routes',
        NULL, NULL, NULL, NULL, NULL, 'Routes', '2021-03-07 00:34:40', NULL),
       (1011, 'CONTROLLER.controller.TestController.Test.Description', 'raw',
        'Description of controller controller.TestController action Test', NULL, NULL, NULL, NULL, NULL,
        'Description of Test', '2021-03-07 00:34:40', NULL),
       (1012, 'CONTROLLER.controller.TestController.Test.Title', 'raw',
        'Title of controller controller.TestController action Test', NULL, NULL, NULL, NULL, NULL, 'Test',
        '2021-03-07 00:34:40', NULL),
       (1013, 'CONTROLLER.locale.Controller.Translation.Description', 'raw',
        'Description of controller locale.Controller action Translation', NULL, NULL, NULL, NULL, NULL,
        'Description of Translation', '2021-03-07 00:34:40', NULL),
       (1014, 'CONTROLLER.locale.Controller.Translation.Title', 'raw',
        'Title of controller locale.Controller action Translation', NULL, NULL, NULL, NULL, NULL, 'Translation',
        '2021-03-07 00:34:40', NULL),
       (1015, 'CONTROLLER.locale.Controller.Translation.AddLanguage', 'raw', NULL, NULL, NULL, NULL, NULL, NULL,
        'Add language', '2021-03-07 00:40:30', '2021-03-07 00:50:06'),
       (1016, 'CONTROLLER.locale.Controller.Translation.ID', 'raw', NULL, NULL, NULL, NULL, NULL, NULL, 'ID',
        '2021-03-07 00:40:30', '2021-03-07 00:50:06'),
       (1017, 'CONTROLLER.locale.Controller.Translation.Translation', 'raw', NULL, NULL, NULL, NULL, NULL, NULL,
        'Translation', '2021-03-07 00:40:30', '2021-03-07 00:50:06'),
       (1030, 'COMMON.Back', 'raw', NULL, NULL, NULL, NULL, NULL, NULL, 'Back', '2021-03-07 11:01:35', NULL),
       (1031, 'COMMON.Export', 'raw', NULL, NULL, NULL, NULL, NULL, NULL, 'Export', '2021-03-07 11:01:35', NULL),
       (1032, 'COMMON.NotValid', 'raw', NULL, NULL, NULL, NULL, NULL, NULL, 'The form is not valid!',
        '2021-03-07 11:01:35', NULL),
       (1033, 'GRID.LoadingData', 'raw', 'Text while the data is fetched.', NULL, NULL, NULL, NULL, NULL,
        'Loading data...', '2021-03-07 11:01:35', '2021-03-07 11:08:09'),
       (1034, 'GRID.ItemSaved', 'raw', 'Alert text after a item got saved.', NULL, NULL, NULL, NULL, NULL,
        'Item saved!', '2021-03-07 11:11:01', NULL),
       (1039, 'ORM.auth.Navigation.ID', 'raw', 'Field ID of model auth.Navigation', NULL, NULL, NULL, NULL, NULL, 'ID',
        '2021-03-07 11:52:10', NULL),
       (1040, 'ORM.auth.Navigation.Icon', 'raw', 'Field Icon of model auth.Navigation', NULL, NULL, NULL, NULL, NULL,
        'Icon', '2021-03-07 11:52:10', NULL),
       (1041, 'ORM.auth.Navigation.Note', 'raw', 'Field Note of model auth.Navigation', NULL, NULL, NULL, NULL, NULL,
        'Note', '2021-03-07 11:52:10', NULL),
       (1042, 'ORM.auth.Navigation.Position', 'raw', 'Field Position of model auth.Navigation', NULL, NULL, NULL, NULL,
        NULL, 'Position', '2021-03-07 11:52:10', NULL),
       (1043, 'ORM.auth.Navigation.RouteID', 'raw', 'Field RouteID of model auth.Navigation', NULL, NULL, NULL, NULL,
        NULL, 'RouteID', '2021-03-07 11:52:10', NULL),
       (1044, 'ORM.auth.Navigation.Title', 'raw', 'Field Title of model auth.Navigation', NULL, NULL, NULL, NULL, NULL,
        'Title', '2021-03-07 11:52:10', NULL),
       (1045, 'ORM.auth.Role.Description', 'raw', 'Field Description of model auth.Role', NULL, NULL, NULL, NULL, NULL,
        'Description', '2021-03-07 11:52:10', NULL),
       (1046, 'ORM.auth.Role.ID', 'raw', 'Field ID of model auth.Role', NULL, NULL, NULL, NULL, NULL, 'ID',
        '2021-03-07 11:52:10', NULL),
       (1047, 'ORM.auth.Role.Name', 'raw', 'Field Name of model auth.Role', NULL, NULL, NULL, NULL, NULL, 'Name',
        '2021-03-07 11:52:10', NULL),
       (1048, 'ORM.auth.User.FailedLogins', 'raw', 'Field FailedLogins of model auth.User', NULL, NULL, NULL, NULL,
        NULL, 'FailedLogins', '2021-03-07 11:52:10', NULL),
       (1049, 'ORM.auth.User.ID', 'raw', 'Field ID of model auth.User', NULL, NULL, NULL, NULL, NULL, 'ID',
        '2021-03-07 11:52:10', NULL),
       (1050, 'ORM.auth.User.LastFailedLogin', 'raw', 'Field LastFailedLogin of model auth.User', NULL, NULL, NULL,
        NULL, NULL, 'LastFailedLogin', '2021-03-07 11:52:10', NULL),
       (1051, 'ORM.auth.User.LastLogin', 'raw', 'Field LastLogin of model auth.User', NULL, NULL, NULL, NULL, NULL,
        'LastLogin', '2021-03-07 11:52:10', NULL),
       (1052, 'ORM.auth.User.Login', 'raw', 'Field Login of model auth.User', NULL, NULL, NULL, NULL, NULL, 'Login',
        '2021-03-07 11:52:10', NULL),
       (1053, 'ORM.auth.User.Name', 'raw', 'Field Name of model auth.User', NULL, NULL, NULL, NULL, NULL, 'Name',
        '2021-03-07 11:52:10', NULL),
       (1054, 'ORM.auth.User.Salutation', 'raw', 'Field Salutation of model auth.User', NULL, NULL, NULL, NULL, NULL,
        'Salutation', '2021-03-07 11:52:10', NULL),
       (1055, 'ORM.auth.User.State', 'raw', 'Field State of model auth.User', NULL, NULL, NULL, NULL, NULL, 'State',
        '2021-03-07 11:52:10', NULL),
       (1056, 'ORM.auth.User.Surname', 'raw', 'Field Surname of model auth.User', NULL, NULL, NULL, NULL, NULL,
        'Surname', '2021-03-07 11:52:10', NULL),
       (1057, 'ORM.server.Route.CreatedAt', 'raw', 'Field CreatedAt of model server.Route', NULL, NULL, NULL, NULL,
        NULL, 'CreatedAt', '2021-03-07 11:52:10', NULL),
       (1058, 'ORM.server.Route.DeletedAt', 'raw', 'Field DeletedAt of model server.Route', NULL, NULL, NULL, NULL,
        NULL, 'DeletedAt', '2021-03-07 11:52:10', NULL),
       (1059, 'ORM.server.Route.Frontend', 'raw', 'Field Frontend of model server.Route', NULL, NULL, NULL, NULL, NULL,
        'Frontend', '2021-03-07 11:52:10', NULL),
       (1060, 'ORM.server.Route.ID', 'raw', 'Field ID of model server.Route', NULL, NULL, NULL, NULL, NULL, 'ID',
        '2021-03-07 11:52:10', NULL),
       (1061, 'ORM.server.Route.Method', 'raw', 'Field Method of model server.Route', NULL, NULL, NULL, NULL, NULL,
        'Method', '2021-03-07 11:52:10', NULL),
       (1062, 'ORM.server.Route.Name', 'raw', 'Field Name of model server.Route', NULL, NULL, NULL, NULL, NULL, 'Name',
        '2021-03-07 11:52:10', NULL),
       (1063, 'ORM.server.Route.Pattern', 'raw', 'Field Pattern of model server.Route', NULL, NULL, NULL, NULL, NULL,
        'Pattern', '2021-03-07 11:52:10', NULL),
       (1064, 'ORM.server.Route.Public', 'raw', 'Field Public of model server.Route', NULL, NULL, NULL, NULL, NULL,
        'Public', '2021-03-07 11:52:10', NULL),
       (1065, 'ORM.server.Route.UpdatedAt', 'raw', 'Field UpdatedAt of model server.Route', NULL, NULL, NULL, NULL,
        NULL, 'UpdatedAt', '2021-03-07 11:52:10', NULL),
       (1066, 'ORM.auth.Navigation.Children', 'raw', 'Field Children of model auth.Navigation', NULL, NULL, NULL, NULL,
        NULL, 'Children', '2021-03-07 11:56:41', NULL),
       (1067, 'ORM.auth.Navigation.Route', 'raw', 'Field Route of model auth.Navigation', NULL, NULL, NULL, NULL, NULL,
        'Route', '2021-03-07 11:56:41', NULL),
       (1068, 'ORM.auth.Role.Backend', 'raw', 'Field Backend of model auth.Role', NULL, NULL, NULL, NULL, NULL,
        'Backend', '2021-03-07 11:56:41', NULL),
       (1069, 'ORM.auth.Role.Children', 'raw', 'Field Children of model auth.Role', NULL, NULL, NULL, NULL, NULL,
        'Children', '2021-03-07 11:56:41', NULL),
       (1070, 'ORM.auth.Role.Frontend', 'raw', 'Field Frontend of model auth.Role', NULL, NULL, NULL, NULL, NULL,
        'Frontend', '2021-03-07 11:56:41', NULL),
       (1071, 'ORM.auth.User.Options', 'raw', 'Field Options of model auth.User', NULL, NULL, NULL, NULL, NULL,
        'Options', '2021-03-07 11:56:41', NULL),
       (1072, 'ORM.auth.User.RefreshTokens', 'raw', 'Field RefreshTokens of model auth.User', NULL, NULL, NULL, NULL,
        NULL, 'RefreshTokens', '2021-03-07 11:56:41', NULL),
       (1073, 'ORM.auth.User.Roles', 'raw', 'Field Roles of model auth.User', NULL, NULL, NULL, NULL, NULL, 'Roles',
        '2021-03-07 11:56:41', NULL),
       (1075, 'COMMON.Add', 'en', NULL, NULL, NULL, NULL, NULL, NULL, 'Add', '2021-03-07 12:16:20', NULL),
       (1076, 'COMMON.Login', 'raw', NULL, NULL, NULL, NULL, NULL, NULL, 'Login', '2021-03-07 12:26:39', NULL),
       (1077, 'COMMON.Password', 'raw', NULL, NULL, NULL, NULL, NULL, NULL, 'Password', '2021-03-07 12:26:39', NULL),
       (1078, 'CONTROLLER.auth.Controller.Login.ErrLoginRequired', 'raw', NULL, NULL, NULL, NULL, NULL, NULL,
        'Login is mandatory', '2021-03-07 12:26:39', NULL),
       (1079, 'CONTROLLER.auth.Controller.Login.ErrPasswordLength', 'raw', NULL, NULL, NULL, NULL, NULL, NULL,
        'Password length min 7 chars.', '2021-03-07 12:26:39', NULL),
       (1080, 'CONTROLLER.auth.Controller.Login.ErrPasswordRequired', 'raw', NULL, NULL, NULL, NULL, NULL, NULL,
        'Password is mandatory', '2021-03-07 12:26:39', NULL),
       (1081, 'CONTROLLER.auth.Controller.Login.Impress', 'raw', NULL, NULL, NULL, NULL, NULL, NULL, ' ',
        '2021-03-07 12:26:39', '2021-03-07 12:29:56'),
       (1082, 'CONTROLLER.auth.Controller.Login.Privacy', 'raw', NULL, NULL, NULL, NULL, NULL, NULL,
        'user admin,pw admin123', '2021-03-07 12:26:39', NULL);

/*!40000 ALTER TABLE `translations`
    ENABLE KEYS */;
UNLOCK TABLES;


/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
