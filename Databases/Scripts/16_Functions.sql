
CREATE Function dbo.CompueteTax(
	@Salary int
)
Returns float
AS
Begin
	Declare @taxRate float = 0
	IF @Salary >= 700
	BEGIN
		SET @taxRate = 5
	END
	ELSE IF @Salary >= 500
	BEGIN
		SET @taxRate = 4
	END
	ELSE IF @Salary >= 300
	BEGIN
		SET @taxRate = 3
	END
	ELSE
	BEGIN
		SET @taxRate = 2
	END

	return @taxrate
End

--select dbo.CompueteTax(500)

select * from dbo.Employee
 select EmpID,Name,Salary,(Salary*dbo.CompueteTax(salary)/100) As Tax 
 from dbo.Employee


 -- Table Valued Function (Inline version)
CREATE function dbo.GetEmployee(
@CityId int
)
RETURNS TABLE 
AS
Return(	
	--Here only single statement is allowed 
	select * from dbo.Employee where cityid = @CityId
)



Select * from dbo.GetEmployee(1)


-- Table Valued function (multi statement)

CREATE function dbo.GetTestData(

)
returns 
@mytable Table(
	id int,
	name varchar(20)
)
As
Begin
	insert into @mytable values(1,'user1')
	insert into @mytable values(2,'user2')
	insert into @mytable values(3,'user3')

	return 
end


select * from dbo.GetTestData()
