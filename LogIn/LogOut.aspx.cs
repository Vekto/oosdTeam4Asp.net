﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LogIn_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //clear session variables and redirect to the index page
        Session.Remove("LoggedIn");
        Session.Remove("CustFirstName");
        Session.Remove("CustLastName");
        Session.Remove("UserName"); // Devin: added UserName
        Session.Remove("CustomerID");
        Response.Redirect("~/Index.aspx");
    }
}