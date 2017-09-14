
Use Lesson30;

/*------------- CASE 1 -----------------*/

BEGIN TRANSACTION mytran;
BEGIN TRY

	Insert into dbo.TestDB(Name) Select 'Name5'

	WAITFOR DELAY '00:00:20'

	Update dbo.TestDB SET EntryDate = getdate() Where ID = 3

	WAITFOR DELAY '00:00:07'

	Delete from dbo.TestDB Where ID = 1
	
	WAITFOR DELAY '00:00:07'

	COMMIT TRANSACTION mytran;
	print 'committed'
END TRY
BEGIN CATCH
	print 'rollbacked'
	ROLLBACK TRANSACTION mytran;
END CATCH


/*------------- CASE 2 -----------------*/

Update dbo.TestDB SET EntryDate = getdate() Where ID = 3
--Update dbo.TestDB SET EntryDate = getdate() Where ID = 2

/*------------- CASE 3 -----------------*/

Insert into dbo.TestDB(Name) Select 'Name5'

Delete from dbo.TestDB Where ID = 1

--Insert into dbo.TestDB(Name) Select 'Test1'


Select * from dbo.TestDB







----------------------

-- VIEW PENDING TRANSACTIONS
SELECT * FROM sys.dm_tran_active_transactions

ROLLBACK TRANSACTION tran1

SELECT
    trans.session_id AS [SESSION ID],
    ESes.host_name AS [HOST NAME],login_name AS [Login NAME],
    trans.transaction_id AS [TRANSACTION ID],
    tas.name AS [TRANSACTION NAME],tas.transaction_begin_time AS [TRANSACTION BEGIN TIME],
    tds.database_id AS [DATABASE ID],DBs.name AS [DATABASE NAME]
FROM sys.dm_tran_active_transactions tas
JOIN sys.dm_tran_session_transactions trans
ON (trans.transaction_id=tas.transaction_id)
LEFT OUTER JOIN sys.dm_tran_database_transactions tds
ON (tas.transaction_id = tds.transaction_id )
LEFT OUTER JOIN sys.databases AS DBs
ON tds.database_id = DBs.database_id
LEFT OUTER JOIN sys.dm_exec_sessions AS ESes
ON trans.session_id = ESes.session_id
WHERE ESes.session_id IS NOT NULL


--View snaphsot versions
select * from sys.dm_tran_active_snapshot_database_transactions 
select * from sys.dm_tran_version_store
select * from sys.dm_tran_transactions_snapshot