-- MySQL dump 10.11
--
-- Host: localhost    Database: magus
-- ------------------------------------------------------
-- Server version	5.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL auto_increment,
  `category` varchar(64) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `depends`
--

DROP TABLE IF EXISTS `depends`;
CREATE TABLE `depends` (
  `port` varchar(128) NOT NULL,
  `dependency` varchar(128) NOT NULL,
  KEY `port` (`port`),
  KEY `dependency` (`dependency`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `locks`
--

DROP TABLE IF EXISTS `locks`;
CREATE TABLE `locks` (
  `id` int(11) NOT NULL auto_increment,
  `port` varchar(128) NOT NULL,
  `arch` varchar(8) NOT NULL,
  `machine` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `port` (`port`,`arch`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `result` int(11) NOT NULL,
  `phase` varchar(32) NOT NULL,
  `data` longtext,
  UNIQUE KEY `result` (`result`,`phase`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `machines`
--

DROP TABLE IF EXISTS `machines`;
CREATE TABLE `machines` (
  `id` int(11) NOT NULL auto_increment,
  `arch` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `maintainer` varchar(128) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `port_categories`
--

DROP TABLE IF EXISTS `port_categories`;
CREATE TABLE `port_categories` (
  `port` varchar(128) NOT NULL,
  `category` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `ports`
--

DROP TABLE IF EXISTS `ports`;
CREATE TABLE `ports` (
  `name` varchar(128) NOT NULL,
  `version` varchar(32) default NULL,
  `description` text,
  `license` varchar(16) default NULL,
  `pkgname` varchar(128) NOT NULL,
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
CREATE TABLE `results` (
  `id` int(11) NOT NULL auto_increment,
  `port` varchar(128) NOT NULL,
  `version` varchar(32) NOT NULL,
  `summary` varchar(32) NOT NULL,
  `machine` int(11) NOT NULL,
  `arch` varchar(8) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `port` (`port`,`version`),
  KEY `port_2` (`port`,`version`,`arch`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `subresults`
--

DROP TABLE IF EXISTS `subresults`;
CREATE TABLE `subresults` (
  `result` int(11) NOT NULL,
  `phase` varchar(16) NOT NULL,
  `type` varchar(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `msg` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;



--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
  `id` int(11) NOT NULL auto_increment,
  `type` varchar(64) NOT NULL,
  `machine` int(11) NOT NULL,
  `started` tinyint(1) NOT NULL default '0',
  `completed` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2007-10-22 16:05:40
