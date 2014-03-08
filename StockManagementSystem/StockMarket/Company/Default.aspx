<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Company_Default" %>

<%@ Register Src="~/Company/CompanyControls/AccountOverviewControl.ascx" TagPrefix="uc1" TagName="AccountOverviewControl" %>
<%@ Register Src="~/Company/CompanyControls/BuyStock.ascx" TagPrefix="uc1" TagName="BuyStock" %>
<%@ Register Src="~/Company/CompanyControls/Transactions.ascx" TagPrefix="uc1" TagName="Transactions" %>
<%@ Register Src="~/Company/CompanyControls/MessagesControl.ascx" TagPrefix="uc1" TagName="MessagesControl" %>





<asp:Content ID="Content1" ContentPlaceHolderID="Body" Runat="Server">
            <div class="row-fluid" id="demo-2">
                <div class="span10 offset1">
                    <h2 class="heading-2">Welcome to the Stock Market</h2>
                    <div class="tabbable custom-tabs tabs-left tabs-animated  flat flat-all hide-label-980 shadow track-url auto-scroll light">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#account" data-toggle="tab" class="active "><i class="icon-user"></i>&nbsp;<span>Account Overview</span></a></li>
                            <li><a href="#messages" data-toggle="tab"><i class="icon-inbox"></i>&nbsp;<span>Messages <asp:Label ID="lblMessages" runat="server" ForeColor="#0000CC" /></span></a></li>
                            <li><a href="#contact" data-toggle="tab"><i class="icon-envelope-alt"></i>&nbsp;<span>Contact Us</span></a></li>
                        </ul>
                        <div class="tab-content ">
                            <uc1:AccountOverviewControl runat="server" ID="AccountOverviewControl" />
                            <uc1:MessagesControl runat="server" ID="MessagesControl" />
                        </div>
                    </div>
                </div>
            </div>
</asp:Content>

