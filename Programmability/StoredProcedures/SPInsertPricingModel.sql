CREATE PROCEDURE [dbo].[SPInsertPricingModel]
	@pricingModel varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @output int;
	Select @output = idPricingModel from tblPricingModel where pricingModel = @pricingModel;
	If (@output is not null) 
		Begin 
			return @output;
		END
	Insert into tblPricingModel (pricingModel) Values(@pricingModel);
	Select @output = SCOPE_IDENTITY();
	return @output;
END
GO


