using System;
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

        

    }

    public bool ValidateLogin()
    {

        string connectionString = "Data Source=localhost\\SAIT;Initial Catalog=TravelExperts;Integrated Security=True";
        SqlConnection connection = new SqlConnection(connectionString);

        //sql select statement
        string selectStatement = "SELECT CustomerId, CustFirstName, CustLastName " +
                                 "FROM Customers " +
                                 "WHERE CustEmail = @CustEmail AND Password = @Password";
        SqlCommand selectCommand = new SqlCommand(selectStatement, connection);
        selectCommand.Parameters.AddWithValue("@CustEmail", txtEmail.Text.Trim());
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
        if( txtEmail.Text.Trim() != "" && txtPassword.Text.Trim() != "")
        {
            ValidateLogin(); //validates that login credentials match, sets session variables
            SuccessTest();
            //Server.Transfer("~/LogIn/Index.aspx");
            Response.Redirect("~/LogIn/Index.aspx");
        }
        else
        {
            lblTest.Text = "Please fill in all fields";           
        }
    }    
}

