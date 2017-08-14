
-- CREATE VIEW viewname
-- ALTER VIEW viewname
-- DROP VIEW viewname

ALTER VIEW dbo.vwEmployee
AS
Select e.EmpID,e.Name,e.Salary,e.Gender,e.Age,Isnull(d.DeptName ,'') DeptName,c.CityName
from dbo.Employee e 
left join dbo.Department d on e.DID = d.DID
left join dbo.City c on e.CityID = c.CID
Where e.CityID = 1


Select * from dbo.vwEmployee





-- Indexed Views
Create view dbo.vwTestEmployee
With schemabinding
As
select EmpID,EmpName,DesigID from dbo.Employee



CREATE UNIQUE CLUSTERED INDEX IDEX_V1 ON dbo.vwTestEmployee (EmpID ASC)







Select * from INFORMATION_SCHEMA.TABLES
select * from INFORMATION_SCHEMA.COLUMNS Where TABLE_NAME = 'Department'
select * from [INFORMATION_SCHEMA].[ROUTINES]
select * from INFORMATION_SCHEMA.VIEWS

-- Show me counts of all tables in database

Select count(*) from dbo.Department

Select 'Select count(*) from ' + Table_Schema + '.' + TABLE_NAME 
from INFORMATION_SCHEMA.TABLES




select * from sys.objects where type = 'U'
select * from sys.all_columns where object_id = 277576027
select * from sys.columns
select * from [sys].[indexes]

SELECT * FROM sys.objects
WHERE type = 'PK' 
--and object_id = 373576369
AND  object_id = OBJECT_ID ('DID_PK')


SELECT * FROM sys.objects
WHERE type = 'PK' 
AND  parent_object_id  = OBJECT_ID ('department')

