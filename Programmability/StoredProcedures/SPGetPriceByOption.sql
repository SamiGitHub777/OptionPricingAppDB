CREATE PROCEDURE [dbo].[SPGetPriceByOption]
		@optionType varchar(max),
		@strike float,
		@riskFreeRate float,
		@maturity Date,
		@volatility float,
		@underlying varchar(max),
		@spot float,
		@underlyingType varchar(max),
		@pricingModel varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select Price from VWOptionPrice 
	where strike = @strike
	and riskFreeRate = @riskFreeRate
	and maturity = @maturity
	and volatility = @volatility
	and underlyingName = @underlying
	and optionType = @optionType
	and spot = @spot
	and productType = @underlyingType
	and pricingModel = @pricingModel;

	--Declare @idPricingModel int;
	--select @idPricingModel = idPricingModel from tblPricingModel where pricingModel = @pricingModel;

	--Declare @idOptionType int;
	--select @idOptionType = idOptionType from tblOptionType where OptionType = @optionType;

	--Declare @idProduct int;
	--select @idProduct = idProduct from tblProduct where productType = @underlyingType;

	--Declare @idUnderlying int;
	--select @idUnderlying = idUnderlying from tblUnderlying 
	--where 
	--underlyingName = @underlying 
	--and spot = @spot 
	--and idUnderlyingProduct = @idProduct;

	--Declare @idOption int;
	--select @idOption = idOption from tblOptionParameters 
	--where
	--idOptionType = @idOptionType 
	--and strike = @strike
	--and riskFreeRate = @riskFreeRate
	--and maturity = @maturity
	--and volatility = @volatility
	--and idUnderlying = @idUnderlying;


	--select Price from tblPrice where
	--idModel = @idPricingModel
	--and idOption = @idOption;

END
GO


