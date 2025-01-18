Use SQL_PRACTICE;
DROP TABLE EmployeeDetail;

CREATE TABLE EmployeeDetail(
	    EmployeeId INT Identity
	  , FirstName VARCHAR(50)
	  , LastName VARCHAR(50)
	  , Salary INT
	  , JoiningDate DateTime
	  , Department VARCHAR(200)
	  , Gender VARCHAR(100)

);

INSERT INTO EmployeeDetail (FirstName, LastName, Salary, JoiningDate, Department, Gender)
VALUES
    ('Vikas', 'Roe', 60000.00, CURRENT_TIMESTAMP, 'IT', 'Male'),
    ('Nikitha', 'Jain', 530000.00, CURRENT_TIMESTAMP, 'HR', 'Female'),
    ('Anishi', 'Kumar', 1000000.00, CURRENT_TIMESTAMP, 'IT', 'Female'),
    ('Nikil', 'Sharma', 480000.00, CURRENT_TIMESTAMP, 'HR', 'Male'),
    ('Joey', 'Kadian', 500000.00, CURRENT_TIMESTAMP, 'PAYROLL', 'Male');

SELECT * FROM EmployeeDetail


--1. Write a query to get all employee detail from "EmployeeDetail" table

SELECT * FROM EmployeeDetail;

--2. Write a query to get only "FirstName" column from "EmployeeDetail" table

SELECT FirstName FROM EmployeeDetail;

--3. Write a query to get FirstName in upper case as "First Name".

SELECT upper(FirstName) As [FIRST NAME] FROM EmployeeDetail;

--4. Write a query to get FirstName in lower case as "First Name".

SELECT Lower(FirstName)  As [FIRST NAME] FROM EmployeeDetail;

--5. Write a query for combine FirstName and LastName and display it as "Name" (also include white space between first name & last name)

SELECT concat(FirstName,' ',LastName) As [FULL NAME] From EmployeeDetail;

--6. Select employee detail whose name is "Vikas"

SELECT FirstName FROM EmployeeDetail
WHERE FirstName ='Vikas'

--7. Get all employee detail from EmployeeDetail table whose "FirstName" start with latter 'a'.

SELECT * FROM EmployeeDetail
WHERE FirstName like 'a%'

--8. Get all employee details from EmployeeDetail table whose "FirstName" contains 'k'

SELECT * FROM EmployeeDetail
WHERE FirstName like '%k%'

--9.Get all employee details from EmployeeDetail table whose "FirstName" end with 'h'

SELECT * FROM EmployeeDetail
WHERE FirstName like '%h'

--10.Get all employee detail from EmployeeDetail table whose "FirstName" start with any single character between 'a-p'

SELECT * FROM EmployeeDetail
WHERE FirstName like '[a-p]%'

--11.Get all employee detail from EmployeeDetail table whose "FirstName" not start with any single character between 'a-p'


SELECT * FROM EmployeeDetail
WHERE FirstName NOT like '[a-p]%'


SELECT * FROM EmployeeDetail
WHERE FirstName  like '[^a-p]%'

--12).Get all employee detail from EmployeeDetail table whose "Gender" end with 'le' and contain 4 letters. The Underscore(_) Wildcard Character represents any single character.

SELECT * FROM EmployeeDetail
WHERE Gender like '__le'

--13).Get all employee detail from EmployeeDetail table whose "FirstName" start with 'A' and contain 6 letters.

SELECT * FROM EmployeeDetail
WHERE FirstName  like 'a_____'

--14).Get all employee detail from EmployeeDetail table whose "FirstName" containing '%'. ex:-"Vik%as".

SELECT * FROM EmployeeDetail
WHERE FirstName  like '%[%]%'
--According to our table it would return 0 rows, because no name containg '%'

--15.Get all unique "Department" from EmployeeDetail table.

SELECT Distinct Department FROM EmployeeDetail;

--16).Get the highest "Salary" from EmployeeDetail table.

SELECT MAX(salary)AS MAXIMUM FROM EmployeeDetail;

--17).Get the lowest "Salary" from EmployeeDetail table.
SELECT MIN(salary) AS MINIMUM FROM EmployeeDetail;

--18)Show "JoiningDate" in "dd mmm yyyy" format, ex- "15 Feb 2013"

SELECT CONVERT(VARCHAR(20),JoiningDate,106) FROM [EmployeeDetail]

SELECT FORMAT(GETDATE(), 'dd-MM-yyyy') AS FormattedDate
FROM EmployeeDetail;

SELECT CONVERT(VARCHAR(20),JoiningDate,105) + ' - Today date' FROM [EmployeeDetail]

--19).Show "JoiningDate" in "yyyy/mm/dd" format, ex- "2013/02/15"

SELECT CONVERT(VARCHAR(20),JoiningDate,111) FROM [EmployeeDetail]

--20.Show only time part of the "JoiningDate".

SELECT CONVERT(VARCHAR(20),JoiningDate,108) FROM [EmployeeDetail]

--21).Get only Year part of "JoiningDate".

SELECT DATEPART(year,JoiningDate) FROM [EmployeeDetail]

--22.Get only Month part of "JoiningDate".

SELECT DATEPART(month,JoiningDate) FROM [EmployeeDetail]

--23). Get system date.

SELECT GETDATE()

--24). Get UTC date.

SELECT GETUTCDATE()

--25).Get the first name, current date, joiningdate and diff between current date and joining date in months.

SELECT  FIRSTNAME, GETDATE() AS CURRENTDATE ,JoiningDate, DATEDIFF(MM,JoiningDate,Getdate()) AS DIFFERENCE
FROM EmployeeDetail

--26)Get the first name, current date, joiningdate and diff between current date and joining date in days

SELECT  FIRSTNAME, GETDATE() AS CURRENTDATE ,JoiningDate, DATEDIFF(DD,JoiningDate,Getdate()) AS DIFFERENCE
FROM EmployeeDetail

--27)Get all employee details from EmployeeDetail table whose joining year is 2013.

SELECT * FROM EmployeeDetail
WHERE year(JoiningDate)=2013

SELECT * FROM [EmployeeDetail] WHERE DATEPART(YYYY,JoiningDate) = '2025'

--28)Get all employee details from EmployeeDetail table whose joining month is Jan(1).

SELECT * FROM [EmployeeDetail] WHERE DATEPART(MM,JoiningDate) = '1'

--29.Get all employee details from EmployeeDetail table whose joining date between "2013-01-01" and "2013-12-01".

SELECT * FROM [EmployeeDetail] WHERE JoiningDate BETWEEN '2025-01-01' and '2025-12-01'

--30.Get how many employee exist in "EmployeeDetail" table.

SELECT count(EmployeeID) FROM EmployeeDetail

SELECT COUNT(*) FROM [EmployeeDetail]

--31.Select only one/top 1 record from "EmployeeDetail" table.

SELECT  TOP 1 *  FROM EmployeeDetail

--32.Select all employee detail with First name "Vikas","Ashish", and "Nikhil".

SELECT * FROM EmployeeDetail 
WHERE FirstName IN('Vikas','Anishi', 'Nikil')

--33.Select all employee detail with First name not in "Vikas","Ashish", and "Nikhil".


SELECT * FROM EmployeeDetail 
WHERE FirstName NOT IN('Vikas','Anishi', 'Nikil')

--34.Select first name from "EmployeeDetail" table after removing white spaces from right side

SELECT RTRIM(FirstName) FROM EmployeeDetail 

--35.Select first name from "EmployeeDetail" table after removing white spaces from left side
 
 SELECT LTRIM(FirstName) FROM EmployeeDetail 

 --36.Display first name and Gender as M/F.(if male then M, if Female then F)

 SELECT FirstName, CASE WHEN Gender = 'Male' THEN 'M'
WHEN Gender = 'Female' THEN 'F' END AS [Gender] FROM [EmployeeDetail]

--37.Select first name from "EmployeeDetail" table prifixed with "Hello "

SELECT CONCAT('HELLO ',FIRSTNAME) FROM EmployeeDetail

SELECT 'HELLO '+FIRSTNAME FROM EmployeeDetail

--38.Get employee details from "EmployeeDetail" table whose Salary greater than 600000

SELECT * FROM EmployeeDetail
WHERE Salary>600000

--39.Get employee details from "EmployeeDetail" table whose Salary less than 700000

SELECT * FROM EmployeeDetail
WHERE Salary<700000

--40.Get employee details from "EmployeeDetail" table whose Salary between 500000 than 600000

SELECT * FROM EmployeeDetail
WHERE Salary BETWEEN 500000 and 600000

--41.Select second highest salary from "EmployeeDetail" table.

SELECT TOP 1 salary  FROM 
(SELECT TOP 2 salary  FROM EmployeeDetail order by salary desc) AS T ORDER BY Salary ASC

SELECT TOP 1 Salary FROM --EmployeeDetail
(SELECT TOP 2 Salary FROM [EmployeeDetail] ORDER BY Salary DESC) T ORDER BY Salary ASC

--42.Write the query to get the department and department wise total(sum) salary from "EmployeeDetail" table.

CREATE TABLE ProjectDetail (
    ProjectID INT PRIMARY KEY,
	EmployeeDetailID INT,
    ProjectName VARCHAR(255) NOT NULL,
 );

 INSERT INTO ProjectDetail (ProjectID, EmployeeDetailID, ProjectName)
VALUES 
(1, 1, ' Task Track'),
(2, 2, ' CLP'),
(3, 3, ' Survey Management'),
(4, 4, ' HR Management'),
(5, 5, 'Task Track'),
(6, 6, 'GRS'),
(7, 7, 'DDS'),
(8, 8, 'HR Management'),
(9, 9, 'GL Management');

SELECT Department, SUM(Salary) AS [Total Salary] 
FROM [EmployeeDetail] 
GROUP BY Department

--43.Write the query to get the department and department wise total(sum) salary, display it in ascending order according to salary.
SELECT Department, SUM(Salary) AS [Total Salary] 
FROM [EmployeeDetail] 
GROUP BY Department
ORDER BY sum(Salary) 

--44.Write the query to get the department and department wise total(sum) salary, display it in descending order according to salary.

SELECT Department, sum(salary) AS TOTAL
FROM EmployeeDetail
GROUP BY Department
ORDER BY sum(salary) DESC

--45.Write the query to get the department, total no. of departments, total(sum) salary with respect to department from "EmployeeDetail" table.

SELECT Department,count(*)AS dept, sum(salary) AS TOTAL
FROM EmployeeDetail
GROUP BY Department

--46.Get department wise average salary from "EmployeeDetail" table order by salary ascending
SELECT Department,avg(salary) AS TOTAL
FROM EmployeeDetail
GROUP BY Department
order by avg(salary)

--47.. Get department wise maximum salary from "EmployeeDetail" table order by salary ascending
SELECT department, max(salary) As MAXIMUM
FROM EmployeeDetail
Group by Department
order by max(Salary) ASC

--48.Get department wise minimum salary from "EmployeeDetail" table order by salary ascending
SELECT department, min(salary) As MAXIMUM
FROM EmployeeDetail
Group by Department
order by min(Salary) ASC

--49.Write down the query to fetch Project name assign to more than one Employee
SELECT * FROM ProjectDetail

SELECT  trim(ProjectNAME) As Projects
-- , count(EmployeeDetailID)
From ProjectDetail
GRoup by trim(ProjectName)
Having  count(EmployeeDetailID)>1

--51.Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for those employee which have assigned project already.



