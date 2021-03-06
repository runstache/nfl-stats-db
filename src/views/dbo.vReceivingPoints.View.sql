/****** Object:  View [dbo].[vReceivingPoints]    Script Date: 9/26/2021 1:51:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vReceivingPoints] AS
(
Select
p.Id AS PlayerId,
p.Name,
p.Position,
p.Dob,
rcs.OpponentId,
rcs.Receptions,
rcs.ScheduleId,
rcs.Targets,
rcs.TeamId,
rcs.Touchdowns,
rcs.Yards AS ReceivingYards,
rs.Yards AS RushingYards,
rs.Carries,
IsNull(rcs.Touchdowns,0) + IsNull(rs.Touchdowns,0) AS TotalTouchdowns,
dbo.fnFantasy_RushingPoints(rs.Yards) AS RushingPoints,
dbo.fnFantasy_ReceivingPoints(rcs.Yards, rcs.Receptions) AS ReceivingPoints,
dbo.fnFantasy_MiscPoints(p.Id, s.Id) AS MiscPoints

FROM 
tblPlayers p 
INNER JOIN tblReceivingStats rcs On p.Id = rcs.PlayerId
INNER JOIN tblSchedule s on rcs.ScheduleId = s.Id
LEFT OUTER JOIN tblRushingStats rs on p.Id = rs.PlayerId AND rs.ScheduleId = s.Id)
GO
