CREATE TRIGGER [dbo].[TRGAfterDeletePrice]
ON [dbo].[tblPrice]
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
	if exists (select * from tblPrice) 
	begin 
		declare @lastID int; 
		set @lastID = (select top 1 idPrice from tblPrice order by idPrice desc); 
	end 
	else	
		begin 
		set @lastID = 1; 
end DBCC CHECKIDENT (tblPrice, RESEED, @lastID)
END
