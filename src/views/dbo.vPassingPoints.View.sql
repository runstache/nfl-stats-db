/****** Object:  View [dbo].[vPassingPoints]    Script Date: 9/26/2021 1:51:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vPassingPoints] AS
(
Select
p.Id AS PlayerId,
p.Name,
p.Position,
p.Dob,
ps.Attempts,
ps.Completions,
ps.Interceptions,
ps.OpponentId,
ps.Qbr,
ps.Rating,
ps.Sacks,
ps.ScheduleId,
ps.TeamId,
ps.Touchdowns,
IsNull(ps.Touchdowns,0) + IsNull(rs.Touchdowns,0) + IsNull(rcs.Touchdowns,0) AS TotalTouchdowns,
ps.Yards,
dbo.fnFantasy_PassingYardsPoints(ps.Yards) AS PassingPoints,
dbo.fnFantasy_RushingPoints(rs.Yards) AS RushingPoints,
dbo.fnFantasy_MiscPoints(p.Id, s.Id) AS MiscPoints

FROM 
tblPlayers p 
INNER JOIN tblPassingStats ps On p.Id = ps.PlayerId
INNER JOIN tblSchedule s on ps.ScheduleId = s.Id
LEFT OUTER JOIN tblRushingStats rs on p.Id = rs.PlayerId AND rs.ScheduleId = s.Id
LEFT OUTER JOIN tblReceivingStats rcs on p.Id = rcs.PlayerId AND rcs.ScheduleId = s.Id)
GO
