-- Common table Expression Temporary result set (CTE )

/* 
Temporary resultset, used in SELECT, INSERT, UPDATE & DELETE

ORDER - 

*/

USE BikeStores;

SELECT * FROM sales.customers;

SELECT 
       *
	 ,ROW_NUMBER() OVER(ORDER BY City) AS XROWNUMBER

FROM sales.Customers;
 
-- Generate ROW Number by Decending order of First Name

SELECT 
       *
	 ,ROW_NUMBER() OVER(ORDER BY First_name DESC) AS XROWNUMBER

FROM sales.Customers;

-- Common table Expression Temporary result set (CTE )

With cte_customer AS(
      SELECT
	     *
		 , ROW_NUMBER() Over(ORDER BY First_name DESC) AS xROWNUMBER
FROM sales.Customers
)

SELECT * FROM  cte_customer
WHERE  xROWNUMBER = 10;

--SUBQUERY IN FROM Clause

SELECT * FROM (
                     SELECT 
					          *
							  , ROW_NUMBER() Over(ORDER BY First_name DESC) AS xROWNUMBER
                     FROM sales.Customers
) AS t1
WHERE xROWNUMBER =10;

-- TOP 10 Customers o/p: customers, Order value
-- tables: customers, Order, Order_item

SELECT * FROM sales.Customers;
SELECT * FROM sales.orders;
SELECT * FROM sales.order_items;

--

With cte_Topcustomers AS(

SELECT
          C1.Customer_id AS Customers_ID
		, Concat(C1.First_name,' ', c1.Last_name) AS Customer
		, SUM(oii.quantity * oii.list_price) As ORDER_VALUE
		, ROW_NUMBER() Over(ORDER BY sum (oii.quantity * oii.list_price) DESC) AS xROWNUMBER
FROM sales.customers AS c1
INNER JOIN sales.Orders AS O On C1.Customer_id = O.customer_id
INNER JOIN sales.order_items AS Oii ON  o.order_id = oii.order_id

GROUP BY C1.customer_id
        ,Concat(C1.First_name,' ', c1.Last_name)
)

SELECT customers_ID, customer, order_value FROM cte_Topcustomers

WHERE xROWNUMBER <=10;


With cte_Leastcustomers AS(

SELECT
          C1.Customer_id AS Customers_ID
		, Concat(C1.First_name,' ', c1.Last_name) AS Customer
		, SUM(oii.quantity * oii.list_price) As ORDER_VALUE
		, ROW_NUMBER() Over(ORDER BY sum (oii.quantity * oii.list_price)) AS xROWNUMBER
FROM sales.customers AS c1
INNER JOIN sales.Orders AS O On C1.Customer_id = O.customer_id
INNER JOIN sales.order_items AS Oii ON  o.order_id = oii.order_id

GROUP BY C1.customer_id
        ,Concat(C1.First_name,' ', c1.Last_name)
)

SELECT customers_ID, customer, order_value FROM cte_Leastcustomers

WHERE xROWNUMBER <=10;

--Rank

With cte_Leastcustomers AS(

SELECT
          C1.Customer_id AS Customers_ID
		, Concat(C1.First_name,' ', c1.Last_name) AS Customer
		, SUM(oii.quantity * oii.list_price) As ORDER_VALUE
		, ROW_NUMBER() Over(ORDER BY sum (oii.quantity * oii.list_price)) AS xROWNUMBER
		, RANK() Over(ORDER BY sum (oii.quantity * oii.list_price)) AS xRANK
		, DENSE_RANK() Over(ORDER BY sum (oii.quantity * oii.list_price)) AS xDenseRANK
FROM sales.customers AS c1
INNER JOIN sales.Orders AS O On C1.Customer_id = O.customer_id
INNER JOIN sales.order_items AS Oii ON  o.order_id = oii.order_id

GROUP BY C1.customer_id
        ,Concat(C1.First_name,' ', c1.Last_name)
)

SELECT customers_ID, customer,xDenseRANK, xROWNUMBER,xRANK, order_value FROM cte_Leastcustomers

WHERE xROWNUMBER <=10;


with cte_leastCustomers as(
select 
       c1.customer_id [Customer ID],
	   concat(c1.first_name,'',c1.last_name) as Customer,
	   sum(oi3.quantity * oi3.list_price) as [Order Value],
	   ROW_NUMBER() over(order by sum (oi3.quantity * oi3.list_price)) as xROWNUMBER,
	   RANK() over(order by sum (oi3.quantity * oi3.list_price)) as xRANK,
	   DENSE_RANK() over(order by sum (oi3.quantity * oi3.list_price)) as xDenseRank
from sales.customers as c1
inner join sales.Orders as o2 on c1.customer_id = o2.customer_id
inner join sales.order_items oi3 on o2.order_id = oi3.order_id
group by c1.customer_id,
         concat(c1.first_name,'',c1.last_name))
 
select [Customer ID], Customer,[Order Value], XRowNumber,XRank,XDenseRank from cte_leastCustomers
where xDenseRank <= 10;

-- SOLUTION 2

SELECT * FROM (

		SELECT
				  C1.Customer_id AS Customers_ID
				, Concat(C1.First_name,' ', c1.Last_name) AS Customer
				, SUM(oii.quantity * oii.list_price) As ORDER_VALUE
				, ROW_NUMBER() Over(ORDER BY sum (oii.quantity * oii.list_price)) AS xROWNUMBER
				, RANK() Over(ORDER BY sum (oii.quantity * oii.list_price)) AS xRANK
				, DENSE_RANK() Over(ORDER BY sum (oii.quantity * oii.list_price)) AS xDenseRANK
		FROM sales.customers AS c1
		INNER JOIN sales.Orders AS O On C1.Customer_id = O.customer_id
		INNER JOIN sales.order_items AS Oii ON  o.order_id = oii.order_id

		GROUP BY C1.customer_id
				,Concat(C1.First_name,' ', c1.Last_name) ) As t

where xDenseRank <= 10;

-- Solution 3
-- VIEWS

CREATE OR ALTER VIEW vw_BottomCustomers
AS
SELECT
		    C1.Customer_id AS Customers_ID
		 , Concat(C1.First_name,' ', c1.Last_name) AS Customer
		 , SUM(oii.quantity * oii.list_price) As ORDER_VALUE
	 	 , ROW_NUMBER() Over(ORDER BY sum (oii.quantity * oii.list_price)) AS xROWNUMBER
		 , RANK() Over(ORDER BY sum (oii.quantity * oii.list_price)) AS xRANK
		 , DENSE_RANK() Over(ORDER BY sum (oii.quantity * oii.list_price)) AS xDenseRANK
	FROM sales.customers AS c1
	INNER JOIN sales.Orders AS O On C1.Customer_id = O.customer_id
	INNER JOIN sales.order_items AS Oii ON  o.order_id = oii.order_id

	GROUP BY C1.customer_id
		,Concat(C1.First_name,' ', c1.Last_name);

SELECT * FROM vw_BottomCustomers
WHERE xDenseRANK <=10;

-- PARTITION BY

/* 
Generate Row number by Ascending order of state and filter for first 3 recorrds in each states
*/

SELECT * FROM .production.products;
SELECT * FROM sales.customers;

WITH cte_State AS(
SELECT
      *
	, ROW_NUMBER() OVER(PARTITION BY STATE ORDER BY STATE) As xRowNumber
FROM sales.Customers
)
SELECT * FROM cte_State
WHERE xRowNumber <=3;

-- For each year retrieve Top 5 List prices

SELECT
      Product_name
	, COUNT(*) OVER(PARTITION BY Model_year) As ProductCount
FROM production.products;

WITH cte_ListPrice AS(
SELECT 
      Product_name
	, model_year
	,list_price
	, ROW_NUMBER() OVER(PARTITION BY MOdel_year ORDER BY List_price DESC) AS xRowNumber
	, DENSE_RANK() OVER(PARTITION BY MOdel_year ORDER BY List_price DESC) AS xDENSE_RANK
FROM production.products)
SELECT * FROM cte_ListPrice
WHERE xDENSE_RANK <=5;

--Tables: Brands 
--SOLUTION 2

WITH cte_BrandPerformance AS(
SELECT 
      b1.brand_id AS [Brand ID]
	, b1.Brand_name AS Brand
	,sum (oi3.quantity * oi3.list_price) As [Order value]
	, DENSE_RANK() over(order by sum (oi3.quantity * oi3.list_price)DESC) as xDenseRANK

FROM production.brands as b1
LEFT JOIN production.products AS p2 ON b1.brand_id = p2.brand_id
INNER JOIN sales.order_items AS oi3 ON p2.product_id =oi3.product_id
group by b1.brand_id,
         b1.brand_name)

SELECT * FROM cte_BrandPerformance
Where xDenseRANK <=5;

SELECT * From production.Products;

Begin Transaction;

DELETE From production.products
Where product_id = 1;

ROLLBACK;

-- TO FETCH A LATEST TRANSCATION DAYWISE

CREATE TABLE Bank_Trans(
       ID TINYINT
	   ,Amount DECIMAL(10,2)
	   ,Trans_Date DATETIME
);

INSERT INTO Bank_Trans(ID, Amount, Trans_Date)
Values(1, 1000,'2024-03-11 10:30:45')

, (2,2000,'2024-03-11 11:00:00')

, (3,500,'2024-03-11 12:20:00')

, (4,1400,'2024-03-12 12:15:00')

, (5,5400,'2024-03-12 13:00:00')

, (6,3500,'2024-03-12 14:25:00')

, (7,1750,'2024-03-12 16:30:00')

, (8,890,CURRENT_TIMESTAMP)

, (9,725,'2024-03-21 16:00:00')

, (10,1040,'2024-03-22 14:05:10')

, (11,500,'2024-03-22 16:25:30')
 
-- Solution 
-- First value 

SELECT * FROM Bank_Trans;

 
select distinct
         first_value(t1.trans_date)
		       over(partition by cast(t1.Trans_date as date) order by t1.trans_date desc) as transdate,
         first_value(t1.amount)
				over(partition by cast(t1.trans_date as date) order by t1.trans_date desc) as amount
from bank_trans as t1
order by 1;

-- DELETE THE THE DUPLICATE RECORD in table

SELECT * FROM sales.Customers


WITH cte_State AS(
SELECT
      *
	, ROW_NUMBER() OVER(PARTITION BY STATE ORDER BY STATE) As xRowNumber
FROM sales.Customers
)
SELECT * FROM cte_State
WHERE xRowNumber <=3;
