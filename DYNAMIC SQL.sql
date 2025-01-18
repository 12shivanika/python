
DECLARE @select AS VARCHAR(100)
	  ,@TableName AS Varchar(50)
	   ,@where AS VARCHAR(20)
	   ,@Attribute1 AS VARCHAR(20)
	   ,@Value1 AS INT
	   ,@Operator AS VARCHAR(10)
	   ,@SQL AS VARCHAR(500)
	   ,@value2 As VARCHAR(200)
	   ,@Attribute2 AS VARCHAR(20)
	   

SET @select = ' SELECT * FROM '
SET @TableName =' sales.Customers '
SET @where = ' WHERE 1 = 1'
SET @Attribute1 ='customer_ID'
SET @Attribute2 =' City'
SET @Operator= ' = '
SET @Value1= 1
SET @Value2= 'New York'
SET @sql = @select + @TableName + @where
			--+ @Attribute1 + @Operator + CAST(@Value1 AS varchar(100))
			+ ' AND '
			+ @Attribute2 + @Operator +''''+ @value2+''''
 
PRINT @SQL
/*
Two ways to execute sql
*/
-- Method 1
EXEC (@sql)
-- Method 2
EXEC SP_executesql
-- List of orders between 31st march to 18th april
/*
Select * From sales.orders
Where order_date   between 2017-3-31'and '2017-4-18

*/
DECLARE @select AS VARCHAR(100)
	  ,@TableName AS Varchar(50)
	   ,@where AS VARCHAR(20)
	   ,@Attribute1 AS VARCHAR(20)
	   ,@Value1 AS INT
	   ,@Operator AS VARCHAR(10)
	   ,@SQL AS VARCHAR(500)
	   ,@value2 As VARCHAR(200)
	   ,@Attribute2 AS VARCHAR(20)
	   

