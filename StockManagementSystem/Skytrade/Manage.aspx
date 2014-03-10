<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Manage.aspx.cs" Inherits="Manage" %>

<%@ Register Src="~/Controls/BuyStockControl.ascx" TagPrefix="uc1" TagName="BuyStockControl" %>
<%@ Register Src="~/Controls/SellStockControl.ascx" TagPrefix="uc1" TagName="SellStockControl" %>
<%@ Register Src="~/Controls/Transactions.ascx" TagPrefix="uc1" TagName="Transactions" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Body" Runat="Server">
            <div class="row-fluid" id="demo-2">
                <div class="span10 offset1">
                    <h2 class="heading-2">Welcome to Sky Trade</h2>
                    <h4 class="heading-4">Mangaing Your Stock Since 1934</h4>
                    <div class="tabbable custom-tabs tabs-left tabs-animated  flat flat-all hide-label-980 shadow track-url auto-scroll dark">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#buy" data-toggle="tab"><i class="icon-money"></i>&nbsp;<span>Buy Stock</span></a></li>
                            <li><a href="#manage" data-toggle="tab"><i class="icon-briefcase"></i>&nbsp;<span>Sell Stock</span></a></li>
                            <li><a href="#messages" data-toggle="tab"><i class="icon-inbox"></i>&nbsp;<span>Messages <asp:Label ID="lblMessages" runat="server" ForeColor="#0000CC" /></span></a></li>
                            <li><a href="#transactions" data-toggle="tab"><i class="icon-briefcase"></i>&nbsp;<span>Transactions</span></a></li>
                        </ul>
                        <div class="tab-content ">
                            <uc1:BuyStockControl runat="server" id="BuyStockControl" />
                            <uc1:SellStockControl runat="server" id="SellStockControl" />
                            <uc1:Transactions runat="server" ID="Transactions" />
                        </div>
                    </div>
                </div>
            </div>    
</asp:Content>

