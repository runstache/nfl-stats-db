/****** Object:  View [dbo].[vRushingPoints]    Script Date: 9/26/2021 1:51:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vRushingPoints] AS
(
Select
p.Id AS PlayerId,
p.Name,
p.Position,
p.Dob,
rs.Carries,
rs.OpponentId,
rs.TeamId,
rs.ScheduleId,
rs.Touchdowns,
IsNull(rs.Touchdowns, 0) + IsNull(rcs.Touchdowns, 0) AS TotalTouchdowns,
rs.Yards AS RushingYards,
rcs.Yards As ReceivingYards,
rcs.Receptions,
rcs.Targets,
dbo.fnFantasy_RushingPoints(rs.Yards) AS RushingPoints,
dbo.fnFantasy_MiscPoints(p.Id, s.Id) AS MiscPoints,
dbo.fnFantasy_ReceivingPoints(rcs.Yards, rcs.Receptions) AS ReceivingPoints

FROM 
tblPlayers p 
INNER JOIN tblRushingStats rs On p.Id = rs.PlayerId
INNER JOIN tblSchedule s on rs.ScheduleId = s.Id
LEFT OUTER JOIN tblReceivingStats rcs on p.Id = rcs.PlayerId AND rcs.ScheduleId = s.Id)
GO
