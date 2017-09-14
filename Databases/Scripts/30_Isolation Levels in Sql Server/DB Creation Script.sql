
-- Create database
-- CREATE Database Lesson30;
Use Lesson30;


-- Check & drop table
IF (EXISTS (SELECT * 
		FROM INFORMATION_SCHEMA.TABLES 
		WHERE TABLE_SCHEMA = 'dbo' 
		AND  TABLE_NAME = 'TestDB'))
BEGIN
   DROP Table dbo.TestDB
END

-- Create table
CREATE Table dbo.TestDB
(
	ID int identity(1,1) primary key,
	Name varchar(20) NOT NULL,
	EntryDate datetime default(getdate())
)

INSERT INTO dbo.TestDB(Name)
Select 'Test1' UNION ALL
Select 'Test2' UNION ALL
Select 'Test3'

Select * from dbo.TestDB
 