CREATE PROCEDURE [dbo].[SPInsertOptionParameters]
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
	Declare @idOptionType int;
	Declare @idUnderlying int;
	Exec @idOptionType = SPInsertOptionType @optionType;
	Exec @idUnderlying = SPInsertUnderlying @underlying, @spot, @product;

	Select @output = idOption from tblOptionParameters 
	where 
	idOptionType = @idOptionType 
	AND strike = @strike 
	AND riskFreeRate = @riskFreeRate 
	AND maturity = @maturity 
	AND volatility = @volatility
	AND idUnderlying = @idUnderlying;

	If (@@ROWCOUNT <> 0)
		Begin 
			return @output;
		End
	Insert into tblOptionParameters Values(@idOptionType, @strike, @riskFreeRate, @maturity, @volatility, @idUnderlying);
	Select @output = SCOPE_IDENTITY();
	return @output;
END
GO


