/*
Requirements: 
--------------- Schedule Management for employees -------------------
- Schedule (Start Time, End Time) [e.g. 9:00 am - 6:00 pm]
- Each Schedule will have some activities (Break, Lunch, Training etc.) other than working part
- For example (Break: 11:00 - 11:15, Lunch: 13:00-13:30, Break: 16:00 - 16:15)


Now We've another external system
 - it contains all data in form of activities (Working, Break, Lunch, Training etc.)
 - Note here 'working' time will be an activity 
 - To express same schedule data we discussed above, we'll have following activities here
 - 9:00 - 11:00 (working)
 - 11:00 - 11:15 (Break)
 - 11:15 - 13:00 (working)
 - 13:00 - 13:30 (Lunch)
 - 13:30 - 16:00 (working)
 - 16:00 - 16:15 (break)
 - 16:15 - 18:00 (working)

*/



---*************************************************************
---*************************************************************
---*************************************************************
---*************************************************************

--------------------- External DB --------------------

Create database ExternalDB;

Use ExternalDB;

CREATE TABLE dbo.PlannedActivities
(
	ID int identity(1,1) primary key,
	EmployeeID int,
	ActivityName varchar(100),
	ScheduleDate date,
	StartDate datetime,
	EndDate datetime
)

--Schedule for 1, 9-6, 11-11:15 Break, 1:00-1:30 (Lunch), 4:00-4:15 Break
INSERT INTO dbo.PlannedActivities(EmployeeID,ActivityName,ScheduleDate,StartDate,EndDate) SELECT 1,'Working','2017-08-30','2017-08-30 9:00','2017-08-30 11:00'
INSERT INTO dbo.PlannedActivities(EmployeeID,ActivityName,ScheduleDate,StartDate,EndDate) SELECT 1,'Break','2017-08-30','2017-08-30 11:00','2017-08-30 11:15'
INSERT INTO dbo.PlannedActivities(EmployeeID,ActivityName,ScheduleDate,StartDate,EndDate) SELECT 1,'Working','2017-08-30','2017-08-30 11:15','2017-08-30 13:00'
INSERT INTO dbo.PlannedActivities(EmployeeID,ActivityName,ScheduleDate,StartDate,EndDate) SELECT 1,'Lunch','2017-08-30','2017-08-30 13:00','2017-08-30 13:30'
INSERT INTO dbo.PlannedActivities(EmployeeID,ActivityName,ScheduleDate,StartDate,EndDate) SELECT 1,'Working','2017-08-30','2017-08-30 13:30','2017-08-30 16:00'
INSERT INTO dbo.PlannedActivities(EmployeeID,ActivityName,ScheduleDate,StartDate,EndDate) SELECT 1,'Break','2017-08-30','2017-08-30 16:00','2017-08-30 16:15'
INSERT INTO dbo.PlannedActivities(EmployeeID,ActivityName,ScheduleDate,StartDate,EndDate) SELECT 1,'Working','2017-08-30','2017-08-30 16:15','2017-08-30 18:00'


--Schedule for 2, 9-6, 11-11:15 Break, 1:00-1:30 (Lunch), 4:00-4:15 Break
INSERT INTO dbo.PlannedActivities(EmployeeID,ActivityName,ScheduleDate,StartDate,EndDate) SELECT 2,'Working','2017-08-30','2017-08-30 9:00','2017-08-30 11:00'
INSERT INTO dbo.PlannedActivities(EmployeeID,ActivityName,ScheduleDate,StartDate,EndDate) SELECT 2,'Break','2017-08-30','2017-08-30 11:00','2017-08-30 11:15'
INSERT INTO dbo.PlannedActivities(EmployeeID,ActivityName,ScheduleDate,StartDate,EndDate) SELECT 2,'Working','2017-08-30','2017-08-30 11:15','2017-08-30 13:00'
INSERT INTO dbo.PlannedActivities(EmployeeID,ActivityName,ScheduleDate,StartDate,EndDate) SELECT 2,'Lunch','2017-08-30','2017-08-30 13:00','2017-08-30 13:30'
INSERT INTO dbo.PlannedActivities(EmployeeID,ActivityName,ScheduleDate,StartDate,EndDate) SELECT 2,'Working','2017-08-30','2017-08-30 13:30','2017-08-30 16:00'
INSERT INTO dbo.PlannedActivities(EmployeeID,ActivityName,ScheduleDate,StartDate,EndDate) SELECT 2,'Break','2017-08-30','2017-08-30 16:00','2017-08-30 16:15'
INSERT INTO dbo.PlannedActivities(EmployeeID,ActivityName,ScheduleDate,StartDate,EndDate) SELECT 2,'Working','2017-08-30','2017-08-30 16:15','2017-08-30 18:00'


--Schedule for 3, 18:00-3:00, 20:00-20:15 Break, 22:00-22:30 (Lunch), 1:00-1:15 Break
INSERT INTO dbo.PlannedActivities(EmployeeID,ActivityName,ScheduleDate,StartDate,EndDate) SELECT 3,'Working','2017-08-30','2017-08-30 18:00','2017-08-30 20:00'
INSERT INTO dbo.PlannedActivities(EmployeeID,ActivityName,ScheduleDate,StartDate,EndDate) SELECT 3,'Break','2017-08-30','2017-08-30 20:00','2017-08-30 20:15'
INSERT INTO dbo.PlannedActivities(EmployeeID,ActivityName,ScheduleDate,StartDate,EndDate) SELECT 3,'Working','2017-08-30','2017-08-30 20:15','2017-08-30 22:00'
INSERT INTO dbo.PlannedActivities(EmployeeID,ActivityName,ScheduleDate,StartDate,EndDate) SELECT 3,'Lunch','2017-08-30','2017-08-30 22:00','2017-08-30 22:30'
INSERT INTO dbo.PlannedActivities(EmployeeID,ActivityName,ScheduleDate,StartDate,EndDate) SELECT 3,'Working','2017-08-30','2017-08-30 22:30','2017-08-31 1:00'
INSERT INTO dbo.PlannedActivities(EmployeeID,ActivityName,ScheduleDate,StartDate,EndDate) SELECT 3,'Break','2017-08-30','2017-08-31 1:00','2017-08-31 1:15'
INSERT INTO dbo.PlannedActivities(EmployeeID,ActivityName,ScheduleDate,StartDate,EndDate) SELECT 3,'Working','2017-08-30','2017-08-31 1:15','2017-08-31 3:00'

-- truncate table dbo.PlannedActivities
select * from ExternalDB.dbo.PlannedActivities


/*---------- Get Total Time of all activities-----------*/

-- STEP 1: Get query to get activities
Select * from dbo.PlannedActivities

-- Step 2: Get time of each activity (Enddate - startdate) in minutes
Select Datediff(MINUTE,startdate,enddate),startdate,enddate from dbo.PlannedActivities

-- Step 3: Get sum of all differences
Select Sum(Datediff(MINUTE,startdate,enddate)) as TotalSum from dbo.PlannedActivities


/*---------- Get Total Time activity wise -----------*/
Select ActivityName, Sum(Datediff(MINUTE,startdate,enddate)) as TotalSum 
from dbo.PlannedActivities
group by ActivityName


/*---------- Get Total Time activity wise for each employee -----------*/
Select EmployeeID,ActivityName, Sum(Datediff(MINUTE,startdate,enddate)) as TotalSum 
from dbo.PlannedActivities
group by EmployeeID, ActivityName
order by EmployeeID

----------------------------------------------



---*************************************************************
---*************************************************************
---*************************************************************
---*************************************************************



CREATE DATABASE ScheduleManagement;
USE ScheduleManagement;



----------------------------------------------
CREATE TABLE dbo.ActivityType
(
ActivityTypeID tinyint primary key,
ActivityType varchar(20)
)

INSERT INTO dbo.ActivityType(ActivityTypeID,ActivityType) VALUES(1,'Break')
INSERT INTO dbo.ActivityType(ActivityTypeID,ActivityType) VALUES(2,'Lunch')
INSERT INTO dbo.ActivityType(ActivityTypeID,ActivityType) VALUES(3,'Training')

----------------------------------------------

CREATE TABLE dbo.Employees
(
	EmpID int primary key,
	EmpName varchar(50) NOT NULL,
	Email varchar(30) NOT NULL
)

INSERT INTO dbo.Employees(EmpID,EmpName,Email) Values(1,'Khurram','user1@learninginurdu.com.pk')
INSERT INTO dbo.Employees(EmpID,EmpName,Email) Values(2,'Bilal','user2@learninginurdu.com.pk')
INSERT INTO dbo.Employees(EmpID,EmpName,Email) Values(3,'Waqas','user3@learninginurdu.com.pk')
INSERT INTO dbo.Employees(EmpID,EmpName,Email) Values(4,'Faisal','user4@learninginurdu.com.pk')
INSERT INTO dbo.Employees(EmpID,EmpName,Email) Values(5,'Bisaam','user5@learninginurdu.com.pk')
INSERT INTO dbo.Employees(EmpID,EmpName,Email) Values(6,'Yousaf','user6@learninginurdu.com.pk')

----------------------------------------------

CREATE TABLE dbo.Schedules
(
ScheduleID bigint identity(1,1) primary key,
EmployeeID int NOT NULL,
ScheduleDate date NOT NULL,
StartTime datetime,
EndTime datetime
)

----------------------------------------------

CREATE TABLE dbo.ScheduleActivities
(
SchActID bigint identity(1,1) primary key,
ScheduleID bigint,
ActivityTypeID tinyint,
StartTime datetime,
EndTime datetime
)

----------------------------------------------


---*************************************************************
---*************************************************************
---*************************************************************
---*************************************************************

/*----------------------------- Import data from externaldb to our main db ------------------------------- */

/*
Tasks:

 - Find a schedule (start, end time) from 'activities' of external db
 - Find non-working activities from external db
*/



SELECT EmployeeID,ScheduleDate,Min(StartDate),Max(EndDate) 
FROM ExternalDB.dbo.PlannedActivities
Group by EmployeeID,ScheduleDate

-- But what about load data in temp table and use that for schedules & activities

Create Table #TempActvities
(
	EmployeeID int,
	ActivityName varchar(100),
	ScheduleDate date,
	StartDate datetime,
	EndDate datetime
)

INSERT INTO #TempActvities(EmployeeID,ActivityName,ScheduleDate,StartDate,EndDate)
SELECT EmployeeID,ActivityName,ScheduleDate,StartDate,EndDate
FROM ExternalDB.dbo.PlannedActivities
-- where claus to filter if required



SELECT EmployeeID,ScheduleDate,Min(StartDate),Max(EndDate) 
FROM #TempActvities
Group by EmployeeID,ScheduleDate


-------------- Now ADD schedules in schedule table
INSERT INTO dbo.Schedules(EmployeeID,ScheduleDate,StartTime,EndTime)
SELECT EmployeeID,ScheduleDate,Min(StartDate),Max(EndDate) 
FROM #TempActvities
Group by EmployeeID,ScheduleDate 



-------------------------Schedule Activity Task

Select * from dbo.ActivityType

-- Now remove 'working' actitivties from #TempActvities
Delete from #TempActvities where ActivityName = 'Working'

--Update activities with their IDs (from our system)
Update  #TempActvities SET ActivityName = '1' where ActivityName = 'Break'
Update  #TempActvities SET ActivityName = '2' where ActivityName = 'Lunch'
Update  #TempActvities SET ActivityName = '3' where ActivityName = 'Training'


Select * from #TempActvities
select * from dbo.Schedules


Select s.ScheduleID,t.StartDate,t.EndDate,t.ActivityName 
from #TempActvities t INNER JOIN dbo.Schedules s on t.ScheduleDate = s.ScheduleDate and t.EmployeeID = s.EmployeeID


-------------- Now ADD schedule Activities in schedule table
INSERT INTO dbo.ScheduleActivities(ScheduleID,StartTime,EndTime,ActivityTypeID)
Select s.ScheduleID,t.StartDate,t.EndDate,t.ActivityName 
from #TempActvities t INNER JOIN dbo.Schedules s on t.ScheduleDate = s.ScheduleDate and t.EmployeeID = s.EmployeeID



SELECT * FROM dbo.ScheduleActivities


------ Query to pick Schedule, Employee, Activities details
SELECT s.ScheduleID,s.EmployeeID, e.EmpName, s.ScheduleDate,s.StartTime,
s.EndTime, at.ActivityType, sa.StartTime as ActStartTime, sa.EndTime as ActEndTime
FROM dbo.Schedules s 
left join dbo.ScheduleActivities sa on s.ScheduleID = sa.ScheduleID
inner join dbo.ActivityType at on sa.ActivityTypeID = at.ActivityTypeID
inner join dbo.Employees e on s.EmployeeID = e.EmpID


---- View Creation for above query to help you

CREATE VIEW dbo.EmpSchedWithActivities
AS
	SELECT s.ScheduleID,s.EmployeeID, e.EmpName, s.ScheduleDate,s.StartTime,
	s.EndTime, at.ActivityType, sa.StartTime as ActStartTime, sa.EndTime as ActEndTime
	FROM dbo.Schedules s 
	left join dbo.ScheduleActivities sa on s.ScheduleID = sa.ScheduleID
	inner join dbo.ActivityType at on sa.ActivityTypeID = at.ActivityTypeID
	inner join dbo.Employees e on s.EmployeeID = e.EmpID



