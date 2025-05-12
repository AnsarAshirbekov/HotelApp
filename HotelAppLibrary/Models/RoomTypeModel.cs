namespace HotelAppLibrary.Models
{
    // ORM - Object-relation mapper, Dapper - we will, EF recommended
    public class RoomTypeModel
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
    }
}