CREATE DATABASE CompanySupplyProduct; 

CREATE TABLE Company ( 
	 CompanyID int AUTO_INCREMENT,
	  `Name` varchar(40),
	  NumberofEmployee int,
	  Address varchar(50),
	  Telephone char(15),
	  EstablishmentDay date,
	  PRIMARY KEY (CompanyID)
); 

CREATE TABLE Product ( 
  ProductID int AUTO_INCREMENT,
  `Name` varchar(40),
  Color char(14),
  Price decimal(10,2),
  PRIMARY KEY (ProductID)
); 

CREATE TABLE Supply (
  CompanyID int,
  ProductID int,
  Quantity int,
  PRIMARY KEY(CompanyID,ProductID),
  FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID) ON DELETE CASCADE,
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE
)


