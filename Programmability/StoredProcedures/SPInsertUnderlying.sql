CREATE PROCEDURE [dbo].[SPInsertUnderlying]
	@underlyingName varchar(max),
	@spot float,
	@product varchar(32)
AS
BEGIN
	SET NOCOUNT ON;

	Declare @output int;
	Declare @idProduct int;
	Exec @idProduct = SPInsertProduct @product;
	Select @output = idUnderlying from tblUnderlying where idUnderlyingProduct = @idProduct AND spot = @spot AND underlyingName = @underlyingName;
	If (@@ROWCOUNT <> 0)
		Begin 
			return @output;
		End
	Insert into tblUnderlying (underlyingName, idUnderlyingProduct, spot) Values(@underlyingName, @idProduct, @spot);
	Select @output = SCOPE_IDENTITY();
	return @output;
END
GO


