using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LogIn_Register : System.Web.UI.Page
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

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (txtPass1.Text == txtPass2.Text && checkUserName() )
        {
            if (IsValid)
            {
                SqlConnection conn = TravelExpertsDB.GetConnection();
                string insertStatement =
                    "INSERT INTO Customers " +
                    "(CustFirstName, CustLastName, CustAddress, CustCity, CustProv, CustPostal, CustCountry, CustHomePhone, CustBusPhone, CustEmail, Password, UserName) " +
                    "VALUES(@CustFirstName, @CustLastName, @CustAddress, @CustCity, @CustProv, @CustPostal, @CustCountry, @CustHomePhone, @CustBusPhone, @CustEmail, @Password, @UserName)";
                SqlCommand insertCommand =
                    new SqlCommand(insertStatement, conn);
                insertCommand.Parameters.AddWithValue(
                    "@CustFirstName", txtFirstName.Text);
                insertCommand.Parameters.AddWithValue(
                    "@CustLastName", txtLastName.Text);
                insertCommand.Parameters.AddWithValue(
                    "@CustAddress", txtAddress.Text);
                insertCommand.Parameters.AddWithValue(
                    "@CustCity", txtCity.Text);
                insertCommand.Parameters.AddWithValue(
                    "@CustProv", ddlProvinces.Text);
                insertCommand.Parameters.AddWithValue(
                    "@CustPostal", txtPostal.Text);
                insertCommand.Parameters.AddWithValue(
                    "@CustCountry", txtCountry.Text);
                insertCommand.Parameters.AddWithValue(
                    "@CustHomePhone", txtHomePhone.Text);
                insertCommand.Parameters.AddWithValue(
                    "@CustBusPhone", txtBusPhone.Text);
                insertCommand.Parameters.AddWithValue(
                    "@CustEmail", txtEmail.Text);
                insertCommand.Parameters.AddWithValue(
                    "@Password", txtPass1.Text);
                insertCommand.Parameters.AddWithValue(
                    "@UserName", txtUser.Text);
                try
                {
                    conn.Open();
                    insertCommand.ExecuteNonQuery();
                    string selectStatement =
                        "SELECT IDENT_CURRENT('Customers') FROM Customers";
                    SqlCommand selectCommand =
                        new SqlCommand(selectStatement, conn);
                    Session["CustomerID"] = Convert.ToString(selectCommand.ExecuteScalar());
                    Session["LoggedIn"] = "true";
                    Session["CustFirstName"] = txtFirstName.Text;
                    Session["CustLastName"] = txtLastName.Text;
                }
                catch (SqlException ex)
                {
                    throw ex;
                }
                finally
                {
                    conn.Close();
                }
                Response.Redirect("Index.aspx");
            }
        }
    }

    private bool checkUserName()
    {
        SqlConnection connection = TravelExpertsDB.GetConnection();

        //sql select statement
        string selectStatement = "SELECT UserName " +
                                 "FROM Customers " +
                                 "WHERE UserName = @UserName";
        SqlCommand selectCommand = new SqlCommand(selectStatement, connection);
        selectCommand.Parameters.AddWithValue("@UserName", txtUser.Text.Trim());
        
        
            connection.Open();
            SqlDataReader reader = selectCommand.ExecuteReader();
            if (reader.Read()) //while there is data
            {
                lblUserName.Visible = true;
                return false;
            }
        
        return true;
    }
}