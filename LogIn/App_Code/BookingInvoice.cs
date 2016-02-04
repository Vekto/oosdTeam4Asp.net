// Author: Devin Ireland
// Project: LogIn
// Date: 2016-02

using System;
using System.Activities.Validation;

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

    #region Refactor & Remove This

    /// <summary>
    /// This is a cheap hack that lets me style the icon based on the BookingType.
    /// UI logic shouldn't mixed in here like this, need to find a better solution.
    /// </summary>
    public string GetBookingTypeStyleClasses
    {
        get
        {
            switch (BookingType.Trim().ToLower())
            {
                case "business":
                    return "label label-info";
                case "leisure":
                    return "label label-success";
                case "group":
                    return "label label-warning";
                default:
                    return "label label-default";
            }
        }
    }

    #endregion

}