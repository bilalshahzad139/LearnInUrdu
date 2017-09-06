


SELECT top 100 * from [dbo].[NAResults]
SELECT * from [dbo].[NationalAssemblies]
SELECT top 100 * from [dbo].[PAResults]
SELECT top 10 * from [dbo].[ProvincialAssemblies]

/*------------National Assembly data analysis -------------*/

-----------------1) FIND TOTAL POLLED VOTES
SELECT SUM(VotesPolled) FROM [dbo].[NAResults]


-----------------2) FIND TOTAL POLLED VOTES 'NA' wise
SELECT NANumber, SUM(VotesPolled) as TotalVotesPolled 
FROM [dbo].[NAResults]
Group by NANumber
Order by TotalVotesPolled desc


-----------------3) Find total votes party got

SELECT PartyAffliation, SUM(VotesPolled) as TotalVotesPolled 
FROM [dbo].[NAResults]
Group by PartyAffliation
Order by TotalVotesPolled desc


-----------------4) Find each party "standing"/position in each consit
SELECT ContCandidate,PartyAffliation,NANumber,VotesPolled, 
		ROW_NUMBER() over(partition by NANumber order by VotesPolled desc) as RowNumber
	FROM  [dbo].[NAResults]



-----------------5) Winner of each NA
--Partition the data by NA, highest vote should have row number =1 then pick first record from each partition
WITH d AS
(
	SELECT ContCandidate,PartyAffliation,NANumber,VotesPolled, 
		ROW_NUMBER() over(partition by NANumber order by VotesPolled desc) as RowNumber
	FROM  [dbo].[NAResults]
)
Select ContCandidate,PartyAffliation,NANumber,VotesPolled 
from d where RowNumber = 1



-----------------6) Find total seats by party wise
WITH d AS
(
	SELECT ContCandidate,PartyAffliation,NANumber,VotesPolled, 
		ROW_NUMBER() over(partition by NANumber order by VotesPolled desc) as RowNumber
	FROM  [dbo].[NAResults]
)
Select PartyAffliation, count(*) as Seats
from d where RowNumber = 1 
group by PartyAffliation
order by Seats desc



-----------------7) For how many seats a party contested

select PartyAffliation,count(*) CT
from [dbo].[NAResults] 
group by PartyAffliation
order by CT desc



-----------------8) Find seats won by each party and for consti party contested
WITH d AS
(
	SELECT ContCandidate,PartyAffliation,NANumber,VotesPolled, 
		ROW_NUMBER() over(partition by NANumber order by VotesPolled desc) as RowNumber
	FROM  [dbo].[NAResults]
)
Select PartyAffliation, count(*) SeatsContested, SUM(case when RowNumber = 1 then 1 else 0 end ) as SeatsWon
from d 
group by PartyAffliation
order by SeatsWon desc


-----------------9) Find Registered Votes, PolledVotes NA wise ---------------------

Select top 1000 * from 
[dbo].[NationalAssemblies] na left join [dbo].[NAResults] n on na.NANumber = n.NANUMBER



Select top 1000 na.*, 
(select sum(votespolled) from [dbo].[NAResults] where NANumber = na.NANumber) as TotVotesPolled 
 from 
[dbo].[NationalAssemblies] na 
order by NANumber
--order by cast(Replace(NANumber,'NA-','') as int) asc


-----------------10)NA: Total votes registered, Total Votes Polled
Select top 1000 * from 
[dbo].[NationalAssemblies] na left join [dbo].[NAResults] n on na.NANumber = n.NANUMBER


Select sum(registeredvoters)as RegVoters, Sum(n.votespolled) as TotVotePolled from 
[dbo].[NationalAssemblies] na 
left join [dbo].[NAResults] n on na.NANumber = n.NANUMBER


-- By drived table approach
--Select na.NANumber, na.RegisteredVoters, t.VPoll from 
Select Sum(na.RegisteredVoters), Sum(t.VPoll) from 
[dbo].[NationalAssemblies] na 
left join (Select NANumber,Sum(VotesPolled) VPoll from [dbo].[NAResults] group by NANumber) As t
on na.NANumber = t.NANumber


-- By using Sum query approach
select (Select sum(registeredvoters)  from [dbo].[NationalAssemblies]) as RegVoters,
(Select Sum(votespolled) from [dbo].[NAResults]) as TotVotePolled




-----------------11) Find NA seats where winner has less votes as compared to all oponents collective votes

WITH d AS
(
	SELECT ContCandidate,PartyAffliation,NANumber,VotesPolled, 
		ROW_NUMBER() over(partition by NANumber order by VotesPolled desc) as RowNumber
	FROM  [dbo].[NAResults]
)
Select NANumber, sum(case when RowNumber = 1 then VotesPolled else 0 end) As NWinnerVotes,
	sum(case when RowNumber != 1 then VotesPolled else 0 end) as OtherVotes
from d 
group by NANumber
having sum(case when RowNumber = 1 then VotesPolled else 0 end) < sum(case when RowNumber != 1 then VotesPolled else 0 end)





/*------------Provincial Assembly data analysis -------------*/


SELECT top 10 * from [dbo].[ProvincialAssemblies]
SELECT top 100 * from [dbo].[PAResults]

-----------------1) Find types of Provincial assemblies
Select distinct PANumber from [dbo].[ProvincialAssemblies]
Select distinct Left(PANumber,2) from [dbo].[ProvincialAssemblies]


-----------------2) Find count of seats province wise
Select count(*) from [dbo].[ProvincialAssemblies] Where PANumber Like 'PB%'
Select count(*) from [dbo].[ProvincialAssemblies] Where PANumber Like 'PK%'
Select count(*) from [dbo].[ProvincialAssemblies] Where PANumber Like 'PP%'
Select count(*) from [dbo].[ProvincialAssemblies] Where PANumber Like 'PS%'

-- by using group by
Select Left(PANumber,2), count(*) 
from [dbo].[ProvincialAssemblies]
group by Left(PANumber,2)


-----------------3) Find standing/position of each party seat wise
SELECT ContCandidate,PartyAffliation,PANumber,VotesPolled, 
		ROW_NUMBER() over(partition by PANumber order by VotesPolled desc) as RowNumber
	FROM  [dbo].[PAResults]




-----------------4) Find each party seats province wise
WITH d AS
(
	SELECT ContCandidate,PartyAffliation,PANumber,VotesPolled, 
		ROW_NUMBER() over(partition by PANumber order by VotesPolled desc) as RowNumber
	FROM  [dbo].[PAResults]
)
Select PartyAffliation,Left(PANumber,2), count(*) SeatsContested, SUM(case when RowNumber = 1 then 1 else 0 end ) as SeatsWon
from d 
group by PartyAffliation,Left(PANumber,2)
order by Left(PANumber,2), SeatsWon desc


-----------------5) Find Provincial Type and Number separately
select PANumber, 
	   Left(PANumber,2),
	   Charindex('-', PANumber,0), 
	   RIGHT(PANumber, LEN(PANumber)-Charindex('-', PANumber,0))
	   from [dbo].[PAResults]


-----------------6) Order result by province type and seat number 
Select * from dbo.PAResults 
Order by PANumber


Select * from dbo.PAResults 
Order by Left(PANumber,2), cast(RIGHT(PANumber, LEN(PANumber)-Charindex('-', PANumber,0)) as int)




-----------------7) Find winners

WITH d AS
(
	SELECT ContCandidate,PartyAffliation,PANumber,VotesPolled, 
		ROW_NUMBER() over(partition by PANumber order by VotesPolled desc) as RowNumber
	FROM  [dbo].[PAResults]
)
Select ContCandidate,PartyAffliation,PANumber,VotesPolled 
from d where RowNumber = 1
Order by Left(PANumber,2), cast(RIGHT(PANumber, LEN(PANumber)-Charindex('-', PANumber,0)) as int)






