-- LAG()- When you want to calculate previous ,you can use LAG
create view vw_netsales_brands
as
select
		c.brands_name,
		month(o.order_date) month,
		year(o.order_date) year,
		convert(dec(10, 0), sum((i.list_price * i.quantity) * (1 - i.discount))) as net_sales
  from orders as
		inner join order_item as 1 on i.order_id - o.order_id
		inner join products as p on p.product_id = i.product_id
		inner join brands as c on c.brands_id - p.brands_id
  group by c.brand_name,
		month(o.order_date),
		year(o.order_date);
 
select * 
from
   vw_netsales_brands
order by
   xy,
   xmonth,
   brandname,




with cte_netsales_2018 as(
	select
		xmonth,
		sum(net_sales) net_sales
	from
		vw_netsales_brands
	where
		xyear = 2018
	group by
		xmonth
)
 
select
	xmonth,
	  lag(net_sales,1) over (order by xmonth) previous_month_sales
	, net_sales As currentMonthsales
	, LEAD(net_sales,1) OVER (Order by xMonth) As Next_Month_sales

from
    cte_netsales_2018;

Create Table student(
    Student_ID INT
	,STU_NAME VARCHAR(100)
);

Select * From student;

Alter table student
ALter column student_ID INT NOT NULL 
Alter table student
ADD constraint PK_student_ID PRIMARY KEY(Student_ID);

CREATE NONCLUSTERED INDEX nonclus_StudentName
ON Student(Stu_Name);

SELECT * FROM Student
WHERE stu_Name='Mahesh'