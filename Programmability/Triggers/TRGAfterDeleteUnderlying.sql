CREATE TRIGGER [dbo].[TRGAfterDeleteUnderlying]
ON [dbo].[tblUnderlying]
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
	if exists (select * from tblUnderlying) 
	begin 
		declare @lastID int; 
		set @lastID = (select top 1 idUnderlying from tblUnderlying order by idUnderlying desc); 
	end 
	else	
		begin 
		set @lastID = 1; 
end DBCC CHECKIDENT (tblUnderlying, RESEED, @lastID)
END
