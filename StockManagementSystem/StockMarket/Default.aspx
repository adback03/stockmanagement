<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/Controls/Manage.ascx" TagPrefix="uc1" TagName="Manage" %>
<%@ Register Src="~/Controls/Transactions.ascx" TagPrefix="uc1" TagName="Transactions" %>
<%@ Register Src="~/Controls/Register.ascx" TagPrefix="uc1" TagName="Register" %>




<asp:Content ID="Content1" ContentPlaceHolderID="Body" Runat="Server">
    <script src="~/Assets/Javascript/jquery-1.9.1.min.js"></script>
    <script src="~/Assets/Javascript/bootstrap.min.js"></script>
    <script src="~/Assets/Javascript/tabs-addon.js"></script>

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row-fluid" id="demo-2">
                <div class="span10 offset1">
                    <h2 class="heading-2">Stock Market Administration</h2>
                    <div class="tabbable custom-tabs tabs-top tabs-animated  flat flat-all hide-label-980 shadow track-url auto-scroll light">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#manage" data-toggle="tab"><i class="icon-money"></i>&nbsp;<span>Manage Stock</span></a></li>
                            <li><a href="#transactions" data-toggle="tab" class="active "><i class="icon-user"></i>&nbsp;<span>Transactions</span></a></li>
                            <li><a href="#register" data-toggle="tab" class="active "><i class="icon-user"></i>&nbsp;<span>Registrations</span></a></li>
                        </ul>
                        <div class="tab-content ">
                            <uc1:Manage runat="server" ID="Manage" />
                            <uc1:Transactions runat="server" ID="Transactions" />
                            <uc1:Register runat="server" ID="Register" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel> 
</asp:Content>

