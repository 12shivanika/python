
--TSQL

-- VARIABLES

-- SUM OF NUMBERS

USE BikeStores;

DECLARE @num AS INT
DECLARE @num2  AS INT, @num3 AS INT

SET @num2 =20
SET @num3=20

SET @num =@num2 + @num3 

Print 'SUM OF NUMBERS' + ': ' + CAST(@num AS VARCHAR(100));

-- IT WILL RETRIVE ALL NEW YORK CUSTOMERS DETAIL

select * from orders;

declare @xstate as varchar(50)

set @xstate = 'NY'
 
select * from customers

where State = @xstate;

select c1.state,p4.product_name, count(*) as CustomersCount from customers as c1

inner join orders as o2 on c1.customer_id = o2.customer_id

inner join order_items as oi3 on o2.order_id = oi3.order_id

inner join products as p4 on oi3.product_id = p4.product_id

where state = @xState

group by c1.state,product_name;
 
select * from orders;
SELECT * FROM order_items;

-- list of order 01-mar-2016 and 15-aug-2016

-- output: customerid, customerName, orderid, product, order value

DECLARE @startDate AS DATE ='01-03-2016' , @EndDATE As DATE ='01-15-2016'

Print @startDate;

SELECT 
     c2.customer_id AS [Customer ID]
	 ,c2.first_name + ' '+c2.last_name AS [Customer]
	 ,p4.Product_name AS [Product name]
	 ,o1.order_id AS [Order Name ]
	 , SUM(oi3.quantity * oi3.list_price) AS [order value]

FROM orders As o1

LEFT JOIN customers AS C2 ON O1.customer_id = c2.customer_id

LEFT join order_items as oi3 on o1.order_id = oi3.order_id

LEFT join products as p4 on oi3.product_id = p4.product_id

WHERE o1.order_date BETWEEN @startDate and @EndDATE

GROUP BY c2.customer_id
         , c2.first_name + ' '+c2.last_name
		 ,p4.Product_name
		 ,o1.order_id;


		
 