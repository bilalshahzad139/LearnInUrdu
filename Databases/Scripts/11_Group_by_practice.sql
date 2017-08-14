USE TEST

CREATE TABLE dbo.Employee(
	EmpID int IDENTITY(1,1) NOT NULL,
	Name varchar(50) NOT NULL,
	Salary int NOT NULL,
	Gender varchar(1) NOT NULL,
	City varchar(20) NOT NULL,
	Age tinyint NOT NULL
	CONSTRAINT [EmpID_1] PRIMARY KEY CLUSTERED (EmpID ASC)
)

Select * from dbo.Employee

INSERT INTO dbo.Employee(Name,Salary,Gender,City,Age) Values('User1',100,'M','Lahore',30)
INSERT INTO dbo.Employee(Name,Salary,Gender,City,Age) Values('User2',200,'F','Lahore',31)
INSERT INTO dbo.Employee(Name,Salary,Gender,City,Age) Values('User3',300,'M','Lahore',32)
INSERT INTO dbo.Employee(Name,Salary,Gender,City,Age) Values('User4',400,'F','Lahore',33)
INSERT INTO dbo.Employee(Name,Salary,Gender,City,Age) Values('User5',500,'M','Lahore',33)
INSERT INTO dbo.Employee(Name,Salary,Gender,City,Age) Values('User6',600,'F','Lahore',39)
INSERT INTO dbo.Employee(Name,Salary,Gender,City,Age) Values('User7',700,'M','Lahore',38)
INSERT INTO dbo.Employee(Name,Salary,Gender,City,Age) Values('User8',800,'F','Lahore',31)
INSERT INTO dbo.Employee(Name,Salary,Gender,City,Age) Values('User9',900,'M','Lahore',35)
INSERT INTO dbo.Employee(Name,Salary,Gender,City,Age) Values('User11',150,'M','Karachi',30)
INSERT INTO dbo.Employee(Name,Salary,Gender,City,Age) Values('User12',1200,'F','Karachi',31)
INSERT INTO dbo.Employee(Name,Salary,Gender,City,Age) Values('User13',100,'M','Karachi',32)
INSERT INTO dbo.Employee(Name,Salary,Gender,City,Age) Values('User14',300,'F','Karachi',33)
INSERT INTO dbo.Employee(Name,Salary,Gender,City,Age) Values('User15',200,'M','Karachi',33)
INSERT INTO dbo.Employee(Name,Salary,Gender,City,Age) Values('User16',500,'F','Karachi',39)
INSERT INTO dbo.Employee(Name,Salary,Gender,City,Age) Values('User17',300,'M','Karachi',38)
INSERT INTO dbo.Employee(Name,Salary,Gender,City,Age) Values('User18',400,'F','Karachi',31)
INSERT INTO dbo.Employee(Name,Salary,Gender,City,Age) Values('User19',1900,'M','Karachi',35)
INSERT INTO dbo.Employee(Name,Salary,Gender,City,Age) Values('User21',1150,'M','ISB',30)
INSERT INTO dbo.Employee(Name,Salary,Gender,City,Age) Values('User22',100,'F','ISB',31)
INSERT INTO dbo.Employee(Name,Salary,Gender,City,Age) Values('User23',200,'M','ISB',32)
INSERT INTO dbo.Employee(Name,Salary,Gender,City,Age) Values('User24',500,'F','ISB',33)
INSERT INTO dbo.Employee(Name,Salary,Gender,City,Age) Values('User25',400,'M','ISB',33)
INSERT INTO dbo.Employee(Name,Salary,Gender,City,Age) Values('User26',100,'F','ISB',39)
INSERT INTO dbo.Employee(Name,Salary,Gender,City,Age) Values('User27',600,'M','ISB',38)
INSERT INTO dbo.Employee(Name,Salary,Gender,City,Age) Values('User28',200,'F','ISB',31)
INSERT INTO dbo.Employee(Name,Salary,Gender,City,Age) Values('User29',700,'M','ISB',35)



-- Show data by age ascending
SELECT * 
FROM dbo.Employee 
ORDER BY AGE ASC

-- Show data by salary descending
SELECT * from dbo.Employee ORDER BY Salary DESC

SELECT * from dbo.Employee Order by City,Gender

-- Group Functions
/*
SUM, AVG, MIN, MAX, COUNT
*/

-- Questions

-- Find MAX Age of all employees
Select MAX(Age) from dbo.Employee

-- Find MAX age of all employees who live in Lahore
Select MAX(Age) from dbo.Employee Where City = 'Lahore'

-- Find MAX age of all employees who have salary greater than 500
Select MAX(Age) from dbo.Employee Where Salary > 500




-- Find Total Salary of employees who are from Lahore
Select Sum(Salary) from dbo.Employee Where City = 'Lahore'


-- Find Total Salary of female employees
Select Sum(Salary) from dbo.Employee Where Gender = 'F'


-- Find Total Salary of employees whose age is under 35
Select Sum(Salary) from dbo.Employee Where Age < 35



-- Find Total Salary City wise (City, Total_Salary)
SELECT City,Sum(Salary) 
FROM dbo.Employee
Group By City


-- Find Total Salary Gender wise
SELECT Gender,Sum(Salary) 
FROM dbo.Employee
Group By Gender

-- Find Total Salary City wise and then gender wise in each city
SELECT City,Gender,Sum(Salary) 
FROM dbo.Employee
Group By City,Gender


-- Find Total Salary Gender wise but only for Lahore
SELECT Gender,Sum(Salary) As 'Gend_Tot_Sal' 
FROM dbo.Employee Where City = 'Lahore'
Group By Gender


-- Find Total Salary city wise (only for female) but when city total salary > 4000
SELECT City,Sum(Salary) 
FROM dbo.Employee Where Gender = 'F'
Group By City
Having Sum(Salary) > 1000


Select Gender,Count(*)
FROM dbo.Employee
Group by Gender
