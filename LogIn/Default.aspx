<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 <%--   <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <link href="Content/bootstrap-theme.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>--%>

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
                        <asp:HyperLink class="navbar-brand" ID="HyperLink4" runat="server" NavigateUrl="~/Index.aspx">Travel Experts</asp:HyperLink>
                    </div>
                    <ul class="nav navbar-nav">    
                        <%--<li><a href="~/Index.aspx">Home</a></li>  --%> 
                        <li> <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Index.aspx">Home</asp:HyperLink></li> 
                        <li> <asp:HyperLink ID="HyperLink1" runat="server">Register</asp:HyperLink></li>
                        <li class="active"> <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Default.aspx">Login</asp:HyperLink></li> 
                        <li><asp:HyperLink ID="HyperLink3" runat="server">My Purchases</asp:HyperLink></li> 
                    </ul>
                </div>
            </nav>  

            <form id="form1" runat="server">
                
                    <br />
                   
                    <br />
                    <asp:TextBox ID="txtEmail" runat="server" Width="279px" ForeColor="Red"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label3" runat="server" Text="Password:"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtPassword" runat="server" Width="279px"></asp:TextBox>
                    <br />
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="lblTest" runat="server" ForeColor="Red"></asp:Label>
            </form>


<%--            <form role="form">
              <div class="form-group">
                 <asp:Label ID="Label2" runat="server" Text="Email:"></asp:Label>
                <input type="email" class="form-control" id="email"/>
              </div>
              <div class="form-group">
                <label id="Label3" for="pwd">Password:</label>
                <input type="password" class="form-control" id="pwd"/>
              </div>
            
              <button type="submit" class="btn btn-default">Submit</button>
            </form>--%>

       </div>
</body>
</html>
