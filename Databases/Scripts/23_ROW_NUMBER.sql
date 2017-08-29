
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
-- Row_Number, Over
-- Rank, Over
-- dense_Rank, Over
-- Row_Number, Partition
-- Row_Number, Partition with CTE
-- OFFSET, FETCH
-- sp_who
*/

select * from dbo.Employee

------------ROW_Number, OVER----------------
--- Consider all result set as ONE group
SELECT DID,Name,Salary,Gender,
ROW_NUMBER() OVER (Order by DID) AS RowNumber
FROM dbo.Employee

-- Just like row_number but give same number to similar values
SELECT DID,Name,Salary,Gender,
Rank() OVER (Order by DID) AS RowNumber
FROM dbo.Employee

-- Just like Rank but without gaps
SELECT DID,Name,Salary,Gender,
DENSE_Rank() OVER (Order by DID) AS RowNumber
FROM dbo.Employee




------------ROW_Number, PARTITION BY----------------
--- Partition the result set in mutliple groups and then assign row number
SELECT DID,Name,Salary,Gender, 
ROW_NUMBER() OVER (PARTITION BY DID Order by DID) AS RowNumber
FROM dbo.Employee


-----------ROW_NUMBER, CTE
-- ruturn a subset of data

WITH d AS
(
SELECT EMPID, DID,Name,Salary,Gender, 
ROW_NUMBER() OVER (Order by DID) AS RowNumber
FROM dbo.Employee
) Select * from d 
where RowNumber between 4 and 6



WITH d AS
(
SELECT DID,Name,Salary,Gender, 
ROW_NUMBER() OVER (PARTItion by DID Order by DID) AS RowNumber
FROM dbo.Employee
) Select * from d where RowNumber =1 




-- OFFSET, FETCH NEXT option are available from sql server 2012
-- Are used with ORDER BY clause

select * from dbo.Employee p
order by EmpID

select * from dbo.Employee p
order by EmpID
OFFSET 3 ROWS
FETCH NEXT 2 ROwS ONLY



--- sp_who USEFUL command/procedure
-- Provides information about current users, sessions, and processes
execute sp_who
execute sp_who 'sa'
execute sp_who 'active'
execute sp_who 1











