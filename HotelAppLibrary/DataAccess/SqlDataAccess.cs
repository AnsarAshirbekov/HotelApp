using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HotelAppLibrary.DataAccess
{
    public class SqlDataAccess : ISqlDataAccess
    {
        private readonly IConfiguration _config;
        public SqlDataAccess(IConfiguration config)
        {
            _config = config;
        }

        public List<T> LoadData<T, U>(
            string sqlStatement,
            U parameters,
            string connectionStringName,
            bool isStoredProcedure = false)
        {
            var connectionString = _config.GetConnectionString(connectionStringName);

            var commandType = CommandType.Text;
            if (isStoredProcedure == true)
            {
                commandType = CommandType.StoredProcedure;
            }
            using (IDbConnection connection = new SqlConnection(connectionString))
            {
                var rows = connection.Query<T>
                    (sqlStatement, parameters, commandType: commandType).ToList();
                return rows;
            }
        }

        public void SaveData<T>(
            string sqlStatement,
            T parameters,
            string connectionStringName,
            bool isStoredProcedure = false)
        {
            var connectionString = _config.GetConnectionString(connectionStringName);

            var commandType = CommandType.Text;
            if (isStoredProcedure)
            {
                commandType = CommandType.StoredProcedure;
            }
            using (IDbConnection connection = new SqlConnection(connectionString))
            {
                var rows = connection.Execute
                    (sqlStatement, parameters, commandType: commandType);
            }
        }
    }
}
