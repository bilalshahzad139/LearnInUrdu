
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
)

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
-- Sub Query
-- DRIVED Tables
-- CTE
-- Recursive CTE
*/


-----------Sub Query---------------

SELECT * from dbo.Employee 
Where DID IN (Select DID from dbo.Department Where DeptName ='HR')

select * from dbo.Employee e
inner join dbo.Department d on e.DID = D.DID
Where d.DeptName = 'HR'


------------------------------ Drive Tables (also known as inline views)--------------------------------
/*
A derived table is a table expression that appears in the FROM clause of a query. 
You can apply derived tables when the use of column aliases is not possible 
because another clause is processed by the SQL translator before the alias name is known.
*/

Select Age*5 AS TestAge
from dbo.Employee
group by TestAge

-- Problem: FROM is processed before GROUP BY in above case
-- Solution: We can use 'Dervied Table' here

-------- DRIVED TABLE (Vritual Table) can be used
SELECT t.Testage, COUNT(*) 
FROM (Select Age*5 as Testage from dbo.Employee) AS t
GROUP BY t.Testage


SELECT *,
	(SELECT Name from dbo.Employee m Where m.EmpID = e.MgrID) as MgrName
FROM dbo.Employee e


----------CTE (Common Table Expression) ---------------


WITH d AS 
(
	Select Age*5 as Testage from dbo.Employee
)
select * from d
group by d.Testage


----------Recursive CTE (Common Table Expression) ---------------

WITH d AS
(
	Select e.*,cast('' as varchar) as MgrName from dbo.Employee e  Where MgrID is NULL
	UNION ALL
	Select e.*,cast(d.Name as varchar) as MgrName from dbo.Employee e 
	INNER JOIN d on e.MgrID = d.EmpID
)
select * from d


WITH d AS
(
	Select e.*,0 as Level from dbo.Employee e  Where MgrID is NULL
	UNION ALL
	Select e.*,(d.Level + 1) as Level from dbo.Employee e INNER JOIN d on e.MgrID = d.EmpID
)
select * from d













