<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Bookings.aspx.cs" Inherits="Bookings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Travel Experts | Invoices</title>
</head>
<body>
    <form id="BookingsForm" runat="server">
        <div>
            <h2>Invoices for <asp:Label ID="CustomerNameLabel" runat="server"/></h2>
        </div>
        <div>
            <asp:ObjectDataSource ID="BookingInvoiceOds" runat="server" SelectMethod="GetInvoicesOfCustomer" TypeName="BookingInvoiceDataSource">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="-99999" Name="id" SessionField="CustomerID" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            
            <asp:GridView ID="InvoiceGridView" runat="server" AutoGenerateColumns="False" DataSourceID="BookingInvoiceOds">
                <Columns>
                    <asp:BoundField DataField="BookingDetailId" HeaderText="BookingDetailId" SortExpression="BookingDetailId" />
                    <asp:BoundField DataField="BookingDate" HeaderText="BookingDate" SortExpression="BookingDate" />
                    <asp:BoundField DataField="BookingCode" HeaderText="BookingCode" SortExpression="BookingCode" />
                    <asp:BoundField DataField="TravelerCount" HeaderText="TravelerCount" SortExpression="TravelerCount" />
                    <asp:BoundField DataField="BookingType" HeaderText="BookingType" SortExpression="BookingType" />
                    <asp:BoundField DataField="TripStart" HeaderText="TripStart" SortExpression="TripStart" />
                    <asp:BoundField DataField="TripEnd" HeaderText="TripEnd" SortExpression="TripEnd" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="Destination" HeaderText="Destination" SortExpression="Destination" />
                    <asp:BoundField DataField="BasePrice" HeaderText="BasePrice" SortExpression="BasePrice" />
                    <asp:BoundField DataField="AgencyCommission" HeaderText="AgencyCommission" SortExpression="AgencyCommission" />
                    <asp:BoundField DataField="FeeName" HeaderText="FeeName" SortExpression="FeeName" />
                    <asp:BoundField DataField="FeeAmount" HeaderText="FeeAmount" SortExpression="FeeAmount" />
                    <asp:BoundField DataField="TotalCost" HeaderText="TotalCost" ReadOnly="True" SortExpression="TotalCost" />
                </Columns>
            </asp:GridView>

        </div>
    </form>
</body>
</html>
