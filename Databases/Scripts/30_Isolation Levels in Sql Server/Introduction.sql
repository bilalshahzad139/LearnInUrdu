/*

Transactions specify an ISOLATION LEVEL that defines 
the degree to which one transaction 
must be isolated from resource or 
data modifications made by other transactions. 

Isolation levels are described in terms of 
which concurrency side-effects, such as dirty reads 
or non-repeatable read or phantom reads, are allowed.

-- SINGLE Statement Transaction
-- Multi Statement Transaction

How Transaction is created in SQL Server
----------------
BEGIN TRANSACTION [name]
COMMIT TRNASACTION [name]
ROLLBACK TRANSACTION [name]



-- Concurrent Transactions
-- Concurrency Problems

DIRTY READ
--------------------
Data changes during transaction 
& transaction is not completed yet.


NON-REPEATABLE READ
----------------------
During transaction, a row is retrieved twice 
and the values within the row differ between reads.

PHANTOM READ:  
----------------
Two identical queries are executed, and the collection 
of rows returned by the second query is different from the first. 



To understand ISOLATION Levels, think about 
----------------
1) Can your transaction read dirty data of other transactions?
2) What level of Lock you want to apply (on selected data only or Table level)



ISOLATION LEVELS
----------------
-- Read Uncommitted     (Dirty Read, Non-Repeatable Read, Phanthom Read)
-- Read Committed       (Non-Repeatable Read, Phanthom Read)
-- Repeatable Read      (Phanthom Read)
-- Serializable         
-- Snapshot             (similar to serializable but no blocking)



Default Isolation level in SQL Server: READ COMMITTED

-- SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
-- SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- SET TRANSACTION ISOLATION LEVEL SNAPSHOT;

-- with(nolock) is same "READ UNCOMMITTED"


*/


