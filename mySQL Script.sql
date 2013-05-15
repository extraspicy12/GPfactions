delimiter $$

CREATE DATABASE `GPfactions` /*!40100 DEFAULT CHARACTER SET utf8 */$$

delimiter $$

CREATE TABLE `factions` (
  `factionID` int(11) NOT NULL AUTO_INCREMENT,
  `factionName` varchar(45) NOT NULL,
  `factionDesc` text NOT NULL,
  PRIMARY KEY (`factionID`),
  UNIQUE KEY `factionID_UNIQUE` (`factionID`),
  UNIQUE KEY `factionName_UNIQUE` (`factionName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

delimiter $$

CREATE TABLE `allies` (
  `allianceID` int(11) NOT NULL AUTO_INCREMENT,
  `factionA` int(11) NOT NULL,
  `factionB` int(11) NOT NULL,
  PRIMARY KEY (`allianceID`),
  UNIQUE KEY `allianceID_UNIQUE` (`allianceID`),
  KEY `factionA` (`factionA`),
  KEY `factionB` (`factionB`),
  CONSTRAINT `allies_ibfk_1` FOREIGN KEY (`factionA`) REFERENCES `factions` (`factionID`),
  CONSTRAINT `allies_ibfk_2` FOREIGN KEY (`factionB`) REFERENCES `factions` (`factionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

delimiter $$

CREATE TABLE `allyrequests` (
  `requestID` int(11) NOT NULL AUTO_INCREMENT,
  `requestSender` int(11) NOT NULL,
  `requestReceiver` int(11) NOT NULL,
  PRIMARY KEY (`requestID`),
  UNIQUE KEY `requestID_UNIQUE` (`requestID`),
  KEY `requestSender` (`requestSender`),
  KEY `requestReceiver` (`requestReceiver`),
  CONSTRAINT `allyrequests_ibfk_1` FOREIGN KEY (`requestSender`) REFERENCES `factions` (`factionID`),
  CONSTRAINT `allyrequests_ibfk_2` FOREIGN KEY (`requestReceiver`) REFERENCES `factions` (`factionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

delimiter $$

CREATE TABLE `enemies` (
  `enemyID` int(11) NOT NULL AUTO_INCREMENT,
  `factionA` int(11) NOT NULL,
  `factionB` int(11) NOT NULL,
  PRIMARY KEY (`enemyID`),
  UNIQUE KEY `enemyID_UNIQUE` (`enemyID`),
  KEY `factionA` (`factionA`),
  KEY `factionB` (`factionB`),
  CONSTRAINT `enemies_ibfk_1` FOREIGN KEY (`factionA`) REFERENCES `factions` (`factionID`),
  CONSTRAINT `enemies_ibfk_2` FOREIGN KEY (`factionB`) REFERENCES `factions` (`factionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

delimiter $$

CREATE TABLE `players` (
  `playerID` int(11) NOT NULL,
  `playerName` varchar(45) NOT NULL,
  `playerFaction` int(11) DEFAULT NULL,
  PRIMARY KEY (`playerID`),
  UNIQUE KEY `playerID_UNIQUE` (`playerID`),
  UNIQUE KEY `playerName_UNIQUE` (`playerName`),
  KEY `playerFaction` (`playerFaction`),
  CONSTRAINT `players_ibfk_1` FOREIGN KEY (`playerFaction`) REFERENCES `factions` (`factionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$
