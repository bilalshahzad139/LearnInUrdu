
/*
CREATE PROCEDURE spname 
 variables declaration
AS
BEGIN

END

 
-- ALTER PROCEDURE spname

-- DROP PROCEDURE spname





--EXECUTE spname parameters


*/

CREATE PROCEDURE dbo.GetEmployeeById
	@eid int
AS 
BEGIN
	Select * from dbo.Employee where EmpID = @eid
End



Execute dbo.GetEmployeeById 1



--Drop procedure dbo.GetEmployeeById
