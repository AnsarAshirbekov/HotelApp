CREATE PROCEDURE [dbo].[sp_Bookings_Search]
	@lastName nvarchar(50),
	@startDate DATE
AS
BEGIN
	SET NOCOUNT ON;

	SELECT  [b].[Id], [b].[RoomId], [b].[GuestId],
	[b].[StartDate],  [b].[EndDate], [b].[CheckedIn],
	[b].[TotalCost],  [g].[Id], [g].[FirstName], 
	[g].[LastName],[r].[Id], [r].[RoomNumber], 
	[r].[RoomTypeId], [t].[Id], [t].[Title], 
	[t].[Description], [t].[Price]
	FROM Bookings b
	JOIN Guests g ON g.Id = b.GuestId
	JOIN Rooms r ON r.Id = b.RoomId
	JOIN RoomTypes t ON t.Id = r.RoomTypeId
	WHERE b.StartDate = @startDate AND g.LastName = @lastName
END
