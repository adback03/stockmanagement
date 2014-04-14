<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BuyStockControl.ascx.cs" Inherits="Controls_BuyStockControl" %>

<div class="tab-pane active" id="buy">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:Timer ID="Timer" runat="server" Interval="10000" OnTick="Timer_Tick"></asp:Timer>
            <div class="row-fluid">
                <div class="span8">
                    <h4><i class="icon-money"></i>&nbsp;&nbsp;Current Stock</h4>
                    <asp:Label ID="lblUpdateAt" runat="server" Text="Stock last updated at: Never"></asp:Label>
                    <asp:GridView ID="gvStock"
                        runat="server" 
                        CssClass="row-fluid table table- table-bordered table-condensed" 
                        HeaderStyle-ForeColor="Black"
                        HeaderStyle-BackColor="White"
                        AllowPaging="true"
                        AllowSorting="true"
                        AutoGenerateColumns="false"
                        AutoGenerateEditButton="false"
                        OnSorting="gvStock_Sorting">
                        <Columns>
                            <asp:BoundField DataField="ticker" HeaderText="Ticker" SortExpression="Ticker" ReadOnly="true" />
                            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="Name"  ControlStyle-Width="100px"/>
                            <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="Quantity" ControlStyle-Width="40px"/>
                            <asp:BoundField DataField="price" HeaderText="Price" SortExpression="Price" ControlStyle-Width="100px"/>
                        </Columns>
                    </asp:GridView>

                </div>
                <div class="span4">
                    <h4><i class="icon-exchange"></i>&nbsp;&nbsp;Make Transaction</h4>
                    <label>Stock Type</label>
                    <asp:DropDownList ID="ddlStock" runat="server" CssClass="input-block-level"></asp:DropDownList>
                    <label>Quantity To Purchase</label>
                    <asp:TextBox ID="txtQuantityPurchase" runat="server" CssClass="input-block-level"></asp:TextBox>
                    <asp:Panel runat="server" ID="pnlDiscount">
                        <p class="alert-info">All employees have the option to purchase their stock at a 10% discount. *Note - This stock cannot be sold for 6 months.</p>
                        <p>Use Employee Discount! <asp:CheckBox ID="chkDiscount" runat="server" /></p>
                    </asp:Panel>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit Request" CssClass="btn-inverse" OnClick="btnSubmit_Click" />
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
