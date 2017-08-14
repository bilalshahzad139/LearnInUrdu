/*
 Temp tables
 - For intermediate results when processing data

 1) Local Temp Tables
 2) Global Temp Tables
 3) Table Variables


*/

/*
Local Temp Tables 
 - Prefixed with #
 - Created in "tempdb" database
 - Scope is session based. 
 - Automatically deleted once session ends
 - You may load specific data in temp table to use it during your processing
*/
CREATE TAble #Table1
(
	ID int Primary key,
	Name varchar(50)
)

select * from #Table1

insert into #Table1(ID,Name) Values(1,'Bilal')

drop table #Table1

-- You should drop temp table at end of your program
-- But you should also check if table exits before dropping

IF( OBJECT_ID('tempdb..#Table1') is NOT NULL)
BEGIN
	drop table #Table1
END




/* ---------------------------------
 Global Temp Tables
 - Just like Local Temp Tables
 - Prefixed with ##
 - Created in "tempdb" database
 - Scope is global. Same temp table can be accessed by different "sessions"
 - Automatically is deleted once session ends
 ------------------------------------*/


 Create TABLE ##Test
 (
	ID int, 
	Name varchar(50)
	constraint test_1 primary key clustered (ID Asc)
 )

 select * from ##Test

 
 drop table ##Test

-- You should drop temp table at end of your program
-- But you should also check if table exits before dropping

IF( OBJECT_ID('tempdb..##Test') is NOT NULL)
BEGIN
	drop table #Table1
END


use TestDB
Select * into #Table2 From dbo.Employee
drop table #Table2




-- check detail of temporary table
 use tempdb
 execute sp_help #Table1




/* --- Accessing Temp table from SP ---- */

CREATE TAble #Table1
(
	ID int Primary key,
	Name varchar(50)
)

 select * from #Table1

 execute dbo.TestTblVariable

CREATE PROCEDURE dbo.TestTblVariable
	
AS
BEGIN
	insert into #Table1 select 1,'bilal'
END
GO




/* ---------------------------------
 Table Variable
 - Prefixed with @
 - Created in memory (if enough memory is available) otherwise in tempdb
 - Automatically is deleted once current execution scope ends
 - Can't be accessed by called SPs/Function during the execution
 - Can be passed to SP or function as 'Table valued Parameter'
 - In SQL Server 2014, Memory Optimized Table Variables, don't use tempdb
 
 ------------------------------------*/

 Declare @data Table(ID int, Name varchar(50))
 
 insert into @data(ID,Name) values(1,'bilal');
 insert into @data(ID,Name) values(2,'bilal');
 insert into @data(ID,Name) values(3,'bilal');

 select count(*) from @data
 GO
 select * from @data



 --Passing Table variable as Table valued parameter
 /*
 Step-1: Create a User Defined Type with structure of your Table 
 Step-2: Use this type as parameter type in your SP/Function
 Step-3: Create variable of defined type and pass that to SP/Function. It will be 'call by reference'.

 */

 -- Step 1
 CREATE TYPE MyData AS TABLE
 (
  ID int,
  Name varchar(20)
 )


-- Step 2

Create Procedure dbo.MyTestSP
	@d MyData Readonly
As 
begin
	select * from @d
end

-- Step 3 (This is your processing logic)

 Declare @data As MyData
 
 insert into @data(ID,Name) values(1,'bilal');

 execute dbo.MyTestSP @data


 -- Note: You can also pass a "DataTable" object from .NET code while calling this SP 