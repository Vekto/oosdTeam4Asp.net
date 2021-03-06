﻿<%@ Page Language="C#" AutoEventWireup="true" UnobtrusiveValidationMode="None" CodeFile="Update.aspx.cs" Inherits="LogIn_Update" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    </head>
<body style="height: 503px">
<div class="container">
    <div class="jumbotron">
        <img alt="" class="logo" src="Images/logo.jpg"/>
        <p>Leading the way to your destination.</p>
    </div>
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <asp:HyperLink class="navbar-brand" id="HyperLinkGreet" runat="server" >Travel Experts</asp:HyperLink>
                    </div>
                    <ul class="nav navbar-nav">
                        <li><asp:HyperLink ID="hlHome" runat="server" NavigateUrl="Index.aspx">Home</asp:HyperLink></li>
                        <li> <asp:HyperLink ID="HyperLinkRegister" NavigateUrl="Register.aspx" runat="server" >Register</asp:HyperLink></li>
                        <li class="active"> <asp:HyperLink ID="HyperLinkAccount" runat="server" NavigateUrl="Update.aspx">Account</asp:HyperLink></li>                         
                        <li><asp:HyperLink ID="HyperLinkPurchases" NavigateUrl="Bookings.aspx" runat="server">My Purchases</asp:HyperLink></li> 
                        <li> <asp:HyperLink ID="HyperLinkLogin" runat="server" NavigateUrl="Login.aspx">Login</asp:HyperLink></li>
                        <li> <asp:HyperLink ID="HyperLinkLogOut" runat="server" NavigateUrl="LogOut.aspx">Log Out</asp:HyperLink></li>
                      
                    </ul>
                </div>
            </nav>
    <div class="col-lg-2"></div>
    <div class="col-lg-8 panel panel-default">
        <form autocomplete="off" role="form" id="RegisterForm" runat="server">
            <br/>
            <div class="col-lg-6">

                <div class="form-inline">
                    <asp:Label ID="Label4" runat="server" Text="First Name: "></asp:Label>
                    <asp:TextBox CssClass="form-control" ID="txtFirstName"  runat="server" Width="279px" ForeColor="Black" Enabled ="False"></asp:TextBox>
                    <asp:Button ID="FirstName" runat="server" CssClass="btn-warning" Text="Edit" OnClick="btnEdit_Click"/>
                    <asp:RequiredFieldValidator ID="firstNameValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First name is a required field." ForeColor="#FF6600" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="form-inline">
                    <asp:Label ID="Label1" runat="server" Text="Last Name: "></asp:Label>
                    <asp:TextBox ID="txtLastName" CssClass="form-control" runat="server" Width="279px" ForeColor="black" enabled ="false"></asp:TextBox>
                    <asp:Button ID="LastName" runat="server" CssClass="btn-warning" Text="Edit" OnClick="btnEdit_Click"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last name is a required field." ForeColor="#FF6600" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="form-inline">
                    <asp:Label ID="Label2" runat="server" Text="Address Name: "></asp:Label>
                    <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" Width="279px" ForeColor="black" enabled ="false"></asp:TextBox>
                    <asp:Button ID="Address" runat="server" CssClass="btn-warning" Text="Edit" OnClick="btnEdit_Click"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is a required field." ForeColor="#FF6600" Display="Dynamic"></asp:RequiredFieldValidator>
                </div><br/>
                <div class="form-inline">
                    <asp:Label ID="Label5" runat="server" Text="City: "></asp:Label>
                    <asp:TextBox type="text" ID="txtCity" CssClass="form-control" runat="server" Width="125px" ForeColor="black" enabled ="false"></asp:TextBox>

                    <asp:Label ID="Label6" runat="server" Text="Province: "></asp:Label>
                    <asp:TextBox type="text" ID="txtProv" CssClass="form-control" runat="server" Width="50px" ForeColor="black" enabled ="false">AB</asp:TextBox>
                    <asp:DropDownList ID="ddlProvinces" CssClass="dropdown" enabled ="true" visible="False" runat="server">
                        <asp:ListItem>AB</asp:ListItem>
                        <asp:ListItem>BC</asp:ListItem>
                        <asp:ListItem>QC</asp:ListItem>
                        <asp:ListItem>MB</asp:ListItem>
                        <asp:ListItem>NB</asp:ListItem>
                        <asp:ListItem>NS</asp:ListItem>
                        <asp:ListItem>PE</asp:ListItem>
                        <asp:ListItem>SK</asp:ListItem>
                        <asp:ListItem>NL</asp:ListItem>
                        <asp:ListItem>ON</asp:ListItem>
                    </asp:DropDownList>
                      <asp:Button ID="City" runat="server" CssClass="btn-warning" Text="Edit" OnClick="btnEdit_Click"/>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCity" ErrorMessage="City is a required field." ForeColor="#FF6600" Display="Dynamic"></asp:RequiredFieldValidator>
                <div class="form-inline" enabled ="false">
                    <asp:Label ID="Label8" runat="server" Text="Country: "></asp:Label><br/>
                    <asp:TextBox ID="txtCountry" CssClass="form-control" enabled ="false" runat="server" Width="147px" ForeColor="black"></asp:TextBox>
                    <asp:Button ID="Country" runat="server" CssClass="btn-warning" Text="Edit" OnClick="btnEdit_Click"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtCountry" ErrorMessage="Country is a required field" ForeColor="#FF6600" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="form-inline">
                    <asp:Label ID="Label7" runat="server" Text="Postal Code: "></asp:Label><br/>
                    <asp:TextBox ID="txtPostal" CssClass="form-control" runat="server" enabled ="false" Width="124px" ForeColor="black"></asp:TextBox>
                    <asp:Button ID="Postal" runat="server" CssClass="btn-warning" Text="Edit" OnClick="btnEdit_Click"/>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPostal" ErrorMessage="Please Enter a Valid Postal Code" ForeColor="#FF6600" ValidationExpression="[A-Za-z]{1}\d{1}[A-Za-z][ -?]*\d{1}[A-Za-z]{1}\d{1}" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtPostal" Display="Dynamic" ErrorMessage="Postal code is a required field." ForeColor="#FF6600"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="form-inline">
                    <asp:Label ID="Label9" runat="server" Text="Home Phone: "></asp:Label><br/>
                    <asp:TextBox ID="txtHomePhone" CssClass="form-control" runat="server" enabled ="false" Width="147px" ForeColor="black"></asp:TextBox>
                    <asp:Button ID="HomePhone" runat="server" CssClass="btn-warning" Text="Edit" OnClick="btnEdit_Click"/>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtHomePhone" Display="Dynamic" ErrorMessage="Please input phone number as 000-000-0000." ForeColor="#FF6600" ValidationExpression="^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtHomePhone" Display="Dynamic" ErrorMessage="Home phone is a required field." ForeColor="#FF6600"></asp:RequiredFieldValidator>
                </div>
                <div class="form-inline">
                    <asp:Label ID="Label10" runat="server" Text="Buisness Phone: "></asp:Label><br/>
                    <asp:TextBox ID="txtBusPhone" CssClass="form-control" runat="server" Width="147px" ForeColor="black" Enabled="False"></asp:TextBox>
                    <asp:Button ID="BusPhone" runat="server" CssClass="btn-warning" Text="Edit" OnClick="btnEdit_Click"/>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtBusPhone" ErrorMessage="Phone number is invalid, please try again" ForeColor="#FF6600" ValidationExpression="^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
                <div class="form-inline">
                    <asp:Label ID="Label11" runat="server" Text="Email: "></asp:Label><br/>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"  Width="187px" ForeColor="black" Enabled="False"></asp:TextBox>
                    <asp:Button ID="Email" runat="server" CssClass="btn-warning" Text="Edit" OnClick="btnEdit_Click"/>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Please enter a valid email" ForeColor="#FF6600" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}\s*$"></asp:RegularExpressionValidator>
                </div><br/>
                
                <div class="form-inline">
                    <asp:Label ID="lblpass1" runat="server" Text="Password: " visible="false" enabled="false"></asp:Label><br/>
                    <asp:TextBox ID="txtPass1" type="password" runat="server" CssClass="form-control"  Width="183px" Enabled="False" Visible="False" ForeColor="black"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="passValidator1" runat="server" ControlToValidate="txtPass2" ErrorMessage="Please enter a password" ForeColor="#FF6600" Display="Dynamic" Enabled="False"></asp:RequiredFieldValidator>
                </div>         
                <div class="form-inline" visible="false">
                    <asp:Label ID="lblpass2" runat="server" Text="Confirm: " visible="false" enable="false"></asp:Label><br/>
                    <asp:TextBox  autocomplete="off" type="password" ID="txtPass2" runat="server" CssClass="form-control" Width="183px" Visible="False" Enabled="False" ForeColor="black"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="passValidator2" runat="server" ControlToValidate="txtPass2" ErrorMessage="Please confirm your password" ForeColor="#FF6600" Display="Dynamic" Enabled="False"></asp:RequiredFieldValidator><br/>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPass1" ControlToValidate="txtPass2" Enabled="true" ForeColor="Red" ErrorMessage="Passwords Must Match!"></asp:CompareValidator>
                </div>
                <asp:Button ID="pass1" runat="server" CssClass="btn-warning" Text="Change Password" OnClick="btnEdit_Click"/>
                <br/>
                <br/>
                <asp:Button ID="btnCancel" runat="server" CssClass="btn-warning" Text="Cancel" CausesValidation="False" OnClick="btnCancel_Click"/>
                </div>
            <br/>
            <br/>
            <br/>
        </form>
    </div>
</div>
</body>
</html>
