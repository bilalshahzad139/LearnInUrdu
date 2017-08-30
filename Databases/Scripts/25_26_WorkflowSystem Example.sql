/*
Requirements:
-- There will be two types of Employee
--- 1) Requester
--- 2) Approver 
-- There can be different types of a request.
-- Based on request type, different approvers can be there with defined order.
-- When a request will be created, it will be assigned to to first approver
-- A request status can be
--- In Progress, Approved, Rejected
-- For an approver, request can be "NotAssigned", "Pending", "Approved", "Rejected"
-- If an approver approve the request, status of next approver will become "Pending" from "NotAssigned"
-- When all approvers will aprove the request, status of request will become "Approved"
-- If any approver rejects the request, status of request will become "rejected". No further processing will be done.

*/

----------------------------------------------
CREATE TABLE dbo.RequestTypes
(
	RequestTypeID tinyint primary key,
	RequestType varchar(20) NOT NULL
);

INSERT INTO dbo.RequestTypes(RequestTypeID,RequestType) Values(1,'Leave')
INSERT INTO dbo.RequestTypes(RequestTypeID,RequestType) Values(2,'Inventory')
INSERT INTO dbo.RequestTypes(RequestTypeID,RequestType) Values(3,'Laptop')

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

CREATE TABLE dbo.RequestTypeApprovers
(
   ID int identity(1,1) primary key,
   RequestTypeID tinyint NOT NULL,
   ApproverID int NOT NULL, ---- Employee ID of approver
   ApprovalOrder tinyint
)

-- For Leave (Waqas,Faisal,Bisaam)
INSERT INTO dbo.RequestTypeApprovers(RequestTypeID,ApproverID,ApprovalOrder) Select 1,3,1
INSERT INTO dbo.RequestTypeApprovers(RequestTypeID,ApproverID,ApprovalOrder) Select 1,4,2
INSERT INTO dbo.RequestTypeApprovers(RequestTypeID,ApproverID,ApprovalOrder) Select 1,5,3

-- For Leave (Waqas,Faisal)
INSERT INTO dbo.RequestTypeApprovers(RequestTypeID,ApproverID,ApprovalOrder) Select 2,3,1
INSERT INTO dbo.RequestTypeApprovers(RequestTypeID,ApproverID,ApprovalOrder) Select 2,4,2

-- For Laptop (Khurram, Yousaf)
INSERT INTO dbo.RequestTypeApprovers(RequestTypeID,ApproverID,ApprovalOrder) Select 3,1,1
INSERT INTO dbo.RequestTypeApprovers(RequestTypeID,ApproverID,ApprovalOrder) Select 3,6,2

----------------------------------------------


CREATE TABLE dbo.Requests
(
	RequestID int identity(1,1) primary key,
	RequestType tinyint NOT NULL, --- 
	RequestTitle varchar(100) NOT NULL,
	RequesterID int NOT NULL, ----- Employee id of requester
	CreatedOn datetime NOT NULL,
	RequestStatus tinyint NOT NULL, ------ 1=InProgress, 2=Approved, 3=Rejected
	LastModifiedOn datetime
)


----------------------------------------------

CREATE TABLE dbo.RequestWorkFlow
(
	WorkFlowID bigint identity(1,1) primary key,
	RequestID int,
	ApproverID int,
	ApprovalOrder tinyint,
	WorkFlowStatus tinyint,  ----------- 1= "Pending", 2= "Approved", 3= "Rejected", 4= "NotAssigned"
	LastModifiedOn datetime,
	Remarks varchar(100)
)



----------------------------------------------


CREATE Procedure dbo.CreateNewRequest
	@RequestType tinyint,
	@RequestTitle varchar(100),
	@UserId int -- Employee Id (requester)
AS 
BEGIN
	
	--Declare @RequestType tinyint = 1
	--Declare @RequestTitle varchar(100)= 'hello world'
	--Declare @UserId int = 1

	declare @RequestID int
	
	--STEP 1: Add New Request
	INSERT INTO dbo.Requests(RequestType,RequestTitle,RequesterID,CreatedOn,RequestStatus)
	Select @RequestType,@RequestTitle,@UserId, getdate(), 1 --- 1 mean InProgress

	SELECT @RequestID = SCOPE_IDENTITY()
	
	--STEP 2: Get Approver for this request type and add in Workflow Table
	INSERT INTO dbo.RequestWorkFlow(RequestID,ApproverID,ApprovalOrder,LastModifiedOn,WorkFlowStatus)
	Select 	@RequestID, ApproverID, ApprovalOrder,getdate(), 4            --- 4 mean NotAssigned
	FROM dbo.RequestTypeApprovers Where RequestTypeID = @RequestType
	Order by ApprovalOrder ASC;

	--STEP 3: Find first approver and made its status to 1= PENDING 
	/*Here we are using CTE with Row_number function. We need record where RowNumber =1*/
	WITH d AS 
	(
		SELECT WorkFlowStatus,LastModifiedOn, ROW_NUMBER() Over(order by ApprovalOrder ASC) RowNumber 
		FROM dbo.RequestWorkFlow Where RequestID = @RequestID
	)
	Update d SET WorkFlowStatus = 1,LastModifiedOn =getdate()
	Where  d.RowNumber = 1

	/*Return Auto generated Request ID */
	Select @RequestID

END

/*
Execute dbo.CreateNewRequest 1,'new request',2

Select * from dbo.Requests Where RequestID =3
Select * from dbo.RequestWorkFlow Where RequestID =3

*/


----------------------------------------------

-- EXECUTE dbo.ApproveRejectRequest 3,4,3,'TESTING'
-- UPDATE dbo.RequestWorkFlow SET WORKFLOWSTATUS = 1 WHERE WORKFLOWID = 3

ALTER Procedure dbo.ApproveRejectRequest
	@RequestID int,
	@ApproverID int,
	@WorkFlowStatus tinyint,
	@Remarks varchar(100)
AS 
BEGIN

	Declare @WorkFlowID bigint

	--STEP 1: Find workflow ID for which we need to update status
	/* Relevant request for this approver and in pending state */
	SELECT @WorkFlowID = WorkFlowID 
	FROM dbo.RequestWorkFlow 
	Where RequestID = @RequestID and ApproverID = @ApproverID and WorkFlowStatus = 1


	--STEP 2: Check if a value came in our variable
	IF ISNULL(@WorkFlowID,0) > 0  AND (@WorkFlowStatus = 2 OR @WorkFlowStatus =3)
	BEGIN
		-- Current user is doing eligible to change status of this workflow entry

		-- STEP 3: Update status of current workflow
		Update RequestWorkFlow 
			SET WorkFlowStatus = @WorkFlowStatus,
			LastModifiedOn =getdate(),
			Remarks = @Remarks
		Where WorkFlowID = @WorkFlowID

		-- Check if user has rejected or accepted it

		if @WorkFlowStatus = 2 -- Approved
		BEGIN
			-- Update status for next approver if any
			WITH d AS 
			(
				SELECT WorkFlowStatus,LastModifiedOn, ROW_NUMBER() Over(order by ApprovalOrder ASC) RowNumber 
				FROM dbo.RequestWorkFlow Where RequestID = @RequestID and WorkFlowStatus =4
			)
			Update d SET WorkFlowStatus = 1,LastModifiedOn =getdate()
			Where  d.RowNumber = 1

			--Check if there is no entry pending in workflow status
			IF(Select COUNT(*) from dbo.RequestWorkFlow 
				where RequestID = @RequestID and WorkFlowStatus IN (1,4)) = 0
			BEGIN
				Update dbo.Requests SET RequestStatus = 2,LastModifiedOn = getdate()
				Where RequestID = @RequestID
			END

		END
		ELSE  --means rejected case
		BEGIN
			-- All remaining unassigned workflows will becomed rejected
			Update dbo.RequestWorkFlow 
				SET WorkFlowStatus = 3, --rejected
				LastModifiedOn =getdate(),
				Remarks = 'because someone rejected'
			Where RequestID = @RequestID and WorkFlowStatus = 4  --notassigned
			
			-- update request status
			Update dbo.Requests 
				SET RequestStatus = 3, --rejected
				LastModifiedOn = getdate()
			Where RequestID = @RequestID
		END
	END
	ELSE   -- Input parameters are invalid
	BEGIN
		Select -1   --or anything else to tell user that it is invalid try
	END


END


----------------------------------------------

execute dbo.SearchRequest 0,'',0,'1900-01-01','2099-01-01'

CREATE Procedure dbo.SearchRequest
	@RequestType tinyint,
	@RequestTitle varchar(50),
	@RequestStatus tinyint,
	@StartDate date,
	@EndDate date
AS
BEGIN
	Select * from dbo.Requests
	Where RequestType = (case when @RequestType > 0 then @RequestType else RequestType end)
	And RequestTitle Like '%' + @RequestTitle + '%'
	And RequestStatus = (case when @RequestStatus > 0 then @RequestStatus else RequestStatus end)
	And CreatedOn between @StartDate and @EndDate
END

----------------------------------------------

