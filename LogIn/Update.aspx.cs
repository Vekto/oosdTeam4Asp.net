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
            loadCustomer();
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Button clicked = (Button) sender;
        string field = "txt" + clicked.ID;
        TextBox txtToChange = (TextBox)FindControl(field);
        
        if (clicked.Text =="Edit")
        {
            
            if (txtToChange == txtCity)
            {
                txtProv.Enabled = false;
                txtProv.Visible = false;
                ddlProvinces.Enabled = true;
                ddlProvinces.Visible = true;
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
            txtToChange.Enabled = false;
            clicked.CausesValidation = false;
            clicked.Text = "Edit";
        }

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
}