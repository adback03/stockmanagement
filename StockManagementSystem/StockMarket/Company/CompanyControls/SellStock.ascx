<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SellStock.ascx.cs" Inherits="Company_CompanyControls_SellStock" %>

<div class="tab-pane" id="sell">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
    <div class="row-fluid">
        <div class="span8">
            <h4><i class="icon-money"></i>&nbsp;&nbsp;Stock Transaction History</h4>
            <asp:GridView ID="gvStock"
                runat="server" 
                CssClass="row-fluid table table- table-bordered table-condensed" 
                HeaderStyle-ForeColor="Black"
                HeaderStyle-BackColor="White"
                AllowPaging="true"
                AllowSorting="true"
                AutoGenerateColumns="false"
                AutoGenerateEditButton="false"
                OnPageIndexChanging="gvStock_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="ticker" HeaderText="Ticker" SortExpression="Ticker" ReadOnly="true" />
                    <asp:BoundField DataField="bought" HeaderText="Bought" SortExpression="Bought"  ControlStyle-Width="100px"/>
                    <asp:BoundField DataField="sold" HeaderText="Sold" SortExpression="Sold" ControlStyle-Width="40px"/>
                    <asp:BoundField DataField="total_quantity" HeaderText="Current Quantity" SortExpression="Total" ControlStyle-Width="100px"/>
                    <asp:BoundField DataField="price" HeaderText="Market Price" SortExpression="Price" ControlStyle-Width="100px"/>
                </Columns>
            </asp:GridView>
        </div>
        <div class="span4">
            <h4><i class="icon-money"></i>&nbsp;&nbsp;Sell Stock</h4>
            <label>Stock Type</label>
            <asp:DropDownList ID="ddlStock" runat="server" CssClass="input-block-level"></asp:DropDownList>
            <label>Quantity To Sell</label>
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