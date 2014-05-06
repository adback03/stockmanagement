<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Register.ascx.cs" Inherits="Staff_StaffControls_Register" %>

<div class="tab-pane active" id="register">
    <div class="row-fluid">
        <div class="span12">
            <h4><i class="icon-users"></i>&nbsp;&nbsp;Requests to Register</h4>
            <asp:GridView ID="gvRequest"
                runat="server" 
                CssClass="row-fluid table table- table-bordered table-condensed" 
                HeaderStyle-ForeColor="Black"
                HeaderStyle-BackColor="White"
                AllowPaging="false"
                AllowSorting="true"
                AutoGenerateColumns="false"
                OnRowCommand="gvRequest_RowCommand">
                <Columns>
                    <asp:BoundField DataField="firstname" HeaderText="Firstname" SortExpression="Firstname" ReadOnly="true" />
                    <asp:BoundField DataField="lastname" HeaderText="LastName" SortExpression="LastName"  ControlStyle-Width="100px"/>
                    <asp:BoundField DataField="email" HeaderText="Email" SortExpression="Email" ControlStyle-Width="100px"/>
                    <asp:BoundField DataField="bank_name" HeaderText="Bank Name" SortExpression="BankName" ControlStyle-Width="100px"/>
                    <asp:BoundField DataField="routing_number" HeaderText="Routing Number" SortExpression="RoutingNumber" ControlStyle-Width="100px"/>
                    <asp:BoundField DataField="account_number" HeaderText="Account Number" SortExpression="AccountNumber" ControlStyle-Width="100px"/>
                    <asp:ButtonField ButtonType="Button" Text="Approve" CommandName="Approve" Visible="True"/>
                    <asp:ButtonField ButtonType="Button" Text="Deny" CommandName="Deny"  Visible="True" />
                </Columns>
            </asp:GridView>

        </div>
        <div class="span4">
            <h4><i class="icon-edit"></i>&nbsp;&nbsp;Registration Message</h4>
            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Height="200" CssClass="input-block-level"></asp:TextBox>
        </div>
    </div>
</div>