CREATE TRIGGER [dbo].[TRGAfterDeletePricingModel]
ON [dbo].[tblPricingModel]
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
	if exists (select * from tblPricingModel) 
	begin 
		declare @lastID int; 
		set @lastID = (select top 1 idPricingModel from tblPricingModel order by idPricingModel desc); 
	end 
	else	
		begin 
		set @lastID = 1; 
end DBCC CHECKIDENT (tblPricingModel, RESEED, @lastID)
END
