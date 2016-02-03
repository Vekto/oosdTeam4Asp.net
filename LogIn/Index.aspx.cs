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
            //customize navbar links and text for logged in user
            HyperLinkRegister.Text = "Account";
            HyperLinkGreet.Text = "Hello, " + Session["CustFirstName"] + "!";       
            HyperLinkLogin.Visible = false;
            HyperLinkLogOut.Visible = true;
            HyperLinkRegister.Visible = false;
            HyperLinkAccount.Visible = true;       
        }
        else
        {
            //customize navbar links for user who is not logged in

            HyperLinkLogin.Visible = true;
            HyperLinkLogOut.Visible = false;
            HyperLinkRegister.Visible = true;
            HyperLinkAccount.Visible = false;
        }
    }

   
}