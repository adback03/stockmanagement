<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register Src="~/Controls/AccountOverviewControl.ascx" TagPrefix="uc1" TagName="AccountOverviewControl" %>
<%@ Register Src="~/Controls/ContactControl.ascx" TagPrefix="uc1" TagName="ContactControl" %>
<%@ Register Src="~/Controls/BuyStockControl.ascx" TagPrefix="uc1" TagName="BuyStockControl" %>
<%@ Register Src="~/Controls/ManageStockControl.ascx" TagPrefix="uc1" TagName="ManageStockControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Body" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row-fluid" id="demo-2">
                <div class="span10 offset1">
                    <h2 class="heading-2">Welcome to Sky Trade</h2>
                    <h4 class="heading-4">Mangaing Your Stock Since 1934</h4>
                    <div class="tabbable custom-tabs tabs-left tabs-animated  flat flat-all hide-label-980 shadow track-url auto-scroll dark">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#account" data-toggle="tab" class="active "><i class="icon-user"></i>&nbsp;<span>Account Overview</span></a></li>
                            <li><a href="#contact" data-toggle="tab"><i class="icon-envelope-alt"></i>&nbsp;<span>Contact Us</span></a></li>
                        </ul>
                        <div class="tab-content ">

                            <uc1:AccountOverviewControl runat="server" ID="AccountOverviewControl" />

                            <uc1:BuyStockControl runat="server" ID="BuyStockControl" />

                            <uc1:ManageStockControl runat="server" ID="ManageStockControl" />

                            <uc1:ContactControl runat="server" ID="ContactControl" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>          
</asp:Content>
