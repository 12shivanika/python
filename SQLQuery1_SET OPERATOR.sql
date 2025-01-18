

USE Students;

CREATE DATABASE Students;

DROP TABLE Students;
DROP TABLE Students_2;

CREATE TABLE Students(
   RollNO INT IDENTITY(1,1)
 , StuNAME VARCHAR(100)
 , HomeTOWN VARCHAR(100)
 , Marks TINYINT 
 , FavSubject  VARCHAR(30)


);

ALTER TABLE students
ALTER COLUMN RollNO INT NOT NULL;

ALTER TABLE STUDENTS
ALTER COLUMN STUNAME VARCHAR(100) NOT NULL;

SET IDENTITY_INSERT Students ON;

INSERT INTO Students( RollNO, StuNAME , HomeTOWN , Marks, FavSubject)
VALUES(1000,'Shiva','Chennai',80,'Maths')

SET IDENTITY_INSERT Students OFF;

INSERT INTO Students(StuNAME , HomeTOWN , Marks, FavSubject)
VALUES('Shiv','Chennai',80,'Maths')
,('RON','PUNE',80,'sst')
,('SANJANA','MUMBAI',80,'CSC')
,('JHON','KERALA',80,'SCI');

SELECT * FROM Students_2;


SELECT * INTO Students_2 FROM (SELECT * FROM Students WHERE 1=2) As t1;

SET IDENTITY_INSERT students_2 ON;

INSERT INTO Students_2(RollNO,StuNAME , HomeTOWN , Marks, FavSubject)
VALUES(1000,'Shiva','Chennai',80,'Maths')
,(1003,'SANJANA','PUNE',80,'sst')
,(1005,'DON','MUMBAI',80,'CSC')
,(1008,'J','KERALA',80,'SCI');

SET IDENTITY_INSERT students_2 OFF;

--UNION IT WILL REMOVE THE DUPLICATES AND IT WILL GIVE RESULT SET

-- EXCEPT 

SELECT * FROM Students
UNION
SELECT * FROM students_2
ORDER BY 1;

SELECT * FROM Students
UNION ALL 
SELECT * FROM Students_2
ORDER BY 1;

/* INTERSET It is used to append two or more SELECT staments,
but it will returns the records which are common in both select statements */

SELECT * FROM Students
INTERSECT
SELECT * FROM Students_2;

--EXCEPT IT will show the values which are not in the second table

SELECT * FROM Students
EXCEPT
SELECT * FROM Students_2;

/*
CASE

*/

DROP TABLE EMP;

CREATE TABLE EMP(
    EmpID INT
  , First_Name VARCHAR(50) NOT NULL
  , Last_NAME VARCHAR(50)
  , HireDate DATE NOT NULL
  , EmailID VARCHAR(50) NOT NULL
  , PhoneNo VARCHAR(50) NOT NULL
  , Job_ID VARCHAR(50)
  , Salary DECIMAL(7,2)
  , PRIMARY KEY (EmpID)

);

INSERT INTO EMP(EmpID , First_Name , Last_NAME, HireDate , EmailID , PhoneNo, Job_ID , Salary)
Values(100, 'Sanjana', 'Kumar', '1990-05-02','abc@gmail.com','12345678','IT_PROG', 90000.00)
   ,(101, 'RAM', 'Kumar', '1992-05-02','abc@gmail.com','12345678','AD_VP', 80000.00)
   ,(102, 'RON', 'Kum', '1993-05-02','bca@gmail.com','12345678','IT_PROG', 25000.00)
   ,(103, 'REENA', 'mar', '1995-05-02','abc@gmail.com','12345678','AD_VP', 90000.00)
   ,(104, 'Divya', 'umar', '1998-05-02','abc@gmail.com','12345678','IT_PROG', 60000.00)
   ,(105, 'Karthi', 'Kuumar', '1999-05-02','abc@gmail.com','12345678','IT_PROG', 48000.00);

SELECT * FROM EMP;

ALTER TABLE EMP
ADD GENDER CHAR;

SELECT * FROM EMP
WHERE empID IN(100,101,102,103,104);

BEGIN TRANSACTION;

UPDATE EMP
SET GENDER = 'M'
WHERE EmpID IN (100,101,102,103,104,105);

COMMIT;
ROLLBACK;

INSERT INTO EMP(EmpID , First_Name , Last_NAME, HireDate , EmailID , PhoneNo, Job_ID , Salary)
Values(106, 'Sanjay', 'Kumar', '1990-05-02','abc@gmail.com','12345678','IT_PROG', 90000.00)
   ,(107, 'RAMkey', 'Kumar', '1992-05-02','abc@gmail.com','12345678','AD_VP', 80000.00)
   ,(108, 'RONnie', 'Kum', '1993-05-02','bca@gmail.com','12345678','IT_PROG', 25000.00)
   ,(109, 'REENAjo', 'mar', '1995-05-02','abc@gmail.com','12345678','AD_VP', 90000.00)
   ,(110, 'Divyaaa', 'umar', '1998-05-02','abc@gmail.com','12345678','IT_PROG', 60000.00)
   ,(111, 'Karthikeyan', 'Kuumar', '1999-05-02','abc@gmail.com','12345678','IT_PROG', 48000.00);


-- SIMPLE CASE EXPRESSION

/*
IT will check all the rows
*/

SELECT *,CASE Job_ID
	   WHEN 'AD_VP' THEN (salary * 0.2) + salary
	    WHEN 'IT_PROG' THEN (salary * 0.1) + salary
    ELSE Salary
	END AS REVISEDSALARY
FROM EMP;

-- SEARCHED CASE EXPRESSION

/*
IT will check only the specified records
*/

SELECT *,CASE 
      WHEN Job_ID ='AD_VP' THEN (salary *0.2) + salary
	  WHEN EmpID =100 THEN (salary *0.5) + Salary
	ELSE Salary
	END AS RevisedSalary
FROM EMP;


SELECT 
   RevSal.TotalSalExpense
   , RevSal.RevisedSalExpense
   , (RevisedSalExpense -TotalSalExpense) AS BalanceAccount

FROM(
      
	  SELECT 
	           SUM(Salary) AS TotalSalExpense
			   , SUM(CASE
			         WHEN Job_ID ='AD_VP' THEN (salary *0.2) + salary
	                 WHEN EmpID =100 THEN (salary *0.5) + Salary
					 ELSE Salary
					end
	          )AS RevisedSalExpense
             FROM EMP

) AS RevSal;

--Calculate Total expenses for jobID =' IT Prog'
-- SOLUTION 1


SELECT
SUM(t1.salary) AS [Total Salary Expenses], avg(t2.[IT_Prog Salary]) AS [IT_Prog Salary Expenses]
FROM EMP AS t1,

(SELECT SUM (Salary) AS [IT_Prog Salary] FROM EMP
WHERE Job_ID ='IT_Prog') AS t2;

-- SOLUTION 2 : Using Subquery in Select Clause

SELECT
  SUM(t1.Salary) AS [Total Salary Expenses]
  ,(SELECT SUM(Salary) AS [IT_Prog Salary] FROM EMP
  WHERE Job_ID ='IT_Prog') As [ITProg_Salary Expenses]

  FROM EMP AS t1;

-- Using CASE Expresion in Ordere By Clause

SELECT * FROM emp;

SELECT CASE Job_ID
        WHEN 'AD_VP' THEN 'B'
	    WHEN 'IT_PROG' THEN 'A'
	ELSE 'C'
	END AS Grade
	, Count(*) AS EMPLoyee_count

FROM Emp

GROUP BY CASE Job_ID
          WHEN 'AD_VP' THEN 'B'
	    WHEN 'IT_PROG' THEN 'A'
	ELSE 'C'
	END

ORDER BY CASE Job_ID
          WHEN 'AD_VP' THEN 'B'
	    WHEN 'IT_PROG' THEN 'A'
	ELSE 'C'
	END;

-- PRA 1


DROP TABLE customers;

CREATE TABLE Customers(Cusmomer_ID INT
  , First_name VARCHAR(50)
  , Last_name VARCHAR(50)
  , Age TINYINT
  , Country VARCHAR(50));


  INSERT INTO Customers(Cusmomer_ID , First_name, Last_name, Age , Country )
  VALUES(1,'Sanjay', 'Dravid',52, 'USA')
        ,(2,'Sanjana', 'Kumar',10, 'INDIA')
		,(3,'Shivanika', 'Dravid',16, 'UK')
		,(4,'HARITHA', 'Shiva',22, 'South Africa');

SELECT * FROM Customers;

SELECT *, 
   CASE
   WHEN AGE >= 18 THEN 'ELIGIBLE TO VOTE' 
   ELSE 'NOT ELIGIBLE'
   END AS [VOTER's ELIGIBILITY]
   FROM Customers
ORDER BY 2;

-- COALESCE - Returns first non value in list values

SELECT COALESCE(NULL,NULL,NULL,'SQL SERVER', 'JAVA', 'PYTHON') AS [Programing Language];

USE BikeStores;

SELECT 
    Phone
	, CASE
	  WHEN Phone IS NULL THEN 'N/A'
	  ELSE Phone
	  END AS Phone_data
	 , COALESCE (Phone,'N/A') AS P_Coalesce
FROM Customers;










   


