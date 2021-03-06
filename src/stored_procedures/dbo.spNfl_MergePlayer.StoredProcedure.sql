/****** Object:  StoredProcedure [dbo].[spNfl_MergePlayer]    Script Date: 9/26/2021 1:51:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spNfl_MergePlayer]
	-- Add the parameters for the stored procedure here
	@OldPlayedId bigint,
	@NewPlayerId bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	Declare @restable as Table(id int identity(1,1), name varchar(255))

	Insert into @restable(name) 
	(Select t.name from sys.columns c INNER JOIN sys.tables t on c.object_id = t.object_id where c.name = 'PlayerId')

	Declare @count int
	Declare @id int
	declare @name varchar(255)
	Declare @sql varchar(8000)

	Select @count = count(id) from @restable

	while (@count > 0) 
	begin
		Select @id = min(id) from @restable
		Select @name = [name] from @restable where id = @id

		Select @sql = 'UPDATE ' + @name + ' SET PlayerId = ' + CAST(@NewPlayerId AS VARCHAR) + ' WHERE PlayerId = ' + CAST(@OldPlayedId AS VARCHAR)
		exec(@sql)


		Delete from @restable where @id = id
		Select @count = count(id) from @restable

	end
	Delete from tblPlayers WHERE Id = @OldPlayedId
END
GO
