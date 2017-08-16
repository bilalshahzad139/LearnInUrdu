
/*
Constraints: 
--------------------------------
ISNULL
UNIQUE
PRIMARY KEY
FOREIGN KEY
CHECK
DEFAULT
INDEX

------------------------------------
Entity Integrity: Through Primary Key, Unique Key
Domain Integrity: Through CHECK 
Referential Integrity: Through Foreign Key

*/

-- NULL Constraint
ALTER TABLE dbo.Employee ALTER COLUMN AGE TINYINT NOT NULL


-- UNIQUE Key
ALTER TABLE dbo.Employee ADD NIC varchar(20) NULL
ALTER TABLE dbo.Employee ADD CONSTRAINT unq_emp_Nic UNIQUE (NIC)


-- Primary Key
CREATE Table dbo.EmployeeAudit(ID int NOT NULL,Name varchar(50),ActivityTime datetime)

ALTER TABLE dbo.EmployeeAudit ADD CONSTRAINT pk_audit_cons Primary key (ID ASC)
ALTER TABLE dbo.EmployeeAudit DROP CONSTRAINT pk_audit_cons 

ALTER TABLE dbo.EmployeeAudit ADD Primary key (ID ASC)
ALTER TABLE dbo.EmployeeAudit DROP CONSTRAINT constraintname

INSERT INTO dbo.EmployeeAudit(ID,Name) Values(1,'abc')
INSERT INTO dbo.EmployeeAudit(ID,Name) Values(1,'abc')


-- Foreign Key
ALTER TABLE dbo.Employee ADD CONSTRAINT fc_emp_did Foreign key (DID) References dbo.Department (DID)
ALTER TABLE dbo.Employee DROP CONSTRAINT fc_emp_did


ALTER TABLE dbo.Employee ADD Foreign key (DID) References dbo.Department (DID)
ALTER TABLE dbo.Employee DROP CONSTRAINT constraintname

select * from dbo.Department
select * from dbo.Employee
Update dbo.Employee SET DID = 4 Where EmpID = 1







-- CHECK Constraint

ALTER TABLE dbo.Employee ADD CHECK (Salary > 50 AND Salary < 5000)
ALTER TABLE dbo.Employee ADD Constraint chk_emp_salary CHECK (Salary > 50 AND Salary < 5000)


Update dbo.Employee SET Salary = 40 Where EmpID = 1


ALTER TABLE dbo.Employee DROP CONSTRAINT CK__Employee__Salary__37A5467C;
ALTER TABLE dbo.Employee DROP CONSTRAINT chk_emp_salary


-- Default 
ALTER TABLE dbo.Employee ADD CONSTRAINT df_employee_city default 0 for Age
ALTER TABLE dbo.Employee DROP CONSTRAINT df_employee_city 



select * from [INFORMATION_SCHEMA].[TABLE_CONSTRAINTS]
select * from [INFORMATION_SCHEMA].[CHECK_CONSTRAINTS]
select * from [INFORMATION_SCHEMA].[REFERENTIAL_CONSTRAINTS]




