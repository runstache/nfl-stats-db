/****** Object:  UserDefinedFunction [dbo].[fnML_PointsScored]    Script Date: 9/26/2021 1:51:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[fnML_PointsScored]
(
	-- Add the parameters for the function here
	@TeamId int,
	@Year int,
	@Week int
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @result as float

	-- Add the T-SQL statements to compute the return value here
	if @week = 1		
		Select @result = avg(t.PointsScored) FROM tblTeamStats t INNER JOIN tblSchedule s ON t.ScheduleId = s.Id WHERE s.YearValue = @Year - 1 AND t.TeamId = @TeamId
	if @Week = 2
		Select @result = avg(t.PointsScored) FROM tblTeamStats t INNER JOIN tblSchedule s ON t.ScheduleId = s.Id WHERE t.TeamId = @TeamId AND (s.YearValue = @Year - 1 OR (s.WeekNumber < @week AND s.YearValue = @Year))

	if @week > 2
		Select @result = avg(t.PointsScored) FROM tblTeamStats t INNER JOIN tblSchedule s ON t.ScheduleId = s.Id WHERE s.YearValue = @Year AND s.WeekNumber < @Week AND t.TeamId = @TeamId
	-- Return the result of the function
	RETURN @result

END
GO
