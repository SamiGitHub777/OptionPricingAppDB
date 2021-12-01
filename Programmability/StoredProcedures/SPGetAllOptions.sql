CREATE PROCEDURE [dbo].[SPGetAllOptions]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

 --   select optionParam.strike, optionParam.riskFreeRate, optionParam.maturity, optionParam.volatility, udl.underlyingName, optionTbl.OptionType, udl.spot, udlType.productType
	--from tblOptionParameters optionParam
	--INNER JOIN tblOptionType optionTbl
	--	on optionParam.idOptionType = optionTbl.idOptionType
	--		INNER JOIN tblUnderlying udl
	--			on optionParam.idUnderlying = udl.idUnderlying
	--				INNER JOIN tblProduct udlType
	--					on udl.idUnderlyingProduct = udlType.idProduct;
	select strike, riskFreeRate, maturity, volatility, underlyingName, OptionType, spot, productType from VWOptionPrice order by idOption;
	RETURN
END
GO


