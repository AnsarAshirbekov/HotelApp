CREATE PROCEDURE [dbo].[sp_Bookings_CheckIn]
	@Id INT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE dbo.Bookings
	SET CheckedIn = 1
	WHERE GuestId = @Id;
END
