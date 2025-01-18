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
 
set @Firstname = '  Mahindra  '
set @Middlename = ' Singh '
set @Lastname = ' Dhoni '
 
select @Firstname as [first Name],len(@firstname) as [length before trim]
	,LTRIM(@Firstname) as [first Name]
	,Len(LTRIM(@FirstName)) as LengthafterTrim
 
-- using function inside another function
select CONCAT(LTRIM(RTRIM(@Firstname)),','
	,LTRIM(RTRIM(@MiddleName)),','
	,LTRIM(RTRIM(@LastName))
	) as [full name]
 
 
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
 
declare @xEmail as varchar(100) = 'debra.burks@yahoo.com'
select @xEmail
		, left(@xEmail,CHARINDEX('.',@xEmail)-1) as FirstName
		, SUBSTRING(@xEmail, CHARINDEX('.',@xEmail)+1,
		CHARINDEX('@',@xEmail)-CHARINDEX('.',@xEmail)-1) as LastName
		,SUBSTRING(@xEmail, CHARINDEX('@',@xEmail)+1,len(@xemail)) as Domain;

-- Table Valued Functions

DECLARE @Product  TABLE(
   product_ID INT  NOT NULL
 , Product_NAME VARCHAR(100) NOT NULL
 ,UnitPrice VARCHAR (100) NOT NULL
 )

 INSERT INTO @Product(product_ID,Product_NAME,UnitPrice)
 SELECT product_ID,Product_name,list_price FROM production.Products;

 SELECT * FROM @Product
 ORDER BY 3 DESC;

 
 -- OUTPUT 
 /* 
 SQL 
 PYTHON
 JAVA
 */
 -- SOLUTION 1

 DECLARE @course VARCHAR(500)

 SET @course='SQL,PYTHON,JAVA,AWS'

 CREATE OR ALTER FUNCTION udf_tbl_PrgCourse(
   @course AS VARCHAR(500)

)
RETURNS @CourseTable TABLE(
     CourseName VARCHAR(100)
)
AS
BEGIN
   
	   DECLARE 
	    @lstring AS VARCHAR(100)
		,@rstring AS VARCHAR(100)
		,@mstring AS VARCHAR(100)
		,@estring AS VARCHAR(100)



	    SET @lstring = LEFT(@course,CHARINDEX(',',@course)-1)
		SET @rstring = SUBSTRING(@course, CHARINDEX(',',@course)+1,LEN(@course))
		SET @mstring = LEFT(@rstring, CHARINDEX(',',@rstring)-1)
		SET @estring = SUBSTRING(@rstring, CHARINDEX(',',@rstring)+1,LEN(@rstring))

		
		--Print @lstring
		--Print @rstring
		--Print @mstring
		--Print @estring
	 INSERT INTO @CourseTable(CourseName)
	 VALUES(@lstring)
	       ,(@mstring)
		   ,(@estring)
	RETURN
END;

DECLARE @data AS VARCHAR(500)
SET @data='SQL,PYTHON,JAVA'

SELECT * FROM [dbo].udf_tbl_PrgCourse(@data);

-- SOLUTION 2 to work with any mentioned delimiter

CREATE OR ALTER FUNCTION udf_tbl_PrgCourse_Dynamic(
                      @Data VARCHAR(500)
					  ,@Delimiter CHAR(1)
)
RETURNS  @CourseTable TABLE(
     CourseName VARCHAR(100)
)
AS
BEGIN
      DECLARE @positionDelimiter AS INT =-1
 

   WHILE (LEN(@Data) > 0)
   BEGIN
     SET @PositionDelimiter = CHARINDEX(@Delimiter,@Data)
	     
		 IF((@positionDelimiter =0 ) and (LEN (@Data) > 0))
		 BEGIN
			 INSERT INTO @CourseTable(CourseName)
			 VALUES(@Data)
		     BREAK
		END

	 IF(@PositionDelimiter > 1)

	 BEGIN
	   INSERT INTO @CourseTable(CourseName)
	   Values(LEFT(@Data,@positionDelimiter-1))
	   SET @Data = RIGHT(@Data,(LEN(@data) - @positionDelimiter))
	 
	END
	ELSE
	BEGIN
		SET @data= RIGHT(@data,LEN(@data) - @positionDelimiter)
	END
END
RETURN
END;

DECLARE @data AS VARCHAR(500)
SET @data='SQL,PYTHON,JAVA,AWS,POWER BI'

SELECT * FROM [dbo].udf_tbl_PrgCourse_Dynamic(@data,',');





