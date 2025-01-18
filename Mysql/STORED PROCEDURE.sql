
-- STORED PROCEDURE

use BikeStores;

--DROP PROCEDURE usp_customerProducts;

CREATE OR ALTER PROCEDURE  usp_customerProducts(
    @startDate As DATE
  , @EndDate AS DATE)
as
begin
  
  DECLARE @TotalOrders AS INT

  BEGIN TRY


SELECT 
     c2.customer_id AS [Customer ID]
	 ,c2.first_name + ' '+c2.last_name AS [Customer]
	 ,p4.Product_name AS [Product name]
	 ,SUM(oi3.quantity * oi3.list_price) AS [order value]
	 ,o1.order_id AS [Order Name ]

FROM orders As o1

LEFT JOIN customers AS C2 ON O1.customer_id = c2.customer_id

LEFT join order_items as oi3 on o1.order_id = oi3.order_id

LEFT join products as p4 on oi3.product_id = p4.product_id

WHERE o1.order_date BETWEEN @startDate and @EndDATE


GROUP BY c2.customer_id
         , c2.first_name + ' ' +c2.last_name
		 ,p4.Product_name
		 ,o1.order_id
		 ,order_date
 SELECT 
   @TotalOrders - Count(*)

FROM Orders as o1

LEFT JOIN customers AS C2 ON O1.customer_id = c2.customer_id

LEFT join order_items as oi3 on o1.order_id = oi3.order_id

LEFT join products as p4 on oi3.product_id = p4.product_id

WHERE o1.order_date BETWEEN @startDate and @EndDATE

END TRY
BEGIN CATCH
      PRINT 'MISMATCHED'
END CATCH
PRINT 'TotaAL ORDERS: '+ cast(@TotalOrders AS VARCHAR(50))

END;


EXEC usp_customerProducts '2017-1-1', '2017-12-31';

--EXECUTE usp_customerProducts;

-- Insert a new customer in customer Table with help of stored procedure

-- PROC IS Shorct cut to use the the name procedure

CREATE OR ALTER PROC  usp_Newcustomer(
    @fName As VARCHAR(50)
  , @lName AS VARCHAR(50)
   , @email AS VARCHAR(50)

 )
as
begin
  

INSERT INTO Customers(first_name,last_name,email)
VALUES (@fName, @lName,@email);


Print 'FirstName: ' +@fName
Print 'LastName: ' +@lName
Print 'Email: ' +@email

END;

EXEC usp_Newcustomer 'John', 'Smith', 'johnsmith@xyz.com';

select * From customers
ORDER BY customer_id DESC;

-- GEt The customer id as a input and city and state

CREATE OR ALTER  PROC usp_UpdateCustomer(
			   @Customer_id AS INT
			 , @xphone AS VARCHAR(50)
			 , @city AS VARCHAR(50)
			 , @state AS VARCHAR(50)
)
AS
BEGIN

		UPDATE customers
		sET Phone = @xphone 
		,city=@City 
		,state=@State 
		Where customer_ID = @Customer_id


		Print 'PHONE: ' + @xphone
		Print 'CITY: ' +@city
		Print 'STATE: ' + @state
		Print 'Customer_ID: '+CAST(@Customer_id AS VARCHAR(20))

END;

EXEC usp_Updatecustomer 1445,'1234567890', 'Chennai' ,'TN';

SELECT * FROM PRoducts;

DECLARE
			   @Customer_id AS INT = 1445
			 , @xphone AS VARCHAR(50) = '1234567890'
			 , @city AS VARCHAR(50) =  'Chennai'
			 , @state AS VARCHAR(50) = 'TN'

		UPDATE customers
		SET Phone = @xphone 
		 ,city=@City 
		,state=@State 
		Where customer_ID = @Customer_id


-- INSERT A RECORD IN PRODUCT TABLE (brand_ID, Category_ID)
-- STEP 1: INSERT into brand
-- STEP 2: INSERT into category
-- STEP 3: INSERT into product
-- @EID= SCOPE_IDENTITY() 
/**/

--SELECT * FROM brands;
--SELECT * FROM categories


CREATE OR ALTER  PROC usp_NEWPRODUCT(
   @Brand_Name AS VARCHAR(50)
 , @Category_NAme AS VARCHAR(50)
 , @PRoduct_Name  AS VARCHAR(50)
 , @model_year AS INT
 , @list_price AS INT
)

AS
BEGIN

		DECLare 
			@xbrand_ID AS INT
			,@xCategory_ID AS INT
			,@Product_ID AS INT


		INSERT INTO Brands(Brand_NAME)
		Values(@Brand_Name)
		SET @xbrand_ID = SCOPE_IDENTITY()

		INSERT INTO categories(Category_Name)
		Values(@Category_NAme)
		SET @xCategory_ID = SCOPE_IDENTITY()

		INSERT INTO products(Product_Name,brand_id,category_id,model_year,list_price)
		VALUES( @PRoduct_Name,@xbrand_ID, @xCategory_ID,@model_year,@list_price)
		SET @Product_ID =SCOPE_IDENTITY()

		Print 'BrandID: ' +CAST(@xbrand_ID AS VARCHAR(50))
		Print 'categoryID: ' +CAST(@xCategory_ID AS VARCHAR(50))
		Print 'ProductID: ' +CAST(@Product_ID AS VARCHAR(50) )
END;

EXEC usp_NEWPRODUCT 'Woodlands','Textile','H&M T-SHIRT',2024,5000.0;


SELECT * FROM brands
order by 1 desc;

SELECT * FROM categories
order by 1 desc;

SELECT * FROM products
order by 1 desc;


-- Delete customer using Stored Procedure by getting CustomerID as Input

CREATE OR ALTER PROC usp_delcustomers(
        @xcustomer_ID AS INT)

AS

BEGIN

	DELETE  FROM customers
	WHERE customer_id =@xcustomer_ID

END

EXEC usp_delcustomers 1446;

SELECT * FROM customers;

-- Testing Triggers

SELECT * FROM AUDIT_Customers;

