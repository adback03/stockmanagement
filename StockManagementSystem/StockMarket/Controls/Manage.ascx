<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Manage.ascx.cs" Inherits="Controls_Manage" %>

<div class="tab-pane active" id="manage">
    <div class="row-fluid">
        <div class="span8">
            <h4><i class="icon-unlock"></i>&nbsp;&nbsp;Current Stock</h4>
                <asp:UpdatePanel ID="upManageStock" runat="server">
                <ContentTemplate>
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
            </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="span4">
            <h4><i class="icon-money"></i>&nbsp;&nbsp;Add New Stock</h4>
            <label>Ticker Symbol (Unique)</label>
            <asp:TextBox ID="txtTicker" runat="server" CssClass="input-block-level"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTicker" ErrorMessage="Ticker can not be empty." ValidationGroup="Stock" Display="None" />                            
            <asp:RegularExpressionValidator runat="server" ID="revTicker" ControlToValidate="txtTicker" ErrorMessage="Ticker can not be empty and can be from 1-4 characters capatilized. ie: AAPL" Display="None" ValidationGroup="Stock" ValidationExpression="^[A-Z]{1,4}" />                              
                                    
            <label>Stock Name</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="input-block-level"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName" ErrorMessage="Name can not be empty." ValidationGroup="Stock" Display="None" />                            
            
            <asp:RegularExpressionValidator runat="server" ID="revName" ControlToValidate="txtName" ErrorMessage="Name can be any letter or number. ie: Aaple" Display="None" ValidationGroup="Stock" ValidationExpression="^[a-zA-Z '-]{1,25}$" />                              
                                    
            <label>Quantity</label>
            <asp:TextBox ID="txtQuantity" runat="server" CssClass="input-block-level" TextMode="Number"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtQuantity" ErrorMessage="Quantity can not be empty." ValidationGroup="Stock" Display="None" />                            
            
            <asp:RegularExpressionValidator runat="server" ID="revQuantity" ControlToValidate="txtQuantity" ErrorMessage="Quantity must be an integer." Display="None" ValidationGroup="Stock" ValidationExpression="^\d{1,18}$" />
            
            <label>Market Price</label>
            <asp:TextBox ID="txtMarketPrice" runat="server" CssClass="input-block-level"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtMarketPrice" ErrorMessage="Price can not be empty." ValidationGroup="Stock" Display="None" />                            
            
            <asp:RegularExpressionValidator runat="server" ID="revPrice" ControlToValidate="txtMarketPrice" ErrorMessage="Price must be in a valid money format. ie:100.00" Display="None" ValidationGroup="Stock" ValidationExpression="^\d{1,18}(\.\d{1,2})?" />
            
            <asp:Button ID="btnAddStock" runat="server" Text="Add Stock" CssClass="btn-large btn-inverse" OnClick="btnAddStock_Click" ValidationGroup="Stock" />
        </div>
        <asp:ValidationSummary
                                id="vsStockSummary"
                                ShowMessageBox="true"
                                ShowSummary="false"
                                HeaderText="The following fields are either blank or incorrectly formatted:"
                                EnableClientScript="true"
                                ValidationGroup="Stock"
                                runat="server"/>

        
    </div>
</div>

