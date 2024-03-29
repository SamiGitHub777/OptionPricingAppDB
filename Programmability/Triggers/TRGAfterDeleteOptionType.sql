CREATE TRIGGER [dbo].[TRGAfterDeleteOptionType]
ON [dbo].[tblOptionType]
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
	if exists (select * from tblOptionType) 
	begin 
		declare @lastID int; 
		set @lastID = (select top 1 idOptionType from tblOptionType order by idOptionType desc); 
	end 
	else	
		begin 
		set @lastID = 1; 
end DBCC CHECKIDENT (tblOptionType, RESEED, @lastID)
END
