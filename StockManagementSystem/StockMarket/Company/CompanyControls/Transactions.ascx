<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Transactions.ascx.cs" Inherits="Company_CompanyControls_BuyStock" %>

<div class="tab-pane" id="transactions">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row-fluid">
                <div class="span12">
                    <h4><i class="icon-money"></i>&nbsp;&nbsp;Transactions</h4>
                    <asp:LinkButton ID="lbtnPending" runat="server" ForeColor="blue" OnClick="lbtnPending_Click">Pending</asp:LinkButton>&nbsp;&nbsp; |
                    <asp:LinkButton ID="lbtnOnHold" runat="server" ForeColor="blue" OnClick="lbtnOnHold_Click">On Hold</asp:LinkButton>&nbsp;&nbsp; |
                    <asp:LinkButton ID="lbtnApproved" runat="server" ForeColor="SlateGray" OnClick="lbtnApproved_Click">Approved</asp:LinkButton>&nbsp;&nbsp; |
                    <asp:LinkButton ID="lbtnDenied" runat="server" ForeColor="SlateGray" OnClick="lbtnDenied_Click">Denied</asp:LinkButton>
                    <br /><br />
                    <asp:GridView ID="gvTransactions"
                        runat="server" 
                        CssClass="row-fluid table table- table-bordered table-condensed" 
                        HeaderStyle-ForeColor="Black"
                        HeaderStyle-BackColor="White"
                        AllowPaging="true"
                        AllowSorting="true"
                        AutoGenerateColumns="false"
                        AutoGenerateEditButton="false"
                        AutoGenerateSelectButton="true"
                        OnSelectedIndexChanged="gvTransactions_SelectedIndexChanged"
                        DataKeyNames="transaction_id">
                        <Columns>
                            <asp:BoundField DataField="transaction_id" HeaderText="ID" SortExpression="ID" Visible="false" ControlStyle-Width="100px"/>
                            <asp:BoundField DataField="username" HeaderText="Username" SortExpression="Username" ControlStyle-Width="100px"/>
                            <asp:BoundField DataField="ticker" HeaderText="Ticker" SortExpression="Ticker" ReadOnly="true" />
                            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="Name"  ControlStyle-Width="100px"/>
                            <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="Quantity" ControlStyle-Width="40px"/>
                            <asp:BoundField DataField="price" HeaderText="Price" SortExpression="Price" ControlStyle-Width="100px"/>
                            <asp:BoundField DataField="transaction_type" HeaderText="Type" SortExpression="Type" ControlStyle-Width="100px"/>
                            <asp:BoundField DataField="status" HeaderText="Status" SortExpression="Status" ControlStyle-Width="100px"/>
                            <asp:BoundField DataField="timestamp" HeaderText="Timestamp" SortExpression="Timestamp" ControlStyle-Width="100px"/>
                        </Columns>
                    </asp:GridView>

                    <asp:Panel ID="pnlMessage" runat="server" Visible="false">
                        <h4><i class="icon-edit"></i>&nbsp;&nbsp;Transaction Message</h4>
                        <div class="box">
                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>


