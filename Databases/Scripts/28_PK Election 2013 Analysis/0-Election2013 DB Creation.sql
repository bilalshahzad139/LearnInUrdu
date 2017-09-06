/*
- General Elections of Pakistan occured in 2013
- Whole country is divided in consitutioncies (272). National Assembly Seats
- Provinces also have their "Provincial Seats".
- In this video, we'll do some analysis on 2013 elections data
*/


CREATE database Election20131;
GO;

Use Election20131;

CREATE TABLE [dbo].[NationalAssemblies]
(
NANumber varchar(10) primary key, 
NADetail varchar(100), 
RegisteredVoters int, 
VotesPolledPerc float, 
EntryDate datetime
)


CREATE TABLE [dbo].[NAResults]
(
NAResultID int identity(1,1) primary key, 
NANumber varchar(10), 
ContCandidate varchar(500), 
PartyAffliation varchar(500), 
VotesPolled int
)


CREATE TABLE [dbo].[ProvincialAssemblies]
(
PANumber varchar(10) primary key, 
PADetail varchar(100), 
RegisteredVoters int, 
VotesPolledPerc float, 
EntryDate datetime
)


CREATE TABLE [dbo].[PAResults]
(
PAResultID int identity(1,1) primary key, 
PANumber varchar(10), 
ContCandidate varchar(500), 
PartyAffliation varchar(500), 
VotesPolled int
)


Select * from [dbo].[NAResults]





