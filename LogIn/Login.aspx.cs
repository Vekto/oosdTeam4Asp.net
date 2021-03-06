﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
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

    public bool ValidateLogin()
    {
        //string connectionString = "Data Source=localhost\\SAIT;Initial Catalog=TravelExperts;Integrated Security=True";
        //SqlConnection connection = new SqlConnection(connectionString);
        SqlConnection connection = TravelExpertsDB.GetConnection();

        //sql select statement
        string selectStatement = "SELECT CustomerId, CustFirstName, CustLastName, UserName " + // Devin: added UserName
                                 "FROM Customers " +
                                 "WHERE UserName = @UserName AND Password = @Password";
        SqlCommand selectCommand = new SqlCommand(selectStatement, connection);
        selectCommand.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
        selectCommand.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());

        try
        {
            connection.Open();
            SqlDataReader reader = selectCommand.ExecuteReader();
            while (reader.Read()) //while there is data
            {
                Session["CustomerID"] = reader["CustomerID"].ToString();
                Session["CustFirstName"] = reader["CustFirstName"].ToString();
                Session["CustLastName"]= reader["CustLastName"].ToString();
                Session["UserName"] = reader["UserName"].ToString(); // Devin: added UserName
                Session["LoggedIn"] = "true";
            }
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        finally
        {
            connection.Close();
        }
        return true;
    } //END ValidateLogin()

    public void SuccessTest()
    {
        lblTest.Text = (string)(Session["CustomerID"]);                
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if( txtUserName.Text.Trim() != "" && txtPassword.Text.Trim() != "")
        {
            ValidateLogin(); //validates that login credentials match, sets session variables
           // SuccessTest();
           if (Session["LoggedIn"] != null) //if login was successful
            {
                //redirect to index page
                Response.Redirect("~/Index.aspx");
            }
            else
            {
                lblTest.Text = "Login failed.  Please check username and password";
            }            
        }
        else
        {
            lblTest.Text = "Please fill in all fields";
        }
    }    
}

