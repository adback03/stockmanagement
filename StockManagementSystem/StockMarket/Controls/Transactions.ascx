<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Transactions.ascx.cs" Inherits="Company_CompanyControls_BuyStock" %>


    <div class="tab-pane" id="transactions">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="row-fluid">
                    <div class="span12">
                        <h4><i class="icon-money"></i>&nbsp;&nbsp;Transactions</h4>
                        <asp:LinkButton ID="lbtnPending" runat="server" ForeColor="blue" OnClick="lbtnPending_Click">Pending</asp:LinkButton>&nbsp;&nbsp; |
                        <asp:LinkButton ID="lbtnApproved" runat="server" ForeColor="SlateGray" OnClick="lbtnApproved_Click">Approved</asp:LinkButton>&nbsp;&nbsp; |
                        <asp:LinkButton ID="lbtnDenied" runat="server" ForeColor="SlateGray" OnClick="lbtnDenied_Click">Denied</asp:LinkButton>
                        <br /><br />
                        <asp:GridView ID="gvPending"
                            runat="server" 
                            CssClass="row-fluid table table- table-bordered table-condensed" 
                            HeaderStyle-ForeColor="Black"
                            HeaderStyle-BackColor="White"
                            AllowPaging="true"
                            AllowSorting="true"
                            AutoGenerateColumns="false"
                            AutoGenerateEditButton="false"
                            AutoGenerateSelectButton="true"
                            OnPageIndexChanging="gvPending_PageIndexChanging"
                            OnSelectedIndexChanged="gvPending_SelectedIndexChanged"
                            DataKeyNames="transaction_id">
                            <Columns>
                                <asp:BoundField DataField="transaction_id" HeaderText="ID" SortExpression="ID" Visible="false" ControlStyle-Width="100px"/>
                                <asp:BoundField DataField="companyname" HeaderText="Company" SortExpression="Company" ControlStyle-Width="100px"/>
                                <asp:BoundField DataField="ticker" HeaderText="Ticker" SortExpression="Ticker" ReadOnly="true" />
                                <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="Quantity" ControlStyle-Width="40px"/>
                                <asp:BoundField DataField="price" HeaderText="Price" SortExpression="MarketPrice" ControlStyle-Width="100px"/>
                                <asp:BoundField DataField="transaction_type" HeaderText="Type" SortExpression="Type" ControlStyle-Width="100px"/>
                                <asp:BoundField DataField="status" HeaderText="Status" SortExpression="Status" ControlStyle-Width="100px"/>
                                <asp:BoundField DataField="timestamp" HeaderText="Timestamp" SortExpression="Timestamp" ControlStyle-Width="100px"/>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <asp:Panel ID="pnlApproveDisapprove" runat="server" Visible="true">
                <div class="row-fluid">
                    <div class="span12">
                        <div class="span8">
                            <h4><i class="icon-money"></i>&nbsp;&nbsp;Approve/Disapprove</h4>     
                            <div class="box">
                                <table class="table table-bordered table-condensed">
                                    <tr>
                                        <th>Transaction ID</th>
                                        <th>Ticker</th>
                                        <th>Quantity</th>
                                        <th>Quantity Available</th>
                                        <th>Price</th>
                                    </tr>
                                    <tr>
                                        <td><asp:Label ID="lblID" runat="server" Text="****"></asp:Label></td>
                                        <td><asp:Label ID="lblTicker" runat="server" Text="****"></asp:Label></td>
                                        <td><asp:Label ID="lblQuantity" runat="server" Text="****"></asp:Label></td>
                                        <td><asp:Label ID="lblQuantityAvailable" runat="server" Text="****"></asp:Label></td>
                                        <td><asp:Label ID="lblPrice" runat="server" Text="****"></asp:Label></td>
                                    </tr>
                                </table>
                                <asp:Label ID="lblWarning" runat="server" Text="The amount requested is greater than the amount available!" CssClass="alert-error" Visible="false"></asp:Label>
                                <br /><br />
                                <asp:Button ID="btnApprove" runat="server" Text="Approve" CssClass="btn-inverse" OnClick="btnApprove_Click" />
                                <asp:Button ID="btnDisapprove" runat="server" Text="Disapprove" CssClass="btn-inverse" OnClick="btnDisapprove_Click" />
                            </div>
                        </div>
                        <div class="span4">
                            <h4><i class="icon-edit"></i>&nbsp;&nbsp;Transaction Message</h4>
                            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Height="200px" CssClass="input-block-level"></asp:TextBox>

                            <div class="box alert-danger">
                                <p>Add a personalized message to send to a user when you approve or deny a transaction!</p>
                            </div>
                        </div>
                    </div>
                </div> 
                </asp:Panel>
    </ContentTemplate>
</asp:UpdatePanel>
</div>



