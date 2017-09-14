Use Lesson30;

ALTER Database Lesson30 SET ALLOW_SNAPSHOT_ISOLATION ON


/**********-------------SNAPSHOT--------------***********/

/*
Problems:
Dirty Read: No
Non-Repeatable Read: No
Phanthom Read: No
*/

-- SNAPSHOT is just like serializable but it doesn't lock anything.
-- It keeps a copy of "selected" data in "tempdb"

/*
CASE 1:
--Start other transaction which will insert/delay/update/delay/delete
--During this, run following cases to show that dirty data (non-commmited) 
is not accessible and non-dirty is still accessible
---- Check with ID =1 (accessible)
---- Check with ID =2 (accessible)
---- Check with ID =4 (not accessible/blocking) (newly inserted record in transaction)
---- Check with ID =3 (accessible) (update is not run yet)
---- Check with ID =3 (not accessible/blocking) (update is run, row is in dirty state)
---- Check with ID =1 (not accessible/blocking) (row is in dirty state)
---- Check with all rows (not accessible as there is one or more rows are locked)

Result: Dirty Read is not allowed in 'SNAPSHOT'

*/

SET TRANSACTION ISOLATION LEVEL SNAPSHOT;
SELECT * FROM dbo.TestDB Where ID =1

SET TRANSACTION ISOLATION LEVEL SNAPSHOT;
SELECT * FROM dbo.TestDB Where ID =2

SET TRANSACTION ISOLATION LEVEL SNAPSHOT;
SELECT * FROM dbo.TestDB Where ID =4

--Run following transaction once before update & once after update
SET TRANSACTION ISOLATION LEVEL SNAPSHOT;
SELECT * FROM dbo.TestDB Where ID =3


SET TRANSACTION ISOLATION LEVEL SNAPSHOT;
SELECT * FROM dbo.TestDB 

-- repeatable read

/*
CASE - 2
-- Start following transaction in this window
-- This transaction will read row with ID = 3
-- When it is delay here, go to other window & update data there where ID=3.
but update will be blocked because this window transaction has applied lock
on this row

Result: Non-Repeatable read is not allowed in 'SNAPSHOT'.

*/

SET TRANSACTION ISOLATION LEVEL SNAPSHOT;
BEGIN TRANSAction tran1

SELECT * FROM dbo.TestDB Where ID IN (2,3)

WAITFOR DELAY '00:00:10'

SELECT * FROM dbo.TestDB Where ID IN (2,3)
commit TRANSAction tran1



/*
CASE - 3
-- Start following transaction in this window
-- This transaction will read all rows from table
-- When it is delay here, go to other window & insert/delete rows there.
-- Insert/delete will become blocking as this window transaction has locked 
the whole table

Result: Phanthom read is not allowed in 'SNAPSHOT'.

*/

SET TRANSACTION ISOLATION LEVEL SNAPSHOT;
BEGIN TRANSAction tran1


SELECT * FROM dbo.TestDB 

WAITFOR DELAY '00:00:10'

--Update dbo.TestDB SET EntryDate = getdate() Where ID = 3

SELECT * FROM dbo.TestDB 

commit TRANSAction tran1




