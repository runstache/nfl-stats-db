/****** Object:  UserDefinedFunction [dbo].[fnFantasy_RushingPoints]    Script Date: 9/26/2021 1:51:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[fnFantasy_RushingPoints]
(
	-- Add the parameters for the function here
	@Yards int
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @result as float

	-- Add the T-SQL statements to compute the return value here
	select @result = (CASE WHEN @Yards >= 200 THEN (CAST(@Yards as FLOAT) / 10.0) + 1 ELSE  CAST(@Yards as FLOAT) / 10 END)

	-- Return the result of the function
	RETURN @Result 

END
GO
