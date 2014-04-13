<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Stats.ascx.cs" Inherits="Company_CompanyControls_Stats" %>

<div class="tab-pane" id="stats">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row-fluid">
                <div class="span8">
                    <h4><i class="icon-money"></i>&nbsp;&nbsp;Stocks Owned</h4>
                    <asp:Literal ID="ltChartGOOG" runat="server"></asp:Literal>
                    <div id="divGOOG"></div>
                    <br />
                    <br />
                    <asp:Literal ID="ltChartTWTR" runat="server"></asp:Literal>
                    <div id="divTWTR"></div>
                </div>
                <div class="span4">

                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</div>