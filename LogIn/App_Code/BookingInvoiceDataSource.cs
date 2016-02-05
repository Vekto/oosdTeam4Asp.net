// Author: Devin Ireland
// Project: LogIn
// Date: 2016-02

using System;
using System.Collections.Generic;
using System.Data.SqlClient;
// ReSharper disable All

public static class BookingInvoiceDataSource
{
    //private static SqlConnection GetConnection()
    //{
    //    return
    //        new SqlConnection(
    //            @"Data Source=GENGHIS-EDU\SQLEXPRESS2012;Initial Catalog=TravelExperts;Integrated Security=True;Connect Timeout=15;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
    //}

    public static IEnumerable<BookingInvoice> GetInvoicesOfCustomer(int id)
    {
        // Note: Assuming date values are never null, even though technically they can be.
        //       Database should be updated to disallow null dates.

        using (var conn = TravelExpertsDB.GetConnection())
        {
            const string sql =
                "SELECT bd.BookingDetailId, b.BookingDate, b.BookingNo, b.TravelerCount, t.TTName, bd.TripStart, bd.TripEnd, bd.[Description], bd.Destination, (bd.BasePrice + bd.AgencyCommission) AS 'Price', f.FeeName, f.FeeAmt" +
                " FROM BookingDetails bd, Bookings b, Fees f, TripTypes t" +
                " WHERE bd.BookingId=b.BookingId AND bd.FeeId= f.FeeId AND b.TripTypeId=t.TripTypeId AND b.CustomerId=@CustomerId" +
                " ORDER BY b.BookingDate";

            var command = new SqlCommand(sql, conn);
            command.Parameters.AddWithValue("CustomerId", id);

            conn.Open();
            using (var reader = command.ExecuteReader())
            {
                var result = new List<BookingInvoice>();
                while (reader.Read())
                {
                    result.Add(new BookingInvoice
                    {
                        BookingDetailId = reader.GetInt32(0),
                        BookingDate = reader.GetDateTime(1),
                        BookingCode = reader.GetString(2),
                        TravelerCount = Convert.ToInt32(reader.GetDouble(3)),
                        BookingType = reader.GetString(4),
                        TripStart = reader.GetDateTime(5),
                        TripEnd = reader.GetDateTime(6),
                        Description = reader.GetString(7),
                        Destination = reader.GetString(8),
                        Price = reader.GetDecimal(9), // base price + commisssion
                        //AgencyCommission = reader.GetDecimal(10),
                        FeeName = reader.GetString(10),
                        FeeAmount = reader.GetDecimal(11)
                    });
                }
                return result;
            }
        }
    }
}