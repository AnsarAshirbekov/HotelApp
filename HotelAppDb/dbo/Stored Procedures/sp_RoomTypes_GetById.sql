CREATE PROCEDURE [dbo].[sp_RoomTypes_GetById]
	@Id INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT [Id], [Title], [Description], [Price] 
	FROM RoomTypes
	WHERE ID = @Id;
END
