# sql comment
/* DDL - Data defintion language
DML- Bata Manupulation language 
DQL- Data query language
TCL- Translation control language

DDL- CREATE, DROP, ALTER, TRUNCATE
DML - INSERT, UPDATE, DELETE
DQL - SELECT
TCL - COMMIT, RPLL BACK, SAVE POINT
 */
 
 -- SQL - STRUCTURED QUERY LANGUAGE
 
DROP DATABASE Supermarket;
CREATE DATABASE Supermarket;

USE Supermarket;

SHOW DATABASES;
desc customer;
drop table Customer;

CREATE TABLE Customer(
CustomerID INT primary key,
CustomerName VARCHAR(50) NOT NULL,
Mobile CHAR(10) unique,
City VARCHAR(50),
Address VARCHAR(200),
Created DATETIME);

TRUNCATE TABLE Customer;
INSERT INTO Customer
(CustomerID,
CustomerName,
Mobile,
City,
Address,
Created)
VALUES(1, "Shivanika" , '1234567891', 'Mumbai' , 'ssd12',current_timestamp()),
(2,"Sanjans", '1234567891', 'Mumbai' , 'ssd12',current_timestamp()),
(3,"Haritha", '9876543211', 'Chennai', 'xyz2', current_timestamp()),
(4,"Varshini", '223457791', 'Mumbai' , 'ssd12',current_timestamp());

SELECT CURRENT_TIMESTAMP();


# Display a property

DESC Customer;
SELECT * from Customer;

ALTER TABLE Customer
DROP COLUMN Gender;

# Alter table 
ALTER TABLE Customer
ADD COLUMN Gender VARCHAR(6) AFTER CustomerName;

UPDATE Customer
SET Gender ='Male';

SELECT * from customer
WHERE CustomerID = 2;

# Update fields
UPDATE Customer
SET Gender ='MALE'
WHERE CustomerID = 3;

SELECT * FROM Customer;

# Delete the records
DELETE FROM Customer
where customerID =3;

#Delete all records
TRUNCATE TABLE Customers;

-- Difference between delete and truncate
# 1. Where condition can be used in delete, but not in truncate
# 2. Truncate cannot be used in TCL. Onnly DML (Insert, Update, Delete)

CREATE TABLE Product(
ProductID INT, 
ProductName VARCHAR(200),
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
 (1245, "FOGG", 450.00,"Scent", current_timestamp()),
 (12345, "LAYS", 350.00,"food", current_timestamp()),
 (12345, "BINGO", 150.00,"food", current_timestamp());

DESC Product;
SELECT * from  product;

drop table product;









