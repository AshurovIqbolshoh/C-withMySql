using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace ApplicationISU
{
    public class DBConnection
    {
        public static MySqlConnection DbConnect()
        {
            string conStr = "Server=localhost;database=mdt;username=root;password=;";
            MySqlConnection conn = new MySqlConnection(conStr);
            return conn;
        }
    }
}
