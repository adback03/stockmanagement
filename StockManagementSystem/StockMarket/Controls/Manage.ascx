<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Manage.ascx.cs" Inherits="Controls_Manage" %>

<div class="tab-pane active" id="manage">
    <div class="row-fluid">
        <div class="span8">
            <h4><i class="icon-unlock"></i>&nbsp;&nbsp;Current Stock</h4>
            <asp:GridView ID="gvStock"
                runat="server" 
                CssClass="row-fluid table table- table-bordered table-condensed" 
                HeaderStyle-ForeColor="Black"
                HeaderStyle-BackColor="White"
                AllowPaging="true"
                AllowSorting="true"
                AutoGenerateColumns="false"
                AutoGenerateEditButton="true"
                OnRowEditing="gvStock_RowEditing"
                OnRowCancelingEdit="gvStock_RowCancelingEdit"
                OnRowUpdating="gvStock_RowUpdating">
                <Columns>
                    <asp:BoundField DataField="ticker" HeaderText="Ticker" SortExpression="Ticker" ReadOnly="true" />
                    <asp:BoundField DataField="name" HeaderText="Name" SortExpression="Name"  ControlStyle-Width="100px"/>
                    <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="Quantity" ControlStyle-Width="40px"/>
                    <asp:BoundField DataField="price" HeaderText="Price" SortExpression="MarketPrice" ControlStyle-Width="100px"/>
                </Columns>
            </asp:GridView>

        </div>
        <div class="span4">
            <h4><i class="icon-money"></i>&nbsp;&nbsp;Add New Stock</h4>
            <label>Ticker Symbol (Unique)</label>
            <asp:TextBox ID="txtTicker" runat="server" CssClass="input-block-level"></asp:TextBox>
            <label>Stock Name</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="input-block-level"></asp:TextBox>
            <label>Quantity</label>
            <asp:TextBox ID="txtQuantity" runat="server" CssClass="input-block-level" TextMode="Number"></asp:TextBox>
            <label>Market Price</label>
            <asp:TextBox ID="txtMarketPrice" runat="server" CssClass="input-block-level"></asp:TextBox>
            <asp:Button ID="btnAddStock" runat="server" Text="Add Stock" CssClass="btn-large btn-inverse" OnClick="btnAddStock_Click" />
        </div>
    </div>
</div>
