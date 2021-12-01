CREATE PROCEDURE [dbo].[SPInsertOptionType]
	-- Add the parameters for the stored procedure here
	@optionType varchar(32)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @output int;
	Select @output = idOptionType from tblOptionType where OptionType = @optionType;
	If (@@ROWCOUNT <> 0) 
		Begin 
			return @output;
		END
	Insert into tblOptionType (OptionType) Values(@optionType);
	Select @output = SCOPE_IDENTITY();
	return @output;
END
GO


