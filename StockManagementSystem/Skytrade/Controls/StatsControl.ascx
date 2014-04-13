<%@ Control Language="C#" AutoEventWireup="true" CodeFile="StatsControl.ascx.cs" Inherits="Controls_StatsControl" %>

<div class="tab-pane" id="stats">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row-fluid">
                <div class="span8">
                    <h4><i class="icon-money"></i>&nbsp;&nbsp;Stocks Owned</h4>
                    <label>Stocks</label>
                    <asp:DropDownList ID="ddlStocks" runat="server"></asp:DropDownList>
                    <asp:Literal ID="ltChartByStock" runat="server"></asp:Literal>
                    <div id="chart_div_byStock"></div>
                </div>
                <div class="span4">

                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</div>