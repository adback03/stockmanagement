<%@ Control Language="C#" AutoEventWireup="true" CodeFile="StatsControl.ascx.cs" Inherits="Controls_StatsControl" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<div class="tab-pane" id="stats">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row-fluid">
                <div class="span8">
                    <h4><i class="icon-money"></i>&nbsp;&nbsp;Stocks Owned</h4>
                    <asp:Literal ID="ltChartByStock" runat="server"></asp:Literal>
                    <div id="chart_div_byStock"></div>
                    <asp:Chart ID="chrtProfitMargin" runat="server" Width="800">
                        <Series>
                            <asp:Series Name="Series1" ChartType="Line"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                </div>
                <div class="span4">
                    <h4><i class="icon-money"></i>&nbsp;&nbsp;Quick Stats</h4>
                    <asp:DropDownList ID="ddlStock" runat="server" OnSelectedIndexChanged="ddlStock_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList><br />
                    <div class="box">
                        <label style="font-weight:bold">Earned</label>
                        <asp:Label ID="lblEarned" runat="server" Text="***"></asp:Label><br />
                        <label style="font-weight:bold">Spent</label>
                        <asp:Label ID="lblSpent" runat="server" Text="***"></asp:Label><br />
                        <label style="font-weight:bold">Profit</label>
                        <asp:Label ID="lblProfit" runat="server" Text="***"></asp:Label>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</div>