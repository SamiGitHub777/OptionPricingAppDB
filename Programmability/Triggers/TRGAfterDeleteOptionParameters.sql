CREATE TRIGGER [dbo].[TRGAfterDeleteOptionParameters]
ON [dbo].[tblOptionParameters]
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
	if exists (select * from tblOptionParameters) 
	begin 
		declare @lastID int; 
		set @lastID = (select top 1 idOption from tblOptionParameters order by idOption desc); 
	end 
	else	
		begin 
		set @lastID = 1; 
end DBCC CHECKIDENT (tblOptionParameters, RESEED, @lastID)
END
