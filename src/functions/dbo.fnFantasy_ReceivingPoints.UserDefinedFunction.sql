/****** Object:  UserDefinedFunction [dbo].[fnFantasy_ReceivingPoints]    Script Date: 9/26/2021 1:51:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[fnFantasy_ReceivingPoints]
(
	-- Add the parameters for the function here
	@Yards int,
	@receptions int
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @result float

	-- Add the T-SQL statements to compute the return value here
	SELECT @result = (CASE WHEN @yards >= 200 THEN (CAST(@yards AS FLOAT) / 10.0) + 2 ELSE (CAST(@yards AS FLOAT) / 10.0) END) + @receptions

	-- Return the result of the function
	RETURN @result

END
GO
