
/*
DROP Table dbo.Employee
DROP Table dbo.Department
*/


CREATE TABLE dbo.Employee(
	EmpID int NOT NULL,
	Name varchar(50) NOT NULL,
	Salary int NOT NULL,
	Gender varchar(1) NOT NULL,
	CityID int NOT NULL,
	Age tinyint NOT NULL,
	DID int,
	MgrID int
	CONSTRAINT [EmpID_1] PRIMARY KEY CLUSTERED (EmpID ASC)
);

CREATE Table dbo.Department(
	DID int NOT NULL,
	DeptName varchar(50) NOT NULL
	CONSTRAINT DID_PK PRIMARY KEY CLUSTERED (DID ASC)
)



INSERT INTO dbo.Department(DID, DeptName) Values (1, 'HR')
INSERT INTO dbo.Department(DID, DeptName) Values (2, 'Finance')
INSERT INTO dbo.Department(DID, DeptName) Values (3, 'DEV')


INSERT INTO dbo.Employee(EmpID,Name,Salary,Gender,CityID,Age,DID,MgrID) Values(1,'User1',100,'M',1,30,1,NULL)
INSERT INTO dbo.Employee(EmpID,Name,Salary,Gender,CityID,Age,DID,MgrID) Values(2,'User2',200,'F',1,31,1,1)
INSERT INTO dbo.Employee(EmpID,Name,Salary,Gender,CityID,Age,DID,MgrID) Values(3,'User3',300,'M',2,32,2,1)
INSERT INTO dbo.Employee(EmpID,Name,Salary,Gender,CityID,Age,DID,MgrID) Values(4,'User4',400,'F',2,33,2,1)
INSERT INTO dbo.Employee(EmpID,Name,Salary,Gender,CityID,Age,DID,MgrID) Values(5,'User5',500,'M',3,33,2,2)
INSERT INTO dbo.Employee(EmpID,Name,Salary,Gender,CityID,Age,DID,MgrID) Values(6,'User6',600,'F',3,39,1,2)
INSERT INTO dbo.Employee(EmpID,Name,Salary,Gender,CityID,Age,DID,MgrID) Values(7,'User7',700,'M',3,38,NULL,2)



select * from dbo.Employee

/*
Topics
-- Exists
-- Dynamic Query
-- TOP, DISTINCT
-- UNION
-- UNION ALL
-- INTERSECT
-- EXCEPT
-- Introduction to full text search

*/


-----------EXISTS---------------

--EXISTS function returns TRUE or FALSE

SELECT * from dbo.Employee 
Where Exists (Select DID from dbo.Department Where DeptName ='HR')


SELECT * from dbo.Employee e
Where NOT Exists (Select d.DID from dbo.Department d Where d.DID = e.DID)


IF(Exists(Select DID from dbo.Department Where DeptName ='HR'))
Begin
	print 'hello';
end


-----------Dynamic query---------------

DECLARE @var nvarchar(200) 
SET @var = 'SELECT * FROM dbo.Employee'

EXEC(@var)

execute Sp_executesql @var


-----------TOP, Distinct---------------

Select top 4 * from dbo.Employee

Select distinct Gender from dbo.Employee
Select distinct Gender,DID from dbo.Employee


----------UNION---------------

Select * from dbo.Employee Where DID =1
UNION
Select * from dbo.Employee Where  Salary > 300

----------UNION ALL ---------------
Select * from dbo.Employee Where DID =1
UNION ALL
Select * from dbo.Employee Where Salary > 300

-----------INTERSECT------------------
Select * from dbo.Employee Where DID =1
INTERSECT
Select * from dbo.Employee Where Salary > 300


-----------EXCEPT ------------------
Select * from dbo.Employee Where DID =1
EXCEPT
Select * from dbo.Employee Where Salary > 300



Select * from dbo.Employee where name like 'sql server'











