#DQL -DATA QUERY LANGUAGE
# Command: SELECT - Retrieve Data ( No DML - Insert ,uPDATE, dELETE)
#QUERY ORDER OF EXECUTION: from >> where >> group by>> having >> select>> orderby

use classicmodels;

SHOW TABLES;

SELECT 'HELLO WORLD' AS 'String';

-- Display Cuurent data & time
SELECT
   current_timestamp() AS 'Data & Time'
 , current_date() AS 'Date'
 , Current_time() AS 'time';
 
-- To display sum of numbers
SELECT (10+30) AS 'Sum of 10+30';

# FROM CLAUSE
SELECT * FROM customers;
# To filter the city of new york details alone

SELECT 
c.customerNumber AS 'customer'
, c.customerName AS 'customer Name'
, c.CONTACTLASTNAME AS 'contact Last Name'
, c.Phone
, c.city
, c.state
FROM Customers AS c
WHERE city ='NYC';

#OPERATORS
-- 1. Assignment operators : = ,>, >=,<, <=, <>( NOT EQUAL) OR !=( NOT EQUAL), NOT( NOT EQUAL)
-- 2.IS NOT NULL and IS NULL

# 5.LIKE, NOT LIKE
# WHO DOES NOT BELONG TO NYC

#SOLUTION
SELECT 
c.customerNumber AS 'customer'
, c.customerName AS 'customer Name'
, c.CONTACTLASTNAME AS 'contact Last Name'
, c.Phone
, c.city
, c.state
FROM Customers AS c
WHERE NOT (city = 'NYC');

# > 50000
SELECT 
c.customerNumber AS 'customer'
, c.customerName AS 'customer Name'
, c.CONTACTLASTNAME AS 'contact Last Name'
, c.Phone
, c.city
, c.state
,c.creditLimit AS 'Credit Limit'

FROM Customers AS c
WHERE creditLimit >= 50000;

# <= 50000
#SOLUTION 1
SELECT 
c.customerNumber AS 'customer'
, c.customerName AS 'customer Name'
, c.CONTACTLASTNAME AS 'contact Last Name'
, c.Phone
, c.city
, c.state
,c.creditLimit AS 'Credit Limit'

FROM Customers AS c
WHERE creditLimit >= 20000 AND creditLimit <= 50000;

#SOLUTION 2
SELECT 
c.customerNumber AS 'customer'
, c.customerName AS 'customer Name'
, c.CONTACTLASTNAME AS 'contact Last Name'
, c.Phone
, c.city
, c.state
,c.creditLimit AS 'Credit Limit'

FROM Customers AS c
WHERE creditLimit BETWEEN 20000 AND 50000;


SELECT 
c.customerNumber AS 'customer'
, c.customerName AS 'customer Name'
, c.CONTACTLASTNAME AS 'contact Last Name'
, c.Phone
, c.city
, c.state
,SalesREPEmployeeNumber
,c.creditLimit AS 'Credit Limit'

FROM Customers AS c
WHERE Country ='usa' OR Country ='france';
#Solution 2
SELECT 
c.customerNumber AS 'customer'
, c.customerName AS 'customer Name'
, c.CONTACTLASTNAME AS 'contact Last Name'
, c.Phone
, c.city
, c.state
,SalesREPEmployeeNumber
,c.creditLimit AS 'Credit Limit'

FROM Customers AS c
WHERE country IN('usa', 'france');

# 
SELECT 
c.customerNumber AS 'customer'
, c.customerName AS 'customer Name'
, c.CONTACTLASTNAME AS 'contact Last Name'
, c.Phone
, c.country
,c.creditLimit AS 'Credit Limit'

FROM Customers AS c
WHERE country IN('usa', 'france','Germany');

# 
SELECT 
c.customerNumber AS 'customer'
, c.customerName AS 'customer Name'
, c.CONTACTLASTNAME AS 'contact Last Name'
, c.country
,c.creditLimit AS 'Credit Limit'

FROM Customers AS c
WHERE country NOT IN ('usa', 'france', 'Germany');

# NULL means values is unknown and it will not occupy memory
# Filter NULL by operators IS NULL
#do not use city = null or city = 'null'
SELECT 
c.customerNumber AS 'customer'
, c.customerName AS 'customer Name'
, c.CONTACTLASTNAME AS 'contact Last Name'
, c.country
, c.addressLine2
,c.state

FROM Customers AS c
WHERE State IS NULL;

# Filter NULL by operators IS NOT NULL
SELECT 
c.customerNumber AS 'customer'
, c.customerName AS 'customer Name'
, c.CONTACTLASTNAME AS 'contact Last Name'
, c.country
, c.addressLine2
,c.state

FROM Customers AS c
WHERE State IS NOT NULL;

# 5.LIKE

SELECT 
c.customerNumber AS 'customer'
, c.customerName AS 'customer Name'
, c.CONTACTLASTNAME AS 'contact Last Name'
, c.country
,c.state

FROM Customers AS c
WHERE customerName  LIKE 'A%';

# NOT LIKE
SELECT 
c.customerNumber AS 'customer'
, c.customerName AS 'customer Name'
, c.CONTACTLASTNAME AS 'contact Last Name'
, c.country
,c.state

FROM Customers AS c
WHERE customerName  NOT LIKE 'A%';

# % before
SELECT 
c.customerNumber AS 'customer'
, c.customerName AS 'customer Name'
, c.CONTACTLASTNAME AS 'contact Last Name'
, c.country
,c.state

FROM Customers AS c
WHERE customerName LIKE '%LTD.';

-- Total customers
SELECT COUNT(*) AS 'TOTAL CUSTOMERS' FROM Customers;

-- Display # of customers by country
-- Group by clause
-- Aggregate functions: Count(),SUM(),MIN(),MAX() theses functions you can use in group by
SELECT
   
   Country
   , Count(*) AS 'Total Customers'
   From Customers
   group by country;
   
   # Arrange in ascending order of countries
   SELECT
   
   Country
   , count(*) AS 'TOTAL CUSTOMERS'
   
   From Customers
   group by Country
   Order by country asc;
   
    # Arrange in descending order of countries
   SELECT
   
   Country
   , count(*) AS 'TOTAL CUSTOMERS'
   
   From Customers
   group by Country
   Order by country desc;
   
SELECT
       Country
   , count(*) AS 'TOTAL CUSTOMERS'
   
   From Customers
   group by Country
   Order by 1;
   # Order 1 is first cloumn and 2nd cloumn is order 2
   SELECT
       Country
   , count(*) AS 'TOTAL CUSTOMERS'
   
   From Customers
   group by Country
   Order by 2 desc;
   
	#Having clause - To filter aggregates functions. It works like where. in having we can use (*) but not in Where class
    SELECT
       Country
   , count(*) AS 'TOTAL CUSTOMERS'
   
   From Customers
   group by Country
   having Count(*) > 10
   Order by 2 desc;
   















