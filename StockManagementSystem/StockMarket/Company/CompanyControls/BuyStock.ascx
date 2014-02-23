<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BuyStock.ascx.cs" Inherits="Company_CompanyControls_BuyStock" %>

<div class="tab-pane" id="buy">
    <div class="row-fluid">
        <div class="span12">
            <h4><i class="icon-unlock"></i>&nbsp;&nbsp;Current Stock</h4>
            <asp:GridView ID="gvStock"
                runat="server" 
                CssClass="row-fluid table table- table-bordered table-condensed" 
                HeaderStyle-ForeColor="Black"
                HeaderStyle-BackColor="White"
                AllowPaging="true"
                AllowSorting="true"
                AutoGenerateColumns="false"
                AutoGenerateEditButton="false">
                <Columns>
                    <asp:BoundField DataField="ticker" HeaderText="Ticker" SortExpression="Ticker" ReadOnly="true" />
                    <asp:BoundField DataField="name" HeaderText="Name" SortExpression="Name"  ControlStyle-Width="100px"/>
                    <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="Quantity" ControlStyle-Width="40px"/>
                    <asp:BoundField DataField="price" HeaderText="Price" SortExpression="MarketPrice" ControlStyle-Width="100px"/>
                    <asp:TemplateField HeaderText="Quantity To Purchase">
                        <ItemTemplate>
                            <asp:TextBox ID="txtQuantityPurchase" runat="server" TextMode="Number"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:ButtonField ButtonType="Button" Text="Submit Request" CommandName="Submit" Visible="True"/>
                </Columns>
            </asp:GridView>

        </div>
    </div>
</div>

