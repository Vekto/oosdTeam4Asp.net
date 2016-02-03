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

    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (txtPass1.Text == txtPass2.Text)
        {
            if (IsValid)
            {
                SqlConnection conn = TravelExpertsDB.GetConnection();
                string insertStatement =
                    "INSERT INTO Customers " +
                    "(CustFirstName, CustLastName, CustAddress, CustCity, CustProv, CustPostal, CustCountry, CustHomePhone, CustBusPhone, CustEmail, Password) " +
                    "VALUES(@CustFirstName, @CustLastName, @CustAddress, @CustCity, @CustProv, @CustPostal, @CustCountry, @CustHomePhone, @CustBusPhone, @CustEmail, @Password)";
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
}