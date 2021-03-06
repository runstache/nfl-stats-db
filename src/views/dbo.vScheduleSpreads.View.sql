/****** Object:  View [dbo].[vScheduleSpreads]    Script Date: 9/26/2021 1:51:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[vScheduleSpreads] AS
(
Select
s.WeekNumber,
s.YearValue,
s.TypeId,
htr.TeamName AS HomeTeam,
htr.WTotal AS HomeTeamRank,
htr.AvgPointsScored AS HomeTeamAvgPoints,
vtr.TeamName AS AwayTeam,
vtr.WTotal AS AwayTeamRank,
vtr.AvgPointsScored AS AwayTeamAvgPoints,
((htr.WTotal - vtr.WTotal) / 11.75) * -1 AS SpreadHomeFavorite,
((vtr.WTotal - htr.WTotal) / 11.75) * -1 AS SpreadAwayFavorite,
htr.AvgPointsScored + vtr.AvgPointsScored AS PossibleOverUnder
FROM
tblSchedule s 
INNER JOIN vTeamRankings htr ON s.TeamId = htr.TeamId 
INNER JOIN vTeamRankings vtr ON s.OpponentId = vtr.TeamId 
WHERE
s.IsHome = 1)
GO
