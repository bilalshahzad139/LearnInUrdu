
-- VARIABLE Declaration, IF ELSE

DECLARE @age int = 10

SET @age = 20

DECLARE @name varchar(50)

SELECT @name = Name from dbo.Employee Where EmpID = 1

IF @name = 'User1'
BEGIN
	Select 'if part'
END
ELSE
BEGIN
	Select 'else' 
END

---- WHILE LOOP

DECLare @Count int = 1
DECLARE @SUM int = 0

WHILE @Count < 10
BEGIN
	SET @SUM = @SUM + @Count
	SET @Count = @Count + 1
END

SELECT @SUM


------- Table Variables

DECLARE @data Table(
ID int,
Name varchar(50)
)

insert into @data(ID,Name) Values(1,'User1')
insert into @data(ID,Name) Values(2,'User2')
insert into @data(ID,Name) Values(3,'User3')

Select * from @data








---------- Some useful built in functions
-- Built in functions

Select getdate()

--Max, Min, Avg, Count, Sum

-- T-SQl Function (Transact SQL)
select cast(1 as varchar) + 'abc'

SELECT CONVERT(int, 14.85);
SELECT CONVERT(datetime, '2014-05-02');

SELECT CONVERT(varchar, getdate(), 101);
SELECT CONVERT(varchar, getdate(), 102);
SELECT CONVERT(varchar, getdate(), 103);
SELECT CONVERT(varchar, getdate(), 108);





