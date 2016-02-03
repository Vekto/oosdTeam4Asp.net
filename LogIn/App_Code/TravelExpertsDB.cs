using System.Data.SqlClient;
// ReSharper disable All

public static class TravelExpertsDB
{
    public static SqlConnection GetConnection()
    {
        string connectionString =
            "Data Source=localhost\\SAIT;Initial Catalog=TravelExperts;Integrated Security=True";
        SqlConnection connection = new SqlConnection(connectionString);
        return connection;
    }
}