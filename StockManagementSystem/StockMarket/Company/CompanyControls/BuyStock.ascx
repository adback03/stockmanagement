<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BuyStock.ascx.cs" Inherits="Company_CompanyControls_BuyStock" %>

<div class="tab-pane active" id="buy">
        <asp:UpdatePanel runat="server">
        <ContentTemplate>
    <div class="row-fluid">
        <div class="span8">
            <h4><i class="icon-money"></i>&nbsp;&nbsp;Current Stock</h4>
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
                OnSorting="gvStock_Sorting"
                OnSelectedIndexChanged="gvStock_SelectedIndexChanged"
                OnPageIndexChanging="gvStock_PageIndexChanging">
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
                    <h5>Stock Type</h5>
                    <asp:Label ID="lblTicker" runat="server" Text="****"></asp:Label>
                    <h5>Price</h5>
                    <asp:Label ID="lblPrice" runat="server" Text="****"></asp:Label>
                    <h5>Quantity To Purchase</h5>
                    <asp:TextBox ID="txtQuantityPurchase" runat="server" CssClass="input-block-level"></asp:TextBox>
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

