/****** Object:  StoredProcedure [dbo].[spNFL_ArchiveSpreads]    Script Date: 9/26/2021 1:51:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spNFL_ArchiveSpreads]
	-- Add the parameters for the stored procedure here
	@WeekNumber int,
	@YearValue int,
	@TypeId	int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into factSpreads(WeekNumber, YearValue, Season, HomeTeam, HomeTeamRank, HomeTeamAvgPoints, AwayTeam, AwayTeamRank, AwayTeamAvgPoints, SpreadHome, SpreadAway, OverUnder)
	(Select @WeekNumber, @YearValue, t.Description, s.HomeTeam, s.HomeTeamRank, s.HomeTeamAvgPoints, s.AwayTeam, s.AwayTeamRank, 
	s.AwayTeamAvgPoints, s.SpreadHomeFavorite, s.SpreadAwayFavorite, s.PossibleOverUnder  From vScheduleSpreads s INNER JOIN tblTypeCodes t On s.TypeId = t.Id		
	WHERE s.WeekNumber = @WeekNumber AND s.YearValue = @YearValue AND s.TypeId = @TypeId)
	
END
GO
