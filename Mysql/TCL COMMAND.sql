#Trnanslation control language(TCL) - Commit, Rollback, Savepoint
#TCL Applicable for DML (Insert, UPDATE, DELETE)

use SQL_PRACTICE
use Students
SELECT * from  orders;
SELECT * from  Customer;
SELECT * from  product;

SELECT * from  Customer
where customerID=3;

START TRANSACTION;

DELETE FROM  customer
WHERE CustomerID =3;

SELECT * FROM product
WHERE ProductID = 100;

Update Product
SET ProductName="LUX"
WHERE ProductID = 200;

Update Product
SET ProductName="DOVE"
WHERE productID =100;

Update Product
SET ProductName="Cinthol"
Where productID=100;

INSERT INTO Product(
ProductID, 
ProductName,
 UnitPrice,
 Des,
 Created)
 VALUES(300, "Chicken", 250.00,"Food", current_timestamp());
 
 INSERT INTO Orders
(
OrderDate,
CustomerID,
ProductID,
Qty,
TotalAmt 
)
VALUES(current_timestamp(), 2,200,10,3000);
start transaction;
#SAVEPOINT
savepoint A;
delete from customer
where customerId = 10;

savepoint B;
Update product
set productName="yyy"
where productID =200;

savepoint C;
INSERT INTO Orders
(
OrderDate,
CustomerID,
ProductID,
Qty,
TotalAmt 
)
VALUES(current_timestamp(),50,100,10,3000);


COMMIT;
ROLLBACK to a;
ROLLBACK to b;
ROLLBACK to c;

SELECT * from  orders;
SELECT * from  Customer;
SELECT * from  product;

# SUPER KEY
drop table Customer2;
CREATE TABLE Customer2(
CustomerID INT,
CustomerName VARCHAR(50) NOT NULL,
Mobile CHAR(10) unique check(length(Mobile)=10),
Gender VARCHAR(10) check(Gender IN('MALE','FEMALE')),
City VARCHAR(50) DEFAULT 'Chennai',
Address VARCHAR(200),
Created DATETIME,
primary key(CustomerID, Mobile,city)
);

Desc customer2;

#Candiate key 





