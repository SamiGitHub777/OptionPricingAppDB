CREATE PROCEDURE [dbo].[SPInsertProduct] 
	-- Add the parameters for the stored procedure here
	@ProductType varchar(32)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @output int;
	Select @output = idProduct from tblProduct where productType = @ProductType;
	If (@@ROWCOUNT <> 0) 
		Begin 
			return @output;
		END
	Insert into tblProduct (productType) Values(@ProductType);
	Select @output = SCOPE_IDENTITY();
	return @output;
END
GO


