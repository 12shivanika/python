-- INDEX

USE SQL_PRACTICE;

SELECT * FROM students_2;

CREATE TABLE Students_2(
	  studentId INT
	, studentName VARCHAR(30)
	, mobile CHAR(10)
	,city VARCHAR(50)
);

ALTER TABLE students_2
ALTER COLUMN studentID INT NOT NULL;

--Creating a primary key- Tabel level
ALTER TABLE students_2
ADD CONSTRAINT pk_studentID PRIMARY KEY (studentID);

EXEC SP_Help  students_2;


--Creating Non-Clustered Index
CREATE NONCLUSTERED INDEX inx_city ON students_2(city);
CREATE NONCLUSTERED INDEX idx_mobile ON students_2(mobile);

DROP index inx_city ON students_2;
DROP index idx_mobile ON students_2;


SELECT * FROM students_2
WHERE mobile='9087654321' AND city ='NYC';

--Filtered Index
CREATE NONCLUSTERED INDEX idx_mobile ON students_2(mobile)
WHERE mobile IS NOT NULL;

CREATE TABLE Students_3(
	  studentId INT
	, studentName VARCHAR(30)
	, mobile CHAR(10)
	,city VARCHAR(50)
	,date datetime
);

SELECT * FROM students_3


EXEC SP_Help  students_3;

USE BikeStores

With cte_orders AS(
SELECT o.customer_id
	,Count(o.order_ID) As Countorders