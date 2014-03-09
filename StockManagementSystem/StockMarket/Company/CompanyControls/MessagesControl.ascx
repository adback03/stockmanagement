<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MessagesControl.ascx.cs" Inherits="Company_CompanyControls_MessagesControl" %>

<div class="tab-pane" id="messages">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
                <div class="row-fluid">
                    <div class="span8">
                        <h4><i class="icon-inbox"></i>&nbsp;&nbsp;Inbox</h4>
                        <asp:Repeater ID="rptMessages" runat="server">
                            <ItemTemplate>
                                <div class="box">
                                    <h5>From: System Administrator</h5>
                                    <h5><%#DataBinder.Eval(Container.DataItem, "timestamp") %></h5>
                                    <p><%#DataBinder.Eval(Container.DataItem, "message") %></p>
                                    <asp:Button ID="btnArchive" runat="server" Text="Archive" OnCommand="btnArchive_Command" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "message_id") %>' />
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="span8">
                        <h4><i class="icon-inbox"></i>&nbsp;&nbsp;Archives</h4>
                        <asp:Repeater ID="rptArchived" runat="server">
                            <ItemTemplate>
                                <div class="box">
                                    <h5>From: System Administrator</h5>
                                    <h5><%#DataBinder.Eval(Container.DataItem, "timestamp") %></h5>
                                    <p><%#DataBinder.Eval(Container.DataItem, "message") %></p>
                                    <asp:Button ID="btnArchiveToInbox" runat="server" Text="Move To Inbox" OnCommand="btnArchiveToInbox_Command" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "message_id") %>' />
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
