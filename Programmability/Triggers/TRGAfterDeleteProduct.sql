CREATE TRIGGER [dbo].[TRGAfterDeleteProduct]
ON [dbo].[tblProduct]
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
	if exists (select * from tblProduct) 
	begin 
		declare @lastID int; 
		set @lastID = (select top 1 idProduct from tblProduct order by idProduct desc); 
	end 
	else	
		begin 
		set @lastID = 1; 
end DBCC CHECKIDENT (tblProduct, RESEED, @lastID)
END
