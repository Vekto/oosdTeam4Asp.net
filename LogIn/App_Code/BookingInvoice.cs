// Author: Devin Ireland
// Project: LogIn
// Date: 2016-02

using System;
// ReSharper disable All

/// <summary>
/// Info from Bookings & related tables
/// </summary>
public class BookingInvoice
{
    public int BookingDetailId { get; set; } // Bookings
    public DateTime BookingDate { get; set; } // Bookings
    public string BookingCode { get; set; } // Bookings
    public int TravelerCount { get; set; } // Bookings

    public string BookingType { get; set; } // TripTypes

    public DateTime TripStart { get; set; } // BookingDetails
    public DateTime TripEnd { get; set; } // BookingDetails
    public string Description { get; set; } // BookingDetails
    public string Destination { get; set; } // BookingDetails
    public decimal BasePrice { get; set; } // BookingDetails
    public decimal AgencyCommission { get; set; } // BookingDetails

    public string FeeName { get; set; } // Fees
    public decimal FeeAmount { get; set; } // Fees

    public decimal TotalCost { get { return FeeAmount + BasePrice + AgencyCommission; } }
}