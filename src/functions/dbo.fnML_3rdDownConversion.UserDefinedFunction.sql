/****** Object:  UserDefinedFunction [dbo].[fnML_3rdDownConversion]    Script Date: 9/26/2021 1:51:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[fnML_3rdDownConversion] 
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
		Select @result = avg(ds.ConvRate) FROM
			(Select CASE WHEN t.ThirdDowns = 0 THEN 0 ELSE CAST(t.ThirdDownsConverted AS FLOAT)/CAST(t.ThirdDowns AS FLOAT) END As ConvRate FROM tblTeamStats t INNER JOIN tblSchedule s ON t.ScheduleId = s.Id WHERE s.YearValue = @Year - 1 AND t.TeamId = @TeamId) ds
	if @Week = 2
		Select @result = avg(ds.ConvRate) FROM
			(Select CASE WHEN t.ThirdDowns = 0 THEN 0 ELSE CAST(t.ThirdDownsConverted AS FLOAT)/CAST(t.ThirdDowns AS FLOAT) END As ConvRate FROM tblTeamStats t INNER JOIN tblSchedule s ON t.ScheduleId = s.Id WHERE t.TeamId = @TeamId AND (s.YearValue = @Year - 1 OR (s.WeekNumber < @week AND s.YearValue = @Year))) ds

	if @week > 2
		Select @result = avg(ds.ConvRate) FROM
			(Select CASE WHEN t.ThirdDowns = 0 THEN 0 ELSE CAST(t.ThirdDownsConverted AS FLOAT)/CAST(t.ThirdDowns AS FLOAT) END As ConvRate FROM tblTeamStats t INNER JOIN tblSchedule s ON t.ScheduleId = s.Id WHERE s.YearValue = @Year AND s.WeekNumber < @Week AND t.TeamId = @TeamId) ds

	-- Return the result of the function
	RETURN @result

END
GO
