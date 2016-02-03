<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    
    <style type="text/css">
        .auto-style1 {
            width: 600px;
            height: 192px;
        }
    </style>

</head>
<body style="height: 503px">
    <div class="container">

        <div class="jumbotron">
            <img alt="" class="logo" src="Images/logo.jpg" />   
            <p>Experts in experience design.</p>
        </div>

        <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">                     
                        <asp:HyperLink class="navbar-brand" ID="HyperLinkGreet" runat="server">Travel Experts</asp:HyperLink>
                    </div>
                    <ul class="nav navbar-nav">    
                        <%--<li><a href="~/Index.aspx">Home</a></li>  --%> 
                        <li> <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="Index.aspx">Home</asp:HyperLink></li> 
                        <li> <asp:HyperLink ID="HyperLinkRegister" NavigateUrl="Register.aspx" runat="server">Register</asp:HyperLink></li>
                        <li><asp:HyperLink ID="HyperLink3" runat="server">My Purchases</asp:HyperLink></li> 
                        <li class="active"> <asp:HyperLink ID="HyperLinkLogin" runat="server" NavigateUrl="Login.aspx" OnClick="HyperLinkLogin_Click">Login</asp:HyperLink></li>
                         
                    </ul>
                </div>
            </nav>  

            <form role="form" id="form1" runat="server">                
                    <br />                   
                    <br />
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="User Name:"></asp:Label>
                    <asp:TextBox class="form-control" ID="txtUserName" runat="server" Width="279px"></asp:TextBox>
                </div>
                <div class="form-group">
                    <%--<br />--%>
                    <asp:Label ID="Label3" runat="server" Text="Password:"></asp:Label>
                    <br />
                    <asp:TextBox class="form-control" type="password" ID="txtPassword"  runat="server" Width="279px"></asp:TextBox>
                    <br />
                </div>
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="lblTest" runat="server" ForeColor="#FF6600"></asp:Label>
            </form>
       </div>
</body>
</html>
