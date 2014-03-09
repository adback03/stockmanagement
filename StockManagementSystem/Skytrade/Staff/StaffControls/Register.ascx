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
                AllowPaging="true"
                AllowSorting="true"
                AutoGenerateColumns="false"
                OnRowCommand="gvRequest_RowCommand">
                <Columns>
                    <asp:BoundField DataField="firstname" HeaderText="Firstname" SortExpression="Firstname" ReadOnly="true" />
                    <asp:BoundField DataField="lastname" HeaderText="LastName" SortExpression="LastName"  ControlStyle-Width="100px"/>
                    <asp:BoundField DataField="ssn" HeaderText="Ssn" SortExpression="Ssn" ControlStyle-Width="40px"/>
                    <asp:BoundField DataField="email" HeaderText="Email" SortExpression="Email" ControlStyle-Width="100px"/>
                    <asp:ButtonField ButtonType="Button" Text="Approve" CommandName="Approve" Visible="True"/>
                    <asp:ButtonField ButtonType="Button" Text="Deny" CommandName="Deny" Visible="True"/>
                    <asp:TemplateField ControlStyle-CssClass="modal hide modal-form" />
                </Columns>
            </asp:GridView>

        </div>
    </div>
</div>
<script type="text/javascript">
    function deny()
</script>