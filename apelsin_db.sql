-- phpMyAdmin SQL Dump
-- version 4.0.7
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Дек 08 2014 г., 08:55
-- Версия сервера: 5.5.33-MariaDB
-- Версия PHP: 5.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `apelsin_db`
--
CREATE DATABASE IF NOT EXISTS `apelsin_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `apelsin_db`;

-- --------------------------------------------------------

--
-- Структура таблицы `ApelsinContactsNavigationPanel`
--

DROP TABLE IF EXISTS `ApelsinContactsNavigationPanel`;
CREATE TABLE IF NOT EXISTS `ApelsinContactsNavigationPanel` (
  `alias` varchar(50) NOT NULL,
  `sequence` int(1) unsigned NOT NULL,
  `htmlFirst` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `classPostfix` varchar(50) NOT NULL,
  PRIMARY KEY (`alias`),
  UNIQUE KEY `sequence_UNIQUE` (`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ApelsinContactsNavigationPanel`
--

INSERT INTO `ApelsinContactsNavigationPanel` (`alias`, `sequence`, `htmlFirst`, `classPostfix`) VALUES
('contacts', 1, 1, 'Contacts'),
('cooperation', 5, 1, 'Cooperation'),
('departments', 3, 1, 'Departments'),
('jobseeker', 4, 1, 'Jobseeker'),
('shops', 2, 1, 'Shops');

-- --------------------------------------------------------

--
-- Структура таблицы `ApelsinContactsNavigationPanel_Lang`
--

DROP TABLE IF EXISTS `ApelsinContactsNavigationPanel_Lang`;
CREATE TABLE IF NOT EXISTS `ApelsinContactsNavigationPanel_Lang` (
  `alias` varchar(50) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `tabName` varchar(50) NOT NULL,
  `html` longtext,
  PRIMARY KEY (`alias`,`lang`),
  KEY `fk_ApelsinContactsNavigationPanel_Lang_2_idx` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ApelsinContactsNavigationPanel_Lang`
--

INSERT INTO `ApelsinContactsNavigationPanel_Lang` (`alias`, `lang`, `tabName`, `html`) VALUES
('contacts', 'eng', 'Contacts', '<div class="ApelsinContactsNavigationPanel_ContactsInfo">\r\n    <div class="ApelsinContactsNavigationPanel_ContactsInfoString ApelsinContactsNavigationPanel_Aderss">\r\n        <dir class="ApelsinContactsNavigationPanel_ContactsInfoText">13 Yesenina str., 390006 Ryazan</dir>\r\n    </div>\r\n    <div class="ApelsinContactsNavigationPanel_ContactsInfoString ApelsinContactsNavigationPanel_PostAderss">\r\n        <dir class="Icon20x20 EmailIcon"></dir>\r\n        <dir class="ApelsinContactsNavigationPanel_ContactsInfoText">13 Yesenina str., 390023 Ryazan, POB 109</dir>\r\n    </div>\r\n    <div class="ApelsinContactsNavigationPanel_ContactsInfoString ApelsinContactsNavigationPanel_Email">\r\n        <dir class="Icon20x20 EmailIcon"></dir>\r\n        <dir class="ApelsinContactsNavigationPanel_ContactsInfoText"><a href="mailto:mail@apelsin.ru">mail@apelsin.ru</a></dir>\r\n    </div>\r\n    <div class="ApelsinContactsNavigationPanel_ContactsInfoString ApelsinContactsNavigationPanel_Phone">\r\n        <dir class="Icon20x20 PhoneIcon"></dir>\r\n        <dir class="ApelsinContactsNavigationPanel_ContactsInfoText"><a href="tel:84912240220">8(4912)240-220</a></dir>\r\n    </div>\r\n    <div class="ApelsinContactsNavigationPanel_ContactsInfoString ApelsinContactsNavigationPanel_Phone">\r\n        <dir class="Icon20x20 PhoneIcon"></dir>\r\n        <dir class="ApelsinContactsNavigationPanel_ContactsInfoText"><a href="tel:84912502020">8(4912)502-020</a></dir>\r\n    </div>\r\n</div>\r\n\r\n<div class="ApelsinContactsNavigationPanel_TableTime">\r\n    <table class="time_table">\r\n        <tbody>\r\n            <tr>\r\n                <td class="time_table_text">MON - FRI</td>\r\n                <td class="time_table_time">09:00 - 20:00</td>\r\n            </tr><tr>\r\n                <td class="time_table_text"><span class="mainDay">SAT</span></td>\r\n                <td class="time_table_time">09:00 - 19:00</td>\r\n            </tr><tr>\r\n                <td class="time_table_text"><span class="mainDay">SUN</span></td>\r\n                <td class="time_table_time">09:00 - 18:00</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n</div>\r\n\r\n<div class="ApelsinContactsNavigationPanel_ContactsText">\r\n<p>If you don''t know whom to address your \r\n    questions, please feel free to contact the \r\n    <a href="./general_enquiries_department/en/">GENERAL ENQUIRIES DEPARTMENT</a> \r\n    via one of the telephone numbers mentioned above. Our secretaries will \r\n    be glad to provide all the necessary information, or forward the call to \r\n    the corresponding specialist.\r\n</p><p>\r\nFor the questions related to our products, \r\n    prices, assortment and stock status, please contact the \r\n    <a href="./sales_department/en/">SALES DEPARTMENT</a> \r\n    via the telephone numbers <span class="main_text">8 (4912) 240-220#555</span>.\r\n</p>\r\n</div>'),
('contacts', 'rus', 'Контакты', '<div class="ApelsinContactsNavigationPanel_ContactsInfo">\r\n    <div class="ApelsinContactsNavigationPanel_ContactsInfoString ApelsinContactsNavigationPanel_Aderss">\r\n        <dir class="ApelsinContactsNavigationPanel_ContactsInfoText">390023 г. Рязань, ул. Есенина, 13</dir>\r\n    </div>\r\n    <div class="ApelsinContactsNavigationPanel_ContactsInfoString ApelsinContactsNavigationPanel_PostAderss">\r\n        <dir class="Icon20x20 EmailIcon"></dir>\r\n        <dir class="ApelsinContactsNavigationPanel_ContactsInfoText">390023 г. Рязань, а/я 109</dir>\r\n    </div>\r\n    <div class="ApelsinContactsNavigationPanel_ContactsInfoString ApelsinContactsNavigationPanel_Email">\r\n        <dir class="Icon20x20 EmailIcon"></dir>\r\n        <dir class="ApelsinContactsNavigationPanel_ContactsInfoText"><a href="mailto:mail@apelsin.ru">mail@apelsin.ru</a></dir>\r\n    </div>\r\n    <div class="ApelsinContactsNavigationPanel_ContactsInfoString ApelsinContactsNavigationPanel_Phone">\r\n        <dir class="Icon20x20 PhoneIcon"></dir>\r\n        <dir class="ApelsinContactsNavigationPanel_ContactsInfoText"><a href="tel:84912240220">8(4912)240-220</a></dir>\r\n    </div>\r\n    <div class="ApelsinContactsNavigationPanel_ContactsInfoString ApelsinContactsNavigationPanel_Phone">\r\n        <dir class="Icon20x20 PhoneIcon"></dir>\r\n        <dir class="ApelsinContactsNavigationPanel_ContactsInfoText"><a href="tel:84912502020">8(4912)502-020</a></dir>\r\n    </div>\r\n</div>\r\n\r\n<div class="ApelsinContactsNavigationPanel_TableTime">\r\n    <table class="time_table">\r\n        <tbody>\r\n            <tr>\r\n                <td class="time_table_text">ПН - ПТ</td>\r\n                <td class="time_table_time">09:00 - 20:00</td>\r\n            </tr><tr>\r\n                <td class="time_table_text"><span class="mainDay">СБ</span></td>\r\n                <td class="time_table_time">09:00 - 19:00</td>\r\n            </tr><tr>\r\n                <td class="time_table_text"><span class="mainDay">ВС</span></td>\r\n                <td class="time_table_time">09:00 - 18:00</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n</div>\r\n\r\n<div class="ApelsinContactsNavigationPanel_ContactsText">\r\n<p>Уважаемые клиенты, если Вы не знаете кому \r\nадресовать Ваш вопрос - обращайтесь в \r\n<a href="./general_enquiries_department/ru/">ОТДЕЛ&nbsp;ИНФОРМАЦИИ</a> \r\nпо вышеуказанным \r\nтелефонам. Наши секретари предоставят интересующую Вас информацию, \r\nлибо перенаправят к необходимому адресату.\r\n</p>\r\n<p>\r\nПо вопросам, связанным с \r\nтоварами, ценами, ассортиментом и наличием на складах - обращайтесь в \r\n<a href="./sales_department/ru/">ОТДЕЛ&nbsp;ПРОДАЖ</a>\r\nпо телефону <span class="main_text">8 (4912) 240-220 доб. 555</span>. Наши менеджеры предоставят \r\nинтересующую Вас информацию, либо перенаправят к необходимому адресату.\r\n</p>\r\n</div>'),
('cooperation', 'eng', 'Cooperation', '<p>For the questions related to the cooperation \r\n    for the supply and disposal of goods, please contact line managers of \r\n    the <a href="./marketing_department/en/">MARKETING&nbsp;DEPARTMENT</a>.</p>'),
('cooperation', 'rus', 'Сотрудничество', '<p>По вопросам сотрудничества в рамках поставок \r\n    и реализации товара обращайтесь к Руководителям направлений \r\n    <a href="./marketing_department/ru/">ОТДЕЛА&nbsp;МАРКЕТИНГА</a>.</p>'),
('departments', 'eng', 'Departments', NULL),
('departments', 'rus', 'Отделы', NULL),
('jobseeker', 'eng', 'Jobseeker', '<p class=''main_paragraph''><span class=''main_text''>APELSIN</span> is an active dynamically developing company that''s why we are always looking for initiative, \r\n    <br>hard working, and responsible employees.</p>\r\n<p class=''main_paragraph''>We provide on-the-job training and offer regular salary.</p>\r\n<p class=''main_paragraph''>If you are interested in decent salary for decent work &ndash; <span class=''main_text''>WE ARE WAITING FOR YOU</span>!!!</p>\r\n<p class=''main_paragraph''>For more information about job openings, please call on :\r\n<center><span class=''main_text''>8(4912)240-220</span> | <span class=''main_text''>8(4912)502-020</span></center>\r\n<br><hr><br>\r\n<center>\r\n<a class="fancybox" href="./vacancies/rus/"><button type="button" class="apelsin_button">Show vacancies page</button></a>\r\n</center>'),
('jobseeker', 'rus', 'Соискателю', '<p class=''main_paragraph''><span class=''main_text''>АПЕЛЬСИН</span> &ndash; активная быстрорастущая компания, поэтому мы постоянно нуждаемся в сотрудниках. </p>\r\n<p class=''main_paragraph''>Нам требуются инициативные, трудолюбивые и ответственные люди.</p>\r\n<p class=''main_paragraph''>Мы предлагаем обучение и стабильную заработную плату.</p>\r\n<p class=''main_paragraph''>Если Вас интересует достойная оплата за достойный труд &ndash; <span class=''main_text''>МЫ ЖДЕМ ВАС!!!</span></p>\r\n<p class=''main_paragraph''>Для получения более подробной информации об открытых предложениях звоните:\r\n<center><span class=''main_text''>8(4912)240-220</span> | <span class=''main_text''>8(4912)502-020</span></center>\r\n<br><hr><br>\r\n<center>\r\n<a class="fancybox" href="./vacancies/rus/"><button type="button" class="apelsin_button">Посмотреть доступные вакансии</button></a>\r\n</center>'),
('shops', 'eng', 'Shops', NULL),
('shops', 'rus', 'Магазины', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `ApelsinContactsNavigationPanel_SiteMapGroup`
--

DROP TABLE IF EXISTS `ApelsinContactsNavigationPanel_SiteMapGroup`;
CREATE TABLE IF NOT EXISTS `ApelsinContactsNavigationPanel_SiteMapGroup` (
  `alias` varchar(50) NOT NULL,
  `group` varchar(50) NOT NULL,
  `maxInColumn` int(2) unsigned NOT NULL,
  PRIMARY KEY (`alias`),
  UNIQUE KEY `group_UNIQUE` (`group`,`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ApelsinContactsNavigationPanel_SiteMapGroup`
--

INSERT INTO `ApelsinContactsNavigationPanel_SiteMapGroup` (`alias`, `group`, `maxInColumn`) VALUES
('departments', 'departments', 3),
('shops', 'shops', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `Components`
--

DROP TABLE IF EXISTS `Components`;
CREATE TABLE IF NOT EXISTS `Components` (
  `alias` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `version` varchar(100) NOT NULL,
  `description` text,
  `adminDir` varchar(200) NOT NULL,
  `admin` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`alias`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Components`
--

INSERT INTO `Components` (`alias`, `name`, `author`, `version`, `description`, `adminDir`, `admin`) VALUES
('Adminpanel', 'Adminpanel', 'Compu Project', '1.0', 'Панель администрирования', 'admin', 'index.php'),
('Contacts_old', 'Контакты на сайте', 'Compu Project', '1.0', 'Модуль для работы с контактами магазина апельсин', 'admin', 'index.php'),
('Materials', 'Материалы сайта', 'Compu Project', '1.0', 'Компонент для размещение материалов на сайте.', 'admin', 'index.php'),
('ServiceCenters', 'сервисные центры', 'Compu Project', '1.0', 'Компонент для работы с сервисными центрами магазина апельсин', 'admin', 'index.php'),
('Users', 'Пользователи', 'Compu Project', '1.0', 'Компонент для работы с пользователями.', 'admin', 'index.php'),
('Vacancies', 'Вакансии', 'Compu Project', '1.0', 'Компонент для работы с вакансиями на сайте', 'admin', 'index.php');

-- --------------------------------------------------------

--
-- Структура таблицы `ComponentsDepends`
--

DROP TABLE IF EXISTS `ComponentsDepends`;
CREATE TABLE IF NOT EXISTS `ComponentsDepends` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `elementType` varchar(50) NOT NULL,
  `component` varchar(50) NOT NULL,
  `depends` varchar(50) NOT NULL,
  `versionStart` varchar(100) DEFAULT NULL,
  `versionEnd` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `depends_UNIQUE` (`depends`,`component`,`elementType`),
  KEY `fk_ComponentsDepends_1_idx` (`elementType`),
  KEY `fk_ComponentsDepends_2_idx` (`component`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `ComponentsDepends`
--

INSERT INTO `ComponentsDepends` (`id`, `elementType`, `component`, `depends`, `versionStart`, `versionEnd`) VALUES
(1, 'Plugins', 'Materials', 'appearingBox', '1.0', '1.0'),
(2, 'Modules', 'Materials', 'captcha', '1.0', '1.0'),
(3, 'Modules', 'Users', 'captcha', '1.0', '1.0');

-- --------------------------------------------------------

--
-- Структура таблицы `ComponentsDependsElementsType`
--

DROP TABLE IF EXISTS `ComponentsDependsElementsType`;
CREATE TABLE IF NOT EXISTS `ComponentsDependsElementsType` (
  `elementType` varchar(50) NOT NULL,
  `tableName` varchar(50) NOT NULL,
  PRIMARY KEY (`elementType`),
  UNIQUE KEY `elementType_UNIQUE` (`elementType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ComponentsDependsElementsType`
--

INSERT INTO `ComponentsDependsElementsType` (`elementType`, `tableName`) VALUES
('Components', 'Components'),
('Modules', 'Modules'),
('Plugins', 'Plugins');

-- --------------------------------------------------------

--
-- Структура таблицы `ComponentsElements`
--

DROP TABLE IF EXISTS `ComponentsElements`;
CREATE TABLE IF NOT EXISTS `ComponentsElements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(50) NOT NULL,
  `component` varchar(50) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` longtext,
  `mainPage` varchar(100) NOT NULL,
  `printPage` varchar(100) NOT NULL,
  `mobilePage` varchar(100) NOT NULL,
  `head` varchar(100) DEFAULT NULL,
  `bodyStart` varchar(100) DEFAULT NULL,
  `bodyEnd` varchar(100) DEFAULT NULL,
  `admin` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `component_UNIQUE` (`component`,`alias`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `alias_UNIQUE` (`alias`,`component`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=999902 ;

--
-- Дамп данных таблицы `ComponentsElements`
--

INSERT INTO `ComponentsElements` (`id`, `alias`, `component`, `name`, `description`, `mainPage`, `printPage`, `mobilePage`, `head`, `bodyStart`, `bodyEnd`, `admin`) VALUES
(101, 'Material', 'Materials', 'Материал', 'Выводит на страницу сайта один материал.', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(102, 'MaterialsList', 'Materials', 'Список материалов', 'Выводит на страницу сайта список материалов', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(103, 'MaterialsCategory', 'Materials', 'Категории материалов', 'Выводит на страницу сайта категорию материалов', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(104, 'MaterialsCategoryList', 'Materials', 'Список категорий материалов', 'Выводит на страницу сайта список категорий материалов', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(105, 'MaterialsBlog', 'Materials', 'Блог материалов', 'Выводит список материалов в виде блога. Отличается от обычного вывода списка материалов блочной структурой.', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(201, 'Shops', 'Contacts_old', 'Магазин', 'Контакты магазина', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(202, 'Departments', 'Contacts_old', 'Отдел', 'Контакты отдела', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(203, 'DepartmentsList', 'Contacts_old', 'Список отделов', 'Контакты нескольких отделов в виде списка', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(204, 'ContactsMap', 'Contacts_old', 'Contacts Map', NULL, 'index.php', 'index.php', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', NULL),
(301, 'AllServiceCenters', 'ServiceCenters', 'Сервисные центры', 'Список сервисных центров', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(401, 'Vacancies', 'Vacancies', 'Вакансии', 'Список вакансий', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(999801, 'Accounts', 'Users', 'Аккаунт', 'Аккаунт пользователя', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(999802, 'AccountSettings', 'Users', 'Настройки аккаунта', 'Настройки аккаунта пользователя', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(999803, 'Registration', 'Users', 'Регистрация', 'Страница регистрации пользователя', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(999901, 'Adminpanel', 'Adminpanel', 'Панель администрирования', 'Панель администрирвоания', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php');

-- --------------------------------------------------------

--
-- Структура таблицы `ContactDepartments`
--

DROP TABLE IF EXISTS `ContactDepartments`;
CREATE TABLE IF NOT EXISTS `ContactDepartments` (
  `alias` varchar(100) NOT NULL,
  `email1` varchar(200) DEFAULT NULL,
  `email2` varchar(200) DEFAULT NULL,
  `phone1` varchar(100) DEFAULT NULL,
  `additional1` varchar(9) DEFAULT NULL,
  `phone2` varchar(100) DEFAULT NULL,
  `additional2` varchar(9) DEFAULT NULL,
  `phone3` varchar(100) DEFAULT NULL,
  `additional3` varchar(9) DEFAULT NULL,
  `phone4` varchar(100) DEFAULT NULL,
  `additional4` varchar(9) DEFAULT NULL,
  `monH_s` int(2) unsigned DEFAULT NULL,
  `monM_s` int(2) unsigned DEFAULT NULL,
  `monH_e` int(2) unsigned DEFAULT NULL,
  `monM_e` int(2) unsigned DEFAULT NULL,
  `tueH_s` int(2) unsigned DEFAULT NULL,
  `tueM_s` int(2) unsigned DEFAULT NULL,
  `tueH_e` int(2) unsigned DEFAULT NULL,
  `tueM_e` int(2) unsigned DEFAULT NULL,
  `wedH_s` int(2) unsigned DEFAULT NULL,
  `wedM_s` int(2) unsigned DEFAULT NULL,
  `wedH_e` int(2) unsigned DEFAULT NULL,
  `wedM_e` int(2) unsigned DEFAULT NULL,
  `thuH_s` int(2) unsigned DEFAULT NULL,
  `thuM_s` int(2) unsigned DEFAULT NULL,
  `thuH_e` int(2) unsigned DEFAULT NULL,
  `thuM_e` int(2) unsigned DEFAULT NULL,
  `friH_s` int(2) unsigned DEFAULT NULL,
  `friM_s` int(2) unsigned DEFAULT NULL,
  `friH_e` int(2) unsigned DEFAULT NULL,
  `friM_e` int(2) unsigned DEFAULT NULL,
  `satH_s` int(2) unsigned DEFAULT NULL,
  `satM_s` int(2) unsigned DEFAULT NULL,
  `satH_e` int(2) unsigned DEFAULT NULL,
  `satM_e` int(2) unsigned DEFAULT NULL,
  `sunH_s` int(2) unsigned DEFAULT NULL,
  `sunM_s` int(2) unsigned DEFAULT NULL,
  `sunH_e` int(2) unsigned DEFAULT NULL,
  `sunM_e` int(2) unsigned DEFAULT NULL,
  PRIMARY KEY (`alias`),
  UNIQUE KEY `alias_UNIQUE` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ContactDepartments`
--

INSERT INTO `ContactDepartments` (`alias`, `email1`, `email2`, `phone1`, `additional1`, `phone2`, `additional2`, `phone3`, `additional3`, `phone4`, `additional4`, `monH_s`, `monM_s`, `monH_e`, `monM_e`, `tueH_s`, `tueM_s`, `tueH_e`, `tueM_e`, `wedH_s`, `wedM_s`, `wedH_e`, `wedM_e`, `thuH_s`, `thuM_s`, `thuH_e`, `thuM_e`, `friH_s`, `friM_s`, `friH_e`, `friM_e`, `satH_s`, `satM_s`, `satH_e`, `satM_e`, `sunH_s`, `sunM_s`, `sunH_e`, `sunM_e`) VALUES
('general_enquiries_department', 'mail@apelsin.ru', NULL, '8(4912)240-220', NULL, '8(4912)502-020', NULL, NULL, NULL, NULL, NULL, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 19, 0, 9, 0, 18, 0),
('marketing_department', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 19, 0, 9, 0, 18, 0),
('procurement_department', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 19, 0, 9, 0, 19, 0, 9, 0, 19, 0, 9, 0, 19, 0, 9, 0, 19, 0, 9, 0, 19, 0, 9, 0, 18, 0),
('sales_department', 'mail@apelsin.ru', NULL, '8(4912)240-220', '555', NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 19, 0, 9, 0, 18, 0),
('studio_furniture_ostrovskogo', 'mebel.apelsin@yandex.ru', NULL, '8(4912)513-220', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 19, 0, 9, 0, 18, 0),
('studio_furniture_shabulina', 'mebel.apelsin@yandex.ru', NULL, '8(4912)513-220', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 19, 0, 9, 0, 17, 0),
('studio_furniture_yesenina', 'mebel.apelsin@yandex.ru', NULL, '8(4912)513-220', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 19, 0, 9, 0, 18, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ContactDepartmentsList`
--

DROP TABLE IF EXISTS `ContactDepartmentsList`;
CREATE TABLE IF NOT EXISTS `ContactDepartmentsList` (
  `alias` varchar(100) NOT NULL,
  PRIMARY KEY (`alias`),
  UNIQUE KEY `alias_UNIQUE` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ContactDepartmentsList`
--

INSERT INTO `ContactDepartmentsList` (`alias`) VALUES
('contactsMainPage'),
('studio_furniture');

-- --------------------------------------------------------

--
-- Структура таблицы `ContactDepartments_has_ContactDepartmentsList`
--

DROP TABLE IF EXISTS `ContactDepartments_has_ContactDepartmentsList`;
CREATE TABLE IF NOT EXISTS `ContactDepartments_has_ContactDepartmentsList` (
  `department` varchar(100) NOT NULL,
  `list` varchar(100) NOT NULL,
  `sequence` int(10) unsigned NOT NULL,
  `showWorkersContacts` tinyint(1) unsigned NOT NULL,
  `showDescription` tinyint(1) unsigned NOT NULL,
  `showInfo` tinyint(1) unsigned NOT NULL,
  `showTimeTable` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`department`,`list`),
  UNIQUE KEY `sequence_UNIQUE` (`sequence`,`list`),
  KEY `fk_ContactDepartments_has_ContactDepartmentsList_1_idx` (`list`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ContactDepartments_has_ContactDepartmentsList`
--

INSERT INTO `ContactDepartments_has_ContactDepartmentsList` (`department`, `list`, `sequence`, `showWorkersContacts`, `showDescription`, `showInfo`, `showTimeTable`) VALUES
('general_enquiries_department', 'contactsMainPage', 1, 0, 1, 0, 1),
('marketing_department', 'contactsMainPage', 2, 0, 1, 1, 1),
('studio_furniture_ostrovskogo', 'studio_furniture', 3, 1, 1, 1, 1),
('studio_furniture_shabulina', 'studio_furniture', 2, 1, 0, 0, 1),
('studio_furniture_yesenina', 'studio_furniture', 1, 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ContactDepartments_has_ContactsWorkersList`
--

DROP TABLE IF EXISTS `ContactDepartments_has_ContactsWorkersList`;
CREATE TABLE IF NOT EXISTS `ContactDepartments_has_ContactsWorkersList` (
  `department` varchar(100) NOT NULL,
  `list` varchar(100) NOT NULL,
  PRIMARY KEY (`department`,`list`),
  KEY `fk_ContactDepartments_has_ContactsWorkersList_ContactsWorke_idx` (`list`),
  KEY `fk_ContactDepartments_has_ContactsWorkersList_ContactDepart_idx` (`department`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ContactDepartments_has_ContactsWorkersList`
--

INSERT INTO `ContactDepartments_has_ContactsWorkersList` (`department`, `list`) VALUES
('marketing_department', 'Отдел маркетинга'),
('procurement_department', 'Отдел комплектации'),
('studio_furniture_ostrovskogo', 'Студия мебели на Островского'),
('studio_furniture_shabulina', 'Студия мебели на Шабулина'),
('studio_furniture_yesenina', 'Студия мебели на Есенина');

-- --------------------------------------------------------

--
-- Структура таблицы `ContactDepartments_Lang`
--

DROP TABLE IF EXISTS `ContactDepartments_Lang`;
CREATE TABLE IF NOT EXISTS `ContactDepartments_Lang` (
  `department` varchar(100) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  `adress` varchar(200) DEFAULT NULL,
  `postAdress` varchar(200) DEFAULT NULL,
  `description` longtext,
  `info` longtext,
  PRIMARY KEY (`department`,`lang`),
  KEY `fk_ContactDepartments_Lang_2_idx` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ContactDepartments_Lang`
--

INSERT INTO `ContactDepartments_Lang` (`department`, `lang`, `name`, `adress`, `postAdress`, `description`, `info`) VALUES
('general_enquiries_department', 'eng', 'General enquiries department', '13 Yesenina str., 390006 Ryazan', '13 Yesenina str., 390023 Ryazan, POB 109', '<p>If you don''t know whom to address your \r\n    questions, please feel free to contact the \r\n    <a href="./general_enquiries_department/en/">GENERAL ENQUIRIES DEPARTMENT</a> \r\n    via one of the telephone numbers mentioned above. Our secretaries will \r\n    be glad to provide all the necessary information, or forward the call to \r\n    the corresponding specialist.\r\n</p><p>\r\nFor the questions related to our products, \r\n    prices, assortment and stock status, please contact the \r\n    <a href="./sales_department/en/">SALES DEPARTMENT</a> \r\n    via the telephone numbers <span class="main_text">8 (4912) 240-220#555</span>.\r\n</p>', '    * To dial an extension number from a stationary phone, please switch \r\n    the phone to the tone dialing («*», button or switch \r\n    «TONE»). You can begin dialing the number right after the \r\n    start of the auto-answer. The users of cellular phones can also dial \r\n    the extension right after the start of the auto-answer.<br />\r\n    If you come across some difficulties, please wait for the \r\n    secretary to answer.<br />\r\n    * If you want to send an e-mail, but have difficulties in choosing \r\n    the recipient, or can''t find the address of the desired person, \r\n    you can always send a message to the general mailbox: \r\n    <a href="mailto:mail@apelsin.ru">mail@apelsin.ru</a>.<br />\r\n    * For the more successful e-mail handling, we kindly request you to \r\n    specify the name of the recipient, the department, or the name of \r\n    the shop in the [subject] field.'),
('general_enquiries_department', 'rus', 'Отдел информации', '390023 г. Рязань, ул. Есенина, 13', '390023 г. Рязань, а/я 109', '<p>Уважаемые клиенты, если Вы не знаете кому \r\n    адресовать Ваш вопрос - обращайтесь в \r\n    <a href="./general_enquiries_department/ru/">ОТДЕЛ ИНФОРМАЦИИ</a> \r\n    по вышеуказанным \r\n    телефонам. Наши секретари предоставят интересующую Вас информацию, \r\n    либо перенаправят к необходимому адресату.\r\n</p><p>\r\nПо вопросам, связанным с \r\n    товарами, ценами, ассортиментом и наличием на складах - обращайтесь в \r\n    <a href="./sales_department/ru/">ОТДЕЛ ПРОДАЖ</a>\r\n    по телефону <span class="main_text">8 (4912) 240-220 доб. 555</span>. Наши менеджеры предоставят \r\n    интересующую Вас информацию, либо перенаправят к необходимому адресату.\r\n</p>', '    * Для набора добавочного номера с городского телефона необходимо перевести \r\n    его в тональный набор («*», кнопка либо \r\n    переключатель «TONE»). Набирать \r\n    добавочный номер можно сразу после начала сообщения автоответчика. \r\n    С сотовых телефонов набирать добавочные номера можно так же после начала \r\n    сообщения автоответчика.<br />\r\n    Если у Вас возникают какие-либо трудности - Вы можете \r\n    дождаться ответа секретаря.<br />\r\n    * При отправке почтовых сообщений, если вы затрудняетесь в выборе \r\n    получателя, либо не нашли адрес нужного Вам лица — Вы всегда можете \r\n    направить корреспонденцию на общий ящик: \r\n    <a href="mailto:mail@apelsin.ru">mail@apelsin.ru</a>.<br />\r\n    * Убедительная просьба, для более точного получения обозначайте в \r\n    поле [тема сообщения] имя получателя, либо отдела, либо наименование \r\n    точки.'),
('marketing_department', 'eng', 'Marketing department', NULL, NULL, 'For the questions related to the cooperation \r\n    for the supply and disposal of goods, please contact line managers of \r\n    the <a href="./marketing_department/en/">MARKETING DEPARTMENT</a>.', '    * To dial an extension number from a stationary phone, please switch \r\n    the phone to the tone dialing («*», button or switch \r\n    «TONE»). You can begin dialing the number right after the \r\n    start of the auto-answer. The users of cellular phones can also dial \r\n    the extension right after the start of the auto-answer.<br />\r\n    If you come across some difficulties, please wait for the \r\n    secretary to answer.<br />\r\n    * If you want to send an e-mail, but have difficulties in choosing \r\n    the recipient, or can''t find the address of the desired person, \r\n    you can always send a message to the general mailbox: \r\n    <a href="mailto:mail@apelsin.ru">mail@apelsin.ru</a>.<br />\r\n    * For the more successful e-mail handling, we kindly request you to \r\n    specify the name of the recipient, the department, or the name of \r\n    the shop in the [subject] field.'),
('marketing_department', 'rus', 'Отдел маркетинга', NULL, NULL, 'По вопросам сотрудничества в рамках поставок \r\n    и реализации товара обращайтесь к Руководителям направлений \r\n    <a href="./marketing_department/ru/">ОТДЕЛА МАРКЕТИНГА</a>.', '    * Для набора добавочного номера с городского телефона необходимо перевести \r\n    его в тональный набор («*», кнопка либо \r\n    переключатель «TONE»). Набирать \r\n    добавочный номер можно сразу после начала сообщения автоответчика. \r\n    С сотовых телефонов набирать добавочные номера можно так же после начала \r\n    сообщения автоответчика.<br />\r\n    Если у Вас возникают какие-либо трудности - Вы можете \r\n    дождаться ответа секретаря.<br />\r\n    * При отправке почтовых сообщений, если вы затрудняетесь в выборе \r\n    получателя, либо не нашли адрес нужного Вам лица — Вы всегда можете \r\n    направить корреспонденцию на общий ящик: \r\n    <a href="mailto:mail@apelsin.ru">mail@apelsin.ru</a>.<br />\r\n    * Убедительная просьба, для более точного получения обозначайте в \r\n    поле [тема сообщения] имя получателя, либо отдела, либо наименование \r\n    точки.'),
('procurement_department', 'eng', 'Procurement department', NULL, NULL, 'Managers of Procurement department will \r\n    help you to provide all the necessary materials for the \r\n    heating and water supply systems, and will calculate \r\n    and select the appropriate equipment on an individual basis.', '    * To dial an extension number from a stationary phone, please switch \r\n    the phone to the tone dialing («*», button or switch \r\n    «TONE»). You can begin dialing the number right after the \r\n    start of the auto-answer. The users of cellular phones can also dial \r\n    the extension right after the start of the auto-answer.<br />\r\n    If you come across some difficulties, please wait for the \r\n    secretary to answer.<br />\r\n    * If you want to send an e-mail, but have difficulties in choosing \r\n    the recipient, or can''t find the address of the desired person, \r\n    you can always send a message to the general mailbox: \r\n    <a href="mailto:mail@apelsin.ru">mail@apelsin.ru</a>.<br />\r\n    * For the more successful e-mail handling, we kindly request you to \r\n    specify the name of the recipient, the department, or the name of \r\n    the shop in the [subject] field.'),
('procurement_department', 'rus', 'Отдел комплектации', NULL, NULL, 'Менеджеры «Отдела комплектации» \r\n    помогут Вам обеспечить объекты недвижимости всеми необходимым \r\n    для систем отопления и водоснабжения, а так же, в индивидуальном \r\n    порядке, рассчитают и подберут подходящее оборудование.', '    * Для набора добавочного номера с городского телефона необходимо перевести \r\n    его в тональный набор («*», кнопка либо \r\n    переключатель «TONE»). Набирать \r\n    добавочный номер можно сразу после начала сообщения автоответчика. \r\n    С сотовых телефонов набирать добавочные номера можно так же после начала \r\n    сообщения автоответчика.<br />\r\n    Если у Вас возникают какие-либо трудности - Вы можете \r\n    дождаться ответа секретаря.<br />\r\n    * При отправке почтовых сообщений, если вы затрудняетесь в выборе \r\n    получателя, либо не нашли адрес нужного Вам лица — Вы всегда можете \r\n    направить корреспонденцию на общий ящик: \r\n    <a href="mailto:mail@apelsin.ru">mail@apelsin.ru</a>.<br />\r\n    * Убедительная просьба, для более точного получения обозначайте в \r\n    поле [тема сообщения] имя получателя, либо отдела, либо наименование \r\n    точки.'),
('sales_department', 'eng', 'Sales department', NULL, NULL, 'For the questions related to our products, \r\n    prices, assortment and stock status, please contact the \r\n    <a href="./sales_department/en/">SALES DEPARTMENT</a> \r\n    via the telephone numbers mentioned below.', '    * To dial an extension number from a stationary phone, please switch \r\n    the phone to the tone dialing («*», button or switch \r\n    «TONE»). You can begin dialing the number right after the \r\n    start of the auto-answer. The users of cellular phones can also dial \r\n    the extension right after the start of the auto-answer.<br />\r\n    If you come across some difficulties, please wait for the \r\n    secretary to answer.<br />\r\n    * If you want to send an e-mail, but have difficulties in choosing \r\n    the recipient, or can''t find the address of the desired person, \r\n    you can always send a message to the general mailbox: \r\n    <a href="mailto:mail@apelsin.ru">mail@apelsin.ru</a>.<br />\r\n    * For the more successful e-mail handling, we kindly request you to \r\n    specify the name of the recipient, the department, or the name of \r\n    the shop in the [subject] field.'),
('sales_department', 'rus', 'Отдел продаж', NULL, NULL, 'Уважаемые покупатели! По вопросам связанным с \r\n    товарами, ценами, ассортиментом и наличием на складах - обращайтесь в \r\n    <a href="./sales_department/ru/">ОТДЕЛ ПРОДАЖ</a>\r\n    по нижеуказанным телефонам. Наши менеджеры предоставят \r\n    интересующую Вас информацию, либо перенаправят к необходимому адресату.', '    * Для набора добавочного номера с городского телефона необходимо перевести \r\n    его в тональный набор («*», кнопка либо \r\n    переключатель «TONE»). Набирать \r\n    добавочный номер можно сразу после начала сообщения автоответчика. \r\n    С сотовых телефонов набирать добавочные номера можно так же после начала \r\n    сообщения автоответчика.<br />\r\n    Если у Вас возникают какие-либо трудности - Вы можете \r\n    дождаться ответа секретаря.<br />\r\n    * При отправке почтовых сообщений, если вы затрудняетесь в выборе \r\n    получателя, либо не нашли адрес нужного Вам лица — Вы всегда можете \r\n    направить корреспонденцию на общий ящик: \r\n    <a href="mailto:mail@apelsin.ru">mail@apelsin.ru</a>.<br />\r\n    * Убедительная просьба, для более точного получения обозначайте в \r\n    поле [тема сообщения] имя получателя, либо отдела, либо наименование \r\n    точки.'),
('studio_furniture_ostrovskogo', 'rus', 'Студия мебели на Островского', '390029, ул. Островского, д. 109/2', '390023 г. Рязань, а/я 109', '<p>Мебель была и остаётся неизменным атрибутом нашего быта. Создавая комфорт в нашей жизни наполняя дом уютом и теплом, качественная мебель \r\nопределяет наше самочувствие и настроение. Где наиболее удобно представлена в Рязани мебель на заказ, надежная и недорогая, современная и функциональная?\r\n- на этот вопрос есть ответ. </p>\r\n\r\n<p>Студия мебели"Апельсин" предлагает купить мебель в Рязани самого разнообразного стиля, дизайна и комплектации. \r\nКорпусная мебель, гостиные, кухни, прихожие, спальни, детские - Наша компания предлагает Вашему вниманию по-настоящему функциональную, \r\nудобную и оригинальную мебель. Вас приятно удивит оптимальное сочетание цены и качества. </p>\r\n\r\n<p>Мы окажем помощь в комплектации любого объекта - квартиры, офиса, коттеджа или любого другого помещения всем необходимым. Наша компания завоевала \r\nдоверие и уважение многих клиентов благодаря соблюдению таких принципов как высокое качество, отличная эргономика и функциональность.</p>\r\n\r\n<p>В фирменных Студиях Мебели «Апельсин» представлен большой ассортимент мебели для дома: для детской комнаты, гостиной, кухни, корпусная мебель, мебельные стенки, \r\nприхожие, столы компьютерные и писменные, тумбы, шкафы-купе.  Любая мебель по доступным ценам.</p>\r\n\r\n<p>На сегодняшний день повышение качества и постоянное обновление линейки производимой корпусной мебели позволяет студии мебели "Апельсин" быть одним из лидеров \r\nсреди производителей корпусной мебели. Производство осуществляется командой квалифицированных сотрудников на итальянском оборудовании из экологически чистого, \r\nкачественного материала — пленки ПВХ (Германия), пластика (Италия), кратки (США), массив древисины (Италия), фурнитура фирмы «Hettichj (Германия), что позволяет нам \r\nгарантировать высокое качество мебели, её надежность и долговечность. Каждое изделие проходит контроль качества.</p>\r\n\r\n<p>Студия мебели "Апельсин" выполняет оптовые заказы на изготовление мебели для гостиниц, институтов, лагерей, общежитий и других общественных организаций.</p>\r\n\r\n<p>Студия мебели "Апельсин" приглашает к взаимовыгодному и долгосрочному сотрудничеству. Наши специалисты проконсультируют Вас по всем интересующим вопросам. Мы всегда рады нашим заказчикам!</p>\r\n\r\n<p>Хорошая мебель - хорошим людям!</p>', '    * Для набора добавочного номера с городского телефона необходимо перевести \r\n    его в тональный набор («*», кнопка либо \r\n    переключатель «TONE»). Набирать \r\n    добавочный номер можно сразу после начала сообщения автоответчика. \r\n    С сотовых телефонов набирать добавочные номера можно так же после начала \r\n    сообщения автоответчика.<br />\r\n    Если у Вас возникают какие-либо трудности - Вы можете \r\n    дождаться ответа секретаря.<br />\r\n    * При отправке почтовых сообщений, если вы затрудняетесь в выборе \r\n    получателя, либо не нашли адрес нужного Вам лица — Вы всегда можете \r\n    направить корреспонденцию на общий ящик: \r\n    <a href="mailto:mail@apelsin.ru">mail@apelsin.ru</a>.<br />\r\n    * Убедительная просьба, для более точного получения обозначайте в \r\n    поле [тема сообщения] имя получателя, либо отдела, либо наименование \r\n    точки.'),
('studio_furniture_shabulina', 'rus', 'Студия мебели на Шабулина', '390043 г. Рязань, Шабулина, д. 24Б', '390023 г. Рязань, а/я 109', '<p>Мебель была и остаётся неизменным атрибутом нашего быта. Создавая комфорт в нашей жизни наполняя дом уютом и теплом, качественная мебель \r\nопределяет наше самочувствие и настроение. Где наиболее удобно представлена в Рязани мебель на заказ, надежная и недорогая, современная и функциональная?\r\n- на этот вопрос есть ответ. </p>\r\n\r\n<p>Студия мебели"Апельсин" предлагает купить мебель в Рязани самого разнообразного стиля, дизайна и комплектации. \r\nКорпусная мебель, гостиные, кухни, прихожие, спальни, детские - Наша компания предлагает Вашему вниманию по-настоящему функциональную, \r\nудобную и оригинальную мебель. Вас приятно удивит оптимальное сочетание цены и качества. </p>\r\n\r\n<p>Мы окажем помощь в комплектации любого объекта - квартиры, офиса, коттеджа или любого другого помещения всем необходимым. Наша компания завоевала \r\nдоверие и уважение многих клиентов благодаря соблюдению таких принципов как высокое качество, отличная эргономика и функциональность.</p>\r\n\r\n<p>В фирменных Студиях Мебели «Апельсин» представлен большой ассортимент мебели для дома: для детской комнаты, гостиной, кухни, корпусная мебель, мебельные стенки, \r\nприхожие, столы компьютерные и писменные, тумбы, шкафы-купе.  Любая мебель по доступным ценам.</p>\r\n\r\n<p>На сегодняшний день повышение качества и постоянное обновление линейки производимой корпусной мебели позволяет студии мебели "Апельсин" быть одним из лидеров \r\nсреди производителей корпусной мебели. Производство осуществляется командой квалифицированных сотрудников на итальянском оборудовании из экологически чистого, \r\nкачественного материала — пленки ПВХ (Германия), пластика (Италия), кратки (США), массив древисины (Италия), фурнитура фирмы «Hettichj (Германия), что позволяет нам \r\nгарантировать высокое качество мебели, её надежность и долговечность. Каждое изделие проходит контроль качества.</p>\r\n\r\n<p>Студия мебели "Апельсин" выполняет оптовые заказы на изготовление мебели для гостиниц, институтов, лагерей, общежитий и других общественных организаций.</p>\r\n\r\n<p>Студия мебели "Апельсин" приглашает к взаимовыгодному и долгосрочному сотрудничеству. Наши специалисты проконсультируют Вас по всем интересующим вопросам. Мы всегда рады нашим заказчикам!</p>\r\n\r\n<p>Хорошая мебель - хорошим людям!</p>', '    * Для набора добавочного номера с городского телефона необходимо перевести \r\n    его в тональный набор («*», кнопка либо \r\n    переключатель «TONE»). Набирать \r\n    добавочный номер можно сразу после начала сообщения автоответчика. \r\n    С сотовых телефонов набирать добавочные номера можно так же после начала \r\n    сообщения автоответчика.<br />\r\n    Если у Вас возникают какие-либо трудности - Вы можете \r\n    дождаться ответа секретаря.<br />\r\n    * При отправке почтовых сообщений, если вы затрудняетесь в выборе \r\n    получателя, либо не нашли адрес нужного Вам лица — Вы всегда можете \r\n    направить корреспонденцию на общий ящик: \r\n    <a href="mailto:mail@apelsin.ru">mail@apelsin.ru</a>.<br />\r\n    * Убедительная просьба, для более точного получения обозначайте в \r\n    поле [тема сообщения] имя получателя, либо отдела, либо наименование \r\n    точки.'),
('studio_furniture_yesenina', 'rus', 'Студия мебели на Есенина', '390006 г. Рязань, ул. Есенина, 13', '390023 г. Рязань, а/я 109', '<p>Мебель была и остаётся неизменным атрибутом нашего быта. Создавая комфорт в нашей жизни наполняя дом уютом и теплом, качественная мебель \r\nопределяет наше самочувствие и настроение. Где наиболее удобно представлена в Рязани мебель на заказ, надежная и недорогая, современная и функциональная?\r\n- на этот вопрос есть ответ. </p>\r\n\r\n<p>Студия мебели"Апельсин" предлагает купить мебель в Рязани самого разнообразного стиля, дизайна и комплектации. \r\nКорпусная мебель, гостиные, кухни, прихожие, спальни, детские - Наша компания предлагает Вашему вниманию по-настоящему функциональную, \r\nудобную и оригинальную мебель. Вас приятно удивит оптимальное сочетание цены и качества. </p>\r\n\r\n<p>Мы окажем помощь в комплектации любого объекта - квартиры, офиса, коттеджа или любого другого помещения всем необходимым. Наша компания завоевала \r\nдоверие и уважение многих клиентов благодаря соблюдению таких принципов как высокое качество, отличная эргономика и функциональность.</p>\r\n\r\n<p>В фирменных Студиях Мебели «Апельсин» представлен большой ассортимент мебели для дома: для детской комнаты, гостиной, кухни, корпусная мебель, мебельные стенки, \r\nприхожие, столы компьютерные и письменные, тумбы, шкафы-купе.  Любая мебель по доступным ценам.</p>\r\n\r\n<p>На сегодняшний день повышение качества и постоянное обновление линейки производимой корпусной мебели позволяет студии мебели "Апельсин" быть одним из лидеров \r\nсреди производителей корпусной мебели. Производство осуществляется командой квалифицированных сотрудников на итальянском оборудовании из экологически чистого, \r\nкачественного материала — пленки ПВХ (Германия), пластика (Италия), кратки (США), массив древисины (Италия), фурнитура фирмы «Hettichj (Германия), что позволяет нам \r\nгарантировать высокое качество мебели, её надежность и долговечность. Каждое изделие проходит контроль качества.</p>\r\n\r\n<p>Студия мебели "Апельсин" выполняет оптовые заказы на изготовление мебели для гостиниц, институтов, лагерей, общежитий и других общественных организаций.</p>\r\n\r\n<p>Студия мебели "Апельсин" приглашает к взаимовыгодному и долгосрочному сотрудничеству. Наши специалисты проконсультируют Вас по всем интересующим вопросам. Мы всегда рады нашим заказчикам!</p>\r\n\r\n<p>Хорошая мебель - хорошим людям!</p>', '    * Для набора добавочного номера с городского телефона необходимо перевести \r\n    его в тональный набор («*», кнопка либо \r\n    переключатель «TONE»). Набирать \r\n    добавочный номер можно сразу после начала сообщения автоответчика. \r\n    С сотовых телефонов набирать добавочные номера можно так же после начала \r\n    сообщения автоответчика.<br />\r\n    Если у Вас возникают какие-либо трудности - Вы можете \r\n    дождаться ответа секретаря.<br />\r\n    * При отправке почтовых сообщений, если вы затрудняетесь в выборе \r\n    получателя, либо не нашли адрес нужного Вам лица — Вы всегда можете \r\n    направить корреспонденцию на общий ящик: \r\n    <a href="mailto:mail@apelsin.ru">mail@apelsin.ru</a>.<br />\r\n    * Убедительная просьба, для более точного получения обозначайте в \r\n    поле [тема сообщения] имя получателя, либо отдела, либо наименование \r\n    точки.');

-- --------------------------------------------------------

--
-- Структура таблицы `ContactsShop`
--

DROP TABLE IF EXISTS `ContactsShop`;
CREATE TABLE IF NOT EXISTS `ContactsShop` (
  `alias` varchar(100) NOT NULL,
  `map` varchar(100) NOT NULL,
  `workers` varchar(100) NOT NULL,
  `reviewsEmail` varchar(200) NOT NULL,
  PRIMARY KEY (`alias`),
  UNIQUE KEY `alias_UNIQUE` (`alias`),
  KEY `fk_ContactsShop_1_idx` (`map`),
  KEY `fk_ContactsShop_2_idx` (`workers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ContactsShop`
--

INSERT INTO `ContactsShop` (`alias`, `map`, `workers`, `reviewsEmail`) VALUES
('shop_butyrki', '1v_3rd_butyrki_str', 'Бутырки', 'butyrki@apelsin.ru'),
('shop_chernovitskaya', '5_chernovitskaya_str', 'Черновицкая', 'chernovitskaya@apelsin.ru'),
('shop_chkalova', '70b_chkalova_str', 'Чкалова', 'chkalova@apelsin.ru'),
('shop_hangar_on_the_city_ring_road', 'the_185th_km_of_the_city_ring_road-hangar', 'Окружная (Ангар)', 'angar.okruzhnaya@apelsin.ru'),
('shop_mall_on_the_city_ring_road', 'shopping_mall_on_the_city_ring_road', 'Окружная (ТЦ)', 'tc.okruzhnaya@apelsin.ru'),
('shop_ostrovskogo', '109_ostrovskogo_str', 'Островского', 'ostrovskogo@apelsin.ru'),
('shop_pushkina_luhovitsy', '170v_pushkina_str', 'Луховицы', 'luhovitsy@apelsin.ru'),
('shop_shabulina', '24b_proezd_shabulina', 'Шабулина', 'shabulina@apelsin.ru'),
('shop_svyazi_sokolovka', '10b_svyazi_str_sokolovka', 'Соколовка', 'sokolovka@apelsin.ru'),
('shop_verkhnyaya', '50_verkhnyaya_str', 'Верхняя', 'verhnaya@apelsin.ru'),
('shop_yesenina', '13_yesenina_str', 'Есенина', 'esenina@apelsin.ru'),
('shop_zubkovoy', '27b_zubkovoy_str', 'Зубковой', 'zubkovoy@apelsin.ru');

-- --------------------------------------------------------

--
-- Структура таблицы `ContactsShopBuilding`
--

DROP TABLE IF EXISTS `ContactsShopBuilding`;
CREATE TABLE IF NOT EXISTS `ContactsShopBuilding` (
  `alias` varchar(100) NOT NULL,
  `shop` varchar(100) NOT NULL,
  `email1` varchar(200) NOT NULL,
  `email2` varchar(200) DEFAULT NULL,
  `phone1` varchar(100) NOT NULL,
  `additional1` varchar(9) DEFAULT NULL,
  `phone2` varchar(100) DEFAULT NULL,
  `additional2` varchar(9) DEFAULT NULL,
  `phone3` varchar(100) DEFAULT NULL,
  `additional3` varchar(9) DEFAULT NULL,
  `phone4` varchar(100) DEFAULT NULL,
  `additional4` varchar(9) DEFAULT NULL,
  `monH_s` int(2) unsigned DEFAULT NULL,
  `monM_s` int(2) unsigned DEFAULT NULL,
  `monH_e` int(2) unsigned DEFAULT NULL,
  `monM_e` int(2) unsigned DEFAULT NULL,
  `tueH_s` int(2) unsigned DEFAULT NULL,
  `tueM_s` int(2) unsigned DEFAULT NULL,
  `tueH_e` int(2) unsigned DEFAULT NULL,
  `tueM_e` int(2) unsigned DEFAULT NULL,
  `wedH_s` int(2) unsigned DEFAULT NULL,
  `wedM_s` int(2) unsigned DEFAULT NULL,
  `wedH_e` int(2) unsigned DEFAULT NULL,
  `wedM_e` int(2) unsigned DEFAULT NULL,
  `thuH_s` int(2) unsigned DEFAULT NULL,
  `thuM_s` int(2) unsigned DEFAULT NULL,
  `thuH_e` int(2) unsigned DEFAULT NULL,
  `thuM_e` int(2) unsigned DEFAULT NULL,
  `friH_s` int(2) unsigned DEFAULT NULL,
  `friM_s` int(2) unsigned DEFAULT NULL,
  `friH_e` int(2) unsigned DEFAULT NULL,
  `friM_e` int(2) unsigned DEFAULT NULL,
  `satH_s` int(2) unsigned DEFAULT NULL,
  `satM_s` int(2) unsigned DEFAULT NULL,
  `satH_e` int(2) unsigned DEFAULT NULL,
  `satM_e` int(2) unsigned DEFAULT NULL,
  `sunH_s` int(2) unsigned DEFAULT NULL,
  `sunM_s` int(2) unsigned DEFAULT NULL,
  `sunH_e` int(2) unsigned DEFAULT NULL,
  `sunM_e` int(2) unsigned DEFAULT NULL,
  PRIMARY KEY (`alias`),
  UNIQUE KEY `alias_UNIQUE` (`alias`),
  KEY `fk_ContactsShopBuilding_1_idx` (`shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ContactsShopBuilding`
--

INSERT INTO `ContactsShopBuilding` (`alias`, `shop`, `email1`, `email2`, `phone1`, `additional1`, `phone2`, `additional2`, `phone3`, `additional3`, `phone4`, `additional4`, `monH_s`, `monM_s`, `monH_e`, `monM_e`, `tueH_s`, `tueM_s`, `tueH_e`, `tueM_e`, `wedH_s`, `wedM_s`, `wedH_e`, `wedM_e`, `thuH_s`, `thuM_s`, `thuH_e`, `thuM_e`, `friH_s`, `friM_s`, `friH_e`, `friM_e`, `satH_s`, `satM_s`, `satH_e`, `satM_e`, `sunH_s`, `sunM_s`, `sunH_e`, `sunM_e`) VALUES
('butyrki', 'shop_butyrki', 'butyrki@apelsin.ru', '', '8 (4912) 950-378', '0', '8 (4912) 950-379', '0', '', '0', '', '0', 9, 0, 19, 0, 9, 0, 19, 0, 9, 0, 19, 0, 9, 0, 19, 0, 9, 0, 19, 0, 9, 0, 18, 0, 9, 0, 17, 0),
('chernovitskaya', 'shop_chernovitskaya', 'chernovitskaya@apelsin.ru', '', '8 (4912) 226-160', '0', '8 (4912) 502-020', '0', '', '0', '', '0', 9, 0, 19, 0, 9, 0, 19, 0, 9, 0, 19, 0, 9, 0, 19, 0, 9, 0, 19, 0, 9, 0, 17, 0, 9, 0, 15, 0),
('chkalova', 'shop_chkalova', 'chkalova@apelsin.ru', '', '8 (4912) 248-289', '0', '8 (4912) 758-793', '0', '8 (4912) 207-183', '0', '', '0', 9, 0, 19, 0, 9, 0, 19, 0, 9, 0, 19, 0, 9, 0, 19, 0, 9, 0, 19, 0, 9, 0, 17, 0, 9, 0, 15, 0),
('firsova', 'shop_yesenina', 'esenina@apelsin.ru', '', '8 (4912) 240-220', '1820', '', '0', '', '0', '', '0', 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 19, 0, 9, 0, 18, 0),
('ostrovskogo', 'shop_ostrovskogo', 'ostrovskogo@apelsin.ru', '', '8(4912)226-160', '0', '8(4912)502-020', '0', '', '0', '', '0', 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 19, 0, 9, 0, 18, 0),
('pushkina', 'shop_pushkina_luhovitsy', 'luhovitsy@apelsin.ru', '', '8(496)639-6100', NULL, '', NULL, NULL, NULL, NULL, NULL, 9, 0, 19, 0, 9, 0, 19, 0, 9, 0, 19, 0, 9, 0, 19, 0, 9, 0, 19, 0, 9, 0, 19, 0, 9, 0, 17, 0),
('shabulina', 'shop_shabulina', 'shabulina@apelsin.ru', '', '8 (4912) 950-395', '0', '8 (4912) 950-340', '0', '', '0', '', '0', 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 19, 0, 9, 0, 17, 0),
('shopping_mall_on_the_city_ring_road', 'shop_mall_on_the_city_ring_road', 'tc.okruzhnaya@apelsin.ru', '', '8 (4912) 240-220', '0', '8 (4912) 502-020', '0', '', '0', '', '0', 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 19, 0, 9, 0, 18, 0),
('svyazi', 'shop_svyazi_sokolovka', 'sokolovka@apelsin.ru', '', '8(4912)288-891', '0', '8(4912)502-020', '0', '', '0', '', '0', 9, 0, 18, 0, 9, 0, 18, 0, 9, 0, 18, 0, 9, 0, 18, 0, 9, 0, 18, 0, 9, 0, 17, 0, 9, 0, 15, 0),
('the_185th_km_of_the_city_ring_road-hangar', 'shop_hangar_on_the_city_ring_road', 'angar.okruzhnaya@apelsin.ru', '', '8 (4912) 307-355', '0', '8 (4912) 307-356', '0', '', '0', '', '0', 9, 0, 18, 0, 9, 0, 18, 0, 9, 0, 18, 0, 9, 0, 18, 0, 9, 0, 18, 0, 9, 0, 18, 0, 9, 0, 15, 0),
('verkhnyaya', 'shop_verkhnyaya', 'verhnaya@apelsin.ru', '', '8 (4912) 950-148', '0', '8 (4912) 950-149', '0', '', '0', '', '0', 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 19, 0, 9, 0, 18, 0),
('yesenina', 'shop_yesenina', 'esenina@apelsin.ru', '', '8(4912)240-220', '0', '8(4912)502-020', '0', '', '0', '', '0', 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 19, 0, 9, 0, 18, 0),
('zubkovoy', 'shop_zubkovoy', 'zubkovoy@apelsin.ru', '', '8 (4912) 950-377', '0', '8 (4912) 950-380', '0', '', '0', '', '0', 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 20, 0, 9, 0, 19, 0, 9, 0, 18, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ContactsShopBuilding_Lang`
--

DROP TABLE IF EXISTS `ContactsShopBuilding_Lang`;
CREATE TABLE IF NOT EXISTS `ContactsShopBuilding_Lang` (
  `shopBuilding` varchar(100) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  `adress` varchar(200) NOT NULL,
  `description` longtext,
  `info` longtext,
  PRIMARY KEY (`shopBuilding`,`lang`),
  KEY `fk_ContactsShopBuilding_Lang_1_idx` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ContactsShopBuilding_Lang`
--

INSERT INTO `ContactsShopBuilding_Lang` (`shopBuilding`, `lang`, `name`, `adress`, `description`, `info`) VALUES
('butyrki', 'eng', '1V 3rd Butyrki str.', '1V 3rd Butyrki str., 390000 Ryazan', NULL, NULL),
('butyrki', 'rus', 'Бутырки 3, 1В', '390000, г. Рязань, ул. 3 Бутырки, д.1В', NULL, NULL),
('chernovitskaya', 'eng', '5 Chernovitskaya str.', '5 Chernovitskaya str., 390035 Ryazan', NULL, NULL),
('chernovitskaya', 'rus', 'Черновицкая, 5', '390035, г. Рязань, ул. Черновицкая, д. 5', NULL, NULL),
('chkalova', 'eng', '70B Chkalova str.', '70B Chkalova str., 390029 Ryazan', NULL, NULL),
('chkalova', 'rus', 'Чкалова, 70Б', '390029, г. Рязань, ул. Чкалова, д. 70Б', NULL, NULL),
('firsova', 'eng', '23B Firsova str.', '23B Firsova str., 390027 Ryazan', NULL, NULL),
('firsova', 'rus', 'Фирсова, 23Б', '390027, г. Рязань, ул. Фирсова, д. 23Б', NULL, NULL),
('ostrovskogo', 'eng', '109 Ostrovskogo str.', '109-2 Ostrovskogo str., 390029 Ryazan', NULL, NULL),
('ostrovskogo', 'rus', 'Островского, 109/2', '390029, ул. Островского, д. 109/2', NULL, NULL),
('pushkina', 'eng', '170v Pushkina str.', '170v Pushkina str., 140500 Luhovitsy', NULL, NULL),
('pushkina', 'rus', 'Луховицы, Пушкина, 170В', '140500, г. Луховицы, ул. Пушкина, д. 170B', NULL, NULL),
('shabulina', 'eng', '24B Directions Shabulina', '24B Directions Shabulina, 390043 Ryazan', NULL, NULL),
('shabulina', 'rus', 'Шабулина, 24Б', '390043, г. Рязань, Проезд Шабулина, д. 24Б', NULL, NULL),
('shopping_mall_on_the_city_ring_road', 'eng', 'Shopping mall on the city ring road', 'Shopping mall on the city ring road, Ryazan', NULL, NULL),
('shopping_mall_on_the_city_ring_road', 'rus', 'ТЦ на Окружной', 'г. Рязань, Окружная дорога, 185 км', NULL, NULL),
('svyazi', 'eng', '10B Svyazi str., Sokolovka', '10B Svyazi str., Sokolovka, 390047 Ryazan', NULL, NULL),
('svyazi', 'rus', 'Соколовка, Связи, 10Б', '390047, г. Рязань, пос. Соколовка, ул. Связи, 10Б', NULL, NULL),
('the_185th_km_of_the_city_ring_road-hangar', 'eng', 'The 185th km of the beltway (Hangar)', 'The 185th km of the beltway (Hangar), Ryazan', NULL, NULL),
('the_185th_km_of_the_city_ring_road-hangar', 'rus', 'Окружная дорога, 185 км (Ангар)', 'г. Рязань, Окружная дорога, 185 км (Ангар)', NULL, NULL),
('verkhnyaya', 'eng', '50 Verkhnyaya str.', '50 Verkhnyaya str., 390037 Ryazan', NULL, NULL),
('verkhnyaya', 'rus', 'Верхняя, 50', '390037, г. Рязань, ул. Верхняя, д. 50', NULL, NULL),
('yesenina', 'eng', '13 Yesenina str.', '13 Yesenina str., 390006 Ryazan', NULL, NULL),
('yesenina', 'rus', 'Есенина, 13', '390006, г. Рязань, ул. Есенина, д.13', NULL, NULL),
('zubkovoy', 'eng', '27B Zubkovoy str.', '27B Zubkovoy str., 390048 Ryazan', NULL, NULL),
('zubkovoy', 'rus', 'Зубковой, 27Б', '390048, г. Рязань, ул. Зубковой, д. 27Б', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `ContactsShopReviews`
--

DROP TABLE IF EXISTS `ContactsShopReviews`;
CREATE TABLE IF NOT EXISTS `ContactsShopReviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `shop` varchar(100) NOT NULL,
  `fio` varchar(100) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `dignity` text,
  `limitations` text,
  `wishes` text,
  `comments` text NOT NULL,
  `rating` int(10) unsigned NOT NULL DEFAULT '5',
  `date` datetime NOT NULL,
  `show` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_reviews_1_idx` (`shop`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Дамп данных таблицы `ContactsShopReviews`
--

INSERT INTO `ContactsShopReviews` (`id`, `shop`, `fio`, `mail`, `dignity`, `limitations`, `wishes`, `comments`, `rating`, `date`, `show`) VALUES
(4, 'shop_yesenina', 'Z', 'grinenko@apelsin.ru', 'z', 'z', 'z', 'z', 3, '2013-09-24 12:41:42', 0),
(5, 'shop_yesenina', 'Зайцев Максим Сергеевич', 'grinenko@apelsin.ru', 'достоинства', 'недостатки', 'пожелания', 'коментарии', 3, '2013-09-24 02:37:35', 0),
(6, 'shop_yesenina', 'Зайцев Максим Сергеевич', 'grinenko@apelsin.ru', 'Огромный выбор товаров и качественное обслуживание.', 'их просто нет', 'Продолжайте расширять сеть своих магазинов!', 'Отличный строительный магазин. <br />\r\nЕсли вы делаете ремонт или вам просто нужны какие-нибудь инструменты, приходите сюда, не пожалеете!', 5, '2013-09-24 02:46:48', 0),
(7, 'shop_chkalova', 'Котов В. В.', 'l-thomson@mail.ru', 'Сплошная реклама', 'Сплошная реклама', 'Вывесить каталог или прайс.', 'Сколько не искал, так и не нашёл, что в этом магазине можно купить, много слухов и только рекламы, а выбрать и купить нечего. Отвратительный подход и неуважение показывает сайт к своим покупателям. Каталог и прайс должен стоять на самом видном месте. Мне неохота не звонить и не узнавать по телефону что у вас есть. Это как игра в испорченный телефон получится. Это относится к всей сети магазинов. Куда попал - туда и написал. Такой уж сайт...!', 1, '2013-10-12 12:48:00', 0),
(8, 'shop_chkalova', 'Котов В. В.', 'l-thomson@mail.ru', 'Сплошная реклама', 'Сплошная реклама', 'Показать каталог', 'Сколько не искал, так и не нашёл, что в этом магазине можно купить, много слухов и только рекламы, а выбрать и купить нечего. Отвратительный подход и неуважение показывает сайт к своим покупателям. Каталог и прайс должен стоять на самом видном месте. Мне неохота не звонить и не узнавать по телефону что у вас есть. Это как игра в испорченный телефон получится. Это относится к всей сети магазинов. Куда попал - туда и написал. Такой уж сайт...!', 1, '2013-10-12 12:50:51', 0),
(9, 'shop_mall_on_the_city_ring_road', 'Котов Владимир Васильевич', 'l-thomson@mail.ru', 'Сплошная реклама', 'Сплошная реклама', 'Показать каталог или прайс', 'Сколько не искал, так и не нашёл, что в этом магазине можно купить, много слухов и только рекламы, а выбрать и купить нечего. Отвратительный подход и неуважение показывает сайт к своим покупателям. Каталог и прайс должен стоять на самом видном месте. Мне неохота не звонить и не узнавать по телефону что у вас есть. Это как игра в испорченный телефон получится. Это относится к всей сети магазинов. Куда попал - туда и написал. Такой уж сайт...!', 1, '2013-10-12 12:54:41', 0),
(10, 'shop_mall_on_the_city_ring_road', 'Котов Владимир Васильевич', 'l-thomson@mail.ru', 'Реклама', 'Реклама', 'Прайс или каталог', 'Сколько не искал, так и не нашёл, что в этом магазине можно купить - только реклама. Отвратительный подход и неуважение показывает сайт к своим покупателям. Каталог и прайс должен стоять на самом видном месте.', 1, '2013-10-12 12:58:50', 0),
(11, 'shop_yesenina', 'Веселов Дмитрий Павлович', 'eenergy2@gmail.com', 'Их много', 'Их мало, но они есть', '', 'Сегодня хотел уточнить информацию, позвонив по основным телефонам. Без всякого предупреждения меня якобы переводят на специалиста, но в трубке слышны короткие гудки! У меня такое ощущение, что просто кидают трубку! Очень недоволен такой работой с клиентом!', 3, '2013-11-07 02:51:46', 0),
(12, 'shop_yesenina', 'Веселов Дмитрий Павлович', 'eenergy2@gmail.com', '', '', '', 'Сегодня хотел уточнить информацию, позвонив по основным телефонам. Без всякого предупреждения меня якобы переводят на специалиста, но в трубке слышны короткие гудки! У меня такое ощущение, что просто кидают трубку! Очень недоволен такой работой с клиентом!', 3, '2013-11-07 02:52:19', 0),
(13, 'shop_yesenina', 'КЭК', 'karpov.ek@mail.ru', 'не вижу', 'купил плитку, у Вас. оказалась разного колора, разного рисунка, декор не соответствует заказанному,полная....', 'Все поменять. Или вернуть деньги в _ размере.', 'хреново', 1, '2013-12-12 10:54:15', 0),
(14, 'shop_shabulina', 'Шумова Екатерина Александровна', 'katerin.sh@yandex.ru', '', '', '', '3 раза посещала Ваш магазин, 2 из них осталась недовольна, не работает "коллеровочная машина", менеджер внятного ответа дать не может, приходите завтра, завтра пришла, опять не работает, потом стала звонить, и в ответ то же самое, "позвоните завтра", УЖАС!', 2, '2013-12-19 04:13:10', 0),
(15, 'shop_shabulina', 'Анна', 'puzzz@mail.ru', 'Большой выбор материалов, отличные сотрудники', 'Хамское отношение колеровщика красок работающего 28.02.2014', 'Людей не выполняющих свои непосредственные обязанности скорее всего надо увольнять, имидж магазина не должен страдать.', 'Добрый день. Сегодня 28.02.2014 при посещении магазина Апельсин на ул. Шабулина была не то, что удивлена, испытала шок от общения с менеджером колерующего краски. К сожалению, не посмотрела его имя и фамилию. Он не то, что отказался помочь в подборе цвета краски, так еще и высказал мне претензию, что за это ему денег не платят и у него в день много покупателей которых он не обязан консультировать. Я первый раз столкнулась с подобным. Пришлось поехать на ул.Есенина, там мне все подобрали, рассказали какие краски у них в ассортименте, показали образцы. В связи с тем, что делаю капитальный ремонт в квартире часто материалы и прочие закупаю в Апельсине, магазинами во всех районах всегда была довольно, продавцы внимательные, все подскажут, помогут выбрать. Как выяснилось при посещении центрального магазина это не первый случай,  когда покупатели жалуются на качество обслуживания колеровщика на ул. Шабулина. Вопрос, куда смотрит руководство?', 4, '2014-02-28 08:15:45', 0),
(16, 'shop_shabulina', 'Анна', 'puzzz@mail.ru', '', '', '', 'Добрый день. Сегодня 28.02.2014 при посещении магазина Апельсин на ул. Шабулина была не то, что удивлена, испытала шок от общения с менеджером колерующего краски. К сожалению, не посмотрела его имя и фамилию. Он не то, что отказался помочь в подборе цвета краски, так еще и высказал мне претензию, что за это ему денег не платят и у него в день много покупателей которых он не обязан консультировать. Я первый раз столкнулась с подобным. Пришлось поехать на ул.Есенина, там мне все подобрали, рассказали какие краски у них в ассортименте, показали образцы. В связи с тем, что делаю капитальный ремонт в квартире часто материалы и прочие закупаю в Апельсине, магазинами во всех районах всегда была довольно, продавцы внимательные, все подскажут, помогут выбрать. Как выяснилось при посещении центрального магазина это не первый случай,  когда покупатели жалуются на качество обслуживания колеровщика на ул. Шабулина. Вопрос, куда смотрит руководство?', 5, '2014-02-28 08:18:11', 0),
(17, 'shop_pushkina_luhovitsy', 'Прокофьева ', 'lelya_viktorovna@mail.ru', 'нет', 'обращалась 4 раза, и все четыре раза меня обманули в вашем магазине. Персонал не обучен должным образом.Заказала двери ( в количестве 7 шт.), обещали привезти через неделю, привезли через 2 месяца.К дверям покупались ручки - одна из них бракованная, заменить товар мне отказались,так как поломка обнаружилась вне магазина.Не хватило наличников к дверям, хотя продавец - консультант вроде как их считала.Хотела купить плитку на в ванную комнату, понравилась одна подборка, но увы оказалось что на складе всего 9 шт. темной плитки, 3 шт. светлой, хотя написано что она есть в наличии. Какую ванную можно сделать этим количеством? Когда речь пошла о заказе плитки, продавец - консультант сразу потерял интерес так как даже не был в состоянии посчитать количество метража. Купила потолочные панели, слава богу, в наличии они были, но увы из 21 купленной панели мне привезли всего 18, упакованы они были так что посчитать их сразу не представлялось возможным. Неужели ваш магазин разбогатеет от 3х панелей? ', 'Пожелать нечего', 'Если можно было поставить оценку -10, я бы поставила', 1, '2014-04-04 09:24:41', 0),
(18, 'shop_pushkina_luhovitsy', 'Редькина Елена Николаевна', '2red-co@mail.ru', '', 'Неудобное место положение,обман покупателей (выдают не тот товар который оплачиваешь)', 'Хотелось бы чтоб пустили хотя бы один автобус который будет довозить до вашего комплекса', 'Сегодня покупала саморезы мне вместо выбранных насыпали разноколиберных,когда была на открытие вместо оплаченых ламп теплого света получила лампы холодного ', 1, '2014-04-22 11:09:05', 0),
(19, 'shop_shabulina', 'DcfxRTrZCj5A', 'jq94nmis@yahoo.com', 'да btw, советую почитать ISO стандарт c++.по стандарту кодchar c=\\''0\\'';string str=\\"Text\\"+c;этоclass char c = __int32(0x30)class string str = __int32(char*(\\"Text\\")) + __int32(c);т.е все приводится к классу int перед выполением стандартных операторов, незнать это тяжкий грех!напримерlongolng n;long t = 0;n = t -1;что будет в n? -1? ага три раза оно там будет. там будет 0xffffffffчто для longolng не -1.на х86 это нормально, а вот х64... таких программистов надо растреливать.char c=\\''0\\'';string str = string(\\"Text\\")+c;приведение типов спасет этот мир.', 'да btw, советую почитать ISO стандарт c++.по стандарту кодchar c=\\''0\\'';string str=\\"Text\\"+c;этоclass char c = __int32(0x30)class string str = __int32(char*(\\"Text\\")) + __int32(c);т.е все приводится к классу int перед выполением стандартных операторов, незнать это тяжкий грех!напримерlongolng n;long t = 0;n = t -1;что будет в n? -1? ага три раза оно там будет. там будет 0xffffffffчто для longolng не -1.на х86 это нормально, а вот х64... таких программистов надо растреливать.char c=\\''0\\'';string str = string(\\"Text\\")+c;приведение типов спасет этот мир.', 'да btw, советую почитать ISO стандарт c++.по стандарту кодchar c=\\''0\\'';string str=\\"Text\\"+c;этоclass char c = __int32(0x30)class string str = __int32(char*(\\"Text\\")) + __int32(c);т.е все приводится к классу int перед выполением стандартных операторов, незнать это тяжкий грех!напримерlongolng n;long t = 0;n = t -1;что будет в n? -1? ага три раза оно там будет. там будет 0xffffffffчто для longolng не -1.на х86 это нормально, а вот х64... таких программистов надо растреливать.char c=\\''0\\'';string str = string(\\"Text\\")+c;приведение типов спасет этот мир.', 'да btw, советую почитать ISO стандарт c++.по стандарту кодchar c=\\''0\\'';string str=\\"Text\\"+c;этоclass char c = __int32(0x30)class string str = __int32(char*(\\"Text\\")) + __int32(c);т.е все приводится к классу int перед выполением стандартных операторов, незнать это тяжкий грех!напримерlongolng n;long t = 0;n = t -1;что будет в n? -1? ага три раза оно там будет. там будет 0xffffffffчто для longolng не -1.на х86 это нормально, а вот х64... таких программистов надо растреливать.char c=\\''0\\'';string str = string(\\"Text\\")+c;приведение типов спасет этот мир.', 5, '2014-05-02 09:03:58', 0),
(20, 'shop_pushkina_luhovitsy', 'OsoeISGXYyuY', '5csspon7@yahoo.com', 'Heh. Thanks but...I think it\\''s important for inegtrity\\''s sake to leave the archives alone (mostly).There are many early posts that could do with a reinterpretation or fleshing out but their presence in their original form serves as a reminder to myself as to how and why the site works better as it is in the present, provides evidence as to my ignorance and tempered vision early on, and also it lets people can see what it is the site has evolved from.I have idly thought about a redo of some of them but laziness and the above reasons (read: rationalisation) have dissuaded me from putting thought into action. [occasionally I add newer or better links I find and I\\''ve posted a few updated images in later posts]It\\''s amusing to think that just browsing the archives can be an obsession; I guess curating it means I need medication!', 'Heh. Thanks but...I think it\\''s important for inegtrity\\''s sake to leave the archives alone (mostly).There are many early posts that could do with a reinterpretation or fleshing out but their presence in their original form serves as a reminder to myself as to how and why the site works better as it is in the present, provides evidence as to my ignorance and tempered vision early on, and also it lets people can see what it is the site has evolved from.I have idly thought about a redo of some of them but laziness and the above reasons (read: rationalisation) have dissuaded me from putting thought into action. [occasionally I add newer or better links I find and I\\''ve posted a few updated images in later posts]It\\''s amusing to think that just browsing the archives can be an obsession; I guess curating it means I need medication!', 'Heh. Thanks but...I think it\\''s important for inegtrity\\''s sake to leave the archives alone (mostly).There are many early posts that could do with a reinterpretation or fleshing out but their presence in their original form serves as a reminder to myself as to how and why the site works better as it is in the present, provides evidence as to my ignorance and tempered vision early on, and also it lets people can see what it is the site has evolved from.I have idly thought about a redo of some of them but laziness and the above reasons (read: rationalisation) have dissuaded me from putting thought into action. [occasionally I add newer or better links I find and I\\''ve posted a few updated images in later posts]It\\''s amusing to think that just browsing the archives can be an obsession; I guess curating it means I need medication!', 'Heh. Thanks but...I think it\\''s important for inegtrity\\''s sake to leave the archives alone (mostly).There are many early posts that could do with a reinterpretation or fleshing out but their presence in their original form serves as a reminder to myself as to how and why the site works better as it is in the present, provides evidence as to my ignorance and tempered vision early on, and also it lets people can see what it is the site has evolved from.I have idly thought about a redo of some of them but laziness and the above reasons (read: rationalisation) have dissuaded me from putting thought into action. [occasionally I add newer or better links I find and I\\''ve posted a few updated images in later posts]It\\''s amusing to think that just browsing the archives can be an obsession; I guess curating it means I need medication!', 5, '2014-05-02 10:00:44', 0),
(21, 'shop_chkalova', 'oYczaTw0v3x0', '1osjzu2ud@outlook.com', 'Les raissons has the rare dciosnititn of being one of the few machine books with an English correlate. Isaac de Caus was also an architect. He is best known for his work in England where he collaborated with Inigo Jones. His Nouvelle invention de lever l\\''eau was published in 1657. An English translation, New and Rare Inventions of Water Works appeared in 1659, the same year as Les raissons. It\\''s unclear to me if the text of the two works is identical but many of the plates are. Similarly, the exact relationship between Isaac and Solomon is unclear. Were they brothers? Uncle and nephew?', 'Les raissons has the rare dciosnititn of being one of the few machine books with an English correlate. Isaac de Caus was also an architect. He is best known for his work in England where he collaborated with Inigo Jones. His Nouvelle invention de lever l\\''eau was published in 1657. An English translation, New and Rare Inventions of Water Works appeared in 1659, the same year as Les raissons. It\\''s unclear to me if the text of the two works is identical but many of the plates are. Similarly, the exact relationship between Isaac and Solomon is unclear. Were they brothers? Uncle and nephew?', 'Les raissons has the rare dciosnititn of being one of the few machine books with an English correlate. Isaac de Caus was also an architect. He is best known for his work in England where he collaborated with Inigo Jones. His Nouvelle invention de lever l\\''eau was published in 1657. An English translation, New and Rare Inventions of Water Works appeared in 1659, the same year as Les raissons. It\\''s unclear to me if the text of the two works is identical but many of the plates are. Similarly, the exact relationship between Isaac and Solomon is unclear. Were they brothers? Uncle and nephew?', 'Les raissons has the rare dciosnititn of being one of the few machine books with an English correlate. Isaac de Caus was also an architect. He is best known for his work in England where he collaborated with Inigo Jones. His Nouvelle invention de lever l\\''eau was published in 1657. An English translation, New and Rare Inventions of Water Works appeared in 1659, the same year as Les raissons. It\\''s unclear to me if the text of the two works is identical but many of the plates are. Similarly, the exact relationship between Isaac and Solomon is unclear. Were they brothers? Uncle and nephew?', 5, '2014-05-02 11:11:44', 0),
(22, 'shop_pushkina_luhovitsy', '42YtkGkjIe', 'ym3tub8lb@mail.com', 'Time to face the music armed with this great infomration.', 'Time to face the music armed with this great infomration.', 'Time to face the music armed with this great infomration.', 'Time to face the music armed with this great infomration.', 5, '2014-05-03 07:33:49', 0),
(23, 'shop_verkhnyaya', '2vOg1grncvHW', 'ed7yxl4t2c@mail.com', 'At last! Something clear I can untserdand. Thanks!', 'At last! Something clear I can untserdand. Thanks!', 'At last! Something clear I can untserdand. Thanks!', 'At last! Something clear I can untserdand. Thanks!', 5, '2014-05-03 07:43:59', 0),
(24, 'shop_yesenina', 'eYt2xJgtTmv', 'kiz7gn0lj@outlook.com', 'Thank you oskitar!!jmorrison I\\''ve been tkinhing about your observation all day (welll...off and on) and I suppose I feel it\\''s like an esoteric artwork - say a Pollock - which can be appreciated simply for the image. But when tropes about it representing the inner mind (don\\''t be quoting me now - this is just a made up \\''for instance\\'') or thought processes or dreams are understood, then it contributes another layer to the experience. The original naive appreciation ought not get lost; you just get a different platform from which to admire it. Granted, some level of mystique might be lost if one was able to read arabic (or chinese or cyrillic for that matter). So literacy reduces our fantasies I guess. It\\''s actually a very good question about the relationship between the observer and the \\''form\\'' as you put it. Interesting psychology in there.', 'Thank you oskitar!!jmorrison I\\''ve been tkinhing about your observation all day (welll...off and on) and I suppose I feel it\\''s like an esoteric artwork - say a Pollock - which can be appreciated simply for the image. But when tropes about it representing the inner mind (don\\''t be quoting me now - this is just a made up \\''for instance\\'') or thought processes or dreams are understood, then it contributes another layer to the experience. The original naive appreciation ought not get lost; you just get a different platform from which to admire it. Granted, some level of mystique might be lost if one was able to read arabic (or chinese or cyrillic for that matter). So literacy reduces our fantasies I guess. It\\''s actually a very good question about the relationship between the observer and the \\''form\\'' as you put it. Interesting psychology in there.', 'Thank you oskitar!!jmorrison I\\''ve been tkinhing about your observation all day (welll...off and on) and I suppose I feel it\\''s like an esoteric artwork - say a Pollock - which can be appreciated simply for the image. But when tropes about it representing the inner mind (don\\''t be quoting me now - this is just a made up \\''for instance\\'') or thought processes or dreams are understood, then it contributes another layer to the experience. The original naive appreciation ought not get lost; you just get a different platform from which to admire it. Granted, some level of mystique might be lost if one was able to read arabic (or chinese or cyrillic for that matter). So literacy reduces our fantasies I guess. It\\''s actually a very good question about the relationship between the observer and the \\''form\\'' as you put it. Interesting psychology in there.', 'Thank you oskitar!!jmorrison I\\''ve been tkinhing about your observation all day (welll...off and on) and I suppose I feel it\\''s like an esoteric artwork - say a Pollock - which can be appreciated simply for the image. But when tropes about it representing the inner mind (don\\''t be quoting me now - this is just a made up \\''for instance\\'') or thought processes or dreams are understood, then it contributes another layer to the experience. The original naive appreciation ought not get lost; you just get a different platform from which to admire it. Granted, some level of mystique might be lost if one was able to read arabic (or chinese or cyrillic for that matter). So literacy reduces our fantasies I guess. It\\''s actually a very good question about the relationship between the observer and the \\''form\\'' as you put it. Interesting psychology in there.', 5, '2014-05-03 01:23:51', 0),
(25, 'shop_yesenina', 'Михаил', 'griih@bk.ru', 'тест', 'тест', 'тест', 'тест', 5, '2014-05-14 10:45:50', 0),
(26, 'shop_yesenina', 'Михаил', 'grimih@bk.ru', 'тест', 'тест', 'тест', 'тест', 5, '2014-05-14 10:46:37', 0),
(27, 'shop_yesenina', 'Зайцев', 'test@mail.ru', 'Достоинства', 'Недостатки', 'пожелания', 'комментарии', 5, '2014-05-14 10:48:10', 0),
(28, 'shop_yesenina', 'Михаил', 'grimih@bk.ru', 'тест', 'тест', 'тест', 'тест', 5, '2014-05-14 11:36:21', 0),
(29, 'shop_yesenina', 'Гриненко', 'grimih@bk.ru', 'test', 'test', 'test', 'test', 5, '2014-05-29 10:51:38', 0),
(30, 'shop_yesenina', 'TEst', 'grimih@bk.ru', 't', 't', 't', 't', 5, '2014-06-03 11:29:04', 0),
(31, 'shop_yesenina', 'ФИО', 'zaytsev.max90@gmail.com', 'Достоинства', 'Недостатки', 'пожелания', 'комментарии', 4, '2014-06-03 11:56:43', 0),
(32, 'shop_yesenina', 'ФИО', 'zaytsev.max90@gmail.com', 'Достоинства', 'Недостатки', 'пожелания', 'комментарии', 5, '2014-06-03 11:57:48', 0),
(33, 'shop_yesenina', 'Test', 'grimih@bk.ru', 'Test', 'Test', 'Test', 'Test', 5, '2014-06-03 11:57:57', 0),
(34, 'shop_yesenina', 'ФИО', 'zaytsev.max90@gmail.com', 'Достоинства', 'Недостатки', 'Недостатки', 'Недостатки', 5, '2014-06-03 12:00:56', 0),
(35, 'shop_yesenina', 'ФИО', 'zaytsev.max90@gmail.com', 'Достоинства', 'Недостатки', 'пожелания', 'комментарии', 5, '2014-06-03 12:03:12', 0),
(36, 'shop_yesenina', 'ФИО', 'zaytsev.max90@gmail.com', 'Достоинства', 'Недостатки', 'пожелания', 'комментарии', 5, '2014-06-03 12:04:25', 0),
(37, 'shop_yesenina', '546', 'zaytsev.max90@gmail.com', 'Достоинства', 'Достоинства', 'Достоинства', 'Достоинства', 5, '2014-06-03 12:08:46', 0),
(38, 'shop_yesenina', 'Test', 'atr@apelsin.ru', 'Test', 'Test', 'Test', 'Test', 5, '2014-06-06 09:50:15', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ContactsShop_Lang`
--

DROP TABLE IF EXISTS `ContactsShop_Lang`;
CREATE TABLE IF NOT EXISTS `ContactsShop_Lang` (
  `shop` varchar(100) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext,
  `info` longtext,
  PRIMARY KEY (`shop`,`lang`),
  KEY `fk_ContactsShop_Lang_2_idx` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ContactsShop_Lang`
--

INSERT INTO `ContactsShop_Lang` (`shop`, `lang`, `name`, `description`, `info`) VALUES
('shop_butyrki', 'eng', '1V 3rd Butyrki str.', NULL, '\n* To dial an extension number from a stationary phone, please switch the phone \nto the tone dialing (&laquo;*&raquo;, button or switch &laquo;TONE&raquo;). \nYou can begin dialing the number right after the start of the auto-answer. \nThe users of cellular phones can also dial the extension right after the \nstart of the auto-answer.<br />\nIf you come across some difficulties, please wait for the secretary to answer.\n'),
('shop_butyrki', 'rus', 'Бутырки 3, 1B', NULL, '\n* Для набора добавочного номера с городского телефона необходимо перевести его в \nтональный набор (&laquo;*&raquo;, кнопка либо переключатель &laquo;TONE&raquo;»). Набирать добавочный \nномер можно сразу после начала сообщения автоответчика. С сотовых \nтелефонов набирать добавочные номера можно так же после начала сообщения \nавтоответчика.<br />\nЕсли у Вас возникают какие-либо трудности - Вы можете дождаться ответа секретаря.\n'),
('shop_chernovitskaya', 'eng', '5 Chernovitskaya str.', NULL, '\n* To dial an extension number from a stationary phone, please switch the phone \nto the tone dialing (&laquo;*&raquo;, button or switch &laquo;TONE&raquo;). \nYou can begin dialing the number right after the start of the auto-answer. \nThe users of cellular phones can also dial the extension right after the \nstart of the auto-answer.<br />\nIf you come across some difficulties, please wait for the secretary to answer.\n'),
('shop_chernovitskaya', 'rus', 'Черновицкая, 5', NULL, '\n* Для набора добавочного номера с городского телефона необходимо перевести его в \nтональный набор (&laquo;*&raquo;, кнопка либо переключатель &laquo;TONE&raquo;»). Набирать добавочный \nномер можно сразу после начала сообщения автоответчика. С сотовых \nтелефонов набирать добавочные номера можно так же после начала сообщения \nавтоответчика.<br />\nЕсли у Вас возникают какие-либо трудности - Вы можете дождаться ответа секретаря.\n'),
('shop_chkalova', 'eng', '70B Chkalova str.', NULL, '\n* To dial an extension number from a stationary phone, please switch the phone \nto the tone dialing (&laquo;*&raquo;, button or switch &laquo;TONE&raquo;). \nYou can begin dialing the number right after the start of the auto-answer. \nThe users of cellular phones can also dial the extension right after the \nstart of the auto-answer.<br />\nIf you come across some difficulties, please wait for the secretary to answer.\n'),
('shop_chkalova', 'rus', 'Чекалова, 70Б', NULL, '\n* Для набора добавочного номера с городского телефона необходимо перевести его в \nтональный набор (&laquo;*&raquo;, кнопка либо переключатель &laquo;TONE&raquo;»). Набирать добавочный \nномер можно сразу после начала сообщения автоответчика. С сотовых \nтелефонов набирать добавочные номера можно так же после начала сообщения \nавтоответчика.<br />\nЕсли у Вас возникают какие-либо трудности - Вы можете дождаться ответа секретаря.\n'),
('shop_hangar_on_the_city_ring_road', 'eng', 'The 185th km of the city ring road (Hangar)', NULL, '\n* To dial an extension number from a stationary phone, please switch the phone \nto the tone dialing (&laquo;*&raquo;, button or switch &laquo;TONE&raquo;). \nYou can begin dialing the number right after the start of the auto-answer. \nThe users of cellular phones can also dial the extension right after the \nstart of the auto-answer.<br />\nIf you come across some difficulties, please wait for the secretary to answer.\n'),
('shop_hangar_on_the_city_ring_road', 'rus', 'Окружная дорога, 185км (Ангар)', NULL, '\n* Для набора добавочного номера с городского телефона необходимо перевести его в \nтональный набор (&laquo;*&raquo;, кнопка либо переключатель &laquo;TONE&raquo;»). Набирать добавочный \nномер можно сразу после начала сообщения автоответчика. С сотовых \nтелефонов набирать добавочные номера можно так же после начала сообщения \nавтоответчика.<br />\nЕсли у Вас возникают какие-либо трудности - Вы можете дождаться ответа секретаря.\n'),
('shop_mall_on_the_city_ring_road', 'eng', 'Shopping mall on the city ring road', NULL, '\n* To dial an extension number from a stationary phone, please switch the phone \nto the tone dialing (&laquo;*&raquo;, button or switch &laquo;TONE&raquo;). \nYou can begin dialing the number right after the start of the auto-answer. \nThe users of cellular phones can also dial the extension right after the \nstart of the auto-answer.<br />\nIf you come across some difficulties, please wait for the secretary to answer.\n'),
('shop_mall_on_the_city_ring_road', 'rus', 'ТЦ на окружной', NULL, '\n* Для набора добавочного номера с городского телефона необходимо перевести его в \nтональный набор (&laquo;*&raquo;, кнопка либо переключатель &laquo;TONE&raquo;»). Набирать добавочный \nномер можно сразу после начала сообщения автоответчика. С сотовых \nтелефонов набирать добавочные номера можно так же после начала сообщения \nавтоответчика.<br />\nЕсли у Вас возникают какие-либо трудности - Вы можете дождаться ответа секретаря.\n'),
('shop_ostrovskogo', 'eng', '109 Ostrovskogo str.', NULL, '\n* To dial an extension number from a stationary phone, please switch the phone \nto the tone dialing (&laquo;*&raquo;, button or switch &laquo;TONE&raquo;). \nYou can begin dialing the number right after the start of the auto-answer. \nThe users of cellular phones can also dial the extension right after the \nstart of the auto-answer.<br />\nIf you come across some difficulties, please wait for the secretary to answer.\n'),
('shop_ostrovskogo', 'rus', 'Островского, 109', NULL, '\n* Для набора добавочного номера с городского телефона необходимо перевести его в \nтональный набор (&laquo;*&raquo;, кнопка либо переключатель &laquo;TONE&raquo;»). Набирать добавочный \nномер можно сразу после начала сообщения автоответчика. С сотовых \nтелефонов набирать добавочные номера можно так же после начала сообщения \nавтоответчика.<br />\nЕсли у Вас возникают какие-либо трудности - Вы можете дождаться ответа секретаря.\n'),
('shop_pushkina_luhovitsy', 'eng', '107v Pushkina str.', NULL, '* To dial an extension number from a stationary phone, please switch the phone \r\nto the tone dialing (&laquo;*&raquo;, button or switch &laquo;TONE&raquo;). \r\nYou can begin dialing the number right after the start of the auto-answer. \r\nThe users of cellular phones can also dial the extension right after the \r\nstart of the auto-answer.<br />\r\nIf you come across some difficulties, please wait for the secretary to answer.'),
('shop_pushkina_luhovitsy', 'rus', 'Луховицы, Пушкина, 107В', NULL, '* Для набора добавочного номера с городского телефона необходимо перевести его в \r\nтональный набор (&laquo;*&raquo;, кнопка либо переключатель &laquo;TONE&raquo;»). Набирать добавочный \r\nномер можно сразу после начала сообщения автоответчика. С сотовых \r\nтелефонов набирать добавочные номера можно так же после начала сообщения \r\nавтоответчика.<br />\r\nЕсли у Вас возникают какие-либо трудности - Вы можете дождаться ответа секретаря.\r\n'),
('shop_shabulina', 'eng', '24B Proezd Shabulina', NULL, '\n* To dial an extension number from a stationary phone, please switch the phone \nto the tone dialing (&laquo;*&raquo;, button or switch &laquo;TONE&raquo;). \nYou can begin dialing the number right after the start of the auto-answer. \nThe users of cellular phones can also dial the extension right after the \nstart of the auto-answer.<br />\nIf you come across some difficulties, please wait for the secretary to answer.\n'),
('shop_shabulina', 'rus', 'Шабулина, 24Б', NULL, '\n* Для набора добавочного номера с городского телефона необходимо перевести его в \nтональный набор (&laquo;*&raquo;, кнопка либо переключатель &laquo;TONE&raquo;»). Набирать добавочный \nномер можно сразу после начала сообщения автоответчика. С сотовых \nтелефонов набирать добавочные номера можно так же после начала сообщения \nавтоответчика.<br />\nЕсли у Вас возникают какие-либо трудности - Вы можете дождаться ответа секретаря.\n'),
('shop_svyazi_sokolovka', 'eng', '10B Svyazi str., Sokolovka', NULL, '\n* To dial an extension number from a stationary phone, please switch the phone \nto the tone dialing (&laquo;*&raquo;, button or switch &laquo;TONE&raquo;). \nYou can begin dialing the number right after the start of the auto-answer. \nThe users of cellular phones can also dial the extension right after the \nstart of the auto-answer.<br />\nIf you come across some difficulties, please wait for the secretary to answer.\n'),
('shop_svyazi_sokolovka', 'rus', 'Соколовка, Связи, 10Б', NULL, '\n* Для набора добавочного номера с городского телефона необходимо перевести его в \nтональный набор (&laquo;*&raquo;, кнопка либо переключатель &laquo;TONE&raquo;»). Набирать добавочный \nномер можно сразу после начала сообщения автоответчика. С сотовых \nтелефонов набирать добавочные номера можно так же после начала сообщения \nавтоответчика.<br />\nЕсли у Вас возникают какие-либо трудности - Вы можете дождаться ответа секретаря.\n'),
('shop_verkhnyaya', 'eng', '50 Verkhnyaya str.', NULL, '\n* To dial an extension number from a stationary phone, please switch the phone \nto the tone dialing (&laquo;*&raquo;, button or switch &laquo;TONE&raquo;). \nYou can begin dialing the number right after the start of the auto-answer. \nThe users of cellular phones can also dial the extension right after the \nstart of the auto-answer.<br />\nIf you come across some difficulties, please wait for the secretary to answer.\n'),
('shop_verkhnyaya', 'rus', 'Верхняя, 50', NULL, '\n* Для набора добавочного номера с городского телефона необходимо перевести его в \nтональный набор (&laquo;*&raquo;, кнопка либо переключатель &laquo;TONE&raquo;»). Набирать добавочный \nномер можно сразу после начала сообщения автоответчика. С сотовых \nтелефонов набирать добавочные номера можно так же после начала сообщения \nавтоответчика.<br />\nЕсли у Вас возникают какие-либо трудности - Вы можете дождаться ответа секретаря.\n'),
('shop_yesenina', 'eng', '13 Yesenina str.', NULL, '\n* To dial an extension number from a stationary phone, please switch the phone \nto the tone dialing (&laquo;*&raquo;, button or switch &laquo;TONE&raquo;). \nYou can begin dialing the number right after the start of the auto-answer. \nThe users of cellular phones can also dial the extension right after the \nstart of the auto-answer.<br />\nIf you come across some difficulties, please wait for the secretary to answer.\n'),
('shop_yesenina', 'rus', 'Контакты магазина на Есенина 13', NULL, '\n* Для набора добавочного номера с городского телефона необходимо перевести его в \nтональный набор (&laquo;*&raquo;, кнопка либо переключатель &laquo;TONE&raquo;»). Набирать добавочный \nномер можно сразу после начала сообщения автоответчика. С сотовых \nтелефонов набирать добавочные номера можно так же после начала сообщения \nавтоответчика.<br />\nЕсли у Вас возникают какие-либо трудности - Вы можете дождаться ответа секретаря.\n'),
('shop_zubkovoy', 'eng', '27B Zubkovoy str.', NULL, '\n* To dial an extension number from a stationary phone, please switch the phone \nto the tone dialing (&laquo;*&raquo;, button or switch &laquo;TONE&raquo;). \nYou can begin dialing the number right after the start of the auto-answer. \nThe users of cellular phones can also dial the extension right after the \nstart of the auto-answer.<br />\nIf you come across some difficulties, please wait for the secretary to answer.\n'),
('shop_zubkovoy', 'rus', 'Зубковой, 27Б', NULL, '\n* Для набора добавочного номера с городского телефона необходимо перевести его в \nтональный набор (&laquo;*&raquo;, кнопка либо переключатель &laquo;TONE&raquo;»). Набирать добавочный \nномер можно сразу после начала сообщения автоответчика. С сотовых \nтелефонов набирать добавочные номера можно так же после начала сообщения \nавтоответчика.<br />\nЕсли у Вас возникают какие-либо трудности - Вы можете дождаться ответа секретаря.\n');

-- --------------------------------------------------------

--
-- Структура таблицы `ContactsUnits`
--

DROP TABLE IF EXISTS `ContactsUnits`;
CREATE TABLE IF NOT EXISTS `ContactsUnits` (
  `unit` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `feedbackEmail` varchar(45) DEFAULT NULL,
  `phone1` varchar(50) DEFAULT NULL,
  `additional1` varchar(9) DEFAULT NULL,
  `phone2` varchar(50) DEFAULT NULL,
  `additional2` varchar(9) DEFAULT NULL,
  `monH_s` int(2) unsigned DEFAULT NULL,
  `monM_s` int(2) unsigned DEFAULT NULL,
  `monH_e` int(2) unsigned DEFAULT NULL,
  `monM_e` int(2) unsigned DEFAULT NULL,
  `tueH_s` int(2) unsigned DEFAULT NULL,
  `tueM_s` int(2) unsigned DEFAULT NULL,
  `tueH_e` int(2) unsigned DEFAULT NULL,
  `tueM_e` int(2) unsigned DEFAULT NULL,
  `wedH_s` int(2) unsigned DEFAULT NULL,
  `wedM_s` int(2) unsigned DEFAULT NULL,
  `wedH_e` int(2) unsigned DEFAULT NULL,
  `wedM_e` int(2) unsigned DEFAULT NULL,
  `thuH_s` int(2) unsigned DEFAULT NULL,
  `thuM_s` int(2) unsigned DEFAULT NULL,
  `thuH_e` int(2) unsigned DEFAULT NULL,
  `thuM_e` int(2) unsigned DEFAULT NULL,
  `friH_s` int(2) unsigned DEFAULT NULL,
  `friM_s` int(2) unsigned DEFAULT NULL,
  `friH_e` int(2) unsigned DEFAULT NULL,
  `friM_e` int(2) unsigned DEFAULT NULL,
  `satH_s` int(2) unsigned DEFAULT NULL,
  `satM_s` int(2) unsigned DEFAULT NULL,
  `satH_e` int(2) unsigned DEFAULT NULL,
  `satM_e` int(2) unsigned DEFAULT NULL,
  `sunH_s` int(2) unsigned DEFAULT NULL,
  `sunM_s` int(2) unsigned DEFAULT NULL,
  `sunH_e` int(2) unsigned DEFAULT NULL,
  `sunM_e` int(2) unsigned DEFAULT NULL,
  PRIMARY KEY (`unit`),
  KEY `fk_ContactsUnits_1_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ContactsUnitsMaps`
--

DROP TABLE IF EXISTS `ContactsUnitsMaps`;
CREATE TABLE IF NOT EXISTS `ContactsUnitsMaps` (
  `unit` varchar(100) NOT NULL,
  `map` varchar(100) NOT NULL,
  PRIMARY KEY (`unit`,`map`),
  KEY `fk_ContactsUnitsMaps_2_idx` (`map`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ContactsUnitsTypes`
--

DROP TABLE IF EXISTS `ContactsUnitsTypes`;
CREATE TABLE IF NOT EXISTS `ContactsUnitsTypes` (
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ContactsUnitsTypes`
--

INSERT INTO `ContactsUnitsTypes` (`type`) VALUES
('departament'),
('shop'),
('studio_furniture');

-- --------------------------------------------------------

--
-- Структура таблицы `ContactsUnitsTypes_Lang`
--

DROP TABLE IF EXISTS `ContactsUnitsTypes_Lang`;
CREATE TABLE IF NOT EXISTS `ContactsUnitsTypes_Lang` (
  `type` varchar(100) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `typeName` varchar(100) NOT NULL,
  PRIMARY KEY (`type`,`lang`),
  KEY `fk_ContactsTypes_Lang_2_idx` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ContactsUnitsTypes_Lang`
--

INSERT INTO `ContactsUnitsTypes_Lang` (`type`, `lang`, `typeName`) VALUES
('departament', 'eng', 'Departament'),
('departament', 'rus', 'Отдел'),
('shop', 'eng', 'Shop'),
('shop', 'rus', 'Магазин'),
('studio_furniture', 'eng', 'Studio furniture'),
('studio_furniture', 'rus', 'Студия мебели');

-- --------------------------------------------------------

--
-- Структура таблицы `ContactsUnits_lang`
--

DROP TABLE IF EXISTS `ContactsUnits_lang`;
CREATE TABLE IF NOT EXISTS `ContactsUnits_lang` (
  `unit` varchar(100) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  `adress` varchar(200) DEFAULT NULL,
  `postAdress` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`unit`,`lang`),
  KEY `fk_ContactsUnits_lang_2_idx` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ContactsWorkers`
--

DROP TABLE IF EXISTS `ContactsWorkers`;
CREATE TABLE IF NOT EXISTS `ContactsWorkers` (
  `id` varchar(200) NOT NULL,
  `post` varchar(100) NOT NULL,
  `email1` varchar(200) NOT NULL,
  `email2` varchar(200) DEFAULT NULL,
  `phone1` varchar(100) DEFAULT NULL,
  `additional1` varchar(9) DEFAULT NULL,
  `phone2` varchar(100) DEFAULT NULL,
  `additional2` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_ContactsWorkers_1_idx` (`post`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ContactsWorkers`
--

INSERT INTO `ContactsWorkers` (`id`, `post`, `email1`, `email2`, `phone1`, `additional1`, `phone2`, `additional2`) VALUES
('Авраменко Нина Александровна', 'Менеджер', 'avramenko@apelsin.ru', NULL, '8(4912)240-220', '1103', '8(4912)502-020', '1103'),
('Андриянов Николай Николаевич', 'Менеджер', 'andreyanov@apelsin.ru', NULL, '8(496)639-6100', '2147', '8(496)639-6110', '2147'),
('Арабаджи Иван', 'Менеджер', 'mebel.apelsin@yandex.ru', NULL, '8(4912)513-220', '3504', NULL, NULL),
('Архипцева Вера Юрьевна', 'Менеджер', 'arhipceva@apelsin.ru', NULL, '8(4912)248-289', '2942', '8(4912)758-793', '2942'),
('Балашова Оксана Васильевна', 'Менеджер кредитного отдела', 'pashovkina@apelsin.ru', NULL, '8(496)639-6100', '2118', '8(496)639-6110', '2118'),
('Баранова Наталья', 'Менеджер', 'mebel.apelsin@yandex.ru', NULL, '8(4912)513-220', '3504', NULL, NULL),
('Барышев Олег Николаевич', 'Управляющий', 'baryshev@apelsin.ru', NULL, '8(4912)288-891', '2302', '8(4912)502-020', '2302'),
('Белякова Светлана Олеговна', 'Менеджер кредитного отдела', 'sheretuska@mail.ru', NULL, '8(4912)950-377', '3241', '8(4912)950-380', '3241'),
('Бородин Игорь Викторович', 'Управляющий', 'mebel.apelsin@yandex.ru', NULL, '8(905)187-67-70', NULL, NULL, NULL),
('Вахитов Фарит Анварович', 'Управляющий', 'vahitov@apelsin.ru', NULL, '8(4912)240-220', '3016', NULL, NULL),
('Вековищева Екатерина Сергеевна', 'Менеджер кредитного отдела', 'kredit_bars@apelsin.ru', NULL, '8(4912)240-220', '3047', '8(4912)502-020', '3047'),
('Водопьянов Алексей Евгеньевич', 'Менеджер', 'a_vodopyanov@mail.ru', NULL, '8(4912)240-220', '1107', '8(951)102-68-40', NULL),
('Гриненко Галина Юрьевна', 'Менеджер кредитного отдела', 'kredit_bars@apelsin.ru', NULL, '8(4912)240-220', '5161', '8(4912)502-020', '5161'),
('Гришина Марина Александровна', 'Менеджер', 'grishina@apelsin.ru', NULL, '8(4912)240-220', '3049', '8(4912)502-020', '3049'),
('Гуленков Александр', 'Менеджер', 'mebel.apelsin@yandex.ru', NULL, '8(4912)240-220', '5151', NULL, NULL),
('Гуськова Валентина', 'Маркетолог', 'guskova@apelsin.ru', NULL, NULL, NULL, NULL, NULL),
('Давыдова Татьяна Игоревна', 'Ст. менеджер', 'davidova_t@apelsin.ru', NULL, '8(4912)950-148', '3316', '8(4912)950-149', '3316'),
('Довыдова Ольга Сергеевна', 'Менеджер', 'davidova@apelsin.ru', NULL, '8(4912)950-378', '3401', '8(4912)950-379', '3401'),
('Дроздова Нина', 'Менеджер', 'mebel.apelsin@yandex.ru', NULL, '8(4912)240-220', '5151', NULL, NULL),
('Егоров Дмитрий Николаевич', 'Управляющий', 'egora86@bk.ru', NULL, '8(4912)307-355', '2503', '8(4912)307-356', '2503'),
('Егорова Светлана Сергеевна', 'Менеджер', 'mail@apelsin.ru', NULL, '8(4912)950-395', '3542', '8(4912)950-340', '3542'),
('Епишин Алексей', 'Маркетолог', 'epishin@apelsin.ru', NULL, NULL, NULL, NULL, NULL),
('Желтенко Елена Васильевна', 'Менеджер', 'lovkova28@mail.ru', NULL, '8(4912)950-148', '1112', '8(4912)950-149', '1112'),
('Жилина Анастасия Валерьевна', 'Ст. менеджер', 'zhilina@apelsin.ru', NULL, '8(4912)950-378', '3403', '8(4912)950-379', '3403'),
('Золотарёва Юлия Николаевна', 'Менеджер', 'mail@apelsin.ru', NULL, '8(4912)950-378', '3401', '8(4912)950-379', '3401'),
('Игнатьева Татьяна Владимировна', 'Менеджер', 'ignateva@apelsin.ru', NULL, '8(4912)950-148', '1118', '8(4912)950-149', '1118'),
('Исаков Владислав Александрович', 'Менеджер', 'isakov@apelsin.ru', NULL, '8(910)904-28-80', NULL, '8(4912)240-220', '3104'),
('Кадыров Фархад Тахирович', 'Управляющий', 'kadyrov@apelsin.ru', NULL, '8(4912)240-220', '5005', NULL, NULL),
('Калабухова Анна Викторовна', 'Менеджер кредитного отдела', 'kredit_bars@apelsin.ru', NULL, '8(4912)240-220', '2118', '8(4912)502-020', '2118'),
('Калинин Сергей', 'Маркетолог', 'kalinin@apelsin.ru', NULL, NULL, NULL, NULL, NULL),
('Калугина Олеся', 'Менеджер', 'mebel.apelsin@yandex.ru', NULL, '8(4912)226-160', '2901', '8(951)103-85-41', NULL),
('Кандалова Светлана', 'Маркетолог', 'kandalova@apelsin.ru', NULL, NULL, NULL, NULL, NULL),
('Клюкин Борис', 'Маркетолог', 'klyukin@apelsin.ru', NULL, NULL, NULL, NULL, NULL),
('Кованова Ольга Михайловна', 'Менеджер', 'kovanova@apelsin.ru', NULL, '8(4912)9240-220', '1108', NULL, NULL),
('Козырев Денис Владимирович', 'Менеджер', 'kozyrev@apelsin.ru', NULL, '8(965)712-00-75', NULL, '8(968)081-58-30', NULL),
('Комарова Кристина Игоревна', 'Менеджер', 'komarova@apelsin.ru', NULL, '8(4912)240-220', '1117', '8(4912)502-020', '1117'),
('Копылова Татьяна Викторовна', 'Менеджер', 'kopylova@apelsin.ru', NULL, '8(4912)950-148', '3322', '8(4912)950-149', '3322'),
('Коркина Ксения Александровна', 'Менеджер', 'mail@apelsin.ru', NULL, '8(4912)240-220', '5004', '8(4912)502-020', '5004'),
('Коршунова Ольга Сергеевна', 'Менеджер', 'mail@apelsin.ru', NULL, '8(4912)950-395', '3508', '8(4912)950-340', '3508'),
('Ксенофонтова Любовь Владимировна', 'Менеджер кредитного отдела', 'kozlovtseva@apelsin.ru', NULL, '8(4912)950-395', '3531', '8(4912)950-340', '3531'),
('Кузнецов Геннадий Васильевич', 'Начальник отдела', 'kuznetsov_gennadiy@apelsin.ru', NULL, '8(920)956-63-00', NULL, '8(4912)240-220', '425'),
('Кузнецов Евгений', 'Маркетолог', 'kuznetsov_evgeniy@apelsin.ru', NULL, NULL, NULL, NULL, NULL),
('Кузнецова Светлана Николаевна', 'Менеджер', 'mail@apelsin.ru', NULL, '8(4912)240-220', '5004', '8(4912)502-020', '5004'),
('Кузьмин Александр Анатольевич', 'Менеджер', 'kuzmin@apelsin.ru', NULL, '8(4912)248-289', '2403', '8(4912)758-793', '2403'),
('Лежепекова Альвина', 'Менеджер', 'mebel.apelsin@yandex.ru', NULL, '8(4912)240-220', '5152', NULL, NULL),
('Люлин Алексей Алексеевич', 'Управляющий', 'lyulin@apelsin.ru', NULL, '8(4912)950-377', '3244', NULL, NULL),
('Марсакова Наталья Васильевна', 'Менеджер', 'mail@apelsin.ru', NULL, '8(4912)288-891', '2303', '8(4912)502-020', '2303'),
('Маслова Татьяна Викторовна', 'Управляющий', 'maslova@apelsin.ru', NULL, '8(4912)950-395', '3525', '8(4912)950-340', '3525'),
('Моторина Лидия Николаевна', 'Менеджер', 'motorina@apelsin.ru', NULL, '8(4912)240-220', '3014', '8(4912)502-020', '3014'),
('Нестеров Сергей Викторович', 'Менеджер', 'nesterov@apelsin.ru', NULL, '8(4912)240-220', '3049', '8(4912)502-020', '3049'),
('Нечайкин Павел', 'Маркетолог', 'nechaikin@apelsin.ru', NULL, NULL, NULL, NULL, NULL),
('Овчинников Евгений Александрович', 'Управляющий', 'ovchinnikov@apelsin.ru', NULL, '8(4912)226-160', '2928', '8(4912)502-020', '2928'),
('Осьмухина Ольга Николаевна', 'Менеджер', 'osmuhina_o@apelsin.ru', NULL, '8(4912)240-220', '5004', NULL, NULL),
('Павлова Ольга Владиславовна', 'Менеджер', 'pavlova_o@apelsin.ru', NULL, '8(4912)950-395', '3507', '8(4912)950-340', '3507'),
('Патрина Екатерина Александровна', 'Менеджер', 'mail@apelsin.ru', NULL, '8(4912)240-220', '5004', '8(4912)502-020', '5004'),
('Петрова Ирина Владимировна', 'Менеджер', 'irinapetrova1973@gmail.com', NULL, '8(4912)307-355', '2501', '8(4912)307-356', '2501'),
('Плащинская Алла Вячеславовна', 'Менеджер', 'plaschinskaya@apelsin.ru', NULL, '8(4912)226-160', '2905', '8(4912)502-020', '2905'),
('Плетнев Андрей Александрович', 'Ст. менеджер', 'pletnev@apelsin.ru', NULL, '8(4912)240-220', '5001', '8(4912)502-020', '5001'),
('Прохорова Надежда Александровна', 'Менеджер', 'prohorova@apelsin.ru', NULL, '8(4912)226-160', '2702', '8(4912)502-020', '2702'),
('Решетников Анатолий Павлович', 'Менеджер', 'reshetnikov@apelsin.ru', NULL, '8(4912)240-220', '1114', '8(903)837-27-95', NULL),
('Родин Сергей Иванович', 'Менеджер', 'rodin.apelsin@gmail.com', NULL, '8(4912)240-220', '1116', '8(4912)502-020', '1116'),
('Родина Маргарита Витальевна', 'Ст. менеджер', 'rodina@apelsin.ru', NULL, '8(4912)226-160', '2924', '8(4912)502-020', '2924'),
('Сазонова Оксана', 'Менеджер', 'mebel.apelsin@yandex.ru', NULL, '8(920)971-37-22', NULL, '8(4912)226-160', '2902'),
('Саморукова Елена', 'Менеджер', 'mebel.apelsin@yandex.ru', NULL, '8(4912)240-220', '5151', NULL, NULL),
('Солдатова Марина Николаевна', 'Менеджер', 'soldatova@apelsin.ru', NULL, '8(4912)248-289', '2401', '8(4912)207-183', '2401'),
('Сорогин Денис Юрьевич', 'Менеджер', 'sorogin@apelsin.ru', NULL, '8(4912)950-148', '1115', '8(4912)950-149', '1115'),
('Стрельченко Галина Михайловна', 'Ст. менеджер', 'mail@apelsin.ru', NULL, '8(4912)950-377', '3222', '8(4912)950-380', '3222'),
('Суркова Анастасия Николаевна', 'Менеджер', 'surkova@apelsin.ru', NULL, '8(4912)240-220', '3048', '8(4912)502-020', '3048'),
('Тарасова Ольга Николаевна', 'Менеджер', 'tarasova@apelsin.ru', NULL, '8(4912)248-289', '2409', '8(4912)207-183', '2409'),
('Трухин Максим Александрович', 'Менеджер', 'truchinmaksim@gmail.com', NULL, '8(4912)240-220', '3049', '8(4912)502-020', '3049'),
('Федяева Екатерина Владиславовна', 'Менеджер кредитного отдела', 'kozlovtseva@apelsin.ru', NULL, '8(4912)950-395', '3531', '8(4912)950-340', '3531'),
('Филиппов Денис Юрьевич', 'Менеджер', 'philippov@apelsin.ru', NULL, '8(4912)240-220', '3101', '8(4912)950-378', '3101'),
('Филькова Наталья Юрьевна', 'Ст. менеджер', 'filkova@apelsin.ru', NULL, '8(4912)307-355', '2501', '8(4912)307-356', '2501'),
('Фомина Елена Павловна', 'Менеджер', 'fomina_e@apelsin.ru', NULL, '8(496)639-6100', '2123', '8(496)639-6110', '2123'),
('Хоненев Дмитрий', 'Менеджер', 'mebel.apelsin@yandex.ru', NULL, '8(952)126-59-95', NULL, '8(4912)226-160', '2902'),
('Хохлова Надежда Александровна', 'Управляющий', 'hohlova@apelsin.ru', NULL, '8(496)639-6100', '2135', '8(496)639-6110', '2135'),
('Чикова Галина Викторовна', 'Управляющий', 'chikova@apelsin.ru', NULL, '8(4912)226-160', '2703', '8(4912)502-020', '2703'),
('Юсова Анастасия Викторовна', 'Менеджер', 'yusova@apelsin.ru', NULL, '8(4912)950-148', '3322', '8(4912)950-149', '3322');

-- --------------------------------------------------------

--
-- Структура таблицы `ContactsWorkersList`
--

DROP TABLE IF EXISTS `ContactsWorkersList`;
CREATE TABLE IF NOT EXISTS `ContactsWorkersList` (
  `alias` varchar(100) NOT NULL,
  `column` int(1) unsigned NOT NULL DEFAULT '3',
  PRIMARY KEY (`alias`),
  UNIQUE KEY `alias_UNIQUE` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ContactsWorkersList`
--

INSERT INTO `ContactsWorkersList` (`alias`, `column`) VALUES
('Бутырки', 3),
('Верхняя', 3),
('Есенина', 3),
('Зубковой', 3),
('Луховицы', 3),
('Окружная (Ангар)', 3),
('Окружная (ТЦ)', 3),
('Островского', 3),
('Отдел комплектации', 3),
('Отдел маркетинга', 3),
('Соколовка', 3),
('Студия мебели', 3),
('Студия мебели на Есенина', 3),
('Студия мебели на Островского', 3),
('Студия мебели на Шабулина', 3),
('Черновицкая', 3),
('Чкалова', 3),
('Шабулина', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `ContactsWorkersPosts`
--

DROP TABLE IF EXISTS `ContactsWorkersPosts`;
CREATE TABLE IF NOT EXISTS `ContactsWorkersPosts` (
  `alias` varchar(100) NOT NULL,
  `importance` int(2) unsigned DEFAULT NULL,
  PRIMARY KEY (`alias`),
  UNIQUE KEY `alias_UNIQUE` (`alias`),
  UNIQUE KEY `importance` (`importance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ContactsWorkersPosts`
--

INSERT INTO `ContactsWorkersPosts` (`alias`, `importance`) VALUES
('Управляющий', 1),
('Начальник отдела', 2),
('Ст. менеджер', 3),
('Менеджер кредитного отдела', 4),
('Маркетолог', 5),
('Менеджер', 6);

-- --------------------------------------------------------

--
-- Структура таблицы `ContactsWorkersPosts_Lang`
--

DROP TABLE IF EXISTS `ContactsWorkersPosts_Lang`;
CREATE TABLE IF NOT EXISTS `ContactsWorkersPosts_Lang` (
  `post` varchar(100) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `info` text,
  PRIMARY KEY (`post`,`lang`),
  KEY `fk_ContactsWorkersPosts_Lang_2_idx` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ContactsWorkersPosts_Lang`
--

INSERT INTO `ContactsWorkersPosts_Lang` (`post`, `lang`, `name`, `description`, `info`) VALUES
('Маркетолог', 'eng', 'Marketing manager', NULL, NULL),
('Маркетолог', 'rus', 'Маркетолог', NULL, NULL),
('Менеджер', 'eng', 'Sales assistant', NULL, NULL),
('Менеджер', 'rus', 'Менеджер', NULL, NULL),
('Менеджер кредитного отдела', 'eng', 'Credit department manager', NULL, NULL),
('Менеджер кредитного отдела', 'rus', 'Менеджер кредитного отдела', NULL, NULL),
('Начальник отдела', 'eng', 'Department head', NULL, NULL),
('Начальник отдела', 'rus', 'Начальник отдела', NULL, NULL),
('Ст. менеджер', 'eng', 'Senior sales assistant', NULL, NULL),
('Ст. менеджер', 'rus', 'Ст. менеджер', NULL, NULL),
('Управляющий', 'eng', 'Store manager', NULL, NULL),
('Управляющий', 'rus', 'Управляющий', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `ContactsWorkers_has_ContactsWorkersList`
--

DROP TABLE IF EXISTS `ContactsWorkers_has_ContactsWorkersList`;
CREATE TABLE IF NOT EXISTS `ContactsWorkers_has_ContactsWorkersList` (
  `contact` varchar(200) NOT NULL,
  `list` varchar(100) NOT NULL,
  PRIMARY KEY (`contact`,`list`),
  KEY `fk_ContactsWorkers_has_ContactsWorkersList_ContactsWorkersL_idx` (`list`),
  KEY `fk_ContactsWorkers_has_ContactsWorkersList_ContactsWorkers1_idx` (`contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ContactsWorkers_has_ContactsWorkersList`
--

INSERT INTO `ContactsWorkers_has_ContactsWorkersList` (`contact`, `list`) VALUES
('Авраменко Нина Александровна', 'Есенина'),
('Андриянов Николай Николаевич', 'Луховицы'),
('Арабаджи Иван', 'Студия мебели на Шабулина'),
('Архипцева Вера Юрьевна', 'Островского'),
('Балашова Оксана Васильевна', 'Луховицы'),
('Баранова Наталья', 'Студия мебели на Шабулина'),
('Барышев Олег Николаевич', 'Соколовка'),
('Белякова Светлана Олеговна', 'Зубковой'),
('Бородин Игорь Викторович', 'Студия мебели на Есенина'),
('Вахитов Фарит Анварович', 'Окружная (ТЦ)'),
('Вековищева Екатерина Сергеевна', 'Окружная (ТЦ)'),
('Водопьянов Алексей Евгеньевич', 'Есенина'),
('Гриненко Галина Юрьевна', 'Есенина'),
('Гришина Марина Александровна', 'Окружная (ТЦ)'),
('Гуленков Александр', 'Студия мебели на Шабулина'),
('Гуськова Валентина', 'Отдел маркетинга'),
('Давыдова Татьяна Игоревна', 'Верхняя'),
('Довыдова Ольга Сергеевна', 'Чкалова'),
('Дроздова Нина', 'Студия мебели на Есенина'),
('Егоров Дмитрий Николаевич', 'Окружная (Ангар)'),
('Егорова Светлана Сергеевна', 'Шабулина'),
('Епишин Алексей', 'Отдел маркетинга'),
('Желтенко Елена Васильевна', 'Верхняя'),
('Жилина Анастасия Валерьевна', 'Бутырки'),
('Золотарёва Юлия Николаевна', 'Бутырки'),
('Игнатьева Татьяна Владимировна', 'Верхняя'),
('Исаков Владислав Александрович', 'Отдел комплектации'),
('Кадыров Фархад Тахирович', 'Есенина'),
('Калабухова Анна Викторовна', 'Луховицы'),
('Калинин Сергей', 'Отдел маркетинга'),
('Калугина Олеся', 'Студия мебели на Островского'),
('Кандалова Светлана', 'Отдел маркетинга'),
('Клюкин Борис', 'Отдел маркетинга'),
('Кованова Ольга Михайловна', 'Есенина'),
('Козырев Денис Владимирович', 'Отдел комплектации'),
('Комарова Кристина Игоревна', 'Окружная (ТЦ)'),
('Копылова Татьяна Викторовна', 'Верхняя'),
('Коркина Ксения Александровна', 'Есенина'),
('Коршунова Ольга Сергеевна', 'Шабулина'),
('Ксенофонтова Любовь Владимировна', 'Шабулина'),
('Кузнецов Геннадий Васильевич', 'Отдел комплектации'),
('Кузнецов Евгений', 'Отдел маркетинга'),
('Кузнецова Светлана Николаевна', 'Есенина'),
('Кузьмин Александр Анатольевич', 'Чкалова'),
('Лежепекова Альвина', 'Студия мебели на Есенина'),
('Люлин Алексей Алексеевич', 'Зубковой'),
('Марсакова Наталья Васильевна', 'Соколовка'),
('Маслова Татьяна Викторовна', 'Шабулина'),
('Моторина Лидия Николаевна', 'Окружная (ТЦ)'),
('Нестеров Сергей Викторович', 'Окружная (ТЦ)'),
('Нечайкин Павел', 'Отдел маркетинга'),
('Овчинников Евгений Александрович', 'Островского'),
('Овчинников Евгений Александрович', 'Чкалова'),
('Осьмухина Ольга Николаевна', 'Есенина'),
('Павлова Ольга Владиславовна', 'Шабулина'),
('Патрина Екатерина Александровна', 'Есенина'),
('Петрова Ирина Владимировна', 'Окружная (Ангар)'),
('Плащинская Алла Вячеславовна', 'Островского'),
('Плетнев Андрей Александрович', 'Есенина'),
('Прохорова Надежда Александровна', 'Черновицкая'),
('Решетников Анатолий Павлович', 'Есенина'),
('Родин Сергей Иванович', 'Есенина'),
('Родина Маргарита Витальевна', 'Островского'),
('Сазонова Оксана', 'Студия мебели на Островского'),
('Саморукова Елена', 'Студия мебели на Есенина'),
('Солдатова Марина Николаевна', 'Чкалова'),
('Сорогин Денис Юрьевич', 'Верхняя'),
('Стрельченко Галина Михайловна', 'Зубковой'),
('Суркова Анастасия Николаевна', 'Окружная (ТЦ)'),
('Тарасова Ольга Николаевна', 'Чкалова'),
('Трухин Максим Александрович', 'Окружная (ТЦ)'),
('Федяева Екатерина Владиславовна', 'Шабулина'),
('Филиппов Денис Юрьевич', 'Отдел комплектации'),
('Филькова Наталья Юрьевна', 'Окружная (Ангар)'),
('Фомина Елена Павловна', 'Луховицы'),
('Хоненев Дмитрий', 'Студия мебели на Островского'),
('Хохлова Надежда Александровна', 'Луховицы'),
('Чикова Галина Викторовна', 'Черновицкая'),
('Юсова Анастасия Викторовна', 'Верхняя');

-- --------------------------------------------------------

--
-- Структура таблицы `ContactsWorkers_Lang`
--

DROP TABLE IF EXISTS `ContactsWorkers_Lang`;
CREATE TABLE IF NOT EXISTS `ContactsWorkers_Lang` (
  `worker` varchar(200) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `fio` varchar(200) NOT NULL,
  `info` text,
  PRIMARY KEY (`worker`,`lang`),
  KEY `fk_ContactsWorkers_Lang_2_idx` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ContactsWorkers_Lang`
--

INSERT INTO `ContactsWorkers_Lang` (`worker`, `lang`, `fio`, `info`) VALUES
('Авраменко Нина Александровна', 'eng', 'Avramenko Nina Aleksandrovna', NULL),
('Авраменко Нина Александровна', 'rus', 'Авраменко Нина Александровна', NULL),
('Андриянов Николай Николаевич', 'eng', 'Andriyanov Nikolay Nikolayevich', ''),
('Андриянов Николай Николаевич', 'rus', 'Андриянов Николай Николаевич', ''),
('Арабаджи Иван', 'eng', 'Arabadzhi Ivan', ''),
('Арабаджи Иван', 'rus', 'Арабаджи Иван', ''),
('Архипцева Вера Юрьевна', 'eng', 'Arhipceva Vera Jurevna', ''),
('Архипцева Вера Юрьевна', 'rus', 'Архипцева Вера Юрьевна', ''),
('Балашова Оксана Васильевна', 'eng', 'Balashova Oksana Vasilevna', ''),
('Балашова Оксана Васильевна', 'rus', 'Балашова Оксана Васильевна', ''),
('Баранова Наталья', 'eng', 'Baranova Natalya', NULL),
('Баранова Наталья', 'rus', 'Баранова Наталья', NULL),
('Барышев Олег Николаевич', 'eng', 'Baryshev Oleg Nikolaevich', ''),
('Барышев Олег Николаевич', 'rus', 'Барышев Олег Николаевич', ''),
('Белякова Светлана Олеговна', 'eng', 'Belyakova Svetlana Olegovna', ''),
('Белякова Светлана Олеговна', 'rus', 'Белякова Светлана Олеговна', ''),
('Бородин Игорь Викторович', 'eng', 'Igor Viktorovich Borodin', NULL),
('Бородин Игорь Викторович', 'rus', 'Бородин Игорь Викторович', NULL),
('Вахитов Фарит Анварович', 'eng', 'Vakhitov Farit Anvarovich', ''),
('Вахитов Фарит Анварович', 'rus', 'Вахитов Фарит Анварович', ''),
('Вековищева Екатерина Сергеевна', 'eng', 'Vekovishcheva Ekaterina Sergeevna', ''),
('Вековищева Екатерина Сергеевна', 'rus', 'Вековищева Екатерина Сергеевна', ''),
('Водопьянов Алексей Евгеньевич', 'eng', 'Vodopyanov Aleksey Evgenevich', ''),
('Водопьянов Алексей Евгеньевич', 'rus', 'Водопьянов Алексей Евгеньевич', ''),
('Гриненко Галина Юрьевна', 'eng', 'Grinenko Galina Yurevna', ''),
('Гриненко Галина Юрьевна', 'rus', 'Гриненко Галина Юрьевна', ''),
('Гришина Марина Александровна', 'eng', 'Grishina Marina Aleksandrovna', ''),
('Гришина Марина Александровна', 'rus', 'Гришина Марина Александровна', ''),
('Гуленков Александр', 'eng', 'Gulenkov Alexander', NULL),
('Гуленков Александр', 'rus', 'Гуленков Александр', NULL),
('Гуськова Валентина', 'eng', 'Valentina Guskova', 'Wallpapers, chandeliers, clocks, polystyrene foam and polyurethane products.'),
('Гуськова Валентина', 'rus', 'Гуськова Валентина', 'Обои, люстры, часы, изделия из пенополистирола и полиуретана.'),
('Давыдова Татьяна Игоревна', 'eng', 'Davydova Tatyana Igorevna', ''),
('Давыдова Татьяна Игоревна', 'rus', 'Давыдова Татьяна Игоревна ', ''),
('Довыдова Ольга Сергеевна', 'eng', 'Dovydova Olga Sergeevna', ''),
('Довыдова Ольга Сергеевна', 'rus', 'Довыдова Ольга Сергеевна', ''),
('Дроздова Нина', 'eng', 'Drozdova Nina', ''),
('Дроздова Нина', 'rus', 'Дроздова Нина', ''),
('Егоров Дмитрий Николаевич', 'eng', 'Egorov Dmitriy Nikolaevich', ''),
('Егоров Дмитрий Николаевич', 'rus', 'Егоров Дмитрий Николаевич', ''),
('Егорова Светлана Сергеевна', 'eng', 'Egorova Svetlana Sergeevna', ''),
('Егорова Светлана Сергеевна', 'rus', 'Егорова Светлана Сергеевна', ''),
('Епишин Алексей', 'eng', 'Aleksey Yepishin', 'Ceramic tile.'),
('Епишин Алексей', 'rus', 'Епишин Алексей', 'Плитка керамическая.'),
('Желтенко Елена Васильевна', 'eng', 'Zheltenko Elena Vassilyevna', ''),
('Желтенко Елена Васильевна', 'rus', 'Желтенко Елена Васильевна', ''),
('Жилина Анастасия Валерьевна', 'eng', 'Zilina Anastasia Valerevna', ''),
('Жилина Анастасия Валерьевна', 'rus', 'Жилина Анастасия Валерьевна', ''),
('Золотарёва Юлия Николаевна', 'eng', 'Zolotarjova Julija Nikolaevna', ''),
('Золотарёва Юлия Николаевна', 'rus', 'Золотарёва Юлия Николаевна', ''),
('Игнатьева Татьяна Владимировна', 'eng', 'Ignateva Tatyana Vladimirovna', NULL),
('Игнатьева Татьяна Владимировна', 'rus', 'Игнатьева Татьяна Владимировна', NULL),
('Исаков Владислав Александрович', 'eng', 'sakov Vladislav Aleksandrovich', '1V 3rd Butyrki str.<a href="./1v_3rd_butyrki_str/eng/">[move]</a>'),
('Исаков Владислав Александрович', 'rus', 'Исаков Владислав Александрович', '3 Бутырки, 1В.<a href="./1v_3rd_butyrki_str/rus/">[перейти]</a>'),
('Кадыров Фархад Тахирович', 'eng', 'Kadyrov Farhad Tahirovich', NULL),
('Кадыров Фархад Тахирович', 'rus', 'Кадыров Фархад Тахирович ', NULL),
('Калабухова Анна Викторовна', 'eng', 'Kalabuhova Anna Viktorovna', ''),
('Калабухова Анна Викторовна', 'rus', 'Калабухова Анна Викторовна', ''),
('Калинин Сергей', 'eng', 'Sergei Kalinin', 'Floor coverings.'),
('Калинин Сергей', 'rus', 'Калинин Сергей', 'Напольные покрытия.'),
('Калугина Олеся', 'eng', 'Калугина Олеся', ''),
('Калугина Олеся', 'rus', 'Калугина Олеся', ''),
('Кандалова Светлана', 'eng', 'Svetlana Kandalova', 'Dry mixes, profiles and accessories, plasterboard.'),
('Кандалова Светлана', 'rus', 'Кандалова Светлана', 'Сухие смеси, профиль и комплектующие, гипсокартон.'),
('Клюкин Борис', 'eng', 'Boris Klyukin', 'Facade systems and siding, MDF and PVC panels, rolled metal products, heat insulation, adhesives and sealants, paints and varnishes, ceiling systems, roofing.'),
('Клюкин Борис', 'rus', 'Клюкин Борис', 'Фасадные системы и сайдинг, панели пвх и мдф, металлопрокат, теплоизоляция, клея и герметики, лакокрасочная продукция, потолочные системы, кровля.'),
('Кованова Ольга Михайловна', 'eng', 'Kovanova Olga Michailovna', ''),
('Кованова Ольга Михайловна', 'rus', 'Кованова Ольга Михайловна', ''),
('Козырев Денис Владимирович', 'eng', 'Denis Vladimirovich Kozyrev', '1V 3rd Butyrki str.<a href="./1v_3rd_butyrki_str/rus/">[more]</a><br>\r\n170V Pushkina str., Luhovicy <a href="./170v_pushkina_str_luhovitsy/rus/">[more]</a>'),
('Козырев Денис Владимирович', 'rus', 'Козырев Денис Владимирович', '3 Бутырки, 1В.<a href="./1v_3rd_butyrki_str/rus/">[перейти]</a><br>\r\nЛуховицы,  Пушкина 170B.<a href="./170v_pushkina_str_luhovitsy/rus/">[перейти]</a>'),
('Комарова Кристина Игоревна', 'eng', 'Komarova Kristina Igorevna', ''),
('Комарова Кристина Игоревна', 'rus', 'Комарова Кристина Игоревна', ''),
('Копылова Татьяна Викторовна', 'eng', 'Kopylova Tatyana Viktorovna', ''),
('Копылова Татьяна Викторовна', 'rus', 'Копылова Татьяна Викторовна', ''),
('Коркина Ксения Александровна', 'eng', 'Korkina Kseniya Aleksandrovna', ''),
('Коркина Ксения Александровна', 'rus', 'Коркина Ксения Александровна', ''),
('Коршунова Ольга Сергеевна', 'eng', 'Korshunova Olga Sergeevna', ''),
('Коршунова Ольга Сергеевна', 'rus', 'Коршунова Ольга Сергеевна', ''),
('Ксенофонтова Любовь Владимировна', 'eng', 'Ksenofontova Lyubov Vladimirovna', ''),
('Ксенофонтова Любовь Владимировна', 'rus', 'Ксенофонтова Любовь Владимировна', ''),
('Кузнецов Геннадий Васильевич', 'eng', 'Kuznetsov Gennadiy Vasilevich', '1V 3rd Butyrki str.<a href="./1v_3rd_butyrki_str/eng/">[move]</a>'),
('Кузнецов Геннадий Васильевич', 'rus', 'Кузнецов Геннадий Васильевич', '3 Бутырки, 1В.<a href="./1v_3rd_butyrki_str/rus/">[перейти]</a>'),
('Кузнецов Евгений', 'eng', 'Evgeniy Kuznetsov', 'Heating and water supply products, sanitary ware.'),
('Кузнецов Евгений', 'rus', 'Кузнецов Евгений', 'Отопление и водоснабжение, сантехника.'),
('Кузнецова Светлана Николаевна', 'eng', 'Kuznetsova Svetlana Nikolaevna', ''),
('Кузнецова Светлана Николаевна', 'rus', 'Кузнецова Светлана Николаевна', ''),
('Кузьмин Александр Анатольевич', 'eng', 'Kuzmin Aleksandr Anatolevich', ''),
('Кузьмин Александр Анатольевич', 'rus', 'Кузьмин Александр Анатольевич', ''),
('Лежепекова Альвина', 'eng', 'Alvin Lezhepekova', NULL),
('Лежепекова Альвина', 'rus', 'Лежепекова Альвина', NULL),
('Люлин Алексей Алексеевич', 'eng', 'Lyulin Aleksey Alekseevich', ''),
('Люлин Алексей Алексеевич', 'rus', 'Люлин Алексей Алексеевич', ''),
('Марсакова Наталья Васильевна', 'eng', 'Marsakova Natalya Vasilevna', ''),
('Марсакова Наталья Васильевна', 'rus', 'Марсакова Наталья Васильевна', ''),
('Маслова Татьяна Викторовна', 'eng', 'Maslova Tatyana Viktorovna', ''),
('Маслова Татьяна Викторовна', 'rus', 'Маслова Татьяна Викторовна', ''),
('Моторина Лидия Николаевна', 'eng', 'Motorina Lidiya Nikolaevna', ''),
('Моторина Лидия Николаевна', 'rus', 'Моторина Лидия Николаевна', ''),
('Нестеров Сергей Викторович', 'eng', 'Nesterov Sergey Viktorovich ', ''),
('Нестеров Сергей Викторович', 'rus', 'Нестеров Сергей Викторович', ''),
('Нечайкин Павел', 'eng', 'Pavel Nechaykin', 'Doors, tools, fasteners, ventilation products, builder''s hardware, electrical materials, furniture fittings, lumber.'),
('Нечайкин Павел', 'rus', 'Нечайкин Павел', 'Двери, инструменты, крепежные элементы, вентиляция, фурнитура, электроматериалы, фурнитура для мебели, пиломатериалы.'),
('Овчинников Евгений Александрович', 'eng', 'Ovchinnikov Evgeniy Aleksandrovich', ''),
('Овчинников Евгений Александрович', 'rus', 'Овчинников Евгений Александрович', ''),
('Осьмухина Ольга Николаевна', 'eng', 'Osmukhina Olga Nikolaevna', ''),
('Осьмухина Ольга Николаевна', 'rus', 'Осьмухина Ольга Николаевна ', ''),
('Павлова Ольга Владиславовна', 'eng', 'Pavlova Olga Vladislavovna', ''),
('Павлова Ольга Владиславовна', 'rus', 'Павлова Ольга Владиславовна', ''),
('Патрина Екатерина Александровна', 'eng', 'Patrina Ekaterina Aleksandrovna', ''),
('Патрина Екатерина Александровна', 'rus', 'Патрина Екатерина Александровна', ''),
('Петрова Ирина Владимировна', 'eng', 'Petrova Irina Vladimirovna', ''),
('Петрова Ирина Владимировна', 'rus', 'Петрова Ирина Владимировна', ''),
('Плащинская Алла Вячеславовна', 'eng', 'Plashchinskaya Alla Vyacheslavovna', ''),
('Плащинская Алла Вячеславовна', 'rus', 'Плащинская Алла Вячеславовна', ''),
('Плетнев Андрей Александрович', 'eng', 'Pletnev Andrey Aleksandrovich', ''),
('Плетнев Андрей Александрович', 'rus', 'Плетнев Андрей Александрович', ''),
('Прохорова Надежда Александровна', 'eng', 'Prokhorova Nadezhda Alexandrovna', ''),
('Прохорова Надежда Александровна', 'rus', 'Прохорова Надежда Александровна', ''),
('Решетников Анатолий Павлович', 'eng', 'Reshetnikov Anatoliy Pavlovich', ''),
('Решетников Анатолий Павлович', 'rus', 'Решетников Анатолий Павлович', ''),
('Родин Сергей Иванович', 'eng', 'Rodin Sergey Ivanovich', ''),
('Родин Сергей Иванович', 'rus', 'Родин Сергей Иванович', ''),
('Родина Маргарита Витальевна', 'eng', 'Rodina Margarita Vitalievna', ''),
('Родина Маргарита Витальевна', 'rus', 'Родина Маргарита Витальевна', ''),
('Сазонова Оксана', 'eng', 'Sazonova Oksana', ''),
('Сазонова Оксана', 'rus', 'Сазонова Оксана', ''),
('Саморукова Елена', 'eng', 'Samorukova Elena', ''),
('Саморукова Елена', 'rus', 'Саморукова Елена', ''),
('Солдатова Марина Николаевна', 'eng', 'Soldatova Marina Nikolaevna', ''),
('Солдатова Марина Николаевна', 'rus', 'Солдатова Марина Николаевна', ''),
('Сорогин Денис Юрьевич', 'eng', 'Sorogin Denis Yurevich', ''),
('Сорогин Денис Юрьевич', 'rus', 'Сорогин Денис Юрьевич', ''),
('Стрельченко Галина Михайловна', 'eng', 'Strelchenko Galina Mikhaylovna', ''),
('Стрельченко Галина Михайловна', 'rus', 'Стрельченко Галина Михайловна', ''),
('Суркова Анастасия Николаевна', 'eng', 'Surkova Anastasiya Nikolaevna', ''),
('Суркова Анастасия Николаевна', 'rus', 'Суркова Анастасия Николаевна', ''),
('Тарасова Ольга Николаевна', 'eng', 'Tarasova Olga Nikolaevna', ''),
('Тарасова Ольга Николаевна', 'rus', 'Тарасова Ольга Николаевна', ''),
('Трухин Максим Александрович', 'eng', 'Truhin Maksim Aleksandrovich', ''),
('Трухин Максим Александрович', 'rus', 'Трухин Максим Александрович', ''),
('Федяева Екатерина Владиславовна', 'eng', 'Fedjaeva Ekaterina Vladislavovna', ''),
('Федяева Екатерина Владиславовна', 'rus', 'Федяева Екатерина Владиславовна', ''),
('Филиппов Денис Юрьевич', 'eng', 'Filippov Denis Yuryevich', '1V 3rd Butyrki str.<a href="./1v_3rd_butyrki_str/eng/">[move]</a>'),
('Филиппов Денис Юрьевич', 'rus', 'Филиппов Денис Юрьевич', '3 Бутырки, 1В.<a href="./1v_3rd_butyrki_str/rus/">[перейти]</a>'),
('Филькова Наталья Юрьевна', 'eng', 'Filkova Natalya Yurevna', ''),
('Филькова Наталья Юрьевна', 'rus', 'Филькова Наталья Юрьевна', ''),
('Фомина Елена Павловна', 'eng', 'Fomina Elena Pavlovna', ''),
('Фомина Елена Павловна', 'rus', 'Фомина Елена Павловна', ''),
('Хоненев Дмитрий', 'eng', 'Khonenev Dmitriy', ''),
('Хоненев Дмитрий', 'rus', 'Хоненев Дмитрий', ''),
('Хохлова Надежда Александровна', 'eng', 'Hohlova Nadezhda Aleksandrovna', ''),
('Хохлова Надежда Александровна', 'rus', 'Хохлова Надежда Александровна', ''),
('Чикова Галина Викторовна', 'eng', 'Chikova Galina Viktorovna', ''),
('Чикова Галина Викторовна', 'rus', 'Чикова Галина Викторовна', ''),
('Юсова Анастасия Викторовна', 'eng', 'Yusova Anastasia Victorovna', ''),
('Юсова Анастасия Викторовна', 'rus', 'Юсова Анастасия Викторовна', '');

-- --------------------------------------------------------

--
-- Структура таблицы `CreatedModules`
--

DROP TABLE IF EXISTS `CreatedModules`;
CREATE TABLE IF NOT EXISTS `CreatedModules` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `module` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_CreatedModules_1_idx` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `CreatedModules`
--

INSERT INTO `CreatedModules` (`id`, `name`, `module`) VALUES
(1, 'Логотип сайта', 'logo'),
(2, 'Главное меню', 'menu'),
(3, 'панель контактов', 'contactPanel'),
(4, 'Контакты в шапке', 'headContacts'),
(5, 'Смена локализации', 'langPanel'),
(6, 'Авторизация', 'authorizationUserPanel'),
(7, 'Карта магазинов', 'map'),
(301, 'main_slider', 'slider'),
(401, 'shop_butirki', 'slider'),
(402, 'shop_chernovitskaya', 'slider'),
(403, 'shop_chkalova', 'slider'),
(404, 'shop_circular_road_hangar', 'slider'),
(405, 'shop_circular_road_mall', 'slider'),
(406, 'shop_ostrovskogo', 'slider'),
(407, 'shop_pushkina_luhovitsy', 'slider'),
(408, 'shop_shabulina', 'slider'),
(409, 'shop_svyazi_sokolivka', 'slider'),
(410, 'shop_verkhnyaya', 'slider'),
(411, 'shop_yesenina', 'slider'),
(412, 'shop_zubkova', 'slider'),
(501, 'studio_furniture', 'slider'),
(502, 'studio_furniture_shabulina', 'slider'),
(503, 'studio_furniture_yesenina', 'slider'),
(504, 'studio_furniture_ostrovskogo', 'slider'),
(601, 'ApelsinContactsNavigationPanel (Контакты)', 'ApelsinContactsNavigationPanel'),
(602, 'ApelsinContactsNavigationPanel (Магазины)', 'ApelsinContactsNavigationPanel'),
(603, 'ApelsinContactsNavigationPanel (Отделы)', 'ApelsinContactsNavigationPanel'),
(700, 'Карта сайта в футере', 'ApelsinFuterSiteMap'),
(800, 'Копирайт в самом низу сайта', 'html'),
(801, 'Главный копирайт', 'html');

-- --------------------------------------------------------

--
-- Структура таблицы `DBerrors`
--

DROP TABLE IF EXISTS `DBerrors`;
CREATE TABLE IF NOT EXISTS `DBerrors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `element` varchar(200) NOT NULL,
  `sql` longtext NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `HtmlModul`
--

DROP TABLE IF EXISTS `HtmlModul`;
CREATE TABLE IF NOT EXISTS `HtmlModul` (
  `name` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `HtmlModul`
--

INSERT INTO `HtmlModul` (`name`, `description`) VALUES
('copyMain', 'Основной копирайт'),
('copyText', 'Копирайт в футэре');

-- --------------------------------------------------------

--
-- Структура таблицы `HtmlModul_Lang`
--

DROP TABLE IF EXISTS `HtmlModul_Lang`;
CREATE TABLE IF NOT EXISTS `HtmlModul_Lang` (
  `htmlModul` varchar(100) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `html` longtext NOT NULL,
  PRIMARY KEY (`htmlModul`,`lang`),
  KEY `fk_HtmlModul_Lang_HtmlModul_idx` (`htmlModul`),
  KEY `fk_HtmlModul_Lang_Lang_idx` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `HtmlModul_Lang`
--

INSERT INTO `HtmlModul_Lang` (`htmlModul`, `lang`, `html`) VALUES
('copyMain', 'eng', '<div class="futerAdress">Ryazan</div>\r\n<div class="futerCopy">© 2011-2015<br>company «Apelsin»</div>'),
('copyMain', 'rus', '<div class="futerAdress">г. Рязань</div>\r\n<div class="futerCopy">© 2011-2015<br>компания «Апельсин»</div>'),
('copyText', 'eng', '<p>Apelsin company reserves the right to change the information published on the site. </p>\r\n<p>Information available at this site is not a public offer.  </p>\r\n<p>For more information about pricing and terms, please call us at the telephone numbers provided on the <a href="./contacts/en">OUR CONTACTS</a> page.</p>\r\n<p>The use of information from the site <a href="./en/">www.apelsin.ru</a> is prohibited without the prior permission from the  <a href="mailto:site.support@apelsin.ru">Site managers</a>.</p>\r\n'),
('copyText', 'rus', '<p>Компания Апельсин оставляет за собой право вносить изменения в информацию, размещенную на этом сайте.</p>\r\n<p>Информация, размещенная на сайте ни в каком виде не является публичной офертой. </p>\r\n<p>Более подробную информацию о ценах и условиях просьба узнавать по телефонам на странице <a href="./contacts/ru">Контакты</a>.</p>\r\n<p>Использование информации с сайта <a href="./ru/">www.apelsin.ru</a> запрещено без разрешения <a href="mailto:site.support@apelsin.ru">Администрации сайта</a></p>\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `JCropTypes`
--

DROP TABLE IF EXISTS `JCropTypes`;
CREATE TABLE IF NOT EXISTS `JCropTypes` (
  `type` varchar(50) NOT NULL,
  `aspectRatio` float unsigned NOT NULL DEFAULT '0',
  `bgColor` varchar(45) NOT NULL DEFAULT 'black',
  `bgOpacity` float NOT NULL DEFAULT '0.5',
  `sideHandles` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `minWidth` int(10) unsigned DEFAULT NULL,
  `minHeight` int(10) unsigned DEFAULT NULL,
  `maxWidth` int(10) unsigned DEFAULT NULL,
  `maxHeight` int(10) unsigned DEFAULT NULL,
  `cssClasse` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`type`),
  UNIQUE KEY `boxId_UNIQUE` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `JCropTypes`
--

INSERT INTO `JCropTypes` (`type`, `aspectRatio`, `bgColor`, `bgOpacity`, `sideHandles`, `minWidth`, `minHeight`, `maxWidth`, `maxHeight`, `cssClasse`) VALUES
('Avatar', 1, 'black', 0.2, 1, 150, 150, 600, 600, 'JCrop_Avatar'),
('MaterialsImage', 0, 'black', 0.2, 1, 200, 150, 900, 500, 'JCrop_MaterialsImage');

-- --------------------------------------------------------

--
-- Структура таблицы `Jquery`
--

DROP TABLE IF EXISTS `Jquery`;
CREATE TABLE IF NOT EXISTS `Jquery` (
  `fileName` varchar(100) NOT NULL,
  `version` varchar(10) NOT NULL,
  `min` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`fileName`),
  UNIQUE KEY `version_UNIQUE` (`version`,`min`),
  UNIQUE KEY `fileName_UNIQUE` (`fileName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Jquery`
--

INSERT INTO `Jquery` (`fileName`, `version`, `min`) VALUES
('jquery-1.10.1.min.js', '1.10.1', 1),
('jquery-1.6.3.min.js', '1.6.3', 1),
('jquery.1.8.2.min.js', '1.8.2', 1),
('jquery-1.9.0.min.js', '1.9.0', 1),
('jquery-2.0.3.min.js', '2.0.3', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Lang`
--

DROP TABLE IF EXISTS `Lang`;
CREATE TABLE IF NOT EXISTS `Lang` (
  `lang` varchar(3) NOT NULL,
  `langName` varchar(50) NOT NULL,
  `default` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang`),
  UNIQUE KEY `lang_UNIQUE` (`lang`),
  UNIQUE KEY `langName_UNIQUE` (`langName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Lang`
--

INSERT INTO `Lang` (`lang`, `langName`, `default`) VALUES
('eng', 'English', 0),
('rus', 'Русский', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Logo`
--

DROP TABLE IF EXISTS `Logo`;
CREATE TABLE IF NOT EXISTS `Logo` (
  `lang` varchar(3) NOT NULL,
  `text` text NOT NULL,
  `urlTitle` text NOT NULL,
  PRIMARY KEY (`lang`),
  UNIQUE KEY `lang_UNIQUE` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Logo`
--

INSERT INTO `Logo` (`lang`, `text`, `urlTitle`) VALUES
('eng', 'Building&nbsp;&nbsp;&&nbsp;&nbsp;renovation', 'On home page'),
('rus', 'Строительство&nbsp;&nbsp;и&nbsp;&nbsp;ремонт', 'На главную');

-- --------------------------------------------------------

--
-- Структура таблицы `MapBildings`
--

DROP TABLE IF EXISTS `MapBildings`;
CREATE TABLE IF NOT EXISTS `MapBildings` (
  `alias` varchar(100) NOT NULL,
  `block` varchar(100) NOT NULL,
  `page` varchar(50) NOT NULL,
  `sequence` int(5) unsigned NOT NULL,
  `top` int(5) unsigned NOT NULL DEFAULT '0',
  `bottom` int(5) unsigned NOT NULL DEFAULT '0',
  `left` int(5) unsigned NOT NULL DEFAULT '0',
  `right` int(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`alias`),
  UNIQUE KEY `alias_UNIQUE` (`alias`),
  UNIQUE KEY `sequence_UNIQUE` (`sequence`,`block`),
  KEY `fk_MapBildings_1_idx` (`block`),
  KEY `fk_MapBildings_2_idx` (`page`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `MapBildings`
--

INSERT INTO `MapBildings` (`alias`, `block`, `page`, `sequence`, `top`, `bottom`, `left`, `right`) VALUES
('butyrki_str', 'right', '1v_3rd_butyrki_str', 2, 40, 0, 0, 0),
('chernovitskaya_str', 'right', '5_chernovitskaya_str', 7, 38, 0, 0, 0),
('chkalova_str', 'left', '70b_chkalova_str', 4, 31, 0, 0, 0),
('directions_shabulina', 'right', '24b_directions_shabulina', 1, 21, 0, 0, 0),
('firsova_str', 'right', '13_yesenina_str', 4, 42, 0, 0, 0),
('ostrovskogo_str', 'left', '109-2_ostrovskogo_str', 5, 41, 0, 0, 0),
('pushkina_str_luhovitsy', 'left', '170v_pushkina_str_luhovitsy', 1, 165, 0, 0, 0),
('shopping_mall_on_the_city_ring_road', 'left', 'shopping_mall_on_the_city_ring_road', 2, 35, 0, 0, 0),
('svyazi_str_sokolovka', 'right', '10b_svyazi_str_sokolovka', 8, 36, 0, 0, 0),
('the_185th_km_of_the_beltway_hangar', 'left', 'the_185th_km_of_the_beltway_hangar', 3, 28, 0, 0, 0),
('verkhnyaya_str', 'right', '50_verkhnyaya_str', 5, 37, 0, 0, 0),
('yesenina_str', 'right', '13_yesenina_str', 3, 40, 0, 0, 0),
('zubkovoy_str', 'right', '27b_zubkovoy_str', 6, 41, 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `MapBildingsBlocks`
--

DROP TABLE IF EXISTS `MapBildingsBlocks`;
CREATE TABLE IF NOT EXISTS `MapBildingsBlocks` (
  `block` varchar(100) NOT NULL,
  `sequence` int(5) unsigned NOT NULL,
  PRIMARY KEY (`block`),
  UNIQUE KEY `block_UNIQUE` (`block`),
  UNIQUE KEY `sequence_UNIQUE` (`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `MapBildingsBlocks`
--

INSERT INTO `MapBildingsBlocks` (`block`, `sequence`) VALUES
('right', 1),
('left', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `MapBildings_Lang`
--

DROP TABLE IF EXISTS `MapBildings_Lang`;
CREATE TABLE IF NOT EXISTS `MapBildings_Lang` (
  `bild` varchar(100) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`bild`,`lang`),
  KEY `fk_MapBildings_Lang_2_idx` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `MapBildings_Lang`
--

INSERT INTO `MapBildings_Lang` (`bild`, `lang`, `name`) VALUES
('butyrki_str', 'eng', '1V 3rd Butyrki str.'),
('butyrki_str', 'rus', 'ул. 3 Бутырки, д.1В'),
('chernovitskaya_str', 'eng', '5 Chernovitskaya str.'),
('chernovitskaya_str', 'rus', 'ул. Черновицкая, д. 5'),
('chkalova_str', 'eng', '70B Chkalova str.'),
('chkalova_str', 'rus', 'ул. Чкалова, д. 70Б'),
('directions_shabulina', 'eng', '24B Directions Shabulina'),
('directions_shabulina', 'rus', 'Проезд Шабулина, д. 24Б'),
('firsova_str', 'eng', '23B Firsova str.'),
('firsova_str', 'rus', 'ул. Фирсова, 23Б'),
('ostrovskogo_str', 'eng', '109-2 Ostrovskogo str.'),
('ostrovskogo_str', 'rus', 'ул. Островского,<br>д. 109/2'),
('pushkina_str_luhovitsy', 'eng', '170v Pushkina str.<br>(Luhovitsy)'),
('pushkina_str_luhovitsy', 'rus', 'ул. Пушкина, д. 170B<br>(г. Луховицы)'),
('shopping_mall_on_the_city_ring_road', 'eng', 'Shopping mall on the<br>city ring road'),
('shopping_mall_on_the_city_ring_road', 'rus', 'ТЦ на Окружной'),
('svyazi_str_sokolovka', 'eng', '10B Svyazi str.<br>(Sokolovka)'),
('svyazi_str_sokolovka', 'rus', 'ул. Связи,  д.10Б<br>(пос. Соколовка)'),
('the_185th_km_of_the_beltway_hangar', 'eng', 'The 185th km of the<br>beltway (Hangar)'),
('the_185th_km_of_the_beltway_hangar', 'rus', 'Окружная дорога,<br>185 км (Ангар)'),
('verkhnyaya_str', 'eng', '50 Verkhnyaya str.'),
('verkhnyaya_str', 'rus', 'ул. Верхняя, д. 50'),
('yesenina_str', 'eng', '13 Yesenina str.'),
('yesenina_str', 'rus', 'ул. Есенина, д.13'),
('zubkovoy_str', 'eng', '27B Zubkovoy str.'),
('zubkovoy_str', 'rus', 'ул. Зубковой, д. 27Б');

-- --------------------------------------------------------

--
-- Структура таблицы `Maps`
--

DROP TABLE IF EXISTS `Maps`;
CREATE TABLE IF NOT EXISTS `Maps` (
  `alias` varchar(100) NOT NULL,
  `sid` varchar(100) NOT NULL,
  `width` int(5) unsigned DEFAULT NULL,
  `height` int(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`alias`),
  UNIQUE KEY `alias_UNIQUE` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Maps`
--

INSERT INTO `Maps` (`alias`, `sid`, `width`, `height`) VALUES
('109_ostrovskogo_str', 'aR1P2mWDn_3DoDK3rSU3VFoOAPRiLiC0', 700, 350),
('10b_svyazi_str_sokolovka', 'ueLnEcQnrlB9SdGyVah6n-HoH2uv7y-C', 700, 350),
('13_yesenina_str', 'd_n_SaFEqQXfOL5hLKJmUcLveKXULbpH', 700, 350),
('170v_pushkina_str', 'mw6tW_2WykNcJf17gcdzYkWq8-7yAou9', 700, 350),
('1v_3rd_butyrki_str', 'SnMlSkPnKP6sFWR5w26jFjEJs2xQUv6r', 700, 350),
('23_firsova_str', 'd_n_SaFEqQXfOL5hLKJmUcLveKXULbpH', 700, 350),
('24b_proezd_shabulina', 'tmIv7PH7qZCY6Tk1_6anA5XKcPoOm-Rt', 700, 350),
('27b_zubkovoy_str', 'hUycajS0GMiXPKh455iMej1rZ5kh0Yjo', 700, 350),
('50_verkhnyaya_str', '6WloxTCHRgg8zADloKuWHFPMx1oICdjP', 700, 350),
('5_chernovitskaya_str', 'twHEHdSkKcjcPuEj2kDsCoflxn6sSiLC', 700, 350),
('70b_chkalova_str', 'bmtcW923DEcwRAziUQVppIi7RTpDDR5a', 700, 350),
('shopping_mall_on_the_city_ring_road', 'g8GrdDkFpZwu-G1qiPp039dsxbdmZR08', 700, 350),
('the_185th_km_of_the_city_ring_road-hangar', 'RniE4IXOcZhc09BKnMOdDLMvVyEWU59Z', 700, 350),
('the_185th_km_of_the_city_ring_road-market', 'TmSP1n3ZBnOx3yx7D3Jk3jUH8dgXSiqt', 700, 350);

-- --------------------------------------------------------

--
-- Структура таблицы `Materials`
--

DROP TABLE IF EXISTS `Materials`;
CREATE TABLE IF NOT EXISTS `Materials` (
  `alias` varchar(200) NOT NULL,
  `created` datetime NOT NULL,
  `lastChange` datetime NOT NULL,
  `showTitle` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `showCreated` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `showChange` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`alias`),
  UNIQUE KEY `alias_UNIQUE` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Materials`
--

INSERT INTO `Materials` (`alias`, `created`, `lastChange`, `showTitle`, `showCreated`, `showChange`) VALUES
('about', '2013-08-01 00:00:00', '2013-08-01 00:00:00', 0, 0, 0),
('credit', '2013-08-01 00:00:00', '2014-11-28 05:11:10', 1, 0, 0),
('delivery', '2013-08-01 00:00:01', '2014-11-25 07:21:34', 1, 0, 0),
('discount', '2013-08-01 00:00:00', '2014-11-25 05:36:09', 1, 0, 0),
('documentation', '2013-08-01 00:00:00', '2014-11-25 05:35:36', 1, 0, 0),
('gift_cards', '2013-08-01 00:00:00', '2014-11-25 07:10:08', 1, 0, 0),
('main', '2013-08-01 00:00:00', '2013-08-01 00:00:00', 0, 0, 0),
('news_aksessuar_dlja_vannoj_i_discount', '2014-07-04 00:00:00', '2014-11-24 10:20:09', 1, 0, 0),
('news_bytovaja_himija_i_advertising_goods', '2015-11-02 00:00:00', '2014-11-29 08:47:31', 1, 0, 0),
('news_dveri_UNION_i_polisteny', '2016-07-14 10:00:00', '2014-11-24 10:10:58', 1, 0, 0),
('news_dver_metalicheskaja_i_good_price', '2014-06-06 00:00:01', '2014-12-03 06:44:02', 1, 0, 0),
('news_dver_mezhkomnatnaja_i_gift_2p1', '2014-11-07 00:00:00', '2014-11-24 10:14:39', 1, 0, 0),
('news_granit_keramicheskij_i_good_price', '2013-08-13 00:00:00', '2014-11-24 10:26:39', 1, 0, 0),
('news_ishhem_pomeshhenie_i_news', '2016-01-10 00:00:00', '2014-11-27 12:36:45', 1, 0, 0),
('news_kabel_i_discount', '2013-08-03 00:00:00', '2014-11-25 05:08:35', 1, 0, 0),
('news_kandicionery_i_advertising_goods', '2013-08-05 00:00:00', '2014-11-24 10:29:35', 1, 0, 0),
('news_kolerovka_i_service', '2015-11-03 00:00:00', '2014-11-24 10:14:08', 1, 0, 0),
('news_kover_i_discount', '2013-08-08 00:00:00', '2014-11-25 05:02:27', 1, 0, 0),
('news_kraska_LAKRA_14KG_akrilovaja_interernaja_belaja_i_good_price', '2014-11-06 11:30:00', '2014-12-01 07:13:48', 1, 0, 0),
('news_kraska_PARADE_W110_9L_akrilovaja_dlja_oboev_i_good_price', '2014-11-04 00:00:00', '2014-11-29 10:23:01', 1, 0, 0),
('news_krvoelnyj_meterial_i_discount', '2013-08-14 00:00:00', '2014-11-24 10:26:03', 1, 0, 0),
('news_ljuk_kanalizacionnyj_i_good_price', '2013-08-20 00:00:00', '2014-11-24 10:24:18', 1, 0, 0),
('news_ljustry_i_gift_1p1', '2014-06-02 00:00:00', '2014-11-24 10:21:26', 1, 0, 0),
('news_mebel_dlja_vannoj_i_good_price', '2013-08-25 01:04:00', '2014-11-29 11:49:47', 1, 0, 0),
('news_oboi_i_gift_3p1', '2014-06-02 00:00:01', '2014-11-24 10:20:56', 1, 0, 0),
('news_osb_3_i_good_price', '2014-01-19 00:00:01', '2014-11-24 10:21:54', 1, 0, 0),
('news_parketnaja_doska_i_gift_5p1', '2013-08-02 00:00:00', '2014-11-25 05:11:36', 1, 0, 0),
('news_proflist_c8_c21_i_best_price', '2013-08-22 00:00:00', '2014-11-24 10:23:42', 1, 0, 0),
('news_programma_bonus_i_service', '2016-01-09 00:00:00', '2014-11-29 10:21:05', 1, 0, 0),
('news_skidka_vyhodnogo_dnja_i_discount', '2016-01-08 00:00:00', '2014-11-24 10:13:39', 1, 0, 0),
('news_smesitel_verznoj_i_discount', '2014-09-02 00:00:00', '2014-11-24 10:19:44', 1, 0, 0),
('news_specodezhda_i_advertising_goods', '2013-08-11 00:00:00', '2014-12-01 07:16:48', 1, 0, 0),
('news_teksturol_KLASSIK_i_good_price', '2014-11-01 00:00:00', '2014-11-29 10:25:46', 1, 0, 0),
('news_vannaja_akrilovaja_i_best_price', '2013-11-04 01:04:00', '2014-11-24 10:22:25', 1, 0, 0),
('news_vannaja_akrilovaja_i_good_price', '2013-08-17 00:00:00', '2014-11-29 11:47:48', 1, 0, 0),
('news_vannaja_gidromassazhnaja_i_good_price', '2013-08-10 00:00:00', '2014-11-25 05:01:59', 1, 0, 0),
('payment', '2013-08-01 10:45:31', '2014-11-25 07:17:19', 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `MaterialsCategories`
--

DROP TABLE IF EXISTS `MaterialsCategories`;
CREATE TABLE IF NOT EXISTS `MaterialsCategories` (
  `alias` varchar(200) NOT NULL,
  `created` datetime NOT NULL,
  `lastChange` datetime NOT NULL,
  PRIMARY KEY (`alias`),
  UNIQUE KEY `alias_UNIQUE` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `MaterialsCategories`
--

INSERT INTO `MaterialsCategories` (`alias`, `created`, `lastChange`) VALUES
('disable', '2013-11-01 00:00:00', '2014-09-19 11:25:19'),
('info', '2013-08-01 00:00:00', '2014-09-19 11:25:19'),
('pages', '2013-08-01 00:00:00', '2014-09-19 11:25:19'),
('promo', '2013-08-01 00:00:00', '2014-09-19 11:25:19');

-- --------------------------------------------------------

--
-- Структура таблицы `MaterialsCategoriesInList`
--

DROP TABLE IF EXISTS `MaterialsCategoriesInList`;
CREATE TABLE IF NOT EXISTS `MaterialsCategoriesInList` (
  `category` varchar(200) NOT NULL,
  `list` varchar(200) NOT NULL,
  `sequence` int(5) unsigned NOT NULL,
  PRIMARY KEY (`category`,`list`),
  UNIQUE KEY `key_UNIQUE` (`sequence`,`list`),
  KEY `fk_MaterialsCategories_has_CategoriesList_CategoriesList1_idx` (`list`),
  KEY `fk_MaterialsCategories_has_CategoriesList_MaterialsCategori_idx` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `MaterialsCategoriesInList`
--

INSERT INTO `MaterialsCategoriesInList` (`category`, `list`, `sequence`) VALUES
('info', 'info', 1),
('promo', 'promo', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `MaterialsCategoriesList`
--

DROP TABLE IF EXISTS `MaterialsCategoriesList`;
CREATE TABLE IF NOT EXISTS `MaterialsCategoriesList` (
  `name` varchar(200) NOT NULL,
  `showFullMaterialsText` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `showShortMaterialsText` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `showCategories` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `showCreated` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `showChange` tinyint(1) unsigned zerofill NOT NULL DEFAULT '1',
  `categorialsAsURL` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `titleAsURL` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `showAllOnPage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `onPage` int(2) unsigned NOT NULL DEFAULT '10',
  `maxPages` int(2) unsigned NOT NULL DEFAULT '6',
  PRIMARY KEY (`name`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `MaterialsCategoriesList`
--

INSERT INTO `MaterialsCategoriesList` (`name`, `showFullMaterialsText`, `showShortMaterialsText`, `showCategories`, `showCreated`, `showChange`, `categorialsAsURL`, `titleAsURL`, `showAllOnPage`, `onPage`, `maxPages`) VALUES
('about', 1, 0, 0, 0, 0, 0, 0, 1, 10, 6),
('info', 0, 0, 0, 0, 0, 0, 0, 1, 10, 6),
('payment_and_delivery', 1, 0, 0, 0, 0, 0, 0, 1, 10, 5),
('promo', 1, 1, 0, 0, 0, 0, 0, 0, 10, 5),
('useful_article', 0, 0, 1, 0, 0, 1, 1, 1, 10, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `MaterialsCategoriesList_Lang`
--

DROP TABLE IF EXISTS `MaterialsCategoriesList_Lang`;
CREATE TABLE IF NOT EXISTS `MaterialsCategoriesList_Lang` (
  `list` varchar(200) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text,
  PRIMARY KEY (`list`,`lang`),
  KEY `fk_MaterialsCategoriesList_Lang_MaterialsCategories_idx` (`list`),
  KEY `fk_MaterialsCategoriesList_Lang_Lang_idx` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `MaterialsCategoriesList_Lang`
--

INSERT INTO `MaterialsCategoriesList_Lang` (`list`, `lang`, `name`, `description`) VALUES
('payment_and_delivery', 'eng', 'Payment and delivery', NULL),
('payment_and_delivery', 'rus', 'Оплата и доставка', NULL),
('promo', 'eng', 'News', NULL),
('promo', 'rus', 'Акции', NULL),
('useful_article', 'eng', 'Useful article', '<p class="more_inf">В данном разделе собраны справочники по строительным материалам, \n    инструкции по монтажу и обзоры наиболее популярных стройматериалов.<p>'),
('useful_article', 'rus', 'Полезные статьи', '<p class="more_inf">В данном разделе собраны справочники по строительным материалам, \n    инструкции по монтажу и обзоры наиболее популярных стройматериалов.<p>');

-- --------------------------------------------------------

--
-- Структура таблицы `MaterialsCategories_Lang`
--

DROP TABLE IF EXISTS `MaterialsCategories_Lang`;
CREATE TABLE IF NOT EXISTS `MaterialsCategories_Lang` (
  `category` varchar(200) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text,
  PRIMARY KEY (`category`,`lang`),
  KEY `fk_MaterialsCategories_Lang_MaterialsCategories_idx` (`category`),
  KEY `fk_MaterialsCategories_Lang_Lang_idx` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `MaterialsCategories_Lang`
--

INSERT INTO `MaterialsCategories_Lang` (`category`, `lang`, `name`, `description`) VALUES
('disable', 'rus', 'Отключенный', NULL),
('info', 'eng', 'Information', NULL),
('info', 'rus', 'Информация', NULL),
('pages', 'eng', 'Site pages', NULL),
('pages', 'rus', 'Страницы сайта', NULL),
('promo', 'eng', 'Promotion', NULL),
('promo', 'rus', 'Акции', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `MaterialsInCategories`
--

DROP TABLE IF EXISTS `MaterialsInCategories`;
CREATE TABLE IF NOT EXISTS `MaterialsInCategories` (
  `material` varchar(200) NOT NULL,
  `category` varchar(200) NOT NULL,
  PRIMARY KEY (`material`,`category`),
  KEY `fk_MaterialsInCategories_Materials_idx` (`material`),
  KEY `fk_MaterialsInCategories_MaterialsCategories_idx` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `MaterialsInCategories`
--

INSERT INTO `MaterialsInCategories` (`material`, `category`) VALUES
('about', 'pages'),
('credit', 'info'),
('credit', 'pages'),
('delivery', 'info'),
('delivery', 'pages'),
('discount', 'info'),
('discount', 'pages'),
('documentation', 'info'),
('documentation', 'pages'),
('gift_cards', 'info'),
('gift_cards', 'pages'),
('news_aksessuar_dlja_vannoj_i_discount', 'promo'),
('news_bytovaja_himija_i_advertising_goods', 'promo'),
('news_dveri_UNION_i_polisteny', 'promo'),
('news_dver_metalicheskaja_i_good_price', 'promo'),
('news_dver_mezhkomnatnaja_i_gift_2p1', 'promo'),
('news_granit_keramicheskij_i_good_price', 'promo'),
('news_ishhem_pomeshhenie_i_news', 'promo'),
('news_kabel_i_discount', 'promo'),
('news_kandicionery_i_advertising_goods', 'promo'),
('news_kolerovka_i_service', 'promo'),
('news_kover_i_discount', 'promo'),
('news_kraska_LAKRA_14KG_akrilovaja_interernaja_belaja_i_good_price', 'promo'),
('news_kraska_PARADE_W110_9L_akrilovaja_dlja_oboev_i_good_price', 'promo'),
('news_krvoelnyj_meterial_i_discount', 'promo'),
('news_ljuk_kanalizacionnyj_i_good_price', 'promo'),
('news_ljustry_i_gift_1p1', 'promo'),
('news_mebel_dlja_vannoj_i_good_price', 'promo'),
('news_oboi_i_gift_3p1', 'promo'),
('news_osb_3_i_good_price', 'promo'),
('news_parketnaja_doska_i_gift_5p1', 'promo'),
('news_proflist_c8_c21_i_best_price', 'promo'),
('news_programma_bonus_i_service', 'promo'),
('news_skidka_vyhodnogo_dnja_i_discount', 'promo'),
('news_smesitel_verznoj_i_discount', 'promo'),
('news_specodezhda_i_advertising_goods', 'promo'),
('news_teksturol_KLASSIK_i_good_price', 'promo'),
('news_vannaja_akrilovaja_i_best_price', 'promo'),
('news_vannaja_akrilovaja_i_good_price', 'promo'),
('news_vannaja_gidromassazhnaja_i_good_price', 'promo'),
('payment', 'info'),
('payment', 'pages');

-- --------------------------------------------------------

--
-- Структура таблицы `Materials_Lang`
--

DROP TABLE IF EXISTS `Materials_Lang`;
CREATE TABLE IF NOT EXISTS `Materials_Lang` (
  `material` varchar(200) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `title` varchar(200) NOT NULL,
  `text` longtext NOT NULL,
  PRIMARY KEY (`material`,`lang`),
  KEY `fk_Materials_Lang_Materials_idx` (`material`),
  KEY `fk_Materials_Lang_Lang_idx` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Materials_Lang`
--

INSERT INTO `Materials_Lang` (`material`, `lang`, `title`, `text`) VALUES
('about', 'eng', 'About Apelsin', '\n<p class="main_paragraph"><span class="main_text">"APELSIN"</span> - company was found in 1997, and now it is the largest regional store chain in Ryazan, that sells construction and repair materials wholesale and retail. </p>\n<p class="main_paragraph">"Apelsin" - is an authorized dealer of many well-known brand manufacturers that produce tools, construction and finish materials.</p>\n<p class="main_paragraph">"Apelsin" - includes <span class="main_text"><a href="./contacts/en/">12 stores</a></span> и <span class="main_text">4 warehouse terminals</span> located within walking distance, thus, allowing to reach the maximum range of potential customers.</p>\n<p class="main_paragraph">The total sales area is <span class="main_text">25 000</span> quare meters. Warehouse area is <span class="main_text">35 000</span> square meters. Every day we meet dozens of heavy trucks with goods from our suppliers.</p>\n<p class="main_paragraph">Our business priority is the availability of goods in stock. The range of products offered by "Apelsin" store chain is more than <span class="main_text">300 000</span> items. </p>\n<p class="main_paragraph">We also provide the service related to the procurement of building and finishing materials for the construction sites.</p>\n<p class="main_paragraph">Flexible discount system and individual attention to each client make the work with us mutually beneficial for the largest construction companies, individual businessmen and private customers.</p>\n<p class="main_paragraph">We offer everything for the construction, repair and finishing of any level: from the economy class to the highest one. The professional will find the products of the manufacturers he is used to working with. If you are at a loss, we will help you to make the optimum choice that will suit you most.</p> \n<p class="main_paragraph">Our sales managers are highly experienced; they have been trained at seminars, trade shows, production centers of the companies that have chosen "Apelsin" as their authorized dealer and representative. </p>\n<p class="main_paragraph">Thus, "Apelsin" company is a reliable, fast growing trade network that tends to enhance the existing business relations and establish new partnerships. </p>\n'),
('about', 'rus', 'О компании', '<p class="main_paragraph">Компания <span class="main_text">"Апельсин"</span> - основана в 1997 году и является крупнейшей региональной сетью магазинов в Рязани, которая реализует оптом и в розницу материалы для строительства и ремонта.</p>\n<p class="main_paragraph">«Апельсин» - официальный дилер многих известных торговых марок производителей строительных, отделочных материалов и инструмента.</p>\n<p class="main_paragraph">Компания «Апельсин» - это <span class="main_text"><a href="./contacts/ru/">12 магазинов</a></span> и <span class="main_text">4 склада-терминала</span> — расположенных по принципу шаговой доступности, позволяющий охватить максимальный круг потенциального потребителя.</p>\n<p class="main_paragraph">Общая торговая площадь сети магазинов составляет <span class="main_text">25 тысяч</span> квадратных метров. Складская площадь занимает <span class="main_text">35 тысяч</span> квадратных метров. Каждый день мы принимаем от наших партнеров-поставщиков десятки большегрузных фур.</p>\n<p class="main_paragraph">Приоритетным направлением компании «Апельсин» является наличие товара на складе. Ассортимент продукции предлагаемой сетью магазинов «Апельсин» - это более <span class="main_text">300 тысяч</span> наименований.</p>\n<p class="main_paragraph">Мы предоставляем услугу полной комплектации объектов строительно-отделочными материалами.</p>\n<p class="main_paragraph">Гибкая система скидок и индивидуальный подход к каждому клиенту делают работу с нами обоюдно выгодной крупным строительным компаниям, индивидуальным предпринимателям и физическим лицам.</p>\n<p class="main_paragraph">Мы предлагаем все для строительства, ремонта и отделки любого уровня - от эконом класса, до самого высокого. Профессионалу мы предложим товары тех производителей, с которыми он привык работать, а тем, кто сомневается в выборе, поможем остановиться на нужном варианте.</p>\n<p class="main_paragraph">Наши продавцы-консультанты имеют большой опыт работы, прошли обучение на семинарах, выставках производственных базах тех компаний, официальными дилерами и представителями которых является компания «Апельсин».</p>\n<p class="main_paragraph">Итак, «Апельсин» - надежная, динамично развивающаяся торговая сеть, стремящаяся к укреплению сложившихся и созданию новых партнерских отношений.</p>'),
('credit', 'eng', 'CREDIT', '<p class="main_paragraph">Dear customers! For your convenience Apelsin company offers an opportunity to buy the construction materials on credit.</p>\r\n<p class="main_paragraph">We wish to draw your attention to the fact that Apelsin''s credit service system is based on complete absence of any benefits from mediation between the Client and the Bank.</p>\r\n<p class="main_paragraph">This means that we do not take for our own benefit any interest from the loan transaction or service charges.</p>\r\n<p class="main_paragraph">Apelsin company provides help in credit arrangement in the following banks:</p>\r\n\r\n<div class="clear"></div>\r\n<center>\r\n<div class="showOnPageMode">\r\n<a class="fancybox" href="#leto_bank" title=""><button type="button" class="apelsin_button_gray"><img src="./resources/Images/materials_images/leto_bank.png" width="150" height="83"></button></a>\r\n<a class="fancybox" href="#russkiyi_standart_bank" title=""><button type="button" class="apelsin_button_gray"><img src="./resources/Images/materials_images/russkiyi_standart_bank.png" width="150" height="83"></button></a>\r\n<a class="fancybox" href="#home_credit_bank" title=""><button type="button" class="apelsin_button_gray"><img src="./resources/Images/materials_images/home_credit_bank.png" width="150" height="83"></button></a>\r\n<a class="fancybox" href="#rusfinans_bank" title=""><button type="button" class="apelsin_button_gray"><img src="./resources/Images/materials_images/rusfinans_bank.png" width="150" height="83"></button></a>\r\n\r\n<div  id="leto_bank" style="display: none;" >\r\n    <img src="./resources/Images/materials_images/leto_bank.png" width="65" height="30" align="left">  \r\n    <span class="inf">ОАО «Лето Банк».<br>\r\n    Лицензия ЦБ РФ №650 от 15.10.2012.</span>\r\n    <table class="table_whith_border" >\r\n        <tr>\r\n            <th> </th>\r\n            <th>0% переплаты</th>\r\n            <th>10 - 10 - 10</th>\r\n            <th>1% переплаты</th>\r\n        </tr><tr>\r\n            <td>Сумма</td>\r\n            <td>от 3 000 до 50 000 руб.</td>\r\n            <td>от 3 000 до 300 000</td>\r\n            <td>от 3 000 до 300 000</td>\r\n        </tr><tr>\r\n            <td>Срок</td>\r\n            <td>6 либо 10 месяцев</td>\r\n            <td>10 месяцев</td>\r\n            <td>6, 8, 10, 12, 16-24 месяцев</td>\r\n        </tr><tr>\r\n            <td>Первоначальный взнос</td>\r\n            <td>0%</td>\r\n            <td>10%</td>\r\n            <td>0%, 10%, 20% либо 30%</td>\r\n        </tr><tr>\r\n            <td>Переплата</td>\r\n            <td>0%</td>\r\n            <td>10%</td>\r\n            <td>1% в месяц</td>\r\n        </tr><tr>\r\n            <td>Документы</td>\r\n            <td>Паспорт РФ</td>\r\n            <td>Паспорт РФ</td>\r\n            <td>Паспорт РФ</td>\r\n        </tr><tr>\r\n            <td>Прописка</td>\r\n            <td>Пост. регистрация в любом регионе</td>\r\n            <td>Пост. регистрация в любом регионе</td>\r\n            <td>Пост. регистрация в любом регионе</td>\r\n        </tr><tr>\r\n            <td>Возраст</td>\r\n            <td>М — от 21 до 65 лет<br />Ж — от 18 до 70 лет</td>\r\n            <td>М — от 21 до 65 лет<br />Ж — от 18 до 70 лет</td>\r\n            <td>М — от 21 до 65 лет<br />Ж — от 18 до 70 лет</td>\r\n        </tr>\r\n    </table>\r\n    <p class="more_inf">\r\n    *Не на весь товар. Подробности спрашивайте у менеджеров кредитного отдела.\r\n    </p>\r\n</div>\r\n\r\n<div  id="russkiyi_standart_bank"  style="display: none;">\r\n<img src="./resources/Images/materials_images/russkiyi_standart_bank.png" width="65" height="30" align="left">    \r\n    <span class="inf">ЗАО «Банк Русский стандарт». Генеральная лицензия Банка России<br>\r\n    №2289 выдана бессрочно 19 июля 2001 года.</span>\r\n    <table class="table_whith_border">\r\n        <tr>\r\n            <th> </th>\r\n            <th>10 - 10 - 10</th>\r\n            <th>1% переплаты</th>\r\n        </tr><tr>\r\n            <td>Сумма</td>\r\n            <td>от 3 000 до 200 000</td>\r\n            <td>от 3 000 до 200 000</td>\r\n        </tr><tr>\r\n            <td>Срок</td>\r\n            <td>10 месяцев</td>\r\n            <td>от 3 до 24 месяцев</td>\r\n        </tr><tr>\r\n            <td>Первоначальный взнос</td>\r\n            <td>10%</td>\r\n            <td>0-50%</td>\r\n        </tr><tr>\r\n            <td>Переплата</td>\r\n            <td>10%</td>\r\n            <td>1% в месяц</td>\r\n        </tr><tr>\r\n            <td>Документы</td>\r\n            <td>\r\n                Паспорт РФ + 2-й документ:<br />\r\n                - страх. пенс. свид-во;<br />\r\n                - водит. удостоверение;<br />\r\n                - загран. паспорт;<br />\r\n                - пенсионное удост. (обязательно, если клиент неработающий пенсионер)\r\n            </td>\r\n            <td>\r\n                Паспорт РФ + 2-й документ:<br />\r\n                - страх. пенс. свид-во;<br />\r\n                - водит. удостоверение;<br />\r\n                - загран. паспорт;<br />\r\n                - пенсионное удост. (обязательно, если клиент неработающий пенсионер)\r\n            </td>\r\n        </tr><tr>\r\n            <td>Прописка</td>\r\n            <td>Пост. регистрация в любом регионе</td>\r\n            <td>Пост. регистрация в любом регионе</td>\r\n        </tr><tr>\r\n            <td>Возраст</td>\r\n            <td>М — от 20 до 65 лет<br>Ж — от 18 до 65 лет</td>\r\n            <td>М — от 20 до 65 лет<br>Ж — от 18 до 65 лет</td>\r\n        </tr>\r\n    </table>\r\n    <p class="more_inf">\r\n    *Не на весь товар. Подробности спрашивайте у менеджеров кредитного отдела.\r\n    </p>\r\n</div>\r\n\r\n<div  id="home_credit_bank" style="display: none;">\r\n    <img src="./resources/Images/materials_images/home_credit_bank.png" width="65" height="30" align="left">          \r\n    <span class="inf">ООО «ХКФ Банк». Генеральная лицензия Банка России<br>\r\n    №316 выдана бессрочно 13 октября 2011 года.</span>\r\n    <table class="table_whith_border" >\r\n        <tr>\r\n            <th> </th>\r\n            <th>10 - 10 - 10</th>\r\n            <th>1% переплаты</th>\r\n        </tr><tr>\r\n            <td>Сумма</td>\r\n            <td>от 3 000 до 200 000</td>\r\n            <td>от 3 000 до 200 000</td>\r\n        </tr><tr>\r\n            <td>Срок</td>\r\n            <td>10 месяцев</td>\r\n            <td>от 4, 6, 10, 12 и 18  месяцев</td>\r\n        </tr><tr>\r\n            <td>Первоначальный взнос</td>\r\n            <td>10%</td>\r\n            <td>0% либо 10%</td>\r\n        </tr><tr>\r\n            <td>Переплата</td>\r\n            <td>10%</td>\r\n            <td>1% в месяц</td>\r\n        </tr><tr>\r\n            <td>Документы</td>\r\n            <td>\r\n                Паспорт РФ (с постоянной регистрацией в любом регионе)\r\n            </td>\r\n            <td>\r\n                Паспорт РФ (с постоянной регистрацией в любом регионе)\r\n            </td>\r\n        </tr><tr>\r\n            <td>Прописка</td>\r\n            <td>Пост. регистрация в Рязанской обл.</td>\r\n            <td>Пост. регистрация в Рязанской обл.</td>\r\n        </tr><tr>\r\n            <td>Возраст</td>\r\n            <td>Все от 18 до 70 лет включительно</td>\r\n            <td>Все от 18 до 70 лет включительно</td>\r\n        </tr>\r\n    </table>\r\n    <p class="more_inf">\r\n    *Не на весь товар. Подробности спрашивайте у менеджеров кредитного отдела.\r\n    </p>\r\n</div>\r\n\r\n<div  id="rusfinans_bank"  style="display: none;">\r\n    <img src="./resources/Images/materials_images/rusfinans_bank.png" width="65" height="30" align="left">         \r\n    <span class="inf">OOO "Русфинанс Банк". Генеральная лицензия ЦБ РФ<br>\r\n    №1792 выдана 13 февраля 2013 года.</span>\r\n    <table class="table_whith_border">\r\n        <tr>\r\n            <th> </th>\r\n            <th>0% переплаты</th>\r\n            <th>10 - 10 - 10</th>\r\n            <th>1% переплаты</th>\r\n        </tr><tr>\r\n            <td>Сумма</td>\r\n            <td>от 10 000 до 180 000 руб.</td>\r\n            <td>от 3 000 до 180 000</td>\r\n            <td>от 3 000 до 180 000</td>\r\n        </tr><tr>\r\n            <td>Срок</td>\r\n            <td>3 либо 6 месяцев</td>\r\n            <td>10 месяцев</td>\r\n            <td>от 6 до 24 месяцев</td>\r\n        </tr><tr>\r\n            <td>Первоначальный взнос</td>\r\n            <td>0%,10%,20%,30%,40%,50%</td>\r\n            <td>10%</td>\r\n            <td>0-50%</td>\r\n        </tr><tr>\r\n            <td>Переплата</td>\r\n            <td>0%</td>\r\n            <td>10%</td>\r\n            <td>1% в месяц</td>\r\n        </tr><tr>\r\n            <td>Документы</td>\r\n            <td>Паспорт РФ</td>\r\n            <td>\r\n                Паспорт РФ + 2-й документ:<br />\r\n                (Если сумма свыше 30 000)<br />\r\n                - страх. пенс. свид-во;<br />\r\n                - водит. удостоверение;<br />\r\n                - загран. паспорт\r\n            </td>\r\n            <td>\r\n                Паспорт РФ + 2-й документ:<br />\r\n                (Если сумма свыше 30 000)<br />\r\n                - страх. пенс. свид-во;<br />\r\n                - водит. удостоверение;<br />\r\n                - загран. паспорт\r\n            </td>\r\n        </tr><tr>\r\n            <td>Прописка</td>\r\n            <td>Пост. регистрация в любом регионе</td>\r\n            <td>Пост. регистрация в любом регионе</td>\r\n            <td>Пост. регистрация в любом регионе</td>\r\n        </tr><tr>\r\n            <td>Возраст</td>\r\n            <td>М — от 21 до 63 лет<br>Ж — от 21 до 68 лет</td>\r\n            <td>М — от 21 до 63 лет<br>Ж — от 21 до 68 лет</td>\r\n            <td>М — от 21 до 63 лет<br>Ж — от 21 до 68 лет</td>\r\n        </tr>\r\n    </table>\r\n    <p class="more_inf">\r\n    *Не на весь товар. Подробности спрашивайте у менеджеров кредитного отдела.\r\n    </p>\r\n</div> \r\n\r\n</center>\r\n<br><br>\r\n<p class="inf">Credit conditions:</p>\r\n<p class="inf">Loan amount: from 3 to 300 thousand rubles; Initial contribution: from 0 to 90% of the product cost;</p>\r\n<p class="inf">Loan term: from 3 to 36 months; Interest rate: from 23.4% to 39.9 % per annum;</p>\r\n<p class="inf">No additional fee.</p>\r\n<p class="inf">Banks make their own decision on loan granting or rejection without providing any explanations for it.</p>\r\n'),
('credit', 'rus', 'КРЕДИТ', '<p class="main_paragraph">\r\nУважаемые клиенты, для Вашего удобства компания «Апельсин» \r\nпредоставляет возможность купить строительные материалы в кредит.\r\n</p>\r\n\r\n<p class="main_paragraph">\r\nОбращаем Ваше внимание на то, что система кредитного обслуживания \r\nКомпании основывается на полном отсутствии выгоды от посредничества \r\nмежду Клиентом и Банком. Это означает, что Мы не берем в свою пользу \r\nни процентов от сделки по обеспечению кредита, ни платы за обслуживание.\r\n</p>\r\n\r\n<p class="main_paragraph">\r\nМенеджеры нашего кредитного отдела помогут Вам в выборе обслуживающего \r\nБанка и кредитного продукта, исходя из Ваших индивидуальных потребностей. \r\nПо первому запросу Вам будет предоставлена консультация или справка \r\nна любом шаге оформления.\r\n</p>\r\n\r\n<p class="main_paragraph">\r\nПозвольте себе строить больше, ничего не теряя и экономя главное — время.\r\n</p>\r\n<p class="main_paragraph">Компания «Апельсин» оказывает помощь в оформлении кредита в следующих банках:</p>\r\n\r\n<div class="clear"></div>\r\n<center>\r\n<div class="showOnPageMode">\r\n<a class="fancybox" href="#leto_bank" title=""><button type="button" class="apelsin_button_gray"><img src="./resources/Images/materials_images/leto_bank.png" width="150" height="83"></button></a>\r\n<a class="fancybox" href="#russkiyi_standart_bank" title=""><button type="button" class="apelsin_button_gray"><img src="./resources/Images/materials_images/russkiyi_standart_bank.png" width="150" height="83"></button></a>\r\n<a class="fancybox" href="#home_credit_bank" title=""><button type="button" class="apelsin_button_gray"><img src="./resources/Images/materials_images/home_credit_bank.png" width="150" height="83"></button></a>\r\n<a class="fancybox" href="#rusfinans_bank" title=""><button type="button" class="apelsin_button_gray"><img src="./resources/Images/materials_images/rusfinans_bank.png" width="150" height="83"></button></a>\r\n\r\n<div  id="leto_bank" style="display: none;" >\r\n    <img src="./resources/Images/materials_images/leto_bank.png" width="65" height="30" align="left">  \r\n    <span class="inf">ОАО «Лето Банк».<br>\r\n    Лицензия ЦБ РФ №650 от 15.10.2012.</span>\r\n    <table class="table_whith_border" >\r\n        <tr>\r\n            <th> </th>\r\n            <th>0% переплаты</th>\r\n            <th>10 - 10 - 10</th>\r\n            <th>1% переплаты</th>\r\n        </tr><tr>\r\n            <td>Сумма</td>\r\n            <td>от 3 000 до 50 000 руб.</td>\r\n            <td>от 3 000 до 300 000</td>\r\n            <td>от 3 000 до 300 000</td>\r\n        </tr><tr>\r\n            <td>Срок</td>\r\n            <td>6 либо 10 месяцев</td>\r\n            <td>10 месяцев</td>\r\n            <td>6, 8, 10, 12, 16-24 месяцев</td>\r\n        </tr><tr>\r\n            <td>Первоначальный взнос</td>\r\n            <td>0%</td>\r\n            <td>10%</td>\r\n            <td>0%, 10%, 20% либо 30%</td>\r\n        </tr><tr>\r\n            <td>Переплата</td>\r\n            <td>0%</td>\r\n            <td>10%</td>\r\n            <td>1% в месяц</td>\r\n        </tr><tr>\r\n            <td>Документы</td>\r\n            <td>Паспорт РФ</td>\r\n            <td>Паспорт РФ</td>\r\n            <td>Паспорт РФ</td>\r\n        </tr><tr>\r\n            <td>Прописка</td>\r\n            <td>Пост. регистрация в любом регионе</td>\r\n            <td>Пост. регистрация в любом регионе</td>\r\n            <td>Пост. регистрация в любом регионе</td>\r\n        </tr><tr>\r\n            <td>Возраст</td>\r\n            <td>М — от 21 до 65 лет<br />Ж — от 18 до 70 лет</td>\r\n            <td>М — от 21 до 65 лет<br />Ж — от 18 до 70 лет</td>\r\n            <td>М — от 21 до 65 лет<br />Ж — от 18 до 70 лет</td>\r\n        </tr>\r\n    </table>\r\n    <p class="more_inf">\r\n    *Не на весь товар. Подробности спрашивайте у менеджеров кредитного отдела.\r\n    </p>\r\n</div>\r\n\r\n<div  id="russkiyi_standart_bank"  style="display: none;">\r\n<img src="./resources/Images/materials_images/russkiyi_standart_bank.png" width="65" height="30" align="left">    \r\n    <span class="inf">ЗАО «Банк Русский стандарт».  Генеральная лицензия Банка России<br>\r\n    №2289 выдана бессрочно 19 июля 2001 года.</span>\r\n    <table class="table_whith_border">\r\n        <tr>\r\n            <th> </th>\r\n            <th>10 - 10 - 10</th>\r\n            <th>1% переплаты</th>\r\n        </tr><tr>\r\n            <td>Сумма</td>\r\n            <td>от 3 000 до 200 000</td>\r\n            <td>от 3 000 до 200 000</td>\r\n        </tr><tr>\r\n            <td>Срок</td>\r\n            <td>10 месяцев</td>\r\n            <td>от 3 до 24 месяцев</td>\r\n        </tr><tr>\r\n            <td>Первоначальный взнос</td>\r\n            <td>10%</td>\r\n            <td>0-50%</td>\r\n        </tr><tr>\r\n            <td>Переплата</td>\r\n            <td>10%</td>\r\n            <td>1% в месяц</td>\r\n        </tr><tr>\r\n            <td>Документы</td>\r\n            <td>\r\n                Паспорт РФ + 2-й документ:<br />\r\n                - страх. пенс. свид-во;<br />\r\n                - водит. удостоверение;<br />\r\n                - загран. паспорт;<br />\r\n                - пенсионное удост. (обязательно, если клиент неработающий пенсионер)\r\n            </td>\r\n            <td>\r\n                Паспорт РФ + 2-й документ:<br />\r\n                - страх. пенс. свид-во;<br />\r\n                - водит. удостоверение;<br />\r\n                - загран. паспорт;<br />\r\n                - пенсионное удост. (обязательно, если клиент неработающий пенсионер)\r\n            </td>\r\n        </tr><tr>\r\n            <td>Прописка</td>\r\n            <td>Пост. регистрация в любом регионе</td>\r\n            <td>Пост. регистрация в любом регионе</td>\r\n        </tr><tr>\r\n            <td>Возраст</td>\r\n            <td>М — от 20 до 65 лет<br>Ж — от 18 до 65 лет</td>\r\n            <td>М — от 20 до 65 лет<br>Ж — от 18 до 65 лет</td>\r\n        </tr>\r\n    </table>\r\n    <p class="more_inf">\r\n    *Не на весь товар. Подробности спрашивайте у менеджеров кредитного отдела.\r\n    </p>\r\n</div>\r\n\r\n<div  id="home_credit_bank" style="display: none;">\r\n    <img src="./resources/Images/materials_images/home_credit_bank.png" width="65" height="30" align="left">          \r\n    <span class="inf">ООО «ХКФ Банк».   Генеральная лицензия Банка России<br>\r\n    №316 выдана бессрочно 13 октября 2011 года.</span>\r\n    <table class="table_whith_border" >\r\n        <tr>\r\n            <th> </th>\r\n            <th>10 - 10 - 10</th>\r\n            <th>1% переплаты</th>\r\n        </tr><tr>\r\n            <td>Сумма</td>\r\n            <td>от 3 000 до 200 000</td>\r\n            <td>от 3 000 до 200 000</td>\r\n        </tr><tr>\r\n            <td>Срок</td>\r\n            <td>10 месяцев</td>\r\n            <td>от 4, 6, 10, 12 и 18  месяцев</td>\r\n        </tr><tr>\r\n            <td>Первоначальный взнос</td>\r\n            <td>10%</td>\r\n            <td>0% либо 10%</td>\r\n        </tr><tr>\r\n            <td>Переплата</td>\r\n            <td>10%</td>\r\n            <td>1% в месяц</td>\r\n        </tr><tr>\r\n            <td>Документы</td>\r\n            <td>\r\n                Паспорт РФ (с постоянной регистрацией в любом регионе)\r\n            </td>\r\n            <td>\r\n                Паспорт РФ (с постоянной регистрацией в любом регионе)\r\n            </td>\r\n        </tr><tr>\r\n            <td>Прописка</td>\r\n            <td>Пост. регистрация в Рязанской обл.</td>\r\n            <td>Пост. регистрация в Рязанской обл.</td>\r\n        </tr><tr>\r\n            <td>Возраст</td>\r\n            <td>Все от 18 до 70 лет включительно</td>\r\n            <td>Все от 18 до 70 лет включительно</td>\r\n        </tr>\r\n    </table>\r\n    <p class="more_inf">\r\n    *Не на весь товар. Подробности спрашивайте у менеджеров кредитного отдела.\r\n    </p>\r\n</div>\r\n\r\n<div  id="rusfinans_bank"  style="display: none;">\r\n    <img src="./resources/Images/materials_images/rusfinans_bank.png" width="65" height="30" align="left">         \r\n    <span class="inf">OOO "Русфинанс Банк".   Генеральная лицензия ЦБ РФ<br>\r\n    №1792 выдана 13 февраля 2013 года.</span>\r\n    <table class="table_whith_border">\r\n        <tr>\r\n            <th> </th>\r\n            <th>0% переплаты</th>\r\n            <th>10 - 10 - 10</th>\r\n            <th>1% переплаты</th>\r\n        </tr><tr>\r\n            <td>Сумма</td>\r\n            <td>от 10 000 до 180 000 руб.</td>\r\n            <td>от 3 000 до 180 000</td>\r\n            <td>от 3 000 до 180 000</td>\r\n        </tr><tr>\r\n            <td>Срок</td>\r\n            <td>3 либо 6 месяцев</td>\r\n            <td>10 месяцев</td>\r\n            <td>от 6 до 24 месяцев</td>\r\n        </tr><tr>\r\n            <td>Первоначальный взнос</td>\r\n            <td>0%,10%,20%,30%,40%,50%</td>\r\n            <td>10%</td>\r\n            <td>0-50%</td>\r\n        </tr><tr>\r\n            <td>Переплата</td>\r\n            <td>0%</td>\r\n            <td>10%</td>\r\n            <td>1% в месяц</td>\r\n        </tr><tr>\r\n            <td>Документы</td>\r\n            <td>Паспорт РФ</td>\r\n            <td>\r\n                Паспорт РФ + 2-й документ:<br />\r\n                (Если сумма свыше 30 000)<br />\r\n                - страх. пенс. свид-во;<br />\r\n                - водит. удостоверение;<br />\r\n                - загран. паспорт\r\n            </td>\r\n            <td>\r\n                Паспорт РФ + 2-й документ:<br />\r\n                (Если сумма свыше 30 000)<br />\r\n                - страх. пенс. свид-во;<br />\r\n                - водит. удостоверение;<br />\r\n                - загран. паспорт\r\n            </td>\r\n        </tr><tr>\r\n            <td>Прописка</td>\r\n            <td>Пост. регистрация в любом регионе</td>\r\n            <td>Пост. регистрация в любом регионе</td>\r\n            <td>Пост. регистрация в любом регионе</td>\r\n        </tr><tr>\r\n            <td>Возраст</td>\r\n            <td>М — от 21 до 63 лет<br>Ж — от 21 до 68 лет</td>\r\n            <td>М — от 21 до 63 лет<br>Ж — от 21 до 68 лет</td>\r\n            <td>М — от 21 до 63 лет<br>Ж — от 21 до 68 лет</td>\r\n        </tr>\r\n    </table>\r\n    <p class="more_inf">\r\n    *Не на весь товар. Подробности спрашивайте у менеджеров кредитного отдела.\r\n    </p>\r\n</div> \r\n\r\n</center>\r\n<br><br>\r\n<p class="main_paragraph">Оформление покупки в кредит возможнo на следующих условиях:</p>\r\n<p class="inf">Сумма кредита: от 3 до 300 тыс. руб.; Первоначальный взнос: от 0-90% от суммы товара;</p>\r\n<p class="inf">Срок кредита: от 3 до 36 месяцев; Процентная ставка: от 23,4% до 39,9% годовых;</p>\r\n<p class="inf">Дополнительные комиссии отсутствуют.</p>\r\n<p class="inf">Банки самостоятельно принимают решение о предоставлении либо отказе предоставления кредита без объяснения причин.</p>'),
('delivery', 'eng', 'DELIVERY', '<p class="main_paragraph">If needed, your purchase will be delivered to your home by our delivery service. To use this service, ask your sales manager about it in advance.</p>'),
('delivery', 'rus', 'ДОСТАВКА', '<p class="main_paragraph">Сервис доставки – зависимая услуга, оказываемая при закупке товаров. Для того, чтобы \r\nвоспользоваться данной услугой, Вам необходимо уведомить менеджера оформляющего \r\nВаш заказ о том, что Вам необходима доставка и менеджер изыщет подходящий транспорт.</p>'),
('discount', 'eng', 'DISCOUNT', '<p class="main_paragraph">It''s very easy to become our Loyal customer!</p>\r\n<p class="main_paragraph">Just make one or several purchases totaling to 10,000 rubles, provide documents on purchase and contact information to any of our stores and get a Discount card.</p>\r\n<center><img src="./resources/Images/materials_images/discont_karte.png" width="500" height="159" alt="дисконтная карта"></center>\r\n<p class="main_paragraph">The owner of our Discount card has the right to receive the special conditions in any of our stores, that is:</p>\r\n<ul class="dash more_inf">\r\n<li>special category of prices;</li>\r\n<li>history information of purchases.</li>\r\n</ul>\r\n<p class="main_paragraph">Our discount system is cumulative, i.e. you need only provide the Discount card at subsequent purchases.</p>\r\n<hr>\r\n<p class="main_paragraph main_text">Price categories:\r\n<ul class="without_design">\r\n<li>Purchase sum of over 10,000 rubles – small-scale wholesale category</li>\r\n<li>Purchases sum of over 20,000 rubles – medium-scale wholesale category</li>\r\n<li>Purchase sum of over 50,000 rubles – wholesale category</li>\r\n</ul>\r\n<p class="info_paragraph">*When summing up the cost of your purchases, we take into account all the goods without exception, including those not covered by the Discount card. For example, if you buy a product from the special list of Promotional goods, this very item won''t be subject to discount, but the total sum of orders you paid for is still increasing by the value of this product, thus, ensuring a large discount in the future.</p>\r\n<hr>\r\n<p class="main_paragraph">Besides, the Discount card will allow you to get information on purchases you''ve already made. You can get it in any of our stores.</p>\r\n<p class="info_paragraph">*Be careful! In automatic mode the goods bought on special conditions, paid by credit card or gift cards as well as goods on trust shall not be included in the history of your purchases. Please keep the receipt for such goods.</p>\r\n<p class="main_paragraph">For our loyal customers benefit, there is a Cumulative system of discounting designed for long and fruitful cooperation.</p>\r\n<p class="main_paragraph">We are constantly thinking of how to make your shopping more cost effective! The constant special offers will allow you to buy a product you are interested in at a special and more favorable price. To see the current offers, please go to <a href="./news/en/">NEWS</a> page.</p>\r\n<p class="info_paragraph">*When purchasing the goods on special conditions, the other types of discounts won''t be applied to such goods.</p>\r\n'),
('discount', 'rus', 'ДИСКОНТ', '<p class="main_paragraph">Стать нашим Постоянным клиентом легко!</p>\r\n<p class="main_paragraph">Совершив одну или несколько покупок общей сумой на 10.000 р. вы можете получить Дисконтную карту и стать нашим Постоянным клиентом. Для этого Вам необходимо лишь предоставить в администрацию любого из наших филиалов документы на покупки и контактные данные.</p>\r\n<center><img src="../resources/Images/materials_images/discont_karte.png" width="500" height="159" alt="дисконтная карта"></center>\r\n<p class="main_paragraph">Владелец Дисконтной карты имеет право на получение особых условий в любом из наших филиалов:</p>\r\n<ul class="dash more_inf">\r\n<li>особая категория цен;</li>\r\n<li>предоставление истории покупок.</li>\r\n</ul>\r\n<p class="main_paragraph">Наша система скидок является накопительной, т.е. Вам необходимо лишь при очередных покупках предоставлять Дисконтную карту.</p>\r\n<hr>\r\n<p class="main_paragraph main_text">Категории цен:\r\n<ul class="without_design">\r\n<li>Сумма покупок свыше 10.000 рублей - мелкооптовая категория</li>\r\n<li>Сумма покупок свыше 20.000 рублей - среднеоптовая категория</li>\r\n<li>Сумма покупок свыше 50.000 рублей - оптовая категория</li>\r\n</ul>\r\n<p class="info_paragraph">*При суммировании стоимости купленных Вами товаров учитываются все товары без исключения, в том числе и те, на которые не распространяется действие Дисконтной карты. Например, если Вы покупаете товар из особого списка Акционного товара, и скидка на этот товар не распространяется, но сумма оплаченных Вами заказов все равно увеличивается на стоимость этого товара, что обеспечит Вам в дальнейшем большую скидку.</p>\r\n<hr>\r\n<p class="main_paragraph">Так же, являясь обладателем Дисконтной карты, Вы можете всегда получить данные о совершенных Вами покупках в прошлом. Данную информацию можно получить в администрации любого филиала.</p>\r\n<p class="info_paragraph">*Будте внимательны! В автоматическом режиме в историю Ваших покупок не попадают товары купленные по спецпредложениям, оплаченные кредитной либо подарочной картами, а так же товары оформленные в кредит. На данные покупки сохраняйте чек.</p>\r\n<p class="main_paragraph">Специально для постоянных покупателей действует Накопительная система начисления скидки, рассчитанная на длительное и плодотворное сотрудничество.</p>\r\n<p class="main_paragraph">Мы постоянно думаем над тем, как сделать ваши покупки более экономичными! Благодаря постоянным акциям Вы можете приобрести заинтересовавший вас товар по специальным и более выгодным ценам. Текущие предложения можно посмотреть в разделе <a href="./news/ru/">АКЦИИ</a>.</p>\r\n<p class="info_paragraph">*При покупке товаров по спецпредложениям остальные виды скидок на эти товары не действуют.</p>\r\n'),
('documentation', 'eng', 'DOCUMENTS', '<p class="main_paragraph">This section includes all the necessary documents (PDF) that may be useful for you and will help to save your time.</p>\r\n<p class="info_paragraph">In order to work with PDF files, we recommend you to install free <a href="http://get.adobe.com/reader/" target="_blank">Adobe Reader</a> or <a href="http://www.foxitsoftware.com/downloads/" target="_blank">Foxit Reader</a>.</p>\r\n<hr>\r\n<p class="main_paragraph">Banking details of IE Kashkovsky D.V. (<a href="./files/materials/documents/Details_Kashkovskiy_D.V..pdf" target="_blank">PDF / 89 kb</a>)</p>\r\n<p class="main_paragraph">Banking details Apelsin-R LLC (<a href="./files/materials/documents/Details_Apelsin_R.pdf" target="_blank">PDF / 90 kb</a>)</p>\r\n<hr>\r\n<p class="main_paragraph">For the avoidance of any conflict situations, please get acquainted with the following information.</p>\r\n<div class="right"><a href="./files/materials/documents/Attention.pdf" target="_blank">Скачать (PDF / 48 kb)</a></div><br>\r\n<ol>\r\n<li>The goods dispatch is carried out right on the date of the document issuance.</li>\r\n<li>Claims related to the quality of lighting products are accepted only for the electrics of such devices.</li>\r\n<li>Claims for completeness, appearance and defects that can be revealed during the inspection are accepted by the seller prior to the signing of the corresponding accompanying documents.</li>\r\n<li>\r\nClaims for defects revealed during the product usage (in particular regarding the preparation for the installation work in accordance with designated purpose of such products) are accepted by the seller prior to the start of product usage or work performance; thus, the claims for the quality of ceramic tiles or wallpapers are accepted only before its laying or hanging.\r\n<br><span class="more_inf">(Legal basis: Paragraph 17 of the Rules for sale of specified types of goods as revised in the Enactment of the Russian Federation of 20.10.1998 No. 1222, of 02.10.1999 No. 1104, of 06.02.2002 No. 81, of 12.07.2003 No. 421)</span>\r\n</li>\r\n<li>\r\nThe Seller shall not be liable for the product defects and material consequences occurred due to the Customer''s fault.\r\n<br><span class="more_inf">(Legal basis: Consumer protection law)</span>\r\n</li>\r\n<li>\r\nThe following acquired goods of proper quality shall not be subject to return or exchange: cable products (wires, cords or cables); construction and finish materials (linoleum, film, carpets, etc.) and other goods sold per meters as well as cut-price goods and special offers.\r\n<br><span class="more_inf">(Legal basis: The List of non-food products of proper quality that are not subject to return or exchange as revised in the Enactment of the Russian Federation of 20.10.1998 No. 1222, of 06.02.2002 No. 81)</span>\r\n</li>\r\n<li>\r\nClaims for the size, shape, dimensions, style, color or completeness of products of proper quality are accepted within the period established by the current legislation provided that such product was not used, it has preserved its marketable state, consumer properties, seals, manufacturer labels and there is some evidence that it was acquired from this particular seller.\r\n<br><span class="more_inf">(Legal basis: Paragraph 17  of the Rules for sale of specified types of goods as revised in the Enactment of the Russian Federation  of 20.10.1998 No. 1222, of 02.10.1999 No. 1104, of 06.02.2002 No. 81, of 12.07.2003 No. 421)</span>\r\n<br><span class="more_inf">* The present point shall not be applied to the products delivered by the customer''s order and sold to him.</span>\r\n</li>\r\n<li>\r\nTechnically sophisticated goods of proper quality shall not be subject to return or exchange.\r\n<br><span class="more_inf">(Legal basis: The List of non-food products of proper quality that are not subject to return or exchange as revised in the Enactment of the Russian Federation of 20.10.1998 No. 1222, of 06.02.2002 No. 81)</span>\r\n</li>\r\n<li>\r\nTechnically sophisticated goods with defects revealed by the Customer are subject to return or exchange provided that there is \r\na report of service center proving the fact that it is a manufacturing defect. Therefore, the Supplier (the Seller) reserves the right to carry out an additional verification of the product quality within 20 (twenty) days.\r\n<br><span class="more_inf">(Legal basis: Article 21 of the Law of the Russian Federation "On Consumer Protection" No. 2300-I, dated 07.02.1992)</span>\r\n</li>\r\n</ol>\r\n'),
('documentation', 'rus', 'ДОКУМЕНТЫ', '<p class="main_paragraph">В этом разделе собраны все документы, которые могут быть Вам полезны и помогут съэкономить Ваше время.</p>\r\n<p class="info_paragraph">Документы представлены в формате PDF. Для работы с PDF документами мы рекомендуем установить бесплатную программу <a href="http://get.adobe.com/reader/" target="_blank">Adobe Reader</a> или <a href="http://www.foxitsoftware.com/downloads/" target="_blank">Foxit Reader</a>.</p>\r\n<hr>\r\n<p class="main_paragraph">Банковские реквизиты ИП Кашковский Д.В. (<a href="./files/materials/documents/Details_Kashkovskiy_D.V..pdf" target="_blank">PDF / 89 kb</a>)</p>\r\n<p class="main_paragraph">Банковские реквизиты ООО"Апельсин-Р" (<a href="./files/materials/documents/Details_Apelsin_R.pdf" target="_blank">PDF / 90 kb</a>)</p>\r\n<hr>\r\n<p class="main_paragraph">Уважаемые покупатели! в целях избежания конфликтных ситуаций просим Вас учитывать следующее:</p>\r\n<div class="right"><a href="./files/materials/documents/Attention.pdf" target="_blank">Скачать (PDF / 48 kb)</a></div><br>\r\n<ol>\r\n<li>Отгрузка товара осуществляется в день выписки документа.</li>\r\n<li>Претензии по качеству осветительных приборов принимаются только по электрической части этих приборов.</li>\r\n<li>Претензии по комплектации, внешнему виду и недостаткам товара, которые можно выявить при осмотре товара, принимаются продавцом до подписания сопроводительных документов на товар.</li>\r\n<li>\r\nПретензии по недостаткам товара, выявленным при их использовании (в частности при подготовке к работам по установке в соответствии с назначением) принимаются к рассмотрению продавцом до момента начала использования товара или проведения работ, в т.ч. претензии по качеству керамической плитки, обоям принимаются только до их укладки или оклейки.\r\n<br><span class="more_inf">(Основание: п.17 Правил продажи отдельных видов товаров в ред. постановлений правительства РФ от 20.10.98г. №1222, от 02.10.99г. № 1104, от 06.02.02г. № 81, от 12.07.03г. №421.)</span>\r\n</li>\r\n<li>\r\nЗа недостатки товара, их материальные последствия, возникшие по вине покупателя, продавец ответственности не несет.\r\n<br><span class="more_inf">(Основание: Закон о защите прав потребителей.)</span>\r\n</li>\r\n<li>\r\nНе подлежат возврату либо обмену, купленные Вами, следующие товары надлежащего качества: кабельная продукция (провода шнуры, кабели); строительные и отделочные материалы (линолеум, пленка, ковровые покрытия и другие) и другие товары, отпускаемые продавцом на метраж, а так же уцененные товары или продаваемые по акции.\r\n<br><span class="more_inf">(Основание: Перечень непродовольственных товаров надлежащего качества не подлежащих возврату или обмену в ред. постановлений правительства РФ от 20.10.98г. №1222, от 06.02.02г. № 81).</span>\r\n</li>\r\n<li>\r\nПретензии на размер, форму, габариты, фасон, расцветку или комплектацию товара надлежащего качества принимаются в установленный действующим законодательством срок, если товар не был в употреблении, сохранен его товарный вид, потребительские свойства, пломбы, ярлыки, а также имеются доказательства приобретения товара у данного продавца.\r\n<br><span class="more_inf">(Основание: п.26 Правил продажи отдельных видов товаров в ред. постановлений правительства РФ от 20.10.98г. №1222, от 02.10.99г. № 1104, от 06.02.02г. № 81, от 12.07.03г. №421.)</span>\r\n<br><span class="more_inf">* Данный пункт не распространяется на товар, привезенный по заказу покупателя, и проданный ему.</span>\r\n</li>\r\n<li>\r\nТехнически сложные товары надлежащего качества не подлежат возврату и обмену.\r\n<br><span class="more_inf">(Основание: Перечень непродовольственных товаров надлежащего качества не подлежащих возврату или обмену в ред. постановлений правительства РФ от 20.10.98г. №1222, от 06.02.02г. № 81.)</span>\r\n</li>\r\n<li>\r\nТехнически сложные товары, в которых потребителем обнаружены недостатки, подлежат возврату и обмену только при наличии заключения сервисного центра о том, что недостаток является заводским браком. Для этого Поставщик (продавец) оставляет за собой право на проведение дополнительной проверки \r\nкачества товара в течение 20 дней.\r\n<br><span class="more_inf">(Основание: ст.21 Закона РФ "О защите прав потребителей" №2300-I, от 07.02.92г.)</span>\r\n</li>\r\n</ol>\r\n'),
('gift_cards', 'eng', 'GIFT CARDS', '<p class="main_paragraph">Finding the perfect gift for someone isn''t always easy. Whether it''s a birthday present, holiday gift, a gift to celebrate a special occasion, or a simple gesture of appreciation, an Apelsin Gift Card is the perfect present.</p>\r\n<p class="main_paragraph">Gift cards do not restrict the imagination! For the value of the card you can choose anything you like, starting from all sorts of casual trifles to some major purchases.</p>\r\n<p class="main_paragraph">The lifetime gift cards never ever expire and will always remain a desirable gift.</p>\r\n<center><img src="./resources/Images/materials_images/gift_cards_1.png" width="660"></center>\r\n<p class="main_paragraph">We offer Gift cards in the value of 1000, 3000, 5000 and 10 000 rubles. The nominal value of the gift card does not restrict the owner''s choice. Should the value of the gift exceed the value of the gift card, you can pay the rest of the sum in cash or with a bank card.</p>\r\n<center><img src="./resources/Images/materials_images/gift_cards_2.png" width="660"></center>\r\n<p class="main_paragraph">You can buy a gift card in the nearest Apelsin <a href="./contacts/en/">store</a>.</p>\r\n<p class="info_paragraph">*Gift card is a public offer that eliminates the necessity to conclude a contract between the Seller and the Buyer according to article 435 of the Civil Code of the Russian Federation. The gift card can be redeemed in Apelsin retail chain stores only. The remaining balance of the Gift card will be cancelled. If the purchase cost exceeds the value specified on the front side of the Gift card, the buyer pays this difference separately.\r\n<br /><br />\r\nThe certificate shall be withdrawn right after the purchase.<br />\r\nBe careful! Gift card is not subject to exchange or return.<br />\r\nDamaged Gift cards are not valid.</p>\r\n'),
('gift_cards', 'rus', 'ПОДАРОЧНЫЕ КАРТЫ', '<p class="main_paragraph">Выбрать подарок близким или коллегам зачастую непросто, но есть прекрасное универсальное решение для любого повода – ПОДАРОЧНАЯ КАРТА от сети магазинов «Апельсин».</p>\r\n<p class="main_paragraph">Подарочные карты не ограничивают фантазию в выборе! На сумму номинала карты можно выбрать всё, что придётся по душе - от множества необходимых расходных мелочей, до серьезных покупок.</p>\r\n<p class="main_paragraph">Подарочная карта не имеет срока давности и всегда останется актуальным подарком.</p>\r\n<center><img src="./resources/Images/materials_images/gift_cards_1.png" width="660"></center>\r\n<p class="main_paragraph">Мы предлагаем Подарочные карты номиналом 1000, 3000, 5000, 10000 рублей. Номинал подарочный карты не ограничивает владельца в выборе: всегда можно доплатить разницу наличными или банковской картой.</p>\r\n<center><img src="./resources/Images/materials_images/gift_cards_2.png" width="660"></center>\r\n<p class="main_paragraph">Приобрести подарочные карты Вы можете в любом ближайшем к Вам <a href="./contacts/ru/">магазине</a> нашей сети.</p>\r\n<p class="info_paragraph">*Подарочная карта является публичной офертой и упраздняет необходимость заключения договора между продавцом и покупателем согласно статьи 435 ГК РФ. Подарочная карта может быть отоварена только в магазинах розничной сети «Апельсин». Остаток денежных средств на Подарочной карте после совершения покупки покупателем аннулируется. В случае если сумма покупки превышает размер номинала, указанного на лицевой стороне Подарочной карты, покупатель выплачивает превышающую сумму покупки отдельно.\r\n<br /><br />\r\nПосле совершения покупки сертификат изымается.<br />\r\nБудьте внимательны! Подарочная карта обмену и возврату не подлежит!<br />\r\nПодарочная карта с механическими повреждениями не действительна.</p>\r\n'),
('main', 'eng', 'APELSIN - Company', '\n<div class="main_pic_panel">\n<div class="main_pic o_kompanii">\n<a href="./about/en/">\n<img class="main_pic_img" src="./images/materials/main/o_kompanii.png" title="About" alt="About">\n<img class="main_pic_img_g" src="./images/materials/main/g_o_kompanii.png" title="About" alt="About">\n<div class="main_pic_name">About</div>\n</a>\n</div>\n<div class="main_pic akciya">\n<a href="./news/en/">\n<img class="main_pic_img" src="./images/materials/main/akciya.png" title="News" alt="News">\n<img class="main_pic_img_g" src="./images/materials/main/g_akciya.png" title="News" alt="News">\n<div class="main_pic_name">News</div>\n</a>\n</div>\n<div class="main_pic informaciya">\n<a href="./information/en/">\n<img class="main_pic_img" src="./images/materials/main/informaciya.png" title="Information" alt="Information">\n<img class="main_pic_img_g" src="./images/materials/main/g_informaciya.png" title="Information" alt="Information">\n<div class="main_pic_name">Information</div>\n</a>\n</div>\n<div class="main_pic kontakty">\n<a href="./contacts/en/">\n<img class="main_pic_img" src="./images/materials/main/kontakty.png" title="Contacts" alt="Contacts">\n<img class="main_pic_img_g" src="./images/materials/main/g_kontakty.png" title="Contacts" alt="Contacts">\n<div class="main_pic_name">Contacts</div>\n</a>\n</div>\n<div class="main_pic oplata_i_dostavka">\n<a href="./payment_and_delivery/en/">\n<img class="main_pic_img" src="./images/materials/main/oplata_i_dostavka.png" title="Payment & Delivery" alt="Payment & Delivery">\n<img class="main_pic_img_g" src="./images/materials/main/g_oplata_i_dostavka.png" title="Payment & Delivery" alt="Payment & Delivery">\n<div class="main_pic_name">Payment & Delivery</div>\n</a>\n</div>\n<div class="main_pic kredit">\n<a href="./credit/en/">\n<img class="main_pic_img" src="./images/materials/main/kredit.png" title="Credit" alt="Credit">\n<img class="main_pic_img_g" src="./images/materials/main/g_kredit.png" title="Credit" alt="Credit">\n<div class="main_pic_name">Credit</div>\n</a>\n</div>\n<div class="main_pic diskont">\n<a href="./discount/en/">\n<img class="main_pic_img" src="./images/materials/main/diskont.png" title="Discount" alt="Discount">\n<img class="main_pic_img_g" src="./images/materials/main/g_diskont.png" title="Discount" alt="Discount">\n<div class="main_pic_name">Discount</div>\n</a>\n</div>\n<div class="main_pic podarochnye_karty">\n<a href="./gift_cards/en/">\n<img class="main_pic_img" src="./images/materials/main/podarochnye_karty.png" title="Gift cards" alt="Gift cards">\n<img class="main_pic_img_g" src="./images/materials/main/g_podarochnye_karty.png" title="Gift cards" alt="Gift cards">\n<div class="main_pic_name">Gift cards</div>\n</a>\n</div>\n<div class="main_pic dokumenty">\n<a href="./documents/en/">\n<img class="main_pic_img" src="./images/materials/main/dokumenty.png" title="Documents" alt="Documents">\n<img class="main_pic_img_g" src="./images/materials/main/g_dokumenty.png" title="Documents" alt="Documents">\n<div class="main_pic_name">Documents</div>\n</a>\n</div>\n<div class="main_pic vakansii">\n<a href="./vacancies/en/">\n<img class="main_pic_img" src="./images/materials/main/vakansii.png" title="Vacancies" alt="Vacancies">\n<img class="main_pic_img_g" src="./images/materials/main/g_vakansii.png" title="Vacancies" alt="Vacancies">\n<div class="main_pic_name">Vacancies</div>\n</a>\n</div>\n<div class="main_pic servisnye_centry">\n<a href="./service_centers/en/">\n<img class="main_pic_img" src="./images/materials/main/servisnye_centry.png" title="Service Centers" alt="Service Centers">\n<img class="main_pic_img_g" src="./images/materials/main/g_servisnye_centry.png" title="Service Centers" alt="Service Centers">\n<div class="main_pic_name">Service Centers</div>\n</a>\n</div>\n<div class="main_pic poleznye_stati">\n<a href="./helpful_articles/en/">\n<img class="main_pic_img" src="./images/materials/main/poleznye_stati.png" title="Helpful Articles" alt="Helpful Articles">\n<img class="main_pic_img_g" src="./images/materials/main/\r\ng_poleznye_stati.png" title="Helpful Articles" alt="Helpful Articles">\n<div class="main_pic_name">Helpful Articles</div>\n</a>\n</div>\n<div class="clear"></div>\n</div>\n'),
('main', 'rus', 'Компания Апельсин', '\n<div class="main_pic_panel">\n<div class="main_pic o_kompanii">\n<a href="./about/ru/">\n<img class="main_pic_img" src="./images/materials/main/o_kompanii.png" title="О компании" alt="О компании">\n<img class="main_pic_img_g" src="./images/materials/main/g_o_kompanii.png" title="О компании" alt="О компании">\n<div class="main_pic_name">О компании</div>\n</a>\n</div>\n<div class="main_pic akciya">\n<a href="./news/ru/">\n<img class="main_pic_img" src="./images/materials/main/akciya.png" title="Акции" alt="Акции">\n<img class="main_pic_img_g" src="./images/materials/main/g_akciya.png" title="Акции" alt="Акции">\n<div class="main_pic_name">Акции</div>\n</a>\n</div>\n<div class="main_pic informaciya">\n<a href="./information/ru/">\n<img class="main_pic_img" src="./images/materials/main/informaciya.png" title="Информация" alt="Информация">\n<img class="main_pic_img_g" src="./images/materials/main/g_informaciya.png" title="Информация" alt="Информация">\n<div class="main_pic_name">Информация</div>\n</a>\n</div>\n<div class="main_pic kontakty">\n<a href="./contacts/ru/">\n<img class="main_pic_img" src="./images/materials/main/kontakty.png" title="Контакты" alt="Контакты">\n<img class="main_pic_img_g" src="./images/materials/main/g_kontakty.png" title="Контакты" alt="Контакты">\n<div class="main_pic_name">Контакты</div>\n</a>\n</div>\n<div class="main_pic oplata_i_dostavka">\n<a href="./payment_and_delivery/ru/">\n<img class="main_pic_img" src="./images/materials/main/oplata_i_dostavka.png" title="Оплата и доставка" alt="Оплата и доставка">\n<img class="main_pic_img_g" src="./images/materials/main/g_oplata_i_dostavka.png" title="Оплата и доставка" alt="Оплата и доставка">\n<div class="main_pic_name">Оплата и доставка</div>\n</a>\n</div>\n<div class="main_pic kredit">\n<a href="./credit/ru/">\n<img class="main_pic_img" src="./images/materials/main/kredit.png" title="Кредит" alt="Кредит">\n<img class="main_pic_img_g" src="./images/materials/main/g_kredit.png" title="Кредит" alt="Кредит">\n<div class="main_pic_name">Кредит</div>\n</a>\n</div>\n<div class="main_pic diskont">\n<a href="./discount/ru/">\n<img class="main_pic_img" src="./images/materials/main/diskont.png" title="Дисконт" alt="Дисконт">\n<img class="main_pic_img_g" src="./images/materials/main/g_diskont.png" title="Дисконт" alt="Дисконт">\n<div class="main_pic_name">Дисконт</div>\n</a>\n</div>\n<div class="main_pic podarochnye_karty">\n<a href="./gift_cards/ru/">\n<img class="main_pic_img" src="./images/materials/main/podarochnye_karty.png" title="Подарочные карты" alt="Подарочные карты">\n<img class="main_pic_img_g" src="./images/materials/main/g_podarochnye_karty.png" title="Подарочные карты" alt="Подарочные карты">\n<div class="main_pic_name">Подарочные карты</div>\n</a>\n</div>\n<div class="main_pic dokumenty">\n<a href="./documents/ru/">\n<img class="main_pic_img" src="./images/materials/main/dokumenty.png" title="Документы" alt="Документы">\n<img class="main_pic_img_g" src="./images/materials/main/g_dokumenty.png" title="Документы" alt="Документы">\n<div class="main_pic_name">Документы</div>\n</a>\n</div>\n<div class="main_pic vakansii">\n<a href="./vacancies/ru/">\n<img class="main_pic_img" src="./images/materials/main/vakansii.png" title="Вакансии" alt="Вакансии">\n<img class="main_pic_img_g" src="./images/materials/main/g_vakansii.png" title="Вакансии" alt="Вакансии">\n<div class="main_pic_name">Вакансии</div>\n</a>\n</div>\n<div class="main_pic servisnye_centry">\n<a href="./service_centers/ru/">\n<img class="main_pic_img" src="./images/materials/main/servisnye_centry.png" title="Сервисные центры" alt="Сервисные центры">\n<img class="main_pic_img_g" src="./images/materials/main/g_servisnye_centry.png" title="Сервисные центры" alt="Сервисные центры">\n<div class="main_pic_name">Сервисные центры</div>\n</a>\n</div>\n<div class="main_pic poleznye_stati">\n<a href="./helpful_articles/ru/">\n<img class="main_pic_img" src="./images/materials/main/poleznye_stati.png" title="Полезные статьи" alt="Полезные статьи">\n<img class="\r\nmain_pic_img_g" src="./images/materials/main/g_poleznye_stati.png" title="Полезные статьи" alt="Полезные статьи">\n<div class="main_pic_name">Полезные статьи</div>\n</a>\n</div>\n<div class="clear"></div>\n</div>\n'),
('news_aksessuar_dlja_vannoj_i_discount', 'rus', 'АКСЕССУАРЫ ДЛЯ ВАННОЙ КОМНАТЫ', '<p>Скидки на все настольные и напольные аксессуары для ванной комнаты - 30%!!!</p>'),
('news_bytovaja_himija_i_advertising_goods', 'rus', 'НОВИНКА!<br>БЫТОВАЯ ХИМИЯ', '<p>Внимание! В магазине на Есенина, 13 представлен большой выбор товаров БЫТОВОЙ ХИМИИ. </p>\r\n<p>Спешите - на весь ассортимент действуют ОПТОВЫЕ ЦЕНЫ!</p>\r\n\r\n<div class="materialPromoIMG_Block">\r\n    <img class="materialPromoIMG" src="./resources/Images/promotional_flyer/news_bytovaja_himija_i_advertising_goods.jpg">\r\n</div>'),
('news_dveri_UNION_i_polisteny', 'rus', 'ДВЕРИ UNION. ИТАЛИЯ', '<p>В ТЦ Апельсин по адресу <a href="./13_yesenina_str/ru/" target=''_blank''>ул. Есенина д.13</a> открылся новый зал итальянских дверей UNION.</p>\r\n<p>Коллекции выполненны в классическом стиле, в отделке Arte panna, полностью повторяющей результат ручного труда. Высокотехнологичное покрытие с использованием лакокрасочных материалов на водной основе, создает эффект благородной патины, отвечая самым высоким стандартам классического стиля. А высокое качество используемых материалов обеспечивает эстетическую долговечность.</p>\r\n<p>Двери UNION подходят тем, кто заботится о своём здоровье - все материалы, включая лакокрасочные материалы для отделки, экологичны и абсолютно безопасны.</p>\r\n<a href="http://polisteny.ru/news/rus/news_01/" target=''_blank''>Подробнее</a>\r\n<br />'),
('news_dver_metalicheskaja_i_good_price', 'rus', 'СВЕРХНИЗКАЯ ЦЕНА!<br>МЕТАЛЛИЧЕСКИЕ ДВЕРИ', '<p>\r\n    Внимание! Металлические двери по Сверхнизкой цене – от <span class="main_text">2 195 руб.\r\n</p>'),
('news_dver_mezhkomnatnaja_i_gift_2p1', 'rus', 'ДАРИМ ДВЕРИ', '<p>\r\n    Внимание! При покупке трёх и более полотен, по розничной цене, \r\n    каждое третье полотно, \r\n    с наименьшей стоимостью, Вы получаете \r\n    <span class="main_text">В ПОДАРОК</span>!*\r\n</p>\r\n<p class="inf">*подробную информацию уточняйте у менеджеров.</p>\r\n\r\n<p class="inf">\r\n<a class="fancybox-doc" href="#doc_div_akcija_darim_dveri" title="Регламент акции «Дарим двери»">\r\nРегламент акции «Дарим двери»\r\n</a>\r\n</p>\r\n\r\n<div class="doc_div" id="doc_div_akcija_darim_dveri" style="display: none;">\r\n    <ul class="dash">\r\n    </ul>\r\n\r\n    <ul class="without_design">\r\n        <li>1) Акция распространяется на межкомнатные полотна.</li>\r\n        <li>2) При покупке трёх и более полотен, по розничной цене, каждое третье полотно, с наименьшей стоимостью, дарится в подарок.</li>\r\n        <li>3) Распродажные двери участвуют в акции из наличия на складе.</li>\r\n        <li>4) При частичном расторжении договора купли-продажи, возврат 1 и более позиций по чеку приобретенных без предоставления скидки, покупатель обязуется приобрести товар, предоставленный ему со скидкой, по его полной стоимости указанной в чеке. \r\n            При полном расторжении договора купли продажи, возврат всего товара по чеку, осуществляется в соответствии с действующим законодательством РФ.   </li>\r\n        <li>5) Покупателю предоставляется право выбора:\r\n        <ul class="dash">\r\n            <li>Участвовать  в акции.</li>\r\n            <li>Покупка в стандартном режиме, с использованием дисконтных карт.</li>\r\n        </ul>\r\n        </li>\r\n        <li>6) Выписка товаров в рамках акции «Дарим двери» производится отдельным чеком.</li>\r\n        <li>7) Списание бонусов на акционной накладной технически не возможно, бонусы можно списывать на накладной с поганажем и фурнитурой.</li>\r\n        <li>8) Участие в акции доступно только физическим лицам.</li>\r\n        <li>9) На накладную по акции, возможно оформление кредита, оформление рассрочки не возможно.</li>\r\n    </ul>\r\n</div>\r\n\r\n<div class="materialPromoIMG_Block">\r\n    <img class="materialPromoIMG" src="./resources/Images/promotional_flyer/news_dver_mezhkomnatnaja_i_gift_2p1.jpg">\r\n</div>'),
('news_granit_keramicheskij_i_good_price', 'rus', 'КЕРАМИЧЕСКИЙ ГРАНИТ', '<p>Специальное предложение! Керамогранит всего \r\n    за <span class="main_text">199 руб./кв.м.</span>! \r\n    (Старая цена: 290 руб./кв.м.)</p>\r\n\r\n<div class="materialPromoIMG_Block">\r\n    <img class="materialPromoIMG" src="./resources/Images/promotional_flyer/news_granit_keramicheskij_i_good_price.jpg">\r\n</div>'),
('news_ishhem_pomeshhenie_i_news', 'rus', 'ИЩЕМ ПОМЕЩЕНИЕ', '<p>Компания "Апельсин" рассмотрит предложения по аренде/выкупу торговых площадей, склада, базы, земельных участков площадью 3 000 - 5 000 м² для торговли строительно-отделочными материалами в Центральном Федеральном Округе.</p>\r\n<!--<p class="inf">Подробности по телефону: 8(920)970-07-01</p>-->\r\n<div class="doc_div" id="ishhem_pomeshhenie_doc"  style="padding-top: 10px;">\r\n<p>Информация для собственников земельных участков:</p>\r\n<p class="inf">Требования к участкам:</p>\r\n<ul class="dash">\r\n<li class="inf">площадь от 0,7 Га;</li>\r\n<li class="inf">расположение: вдоль основных транспортных магистралей города;</li>\r\n<li class="inf">близость к жилым массивам или торговым объектам \r\n    (продуктовым гипермаркетам, торговым центрам);</li>\r\n<li class="inf">удобные подъездные пути для легкового и грузового \r\n    транспорта с грузоподъемностью не менее 20 т;</li>\r\n<li class="inf">категория: земли населенных пунктов или земли промышленности;</li>\r\n<li class="inf">разрешенное использование: для строительства торговых объектов;</li>\r\n<li class="inf">возможность или наличие инженерного обеспечения объекта \r\n    электричеством (150-200 кВт), центральными сетями водо- и \r\n    теплоснабжения и канализации;</li>\r\n<li class="inf">максимальное расстояние до остановок \r\n    общественного транспорта - 300 м.</li>\r\n</ul>\r\n<p>Информация для владельцев торговых центров и иных объектов недвижимости:</p>\r\n<p class="inf">Требования к торговым площадям:</p>\r\n<ul class="dash">\r\n<li class="inf">площадь от 2000 м2;</li>\r\n<li class="inf">торговая площадь должна иметь прямоугольную (или приближенную \r\n    к прямоугольной) форму и располагаться на первом этаже здания, \r\n    либо размещаться в 2-х этажах;</li>\r\n<li class="inf">нагрузка на пол: 1000 кг/м2, 2-й этаж 800 кг/м2;</li>\r\n<li class="inf">высота потолков не менее 3 м;</li>\r\n<li class="inf">в составе ритейл-парка, современного торгового \r\n    комплекса или отдельно стоящее здание;</li>\r\n<li class="inf">рассматриваем варианты реконструкции бывших \r\n    индустриальных и складских зон;</li>\r\n<li class="inf">удобный подъезд для легкового и грузового транспорта \r\n    с грузоподъемностью не менее 20 т;</li>\r\n<li class="inf">возможность или наличие размещения гостевой парковки \r\n    в соотношении 1 машино-место на 25 м2 торговой площади. Более 60% \r\n    территории стоянки должно находиться перед фасадом магазина. \r\n    Стоянка должна быть на одном уровне с торговой площадью. \r\n    Не должно быть никаких препятствий между магазином и стоянкой;</li>\r\n<li class="inf">дебаркадер для разгрузки не менне двух грузовых \r\n    автомобилей. Желательно расположение складских и подсобных \r\n    помещений на одном уровне с торговой площадью;</li>\r\n<li class="inf">освещение внутри здания должно быть не менее 650 лм на 1 м2;</li>\r\n<li class="inf">здании должны быть предусмотрены грузовые \r\n    ворота шириной не менее 2500 мм;</li>\r\n<li class="inf">здание должно быть оборудовано грузовым лифтом с размерами \r\n    не менее 1,500 м*1,5 м, высотой 2 м, грузоподъемностью не менее 1 т.</li>\r\n</ul>\r\n<p>Компания "Апельсин" рассмотрит следущие варианты сотрудничества:</p>\r\n<ul class="dash">\r\n<li class="inf">аренда/выкуп земельного участка под строительство \r\n    торгового комплекса;</li>\r\n<li class="inf">аренда/выкуп земельного участка с объектами, которые \r\n    можно реконструировать под торговые комплексы (снести);</li>\r\n<li class="inf">аренда/выкуп строящихся или построенных торговых комплексов;</li>\r\n<li class="inf">совместное освоение земельных участков;</li>\r\n<li class="inf">форвардные сделки по покупке объектов, \r\n    построенных "под ключ", по нашим требованиям.</li>\r\n</ul>\r\n<p>Необходимые документы для рассмотрения заявки:</p>\r\n<ul class="dash">\r\n<li class="inf">Свид-во о гос. регистрации права собственности/аренды \r\n    (договор аренды, иные документы);</li>\r\n<li class="inf">Кадастровый план земельного участка;</li>\r\n</ul>\r\n<p>Если на земельном участке есть объекты строительства:</p>\r\n<ul class="dash">\r\n<li class="inf">Свид-во о гос. регистрации прав собственности на объекты \r\n    (разрешение на строительство и т.д.);</li>\r\n<li class="inf">технические паспорта объектов;</li>\r\n<li class="inf">планировка этажей;</li>\r\n<li class="inf">договоры или ТУ на подключения к инженерным сетям.</li>\r\n</ul>\r\n<hr>\r\n<p>Просим направлять Ваше предложение с обязательным приложением необходимых \r\nдокументов по объекту и ситуационным планом (карта с отмеченными границами участка) </p>\r\n<hr>\r\n<p>Кузнецов Дмитрий Сергеевич</p>\r\n<p>8(4912)240-330, 8(920)970-07-01</p>\r\n<p><a href="mailto:kuznetsov.dmitriy@apelsin.ru">kuznetsov.dmitriy@apelsin.ru</p>\r\n</div>\r\n'),
('news_kabel_i_discount', 'rus', 'КАБЕЛЬ', '<p>Акция! Каждому покупателю при покупке целой бухты* любого кабеля предоставляется <span class="main_text">скидка - 25% от розничной цены</span>.</p>\r\n<p class="inf">В акции участвует весь ассортимент кабеля.</p>\r\n<p class="inf">При покупке количества превышающего длину бухты скидка предоставляется только на целые бухты.</p>\r\n<p class="inf">*Для кабелей СИП, КГ, ПВ скидка предоставляется при покупке длины от 100 м.</p>\r\n\r\n<div class="materialPromoIMG_Block">\r\n    <img class="materialPromoIMG" src="./resources/Images/promotional_flyer/news_kabel_i_discount.jpg">\r\n</div>\r\n'),
('news_kandicionery_i_advertising_goods', 'rus', 'КОНДИЦИОНЕРЫ В КАЖДЫЙ ДОМ', '<p>Внимание!!! <span class="main_text">Кондиционеры</span> самых известных \r\n    марок - Fujitsu, General Climat, Hitachi, LG, Panasonic, Toshiba \r\n    мы предлагаем <span class="main_text">по Супернизким ценам</span>!!!</p>\r\n\r\n<div class="materialPromoIMG_Block">\r\n    <img class="materialPromoIMG" src="./resources/Images/promotional_flyer/news_kandicionery_i_advertising_goods.jpg">\r\n</div>\r\n'),
('news_kolerovka_i_service', 'rus', 'КОЛЕРОВКА БЕСПЛАТНО', '<p>Внимание! Компьютерная колеровка совершенно <span class="main_text">БЕСПЛАТНО*</span>!</p>\r\n<p class="inf">*Данное предложение действует для розничных покупателей и распространяется на определенные цвета. Более подробная информация у менеджеров торгового зала.</p>\r\n\r\n<div class="materialPromoIMG_Block">\r\n    <img class="materialPromoIMG" src="./resources/Images/promotional_flyer/news_kolerovka_i_service.jpg">\r\n</div>\r\n'),
('news_kover_i_discount', 'rus', 'КОВРЫ', '<p>Внимание! Скидки на Ковры до <span class="main_text">50%</span>!!!</p>\r\n\r\n<div class="materialPromoIMG_Block">\r\n    <img class="materialPromoIMG" src="./resources/Images/promotional_flyer/news_kover_i_discount.jpg">\r\n</div>\r\n'),
('news_kraska_LAKRA_14KG_akrilovaja_interernaja_belaja_i_good_price', 'rus', 'АКРИЛОВАЯ КРАСКА<br>ЛАКРА ИНТЕРЬЕРНАЯ', '<p>\r\n    Краска вододисперсионная интерьерная белая ЛАКРА 14КГ по суперцене\r\n    <span class="main_text">\r\n        589 руб.\r\n    </span>\r\n    <span class="inf">(Старая цена –\r\n        729 руб.\r\n    )</span>\r\n</p><div class="materialPromoIMG_Block">\r\n    <img class="materialPromoIMG" src="./resources/Images/promotional_flyer/news_kraska_LAKRA_14KG_akrilovaja_interernaja_belaja_i_good_price.jpg" align="right"  >\r\n</div>\r\n<p class="inf">Обладает следующими достоинствами:</p>\r\n<ul class="dash">\r\n    <li class="inf">образует ровное матовое покрытие;</li>\r\n    <li class="inf">имеет хорошую адгезию к основанию;</li>\r\n    <li class="inf">хорошая укрывистость;</li>\r\n    <li class="inf">морозостойкая;</li>\r\n    <li class="inf">устойчива к легкой влажной уборке;</li>\r\n    <li class="inf">не мелит.</li>\r\n</ul>\r\n<p class="inf">*Акция действует до 30 ноября.</p>\r\n\r\n'),
('news_kraska_PARADE_W110_9L_akrilovaja_dlja_oboev_i_good_price', 'rus', 'АКРИЛОВАЯ КРАСКА<br>PARADE W110', '<p>\r\n    Акриловая краска для обоев PARADE W110 9L по суперцене\r\n    <span class="main_text">\r\n        1 869 руб.\r\n    </span> \r\n    <span class="inf">(Старая цена\r\n        2 337 руб.\r\n    )</span>\r\n</p><div class="materialPromoIMG_Block">\r\n    <img class="materialPromoIMG" src="./resources/Images/promotional_flyer/news_kraska_PARADE_W110_9L_akrilovaja_dlja_oboev_i_good_price.jpg" align="right"  style="padding-left:20px;">\r\n</div>\r\n<p class="inf">Обладает следующими достоинствами: </p>\r\n<ul class="dash">\r\n    <li class="inf">для всех типов обоев под окраску;</li>\r\n    <li class="inf">идеально передает фактуру обоев;</li>\r\n    <li class="inf">для помещений с повышенной влажностью, подвергающихся высоким эксплуатационным нагрузкам;</li>\r\n    <li class="inf">покрытие выдерживает частую влажную уборку с применением моющих средств;</li>\r\n    <li class="inf">морозостойкая;</li>\r\n    <li class="inf">колеровка ручная красителями для водных красок;</li>\r\n    <li class="inf">3 000 циклов мытья.</li>\r\n</ul>\r\n<p class="inf">\r\n*Акция действует до 30 ноября.\r\n</p>\r\n\r\n\r\n'),
('news_krvoelnyj_meterial_i_discount', 'rus', 'КРОВЕЛЬНЫЕ МАТЕРИАЛЫ', '<p>Сверхнизкая цена на Битумные Рулонные и Наплавляемые материалы!</p>\r\n\r\n<div class="materialPromoIMG_Block">\r\n    <img class="materialPromoIMG" src="./resources/Images/promotional_flyer/news_krvoelnyj_meterial_i_discount.jpg">\r\n</div>\r\n'),
('news_ljuk_kanalizacionnyj_i_good_price', 'rus', 'ЛЮК КАНАЛИЗАЦИОННЫЙ', '<p>Люк канализационный черный - <span class="main_text">779 руб</span>. \r\n    (Старая цена - 945 руб.)</p>\r\n'),
('news_ljustry_i_gift_1p1', 'rus', 'ЛЮСТРЫ<br>АКЦИЯ 1+1', '<p class="main_paragraph">\r\nКупи люстру и выбери 2-ую <span class="main_text">В ПОДАРОК</span>!*\r\n</p>\r\n<p class="inf">\r\n* Подарок равен половине стоимости первой.\r\n</p>\r\n\r\n<div class="materialPromoIMG_Block">\r\n    <img class="materialPromoIMG" src="./resources/Images/promotional_flyer/news_ljustry_i_gift_1p1.jpg">\r\n</div>\r\n'),
('news_mebel_dlja_vannoj_i_good_price', 'rus', 'МЕБЕЛЬ ДЛЯ ВАННОЙ КОМНАТЫ', '<p>Акция! Мебель для ванной комнаты по невероятно низкой цене!</p>\r\n<ul class="without_design">\r\n<li class="inf">Тумба Палермо 60 ПВХ белая + Раковина Арго 60, Calpe — <span class="main_text">2199 руб.</span> (Старая цена - 3990 руб.);</li>\r\n<li class="inf">Тумба Палермо 55 ПВХ белая + Раковина Арго 55, Calpe — <span class="main_text">1950 руб.</span> (Старая цена - 3720 руб.);</li>\r\n<li class="inf">Шкаф зерк. Палермо 550 левый/правый Calpe — <span class="main_text">1490 руб.</span> (Старая цена - 2210 руб.);</li>\r\n<li class="inf">Тумба ЛМ 490 + Раковина Браво 490 Какса.А — <span class="main_text">1999 руб.</span> (Старая цена - 2550 руб.);</li>\r\n</ul>\r\n\r\n<div class="materialPromoIMG_Block">\r\n    <img class="materialPromoIMG" src="./resources/Images/promotional_flyer/news_mebel_dlja_vannoj_i_good_price_eko.jpg">\r\n    <img class="materialPromoIMG" src="./resources/Images/promotional_flyer/news_mebel_dlja_vannoj_i_good_price_tumba.jpg">\r\n</div>'),
('news_oboi_i_gift_3p1', 'rus', 'ОБОИ<br>АКЦИЯ 3+1', '<p class="main_paragraph">\r\nВнимание! При покупке 3-х рулонов обоев 4-й Вы получаете <span class="main_text">В ПОДАРОК</span>!*\r\n</p>\r\n<p class="inf">\r\n*Акция распространяется на определенные виды обоев.\r\n</p>\r\n\r\n<div class="materialPromoIMG_Block">\r\n    <img class="materialPromoIMG" src="./resources/Images/promotional_flyer/news_oboi_i_gift_3p1.jpg">\r\n</div>'),
('news_osb_3_i_good_price', 'rus', 'ПЛИТА OSB-3', '<p>Внимание! Акция на Плиту OSB-3 9 мм (2,44*1,22).</p>\r\n<p>Новая цена: <span class="main_text">449 руб.</span> (Старая цена: 529 руб.)</p>\r\n\r\n<div class="materialPromoIMG_Block">\r\n    <img class="materialPromoIMG" src="./resources/Images/promotional_flyer/news_osb_3_i_good_price.jpg">\r\n</div>'),
('news_parketnaja_doska_i_gift_5p1', 'rus', 'ПАРКЕТНАЯ ДОСКА<br>АКЦИЯ 5+1', '<p>Продолжает действовать Специальное предложение по Паркетной доске: при \r\n    покупке 5-ти пачек 6-у Вы получаете \r\n    <span class="main_text">БЕСПЛАТНО!</span></p>\r\n<p class="inf">*Акция распространяется на Паркетную доску со стикером.</p>\r\n\r\n<div class="materialPromoIMG_Block">\r\n    <img class="materialPromoIMG" src="./resources/Images/promotional_flyer/news_parketnaja_doska_i_gift_5p1.jpg">\r\n</div>\r\n'),
('news_proflist_c8_c21_i_best_price', 'rus', 'ЛУЧШАЯ ЦЕНА!<br>ПРОФЛИСТ', '<p>Внимание! Профлист С 8 по супернизким ценам - \r\n    <span class="main_text">165 руб./пог.м</span> (Старая цена - 190 руб./пог.м)</p>\r\n<p>В акции участвует:</p>\r\n<p class="inf">Профлист С 8 (оцинк., эконом):<br>\r\n1,2х1,5 = 248 руб./шт.; 1,2х1,8 = 297 руб./шт.; 1,2х2 = 330 руб./шт.</p>\r\n<p>Профлист С 21 по супернизким ценам - \r\n    <span class="main_text">165 руб./пог.м</span> (Старая цена - 190 руб./пог.м)</p>\r\n<p>В акции участвует:</p>\r\n<p class="inf">Профлист С 21 (оцинк., эконом):<br>\r\n1,051х2,0 = 330 руб./шт.; 1,051х2,5 = 412 руб./шт.; 1,051х3 = 495 руб./шт.</p>'),
('news_programma_bonus_i_service', 'rus', 'ПРОГРАММА БОНУС', ' <img class="materialPromoIMG" src="./resources/Images/promotional_flyer/news_programma_bonus_i_service.jpg"  align="right"  style="padding-left:20px;">\r\n<p>Внимание! Представляем Вам Программу "БОНУС".</p>\r\n\r\n<p>Программa "БОНУС" - это вознаграждение в виде Бонусных баллов за каждую покупку в наших магазинах.</p>\r\n\r\n<p>Это <span class="main_text">Просто</span> - покупай и накапливай баллы.</p>\r\n\r\n<p>Это <span class="main_text">Выгодно</span> - оплачивай баллами следующую покупку.</p>\r\n\r\n<p class="main_text">Внимание! Оплачивай бонусами в КАЖДУЮ СУББОТУ!</p>\r\n<div class="clear"></div>\r\n<h2>Правила участия в программе БОНУС.</h2>\r\n<ul class="without_design">\r\n<li>1. Общая информация.</li>\r\n<li>1.1. Получая Карту Апельсин, Вы становитесь Участником Программы Бонус.</li>\r\n<li>1.2. Карта действует во всех магазинах розничной сети Апельсин, расположенных на территории РФ.</li>\r\n<li>1.3. Участие в Программе доступно физическим лицам гражданам РФ \r\n    старше 18 лет. Юридические лица, предприниматели совершающие покупки \r\n    в коммерческих целях, не могут стать Участниками индивидуальные Программы.</li>\r\n<li>2. Статус Карты.</li>\r\n<li>2.1. Существует три статуса Карты (мелкий ОПТ, средний ОПТ, ОПТ), \r\n    выдаваемых Участнику Программы. Статус карты зависит от накопленной \r\n    суммы покупок, совершенных при предъявлении уже имеющейся Карты, или \r\n    суммы единовременной покупки при оформлении новой Карты.</li>\r\n<li>2.2. Если общая сумма покупок, совершенных при предъявлении Карты одного \r\n    типа, соответствует большему номиналу, то осуществляется автоматический \r\n    перевод карты в новый статус. Накопленная сумма покупок и накопленные \r\n    Бонусные баллы остаются на Карте.</li>\r\n<li>3. Начисление Бонусных баллов.</li>\r\n<li>3.1. В рамках действия Программы на Карту начисляются Бонусные баллы, \r\n    которые могут быть использованы при последующих покупках в магазинах \r\n    Апельсин. Количество Бонусных баллов, зачисляемых на Карту, зависит \r\n    от суммы покупки, наименования товара и не зависит от ее статуса. \r\n    Подробную информацию о возможности начисления бонусных баллов за \r\n    конкретный товар Вы можете уточнить у продавцов-консультантов.</li>\r\n<li>3.2. Бонусные баллы зачисляются на Карту в течении суток с момента покупки.</li>\r\n<li>3.3. При совершении покупки Бонусные баллы начисляются только при предъявлении Карты.</li>\r\n<li>3.4. На сумму покупки, оплаченную Бонусными баллами, Бонусные баллы не начисляются.</li>\r\n<li>4. Использование Бонусных баллов.</li>\r\n<li>4.1. Начисленные на Карту Бонусные баллы могут быть потрачены при совершении последующих покупок в     магазинах розничной сети Апельсин каждую субботу любого месяца (при условии работы магазина). Один Бонусный балл эквивалентен одному рублю.</li>\r\n<li>4.2. Единовременно Бонусными баллами можно оплатить до 20% цены товара.</li>\r\n<li>4.4. В случае возврата товара, оплаченного Бонусными баллами, \r\n    владельцу Карты возвращаются уплаченные средства; израсходованные \r\n    Бонусные баллы восстанавливаются на счете Карты (через сутки); \r\n    денежные начисленные за покупку Бонусные баллы аннулируются. \r\n    При возврате части покупки использованные Бонусные баллы \r\n    восстанавливаются пропорционально сумме возврата.</li>\r\n<li>5. Списание Бонусных баллов.</li>\r\n<li>5.1. Начисленные Бонусные баллы являются срочными. Срок действия Бонусных баллов ограничен и составляет 180 дней с момента зачисления на карту. Неиспользованные баллы сгорают по окончанию срока действия программы.\r\n    Бонусные баллы аннулируются.</li>\r\n<li>6. Иные условия.</li>\r\n<li>6.1. В случае утери Карты, новая может быть выдана при предъявлении \r\n    документа удостоверяющего личность наличие чека, по которому \r\n    совершались покупки с предъявлением Карты). Утерянная Карта \r\n    (желательно блокируется по заявлению клиента, общая сумма \r\n    покупок и Бонусные баллы, накопленные на утерянной Карте, \r\n    переносятся на новую. При несовпадении данных, указанных в \r\n    паспорте, с данными указанными в Анкете, Карта не восстанавливается.</li>\r\n<li>6.2. Карта является собственностью сети магазинов Апельсин и должна быть \r\n    безвозмездно возвращена собственнику по первому его требованию.</li>\r\n<li>6.3. Участник может направлять свои претензии Компании любым удобным для него способом.</li>\r\n<li>6.4. Компания Апельсин оставляет за собой право изменить Условия участия \r\n    в Программе в одностороннем порядке, информация об изменениях \r\n    доступна на сайте WWW.APELSIN.RU.</li>\r\n</ul>'),
('news_skidka_vyhodnogo_dnja_i_discount', 'rus', 'СКИДКА ВЫХОДНОГО ДНЯ', '<p class="main_paragraph"><span class="main_text">Внимание!</span> Каждое ВОСКРЕСЕНЬЕ скидка <span class="main_text">до 10%</span> для всех розничных покупателей.</p>\r\n<p class="inf">* Скидка не распространяется на товары, участвующие в иных акциях или распродажах.</p>\r\n\r\n<div class="materialPromoIMG_Block">\r\n    <img class="materialPromoIMG" src="./resources/Images/promotional_flyer/news_skidka_vyhodnogo_dnja_i_discount.jpg">\r\n</div>'),
('news_smesitel_verznoj_i_discount', 'rus', 'ВРЕЗНОЙ СМЕСИТЕЛЬ', '<p>\r\n    Внимание! При покупке любой акриловой ванны \r\n     - <span class="main_text">\r\n        30% скидка\r\n    </span> на врезной смеситель на борт ванны.* \r\n</p>\r\n<p class=''inf''>\r\n* список смесителей учавствующих в акции у менеджеров торгового зала.\r\n</p>\r\n\r\n<div class="materialPromoIMG_Block">\r\n    <img class="materialPromoIMG" src="./resources/Images/promotional_flyer/news_smesitel_verznoj_i_discount.jpg">\r\n</div>'),
('news_specodezhda_i_advertising_goods', 'rus', 'КОМПЛЕКСНЫЕ РЕШЕНИЯ ДЛЯ СПЕЦОДЕЖДЫ', '<p>Внимание! Широкий выбор Специальной ОДЕЖДЫ и \r\n    ОБУВИ для работы и активного отдыха в комплексе с полным ассортиментом \r\n    Средств Индивидуальной Защиты по Супернизким ценам!!!</p><div class="materialPromoIMG_Block">\r\n    <img class="materialPromoIMG" src="./resources/Images/promotional_flyer/news_specodezhda_i_advertising_goods.jpg" align="right"  >\r\n</div>\r\n<ul class="without_design">\r\n<li class="inf">Костюм куртка+брюки - <span class="main_text">от 530 р.</span></li>\r\n<li class="inf">Костюм куртка+п/комбинезон - <span class="main_text">от 625 р.</span></li>\r\n<li class="inf">Футболки - <span class="main_text">от 180 р.</span></li>\r\n<li class="inf">Халаты - <span class="main_text">от 320 р.</span></li>\r\n<li class="inf">Головные уборы - <span class="main_text">от 105 р.</span></li>\r\n<li class="inf">Обувь рабочая - <span class="main_text">от 475 р.</span></li>\r\n</ul>\r\n\r\n\r\n'),
('news_teksturol_KLASSIK_i_good_price', 'rus', 'ТЕКСТУРОЛ КЛАССИК', '<p>\r\n    Декоративный антисептик для защиты древесины ТЕКСТУРОЛ КЛАССИК по <span class="main_text">супер ценам:</span>\r\n</p>\r\n<ul class="dash">\r\n    <li class="inf">1 L - 259 руб./шт. (Старая цена - 324 руб./шт.);</li>\r\n    <li class="inf">3 L - 749 руб./шт. (Старая цена - 938 руб./шт.);</li>\r\n    <li class="inf">10 L - 2 319 руб./шт. (Старая цена – 2 899 руб./шт.).</li>\r\n</ul>\r\n<div class="materialPromoIMG_Block">\r\n    <img class="materialPromoIMG" src="./resources/Images/promotional_flyer/news_teksturol_KLASSIK_i_good_price.jpg">\r\n</div>\r\n<p class="inf">\r\n*Акция действует до 30 ноября.\r\n</p>'),
('news_vannaja_akrilovaja_i_best_price', 'rus', 'ЛУЧШАЯ ЦЕНА!<br>АКРИЛОВЫЕ ВАННЫ', '<p class="main_paragraph">\r\nАкриловая ванна <b>AquaNet West 150*70</b> (Россия) всего за <span class="main_text">3 900 р.</span> <span class="inf">(Старая цена: 4 740 р.)</span></p>\r\n\r\n<div class="materialPromoIMG_Block">\r\n    <img class="materialPromoIMG" src="./resources/Images/promotional_flyer/news_vannaja_akrilovaja_i_best_price.jpg">\r\n</div>'),
('news_vannaja_akrilovaja_i_good_price', 'rus', 'АКРИЛОВЫЕ ВАННЫ', '<p>Внимание! Большой выбор Акриловых ванн по Специальным ценам!!!</p>\r\n<p>В акции участвуют:</p>\r\n<!--<p>Акриловые ванны ALPEN (Австрия):\r\n<ul class="without_design">\r\n<li class="inf">Diana 150*70 ALPEN — <span class="main_text">9 890 р.</span> (Старая цена — 13 180 р.);</li>\r\n<li class="inf">Diana 160*70 ALPEN — <span class="main_text">10 740 р.</span> (Старая цена — 14 320 р.);</li>\r\n<li class="inf">Diana 170*75 ALPEN — <span class="main_text">11 850 р.</span> (Старая цена — 15 800 р.);</li>\r\n<li class="inf">Terra R 170*110 ALPEN — <span class="main_text">15 450 р.</span> (Старая цена — 20 590 р.);</li>\r\n<li class="inf">Terra L 170*110 ALPEN — <span class="main_text">15 450 р.</span> (Старая цена — 20 590 р.);</li>\r\n<li class="inf">Rumina 140*140 ALPEN — <span class="main_text">16 860 р.</span> (Старая цена — 22 480 р.).</li>\r\n</ul>-->\r\n<p>Акриловые ванны RIHO (Чехия):\r\n<ul class="without_design">\r\n<li class="inf">Miami 150*70 Riho — <span class="main_text">12 749 р.</span> (Старая цена — 16 999 р.);</li>\r\n<li class="inf">Miami 160*70 Riho — <span class="main_text">13 429 р.</span> (Старая цена — 17 899 р.);</li>\r\n<li class="inf">Miami 170*70 Riho — <span class="main_text">13 999 р.</span> (Старая цена — 18 789 р.);</li>\r\n<li class="inf">Lyra 170*110 левая Riho — <span class="main_text">21 699 р.</span> (Старая цена — 28 949 р.);</li>\r\n<!--<li class="inf">Lyra 170*110 правая Riho — <span class="main_text">18 990 р.</span> (Старая цена — 25 390 р.);</li>-->\r\n</ul>\r\n<p>Акриловые ванны "СТАНДАРТ ТРИТОН" (Россия):\r\n<ul class="without_design">\r\n<li class="inf">Стандарт 150 (1500*700*560 + установочный комплект) — <span class="main_text">5 899 р.</span>;</li>\r\n<li class="inf">Стандарт 150 (1500*700*560 + каркас) — <span class="main_text">6 510 р.</span>;</li>\r\n<li class="inf">Стандарт 150 (1500*750*560 + установочный комплект) — <span class="main_text">6 159 р.</span>;</li>\r\n<li class="inf">Стандарт 150 (1500*750*560 + каркас) — <span class="main_text">6 770 р.</span>;</li>\r\n<li class="inf">Стандарт 160 (1600*700*560 + установочный комплект) — <span class="main_text">6 099 р.</span>;</li>\r\n<li class="inf">Стандарт 160 (1600*700*560 + каркас) — <span class="main_text">6 710 р.</span>;</li>\r\n<li class="inf">Стандарт 170 (1700*700*560 + установочный комплект) — <span class="main_text">6 188 р.</span>.</li>\r\n<li class="inf">Стандарт 170 (1700*700*560 + каркас) — <span class="main_text">6 799 р.</span>.</li>\r\n</ul>\r\n'),
('news_vannaja_gidromassazhnaja_i_good_price', 'rus', 'ГИДРОМАССАЖНЫЕ ВАННЫ', '<p>Внимание! Гидромассажная система 6 форсунок \r\n    SUPERJET+пневматическое управление по Суперцене - \r\n    <span class="main_text">9 990 руб.</span> (Старая цена - 14 765 руб).*</p>\r\n<p class="inf">*В акции участвуют акриловые ванны Alpen (Австрия).</p>\r\n\r\n<div class="materialPromoIMG_Block">\r\n    <img class="materialPromoIMG" src="./resources/Images/promotional_flyer/news_vannaja_gidromassazhnaja_i_good_price.jpg">\r\n</div>\r\n'),
('payment', 'eng', 'PAYMENT', '<p class="main_paragraph">We can offer you the  following payment options:</p>\r\n<ol>\r\n<li>Payment in cash at any our <a href="/contacts/ru/">shops</a>.</li>\r\n<li>Payment by bank card. We accept Visa, Mastercard and Maestro cards:<br />\r\n<center><img src="./resources/Images/materials_images/payment_karte.png"></center>\r\n<span class="more_inf">Before you pay, please tell a cashier about the payment method you''ve chosen.<br />\r\nPlease pay attention to the payment rules:<br />\r\n- Only the cardholder can make payment by card, the card can not be used by any other individual;<br />\r\n- The cardholder should show an identification document with a photo and a sample of his or her signature;<br />\r\n- The last name on the card should match the last name in the passport;<br />\r\n- The card should be active (it can not be used upon expiry of the validity period);<br />\r\n- The cardholder should be ready to enter his or her PIN;<br />\r\n- Keep the receipt!</span></li>\r\n<li>Buying goods on <a href="./credit/ru/">credit</a>. We help our customers to take out a purchase loan.</li>\r\n<li>Non-cash payment.<br />\r\n<span class="more_inf">You can make a non-cash payment for a purchase at Wholesale Department within any store of our company. You can find our account details for payments in the <a href="./documents/ru/">DOCUMENTS</a> section.</span></li>\r\n</ol>'),
('payment', 'rus', 'ОПЛАТА', '<p class="main_paragraph">Мы работаем со следующими видами взаиморасчетов:</p>\r\n<ol>\r\n<li>Оплата за наличный расчет в любом <a href="/contacts/ru/">магазине</a> нашей сети.</li>\r\n<li>Оплата банковской картой. Мы принимаем к оплате карты Visa, Mastercard и Maestro:<br />\r\n<center><img src="./resources/Images/materials_images/payment_karte.png"></center>\r\n<span class="more_inf">Чтобы оплатить товар банковской картой необходимо Заранее (перед оформлением заказа) предупредить менеджера что Вы будете расплачиваться картой.<br />\r\nОбратите внимание на определённые правила при оплате банковской картой:<br />\r\n- Оплату может осуществлять только владелец карты, Карта не может быть передана другому лицу для оплаты;<br />\r\n- Владелец карты должен предъявить удостоверение личности с фотографией и образцом подписи;<br />\r\n- Фамилия владельца карты на обороте должна совпадать с фамилией в паспорте;<br />\r\n- Срок действия карты должен быть корректен (то есть она должна быть действительна на момент платежа);<br />\r\n- Клиент должен быть готов ввести PIN код карты;<br />\r\n- Сохраняйте чек!</span></li>\r\n<li>Оплата в <a href="./credit/ru/">кредит</a>. Мы оказываем помощь в оформлении кредита в нескольких банках.</li>\r\n<li>Оплата по безналичному расчету.<br />\r\n<span class="more_inf">Приобрести товар по безналичному расчету вы можете в любом из магазинов нашей компании в Отделах оптовых продаж.<br />\r\nНаши реквизиты Вы можете скачать в разделе <a href="./documents/ru/">ДОКУМЕНТЫ</a>.</span></li>\r\n</ol>');

-- --------------------------------------------------------

--
-- Структура таблицы `Menu`
--

DROP TABLE IF EXISTS `Menu`;
CREATE TABLE IF NOT EXISTS `Menu` (
  `name` varchar(100) NOT NULL COMMENT 'Название меню',
  `description` text COMMENT 'описание',
  `type` varchar(50) NOT NULL COMMENT 'тип меню',
  `cssClass` varchar(200) DEFAULT NULL COMMENT 'ункиальный стиль меню',
  PRIMARY KEY (`name`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_Menu_MenuTypes` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Menu`
--

INSERT INTO `Menu` (`name`, `description`, `type`, `cssClass`) VALUES
('departments', 'Меню отделов', 'vertical_1_lvl', NULL),
('disable', 'disable', 'vertical_1_lvl', NULL),
('info', 'Меню информации', 'vertical_1_lvl', NULL),
('main', 'Главное меню сайта', 'horizontal_1_lvl', NULL),
('shops', 'Меню магазинов', 'vertical_1_lvl', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `MenuItemParent`
--

DROP TABLE IF EXISTS `MenuItemParent`;
CREATE TABLE IF NOT EXISTS `MenuItemParent` (
  `menuItem` bigint(20) unsigned NOT NULL COMMENT 'Элемент меню',
  `parent` bigint(20) unsigned NOT NULL COMMENT 'Родитель элемента меню',
  PRIMARY KEY (`menuItem`,`parent`),
  UNIQUE KEY `menuItem_UNIQUE` (`menuItem`),
  KEY `fk_MenuItemParent_MenuItems1` (`menuItem`),
  KEY `fk_MenuItemParent_MenuItems2` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Таблица родственных связей элементов меню.';

-- --------------------------------------------------------

--
-- Структура таблицы `MenuItems`
--

DROP TABLE IF EXISTS `MenuItems`;
CREATE TABLE IF NOT EXISTS `MenuItems` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор элемента меню',
  `menu` varchar(100) NOT NULL COMMENT 'идентификатор меню',
  `url` text COMMENT 'ссылка которую можно указать вместо идентификатора страницы. Если указана URL то ее приоритет будет выше чем у id страницы',
  `target` int(1) unsigned NOT NULL COMMENT 'как открывать ссылку',
  `sequence` int(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `key_UNIQUE` (`sequence`,`menu`),
  KEY `fk_MenuItems_UrlTarget` (`target`),
  KEY `fk_MenuElements_Menu` (`menu`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=106 ;

--
-- Дамп данных таблицы `MenuItems`
--

INSERT INTO `MenuItems` (`id`, `menu`, `url`, `target`, `sequence`) VALUES
(5, 'info', '', 2, 1),
(6, 'info', '', 2, 2),
(7, 'info', '', 2, 3),
(8, 'info', '', 2, 4),
(9, 'info', '', 2, 5),
(10, 'info', '', 2, 6),
(11, 'info', '', 2, 7),
(12, 'disable', '', 2, 8),
(14, 'shops', '', 2, 1),
(15, 'shops', '', 2, 2),
(16, 'shops', '', 2, 3),
(17, 'shops', '', 2, 4),
(18, 'shops', '', 2, 5),
(19, 'shops', '', 2, 6),
(20, 'shops', '', 2, 7),
(21, 'shops', '', 2, 8),
(22, 'shops', '', 2, 9),
(23, 'shops', '', 2, 10),
(25, 'shops', '', 2, 12),
(26, 'departments', '', 2, 5),
(27, 'departments', '', 2, 2),
(28, 'departments', '', 2, 3),
(29, 'departments', '', 2, 4),
(30, 'shops', '', 2, 13),
(31, 'departments', NULL, 2, 1),
(101, 'main', '', 2, 1),
(102, 'main', '', 2, 2),
(103, 'main', NULL, 2, 3),
(104, 'main', NULL, 2, 4),
(105, 'main', '', 2, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `MenuItemsPage`
--

DROP TABLE IF EXISTS `MenuItemsPage`;
CREATE TABLE IF NOT EXISTS `MenuItemsPage` (
  `menuItem` bigint(20) unsigned NOT NULL,
  `page` varchar(50) NOT NULL,
  `postfix` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`menuItem`,`page`),
  UNIQUE KEY `menuItem_UNIQUE` (`menuItem`),
  KEY `fk_MenuItemsPage_MenuItems` (`menuItem`),
  KEY `fk_MenuItemsPage_Pages` (`page`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `MenuItemsPage`
--

INSERT INTO `MenuItemsPage` (`menuItem`, `page`, `postfix`) VALUES
(6, 'credit', NULL),
(7, 'discount', NULL),
(8, 'gift_cards', NULL),
(9, 'documents', NULL),
(10, 'vacancies', NULL),
(11, 'service_centers', NULL),
(14, '13_yesenina_str', NULL),
(15, '50_verkhnyaya_str', NULL),
(16, '24b_directions_shabulina', NULL),
(17, '1v_3rd_butyrki_str', NULL),
(18, '27b_zubkovoy_str', NULL),
(19, '109-2_ostrovskogo_str', NULL),
(20, '70b_chkalova_str', NULL),
(21, '5_chernovitskaya_str', NULL),
(22, '10b_svyazi_str_sokolovka', NULL),
(23, 'shopping_mall_on_the_city_ring_road', NULL),
(25, 'the_185th_km_of_the_beltway_hangar', NULL),
(26, 'procurement_department', NULL),
(27, 'general_enquiries_department', NULL),
(28, 'sales_department', NULL),
(29, 'marketing_department', NULL),
(30, '170v_pushkina_str_luhovitsy', NULL),
(31, 'studio_furniture_yesenina', NULL),
(101, 'news', NULL),
(102, 'information', NULL),
(103, 'vacancies', NULL),
(104, 'service_centers', NULL),
(105, 'contacts', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `MenuItems_Lang`
--

DROP TABLE IF EXISTS `MenuItems_Lang`;
CREATE TABLE IF NOT EXISTS `MenuItems_Lang` (
  `menuItem` bigint(20) unsigned NOT NULL,
  `lang` varchar(3) NOT NULL,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`menuItem`,`lang`),
  KEY `fk_MenuItems_Lang_MenuItems` (`menuItem`),
  KEY `fk_MenuItems_Lang_Lang` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `MenuItems_Lang`
--

INSERT INTO `MenuItems_Lang` (`menuItem`, `lang`, `title`) VALUES
(5, 'eng', 'Payment & Delivery'),
(5, 'rus', 'Оплата и доставка'),
(6, 'eng', 'Credit'),
(6, 'rus', 'Кредит'),
(7, 'eng', 'Discount'),
(7, 'rus', 'Дисконт'),
(8, 'eng', 'Gift cards'),
(8, 'rus', 'Подарочные карты'),
(9, 'eng', 'Documents'),
(9, 'rus', 'Документы'),
(10, 'eng', 'Vacancies'),
(10, 'rus', 'Вакансии'),
(11, 'eng', 'Service Centers'),
(11, 'rus', 'Сервисные центры'),
(12, 'eng', 'Helpful Articles'),
(12, 'rus', 'Полезные статьи'),
(14, 'eng', '13 Yesenina str.'),
(14, 'rus', 'Есенина, 13'),
(15, 'eng', '50 Verkhnyaya str.'),
(15, 'rus', 'Верхняя, 50'),
(16, 'eng', '24B Proezd Shabulina'),
(16, 'rus', 'Шабулина, 24Б'),
(17, 'eng', '1V 3rd Butyrki str.'),
(17, 'rus', 'Бутырки 3, 1В'),
(18, 'eng', '27B Zubkovoy str.'),
(18, 'rus', 'Зубковой, 27Б'),
(19, 'eng', '109 Ostrovskogo str.'),
(19, 'rus', 'Островского, 109'),
(20, 'eng', '70B Chkalova str.'),
(20, 'rus', 'Чкалова, 70Б'),
(21, 'eng', '5 Chernovitskaya str.'),
(21, 'rus', 'Черновицкая, 5'),
(22, 'eng', '10B Svyazi str., Sokolovka'),
(22, 'rus', 'Соколовка, связи, 10Б'),
(23, 'eng', 'Shopping mall on the ring road'),
(23, 'rus', 'ТЦ На Окружной'),
(25, 'eng', '185 km, Circular road (Hangar)'),
(25, 'rus', 'Окружная, 185 км (Ангар)'),
(26, 'eng', 'Procurement Department'),
(26, 'rus', 'Отдел комплектации'),
(27, 'eng', 'General enquiries department'),
(27, 'rus', 'Отдел информации'),
(28, 'eng', 'Sales department'),
(28, 'rus', 'Отдел продаж'),
(29, 'eng', 'Marketing department'),
(29, 'rus', 'Отдел маркетинга'),
(30, 'eng', '170 v Pushkina str.'),
(30, 'rus', 'Луховицы, Пушкина, 170 В'),
(31, 'eng', 'Studio furniture'),
(31, 'rus', 'Студия мебели'),
(101, 'eng', 'News'),
(101, 'rus', 'Акции'),
(102, 'eng', 'Information'),
(102, 'rus', 'Информация'),
(103, 'eng', 'Vacancies'),
(103, 'rus', 'Вакансии'),
(104, 'eng', 'Service Centers'),
(104, 'rus', 'Сервисные центры'),
(105, 'eng', 'Contacts'),
(105, 'rus', 'Контакты');

-- --------------------------------------------------------

--
-- Структура таблицы `MenuTypes`
--

DROP TABLE IF EXISTS `MenuTypes`;
CREATE TABLE IF NOT EXISTS `MenuTypes` (
  `type` varchar(50) NOT NULL,
  `description` text,
  `default` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`type`),
  UNIQUE KEY `type_UNIQUE` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Типы меню:\nВертикальный\nГоризонтальный\nКарусель\nСлайдер';

--
-- Дамп данных таблицы `MenuTypes`
--

INSERT INTO `MenuTypes` (`type`, `description`, `default`) VALUES
('horizontal_1_lvl', 'Горизонтальное одноуровневое меню', 0),
('vertical_1_lvl', 'Вертикальное одноуровневое меню', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Modules`
--

DROP TABLE IF EXISTS `Modules`;
CREATE TABLE IF NOT EXISTS `Modules` (
  `alias` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `version` varchar(100) NOT NULL,
  `description` text,
  `main` varchar(100) NOT NULL,
  `head` varchar(100) DEFAULT NULL,
  `bodyStart` varchar(100) DEFAULT NULL,
  `bodyEnd` varchar(100) DEFAULT NULL,
  `admin` varchar(100) DEFAULT NULL,
  `includeOnceHead` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `includeOnceBodyStart` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `includeOnceBodyEnd` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`alias`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Modules`
--

INSERT INTO `Modules` (`alias`, `name`, `author`, `version`, `description`, `main`, `head`, `bodyStart`, `bodyEnd`, `admin`, `includeOnceHead`, `includeOnceBodyStart`, `includeOnceBodyEnd`) VALUES
('ApelsinContactsNavigationPanel', 'Apelsin Contacts Navigation Panel', 'CompuProject', '1.0', NULL, 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', NULL, 1, 1, 1),
('ApelsinFuterSiteMap', 'Apelsin Futer Site Map', 'Compu Project', '1.0', 'Карта сайта + контакты с копирайтом', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'admin/index.php', 1, 1, 1),
('authorizationUserPanel', 'Панель авторизации', 'Compu Project', '1.0', 'Модуль для отображения панели авторизации пользователей', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'admin/index.php', 1, 1, 1),
('backCall', 'Форма обратного звонка', 'Compu Project', '1.0', 'Модуль добавляющий форму обратного звонка для сайта.', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'admin/index.php', 1, 1, 1),
('banners', 'Баннер', 'Compu Project', '1.0', 'Модуль для вывода баннеров на сайте.', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'admin/index.php', 1, 1, 1),
('chat', 'Чат', 'Compu Project', '1.0', 'Модуль для общения пользователей друг с другом', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'admin/index.php', 1, 1, 1),
('contactPanel', 'Панель контактов', 'Compu Project', '1.0', 'Добавляет панель кнопок с контактами', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'admin/index.php', 1, 1, 1),
('headContacts', 'Контактные данные в шапке', 'Compu Project', '1.0', 'Размещает список номеров телефонов', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'admin/index.php', 1, 1, 1),
('html', 'Вывод HTML кода', 'Compu Project', '1.0', 'Данный модуль позволяет делать HTML вставки в указанные блоки сайта.', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'admin/index.php', 1, 1, 1),
('langPanel', 'Языковая панель', 'Compu Project', '1.0', 'Панель выбора языка сайта.', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'admin/index.php', 1, 1, 1),
('logo', 'Логотип сайта', 'Compu Project', '1.0', 'Вставляет логотип на сайт', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'admin/index.php', 1, 1, 1),
('map', 'Карта', 'Compu Project', '1.0', 'Карта торговых тчоек', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'admin/index.php', 1, 1, 1),
('materialsPromo', 'Промо материалов', 'Compu Project', '1.0', 'Модуль для отображения промо выбранных материалов', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'admin/index.php', 1, 1, 1),
('menu', 'Модуль меню', 'Compu Project', '1.0', 'Модуль для создания меню сайта.', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'admin/index.php', 1, 1, 1),
('siteMap', 'Карта сайта', 'Compu Project', '1.0', 'Модуль позволяющий создавать иерархическую карту сайта.', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'admin/index.php', 1, 1, 1),
('slider', 'Слайдер', 'Compu Project', '1.0', 'Модуль для вывода слайдеров', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'admin/index.php', 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ModulesDepends`
--

DROP TABLE IF EXISTS `ModulesDepends`;
CREATE TABLE IF NOT EXISTS `ModulesDepends` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `elementType` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `depends` varchar(50) NOT NULL,
  `versionStart` varchar(100) DEFAULT NULL,
  `versionEnd` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `depends_UNIQUE` (`depends`,`module`,`elementType`),
  KEY `fk_ModulesDepends_1_idx` (`elementType`),
  KEY `fk_ModulesDepends_2` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ModulesDependsElementsType`
--

DROP TABLE IF EXISTS `ModulesDependsElementsType`;
CREATE TABLE IF NOT EXISTS `ModulesDependsElementsType` (
  `elementType` varchar(50) NOT NULL,
  `tableName` varchar(50) NOT NULL,
  PRIMARY KEY (`elementType`),
  UNIQUE KEY `tableName_UNIQUE` (`tableName`),
  UNIQUE KEY `elementType_UNIQUE` (`elementType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ModulesDependsElementsType`
--

INSERT INTO `ModulesDependsElementsType` (`elementType`, `tableName`) VALUES
('Components', 'Components'),
('Modules', 'Modules'),
('Plugins', 'Plugins');

-- --------------------------------------------------------

--
-- Структура таблицы `ModulesInBlocks`
--

DROP TABLE IF EXISTS `ModulesInBlocks`;
CREATE TABLE IF NOT EXISTS `ModulesInBlocks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `module` bigint(20) unsigned NOT NULL,
  `block` bigint(20) unsigned NOT NULL,
  `sequence` int(10) unsigned NOT NULL,
  `showTitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `cssClasses` varchar(200) DEFAULT NULL,
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `onAllPages` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `module_UNIQUE` (`module`,`block`),
  UNIQUE KEY `sequence_UNIQUE` (`sequence`,`block`),
  KEY `fk_ModulesInBlocks_2_idx` (`block`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=604 ;

--
-- Дамп данных таблицы `ModulesInBlocks`
--

INSERT INTO `ModulesInBlocks` (`id`, `module`, `block`, `sequence`, `showTitle`, `cssClasses`, `display`, `onAllPages`) VALUES
(1, 2, 1, 4, 0, NULL, 1, 1),
(2, 1, 2, 1, 0, NULL, 1, 1),
(3, 3, 1, 3, 0, NULL, 1, 1),
(4, 4, 3, 1, 0, NULL, 1, 1),
(5, 5, 1, 1, 0, NULL, 1, 1),
(6, 6, 1, 2, 0, NULL, 1, 0),
(301, 301, 6, 301, 0, NULL, 1, 0),
(401, 401, 7, 401, 0, NULL, 1, 0),
(402, 402, 7, 402, 0, NULL, 1, 0),
(403, 403, 7, 403, 0, NULL, 1, 0),
(404, 404, 7, 404, 0, NULL, 1, 0),
(405, 405, 7, 405, 0, NULL, 1, 0),
(406, 406, 7, 406, 0, NULL, 1, 0),
(407, 407, 7, 407, 0, NULL, 1, 0),
(408, 408, 7, 408, 0, NULL, 1, 0),
(409, 409, 7, 409, 0, NULL, 1, 0),
(410, 410, 7, 410, 0, NULL, 1, 0),
(411, 411, 7, 411, 0, NULL, 1, 0),
(412, 412, 7, 412, 0, NULL, 1, 0),
(501, 501, 7, 501, 0, NULL, 1, 0),
(502, 502, 7, 502, 0, NULL, 1, 0),
(503, 503, 7, 503, 0, NULL, 1, 0),
(504, 504, 7, 504, 0, NULL, 1, 0),
(601, 601, 4, 1, 0, NULL, 1, 0),
(602, 602, 4, 2, 0, NULL, 1, 0),
(603, 603, 4, 3, 0, NULL, 1, 0),
(700, 700, 9, 1, 0, NULL, 1, 1),
(800, 800, 10, 1, 0, 'futerCopyright_Left', 1, 1),
(801, 801, 10, 2, 0, 'futerCopyright_Right', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ModulesInBlocks_Lang`
--

DROP TABLE IF EXISTS `ModulesInBlocks_Lang`;
CREATE TABLE IF NOT EXISTS `ModulesInBlocks_Lang` (
  `module` bigint(20) unsigned NOT NULL,
  `lang` varchar(3) NOT NULL,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`module`,`lang`),
  KEY `fk_ModulesInBlocks_Lang_2_idx` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ModulesInBlocks_Lang`
--

INSERT INTO `ModulesInBlocks_Lang` (`module`, `lang`, `title`) VALUES
(1, 'rus', 'Главное меню'),
(2, 'rus', 'Логотип');

-- --------------------------------------------------------

--
-- Структура таблицы `ModulesOnPages`
--

DROP TABLE IF EXISTS `ModulesOnPages`;
CREATE TABLE IF NOT EXISTS `ModulesOnPages` (
  `module` bigint(20) unsigned NOT NULL,
  `page` varchar(50) NOT NULL,
  PRIMARY KEY (`module`,`page`),
  KEY `fk_ModulesOnPages_2_idx` (`page`),
  KEY `fk_ModulesOnPages_1_idx` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ModulesOnPages`
--

INSERT INTO `ModulesOnPages` (`module`, `page`) VALUES
(6, 'accounts'),
(6, 'account_settings'),
(6, 'adminpanel'),
(301, 'about'),
(401, '1v_3rd_butyrki_str'),
(402, '5_chernovitskaya_str'),
(403, '70b_chkalova_str'),
(404, 'the_185th_km_of_the_beltway_hangar'),
(405, 'shopping_mall_on_the_city_ring_road'),
(406, '109-2_ostrovskogo_str'),
(407, '170v_pushkina_str_luhovitsy'),
(408, '24b_directions_shabulina'),
(409, '10b_svyazi_str_sokolovka'),
(410, '50_verkhnyaya_str'),
(411, '13_yesenina_str'),
(412, '27b_zubkovoy_str'),
(501, 'studio_furniture'),
(502, 'studio_furniture_shabulina'),
(503, 'studio_furniture_yesenina'),
(504, 'studio_furniture_ostrovskogo'),
(601, 'contacts'),
(602, '109-2_ostrovskogo_str'),
(602, '10b_svyazi_str_sokolovka'),
(602, '13_yesenina_str'),
(602, '170v_pushkina_str_luhovitsy'),
(602, '1v_3rd_butyrki_str'),
(602, '24b_directions_shabulina'),
(602, '27b_zubkovoy_str'),
(602, '50_verkhnyaya_str'),
(602, '5_chernovitskaya_str'),
(602, '70b_chkalova_str'),
(602, 'shopping_mall_on_the_city_ring_road'),
(602, 'the_185th_km_of_the_beltway_hangar'),
(603, 'general_enquiries_department'),
(603, 'marketing_department'),
(603, 'procurement_department'),
(603, 'sales_department'),
(603, 'studio_furniture'),
(603, 'studio_furniture_ostrovskogo'),
(603, 'studio_furniture_shabulina'),
(603, 'studio_furniture_yesenina');

-- --------------------------------------------------------

--
-- Структура таблицы `ModulesParam`
--

DROP TABLE IF EXISTS `ModulesParam`;
CREATE TABLE IF NOT EXISTS `ModulesParam` (
  `module` bigint(20) unsigned NOT NULL,
  `param` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`module`,`param`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ModulesParam`
--

INSERT INTO `ModulesParam` (`module`, `param`, `value`) VALUES
(2, 'name', 'main'),
(301, 'name', 'main_slider'),
(401, 'name', 'shop_butirki'),
(402, 'name', 'shop_chernovitskaya'),
(403, 'name', 'shop_chkalova'),
(404, 'name', 'shop_circular_road_hangar'),
(405, 'name', 'shop_circular_road_mall'),
(406, 'name', 'shop_ostrovskogo'),
(407, 'name', 'shop_pushkina_luhovitsy'),
(408, 'name', 'shop_shabulina'),
(409, 'name', 'shop_svyazi_sokolivka'),
(410, 'name', 'shop_verkhnyaya'),
(411, 'name', 'shop_yesenina'),
(412, 'name', 'shop_zubkova'),
(501, 'name', 'studio_furniture'),
(502, 'name', 'studio_furniture_shabulina'),
(503, 'name', 'studio_furniture_yesenina'),
(504, 'name', 'studio_furniture_ostrovskogo'),
(601, 'tab', '1'),
(602, 'tab', '2'),
(603, 'tab', '3'),
(800, 'name', 'copyText'),
(801, 'name', 'copyMain');

-- --------------------------------------------------------

--
-- Структура таблицы `ModulesTitleIcon`
--

DROP TABLE IF EXISTS `ModulesTitleIcon`;
CREATE TABLE IF NOT EXISTS `ModulesTitleIcon` (
  `module` bigint(20) unsigned NOT NULL,
  `icon` varchar(200) NOT NULL,
  `style` varchar(50) NOT NULL,
  PRIMARY KEY (`module`),
  UNIQUE KEY `module_UNIQUE` (`module`),
  KEY `fk_ModulesTitleIcon_1_idx` (`module`),
  KEY `fk_ModulesTitleIcon_2_idx` (`style`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ModulesTitleIconStile`
--

DROP TABLE IF EXISTS `ModulesTitleIconStile`;
CREATE TABLE IF NOT EXISTS `ModulesTitleIconStile` (
  `style` varchar(50) NOT NULL,
  `align` varchar(50) NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  PRIMARY KEY (`style`),
  UNIQUE KEY `style_UNIQUE` (`style`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `PageParam`
--

DROP TABLE IF EXISTS `PageParam`;
CREATE TABLE IF NOT EXISTS `PageParam` (
  `page` varchar(50) NOT NULL,
  `param` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`page`,`param`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `PageParam`
--

INSERT INTO `PageParam` (`page`, `param`, `value`) VALUES
('109-2_ostrovskogo_str', 'name', 'shop_ostrovskogo'),
('10b_svyazi_str_sokolovka', 'name', 'shop_svyazi_sokolovka'),
('13_yesenina_str', 'name', 'shop_yesenina'),
('170v_pushkina_str_luhovitsy', 'name', 'shop_pushkina_luhovitsy'),
('1v_3rd_butyrki_str', 'name', 'shop_butyrki'),
('24b_directions_shabulina', 'name', 'shop_shabulina'),
('27b_zubkovoy_str', 'name', 'shop_zubkovoy'),
('50_verkhnyaya_str', 'name', 'shop_verkhnyaya'),
('5_chernovitskaya_str', 'name', 'shop_chernovitskaya'),
('70b_chkalova_str', 'name', 'shop_chkalova'),
('about', 'name', 'about'),
('contacts', 'name', 'contactsMainPage'),
('credit', 'name', 'credit'),
('discount', 'name', 'discount'),
('documents', 'name', 'documentation'),
('general_enquiries_department', 'name', 'general_enquiries_department'),
('gift_cards', 'name', 'gift_cards'),
('information', 'name', 'info'),
('marketing_department', 'name', 'marketing_department'),
('news', 'name', 'promo'),
('procurement_department', 'name', 'procurement_department'),
('sales_department', 'name', 'sales_department'),
('shopping_mall_on_the_city_ring_road', 'name', 'shop_mall_on_the_city_ring_road'),
('studio_furniture', 'name', 'studio_furniture'),
('studio_furniture_ostrovskogo', 'name', 'studio_furniture_ostrovskogo'),
('studio_furniture_shabulina', 'name', 'studio_furniture_shabulina'),
('studio_furniture_yesenina', 'name', 'studio_furniture_yesenina'),
('the_185th_km_of_the_beltway_hangar', 'name', 'shop_hangar_on_the_city_ring_road');

-- --------------------------------------------------------

--
-- Структура таблицы `Pages`
--

DROP TABLE IF EXISTS `Pages`;
CREATE TABLE IF NOT EXISTS `Pages` (
  `alias` varchar(50) NOT NULL,
  `showTitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `cssClasses` varchar(200) DEFAULT NULL,
  `componentElement` bigint(20) unsigned NOT NULL,
  `template` varchar(50) NOT NULL,
  `isMainPage` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `index` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `follow` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `archive` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `notModifiable` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Означает что страница была создана не пользователем а компонентой и может быть удалена только через эту компоненту.',
  PRIMARY KEY (`alias`),
  UNIQUE KEY `alias_UNIQUE` (`alias`),
  KEY `fk_Pages_1_idx` (`componentElement`),
  KEY `fk_Pages_2_idx` (`template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Pages`
--

INSERT INTO `Pages` (`alias`, `showTitle`, `cssClasses`, `componentElement`, `template`, `isMainPage`, `index`, `follow`, `archive`, `notModifiable`) VALUES
('109-2_ostrovskogo_str', 1, '', 201, 'apelsin', 0, 1, 1, 1, 0),
('10b_svyazi_str_sokolovka', 1, '', 201, 'apelsin', 0, 1, 1, 1, 0),
('13_yesenina_str', 0, '', 201, 'apelsin', 0, 1, 1, 1, 0),
('170v_pushkina_str_luhovitsy', 1, NULL, 201, 'apelsin', 0, 1, 1, 1, 0),
('1v_3rd_butyrki_str', 1, '', 201, 'apelsin', 0, 1, 1, 1, 0),
('24b_directions_shabulina', 1, '', 201, 'apelsin', 0, 1, 1, 1, 0),
('27b_zubkovoy_str', 1, '', 201, 'apelsin', 0, 1, 1, 1, 0),
('50_verkhnyaya_str', 1, '', 201, 'apelsin', 0, 1, 1, 1, 0),
('5_chernovitskaya_str', 1, '', 201, 'apelsin', 0, 1, 1, 1, 0),
('70b_chkalova_str', 1, '', 201, 'apelsin', 0, 1, 1, 1, 0),
('about', 0, NULL, 101, 'apelsin', 1, 1, 1, 1, 0),
('accounts', 1, NULL, 999801, 'apelsin', 0, 1, 1, 1, 0),
('account_settings', 1, NULL, 999802, 'apelsin', 0, 1, 1, 1, 0),
('adminpanel', 1, 'adminpanel', 999901, 'apelsin', 0, 0, 0, 0, 0),
('contacts', 1, '', 204, 'apelsin', 0, 1, 1, 1, 0),
('credit', 1, '', 101, 'apelsin', 0, 1, 1, 1, 0),
('discount', 1, '', 101, 'apelsin', 0, 1, 1, 1, 0),
('documents', 1, '', 101, 'apelsin', 0, 1, 1, 1, 0),
('general_enquiries_department', 1, '', 202, 'apelsin', 0, 1, 1, 1, 0),
('gift_cards', 1, '', 101, 'apelsin', 0, 1, 1, 1, 0),
('information', 1, 'withoutShortMaterialsText', 105, 'apelsin', 0, 1, 1, 1, 0),
('marketing_department', 1, '', 202, 'apelsin', 0, 1, 1, 1, 0),
('news', 1, '', 105, 'apelsin', 0, 1, 1, 1, 0),
('procurement_department', 1, '', 202, 'apelsin', 0, 1, 1, 1, 0),
('registration', 1, NULL, 999803, 'apelsin', 0, 1, 1, 1, 0),
('sales_department', 1, '', 202, 'apelsin', 0, 1, 1, 1, 0),
('service_centers', 1, '', 301, 'apelsin', 0, 1, 1, 1, 0),
('shopping_mall_on_the_city_ring_road', 1, '', 201, 'apelsin', 0, 1, 1, 1, 0),
('studio_furniture', 1, NULL, 203, 'apelsin', 0, 1, 1, 1, 0),
('studio_furniture_ostrovskogo', 1, NULL, 202, 'apelsin', 0, 1, 1, 1, 0),
('studio_furniture_shabulina', 1, NULL, 202, 'apelsin', 0, 1, 1, 1, 0),
('studio_furniture_yesenina', 1, NULL, 202, 'apelsin', 0, 1, 1, 1, 0),
('the_185th_km_of_the_beltway_hangar', 1, '', 201, 'apelsin', 0, 1, 1, 1, 0),
('vacancies', 1, '', 401, 'apelsin', 0, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `Pages_Lang`
--

DROP TABLE IF EXISTS `Pages_Lang`;
CREATE TABLE IF NOT EXISTS `Pages_Lang` (
  `page` varchar(50) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `browserTitle` varchar(100) NOT NULL,
  `pageTitle` varchar(100) NOT NULL,
  `description` text,
  `keywords` text,
  PRIMARY KEY (`page`,`lang`),
  KEY `fk_Pages_Lang_2_idx` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Pages_Lang`
--

INSERT INTO `Pages_Lang` (`page`, `lang`, `browserTitle`, `pageTitle`, `description`, `keywords`) VALUES
('109-2_ostrovskogo_str', 'eng', '109 Ostrovskogo str.', '109 Ostrovskogo str.', '', ''),
('109-2_ostrovskogo_str', 'rus', 'Островского 109/2', 'Островского 109/2', '', ''),
('10b_svyazi_str_sokolovka', 'eng', '10B Svyazi str., Sokolovka', '10B Svyazi str., Sokolovka', '', ''),
('10b_svyazi_str_sokolovka', 'rus', 'Соколовка', ' Соколовка', '', ''),
('13_yesenina_str', 'eng', '13 Yesenina str.', '13 Yesenina str.', '', ''),
('13_yesenina_str', 'rus', 'Есенина 13', 'Есенина 13', '', ''),
('170v_pushkina_str_luhovitsy', 'eng', '170v Pushkina str.', '170v Pushkina str.', '', ''),
('170v_pushkina_str_luhovitsy', 'rus', 'Луховицы', 'Луховицы', '', ''),
('1v_3rd_butyrki_str', 'eng', '1V 3rd Butyrki str.', '1V 3rd Butyrki str.', '', ''),
('1v_3rd_butyrki_str', 'rus', '3 Бутырки 1В', '3 Бутырки 1В', '', ''),
('24b_directions_shabulina', 'eng', '24B Proezd Shabulina', '24B Proezd Shabulina', '', ''),
('24b_directions_shabulina', 'rus', 'Шабулина 24Б', 'Шабулина 24Б', '', ''),
('27b_zubkovoy_str', 'eng', '27B Zubkovoy str.', '27B Zubkovoy str.', '', ''),
('27b_zubkovoy_str', 'rus', 'Зубковой 27Б', 'Зубковой 27Б', '', ''),
('50_verkhnyaya_str', 'eng', '50 Verkhnyaya str.', '50 Verkhnyaya str.', '', ''),
('50_verkhnyaya_str', 'rus', 'Верхняя 50', 'Верхняя 50', '', ''),
('5_chernovitskaya_str', 'eng', '5 Chernovitskaya str.', '5 Chernovitskaya str.', '', ''),
('5_chernovitskaya_str', 'rus', 'Черновицкая 5', 'Черновицкая 5', '', ''),
('70b_chkalova_str', 'eng', '70B Chkalova str.', '70B Chkalova str.', '', ''),
('70b_chkalova_str', 'rus', 'Чкалова 70Б', 'Чкалова 70Б', '', ''),
('about', 'eng', 'About Apelsin', 'About Apelsin', '\n     Компания Апельсин крупнейшая региональная сеть магазинов в Рязани, которая реализует оптом и в розницу материалы для строительства и \nремонта. Апельсин официальный дилер известных торговых марок производителей строительных, отделочных материалов и инструмента.\nПриоритетным направлением компании Апельсин является наличие товара на складе. Ассортимент продукции предлагаемой сетью магазинов Апельсин это более 300 тысяч наименований материалы для строительства и ремонта. Мы предоставляем услугу полной комплектации объектов строительно-отделочными \nматериалами. Мы предлагаем все для строительства, ремонта и отделки любого уровня - от эконом класса, до самого высокого.', 'Апельсин, Стройматериалы, Материалы для Строительства и Ремонта, Отделка, Дилер, Сеть Магазинов, Оптом, В Наличии.'),
('about', 'rus', 'Информация о компании', 'О компании', '\n     Компания Апельсин крупнейшая региональная сеть магазинов в Рязани, которая реализует оптом и в розницу материалы для строительства и \nремонта. Апельсин официальный дилер известных торговых марок производителей строительных, отделочных материалов и инструмента.\nПриоритетным направлением компании Апельсин является наличие товара на складе. Ассортимент продукции предлагаемой сетью магазинов Апельсин это более 300 тысяч наименований материалы для строительства и ремонта. Мы предоставляем услугу полной комплектации объектов строительно-отделочными \nматериалами. Мы предлагаем все для строительства, ремонта и отделки любого уровня - от эконом класса, до самого высокого.', 'Апельсин, Стройматериалы, Материалы для Строительства и Ремонта, Отделка, Дилер, Сеть Магазинов, Оптом, В Наличии.'),
('accounts', 'rus', 'Личный кабинет', 'Личный кабинет', NULL, NULL),
('account_settings', 'rus', 'Настройки профиля', 'Настройки профиля', NULL, NULL),
('adminpanel', 'rus', 'Панель администрирования', 'Панель администрирования', NULL, NULL),
('contacts', 'eng', 'Our Contacts', 'Our Contacts', 'Магазин по продажам Строительных и Отделочных материалов.', ''),
('contacts', 'rus', 'Наши Контакты', 'Наши Контакты', 'Магазин по продажам Строительных и Отделочных материалов.', ''),
('credit', 'eng', 'Credit', 'Credit', 'Покупка стройматериалов в магазинах Апельсин в кредит. Способы и условия оформления кредита. Банки сотрудничающие с компанией Апельсин.', 'Кредит, Банк, Процент.'),
('credit', 'rus', 'Кредит', 'Кредит', 'Покупка стройматериалов в магазинах Апельсин в кредит. Способы и условия оформления кредита. Банки сотрудничающие с компанией Апельсин.', 'Кредит, Банк, Процент.'),
('discount', 'eng', 'Discount', 'Discount', 'Дисконтная программа в магазинах Апельсин. Условия предоставления и категории скидок. Условия получения Дисконтной карты.', 'Скидки, Дисконтные Карты'),
('discount', 'rus', 'Дисконт', 'Дисконт', 'Дисконтная программа в магазинах Апельсин. Условия предоставления и категории скидок. Условия получения Дисконтной карты.', 'Скидки, Дисконтные Карты'),
('documents', 'eng', 'Documents', 'Documents', 'Документы которые могут быть Вам полезны и помогут съэкономить время. Банковские реквизиты для безналичного расчета.', 'Документы, Безналичный расчет, Реквизиты.'),
('documents', 'rus', 'Документы', 'Документы', 'Документы которые могут быть Вам полезны и помогут съэкономить время. Банковские реквизиты для безналичного расчета.', 'Документы, Безналичный расчет, Реквизиты.'),
('general_enquiries_department', 'eng', 'General enquiries department', 'General enquiries department', 'Уважаемые клиенты, если Вы не знаете кому адресовать Ваш вопрос - обращайтесь в ОТДЕЛ ИНФОРМАЦИИ по вышеуказанным телефонам. Наши секретари предоставят интересующую Вас информацию, либо перенаправят к необходимому адресату.', 'Информация, контакты, номера телефонов, секретари.'),
('general_enquiries_department', 'rus', 'Отдел информации', 'Отдел информации', 'Уважаемые клиенты, если Вы не знаете кому адресовать Ваш вопрос - обращайтесь в ОТДЕЛ ИНФОРМАЦИИ по вышеуказанным телефонам. Наши секретари предоставят интересующую Вас информацию, либо перенаправят к необходимому адресату.', 'Информация, контакты, номера телефонов, секретари.'),
('gift_cards', 'eng', 'Gift Cards', 'Gift Cards', 'Подарочные карты от сети магазинов Апельсин. Способы приобретения и номеналы подарочных карт.', 'Подарочная карта'),
('gift_cards', 'rus', 'Подарочные карты', 'Подарочные карты', 'Подарочные карты от сети магазинов Апельсин. Способы приобретения и номеналы подарочных карт.', 'Подарочная карта'),
('information', 'eng', 'Information', 'Information', 'Способы оплаты в магазинах компании Апельсин. ', 'Оплата, Наличный Расчет, Оплата Банковской Картой, Оплата в Кредит, Оплата по Безналичному Расчету.'),
('information', 'rus', 'Информация', 'Информация', 'Способы оплаты в магазинах компании Апельсин. ', 'Оплата, Наличный Расчет, Оплата Банковской Картой, Оплата в Кредит, Оплата по Безналичному Расчету.'),
('marketing_department', 'eng', 'Marketing department', 'Marketing department', 'Контактная информация Руководителей направлений по вопросам сотрудничества в рамках поставок и реализации товара.', 'Отдел маркетинга, Закупки, Поставки.'),
('marketing_department', 'rus', 'Отдел маркетинга', 'Отдел маркетинга', 'Контактная информация Руководителей направлений по вопросам сотрудничества в рамках поставок и реализации товара.', 'Отдел маркетинга, Закупки, Поставки.'),
('news', 'eng', 'News', 'News', '\n     Акции и Специальные Предложения в Магазинах Апельсин. \n     Дисконтные и Бонусные Программы. \n     Подарки и Актуальные Скидки и Суперцены. \n     Подробности о Всех промо-акциях и Предложениях.', 'Акция, Купить, Специальное Предложение, Новинка, В Подарок, Дарим, Внимание, Промо, Старая Цена.'),
('news', 'rus', 'Акции компании', 'Акции', '\n     Акции и Специальные Предложения в Магазинах Апельсин. \n     Дисконтные и Бонусные Программы. \n     Подарки и Актуальные Скидки и Суперцены. \n     Подробности о Всех промо-акциях и Предложениях.', 'Акция, Купить, Специальное Предложение, Новинка, В Подарок, Дарим, Внимание, Промо, Старая Цена.'),
('procurement_department', 'eng', 'Procurement department', 'Procurement department', 'Менеджеры отдела комплектации помогут Вам обеспечить объекты недвижимости всем необходимым для систем отопления и водоснабжения, а так же, \n     в индивидуальном порядке, рассчитают и подберут подходящее оборудование.', 'Отопление и водоснабжение, Комплектация объектов.'),
('procurement_department', 'rus', 'Отдел комплектации', 'Отдел комплектации', 'Менеджеры отдела комплектации помогут Вам обеспечить объекты недвижимости всем необходимым для систем отопления и водоснабжения, а так же, \n     в индивидуальном порядке, рассчитают и подберут подходящее оборудование.', 'Отопление и водоснабжение, Комплектация объектов.'),
('registration', 'rus', 'Регистрация пользователя', 'Регистрация пользователя', NULL, NULL),
('sales_department', 'eng', 'Sales department', 'Sales department', '', ''),
('sales_department', 'rus', 'Отдел продаж', 'Отдел продаж', '', ''),
('service_centers', 'eng', 'Service Centers', 'Service Centers', 'Адреса и телефоны сервисных центров. Центры Обслуживания и ремонта инструмента, бензотехники, сантехники, кондиционеров.', 'Сервисные центры, Инструмент, Электроинструмент, Бензотехника, Бензоинструмент, Сварочное оборудование, Газовое оборудование, Сантехника,\n     Отопление и водоснабжение, Канализация'),
('service_centers', 'rus', 'Сервисные центры', 'Сервисные центры', 'Адреса и телефоны сервисных центров. Центры Обслуживания и ремонта инструмента, бензотехники, сантехники, кондиционеров.', 'Сервисные центры, Инструмент, Электроинструмент, Бензотехника, Бензоинструмент, Сварочное оборудование, Газовое оборудование, Сантехника,\n     Отопление и водоснабжение, Канализация'),
('shopping_mall_on_the_city_ring_road', 'eng', 'Shopping mall on the city ring road', 'Shopping mall on the city ring road', '', ''),
('shopping_mall_on_the_city_ring_road', 'rus', 'ТЦ на окружной', 'ТЦ на окружной', '', ''),
('studio_furniture', 'eng', 'Studio Furniture', 'Studio Furniture', NULL, NULL),
('studio_furniture', 'rus', 'Студия мебели', 'Студия мебели', NULL, NULL),
('studio_furniture_ostrovskogo', 'eng', 'Studio Furniture, Ostrovskogo str', 'Studio Furniture, Ostrovskogo str', NULL, NULL),
('studio_furniture_ostrovskogo', 'rus', 'Студия мебели на Островского', 'Студия мебели на Островского', NULL, NULL),
('studio_furniture_shabulina', 'eng', 'Studio Furniture, Shabulina', 'Studio Furniture, Shabulina', NULL, NULL),
('studio_furniture_shabulina', 'rus', 'Студия мебели на Шабулина', 'Студия мебели на Шабулина', NULL, NULL),
('studio_furniture_yesenina', 'eng', 'Studio Furniture, Yesenina str', 'Studio Furniture, Yesenina str', NULL, NULL),
('studio_furniture_yesenina', 'rus', 'Студия мебели на Есенина', 'Студия мебели на Есенина', NULL, NULL),
('the_185th_km_of_the_beltway_hangar', 'eng', 'The 185th km of the city ring road (Hangar)', 'The 185th km of the city ring road (Hangar)', '', ''),
('the_185th_km_of_the_beltway_hangar', 'rus', 'Окружная, 185км (Ангар)', 'Окружная, 185км (Ангар)', '', ''),
('vacancies', 'eng', 'Vacancies', 'Vacancies', 'Открытые вакансии в компании Апельсин. Нам требуются инициативные, трудолюбивые и ответственные люди. Мы предлагаем обучение и стабильную заработную плату. Здесь Вы можете оставить резюме.', 'Вакансия, Работа, Карьера, Обучение, Заработная плата, Резюме.'),
('vacancies', 'rus', 'Вакансии', 'Вакансии', 'Открытые вакансии в компании Апельсин. Нам требуются инициативные, трудолюбивые и ответственные люди. Мы предлагаем обучение и стабильную заработную плату. Здесь Вы можете оставить резюме.', 'Вакансия, Работа, Карьера, Обучение, Заработная плата, Резюме.');

-- --------------------------------------------------------

--
-- Структура таблицы `ParamInfo_ComponentsElements`
--

DROP TABLE IF EXISTS `ParamInfo_ComponentsElements`;
CREATE TABLE IF NOT EXISTS `ParamInfo_ComponentsElements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `componentElement` bigint(20) unsigned NOT NULL,
  `param` varchar(100) NOT NULL DEFAULT 'name',
  `mandatory` tinyint(4) NOT NULL DEFAULT '1',
  `coments` text NOT NULL,
  `table` varchar(200) DEFAULT NULL,
  `column` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_UNIQUE` (`param`,`componentElement`),
  KEY `fk_ParamInfo_ComponentsElements_1_idx` (`componentElement`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Дамп данных таблицы `ParamInfo_ComponentsElements`
--

INSERT INTO `ParamInfo_ComponentsElements` (`id`, `componentElement`, `param`, `mandatory`, `coments`, `table`, `column`) VALUES
(1, 101, 'name', 1, 'alias материала для вывода настранице', 'Materials', 'alias'),
(2, 102, 'name', 1, 'name списка категорий', 'MaterialsCategoriesList', 'name'),
(5, 105, 'name', 1, 'name списка категорий для вывода списка материалов', 'MaterialsCategoriesList', 'name'),
(11, 202, 'name', 1, 'alias депортамента', 'ContactDepartments', 'alias'),
(12, 203, 'name', 1, 'alias списка депортаментов', 'ContactDepartmentsList', 'alias'),
(13, 201, 'name', 1, 'alias магазина', 'ContactsShop', 'alias');

-- --------------------------------------------------------

--
-- Структура таблицы `PluginDefaultParam`
--

DROP TABLE IF EXISTS `PluginDefaultParam`;
CREATE TABLE IF NOT EXISTS `PluginDefaultParam` (
  `plugin` varchar(50) NOT NULL,
  `param` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`plugin`,`param`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `PluginDefaultParam`
--

INSERT INTO `PluginDefaultParam` (`plugin`, `param`, `value`) VALUES
('jquery', 'min', '1'),
('jquery', 'version', '2.0.3');

-- --------------------------------------------------------

--
-- Структура таблицы `PluginDepends`
--

DROP TABLE IF EXISTS `PluginDepends`;
CREATE TABLE IF NOT EXISTS `PluginDepends` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `elementType` varchar(50) NOT NULL,
  `plugin` varchar(50) NOT NULL,
  `depends` varchar(50) NOT NULL,
  `versionStart` varchar(100) DEFAULT NULL,
  `versionEnd` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `depends_UNIQUE` (`depends`,`plugin`,`elementType`),
  KEY `fk_PluginDepends_1_idx` (`elementType`),
  KEY `fk_PluginDepends_2_idx` (`plugin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `PluginOnPage`
--

DROP TABLE IF EXISTS `PluginOnPage`;
CREATE TABLE IF NOT EXISTS `PluginOnPage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plugin` varchar(50) NOT NULL,
  `page` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plugin_UNIQUE` (`plugin`,`page`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_PluginOnPage_2_idx` (`page`),
  KEY `fk_PluginOnPage_1_idx` (`plugin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `PluginParam`
--

DROP TABLE IF EXISTS `PluginParam`;
CREATE TABLE IF NOT EXISTS `PluginParam` (
  `plugin` int(10) unsigned NOT NULL,
  `param` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`plugin`,`param`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Plugins`
--

DROP TABLE IF EXISTS `Plugins`;
CREATE TABLE IF NOT EXISTS `Plugins` (
  `alias` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `version` varchar(100) NOT NULL,
  `description` text,
  `main` varchar(100) NOT NULL,
  `head` varchar(100) DEFAULT NULL,
  `bodyEnd` varchar(100) DEFAULT NULL,
  `admin` varchar(100) DEFAULT NULL,
  `onAllPages` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `sequence` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`alias`),
  UNIQUE KEY `sequence_UNIQUE` (`sequence`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `Plugins`
--

INSERT INTO `Plugins` (`alias`, `name`, `author`, `version`, `description`, `main`, `head`, `bodyEnd`, `admin`, `onAllPages`, `sequence`) VALUES
('appearingBox', 'Всплывающий блок', 'Compu Project', '1.0', 'Всплывающий блок дял размещение изображений, страниц, видео и т.д.', 'index.php', 'head.php', '', './admin/index.php', 1, 5),
('AudioPlayer', 'AudioPlayer', 'AudioPlayer', 'AudioPlayer', 'AudioPlayer', 'index.php', 'head.php', 'bodyEnd.php', 'admin/index.php', 1, 4),
('captcha', 'Captcha', 'Compu Project', '1.0', 'Генератор проверочного кода', 'index.php', 'head.php', '', './admin/index.php', 1, 2),
('ContentToColumns', 'Content To Columns', 'Compu Project', '1.0', 'Распределяет равномерно контент по колонкам', 'index.php', 'head.php', NULL, 'admin/index.php', 1, 7),
('JCrop', 'Обрезка изображений', 'Compu Project', '1.0', 'Обрезка изображения', 'index.php', 'head.php', '', './admin/index.php', 1, 3),
('jquery', 'Библиотека Jquery', 'Compu Project', '1.0', 'Плагин для подключения библиотеки Jquery', 'index.php', 'head.php', '', './admin/index.php', 1, 1),
('printPage', 'Версия для печати', 'Compu Project', '1.0', 'Плагин генерирующий кнопку для открытия страницы версии для печати', 'index.php', 'head.php', 'bodyEnd.php', 'admin/index.php', 1, 6),
('snowflakes', 'Snowflakes', 'CompuProject', '1.0', 'Падающий снег', 'index.php', 'head.php', NULL, 'admin/index.php', 1, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `PluginsDependsElementsType`
--

DROP TABLE IF EXISTS `PluginsDependsElementsType`;
CREATE TABLE IF NOT EXISTS `PluginsDependsElementsType` (
  `elementType` varchar(50) NOT NULL,
  `tableName` varchar(50) NOT NULL,
  PRIMARY KEY (`elementType`),
  UNIQUE KEY `elementType_UNIQUE` (`elementType`),
  UNIQUE KEY `tableName_UNIQUE` (`tableName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `PluginsDependsElementsType`
--

INSERT INTO `PluginsDependsElementsType` (`elementType`, `tableName`) VALUES
('Components', 'Components'),
('Modules', 'Modules'),
('Plugins', 'Plugins');

-- --------------------------------------------------------

--
-- Структура таблицы `ROOT_SETTINGS`
--

DROP TABLE IF EXISTS `ROOT_SETTINGS`;
CREATE TABLE IF NOT EXISTS `ROOT_SETTINGS` (
  `settingsName` varchar(50) NOT NULL,
  `superKey` varchar(100) NOT NULL,
  `multilanguage` tinyint(4) NOT NULL DEFAULT '0',
  `siteClosed` tinyint(4) NOT NULL DEFAULT '0',
  `charset` varchar(100) NOT NULL,
  `companyName` varchar(100) DEFAULT NULL,
  `siteName` varchar(100) NOT NULL,
  `activated` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`settingsName`),
  UNIQUE KEY `settingsName_UNIQUE` (`settingsName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ROOT_SETTINGS`
--

INSERT INTO `ROOT_SETTINGS` (`settingsName`, `superKey`, `multilanguage`, `siteClosed`, `charset`, `companyName`, `siteName`, `activated`) VALUES
('default', 'f1828ce9f26031573db9a3268b51041c', 1, 0, 'utf8', 'Compu Project', 'Апельсин', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `SiteMap`
--

DROP TABLE IF EXISTS `SiteMap`;
CREATE TABLE IF NOT EXISTS `SiteMap` (
  `alias` varchar(50) NOT NULL,
  `url` varchar(200) DEFAULT NULL,
  `sequence` int(5) NOT NULL,
  `group` varchar(50) NOT NULL,
  PRIMARY KEY (`alias`),
  UNIQUE KEY `sequence_UNIQUE` (`sequence`),
  KEY `fk_SiteMap_1_idx` (`group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `SiteMap`
--

INSERT INTO `SiteMap` (`alias`, `url`, `sequence`, `group`) VALUES
('contacts', NULL, 105, 'site_pages'),
('credit', NULL, 206, 'information'),
('delivery', NULL, 202, 'information'),
('department_general_enquiries', NULL, 401, 'departments'),
('department_marketing', NULL, 403, 'departments'),
('department_procurement', NULL, 405, 'departments'),
('department_sales', NULL, 402, 'departments'),
('discount', NULL, 203, 'information'),
('documentation', NULL, 204, 'information'),
('gift_cards', NULL, 205, 'information'),
('information', NULL, 102, 'site_pages'),
('news', NULL, 101, 'site_pages'),
('payment', NULL, 201, 'information'),
('polisteny', 'http://polisteny.ru/', 406, 'departments'),
('service_centers', NULL, 103, 'site_pages'),
('shop_butyrki', NULL, 307, 'shops'),
('shop_chernovitskaya', NULL, 308, 'shops'),
('shop_chkalova', NULL, 309, 'shops'),
('shop_hangar_on_the_city_ring_road', NULL, 310, 'shops'),
('shop_mall_on_the_city_ring_road', NULL, 304, 'shops'),
('shop_ostrovskogo', NULL, 303, 'shops'),
('shop_pushkina_luhovitsy', NULL, 312, 'shops'),
('shop_shabulina', NULL, 306, 'shops'),
('shop_svyazi_sokolovka', NULL, 311, 'shops'),
('shop_verkhnyaya', NULL, 302, 'shops'),
('shop_yesenina', NULL, 301, 'shops'),
('shop_zubkovoy', NULL, 305, 'shops'),
('studio_furniture', NULL, 404, 'departments'),
('vacancies', NULL, 104, 'site_pages');

-- --------------------------------------------------------

--
-- Структура таблицы `SiteMapGroups`
--

DROP TABLE IF EXISTS `SiteMapGroups`;
CREATE TABLE IF NOT EXISTS `SiteMapGroups` (
  `alias` varchar(50) NOT NULL,
  `url` varchar(50) DEFAULT NULL,
  `sequence` int(5) NOT NULL,
  PRIMARY KEY (`alias`),
  UNIQUE KEY `sequence_UNIQUE` (`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `SiteMapGroups`
--

INSERT INTO `SiteMapGroups` (`alias`, `url`, `sequence`) VALUES
('departments', NULL, 300),
('information', NULL, 200),
('shops', NULL, 400),
('site_pages', NULL, 100);

-- --------------------------------------------------------

--
-- Структура таблицы `SiteMapGroupsPages`
--

DROP TABLE IF EXISTS `SiteMapGroupsPages`;
CREATE TABLE IF NOT EXISTS `SiteMapGroupsPages` (
  `alias` varchar(50) NOT NULL,
  `page` varchar(50) NOT NULL,
  `postfix` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`alias`,`page`),
  KEY `fk_SiteMapGroupsPages_2_idx` (`page`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `SiteMapGroupsPages`
--

INSERT INTO `SiteMapGroupsPages` (`alias`, `page`, `postfix`) VALUES
('departments', 'contacts', NULL),
('information', 'information', NULL),
('shops', 'contacts', NULL),
('site_pages', 'about', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `SiteMapGroups_Lang`
--

DROP TABLE IF EXISTS `SiteMapGroups_Lang`;
CREATE TABLE IF NOT EXISTS `SiteMapGroups_Lang` (
  `alias` varchar(50) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`alias`,`lang`),
  KEY `fk_SiteMapGroups_Lang_2_idx` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `SiteMapGroups_Lang`
--

INSERT INTO `SiteMapGroups_Lang` (`alias`, `lang`, `name`) VALUES
('departments', 'eng', 'Departments'),
('departments', 'rus', 'Отделы'),
('information', 'eng', 'Information'),
('information', 'rus', 'Информация'),
('shops', 'eng', 'Shops'),
('shops', 'rus', 'Магазины'),
('site_pages', 'eng', 'Home'),
('site_pages', 'rus', 'Главная');

-- --------------------------------------------------------

--
-- Структура таблицы `SiteMapPages`
--

DROP TABLE IF EXISTS `SiteMapPages`;
CREATE TABLE IF NOT EXISTS `SiteMapPages` (
  `alias` varchar(50) NOT NULL,
  `page` varchar(50) NOT NULL,
  `postfix` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`alias`,`page`),
  KEY `fk_SiteMapPages_2_idx` (`page`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `SiteMapPages`
--

INSERT INTO `SiteMapPages` (`alias`, `page`, `postfix`) VALUES
('contacts', 'contacts', NULL),
('credit', 'information', 'credit'),
('delivery', 'information', 'delivery'),
('department_general_enquiries', 'general_enquiries_department', NULL),
('department_marketing', 'marketing_department', NULL),
('department_procurement', 'procurement_department', NULL),
('department_sales', 'sales_department', NULL),
('discount', 'information', 'discount'),
('documentation', 'information', 'documentation'),
('gift_cards', 'information', 'gift_cards'),
('information', 'information', NULL),
('news', 'news', NULL),
('payment', 'information', 'payment'),
('service_centers', 'service_centers', NULL),
('shop_butyrki', '1v_3rd_butyrki_str', NULL),
('shop_chernovitskaya', '5_chernovitskaya_str', NULL),
('shop_chkalova', '70b_chkalova_str', NULL),
('shop_hangar_on_the_city_ring_road', 'the_185th_km_of_the_beltway_hangar', NULL),
('shop_mall_on_the_city_ring_road', 'shopping_mall_on_the_city_ring_road', NULL),
('shop_ostrovskogo', '109-2_ostrovskogo_str', NULL),
('shop_pushkina_luhovitsy', '170v_pushkina_str_luhovitsy', NULL),
('shop_shabulina', '24b_directions_shabulina', NULL),
('shop_svyazi_sokolovka', '10b_svyazi_str_sokolovka', NULL),
('shop_verkhnyaya', '50_verkhnyaya_str', NULL),
('shop_yesenina', '13_yesenina_str', NULL),
('shop_zubkovoy', '27b_zubkovoy_str', NULL),
('studio_furniture', 'studio_furniture', NULL),
('vacancies', 'vacancies', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `SiteMap_Lang`
--

DROP TABLE IF EXISTS `SiteMap_Lang`;
CREATE TABLE IF NOT EXISTS `SiteMap_Lang` (
  `alias` varchar(50) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`alias`,`lang`),
  KEY `fk_SiteMap_Lang_2_idx` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `SiteMap_Lang`
--

INSERT INTO `SiteMap_Lang` (`alias`, `lang`, `name`) VALUES
('contacts', 'eng', 'Contacts'),
('contacts', 'rus', 'Контакты'),
('credit', 'eng', 'Credit'),
('credit', 'rus', 'Кредит'),
('delivery', 'eng', 'Delivery'),
('delivery', 'rus', 'Доставка'),
('department_general_enquiries', 'eng', 'General enquiries department'),
('department_general_enquiries', 'rus', 'Отдел информации'),
('department_marketing', 'eng', 'Marketing department'),
('department_marketing', 'rus', 'Отдел маркетинга'),
('department_procurement', 'eng', 'Procurement department'),
('department_procurement', 'rus', 'Отдел комплектации'),
('department_sales', 'eng', 'Sales department'),
('department_sales', 'rus', 'Отдел продаж'),
('discount', 'eng', 'Discount'),
('discount', 'rus', 'Скидка'),
('documentation', 'eng', 'Documentation'),
('documentation', 'rus', 'Документы'),
('gift_cards', 'eng', 'Gift cards'),
('gift_cards', 'rus', 'Подарочные карты'),
('information', 'eng', 'Information'),
('information', 'rus', 'Информация'),
('news', 'eng', 'News'),
('news', 'rus', 'Акции'),
('payment', 'eng', 'Payment'),
('payment', 'rus', 'Оплата'),
('polisteny', 'eng', 'Pol & Steny'),
('polisteny', 'rus', 'Пол & Стены'),
('service_centers', 'eng', 'Service Centers'),
('service_centers', 'rus', 'Сервисные центры'),
('shop_butyrki', 'eng', '1V 3rd Butyrki str.'),
('shop_butyrki', 'rus', 'ул. 3 Бутырки, д.1В'),
('shop_chernovitskaya', 'eng', '5 Chernovitskaya str.'),
('shop_chernovitskaya', 'rus', 'ул. Черновицкая, д. 5'),
('shop_chkalova', 'eng', '70B Chkalova str.'),
('shop_chkalova', 'rus', 'ул. Чкалова, д. 70Б'),
('shop_hangar_on_the_city_ring_road', 'eng', 'The 185th km of the<br>beltway (Hangar)'),
('shop_hangar_on_the_city_ring_road', 'rus', 'Окружная дорога,<br>185 км (Ангар)'),
('shop_mall_on_the_city_ring_road', 'eng', 'Shopping mall on the<br>city ring road'),
('shop_mall_on_the_city_ring_road', 'rus', 'ТЦ на Окружной'),
('shop_ostrovskogo', 'eng', '109-2 Ostrovskogo str.'),
('shop_ostrovskogo', 'rus', 'ул. Островского, д. 109/2'),
('shop_pushkina_luhovitsy', 'eng', '170v Pushkina str.<br> (Luhovitsy)'),
('shop_pushkina_luhovitsy', 'rus', 'ул. Пушкина, д. 170B<br> (г. Луховицы)'),
('shop_shabulina', 'eng', '24B Directions Shabulina'),
('shop_shabulina', 'rus', 'Проезд Шабулина, д. 24Б'),
('shop_svyazi_sokolovka', 'eng', '10B Svyazi str.<br> (Sokolovka)'),
('shop_svyazi_sokolovka', 'rus', 'ул. Связи, д.10Б<br> (пос. Соколовка)'),
('shop_verkhnyaya', 'eng', '50 Verkhnyaya str.'),
('shop_verkhnyaya', 'rus', 'ул. Верхняя, д. 50'),
('shop_yesenina', 'eng', '13 Yesenina str.'),
('shop_yesenina', 'rus', 'ул. Есенина, д.13'),
('shop_zubkovoy', 'eng', '27B Zubkovoy str.'),
('shop_zubkovoy', 'rus', 'ул. Зубковой, д. 27Б'),
('studio_furniture', 'eng', 'Studio Furniture'),
('studio_furniture', 'rus', 'Студия мебели'),
('vacancies', 'eng', 'Vacancies'),
('vacancies', 'rus', 'Вакансии');

-- --------------------------------------------------------

--
-- Структура таблицы `Sliders`
--

DROP TABLE IF EXISTS `Sliders`;
CREATE TABLE IF NOT EXISTS `Sliders` (
  `alias` varchar(100) NOT NULL,
  `theme` varchar(50) NOT NULL,
  `hideTools` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `show_randomly` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `controls` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `controls_position` varchar(50) NOT NULL,
  `focus` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `focus_position` varchar(50) NOT NULL,
  `numbers` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `numbers_align` varchar(50) NOT NULL,
  `progressbar` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `enable_navigation_keys` tinyint(4) NOT NULL DEFAULT '1',
  `label` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `labelAnimation` varchar(50) NOT NULL,
  `dots` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `thumbs` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `preview` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `animations` varchar(50) NOT NULL,
  `interval` int(10) unsigned NOT NULL DEFAULT '4000',
  PRIMARY KEY (`alias`),
  UNIQUE KEY `alias_UNIQUE` (`alias`),
  KEY `fk_Sliders_SlidersThemes_idx` (`theme`),
  KEY `fk_Sliders_1_idx` (`controls_position`),
  KEY `fk_Sliders_2_idx` (`focus_position`),
  KEY `fk_Sliders_3_idx` (`numbers_align`),
  KEY `fk_Sliders_4_idx` (`labelAnimation`),
  KEY `fk_Sliders_5_idx` (`animations`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Sliders`
--

INSERT INTO `Sliders` (`alias`, `theme`, `hideTools`, `show_randomly`, `controls`, `controls_position`, `focus`, `focus_position`, `numbers`, `numbers_align`, `progressbar`, `enable_navigation_keys`, `label`, `labelAnimation`, `dots`, `thumbs`, `preview`, `animations`, `interval`) VALUES
('disable', 'clean', 1, 0, 0, 'center', 0, 'center', 0, 'center', 0, 1, 0, 'slideUp', 0, 0, 0, 'blind', 4000),
('main_slider', 'clean', 1, 0, 0, 'center', 0, 'center', 0, 'center', 0, 1, 0, 'slideUp', 0, 0, 0, 'blind', 4000),
('shop_butirki', 'clean', 1, 0, 0, 'center', 0, 'center', 0, 'center', 0, 1, 0, 'slideUp', 0, 0, 0, 'blind', 4000),
('shop_chernovitskaya', 'clean', 1, 0, 0, 'center', 0, 'center', 0, 'center', 0, 1, 0, 'slideUp', 0, 0, 0, 'blind', 4000),
('shop_chkalova', 'clean', 1, 0, 0, 'center', 0, 'center', 0, 'center', 0, 1, 0, 'slideUp', 0, 0, 0, 'blind', 4000),
('shop_circular_road_hangar', 'clean', 1, 0, 0, 'center', 0, 'center', 0, 'center', 0, 1, 0, 'slideUp', 0, 0, 0, 'blind', 4000),
('shop_circular_road_mall', 'clean', 1, 0, 0, 'center', 0, 'center', 0, 'center', 0, 1, 0, 'slideUp', 0, 0, 0, 'blind', 4000),
('shop_ostrovskogo', 'clean', 1, 0, 0, 'center', 0, 'center', 0, 'center', 0, 1, 0, 'slideUp', 0, 0, 0, 'blind', 4000),
('shop_pushkina_luhovitsy', 'clean', 1, 0, 0, 'center', 0, 'center', 0, 'center', 0, 1, 0, 'slideUp', 0, 0, 0, 'blind', 4000),
('shop_shabulina', 'clean', 1, 0, 0, 'center', 0, 'center', 0, 'center', 0, 1, 0, 'slideUp', 0, 0, 0, 'blind', 4000),
('shop_svyazi_sokolivka', 'clean', 1, 0, 0, 'center', 0, 'center', 0, 'center', 0, 1, 0, 'slideUp', 0, 0, 0, 'blind', 4000),
('shop_verkhnyaya', 'clean', 1, 0, 0, 'center', 0, 'center', 0, 'center', 0, 1, 0, 'slideUp', 0, 0, 0, 'blind', 4000),
('shop_yesenina', 'clean', 1, 0, 0, 'center', 0, 'center', 0, 'center', 0, 1, 0, 'slideUp', 0, 0, 0, 'blind', 4000),
('shop_zubkova', 'clean', 1, 0, 0, 'center', 0, 'center', 0, 'center', 0, 1, 0, 'slideUp', 0, 0, 0, 'blind', 4000),
('studio_furniture', 'clean', 1, 0, 0, 'center', 0, 'center', 0, 'center', 0, 1, 0, 'slideUp', 0, 0, 0, 'blind', 4000),
('studio_furniture_ostrovskogo', 'clean', 1, 0, 0, 'center', 0, 'center', 0, 'center', 0, 1, 0, 'slideUp', 0, 0, 0, 'blind', 4000),
('studio_furniture_shabulina', 'clean', 1, 0, 0, 'center', 0, 'center', 0, 'center', 0, 1, 0, 'slideUp', 0, 0, 0, 'blind', 4000),
('studio_furniture_yesenina', 'clean', 1, 0, 0, 'center', 0, 'center', 0, 'center', 0, 1, 0, 'slideUp', 0, 0, 0, 'blind', 4000);

-- --------------------------------------------------------

--
-- Структура таблицы `SlidersControlsPosition`
--

DROP TABLE IF EXISTS `SlidersControlsPosition`;
CREATE TABLE IF NOT EXISTS `SlidersControlsPosition` (
  `alias` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`alias`),
  UNIQUE KEY `alias_UNIQUE` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `SlidersControlsPosition`
--

INSERT INTO `SlidersControlsPosition` (`alias`, `description`) VALUES
('center', 'Поцентру'),
('leftBottom', 'Левый нижний угол'),
('leftTop', 'Левый верхний угол'),
('rightBottom', 'Правый нижний угол'),
('rightTop', 'Правый верхний угол');

-- --------------------------------------------------------

--
-- Структура таблицы `SlidersFocusPosition`
--

DROP TABLE IF EXISTS `SlidersFocusPosition`;
CREATE TABLE IF NOT EXISTS `SlidersFocusPosition` (
  `alias` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`alias`),
  UNIQUE KEY `alias_UNIQUE` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `SlidersFocusPosition`
--

INSERT INTO `SlidersFocusPosition` (`alias`, `description`) VALUES
('center', 'Поцентру'),
('leftBottom', 'Левый нижний угол'),
('leftTop', 'Левый верхний угол'),
('rightBottom', 'Правый нижний угол'),
('rightTop', 'Правый верхний угол');

-- --------------------------------------------------------

--
-- Структура таблицы `SlidersLabelAnimation`
--

DROP TABLE IF EXISTS `SlidersLabelAnimation`;
CREATE TABLE IF NOT EXISTS `SlidersLabelAnimation` (
  `alias` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`alias`),
  UNIQUE KEY `alias_UNIQUE` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `SlidersLabelAnimation`
--

INSERT INTO `SlidersLabelAnimation` (`alias`, `description`) VALUES
('fixed', 'фиксированно'),
('left', 'с левой стороны'),
('right', 'с правой стороны'),
('slideUp', 'снизу вверх');

-- --------------------------------------------------------

--
-- Структура таблицы `SlidersNumbersAlign`
--

DROP TABLE IF EXISTS `SlidersNumbersAlign`;
CREATE TABLE IF NOT EXISTS `SlidersNumbersAlign` (
  `alias` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`alias`),
  UNIQUE KEY `alias_UNIQUE` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `SlidersNumbersAlign`
--

INSERT INTO `SlidersNumbersAlign` (`alias`, `description`) VALUES
('center', 'по центру'),
('left', 'по левой стороне'),
('right', 'по правой стороне');

-- --------------------------------------------------------

--
-- Структура таблицы `SlidersThemes`
--

DROP TABLE IF EXISTS `SlidersThemes`;
CREATE TABLE IF NOT EXISTS `SlidersThemes` (
  `alias` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`alias`),
  UNIQUE KEY `alias_UNIQUE` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `SlidersThemes`
--

INSERT INTO `SlidersThemes` (`alias`, `description`) VALUES
('clean', 'Круглые кнопки переключения на слайдере'),
('default', 'Тема по умолчанию'),
('minimalist', 'Тема минимализма'),
('round', 'Полукруглые стрелки по бокам слайдера, словно окружают его'),
('square', 'Квадратные кнопки переключения на слайдере');

-- --------------------------------------------------------

--
-- Структура таблицы `Slides`
--

DROP TABLE IF EXISTS `Slides`;
CREATE TABLE IF NOT EXISTS `Slides` (
  `fileName` varchar(50) NOT NULL,
  `slider` varchar(100) NOT NULL,
  `sequence` int(11) NOT NULL,
  `animation` varchar(50) NOT NULL,
  `url` text,
  `text` text,
  PRIMARY KEY (`fileName`,`slider`),
  UNIQUE KEY `sequence_UNIQUE` (`sequence`,`slider`),
  KEY `fk_Slides_Sliders_idx` (`slider`),
  KEY `fk_Slides_SlidesAnimations_idx` (`animation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Slides`
--

INSERT INTO `Slides` (`fileName`, `slider`, `sequence`, `animation`, `url`, `text`) VALUES
('01.jpg', 'shop_svyazi_sokolivka', 1, 'blind', NULL, NULL),
('01.png', 'main_slider', 2, 'blind', NULL, NULL),
('01.png', 'shop_butirki', 7, 'blind', NULL, NULL),
('01.png', 'shop_chernovitskaya', 1, 'blind', NULL, NULL),
('01.png', 'shop_chkalova', 1, 'blind', NULL, NULL),
('01.png', 'shop_circular_road_hangar', 1, 'blind', NULL, NULL),
('01.png', 'shop_circular_road_mall', 5, 'blind', NULL, NULL),
('01.png', 'shop_ostrovskogo', 1, 'blind', NULL, NULL),
('01.png', 'shop_pushkina_luhovitsy', 1, 'blind', NULL, NULL),
('01.png', 'shop_shabulina', 1, 'blind', NULL, NULL),
('01.png', 'shop_verkhnyaya', 1, 'blind', NULL, NULL),
('01.png', 'shop_yesenina', 1, 'blind', NULL, NULL),
('01.png', 'shop_zubkova', 1, 'blind', NULL, NULL),
('01.png', 'studio_furniture_ostrovskogo', 1, 'blind', NULL, NULL),
('01.png', 'studio_furniture_yesenina', 1, 'blind', NULL, NULL),
('02.jpg', 'shop_svyazi_sokolivka', 2, 'blind', NULL, NULL),
('02.png', 'main_slider', 4, 'blind', NULL, NULL),
('02.png', 'shop_butirki', 2, 'blind', NULL, NULL),
('02.png', 'shop_chernovitskaya', 2, 'blind', NULL, NULL),
('02.png', 'shop_chkalova', 2, 'blind', NULL, NULL),
('02.png', 'shop_circular_road_hangar', 2, 'blind', NULL, NULL),
('02.png', 'shop_circular_road_mall', 2, 'blind', NULL, NULL),
('02.png', 'shop_ostrovskogo', 2, 'blind', NULL, NULL),
('02.png', 'shop_pushkina_luhovitsy', 2, 'blind', NULL, NULL),
('02.png', 'shop_shabulina', 2, 'blind', NULL, NULL),
('02.png', 'shop_verkhnyaya', 2, 'blind', NULL, NULL),
('02.png', 'shop_yesenina', 2, 'blind', NULL, NULL),
('02.png', 'shop_zubkova', 2, 'blind', NULL, NULL),
('02.png', 'studio_furniture_ostrovskogo', 2, 'blind', NULL, NULL),
('02.png', 'studio_furniture_yesenina', 2, 'blind', NULL, NULL),
('03.jpg', 'shop_svyazi_sokolivka', 3, 'blind', NULL, NULL),
('03.png', 'main_slider', 1, 'blind', NULL, NULL),
('03.png', 'shop_butirki', 3, 'blind', NULL, NULL),
('03.png', 'shop_chkalova', 3, 'blind', NULL, NULL),
('03.png', 'shop_circular_road_hangar', 3, 'blind', NULL, NULL),
('03.png', 'shop_circular_road_mall', 3, 'blind', NULL, NULL),
('03.png', 'shop_ostrovskogo', 3, 'blind', NULL, NULL),
('03.png', 'shop_pushkina_luhovitsy', 3, 'blind', NULL, NULL),
('03.png', 'shop_shabulina', 3, 'blind', NULL, NULL),
('03.png', 'shop_verkhnyaya', 3, 'blind', NULL, NULL),
('03.png', 'shop_yesenina', 3, 'blind', NULL, NULL),
('03.png', 'shop_zubkova', 3, 'blind', NULL, NULL),
('03.png', 'studio_furniture_ostrovskogo', 3, 'blind', NULL, NULL),
('03.png', 'studio_furniture_yesenina', 3, 'blind', NULL, NULL),
('04.jpg', 'shop_svyazi_sokolivka', 4, 'blind', NULL, NULL),
('04.png', 'main_slider', 8, 'blind', NULL, NULL),
('04.png', 'shop_butirki', 4, 'blind', NULL, NULL),
('04.png', 'shop_chkalova', 4, 'blind', NULL, NULL),
('04.png', 'shop_circular_road_hangar', 4, 'blind', NULL, NULL),
('04.png', 'shop_circular_road_mall', 4, 'blind', NULL, NULL),
('04.png', 'shop_ostrovskogo', 4, 'blind', NULL, NULL),
('04.png', 'shop_pushkina_luhovitsy', 4, 'blind', NULL, NULL),
('04.png', 'shop_shabulina', 4, 'blind', NULL, NULL),
('04.png', 'shop_verkhnyaya', 4, 'blind', NULL, NULL),
('04.png', 'shop_yesenina', 4, 'blind', NULL, NULL),
('04.png', 'shop_zubkova', 4, 'blind', NULL, NULL),
('04.png', 'studio_furniture_ostrovskogo', 4, 'blind', NULL, NULL),
('04.png', 'studio_furniture_yesenina', 4, 'blind', NULL, NULL),
('05.jpg', 'shop_svyazi_sokolivka', 5, 'blind', NULL, NULL),
('05.png', 'main_slider', 5, 'blind', NULL, NULL),
('05.png', 'shop_butirki', 5, 'blind', NULL, NULL),
('05.png', 'shop_chkalova', 5, 'blind', NULL, NULL),
('05.png', 'shop_circular_road_hangar', 5, 'blind', NULL, NULL),
('05.png', 'shop_circular_road_mall', 1, 'blind', NULL, NULL),
('05.png', 'shop_ostrovskogo', 5, 'blind', NULL, NULL),
('05.png', 'shop_pushkina_luhovitsy', 5, 'blind', NULL, NULL),
('05.png', 'shop_shabulina', 5, 'blind', NULL, NULL),
('05.png', 'shop_verkhnyaya', 5, 'blind', NULL, NULL),
('05.png', 'shop_yesenina', 5, 'blind', NULL, NULL),
('05.png', 'shop_zubkova', 5, 'blind', NULL, NULL),
('05.png', 'studio_furniture_ostrovskogo', 5, 'blind', NULL, NULL),
('06.png', 'main_slider', 3, 'blind', NULL, NULL),
('06.png', 'shop_butirki', 6, 'blind', NULL, NULL),
('06.png', 'shop_chkalova', 6, 'blind', NULL, NULL),
('06.png', 'shop_circular_road_hangar', 6, 'blind', NULL, NULL),
('06.png', 'shop_circular_road_mall', 6, 'blind', NULL, NULL),
('06.png', 'shop_ostrovskogo', 6, 'blind', NULL, NULL),
('06.png', 'shop_pushkina_luhovitsy', 6, 'blind', NULL, NULL),
('06.png', 'shop_shabulina', 6, 'blind', NULL, NULL),
('06.png', 'shop_verkhnyaya', 6, 'blind', NULL, NULL),
('06.png', 'shop_yesenina', 6, 'blind', NULL, NULL),
('06.png', 'shop_zubkova', 6, 'blind', NULL, NULL),
('06.png', 'studio_furniture_ostrovskogo', 6, 'blind', NULL, NULL),
('07.png', 'shop_butirki', 1, 'blind', NULL, NULL),
('07.png', 'shop_chkalova', 7, 'blind', NULL, NULL),
('07.png', 'shop_circular_road_hangar', 7, 'blind', NULL, NULL),
('07.png', 'shop_circular_road_mall', 7, 'blind', NULL, NULL),
('07.png', 'shop_ostrovskogo', 7, 'blind', NULL, NULL),
('07.png', 'shop_pushkina_luhovitsy', 7, 'blind', NULL, NULL),
('07.png', 'shop_shabulina', 7, 'blind', NULL, NULL),
('07.png', 'shop_verkhnyaya', 7, 'blind', NULL, NULL),
('07.png', 'shop_yesenina', 7, 'blind', NULL, NULL),
('07.png', 'shop_zubkova', 7, 'blind', NULL, NULL),
('07.png', 'studio_furniture_ostrovskogo', 7, 'blind', NULL, NULL),
('08.png', 'shop_pushkina_luhovitsy', 8, 'blind', NULL, NULL),
('ostrovskogo_301.png', 'studio_furniture', 301, 'blind', NULL, NULL),
('ostrovskogo_302.png', 'studio_furniture', 302, 'blind', NULL, NULL),
('ostrovskogo_303.png', 'studio_furniture', 303, 'blind', NULL, NULL),
('ostrovskogo_304.png', 'studio_furniture', 304, 'blind', NULL, NULL),
('ostrovskogo_305.png', 'studio_furniture', 305, 'blind', NULL, NULL),
('ostrovskogo_306.png', 'studio_furniture', 306, 'blind', NULL, NULL),
('ostrovskogo_307.png', 'studio_furniture', 307, 'blind', NULL, NULL),
('yesenina_101.png', 'studio_furniture', 101, 'blind', NULL, NULL),
('yesenina_102.png', 'studio_furniture', 102, 'blind', NULL, NULL),
('yesenina_103.png', 'studio_furniture', 103, 'blind', NULL, NULL),
('yesenina_104.png', 'studio_furniture', 104, 'blind', NULL, NULL),
('yesenina_105.png', 'studio_furniture', 105, 'blind', NULL, NULL),
('yesenina_106.png', 'studio_furniture', 106, 'blind', NULL, NULL),
('yesenina_107.png', 'studio_furniture', 107, 'blind', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `SlidesAnimations`
--

DROP TABLE IF EXISTS `SlidesAnimations`;
CREATE TABLE IF NOT EXISTS `SlidesAnimations` (
  `alias` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`alias`),
  UNIQUE KEY `alias_UNIQUE` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `SlidesAnimations`
--

INSERT INTO `SlidesAnimations` (`alias`, `description`) VALUES
('blind', ''),
('blindHeight', ''),
('blindWidth', ''),
('block', ''),
('circles', ''),
('circlesInside', ''),
('circlesRotate', ''),
('cube', ''),
('cubeHide', ''),
('cubeJelly', ''),
('cubeRandom', ''),
('cubeShow', ''),
('cubeSize', ''),
('cubeSpread', ''),
('cubeStop', ''),
('cubeStopRandom', ''),
('cut', ''),
('directionBottom', ''),
('directionLeft', ''),
('directionRight', ''),
('directionTop', ''),
('downBars', ''),
('fade', ''),
('fadeFour', ''),
('glassBlock', ''),
('glassCube', ''),
('hideBars', ''),
('horizontal', ''),
('paralell', ''),
('random', ''),
('randomSmart', ''),
('showBars', ''),
('showBarsRandom', ''),
('swapBars', ''),
('swapBarsBack', ''),
('swapBlocks', ''),
('tube', ''),
('upBars', '');

-- --------------------------------------------------------

--
-- Структура таблицы `TemplateBlocks`
--

DROP TABLE IF EXISTS `TemplateBlocks`;
CREATE TABLE IF NOT EXISTS `TemplateBlocks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `block` varchar(50) NOT NULL,
  `template` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `block_UNIQUE` (`block`,`template`),
  KEY `fk_TemplateBlocks_1_idx` (`template`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `TemplateBlocks`
--

INSERT INTO `TemplateBlocks` (`id`, `block`, `template`, `description`) VALUES
(1, 'topFloatBlock', 'apelsin', 'Плавающий вверху блок'),
(2, 'topLeftBlock', 'apelsin', 'Верхний врапер, левый блок'),
(3, 'topRightBlock', 'apelsin', 'Верхний врапер, правый блок'),
(4, 'middleTopBlock', 'apelsin', 'Основная область, верх'),
(5, 'middleLeftBlock', 'apelsin', 'Основная область, левый столбец'),
(6, 'contentTopBlock', 'apelsin', 'Блок над контентом'),
(7, 'contentBottomBlock', 'apelsin', 'Блок под контентом'),
(8, 'middleBottomBlock', 'apelsin', 'Основная область, нижний блок'),
(9, 'bottomTopBlock', 'apelsin', 'Нижняя часть, верхний блок'),
(10, 'bottomBottomBlock', 'apelsin', 'Нижняя часть, нижний блок');

-- --------------------------------------------------------

--
-- Структура таблицы `TemplateDependence`
--

DROP TABLE IF EXISTS `TemplateDependence`;
CREATE TABLE IF NOT EXISTS `TemplateDependence` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL,
  `depends` varchar(50) NOT NULL,
  `versionStart` varchar(100) DEFAULT NULL,
  `versionEnd` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `template_UNIQUE` (`template`,`depends`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `Templates`
--

DROP TABLE IF EXISTS `Templates`;
CREATE TABLE IF NOT EXISTS `Templates` (
  `alias` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `version` varchar(100) NOT NULL,
  `description` text,
  `default` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `main` varchar(100) NOT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `print` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Templates`
--

INSERT INTO `Templates` (`alias`, `name`, `author`, `version`, `description`, `default`, `main`, `mobile`, `print`) VALUES
('apelsin', 'Апельсин', 'Compu Project', 'v1.0', 'Основной шаблон сайта', 1, 'index.php', 'mobile.php', 'print.php');

-- --------------------------------------------------------

--
-- Структура таблицы `UrlTarget`
--

DROP TABLE IF EXISTS `UrlTarget`;
CREATE TABLE IF NOT EXISTS `UrlTarget` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target` varchar(30) NOT NULL COMMENT 'инструкция об отскрытии ссылки',
  `description` varchar(45) DEFAULT NULL COMMENT 'Описание',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `target_UNIQUE` (`target`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='тип ссылки. как ее открывать' AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `UrlTarget`
--

INSERT INTO `UrlTarget` (`id`, `target`, `description`) VALUES
(1, '_blank', 'Opens the linked document in a new window or '),
(2, '_self', 'Opens the linked document in the same frame a'),
(3, '_parent', 'Opens the linked document in the parent frame'),
(4, '_top', 'Opens the linked document in the full body of');

-- --------------------------------------------------------

--
-- Структура таблицы `Users`
--

DROP TABLE IF EXISTS `Users`;
CREATE TABLE IF NOT EXISTS `Users` (
  `login` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `ferstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `birthday` datetime NOT NULL,
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1 - мужской\n0 - женский',
  `city` varchar(200) NOT NULL,
  `group` varchar(50) NOT NULL,
  `registered` datetime NOT NULL,
  `lastVisit` datetime NOT NULL,
  `activated` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `activatedHash` varchar(200) NOT NULL,
  `disable` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `delete` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` varchar(150) DEFAULT NULL,
  `aboutYourself` text,
  `icq` varchar(9) DEFAULT NULL,
  `skype` varchar(25) DEFAULT NULL,
  `vk` varchar(25) DEFAULT NULL,
  `odnoklasniki` varchar(25) DEFAULT NULL,
  `google` varchar(25) DEFAULT NULL,
  `facebook` varchar(25) DEFAULT NULL,
  `twitter` varchar(25) DEFAULT NULL,
  `instagram` varchar(25) DEFAULT NULL,
  `youtube` varchar(25) DEFAULT NULL,
  `livejournal` varchar(25) DEFAULT NULL,
  `blogger` varchar(25) DEFAULT NULL,
  `siteName` varchar(25) DEFAULT NULL,
  `siteUrl` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`login`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  KEY `fk_Users_1_idx` (`group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Users`
--

INSERT INTO `Users` (`login`, `password`, `email`, `phone`, `ferstName`, `lastName`, `birthday`, `sex`, `city`, `group`, `registered`, `lastVisit`, `activated`, `activatedHash`, `disable`, `delete`, `status`, `aboutYourself`, `icq`, `skype`, `vk`, `odnoklasniki`, `google`, `facebook`, `twitter`, `instagram`, `youtube`, `livejournal`, `blogger`, `siteName`, `siteUrl`) VALUES
('Grimih', 'bbfd0bf8425e1c91e8807cbe99393407', 'grinenko@apelsin.ru', '+79308701701', 'Михаил', 'Гриненко', '1982-08-12 00:00:00', 1, 'Рязань', 'Administrator', '2014-09-19 04:39:51', '2014-09-19 04:39:51', 1, 'd2ccebe4505dddd2f4c33c36370f1c5e', 0, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
('m27', 'd57e26d0e2f4d7356686cbb5979a4f82', 'pplheiter@gmail.com', '8-920-986-54-98', 'Данила', 'Андронов', '2014-01-17 00:00:00', 1, 'Рязань', 'Administrator', '2014-09-19 04:36:23', '2014-09-19 04:36:23', 1, 'c03f02a9510235b55d5e0ce8f1bc48af', 0, 0, NULL, 'Бла-бла-бла', '', '', '', '', '', '', '', '', '', '', '', '', ''),
('Olga', '12836c0b33a98b189d3e7aa4e191a0a9', 'olga.rjabchicova@gmail.com', '89105675898', 'Ольга', 'Рябчикова', '1974-09-27 00:00:00', 0, 'Рязань', 'Administrator', '2014-09-19 00:00:00', '2014-09-19 00:00:00', 1, '12836c0b33a98b189d3e7aa4e191a0a9', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('RayMefise', 'a48f3792917ce52e0b6e8d412f061bf4', 'zaytsev.max90@gmail.com', '89105665485', 'Максим', 'Зайцев', '1990-03-01 00:00:00', 1, 'Рязань', 'Administrator', '2013-11-06 12:08:42', '2013-11-06 12:08:42', 1, 'd4af759b9c284a163c6d3d6fe7575eb4', 0, 0, 'Уровень сарказма в моем ответе зависит от уровня тупости вашего вопроса.', 'Психология - это искусство иметь людей раньше чем они поимеют вас!\r\n\r\nЛучший изгиб на теле женщины - это ее улыбка. \r\n\r\nПеред сексом вы помогаете друг другу раздеться, после секса вы одеваете только себя.\r\nМораль: в жизни никто не поможет вам, когда вас поимеют.\r\n\r\nУстой традиций надо соблюдать,\r\nПускай не раз ответят вам отказом,\r\nКонечно дама может и не дать,\r\nНо предложить, ты ей, всегда обязан.', '430776', 'mefise_ray', 'raymefise', '', '113232610557507330855', 'ray.mefise', 'RayMefise', 'ray_mefise', 'RayMefise', '', '', 'Compu Project', 'compuproject.com');

-- --------------------------------------------------------

--
-- Структура таблицы `UsersAgreements`
--

DROP TABLE IF EXISTS `UsersAgreements`;
CREATE TABLE IF NOT EXISTS `UsersAgreements` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(150) NOT NULL,
  `text` longtext NOT NULL,
  `dateOfChange` datetime NOT NULL,
  `sequence` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site` tinyint(4) NOT NULL DEFAULT '1',
  `admin` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `sequence_UNIQUE` (`sequence`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `UsersAgreements`
--

INSERT INTO `UsersAgreements` (`id`, `name`, `text`, `dateOfChange`, `sequence`, `site`, `admin`) VALUES
(1, 'Пользовательское соглашение', '<b><u>Пользовательское соглашение</u></b>\r\n<ol>\r\n<li><b><u>Общее положения</u></b>\r\n<ol>\r\n<li>Администрация предлагает Пользователю использовать сервисы Интернет-сайта на условиях, изложенных в настоящем Пользовательском соглашении. Соглашение вступает в силу с момента выражения Пользователем согласия с его условиями в порядке, предусмотренном п. 1.3 Соглашения.</li>\r\n<li>Использование сервисов Интернет-сайта регулируется настоящим Соглашением. Соглашение может быть изменено Администрацией без какого-либо специального уведомления, новая редакция Соглашения вступает в силу с момента ее размещения в сети Интернет по указанному адресу в п. 1.5 Соглашения.</li>\r\n<li>Начиная использовать сервис Интернет-сайта, пройдя процедуру регистрации, Пользователь считается принявшим условия Соглашения в полном объеме, без всяких оговорок и исключений. </li>\r\n<li>В случае несогласия Пользователя с какими-либо из положений Соглашения, Пользователь не в праве использовать сервисы Интернет-сайта. В случае если Администрацией были внесены какие-либо изменения в Соглашение в порядке, предусмотренном пунктом 1.2 Соглашения, с которыми Пользователь не согласен, он обязан прекратить использование сервисов Интернет-сайта.</li>\r\n</ol>\r\n</li>\r\n<li><b><u>Правила пользования Сайтом</u></b>\r\n<ol>\r\n<li>Пользование Сайтом возможно только при условии согласия Пользователя с условиями Соглашения и присоединения к нему в порядке, предусмотренном Соглашением. Для возможности использования основного функционала Сайта Пользователь создает Аккаунт.</li>\r\n<li>При регистрации Аккаунта Пользователем указывается актуальная и соответствующая действительности информация, в том числе Ф.И.О., пол, дата рождения и прочая информация. В случае указания неверных данных Пользователю будет отказано в использовании сервисов Интернет-сайта, а так же в участие на фестивале. </li>\r\n<li>Для входа на Сайт Пользователем формируются уникальные учетные данные - логин и пароль, которые являются конфиденциальной информацией и не подлежат разглашению, за исключением случаев, предусмотренных действующим законодательством и/или Соглашением. Риск осуществления мошеннических и иных неправомерных действий с Аккаунтом Пользователя в связи с утратой пароля несет Пользователь.</li>\r\n<li>Персональные данные Пользователя, указанные им при регистрации, а именно фамилия, имя, дата рождения, город проживания и прочая информация, отражаемая в Аккаунте и Профиле Пользователя (далее по тексту - персональные данные), обрабатываются Администрацией для исполнения Соглашения, предоставления Сервисов, оказания услуг Пользователю посредством Сайта.</li>\r\n<li>Присоединяясь к Соглашению и размещая данные в Аккаунте, Пользователь выражает свое согласие на обработку персональных данных Администрацией и на отражение персональных данных в Профиле Пользователя.</li>\r\n<li>Пользователь соглашается с тем, что Администрация в процессе обработки персональных данных имеет право осуществлять с персональными данными следующие действия: сбор, систематизацию, накопление, хранение, использование, уничтожение и иные необходимые в целях исполнения Соглашения и реализации Сервисов действия.</li>\r\n<li>После регистрации Аккаунта Пользователь вправе осуществлять наполнение Аккаунта  Контентом, добавлять фотографии и иные материалы в соответствии с предоставленным функционалом, предоставленными Администрацией при условии соблюдения Соглашения.</li>\r\n<li>Пользователь осознает и соглашается, что размещаемая в Аккаунте Пользователя Информация доступна для ознакомления иным Пользователям через Персональную страницу (Профиль) Пользователя.</li>\r\n<li>Вход на Сайт Пользователем, ранее зарегистрировавшим Аккаунт, осуществляется каждый раз путем прохождения процедуры авторизации - введения логина и пароля Пользователя, перехода по гиперссылке, полученной по электронной почте.</li>\r\n<li>Лицо, авторизовавшееся на Сайте, считается надлежащим владельцем Аккаунта Пользователя, доступ к использованию и управлению которого были получены в результате такой авторизации.</li>\r\n<li>Способы восстановления доступа к Аккаунту, авторизации Пользователя могут быть изменены, отменены или дополнены Администрацией в одностороннем порядке.</li>\r\n<li>Администрация обеспечивает функционирование Сайта в круглосуточном режиме, однако не гарантирует отсутствие перерывов, связанных с техническими неисправностями или проведением профилактических работ. Администрация не гарантирует, что Сайт или любые Сервисы будут функционировать в любое конкретное время в будущем или что они не прекратят работу.</li>\r\n</ol>\r\n</li>\r\n<li><b><u>Права и обязанности Пользователя</u></b>\r\n<ol>\r\n<li>Пользователь вправе:\r\n<ol>\r\n<li>производить настройки Аккаунта и Профиля, менять пароль для доступа к Аккаунту;</li>\r\n<li>размещать в Аккаунте Пользователя информацию о себе, добавлять фотографии, статусы;</li>\r\n<li>осуществлять поиск иных Пользователей в сообществах Пользователей, а также по информации, известной Пользователю и соответствующей информации, размещаемой отыскиваемым Пользователем на Персональной странице;</li>\r\n<li>отправлять и получать Личные сообщения, добавлять сообщения в чат;</li>\r\n<li>осуществлять иные, не запрещенные законодательством Российской Федерации или Соглашением действия, связанные с использованием Сайта.</li>\r\n</ol>\r\n<li> Пользователь гарантирует, что обладает всеми необходимыми полномочиями, для заключения настоящего Соглашения.</li>\r\n<li>Пользователь обязуется:\r\n<ol>\r\n<li>в момент регистрации Аккаунта указывать соответствующие действительности сведения в том числе Ф.И.О., пол, дата рождения и прочая информация. В случае указания неверных данных Пользователю будет отказано в использовании сервисов Интернет-сайта, а так же в участие на фестивале;</li>\r\n<li>принимать необходимые меры для обеспечения конфиденциальности учетных данных (логин и пароль), используемых для доступа к Аккаунту, следить за тем, чтобы пароль не сохранялся в браузере при возможном использовании компьютера другими лицами;</li>\r\n<li>уведомлять Администрацию Сайта обо всех случаях совершения в отношении Пользователя действий, которые могут быть расценены как оскорбительные, унижающие, дискредитирующие и т.п.;</li>\r\n<li>не совершать указанные в разделе 4 Соглашения запрещенные действия.</li>\r\n</ol></li>\r\n</ol></li>\r\n<li><b><u>Пользователю запрещается</u></b>\r\n<ol>\r\n<li>Осуществлять сбор персональных данных других Пользователей;</li>\r\n<li>Использовать любые автоматические или автоматизированные средства для сбора информации, размещенной на Сайте;</li>\r\n<li>Осуществлять пропаганду или агитацию, возбуждающую социальную, расовую, национальную или религиозную ненависть и вражду, пропаганду войны, социального, расового, национального, религиозного или языкового превосходства;</li>\r\n<li>Размещать на Сайте или передавать посредством Личных сообщений информацию ограниченного доступа (конфиденциальную информацию) третьих лиц, если Пользователь не обладает достаточными правами в силу закона или договора на раскрытие данной информации;</li>\r\n<li>Размещать на Сайте в открытом доступе (в чате, в комментариях и/или статусах) или передавать посредством Личных сообщений текстовые сообщения, графические изображения или иные материалы, содержание которых является оскорбительным для других Пользователей или иных лиц или может быть расценено в качестве такового, а также сообщения, изображения и иные материалы, которые дискредитируют Пользователей или иных лиц, содержат угрозы, призывы к насилию, совершению противоправных деяний, антиобщественных, аморальных поступков, а также совершению любых иных действий, противоречащих основам правопорядка и нравственности;</li>\r\n<li>Размещать на Сайте сообщения, графические изображения или другие материалы (в том числе не соответствующие действительности), размещение которых наносит или может нанести ущерб чести, достоинству и деловой репутации гражданина или деловой репутации организации;</li>\r\n<li>Размещать на Сайте сообщения, содержащие нецензурные слова и выражения;</li>\r\n<li>Размещать на Сайте материалы порнографического или эротического характера, фотографии людей в нижнем белье, за исключением купальных костюмов, или гипертекстовые ссылки на Интернет-сайты, содержащие такие материалы;</li>\r\n<li>Размещать на Сайте материалы с изображением алкогольной или табачной продукции, а так же с имитацией процесса курения и употребления алкогольных напитков;</li>\r\n<li>Размещать на Сайте персональные данные, в том числе контактные данные, других Пользователей или иных лиц без их предварительного согласия;</li>\r\n<li>Указывать при регистрации Аккаунта или вводить впоследствии заведомо ложную или вымышленную информацию о себе, в частности чужие или вымышленные имя и фамилию;</li>\r\n<li>Размещать на Сайте в качестве собственной фотографии изображения других лиц или вымышленных персонажей, изображения животных, предметов, абстрактные изображения, а также любые иные графические изображения, не являющиеся изображениями Пользователя, размещающего данные изображения;</li>\r\n<li>Регистрировать Аккаунт Пользователя в целях использования группой лиц или организацией без предварительного явного согласия Администрации;</li>\r\n<li>Регистрировать более одного Аккаунта Пользователя одним и тем же лицом;</li>\r\n<li>Размещать на Сайте в открытом доступе без предварительного согласия Администрации Сайта, передавать посредством Личных сообщений без предварительного согласия Пользователя текстовые сообщения, графические изображения и иные материалы, которые содержат рекламу;</li>\r\n<li>Осуществлять действия, направленные на дестабилизацию функционирования Сайта, осуществлять попытки несанкционированного доступа к управлению Сайтом или его закрытым разделам (разделам, доступ к которым разрешен только Администрации), а также осуществлять любые иные аналогичные действия;</li>\r\n<li>Осуществлять несанкционированный доступ к Аккаунтам иных Пользователей путем подборки или введения пароля, а также предпринимать попытки такого доступа;</li>\r\n<li>Использовать Сайт в каких-либо коммерческих целях без предварительного разрешения Администрации Сайта, за исключением случаев, предусмотренных настоящим Соглашением;</li>\r\n<li>Осуществлять рассылку спама - массовую рассылку коммерческой, политической, рекламной и иной информации (в том числе гиперссылок, ведущих на интернет-сайты с такой информацией и/или на интернет-сайты, содержащие вредоносное программное обеспечение) в Личных сообщениях, комментариях, сообщениях в чате и т.п., если Пользователи-получатели не выражали своего согласия на получение такого рода информации;</li>\r\n<li>Использовать Сайт для целей поиска и подбора персонала, размещения резюме, поиска должников или иных подобных целей.</li>\r\n</ol></li>\r\n<li><b><u>Права и обязанности Администрации Сайта</u></b>\r\n<ol>\r\n<li>Администрация осуществляет текущее управление Сайтом, определяет его структуру, внешний вид, разрешает или ограничивает доступ Пользователей к Сайту, осуществляет иные принадлежащие ей права.</li>\r\n<li>В части предоставления возможности взаимодействия между Пользователями, в том числе предоставления Пользователям возможности самостоятельно совершать те или иные действия в рамках Сайта, Администрация является лицом, только организовавшим техническую возможность такого взаимодействия, и связанные с таким взаимодействием передача, хранение и обеспечение доступа посредством сети Интернет к предоставляемой Пользователями информации, графическим изображениям и иным материалам, осуществляются без изменения таких материалов или влияния на них со стороны Администрации.</li>\r\n<li>Администрация решает вопросы о порядке размещения на Сайте рекламы, участия в партнерских программах и т.д.</li>\r\n<li>Администрация не несет ответственности за размещенные Пользователями Материалы, и предупреждает об уголовной ответственности за нарушение законодательства Российской Федерации.</li>\r\n<li>Администрация имеет право:\r\n<ol>\r\n<li>в любое время изменять оформление Сайта, его содержание, список Сервисов, изменять или дополнять используемые скрипты, программное обеспечение, Контент Администрации и другие объекты, используемые или хранящиеся на Сайте, любые серверные приложения, с уведомлением Пользователя или без такового;</li>\r\n<li>по своему усмотрению удалять любую информацию, в том числе размещаемую Пользователем на Сайте в нарушение законодательства Российской Федерации или положений Соглашения;</li>\r\n<li>использовать Материалы Пользователя в целях рекламы Сайта на свое усмотрение без какой-либо компенсации;</li>\r\n<li>использовать Материалы Пользователя  и/или их отдельные части (фрагменты) любыми способами (в т.ч. без указаний имени автора, модели и т.п.), в любой форме в любых целях, в том числе, в рекламных, макетах, рекламных модулях и т.д., без какой-либо компенсации;</li>\r\n<li>приостанавливать, ограничивать или прекращать доступ Пользователя ко всем или к любому из разделов Сайта, сообществам, группам на Сайте, Сервисам Администрации и/или Сервисам Партнеров Администрации, удалять создаваемые Пользователями сообщества и группы, в любое время без объяснения причин, с предварительным уведомлением или без такового;</li>\r\n<li>удалить Аккаунт Пользователя по своему усмотрению, в том числе в случае совершения Пользователем действий, нарушающих законодательство Российской Федерации или положения Соглашения;</li>\r\n<li>осуществлять рассылку Пользователям сообщений (в том числе сообщений по электронной почте, sms-сообщений и т.п.), являющихся уведомлениями о введении в действие новых, либо отмене старых услуг, утверждении и опубликовании новой редакции Соглашения, о новых Личных сообщениях, комментариях к фотографиям и статусам в Профиле Пользователя и т.п., содержащих рекламную информацию о Сервисах Администрации.</li>\r\n</ol></li>\r\n<li> Администрация не занимается рассмотрением и разрешением споров и конфликтных ситуаций, возникающих между Пользователями, а также между Пользователем и Партнером Администрации при использовании Пользователем Сервиса Партнера Администрации, однако по своему усмотрению может содействовать в разрешении возникших конфликтов. Администрация вправе приостановить, ограничить или прекратить доступ Пользователя к Сайту, в случае получения от других Пользователей мотивированных жалоб на некорректное поведение данного Пользователя на Сайте.</li>\r\n</ol></li>\r\n<li><b><u>Использование пользовательских материалов</u></b>\r\n<ol>\r\n<li>Принимая условия настоящего Соглашения, Пользователь безвозмездно предоставляет Администрации право использования материалов, который Пользователь добавляет, размещает или транслирует на Сайт. </li>\r\n<li>Размещаемые на Сайте Материалы не должны содержать:\r\n<ol>\r\n<li>материалы, которые нарушают действующие нормативно-правовые акта Российской Федерации, являются вредоносными, угрожающими, оскорбляющими нравственность, честь и достоинство, права и охраняемые законом интересы третьих лиц, клеветническими, нарушающими авторские права, пропагандирующими ненависть и/или дискриминацию людей по расовому, этническому, половому, социальному признакам, способствующие разжиганию религиозной, расовой или межнациональной розни, содержащие сцены насилия, либо жестокого обращения с животными, и т.д.;</li>\r\n<li>ущемления прав меньшинств;</li>\r\n<li>выдачи себя за другого человека или представителя организации и/или сообщества без достаточных на то прав, а также введения в заблуждение относительно свойств и характеристик каких-либо субъектов или объектов;</li>\r\n<li>неразрешенной специальным образом рекламной информации, спама, схем «пирамид», «писем счастья»;</li>\r\n<li>материалы, содержащие компьютерные коды, предназначенные для нарушения, уничтожения либо ограничения функциональности любого компьютерного или телекоммуникационного оборудования или программ, для осуществления несанкционированного доступа, а также серийные номера к коммерческим программным продуктам, логины, пароли и прочие средства для получения несанкционированного доступа к платным ресурсам в Интернет;</li>\r\n<li>умышленного или случайного нарушения каких-либо применимых нормативно-правовых актов;</li>\r\n<li>сбора и хранения персональных данных других пользователей;</li>\r\n<li>несогласованной передачи записей рекламного, коммерческого или агитационного характера;</li>\r\n<li>рекламы наркотических средств, алкогольной или табачной продукции, а так же с имитацией процесса курения и употребления алкогольных напитков и наркотиков;</li>\r\n<li>записи в чей-либо адрес, содержащие грубые и оскорбительные выражения.</li>\r\n</ol></li>\r\n</ol></li>\r\n<li><b><u>Прочие условия</u></b>\r\n<ol>\r\n<li>Соглашение вступает в силу с момента принятия его условий Пользователем. Соглашение выражается путем проставления отметки в соответствующем поле во время регистрации Аккаунта Пользователя, а также совершения Пользователем любого из действий по пользованию Сайтом (например, авторизация, фактическое потребление оказываемых услуг, загрузка Контента, использование Сервиса и т.п.). В случае несогласия с условиями Соглашения, Пользователь обязан прекратить пользование Сайтом и удалить Аккаунт Пользователя.</li>\r\n<li>Удаление Аккаунта означает автоматическое удаление персональных данных, Контента, настроек Аккаунта и Профиля, имеющихся у Пользователя ОКов, а также иной имеющейся в Аккаунте Пользователя информации.</li>\r\n<li>Положения Соглашения могут быть дополнены, изменены или отменены Администрацией Сайта в одностороннем порядке без предварительного уведомления Пользователей. Администрация Сайта вправе известить Пользователя о внесенных в Соглашение изменениях или о вступлении в силу новой редакции Соглашения путем опубликования уведомления на Сайте, отправки Личных сообщений Пользователю или иным способом по выбору Администрации Сайта.</li>\r\n<li>К правам и обязанностям Сторон, возникшим на основании редакции Соглашения, утратившей свою силу, применяются положения действующей (актуальной) редакции Соглашения, если иное не вытекает из характера возникших между Сторонами отношений.</li>\r\n<li>Претензии Пользователя, направляемые Администрации, принимаются и рассматриваются при условии указания актуальных и достоверных данных Пользователя, указанных в Аккаунте. Принимая во внимание возможное наличие Аккаунтов со схожими учетными данными, Администрация вправе требовать предоставления дополнительных сведений и информации, в том числе в отношении Аккаунта Пользователя, позволяющих определить, в связи с каким Аккаунтом поступила претензия, или установить принадлежность Аккаунта лицу, обратившемуся с претензией.</li>\r\n</ol></li>\r\n</ol>', '2013-11-05 06:13:33', 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `UsersGroups`
--

DROP TABLE IF EXISTS `UsersGroups`;
CREATE TABLE IF NOT EXISTS `UsersGroups` (
  `group` varchar(50) NOT NULL,
  `adminDefault` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `siteDefault` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `loginInAdminPanel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `changeSettings` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `permissionUsersShow` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `permissionUsersCreate` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `permissionUsersEdit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `permissionUsersDelete` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `permissionUsersGroupCreate` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `permissionUsersGroupEdit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `permissionUsersGroupDelete` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `permissionPagesCreate` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `permissionPagesEdit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `permissionPagesDelete` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `permissionModulesCreate` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `permissionModulesEdit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `permissionModulesDelete` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `permissionPluginsEdit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group`),
  UNIQUE KEY `group_UNIQUE` (`group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `UsersGroups`
--

INSERT INTO `UsersGroups` (`group`, `adminDefault`, `siteDefault`, `loginInAdminPanel`, `changeSettings`, `permissionUsersShow`, `permissionUsersCreate`, `permissionUsersEdit`, `permissionUsersDelete`, `permissionUsersGroupCreate`, `permissionUsersGroupEdit`, `permissionUsersGroupDelete`, `permissionPagesCreate`, `permissionPagesEdit`, `permissionPagesDelete`, `permissionModulesCreate`, `permissionModulesEdit`, `permissionModulesDelete`, `permissionPluginsEdit`) VALUES
('Administrator', 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
('Moderator', 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0),
('SuperModerator', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0),
('User', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `UsersGroups_Lang`
--

DROP TABLE IF EXISTS `UsersGroups_Lang`;
CREATE TABLE IF NOT EXISTS `UsersGroups_Lang` (
  `group` varchar(50) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`group`,`lang`),
  KEY `fk_UsersGroups_Lang_2_idx` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `UsersGroups_Lang`
--

INSERT INTO `UsersGroups_Lang` (`group`, `lang`, `name`, `description`) VALUES
('Administrator', 'rus', 'Администратор', 'Администратор системы'),
('Moderator', 'rus', 'Модератор', 'Модератор сайта'),
('SuperModerator', 'rus', 'Главный модератор', 'Главный модератор сайта'),
('User', 'rus', 'Пользователь', 'Пользователь сайта');

-- --------------------------------------------------------

--
-- Структура таблицы `UsersMassage`
--

DROP TABLE IF EXISTS `UsersMassage`;
CREATE TABLE IF NOT EXISTS `UsersMassage` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) DEFAULT NULL,
  `text` text NOT NULL,
  `date` datetime NOT NULL,
  `sender` varchar(25) NOT NULL,
  `addressee` varchar(25) NOT NULL,
  `sender_read` tinyint(4) NOT NULL DEFAULT '0',
  `addressee_read` tinyint(4) NOT NULL DEFAULT '0',
  `sender_delete` tinyint(4) NOT NULL DEFAULT '0',
  `addressee_delete` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_UsersMassage_1_idx` (`sender`),
  KEY `fk_UsersMassage_2_idx` (`addressee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `UsersNotifications`
--

DROP TABLE IF EXISTS `UsersNotifications`;
CREATE TABLE IF NOT EXISTS `UsersNotifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(25) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_UsersNotifications_1_idx` (`type`),
  KEY `fk_UsersNotifications_2_idx` (`user`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `UsersNotifications`
--

INSERT INTO `UsersNotifications` (`id`, `user`, `date`, `type`) VALUES
(1, 'RayMefise', '2013-11-16 00:00:00', 'notification'),
(2, 'RayMefise', '2013-11-16 00:00:00', 'alert'),
(3, 'RayMefise', '2013-11-16 00:00:00', 'alarm');

-- --------------------------------------------------------

--
-- Структура таблицы `UsersNotificationsType`
--

DROP TABLE IF EXISTS `UsersNotificationsType`;
CREATE TABLE IF NOT EXISTS `UsersNotificationsType` (
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`type`),
  UNIQUE KEY `type_UNIQUE` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `UsersNotificationsType`
--

INSERT INTO `UsersNotificationsType` (`type`) VALUES
('alarm'),
('alert'),
('notification');

-- --------------------------------------------------------

--
-- Структура таблицы `UsersNotifications_Lang`
--

DROP TABLE IF EXISTS `UsersNotifications_Lang`;
CREATE TABLE IF NOT EXISTS `UsersNotifications_Lang` (
  `usersNotifications` bigint(20) unsigned NOT NULL,
  `lang` varchar(3) NOT NULL,
  `title` varchar(200) NOT NULL,
  `text` longtext NOT NULL,
  PRIMARY KEY (`usersNotifications`,`lang`),
  UNIQUE KEY `lang_UNIQUE` (`lang`,`usersNotifications`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `UsersNotifications_Lang`
--

INSERT INTO `UsersNotifications_Lang` (`usersNotifications`, `lang`, `title`, `text`) VALUES
(1, 'eng', 'Заполните информацию о себе', 'Уважаемый пользователь, вы не заполнили информацию о себе до конца.'),
(1, 'rus', 'Заполните информацию о себе', 'Уважаемый пользователь, вы не заполнили информацию о себе до конца.'),
(2, 'eng', 'Распространение ложной информации.', 'Есть подозрения о том что вы указали некорректрые данные. Пройтите првоерку или мы вас заблокируем.'),
(2, 'rus', 'Распространение ложной информации.', 'Есть подозрения о том что вы указали некорректрые данные. Пройтите првоерку или мы вас заблокируем.'),
(3, 'eng', 'Предупреждение от Администрации', 'Вас скоро забанят'),
(3, 'rus', 'Предупреждение от Администрации', 'Вас скоро забанят');

-- --------------------------------------------------------

--
-- Структура таблицы `Vacancies`
--

DROP TABLE IF EXISTS `Vacancies`;
CREATE TABLE IF NOT EXISTS `Vacancies` (
  `name` varchar(100) NOT NULL,
  `responsibility` text,
  `terms` text,
  `requirements` text,
  `importance` int(11) DEFAULT '1',
  PRIMARY KEY (`name`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Vacancies`
--

INSERT INTO `Vacancies` (`name`, `responsibility`, `terms`, `requirements`, `importance`) VALUES
('IT-Специалист', 'Обеспечение работы компьютерной техники, сети и программного обеспечения, а также обеспечение информационной безопасности в организации;', 'Стабильный заработок, обучение, возможность финансового и карьерного роста;', 'Ответственность, трудолюбие, инициативность, гражданство РФ, опыт работы;', 17),
('Дизайнер', 'Создание дизайн-проектов 2D, работа с векторной и растровой графикой, работа с контентом для интернет-ресурсов;', 'Достойный заработок, обучение;', 'Опыт работы в сфере дизайна;', 15),
('Дизайнер керамической плитки', 'Разработка дизайн-проектов керамической плитки.', 'Широкие возможности для финансового роста, гибкий график, молодой коллектив, получение богатого опыта по общению с людьми;', 'Коммуникабельность, трудолюбие, знание программ для разработки дизайн проектов, гражданство РФ;', 16),
('Карщик', 'Погрузочно-разгрузочные работы на территории складского комплекса, текущее обслуживание автопогрузчика;', 'Стабильный заработок, возможность финансового роста;', 'Ответственность, трудолюбие, документы на право управлять автопогрузчиком;', 10),
('Кассир', 'Прием наличных денег, работа на кассе, ведение документов кассира;', 'Стабильный заработок, обучение, возможность карьерного роста;', 'Ответственность, трудолюбие, честность, приятная внешность, стрессоустойчивость, четкая и грамотная речь;', 5),
('Кладовщик', 'Управление складской группой, учетно-контрольная деятельность, прием и отпуск товаров;', 'Стабильный заработок, обучение, возможность финансового и карьерного роста;', 'Порядочность, ответственность, трудолюбие, инициативность, знание ПК, гражданство РФ;', 9),
('Логист', 'Планирование транспортных процессов, организация рациональных маршрутов;', 'Достойный заработок, обучение;', 'Наличие автомобиля, опыт работы в сфере логистики приветствуется;', 12),
('Менеджер кредитного отдела', 'Консультирование покупателей по условиям предоставления кредита, оформление кредитных договоров, ведение взаиморасчетов с клиентами, контроль наличия информации в торговом зале;', 'Достойный заработок, обучение;', 'Опыт работы в сфере кредитования приветствуется;', 4),
('Менеджер по продажам', 'Консультирование клиентов в торговых залах, проведение розничных сделок, мерчендайзинг;', 'Широкие возможности для финансового и карьерного роста, обучение, молодой коллектив, получение богатого опыта по общению с людьми;', 'Коммуникабельность, инициативность, трудолюбие, знание ПК, гражданство РФ;', 2),
('Оператор', 'Прием заказов от покупателей, проведение оптовых и розничных сделок, ведение оптового документооборота;', 'Широкие возможности для финансового и карьерного роста, обучение, молодой коллектив, получение богатого опыта по общению с людьми, работа в офисе;', 'Ответственность, трудолюбие, честность, приятная внешность, стрессоустойчивость, четкая и грамотная реч;', 7),
('Оператор отдела маркетинга', 'Закупка товара, поддержание оптимального складского запаса;', 'Широкие возможности для финансового и карьерного роста, обучение, молодой коллектив, получение богатого опыта по общению с людьми;', 'Коммуникабельность, инициативность, трудолюбие, знание ПК, гражданство РФ;', 8),
('Оператор-кассир', NULL, NULL, NULL, 6),
('Продавец корпусной мебели', 'Разработка дизайн-проектов и прием заказов корпусной мебели.', 'Широкие возможности для финансового роста, гибкий график, молодой коллектив, получение богатого опыта по общению с людьми;', 'Коммуникабельность, трудолюбие, знание программ для разработки дизайн проектов, гражданство РФ;', 3),
('Работник склада', 'Погрузочно-разгрузочные работы, фасовочно-сортировочные работы, работы по складу;', 'Широкие возможности для финансового и карьерного роста, обучение;', 'Честность, исполнительность, трудолюбие;', 11),
('Сборщик-установщик', NULL, NULL, NULL, 14),
('Секретарь', 'Организация работы офиса, переключение внешних звонков по МИНИ-АТС.', 'Широкие возможности для финансового и карьерного роста, обучение, молодой коллектив.', 'Коммуникабельность, инициативность, трудолюбие, знание ПК, оргтехники, правильная грамотная речь, знание телефонного этикета, приятный внешний вид, ответственность, желание работать и зарабатывать.', 19),
('Уборщица', 'Уборка площадей и оборудования в торговых помещениях;', 'Стабильный заработок, работа в помещении;', 'Ответственность, трудолюбие;', 20),
('Управляющий', 'Организация розничной торговли на торговых точках, управление персоналом, руководство торговым процессом, обеспечение роста оборота;', 'Широкие возможности для финансового и карьерного роста;', 'Инициативность, гражданство РФ;', 1),
('Экспедитор', '', '', '', 13),
('Юрисконсульт', 'правовое сопровождение организации, составление и проверка \r\nдоговоров (поставка, подряд, поручительство, купля-продажа и пр.)', 'достойная заработная плата, возможность карьерного роста', 'ответственность, целеустремленность, многозадачность, \r\nаккуратность, умение обращаться с бумагами', 18);

-- --------------------------------------------------------

--
-- Структура таблицы `VacanciesAdress`
--

DROP TABLE IF EXISTS `VacanciesAdress`;
CREATE TABLE IF NOT EXISTS `VacanciesAdress` (
  `adress` varchar(100) NOT NULL,
  PRIMARY KEY (`adress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `VacanciesAdress`
--

INSERT INTO `VacanciesAdress` (`adress`) VALUES
('Бутырки'),
('Верхняя'),
('Есенина'),
('Зубковой'),
('Луховицы'),
('Окружная (Ангар)'),
('Окружная (Рынок)'),
('Островского'),
('Отдел информации'),
('Отдел комплектации'),
('Отдел Логистики'),
('Отдел маркетинга'),
('Отдел продаж'),
('Пол &amp; Стены'),
('Секретариат'),
('Соколовка'),
('Студия Мебели'),
('ТЦ на Окружной'),
('Фирсова'),
('Черновицкая'),
('Чкалова'),
('Шабулина');

-- --------------------------------------------------------

--
-- Структура таблицы `VacanciesAdressPages`
--

DROP TABLE IF EXISTS `VacanciesAdressPages`;
CREATE TABLE IF NOT EXISTS `VacanciesAdressPages` (
  `adress` varchar(100) NOT NULL,
  `page` varchar(50) NOT NULL,
  PRIMARY KEY (`adress`),
  UNIQUE KEY `adress_UNIQUE` (`adress`),
  KEY `fk_VacanciesAdressPages_2_idx` (`page`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `VacanciesAdressPages`
--

INSERT INTO `VacanciesAdressPages` (`adress`, `page`) VALUES
('Островского', '109-2_ostrovskogo_str'),
('Соколовка', '10b_svyazi_str_sokolovka'),
('Есенина', '13_yesenina_str'),
('Фирсова', '13_yesenina_str'),
('Луховицы', '170v_pushkina_str_luhovitsy'),
('Бутырки', '1v_3rd_butyrki_str'),
('Шабулина', '24b_directions_shabulina'),
('Зубковой', '27b_zubkovoy_str'),
('Верхняя', '50_verkhnyaya_str'),
('Черновицкая', '5_chernovitskaya_str'),
('Чкалова', '70b_chkalova_str'),
('Отдел информации', 'general_enquiries_department'),
('Отдел маркетинга', 'marketing_department'),
('Отдел комплектации', 'procurement_department'),
('Отдел продаж', 'sales_department'),
('ТЦ на Окружной', 'shopping_mall_on_the_city_ring_road'),
('Студия Мебели', 'studio_furniture_yesenina'),
('Окружная (Ангар)', 'the_185th_km_of_the_beltway_hangar');

-- --------------------------------------------------------

--
-- Структура таблицы `VacanciesForm`
--

DROP TABLE IF EXISTS `VacanciesForm`;
CREATE TABLE IF NOT EXISTS `VacanciesForm` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `vacancies` varchar(100) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `patronymic` varchar(50) NOT NULL,
  `dob` datetime NOT NULL COMMENT 'дата рождения',
  `bpl` varchar(100) NOT NULL COMMENT 'место рождения',
  `citizenship` varchar(100) NOT NULL COMMENT 'Гражданство',
  `placeOfResidence` text NOT NULL COMMENT 'Место жительства',
  `phone` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `marriage` int(10) unsigned NOT NULL,
  `children` varchar(200) NOT NULL,
  `military` int(10) unsigned NOT NULL,
  `conviction` int(10) unsigned NOT NULL,
  `car` int(10) unsigned NOT NULL,
  `carCategory` varchar(10) NOT NULL,
  `carExperience` varchar(10) NOT NULL,
  `education` text NOT NULL,
  `workPeriodStart1` datetime DEFAULT NULL,
  `workPeriodStop1` datetime DEFAULT NULL,
  `workPeriodStart2` datetime DEFAULT NULL,
  `workPeriodStop2` datetime DEFAULT NULL,
  `workPeriodStart3` datetime DEFAULT NULL,
  `workPeriodStop3` datetime DEFAULT NULL,
  `positions1` varchar(100) DEFAULT NULL,
  `positions2` varchar(100) DEFAULT NULL,
  `positions3` varchar(100) DEFAULT NULL,
  `organization1` varchar(200) DEFAULT NULL,
  `organization2` varchar(200) DEFAULT NULL,
  `organization3` varchar(200) DEFAULT NULL,
  `region1` varchar(100) DEFAULT NULL,
  `region2` varchar(100) DEFAULT NULL,
  `region3` varchar(100) DEFAULT NULL,
  `responsibility1` varchar(100) DEFAULT NULL,
  `responsibility2` varchar(100) DEFAULT NULL,
  `responsibility3` varchar(100) DEFAULT NULL,
  `income1` varchar(100) DEFAULT NULL,
  `income2` varchar(100) DEFAULT NULL,
  `income3` varchar(100) DEFAULT NULL,
  `reasonsForDismissal1` varchar(100) DEFAULT NULL,
  `reasonsForDismissal2` varchar(100) DEFAULT NULL,
  `reasonsForDismissal3` varchar(100) DEFAULT NULL,
  `sources` varchar(100) NOT NULL,
  `income` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '1',
  `managerComments` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_VacanciesForm_3_idx` (`vacancies`),
  KEY `fk_VacanciesForm_4_idx` (`status`),
  KEY `fk_VacanciesForm_2_idx` (`military`),
  KEY `fk_VacanciesForm_5_idx` (`conviction`),
  KEY `fk_VacanciesForm_6_idx` (`car`),
  KEY `fk_VacanciesForm_1_idx` (`marriage`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=242 ;

--
-- Дамп данных таблицы `VacanciesForm`
--

INSERT INTO `VacanciesForm` (`id`, `vacancies`, `surname`, `name`, `patronymic`, `dob`, `bpl`, `citizenship`, `placeOfResidence`, `phone`, `email`, `marriage`, `children`, `military`, `conviction`, `car`, `carCategory`, `carExperience`, `education`, `workPeriodStart1`, `workPeriodStop1`, `workPeriodStart2`, `workPeriodStop2`, `workPeriodStart3`, `workPeriodStop3`, `positions1`, `positions2`, `positions3`, `organization1`, `organization2`, `organization3`, `region1`, `region2`, `region3`, `responsibility1`, `responsibility2`, `responsibility3`, `income1`, `income2`, `income3`, `reasonsForDismissal1`, `reasonsForDismissal2`, `reasonsForDismissal3`, `sources`, `income`, `date`, `status`, `managerComments`) VALUES
(5, 'Менеджер по продажам', 'Кузьмина ', 'Татьяна', 'Владимировна', '1990-06-06 00:00:00', 'Рязань', 'РФ', 'Рязань , ул. Старая дубрава 1', '89106141639, 89209770300', 'Tatyana.kuzmina.90@bk.ru', 1, 'Нет', 3, 2, 2, 'В', '6 месяцев', 'Среднее специальное<br />\r\nРязанский Станкостроительный колледж<br />\r\n2005-2008 <br />\r\nБухгалтер- экономист                                                                                          ', '2010-03-01 00:00:00', '2011-10-01 00:00:00', '2011-12-01 00:00:00', '2012-05-01 00:00:00', '2012-10-01 00:00:00', '2013-03-01 00:00:00', 'Администратор', 'Продавец-консультант ювелирных изделий', 'Супервайзер', 'ИП Фомина А.В , м-н SELA', 'ИП Герасименко В.А., м-н Изумруд', 'Монекс Трейдинг ', 'Приморский край', 'Приморских край', 'Рязанский', 'обеспечение максимальных продаж при высоком качестве обслуживания, работа на кассе, прием товара', 'Работа с покупателями, , прием товара, мерчендайзинг, инвентаризации, работа на кассе', 'Работа с покупателями, контроль работы магазина, прием товара , отчетность, работа на кассе, ', '25000', '20000', '30000', 'Переезд в другой город', 'Переезд в другой город', 'Сократили вакансию', 'На вашем сайте', 'От 20000 рублей', '2013-09-30 01:46:27', 1, NULL),
(6, 'Менеджер по продажам', 'Смирнова', 'Екатерина', 'Сергеевна', '1990-08-18 00:00:00', ' Рязань', 'РФ', 'Рязань, ул. Весенняя, дом 11.', '8- 952- 128-07-04', 'skarlet.smirnova@yandex.ru', 2, 'нет', 3, 2, 2, 'нет', 'нет', 'высшее, Санкт-Петербургский университет управления и экономики, Государственное и муниципальное управление, менеджер', '2010-05-01 00:00:00', '2011-01-30 00:00:00', '2011-02-01 00:00:00', '2012-05-01 00:00:00', '2012-04-14 00:00:00', '2013-10-04 00:00:00', 'Кладовщик-раскладчик товара ', 'Инструктор(до июня 2011) Администратор-кассир игровой зоны ', 'Аниматор', 'ООО «Виктория» Кондитерская фабрика ', 'ООО ', 'ООО Рашн Энтертеймент групп Восток, Парк Развлечений ', 'Рязань', 'Рязань', 'Рязань', 'Снятие остатков товара на начало и конец смены;упаковка товара;распределение товара по накладным', 'Распределение звонков;продажа товара и услуг центра, предложение различных акций.', 'Разработка и проведение, развлекательных программ;продажа товара и услуг центра.', '8000-9000', 'от 16000', 'от 10000', 'по собственному', 'по собственному', 'по собственному', 'apelsin.ru', 'от 20000', '2013-10-02 01:32:19', 1, NULL),
(7, 'Кассир', 'Бреева', 'Татьяна', 'Сергеевна', '1991-05-04 00:00:00', 'Рязань', 'РФ', 'г. Рязань, ул. Зубковой, д. 26, кв. 409', '89537438394', 'tanusha_91_05@mail.ru', 1, 'Детей нет.', 3, 2, 2, 'нет', 'нет', 'Образование высшее; Рязанский филиал Московского университета МВД России; период обучения 2008-2013 гг. (очная форма обучения); специальность: Бухгалтерский учет, анализ, аудит; квалификация: экономист. ', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'сайт: 62.ru', '20000 т.р.', '2013-10-04 12:29:30', 1, NULL),
(8, 'Кассир', 'Кильянова', 'Анна', 'Михайловна', '1989-02-28 00:00:00', 'Рязань', 'Россия', 'г. Рязань,ул.Новоселов ', '8-920-630-43-67', 'anka_kil@mail.ru', 3, 'нет', 3, 2, 1, 'В', '5 лет', 'Среднее профессиональное (РТЭТ) Коммерсант. Не законченное высшее (РГУ) бух учет анализ аудит (заочное)', '2008-04-03 00:00:00', '2012-11-04 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'продавец', '', '', 'МП № 3', '', '', '', '', '', 'прием товара, продажа товара,работа с накладными', '', '', '', '', '', '', '', '', 'интернет', 'от 20000 р.', '2013-10-10 02:01:54', 1, NULL),
(9, 'Менеджер по продажам', 'Трубников', 'Никита', 'Сергеевич', '1993-10-31 00:00:00', 'Рязань', 'Россия', 'Приокский.', '8-953-744-59-99', 'trubnikoff.n@yandex.ru', 2, 'нет.', 2, 2, 1, 'B', '1  год', 'Средние ,  АГРОТЕХНОЛОГИЧЕСКИЙ УНИВЕРСИТЕТ ,Экономический факультет,Менеджмент, 2 курс.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'в лифте', '20000', '2013-10-14 12:01:59', 1, NULL),
(10, 'Менеджер по продажам', 'Титова', 'Светлана', 'Николаевна', '1976-04-19 00:00:00', 'город Бронницы', 'РФ', 'город Рязань', '8-920-971-44-11', 'snb-t2319@mail.ru', 1, 'двое,18 лет и 4 года', 3, 2, 1, 'В', '9 лет', 'Кооперативный техникум ,окончен в 1998 году ,специальность Бухгалтерский учет и аудит. С 2012 года Рязанский Институт Бизнеса и Управления ,специальност Бухгалтерский учет и анализ.', '1999-05-05 00:00:00', '2002-12-12 00:00:00', '2003-02-02 00:00:00', '2009-03-03 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'бухгалтер склада автомобильного имущества', 'зав.отделом(старший продавец)', '', 'Военный Автомобильный Институт', 'ЧП Пташкин', '', 'рязань', 'Рязань', '', 'бух.учет', 'продажа часов,документооборот,управление и подбор персонала', '', '2000 руб.', '15000 руб.', '', 'на другую работу', 'декретный отпуск', '', 'сайт', '20000', '2013-10-16 04:20:03', 1, NULL),
(11, 'Логист', 'Самохин', 'Назар', 'Михайлович', '1980-07-30 00:00:00', 'Рязань', 'РФ', 'Рязань', '+79109007109', 'casper@xakep.ru', 2, 'нет', 2, 2, 2, 'B', '12', 'МИЭМП\r\n1997-2002\r\nэкономический факультет, финансы и кредит', '2011-10-30 00:00:00', '2013-10-18 00:00:00', '2009-07-08 00:00:00', '2011-10-27 00:00:00', '2004-07-25 00:00:00', '2008-05-17 00:00:00', 'Логист', 'Заместитель директора', 'Логист/Товаровед/Снабженец', 'ООО "Деловые линии"', 'ООО "Инс-Марк"', 'ОАО "Нефтехиммашсистемы"', 'Рязанский, Калужский, Брянский, Смоленский, Орловский, РБ', 'Рязань', 'Рязань', 'Планирование маршрутов доставки груза по городу и области и многое др.', 'Разработка и регистрация Товарных знаков, поиск клиентов, заключение договоров, набор персонала и др', 'Своевременное обеспечение завода необходимым в производстве материалом, проведение тендеров и др', '30000', '35000', '20000', 'Отсутствие карьерного роста', 'Скучно', 'Переезд', 'Сайт компании', '30000-40000', '2013-10-23 01:52:01', 1, NULL),
(12, 'Работник склада', 'Александров', 'Александр', 'Евгеньевич', '1988-09-30 00:00:00', 'Ташкент', 'РФ', 'Рязань ул.Типанова дом20 кв3', '89537467479', 'wivil_uit_misst@mail.ru', 2, 'Нет', 1, 2, 2, '-', '-', 'Сренее специальное: колледж РЭНОК,2003-2006, Бухгалтер', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '.', '', '', '', '', '', '', '', '', '', '', '', '', 'от знакомых', 'от 20000р', '2013-10-23 07:40:57', 1, NULL),
(13, 'Кассир', 'Цепляева', 'Ольга', 'Анатольевна', '1972-11-26 00:00:00', 'г.Рязань', 'Россия', 'г.Рязань ул.Чкалова д.20 кв.29', '8910-644-09-36', 'tseplyaeva.olya@yandex.ru', 1, 'сын 17 лет', 3, 2, 2, 'нет', 'нет', 'Спту-7 1988-1991 портной женской легкой одежды ; учебный центр "АРТ" 2003 продавец-кассир ', '2013-01-10 00:00:00', '0000-00-00 00:00:00', '2012-10-13 00:00:00', '2013-01-10 00:00:00', '2006-08-10 00:00:00', '2012-07-16 00:00:00', 'администратор', 'кредитный специалист', 'от продавца-кассира до управляющего магазина', 'ООО', 'ОАО ', 'ЗАО ', 'Рязань', 'Рязань', 'Рязань', 'рабоиа с клиентами,организация рабого места,контроль за персоналом', 'оформление кредитных договоров', 'приемка и выкладка товара,работа на ККМ,проведение инвентаризаций,контроль работы персонала,ведение', '15000', '12000', '18000', 'не устраивает график работы', 'маленькая з/плата,не удобный график работы', 'тяжелые условия работы', 'из интернета(сайт 62.ru)', 'от18000', '2013-10-25 10:50:09', 1, NULL),
(14, 'Кассир', 'Афанасьева', 'Марина', 'Михайловна', '1986-08-01 00:00:00', 'Рязань', 'Россия', 'Рязань', '906-646-88-68', 'm.afanasjewa2011@yandex.ru', 1, 'один ребенок', 3, 2, 2, 'B', '5 лет', 'средне-специальное,ПТУ№40', '2007-12-10 00:00:00', '2013-04-19 00:00:00', '2006-12-07 00:00:00', '2007-10-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'продавец-кассир', 'продавец-кассир', '', 'ТС Галактика', 'ТД Барс', '', 'Рязань', 'Рязань', '', 'консультация покупателей,расчет на кассе,прием и выкладка товара', 'расчет на кассе,консультация покупателей', '', '11-13 тыс.', '9-11 тыс.', '', 'маленькая з.пл.', 'маленькая з.пл.,неудобный график', '', 'на сайте компании', 'от 16 тыс.', '2013-10-26 07:56:21', 1, NULL),
(15, 'Кассир', 'Волков ', 'Сергей ', 'Александрович', '1979-07-11 00:00:00', 'Рязанская область, г.Сасово', 'РФ', 'г.Рязань, ул.Свободы, д.52/2, кв.51', '89105729319', 'volkovs1979@mail.ru', 2, 'сын 14 лет', 1, 2, 2, 'нет', 'нет', 'Средне-специальное, Рязанский торгово-экономический техникум,1996-1998,Коммерсант', '2009-11-12 00:00:00', '2012-12-01 00:00:00', '2004-06-28 00:00:00', '2005-03-25 00:00:00', '2003-01-21 00:00:00', '2004-06-16 00:00:00', 'Старший кладовщик', 'начальник отдела снабжения', 'слесарь', 'ЗАО "ПетОйл"', 'ПБОЮЛ Коряев Р.М.', 'УМП ЖКХ "Глядковское"', 'г.Москва', 'г. Сасово', 'Сасовский район', 'Складской учет, контроль над подчиненными, документальная отчетность', 'обеспечение материалами строй объектов', 'Ремонтные работы', '30 000 т.р.', '25 000 т.р.', '12 000 т.р.', 'По собственному желанию', 'По собственному желанию', 'По собственному желанию', 'интернет', '25 000 т.р.', '2013-10-28 07:52:39', 1, NULL),
(16, 'Менеджер по продажам', 'Барсуков', 'Андрей', 'Александрович', '1992-03-29 00:00:00', 'Республика Кыргызстан', 'РФ', 'Московская область,Луховицкий район,село Горетово,дом 8', '8 968 594 97 46', 'barsukov_a@bk.ru', 2, 'детей нет', 1, 2, 1, 'B,C', '3 года', 'Среднее специальное,ОГБОУ СПО "Железнодорожный техникум"г.Рязань, с 2008 по 2012г,помощник машиниста электровоза, техник', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Часто покупая продукцию в ваших магазинах г.Рязани,услышал про открытие в г. Луховицы.', '25 000 - 30 000', '2013-10-30 09:47:23', 1, NULL),
(17, 'Работник склада', 'Мартыненко ', 'Владимир', 'Сергеевич', '1991-03-08 00:00:00', 'г.Шатлык', 'Российское', 'г. Рязань ул. Ленинского Комсомола д.19 кв.10', '89511005211 89209950016', 'vladimir.martynienko@yandex.ru', 1, 'дочь 3 года. сын 1год', 2, 2, 2, '-', '-', 'Средне специальное. Агротехнический техникум р. п. Старожилово.01.09.2008-30.06.2009 Тракторист машинист сельскохозяйственного производства. ', '2013-02-18 00:00:00', '2013-07-19 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'грузчик сборщик', '', '', 'ооо Персей', '', '', 'Рязань', '', '', 'погрузочно разгрузочные работы. сборка', '', '', '12000', '', '', 'маленькая зарплата', '', '', 'интернет', '20000', '2013-11-01 11:08:54', 1, NULL),
(18, 'IT-Специалист', 'Рябов', 'Павел', 'Александрович', '1989-09-20 00:00:00', 'Московская область, г.Балашиха', 'Россия', 'г.Рязань, ул.Интернациональная, 11-34', '89009065305', 'p.ryabov.net@mail.ru', 3, 'Нету', 1, 2, 1, 'В', '3 года', 'Высшее\r\nМосковский финансово юридический университет. Окончен в 2013г. Информатик-экономист, информационные системы в бухгалтерском учете.', '2009-11-09 00:00:00', '2010-05-21 00:00:00', '2010-08-18 00:00:00', '2013-10-31 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'грузчик', 'оператор склада', '', 'АСТ книготорговая компания', 'Абрис', '', 'Московская область, г.Балашиха', 'МО, г.Балашиха', '', 'прием-растановка товара', 'сборка, растановка товара, работа с накладными', '', '20000', '40000', '', 'нашел более оплачиваемую', 'смена места жительства', '', 'реклама', '30000', '2013-11-05 09:46:43', 1, NULL),
(19, 'Экспедитор', 'Ларин', 'Максим', 'Владимирович', '1993-06-28 00:00:00', 'г. Рязань', 'русский', 'г. Рязань ул. Новоселов д. 33 г кв. 37', '+79209758524', 'lar4ik3713@yandex.ru', 2, '-', 1, 2, 2, 'B/C', 'с 2011', 'среднее-специальное, РКЭ, очная, Техник', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'интернет', '25000', '2013-11-05 11:13:35', 1, NULL),
(20, 'Менеджер по продажам', 'Арапова ', 'Мария ', 'Анатольевна', '1989-10-17 00:00:00', 'Московская область,город Зарайск', 'РФ', 'Моск.обл.,город Зарайск', '89651677627', 'masha-arapova@mail.ru', 2, 'нет', 3, 2, 1, 'B', 'два года', 'Образование среднее-специальное."Учитель начальных классов и информатики". Учебное  заведение "Зарайский педагогический колледж.2005-2009 г."\r\n\r\n', '2009-09-03 00:00:00', '2010-05-26 00:00:00', '2011-01-26 00:00:00', '2011-03-09 00:00:00', '2013-03-01 00:00:00', '2013-11-05 00:00:00', 'офис-менеджер', 'офис-менеджер', 'менеджер-кассир', 'ООО Европрофиль', 'ооо Красный восток', 'ип.Сафонова Л.Ю магазин ', 'Москва', 'рф', 'Московская область,г.Зарайск', 'телефонные звонки,консультирование клиентов,программа 1С-торговля,продажи', 'выписки ', 'работа с клиентами,отпускать товар на кассе,работа в 1С торговля,', '17000 тысяч рублей', '10000', '19000 т.р', 'по собственному желанию', 'маленькая зарплата', 'работаю по сей день', 'из интернета', '25000', '2013-11-05 11:26:49', 1, NULL),
(21, 'Менеджер по продажам', 'Фролова', 'Алексей', 'Сергеевич', '1985-10-22 00:00:00', 'Луховицы', 'РФ', 'МО Луховицы ул. Жуковского 40-2', '89175398794', 'frol1036@rambler.ru', 1, 'нет', 2, 2, 1, 'B', '10', 'Высшее 4 года, инженер по самолетостроению', '2004-08-22 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Замиститель начальника отдела экспедиции кооперации', '', '', 'РСК МиГ', '', '', 'РФ', '', '', 'Договорная работа, логистика', '', '', '40000', '', '', '', '', '', 'интернет', '60000', '2013-11-08 03:31:35', 1, NULL),
(22, 'Менеджер по продажам', 'малахова', 'екатерина', 'николаевна', '1984-12-27 00:00:00', 'тамбовская обл. пос. первомайский', 'рф', 'рязань.ул. лен. комсомола 101 кв 111', '89537469401', 'kotya1984-84@bk.ru', 1, 'сын, 2.5 года', 3, 2, 1, 'в', 'менее года', 'высшее. ноувпо" санкт-петербургская академия управления и экономики", 2002-2007, менеджер', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 'ооо "позитив"', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'объявление', '25000', '2013-11-08 07:57:06', 1, NULL),
(23, 'Менеджер по продажам', 'Климентова ', 'Татьяна', 'Александровна', '1991-12-19 00:00:00', 'г.Луховицы', 'РФ', 'Московская область, г.Луховицы', '8-916-767-37-13', 'mafik.1991@inbox.ru', 1, 'нет', 3, 2, 2, 'нет', 'нет', 'Средне-специальное, повар-кондитер\r\nГпл №100\r\nс 2007 по 2010', '2013-03-06 00:00:00', '2013-10-28 00:00:00', '2012-08-21 00:00:00', '2013-02-11 00:00:00', '2012-04-12 00:00:00', '2012-08-15 00:00:00', 'кредитный специалист', 'оператор,официант,менеджер,курьер', 'продавец-консультант', 'ОАО "ОТП Банк"', 'ИП " Ивашкина" Суши ням', 'Магазин " Лакмин"', 'Московская обл. г.Луховицы', 'Московская обл. г. Коломна', 'Московская обл. г. Луховицы', 'заключение договоров,кретных карт,консультация клиентов', 'прием заказов,обслуживание клиентов.консультация клиентов,доставка заказа', 'выкладка товара,консультация клиентов.', '9000', '9500', '11000', 'маленькая заработная плата', 'маленькая зароботная плата,за большой объем выполняемой работы', 'ненормированный рабочий день', 'интернет', '18000', '2013-11-09 11:45:15', 1, NULL),
(24, 'Кассир', 'Климентова', 'Татьяна', 'Александровна', '1991-12-19 00:00:00', 'Московская обл. г.Луховицы', 'РФ', 'Московкая область город Луховицы', '8-916-767-37-13', 'mafik.1991@inbox.ru', 1, 'нет', 3, 2, 2, 'нет', 'нет', 'Средне- специальное\r\nГПЛ № 100\r\n2007-2010\r\nПовар-кондитер', '2013-03-06 00:00:00', '2013-10-28 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'кредитный-специалист', '', '', 'ОАО ', '', '', 'Московская обл. г Луховицы', '', '', 'Консультация клиентов,заключение договоров,оформление кредитных карт.', '', '', '', '', '', '', '', '', 'из интернета', '18000', '2013-11-09 11:53:55', 1, NULL),
(25, 'Менеджер по продажам', 'Халдеев', 'Дмитрий', 'Владимирович', '1994-06-12 00:00:00', 'г.Рязань', 'РФ', 'Ул.Островского д.37/16 кв 27', '89206320483', 'demon.age@mail.ru', 2, 'Нет', 1, 2, 2, 'нет', 'нет', 'Среднее специальное. 2009-2012. Оператор ПК, монтажник РЭАиП.', '2013-09-28 00:00:00', '2013-11-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'грузчик', '', '', 'апельсин', '', '', 'рязань', '', '', 'разгрузо-погрузочные работы', '', '', '28000', '', '', 'по собственному ', '', '', 'от друга', 'от 20000', '2013-11-10 04:02:47', 1, NULL),
(26, 'Менеджер по продажам', 'Анастасьина', 'Екатерина', 'Витальевна', '1992-06-02 00:00:00', 'Рязань', 'РФ', 'г. Рязань, ул. Бирюзова, д.6,к.1, кв.31', '8-951-102-15-37', 'katya6221@yandex.ru', 2, 'Нет', 3, 2, 2, 'Нет', 'Нет', 'Рязанский техникум пищевой промышленности, общественного питания и сервиса. Специальность "Товароведение" Окончила в 2013 году. ', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Газета "Работа+Обучение"', 'от 15 000 руб.', '2013-11-12 11:17:28', 1, NULL),
(27, 'Кассир', 'Пичугина', 'Татьяна ', 'Юрьевна', '1990-11-21 00:00:00', 'Г. Шацк', 'РФ', 'г.Рязань, ул. Черновицкая, д.34, кор.2, кв.63', '8 951 104 66 32', 'pi4uginatania@yandex.ru', 2, 'детей нет', 3, 2, 2, 'В', 'нет', 'Среднее профессиональное, РГТК, 2008-2010, Специальность: экономика и бухгалтерский учет,\r\nКвалификация: бухгалтер.\r\nВысшее, МГУТУ,2010-2013, \r\nСпециальность: финансы и кредит,\r\nКвалификация: экономист.', '2010-10-01 00:00:00', '2011-08-31 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'менеджер-кассир', '', '', 'ИП Фроликова магазин "Все для дома"', '', '', 'Рязанская обл., г. Шацк', '', '', 'Работа на кассе, раскладка товара, консультирование клиентов', '', '', '7000', '', '', 'Переезд в Рязань', '', '', 'из газеты "Ярмарка"', '17000', '2013-11-12 11:30:09', 1, NULL),
(28, 'Менеджер по продажам', 'Коптелова', 'Ольга', 'Витальевна', '1995-08-05 00:00:00', 'Тамбовская область,г.Мичуринск.', 'РФ', 'г.Рязань.ул.Зубковой.дом 4,корпус 1', '89066484465', 'sweeeeeet57@gmail.com', 2, 'Нет детей', 3, 2, 2, 'Нет прав', 'Нет стажа', 'Среднее ,не оконченное(учусь заочно).Российский университет кооперации.Технолог кондитерских и макаронных изделий', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Интернет', 'От 15 тысяч', '2013-11-14 03:30:15', 1, NULL),
(29, 'Работник склада', 'скибина', 'оксана ', 'викторовна', '1979-04-26 00:00:00', 'рязань', 'рф', 'рязань,зубкова 17', '89209900699', 'n-o-t-y-a0203@mail.ru', 2, 'нет', 3, 2, 2, 'в,с,д,екар', '13 лет', 'инженер-строитель,ккмсх,1996-1999', '2000-02-10 00:00:00', '2013-09-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'водитель троллейбуса', '', '', 'муп урт', '', '', 'рязань', '', '', 'пассажироперевозки', '', '', '27000', '', '', 'личного характера', '', '', 'интернет', '30000', '2013-11-15 11:55:35', 1, NULL),
(30, 'Логист', 'Бабаев', 'Александр', 'Андреевич', '1989-05-13 00:00:00', 'Рязань', 'Российское', 'Рязань', '89209845901', 'alex13sb@list.ru', 2, 'нет', 2, 2, 1, 'B', '1', 'МЭСИ (Московский Государственный Университет Экономики, Статистики и Информатики). 2006-2011.\r\nФинансы и кредит.', '2012-04-16 00:00:00', '2013-03-04 00:00:00', '2011-11-07 00:00:00', '2011-12-06 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Логист', '2)	Помощник заместителя генерального директора по производству', '', 'ООО Центр-Авто', 'ООО “Москва-Втормет”', '', '', '', '', '	Размещение квот на  а/м у импортера 	Контроль движения и сроков поставки а/м от импортера 	Своев', '	Контроль за эффективностью РЕП на ВЧМ. Монитор РЕП-в; 	Подготовка плана по подразделениям (цехам ', '', '25000', '4000', '', 'По собственному желанию', 'Не выплата з/п', '', 'Интернет', '25000', '2013-11-15 02:24:56', 1, NULL),
(31, 'Кассир', 'Анискина', 'Ирина', 'Сергеевна', '1985-12-25 00:00:00', 'город Рязань', 'РФ', 'Рязань, ул Сельских строителей д 6 корп 1 кв 19', '8-900-910-87-26', 'iri-aniski@yandex.ru', 2, 'нет', 3, 2, 2, 'в', '0', 'высшее, РИ МГОУ, 2003-2008, Экономика и управление на предприятии машиностроения, экономист', '2008-06-16 00:00:00', '2010-11-10 00:00:00', '2010-11-16 00:00:00', '2013-11-15 00:00:00', '2013-11-01 00:00:00', '2013-11-01 00:00:00', 'старший специалист по выплатам', 'старший продавец', 'НЕТ', 'ОАО Росгосстрах', 'ООО "Связь-центр"', 'НЕТ', 'Рязань', 'Рязань', 'НЕТ', 'расчет компенсационных выплат по договором страхования, заключенным до 01.01.1992 г, обучение сотруд', 'учет наличных денег, работа с поставщиками, составление товарных отчетов,', 'НЕТ', '15000-18000', '15000-20000', 'НЕТ', 'по собственному желанию', 'работаю по наст время', 'НЕТ', 'была клиентом магазина', '25000', '2013-11-17 03:10:07', 1, NULL),
(32, 'Логист', 'Анискина', 'Ирина', 'Сергеевна', '1985-12-25 00:00:00', 'Рязань', 'РФ', 'г.Рязань,ул.Сельских строителей,д.6,корп.1,кв.19', '8-900-910-87-26', 'iri-aniski@yandex.ru', 2, 'нет ', 3, 2, 2, 'B', '0', 'высшее,РИ МГОУ,очная,Экономика управления на предприятии машиностроения,экономист', '2008-06-16 00:00:00', '2010-11-10 00:00:00', '2010-11-16 00:00:00', '2013-11-15 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'главный специалист по выплатам', 'старший продавец', 'НЕТ', 'Расчетный центр компенсационных выплат "Росгосстрах"', 'ООО "Связь-центр"', 'НЕТ', 'Рязань', 'Рязань', 'НЕТ', 'расчет компенсационных выплат по договором страхования, заключенным до 01.01.1992 г, обучение сотруд', 'учет наличных денег, работа с поставщиками, составление товарных отчетов,', 'НЕТ', '15000-18000', '15000-20000', 'НЕТ', 'по собственному желанию', 'по собственному желанию', 'НЕТ', 'была клиентом магазина', '25000', '2013-11-17 03:19:51', 1, NULL),
(33, 'Оператор отдела маркетинга', 'Корнаухов', 'Артём', 'Викторович', '1979-08-31 00:00:00', 'Рязань', 'Россия', 'Рязань ул Попова д22/51 кв 34', '8-951-102-81-79', 'corn.a2011@yandez.ru', 1, 'Дочь 7 лет', 1, 2, 1, '"В"', '12 лет', 'Рязанский филиал военного университета связи. Обучение 1996-2001, инженер систем связи и средств  коммутации. ', '2001-07-26 00:00:00', '2006-06-24 00:00:00', '2007-02-21 00:00:00', '2013-10-11 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Офицер ВС РФ', 'Менеджер закупок категории строительных материалов', '', 'ВС РФ', 'Гипермаркет Стройка', '', 'Калининградская обл. Россия', 'Рязань', '', 'Обязанности согласно контракта', 'Поддержание товарного запаса своей категории товара', '', '6000 р', '30000', '', 'Окончание контракта', 'По собственному желанию /Далеко/', '', 'Объявление в интернете', 'от 40000 руб', '2013-11-18 02:21:57', 1, NULL),
(34, 'Менеджер по продажам', 'Фомин', 'Николай', 'Сергеевич', '1992-09-21 00:00:00', 'Рязань', 'РФ', '3и Бутырки дом 1 кв 106.', '89537424143', 'koldun62@yandex.ru', 2, 'Нет.', 2, 2, 1, 'B', '5 месяцев', 'Средне-специальное. Техникум пищевой промышленности общественного питания и сервиса города Рязани. Повар, кондитер.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Работник сети магазинов Апельсин.', '30000', '2013-11-18 09:22:13', 1, NULL),
(35, 'Кладовщик', 'Булгаков ', 'Олег', 'Сергеевич', '1983-01-29 00:00:00', 'Россия Г.Рязань', 'российское', 'г.Рязань ул. новикова-прибоя д.24 кор.2 ', '89009054064', 'olegcoo@yandex.ru', 3, 'нет', 3, 2, 2, 'нет', 'нет', '\r\nРоссийский новый университет \r\n2010 год\r\nВысшее\r\nПрикладная информатика в экономике\r\nКорпоративные информационные системы\r\nЗаочная\r\n\r\nРКЭ (Рязань)\r\n2006 год\r\nСреднее специальное\r\nКомпьютеры, комплексы, системы и сети\r\nДневная/Очная\r\n', '2012-04-26 00:00:00', '2013-03-22 00:00:00', '2008-06-26 00:00:00', '2012-04-19 00:00:00', '2007-05-22 00:00:00', '2008-05-15 00:00:00', 'Старший кладовщик, менеджер по продажам', 'Совладелец производства ', 'начальник склада', 'ооо "Проминструмент", г.Рязань', 'ИП "Недорезов" изготовление мебели', 'ТК "Русь"', 'Рязань', 'Рязань', 'рязань', 'Прием, отгрузка, выкладка товара. Полная инвентаризация, обновление базы. Анализ рынка и подбор това', 'Заказ материалов, изгатовление и установка корпусной мебели и кухонь. Прием заказов и замеры. Анализ', 'Обеспечения приема и отгрузки товара, а также полная ривизия и учет товара', '20000р.', '25000р.', '18000р', 'плохое материальное состояние компании', 'кризис', 'развал организации', 'интернет(официальный сайт компании)', 'от 20000р', '2013-11-19 02:40:16', 1, NULL),
(36, 'Экспедитор', 'Капралов', 'Дмитрий', 'Сергеевич', '1985-09-20 00:00:00', 'Рязань', 'РФ', 'г. Рязань, ул. Зубковой д. 18 корп. 3', '8-920-635-44-52', 'pixilated@ya.ru', 3, 'нет', 3, 2, 1, 'B', '3 года', 'Среднее специальное. Профессиональный лицей №39 , г. Рязань. 2002-2003 Специальность: Монтажник, сборщик радио аппаратуры и приборов.\r\nНеполное высшее: Рязанский государственный университет имени С.А. Есенина , г. Рязань. 2011-2015 Специальность: Юриспруденция. Форма обучения: Заочная.', '2012-08-01 00:00:00', '0000-00-00 00:00:00', '2007-03-01 00:00:00', '2009-12-01 00:00:00', '2006-05-01 00:00:00', '2006-11-01 00:00:00', 'Оператор автоматических и полуавтоматических линий и станков ', 'Экспедитор, кладовщик', 'Сборщик радио аппаратуры и приборов', 'ООО ', 'ООО ', 'ОАО завод ', 'Рязань', 'Рязань', 'Рязань', 'сборка изделий из ПВХ, Контроль качества готовых изделий из ПВХ, настройка компьютера.', 'Сопровождение алкогольной продукции', 'Сборка радиоэлектронной аппаратуры', '28000', '25000', '4000', 'сокращение штата', 'ликвидация фирмы', 'Низкая заработная плата', 'Реклама в лифте', '25000', '2013-11-25 06:54:59', 1, NULL),
(37, 'Менеджер по продажам', 'Москвитин', 'Алексей', 'Дмитриевич', '1995-09-20 00:00:00', 'г.Рязань', 'РФ', 'гор.Рязань ул.Семинарская дом 35 корп.1 кв.62', '89521280502', 'lexa-moskvitin@yandex.ru', 2, 'не имею', 2, 2, 2, 'B.C', '1 месяц', 'Среднее полное общее образование\r\nШкола №39\r\n2002г-2013г', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'От знакомых', '20,000', '2013-11-26 11:31:33', 1, NULL),
(38, 'Менеджер по продажам', 'Козлов', 'Илья', 'Андреевич', '1991-07-30 00:00:00', 'Рязанская обл., Пронский район, г. Новомичуринск', 'РФ', 'г. Рязань,ул. Советской Армии,28/7, кв. 64', '89511048885', 'lye11owl@mail.ru', 3, 'не имею', 1, 2, 2, 'нет', 'нет', 'среднее полное', '2013-03-05 00:00:00', '2013-05-13 00:00:00', '2013-06-01 00:00:00', '2013-11-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'специалист по продажам', 'монтажник вентиляций и металлоконструкций', '', 'Дом.ру', 'ООО “Техстрой”', '', '', '', '', 'активное привлечение новых клиентов, консультация абонентов, приём платежей, работа с кассой и 1С ', 'сборка и установка металлоконструкций, прокладка вентиляционных труб и их изоляция', '', '15000 руб.', '22000 руб.', '', 'не устраивала з/п', 'не всегда была работа, не официальное трудоустройство,поэтому дни, когда не было работы не оплачивал', '', 'реклама', 'от 23000 рублей', '2013-11-26 12:52:12', 1, NULL),
(39, 'Менеджер по продажам', 'Николаев ', 'Станислав', 'Вячеславович', '1987-06-11 00:00:00', 'Рязань', 'Российское', 'ул.Бирюзова д.31/1 кв.233', '8 953 744 13 87', 'mild621987@mail.ru', 2, 'нет', 2, 2, 2, 'нет', 'нет', 'среднее полное', '2013-01-12 00:00:00', '2013-11-12 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'менеджер розничных продаж', '', '', 'ИП Бугаков', '', '', '62', '', '', 'консультирование и продажи', '', '', '17000', '', '', 'обманывал управляющий', '', '', 'интернет', '25000', '2013-11-27 11:25:35', 1, NULL),
(40, 'Менеджер по продажам', 'Малюгин', 'Дмитрий', 'Юрьевич', '1987-10-03 00:00:00', 'Московская область,г.Коломна', 'Россия', 'Московская обл.,Гор.Коломна.', '89295734735', 'dimansi8710@mail.ru', 2, 'НЕТ', 2, 2, 1, 'В', '3 года', 'Среднее специальное\r\n2006 год\r\nКолледж Экономики и ПРАВА\r\nМенеджмент\r\nСпециальность:\r\nМенеджер\r\n*******\r\n\r\nОбразование:\r\nВысшее\r\nс 2006 по\r\n2009 год\r\nИнститут Администрирования Международного ТурИзма\r\n"Специалист по сервису и туризму"\r\nКурсы менеджеров с 30 апреля по 02 июля 2010 г. по специальности "МЕНЕДЖМЕНТ ОРГАНИЗАЦИИ"', '2013-10-17 00:00:00', '2013-11-28 00:00:00', '2013-03-05 00:00:00', '2013-07-10 00:00:00', '2013-07-10 00:00:00', '2013-09-10 00:00:00', 'Менеджер по работе с клиентами', 'Менеджер по работе с клиентами', 'Машинист упаковочно-фасовочных машин', 'ООО "ТехноСАТ"', 'ООО "Лидер"', 'ООО "РусКО"', 'Коломна', 'Коломна', 'Коломна', 'Выезд к клиенту,заключение договоров,проверка работоспособности систем видеонаблюдения.', 'Выезд к клиенту, презентация продукции, проведение переговоров, заключение договоров.', 'Фасовка готового продукта', '12000', '15000', '16400', 'Не официальное оформление', 'Не официальное оформление', '', 'www.job-mo.ru', '30000', '2013-11-27 12:45:16', 1, NULL),
(41, 'Менеджер по продажам', 'Канунников', 'Стефан', 'Александрович', '1991-02-06 00:00:00', 'г.Рязань', 'Гражданин РФ', 'г.Рязань ул.Интернациональная д.16 кв.114', '8-953-747-56-03', 'stefanok@inbox.ru', 3, 'Сын 5 лет', 2, 2, 1, 'B', '3 года', 'Среднепрофессиональное, Федеральное государственное бюджетное образовательное учреждение высшего профессионального образования "Рязанский государственный радиотехнический университет"\r\n3 года\r\nПравоведение/юрист', '2010-04-24 00:00:00', '2011-07-28 00:00:00', '2011-08-05 00:00:00', '2012-06-04 00:00:00', '2012-09-14 00:00:00', '2013-06-18 00:00:00', 'Оператор узла посыпки', 'Торговый представитель/менеджер по продажам', 'Торговый представитель/менеджер по продажам', 'ООО "Завод Тезнофлекс"', 'И.П.Баширов Торговая фирма "Ледяной дом"', 'ООО "Радуга"', 'г.Рязань', 'г.Рязань , Рязанская область', 'г.Рязань, Рязанская область', 'Контроль процесса работы на участке производства рулонной кровли.', 'Поддержание и развитие клиентской базы, ведение переговоров, анализ остаков товара и т.д.', 'Поддержание и развитие клиентской базы, ведение переговоров, анализ остаков товара.', '27000', '21000', '25000', 'Смена руководства,уменьшение заработной платы и ухудшение условий труда.', 'По собственному желанию.', 'По собственному желанию.', 'Уже давно хотел попробовать устроиться работать в апельсин. А так из интернета.', '25000', '2013-11-27 04:17:06', 1, NULL),
(42, 'Менеджер по продажам', 'Сенюшкин', 'Александр', 'Алексеевич', '1993-05-07 00:00:00', 'г.Рязань', 'РФ', 'г.Рязань Шереметьевский проезд дом18 ', '89209525431', 'alexander.senyushkin@yandex.ru', 2, 'нет', 2, 2, 1, 'нет', 'нет', 'Рязанский колледж электроники\r\n1.09.2010-30.06.2013\r\nтехническое обслуживание средств вычислительной техники и компьютерных сетей', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'сайт', '20000', '2013-11-29 03:45:54', 1, NULL),
(43, 'Менеджер по продажам', 'Лазуткин', 'Дмитрий', 'Игоревич', '1986-12-27 00:00:00', 'Рязань', 'РФ', 'Рязань', '89209758763', 'toy66@mail.ru', 1, 'нет', 1, 2, 1, 'В', '5 лет', 'РГУ имени С.А.Есенина, очно-заочное, Специалист по сервису и туризму', '2008-09-01 00:00:00', '2011-10-01 00:00:00', '2011-09-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Специалист по производству мебели', 'Помощник руководителя', '', 'мебельная фабрика ', 'Частное предприятие', '', 'Рязань', 'Рязань', '', 'производство мебели, обучение персонала, контроль продукции', 'закупка стройматериалов, руководство бригадой, специалист по покраске', '', '', '', '', '', '', '', 'Интернет', '28 т.р.', '2013-12-04 01:14:09', 1, NULL),
(44, 'Работник склада', 'Носова ', 'Алина', 'Александровна', '1993-03-11 00:00:00', 'г. Зарайск', 'русская', 'Москковская область, г. Зарайск, пос. ЗЗСМ д. 13 кв. 8', '8-968-924-25-14', 'lina.nosova.93@mail.ru', 2, 'нет', 3, 2, 2, 'в', '1 год', 'средне-специальное, ГОУ НПО ПУ №85, 2008-2011, секретарь машинистка', '2011-02-08 00:00:00', '2013-06-12 00:00:00', '2013-07-20 00:00:00', '2013-10-21 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'упаковщик', 'продавец', '', 'ООО "Евро-Профиль"', 'ИП Михайлова', '', 'г. Зарайск, ул. Привокзальная д.1', 'г. Зарайск, пл. Революции д.1', '', 'качественная упаковка продукции', 'продажа носочно - чулочных изделий', '', '12000-13000', '8000', '', 'маленькая оплата труда', 'прекращение торговой деятельности', '', 'яндекс', '20000', '2013-12-08 05:28:32', 1, NULL),
(45, 'Кассир', 'Писаревская ', 'Наталья', 'Александровна', '1983-03-01 00:00:00', 'г.Рязань', 'РФ', 'г.Рязань,ул.Большая', '89209571336', 'pisareskaya.1983@mail.ru', 3, 'дочь,12 лет', 3, 2, 1, 'В', '2 ГОДА', 'СРЕДНЕЕ', '2006-07-19 00:00:00', '2008-02-18 00:00:00', '2008-03-06 00:00:00', '2012-08-01 00:00:00', '2012-10-01 00:00:00', '2013-11-13 00:00:00', 'кассир', 'Касир-продавец', 'Продавец', 'ООО "СТЕЛС"', 'ООО "ТД БАРС"', 'ООО "КАЛИНКА"', '', '', '', '', '', '', '', '', '', 'по собственному желанию', 'по собственному желанию', 'по собственному желанию', 'на вашем сайте ', 'от 16.000т.р.', '2013-12-09 01:14:12', 1, NULL),
(46, 'Кассир', 'Пимкина', 'Юлия', 'Павловна', '1986-10-26 00:00:00', 'Рязань', 'РФ', 'г.Рязань, ул.Интернациональная, д. 19,кор.1, кв. 114', '8-930-88-44-6-44', 'jule_4ka@bk.ru', 2, 'детей нет', 2, 2, 2, 'В', 'нет', 'Средне-специальное\r\nПроф.училище № 11\r\n1.09.2001г.-21.06.2004г.\r\nПарикмахер-универсал', '2011-05-28 00:00:00', '2011-12-30 00:00:00', '2011-09-21 00:00:00', '2013-04-20 00:00:00', '2013-04-20 00:00:00', '2013-11-22 00:00:00', 'Продавец-консультант-кассир', 'Диспетчер', 'Оператор', 'магазин "Канц Хаус"', 'Калина-такси', 'трансферная компания "Трансфер"', 'Рязань', 'Рязань', 'Рязань', 'Продажа канцтоваров', 'Прием звонков,распределение заказов', 'Прием звонков,консультирование клиентов,документация', '12.000р', '12.000р', '12.000р', 'Смена директора,закрытие магазина', 'Долго болела,работала на дому', 'Маленькая зарплата, (на телефоне сидела круглосуточно,без выходных)', 'На Вашем официальном сайте', 'от 20.000р', '2013-12-09 03:18:25', 1, NULL),
(47, 'Менеджер по продажам', 'Гоголев', 'Алексей', 'Анатольевич ', '1987-08-01 00:00:00', 'г Текели ', 'РФ', 'г Рязань ', '8 964 161-47-57', 'zanimaster@mail.ru', 1, 'Лиза и Артем ', 3, 2, 2, 'м', '3', 'пгттк', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'реклама в лифте ', '25000-3000', '2013-12-10 12:35:07', 1, NULL),
(48, 'Кассир', 'Васюкова', 'Марина', 'Викторовна', '1983-03-02 00:00:00', 'г. Сасово Рязанской области', 'РФ', 'г.Рязань ул.Тимуровцев д.11,кв.26.', '89537446063', 'vmv198383@mail.ru', 2, 'Нет', 2, 2, 2, 'В', '6 лет', '1) г.Балашиха ФГОУ ВПО Российский государственный аграрный заочный университет\r\n2002-2006 г.\r\n"Коммерция(торговое дело)"\r\n\r\n2)ФГОУ СПО Сасовский сельскохозяйственный техникум\r\n1998-2201 г.\r\n"Экономика,бухгалтерский учет,контроль и анализ хозяйственной деятельности".\r\n', '2012-07-23 00:00:00', '2013-10-04 00:00:00', '2011-07-01 00:00:00', '2012-06-30 00:00:00', '2005-04-14 00:00:00', '2009-07-27 00:00:00', 'Старший продавец', 'Оператор связи по оказанию сервисных услуг', 'Оператор связи по оказанию сервисных услуг', 'ООО ', 'ООО ', 'ОАО ', 'Рязань', 'Сасово ', 'Сасово', 'Приемка товара, работа с документацией, раскладка товара, работа на кассе, консультирование клиентов', 'Работа на кассе (прием платежей, предоставление услуг связи населению)', ' Работа с физ. и юрид. лицами ( заключение договоров, ведение базы данных, работа с претензиями )', '', '', '', '', '', '', 'Из Интернета на официалном сайте Апельсин.', 'от 17000 руб.', '2013-12-10 09:25:55', 1, NULL),
(49, 'Кассир', 'Теньгаева', 'Анастасия', 'Александровна', '2013-10-09 00:00:00', 'Рязань', 'РФ', 'г.Рязань, ул. Зубковой ', '8-920-954-59-22', 'kudryawkan@mail.ru', 2, 'нет', 3, 2, 2, 'В', '3 года', 'Высшее, Московский Государственный Университет Леса, 2005-2011, инженер садово-паркового строительства', '2013-05-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-01-10 00:00:00', '2012-08-27 00:00:00', 'Бармен-кассир', 'Специалист', 'Менеджер', 'WokShop', 'МТС-Банк', 'ЛидМашина', 'Рязань', 'Рязань', 'Рязань', 'Работа с кассой, приготовление напитков', 'Обеспечение сервисного обслуживания (консультационные услуги)', 'Продажа услуг компании, частичное ведение документооборота', '20000 руб.', '25000 руб.', '23000', 'Понижение заработной платы', 'Поступило предложение более привлекательного место работы', 'Слишком большой объем работы', 'интернет', '20000', '2013-12-12 08:25:23', 1, NULL),
(50, 'Менеджер по продажам', 'Осадчий ', 'Игорь', 'Станиславович', '1985-12-10 00:00:00', 'Азербайджанская ССР г.Баку', 'РФ', 'Рязань Михайловское шоссе д.250', '89537352206', 'igor_101285@mail.ru', 1, 'нет', 2, 2, 1, 'в', '1,5', 'высшее РГАЗУ г.Балашиха, торговое дело\r\n2006 - 2009', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'оператор по ассортименту', 'Слесарь по ремонту и обслуживанию газового оборудования', 'товаровед', 'ТД Перекресток', 'ООО "Сасовские тепловые сети"', 'ООО "Копейка-Москва"', 'Рязанская обл. г.Сасово', 'Рязанская обл. г. Сасово', 'Рязанская обл. Сасово', 'мерчендайзинг,', 'ремонт и обслуживание газового оборудования', 'приемка товара по количеству и качеству, работа с документами, заказ товара, в подчинении 5 чел', '12000', '10000', '12000-15000', 'по собственному желанию', 'семейные обстоятельства', 'по собственному желанию', 'из объявления ', 'от 25000', '2013-12-13 01:04:56', 1, NULL),
(51, 'Оператор отдела маркетинга', 'Юдина', 'Ирина', 'Алексеевна', '1983-03-18 00:00:00', 'с.Пертово Рязанской области', 'РФ', 'г.Рязань касимовское шоссе д.48 к5 кв9', '89009094235', 'irinaydar@mail.ru', 1, '2 детей 12лет и 4 года', 3, 2, 1, 'В', '6 месяцев', 'среднее специальное,профессиональный лицей №11 с 1999 по 2001 кассир с бух.учетом', '2008-01-22 00:00:00', '2009-01-29 00:00:00', '2012-01-18 00:00:00', '2012-04-25 00:00:00', '2012-10-08 00:00:00', '2013-10-16 00:00:00', 'продавец-консультант', 'продавец-кассир', 'помощник воспитателя', 'ООО ', 'ООО ', 'МБДОУ ', 'рязань', 'рязань', 'рязань', 'работа в торговом зале,консультация покупателей,работа с денежными средствами', 'выставка товара в зале консультация покупателей,работа на кассе', 'работа с детьми', '12000', '10000', '5000', 'сокращение', 'график с ночными сменами', 'маленькая з/п', 'сайт апельсина раздел Вакансии', '15000-22000', '2013-12-17 11:10:04', 1, NULL),
(52, 'Кассир', 'Юдина', 'Ирина', 'Алексеевна', '1983-03-18 00:00:00', 'с Пертово Рязанской области', 'РФ', 'Рязань Касимовское шоссе д.48 к5 кв9', '89009094235', 'irinaydar@mail.ru', 1, '2 детей 12 лет и 4 года', 3, 2, 1, 'B', '6 месяцев', 'средне специальное проф.лицей №11 кассир с бух.учетом', '2008-01-22 00:00:00', '2009-03-31 00:00:00', '2012-01-18 00:00:00', '2012-04-25 00:00:00', '2012-10-08 00:00:00', '2013-10-16 00:00:00', 'продавец консуультант', 'продавец кассир', 'помошник воспитателя', 'ООО "Флигель" тд НИТИ', 'ООО "Алфавит"', 'МБДОУ "Детский сад №138"', 'рязань', 'рязань', 'рязань', 'работа в торговом зале с покупателями..работа с денежными средствами,принятие участие в коллективной', 'работа на кассе и покупателями выкладка товара', 'работа с детьми', '12000', '10000', '5000', 'сокращение', 'график с ночными сменами', 'маленькая з/п и устроить ребенка в сад', 'сайт Апельсина раздел Вакансии', '15000-22000', '2013-12-17 11:22:48', 1, NULL),
(53, 'Менеджер по продажам', 'Климанов', 'Дмитрий', 'Игоревич', '1986-08-25 00:00:00', 'Рязань', 'Российское', 'г. Рязань, ул. Черновицкая', '89206315191', 'dmitrii.klimanov@mail.ru', 3, 'нет', 2, 2, 1, 'B', '2 года', 'ПЛ № 40, 2004-2006гг., повар.', '2006-06-01 00:00:00', '2007-07-01 00:00:00', '2007-07-01 00:00:00', '2012-05-30 00:00:00', '2012-06-01 00:00:00', '0000-00-00 00:00:00', 'менеджер по продажам', 'отделочник', 'Повар', 'магазин "Эксперт"', '', '"Звезда Магриба"', 'Рязань', 'Рязань', 'Рязань', 'продажа бытовой техники', 'внутренняя отделка помещений', '', '', '', '', '', '', '', 'сайт компании.', 'от 25000 р.', '2013-12-18 12:24:36', 1, NULL),
(54, 'Работник склада', 'Пенкин', 'Андрей', 'Николаевич', '1984-08-31 00:00:00', 'с. Криуша, Клепиковского района, Рязанской области', 'Российское', 'г. Рязань, пр-д Грибоедова, д.5А, кв.35', '9106451738', 'penkandr@yandex.ru', 2, 'нет', 1, 2, 2, '-', '-', 'Рязанский государственный радиотехнический университет\r\n2010-2014 гг.\r\nАвтоматизация технологических процессов и производств', '2013-10-01 00:00:00', '2013-12-09 00:00:00', '2012-06-01 00:00:00', '2013-09-30 00:00:00', '2011-06-03 00:00:00', '2012-05-31 00:00:00', 'Специалист отдела мониторинга текущей задолженности', 'Специалист экспертного отдела', 'Специалист информационного отдела', 'ОАО МТС Банк', 'ОАО МТС', 'ОАО МТС', 'Рязань', 'Рязань', 'Рязань', 'Взыскание просроченной задолженности с клиентов банка', 'Техническая поддержка пользователей домашнего интернета', 'Информационная поддержка клиентов компании', '21600 рублей', '21600 рублей', '15000 рублей', 'Не интересна сфера деятельности', 'Реорганизация отдела', 'Переход в другой отдел', 'сайт компании', '20000 рублей', '2013-12-18 03:01:22', 1, NULL),
(55, 'Менеджер по продажам', 'Жукова', 'Елена', 'Алексеевна', '1984-05-16 00:00:00', 'село Александрово Рязанская область', 'РФ', 'Рязанская обл,Рязанский р-он,село Александрово,ул.Центральная,д.17 кв.7', '89537496690', '7elna@rambler.ru', 1, '2002-02-25, 2009-11-11.', 3, 2, 1, 'в', '8 лет', 'Среднее-полное.', '2007-04-20 00:00:00', '2012-06-13 00:00:00', '2012-07-13 00:00:00', '2013-05-12 00:00:00', '2013-08-13 00:00:00', '2013-12-31 00:00:00', 'раскройщица', 'продавец-консультант', 'менеджер по продаже дверей', 'КожПромМебель', 'Ангстрем', 'Управдом', 'Рязанский', 'Рязанский', 'Рязанский', 'раскрой кожи на чехлы для диванов.', 'продажа корпусной мебели,оформление договоров,работа с кассой.', 'продажи,оформление договоров,работа по стандартам.', '15000', '14000', '15000', 'далеко от дома', 'низкий доход', 'график.', 'интернет', '25000-30000', '2013-12-18 09:07:17', 1, NULL),
(56, 'Кассир', 'Пимкина', 'Юлия', 'Павловна', '1986-10-26 00:00:00', 'Рязань', 'РФ', 'г.Рязань, ул.Интернациональная, д.19, кор.1, кв.114\r\n(Канищево)', '8-930-88-44-6-44', 'jule_4ka@bk.ru', 2, 'Детей нет', 2, 2, 2, 'В', 'нет', 'Средне-специальное\r\nПроф.училище №11\r\n2001-2004\r\nПарикмахер-универсал', '2011-05-28 00:00:00', '2011-12-30 00:00:00', '2011-09-21 00:00:00', '2013-04-20 00:00:00', '2013-04-20 00:00:00', '2013-11-22 00:00:00', 'Продавец-консультант-кассир', 'Диспетчер', 'Оператор', 'магазин "Канц Хаус"', 'Калина-такси', 'трансферная компания "Трансфер"', 'Рязань', 'Рязань', 'Рязань', 'Продажа канцтоваров', 'Прием звонков,распределение заказов', 'Прием звонков,консультирование клиентов,документация', '12.000р', '12.000р', '12.000р', 'Смена директора,закрытие магазина', 'Долго болела,работала на дому', 'Маленькая зарплата, (на телефоне сидела круглосуточно,без выходных)', 'На Вашем официальном сайте', 'от 20.000р', '2013-12-19 04:08:18', 1, NULL),
(57, 'Менеджер по продажам', 'Романова', 'Ирина', 'Дамировна', '1978-03-03 00:00:00', 'Казахстан', 'Казахстан(вид на жительство)', 'г.Рязань\r\nул.Димитрова д.3', '89308801165', 'irinabahra@hotmail.com', 1, '2 детей\r\n7 лет\r\n2 года', 3, 2, 2, 'нет', '13 лет', 'высшее\r\nюжно-казахстанский открытый университет\r\n2002-2007\r\nэкономист', '2010-10-08 00:00:00', '2012-04-28 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'менеджер ', '', '', 'магазин детской одежды', '', '', 'сирия г.дамаск', '', '', 'помощь клиентам в выборе', '', '', '1000$', '', '', 'в связи с выездом', '', '', 'из газеты', '30000 руб.', '2013-12-19 05:33:27', 1, NULL),
(58, 'Кладовщик', 'Анискин', 'Алексей', 'Игоревич', '1990-10-01 00:00:00', 'Рязань', 'РФ', 'рЯЗАНЬ', '89290659261', 'cool.podvis@yandex.ru', 2, 'Нет', 1, 2, 1, 'В', '2 года', 'Средне-техническое,Рязанский колледж ЖД Транспорта,с 2007-2010,строительство и эксплуатация зданий и сооружений,Техник', '2011-09-03 00:00:00', '2013-03-03 00:00:00', '2013-03-07 00:00:00', '2013-11-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Кладовщик', 'Рабочий по зданию', '', 'ОАО Белиген', 'Детский сад', '', 'Московский', 'Московский', '', 'Приемка и отгрузка товара,ведение документации и складского хозяйства,сбор товара по накладным', 'Рабочий по обслуживанию здания', '', '35000 рублей', '30000 рублей', '', 'По собственному желанию', 'По собственному желанию', '', 'Интернет сайт', '30000', '2013-12-20 03:12:50', 1, NULL),
(59, 'Работник склада', 'Рубцов', 'Антон', 'Михайлович', '1995-06-28 00:00:00', 'г.Рязань', 'Российское', 'г.Рязань, ул.Магистральная, д.13, кв.33', '89036400595', 'kr1sone@mail.ru', 2, 'не имеется', 2, 2, 2, 'B', 'пол года', 'Полное среднее', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'из рекламы', '15000', '2013-12-25 07:19:42', 1, NULL),
(60, 'Менеджер по продажам', 'Михеев', 'Александр ', 'Владимирович', '1983-10-17 00:00:00', 'Рязань', 'РФ ', 'Рязань Ул. 3 Бутырки д.3', '8900-906-30-86', 'Mr.oliympiya@mail.ru', 1, '1 ребенок 2 года', 3, 2, 1, 'B', 'Более 10', 'Средне специальное товаровед и высшее менеджер', '2011-07-17 00:00:00', '2013-12-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Менеджер', '', '', 'ООО НПЦ ', '', '', 'Рязань', '', '', 'Общение с клиентами, продажи.', '', '', '20 000- 25 000', '', '', 'Задержки з/п', '', '', 'На вашем сайте', '20 000-25 000', '2013-12-28 11:35:48', 1, NULL),
(61, 'Работник склада', 'Часов', 'Игорь', 'Олегович', '1988-03-25 00:00:00', 'Рязань', 'РФ', 'г.Рязань,ул Рыбацкая', '+79308888548', 'igorchasoff@yandex.ru', 1, 'нет', 1, 2, 1, 'В', '1,4 года', 'Среднее специальное. Рязанский торгово-экономический техникум(2003-2007), товароведение/товаровед.', '2011-01-19 00:00:00', '2013-11-23 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'специалист по работе с клиентами', '', '', 'ЗАО КБ СИТИБАНК', '', '', 'Рязань', '', '', 'консультирование клиентов по телефону горячей линии (Колл центр)', '', '', '23000-27000', '', '', 'График работы (ночные смены,поздние вечерние смены), смена деятельности', '', '', 'интернет', '23000-40000', '2014-01-03 01:04:59', 1, NULL),
(62, 'Кассир', 'Черевко ', 'Татьяна', 'Сергеевна', '1982-01-01 00:00:00', 'г. Владивосток', 'Россия', 'г. Луховицы, Осторовского 10/53', '89268567740', 'frau.tcherevko2012@yandex.ru', 1, 'нет', 2, 2, 2, 'нет', 'нет', 'Среднее специальное\r\nПрофессионально-техническое училище -147\r\nБухгалтер', '0000-00-00 00:00:00', '2012-05-25 00:00:00', '2012-05-27 00:00:00', '2012-11-25 00:00:00', '2013-04-01 00:00:00', '2013-12-15 00:00:00', 'Продавец-кассир', 'кассир', 'кассир', 'Минимаркет ООО ', 'ООО ', 'Аттракцион ', 'г. Луховицы, ул Жуковского', 'г.Луховицы, ул Пушкино', 'г.Луховицы , ул Пушкино, Кадо 2 эт', 'работа на кассе, выкладка товара', 'работа на кассе', 'продажа билетов', '10000', 'от 18000', 'от 12000', 'маленькая заработная плата, график работы', 'график работы', 'закрытие аттракциона', 'интернет', 'от 20000', '2014-01-04 01:46:49', 1, NULL),
(63, 'Менеджер по продажам', 'Хромов', 'Антон', 'Игоревич', '1990-05-25 00:00:00', 'г.Рязань', 'Русский', 'г.Рязань,ул.Великанова,10, корп.2', '8-915-596-45-35; 8-920-977-44-43', 'stan185@yandex.ru', 2, 'нет', 2, 2, 1, 'В', 'с 2009 г', '2007-2010 Федеральное государственное образовательное учреждение среднего профессионального образования «Рязанский колледж электроники» ПРИСВОЕНА КВАЛИФИКАЦИЯ «ТЕХНИК» ПО СПЕЦИАЛЬНОСТИ «ТЕХНИЧЕСКОЕ ОБСЛУЖИВАНИЕ И РЕМОНТ АВТОМОБИЛЬНОГО ТРАНСПОРТА»\r\n\r\n2010-2011 Федеральное государственное образовательное учреждение среднего профессионального образования «Рязанский колледж электроники»	г. Рязань ПРИСВОЕНА КВАЛИФИКАЦИЯ «СТАРШИЙ ТЕХНИК» ПО СПЕЦИАЛЬНОСТИ «ТЕХНИЧЕСКОЕ ОБСЛУЖИВАНИЕ И РЕМОНТ АВТОМОБИЛЬНОГО ТРАНСПОРТА»\r\n\r\n2008-2013 Федеральное государственное бюджетное образовательное учреждение высшего профессионального образования «Рязанский государственный агротехнологический университет имени П.А. Костычева»  г. Рязань ПРИСУЖДЕНА КВАЛИФИКАЦИЯ «ИНЖЕНЕР» ПО СПЕЦИАЛЬНОСТИ «СЕРВИС ТРАНСПОРТНЫХ И ТЕХНОЛОГИЧЕСКИХ МАШИН И ОБОРУДОВАНИЯ (АВТОМОБИЛЬНЫЙ ТРАНСПОРТ)»', '2011-10-01 00:00:00', '2013-06-27 00:00:00', '2013-10-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Мойщик автомобилей', 'Менеджер по продажам', '', 'ИП Савин О.В. (МегаАльянс)', 'Управдом', '', 'Рязань', 'Рязань', '', 'Мойка автомобилей', 'Ведение розничных продаж', '', '28000', '', '', 'Семейные обстоятельства', '', '', 'Интернет', '30000', '2014-01-08 12:48:10', 1, NULL),
(64, 'Работник склада', 'Полунин', 'Илья', 'Владимирович', '1992-06-25 00:00:00', 'Рязань', 'Гражданин РФ', 'Рязань, ул. Циолковского 20', '89537495986', 'ivpolunin@gmail.com', 2, 'нет', 3, 2, 2, 'нет', 'нет', 'РГРТУ, 2009-2014, радиотехника', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'знакомые', '15000-20000', '2014-01-09 03:33:52', 1, NULL),
(65, 'Работник склада', 'Сорокин', 'Михаил', 'Игоревич', '1992-09-25 00:00:00', 'г. Рязань', 'россиянин', 'г.Рязань, ул.Новоселов, д.58, кв.106', '89537399918', 'miha-sr@mail.ru', 2, 'нет', 2, 2, 1, 'B', '3 года', 'РГРТУ, 5 курс, радиотехника', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'от знакомых', '25000 рублей', '2014-01-09 03:37:25', 1, NULL),
(66, 'Кассир', 'Ольшевская', 'Яна', 'Вячеславовна', '1994-08-02 00:00:00', 'г.Рязань', 'Российское', 'г.Рязань', '8-920-961-76-26', 'yanusio@yandex.ru', 2, 'Детей нет.', 3, 2, 2, 'Нет.', 'Нет.', 'Рязанский Государственный Университет им.С.Есенина,2012-2017гг.,Лингвист-переводчик.', '2013-07-17 00:00:00', '2012-08-14 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Продавец-консультант', '', '', 'Адидас', '', '', 'г.Рязань', '', '', 'Работа в торговом зале/на складе,консультирование клиентов,уборка помещения,работа с кассой и докум.', '', '', '12000-13000', '', '', 'По собственному желанию.', '', '', 'Рассказали друзья.', '13000-15000', '2014-01-10 08:39:37', 1, NULL),
(67, 'Менеджер по продажам', 'Ольшевская', 'Яна', 'Вячеславовна', '1994-08-02 00:00:00', 'г.Рязань', 'Российское', 'г.Рязань', '8-920-961-76-26', 'yanusio@yandex.ru', 2, 'Детей нет.', 3, 2, 2, 'Нет.', 'Нет.', 'Рязанский Государственный Университет им.С.Есенина,2012-2017гг.,Лингвист-переводчик.', '2013-07-17 00:00:00', '2013-08-14 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Продавец-консультант', '', '', 'Адидас', '', '', 'г.Рязань', '', '', 'Работа в тороговом зале/на складе,уборка помещения,консультирование клиентов,работа с кассой и докум', '', '', '12000-13000', '', '', 'По собственному желанию.', '', '', 'Рассказали друзья.', '13000-15000', '2014-01-10 08:45:22', 1, NULL),
(68, 'Оператор отдела маркетинга', 'Залесская', 'Екатерина', 'Владимировна ', '1991-05-19 00:00:00', 'Рязань', 'РФ ', 'Рязань,  новоселов 53 к.1. КВ.215', '89105010172', 'katuuwka19.ru@mail.ru', 1, 'Нет', 3, 2, 1, 'B', '1 год', 'Ргу им С.А. Есенина,  факультет истории и международных отношений , специальность реклама , 2008-2013', '2013-05-01 00:00:00', '2013-09-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Специалист по реламе ', '', '', 'Ип', '', '', '', '', '', 'Создание и продвижение рекламных компаний,  интернет маркетинг, документооборот', '', '', '20000', '', '', 'Не выполнение обязательств со стороны работодателя', '', '', 'Сайт', '20000', '2014-01-12 05:09:24', 1, NULL),
(69, 'Менеджер по продажам', 'Фелифоров', 'Михаил', 'Михайлович', '1988-01-12 00:00:00', 'коми асср княжпогостского района город емва', 'РФ', 'г.Рязань, Заводской проезд 6А', '89805017816', 'mihail12011991@gmail.com', 2, 'нет', 1, 2, 2, 'ВС', '5 лет', 'Неполное высшее, Обшевойсковая академия сухопутных войск, 2007-2010, автомобили- автомобильное хоз-во', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Заместитель директора офиса продаж', '', '', 'ЗАО РТК', '', '', 'МО Балашиха', '', '', 'Консультация, продажи, заполнение документов строгой отчетности, контроль качества обслуживания', '', '', '30000-45000', '', '', 'Переезд', '', '', 'Интернет', '25000-35000', '2014-01-14 01:24:59', 1, NULL),
(70, 'Менеджер по продажам', 'Абакумов', 'Максим', 'Геннадьевич', '1994-09-23 00:00:00', 'г. Рязань', 'гражданин РФ', 'ул. Старореченская, д.2,к.2, кв.18', '89537456794', 'gorbinm@mail.ru', 2, 'детей нет', 3, 2, 2, '-', '-', 'Среднее профессиональное\r\nРязанский колледж электроники 2009-2013\r\nТехническое обслуживание и ремонт радиоэлектронной техники', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'официальный сайт', '20000', '2014-01-15 03:37:56', 1, NULL),
(71, 'Оператор отдела маркетинга', 'Егорова', 'Надежда', 'Викторовна', '1980-12-15 00:00:00', 'г. Рязань', 'Россия', 'г.Рязань, ул. Полевая (центр)', '8-953-730-76-98', 'ego.nad@yandex.ru', 1, '1, 12 лет', 3, 2, 2, 'нет', 'нет', '1. высшее, РГПУ им.Есенина, 1999-2004 гг., учитель английского языка\r\n2. высшие, МУ им. Витте, 2009-2013 гг., экономист  ', '2012-09-02 00:00:00', '2013-12-30 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'менеджер по закупкам', '', '', 'ТД "НИТИ"', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'на предыдущей работе', '30000', '2014-01-16 02:40:31', 1, NULL),
(72, 'Менеджер по продажам', 'Третьякова', 'Ольга ', 'Валерьевна', '1987-12-25 00:00:00', 'г.Рязань', 'РФ', 'Кассимовское ш. д.29.к.1.кв.34', '89109065052', 'o.tretiakowa2010@yandex.ru', 1, 'Дочь 4 года', 3, 2, 1, 'В', '1 год', 'Высшее: РЗИ(ф)МГУКИ,6 лет,Дизайнер', '2007-05-11 00:00:00', '2008-09-08 00:00:00', '2011-06-05 00:00:00', '2011-09-15 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Офис-менеджер', 'Администратор', '', 'Салон красоты "Дали"', 'Дворец спорта "Олимпийский"', ' ', 'Рязань', 'Рязань', '', 'Обеспечение жизнедеятельности салона. Прием звонков. Контроль за работой персонала. Закупка расхо', 'Обеспечение жизнедеятельности Дворца спорта. Прием звонков. Контроль за работой персонала. Обеспечен', '', '10 000', '9000', '', 'Закрытие салона', 'Причина очной формы обучения в институте', '', 'От знакомых, интернета', '25000', '2014-01-17 01:23:00', 1, NULL),
(73, 'Менеджер по продажам', 'Данилов', 'Кирилл', 'Александрович', '1992-12-04 00:00:00', 'г.Рязань', 'РФ', 'ул.Космонавтов д.7 кв.30', '89511022488', 'dan.ilov@mail.ru', 2, 'детей нет', 2, 2, 2, 'B', 'нет', 'Рязанский филиал федерального государственного бюджетного образовательного учреждения  высшего профессионального образования\r\n«Московский государственный университет путей сообщения»\r\nвремя обучение 3 года\r\nСпециальность:Техническое обслуживание средств вычислительной техники и компьютерных сетей.\r\nКвалификация:техник', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '-', '-', '-', 'не работал', 'не работал', 'не работал', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'на сайте магазина', '20-25 т.р', '2014-01-17 06:14:23', 1, NULL),
(74, 'Работник склада', 'Щегольков', 'Владислав', 'Сергеевич', '1984-09-12 00:00:00', 'Рязань', 'РФ', 'Первомайский проспект дом 33 квартира 16', '89308841209', 'rsn-cool@mail.ru', 2, 'Двое 8 лет и 3 года', 2, 2, 2, 'Нет', 'Нет', 'Пл-39 1999-2002 газоэлектросварщик', '2006-03-15 00:00:00', '2010-09-11 00:00:00', '2010-09-12 00:00:00', '2013-08-02 00:00:00', '2013-08-05 00:00:00', '2014-01-16 00:00:00', 'Товаровед', 'Кладовщик', 'Электро сварщик', 'Копейка-Москва', 'Элекс', 'Ритуал', 'Рязань', 'Рязань', 'Рязань', 'Приемка отгрузка товара', 'Приемка и отгрузка товара', 'Электро сварка', '17000', '18000', '20000', 'По собственному желанию', 'По собственному желанию', 'По собственному желанию', 'Интернет', 'От 20000', '2014-01-18 01:42:09', 1, NULL),
(75, 'Менеджер по продажам', 'Шапошникова', 'Екатерина', 'Алексеевна', '1990-12-22 00:00:00', 'г. Фрунзе', 'РФ', 'г.Рязань ул.Братиславская д.27-454', '89290677544', 'e.reder@yandex.ru', 2, 'Нет', 3, 2, 2, 'В', 'нет', 'Высшее. Рязанский государственный радиотехнический университет,2009-2014 гг.,специалист по социальной работе.', '2011-03-14 00:00:00', '2012-01-09 00:00:00', '2012-04-23 00:00:00', '2012-11-18 00:00:00', '2013-01-03 00:00:00', '2013-09-27 00:00:00', 'Продавец-консультант', 'Администратор-официант', 'Работник игрового зала', 'ТЦ Малина ', 'Ресторан ', 'ТД Барс ', 'г.Рязань', 'г.Рязань', 'г.Рязань', 'Консультирование покупателей, продажа товаров', 'Встреча и обслуживание посетителей, организация банкетов', 'Консультирование посетителей о правилах пользования игровыми автоматами', '15000', '20000', '15000', 'По собственному желанию (невозможность совмещения с учебой)', 'По собственному желанию', 'По собственному желанию (была временно трудоустроенна)', 'Интернет. Официальный сайт компании.', '20000', '2014-01-18 08:21:17', 1, NULL),
(76, 'Менеджер по продажам', 'Якупова', 'Разиля', 'Фагимовна', '1993-07-16 00:00:00', 'РТ г. Лениногорск', 'Россия', 'Рязань Ул. Октябрьская 35/11 кВ 75', '89105041217', 'razilya_yakupova@mail.ru', 1, 'Детей нет', 3, 2, 2, 'B', '1 год', 'Среднее, альметьевский торгово экономический техникум, специальность страховое дело', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Интернет', '20000', '2014-01-19 06:42:37', 1, NULL),
(77, 'Работник склада', 'Макаров', 'Михаил', 'Михайлович', '1982-02-02 00:00:00', 'р-ка Казахстан', 'РФ', 'г.Рязань,ул.Михайловка-Ямки,д.16', '89623933284', 'mike.makarov.rzn@yandex.ru', 1, 'дочь-9 лет\r\nсын-3 года', 1, 2, 2, 'нет', 'нет', 'среднее', '2013-05-16 00:00:00', '2013-11-05 00:00:00', '2011-09-10 00:00:00', '2012-11-15 00:00:00', '2010-09-12 00:00:00', '2011-09-08 00:00:00', 'менеджер торгового зала', 'старший мастер сервисного центра', 'мастер сервисного центра', 'м-н Вейдер Спорт', 'м-н Евроспорт', 'м-н Спортмастер', 'Рязанский', 'Рязанский', 'Рязанский', 'обучение и управление персоналом, составление планов продаж, составление заказов, отчетов и графиков', 'прямые продажи, продажи по безналу, составление заказов, обучение и управление персоналом, сервисное', 'прямые продажи, продажи по безналу, составление заказов, обучение и управление персоналом, сервисное', '20 тыс. рублей', '17 тыс. рублей', '15 тыс. рублей', 'низкая проходимость магазина', 'низкая зарплата и отсутствие карьерного роста', 'низкая зарплата', 'интернет', '25 000', '2014-01-20 07:05:58', 1, NULL),
(78, 'Работник склада', 'Макаров', 'Михаил', 'Михайлович', '1982-02-02 00:00:00', 'р-ка Казахстан', 'РФ', 'г.Рязань,ул.Михайловка-Ямки,д.16', '89623933284', 'mike.makarov.rzn@yandex.ru', 1, 'дочь-9 лет\r\nсын-3 года', 1, 2, 2, 'нет', 'нет', 'среднее', '2013-05-16 00:00:00', '2013-11-05 00:00:00', '2011-09-10 00:00:00', '2012-11-15 00:00:00', '2010-09-12 00:00:00', '2011-09-08 00:00:00', 'менеджер торгового зала', 'старший мастер сервисного центра', 'мастер сервисного центра', 'м-н Вейдер Спорт', 'м-н Евроспорт', 'м-н Спортмастер', 'Рязанский', 'Рязанский', 'Рязанский', 'обучение и управление персоналом, составление планов продаж, составление заказов, отчетов и графиков', 'прямые продажи, продажи по безналу, составление заказов, обучение и управление персоналом, сервисное', 'прямые продажи, продажи по безналу, составление заказов, обучение и управление персоналом, сервисное', '20 тыс. рублей', '17 тыс. рублей', '15 тыс. рублей', 'низкая проходимость магазина', 'низкая зарплата и отсутствие карьерного роста', 'низкая зарплата', 'интернет', '25 000', '2014-01-20 07:06:33', 1, NULL),
(79, 'Менеджер по продажам', 'Елецкая', 'Наталья', 'Юрьевна', '1989-03-09 00:00:00', 'Город Луховицы', 'РФ', 'моск.обл.,г.Луховицы,ул.Мира,д.28,кв.87', '89264635576', 'klavdieva2009@yandex.ru', 1, 'дочка\r\n1год 11месяцев', 3, 2, 1, 'В', '5 лет', 'высшее\r\nМосковский государственный областной социально - гуманитарный институт.\r\n2006-2011\r\nтехнолог-предприниматель\r\n', '2011-03-10 00:00:00', '2014-02-15 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Инженер-технолог 3 категории', '', '', 'РСК ', '', '', 'московская обл. г.Луховицы', '', '', '', '', '', '15000', '', '', 'не устраивает з/п', '', '', 'интернет', '22000', '2014-01-21 09:23:47', 1, NULL),
(80, 'Менеджер по продажам', 'Косарев', 'Александр', 'Александрович', '1984-01-27 00:00:00', 'г.Череповец Вологодской обл.', 'РФ', 'Рязанская обл., г.Скопин, мкр.Заречный, ул.Первомайская, д.7', '8-920-999-03-07', 'fcsasha@mail.ru', 1, '1. Дочь, 4г.\r\n2. Сын, 2г.\r\n3. Дочь, 3мес.', 2, 2, 1, 'B', 'с 2007г.', 'МГТУ им.Н.Э.Баумана,\r\n2001г. – 2007г.\r\nАвтоматизированные системы обработки информации и управления / инженер', '2006-05-01 00:00:00', '2008-12-01 00:00:00', '2008-08-01 00:00:00', '2010-11-01 00:00:00', '2009-01-01 00:00:00', '2014-01-01 00:00:00', 'управляющий', 'младший научный сотрудник', 'администратор веб-сайтов', 'ТЕХИНВЕСТ', 'Институт машиноведения им А.А.Благонравова', 'ИП', 'г.Москва', 'г.Москва', 'РФ', 'координация деятельности компании', 'помощник зав.лабораторией', 'разработка и поддержка интернет-сайтов', '40т.р./мес', '8 т.р./мес', '50т.р./мес', 'закрытие фирмы', 'окончание срока обучения в аспирантуре', 'снижение дохода, смена сферы деятельности', 'из оф.сайта компании', '100-200т.р./мес', '2014-01-22 01:14:01', 1, NULL),
(81, 'Работник склада', 'Агафонов ', 'Андрей', 'Сергеевич', '1995-06-24 00:00:00', 'г. Шатура', 'РФ', 'Г. Рязань, ул. Семинарская, д. 44/3', '89251891934', 'za64@rambler.ru', 2, 'Отсутствуют ', 2, 2, 2, '-', '-', 'Среднее.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Интеренет', '22000', '2014-01-22 02:20:19', 1, NULL),
(82, 'Работник склада', 'юрков', 'денис', 'александрович', '1992-07-10 00:00:00', 'рязань', 'российское', 'г.Рязань ул.Новоселов д.35. кв138.', '89521245789', 'depananas@yandex.ru', 2, 'нету', 3, 2, 2, 'нету', 'нету', 'средне-специальное, рязанский железнодорожный техникум, 1 год, электрик', '2010-08-01 00:00:00', '2011-06-06 00:00:00', '2011-06-14 00:00:00', '2013-06-15 00:00:00', '2013-09-12 00:00:00', '2014-01-22 00:00:00', 'электрик', 'электрик', 'стекловар', 'рязцветмет', 'Завод металлов и сплавов', 'оао марион', 'рязань', 'рязань', 'рязань', 'следил за оборудованием', 'следил за оборудованием', 'следил за оборудованиям и печью', '5 тыс', '', '16тыс', 'маленькая зарплата', 'маленькая зарплата', 'завод обанкротился', 'увидел магазин и решил зайти на сайт', '20000', '2014-01-22 02:29:36', 1, NULL),
(83, 'Менеджер по продажам', 'Малюгина', 'Мария', 'Андреевна', '1988-09-14 00:00:00', 'г. Рязань', 'Россия', 'г. Рязань, Заводской проезд.', '89209845223', 'm.m.a.140988@gmail.com', 2, 'нет', 3, 2, 2, 'нет', 'нет', 'Высшее, МПСИ, 2005-2011, менеджер', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'знакомые', '20000', '2014-01-25 01:11:44', 1, NULL),
(84, 'Менеджер по продажам', 'Рябикин', 'Владимир', ' Анатольевич', '1963-03-08 00:00:00', 'г.Зарайск Московской обл.', 'Россия', 'г.Зарайск', '903 550-8813', 'vladimir_ryabikin@mail.ru', 1, 'взрослые', 1, 2, 2, 'вс', '30 лет', 'среднее', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'интернет', '25 000', '2014-01-28 09:32:28', 1, NULL),
(85, 'Менеджер по продажам', 'Ионкин', 'Алексей', 'Дмитриевич', '1992-04-03 00:00:00', 'Ряз.обл.Спасский р-н.с.Ижевское', 'Русский', 'г.Рязань ул.Крупской д.1\\13', '+79009106779', '1ionkin1@rambler.ru', 2, 'нет', 3, 2, 1, 'BC', '3', 'Спасский политехнический техникум.Средне специальное.2008-2012.Техник механик.', '2012-07-31 00:00:00', '0000-00-00 00:00:00', '2013-05-06 00:00:00', '2014-01-23 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Водитель экспедитор', 'Водитель экспедитор', '', 'Останкино-Рязань', 'ЖелДорЭкспедиция', '', '', '', '', '', '', '', '', '', '', '', '', '', 'интернет', '22000', '2014-01-29 10:33:58', 1, NULL),
(86, 'Менеджер по продажам', 'Фимин', 'Михаил', 'Вадимович', '1992-03-12 00:00:00', 'Рязань', 'РФ', 'ул. Черновицкая, дом 38, корпус 2, кв 29', '89605771904', 'trooper666999@mail.ru', 2, 'нет детей', 2, 2, 2, 'нет', '0', 'РязГМУ лечебный факультет', '2012-12-25 00:00:00', '2013-08-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'продавекц-консультант', '', '', 'Доскервиль', '', '', '62', '', '', 'работа на кассе, выкладка товара, презентация, ведение отчетности', '', '', '16000', '', '', 'задержка зп и отсутвие карьерного роста', '', '', 'официальный сайт', 'от 20000 и выше', '2014-01-29 05:16:38', 1, NULL),
(87, 'Кассир', 'Брагина', 'Людмила', 'Ивановна', '1992-08-28 00:00:00', 'с. Мосолово Шиловского р-она, Ряз. обл', 'РФ', 'Село Дядьково ул Юбилейная д9, квар.3', '8-900-903-55-37', 'super.lubov2808@ya.ru', 2, 'нет', 3, 2, 2, 'В', '3', 'РЯзанский педагогический колледж, 3 года, учитель физкультуры', '2013-02-25 00:00:00', '2013-12-25 00:00:00', '2012-01-15 00:00:00', '2012-11-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Продавец консультант', 'Бармен', '', 'Теле2', 'Кофе-холл', '', 'Рязань', 'Рязань', '', 'Продажа телефонов и аксесуаров', 'Обслуживание клиентов', '', '15000', '14000', '', 'Закрытие', 'По собственному желанию', '', 'Посоветовали знакомые', '18000', '2014-01-30 09:10:44', 1, NULL),
(88, 'Работник склада', 'Попов', 'Александр', 'Сергеивич', '1980-10-28 00:00:00', 'Сахалинская обл,ноглинский р-он,с.Вал', 'русский', 'Рязань,ул.Полевая 24А,кв 7', '+79537432089', 'rayzan-62@mail.ru', 1, 'Детей нет.', 2, 2, 2, 'нет', 'нет', 'Среднее-техническое', '2013-03-12 00:00:00', '2014-01-14 00:00:00', '2013-01-02 00:00:00', '2013-02-03 00:00:00', '2008-12-08 00:00:00', '2011-09-28 00:00:00', 'продовец-логист', 'грузчик', 'Столяр/Плотник', 'ООО Ашан', 'ООО Главная Линия', 'МУП Скопинская ЦРБ', 'Рязань', 'Рязань', 'Скопин', 'консультация,продажа,заказ товара', 'погрузка,разгрузочные работы', 'ремонт мебели', '11000', '8000', '6000', 'по собственному желанию', 'по собственному желанию', 'по собственному желанию', 'интернет', 'от 20000', '2014-02-03 03:37:11', 1, NULL),
(89, 'Продавец корпусной мебели', 'Жукова', 'Екатерина', 'Олеговна', '1988-12-06 00:00:00', 'г. Рязань', 'РФ', 'г. Рязань, ул. Вознесенская, д. 51', '8-920-998-41-41', 'ekaterinazhukova@mail.ru', 1, 'Нет', 3, 2, 2, 'нет', 'нет', 'Высшее, РГУ имени С.А. Есенина, 2006-2012, специалист в области рекламы', '2011-08-03 00:00:00', '2013-12-06 00:00:00', '2011-06-00 00:00:00', '2011-08-00 00:00:00', '2013-12-17 00:00:00', '0000-00-00 00:00:00', 'продавец- кассир (корпусная мебель)', 'менеджер по продажам', 'стажер менеджера по продажам', 'Диваны и кресла', 'Эстет ( корпусная мебель)', 'Аскона', 'г. Рязань', 'г. Рязань', 'г. Рязань', 'консультирование клиентов,составление дизайн проектов,оформление договоров, ведение отчетности и др', 'консультирование, работа в 3 D, принятие заказов', 'консультирование, оформление договоров, ведение отчетности', '40000', '10000', '', 'закрытие магазина', 'пригласили работать в ДиК с лучшими условиями', '', '62.ru', '40000', '2014-02-03 06:10:19', 1, NULL),
(90, 'Продавец корпусной мебели', 'Герасимов', 'Вадим', 'Олегович', '1988-10-06 00:00:00', 'г. Рязань', 'РФ', 'г. Рязань ул. Гоголя д.42, кв.41', '8-920-632-23-78', 'sdrunner@rambler.ru', 1, 'детей нет', 3, 2, 1, 'B', '7', '2005-2010	\r\nРязанский государственный радиотехнический университет\r\nФакультет электроники\r\n2007-2010	\r\nРязанский государственный радиотехнический университет, \r\nФакультет переподготовки специалистов (инженер-переводчик)\r\n', '2010-06-07 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ведущий специалист', '', '', 'ТБинформ', '', '', 'г. Рязань', '', '', 'Обеспечение бесперебойной работы технических и программных частей объектов Заказчика', '', '', '32000', '', '', 'Отсутствие финансового роста', '', '', 'реклама в лифте', 'от 35000', '2014-02-04 08:21:50', 1, NULL),
(91, 'Кассир', 'Юдина', 'Ирина', 'Алексеевна', '1983-03-18 00:00:00', 'с.Пертово Рязанской области', 'рф', 'г.Рязань Касcимовское шоссе д.48 к.5 кв9', '89009094235', 'irinaydar@mail.ru', 1, '2 дочь 12 лет сын 4 года', 3, 2, 1, 'Б', '6 месяцев', 'среднее специальное.проф\r\nесcиональный лицей №11 время обучения 1 сентября 1998г по 19 июня 2001г ', '2008-01-22 00:00:00', '2009-03-31 00:00:00', '2012-01-18 00:00:00', '2012-04-25 00:00:00', '2012-10-08 00:00:00', '2013-10-16 00:00:00', 'продавец-консультант', 'продавец-кассир', 'помощник-воспитателя', 'ООО "Флигель"', 'ООО "Алфавит"', 'МБДОУ "Детский сад №138"', 'Рязань', 'Рязань', 'Рязань', 'общение с покупателями.и денежными средствами на кассе', 'работа на кассе', 'работа с детьми', '12000', '10000', '5000', 'сокращение под кризис 2009г', 'уволилась по собственному желанию', 'маленькая зароботная плата..по собственному желанию', 'интернет', '20000', '2014-02-05 12:39:23', 1, NULL),
(92, 'Секретарь', 'Власова', 'Надежда', 'Георгиевна', '1981-08-21 00:00:00', 'Касимов, Ряз. обл.', 'Российское', 'Рязань, Октябрьский р-он', '8-905-691-90-81', 'nafanya_21@pisem.net', 1, '1 ребенок , 2 года', 3, 2, 1, 'В', '4', 'Рязанский государственный педагогический университет им. С. А. Есенина, Рязань\r\nФакультет социологии и управления, социолог, преподаватель социологии.2000-2005гг.\r\n', '2004-09-02 00:00:00', '2005-05-01 00:00:00', '2005-10-01 00:00:00', '2006-05-10 00:00:00', '2006-10-05 00:00:00', '0000-00-00 00:00:00', 'менеджер', 'продавец цифровой техники', 'старший менеджер', 'ИП Маканов И.А.', 'ООО "Герлах"', 'ИП Зайцев CВ (окна, двери ПВХ)', 'Рязанская область', 'Рязанская обл.', '', 'обработка заказов', 'розничная торговля', '• общение с клиентами по телефону и в офисе  • подготовка и оформление договоров  • логистика  • Коо', '', '', '20000 руб.', '', 'низкая оплата труда', '', 'интернет', 'не менее 20000 руб.', '2014-02-05 05:07:44', 1, NULL),
(93, 'Менеджер по продажам', 'Ватащиков', 'Владимир', 'Вячеславович', '1975-09-29 00:00:00', 'Рязань', 'РОССИЯ', 'Рязань, ул. Касимовское шоссе, д. 40, кв.11', '89511001811', 'leps1975@mail.ru', 1, '14, 5, 19', 1, 2, 1, 'В', '12', 'РГМУ им. ак. И.П. Павлова, 1995-2002, врач- медико-профилактическое дело', '2012-12-01 00:00:00', '2013-10-30 00:00:00', '2012-02-28 00:00:00', '2012-12-01 00:00:00', '2011-12-01 00:00:00', '2012-02-22 00:00:00', 'Инженер', 'Водитель', 'Бригадир', 'ООО "РРКС"', 'ООО "РРКС"', 'ООО "АТАК"', 'Рязань', 'Рязань', 'Рязань', '', '', '', '30', '20', '25', 'банкротство предприятия', 'перевод', 'по собственному желанию', 'www.62.ru', '30', '2014-02-06 02:40:51', 1, NULL),
(94, 'Менеджер по продажам', 'Щелкачев', 'Алексей', 'Викторович', '1984-09-26 00:00:00', 'Рязань', 'Русский', 'г.Рязань, ул. Тимакова, д.5, кв. 111', '89209873260', 'belonos.87@mail.ru', 1, '1 ребенок,2 года', 2, 2, 1, 'В', '9 лет', 'высшее, РГСХА, 2001-2006 г.г., специальность - инженер ', '2013-04-08 00:00:00', '2014-02-06 00:00:00', '2012-09-26 00:00:00', '2013-03-05 00:00:00', '2010-11-25 00:00:00', '2012-07-24 00:00:00', 'оператор станков с ЧПУ', 'Должность: Управляющий производством', 'Старший производственный мастер', 'ООО "Завод Световые технологии"', 'ООО «ПартверГрупп»', 'ОАО «Рязанский Радиозавод»', 'рязань', 'рязань', 'рязань', '- Выполнение суточного планового задания  - Подналадка станков в процессе работы  - Техническое обсл', '- Обеспечение выполнения производством месячного планового задания   - Ремонт оборудования  - Обеспе', ' - Обеспечение выполнения участком месячного планового задания по объему и номенклатуре  - Своевреме', '37000', '35000', '33000', 'в наст время работаю', 'ненормированный рабочий день,отсутствие выходных', 'отсутствие заказов,уменьшение зп', 'на сайте магазина', 'от 30000', '2014-02-06 05:04:15', 1, NULL),
(95, 'Работник склада', 'Гусев', 'Иван', 'Александрович', '1993-06-06 00:00:00', 'г.Новотроицк Оренбургская обл.', 'РФ', 'г.Рязань, ул.Чкалова', '89605703835', 'rast93@mail.ru', 3, 'нет', 1, 2, 2, 'В', '2 года', 'Среднее, средне-специальное, слесарь-ремонтник 5разряд', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'интернет', '30000', '2014-02-06 05:49:50', 1, NULL),
(96, 'Кассир', 'Алиева', 'Анастасия', 'Сергеевна ', '1990-10-24 00:00:00', 'Рязань', 'РФ', 'Рязань, Бирюзова', '89209832007', 'nas3159@yandex.ru', 1, '1 ребенок-3,5 года', 3, 2, 2, '-', '5 лет', 'РИ (ф) МГОУ Им В.С.Черномырдина,2007-2013.\r\nЭкономика и управление на предприятии в машиностроении.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Знакомые', '20 000', '2014-02-06 09:34:21', 1, NULL),
(97, 'Менеджер по продажам', 'Соловьева ', 'Татьяна', 'Владимировна', '1992-02-26 00:00:00', 'город Луховицы', 'РФ', 'г.Луховицы', '8-915-088-74-50', 'tatyana6.soloveva@yandex.ru', 2, 'нет', 3, 2, 2, 'В', '2 года', 'не законченное высшее  МГОСГИ 2009-2013 ', '2012-11-20 00:00:00', '2013-10-04 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'методист', '', '', 'Луховицкая школа ДОСААФ', '', '', 'Луховицы', '', '', 'оформление договоров', '', '', '15000 руб.', '', '', 'выход из декретного отпуска основного работника', '', '', 'интернет', '20000 руб.', '2014-02-08 04:55:56', 1, NULL),
(98, 'Кассир', 'Соловьева ', 'Татьяна', 'Владимировна', '1992-02-26 00:00:00', 'город Луховицы', 'РФ', 'город Луховицы', '8-915-088-74-50', 'tatyana6.soloveva@yandex.ru', 2, 'нет', 3, 2, 2, 'В', '2 года', 'не законченное высшее МГОСГИ 2009-2013', '2012-11-20 00:00:00', '2013-10-04 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'методист', '', '', 'Луховицкая школа ДОСААФ', '', '', 'Луховицы', '', '', 'оформление договоров', '', '', '15000 руб.', '', '', 'выход из декретного отпуска основного работника', '', '', 'интернет', '20000 руб.', '2014-02-08 05:02:14', 1, NULL),
(99, 'Продавец корпусной мебели', 'Лопызова', 'Анна', 'Владимировна', '1990-11-06 00:00:00', 'г.Зарайск', 'РФ', 'г.Рязань ул.Новоселов', '8-929-067-86-20', 'lopuzova@mail.ru', 2, 'нет', 3, 2, 1, 'В', '3 года', 'Высшее\r\nСовременный технический институт\r\nсентябрь 2009-июнь 2013\r\nспециалист по сервису и туризму', '2010-02-03 00:00:00', '2011-03-23 00:00:00', '2011-03-24 00:00:00', '2013-10-30 00:00:00', '2013-11-15 00:00:00', '2014-01-28 00:00:00', 'менеджер по продажам', 'менеджер по продажам', 'Дизайнер-консультант в студии кухни', 'ООО "Европейский стандарт"', 'ООО "Кровля и Фасады"', 'ООО "Франчайзинговый центр ОБИ"', 'Рязань', 'Рязань', 'Рязань', '•	Презентация продукции  •	Консультация клиентов  •	Оформление технической документации, подписание ', '•	Создание клиентской базы, поддержание работоспособности существующих клиентов:  •	Полный цикл сопр', '•	Консультирование клиентов  •	Презентация продукта  •	Дизайн проект  •	Оформление документооборота ', '12 000', '30 000', '20 000', 'низкий доход', 'сезонность', 'специфика работы', 'лифт', '25 000-30 000', '2014-02-08 11:07:48', 1, NULL),
(100, 'Менеджер по продажам', 'дементьев', 'александр', 'михайлович', '1984-01-11 00:00:00', 'рязань', 'рф', 'рязань', '89209513254', 'aleksandrdemente@yandex.ru', 1, 'сын 2 года', 1, 2, 1, 'в.с', '8 лет', 'среднеспециальное', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'интернет', '30000т.р', '2014-02-10 10:39:47', 1, NULL),
(101, 'Менеджер по продажам', 'Шолохова ', 'Екатерина', 'Дмитриевна', '1992-03-03 00:00:00', 'Рязанская область Кораблинский район', 'Россия', 'г.Рязань, ул.Октябрьская д. 53', '8900-903-60-83', 'keti.92@bk.ru', 2, '-', 3, 2, 2, 'B', '-', 'РГУ имени Есенина 2011-2015 Юридический', '2011-06-01 00:00:00', '2012-04-01 00:00:00', '2012-05-17 00:00:00', '2013-05-21 00:00:00', '2013-07-01 00:00:00', '2014-02-01 00:00:00', 'продавец', 'штамповщик', 'Работник торгового зала', 'Карандаш маркет', 'ОАО "ГРПЗ"', 'группа компаний qWell', 'рязань', 'рязань', '', 'продажа канцелярских товаров, прием товара, проверка ценников.', 'изготовление деталей на пресу холодной штамповки', 'Раскладка товара, подготовка товара к выкладке, проверка сроков годности', '10000', '12000', '10000', '-', '-', '-', 'интернет', '15000', '2014-02-10 12:47:42', 1, NULL),
(102, 'Работник склада', 'Наконечный ', 'Виталий ', 'Владимирович', '1975-07-23 00:00:00', 'Черниговская обл.', 'РФ', 'г.Рязань ул. Касимовское шоссе д.12 кв.80', '89106319379', 'vitvlad1975@yandex.ru', 2, 'нет', 1, 2, 2, 'В,С', '16 лет', 'Средне-техническое. Рязанский строительный колледж, с 1990 по 1993, Техник-строитель-технолог.', '2007-03-21 00:00:00', '2009-08-03 00:00:00', '2010-06-07 00:00:00', '2012-07-31 00:00:00', '2012-09-15 00:00:00', '2013-09-30 00:00:00', 'мастер', 'прораб', 'мастер-прораб', 'ООО "Автомост-Р"', 'ООО "Ремстроймонтаж"', 'ООО "СМУ-12 Метростроя"', 'г. Рязань', 'г.Рязань', 'г. Москва', 'строительство', 'строительство', 'строительство', '20000', '25000', '50000', 'по собственному желанию', 'по собственному желанию', 'по собственному желанию', 'интернет', 'от 30 000 р.', '2014-02-13 07:14:08', 1, NULL),
(103, 'Кассир', 'Юдина', 'Ирина', 'Алексеевна', '1983-03-18 00:00:00', 'с.Пертово Рязанской области', 'рф', 'Г.Рязань Касимовское шоссе д48 к5 кв9', '89009094235', 'irinaydar@mail.ru', 1, '2', 3, 2, 1, 'Б', '6 месяцев', 'среднее-специальное \r\nПрофессиональный лицей №11\r\n1998-2001\r\nКассир с бух.учетом\r\n\r\n', '2008-01-22 00:00:00', '2009-03-31 00:00:00', '2012-01-18 00:00:00', '2012-04-25 00:00:00', '2012-10-08 00:00:00', '2013-10-16 00:00:00', 'продавец-консультант', 'продавец-кассир', 'помощник-воспитателя', 'ООО "Флигель"', 'ООО "Алфавит"', 'МБДОУ "Детский сад №138"', 'Рязань', 'Рязань', 'Рязань', 'общение с покупателями.и денежными средствами на кассе', 'работа на кассе', 'работа с детьми', '12000', '10000', '5000', 'сокращение под кризис 2009г', 'уволилась по собственному желанию', 'маленькая зароботная плата..по собственному желанию', ' с вашего сайта в интернете "Апельсин"', '20000', '2014-02-17 01:41:54', 1, NULL),
(104, 'Менеджер по продажам', 'Шувалов', 'Вячеслав', 'Александрович', '1978-03-19 00:00:00', 'город Луховицы', 'Российская Федерация', '140500, Московская область, г.Луховицы, ул.Жуковского, д.32, кв.21', '8-925-087-77-40', 'shuvalovva@mail.ru', 1, 'детей нет', 2, 2, 1, 'В', '15 лет', 'высшее\r\nРГПУ им.Есенина г.Рязань\r\n2003-2005\r\nюриспруденция/юрист', '2010-04-13 00:00:00', '0000-00-00 00:00:00', '2007-07-02 00:00:00', '2009-10-09 00:00:00', '2000-03-20 00:00:00', '2006-09-01 00:00:00', 'директор', 'оператор АЗС, менеджер АЗС', 'оператор ', 'ООО ЧОО "Стражник+"', 'ООО "Лукойл-Центрнефтепродукт"', 'ООО "Нафта-Лайн"', 'Московская область', 'Московская область', 'Московская обл.', 'организация деятельности фирмы, ведение переговоров', 'принятие, оформление, отпуск ГСМ и ТНП, контроль за персоналом, общение с клиентами', 'прием, отпуск, оформление ГСМ', '20 000', '27 000', '10 000', 'по собственному желанию', 'по собственному желанию', 'по соглашению сторон (закрытие фирмы)', 'интернет', '25 000-35 000', '2014-02-19 03:22:48', 1, NULL),
(105, 'Работник склада', 'Маркешкин', 'Алексей', 'Александровичь', '1991-09-06 00:00:00', 'рязанская область шиловский район', 'русский', 'г Рязань ул.Зубкова', '89308801429', 'kbhkijbhb@mail.ru', 1, 'нет детей', 1, 2, 1, 'В.С', '4 года', 'средне техническое', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'друзья', '25000', '2014-02-23 10:14:32', 1, NULL),
(106, 'Работник склада', 'Алферов', 'Алексей', 'Александрович', '1991-04-24 00:00:00', 'Зарайск', 'РФ', 'Зарайск', '8-916-427-31-58', 'xp2@mail.com', 2, 'нет', 2, 2, 2, 'нет', 'нет', 'незаконченное высшее КИ(ф) МГОУ, 2009-2014 специальность ГМУ, менеджер', '2013-01-20 00:00:00', '2013-09-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'продавец-консультант', '', '', 'ИП Архипов', '', '', 'Зарайск', '', '', 'консультация в строительном магазине, отдел электроинструментов', '', '', '15000', '', '', 'восстановление в институте', '', '', 'apelsin.ru', '20000', '2014-02-24 02:41:09', 1, NULL),
(107, 'Секретарь', 'Шатилова', 'Светлана', 'Вадимовна', '1995-08-13 00:00:00', 'г. Рязань', 'Россия', 'г. Рязань, ул. Пушкина, д. 42', '+79537355390', 'shatilova_95@mail.ru', 2, 'нет', 3, 2, 2, 'нет', '6 месяцев', 'неполное высшее образование. студентка 1 курса РГУ имени С.А. Есенина. факультет Социологии и управления по специальности Управление персоналом (заочное отделение)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2013-09-09 00:00:00', '0000-00-00 00:00:00', '', '', 'лаборант', '', '', 'ГБОУ ВПО РязГМУ имени И.П. Павлова', '', '', 'Рязань', '', '', 'документооборот, работа с ПК', '', '', '6000 рублей', '', '', '', 'http://apelsin.ru/ru/', '15000рублей', '2014-02-25 12:36:46', 1, NULL),
(108, 'Менеджер по продажам', 'Трепалина', 'Марина', 'Анатольевна', '1987-12-22 00:00:00', 'г.Рязань', 'российское', 'г.Рязань, ул.Новосёлов, д.50, к.1, кв.34', '8-900-904-00-49', 'studentka34@mail.ru', 2, 'не имеются', 3, 2, 2, 'B', '10.11.2009', 'Академия права и управления ФСИН России, 2005-2010г.г., очная форма обучения, юриспруденция/юрист', '2012-08-28 00:00:00', '2013-10-24 00:00:00', '2012-01-06 00:00:00', '2012-05-15 00:00:00', '2010-12-30 00:00:00', '2011-10-17 00:00:00', 'специалист отдела телемаркетинга/заместитель руководителя отдела', 'Администратор', 'бармен', 'ООО "Страховое представительство "Финист"', 'ООО "АвтоБлеск"', 'ООО "Биопит-Сервис"', 'г.Рязань', 'г.Рязань', 'г.Рязань', 'Продажа страховых продуктов, консультация клиентов,ежедневная отчетность, обучение новых сотрудников', 'Организация работы комплекса, учет рабочего времени сотрудников, операции с кассой', 'обслуживание клиентов, операции с наличностью, ведение кассового журнала', '20 000', '15 000', '18 000', '', '', '', 'рассказали знакомые', '30 000', '2014-02-25 06:49:07', 1, NULL),
(109, 'Менеджер по продажам', 'Шайбаков', 'Ильдар', 'Рашидович', '1981-04-05 00:00:00', 'г. Южноуральск', 'РФ', 'г. Луховицы', '89167828157', 'i.shaibakov@rambler.ru', 1, 'дочь-2008 г.\r\nпасынок- 1996 г.', 1, 2, 1, 'В', '5 лет', 'средне-специальное\r\n9 Высшие офицерские курсы (10 месяцев)командир взвода механизации\r\nЧитинский областной медицинский колледж (1 год 10 месяцев) сестринское дело', '1999-06-29 00:00:00', '2013-12-31 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'старший помощник начальника штаба', '', '', 'войсковая часть', '', '', 'московский', '', '', '     Помощник начальника штаба отвечает за ведение несекретного делопроизводства и учет личного сост', '', '', '31000', '', '', 'организационно-штатные мероприятия', '', '', 'реклама', '30000', '2014-02-27 01:15:10', 1, NULL),
(110, 'Менеджер по продажам', 'Арапов', 'Алексей', 'Владимирович', '1979-09-15 00:00:00', 'г.Рязань', 'Россия', 'г.Рязань, ул.Большая, д.94, кв.40', '+79537390033', 'alexey1509@list.ru', 1, 'Одна дочка-6 лет', 2, 2, 1, 'В', '16', 'Рязанская Государственная Радиотехническая Академия\r\nГуманитарный факультет\r\n специалист по социальной работе\r\n1998-2004г.\r\n', '2010-09-01 00:00:00', '2013-10-01 00:00:00', '2004-12-01 00:00:00', '2010-09-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Главный специалист подразделения продаж и развития каналов продвижения', 'Ведущий специалист, главный специалист, начальник отдела продаж,  заместитель директора', '', 'страховая компания СОГАЗ Рязанский филиал', 'Страховая компания "МАКС, ЗАО" ', '', 'Рязань', 'Рязань', '', 'Поиск клиентов, заключение договоров страхования имущества', 'Поиск клиентов, заключение договоров страхования имущества, ', '', '25', '20000', '', 'по собственному желанию', 'по собственному желанию', '', 'от знакомых', 'от 25 000', '2014-03-06 03:40:38', 1, NULL),
(111, 'Менеджер по продажам', 'Прокофьева', 'Ирина', 'Игоревна', '1990-02-01 00:00:00', 'Чита', 'РФ', 'Рязвнь', '89209637729', '4iksa90@mail.ru', 2, 'Детей нет', 3, 2, 2, 'В', '4', 'СТИ, 2007-2013, ПГС, инженер\r\n\r\nРГКОТЭП, 2005-2009, Водоснабжение и водоотведение, техник', '2008-05-01 00:00:00', '2008-08-31 00:00:00', '2009-04-05 00:00:00', '2010-08-01 00:00:00', '2010-10-11 00:00:00', '2014-03-04 00:00:00', 'укладчик-упаковщик гофротары', 'официант-бармен', 'продавец-консультант', 'РКРЗ', 'ООО "Путь"', 'ООО"Нью-Тон"', '62', '62', '62', 'производство гофротары,подсчёт,упаковка', 'обслуживание клиентов', 'продажи,консультации,  оформления заказов', '9000', '18000', '18500', 'по собственному желанию', 'по собственному желанию', 'по собственному желанию', 'интернет', '22000', '2014-03-10 11:19:22', 1, NULL),
(112, 'Оператор-кассир', 'Прокофьева', 'Ирина', 'Игоревна', '1990-02-01 00:00:00', 'Чита', 'РФ', 'Рязань', '89209637729', '4iksa90@mail.ru', 2, 'Детей нет', 3, 2, 2, 'В', '4', 'СТИ,  2007-2013,  ПГС, инженер\r\n\r\nРГКОТЭП,  2005-2009,  Водоснабжение и водоотведение,  техник', '2008-05-01 00:00:00', '2008-08-31 00:00:00', '2009-04-05 00:00:00', '2010-08-01 00:00:00', '2010-10-11 00:00:00', '2014-03-04 00:00:00', 'укладчик-упаковщик гофротары', 'официант-бармен', 'продавец-консультант', 'ЗАО "РКРЗ"', 'ООО "Путь"', 'ООО"Нью-Тон"', '62', '62', '62', 'производство гофротары,подсчёт,упаковка', 'обслуживание клиентов', 'продажи,консультации,  оформления заказов', '9000', '18000', '18500', 'по собственному желанию', 'по собственному желанию', 'по собственному желанию', 'интернет', '22000', '2014-03-10 11:26:09', 1, NULL),
(113, 'Работник склада', 'Кудряшова', 'Артём', 'Сергеевич', '1991-02-15 00:00:00', 'Нижний Ногород', 'русский', '1е Бутырки д.8 ', '8930-87-44-991', 'artem_kudryashov_91@mail.ru', 1, '1 сын.1,8 лет', 1, 2, 2, 'нет', 'нет', 'Неполное высшее\r\nРВВДКУ\r\n2008-2011\r\nУправление персоналом/менеджмент', '2011-08-10 00:00:00', '2012-06-20 00:00:00', '2012-08-08 00:00:00', '2013-02-25 00:00:00', '2013-04-25 00:00:00', '2013-11-27 00:00:00', 'старший объекта', 'страховой агент', 'менеджер по туризму', 'Беркут', 'Страховая компания «Цюрих»   ', 'Туристическое агентство Глобус', 'Нижний Новгород', 'нижний новгород', 'нижний новгород', 'охрана объекта,контроль работы сотрудников', 'ведение документации,заключение договоров', 'прямые продажи', '15 000', '19 000', '22 000', 'по семейным обстоятельствам', 'закрытие данного офиса', 'с переездом на новое место жительство', 'интернет,знакомые', '25 000', '2014-03-10 03:22:14', 1, NULL),
(114, 'Менеджер по продажам', 'Игонина', 'Олеся', 'Ивановна', '1986-02-18 00:00:00', 'Рязанская область', 'РФ', 'г.Рязань Солотчинское шоссе д.2 (напротив ТЦ "Круиз")', '8 (952) 123-09-38', 'igoninalesya@mail.ru', 3, 'нет', 3, 2, 2, 'нет', 'нет', 'Институт Гуманитарного Образования (ИГУМО)г.Москва   2002-2007г. специальность:психология', '2010-06-03 00:00:00', '2013-12-13 00:00:00', '2008-04-23 00:00:00', '2009-06-01 00:00:00', '2005-09-01 00:00:00', '2007-10-02 00:00:00', 'менеджер по подбору персонала', 'менеджер по подбору персонала', 'продавец-кассир', 'ООО "Букет Сервис" (оптовая продажа срезанных/горшечных цветов и аксессуаров)', 'ООО "ИнтерНомикос" (Группа Компаний "Алми") (сеть продуктовых магазинов)', 'ООО "Серебряный ветер" (магазин подарков, предметов интерьера и цветов)', 'г.Москва', 'г.Москва', 'г.Москва', 'массовый подбор линейного и административного персонала', 'массовый подбор линейного и административного персонала', 'консультирование клиентов в торговом зале, продажа предметов интерьера, цветов, отчетность', '40 000 руб.', '30 000 руб.', '25 000 руб.', 'разорение компании', 'переезд компании, что оказалось неудобным для меня по территориальному расположению', 'временный переезд в другой город по семейным обстоятельствам', 'реклама в магазине ', 'от 40 000 руб.', '2014-03-11 04:42:43', 1, NULL),
(115, 'Оператор отдела маркетинга', 'Тюличкин', 'Сергей', 'Николаевич', '1989-02-03 00:00:00', 'Азербайджанская Респ.', 'РФ', 'Рязанская обл., Старожиловский р-он, п. Рязанские сады, ул. Дачная 15\r\n', '89537345057, 89155979565', 'tulichkin.serg@mail.ru', 1, 'дочь, 3 месяца', 1, 2, 1, 'В', '3 месяца', 'средне специальное, Рязанский колледж электроники, 2006-2009гг, техническое обслуживание и ремонт радиоэлектронной техники', '2010-07-15 00:00:00', '2011-12-21 00:00:00', '2012-03-12 00:00:00', '2012-07-02 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'резчик бумаги и изделий из целлюлозы', 'старший электромеханик', '', 'ЗАО \\"МПК \\"КРЗ\\"', 'ЗАО Бройлер Рязани', '', 'рязань', 'Рязань', '', 'обслуживание, ремонт, наладка оборудования', 'обслуживание инкубаторов', '', '20000-25000', '17000-20000', '', 'семейные обстоятельства', 'задерживали зарплату ', '', 'интернет', '25000', '2014-03-14 11:50:19', 1, NULL),
(116, 'Менеджер по продажам', 'Рябинкина', 'Татьяна', 'Николаевна', '1977-06-05 00:00:00', 'МО г.Раменское', 'РФ', 'г.Рязань ул.Зубковой', '8-900-601-22-67', 'ryabinkina777@mail.ru', 1, '8 лет и 4 года', 2, 2, 2, 'нет прав', '15 лет', 'высшее Московский Государственный Университет Сервиса (МГУс) инженер технолог швейного производства 6 лет  заочная форма обучения', '2004-05-01 00:00:00', '2007-12-29 00:00:00', '2008-05-01 00:00:00', '2013-07-15 00:00:00', '2013-09-02 00:00:00', '2013-11-30 00:00:00', 'художник-дизайнер', 'менеджер по продаже окон пвх', 'менеджер по продаже окон пвх', 'ЗАО \\"Союзстройкомплект\\"', 'ООО\\"Благодать\\"', 'ООО \\"ХариС\\"', 'МО г.Раменское', 'МО г.Раменское', 'МО г.Воскресенск', 'изготовление наружной рекламы вывески баннеры', 'прием и оформление заказов консультации', 'прием и оформление заказов консультации', '', '20000', '18000', '', '', 'переезд в г.Рязань', 'из интернета на сайте апельсин', '20000', '2014-03-17 09:47:10', 1, NULL),
(117, 'Оператор отдела маркетинга', 'Лишак', 'Дмитрий', 'Викторович', '1990-04-12 00:00:00', 'Рязань', 'РФ', 'Г. Рязань', '+7(920)9602879', 'supernovagr8@gmail.com', 2, 'Нет', 3, 2, 2, 'нет', 'нет', 'Высшее, РГАТУ 2008-2013, очная форма, экономический факультет, специальность прикладная информатика в экономике', '2013-01-16 00:00:00', '2013-05-01 00:00:00', '2013-05-01 00:00:00', '2013-09-01 00:00:00', '2013-09-12 00:00:00', '2013-12-27 00:00:00', 'Маркетолог-аналитик', 'Менеджер проектов', 'Фандрайзер', 'ООО \\"Терра\\"', 'ООО \\"Терра\\"', 'РОС', 'Рязань', 'Рязань', 'Рязань', 'Исследование и анализ рынка', 'Разработка и вывод на рынок нового продукта', 'Поиск и привлечение спонсоров', '20 т.р.', '23 т.р.', '12 т.р.', 'Переход на другую должность', 'По семейным обстоятельствам не мог проводить полный рабочий день', 'Не интересная должность и ищу полный рабочий день теперь', 'Объявление в лифте', '24 т.р.', '2014-03-17 10:01:38', 1, NULL),
(118, 'Менеджер по продажам', 'Никонорова', 'Елена', 'Борисовна', '1976-08-04 00:00:00', 'Хабаровский край', 'РФ', 'Рязань', '8 961 010 80 05', 'l.nikonorova2014@yandex.ru', 1, 'Сын, 16 лет', 3, 2, 2, 'В', '15 лет', 'Высшее, Рязанский государственный агротехнологический университет, факультет агрономическмй\r\nученый агроном-эколог', '2005-07-23 00:00:00', '2012-08-30 00:00:00', '2012-09-01 00:00:00', '2013-09-01 00:00:00', '2013-10-01 00:00:00', '0000-00-00 00:00:00', 'специалист отдела земельного контроля', 'менеджер отдела продаж', 'администратор-кассир', 'Управление Россельхознадзора по Рязанской и Тамбовской областям', 'ООО Консультант Ока', 'ДЦ Изумрудный город', 'Рязань', 'Рязань', 'Рязань', 'проведение проверок, делопроизводство, отчетность', 'активные продажи продукта компании, проведение презентаций, опыт активных продаж, встречи с директор', 'прием платежей по кассе (1с 8), администрирование работы центра', '10 000', '25000', '12000', 'собственное желание', 'собственное желание', 'пока работаю', 'интернет', '25000 - 30000', '2014-03-18 09:01:31', 1, NULL),
(119, 'Менеджер по продажам', 'Качнова ', 'Мария', 'Сергеевна', '1992-07-07 00:00:00', 'Рязанская область, г.Сасово', 'русская', 'г.Рязань, ул.Керамзавода,д.14а, кв.1', '8-910-574-50-49', 'kachnovam@mail.ru', 2, 'нет, 21год', 3, 2, 2, 'В', '1 год', 'Высшее, РГАТУ, специальность товаровед-эксперт, обучение с 2009 по 2014', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'сайт апельсин', '20000', '2014-03-18 05:42:16', 1, NULL),
(120, 'Работник склада', 'Щевьёв', 'Денис', 'Васильевич', '1993-05-23 00:00:00', 'ряз. обл.', 'рф', 'рязань', '89511051938', 'shataeva-z@mail.ru', 1, 'есть, 1 год', 2, 2, 1, 'А, В, С', '2,5 года', 'высшее незаконченное\r\nргу им Есенина\r\n7:45-12:35\r\nгосударственное муниципальное управление, гос служащий\r\n ', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'интернет http://apelsin.ru/vacancies/ru/', '10000-15000', '2014-03-19 05:33:57', 1, NULL),
(121, 'Менеджер по продажам', 'Сокова', 'Ольга', 'Алексеевна', '1971-11-30 00:00:00', 'Пензенская область', 'РФ', 'г.Рязань, ул.Попова, д.19/43, кв.28', '8(906)544 41 30', 'cokova@mail.ru', 2, 'сын, 1992 г.р', 3, 2, 2, 'В', 'нет', 'высшее, Пензенский государственный педагогический институт им.Белинского, 1989-1994гг, учитель русского языка и литературы', '2013-11-18 00:00:00', '2014-03-18 00:00:00', '2009-08-12 00:00:00', '2013-11-05 00:00:00', '2008-07-08 00:00:00', '2009-08-08 00:00:00', 'менеджер по продажам корпоративного департамента', 'старший менеджер отдела маркетинга и сбыта ', 'менеджер по продажам', 'ООО Рельеф-Центр', 'ОАО Рязаньзернопродукт', 'ООО Плодовощторг', 'Рязань', 'Рязань', 'Рязань', 'участие в гос торгах, сопровождение корпоративных сделок', 'продажа муки дистрибьюторам, оптовым организациям, федеральным торговым сетям', 'организация продажи овощной  консервации оптовым торговым предприятиям', '25 000 руб', '30 000 руб', '20 000 руб', 'собственное желание', 'собственное желание', 'собственное желание', 'интернет', 'от 35 000  руб', '2014-03-20 03:47:30', 1, NULL),
(122, 'Менеджер по продажам', 'Безуглов', 'Константин', 'Викторович', '1984-02-08 00:00:00', 'с.Петропавловка р.Кыргызстан', 'РФ', 'г.Рязань ул.9-я линия д.30 кв.57', '+7 (930) 873-40-88', 'bezuglovkonstantin@mail.ru', 1, 'нет', 1, 2, 2, 'нет', 'нет', 'Среднее-техническое,Семилукский-Технико-Экономический колледж,2001-2002,Машинист Технологических Компрессоров 4 разряда.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Официальный сайт компании', '25 000-27 000', '2014-03-24 12:27:19', 1, NULL),
(123, 'Управляющий', 'Гончаров', 'Сергей', 'Фёдорович', '1977-11-14 00:00:00', 'с. Старобалтачево Балтачевского района респ. Башкортостан', 'РФ', '140500, Московская обл, Луховицкий р-н, Головачево д, 40 лет Победы ул, дом № 117', '+7 (985) 776-31-25', 'sfgmobile@gmail.com', 3, 'Дочь, 14 лет.', 2, 2, 1, 'В', 'с 1996г.', 'МОСКОВСКИЙ УНИВЕРСИТЕТ ПОТРЕБИТЕЛЬСКОЙ КООПЕРАЦИИ\r\n1994-1998\r\nЭкономист-менеджер\r\nLENOIR-RHYNE COLLEGE, Хиккори, Северная Каролина, США\r\n01.1995-09.1995\r\nМеждународное право, менеджмент, маркетинг, американская (англосаксонская) система учёта (финансы, бухгалтерский учёт).', '2008-11-17 00:00:00', '2014-03-25 00:00:00', '2006-07-15 00:00:00', '2008-11-17 00:00:00', '2001-01-05 00:00:00', '2006-07-15 00:00:00', 'Директор', 'Коммерческий директор', 'Менеджер по продажам', 'ООО «Луховицкий сыр»', 'ООО “Геобит» (Fostergroup)', 'LG Electronics Inc.', 'Московская обл., Луховицкий район', 'г. Москва', 'г. Москва', 'Управление компанией. Организация и контроль производственных технологий и процессов. ', 'Ценовая политика, работа с поставщиками, ассортиментная политика, оптовые клиенты.', 'Поиск дилеров, открытие и ведение фирменных магазинов,увеличение продаж, проведение рекламных акций.', '70000', '100000', '50000', 'Работаю по настоящее время', 'Переезд в другой регион', 'Переход на более высокооплачиваемую работу', 'Интернет', '100000', '2014-03-25 01:22:22', 1, NULL),
(124, 'Менеджер по продажам', 'Карачинский', 'Алексей', 'Юрьевич', '1991-01-11 00:00:00', 'Рязань', 'Россия', 'Зубковой 31а', '+79009011690', 'hlophlop62@mail.ru', 2, 'нет', 3, 2, 2, 'нет', 'нет', 'Высшее\r\nМосковский психолого-социальный университет\r\n2008-2013\r\nМенеджмент организации', '2013-11-13 00:00:00', '2013-12-13 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Менеджер по продажам', '', '', 'СП Финист', '', '', 'Рязань', '', '', 'Продажа страховых продуктов по телефону', '', '', '15000', '', '', 'Перевод в другой отдел', '', '', 'Интернет', '20000', '2014-03-25 06:08:53', 1, NULL),
(125, 'Оператор отдела маркетинга', 'Тюличкин', 'Сергей', 'Николаевич', '1989-02-03 00:00:00', 'Азербайджанская Респ.', 'РФ', 'г. Рязань', '89537345057, 89155979565', 'tulichkin.serg@mail.ru', 1, 'дочь 3,5 месяца', 1, 2, 2, 'В', '3 месяца', '2006-2009	\r\nрязанский колледж электроники\r\nрадиотехнический, техническое обслуживание радиоэлектронной техники\r\n', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'интернет', '25000-30000', '2014-03-31 11:15:11', 1, NULL),
(126, 'Кассир', 'Борискина', 'Анастасия', 'Игоревна ', '1989-10-19 00:00:00', 'Рязань', 'Россия', 'г.Рязань,ул.Попова (центр)', '8910 900 70 47', 'chicki@list.ru', 2, 'нет', 3, 2, 2, 'нет', 'нет', 'Средне-специальное\r\nРКТ\r\n2005-2008\r\nБухгалтер', '2008-05-01 00:00:00', '2009-03-20 00:00:00', '2009-05-01 00:00:00', '2009-12-10 00:00:00', '2010-08-31 00:00:00', '2014-04-01 00:00:00', 'продавец-кнсультант', 'менеджер по продажам', 'менеджер ', 'ИП Мичурин М.В.', 'м-н Элекс', 'ИП Гмыренков О.А.', 'Рязань', 'Рязань', 'Рязань', 'продажа моб.тел.,ак-сов.,подключение к операторам,работа на касс. аппарате,заполнение кассовых докум', 'консультирование клиентов,продажа техники', 'закупка товара,работа с кассой ,распред.товара по торг.точкам', '8000', '20 000', '15000', 'маленькая зп', 'сокращение', 'маленькая зп', 'интернет ', '20 000 и выше', '2014-04-02 02:36:47', 1, NULL),
(127, 'Кассир', 'Сорокина ', 'Анастасия ', 'Алексанровна', '1987-02-17 00:00:00', 'г.Рязань', 'РФ', 'г.Рязань,ул.Гоголя,д35к1,кв 41', '8-900-905-69-20', 'anastasiya8254@mail.ru', 1, 'Сын 5 лет', 3, 2, 2, 'в', '4 месяца', 'Средне специальное, ПУ-9,г.Рязани с 01-09-2002 по 30-06-2006. Швея  ', '2006-10-01 00:00:00', '2012-06-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Швея', '', '', 'ип. Чеглякова Лариса Анатольевна ', '', '', 'Рязань', '', '', 'Швея-закройщица ', '', '', '17000', '', '', 'По собственному желанию ', '', '', 'От сотрудника Вашей организации ', '22000', '2014-04-04 01:29:03', 1, NULL),
(128, 'Менеджер по продажам', 'Сорокина ', 'Анастасия', 'Алексанровна', '1987-02-17 00:00:00', 'г.Рязань', 'РФ', 'г.Рязань,ул.Гоголя,д 35 к 1,кв 41', '8-900-905-69-20', 'anastasiya8254@mail.ru', 1, 'Сын, 5 лет', 3, 2, 2, 'в', '4 месяца', 'Средне-специальное,ПУ-9,с 2002-09-01 по 2006 06-30,швея', '2006-10-01 00:00:00', '2012-06-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Швея', '', '', 'ип. Чеглякова Лариса Анатольевна', '', '', 'Рязань', '', '', 'Швея-закройщица', '', '', '17000', '', '', 'По собственному желанию', '', '', 'От сотрудника Вашей организации', '22000', '2014-04-04 01:40:32', 1, NULL),
(129, 'Менеджер по продажам', 'Королев', 'Михаил', 'Александрович', '1991-11-01 00:00:00', 'г.Рязань', 'РФ', 'г.Рязань', '8-910-574-42-60', 'korolev.step14@mail.ru', 2, 'нет', 3, 2, 2, 'В', '2 года', 'не законченное высшее,МГОУ им.Черномырдина\r\n2011-2014 г\r\nИнженер машиностроения', '2009-05-20 00:00:00', '2014-04-04 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'технический специалист', '', '', 'ООО \\"СТЭП\\"', '', '', 'г.Рязань', '', '', 'продвижение и продажа металлореж. инструмента', '', '', '28000', '', '', 'низкая зароботная плата', '', '', 'с официального сайта', 'от 30000', '2014-04-06 02:29:22', 1, NULL),
(130, 'Менеджер по продажам', 'Николаева', 'Валентина', 'Геннадьевна', '0000-00-00 00:00:00', 'Рязань', 'РФ', 'Город Рязань, улица Станкозаводская,дом 32/1', '8 953 744 60 25', 'Valia2009@inbox.ru', 2, 'Нет', 2, 2, 2, '----', '----', 'Рязанский колледж электроники( программирование в экономике )\r\nТехнологический колледж ( парикмахер )', '2012-04-15 00:00:00', '2012-08-10 00:00:00', '2013-11-07 00:00:00', '2014-02-12 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Продавец-консультант', 'Продавец-кассир', '', 'Связной', 'Доскервиль', '', '', '', '', 'Консультация и продажа клиентам товара', '', '', '17000', '16000', '', 'Учеба', 'По собственному желанию', '', 'Подруга работает в вашей организации, посоветовала ', '20000-25000', '2014-04-07 02:08:07', 1, NULL),
(131, 'Менеджер по продажам', 'Николаева', 'Валентина', 'Геннадьевна', '0000-00-00 00:00:00', 'Рязань', 'РФ', 'Город Рязань, улица Станкозаводская дом 32/1', '8 953 744 60 25', 'Valia2009@inbox.ru', 2, 'Нет', 2, 2, 2, 'Нет', 'Нет', 'Рязанский колледж Электроники\r\n( программирование в экономике)\r\nТехнологический колледж\r\n( парикмахер )', '2012-04-15 00:00:00', '2013-08-10 00:00:00', '2013-05-17 00:00:00', '2014-08-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Продавец- консультант ', 'Продавец-консультант', '', 'Связной', 'Доскервиль', '', '', '', '', 'Консультация и продажа клиентам товара', 'Консультирование и продажа товара клиентам', '', '17000', '15000', '', 'Учеба ', 'Защита диплома', '', 'Подруга работает в вашей организации', '15000-20000', '2014-04-08 02:42:28', 1, NULL),
(132, 'Менеджер по продажам', 'Сокова', 'Ольга', 'Алексеевна', '1971-11-30 00:00:00', 'Пензенская область', 'Россия', 'г.Рязань, ул.Попова, д.19/43, кв.28', '8 906 544 41 30', 'cokova@mail.ru', 2, 'сын, 1992 г.р.', 3, 2, 2, 'В', '1', 'высшее, Пензенский государственный педагогический институт, 1989-1994 гг, учитель русского языка и литературы', '2013-11-18 00:00:00', '2014-03-18 00:00:00', '2009-08-12 00:00:00', '2013-11-05 00:00:00', '2008-07-07 00:00:00', '2009-08-10 00:00:00', 'менеджер по продажам', 'менеджер по продажам', 'менеджер по продажам', 'ООО \\"Рельеф-центр\\"', 'ОАО \\"Рязаньзернопродукт\\"', 'ООО \\"Плодовощторг\\"', 'Рязань', 'Рязань', 'Рязань', 'Продажа канцелярских товаров. Консультирование контрагентов по ассортименту, цене, условиям работы. ', 'Продажа муки. Консультирование контрагентов по цене и условиям работы. Контроль дебеторской задолжен', 'Продажа консервов. Консультации по ассортименту, цене и условиям работы. Контроль дебеторской задолж', '28 000 руб', '35 000 руб', '20 000 руб', 'собственное желание', 'собственное желание', 'собственное желание', 'Интернет', 'от 40 000 руб', '2014-04-08 07:21:10', 1, NULL),
(133, 'Кассир', 'Смирнова', 'Мария ', 'Алексеевна', '1986-12-19 00:00:00', 'Рязанская обл.Кадомский р-он', 'РФ', 'г.Рязань', '89105778682', 'mati1986@list.ru', 2, 'нет', 3, 2, 2, 'нет', 'нет', 'Среднее специальное, Квалификация бухгалтер по специальности экономика,бухгалтерский учёт и контроль(по отраслям)', '2005-08-01 00:00:00', '2013-02-24 00:00:00', '2013-03-11 00:00:00', '2014-04-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'продавец-кассир', 'кассир', '', 'ИП Бохолдина', 'ООО\\"Перспектива Плюс\\"', 'нет', 'г.Рязань', 'г.Рязань', '', 'Консультация клиентов,Прием наличного и безналичного расчёта.', 'Прием наличного и безналичного расчета, Работа на кассе', '', '10000', '21000', '', 'Прекращение работы организации', 'По собственному желанию', '', 'интернет', '25000', '2014-04-11 01:19:42', 1, NULL),
(134, 'Продавец корпусной мебели', 'Игнатов', 'Александр', 'Андреевич', '1991-01-10 00:00:00', 'г. Рязань', 'РФ', 'г. Рязань, ул. Костычева', '+7-953-741-31-90', 'ign_alex91@mail.ru', 2, '23 год, детей нет', 2, 2, 2, 'Б', '4', 'Высшее, РГРТУ, 2008-2013 очная форма, инженер - промышленная электроника', '2012-12-12 00:00:00', '2013-04-04 00:00:00', '2014-01-17 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'специалист', 'специалист', '', 'ОАО \\"МТС Банк\\"', 'ООО \\"Нанофинанс\\"', '', 'Рязань', 'Рязань', '', 'консультация клиентов банка по телефону', 'прием заявок на займы по тел', '', '25000', '18000', '', 'невозможность совмещения работы и учебу', '', '', 'реклама в лифте', '20000-25000', '2014-04-12 11:56:11', 1, NULL),
(135, 'Работник склада', 'Лесовой', 'Александр', 'Семенович', '1987-09-08 00:00:00', 'г. Феодосия, Крым', 'РФ', 'г. Рязань, ул. Кальная, д. 9, кв. 92', '+7 900 601 2528', '2012liz@mail.ru', 1, 'нет', 1, 2, 1, 'B C', '8 лет', 'Рязанский колледж электроники, направление \\\\\\"Компьютерные сети\\\\\\"', '2008-05-01 00:00:00', '2013-07-01 00:00:00', '2013-07-15 00:00:00', '2013-12-30 00:00:00', '2014-03-01 00:00:00', '2014-03-01 00:00:00', 'докер-механизатор', 'водитель-механик', 'нет', 'Феодосийский морской торговый порт', 'ПСО \\\\', 'нет', 'Республика Крым', 'Рязань', 'нет', 'механизированная погрузка-разгрузка ', 'водитель грузовых авто, их же ремонт', 'нет', '15 000 руб.', '20 000 руб.', 'нет', 'переезд в другой город', 'по запросу', 'нет', 'Знакомые работают у вас, положительно отзываются', '30 000 руб.', '2014-04-14 12:28:30', 1, NULL),
(136, 'Менеджер по продажам', 'Усюкин', 'Сергей', 'Анатольевич', '1986-09-18 00:00:00', 'п.Солотчинское ТБП Рязанского района Рязанской област', 'Россия', 'д.Насурово Ряз.Район Ряз.области', '8 952 121-20-89', 'usa165@yandex.ru', 1, 'нет', 1, 2, 1, 'B', '4 года', 'Средне-специальное.Рязанский Государственный технологический Колледж.2005-2008 г.г. техник', '2014-02-03 00:00:00', '2014-04-16 00:00:00', '2013-04-10 00:00:00', '2013-10-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Кладовщик', 'Кладовщик', '', 'ЭТМ', 'ГМ \\"Стройка\\"', '', 'Рязань', 'Рязань', '', 'разгрузка-погрузка товара', 'прием товара', '', '18000', '15000', '', 'собственное желание', '', '', 'Официальный сайт', '20000', '2014-04-14 01:17:42', 1, NULL),
(137, 'Кассир', 'Царькова ', 'Мария', 'Александровна', '1989-02-26 00:00:00', 'г.Рязань', 'Россия', 'г.Рязань', '8-952-125-08-95', 'igumnova89@list.ru', 2, '1 ребёнок ; 7 лет', 3, 2, 1, 'B', '1 год', 'средне-специальное ; секретарь-референт', '2013-04-01 00:00:00', '2013-09-25 00:00:00', '2012-06-13 00:00:00', '2012-12-07 00:00:00', '2012-09-26 00:00:00', '2012-12-19 00:00:00', 'продавец-кассир', 'продавец-кассир', 'продавец-кассир', 'Мотиви-М', 'Марка Рус', 'ТД Барс', '', '', '', 'работа с покупателями и кассовым аппаратом', 'работа с кассовым аппаратом и консультация покупателей', '', '15 000', '16 000', '14 000', 'закрытие магазина', 'задержка зар. платы', 'сокращение персонала', 'объявление в интернете', '16 000', '2014-04-15 09:50:06', 1, NULL),
(138, 'Оператор отдела маркетинга', 'Дружинина', 'Лилия', 'Андреевна', '1991-04-28 00:00:00', 'Рязанская обл. Михайловский р-он. пос. Октябрьский.', 'РФ', 'г. Рязань, ул. Каширина, д. 8, кв. 7', '89206386477', 'lilya_druzhinina@mail.ru', 1, 'нет', 3, 2, 2, 'нет', 'нет', 'Среднее профессиональное\r\nМосковский Институт Экономики Менеджмента и Права\r\nМенеджер', '2012-01-05 00:00:00', '2012-04-06 00:00:00', '2012-10-03 00:00:00', '2013-10-24 00:00:00', '2014-03-19 00:00:00', '2014-04-16 00:00:00', 'официант-бармен', 'продавец-консультант', 'старший кладовщик', 'кафе\\"Серебреный лев\\"', 'ИП Смирнова И.И.', 'ОАО \\"ГРПЗ\\"', 'г. Рязань', 'Рязань', 'Рязань', 'обслуживание посетителей', 'продажа товара,консультирование покупателей,оформление ветрин', 'выписка докуметов,выдача  инструмента.', '10', '13', '8', 'закрыли кафе', 'по собственному желанию', 'по собственному желанию', 'по знакомству', '20', '2014-04-16 03:33:16', 1, NULL),
(139, 'Кассир', 'Яковлева', 'Алла ', 'Андреевна', '1995-07-12 00:00:00', 'Московская обл. г. Одинцово', 'Россия', 'Московская обл. Луховицкий р-н\r\nс.Дединово, ул.Кислова-48, кв.23', '+79165613616', 'allabludova@yandex.ru', 2, 'нет', 3, 2, 2, 'нет', 'нет', 'г.Одинцово МБОУ Одинцовская гимназия №4 \r\n2002-2013\r\n', '2013-10-11 00:00:00', '2013-12-25 00:00:00', '2014-01-13 00:00:00', '2014-03-15 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Работник ресторана', 'Официант', '', 'ООО \\"Макдоналдс\\"', '\\"Бистро-Пронто\\"', '', 'Московская обл.', 'Московская обл.', '', '', 'Прием заказов от гостей ресторана. Подача блюд и напитков.                                          ', '', '15000-20000', '20000', '', 'По собственному желанию', 'По собственному желанию в связи с переездом.', '', 'Реклама', '20000-25000', '2014-04-16 06:10:21', 1, NULL),
(140, 'Оператор отдела маркетинга', 'Богомол', 'Юрий', 'Викторович', '1980-08-07 00:00:00', 'Рязань', 'российское', 'Рязань', '8-903=834-52-57', 'yura-ryazan@yandex.ru', 1, 'нет', 1, 2, 1, 'В', '13 лет', 'высшее, \r\nРязанская государственная радиотехническая академия, 1997-2002 г, инженер', '2009-03-02 00:00:00', '2014-04-17 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'руководитель отдела', '', '', 'ООО \\"Зельгрос\\"', '', '', 'Рязань', '', '', 'заказ товара, проведение инвентаризаций, ведение деловой переписки, планирование работы отдела', '', '', '27 000 руб', '', '', 'по соглашению сторон', '', '', 'интернет-сайт', '30 000 руб', '2014-04-18 11:15:44', 1, NULL),
(141, 'Кассир', 'Силкина', 'Вера', 'Алексеевна', '1978-10-24 00:00:00', 'Рязань', 'РФ', 'г.Рязань ул.Черновицкая', '8-920-954-08-76', 'silkina-vera@rambler.ru', 1, 'дочь - 10.10.2001 г.р.\r\nдочь - 03.10.2005 г.р.\r\nдочь - 03.10.2005 г.р.', 3, 2, 1, 'В', '5 лет', 'Рязанский торгово-коммерческий техникум\r\nс 1995 по 1997 г.г.\r\nбухгалтер', '1999-05-13 00:00:00', '2004-04-10 00:00:00', '2004-05-03 00:00:00', '2008-10-04 00:00:00', '2011-08-23 00:00:00', '2012-09-27 00:00:00', 'Исполнитель машинописных работ, Бухгалтер-кассир', 'продавец-консультант', 'Мастер по благоустройству, Инспектор ОК', 'Ям-401/6 УИН МЮ РФ по Ряз.обл.', 'ИП Слабов м-н Модная обувь', 'ООО \\\\', 'Ряз.обл., Ряз.р-он', 'Рязань', 'Рязань', '', '', '', '', '', '', 'Собственное желание', 'Собственное желание', 'Собственное  желание', 'на сайте компании', 'от 25000', '2014-04-18 01:18:20', 1, NULL),
(142, 'Менеджер по продажам', 'Пышки', 'Алексей', 'Николаевич', '1991-05-08 00:00:00', 'Г. Рязань', 'РФ', 'Зубковой д1', '89521271881', 'widger@mail.ru', 1, 'нет', 3, 2, 1, 'B', '4года', 'незаконченное высшее\r\nВладимирский университет экономики и управления( заочное)\r\n01092013-01062017\r\nЭкономист', '2012-06-25 00:00:00', '2013-04-25 00:00:00', '2013-04-25 00:00:00', '2013-11-06 00:00:00', '2013-11-06 00:00:00', '2014-04-27 00:00:00', 'старший продавец', 'продавец-кассир', 'продавец-консультант', 'Тд Нити', 'ЗАО Носимо', 'ООО Хастор', 'Рязань', 'Рязань', 'Рязань', 'Выскладка товара, консультация клиентов, прием и отгрузка товаров, работа с кассой и 1С', 'Выскладка товара, консультация клиентов, прием и отгрузка товаров, работа с кассой и 1С', 'Выскладка товара, консультация клиентов, прием и отгрузка товаров, работа с кассой и 1С', '25000', '25000', '27000', 'ПСЖ', 'ПСЖ', 'ПСЖ', 'реклама', '30000', '2014-04-23 02:17:25', 1, NULL),
(143, 'Менеджер по продажам', 'Куркин', 'Андрей', 'Витальевич', '1994-01-12 00:00:00', 'г. Рязань', 'РФ', 'Рязанский район, п. Подвязье, д.10, кв.61.', '8-964-158-51-19', 'airdiggerpwnz@gmail.com', 2, 'Нет', 1, 2, 2, 'нет', 'нет', 'Полное среднее образование, 2 курс заочно в РГАТУ (2013-2018), электросети/автоматизация оборудования', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 'отсутствует', 'отсутствует', 'отсутствует', '', '', '', '', '', '', '', '', '', '', '', '', 'Родственники', '15000+', '2014-04-23 04:19:00', 1, NULL),
(144, 'Менеджер по продажам', 'Дегтерев', 'Алексей ', 'Павлович', '1992-11-03 00:00:00', 'г. Рязань', 'РФ', 'г.Рязань Касимовское ш. д67 кв 12', '89105651682', 'greddy7@mail.ru', 2, 'нет 21', 1, 2, 1, 'B.C.', '2,5', 'среднеспециальное РЖДК-филиал МИИТ\r\nзаоч. обучение РГОТУПС-филиал МИИТ', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'интернет', '18000-20000', '2014-04-24 01:44:22', 1, NULL),
(145, 'Менеджер по продажам', 'Дегтерев', 'Алексей ', 'Павлович', '1992-11-03 00:00:00', 'г. Рязань', 'РФ', 'г.Рязань Касимовское ш. д67 кв 12', '89105651682', 'greddy7@mail.ru', 2, 'нет 21', 1, 2, 1, 'B.C.', '2,5', 'среднеспециальное РЖДК-филиал МИИТ\r\nзаоч. обучение РГОТУПС-филиал МИИТ', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'интернет', '18000-20000', '2014-04-24 01:45:39', 1, NULL),
(146, 'Менеджер по продажам', 'Васькова', 'Светлана', 'Викторовна', '0000-00-00 00:00:00', 'Рязань', 'Российское', 'г.Рязань, ул. Высоковольтная', '9537494308', 'lana.vaskova.2014@mail.ru', 2, 'нет', 3, 2, 2, 'нет', 'нет', 'Высшее, Санкт_петербургская академия управления и экономики,\r\nМенеджер', '2013-10-07 00:00:00', '2014-09-02 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'администратор', '', '', 'ЭсКлассКлиник города Рязани', '', '', '', '', '', 'прием и встреча клиентов, работа с клиентами', '', '', '10000', '', '', 'маленькая зарплата ', '', '', 'интернет', '25000', '2014-04-24 06:24:45', 1, NULL),
(147, 'Менеджер по продажам', 'Парамонова', 'Марина', 'Сергеевна', '1986-01-08 00:00:00', 'г.Спасск', 'РФ', 'г.Рязань, ул.Тимакова, д.14', '89537384470', 'pkvmms@mail.ru', 2, 'Сын, 9 лет. Проживает отдельно.', 3, 2, 2, 'нет прав', 'нет', 'Профессиональный лицей√7(2004-2008).\r\nМоделироавание и конструирование швейных изделий/конструктор-модельер.', '2009-02-01 00:00:00', '2011-05-10 00:00:00', '2011-06-15 00:00:00', '2011-12-01 00:00:00', '2011-12-11 00:00:00', '0000-00-00 00:00:00', 'продавец-консультант', 'кассир', 'администратор', 'спорт магазин', 'общепит', 'общепит', 'г. Рязань', 'г. Рязань', 'г.Рязань', 'консультирование покупателей по интересующим их вопросам', 'проводила расчетно-кассовые операции', 'Обеспечиваю работу по эффективному и культурному обслуживанию посетителей', '10т.р.', '15т.р.', '20т.р.', 'недостаточный заработаок', 'закрытие заведения', 'отсутствие своевременной заработной платы, график работы', 'от знакомых', 'от 20т.р.', '2014-04-25 04:24:11', 1, NULL),
(148, 'Менеджер по продажам', 'Сидоров', 'Сергей', 'Сергеевич', '1990-04-12 00:00:00', 'Рязань', 'РФ', 'Первомайский проспект дом 64 корпус 2 квартира 29', '89290677635', 'sidorov1890@mail.ru', 2, 'нет', 2, 2, 2, 'Нет', 'Нет', 'Высшее \r\nРгату\r\n5лет \r\nэкономический факультет менеджмент в социальной работе', '2010-10-01 00:00:00', '2010-10-31 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'переписчик', '', '', 'Росстат', '', '', 'Рязанский', '', '', 'перепись населения', '', '', '5000', '', '', 'окончание срока работы', '', '', 'Рекламы', '15000', '2014-04-30 02:38:45', 1, NULL),
(149, 'Менеджер по продажам', 'Сауткин', 'Максим', 'Николаевич', '1989-01-28 00:00:00', 'город Рязань', 'РФ', 'город Рязань, ул. Новоселов, дом 35 к. 4', '+79521266808', 'maksautkin@rambler.ru', 2, 'нет', 2, 2, 2, 'Б', '5 лет', 'Высшее\r\nМосковский институт экономики, менеджмента и права (2006-2011)\r\nЭкономист/финансы и кредит', '0000-00-00 00:00:00', '2012-08-02 00:00:00', '2013-03-25 00:00:00', '2014-04-28 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'работа в бригаде', 'Продавец-консультант', '', 'РязаньСтеклоПак', 'магазин Дачник', '', '', '', '', '', '', '', '', '', '', '', '', '', 'от друзей', '25-35', '2014-05-04 10:47:22', 1, NULL),
(150, 'Карщик', 'иванов', 'андрей', 'сергеевич', '1984-04-10 00:00:00', 'г.рязань', 'РФ', 'Г.РЯЗАНЬ УЛ НОВАТОРОВ ', '8 953 741 3979', 'anduruha2010@gmail.com', 1, '4 года,мальчик', 1, 2, 2, 'на погруз.', '2 года', 'среднее', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2002-06-25 00:00:00', '2010-10-10 00:00:00', '', '', 'ком отделения', '', '', 'служил по кантракту', '', '', '------', '', '', '-----', '', '', '23 000', '', '', 'окончание кантракт', 'реклама', '1300 в день', '2014-05-05 11:05:18', 1, NULL),
(151, 'Карщик', 'иванов', 'андрей', 'сергеевич', '1984-04-10 00:00:00', 'г.рязань', 'РФ', 'Г.РЯЗАНЬ УЛ НОВАТОРОВ ', '8 953 741 3979', 'anduruha2010@gmail.com', 1, '4 года,мальчик', 1, 2, 2, 'на погруз.', '2 года', 'среднее', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2002-06-25 00:00:00', '2010-10-10 00:00:00', '', '', 'ком отделения', '', '', 'служил по кантракту', '', '', '------', '', '', '-----', '', '', '23 000', '', '', 'окончание кантракт', 'реклама', '1300 в день', '2014-05-05 11:05:20', 1, NULL),
(152, 'Менеджер по продажам', 'Чистяков ', 'Андрей', 'Александрович', '1979-11-18 00:00:00', 'г.Рязань', 'Российское', 'г.Рязань,, ул. Новоселов, д. 56 корпус 1, кв.13', '+7(953) 7411932', 'empty79@rambler.ru', 1, 'csy 6.5лет', 1, 2, 1, 'В С Е', '17 лет', 'высшее, Академия Управления и Экономики, 2003-2009гг,Экономист', '2013-03-01 00:00:00', '2014-03-07 00:00:00', '2008-10-01 00:00:00', '2013-02-28 00:00:00', '2006-10-01 00:00:00', '2008-06-15 00:00:00', 'логист', 'координатор', 'торговый представитель', 'ОАО \\"Шацкий мясокомбинат\\"', '2.	ИП Казаков', 'ООО «SabMiller»', 'Рязань', 'Рязань', 'Рязань', 'Организация работы торговых представителей формирование целей и способов их достижения, мотивировани', 'Обработка заказов от торговой команды и оптимальное составление маршрутов по районности и грузоподъе', 'расширение и развитие клиентской базы, продвижение новой продукции, увеличение уровня продаж, ведени', '35000р.', '28000р.', '25000р.', 'продажа филиала другой управляющей компании', 'не готов к переезду на ПМЖ в другой город', 'з\\\\п.', 'интернет', '60000р.', '2014-05-05 12:39:46', 1, NULL),
(153, 'Менеджер по продажам', 'Герасимов ', 'Илья', 'Геннадьевич', '1993-07-02 00:00:00', 'г.Рязань', 'РФ', 'г.Рязань Кассимовское щоссе д.57 кв.171', '8 960 573 55 22', 'rznboy@mail.ru', 2, 'не имею', 1, 2, 1, 'B,C', '3 года', '11 классов,учусь в агротехнологическом университете 3 курс по специальности менеджмент', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Реклама', '25000', '2014-05-06 10:39:06', 1, NULL),
(154, 'Менеджер по продажам', 'Шишова ', 'Валентина ', 'Эдуардовна', '1992-10-02 00:00:00', 'Кировская обл., Куменский р-н, с. Быково', 'РФ', 'ул. Большая д. 98 кв. 78', '89209941992', 'shishok-ryazanski@yandex.ru', 1, 'Нет', 3, 2, 2, 'B', '1 год', 'Высшее (месяц до получения диплома) РГУ институт иностранных языков, преподаватель японского и английского языков', '2011-05-12 00:00:00', '2013-11-27 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'секретарь, менеджер по работе с клиентами', '', '', 'ООО \\"ПриоДОК\\"', '', '', 'Рязань ', '', '', 'составление договоров,привлечение клиентов,ведение документации', '', '', '25000 р.', '', '', 'закрытие фирмы', '', '', 'интернет', 'от 20000 р.', '2014-05-09 04:40:50', 1, NULL),
(155, 'Менеджер по продажам', 'Феклушкин', 'Александр', 'Сергеевич', '1989-10-17 00:00:00', 'ПГТ Днестровск Молдавской АССР', 'РФ', 'Ул.Есенина, д.112', '89105023808', 'alexandr1989@ro.ru', 2, 'Нет в наличии', 2, 2, 1, 'B', '3+', 'Московский Государственный институт имени С.Ю.Витте (Рязанский филиал), 5 лет, Менеджер по специальности Менеджмент Организации.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Газеты, друзья, реклама в лифте...', 'От 18 000 рублей', '2014-05-12 04:27:58', 1, NULL),
(156, 'Менеджер кредитного отдела', 'Кудрявцев', 'Максим', 'Владимирович', '1985-07-25 00:00:00', 'Рязань', 'РФ', 'ул. Гагарина, д. 71, кв. 15', '9036403657', 'kudryavtsev.maksim62@yandex.ru', 1, '1 ребенок 6 лет', 2, 2, 2, '-', '-', 'Высшее, РГУ им. С. А. Есенина, 2002-2007, экономист', '2013-08-05 00:00:00', '2014-05-13 00:00:00', '2012-10-06 00:00:00', '2013-08-01 00:00:00', '2011-10-03 00:00:00', '2012-01-16 00:00:00', 'Операционист-бух. работник', 'Специалист по работе с клиентами', 'менеджер', 'ОАО КБ МАСТ-Банк', 'ОАО АБ \\"Пушкино\\"', 'КБ Стройкредит', 'Рязань', 'Рязань', 'Рязань', 'Обслуживание физ. и юр. лиц', 'Привлечение, кредитование физ. лиц', 'Кредитование физ. лиц', '23000', '22000-23000', '20000', '-', 'Ухудшение экономической ситуации внутри организации', 'Не устроил уровень дохода', 'Сайт', '28000-30000', '2014-05-13 09:31:04', 1, NULL),
(157, 'Секретарь', 'Жукова', 'Ирина', 'Игоревна', '1989-03-12 00:00:00', 'Рязань', 'РФ', 'Рязань', '+79537431075', 'irinamiheeva2@rambler.ru', 1, 'нет', 3, 2, 2, '0', '0', 'Высшее, Московский психолого-социальный университет,дневная форма обучения, специальность- лингвист-переводчик!', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'продавец-консультант (отдел мебель)', 'кредитно-страховой специалист', '', 'ООО \\"ТЦ Стройка\\"', 'ИП шаев', '', '', 'Рязань', '', '', 'консультирование клиентов по страхованию, страхование машин-ОСАГО, КАСКО, выдача кредитов', '', '17000', '15000', '', 'сокращение', '', '', 'на официльном сайте Апельсин', 'от 15000', '2014-05-13 11:54:30', 1, NULL),
(158, 'Кассир', 'Думкина', 'Светлана', 'Николаевна', '1970-08-13 00:00:00', 'г.Рязань', 'РФ', 'Г.Рязань ул Зубковой д21кв226', '8-920-969-43-13', 'sv.n.dumkina@gmail.com', 1, 'сын 1990г.', 3, 2, 2, 'нет', 'нет', 'высшее\r\nМИИТ\r\n2006-2011\r\nЭкономист', '2006-12-12 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'приемосдатчик груза и багажа', '', '', 'ООО\\"РЖД\\"', '', '', '', '', '', 'Работа с документами', '', '', '15000', '', '', 'семейное положение', '', '', 'интернет', '20000', '2014-05-13 12:09:33', 1, NULL),
(159, 'Менеджер по продажам', 'Ефремова', 'Оксана', 'Геннадьевна', '1990-01-19 00:00:00', 'Рязань', 'РФ', 'Рязань', '8 953 745-24-95', 'oksik19-19@mail.ru', 2, 'нет', 3, 2, 1, 'B', '4 года', 'Высшее; Московский университет имени С.Ю. Витте; 2007-2012гг.; специальность:\\"Налоги и налогообложение\\"', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Официальный сайт компании \\"Апельсин\\"', '20000', '2014-05-13 05:13:24', 1, NULL),
(160, 'Менеджер по продажам', 'Ершов', 'Алексей', 'Андреевич', '1991-07-18 00:00:00', 'Рязань', 'РФ', 'г.Рязань,ул.Новосёлов,д.40,к.3,кв 57', '89209745370', 'mikky773@yandex.ru', 2, 'нет', 1, 2, 2, 'B,C', '2 года', 'Высшее,Санкт-Петербургский университет управления и экономики,2008-2012г.г,Менеджер(Бакалавр)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Интернет,Объявления', '30000', '2014-05-26 04:36:13', 1, NULL),
(161, 'Кассир', 'Белова', 'Юлия', 'Андреевна', '1992-11-14 00:00:00', 'Луховицкий район с. Дединово', 'РФ', 'Московская область, Луховицкий район, п. Красная Пойма, ул.Гражданская, д.4 кв 10', '8-916-904-09-80', 'belova.yulya2010@yandex.ru', 2, 'нет', 3, 2, 2, 'В', '3 года', 'Среднее-специальное\r\nЛуховицкий авиационный техникум, \r\n09.2009г - 07.2012г\r\nбухгалтер', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Интернет', 'от 10 000 рублей', '2014-05-27 08:12:23', 1, NULL),
(162, 'Менеджер по продажам', 'Горянов', 'Дмитрий', 'Николаевич', '1990-09-06 00:00:00', 'Рязань', 'РФ', 'Рязань', '89106146600', 'dddiiimmm@bk.ru', 2, 'нет', 2, 2, 1, 'B', '5', 'Средне-профессиональное, Рязанский Колледж Электроники, 2005-2009, Тех. обслуживание вычислительной техники и комп. сетей, техник\r\n', '2011-08-21 00:00:00', '2014-02-06 00:00:00', '2010-07-20 00:00:00', '2011-05-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Менеджер представительства', 'Разнорабочий', '', 'ЗАО Юлмарт', 'ООО Первая приборная фабрика', '', 'Рязань', 'Рязань', '', 'Выдача заказанного товара клиентам, продажи, консультирование, касса, гарантия, приём/отправка товар', 'работа на металлорежущем ленточнопильном оборудовании и другое', '', '26', '12', '', 'изменение условий', '   ', '', 'ваш сайт', '25', '2014-05-28 04:09:37', 1, NULL),
(163, 'Кассир', 'Машина', 'Алина', 'Сергеевна', '1992-09-11 00:00:00', 'Казахстан', 'Казахстан', 'Г. Рязань, Ул. Касимовское шоссе 12 б-38', '89308779707', 'Alina159631@mail.ru', 1, '1 ребенок, 9 месяцев', 3, 2, 2, 'Нет', 'Нет', 'Средне-специальное. Рязанский железнодорожный колледж \\" оператор почтовой связи\\"', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', 'Не работала', '', '', '', '', '', '', '', '', '', '', '', '', 'Интернет', '25000', '2014-05-28 05:02:47', 1, NULL),
(164, 'Менеджер по продажам', 'Колькина', 'Ольга', 'Александровна', '1989-04-10 00:00:00', 'РП Сапожок Сапожковского р-на Рязанской обл.', 'РФ', 'ул. Тимакова,д.8,кв 18, г.рязань', '89521280343', 'kolkina89@mail.ru', 2, 'нет', 3, 2, 2, '0', '0', 'Московский институт экономики,менеджмента и права.\r\n2006-2011.юриспруденция/юрист', '2011-08-02 00:00:00', '2012-05-15 00:00:00', '2012-06-15 00:00:00', '2013-07-18 00:00:00', '2013-07-30 00:00:00', '2014-05-06 00:00:00', 'судебный пристав - исполнитель', 'продавец - консультант', 'менеджер', 'Советский районный отдел судебных приставов г.Рязань', 'ИП Крыгина О.Г.', 'ЗАО \\"Банк Русский стандарт\\"', '', '', '', 'ведение исполнительных производств', 'консультация клиентов,оформление продаж,заказов,прием товара', 'консультация клиентов,оформление кредитов', '10000', '12000', '9000', 'ненормированный график работы', 'территориальное расположение центра', 'разъездной характер работы', 'сайт компании', '15000-17000', '2014-05-29 02:38:21', 1, NULL),
(165, 'Менеджер по продажам', 'Карасев', 'Илья', 'Николаевич', '1988-05-14 00:00:00', 'Д. Первушкино', 'Россия', 'г. Спас-Клепики', '8-920-637-59-14', 'mr.karasev@yandex.ru', 2, 'нет', 3, 2, 1, 'B', '5', '1. Среднее профессиональное\r\n   Клепиковский Технологический Техникум\r\n   2003-2007\r\n   Бухгалтер-экономист\r\n2. Высшее\r\n   Санкт-петербургсакая академия управления и экономики\r\n   2007-2011\r\n   Финансы и кредит (финансовый менеджмент)', '2008-11-01 00:00:00', '2009-07-15 00:00:00', '2009-07-15 00:00:00', '2013-12-20 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Менеджер', 'менеджер', '', 'ООО \\"ПТК Бозово\\"', 'ООО \\"ПТК СпасСтрой\\"', '', 'Рязанская обл', 'Рязанская обл', '', 'Работа с корпоративными клиентами, обучение персонала, дополнительно администрирование', 'Работа с корпоративными клиентами, продажа строительных материалов', '', '30000', '30000', '', 'реорганизация предприятия ООО \\"ПТК Спасстрой\\"', 'Предстоящий переезд в г. Рязань', '', 'Сайт, работа с компанией как партнером', 'от 30000руб', '2014-06-02 12:12:31', 1, NULL),
(166, 'Менеджер по продажам', 'Беляков ', 'Константин', 'Александрович', '1982-12-17 00:00:00', 'Рязань', 'РФ', 'Рязань , Зубковой 31а-61', '9209701112', 'fred.sherman@mail.ru', 2, 'нет', 2, 2, 2, 'нет', 'нет', '«Рязанский медико-социальный колледж» (ОГБОУ СПО «РМСК»)\r\n2004-2006', '2012-03-04 00:00:00', '2013-09-07 00:00:00', '2011-12-06 00:00:00', '2012-05-10 00:00:00', '2008-05-25 00:00:00', '2011-09-26 00:00:00', 'администратор', 'администратор', 'админисратор', 'Магазин под рукой', 'Бэст прайс', 'ООО Тренд', 'московская обл', 'рязань', 'рязань', 'организация торгового процесса', 'контроль кассовой зоны,заказ прием списание товара,инкассация,документооборот', 'организация торгового процесса', '30000-40000', '17000', '15000-25000', 'работа в другом городе', 'маленький доход', 'ликвидация магазина', 'интернет', '25000', '2014-06-07 08:25:22', 1, NULL),
(167, 'Менеджер по продажам', 'дементьев', 'александр', 'михайлович', '1984-01-11 00:00:00', 'рязань', 'рф', 'рязань', '8 920 9513254', 'aleksandrdemente@yandex.ru', 1, 'да', 1, 2, 1, 'в.с', '8 лет', 'средне-специальное', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'интернет', '30000т.р', '2014-06-10 03:41:41', 1, NULL),
(168, 'Менеджер по продажам', 'Билявская', 'Валерия', 'Игоревна', '1994-08-15 00:00:00', 'Г.Новоросийск ', 'Россия', '3и Бутырки д.2 кв.2', '89308801380', 'bvizjvcia@mail.ru', 3, 'Да,7мес.', 3, 2, 2, 'В', '0', 'Среднее специальное. Рязанский аграрный техникум. Ветеринар.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'От друзей.', '8000 в неделю.', '2014-06-14 08:43:03', 1, NULL),
(169, 'Менеджер по продажам', 'Дутиков', 'Александр', 'Вячеславович', '1984-08-21 00:00:00', 'Луховицкий район, п Астапово', 'Россия', 'Московская область, Луховицкий район, п. совхоза Астапово, ул. Молодежная, д.60, кв.3', '89035194503', 'aldytikoff@yandex.ru', 2, 'нет', 2, 2, 1, 'В, С', '4', 'Высшее.\r\nКоломенский Институт Московского Государственного Открытого Университета.\r\nОчное.\r\n2001-2006.\r\nИнженер по специальности управление и информатика в технических системах.', '2006-08-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Начальник бюро', '', '', 'ОАО РСК МиГ', '', '', 'Московская область', '', '', 'Руководство бюро по ремонту и обслуживанию ПЭВМ.', '', '', '30000', '', '', '', '', '', 'Официальный сайт в интернете', '40000', '2014-06-23 11:11:54', 1, NULL),
(170, 'Работник склада', 'Гладкевич', 'Илья', 'Игоревич', '1987-02-05 00:00:00', 'г.Острогожск Воронежской Обл.', 'РФ', 'Г.Рязань ул.Новоселов д.53', '8 953 739 15 01           8 915 60 48 771', 'ilya-rzn@yandex.ru', 2, 'нет', 2, 2, 1, 'B', '-', 'высшее\r\nМИЭМП Рязань\r\n2004-2009\r\nЮрист. Юриспруденция.', '2012-02-01 00:00:00', '2012-11-05 00:00:00', '2012-05-14 00:00:00', '2012-09-21 00:00:00', '2012-10-24 00:00:00', '2014-06-09 00:00:00', 'продавец', 'работник торгового зала', 'продавец-консультант', 'Глобус Рязань', 'Ашан Рязань', 'м.Видео Рязань', 'Рязань', 'Рязань', 'Рязань', 'продажа и выкладка товаров', 'консультирование покупателей; продажи; прием товара', 'продажа и консульт. покупателей; выстовление товара; выполнение планов продаж.', '12 тр.', '12-13 тр.', '18 тр.', 'низкая зп', 'низкая зп; удаленность.', 'низкая зп; удаленность; желание сменить сферу деят.', 'интернет. желание рабоать в магазинах апельсин Дашки Рязань.', '25 тр.', '2014-06-23 04:06:13', 1, NULL),
(171, 'Менеджер по продажам', 'Фетисова', 'Татьяна', 'Сергеевна', '1981-10-31 00:00:00', 'г.Целиноград', 'РФ', 'г.Рязань ул.Советской Армии', '89209885962', 't-fetisova@mail.ru', 1, '14/11/2002\r\n12/05/2009', 3, 2, 2, 'нет', 'нет', 'Высшее. \\\\\\"Санкт-Петербургская Академия Управления и экономики.\\\\\\"\r\n2004-2009\r\nпсихолог', '2002-01-20 00:00:00', '2002-06-10 00:00:00', '2005-06-01 00:00:00', '2009-07-20 00:00:00', '2009-07-21 00:00:00', '0000-00-00 00:00:00', 'продавец', 'администратор', 'заместитель директора', 'ТД Барс', 'ООО Копейка - Москва', 'ЗАО ТД Перекресток', '', 'Рязань', 'Рязань', 'продажи', 'управление персоналом,инкассация', 'Управление персоналом, ведение КД, заказы', '12000', '18000', '24000', 'семейные обстоятельства', 'перевод ', '', 'интернет', '30000', '2014-06-24 05:50:32', 1, NULL),
(172, 'Менеджер по продажам', 'Гришанов', 'Максим', 'Николаевич', '1989-10-07 00:00:00', 'Луховицы ', 'Россия', 'Луховицы', '9167484735', 'm.grishanov@inbox.ru', 2, 'нет', 3, 2, 1, 'В', '4 года', 'не полное высшее 2009	\r\nАкадемический международный институт, Москва', '2012-02-20 00:00:00', '2012-11-30 00:00:00', '2013-04-01 00:00:00', '2014-01-31 00:00:00', '2014-04-03 00:00:00', '2014-06-19 00:00:00', 'Торговый представитель', 'Торговый представитель', 'Торговый представитель', 'ПО МОСПО', 'Восток', 'ООО ЦСТ (Rockwool)', 'Воскресенск', 'Воскресенск, Зарайск, Коломна, Луховицы', 'М-5 до Рязани включительно, Егорьевское шоссе', 'Продажи товаров народного потребления продуктовой группы полного спектра. Ведение клиентов. Прием за', 'Продажи товаров народного потребления продуктовой группы полного спектра. Ведение клиентов. Прием за', 'Поиск клиентов, Сбор заказов. Отслеживание дебиторской задолжности, отчеты в электронном виде', '50000 руб', '40000 руб', '50000 руб', 'сокращение', 'очень большая территория, снижение зарплаты', 'по собственному желанию', 'Центральный офис компании \\"Апельсин\\"', '40000 руб', '2014-06-26 01:25:15', 1, NULL),
(173, 'Управляющий', 'Орехов', 'Павел', 'Александрович', '1981-08-28 00:00:00', 'Рязань', 'РФ', 'г. Рязань', '8(910)908-83-69', 'orehovpavel@yandex.ru', 1, 'сын, 2 года', 2, 2, 1, 'B', '7 лет', 'Рязанский государственный радиотехнический университет \r\nвыпуск 2003 год\r\nИнженерно-экономический факультет\r\nЭкономика и управление на предприятиях машиностроения\r\nэкономист-менеджер', '2014-01-29 00:00:00', '2014-05-30 00:00:00', '2012-09-27 00:00:00', '2014-01-28 00:00:00', '2003-07-29 00:00:00', '2012-09-26 00:00:00', 'Коммерческий директор', 'Начальник отдела сбыта инструмента и оснастки', 'Начальник отдела закупки кожевенного сырья', 'ИП Баширов И.В./ООО Ледяной дом', 'ООО Крона', 'ЗАО Русская кожа', 'Рязань и Рязанская область', 'Рязань', 'Рязань', 'Организация продаж мороженого и замороженных продуктов питания. Координация работы супервайзеров (то', 'Организация и личное ведение поставок металлорежущего инструмента и оснастки для металлообрабатывающ', 'Организация обеспечения предприятия кожевенным сырьем и личное руководство региональной закупочной п', '', '', '', '', '', '', 'Сайт', '80000', '2014-06-27 03:52:42', 1, NULL),
(174, 'Работник склада', 'Федоров', 'Иван', 'Васильевич', '1991-11-18 00:00:00', 'Рязань', 'Русский', 'г.Рязань,ул.Дзержинского,д.64', '8-953-731-86-08', 'ivan777.91@mail.ru', 2, 'Детей нет', 2, 2, 1, 'B', '4 года', 'РГРТУ,заочно', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Интернет', '18000-20000', '2014-07-02 12:13:03', 1, NULL),
(175, 'Секретарь', 'Ястребова', 'Ольга', 'Вячеславовна', '1983-05-08 00:00:00', 'Рязань', 'Российское', 'Рязань, Канищево', '8-910-571-999-7', 'olteya@list.ru', 1, 'Дочь 2010 г.р.', 3, 2, 2, 'нет', 'нет', '1) Институт Культуры (2002-2008) Педагог-психолг\r\n2) Художественное училище (1998-2003) Живописец', '2013-08-01 00:00:00', '2013-12-25 00:00:00', '2008-04-26 00:00:00', '2013-11-23 00:00:00', '2007-04-20 00:00:00', '2007-11-15 00:00:00', 'Агент по заключению договоров ОПС (неофициальная работа)', 'Менеджер по персоналу', 'Менеджер-дизайнер', 'Негосударственный Пенсионный Фонд Электроэнергетики', 'ООО Альт Телеком', 'ООО Альберо', 'Рязань', 'Рязань, Касимов, Коломна, Шилово, Скопин', 'Рязань', 'Поиск клиентов, консультирование по пенсионным вопросам, заключение договоров', 'Подбор персонала, проведение собеседований, назначение на стажировку, обучение и аттестация.', 'Консультирование клиентов, выполнение дизайн-проектов корпусной мебели.', '10000', '25000', '10000', 'Закрытие организации', 'Закрытие организации', 'Закрытие магазина', 'Реклама в лифте', '15000 (неполный рабочий день до 16:30)', '2014-07-02 12:54:42', 1, NULL),
(176, 'Менеджер по продажам', 'Бардебанов', 'Михаил', 'Михайлович', '1989-11-01 00:00:00', 'Рязанская область; Шиловский р-н; п.Лесной', 'Россия', 'Г.Рязань ул.Электозаводская д.83 кв 22', '8-920-980-23-73', 'hunter62@inbox.ru', 2, 'не имею', 3, 2, 2, 'B,C', '2 года', 'Высшее\r\nМИГУП\r\nОчное\r\nМенеджер специальности государственное и муниципальное управление', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Системный администратор', 'менеджер по рекламе', '', 'ЛМУП ЖКХ', 'ООО \\\\', '', '', '', '', 'обеспечение бесперебойной работы программ и рабочих станций, Оформление и размещение заказов (соглас', 'поиск клиентов и размещение рекламной продукции', '', '', '', '', '', '', '', 'газета \\\\', '25 000', '2014-07-03 03:35:04', 1, NULL),
(177, 'Менеджер по продажам', 'Яновская', 'Анна', 'Борисовна', '1985-10-21 00:00:00', 'г.Луховицы', 'РФ', 'Московская область, г. Луховицы, ул. Пушкина, д.172а, кв.40 ', '89265996527', 'annapokataeva@yandex.ru', 2, '6 лет и 3 года', 3, 2, 2, '-', '-', 'Высшее, Московская финансово-промышленная академия, 2003-2007гг, специальность - экономист\r\nСредне-специальное Луховицкий авиационный техникум, 2000-2003гг, специальность - бухгалтер', '2007-03-26 00:00:00', '2013-09-30 00:00:00', '2006-05-15 00:00:00', '2007-03-23 00:00:00', '2006-02-06 00:00:00', '2006-05-06 00:00:00', 'бухгалтер', 'Бухгалтер', 'бухгалтер по НДС', 'ООО \\\\', 'ЗАО \\\\', 'ООО \\\\', 'Москва', 'Москва', 'Москва', 'ведение бухгалтерского и налогового учета', '', 'формирование книги покупок, книги продаж, акты сверки взаиморасчетов', '', '', '', 'семейные обстоятельства', '', '', 'на вашем сайте ', 'от 20000', '2014-07-04 10:23:42', 1, NULL),
(178, 'Менеджер по продажам', 'Черных', 'Виктор', 'Викторович', '1971-06-07 00:00:00', 'г. Донецк Ростовская область', 'Россия', 'г. Рязань, ул. Новаторов', '+7 903 8363555', '89038363555@mail.ru', 2, 'нет', 3, 2, 2, 'нет', 'нет', 'Ростовский Государственный Экономический Универститет, 2004-20010 г.,факультет Коммерции и Маркетинга, специалист по рекламе', '2014-03-11 00:00:00', '2014-05-12 00:00:00', '2007-02-01 00:00:00', '2013-09-30 00:00:00', '2005-01-10 00:00:00', '2006-04-20 00:00:00', 'менеджер по продажам', 'менеджер по продажам', 'менеджер по продажам', 'Gallery Service', 'Russ', 'ООО Реплика', 'Краснодар', 'Рязань', 'Ростов-на-Дону', 'Поиск клиентов, презентация услуг кампании, заключение договоров, ведение документаоборота, ', 'Поиск клиентов, презентация услуг кампании, заключение договоров, ведение документаоборота, ', 'Поиск клиентов, презентация услуг кампании, заключение договоров, ведение документаоборота, ', '25000', '35000', '20000', 'несоответствие заявленного кампанией уровня дохода реальности.', 'переезд в другой город', 'переезд в другой город', 'от знакомой', '50000', '2014-07-05 03:37:27', 1, NULL),
(179, 'Кассир', 'Честникова', 'Кристина', 'Сергеевна', '1993-02-12 00:00:00', 'Архангельская область, город Северодвинск', 'РФ', 'Город Рязань, Ул. Зубковой д.24', '89511045634', 'Kristina120293@yandex.ru', 3, 'Нет', 3, 2, 2, 'B', '2 года', 'Неоконченное высшее, РГУ им. С. А. Есенина, 2011-2015,  дневное отделение, специальность \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"Сервис\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"', '2014-10-01 00:00:00', '2014-12-30 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Официант', '', '', 'Караоке-клуб \\\\\\\\\\\\\\\\', '', '', 'Город Рязань', '', '', '', '', '', '5000 руб.', '', '', 'Минимальная зарплата ', '', '', 'Сайт Апельсин', '20000-25000', '2014-07-05 05:18:44', 1, NULL),
(180, 'Менеджер по продажам', 'Кузьмин', 'Ярослав', 'Михайлович', '1987-06-27 00:00:00', 'Рязань', 'рф', 'Рязань, Соколовка, Лесная 8', '8-920-952-71-84', 'y.m.kuzmin@gmail.com', 1, 'Сын, 1 год', 1, 2, 1, 'B', '5 лет', 'РИБиУ, Менеджмент организации, Менеджер', '2014-02-03 00:00:00', '0000-00-00 00:00:00', '2013-08-03 00:00:00', '2014-02-07 00:00:00', '2010-04-12 00:00:00', '2013-08-17 00:00:00', 'Директор Магазина', 'Руководитель направления инженерных сетей', 'Зам. директора по комерческой недвижимости', 'ЗАО ТАНДЕР', 'ООО Квэст', 'Зеленый Сад', 'Рязань', 'Рязань', 'Рязань', 'Выполнение плана продаж, контроль и управление магазином Магнит', 'руководство отделом ', 'Полный цикл строительства и сдачи в аренду ком. недвижимости', '35000-40000', '20000-70000', '35000-45000', 'ПСЖ', 'ПСЖ', 'ПСЖ', 'с сайт компании', '35000', '2014-07-07 01:05:38', 1, NULL),
(181, 'Менеджер по продажам', 'Бардебанов', 'Михаил', 'Михайлович', '1989-11-01 00:00:00', 'Рязанская область; Шиловский р-н; п.Лесной', 'Россия', 'г.Рязань ул.Электорзаводская 83, кв.22', '8-920-980-23-73', 'hunter62@inbox.ru', 2, 'не имею', 3, 2, 2, 'B,C', '2 года', 'высшее;\r\nМИГУП;\r\nочная форма;\r\nМенеджер управления', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Системный администратор', 'менеджер по рекламе', '', 'ЛМУП ЖКХ', 'ООО \\"Золотое время\\"', '', '', '', '', 'обеспечение бесперебойной работы программ и рабочих станций, Оформление и размещение заказов (соглас', 'поиск клиентов и размещение рекламной продукции', '', '', '', '', '', '', '', 'газета \\"Ярмарка\\"', '23 000', '2014-07-07 04:17:49', 1, NULL),
(182, 'Менеджер по продажам', 'Бардебанов', 'Михаил', 'Михайлович', '1989-11-01 00:00:00', 'Рязанская область; Шиловский р-н; п.Лесной', 'Россия', 'г.Рязань ул.Электорзаводская 83, кв.22', '8-920-980-23-73', 'hunter62@inbox.ru', 2, 'не имею', 3, 2, 2, 'B,C', '2 года', 'высшее;\r\nМИГУП;\r\nочная форма;\r\nМенеджер управления', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Системный администратор', 'менеджер по рекламе', '', 'ЛМУП ЖКХ', 'ООО \\"Золотое время\\"', '', '', '', '', 'обеспечение бесперебойной работы программ и рабочих станций, Оформление и размещение заказов (соглас', 'поиск клиентов и размещение рекламной продукции', '', '', '', '', '', '', '', 'газета \\"Ярмарка\\"', '23 000', '2014-07-07 04:18:43', 1, NULL),
(183, 'Менеджер по продажам', 'Медведев', 'Евгений', 'Александрович', '1990-04-24 00:00:00', 'Республика Беларусь, Витебская область г.Полоцк', 'Республики Беларусь', 'Республика Беларусь, Витебская область, г.Полоцк', '+375-29-816-76-82', 'evgeniy.medvedev.14@mail.ru', 2, 'не имею', 2, 2, 1, 'В', '2 года', 'Средне-специальное\r\nТоргово-технологический колледж\r\n2006-2010\r\nКоммерческая деятельность/Товаровед', '2010-02-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Продавец-консультант, Кассир', '', '', 'ООО\\"ПРАКТИК-Полоцк\\"', '', '', 'Республика Беларусь Витебская обл. г. Полоцк', '', '', 'Продажа и консультация строительный материалов', '', '', '300$', '', '', 'Маленькая оплата труда', '', '', 'интернет', '30 000 руб', '2014-07-14 11:09:08', 1, NULL),
(184, 'Кассир', 'Шершнева', 'Анастасия', 'Михайловна', '1983-02-03 00:00:00', 'г.Джизак', 'РФ', 'г.Рязань, Дашки-Песочня', '9105740285', 'semia-83@mail.ru', 1, 'сын 2005г.р.', 3, 2, 2, 'В, В1', '0', 'Среднее специальное, ГОУ Профессиональный лицей №39 г.Рязань, 1998-2001,Бухгалтер , Экономика, бухгалтерский учет и контроль', '2012-07-02 00:00:00', '2014-04-29 00:00:00', '2007-11-26 00:00:00', '2012-06-15 00:00:00', '2003-12-22 00:00:00', '2007-11-19 00:00:00', 'Бухгалтер', 'Бухгалтер', 'Продавец-кассир', 'ООО Электрик А', 'ОАО Новомичуринский хлебозавод', 'ООО Фирма Станко-Транс', 'Рязань', 'Новомичуринск', 'Рязань', 'расчеты с покупателями', 'Учет ОС, Расчеты с поставщиками, Банк, производственные отчеты', 'продажа продуктов питания', '18000', '9000', '5000', '', 'переезд', 'переезд', 'реклама в лифте', '20000', '2014-07-15 09:43:42', 1, NULL),
(185, 'Работник склада', 'Дружинин', 'Андрей', 'Александрович', '1990-07-23 00:00:00', 'Рязань', 'РФ', 'Г.Рязань, ул. 2-е Бутырки, д.13, кв.8', '89006090023', 'steed2307@gmail.com', 2, 'нет', 1, 2, 1, 'В', '1 год', 'Высшее, РГРТУ, 2007-2012, инженер, \\"Электронные приборы и устройства\\".', '2012-07-13 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'инженер-конструктор', '', '', 'ГРПЗ', '', '', 'Рязань', '', '', 'обработка входящих файлов для изготовления печатных плат', '', '', '21000', '', '', 'невысокая з/п', '', '', 'интернет', '25000-30000', '2014-07-16 12:31:37', 1, NULL),
(186, 'Менеджер кредитного отдела', 'Жукова', 'Ирина', 'Игоревна', '1989-03-12 00:00:00', 'Рязань', 'РФ', 'Г. Рязань', '+79537431075', 'irinamiheeva2@rambler.ru', 1, 'нет', 3, 2, 2, 'нет', 'нет', 'Высшее, Московский психолого-социальный университет, дневное, перевод и переводоведение, лингвист-переводчик', '2013-01-09 00:00:00', '2014-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'продавец консультант', '', '', 'ООО ТЦ Стройка', '', '', 'Рязань', '', '', '', '', '', '15000-17000', '', '', 'сокращение', '', '', 'на сайте апельсин', '15000-17000', '2014-07-24 07:10:55', 1, NULL),
(187, 'Менеджер по продажам', 'Мартынова', 'Ирина', 'Владимировна', '1989-10-15 00:00:00', 'Рязань', 'РФ', 'г.Рязань, ул.Интернациональная, д.13В, кв.36', '8-920-974-94-48', 'irinochkaa@inbox.ru', 2, 'нет', 3, 2, 2, 'нет', 'нет', 'Московский государственный университет путей сообщения,2008-2014, Национальная экономика, специалист\r\nРязанский колледж железнодорожного транспорта 2006-2009, обслуживание средств вычислительной техники, техник', '2006-10-19 00:00:00', '2009-11-03 00:00:00', '2010-04-22 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Техник ВЦ', 'Офис-менеджер', '', 'Рязанский колледж железнодорожного транспорта', 'ЗАО \\"СИА Интернейшнл-Тула\\" Региональное представительство Рязань', '', 'Рязань', 'Рязань', '', 'Обслуживание средств вычислительной техники, работа в microsoft office', 'Работа с клиентами по телефону, прием заявок, урегулирование конфликтных ситуаций', '', '6000', '25000', '', 'подработка во время учебы, после оканчания учебного заведения уволилась в поисках новой работы', 'Закрытие Рязанского представительства', '', 'знакомые', '25000', '2014-07-25 09:11:35', 1, NULL),
(188, 'Логист', 'Медведев', 'Александр', 'Владимирович', '1976-08-11 00:00:00', 'Узбекистан, г. Ташкент', 'Узбекистан', 'г. Рязань, Касимовское шоссе, д. 48', '+79308895585', 'amedvedev76@mail.ru', 1, 'двое, 19 и 11 лет', 1, 2, 1, 'В', '12 лет', 'Среднее-специальное, Ташкентский Авиационный техникум, 1991-1995 г.г., Ремонт и монтаж промышленного оборудования/техник-механик\r\n', '2005-01-14 00:00:00', '2014-05-30 00:00:00', '2000-10-25 00:00:00', '2004-12-20 00:00:00', '1997-08-05 00:00:00', '1999-08-10 00:00:00', 'Торговый представитель, Рук-ль группы рекл-х материалов', 'Мерчендайзер, Торговый представитель', 'Мерчендайзер', 'ИП ООО COSCOM, сотовый оператор', 'Бритиш Американ Тобакко Узбекистан', 'СП Кока Кола Ташкент ЛТД', 'Узбекистан, Ташкент', 'Узбекистан, Ташкент', 'Узбекистан, Ташкент', 'Работа с точками продаж, Заключение договоров, Логистика, Взаимодействие со складом', 'Работа с точками продаж, Выкладка продукта, Взаимодействие со складом', 'Работа с точками продаж, Выкладка продукта, Взаимодействие со складом', '700$', '500$', '250$', 'переезд на ПМЖ в Российскую Федерацию', 'сокращение штатов', 'низкая з/п', 'с сайта компании', '25000 руб', '2014-07-25 12:44:15', 1, NULL),
(189, 'Экспедитор', 'Медведев', 'Александр', 'Владимирович', '1976-08-11 00:00:00', 'Узбекистан, г. Ташкент', 'Узбекистан', 'г. Рязань, Касимовское шоссе, д. 48', '+79308895585', 'amedvedev76@mail.ru', 1, 'двое, 19 и 11 лет', 1, 2, 1, 'В', '12 лет', 'Среднее-специальное, Ташкентский Авиационный техникум, 1991-1995 г.г., Ремонт и монтаж промышленного оборудования/техник-механик\r\n', '2005-01-14 00:00:00', '2014-05-30 00:00:00', '2000-10-25 00:00:00', '2004-12-20 00:00:00', '1997-08-05 00:00:00', '1999-08-10 00:00:00', 'Торговый представитель, Рук-ль группы рекл-х материалов', 'Мерчендайзер, Торговый представитель', 'Мерчендайзер', 'ИП ООО COSCOM, сотовый оператор', 'Бритиш Американ Тобакко Узбекистан', 'СП Кока Кола Ташкент ЛТД', 'Узбекистан, Ташкент', 'Узбекистан, Ташкент', 'Узбекистан, Ташкент', 'Работа с точками продаж, Заключение договоров, Логистика, Взаимодействие со складом', 'Работа с точками продаж, Выкладка продукта, Взаимодействие со складом', 'Работа с точками продаж, Выкладка продукта, Взаимодействие со складом', '700$', '500$', '250$', 'переезд на ПМЖ в Российскую Федерацию', 'сокращение штатов', 'низкая з/п', 'с сайта компании', '25000 руб', '2014-07-25 12:50:15', 1, NULL),
(190, 'Работник склада', 'Медведев', 'Александр', 'Владимирович', '1976-08-11 00:00:00', 'Узбекистан, г. Ташкент', 'Узбекистан', 'г. Рязань, Касимовское шоссе, 48', '+79308895585', 'amedvedev76@mail.ru', 1, 'двое, 19 и лет', 1, 2, 1, 'В', '12 лет', 'Среднее-специальное, Ташкентский Авиационный техникум, Ремонт и монтаж промышленного оборудования/техник-механик\r\n', '2005-01-14 00:00:00', '2014-05-30 00:00:00', '2000-10-25 00:00:00', '2004-12-20 00:00:00', '1997-08-05 00:00:00', '1999-08-10 00:00:00', 'Торговый представитель, Рук-ль группы рекл-х материалов', 'Мерчендайзер, Торговый представитель', 'Мерчендайзер', 'ИП ООО COSCOM, сотовый оператор', 'Бритиш Американ Тобакко Узбекистан', 'СП Кока Кола Ташкент ЛТД', 'Узбекистан, Ташкент', 'Узбекистан, Ташкент', 'Узбекистан, Ташкент', 'Работа с точками продаж, Заключение договоров, Логистика, Взаимодействие со складом', 'Работа с точками продаж, Выкладка продукта, Взаимодействие со складом', 'Работа с точками продаж, Выкладка продукта, Взаимодействие со складом', '700$', '500$', '250$', 'переезд на ПМЖ в Российскую Федерацию', 'сокращение штатов', 'низкая з/п', 'с сайта компании', '25000 руб', '2014-07-25 12:53:59', 1, NULL),
(191, 'Менеджер по продажам', 'Медведев', 'Александр', 'Владимирович', '1976-08-11 00:00:00', 'Узбекистан, г. Ташкент', 'Узбекистан', 'г. Рязань, Касимовское шоссе, 48 ', '+79308895585', 'amedvedev76@mail.ru', 1, 'двое, 19 и лет ', 1, 2, 1, 'В', '12 лет', 'Среднее-специальное, Ташкентский Авиационный техникум, Ремонт и монтаж промышленного оборудования/техник-механик ', '2005-01-14 00:00:00', '2014-05-30 00:00:00', '2000-10-25 00:00:00', '2004-12-20 00:00:00', '1997-08-05 00:00:00', '1999-08-10 00:00:00', 'Торговый представитель, Рук-ль группы рекл-х материалов', 'Мерчендайзер, Торговый представитель', 'Мерчендайзер', 'ИП ООО COSCOM, сотовый оператор', 'Бритиш Американ Тобакко Узбекистан', 'СП Кока Кола Ташкент ЛТД', 'Узбекистан, Ташкент', 'Узбекистан, Ташкент', 'Узбекистан, Ташкент', 'Работа с точками продаж, Заключение договоров, Логистика, Взаимодействие со складом', 'Работа с точками продаж, Выкладка продукта, Взаимодействие со складом', 'Работа с точками продаж, Выкладка продукта, Взаимодействие со складом', '700$', '500$', '250$', 'переезд на ПМЖ в Российскую Федерацию', 'сокращение штатов', 'низкая з/п', 'с сайта компании', '25000 руб', '2014-07-25 12:56:16', 1, NULL),
(192, 'Кладовщик', 'Исаев', 'Камиль', 'Батырович', '1978-10-16 00:00:00', 'г.Минеральные -Воды  Ставропольского края', 'РФ', 'г.Сочи-А  Адлерский р-н ул.Худякова 29 кор.3 кв.76', '89384075479', 'kamil.isaev.78@bk.ru', 1, 'сын-3года,дочь-14лет,сын-13лет.', 3, 2, 2, 'нет', 'нет', 'Среднее.Невинномысский химический колледж.1994-1998. Инженер строитель. ПГС', '2010-07-20 00:00:00', '2012-06-14 00:00:00', '2012-06-14 00:00:00', '2013-03-09 00:00:00', '2014-03-07 00:00:00', '0000-00-00 00:00:00', 'ст.смены охраны', 'Зам.директора по режиму(охрана)', 'зам.руководителя', 'ООО ЧОП *ЩИТ-РОДИНЫ-1*', 'ОСК  Охотская Строительная Компания', 'ООО ЧОО ЧОУ *СКИФ*', 'Адлерский р-н', 'Адлерский р-н', 'Сочи-Адлер', 'Пропускной и внутреобъектовый режим.', 'Предотвращения хищение имущества компании', 'проверка всех служб ЧОПа.', '30000', '45.000', '30000', 'Переход на другую должность', 'Закончился договор', 'нет', 'друзья', '25000-30000', '2014-07-27 07:00:19', 1, NULL),
(193, 'Менеджер по продажам', 'Папченко', 'Виктория', 'Геннадьевна', '1988-11-29 00:00:00', 'г.Миллерово Ростовской обл.', 'РФ', 'г.Рязань', '8-920-633-80-54', 'papchenko_vg@mail.ru', 2, 'нет', 3, 2, 1, 'В', '7', 'Санкт-Петербургская академия управления и экономики\r\n 2005 — 2010 (высшее)\r\nФакультет: финансы и кредит — дневная форма обучения \r\nСпециальность: экономист \r\n', '2013-07-30 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Менеджер по работе с клиентами и партнерами', '', '', 'ЗАО «Европлан»', '', '', 'г.Рязань', '', '', 'Активное привлечение клиентов - юридических лиц  и тд', '', '', '28', '', '', 'холодные звонки', '', '', 'реклама в лифте', '30000', '2014-08-07 11:32:42', 1, NULL),
(194, 'Менеджер по продажам', 'ГАВРИКОВ ', 'ИВАН', 'ВИКТОРОВИЧ', '1989-05-18 00:00:00', 'С ТИМОШКИНО ШИЛОВСКИЙ Р-Н', 'РФ', 'Г.РЯЗАНЬ УЛ НОВОСЕЛОВ Д40К3', '9268844774', 'i.gawrikov@yandex.ru', 2, 'Нет', 3, 2, 2, 'учусь', '0', 'Высшее,РГУ им С Есенина,2008-2014,Специалист по связям с общественностью', '2014-02-27 00:00:00', '2014-07-03 00:00:00', '2010-06-11 00:00:00', '2014-02-25 00:00:00', '2009-10-01 00:00:00', '2010-02-24 00:00:00', 'Менеджер по работе с корпоративными клиентами', 'Управляющий', 'Менеджер по рекламе', 'Рельеф-М', 'МегаФон', 'Эгоист и Ка', 'Москва', 'Москва', 'Рязань', 'продажа корпоративным клиентам продукции компании,поиск новых клиентов,', 'Организация рабочих процессов в салоне,контроль выполнения планов,контоль за тмц', 'продажа рекламных плащадей,', 'от 50 000', '75000', '20000', 'переезд', 'отсутствие карьерного роста', 'переезд', 'сайт компании', 'от 30000', '2014-08-11 11:20:45', 1, NULL),
(195, 'Менеджер кредитного отдела', 'Осадчая', 'Галина', 'Григорьевна', '1978-08-22 00:00:00', 'Рязанская область, город Касимов', 'Россия', 'г. Рязань, ул. Новоселов, д. 32, кв. 42', '8-953-740-98-26', 'osad4aya.galia@yandex.ru', 1, 'один ребенок, 7 лет.', 3, 2, 2, 'нет', 'нет', '1998 – 2002 г. Современный Гуманитарный Институт, юрист-бакалавр (специализация гражданско-правовая).\r\n2002-2004 г. Академия управления и права г. Москвы, юрист-специалист.\r\n', '2014-06-04 00:00:00', '2014-07-31 00:00:00', '2014-01-14 00:00:00', '2014-06-04 00:00:00', '2012-08-22 00:00:00', '2013-12-15 00:00:00', 'специалист отдела продаж', 'офис-менеджер', 'Ведущий специалист Отдела подготовки кредитной документации  ', 'ООО «Городская лизинговая компания»', 'ООО «Технология успеха»', 'ООО «ВСК-Ипотека» г. Москва', 'Рязань', 'Рязань', 'Рязань', 'работа с поступающими заявками на лизинговые сделки, предварительная квалификация клиентов на предме', 'Работа с товаром и складской документацией, обслуживание клиентов, консультации, ведение отчетности ', 'Проведение предэкспертизы, выставление замечаний, подготовка договорной базы.', '25000', '20000', '20000', 'закрытие подразделения в Рязани', 'отсутствие карьерного роста', 'Закрытие подразделения в Рязани', 'Интернет', '23 000', '2014-08-11 05:14:47', 1, NULL),
(196, 'Менеджер кредитного отдела', 'Осадчая', 'Галина', 'Григорьевна', '1978-08-22 00:00:00', 'Рязанская область, город Касимов', 'Россия', 'г. Рязань, ул. Новоселов, д. 32, кв. 42', '8-953-740-98-26', 'osad4aya.galia@yandex.ru', 1, 'один ребенок, 7 лет.', 3, 2, 2, 'нет', 'нет', '1998 – 2002 г. Современный Гуманитарный Институт, юрист-бакалавр (специализация гражданско-правовая).\r\n2002-2004 г. Академия управления и права г. Москвы, юрист-специалист.\r\n', '2014-06-04 00:00:00', '2014-07-31 00:00:00', '2014-01-14 00:00:00', '2014-06-04 00:00:00', '2012-08-22 00:00:00', '2013-12-15 00:00:00', 'специалист отдела продаж', 'офис-менеджер', 'Ведущий специалист Отдела подготовки кредитной документации  ', 'ООО «Городская лизинговая компания»', 'ООО «Технология успеха»', 'ООО «ВСК-Ипотека» г. Москва', 'Рязань', 'Рязань', 'Рязань', 'работа с поступающими заявками на лизинговые сделки, предварительная квалификация клиентов на предме', 'Работа с товаром и складской документацией, обслуживание клиентов, консультации, ведение отчетности ', 'Проведение предэкспертизы, выставление замечаний, подготовка договорной базы.', '25000', '20000', '20000', 'закрытие подразделения в Рязани', 'отсутствие карьерного роста', 'Закрытие подразделения в Рязани', 'Интернет', '23 000', '2014-08-11 05:14:48', 1, NULL),
(197, 'Менеджер кредитного отдела', 'Осадчая', 'Галина', 'Григорьевна', '1978-08-22 00:00:00', 'Рязанская область, город Касимов', 'Россия', 'г. Рязань, ул. Новоселов, д. 32, кв. 42', '8-953-740-98-26', 'osad4aya.galia@yandex.ru', 1, 'один ребенок, 7 лет.', 3, 2, 2, 'нет', 'нет', '1998 – 2002 г. Современный Гуманитарный Институт, юрист-бакалавр (специализация гражданско-правовая).\r\n2002-2004 г. Академия управления и права г. Москвы, юрист-специалист.\r\n', '2014-06-04 00:00:00', '2014-07-31 00:00:00', '2014-01-14 00:00:00', '2014-06-04 00:00:00', '2012-08-22 00:00:00', '2013-12-15 00:00:00', 'специалист отдела продаж', 'офис-менеджер', 'Ведущий специалист Отдела подготовки кредитной документации  ', 'ООО «Городская лизинговая компания»', 'ООО «Технология успеха»', 'ООО «ВСК-Ипотека» г. Москва', 'Рязань', 'Рязань', 'Рязань', 'работа с поступающими заявками на лизинговые сделки, предварительная квалификация клиентов на предме', 'Работа с товаром и складской документацией, обслуживание клиентов, консультации, ведение отчетности ', 'Проведение предэкспертизы, выставление замечаний, подготовка договорной базы.', '25000', '20000', '20000', 'закрытие подразделения в Рязани', 'отсутствие карьерного роста', 'Закрытие подразделения в Рязани', 'Интернет', '23 000', '2014-08-11 05:14:50', 1, NULL),
(198, 'Менеджер кредитного отдела', 'Осадчая', 'Галина', 'Григорьевна', '1978-08-22 00:00:00', 'Рязанская область, город Касимов', 'Россия', 'г. Рязань, ул. Новоселов, д. 32, кв. 42', '8-953-740-98-26', 'osad4aya.galia@yandex.ru', 1, 'один ребенок, 7 лет.', 3, 2, 2, 'нет', 'нет', '1998 – 2002 г. Современный Гуманитарный Институт, юрист-бакалавр (специализация гражданско-правовая).\r\n2002-2004 г. Академия управления и права г. Москвы, юрист-специалист.\r\n', '2014-06-04 00:00:00', '2014-07-31 00:00:00', '2014-01-14 00:00:00', '2014-06-04 00:00:00', '2012-08-22 00:00:00', '2013-12-15 00:00:00', 'специалист отдела продаж', 'офис-менеджер', 'Ведущий специалист Отдела подготовки кредитной документации  ', 'ООО «Городская лизинговая компания»', 'ООО «Технология успеха»', 'ООО «ВСК-Ипотека» г. Москва', 'Рязань', 'Рязань', 'Рязань', 'работа с поступающими заявками на лизинговые сделки, предварительная квалификация клиентов на предме', 'Работа с товаром и складской документацией, обслуживание клиентов, консультации, ведение отчетности ', 'Проведение предэкспертизы, выставление замечаний, подготовка договорной базы.', '25000', '20000', '20000', 'закрытие подразделения в Рязани', 'отсутствие карьерного роста', 'Закрытие подразделения в Рязани', 'Интернет', '23 000', '2014-08-11 05:15:04', 1, NULL),
(199, 'Менеджер кредитного отдела', 'Осадчая', 'Галина', 'Григорьевна', '1978-08-22 00:00:00', 'Рязанская область, город Касимов', 'Россия', 'г. Рязань, ул. Новоселов, д. 32, кв. 42', '8-953-740-98-26', 'osad4aya.galia@yandex.ru', 1, 'один ребенок, 7 лет.', 3, 2, 2, 'нет', 'нет', '1998 – 2002 г. Современный Гуманитарный Институт, юрист-бакалавр (специализация гражданско-правовая).\r\n2002-2004 г. Академия управления и права г. Москвы, юрист-специалист.\r\n', '2014-06-04 00:00:00', '2014-07-31 00:00:00', '2014-01-14 00:00:00', '2014-06-04 00:00:00', '2012-08-22 00:00:00', '2013-12-15 00:00:00', 'специалист отдела продаж', 'офис-менеджер', 'Ведущий специалист Отдела подготовки кредитной документации  ', 'ООО «Городская лизинговая компания»', 'ООО «Технология успеха»', 'ООО «ВСК-Ипотека» г. Москва', 'Рязань', 'Рязань', 'Рязань', 'работа с поступающими заявками на лизинговые сделки, предварительная квалификация клиентов на предме', 'Работа с товаром и складской документацией, обслуживание клиентов, консультации, ведение отчетности ', 'Проведение предэкспертизы, выставление замечаний, подготовка договорной базы.', '25000', '20000', '20000', 'закрытие подразделения в Рязани', 'отсутствие карьерного роста', 'Закрытие подразделения в Рязани', 'Интернет', '23 000', '2014-08-11 05:15:06', 1, NULL),
(200, 'Менеджер кредитного отдела', 'Осадчая', 'Галина', 'Григорьевна', '1978-08-22 00:00:00', 'Рязанская область, город Касимов', 'Россия', 'г. Рязань, ул. Новоселов, д. 32, кв. 42', '8-953-740-98-26', 'osad4aya.galia@yandex.ru', 1, 'один ребенок, 7 лет.', 3, 2, 2, 'нет', 'нет', '1998 – 2002 г. Современный Гуманитарный Институт, юрист-бакалавр (специализация гражданско-правовая).\r\n2002-2004 г. Академия управления и права г. Москвы, юрист-специалист.\r\n', '2014-06-04 00:00:00', '2014-07-31 00:00:00', '2014-01-14 00:00:00', '2014-06-04 00:00:00', '2012-08-22 00:00:00', '2013-12-15 00:00:00', 'специалист отдела продаж', 'офис-менеджер', 'Ведущий специалист Отдела подготовки кредитной документации  ', 'ООО «Городская лизинговая компания»', 'ООО «Технология успеха»', 'ООО «ВСК-Ипотека» г. Москва', 'Рязань', 'Рязань', 'Рязань', 'работа с поступающими заявками на лизинговые сделки, предварительная квалификация клиентов на предме', 'Работа с товаром и складской документацией, обслуживание клиентов, консультации, ведение отчетности ', 'Проведение предэкспертизы, выставление замечаний, подготовка договорной базы.', '25000', '20000', '20000', 'закрытие подразделения в Рязани', 'отсутствие карьерного роста', 'Закрытие подразделения в Рязани', 'Интернет', '23 000', '2014-08-11 05:15:07', 1, NULL),
(201, 'Менеджер кредитного отдела', 'Осадчая', 'Галина', 'Григорьевна', '1978-08-22 00:00:00', 'Рязанская область, город Касимов', 'Россия', 'г. Рязань, ул. Новоселов, д. 32, кв. 42', '8-953-740-98-26', 'osad4aya.galia@yandex.ru', 1, 'один ребенок, 7 лет.', 3, 2, 2, 'нет', 'нет', '1998 – 2002 г. Современный Гуманитарный Институт, юрист-бакалавр (специализация гражданско-правовая).\r\n2002-2004 г. Академия управления и права г. Москвы, юрист-специалист.\r\n', '2014-06-04 00:00:00', '2014-07-31 00:00:00', '2014-01-14 00:00:00', '2014-06-04 00:00:00', '2012-08-22 00:00:00', '2013-12-15 00:00:00', 'специалист отдела продаж', 'офис-менеджер', 'Ведущий специалист Отдела подготовки кредитной документации  ', 'ООО «Городская лизинговая компания»', 'ООО «Технология успеха»', 'ООО «ВСК-Ипотека» г. Москва', 'Рязань', 'Рязань', 'Рязань', 'работа с поступающими заявками на лизинговые сделки, предварительная квалификация клиентов на предме', 'Работа с товаром и складской документацией, обслуживание клиентов, консультации, ведение отчетности ', 'Проведение предэкспертизы, выставление замечаний, подготовка договорной базы.', '25000', '20000', '20000', 'закрытие подразделения в Рязани', 'отсутствие карьерного роста', 'Закрытие подразделения в Рязани', 'Интернет', '23 000', '2014-08-11 05:15:44', 1, NULL),
(202, 'Работник склада', 'Крапивный', 'Андрей', 'Сергеевич', '1994-05-02 00:00:00', 'г Рязань', 'Российское', 'ул Новоселов 40', '89209582363', 'a_krap@mail.ru', 2, 'нет', 1, 2, 1, 'B,C', '2 года', 'среднее-профессиональное,МИИТ,электроснабжение на жд транспорте,техник', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'интернет', '25000', '2014-08-12 11:35:11', 1, NULL),
(203, 'Работник склада', 'Матвеев', 'Михаил', 'Александрович', '1980-08-26 00:00:00', 'Рязань', 'Россия', 'город Рязань', '89511057914', '73.150@mail.ru', 2, 'нет', 2, 2, 2, 'нет', 'нет', 'высшее образование\r\n1998-2003 Рязанский филиал МГУ культуры и искусств библиотечный факультет\r\n2004-2010 Рязанский институт управления и права экономист', '2004-10-06 00:00:00', '2009-03-30 00:00:00', '1998-02-20 00:00:00', '2001-01-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'библиотекарь', 'школьный библиотекарь', 'рабочий с 2010 по 2014 (февраль)', 'ГУК \\"Рязанская областная библиотека имени ГОрького\\"', 'Средняя школа № 39', 'неофициальная работа', 'Рязань', '', '', 'проведение погрузочно-разгрузочных работ, комплектование, консультирование библиотекарей', 'проведение школьных вечеров, выдача литературы', 'судейство футбольных матчей, работа по благоустройству и др. ', '6000', '4500', '', 'низкий доход, учеба', 'ликвидация библиотеки', '', 'интернет', 'от 17000', '2014-08-13 03:18:56', 1, NULL),
(204, 'Менеджер по продажам', 'Константинов', 'Сергей', 'Вячеславович', '1985-01-24 00:00:00', 'Рязань', 'РФ', 'г. Рязань (Советский р-н)', '+79105704488', 'qwerty852401@gmail.com', 1, 'Нет', 2, 2, 2, 'B,C', '11 лет', 'Высшее ( РГСХА, факультет: Автомобили и автомобильное хозяйство, специальность: инженер-механик) 2002-2007', '2012-04-24 00:00:00', '2014-07-21 00:00:00', '2010-12-01 00:00:00', '2012-04-02 00:00:00', '2008-06-26 00:00:00', '2010-05-05 00:00:00', 'Инженер по гарантии', 'Главный инженер', 'Инженер по охране труда и технике безопасности', 'ООО Автосалон \\"Канищево\\"', 'ФГУ Росгосцирк г. Рязань', 'ГУРО Дворец спорта Олимпийский', 'Рязань', 'Рязань', 'Рязань', 'Оформление гарантийных случав, работа с претензиями, управление персоналом', 'Управление техническими службами', 'Ведение документации по охране труда, проведение инструктажей', '18500', '15000', '11000', 'По собственному желанию', 'По собственному желанию', 'По собственному желанию', 'Сайт компании', 'От 25000', '2014-08-14 06:57:50', 1, NULL),
(205, 'Дизайнер керамической плитки', 'Горбунцова', 'Диана', 'Николаевна', '1994-11-05 00:00:00', 'Рязань', 'Русская', 'Михайловское шоссе, д.236 Б, кв.38', '89521245860', 'gorbuntsova.di122@yandex.ru', 2, 'нет', 3, 2, 2, 'нет', 'нет', 'Рязанское художественное училище им. Г.К.Вагнера, 2010-2014, дизайн', '2014-04-17 00:00:00', '2014-06-06 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'дизайнер', '', '', 'Рекламное PR агентство \\"Тема\\"', '', '', 'ул. Профессора Никулина', '', '', 'Разработка буклетов, визиток', '', '', '10 000', '', '', 'Не получалось совмещать с учёбой, т.к. писала диплом', '', '', 'Интернет', '20 000', '2014-08-18 02:10:15', 1, NULL),
(206, 'Логист', 'Аристов', 'Владимир', 'Васильевич', '1989-03-06 00:00:00', 'г. Рязань', 'РФ', 'г.Рязань, ул. Новоселов, 38/2-48', '8-920-984-19-09', 'aristov1989@list.ru', 1, '0', 1, 2, 2, 'нет', 'нет', 'среднее профессиональное, незаконченное высшее РГУ им. С.А. Есенина (заочное) - юрист', '2014-02-01 00:00:00', '2014-03-15 00:00:00', '2012-02-02 00:00:00', '2013-11-05 00:00:00', '2011-10-05 00:00:00', '2012-02-01 00:00:00', 'администратор', 'товаровед', 'экспедитор', 'ООО \\"Остин\\"', 'ООО \\"Фаворит\\"', 'ОАО \\"Бройлер Рязани\\"', 'Рязанская область', 'Рязань', 'рязанская область', 'открытие магазина, управление персоналом, мерчендайзинг', 'управление персоналом, прием товара по накладным, работа с браком', 'доставка грузов по Рязанской области и составление маршрута', '25000', '20000', '17000', ' сокращение', 'сокращение', 'по собственному желанию', 'на сайте', '30000', '2014-08-21 02:16:23', 1, NULL),
(207, 'Кассир', 'Лебедева ', 'Ольга', 'Юрьевна', '1988-07-13 00:00:00', 'г.Скопин', 'Россия', 'г. Рязань ул. Солотчинское шоссе  д.2', '+7 953 736 75 75', 'hromov-mihail@yandex.ru', 3, 'Дочь 3 года', 3, 2, 2, 'нет', '9 лет', 'среднее', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'apelsin.ru', '30000', '2014-08-25 08:19:28', 1, NULL),
(208, 'Менеджер по продажам', 'Скотников', 'Владимир', 'Александрович', '1982-08-26 00:00:00', 'Рязань', 'РФ', 'Рязань, Интернациональная, д.5\\"В\\",кв.68', '+79105041267', 'vladimirskotnikov@yandex.ru', 2, 'нет', 2, 2, 1, 'В', '6 лет', 'Высшее, МГОУ, с 1999г. по 2004г., Технология машиностроения, инженер', '2008-04-01 00:00:00', '2011-11-30 00:00:00', '2012-01-01 00:00:00', '2014-07-31 00:00:00', '2014-08-06 00:00:00', '2014-08-26 00:00:00', 'Слесарь', 'механик', 'слесарь-ремонтник', 'ООО \\"ПКФ ТехМаШ\\"', 'ООО \\"ТехМаш\\"', 'ОАО \\"Сафьян\\"', 'Рязань', 'Рязань', 'Рязань', 'ремонт станочного оборудования', 'контроль за выполнением технологического процесса по ремонту станочного оборудования', 'техническое обслуживание и ремонт оборудования', '25000', '30000', '25000', 'переорганизация фирмы', 'по собственному желанию, финансовые проблемы фирмы', 'по собсвенному желанию, работа грязная,в отличие от того,что обещали', 'реклама в лифте, интернет', '30000-35000', '2014-08-27 10:00:24', 1, NULL),
(209, 'Менеджер кредитного отдела', 'Буркин', 'Александр', 'Александрович', '1992-12-15 00:00:00', 'путятино', 'Русский', 'Рязань.ул. Мусорского', '89521217566', 'klan-harison@rambler.ru', 1, '1- 3 ГОДА', 3, 2, 2, 'B', '0', 'Среднеспециальное, техникум пищевой промышленности и общественного питания г.Рязани.2008-2012. повар, кондитер, технолог', '2014-02-14 00:00:00', '2014-07-30 00:00:00', '2014-02-14 00:00:00', '2014-07-30 00:00:00', '2013-12-14 00:00:00', '2014-01-14 00:00:00', 'менеджер клиентского отдела', 'директор по развитию', 'официант ', 'эксорус', 'эксорус', '5 звезд', 'рязань', 'рязань', 'рязань', 'прием входящих звонков', 'управление персоналом, финансовая ответственность, переговоры с агентами, решение проблемных ситуацй', 'обслуживание поситителей ', '11000', '15000', '11000', 'низкая заработная плата', 'заниженная заработная плата', 'по собственному желанию(просто попробовал себя в роли официанта)', 'интернет', '20000', '2014-08-31 03:25:15', 1, NULL),
(210, 'Работник склада', 'Демин', 'Александр', 'Петрович', '1990-03-03 00:00:00', 'Рязанская обл.', 'РФ', 'Рязань ул. Семчинская д. 11', '8 920 957 94 57', 'alekcandr9677@yandex.ru', 2, 'нет', 1, 2, 1, 'в', '5 лет', 'ОГОУНПОПУ №13 г.Касимов, 2006-2009, Автомеханик.', '2013-10-20 00:00:00', '2014-08-30 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'сборщик - монтажник', '', '', 'ООО \\"Спортивные конструкции\\"', '', '', 'г. Сочи', '', '', 'Строительство лаерных конструкций ( трибуны, скейтхолдинги)', '', '', '40000', '', '', '', '', '', 'из ссайта ', 'от 20000', '2014-09-06 07:23:16', 1, NULL),
(211, 'Менеджер по продажам', 'Кутяев', 'Сергей', 'Борисович', '1973-03-23 00:00:00', 'г.Стаханов Луганская область', 'РФ', 'Рязань ул.Добролюбова д.17 (Мирный)', '8-910-571-85-33', 'kkkut73@mail.ru', 1, 'сын - 14лет', 2, 2, 1, 'А.В', '21год', 'Высшее, Харьковская инженерно-педагогическая академия 1996-2002, горный инженер', '1996-11-15 00:00:00', '2011-06-06 00:00:00', '2011-10-01 00:00:00', '2011-12-31 00:00:00', '2012-06-20 00:00:00', '2014-09-01 00:00:00', 'должность -заместитель командира отряда', ' директора производства корпусной мебели', 'заместитель директора', 'Украина - военизированный горноспасательный отряд, должность -заместитель командира отряда, РФ - ИПГорицков ', 'ИП Онищенко г.Рязань', 'ИП Горицков', 'Украина, Луганская область', 'г.Рязань', 'Рязань', 'производствено-профилактическое обследование предприятий, обучение работников правилам охраны труда', 'общее руководство предприятия', 'Заказ продукции ее прием и постановка на учет. Дальнейшее распределение продукции по магазинам', '15000', '50000', '40000', 'переезд на постоянное место жительство в РФ', 'переход на другую работу', 'сокращение магазинов', 'интернет сайта', '40000', '2014-09-06 01:24:13', 1, NULL),
(212, 'Логист', 'Лунин', 'Максим', 'Игоревич', '1989-01-25 00:00:00', 'Рязань', 'РФ', 'г. Рязань, ул. Большая', '8-953-739-34-60', 'lunin_max@mail.ru', 1, 'Нет', 3, 2, 1, 'В', '6 лет', 'Московский университет им. С. Ю. Витте (бывший МИЭМП) 2007-2013, менеджмент организации', '2014-06-16 00:00:00', '2014-07-21 00:00:00', '2011-05-05 00:00:00', '2014-05-30 00:00:00', '2009-11-02 00:00:00', '2011-03-28 00:00:00', 'Торговый представитель', 'Мерчендайзер', 'Кладовщик, экспедитор', 'ООО Шаттл', 'ООО Кока-кола', 'ООО Компаньон', 'Рязань', 'Рязань', 'Рязань', 'Посещение торговых точек по маршруту, сбор заказов, увеличение объема продаж, работа с ДЗ, поиск кли', 'Выкладка товара, работа с ценниками, помощь в формировании заказов, увеличение заказов', 'Набор товара по накладным, составление ежедневного маршрута, сопровождение товара с водителем до тт.', '20000', '20000', '14000', 'Жуткие условия работы.', 'Не предоставили дальнейшего роста.', 'Низкий уровень зарплаты.', 'На официальном сайте компании', '25000', '2014-09-08 12:17:46', 1, NULL),
(213, 'Менеджер по продажам', 'Лунин', 'Максим', 'Игоревич', '1989-01-25 00:00:00', 'Рязань', 'РФ', 'г. Рязань, ул. Большая', '+7(953) 739-34-23', 'lunin_max@mail.ru', 1, 'Нет', 3, 2, 1, 'В', '6 лет', 'Московский университет им. С. Ю. Витте (бывший МИЭМП) 2007-2013, менеджмент организации', '2014-06-16 00:00:00', '2014-07-21 00:00:00', '2011-05-05 00:00:00', '2014-05-30 00:00:00', '2009-11-02 00:00:00', '2011-03-28 00:00:00', 'Торговый представитель', 'Мерчендайзер', 'Кладовщик, экспедитор', 'ООО Шаттл', 'ООО Кока-кола', 'ООО Компаньон', 'Рязань', 'Рязань', 'Рязань', 'Посещение торговых точек по маршруту, сбор заказов, увеличение объема продаж, работа с ДЗ, поиск кли', 'Выкладка товара, работа с ценниками, помощь в формировании заказов, увеличение заказов', 'Набор товара по накладным, составление ежедневного маршрута, сопровождение товара с водителем до тт.', '20000', '20000', '14000', 'Жуткие условия работы.', 'Не предоставили дальнейшего роста.', 'Низкий уровень зарплаты.', 'На официальном сайте компании', '25000', '2014-09-08 12:20:44', 1, NULL),
(214, 'Кладовщик', 'Глазков', 'Сергей ', 'Олегович', '1977-11-28 00:00:00', 'Рязань', 'РФ', 'г. Рязань, ул. Черновицкая, д. 13, кв. 58', '9511050543', 'tshumakova.77@mail.ru', 1, '17 и 5 лет', 1, 2, 1, 'В', '14', 'средне-техническое. РКТ', '2002-02-01 00:00:00', '2014-09-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'кладовщик', '', '', 'ООО Дельта-М', '', '', 'РФ', '', '', 'ведение складксого учета, управление подчиненными в кол-ве 20 чел', '', '', '50 тыс руб', '', '', 'разъездной характер работы', '', '', 'репутация фирмы', 'от 50 тыс руб', '2014-09-08 08:43:14', 1, NULL),
(215, 'Дизайнер керамической плитки', 'Жолонковская', 'Елена', 'Анатольевна', '1988-11-19 00:00:00', 'Рязань', 'РФ', 'ул. Либкнехта, 10, 111', '89209504556', 'zhoalexey@rambler.ru', 2, 'ytn', 3, 2, 2, '-', '-', 'инженер-физик, РГРТУ, окончено в 2010г, высшее\r\nдизайнер, МГУКИ, окончено в 2013г, диплом о профессиональной переподготовке', '2010-08-16 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'инженер-конструктор', '', '', 'ОАО \\"Рязазанский радиозавод\\"', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'интернет', '30000', '2014-09-11 01:58:25', 1, NULL),
(216, 'Дизайнер керамической плитки', 'Цаплина', 'Елена', 'Владимировна', '1978-06-11 00:00:00', 'Рязанская обл., п. Болонь', 'РФ', 'г. Рязань, ул Интернациональная', '79109015008', 'elenacaplin@ya.ru', 1, 'Сын 12 лет', 3, 2, 1, 'В', '7 лет', 'Высшее, РГСХА 1995-2000, Технолог пищевого производства, 2001 - курсы Дизайнер интерьера', '2001-05-01 00:00:00', '2004-04-11 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2005-11-30 00:00:00', '0000-00-00 00:00:00', 'Дизайнер интреьера', '', 'Предприниматель', 'ООО Эра', '', 'ИП Цаплина ЕВ', 'Рязань', '', 'Сасово, Рязань', 'Дизайн интерьера, надзор за рнмонтными работами', '', 'Декор банкетных залов', '', '', '80000 руб', 'переезд в другой город', '', 'Работа в выходные дни, демонтаж декора в пятницу и субботу ночью, что мешает семье', 'сайт компании', 'минимум 50000', '2014-09-15 09:30:45', 1, NULL),
(217, 'Менеджер по продажам', 'Глухов', 'Алексей', 'Павлович', '1986-08-22 00:00:00', 'г.Рязань', 'Российское', 'г.Рязань, ул.Зубковой дом 25 корпус 1 ', '89206358773', 'sherbet08@mail.ru', 1, 'сын, 5лет', 2, 2, 1, 'в', '10 лет', '2003-2008 (МЭСИ) Московский государственный университет экономики, статистики и информатики. Рязанский филиал.\r\nУровень образования: Высшее\r\nФакультет: Антикризисное управление\r\nКвалификация: Экономист-менеджер по специальности Антикризисное управление\r\nФорма обучения: Дневная/Очная\r\n', '2010-06-01 00:00:00', '2013-04-05 00:00:00', '2013-05-01 00:00:00', '2014-09-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Заведующий склада, менеджер по продажам ', 'Менеджер по продажам', '', ' ООО \\"Терра-стилл\\"', 'ООО\\"Монарх\\" ', '', 'г.Рязань', 'г.Рязань', '', ' Прием и отгрузка товара, ведение сопроводительной документации, работа в 1С, учет товарно-материаль', 'Работа с торговыми точками на закрепленной территории. Увеличение объема продаж. Проведение перегово', '', '20000 рублей', '30000-35000 рублей', '', 'по собственному желанию', 'по собственному желанию', '', 'интернет', 'от 35000 рублей', '2014-09-17 04:25:41', 1, NULL),
(218, 'Логист', 'Захаров', 'Сергей', 'Николаевич', '1972-01-28 00:00:00', 'Узбекистан', 'Россия', 'Рязань', '89105795423', 'sergeizaharov72@bk.ru', 1, 'двое детей\r\n16 лет и 6 лет', 1, 2, 1, 'В, С', '24 года', 'Высшее, Московский Государственный открытый Университет им. Черномырдина, заочное, инженер автомобильного хозяйства', '2002-05-01 00:00:00', '2014-09-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'механик по выпуску автомобилей', '', '', 'Московская объединненая энергетическая компания', '', '', 'Москва', '', '', 'выпуск машин на линию', '', '', '48000', '', '', 'реорганизация предприятия(сокращение)', '', '', 'интернет', '35000', '2014-09-18 05:44:30', 1, NULL),
(219, 'Работник склада', 'Бахметов', 'Ильдар ', 'Растамович', '1975-07-23 00:00:00', 'ЗКО г Уральск', 'Россия', 'г Рыбное', '8-952-121-59-42', 'kikmi@mail.ru', 1, '1 ребенок 12 лет', 2, 2, 1, 'В', '8 лет', 'среднее', '2013-02-26 00:00:00', '2014-09-03 00:00:00', '2012-06-19 00:00:00', '2013-02-25 00:00:00', '2008-02-06 00:00:00', '2012-06-15 00:00:00', 'ПЕЧАТНИК', 'стропольщик', 'комплектовщик', 'АРТ-ЛЕЙБЛ', 'МеталоПрофель', 'ООО Складские технологии', 'Уральский федеральный округ', 'Уральский федеральный округ', 'Уральский федеральный округ', 'печать', 'разгрузка погрузка', 'сбор товара по наклодным', '35000', '20000', '20000', 'переезд', 'не устраивала зарплата', 'развал компании ', 'из интернета', '25000-30000', '2014-09-19 09:41:01', 1, NULL),
(220, 'Продавец корпусной мебели', 'Князева', 'Ксения', 'Александровна', '1989-09-20 00:00:00', 'г Рязань', 'РФ', 'г. Рязань, ул. Новикова-Прибоя, д.16, кв. 57', '8-906-543-06-97', 'xenalvask@yandex.ru', 2, 'нет', 3, 2, 2, 'В', '5 лет', 'РГУ им. С.А. Есенина, ф-т Педагогики, Психологии и Социальной работы, 2006-2011, учитель начальных классов', '2010-11-15 00:00:00', '2014-09-08 00:00:00', '2010-06-19 00:00:00', '2010-10-15 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'менеджер магазина', 'Эксклюзивный Торговый представтель', '', 'ООО Адидас20', 'ИП Садыков', '', 'Рязань', 'Рязань', '', 'организация работы персонала по улучшению обслуживания в торговом зале, контроль и анализ выручк', 'Продвижение новй торговой марки Mirel', '', '35000', '25000', '', 'переработки', 'невозможность совмещать с учебой', '', 'сайт комании', '35000', '2014-09-23 11:12:51', 1, NULL),
(221, 'Кладовщик', 'Кабанов', 'Владимир', 'Иванович', '1967-07-29 00:00:00', 'г. Таллин Эстония', 'Российское', 'г. Луховицы, Московской обл.', '8-967-256-74-41', 'kwi_67@mail.ru', 1, 'Дочь, 23 года', 1, 2, 2, 'нет', 'нет', '1988	Кемеровское ВВКУС\r\nинженерный, диплом\r\n', '1994-10-01 00:00:00', '2014-08-01 00:00:00', '1984-08-01 00:00:00', '1994-10-01 00:00:00', '1974-09-01 00:00:00', '1984-06-01 00:00:00', 'Исполнительный директор', 'Командир рвзвода, командир роты, старший помощник начальника штаба по кадрам', 'учащийся', 'ОАО \\"Гелис Лайт\\"', 'Служба в ВС СССР', 'Школа № 10', 'Московский', 'Казахстан', 'Московский', 'Исполнительный директор по сути заменяет генерального директора компании с момента постановки зад', 'Защита СССР', 'учеба', 'высокий', 'высокий', 'нет', 'собственное желание', 'сокращение штатов', 'окончание школы', 'телевидение', '30 000', '2014-09-23 12:23:02', 1, NULL),
(222, 'Кассир', 'зеленова', 'мария', 'борисовна', '1981-07-19 00:00:00', 'г.Рязань', 'РФ', 'Г.Рязань ул.Тимуровцев,д.9 к.1 кв.47', '89521233358', 'mariya.zelenova.81@mail.ru', 1, 'двое:11лет,3 года', 3, 2, 2, 'нет', 'нет', 'Среднетехническое,Рязанский Государственный колледж отраслевых технологий,экономики и права,1998-2001,техник', '2002-04-22 00:00:00', '2009-10-09 00:00:00', '2010-09-13 00:00:00', '2010-10-25 00:00:00', '2011-06-01 00:00:00', '0000-00-00 00:00:00', 'начальник отдела специального учета', 'станочница', 'продавец-консультант', 'УФСИН России по Республике Мордовия', 'Рязанская фабрика жестяной упаковки', 'ЗАО\\"Ледер-Сервис\\"', 'Республика Мордовия', 'г.Рязань', 'г.Рязань', 'Руководство отделом, участие в совещаниях', 'штамповка жестяных изделий', 'продажа обуви', '15000', '18000', '10000', 'по собственному желанию,всвязи с переездом в г.Рязань', 'по собственному желанию,всвязи с производственной травмой', 'работаю по настоящее время', 'интернет', '23000', '2014-09-23 01:33:25', 1, NULL),
(223, 'Менеджер по продажам', 'Конончук', 'Артём', 'Владимирович', '1990-04-27 00:00:00', 'г. Москва', 'РФ', 'Рязань. Улица Сельских Строителей, дом 3ж.', '8-920-982-02-69', 'pianponi@mail.ru', 2, 'нет', 3, 2, 1, 'B', '1', 'РГАТУ им П.А. Костычева. \r\nБиотехнологии и ветеринарной медицины (Эколог)(2007-2012)\r\nЭкономический (Бух учёт, анализ, аудит)(2009-2012)', '2014-02-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Помощник генерального директора', 'Риэлтор', 'Менеджер по продажам', 'Группа компаний доступное жильё', 'Агенство недвижимости Гильдия', 'Техэксперт Ока', 'Рязань', 'Рязань', 'Рязань', 'Общение с деловыми партнёрами и возможными инвесторами, клиентами, производ.строй. мат, документация', '', 'Презентация и продажа услуг', '25', '20000', 'сдельный', 'Упразднение должности', '', 'задержка зарплаты', 'Интернет', '25000', '2014-09-23 03:30:24', 1, NULL),
(224, 'Менеджер по продажам', 'Лагутова', 'Анастасия ', 'Сергеевна', '1993-08-15 00:00:00', 'г. Рязань', 'РФ', 'г.Рязань ул. 3-ие Бутырки ', '89537386870', 'anastasia.lagutova15@gmail.com', 2, 'детей нет', 3, 2, 2, 'нет', 'нет', 'незаконченное высшее. РГРТУ, радиоэлектронные системы.\r\n2010-2014', '2013-09-01 00:00:00', '2014-08-13 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Администратор', '', '', 'OOO\\"Экспромто\\"', '', '', 'г.Рязань', '', '', 'контроль работы персонала,работа с кассой', '', '', '20000', '', '', 'не подходящий график работы', '', '', 'интернет', '20000', '2014-09-23 08:13:33', 1, NULL),
(225, 'Работник склада', 'Кузнецов', 'Алексей', 'Владимирович', '1986-06-22 00:00:00', 'г Уральск', 'Россия', ' Рязань 2-ой Бульварный проезд 6-52', '8-905-186-83-70', 'aleks22195@mail.ru', 1, 'нет', 2, 2, 1, 'В С', '10 лет', 'среднеспециальное', '2011-11-15 00:00:00', '2014-09-02 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'водитель-экспедитор', '', '', 'Т Д Ремит', '', '', 'М,О', '', '', '', '', '', '', '', '', 'по  собственному желанию', '', '', 'газета Ярмарка', '25000-30000', '2014-09-24 03:38:06', 1, NULL),
(226, 'Менеджер по продажам', 'Громов', 'Никита', 'Сергеевич', '1991-10-24 00:00:00', 'Россия, г.Рязань', 'РФ', 'Г. Рязань, Октябрьский городок', '89307835585', 'gromovnikita62@gmail.com', 2, 'нет, 22 года', 3, 2, 2, '-', '-', 'Высшее образование, очная форма обучения 5 лет, Московский психолого-социальный университет, 2009-2014, присвоена квалификация Менеджер по специальности Государственное и муниципальное управление', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'газета', '15000-25000', '2014-09-25 11:16:42', 1, NULL),
(227, 'Секретарь', 'Быкова', 'Александра', 'Сергеевна', '1976-11-26 00:00:00', 'г. Реутов М.О.', 'РФ', 'М.О., г. Луховицы', '8 915 017 56 47', 'manyna76@mail.ru', 1, 'девочка 18 лет, мальчик 10 лет', 3, 2, 1, 'в', '10 лет', 'средне техническое ЛАТ 1995-1999 техник- конструкор', '2012-03-26 00:00:00', '2014-04-26 00:00:00', '2012-01-15 00:00:00', '2012-03-25 00:00:00', '2007-01-15 00:00:00', '2009-02-20 00:00:00', 'ведущий специалист', 'архивариус', 'инспектор отдела кадров, секретарь директора', 'ОАО СК \\"Стаховая компания \\"СОГАЗ  - Мед\\"', 'МУЗ ЛЦРБ', 'ЛАТ', 'московский', 'московский', 'московский', 'ведение делопроизводства, оформление мед. полисов, работа с застрахованными', 'ведение архива', 'ведение о.к., делопроизводства', '15000', '7800', '7000', 'по собственному желанию', 'трудостройство в др. компанию', 'переход в др. компанию', 'реклама в магазине \\"Апельсин\\"', '20000', '2014-09-25 12:19:04', 1, NULL),
(228, 'Менеджер по продажам', 'Старостин ', 'Александр', 'Алексеевич', '1989-02-17 00:00:00', 'Посёлок Октябрьский Михайловского района Рязанской области', 'Россия', 'Рязань, Куйбышевское шоссе, д4/1', '89209664313', 'aleksandr.starostin.89@mail.ru', 1, 'Есть сын 1год 7 месяцев\r\n', 2, 2, 1, 'B', '1 год', 'Высшее; Рязанский государственный университет; 2006-2011; Специальность юрист', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Сайт компании', '20-25 тыс. руб', '2014-09-30 10:23:42', 1, NULL),
(229, 'Менеджер по продажам', 'Старостин ', 'Александр', 'Алексеевич', '1989-02-17 00:00:00', 'Посёлок Октябрьский Михайловского района Рязанской области', 'Россия', 'Рязань, Куйбышевское шоссе, д4/1', '89209664313', 'aleksandr.starostin.89@mail.ru', 1, 'Есть сын 1год 7 месяцев\r\n', 2, 2, 1, 'B', '1 год', 'Высшее; Рязанский государственный университет; 2006-2011; Специальность юрист', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Сайт компании', '20-25 тыс. руб', '2014-09-30 10:23:49', 1, NULL),
(230, 'Менеджер по продажам', 'Старостин ', 'Александр', 'Алексеевич', '1989-02-17 00:00:00', 'Посёлок Октябрьский Михайловского района Рязанской области', 'Россия', 'Рязань, Куйбышевское шоссе, д4/1', '89209664313', 'aleksandr.starostin.89@mail.ru', 1, 'Есть сын 1год 7 месяцев\r\n', 2, 2, 1, 'B', '1 год', 'Высшее; Рязанский государственный университет; 2006-2011; Специальность юрист', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Сайт компании', '20-25 тыс. руб', '2014-09-30 10:23:50', 1, NULL),
(231, 'Менеджер по продажам', 'Старостин ', 'Александр', 'Алексеевич', '1989-02-17 00:00:00', 'Посёлок Октябрьский Михайловского района Рязанской области', 'Россия', 'Рязань, Куйбышевское шоссе, д4/1', '89209664313', 'aleksandr.starostin.89@mail.ru', 1, 'Есть сын 1год 7 месяцев\r\n', 2, 2, 1, 'B', '1 год', 'Высшее; Рязанский государственный университет; 2006-2011; Специальность юрист', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Сайт компании', '20-25 тыс. руб', '2014-09-30 10:23:51', 1, NULL),
(232, 'Кладовщик', 'Чиков', 'Константин', 'Александрович', '1992-10-14 00:00:00', 'г.Коломна', 'РФ', 'МО,г.Коломна.', '8(985)-929-60-45', 'chicozzzz80@gmail.com', 3, 'Дочь,3 года', 3, 2, 1, 'B', '2 года', 'Высшее\r\nМосковский Государственный Областной Социально-Гуманитарный Институт\r\n2009-2014\r\nсоциальный педагог', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Радио', 'от 30 000', '2014-09-30 12:40:23', 1, NULL),
(233, 'Кассир', 'Разгадова ', 'Дарья', 'Владимировна', '1995-10-22 00:00:00', 'г.Луховицы', 'РФ', 'М.О., г.Луховицы, ул.Мира, д.33, кв.33', '89637547547', 'dasha.razgadova@mail.ru', 2, 'нет', 3, 2, 2, 'нет', 'нет', 'среднее \r\nМБОУ Гимназия №10\r\n2002-2013', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'от молодого человека', '15000-20000', '2014-10-01 12:13:33', 1, NULL),
(234, 'Кладовщик', 'Бондарчук', 'Павел', 'Владимирович', '1991-03-26 00:00:00', 'г. Рязань', 'РФ', 'г. Рязань ул. Тимуровцев д.9 к.2', '89805644861', 'wolf4eg@mail.ru', 2, 'детей нет', 1, 2, 1, 'B', '3года', 'РВВКУС 2008-2011 неполное высшее\r\nспециальность: сети связей и системы коммуникаций ', '2011-02-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'кладовщик', '', '', 'Кока-кола ЭйчБиСи Евразия', '', '', 'г. Рязань', '', '', 'отгрузка-прием товаров со склада, просчет  мат. ценностей склада, товара, упаковок и тары.', '', '', '22000', '', '', 'низкая ЗП', '', '', 'СМИ', '35000-40000', '2014-10-01 10:11:13', 1, NULL),
(235, 'Менеджер кредитного отдела', 'Чупшева', 'Виктория', 'Викторовна', '1981-11-21 00:00:00', 'г. Рязань', 'РФ', 'г. Рязань', '89006018225', 'viktoriachupshieva@mail.ru', 2, 'нет', 3, 2, 1, 'В', '2 года', 'Московский институт права, 2001-2004, юрист', '2002-10-01 00:00:00', '2003-12-30 00:00:00', '2006-03-01 00:00:00', '2008-09-08 00:00:00', '2008-09-12 00:00:00', '2014-08-29 00:00:00', 'юрисконсульт', 'старший оператор', 'юрист отдела регионального выпуска', 'ООО \\"ИСиТ\\"', 'ООО ТД \\"Русская зима\\"', 'ООО \\"Консультант-Ока\\"', 'г. Рязань', 'г. Рязань', 'г. Рязань', 'оформление документации, консультации клиентов', 'консультация клиентов, оформление документации', 'анализ и правовая обработка региональных правовых актов', '10000 рублей', '15000 рублей', '18000', 'по собственному желанию', 'переход в другую организацию', 'по собственному желанию', 'сайт компании', '25000 рублей', '2014-10-01 10:14:42', 1, NULL),
(236, 'Менеджер по продажам', 'Кирюшкин', 'Дмитрий', 'Алексеевич', '1985-08-29 00:00:00', 'Рязань', 'Российская Федерация', 'Рязань', '89066495535', 'dkirjushkin@rambler.ru', 2, 'нет', 1, 2, 2, 'В', '11', 'Высшее юридическое.\r\nМосковский институт права.\r\n2002-2007\r\nЮрист', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Интернет', '25000', '2014-10-06 11:13:10', 1, NULL),
(237, 'Менеджер кредитного отдела', 'Явнова', 'Виктория ', 'Всеволодовна', '1994-04-20 00:00:00', 'Санкт-Петербург ', 'РФ ', 'Рязань,ул.Зубковой 18', '89511011981', 'Yav-vikun@mail.ru', 2, 'Нет', 3, 2, 1, 'B', 'Менее года', 'Неоконченное высшее,МЭСИ,5 курс,финансы и кредит\r\nСреднее-специальное,РССК,банковское дело ', '2012-10-04 00:00:00', '2014-01-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Кредитный специалист', '', '', 'Лето банк', '', '', 'Рязань', '', '', '', '', '', '23000', '', '', '', '', '', 'Интернет', '25000', '2014-10-06 01:42:24', 1, NULL),
(238, 'Логист', 'Майоров', 'Вячеслав', 'Александрович', '1982-09-12 00:00:00', 'Рязанская область', 'Россия', 'г. Рязань', '8(920)9625462', 'sobaka7.82@mail.ru', 2, 'нет', 1, 2, 2, 'В, С', 'с 2001 г', 'Высшее\r\nМосковский государственный университет инженерной экологии\r\nМенеджмент организации', '2012-08-01 00:00:00', '2014-07-31 00:00:00', '2010-07-19 00:00:00', '2011-02-28 00:00:00', '2003-03-15 00:00:00', '2009-09-30 00:00:00', 'кладовщик', 'Менеджер управления торгов и логистики', 'помощник руководителя (прапорщик)', 'ООО \\"РАССО\\"', 'ЗАО \\"Управляющая компания\\"', 'Продовольственная служба МВО (прохождение ВС)', 'Москва', 'Москва', 'Москва', 'прием на склад, хранение и выдача со склада товарно-материальных ценностей;', 'планирование перевозок, организация доставки продукции и сырья', 'расчет потребности для пополнения продовольственных запасов на складах', '35000 р.', '35000', '8000', 'по собственному желанию', 'по собственному желанию', 'Окончание срока действия контракта', 'сайт компании', '35000', '2014-10-08 01:11:35', 1, NULL),
(239, 'Логист', 'Конькова', 'Елена', 'Вячеславовна', '1987-03-19 00:00:00', 'Иркутская обл.', 'РФ', 'г.Рязань', '89065446424', 'alenka19-03@yandex.ru', 2, 'нет', 3, 2, 1, 'В', '2,5 года', 'Высшее\r\nМосковская Академия Экономики и Права\r\n2006-2011\r\nменеджмент организации', '2011-06-20 00:00:00', '2014-12-31 00:00:00', '2008-02-20 00:00:00', '2011-06-20 00:00:00', '2007-03-14 00:00:00', '2007-12-12 00:00:00', 'Заместитель начальника отдела снабжения', 'Менеджер', 'референт', 'ООО \\"Стройтранс\\"', 'ООО \\"П.М.М.\\"', 'АНО «Центр иностранных языков «Лингва».', 'г. Рязань', 'г.Рязань', 'г. Рязань', 'обеспечение строительными материалами, договорная работа', 'составление маршрутов разъездов машин,оформление сопроводительных документов при отгрузке покупателю', 'договорная работа, переводы документов с иностранных языков', '30 000 р.', '15 000 р.', '10 000 р.', 'задержка з/п', 'низкий уровень з/п', 'низкий уровень з/п', 'официальный сайт компании', 'от 30 000 р.', '2014-10-08 03:53:52', 1, NULL),
(240, 'Кассир', 'Васильева ', 'Наталья', 'Анатольевна', '1985-11-01 00:00:00', 'МО, Луховицкий район, п. Газопроводск', 'русская', 'МО, Луховицкий район, п. Газопроводск, ул. Ольховая д.12', '89639919342', 'trol09@inbox.ru', 1, '1 ребёнок, 4 года', 3, 2, 1, 'в', '1,5 года', 'Высшее, Современная Гуманитарная Академия, экономист', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'интернет', '20000-25000', '2014-10-09 11:41:30', 1, NULL),
(241, 'Управляющий', 'Левичкина ', 'Светлана', 'Николаевна', '1968-04-03 00:00:00', 'п.Соколовка, Рязанский р-н, Рязанской обл.', 'Россия', 'г.Рязань, ул.7-ая Линия, д.7, кв.93', '+7-910-503-33-88', 'levsn4@mail.ru', 3, 'Левичкин Сергей, 22 года', 3, 2, 1, 'В', '20 лет', 'Высшее, Университет МВД России, рязанский филиал, 2001-2006, юрист', '2014-06-06 00:00:00', '0000-00-00 00:00:00', '2014-03-01 00:00:00', '2014-04-30 00:00:00', '2006-02-21 00:00:00', '2013-11-29 00:00:00', 'специалист коммерческого отдела', 'специалист по комплексным мероприятиям', 'Стариший специалист отдела маркетинга и маркетинговых коммуникаций', 'ГТРК \\\\', 'ИП Анашкина (Конгресс-отель \\"Форум\\")', 'Филиал ОАО \\\\', 'Рязань', 'Рязань', 'Рязань', 'продажа эфирного времени на ТВ и радио', 'подготовка, организация и полное сопровождение мероприятий', 'Организация мероприятий рекламного характера, промо-акций, работа со СМИ, наружная реклама.', '20000-25000', '20000', '25000', 'внештатный сотрудник', 'пригласили работать на телевидение', 'изменились условия работы', 'интернет', '35000-40000', '2014-10-10 11:48:21', 1, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `VacanciesFormCar`
--

DROP TABLE IF EXISTS `VacanciesFormCar`;
CREATE TABLE IF NOT EXISTS `VacanciesFormCar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `car` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `car_UNIQUE` (`car`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `VacanciesFormCar`
--

INSERT INTO `VacanciesFormCar` (`id`, `car`) VALUES
(1, 'есть'),
(2, 'нет');

-- --------------------------------------------------------

--
-- Структура таблицы `VacanciesFormConviction`
--

DROP TABLE IF EXISTS `VacanciesFormConviction`;
CREATE TABLE IF NOT EXISTS `VacanciesFormConviction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `conviction` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `conviction_UNIQUE` (`conviction`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `VacanciesFormConviction`
--

INSERT INTO `VacanciesFormConviction` (`id`, `conviction`) VALUES
(2, 'не судим'),
(1, 'судим');

-- --------------------------------------------------------

--
-- Структура таблицы `VacanciesFormMarriage`
--

DROP TABLE IF EXISTS `VacanciesFormMarriage`;
CREATE TABLE IF NOT EXISTS `VacanciesFormMarriage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `marriage` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `marriage_UNIQUE` (`marriage`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `VacanciesFormMarriage`
--

INSERT INTO `VacanciesFormMarriage` (`id`, `marriage`) VALUES
(3, 'гражданский брак'),
(1, 'женат/замужем'),
(2, 'не женат/не замужем');

-- --------------------------------------------------------

--
-- Структура таблицы `VacanciesFormMilitary`
--

DROP TABLE IF EXISTS `VacanciesFormMilitary`;
CREATE TABLE IF NOT EXISTS `VacanciesFormMilitary` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `military` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `military_UNIQUE` (`military`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `VacanciesFormMilitary`
--

INSERT INTO `VacanciesFormMilitary` (`id`, `military`) VALUES
(3, 'не военнообязаный'),
(2, 'не служил'),
(1, 'служил');

-- --------------------------------------------------------

--
-- Структура таблицы `VacanciesFormStatus`
--

DROP TABLE IF EXISTS `VacanciesFormStatus`;
CREATE TABLE IF NOT EXISTS `VacanciesFormStatus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `VacanciesFormStatus`
--

INSERT INTO `VacanciesFormStatus` (`id`, `status`) VALUES
(1, 'не обработана'),
(2, 'назначено собеседование'),
(3, 'отказано в собеседовании'),
(4, 'принят на работу'),
(5, 'отказано по результатам собеседования'),
(6, 'на удоление');

-- --------------------------------------------------------

--
-- Структура таблицы `VacanciesText`
--

DROP TABLE IF EXISTS `VacanciesText`;
CREATE TABLE IF NOT EXISTS `VacanciesText` (
  `lang` varchar(3) NOT NULL,
  `text` longtext NOT NULL,
  PRIMARY KEY (`lang`),
  UNIQUE KEY `num_UNIQUE` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `VacanciesText`
--

INSERT INTO `VacanciesText` (`lang`, `text`) VALUES
('eng', '<p class=''main_paragraph''><span class=''main_text''>APELSIN</span> is an active dynamically developing company that''s why we are always looking for initiative, hard working, and responsible employees.</p>\r\n<p class=''main_paragraph''>We provide on-the-job training and offer regular salary.</p>\r\n<p class=''main_paragraph''>If you are interested in decent salary for decent work &ndash; <span class=''main_text''>WE ARE WAITING FOR YOU</span>!!!</p>\r\n<center>\r\n<a class="fancybox" href="#send_resume"><button type="button" class="apelsin_button">оставить свое резюме</button></a>\r\n</center>\r\n<p class=''main_paragraph''>For more information about job openings, please call on <span class=''main_text''>8(4912)240-220</span>, <span class=''main_text''>8(4912)502-020</span>, or on the phone numbers on the right to the chosen vacancy.</p>\r\n<p class=''info_paragraph''>Information about the vacancies is only available on <span class=''main_text''>Russian language</span></p>\r\n'),
('rus', '<p class=''main_paragraph''><span class=''main_text''>АПЕЛЬСИН</span> &ndash; активная быстрорастущая компания, поэтому мы постоянно нуждаемся в сотрудниках. Нам требуются инициативные, трудолюбивые и ответственные люди.</p>\r\n<p class=''main_paragraph''>Мы предлагаем обучение и стабильную заработную плату.</p>\r\n<p class=''main_paragraph''>Если Вас интересует достойная оплата за достойный труд &ndash; <span class=''main_text''>МЫ ЖДЕМ ВАС!!!</span></p>\r\n<center>\r\n<a class="fancybox" href="#send_resume"><button type="button" class="apelsin_button">оставить свое резюме</button></a>\r\n</center>\r\n<p class=''main_paragraph''>Для получения более подробной информации об открытых предложениях звоните <span class=''main_text''>8(4912)240-220</span>, <span class=''main_text''>8(4912)502-020</span>, либо по телефонам указанным напротив конкретной вакансии.</p>');

-- --------------------------------------------------------

--
-- Структура таблицы `VacanciesValid`
--

DROP TABLE IF EXISTS `VacanciesValid`;
CREATE TABLE IF NOT EXISTS `VacanciesValid` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vacancies` varchar(100) NOT NULL,
  `adress` varchar(100) NOT NULL,
  `contactUser` text NOT NULL,
  `contactInfo` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_VacanciesValid_1_idx` (`vacancies`),
  KEY `fk_VacanciesValid_2_idx` (`adress`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Дамп данных таблицы `VacanciesValid`
--

INSERT INTO `VacanciesValid` (`id`, `vacancies`, `adress`, `contactUser`, `contactInfo`) VALUES
(1, 'Работник склада', 'ТЦ на Окружной', 'Щукин Николай', '8(920)632-72-50'),
(2, 'Работник склада', 'Бутырки', 'Гудков Сергей', '8(953)746-54-14'),
(3, 'Уборщица', 'Бутырки', 'Жилина Анастасия', '8(920)950-61-31'),
(4, 'Работник склада', 'Шабулина', 'Галяев Александр', '8(920)956-59-69'),
(5, 'Уборщица', 'Островского', 'Овчинников Евгений', '8(920)638-33-98'),
(6, 'Менеджер кредитного отдела', 'Шабулина', 'Сажина Ольга', '8(920)635-52-56'),
(7, 'Менеджер по продажам', 'Островского', 'Овчинников Евгений', '8(920)638-33-98'),
(8, 'Менеджер по продажам', 'ТЦ на Окружной', 'Вахитов Фарит', '8(920)635-60-95'),
(9, 'Менеджер по продажам', 'Есенина', 'Кадыров Фархад', '8(920)954-08-64'),
(10, 'Менеджер по продажам', 'Шабулина', 'Павлова Ольга', '8(920)972-02-09'),
(11, 'Уборщица', 'Луховицы', 'Хохлова Надежда', '8(930)888-75-00'),
(12, 'Менеджер по продажам', 'Бутырки', 'Жилина Анастасия', '8(920)950-61-31'),
(13, 'Работник склада', 'Луховицы', 'Абросин Виктор', '8(929)065-11-21'),
(14, 'Уборщица', 'Верхняя', 'Давыдова Татьяна', '8(910)645-02-60'),
(15, 'Логист', 'Отдел Логистики', 'Бан Кристина', '8(920)635-50-08'),
(16, 'Продавец корпусной мебели', 'Студия Мебели', 'Бородин Игорь', '8(905)187-67-70'),
(17, 'Менеджер по продажам', 'Пол &amp; Стены', 'Кадыкова Мария', '8(920)975-59-80'),
(18, 'Менеджер по продажам', 'Луховицы', 'Руньков Игорь', '8(920)950-12-00'),
(19, 'Уборщица', 'Чкалова', 'Кузьмин Александр', '8(920)991-01-28'),
(20, 'Кассир', 'Зубковой', 'Люлин Алексей', '8(920)950-93-39');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `ApelsinContactsNavigationPanel_Lang`
--
ALTER TABLE `ApelsinContactsNavigationPanel_Lang`
  ADD CONSTRAINT `fk_ApelsinContactsNavigationPanel_Lang_1` FOREIGN KEY (`alias`) REFERENCES `ApelsinContactsNavigationPanel` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ApelsinContactsNavigationPanel_Lang_2` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ApelsinContactsNavigationPanel_SiteMapGroup`
--
ALTER TABLE `ApelsinContactsNavigationPanel_SiteMapGroup`
  ADD CONSTRAINT `fk_ApelsinContactsNavigationPanel_SiteMapGroup_1` FOREIGN KEY (`alias`) REFERENCES `ApelsinContactsNavigationPanel` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ApelsinContactsNavigationPanel_SiteMapGroup_2` FOREIGN KEY (`group`) REFERENCES `SiteMapGroups` (`alias`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `ComponentsDepends`
--
ALTER TABLE `ComponentsDepends`
  ADD CONSTRAINT `fk_ComponentsDepends_1` FOREIGN KEY (`elementType`) REFERENCES `ComponentsDependsElementsType` (`elementType`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ComponentsDepends_2` FOREIGN KEY (`component`) REFERENCES `Components` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ComponentsElements`
--
ALTER TABLE `ComponentsElements`
  ADD CONSTRAINT `fk_ComponentsElements_1` FOREIGN KEY (`component`) REFERENCES `Components` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ContactDepartments_has_ContactDepartmentsList`
--
ALTER TABLE `ContactDepartments_has_ContactDepartmentsList`
  ADD CONSTRAINT `fk_ContactDepartments_has_ContactDepartmentsList_1` FOREIGN KEY (`department`) REFERENCES `ContactDepartments` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ContactDepartments_has_ContactDepartmentsList_2` FOREIGN KEY (`list`) REFERENCES `ContactDepartmentsList` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ContactDepartments_has_ContactsWorkersList`
--
ALTER TABLE `ContactDepartments_has_ContactsWorkersList`
  ADD CONSTRAINT `fk_ContactDepartments_has_ContactsWorkersList_ContactDepartme1` FOREIGN KEY (`department`) REFERENCES `ContactDepartments` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ContactDepartments_has_ContactsWorkersList_ContactsWorkers1` FOREIGN KEY (`list`) REFERENCES `ContactsWorkersList` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ContactDepartments_Lang`
--
ALTER TABLE `ContactDepartments_Lang`
  ADD CONSTRAINT `fk_ContactDepartments_Lang_1` FOREIGN KEY (`department`) REFERENCES `ContactDepartments` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ContactDepartments_Lang_2` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ContactsShop`
--
ALTER TABLE `ContactsShop`
  ADD CONSTRAINT `fk_ContactsShop_1` FOREIGN KEY (`map`) REFERENCES `Maps` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ContactsShop_2` FOREIGN KEY (`workers`) REFERENCES `ContactsWorkersList` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ContactsShopBuilding`
--
ALTER TABLE `ContactsShopBuilding`
  ADD CONSTRAINT `fk_ContactsShopBuilding_1` FOREIGN KEY (`shop`) REFERENCES `ContactsShop` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ContactsShopBuilding_Lang`
--
ALTER TABLE `ContactsShopBuilding_Lang`
  ADD CONSTRAINT `fk_ContactsShopBuilding_Lang_1` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ContactsShopBuilding_Lang_2` FOREIGN KEY (`shopBuilding`) REFERENCES `ContactsShopBuilding` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ContactsShopReviews`
--
ALTER TABLE `ContactsShopReviews`
  ADD CONSTRAINT `fk_reviews_1` FOREIGN KEY (`shop`) REFERENCES `ContactsShop` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ContactsShop_Lang`
--
ALTER TABLE `ContactsShop_Lang`
  ADD CONSTRAINT `fk_ContactsShop_Lang_1` FOREIGN KEY (`shop`) REFERENCES `ContactsShop` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ContactsShop_Lang_2` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ContactsUnits`
--
ALTER TABLE `ContactsUnits`
  ADD CONSTRAINT `fk_ContactsUnits_1` FOREIGN KEY (`type`) REFERENCES `ContactsUnitsTypes` (`type`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ContactsUnitsMaps`
--
ALTER TABLE `ContactsUnitsMaps`
  ADD CONSTRAINT `fk_ContactsUnitsMaps_1` FOREIGN KEY (`unit`) REFERENCES `ContactsUnits` (`unit`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ContactsUnitsMaps_2` FOREIGN KEY (`map`) REFERENCES `Maps` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ContactsUnitsTypes_Lang`
--
ALTER TABLE `ContactsUnitsTypes_Lang`
  ADD CONSTRAINT `fk_ContactsUnitsTypes_Lang_1` FOREIGN KEY (`type`) REFERENCES `ContactsUnitsTypes` (`type`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ContactsUnitsypes_Lang_2` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ContactsUnits_lang`
--
ALTER TABLE `ContactsUnits_lang`
  ADD CONSTRAINT `fk_ContactsUnits_lang_1` FOREIGN KEY (`unit`) REFERENCES `ContactsUnits` (`unit`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ContactsUnits_lang_2` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ContactsWorkers`
--
ALTER TABLE `ContactsWorkers`
  ADD CONSTRAINT `fk_ContactsWorkers_1` FOREIGN KEY (`post`) REFERENCES `ContactsWorkersPosts` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ContactsWorkersPosts_Lang`
--
ALTER TABLE `ContactsWorkersPosts_Lang`
  ADD CONSTRAINT `fk_ContactsWorkersPosts_Lang_1` FOREIGN KEY (`post`) REFERENCES `ContactsWorkersPosts` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ContactsWorkersPosts_Lang_2` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ContactsWorkers_has_ContactsWorkersList`
--
ALTER TABLE `ContactsWorkers_has_ContactsWorkersList`
  ADD CONSTRAINT `ContactsWorkers_has_ContactsWorkersList_ibfk_1` FOREIGN KEY (`contact`) REFERENCES `ContactsWorkers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ContactsWorkers_has_ContactsWorkersList_ContactsWorkersList1` FOREIGN KEY (`list`) REFERENCES `ContactsWorkersList` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ContactsWorkers_Lang`
--
ALTER TABLE `ContactsWorkers_Lang`
  ADD CONSTRAINT `ContactsWorkers_Lang_ibfk_1` FOREIGN KEY (`worker`) REFERENCES `ContactsWorkers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ContactsWorkers_Lang_2` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `CreatedModules`
--
ALTER TABLE `CreatedModules`
  ADD CONSTRAINT `fk_CreatedModules_1` FOREIGN KEY (`module`) REFERENCES `Modules` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `HtmlModul_Lang`
--
ALTER TABLE `HtmlModul_Lang`
  ADD CONSTRAINT `fk_HtmlModul_Lang_HtmlModul` FOREIGN KEY (`htmlModul`) REFERENCES `HtmlModul` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_HtmlModul_Lang_Lang` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Logo`
--
ALTER TABLE `Logo`
  ADD CONSTRAINT `fk_Logo_Lang` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `MapBildings`
--
ALTER TABLE `MapBildings`
  ADD CONSTRAINT `fk_MapBildings_1` FOREIGN KEY (`block`) REFERENCES `MapBildingsBlocks` (`block`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_MapBildings_2` FOREIGN KEY (`page`) REFERENCES `Pages` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `MapBildings_Lang`
--
ALTER TABLE `MapBildings_Lang`
  ADD CONSTRAINT `fk_MapBildings_Lang_1` FOREIGN KEY (`bild`) REFERENCES `MapBildings` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_MapBildings_Lang_2` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `MaterialsCategoriesInList`
--
ALTER TABLE `MaterialsCategoriesInList`
  ADD CONSTRAINT `fk_MaterialsCategoriesInList_CategoriesList_CategoriesList` FOREIGN KEY (`list`) REFERENCES `MaterialsCategoriesList` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_MaterialsCategoriesInList_MaterialsCategories` FOREIGN KEY (`category`) REFERENCES `MaterialsCategories` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `MaterialsCategoriesList_Lang`
--
ALTER TABLE `MaterialsCategoriesList_Lang`
  ADD CONSTRAINT `fk_MaterialsCategoriesList_Lang_Lang_Lang` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_MaterialsCategoriesList_Lang_MaterialsCategories` FOREIGN KEY (`list`) REFERENCES `MaterialsCategoriesList` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `MaterialsCategories_Lang`
--
ALTER TABLE `MaterialsCategories_Lang`
  ADD CONSTRAINT `fk_MaterialsCategories_Lang_Lang` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_MaterialsCategories_Lang_MaterialsCategories` FOREIGN KEY (`category`) REFERENCES `MaterialsCategories` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `MaterialsInCategories`
--
ALTER TABLE `MaterialsInCategories`
  ADD CONSTRAINT `fk_MaterialsInCategories_Materials` FOREIGN KEY (`material`) REFERENCES `Materials` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_MaterialsInCategories_MaterialsCategories` FOREIGN KEY (`category`) REFERENCES `MaterialsCategories` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Materials_Lang`
--
ALTER TABLE `Materials_Lang`
  ADD CONSTRAINT `fk_Materials_Lang_Lang` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Materials_Lang_Materials` FOREIGN KEY (`material`) REFERENCES `Materials` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Menu`
--
ALTER TABLE `Menu`
  ADD CONSTRAINT `fk_Menu_MenuTypes` FOREIGN KEY (`type`) REFERENCES `MenuTypes` (`type`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `MenuItemParent`
--
ALTER TABLE `MenuItemParent`
  ADD CONSTRAINT `fk_MenuItemParent_MenuItems1` FOREIGN KEY (`menuItem`) REFERENCES `MenuItems` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_MenuItemParent_MenuItems2` FOREIGN KEY (`parent`) REFERENCES `MenuItems` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `MenuItems`
--
ALTER TABLE `MenuItems`
  ADD CONSTRAINT `fk_MenuElements_Menu` FOREIGN KEY (`menu`) REFERENCES `Menu` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_MenuItems_UrlTarget` FOREIGN KEY (`target`) REFERENCES `UrlTarget` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `MenuItemsPage`
--
ALTER TABLE `MenuItemsPage`
  ADD CONSTRAINT `fk_MenuItemsPage_MenuItems` FOREIGN KEY (`menuItem`) REFERENCES `MenuItems` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_MenuItemsPage_Pages` FOREIGN KEY (`page`) REFERENCES `Pages` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `MenuItems_Lang`
--
ALTER TABLE `MenuItems_Lang`
  ADD CONSTRAINT `fk_MenuItems_Lang_Lang` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_MenuItems_Lang_MenuItems` FOREIGN KEY (`menuItem`) REFERENCES `MenuItems` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ModulesDepends`
--
ALTER TABLE `ModulesDepends`
  ADD CONSTRAINT `fk_ModulesDepends_1` FOREIGN KEY (`elementType`) REFERENCES `ModulesDependsElementsType` (`elementType`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ModulesDepends_2` FOREIGN KEY (`module`) REFERENCES `Modules` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ModulesInBlocks`
--
ALTER TABLE `ModulesInBlocks`
  ADD CONSTRAINT `fk_ModulesInBlocks_1` FOREIGN KEY (`module`) REFERENCES `CreatedModules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ModulesInBlocks_2` FOREIGN KEY (`block`) REFERENCES `TemplateBlocks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ModulesInBlocks_Lang`
--
ALTER TABLE `ModulesInBlocks_Lang`
  ADD CONSTRAINT `fk_ModulesInBlocks_Lang_1` FOREIGN KEY (`module`) REFERENCES `ModulesInBlocks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ModulesInBlocks_Lang_2` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ModulesOnPages`
--
ALTER TABLE `ModulesOnPages`
  ADD CONSTRAINT `fk_ModulesOnPages_1` FOREIGN KEY (`module`) REFERENCES `ModulesInBlocks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ModulesOnPages_2` FOREIGN KEY (`page`) REFERENCES `Pages` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ModulesParam`
--
ALTER TABLE `ModulesParam`
  ADD CONSTRAINT `fk_ModulesParam_1` FOREIGN KEY (`module`) REFERENCES `CreatedModules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ModulesTitleIcon`
--
ALTER TABLE `ModulesTitleIcon`
  ADD CONSTRAINT `fk_ModulesTitleIcon_1` FOREIGN KEY (`module`) REFERENCES `ModulesInBlocks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ModulesTitleIcon_2` FOREIGN KEY (`style`) REFERENCES `ModulesTitleIconStile` (`style`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `PageParam`
--
ALTER TABLE `PageParam`
  ADD CONSTRAINT `fk_PageParam_1` FOREIGN KEY (`page`) REFERENCES `Pages` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Pages`
--
ALTER TABLE `Pages`
  ADD CONSTRAINT `fk_Pages_1` FOREIGN KEY (`componentElement`) REFERENCES `ComponentsElements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Pages_2` FOREIGN KEY (`template`) REFERENCES `Templates` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Pages_Lang`
--
ALTER TABLE `Pages_Lang`
  ADD CONSTRAINT `fk_Pages_Lang_1` FOREIGN KEY (`page`) REFERENCES `Pages` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Pages_Lang_2` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ParamInfo_ComponentsElements`
--
ALTER TABLE `ParamInfo_ComponentsElements`
  ADD CONSTRAINT `fk_ParamInfo_ComponentsElements_1` FOREIGN KEY (`componentElement`) REFERENCES `ComponentsElements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `PluginDefaultParam`
--
ALTER TABLE `PluginDefaultParam`
  ADD CONSTRAINT `fk_PluginDefaultParam_1` FOREIGN KEY (`plugin`) REFERENCES `Plugins` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `PluginDepends`
--
ALTER TABLE `PluginDepends`
  ADD CONSTRAINT `fk_PluginDepends_1` FOREIGN KEY (`elementType`) REFERENCES `PluginsDependsElementsType` (`elementType`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_PluginDepends_2` FOREIGN KEY (`plugin`) REFERENCES `Plugins` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `PluginOnPage`
--
ALTER TABLE `PluginOnPage`
  ADD CONSTRAINT `fk_PluginOnPage_1` FOREIGN KEY (`plugin`) REFERENCES `Plugins` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_PluginOnPage_2` FOREIGN KEY (`page`) REFERENCES `Pages` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `PluginParam`
--
ALTER TABLE `PluginParam`
  ADD CONSTRAINT `fk_PluginParam_1` FOREIGN KEY (`plugin`) REFERENCES `PluginOnPage` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `SiteMap`
--
ALTER TABLE `SiteMap`
  ADD CONSTRAINT `fk_SiteMap_1` FOREIGN KEY (`group`) REFERENCES `SiteMapGroups` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `SiteMapGroupsPages`
--
ALTER TABLE `SiteMapGroupsPages`
  ADD CONSTRAINT `fk_SiteMapGroupsPages_1` FOREIGN KEY (`alias`) REFERENCES `SiteMapGroups` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_SiteMapGroupsPages_2` FOREIGN KEY (`page`) REFERENCES `Pages` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `SiteMapGroups_Lang`
--
ALTER TABLE `SiteMapGroups_Lang`
  ADD CONSTRAINT `fk_SiteMapGroups_Lang_1` FOREIGN KEY (`alias`) REFERENCES `SiteMapGroups` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_SiteMapGroups_Lang_2` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `SiteMapPages`
--
ALTER TABLE `SiteMapPages`
  ADD CONSTRAINT `fk_SiteMapPages_1` FOREIGN KEY (`alias`) REFERENCES `SiteMap` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_SiteMapPages_2` FOREIGN KEY (`page`) REFERENCES `Pages` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `SiteMap_Lang`
--
ALTER TABLE `SiteMap_Lang`
  ADD CONSTRAINT `fk_SiteMap_Lang_1` FOREIGN KEY (`alias`) REFERENCES `SiteMap` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_SiteMap_Lang_2` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Sliders`
--
ALTER TABLE `Sliders`
  ADD CONSTRAINT `fk_Sliders_1` FOREIGN KEY (`controls_position`) REFERENCES `SlidersControlsPosition` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Sliders_2` FOREIGN KEY (`focus_position`) REFERENCES `SlidersFocusPosition` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Sliders_3` FOREIGN KEY (`numbers_align`) REFERENCES `SlidersNumbersAlign` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Sliders_4` FOREIGN KEY (`labelAnimation`) REFERENCES `SlidersLabelAnimation` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Sliders_5` FOREIGN KEY (`animations`) REFERENCES `SlidesAnimations` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Sliders_SlidersThemes` FOREIGN KEY (`theme`) REFERENCES `SlidersThemes` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Slides`
--
ALTER TABLE `Slides`
  ADD CONSTRAINT `fk_Slides_Sliders` FOREIGN KEY (`slider`) REFERENCES `Sliders` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Slides_SlidesAnimations` FOREIGN KEY (`animation`) REFERENCES `SlidesAnimations` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `TemplateBlocks`
--
ALTER TABLE `TemplateBlocks`
  ADD CONSTRAINT `fk_TemplateBlocks_1` FOREIGN KEY (`template`) REFERENCES `Templates` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `TemplateDependence`
--
ALTER TABLE `TemplateDependence`
  ADD CONSTRAINT `fk_TemplateDependence_1` FOREIGN KEY (`template`) REFERENCES `Templates` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Users`
--
ALTER TABLE `Users`
  ADD CONSTRAINT `fk_Users_1` FOREIGN KEY (`group`) REFERENCES `UsersGroups` (`group`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `UsersGroups_Lang`
--
ALTER TABLE `UsersGroups_Lang`
  ADD CONSTRAINT `fk_UsersGroups_Lang_1` FOREIGN KEY (`group`) REFERENCES `UsersGroups` (`group`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_UsersGroups_Lang_2` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `UsersMassage`
--
ALTER TABLE `UsersMassage`
  ADD CONSTRAINT `fk_UsersMassage_1` FOREIGN KEY (`sender`) REFERENCES `Users` (`login`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_UsersMassage_2` FOREIGN KEY (`addressee`) REFERENCES `Users` (`login`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `UsersNotifications`
--
ALTER TABLE `UsersNotifications`
  ADD CONSTRAINT `fk_UsersNotifications_1` FOREIGN KEY (`type`) REFERENCES `UsersNotificationsType` (`type`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_UsersNotifications_2` FOREIGN KEY (`user`) REFERENCES `Users` (`login`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `UsersNotifications_Lang`
--
ALTER TABLE `UsersNotifications_Lang`
  ADD CONSTRAINT `fk_UsersNotifications_Lang_1` FOREIGN KEY (`usersNotifications`) REFERENCES `UsersNotifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_UsersNotifications_Lang_2` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `VacanciesAdressPages`
--
ALTER TABLE `VacanciesAdressPages`
  ADD CONSTRAINT `fk_VacanciesAdressPages_1` FOREIGN KEY (`adress`) REFERENCES `VacanciesAdress` (`adress`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_VacanciesAdressPages_2` FOREIGN KEY (`page`) REFERENCES `Pages` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `VacanciesForm`
--
ALTER TABLE `VacanciesForm`
  ADD CONSTRAINT `fk_VacanciesForm_1` FOREIGN KEY (`marriage`) REFERENCES `VacanciesFormMarriage` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_VacanciesForm_2` FOREIGN KEY (`military`) REFERENCES `VacanciesFormMilitary` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_VacanciesForm_3` FOREIGN KEY (`vacancies`) REFERENCES `Vacancies` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_VacanciesForm_4` FOREIGN KEY (`status`) REFERENCES `VacanciesFormStatus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_VacanciesForm_5` FOREIGN KEY (`conviction`) REFERENCES `VacanciesFormConviction` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_VacanciesForm_6` FOREIGN KEY (`car`) REFERENCES `VacanciesFormCar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `VacanciesText`
--
ALTER TABLE `VacanciesText`
  ADD CONSTRAINT `VacanciesText_ibfk_1` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `VacanciesValid`
--
ALTER TABLE `VacanciesValid`
  ADD CONSTRAINT `fk_VacanciesValid_1` FOREIGN KEY (`vacancies`) REFERENCES `Vacancies` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_VacanciesValid_2` FOREIGN KEY (`adress`) REFERENCES `VacanciesAdress` (`adress`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
