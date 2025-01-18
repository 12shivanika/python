# Constraints - Rules framed during table creations

/* 
1. PRIMARY KEY - Uniquely records and does not all allow NULLS
2.NOT NULL - 
3.UNIQUE - Unique ke
4.check - Validating the data
5.DEFAULT
6.FOREIGN KEY
 */
 
 USE supermarket;
  Drop Table IF EXISTS Product;
 CREATE TABLE Product(
ProductID INT PRIMARY KEY , 
ProductName VARCHAR(200) NOT NULL,
 UnitPrice decimal(7,2),
 Des VARCHAR(500),
 created DATETIME);
 
 INSERT INTO Product(
ProductID, 
ProductName,
 UnitPrice,
 Des,
 Created)
 VALUES(12345, "DOVE", 250.00,"Soap", current_timestamp()),
 (14225, "FOGG", 450.00,"Scent", current_timestamp()),
 (1345, "LAYS", 350.00,"food", current_timestamp()),
 (2245, "BINGO", 150.00,"food", current_timestamp());

DESC Product;
SELECT * from  product;

#NOT NULL
 INSERT INTO Product(
ProductID, 
ProductName,
 UnitPrice,
 Des,
 Created)
 VALUES(12345, NULL, 250.00,"Soap", current_timestamp());
 
  INSERT INTO Product(
ProductID, 
ProductName,
 UnitPrice,
 Des,
 Created)
 VALUES(12345, "DOVE", 250.00,"Soap", current_timestamp());
 
   INSERT INTO Product(
ProductID, 
ProductName,
 UnitPrice,
 Des,
 Created)
 VALUES(100, "OVE", 250.00,"Soap", current_timestamp());
 
  INSERT INTO Product(
ProductID, 
ProductName,
 UnitPrice,
 Des,
 Created)
 VALUES(200, "OVE", 250.00,"Soap", current_timestamp());
 drop table Customer;
SELECT * from  Customer;

CREATE TABLE Customer3(
CustomerID INT primary key ,
CustomerName VARCHAR(50) NOT NULL,
Mobile CHAR(10) unique check(length(Mobile)=10),
Gender VARCHAR(10) check(Gender IN('MALE','FEMALE')),
City VARCHAR(50) DEFAULT 'Chennai',
Address VARCHAR(200),
Created DATETIME);


INSERT INTO Customer3
(CustomerID,
CustomerName,
Mobile,
Gender,
City,
Address,
Created)
VALUES(1, "Shivanika",'4234567891', "FEMALE", 'Mumbai' , 'ssd12',current_timestamp()),
      (2,"Sanjans", '1234567891',  "FEMALE", 'Mumbai' , 'ssd12',current_timestamp()),
      (3,"Haritha", '9876543211',  "FEMALE", 'Chennai', 'xyz2', current_timestamp()),
      (4,"Varshini", '2234577911',   "FEMALE", DEFAULT , 'ssd12',current_timestamp());

SELECT * from  Customer;


INSERT INTO Customer
(CustomerID,
CustomerName,
Mobile,
Address,
Created)
VALUES(6,"Varsha", NULL , 'ssd12',current_timestamp());

INSERT INTO Customer
(CustomerID,CustomerName,Mobile,Address,Created)
VALUES(50,"Varsha", NULL , 'ssd12',current_timestamp());

SELECT * FROM Customer
where Mobile = "2234577911";

desc customer;

UPDATE Customer
SET customerID = 75
where Mobile = "2234577911";

UPDATE Customer
SET customerID = 10
where Mobile = "4234567891";

UPDATE Customer
SET customerID = 20
where Mobile = '1234567891';

DELETE FROM CUSTOMER
where Mobile = '1234567891';

# difference between  primary key and unique constraint
/*
1. primary key can be only one for table. unique constraint can be set to multiple fields
2.primary key will not allow null. unique constraint will allow NULL 
*/
 
 
