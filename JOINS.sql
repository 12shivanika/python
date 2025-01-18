--Joins

-- INNER JOIN

drop table students;
drop table courses;

CREATE TABLE Students(
 CourseID  INT --Primary key
 , StuName VARCHAR(50) NOT NULL
  ,Created DATETIME2 DEFAULT GETDATE()

);

INSERT INTO Students( CourseID, StuName)
Values(001,'Ram')
,(002,'Jamya')
,(003,'RON')
,(003,'RoooON');


CREATE TABLE Courses(
 CourseID  INT --Primary key
 , CourseName VARCHAR(50) NOT NULL
  ,Created DATETIME2 DEFAULT GETDATE()

);

INSERT INTO Courses( CourseID, CourseName)
Values(001,'CSC')
,(002,'IT')
,(004,'ECE')
,(004,'ECE');

SELECT s.StuName,c.CourseName
FROM Students as s
INNER JOIN Courses as c ON s.courseID = c.CourseID;

SELECT s.STUName, C.CourseName
FROM students as s
LEFT Join Courses as c ON s.CourseID =c.CourseID;

SELECT S.STUNAME, C.CourseName
FROM STUDENTS AS S
RIGHT JOIN COURSES aS C ON s.CourseID = C.CourseID;

SELECT S.STUNAME, C.CourseName
FROM STUDENTS AS S
FULL JOIN Courses AS C ON S.CourseID = C.CourseID;

SELECT S.STUNAME, C.CourseName
FROM STUDENTS AS S
FULL OUTER JOIN Courses AS C ON S.CourseID = C.CourseID;

SELECT S.STUNAME, C.CourseName
FROM STUDENTS AS S
LEFT OUTER JOIN Courses AS C ON S.CourseID = C.CourseID;

SELECT S.STUNAME, C.CourseName
FROM STUDENTS AS S
RIGHT OUTER JOIN Courses AS C ON S.CourseID = C.CourseID;

SELECT S.STUNAME, C.CourseName
FROM STUDENTS AS S
CROSS JOIN Courses As C;

 






