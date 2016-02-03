// Author: Devin Ireland
// Project: LogIn
// Date: 2016-02

using System;
using System.Linq;
using System.Web.UI.WebControls;

// ReSharper disable All

public partial class Bookings : System.Web.UI.Page
{

    #region Properties

    private Customer _Customer;

    public Customer Customer
    {
        get { return _Customer ?? (_Customer = GetCustomerFromSession()); }
    }

    public decimal TotalAllInvoices { get; private set; }

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

    protected void InvoiceListView_DataBinding(object sender, EventArgs e)
    {
        TotalAllInvoices = 0M;
    }

    protected void InvoiceListView_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            var invoice = (BookingInvoice) e.Item.DataItem;
            TotalAllInvoices += invoice.TotalCost;
        }
    }

    protected void InvoiceListView_DataBound(object sender, EventArgs e)
    {
        TotalLabel.Text = TotalAllInvoices.ToString("C2");

        //var listView = sender as ListView;
        //if (listView == null) throw new InvalidOperationException("Sender is not a ListView");

        // Calculate total after BookingInvoices have been bound
        //var total = 0M;
        //foreach (var invoice in listView.Items
        //    .Select(lvi => (BookingInvoice)lvi.DataItem)
        //    .Where(i => i != null))
        //{
        //    total += invoice.TotalCost;
        //}
        //TotalAllInvoices = total;
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