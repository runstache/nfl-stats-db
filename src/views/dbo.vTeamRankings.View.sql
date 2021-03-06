/****** Object:  View [dbo].[vTeamRankings]    Script Date: 9/26/2021 1:51:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[vTeamRankings] AS (SELECT
TeamId,
TeamName,
YearValue,
WPointDifferential,
WBigRushDifferential,
WBigPassDifferential,
WPassYards,
WRushYards,
WTurnOvers, 
WOffEfficiency,
WFumbles,
WPenaltyYards,
WGivenBigRush,
WGivenBigPass,
WGivenPassYards,
WGivenRushYards,
WPointDifferential + WBigRushDifferential + WBigPassDifferential + WPassYards + WRushYards + WTurnOvers + WOffEfficiency 
+ WFumbles + WPenaltyYards + WGivenBigRush + WGivenBigPass + WGivenPassYards + WGivenRushYards + (Wins * 3) AS WTotal,
AvgPointsScored

FROM
(Select
t.Id AS TeamId,
t.Name AS TeamName,
s.YearValue,
AVG((ts.PointsScored - ts.PointsAllowed)) * 1.7 AS WPointDifferential,
AVG(CAST(ts.RushOverTen AS DECIMAL(32,2)) / CAST(ts.RushingAttempts AS DECIMAL(32,2))) * 1.5 AS WBigRushDifferential,
AVG(CAST(ts.PassOverFifteen AS DECIMAL(32,2)) / CAST(ts.PassingCompletions AS DECIMAL(32,2))) * 1.5 AS WBigPassDifferential,
AVG(CAST(ts.RushingAttempts + ts.PassingCompletions AS decimal(32,2))/ CAST(ts.TotalPlays AS DECIMAL(32,2))) * 1.85 AS WOffEfficiency,
AVG(ts.PassingYards) * 0.15 AS WPassYards,
AVG(ts.RushingYards) * 0.15 AS WRushYards,
AVG(ts.TotalTurnovers) * -1.25 AS WTurnOvers,
AVG(df.TotalFumbles) * 1.85 AS WFumbles,
AVG(ts.PenaltyYards) * -0.15 AS WPenaltyYards,
AVG(df.RushOverTen) * -1.5 AS WGivenBigRush,
AVG(df.PassOverFifteen) * -1.5 AS WGivenBigPass,
AVG(df.PassingYards) * -0.10 AS WGivenPassYards,
AVG(df.RushingYards) * -0.10 AS WGivenRushYards,
Sum(CASE WHEN ts.PointsScored > ts.PointsAllowed THEN 1 ELSE 0 END) AS Wins,
Avg(ts.PointsScored) As AvgPointsScored
FROM tblTeams t INNER JOIN tblTeamStats ts
ON t.Id = ts.TeamId
INNER JOIN tblSchedule s On ts.ScheduleId = s.Id
LEFT OUTER JOIN
(Select t.TeamId as OpponentId, s.YearValue, s.TypeId, fs.TotalFumbles,
t.RushOverTen, t.PassOverFifteen, t.PassingYards, t.RushingYards
from tblTeamStats t INNER JOIN tblSchedule s ON t.ScheduleId = s.Id
LEFT OUTER JOIN (Select f.ScheduleId, SUM(f.Fumbles) AS TotalFumbles FROM tblFumbleStats f GROUP BY f.ScheduleId) fs ON s.Id = fs.ScheduleId) df
ON ts.OpponentId = df.OpponentId AND s.YearValue = df.YearValue AND s.TypeId = df.TypeId

WHERE
s.YearValue >= CAST((Select TOP 1 StringValue FROM tblOptions WHERE Code = 'YV') AS INT)
GROUP BY 
t.Id,
t.Name,
s.YearValue) ds)
GO
