using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LogIn_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Remove("LoggedIn");
        Session.Remove("CustFirstName");
        Session.Remove("CustLastName");
        Response.Redirect("~/LogIn/Index.aspx");
    }
}