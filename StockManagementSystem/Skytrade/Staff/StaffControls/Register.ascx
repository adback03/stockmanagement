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
                    <asp:ButtonField ButtonType="Button" Text="Deny" CommandName="Deny"  Visible="True" />
                    <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <a href="#PasswordModal" role="button" data-toggle="modal">Change Password</a>
                    </ItemTemplate>
                </asp:TemplateField>
                </Columns>
            </asp:GridView>

        </div>
    </div>
</div>
<div id="PasswordModal" class="modal hide modal-form" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="row-fluid">
        <div class="span7 offset3">

            <div class="tabbable custom-tabs tabs-animated  flat flat-all hide-label-980 shadow tabs-top">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#panel6-1" data-toggle="tab" class="active "><i class="icon-user"></i>&nbsp;<span>Change Password</span></a></li>
                    <li class="pull-right"><a href="#close" data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i>&nbsp;<span></span></a></li>
                    <li class="pull-right">
                        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="/"><i class="icon-save">&nbsp;<span>Change</span></i></asp:LinkButton>
                    </li>
                </ul>
                <div class="tab-content ">
                    <div class="tab-pane active" id="panel7-1">
                        <div class="row-fluid">
                            <div class="span6">
                                <h4><i class="icon-user"></i>&nbsp;&nbsp; Change Password</h4>

                                <label>Old Password</label>

                             
                                <br />
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>