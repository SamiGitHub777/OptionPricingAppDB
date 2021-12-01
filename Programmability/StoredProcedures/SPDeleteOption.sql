CREATE PROCEDURE [dbo].[SPDeleteOption]
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

	Declare @idPricingModel int;
	select @idPricingModel = idPricingModel from tblPricingModel where pricingModel = @pricingModel;

	Declare @idOptionType int;
	select @idOptionType = idOptionType from tblOptionType where OptionType = @optionType;

	Declare @idProduct int;
	select @idProduct = idProduct from tblProduct where productType = @underlyingType;

	Declare @idUnderlying int;
	select @idUnderlying = idUnderlying from tblUnderlying 
	where 
	underlyingName = @underlying 
	and spot = @spot 
	and idUnderlyingProduct = @idProduct;

	Declare @idOption int;
	select @idOption = idOption from tblOptionParameters 
	where
	idOptionType = @idOptionType 
	and strike = @strike
	and riskFreeRate = @riskFreeRate
	and maturity = @maturity
	and volatility = @volatility
	and idUnderlying = @idUnderlying;

	delete from tblPrice where idOption = @idOption;
	if (@pricingModel is not null) 
	begin
		delete from tblPricingModel where idPricingModel = @idPricingModel;
	end
	Declare @optionTypeStillUsed int;
	select @optionTypeStillUsed = count(idOption) from tblOptionParameters where idOptionType = @idOptionType
	delete from tblOptionParameters where idOption = @idOption;

	if (@optionTypeStillUsed = 0) 
		Begin
			delete from tblOptionType where idOptionType = @idOptionType;
		End
	Declare @underlyingTypeStillUsed int;
	select @underlyingTypeStillUsed = count(idUnderlying) from tblUnderlying where idUnderlying = @idUnderlying
	
	delete from tblUnderlying where idUnderlying = @idUnderlying;
	if (@underlyingTypeStillUsed = 0) 
		BEGIN
		delete from tblProduct where idProduct = @idProduct;
		END
END
GO


