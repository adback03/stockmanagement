<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Register.ascx.cs" Inherits="Staff_StaffControls_Register" %>

<div class="tab-pane" id="register">
    <div class="row-fluid">
        <div class="span12">
            <h4><i class="icon-user"></i>&nbsp;&nbsp;Requests to Register</h4>
            <asp:GridView ID="gvRequest"
                runat="server" 
                CssClass="row-fluid table table- table-bordered table-condensed" 
                HeaderStyle-ForeColor="Black"
                HeaderStyle-BackColor="White"
                AllowPaging="true"
                AllowSorting="true"
                AutoGenerateColumns="false"
                OnRowCommand="gvRequest_RowCommand">
                <Columns>
                    <asp:BoundField DataField="companyname" HeaderText="Company" SortExpression="Ssn" ControlStyle-Width="40px"/>
                    <asp:BoundField DataField="firstname" HeaderText="First Name" SortExpression="Firstname" ReadOnly="true" />
                    <asp:BoundField DataField="lastname" HeaderText="Last Name" SortExpression="LastName"  ControlStyle-Width="100px"/>
                    <asp:BoundField DataField="email" HeaderText="Email" SortExpression="Email" ControlStyle-Width="100px"/>
                    <asp:ButtonField ButtonType="Button" Text="Approve" CommandName="Approve" Visible="True"/>
                    <asp:ButtonField ButtonType="Button" Text="Deny" CommandName="Deny" Visible="True"/>
                </Columns>
            </asp:GridView>

        </div>
    </div>
</div>