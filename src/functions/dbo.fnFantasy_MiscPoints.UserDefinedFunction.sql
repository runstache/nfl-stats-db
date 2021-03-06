/****** Object:  UserDefinedFunction [dbo].[fnFantasy_MiscPoints]    Script Date: 9/26/2021 1:51:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[fnFantasy_MiscPoints]
(
	-- Add the parameters for the function here
	@PlayerId bigint,
	@ScheduleId bigint
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @result int

	-- Add the T-SQL statements to compute the return value here
	SELECT
	@Result = (rs.Touchdowns * 6) + (ds.Touchdowns * 6) + (ist.Touchdowns * 6) + (fs.FumblesLost * -2)
	FROM tblPlayers p LEFT OUTER JOIN tblReturnStats rs 
	ON p.Id = rs.PlayerId AND rs.ScheduleId = @ScheduleId	
	LEFT OUTER JOIN
	tblFumbleStats fs On p.Id = fs.PlayerId AND fs.ScheduleId = @ScheduleId
	LEFT OUTER JOIN tblInterceptionStats ist ON p.Id = ist.PlayerId AND ist.ScheduleId = @ScheduleId
	LEFT OUTER JOIN tblDefensiveStats ds ON p.Id = ds.PlayerId AND ds.ScheduleId = @ScheduleId
	WHERE
	p.Id = @PlayerId


	-- Return the result of the function
	RETURN @result

END
GO
