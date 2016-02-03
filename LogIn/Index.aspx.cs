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
            HyperLinkRegister.Text = "Account";
            HyperLinkGreet.Text = "Hello " + Session["CustFirstName"];       
            HyperLinkLogin.Visible = false;
            HyperLinkLogOut.Visible = true;
            //TODO: hide log in hyperlink


            //HyperLink1.Text = "Hello " + Session["CustFirstName"] + " " + Session["CustLastName"];
        }
        else
        {
            HyperLinkLogin.Visible = true;
            HyperLinkLogOut.Visible = false;
        }
    }

    //protected void HyperLinkLogin_Click(object sender, EventArgs e)
    //{
    //    if (Session["LoggedIn"] != null)
    //    {
    //        Session.Remove("LoggedIn");
    //        Session.Remove("CustFirstName");
    //        Session.Remove("CustLastName");
    //        HyperLinkGreet.Text = "Travel Experts";

    //    }
    //    else
    //    {
    //        Response.Redirect("http://google.ca");
    //        //HyperLinkLogin.NavigateUrl = "Login.aspx";
    //    }






    //}
}