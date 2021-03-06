/****** Object:  UserDefinedFunction [dbo].[fnFantasy_PassingYardsPoints]    Script Date: 9/26/2021 1:51:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[fnFantasy_PassingYardsPoints] 
(
	-- Add the parameters for the function here
	@yards int
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @result float

	-- Add the T-SQL statements to compute the return value here
	Select @result = (CASE WHEN @Yards >= 300 AND @yards < 400 THEN (CAST(@yards as FLOAT) / 25.0) + 1 
							WHEN @Yards >= 400 THEN (CAST(@yards AS FLOAT) / 25.0) + 2
							ELSE (CAST(@yards AS FLOAT) / 25.0) END)

	-- Return the result of the function
	RETURN @result

END
GO
