using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TravelExpertsDB
/// </summary>
public class TravelExpertsDB
{
    public TravelExpertsDB()
    {
    }
    public static SqlConnection GetConnection()
    {
        string connectionString =
            "Data Source=localhost\\SAIT;Initial Catalog=TravelExperts;Integrated Security=True";
        SqlConnection connection = new SqlConnection(connectionString);
        return connection;
    }
}