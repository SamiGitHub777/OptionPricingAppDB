Create PROCEDURE [dbo].[OptionCharacteristicsSP]
	@id int
AS
Select * from tblOptionParameters where idOption >= @id;
