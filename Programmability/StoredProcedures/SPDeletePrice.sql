CREATE PROCEDURE [dbo].[SPDeletePrice]
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

	Declare @idPrice int;
	Declare @idModel int;
	Declare @idOption int;
	Declare @idUnderlying int;
	Declare @idUnderlyingProduct int;
	Declare @idOptionType int;

	Select @idOptionType = idOptionType from tblOptionType where OptionType = @optionType;

	Select @idModel = idPricingModel from tblPricingModel where pricingModel = @model;
	
	Select @idUnderlyingProduct = idProduct from tblProduct where productType = @product;

	Select @idUnderlying = idUnderlying from tblUnderlying
	where underlyingName = @underlying
	and idUnderlyingProduct = @idUnderlyingProduct
	and spot = @spot;
	
	Select @idOption = idOption from tblOptionParameters 
	where idOptionType = @idOptionType
	and strike = @strike
	and riskFreeRate = @riskFreeRate
	and maturity = @maturity
	and volatility = @volatility
	and idUnderlying = @idUnderlying;

	Select @idPrice = idPrice from tblPrice
	where Price = @price 
	AND idModel = @idModel
	AND idOption = @idOption;

	if (@idPrice is not null)
		BEGIN
			delete from tblPrice where idPrice = @idPrice;
		END

END
GO


