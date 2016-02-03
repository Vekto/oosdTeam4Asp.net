<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-1.9.1.js"></script>

    <style type="text/css">
        .logo {
            width: 600px;
            height: 192px;
        }        
    </style>
</head>

<body style="height: 561px">   
        <form id="form1" runat="server">
        <div class="container">

            <div class="jumbotron">
                <img alt="" class="logo" src="Images/logo.jpg" />   
                <p>Experts in experience design.</p>
             </div>
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <asp:HyperLink class="navbar-brand" id="HyperLinkGreet" runat="server">Travel Experts</asp:HyperLink>
                    </div>
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Home</a></li>
                        <li> <asp:HyperLink ID="HyperLinkRegister" runat="server">Register</asp:HyperLink></li>
                        <li> <asp:HyperLink ID="HyperLinkAccount" runat="server">Account</asp:HyperLink></li>                         
                        <li><asp:HyperLink ID="HyperLinkPurchases" runat="server">My Purchases</asp:HyperLink></li> 
                        <li> <asp:HyperLink ID="HyperLinkLogin" runat="server" NavigateUrl="Login.aspx">Login</asp:HyperLink></li>
                        <li> <asp:HyperLink ID="HyperLinkLogOut" runat="server" NavigateUrl="LogOut.aspx">Log Out</asp:HyperLink></li>
                      
                    </ul>
                </div>
            </nav>    

          <%--  <div id="myCarousel" class="carousel slide" data-ride="carousel">
              <!-- Indicators -->
              <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
              </ol>

              <!-- Wrapper for slides -->
              <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="Images/caribbean.jpg" alt="Caribbean" />
                </div>

                <div class="item">
                    <img src="Images/europe.jpg" alt="europe"/>
                </div>

                <div class="item">
                    <img src="Images/japan.jpg" alt="japan"/>
                </div>

                <div class="item">
                    <img src="Images/polynesia.jpg" alt="polynesia"/>
                </div>
              </div>

              <!-- Left and right controls -->
              <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
            </div>--%>

            <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
      <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
            <li data-target="#myCarousel" data-slide-to="3"></li>
      </ol>

      <!-- Wrapper for slides -->
      <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="Images/polynesia.jpg"/>
                <div class="carousel-caption">
                  <h3>Polynesian Paradise</h3>
                   <p>Peaceful huts on Polynesian water.</p>
                </div>
            </div>

            <div class="item">
                <img src="Images/europe.jpg"/>
                <div class="carousel-caption">
                  <h3>European Vacation</h3>
                   <p>Explore Europe's rich history and architecture.</p>
                </div>
            </div>

            <div class="item">
                <img src="Images/japan.jpg"/>
                <div class="carousel-caption">
                  <h3>Asian Expedition</h3>
                   <p>Lose yourself in thousands of Japanese cherry blossoms.</p>
                </div>
            </div>

            <div class="item">  
                <img src="Images/caribbean.jpg"/>
                <div class="carousel-caption">
                  <h3>Caribbean New Year</h3>
                   <p>Escape the world and taste the Caribbean.</p>
                </div>
            </div>
      </div>

  <!-- Left and right controls -->
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
      </a>
    </div>
 </div>

        </form>

</body>
</html>
