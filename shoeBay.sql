CREATE DATABASE IF NOT EXISTS `shoeBay`;
USE `shoeBay`;

DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`(
	`username` VARCHAR(50),
    `password` VARCHAR(128),
    `type` VARCHAR(30) DEFAULT 'customer',
    PRIMARY KEY (`username`)
);

INSERT INTO `account` VALUES ('emily', 'emily', 'customer'),
							('alyssa', 'password', 'customer'),
							('admin1', 'admin', 'admin'),
							('customRep1', 'customRep', 'customerRepresentative');
               
			
DROP TABLE IF EXISTS `shoes`;
CREATE TABLE `shoes`(
	`serialNumber` INT,
  `biddingPrice` FLOAT,
  `buyItNowPrice` FLOAT,
  `size` INT,
  `color` VARCHAR(10),
  `demographic` VARCHAR(5),
  `style` VARCHAR(15),
  PRIMARY KEY (`serialNumber`)
);
INSERT INTO `shoes` VALUES();

DROP TABLE IF EXISTS `summarySalesReports`;
CREATE TABLE `summarySalesReports`(
	`salesID` INT,
  `totalEarnings` INT,
  `items` INT,
  `itemType` VARCHAR(50),
  `endUser` VARCHAR(50),
  PRIMARY KEY (`salesID`)
);
INSERT INTO `summarySalesReports` VALUES();

DROP TABLE IF EXISTS `customerRepresentatives`;
CREATE TABLE `customerRepresentatives`(
	`representativeID` INT,
	`username` VARCHAR(50),
  `password` VARCHAR(128),
  PRIMARY KEY (`representativeID`),
  FOREIGN KEY (`username`) REFERENCES `account` (`username`),
  FOREIGN KEY (`password`) REFERENCES `account` (`password`)
);

