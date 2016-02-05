using System.Collections;
using System.Collections.Generic;
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

    /// <summary>
    /// Populates a list of <see cref="Customer"/> objects
    /// </summary>
    /// <returns>List of <see cref="Customer"/></returns>
    public static List<Customer> GetCustomerNames()
    {
        var sql = @"SELECT c.CustomerId, c.CustFirstName, c.CustLastName, c.UserName FROM Customers c ORDER BY c.UserName";

        using (var connection = GetConnection())
        {
            connection.Open();
            using (var reader = new SqlCommand(sql, connection).ExecuteReader())
            {
                var customers = new List<Customer>();

                while (reader.Read())
                    customers.Add(new Customer
                    {
                        CustomerId = reader.GetInt32(0),
                        FirstName = reader.GetString(1),
                        LastName = reader.GetString(2),
                        Username = reader.GetString(3)
                    });

                return customers;
            }
        }
    }
}