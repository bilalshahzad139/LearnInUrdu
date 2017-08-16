
-- Trigger: A code that executes when an event occurs in database 
/*
DML Triggers: INSERT, UPDATE, or DELETE
--- AFTER Trigger: are executed after the action of the INSERT, UPDATE, DELETE.
---INSTEAD Of Trigger: are executed before the action of INSERT, UPDATE, DELETE.
DDL Triggers: CREATE, ALTER, and DROP
--- DDL triggers can only fire after the DDL statement has occurred
LOGON Triggers: LOGON event that is raised when a user sessions is being established

DML triggers are most useful when the features supported by constraints 
cannot meet the functional needs of the application.
*/

-- CREATE TRIGGER triggername ON table/view

-- ALTER TRIGGER triggername
-- DROP TRIGGER triggername







CREATE TRIGGER dbo.tgSaveAudit ON dbo.Employee
AFTER Delete
AS
Begin
	--inserted/deleted a special table here which contains inserted data
	declare @empid int
	declare @name varchar(50)

	Select @empid = i.EmpID from deleted i;
	select @name = i.Name from deleted i;

	insert into dbo.EmployeeAudit Select @empid,@name,getdate()

END


-- insert into [dbo].[Employee](Name, Salary, Gender, CityID, Age, DID) Select 'test',100,'M',1,20,1

select * from [dbo].[Employee]

delete from dbo.Employee where EmpID = 9

select * from dbo.EmployeeAudit


-- ALTER TABLE [dbo].[Employee] DISABLE TRIGGER tgSaveAudit




CREATE TRIGGER dbo.trigger2 ON dbo.Employee
INSTEAD OF DELETE
AS
Begin
	--inserted/deleted a special table here which contains inserted data
	declare @empid int
	declare @name varchar(50)

	Select @empid = i.EmpID from deleted i;
	select @name = i.Name from deleted i;

	if(@empid = 1)
	BEGIN
		RAISERROR('Cannot delete where id is 1',16,1);
		ROLLBACK;
	End
	ELSE
	BEGIN
		delete from dbo.Employee where EmpID=@empid;
		COMMIT;
		insert into dbo.EmployeeAudit Select @empid,@name,getdate()
	END

END

delete from dbo.Employee where EmpID =1



-- Computed Column
--- Depnds on some calculation
--- You don't define its type if you make it computed at CREATE Table



-- A function which takes marks and returns CGPA
CREATE Function dbo.ComputeCGPA(
	@Marks int
)
Returns float
AS
Begin
	Declare @cgpa float = 0
	
	if(@Marks >= 85)
	begin
		set @cgpa = 4.0
	end
	else 
	begin
		set @cgpa = 3.5
	end

	return @cgpa
End




CREATE TABLE dbo.StudentMarks
(
	ID int identity(1,1) Primary key,
	SID int NOT NULL,
	SubjID int NOT NULL,
	Marks int Check (Marks >=0 AND Marks <=100),
	IsPassed as (dbo.ComputeCGPA(Marks))
)

/*
ALTER TABLE dbo.StudentMarks ADD IsPassed as (dbo.ComputeCGPA(Marks))
*/



Insert into dbo.StudentMarks(SID,SubjID,Marks) Values(1,1,78)

Select scope_identity()

Insert into dbo.StudentMarks(SID,SubjID,Marks) Values(1,1,85)

-- Update dbo.StudentMarks Set Marks = 90 where iD = 1

select * from dbo.StudentMarks




