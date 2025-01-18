
-- FUNCTIONS

CREATE OR ALTER FUNCTION udf_AGE(
   @DOB AS DATE
)

RETURNS INT

AS

BEGIN

	DECLARE 
		   @CURRENTDATE AS DATETIME
		   , @AGE AS INT

	SET @CURRENTDATE = GETDATE()
	SET @AGE = DATEDIFF(YY,@DOB,@CurrentDate)

RETURN @AGE
END

DECLARE @dbo AS DATE
SET @dbo = '2002-06-12'
SELECT @dbo AS[DATE OF BIRTH], dbo.udf_AGE(@dbo) AS AGE;

-- IN MONTHS

CREATE OR ALTER FUNCTION udf_AGEMONTH(
   @DOB AS DATE
)

RETURNS INT

AS 
BEGIN

	DECLARE
				 @CURRENTDATE AS DATETIME -- HERE 
			   , @AGE AS INT

	   SET @CURRENTDATE = GETDATE()
	   SET @AGE= DATEDIFF(MM,@DOB,@currentDate)

 RETURN @AGE
END

DECLARE 
@dbo As DATE
SET @dbo = '2002-06-12'

SELECT @dbo AS [DATE OF BIRTH], dbo.udf_AGEMONTH(@dbo) AS [AGE IN MONTHS];

-- full name

CREATE OR ALTER FUNCTION udf_NAME(
     @firstNAme AS VARCHAR(30)
 ,@LastName AS VARCHAR(30)
)
RETURNS VARCHAR(30)

AS 
BEGIN

DECLARE 

   @FULLNAME AS VARCHAR(50)

   SET @FULLNAME = CONCAT( @firstName ,' ', @LastName)

RETURN @FULLNAME
END

DECLARE 
@firstNAme AS VARCHAR(30)
 ,@LastName AS VARCHAR(30)

 SET @FirstName= 'Shivanika'
 SET @LASTNAME ='Karthikeyan'

SELECT @firstNAme AS [FIRST NAME]
,@LastName As[LAST NAME], dbo.udf_NAME(@firstName,@lastName) AS [FULLNAME]


--IMPLEMENTING FUNCTIONS IN SELECT QUERY

With cte_Topcustomers AS(



SELECT
          C1.Customer_id AS Customers_ID
		,dbo.udf_NAME(c1.first_name, c1.last_name) AS Customer
		,p4.product_name AS [Product Name]
		,O.order_id AS [order_ID]
		,SUM(oii.quantity * oii.list_price) AS [Total Amount]
		,SUM(dbo.udf_ORDERVALUE(oii.quantity , oii.list_price, oii.discount)) As ORDER_VALUE
		, SUM(oii.quantity * oii.list_price) AS [Discount Price]
FROM customers AS c1
LEFT JOIN Orders AS O On C1.Customer_id = O.customer_id
LEFT JOIN order_items AS Oii ON  o.order_id = oii.order_id
LEFT JOIN Products AS p4 On oii.product_id = p4.product_id

GROUP BY C1.customer_id
        ,dbo.udf_NAME(c1.first_name, c1.last_name)
		,p4.product_name
		,o.order_id

ORDER BY 7 DESC;

SELECT customers_ID, customer, order_value FROM cte_TOPcustomers

WHERE xROWNUMBER <=10;

SELECT * FROM order_items
SELECT * FROM orders


-- CREATE A FUNCTION ORDERVALUE AND USE IT IN ABOVE CODE

exec SP_help order_items;



CREATE OR ALTER FUNCTION udf_ORDERVALUE(
  @qty as INT
  ,@listPrice As decimal(10,2)
  ,@discount AS  decimal(7,2)
)

RETURNS INT
 
AS 
BEGIN

	DECLARE 
	@ORDERVALue as decimal(10,2)
	, @TOTALAmount As decimal (20,2)
	,@DiscountPrice AS DECIMAL(20,2)

	SET @TotalAmount = @qty * @listPrice
	SET @DiscountPrice = @TOTALAmount * @discount
	SET @ORDERVALue = @TotalAMount - @discountPrice

RETURN @ORDERVALUE
END

 DECLARE

 @qty AS DECIMAL(7,2)=2,
 @listPrice As DECIMAL(10,2)= 1000.00,
 @discount As DECIMAL(10,2)=0.10

 SELECT 
   
      @listPrice AS listprice
	  ,@qty As QUALITY
	  , @discount AS Discount , dbo.udf_ORDERVALUE(@qty,@listPrice,@discount) AS ORDERVALUE;


--WRITE A PROCEDURE TO UPDATE WITH UDF FUNCTION

ALTER TABLE order_items
ADD Order_value DECIMAL(20,2);

Update order_items
SET ORDER_value = NULL

CREATE OR ALTER PROC usp_UPDATEORDERVALUE
             
AS
BEGIN

	update order_items
	SET order_Value = dbo.udf_ORDERVALUE(quantity,list_price,discount);

	PRINT 'Total records Updated: ' + CAST(@@ROWCOUNT AS VARCHAR(20))


END

SELECT * FROM order_items
SELECT * FROM ORDERS

CREATE OR ALTER PROC updt_value

AS
BEGIN

EXEC usp_UPDATEORDERVALUE;

END

EXEC updt_value;

-- CREATE THREE PROCEDURE FOR BRANDS, Products and category

SELECT * FROM brands
SELECT * FROM categories
SELECT * FROM products

--INSERT new Brand by Stored procedure

CREATE OR ALTER  PROC usp_Brands(
   @XBrandName AS VARCHAR(50)
   ,@Ybrand_ID AS INT OUT

)

AS
BEGIN
     	INSERT INTO Brands(Brand_NAME)
		Values(@XBrandName)
		SET @Ybrand_ID = SCOPE_IDENTITY()

END

-- FOR TESTING

DECLARE @brandID AS INT
EXEC usp_Brands 'Nike', @yBrandID = @brand_id OUT

SELECT @brand_id AS [Brand ID];

SELECT * FROM brands ORDER BY 1 DESC;


-- INSERT INTO CATEGORIES

CREATE OR ALTER  PROC usp_Cat(
   @XcategoryName AS VARCHAR(50)
   ,@Ycategory_ID AS INT OUT

)

AS
BEGIN
     	INSERT INTO Brands(category_NAME)
		Values(@XcategoryName)
		SET @Ycategory_ID = SCOPE_IDENTITY()

END

-- FOR TESTING

DECLARE @categoryID AS INT
EXEC usp_Brands 'Nike', @Ycategory_ID = @Category_id OUT

SELECT @category_id AS [Category ID];

SELECT * FROM categories ORDER BY 1 DESC;


/*
	SQL Server In-build functions
	1. Aggregate functions: SUM(), COUNT(), AVG(), MIN(), MAX()
	2. String functions: LEN(), LEFT(), RIGHT(), SUBSTRING(), CONCAT()
	3. DateTime functions: DATEDIFF(), DATAADD().....
*/
 
-- String Functions
 
Declare @Firstname as varchar(100)
	, @Lastname as varchar(100)
	, @Middlename as varchar(100)
 
set @Firstname = 'Mahindra'
set @Middlename = 'Singh'
set @Lastname = 'Dhoni'
 
select 'Hello World' as xText,len('Hello World') as xLength;
 
select first_name,
	len(first_name) as Lengthoffistname
from customers;
 
select 'Hello World' as xText,left('Hello World', 5) as xLeftfunction;
 
select first_name,
	left(first_name,3) as Leftoffistname
from customers;
 
 
select 'Hello World' as xText
	,left('Hello World', 5) as xLeftfunction
	,right('Hello World', 5) as xRightfunction;
 
select 'This is my College' as xText, SUBSTRING('This is my College',6,5) as xSubstingfunction;
 
--extraxt firstname, lastname, domainnmae from email

DECLARE @xEmail AS VARCHAR(100) = 'debra.burks@yahoo.com'

SELECT @xemail
       , LEN(@xemail) AS LENGTH
	   , LEFT(@xemail, CHARINDEX('.', @xemail)-1) As FirstName
	   , SUBSTRING(@xemail, CHARINDEX('@',@xemail)+1,LEN(@xemail) - CHARINDEX('.',@xemail)-1) AS LASTNAME
	   ,SUBSTRING (@xemail, CHARINDEX('.',@xemail)+1,LEN(@xemail) - CHARINDEX('.',@xemail)-1) AS LASTNAME

SELECT @xemail
       , LEN(@xemail) AS LENGTH
	   , LEFT(@xemail, CHARINDEX('.', @xemail)-1) As FirstName
	   , SUBSTRING(@xemail, CHARINDEX('@',@xemail)+1,LEN(@xemail) - CHARINDEX('.',@xemail)-1) AS LASTNAME
	   ,SUBSTRING (@xemail, CHARINDEX('.',@xemail)+1,LEN(@xemail) - CHARINDEX('.',@xemail)-1) AS LASTNAM
 
