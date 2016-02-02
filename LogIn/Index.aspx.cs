using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

       if (Session["LoggedIn"] != null) //if customer is logged in
        {
            HyperLink1.Text = "Account";
            HyperLink5.Text = "Hello " + Session["CustFirstName"];
            HyperLink2.Text = "Log Out";
            //HyperLink1.Text = "Hello " + Session["CustFirstName"] + " " + Session["CustLastName"];
        }
    }

   

    
}