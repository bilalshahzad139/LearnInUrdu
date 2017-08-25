-- Book Indexes, Table of Contents
-- Dictionary, Telephone Directory

-- Search a word 'Table' in book


-- Heap Table (A table without a index. Data will be stored in an unordered way)
-- Indexed Table (Index is applied on table and data is stored in some order)

-- Table Scan
-- Indexes (Clustered index vs. Non-Clustered Index)

-- B-Tree (Balanced Tree) Data Structure


-- No Primary Key
Create Table dbo.Users(ID int , Name varchar(30))


Declare @count int =50000
Declare @i int = 1
While @i <= @count	
begin
	insert into dbo.Users(ID,Name) Select @i, 'user' + cast(@i as varchar)
	set @i = @i + 1
end



select * from dbo.Users Where ID = 15121


CREATE CLUSTERED INDEX cl_ind_users ON dbo.Users(ID)

CREATE Nonclustered index ncl_ind_users ON dbo.Users(Name)

-- There are many other indexes in SQL Server (XML indexes, Hash indexes, Spatial Indexes)


select object_name(object_id),* from sys.indexes 
where object_name(object_id) = 'Users'

-- DROP INDEX cl_ind_users ON dbo.Users
-- DROP INDEX ncl_ind_users ON dbo.Users

-- App primary key from designer
-- Create Table dbo.Users(ID int primary key, Name varchar(30))

/*

Create Table dbo.Users(
ID int , 
Name varchar(30)
CONSTRAINT [PK_Users_1] PRIMARY KEY CLUSTERED ([ID] ASC)
)


-- DROP Table dbo.Users
*/
