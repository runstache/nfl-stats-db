/****** Object:  View [dbo].[vMLExport]    Script Date: 9/26/2021 1:51:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vMLExport] AS (
Select
t.Code AS HomeTeam,
o.Code AS AwayTeam,
s.YearValue,
s.WeekNumber,
ts.PointsScored AS HomePoints,
ts.PointsAllowed AS AwayPoints,
(ts.PointsScored - ts.PointsAllowed) * -1 AS PointDifferential,
(ts.PointsScored + ts.PointsAllowed) AS TotalPoints,
(CASE WHEN ts.PointsScored > ts.PointsAllowed THEN 'H'
	  WHEN ts.PointsAllowed > ts.PointsScored THEN 'A'
	  WHEN ts.PointsScored = ts.PointsAllowed THEN 'T' END) AS Result,
dbo.fnML_3rdDownConversion(s.TeamId, s.YearValue, s.WeekNumber) AS H3rdDownConversion,
dbo.fnML_3rdDownConversion(s.OpponentId, s.YearValue, s.WeekNumber) AS A3rdDownConversion,

dbo.fnML_OffenseEfficiency(s.TeamId, s.YearValue, s.WeekNumber) AS HOffenseEfficiency,
dbo.fnML_OffenseEfficiency(s.OpponentId, s.YearValue, s.WeekNumber) AS AOffenseEfficiency,

dbo.fnML_PassOverFifteen(s.TeamId, s.YearValue, s.WeekNumber) AS HPassOverFifteen,
dbo.fnML_PassOverFifteen(s.OpponentId, s.YearValue, s.WeekNumber) AS APassOverFifteen,

dbo.fnML_PassYards(s.TeamId, s.YearValue, s.WeekNumber) AS HPassYards,
dbo.fnML_PassYards(s.OpponentId, s.YearValue, s.WeekNumber) AS APassYards,

dbo.fnML_Penalties(s.TeamId, s.YearValue, s.WeekNumber) AS HPenalties,
dbo.fnML_Penalties(s.OpponentId, s.YearValue, s.WeekNumber) AS APenalties,

dbo.fnML_PenaltyYards(s.TeamId, s.YearValue, s.WeekNumber) AS HPenaltyYards,
dbo.fnML_PenaltyYards(s.OpponentId, s.YearValue, s.WeekNumber) AS APenaltyYards,

dbo.fnML_PointsAllowed(s.TeamId, s.YearValue, s.WeekNumber) AS HPointsAllowed,
dbo.fnML_PointsAllowed(s.OpponentId, s.YearValue, s.WeekNumber) AS APointsAllowed,

dbo.fnML_PointsScored(s.TeamId, s.YearValue, s.WeekNumber) AS HPointsScored,
dbo.fnML_PointsScored(s.OpponentId, s.YearValue, s.WeekNumber) AS APointsScored,

dbo.fnML_RedzoneEfficiency(s.TeamId, s.YearValue, s.WeekNumber) AS HRedzoneEfficiency,
dbo.fnML_RedzoneEfficiency(s.OpponentId, s.YearValue, s.WeekNumber) AS ARedzoneEfficiency,

dbo.fnML_RushOverTen(s.TeamId, s.YearValue, s.WeekNumber) AS HRushOverTen,
dbo.fnML_RushOverTen(s.OpponentId, s.YearValue, s.WeekNumber) AS ARushOverTen,

dbo.fnML_RushYards(s.TeamId, s.YearValue, s.WeekNumber) AS HRushYards,
dbo.fnML_RushYards(s.OpponentId, s.YearValue, s.WeekNumber) AS ARushYards,

dbo.fnML_TimeOfPossession(s.TeamId, s.YearValue, s.WeekNumber) AS HTimeOfPossession,
dbo.fnML_TimeOfPossession(s.OpponentId, s.YearValue, s.WeekNumber) AS ATimeOfPossession,

dbo.fnML_TotalDrives(s.TeamId, s.YearValue, s.WeekNumber) AS HTotalDrives,
dbo.fnML_TotalDrives(s.OpponentId, s.YearValue, s.WeekNumber) AS ATotalDrives,

dbo.fnML_TotalPlays(s.TeamId, s.YearValue, s.WeekNumber) AS HTotalPlays,
dbo.fnML_TotalPlays(s.OpponentId, s.YearValue, s.WeekNumber) AS ATotalPlays,

dbo.fnML_TotalYards(s.TeamId, s.YearValue, s.WeekNumber) AS HTotalYards,
dbo.fnML_TotalYards(s.OpponentId, s.YearValue, s.WeekNumber) AS ATotalYards,

dbo.fnML_Turnovers(s.TeamId, s.YearValue, s.WeekNumber) AS HTurnovers,
dbo.fnML_Turnovers(s.OpponentId, s.YearValue, s.WeekNumber) AS ATurnovers,

dbo.fnML_WinPercentage(s.TeamId, s.YearValue, s.WeekNumber) AS HWinPercentage,
dbo.fnML_WinPercentage(s.OpponentId, s.YearValue, s.WeekNumber) AS AWinPercentage,

dbo.fnML_YardsPerPass(s.TeamId, s.YearValue, s.WeekNumber) AS HYardsPerPass,
dbo.fnML_YardsPerPass(s.OpponentId, s.YearValue, s.WeekNumber) AS AYardsPerPass,

dbo.fnML_YardsPerPlay(s.TeamId, s.YearValue, s.WeekNumber) AS HYardsPerPlay,
dbo.fnML_YardsPerPlay(s.OpponentId, s.YearValue, s.WeekNumber) AS AYardsPerPlay,

dbo.fnML_YardsPerRush(s.TeamId, s.YearValue, s.WeekNumber) AS HYardsPerRush,
dbo.fnML_YardsPerRush(s.OpponentId, s.YearValue, s.WeekNumber) AS AYardsPerRush

FROM 
tblSchedule s LEFT OUTER JOIN tblTeamStats ts ON s.Id = ts.ScheduleId
INNER JOIN tblTeams t On s.TeamId = t.Id
INNER JOIN tblTeams o on s.OpponentId = o.Id
WHERE
s.IsHome = 1)
GO
