<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Transactions.ascx.cs" Inherits="Company_CompanyControls_BuyStock" %>

<div class="tab-pane" id="transactions">
    <div class="row-fluid">
        <div class="span12">
            <h4><i class="icon-money"></i>&nbsp;&nbsp;Pending Transactions</h4>
            <asp:GridView ID="gvPending"
                runat="server" 
                CssClass="row-fluid table table- table-bordered table-condensed" 
                HeaderStyle-ForeColor="Black"
                HeaderStyle-BackColor="White"
                AllowPaging="true"
                AllowSorting="true"
                AutoGenerateColumns="false"
                AutoGenerateEditButton="false">
                <Columns>
                    <asp:BoundField DataField="username" HeaderText="Username" SortExpression="Username" ControlStyle-Width="100px"/>
                    <asp:BoundField DataField="ticker" HeaderText="Ticker" SortExpression="Ticker" ReadOnly="true" />
                    <asp:BoundField DataField="name" HeaderText="Name" SortExpression="Name"  ControlStyle-Width="100px"/>
                    <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="Quantity" ControlStyle-Width="40px"/>
                    <asp:BoundField DataField="price" HeaderText="Price" SortExpression="MarketPrice" ControlStyle-Width="100px"/>
                    <asp:BoundField DataField="status" HeaderText="Status" SortExpression="Status" ControlStyle-Width="100px"/>
                    <asp:BoundField DataField="timestamp" HeaderText="Timestamp" SortExpression="Timestamp" ControlStyle-Width="100px"/>
                </Columns>
            </asp:GridView>

        </div>
    </div>
</div>


