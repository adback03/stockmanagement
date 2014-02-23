<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AccountOverviewControl.ascx.cs" Inherits="Controls_AccountOverviewControl" %>

<div class="tab-pane active" id="account">
    <div class="row-fluid">
        <div class="span4">
            <h4><i class="icon-user"></i>&nbsp;&nbsp; Account Overview</h4>
            <div class="box">
                <b>Username: </b><asp:Label ID="lblUsername" runat="server" Text="****"></asp:Label><br />
                <b>First Name: </b><asp:Label ID="lblFirstName" runat="server" Text="****"></asp:Label><br />
                <b>Last Name: </b><asp:Label ID="lblLastName" runat="server" Text="****"></asp:Label><br />
                <b>Email Address: </b><asp:Label ID="lblEmail" runat="server" Text="****"></asp:Label><br />
                <b>Phone Number: </b><asp:Label ID="lblPhone" runat="server" Text="****"></asp:Label><br />
                <b>Social Security: </b><asp:Label ID="lblSSN" runat="server" Text="xxx-xx-5455"></asp:Label><br />
            </div>
            <h4><i class="icon-location-arrow"></i>&nbsp;&nbsp;Mailing Address</h4>
            <div class="box">
                <address>
                    <strong><asp:Label ID="lblMailingName" runat="server" Text="****"></asp:Label></strong><br>
                    <asp:Label ID="lblMailingLine1" runat="server" Text="****"></asp:Label><br>
                    <asp:Label ID="lblMailingLine2" runat="server" Text="****"></asp:Label><br>
                    <asp:Label ID="lblMailingLineExtra" runat="server" Text="****"></asp:Label><br>
                </address>
            </div>
        </div>
        <div class="span4">
            <h4><i class="icon-question"></i>&nbsp;&nbsp;Billing Information</h4>
            <div class="box">
                <b>Bank Name: </b><asp:Label ID="lblBank" runat="server" Text="****"></asp:Label><br />
                <b>Routing Number: </b><asp:Label ID="lblRouting" runat="server" Text="****"></asp:Label><br />
                <b>Account Number: </b><asp:Label ID="lblAccount" runat="server" Text="****"></asp:Label><br />
                <br />
                <br />
            </div>
            <h4><i class="icon-location-arrow"></i>&nbsp;&nbsp;Billing Address</h4>
            <div class="box">
                <address>
                    <strong><asp:Label ID="lblBillingName" runat="server" Text="****"></asp:Label></strong><br>
                    <asp:Label ID="lblBillingLine1" runat="server" Text="****"></asp:Label><br>
                    <asp:Label ID="lblBillingLine2" runat="server" Text="****"></asp:Label><br>
                    <asp:Label ID="lblBillingLineExtra" runat="server" Text="****"></asp:Label><br>
                </address>
            </div>
        </div>
        <div class="span4">
            <h4><i class="icon-expand-alt"></i>&nbsp;&nbsp;Quick Stats</h4>

            <asp:Literal ID="ltChart" runat="server"></asp:Literal>
            <div id="chart_div"></div>
            
            <div class="box">
                <p>To view your complete Sky Trade stats, <a href="#">click here.</a></p>
            </div>
            <a href="#TabsModal" role="button" class="btn btn-large btn-inverse " data-toggle="modal">Edit Account</a>
        </div>
    </div>
</div>

<%--This is the entire popup form that handles editing a user's account information.--%>
<div id="TabsModal" class="modal hide modal-form" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="row-fluid">
        <div class="span7 offset3">

            <div class="tabbable custom-tabs tabs-animated  flat flat-all hide-label-980 shadow tabs-top">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#panel6-1" data-toggle="tab" class="active "><i class="icon-user"></i>&nbsp;<span>Account Information</span></a></li>
                    <li><a href="#panel6-2" data-toggle="tab"><i class="icon-money"></i>&nbsp;<span>Billing Information</span></a></li>
                    <li class="pull-right"><a href="#close" data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i>&nbsp;<span></span></a></li>
                    <li class="pull-right">
                        <asp:LinkButton ID="lbtnUpdate" runat="server" OnClick="lbtnUpdate_Click" PostBackUrl="/"><i class="icon-save">&nbsp;<span>Save</span></i></asp:LinkButton>
                    </li>
                </ul>
                <div class="tab-content ">
                    <div class="tab-pane active" id="panel6-1">
                        <div class="row-fluid">
                            <div class="span6">
                                <h4><i class="icon-user"></i>&nbsp;&nbsp; Account Information</h4>

                                <label>Username</label>
                                <asp:Label ID="txtUsername" runat="server" CssClass="input-block-level"></asp:Label></asp:TextBox>
                                <%-- <label>Password</label>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="input-block-level"></asp:TextBox> --%>
                                <label>First Name</label>
                                <asp:TextBox ID="txtFirstName" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>Last Name</label>
                                <asp:TextBox ID="txtLastName" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>Email Address</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>Phone Number</label>
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>Social Security</label>
                                <asp:Label ID="txtSSN" runat="server" CssClass="input-block-level"></asp:Label>
                            </div>
                            <div class="span6">
                                <h4><i class="icon-envelope"></i>&nbsp;&nbsp;Mailing Address</h4>
                                <asp:Label Visible="false" ID="txtAddressId" runat="server"></asp:Label>
                                <label>Address 1</label>
                                <asp:TextBox ID="txtAddress1" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>Address 2</label>
                                <asp:TextBox ID="txtAddress2" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>City</label>
                                <asp:TextBox ID="txtCity" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>State</label>
                                <asp:DropDownList id="ddlState" runat="server" CssClass="input-block-level">
                                            <asp:ListItem Value="AL">Alabama</asp:ListItem>
                                            <asp:ListItem Value="AK">Alaska</asp:ListItem>
                                            <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                                            <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                                            <asp:ListItem Value="CA">California</asp:ListItem>
                                            <asp:ListItem Value="CO">Colorado</asp:ListItem>
                                            <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                                            <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
                                            <asp:ListItem Value="DE">Delaware</asp:ListItem>
                                            <asp:ListItem Value="FL">Florida</asp:ListItem>
                                            <asp:ListItem Value="GA">Georgia</asp:ListItem>
                                            <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                                            <asp:ListItem Value="ID">Idaho</asp:ListItem>
                                            <asp:ListItem Value="IL">Illinois</asp:ListItem>
                                            <asp:ListItem Value="IN">Indiana</asp:ListItem>
                                            <asp:ListItem Value="IA">Iowa</asp:ListItem>
                                            <asp:ListItem Value="KS">Kansas</asp:ListItem>
                                            <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                                            <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                                            <asp:ListItem Value="ME">Maine</asp:ListItem>
                                            <asp:ListItem Value="MD">Maryland</asp:ListItem>
                                            <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                                            <asp:ListItem Value="MI">Michigan</asp:ListItem>
                                            <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                                            <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                                            <asp:ListItem Value="MO">Missouri</asp:ListItem>
                                            <asp:ListItem Value="MT">Montana</asp:ListItem>
                                            <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                                            <asp:ListItem Value="NV">Nevada</asp:ListItem>
                                            <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                                            <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                                            <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                                            <asp:ListItem Value="NY">New York</asp:ListItem>
                                            <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                                            <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                                            <asp:ListItem Value="OH">Ohio</asp:ListItem>
                                            <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                                            <asp:ListItem Value="OR">Oregon</asp:ListItem>
                                            <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                                            <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                                            <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                                            <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                                            <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                                            <asp:ListItem Value="TX">Texas</asp:ListItem>
                                            <asp:ListItem Value="UT">Utah</asp:ListItem>
                                            <asp:ListItem Value="VT">Vermont</asp:ListItem>
                                            <asp:ListItem Value="VA">Virginia</asp:ListItem>
                                            <asp:ListItem Value="WA">Washington</asp:ListItem>
                                            <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                                            <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                                            <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                                        </asp:DropDownList>
                                <label>Zip Code</label>
                                <asp:TextBox ID="txtZip" runat="server" CssClass="input-block-level"></asp:TextBox>
                                                                        <br />
                                <br />
                                <br />
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane" id="panel6-2">
                        <div class="row-fluid">
                            <div class="span6">
                                <h4><i class="icon-user"></i>&nbsp;&nbsp; Billing Information</h4>

                                <label>Bank Name</label>
                                <asp:TextBox ID="txtBank" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>Routing Number</label>
                                <asp:TextBox ID="txtRouting" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>Account Number</label>
                                <asp:TextBox ID="txtAccountNumber" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <%-- <label>Account Type</label>
                                <asp:DropDownList ID="ddlAccountType" runat="server">
                                    <asp:ListItem>Checking</asp:ListItem>
                                    <asp:ListItem>Savings</asp:ListItem>
                                </asp:DropDownList>--%>
                            </div>
                            <div class="span6">
                                <h4><i class="icon-envelope"></i>&nbsp;&nbsp;Billing Address</h4>
                                <label>Address 1</label>
                                <asp:TextBox ID="txtBillingAddress1" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>Address 2</label>
                                <asp:TextBox ID="txtBillingAddress2" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>City</label>
                                <asp:TextBox ID="txtBillingCity" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>State</label>
                                <asp:DropDownList id="ddlBillingState" runat="server" CssClass="input-block-level">
                                            <asp:ListItem Value="AL">Alabama</asp:ListItem>
                                            <asp:ListItem Value="AK">Alaska</asp:ListItem>
                                            <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                                            <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                                            <asp:ListItem Value="CA">California</asp:ListItem>
                                            <asp:ListItem Value="CO">Colorado</asp:ListItem>
                                            <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                                            <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
                                            <asp:ListItem Value="DE">Delaware</asp:ListItem>
                                            <asp:ListItem Value="FL">Florida</asp:ListItem>
                                            <asp:ListItem Value="GA">Georgia</asp:ListItem>
                                            <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                                            <asp:ListItem Value="ID">Idaho</asp:ListItem>
                                            <asp:ListItem Value="IL">Illinois</asp:ListItem>
                                            <asp:ListItem Value="IN">Indiana</asp:ListItem>
                                            <asp:ListItem Value="IA">Iowa</asp:ListItem>
                                            <asp:ListItem Value="KS">Kansas</asp:ListItem>
                                            <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                                            <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                                            <asp:ListItem Value="ME">Maine</asp:ListItem>
                                            <asp:ListItem Value="MD">Maryland</asp:ListItem>
                                            <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                                            <asp:ListItem Value="MI">Michigan</asp:ListItem>
                                            <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                                            <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                                            <asp:ListItem Value="MO">Missouri</asp:ListItem>
                                            <asp:ListItem Value="MT">Montana</asp:ListItem>
                                            <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                                            <asp:ListItem Value="NV">Nevada</asp:ListItem>
                                            <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                                            <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                                            <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                                            <asp:ListItem Value="NY">New York</asp:ListItem>
                                            <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                                            <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                                            <asp:ListItem Value="OH">Ohio</asp:ListItem>
                                            <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                                            <asp:ListItem Value="OR">Oregon</asp:ListItem>
                                            <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                                            <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                                            <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                                            <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                                            <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                                            <asp:ListItem Value="TX">Texas</asp:ListItem>
                                            <asp:ListItem Value="UT">Utah</asp:ListItem>
                                            <asp:ListItem Value="VT">Vermont</asp:ListItem>
                                            <asp:ListItem Value="VA">Virginia</asp:ListItem>
                                            <asp:ListItem Value="WA">Washington</asp:ListItem>
                                            <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                                            <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                                            <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                                        </asp:DropDownList>
                                <label>Zip Code</label>
                                <asp:TextBox ID="txtBillingZip" runat="server" CssClass="input-block-level"></asp:TextBox>
                            </div> <!-- span6 -->
                        </div> <!-- row-fluid -->
                    </div> <!-- panel6-2 -->

                </div>
            </div>
        </div>
    </div>
</div>