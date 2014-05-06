<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SellStockControl.ascx.cs" Inherits="Controls_SellStockControl" %>

<div class="tab-pane" id="sell">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row-fluid">
                <div class="span8">
                    <h4><i class="icon-money"></i>&nbsp;&nbsp;Stocks Owned</h4>
                    <asp:LinkButton ID="lbtnRefresh" runat="server" OnClick="lbtnRefresh_Click"><i class="icon-refresh"></i>&nbsp;&nbsp;Refresh</asp:LinkButton>
                    <asp:GridView ID="gvStock"
                        runat="server" 
                        CssClass="row-fluid table table- table-bordered table-condensed" 
                        HeaderStyle-ForeColor="Black"
                        HeaderStyle-BackColor="White"
                        AllowPaging="true"
                        AllowSorting="true"
                        AutoGenerateColumns="false"
                        AutoGenerateEditButton="false"
                        AutoGenerateSelectButton="true"
                        OnSelectedIndexChanged="gvStock_SelectedIndexChanged"
                        OnPageIndexChanging="gvStock_PageIndexChanging"
                        DataKeyNames="transaction_id, discount">
                        <Columns>
                            <asp:BoundField DataField="transaction_id" HeaderText="id" SortExpression="ID" ReadOnly="true" Visible="false" />
                            <asp:BoundField DataField="ticker" HeaderText="Ticker" SortExpression="Ticker" ReadOnly="true" />
                            <asp:BoundField DataField="bought" HeaderText="Bought" SortExpression="Bought"  ControlStyle-Width="100px"/>
                            <asp:BoundField DataField="sold" HeaderText="Sold" SortExpression="Sold" ControlStyle-Width="40px"/>
                            <asp:BoundField DataField="total_quantity" HeaderText="Current Quantity" SortExpression="Total" ControlStyle-Width="100px"/>
                            <asp:BoundField DataField="price" HeaderText="Market Price" SortExpression="Price" ControlStyle-Width="100px"/>
                            <asp:BoundField DataField="discount" HeaderText="Discount" SortExpression="discount" ControlStyle-Width="100px" Visible="false"/>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="span4">
                    <h4><i class="icon-money"></i>&nbsp;&nbsp;Sell Stock</h4>
                    <h5>Stock Type</h5>
                    <asp:Label ID="lblTicker" runat="server" Text="****"></asp:Label>
                    <h5>Price</h5>
                    <asp:Label ID="lblPrice" runat="server" Text="****"></asp:Label>
                    <h5>Quantity Available To Sell</h5>
                    <asp:Label ID="lblAvailable" runat="server" Text="****"></asp:Label>
                    <h5>Quantity To Sell</h5>
                    <asp:TextBox ID="txtQuantitySell" runat="server" CssClass="input-block-level"></asp:TextBox>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit Request" CssClass="btn-inverse" OnClick="btnSubmit_Click"/>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</div>

<script type="text/javascript">
    function isNumber(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;
        return true;
    }
</script>