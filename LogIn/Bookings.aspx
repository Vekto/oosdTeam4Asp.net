<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Bookings.aspx.cs" Inherits="Bookings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Travel Experts | Invoices</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="BookingsForm" runat="server">
        <asp:ObjectDataSource ID="BookingInvoiceOds" runat="server" SelectMethod="GetInvoicesOfCustomer" TypeName="BookingInvoiceDataSource">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="-2147483648" Name="id" SessionField="CustomerID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        

        <div class="container">
            <div class="jumbotron">
                <img alt="" class="logo" src="Images/logo.jpg" />   
                <p>Experts in experience design.</p>
             </div>

            <div class="page-header">
                <h2 class="text-primary"><small>Invoices for </small><asp:Label ID="CustomerNameLabel" runat="server"/></h2>
            </div>

            <asp:ListView ID="InvoiceListView" runat="server" DataSourceID="BookingInvoiceOds" OnDataBound="InvoiceListView_DataBound" OnDataBinding="InvoiceListView_DataBinding" OnItemDataBound="InvoiceListView_ItemDataBound">
                <LayoutTemplate>
                    <div class="well" id="itemPlaceholderContainer" runat="server">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                </LayoutTemplate>

                <EmptyDataTemplate>
                    <span>No invoices yet, order some vacation packages!</span>
                </EmptyDataTemplate>

                <ItemTemplate>
                    <div class="panel panel-primary">
                        <div class="panel-heading panel-title">
                            <div class="row">
                                <div class="col-xs-6 text-left">
                                    <span class="hidden-xs">Invoice#:</span>
                                    <strong>
                                        <asp:Label ID="BookingCodeLabel" runat="server" Text='<%# Eval("BookingCode") %>' />
                                    </strong>
                                </div>
                                <div class="col-xs-6 text-right">
                                    <asp:Label ID="BookingDateLabel" runat="server" Text='<%# Eval("BookingDate", "{0:MMM dd, yyyy}") %>' />
                                </div>
                            </div>
                        </div>

                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-6 text-left">
                                    <h4>
                                        <span class="hidden-xs small">Destination</span>
                                        <span class="text-primary"><asp:Label ID="DestinationLabel" runat="server" Text='<%# Eval("Destination") %>' /></span>
                                    </h4>
                                    <h4 class="hidden-xs">
                                        <small>From</small>
                                        <strong><asp:Label ID="TripStartLabel" runat="server" Text='<%# Eval("TripStart", "{0:MMM dd, yyyy}") %>' /></strong>
                                        <small>to</small>
                                        <strong><asp:Label ID="TripEndLabel" runat="server" Text='<%# Eval("TripEnd", "{0:MMM dd, yyyy}") %>' /></strong>
                                    </h4>
                                    <h4 class="visible-xs small">
                                        <strong><asp:Label ID="TripStartSmallLabel" runat="server" Text='<%# Eval("TripStart", "{0:MMM dd, yyyy}") %>' /></strong>
                                        <br />&rarr;
                                        <strong><asp:Label ID="TripEndSmallLabel" runat="server" Text='<%# Eval("TripEnd", "{0:MMM dd, yyyy}") %>' /></strong>
                                    </h4>
                                </div>
                                
                                <div class="col-xs-6 text-right">
                                    <strong>
                                        <span class="label label-info h4">
                                            <asp:Label ID="BookingTypeLabel" runat="server" Text='<%# Eval("BookingType") %>' />
                                        </span>
                                    </strong>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-6 text-left">
                                    <h4 class="hidden-xs">
                                        <small>Route</small>
                                        <strong><asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' /></strong>
                                    </h4>
                                    <h5 class="visible-xs text-left">
                                        <asp:Label ID="DescriptionSmallLabel" runat="server" Text='<%# Eval("Description") %>' />
                                    </h5>

                                    <h4 class="text-left">
                                        <small>Passengers</small>
                                        <strong><asp:Label ID="TravelerCountLabel" runat="server" Text='<%# Eval("TravelerCount") %>' /></strong>
                                    </h4>
                                </div>
                                
                                <div class="col-xs-12 col-sm-4 col-sm-offset-2">
                                    <table class="table table-condensed">
                                        <tr>
                                            <td style="border-top: none;" class="text-right">Base Cost</td>
                                            <td style="border-top: none;" class="text-left"><asp:Label ID="BasePriceLabel" runat="server" Text='<%# Eval("BasePrice", "{0:C2}") %>' /></td>
                                        </tr>
                                        
                                        <tr>
                                            <td style="border-top: none;" class="text-right">Commission</td>
                                            <td style="border-top: none;" class="text-left"><asp:Label ID="AgencyCommissionLabel" runat="server" Text='<%# Eval("AgencyCommission", "{0:C2}") %>' /></td>
                                        </tr>
                                        <tr>
                                            <td style="border-top: none;" class="text-right"><asp:Label ID="FeeNameLabel" runat="server" Text='<%# Eval("FeeName") %>' /></td>
                                            <td style="border-top: none;" class="text-left"><asp:Label ID="FeeAmountLabel" runat="server" Text='<%# Eval("FeeAmount", "{0:C2}") %>' /></td>
                                        </tr>

                                        <tr>
                                            <td class="text-right"></td>
                                            <td class="text-left mark"><strong><asp:Label ID="TotalCostLabel" runat="server" Text='<%# Eval("TotalCost", "{0:C2}") %>' /></strong></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>
            
            <div class="well-sm bg-info text-right">
                <h2>
                    <strong class="small">All Invoice Total</strong>
                    <br/>
                    <asp:Label ID="TotalLabel" runat="server"/>
                </h2>
            </div>
        </div>
    </form>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
