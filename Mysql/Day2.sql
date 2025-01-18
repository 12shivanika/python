drop table orders1
CREATE TABLE Orders1(
orderID INT PRIMARY KEY AUTO_INCREMENT,
OrderDate DATETIME,
CustomerID INT NOT NULL,
ProductID INT NOT NULL,
Qty decimal(5,2) NOT NULL,
TotalAmt INT NOT NULL,
FOREIGN KEY (CustomerID) REFERENCES Customer3(CustomerID)
#ON UPDATE CASCADE
#ON DELETE CASCADE
,FOREIGN KEY(ProductID) REFERENCES Product(ProductID)
#ON UPDATE CASCADE
#ON DELETE CASCADE

);
DESC Orders;
drop table Orders;

Truncate table orders;
INSERT INTO Orders1
(orderID,
OrderDate,
CustomerID,
ProductID,
Qty,
TotalAmt 
)
VALUES(1, current_timestamp(), 1,100,5,2000),
(2, current_timestamp(), 2,200,10,3000);

INSERT INTO Orders
(
OrderDate,
CustomerID,
ProductID,
Qty,
TotalAmt 
)
VALUES(current_timestamp(), 75,200,10,3000);




SELECT * from  orders;
SELECT * from  Customer;
SELECT * from  product;
     
SELECT DISTINCT c1. * FROM customer AS c1
INNER JOIN orders as o1 ON c1.customerid=o1.customerid;