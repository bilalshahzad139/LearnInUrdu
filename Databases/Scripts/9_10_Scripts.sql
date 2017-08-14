

-- DML
/*

INSERT INTO table_name(columns)....... VALUES()
INSERT INtO table_name(columns)........ SELECT

DELTE FROM table_name WHERE ------

UPDATE table_name SET column_name = value, column_name = value WHERE ------

SELECT * FROM table_name WHERE ------

*/



-- DDL
/*

CREATE TABLE table_name(column_name type(size) NULL/NOT NULL )

ALTER TABLE table_name ADD column_name type(size) NULL/NOT NULL

ALTER TABLE table_name DROP COLUMN column_name

ALTER TABLE table_name ALTER COLUMN column_name type(size) NULL/NOT NULL
 
DROP TABLE table_name

TRUNCATE TABLE table_name

*/



-- CREATE

CREATE TABLE [dbo].[Users](
	[UserId] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Designation] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	Age tinyint
 CONSTRAINT [PK_Users_1] PRIMARY KEY CLUSTERED ([UserId] ASC)
)


Select * from dbo.Users



Insert into dbo.Users(UserId,Login,Password,Name,Designation,Email,Age)
Values(1,'user1','pass1','Bilal','Student','user1@yahoo.com',50)

Insert into dbo.Users(UserId,Login,Password,Name,Designation,Email,Age)
Values(2,'user2','pass1','Faisal','Student','user2@yahoo.com',60)

Insert into dbo.Users(UserId,Login,Password,Name,Designation,Email,Age)
Values(3,'user3','pass1','Waqas','Teacher','user3@yahoo.com',70)

Insert into dbo.Users(UserId,Login,Password,Name,Designation,Email,Age)
Select 4,'user4','pass1','Khurram','Teacher','user4@yahoo.com',80




Select * from dbo.Users



-- Update dbo.Users SET Email='user1new@yahoo.com', Login = 'user1new' Where UserId = 1


-- Delete from dbo.Users Where UserId = 1





ALTER Table dbo.Users add NIC varchar(20) NULL


ALTER Table dbo.Users drop column NIC 


ALTER Table dbo.Users alter column NIC varchar(50) NULL



DROP Table dbo.Users 


Truncate Table dbo.Users


