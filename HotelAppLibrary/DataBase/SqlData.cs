using HotelAppLibrary.DataAccess;
using HotelAppLibrary.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HotelAppLibrary.DataBase
{
    public class SqlData
    {
        private readonly ISqlDataAccess _db;
        private const string connectionStringName = "SqlDb";
        public SqlData(ISqlDataAccess db)
        {
            _db = db;
        }

        public List<RoomTypeModel> GetAvailableRoomTypes
            (DateTime startDate, DateTime endDate)
        {
            return _db.LoadData<RoomTypeModel, dynamic>
                ("dbo.sp_RoomTypes_GetAvailbleTypes",
                new { startDate, endDate },
                connectionStringName,
                true);
        }

        // Implement GetRoomByTypeId method the same way
        public RoomTypeModel GetRoomByTypeId(int id)
        {
            return _db.LoadData<RoomTypeModel, dynamic>
                ("dbo.sp_RoomTypes_GetById",
                new { id },
                connectionStringName,
                true).First();
        }
    }
}
