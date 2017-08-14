

CREATE Table dbo.Department(
	DID int NOT NULL,
	DeptName varchar(50) NOT NULL
	CONSTRAINT DID_PK PRIMARY KEY CLUSTERED (DID ASC)
)

CREATE Table dbo.City(
	CID int NOT NULL,
	CityName varchar(50) NOT NULL
	CONSTRAINT CID_PK PRIMARY KEY CLUSTERED (CID ASC)
)

CREATE TABLE dbo.Employee(
	EmpID int IDENTITY(1,1) NOT NULL,
	Name varchar(50) NOT NULL,
	Salary int NOT NULL,
	Gender varchar(1) NOT NULL,
	CityID int NOT NULL,
	Age tinyint NOT NULL,
	DID int
	CONSTRAINT [EmpID_1] PRIMARY KEY CLUSTERED (EmpID ASC)
)


INSERT INTO dbo.Department(DID, DeptName) Values (1, 'HR')
INSERT INTO dbo.Department(DID, DeptName) Values (2, 'Finance')
INSERT INTO dbo.Department(DID, DeptName) Values (3, 'DEV')


Select * from dbo.Department


INSERT INTO dbo.City(CID, CityName) Values (1, 'ISB')
INSERT INTO dbo.City(CID, CityName) Values (2, 'KHI')
INSERT INTO dbo.City(CID, CityName) Values (3, 'LHR')


INSERT INTO dbo.Employee(Name,Salary,Gender,CityID,Age,DID) Values('User1',100,'M',1,30,1)
INSERT INTO dbo.Employee(Name,Salary,Gender,CityID,Age,DID) Values('User2',200,'F',1,31,1)
INSERT INTO dbo.Employee(Name,Salary,Gender,CityID,Age,DID) Values('User3',300,'M',2,32,2)
INSERT INTO dbo.Employee(Name,Salary,Gender,CityID,Age,DID) Values('User4',400,'F',2,33,2)
INSERT INTO dbo.Employee(Name,Salary,Gender,CityID,Age,DID) Values('User5',500,'M',3,33,2)
INSERT INTO dbo.Employee(Name,Salary,Gender,CityID,Age,DID) Values('User6',600,'F',3,39,1)
INSERT INTO dbo.Employee(Name,Salary,Gender,CityID,Age,DID) Values('User7',700,'M',3,38,NULL)


Select * from dbo.Employee


-- to see detail of an object
sp_help 'Employee'




/* --------- JOINS ---------------*/

-- Equi JOIN (Standard in SQL)

SELECT e.EmpID,e.Name,d.DeptName FROM dbo.Employee e, dbo.Department d
Where e.DID = d.DID

-- INNER JOIN
SELECT * FROM dbo.Employee e 
INNER JOIN dbo.Department d ON e.DID = d.DID

-- LEFT JOIN
SELECT e.EmpID,e.Name,IsNULL(d.DeptName,'') As DName FROM dbo.Employee e 
LEFT JOIN dbo.Department d ON e.DID = d.DID


-- RIGHT JOIN
SELECT * FROM 
dbo.Employee e RIGHT JOIN dbo.Department d ON e.DID = d.DID

-- FULL JOIN
SELECT * FROM dbo.Employee e 
FULL JOIN dbo.Department d ON e.DID = d.DID


-- CROSS JOIN
Select * from dbo.Employee e
Cross join dbo.Department


-- Now add a column in employee table --

-- alter table dbo.Employee add MgrID int NULL

Select * from dbo.Employee

-- Update dbo.Employee SET MgrID = 1 Where EmpID IN (2,3,4)
-- Update dbo.Employee SET MgrID = 2 Where EmpID IN (5,6,7)


/* Question: Show Employees with their Manager Name */

SELECT e.EmpID,e.Name,e.Salary,e.Gender,isNull(m.Name,'') as MgrName from 
dbo.Employee e LEFT JOIN dbo.Employee m
ON e.MgrID = m.EmpID



-- Multiple JOINS, Show Employee detail with City and Depart name

SELECT e.EmpID,e.Name,e.Salary,e.Gender,d.DeptName,c.CityName 
from dbo.Employee e 
INNER JOIN dbo.Department d on e.DID = d.DID
INNER JOIN dbo.City c on e.CityID = c.CID





-- Departement wise Total Salary
/*
DID  DName     salary
1    HR        900
2    Finance   1200
3    DEV       0

*/
Select d.dID,d.DeptName,Sum(isnull(e.Salary,0))
from dbo.Employee e RIGHT JOIN dbo.Department d on e.DID = d.DID
Group By d.dID,d.DeptName




