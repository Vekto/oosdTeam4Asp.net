<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Bookings.aspx.cs" Inherits="Bookings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Travel Experts | Invoices</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
    <form id="BookingsForm" runat="server">
        <div class="container">
            <div class="jumbotron">
                <img alt="" class="logo" src="Images/logo.jpg" />   
                <p>Experts in experience design.</p>
             </div>


            <div>
                <h2>Invoices for <asp:Label ID="CustomerNameLabel" runat="server"/></h2>
            </div>

            <asp:ObjectDataSource ID="BookingInvoiceOds" runat="server" SelectMethod="GetInvoicesOfCustomer" TypeName="BookingInvoiceDataSource">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="-2147483648" Name="id" SessionField="CustomerID" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            
            <asp:ListView ID="InvoiceListView" runat="server" DataSourceID="BookingInvoiceOds" OnDataBound="InvoiceListView_DataBound" OnDataBinding="InvoiceListView_DataBinding" OnItemDataBound="InvoiceListView_ItemDataBound">
                <LayoutTemplate>
                    <div id="itemPlaceholderContainer" runat="server">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="">
                        
                    </div>
                </LayoutTemplate>

                <EmptyDataTemplate>
                    <span>No invoices yet, order some vacation packages!</span>
                </EmptyDataTemplate>

                <ItemTemplate>
                    <table style="width: 600pt; border: 3pt solid black; padding: 5pt;">
                        <tr>
                            <td>
                                Invoice# <b><asp:Label ID="BookingCodeLabel" runat="server" Text='<%# Eval("BookingCode") %>' /></b>
                            </td>
                            <td style="text-align: right;">
                                <b><asp:Label ID="BookingDateLabel" runat="server" Text='<%# Eval("BookingDate", "{0:MMM dd, yyyy}") %>' /></b>
                            </td>
                        </tr>
                        <%--<tr>
                            <td>
                                left1
                            </td>
                            <td style="text-align: right;">
                                right1
                            </td>
                        </tr>
                        <tr>
                            <td>
                                left2
                            </td>
                            <td style="text-align: right;">
                                right2
                            </td>
                        </tr>--%>

                        

                        <tr>
                            <td rowspan="2">
                                <table style="width: 600pt; border: 1pt solid green; padding: 5pt;">
                                    <tr>
                                        <td>
                                            Destination:
                                            <asp:Label ID="DestinationLabel" runat="server" Text='<%# Eval("Destination") %>' />
                                            <br />
                                            From
                                            <b><asp:Label ID="TripStartLabel" runat="server" Text='<%# Eval("TripStart", "{0:MMM dd, yyyy}") %>' /></b>
                                            to
                                            <b><asp:Label ID="TripEndLabel" runat="server" Text='<%# Eval("TripEnd", "{0:MMM dd, yyyy}") %>' /></b>
                                        </td>
                                        <td style="text-align: right; width: 100%">
                                            <asp:Label ID="BookingTypeLabel" runat="server" Text='<%# Eval("BookingType") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            
                                        </td>
                                        <td style="text-align: right;">
                                            
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    
                    <br /><br /><br /><br />
                    <span style="">
                        Invoice: 
                        <asp:Label ID="BookingCodeLabel2" runat="server" Text='<%# Eval("BookingCode") %>' />
                         | 
                        <asp:Label ID="BookingDateLabel2" runat="server" Text='<%# Eval("BookingDate", "{0:MMM dd, yyyy}") %>' />
                        <br />
                        
                        <asp:Label ID="BookingTypeLabel2" runat="server" Text='<%# Eval("BookingType") %>' />
                        <br />
                        
                        Destination:
                        <asp:Label ID="DestinationLabel2" runat="server" Text='<%# Eval("Destination") %>' />
                        <br />
                        
                        From
                        <b><asp:Label ID="TripStartLabel2" runat="server" Text='<%# Eval("TripStart", "{0:MMM dd, yyyy}") %>' /></b>
                         to 
                        <b><asp:Label ID="TripEndLabel2" runat="server" Text='<%# Eval("TripEnd", "{0:MMM dd, yyyy}") %>' /></b>
                        <br /><br />
                        

                        Flight:
                        <asp:Label ID="DescriptionLabel2" runat="server" Text='<%# Eval("Description") %>' />
                        <br />
                        Passengers:
                        <asp:Label ID="TravelerCountLabel2" runat="server" Text='<%# Eval("TravelerCount") %>' />
                        <br /><br />
                        

                        Cost:
                        <asp:Label ID="BasePriceLabel2" runat="server" Text='<%# Eval("BasePrice", "{0:C2}") %>' />
                        <br />
                        Commission:
                        <asp:Label ID="AgencyCommissionLabel2" runat="server" Text='<%# Eval("AgencyCommission", "{0:C2}") %>' />
                        <br />
                        <asp:Label ID="FeeNameLabel2" runat="server" Text='<%# Eval("FeeName") %>' />
                        <asp:Label ID="FeeAmountLabel2" runat="server" Text='<%# Eval("FeeAmount", "{0:C2}") %>' />
                        <br />
                        

                        TotalCost:
                        <asp:Label ID="TotalCostLabel2" runat="server" Text='<%# Eval("TotalCost", "{0:C2}") %>' />
                        <br />
                        <br />
                    </span>
                </ItemTemplate>
            </asp:ListView>
            
        </div>
        <div>
            <p>Total: <asp:Label ID="TotalLabel" runat="server"/></p>
        </div>
    </form>
</body>
</html>
