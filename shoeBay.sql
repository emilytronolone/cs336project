CREATE DATABASE IF NOT EXISTS `shoeBay`;
USE `shoeBay`;


DROP TABLE IF EXISTS `bid`;
DROP TABLE IF EXISTS `customerRepresentatives`;
DROP TABLE IF EXISTS `autobid`;

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
<<<<<<< HEAD

=======
							
>>>>>>> ac206f674635be1623af9b4541413a8563d52c8e
DROP TABLE IF EXISTS `shoes`;
CREATE TABLE `shoes`(
	`serialNumber` INT NOT NULL AUTO_INCREMENT,
	`biddingPrice` FLOAT,
	`reserve` FLOAT,
	`size` FLOAT,
	`color` VARCHAR(10),
	`demographic` VARCHAR(5),
	`style` VARCHAR(15),
    `endi` DATETIME,
	PRIMARY KEY (`serialNumber`)
);
ALTER TABLE `shoes` AUTO_INCREMENT = 1;

<<<<<<< HEAD
INSERT INTO `shoes` (biddingPrice, reserve, size, color, demographic, style, endi) VALUES ('1.00', '1.00', '4', 'red', 'women', 'heels', '1000-01-01 00:00:00'),
						  ('1.00', '1.00', '5', 'yellow', 'child', 'sneakers', '1000-01-01 00:00:00'),
                          ('1.00', '1.00', '7', 'black', 'men', 'sandals', '1000-01-01 00:00:00');
=======
INSERT INTO `shoes` VALUES ('1', '1.00', '1.00', '4', 'red', 'women', 'heels', '1000-01-01 00:00:00'),
						  ('2', '1.00', '1.00', '5', 'yellow', 'child', 'sneakers', '1000-01-01 00:00:00'),
                          ('3', '1.00', '1.00', '7', 'black', 'men', 'sandals', '1000-01-01 00:00:000');
                          
>>>>>>> ac206f674635be1623af9b4541413a8563d52c8e

CREATE TABLE `bid`(
	`price` FLOAT,
    `serialNumber` INT,
    `username` VARCHAR(50),
	foreign key (`serialNumber`) references `shoes`(`serialNumber`),
    foreign key (`username`) references `account`(`username`)
    );
    
DROP TABLE IF EXISTS `alerts`;
CREATE TABLE `alerts`(
`username` VARCHAR(50),
`serialNumber` INT,
`price` FLOAT
);

<<<<<<< HEAD
DROP TABLE IF EXISTS `autobid`;
=======

>>>>>>> ac206f674635be1623af9b4541413a8563d52c8e
CREATE TABLE `autobid`(
	`currBid` INT,
    `highestBid` INT,
    `increment` INT,
    `serialNumber` INT,
    `username` VARCHAR(50), 
    foreign key (`serialNumber`) references `shoes`(`serialNumber`),
    foreign key (`username`) references `account`(`username`),
    PRIMARY KEY(`serialNumber`, `username`));

DROP TABLE IF EXISTS `summarySalesReports`;
CREATE TABLE `summarySalesReports`(
	`salesID` INT,
	`totalEarnings` INT,
	`items` INT,
	`itemType` VARCHAR(50),
	`endUser` VARCHAR(50),
	PRIMARY KEY (`salesID`)
);

CREATE TABLE `customerRepresentatives`(
	`representativeID` INT,
	`username` VARCHAR(50),
  `password` VARCHAR(128),
  PRIMARY KEY (`representativeID`),
<<<<<<< HEAD
  FOREIGN KEY (`username`) REFERENCES `account` (`username`),
  FOREIGN KEY (`password`) REFERENCES `account` (`password`)
);
=======
  FOREIGN KEY (`username`) REFERENCES `account` (`username`)
);

>>>>>>> ac206f674635be1623af9b4541413a8563d52c8e
