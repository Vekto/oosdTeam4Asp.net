using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LogIn_Update : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["Loggedin"] != null || Session["CustomerID"] != null)
        {
            if (!IsPostBack)
            {
                // put codes here
                loadCustomer();
            }
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
            Response.Redirect("Login.aspx");
        }
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnEdit_Click(object sender, EventArgs e)
    {


            Button clicked = (Button) sender;
            string field = "txt" + clicked.ID;
            TextBox txtToChange = (TextBox) FindControl(field);

            if (clicked.Text == "Edit" || clicked.Text == "Change Password")
            {

                if (txtToChange == txtCity)
                {
                    txtProv.Enabled = false;
                    txtProv.Visible = false;
                    ddlProvinces.Enabled = true;
                    ddlProvinces.Visible = true;
                }
                else if (txtToChange == txtPass1)
                {
                    lblpass1.Enabled = true;
                    lblpass2.Enabled = true;
                    lblpass1.Visible = true;
                    lblpass2.Visible = true;
                    txtPass1.Enabled = true;
                    txtPass2.Enabled = true;
                    txtPass1.Visible = true;
                    txtPass2.Visible = true;
                    passValidator1.Enabled = true;
                    passValidator2.Enabled = true;
                }
                txtToChange.Enabled = true;
                clicked.CausesValidation = true;
                clicked.Text = "Save";
            }
            else
            {
                if (txtToChange == txtCity)
                {
                    txtProv.Enabled = true;
                    txtProv.Visible = true;
                    ddlProvinces.Enabled = false;
                    ddlProvinces.Visible = false;
                }
                else if (txtToChange == txtPass1)
                {
                    lblpass1.Enabled = false;
                    lblpass2.Enabled = false;
                    lblpass1.Visible = false;
                    lblpass2.Visible = false;
                    txtPass1.Enabled = false;
                    txtPass2.Enabled = false;
                    txtPass1.Visible = false;
                    txtPass2.Visible = false;
                    passValidator1.Enabled = false;
                    passValidator2.Enabled = false;
                }
                txtToChange.Enabled = false;
                clicked.CausesValidation = false;
                
                if (clicked.ID == "pass1")
                {
                    clicked.Text = "Change Password";
                savePassword();


                }
                else
                {
                saveCustomer();
                clicked.Text = "Edit";
                Response.Redirect("Update.aspx");
                }
            }
        

    }

    private void saveCustomer()
    {
            SqlConnection connection = TravelExpertsDB.GetConnection();
            string selectString = "Update Customers " +
                                  "SET " +
                                  "CustFirstName = @CustFirstName, " +
                                  "CustLastName = @CustLastName, " +
                                  "CustAddress = @CustAddress, " +
                                  "CustCity = @CustCity, " +
                                  "CustProv = @CustProv, " +
                                  "CustPostal = @CustPostal, " +
                                  "CustCountry = @CustCountry, " +
                                  "CustHomePhone = @CustHomePhone, " +
                                  "CustBusPhone = @CustBusPhone, " +
                                  "CustEmail = @CustEmail " +
                                  "WHERE CustomerId = @CustomerId";
            SqlCommand selectCommand = new SqlCommand(selectString, connection);
            selectCommand.Parameters.AddWithValue("@CustFirstName", txtFirstName.Text);
            selectCommand.Parameters.AddWithValue("@CustLastName", txtLastName.Text);
            selectCommand.Parameters.AddWithValue("@CustAddress", txtAddress.Text);
            selectCommand.Parameters.AddWithValue("@CustCity", txtCity.Text);
            selectCommand.Parameters.AddWithValue("@CustProv", txtProv.Text);
            selectCommand.Parameters.AddWithValue("@CustPostal", txtPostal.Text);
            selectCommand.Parameters.AddWithValue("@CustCountry", txtCountry.Text);
            selectCommand.Parameters.AddWithValue("@CustHomePhone", txtHomePhone.Text);
            selectCommand.Parameters.AddWithValue("@CustBusPhone", txtBusPhone.Text);
            selectCommand.Parameters.AddWithValue("@CustEmail", txtEmail.Text);
            selectCommand.Parameters.AddWithValue("@CustomerId", Session["CustomerID"]);
            connection.Open();
            int Count = selectCommand.ExecuteNonQuery();
            Session["CustFirstName"] = txtFirstName.Text;
            Session["CustLastName"] = txtLastName.Text;
            HyperLinkGreet.Text = "Hello, " + Session["CustFirstName"] + "!";
             
    }

    protected void loadCustomer()
    {
        SqlConnection connection = TravelExpertsDB.GetConnection();
        string selectString = "Select * from Customers " +
                                "where CustomerId = @CustomerId";
        SqlCommand selectCommand = new SqlCommand(selectString,connection);
        selectCommand.Parameters.AddWithValue("@CustomerId", Session["CustomerID"]);
        connection.Open();
        SqlDataReader reader = selectCommand.ExecuteReader();
        if (reader.Read())
        {

            txtFirstName.Text = reader["CustFirstName"].ToString();
            txtLastName.Text = reader["CustLastName"].ToString();
            txtAddress.Text = reader["CustAddress"].ToString();
            txtCity.Text = reader["CustCity"].ToString();
            txtProv.Text = reader["CustProv"].ToString();
            txtPostal.Text = reader["CustPostal"].ToString();
            txtCountry.Text = reader["CustCountry"].ToString();
            txtHomePhone.Text = Regex.Replace(reader["CustHomePhone"].ToString(), @"(\d{3})(\d{3})(\d{4})", "$1-$2-$3");
            txtBusPhone.Text = Regex.Replace(reader["CustBusPhone"].ToString(), @"(\d{3})(\d{3})(\d{4})", "$1-$2-$3");
            txtEmail.Text = reader["CustEmail"].ToString();
            
        }

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Update.aspx");
    }

    private void savePassword()
    {
        SqlConnection connection = TravelExpertsDB.GetConnection();
        string selectString = "Update Customers " +
                              "SET " +
                              "Password = @Password " +
                              "WHERE CustomerId = @CustomerId";
        SqlCommand selectCommand = new SqlCommand(selectString, connection);
        selectCommand.Parameters.AddWithValue("@Password", txtPass1.Text);
        selectCommand.Parameters.AddWithValue("@CustomerId", Session["CustomerID"]);
        connection.Open();
        int Count = selectCommand.ExecuteNonQuery();
    }

}