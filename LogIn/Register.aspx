<%@ Page Language="C#" AutoEventWireup="true" UnobtrusiveValidationMode="None" CodeFile="Register.aspx.cs" Inherits="LogIn_Register" %>

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
        <p>Experts in experience design.</p>
    </div>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <asp:HyperLink class="navbar-brand" ID="HyperLink4" runat="server" NavigateUrl="Index.aspx">Travel Experts</asp:HyperLink>
            </div>
            <ul class="nav navbar-nav">
                <%--<li><a href="~/Index.aspx">Home</a></li>  --%>
                <li>
                    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="Index.aspx">Home</asp:HyperLink>
                </li>
                <li class="active">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Register.aspx">Register</asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink ID="HyperLink3" runat="server">My Purchases</asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="Login.aspx">Login</asp:HyperLink>
                </li>
            </ul>
        </div>
    </nav>
    <div class="col-lg-2"></div>
    <div class="col-lg-8 panel panel-default">
        <form role="form" id="RegisterForm" runat="server">
            <br/>

            <div class="col-lg-6">

                <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="First Name: "></asp:Label>
                    <asp:TextBox CssClass="form-control" ID="txtFirstName" runat="server" Width="279px" ForeColor="Red"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="firstNameValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First name is a required field." ForeColor="#FF6600" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Last Name: "></asp:Label>
                    <asp:TextBox ID="txtLastName" CssClass="form-control" runat="server" Width="279px" ForeColor="Red"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last name is a required field." ForeColor="#FF6600" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Address Name: "></asp:Label>
                    <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" Width="279px" ForeColor="Red"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is a required field." ForeColor="#FF6600" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="form-inline">
                    <asp:Label ID="Label5" runat="server" Text="City: "></asp:Label>
                    <asp:TextBox type="text" ID="txtCity" CssClass="form-control" runat="server" Width="125px" ForeColor="Red"></asp:TextBox>

                    <asp:Label ID="Label6" runat="server" Text="Province: "></asp:Label>
                    <asp:DropDownList ID="ddlProvinces" CssClass="dropdown" runat="server">
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
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCity" ErrorMessage="City is a required field." ForeColor="#FF6600" Display="Dynamic"></asp:RequiredFieldValidator>
                <div class="form-group">
                    <asp:Label ID="Label8" runat="server" Text="Country: "></asp:Label>
                    <asp:TextBox ID="txtCountry" CssClass="form-control" runat="server" Width="147px" ForeColor="Red"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtCountry" ErrorMessage="Country is a required field" ForeColor="#FF6600" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label7" runat="server" Text="Postal Code: "></asp:Label>
                    <asp:TextBox ID="txtPostal" CssClass="form-control" runat="server" Width="124px" ForeColor="Red"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPostal" ErrorMessage="Please Enter a Valid Postal Code" ForeColor="#FF6600" ValidationExpression="[A-Za-z]{1}\d{1}[A-Za-z][ -?]*\d{1}[A-Za-z]{1}\d{1}" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtPostal" Display="Dynamic" ErrorMessage="Postal code is a required field." ForeColor="#FF6600"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="form-group">
                    <asp:Label ID="Label9" runat="server" Text="Home Phone: "></asp:Label>
                    <asp:TextBox ID="txtHomePhone" CssClass="form-control" runat="server" Width="147px" ForeColor="Red"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtHomePhone" Display="Dynamic" ErrorMessage="Please input phone number as 000-000-0000." ForeColor="#FF6600" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtHomePhone" Display="Dynamic" ErrorMessage="Home phone is a required field." ForeColor="#FF6600"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label10" runat="server" Text="Buisness Phone: "></asp:Label>
                    <asp:TextBox ID="txtBusPhone" CssClass="form-control" runat="server" Width="147px" ForeColor="Red"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtBusPhone" ErrorMessage="Phone number is invalid, please try again" ForeColor="#FF6600" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label11" runat="server" Text="Email: "></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Width="187px" ForeColor="Red"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Please enter a valid email" ForeColor="#FF6600" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label12" runat="server" Text="Password: "></asp:Label>
                    <asp:TextBox ID="txtPass1" type="password" runat="server" CssClass="form-control" Width="183px" ForeColor="Red"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPass1" ErrorMessage="Please enter a password" ForeColor="#FF6600" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label13" runat="server" Text="Confirm: "></asp:Label>
                    <asp:TextBox type="password" ID="txtPass2" runat="server" CssClass="form-control" Width="183px" ForeColor="Red"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPass2" ErrorMessage="Please confirm your password" ForeColor="#FF6600" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <br/>
                <asp:Button ID="btnRegister" runat="server" CssClass="btn" Text="Register" OnClick="btnRegister_Click"/>
                <br/>
            </div>
            <br/>
            <br/>
            <br/>
        </form>
    </div>
</div>
</body>
</html>