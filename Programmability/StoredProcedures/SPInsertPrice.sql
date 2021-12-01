CREATE PROCEDURE [dbo].[SPInsertPrice]
	@price float,
	@model varchar(max),
	@optionType varchar(max),
	@strike float,
	@riskFreeRate float,
	@maturity Date,
	@volatility float,
	@underlying varchar(max),
	@spot float,
	@product varchar(max)
AS
BEGIN
	SET NOCOUNT ON;

	Declare @output int;
	Declare @idModel int;
	Declare @idOption int;
	Exec @idModel = SPInsertPricingModel @model;
	Exec @idOption = SPInsertOptionParameters @optionType,@strike,	@riskFreeRate, @maturity, @volatility, @underlying,	@spot, @product;
	Select @output = idPrice from tblPrice 
	where Price = @price 
	AND idModel = @idModel
	AND idOption = @idOption
	If (@output is not null)
		Begin 
			return @output;
		End
	Insert into tblPrice (Price, idModel, idOption) Values (@price, @idModel, @idOption);
	Select @output = SCOPE_IDENTITY();
	return @output;
END
GO


