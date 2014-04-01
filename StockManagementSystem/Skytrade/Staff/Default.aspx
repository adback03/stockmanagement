<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Staff_Default" %>

<%@ Register Src="~/Staff/StaffControls/Register.ascx" TagPrefix="uc2" TagName="Register" %>
<%@ Register Src="~/Staff/StaffControls/Transactions.ascx" TagPrefix="uc2" TagName="Transactions" %>
<%@ Register Src="~/Staff/StaffControls/ChangePassword.ascx" TagPrefix="uc2" TagName="ChangePassword" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Body" Runat="Server">

    <script src="~/Assets/Javascript/jquery-1.9.1.min.js"></script>
    <script src="~/Assets/Javascript/bootstrap.min.js"></script>
    <script src="~/Assets/Javascript/tabs-addon.js"></script>

            <div class="row-fluid" id="demo-2">
                <div class="span10 offset1">
                    <h2 class="heading-2">Sky Trade Administration</h2>
                    <div class="tabbable custom-tabs tabs-left tabs-animated  flat flat-all hide-label-980 shadow track-url auto-scroll dark">
                        <ul class="nav nav-tabs">
                            <li><a href="#register" data-toggle="tab" class="active "><i class="icon-user"></i>&nbsp;<span>Registrations</span></a></li>
                            <li><a href="#transactions" data-toggle="tab" class="active "><i class="icon-user"></i>&nbsp;<span>Transactions</span></a></li>
                            <li><a href="#changePassword" data-toggle="tab" class="active "><i class="icon-user"></i>&nbsp;<span>Change Password</span></a></li>
                        </ul>
                        <div class="tab-content ">
                            <uc2:Register runat="server" ID="Register" />
                            <uc2:Transactions runat="server" id="Transactions" />
                            <uc2:ChangePassword runat="server" id="ChangePassword" />
                        </div>
                    </div>
                </div>
            </div>
</asp:Content>