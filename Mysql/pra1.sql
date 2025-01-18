
SELECT * from custom;

CREATE TABLE Custom(
CustomerID INT primary key,
CustomerName VARCHAR(50) NOT NULL,
Mobile CHAR(10) unique,
City VARCHAR(50),
Address VARCHAR(200),
Created DATETIME);


INSERT INTO Custom
(CustomerID,
CustomerName,
Mobile,
City,
Address,
Created)
VALUES(1, "Shivanika" , '4234567891', 'Mumbai' , 'ssd12',current_timestamp()),
(2,"Sanjans", '1234567891', 'Mumbai' , 'ssd12',current_timestamp()),
(3,"Haritha", '9876543211', 'Chennai', 'xyz2', current_timestamp()),
(4,"Varshini", '223457791', 'Mumbai' , 'ssd12',current_timestamp());

# Alter table 
ALTER TABLE Custom
ADD COLUMN Gender VARCHAR(6) AFTER CustomerName;

ALTER TABLE Custom
DROP COLUMN Gender;

UPDATE Custom
SET Gender ='Male';

SELECT * from custom
WHERE CustomerID = 2;

SELECT * from custom;

# Update fields
UPDATE Custom
SET Gender ='MALE'
WHERE CustomerID = 3;

SELECT * FROM Custom;

# Delete the records
DELETE FROM Custom
where customerID =3;

update custom
set gender ="FEMALE"
where customerID =1;

SELECT * FROM Customer

order by First_Name;



