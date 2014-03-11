<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AccountOverviewControl.ascx.cs" Inherits="CompanyControls_AccountOverviewControl" %>

<div class="tab-pane active" id="account">
    <div class="row-fluid">
        <div class="span4">
            <h4><i class="icon-user"></i>&nbsp;&nbsp;<asp:Label ID="lblCompany" runat="server" Text="****"></asp:Label></h4>
            <div class="box">
                <b>Username: </b><asp:Label ID="lblUsername" runat="server" Text="****"></asp:Label><br />
                <b>First Name: </b><asp:Label ID="lblFirstName" runat="server" Text="****"></asp:Label><br />
                <b>Last Name: </b><asp:Label ID="lblLastName" runat="server" Text="****"></asp:Label><br />
                <b>Email Address: </b><asp:Label ID="lblEmail" runat="server" Text="****"></asp:Label><br />
                <b>Phone Number: </b><asp:Label ID="lblPhone" runat="server" Text="****"></asp:Label><br />
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
            <a href="#PasswordModal" role="button" class="btn btn-large btn-inverse " data-toggle="modal">Change Password</a>
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
                        <asp:LinkButton ID="lbtnUpdate" runat="server"  OnClick="lbtnUpdate_Click"  PostBackUrl="/"><i class="icon-save">&nbsp;<span>Save</span></i></asp:LinkButton>
                    </li>
                </ul>
                <div class="tab-content ">
                    <div class="tab-pane active" id="panel6-1">
                        <div class="row-fluid">
                            <div class="span6">
                                <h4><i class="icon-user"></i>&nbsp;&nbsp; Account Information</h4>

                                <label>Username</label>
                                <asp:TextBox ID="txtUsername" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>Password</label>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>First Name</label>
                                <asp:TextBox ID="txtFirstName" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>Last Name</label>
                                <asp:TextBox ID="txtLastName" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>Email Address</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>Phone Number</label>
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>Social Security</label>
                                <asp:TextBox ID="txtSSN" runat="server" CssClass="input-block-level"></asp:TextBox>
                            </div>
                            <div class="span6">
                                <h4><i class="icon-envelope"></i>&nbsp;&nbsp;Mailing Address</h4>
                                <label>Address 1</label>
                                <asp:TextBox ID="txtAddress1" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>Address 2</label>
                                <asp:TextBox ID="txtAddress2" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>City</label>
                                <asp:TextBox ID="txtCity" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>State</label>
                                <asp:TextBox ID="txtState" runat="server" CssClass="input-block-level"></asp:TextBox>
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
                                <label>Account Type</label>
                                <asp:DropDownList ID="ddlAccountType" runat="server">
                                    <asp:ListItem>Checking</asp:ListItem>
                                    <asp:ListItem>Savings</asp:ListItem>
                                </asp:DropDownList>
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
                                <asp:TextBox ID="txtBillingState" runat="server" CssClass="input-block-level"></asp:TextBox>
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

<div id="PasswordModal" class="modal hide modal-form" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="row-fluid">
        <div class="span7 offset3">

            <div class="tabbable custom-tabs tabs-animated  flat flat-all hide-label-980 shadow tabs-top">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#panel6-1" data-toggle="tab" class="active "><i class="icon-user"></i>&nbsp;<span>Change Password</span></a></li>
                    <li class="pull-right"><a href="#close" data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i>&nbsp;<span></span></a></li>
                    <li class="pull-right">
                        <asp:LinkButton ID="LinkButton1" runat="server" ValidationGroup="ChangePassword" OnClick="lbtnChange_Click"  OnClientClick="lbtnChange_Click" Text="Change" />
                    </li>
                </ul>
                <div class="tab-content ">
                    <div class="tab-pane active" id="panel7-1">
                        <div class="row-fluid">
                            <div class="span6">
                                <h4><i class="icon-user"></i>&nbsp;&nbsp; Change Password</h4>

                                <label>Old Password</label>

                                <asp:TextBox TextMode="Password" ID="txtOldPassword" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtOldPassword" ForeColor="Red" ErrorMessage="Old password can not be none." ValidationGroup="ChangePassword" Display="Dynamic"/>
                                <asp:CompareValidator id="CompareValidator2" runat="server" ControlToValidate="txtOldPassword" ForeColor="Red" Operator="Equal" ValidationGroup="ChangePassword" ErrorMessage="Old password is not correct" Display="Dynamic" />
                                <label>New Password</label>
                                <asp:TextBox TextMode="Password" ID="txtNewPassword" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtNewPassword" ForeColor="Red" ErrorMessage="New password can not be none." ValidationGroup="ChangePassword" Display="Dynamic" />
                                <asp:RegularExpressionValidator runat="server" ID="revNewPassword" ControlToValidate="txtNewPassword" ForeColor="Red" ErrorMessage="New password must be at least 8 characters" Display="Dynamic" ValidationGroup="ChangePassword" />
                                <label>Confirm Password</label>
                                <asp:TextBox TextMode="Password" ID="txtConfirmPassword" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtConfirmPassword" ForeColor="Red" ErrorMessage="Confirm password can not be none" ValidationGroup="ChangePassword" Display="Dynamic" />
                                <asp:CompareValidator id="CompareValidator1" runat="server" ControlToValidate="txtConfirmPassword" ForeColor="Red" ControlToCompare="txtNewPassword" Operator="Equal" ValidationGroup="ChangePassword" ErrorMessage="Confirm password must be the same with new password" Display="Dynamic" />
                                
                                <asp:HiddenField ClientIDMode="Static" ID="hfPassword" runat="server" Value="" />
                                <br />
                                <br />
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    // Format Account number
    function jsFormatPassword(txt) {
        ValidateField(txt, document.getElementById('hfPassword').value);
    }

    // Change color of textbox depending on validation
    function ValidateField(txtBox, regex) {
        // If the textbox value matches the associated regex, change the border to blue
        if (txtBox.value.match(regex))
            txtBox.style.borderColor = "#0000ff";
            // Regex does not match, change border to red
        else
            txtBox.style.borderColor = "#ff0000";
    }
</script>