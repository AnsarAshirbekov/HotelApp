CREATE PROCEDURE [dbo].[sp_RoomTypes_GetAvailbleTypes]
	@startDate DATE,
	@endDate DATE
AS
BEGIN
	SET NOCOUNT ON;

	SELECT [t].[Id], [t].[Title], [t].[Description], [t].[Price]
	FROM RoomTypes t
	JOIN Rooms r ON r.RoomTypeId = t.Id
	WHERE r.Id NOT IN(
	SELECT b.RoomId
	FROM Booking b
	WHERE (@startDate < b.StartDate AND @endDate > b.EndDate)
	OR (@endDate >= b.StartDate AND @endDate < b.EndDate)
	OR (@startDate >= b.StartDate AND @startDate < b.EndDate)	
	)
END
