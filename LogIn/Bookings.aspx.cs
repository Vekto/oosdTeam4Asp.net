// Author: Devin Ireland
// Project: LogIn
// Date: 2016-02

using System;

// ReSharper disable All

public partial class Bookings : System.Web.UI.Page
{

    #region Properties

    private Customer _Customer;

    public Customer Customer
    {
        get { return _Customer ?? (_Customer = GetCustomerFromSession()); }
    }

    #endregion

    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        // TEST CODE: Dummy customer for testing
        Session["CustFirstName"] = "Dummy";
        Session["CustLastName"] = "Customer";
        Session["CustomerID"] = "122";
        // -------------------------------------

        CustomerNameLabel.Text = Customer != null ? Customer.ToString() : "nobody";
    }

    #endregion

    #region Private Methods

    private Customer GetCustomerFromSession()
    {
        int customerId;
        return new Customer
        {
            CustomerId = int.TryParse(Session["CustomerID"] as string ?? string.Empty, out customerId)
                ? customerId
                : int.MinValue,
            FirstName = Session["CustFirstName"] as string,
            LastName = Session["CustLastName"] as string
        };
    }

    #endregion

}