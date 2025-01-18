
-- BASIC QUERIES

-- 1.Retrieve all records from the brands table

SELECT * FROM production.brands;

--2. List all products with a list price greater than $1000.

SELECT * FROM PRODUCTION.PRODUCTS
WHERE list_price > 1000;

--3. Find all customers who live in New York (NY).

SELECT * FROM sales.customers
WHERE state = 'NY'

-- 4. Display the names and email addresses of all customers.

SELECT CONCAT(first_name, ' ', last_name) AS NAME, email
FROM sales.customers

-- 5. Retrieve all orders placed in the year 2016.

SELECT * FROM sales.orders
WHERE Year(order_date ) = 2016

--6. List all products that belong to the 'Mountain Bikes' category.

SELECT * FROM production.categories
WHERE Category_name = 'Mountain Bikes'

-- 7. Find the total number of products in each category.
SELECT * FROM PRODUCTION.PRODUCTS
SELECT * FROM production.categories

SELECT Category_id, COUNT(*) AS TotalProducts 
FROM Production.Products 
GROUP BY  Category_id

--8. Retrieve the details of the product with the highest list price.
SELECT TOP 1 * FROM PRODUCTION.PRODUCTS
order by list_price desc

--9. List all orders along with the customer names who placed them.
SELECT * FROM sales.orders
order by 2
SELECT * FROM sales.customers

SELECT O.order_id,CONCAT(c.first_name,' ', c.last_name) AS NAME,O.Order_status,O.order_date,O.required_date,O.Shipped_date,O.store_id,O.staff_id
FROM Sales.Orders AS O
Left Join Sales.Customers AS C ON O.customer_id = C.customer_id;

--10. Find all products that were listed in the year 2017.

SELECT * FROM production.products
WHERE model_year = 2017


--Aggregation and Grouping
--1. Calculate the average list price of all products
SELECT AVG(list_price) AS AVERAGE
FROM production.products

--2. Find the total quantity of each product sold
SELECT * FROM production.products
SELECT * FROM sales.order_items
SELECT Count(quantity) AS TOTAL
FROM sales.order_items

--3. Calculate the total sales amount for each store.
SELECT * FROM sales.stores
SELECT * FROM sales.orders
SELECT * FROM sales.order_items
SELECT SO.store_id,SO.order_ID, sum(SOi.List_price)AS [TOTAL AMOUNT],SOi.order_id
FROM sales.orders AS SO
JOIN sales.order_items AS SOI ON so.order_id=soi.order_id
group by SO.order_id,so.store_id,soi.order_id

--4. Find the number of orders placed by each customer.
SELECT * FROM sales.customers
SELECT * FROM sales.orders
SELECT SC.customer_ID, CONCAT(SC.first_name, ' ',sc.last_name) AS CUSTOMERS,sc.phone, count(so.Order_id) AS ORDERS
FROM sales.customers AS SC
join sales.orders AS SO ON SC.customer_id=SO.customer_id
Group by sc.customer_id,sc.first_name,sc.last_name,sc.phone

--5. Calculate the total discount given on all orders.
SELECT * FROM sales.order_items
SELECT  sum(list_price * quantity * discount) AS Discount
FROM  sales.order_items

--6. Find the average list price of products in each category
SELECT * FROM production.products
SELECT AVG(list_price) AS AVERAGE, category_id
FROM production.products
Group by category_id

--7. Retrieve the total number of orders placed in each month of 2016.
SELECT * FROM sales.orders
SELECT count(order_id) AS ORDERS, Month(order_date) As MONTHS
FROM sales.orders
WHERE YEAR(order_date)=2016
Group by MONTH(order_date)

--8. Calculate the total revenue generated from each product category.
SELECT * FROM production.products
SELECT sum(list_price) AS [TOTAL REVENUE], category_id
From production.products
GROUP BY category_id

--9. Find the total number of customers in each state.
SELECT * FROM sales.customers
SELECT count(*)AS customers_count, state
FROM sales.customers
Group by state

-- 10.Calculate the total quantity of products sold in each year.
SELECT * FROM production.products
SELECT * FROM sales.order_items
SELECT sum(soi.quantity)AS TOTAL_QUANTITY, pp.model_year
FROM production.products AS PP
join sales.order_items AS soi ON soi.product_id = pp.product_id
GROUP BY pp.model_year
 
--JOINS
 
--1. Retrieve all orders along with the product details.
 
SELECT pp.*, so.*, soi.*
FROM production.products pp
JOIN sales.order_items soi
ON pp.product_id = soi.product_id
JOIN sales.orders so
On so.order_id = soi.order_id;
 
--2. List all customers along with the orders they have placed
 
SELECT c.*, so.order_date 
FROM sales.customers c 
JOIN sales.orders so
ON c.customer_id = so.customer_id;
 
--3.Find all products that have never been ordered
 
SELECT pp.product_name, ps.product_id
FROM production.products pp
left JOIN production.stocks ps
on pp.product_id = ps.product_id
WHERE ps.product_id is null;
 
SELECT pp.product_name, pp.product_id
FROM production.products pp
left JOIN sales.order_items sor
on pp.product_id =sor.product_id
WHERE sor.product_id is null;
 
--4 Retrieve the details of all orders along with the store and staff details.
 
SELECT so.*,concat(ss.first_name,' ',ss.last_name) as staff_Full_name ,sss.store_name
FROM sales.orders so
JOIN sales.staffs ss
ON so.store_id = ss.store_id
JOIN sales.stores sss
ON ss.store_id = sss.store_id;
 
--5. List all products along with their brand and category names
 
SELECT pp.product_name, pb.brand_name, pc.category_name
FROM production.products as pp
JOIN production.brands as pb
ON pp.brand_id = pb.brand_id
JOIN production.categories pc
ON pc.category_id = pp.category_id;
 
--6. Find all customers who have placed more than 5 orders.
 
SELECT so.customer_id, count( DISTINCT soi.order_id) as total_orders From sales.orders as so
JOIN sales.order_items as soi
on so.order_id = soi.order_id
GROUP BY so.customer_id
HAVING count(DISTINCT soi.order_id) > 5
ORDER By so.customer_id;
 
--7.Retrieve the details of all orders placed by customers from California (CA).
 
select C1.customer_id, O1.* from sales.customers C1
left join sales.orders O1
on C1.customer_id = O1.customer_id
where state = 'CA'
order by C1.customer_id;
 
--8 List all products along with the total quantity sold for each product.
 
select P1.product_name,count(O1.quantity) as total_product from sales.order_items O1
right join  production.products P1
on O1.product_id = P1.product_id
group by P1.product_name;
 
--9 Find all orders that include products from the 'Electric Bikes' category
select O1.*,P1.product_id,C1.category_name from production.categories C1
inner join production.products P1
on C1.category_id = P1.category_id
inner join sales.orders O1
on O1.order_id = O1.order_id;
 
--10 Retrieve the details of all orders along with the total discount applied.
select B1.brand_name,count(P1.product_name) as number_of_products from production.products P1
left join production.brands B1
on P1.brand_id = B1.brand_id
group by B1.brand_name
having count(P1.product_name)>5;

--SUBQUERIES
 
--1. Find the product with the second highest list price.
 
SELECT MAX(list_price) FROM production.products 
WHERE list_price< (SELECT max(list_price) from production.products );
 
--2 Retrieve the details of the most expensive product in each category
SELECT p.*
FROM production.products p
WHERE p.list_price = (
    SELECT MAX(p2.list_price)
    FROM production.products p2
    WHERE p2.category_id = p.category_id
);
 
 
--3 Find all customers who have never placed an order
 
SELECT c.*
FROM sales.customers c
LEFT JOIN sales.orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
 
--4  List all products that have been ordered more than 10 times.
SELECT p.*
FROM production.products p
WHERE p.product_id IN (
    SELECT oi.product_id
    FROM sales.order_items oi
    GROUP BY oi.product_id
    HAVING SUM(oi.quantity) > 10
);
 
--5 Retrieve the details of the latest order placed by each customer.
SELECT o.*
FROM sales.orders o
WHERE o.order_date = (
    SELECT MAX(o2.order_date)
    FROM sales.orders o2
    WHERE o2.customer_id = o.customer_id
);
 
--6 Find the total revenue generated from orders placed in the first quarter of 2016.
SELECT SUM(oi.list_price * oi.quantity * (1 - oi.discount / 100)) AS total_revenue
FROM sales.orders o
JOIN sales.order_items oi ON o.order_id = oi.order_id
WHERE o.order_date BETWEEN '2016-01-01' AND '2016-03-31';
 
--7 List all products that have a list price higher than the average list price.
SELECT p.*
FROM production.products p
WHERE p.list_price > (
    SELECT AVG(p2.list_price)
    FROM production.products p2
);
 
--8  Retrieve the details of all orders placed in the last month.
SELECT o.*
FROM sales.orders o
WHERE o.order_date >= DATEADD(month, -1, GETDATE());
 
--9. Find the customer who has placed the highest number of orders.
SELECT c.*, COUNT(o.order_id) AS order_count
FROM sales.customers c
JOIN sales.orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY order_count DESC
LIMIT 1;
 
--10  List all products that belong to brands that have more than 5 products.
 
SELECT p.*
FROM production.products p
WHERE p.brand_id IN (
    SELECT b.brand_id
    FROM production.brands b
    JOIN production.products p2 ON b.brand_id = p2.brand_id
    GROUP BY b.brand_id
    HAVING COUNT(p2.product_id) > 5
);




USE BikeStores

--JOINS

--1. Retrieve all orders along with the product details.

SELECT * FROM sales.orders
SELECT * FROM production.products
SELECT * FROM sales.order_items

SELECT SO.*,SOi.*,PP.*
FROM production.products AS PP
JOIN sales.order_items AS SOi ON pp.product_id =soi.product_id
JOIN sales.orders AS SO ON  soi.order_id=so.order_id

-- 2. List all customers along with the orders they have placed.SELECT * FROM sales.customersSELECT * FROM sales.ordersSELECT SC.*,SO.*FROM sales.customers AS SCJOIN sales.orders AS SO ON sc.customer_id = so.customer_id--3. Find all products that have never been ordered.SELECT * FROM production.productsSELECT * FROM sales.orders 