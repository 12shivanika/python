
-- TRIGGERS - Database object. 
/*
1. It is special kind of stored Procedure, Which will be fired during DML (Insert, Update, Delete)
2. Triggers help in backing up data
3.TYPES:
    * Database Triggers (DDL)
	* DML Triggers
	* 
	 HERE we are using DML
*/

-- AUDIT TABLE - Table to store the copy of the original table structure or data's.

-- TO Create a structure table so we are making condition to fail by giving Where 1=2

USE BikeStores;

SELECT * INTO AUDIT_Customers FROM 
      (SELECT * FROM Customers) AS T1
	WHERE 1=2;


-- TO get a data so we are making condition to Pass by giving Where 1=1

SELECT * INTO Customers_2 FROM 
      (SELECT * FROM Customers) AS T1
	WHERE 1=1;

SELECT * FROM AUDIT_Customers;
SELECT * FROM Customers_2;

ALTER  TABLE AUDIT_customers
ADD Operation CHAR(3);

CREATE OR ALTER Trigger Trg_customers
ON Customers
AFTER DELETE
AS
BEGIN
  SET IDENTITY_INSERT  AUDIT_Customers ON;

  INSERT INTO AUDIT_Customers(
          customer_id
		 , first_name
         ,last_name
		 ,phone
		 ,email
		 ,street
		 ,city
	     ,state
		 ,zip_code
		 ,Operation
  
  
  )
  SELECT

           customer_id
		 , first_name
         ,last_name
		 ,phone
		 ,email
		 ,street
		 ,city
	     ,state
		 ,zip_code
		 ,'del'
  FROM DELETED

SET IDENTITY_INSERT  AUDIT_Customers OFF;
END;

SELECT * FROM customers;

Delete from customers
WHERE customer_id = 1;

SELECT * FROM AUDIT_Customers;

  

  -- Update Trigger for Customers
DROP TRIGGER Trg_updcustomers;
CREATE OR ALTER   Trigger Trg_updcustomers
ON customers

AFTER UPDATE

AS
BEGIN
SET IDENTITY_INSERT AUDIT_Customers ON
 INSERT INTO AUDIT_Customers(
          customer_id
		 , first_name
         ,last_name
		 ,phone
		 ,email
		 ,street
		 ,city
	     ,state
		 ,zip_code
		 ,Operation
  )
  SELECT

           customer_id
		 , first_name
         ,last_name
		 ,phone
		 ,email
		 ,street
		 ,city
	     ,state
		 ,zip_code
		 ,'upd'

FROM Deleted

SET IDENTITY_INSERT AUDIT_Customers OFF

END;

SELECT * FROM customers;

update customers
SET phone ='1234567890'
where customer_id=2;

EXEC usp_Updatecustomer 4,'2345678910', 'Chennai' ,'TN';

-- TO INSERT 

CREATE Table Customer_3(
   c_id  int
   ,c_name  VARCHAR(50)
)

INSERT INTO Customer_3(c_id,c_name)
VALUES(1,'JOHN')
 , (1,'JOHN')
 , (2,'RON')
 , (3,'POOJA')
 , (4,'PRIYA')
 , (2,'RON')
 ,(1,'JOHN')
  , (3,'POOJA')
   , (4,'PRIYA')
    , (4,'PRIYA')

SELECT * FROM Customer_3
ORDER BY 1

-- to delete
with cte_delete as(
select * 
       , ROW_NUMBER() over(partition by c_id order by c_id) as xRownumber from customer_3
	   )
delete from cte_delete
where xRowNumber > 1;

select * from audit_customers;

  


