<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Stats.ascx.cs" Inherits="Staff_StaffControls_Stats" %>

<div class="tab-pane" id="stats">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row-fluid">
                <div class="span8">
                    <h4><i class="icon-money"></i>&nbsp;&nbsp;Company Stats</h4>
                    <asp:Literal ID="ltProfit" runat="server"></asp:Literal>
                    <div id="divProfit"></div>
                </div>
                <div class="span4">

                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</div>
