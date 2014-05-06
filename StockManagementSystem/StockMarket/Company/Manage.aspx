<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Manage.aspx.cs" Inherits="Company_Manage" %>

<%@ Register Src="~/Company/CompanyControls/AccountOverviewControl.ascx" TagPrefix="uc1" TagName="AccountOverviewControl" %>
<%@ Register Src="~/Company/CompanyControls/BuyStock.ascx" TagPrefix="uc1" TagName="BuyStock" %>
<%@ Register Src="~/Company/CompanyControls/Transactions.ascx" TagPrefix="uc1" TagName="Transactions" %>
<%@ Register Src="~/Company/CompanyControls/MessagesControl.ascx" TagPrefix="uc1" TagName="MessagesControl" %>
<%@ Register Src="~/Company/CompanyControls/SellStock.ascx" TagPrefix="uc1" TagName="SellStock" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Body" Runat="Server">
            <div class="row-fluid" id="demo-2">
                <div class="span10 offset1">
                    <h2 class="heading-2">Manage Your Stock</h2>
                    <div class="tabbable custom-tabs tabs-left tabs-animated  flat flat-all hide-label-980 shadow track-url auto-scroll light">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#buy" data-toggle="tab"><i class="icon-money"></i>&nbsp;<span>Buy Stock</span></a></li>
                            <li><a href="#sell" data-toggle="tab"><i class="icon-briefcase"></i>&nbsp;<span>Sell Stock</span></a></li>
                            <li><a href="#transactions" data-toggle="tab"><i class="icon-briefcase"></i>&nbsp;<span>Transactions</span></a></li>
                            <li><a href="#messages" data-toggle="tab"><i class="icon-inbox"></i>&nbsp;<span>Messages <asp:Label ID="lblMessages" runat="server" ForeColor="#0000CC" /></span></a></li>
                        </ul>
                        <div class="tab-content ">
                            <uc1:BuyStock runat="server" ID="BuyStock" />
                            <uc1:SellStock runat="server" id="SellStock" />
                            <uc1:Transactions runat="server" ID="Transactions" />
                            <uc1:MessagesControl runat="server" ID="MessagesControl" />
                        </div>
                    </div>
                </div>
            </div> 
</asp:Content>

