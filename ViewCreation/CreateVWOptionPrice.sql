CREATE VIEW [dbo].[VWOptionPrice] AS
	select optionParam.idOption, optionParam.strike, optionParam.riskFreeRate, optionParam.maturity, optionParam.volatility, udl.underlyingName, optionTbl.OptionType, udl.spot, udlType.productType, price.Price,
	model.pricingModel
	from tblOptionParameters optionParam
	INNER JOIN tblOptionType optionTbl on optionParam.idOptionType = optionTbl.idOptionType
	INNER JOIN tblUnderlying udl on optionParam.idUnderlying = udl.idUnderlying
	INNER JOIN tblProduct udlType on udl.idUnderlyingProduct = udlType.idProduct
	LEFT JOIN tblPrice price on price.idOption = optionParam.idOption
	LEFT JOIN tblPricingModel model on model.idPricingModel = price.idModel
GO


