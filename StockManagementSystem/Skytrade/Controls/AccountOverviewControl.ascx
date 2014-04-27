<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AccountOverviewControl.ascx.cs" Inherits="Controls_AccountOverviewControl" %>

<asp:Panel ID="pnlNotQualified" runat="server" Visible="false">
    <h5 class="heading-2" style="color:yellow;">Not qualified to close.</h5>
</asp:Panel>
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
            <h4><i class="icon-question"></i>&nbsp;&nbsp;Bank Information</h4>
            <div class="box">
                <b>Bank Name: </b><asp:Label ID="lblBank" runat="server" Text="****"></asp:Label><br />
                <b>Routing Number: </b><asp:Label ID="lblRouting" runat="server" Text="****"></asp:Label><br />
                <b>Account Number: </b><asp:Label ID="lblAccount" runat="server" Text="****"></asp:Label><br />
                <br />
                <br />
                <br />
                <br />
            </div>
            <h4><i class="icon-location-arrow"></i>&nbsp;&nbsp;Bank Address</h4>
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
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <a href="#TabsModal" role="button" class="btn btn-large btn-inverse " data-toggle="modal">Edit Account</a>
            <a href="#PasswordModal" role="button" class="btn btn-large btn-inverse " data-toggle="modal">Change Password</a>
            <a id="closeBtn" onclick="switchCloseDiv();" role="button" class="btn btn-large btn-inverse " data-toggle="modal">Close Account</a>
            <span id="closeDiv" style="visibility:hidden;">
                <asp:TextBox TextMode="Password" ID="txtPassword" runat="server"></asp:TextBox>
                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="lbtnDeactive_Click" ValidationGroup="Deactive">Save</asp:LinkButton>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtPassword" ForeColor="Red" ErrorMessage="Password can not be none." ValidationGroup="Deactive" Display="Dynamic"/>
                <asp:CompareValidator id="CompareValidator3" runat="server" ControlToValidate="txtPassword" ForeColor="Red" Operator="Equal" ValidationGroup="Deactive" ErrorMessage="Password is not correct" Display="Dynamic" />
            </span>
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
                        <asp:LinkButton ID="lbtnUpdate" runat="server" OnClick="lbtnUpdate_Click" ValidationGroup="Register"><i class="icon-save">&nbsp;<span>Save</span></i></asp:LinkButton>
                    </li>
                </ul>
                <div class="tab-content ">
                    <div class="tab-pane active" id="panel6-1">
                        <div class="row-fluid">
                            <div class="span6">
                                <h4><i class="icon-user"></i>&nbsp;&nbsp; Account Information</h4>

                                <label>Username</label>
                                <asp:Label ID="txtUsername" runat="server" CssClass="input-block-level"></asp:Label>
                                <label>First Name</label>
                                <asp:TextBox ID="txtFirstName" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name" ValidationGroup="Register" Display="None" />
                                <asp:RegularExpressionValidator runat="server" ID="revFirstName" ControlToValidate="txtFirstName" ErrorMessage="First Name" Display="None" ValidationGroup="Register" />
                                <label>Last Name</label>
                                <asp:TextBox ID="txtLastName" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name" ValidationGroup="Register" Display="None" />
                                <asp:RegularExpressionValidator runat="server" ID="revLastName" ControlToValidate="txtLastName" ErrorMessage="Last Name" Display="None" ValidationGroup="Register" />
                                <label>Email Address</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email" ValidationGroup="Register" Display="None" />
                                <asp:RegularExpressionValidator runat="server" ID="revEmail" ControlToValidate="txtEmail" ErrorMessage="Email" Display="None" ValidationGroup="Register" />
                                <label>Phone Number</label>
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPhone" ErrorMessage="Phone" ValidationGroup="Register" Display="None" />
                                <asp:RegularExpressionValidator runat="server" ID="revPhone" ControlToValidate="txtPhone" ErrorMessage="Phone" Display="None" ValidationGroup="Register" />
                                <label>Social Security</label>
                                <asp:Label ID="txtSSN" runat="server" CssClass="input-block-level"></asp:Label>
                            </div>
                            <div class="span6">
                                <h4><i class="icon-envelope"></i>&nbsp;&nbsp;Mailing Address</h4>
                                <asp:Label Visible="false" ID="txtAddressId" runat="server"></asp:Label>
                                <label>Address 1</label>
                                <asp:TextBox ID="txtAddress1" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtAddress1" ErrorMessage="Address1" ValidationGroup="Register" Display="None" />
                                <asp:RegularExpressionValidator runat="server" ID="revAddress1" ControlToValidate="txtAddress1" ErrorMessage="Address1" Display="None" ValidationGroup="Register" />
                                <label>Address 2</label>
                                <asp:TextBox ID="txtAddress2" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>City</label>
                                <asp:TextBox ID="txtCity" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtCity" ErrorMessage="City" ValidationGroup="Register" Display="None" />
                                <asp:RegularExpressionValidator runat="server" ID="revCity" ControlToValidate="txtCity" ErrorMessage="City" Display="None" ValidationGroup="Register" />
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtZip" ErrorMessage="Zip" ValidationGroup="Register" Display="None" />
                                <asp:RegularExpressionValidator runat="server" ID="revZip" ControlToValidate="txtZip" ErrorMessage="Zip" Display="None" ValidationGroup="Register" />                                        <br />
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtBank" ErrorMessage="Bank Name" ValidationGroup="Register" Display="None" />
                                <asp:RegularExpressionValidator runat="server" ID="revBankName" ControlToValidate="txtBank" ErrorMessage="Bank Name" Display="None" ValidationGroup="Register" />
                                <label>Routing Number</label>
                                <asp:TextBox ID="txtRouting" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtRouting" ErrorMessage="Routing Number" ValidationGroup="Register" Display="None" />
                                <asp:RegularExpressionValidator runat="server" ID="revRoutingNumber" ControlToValidate="txtRouting" ErrorMessage="Routing Number" Display="None" ValidationGroup="Register" />
                                <label>Account Number</label>
                                <asp:TextBox ID="txtAccountNumber" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtAccountNumber" ErrorMessage="Account Number" ValidationGroup="Register" Display="None" />
                                <asp:RegularExpressionValidator runat="server" ID="revAccountNumber" ControlToValidate="txtAccountNumber" ErrorMessage="Account Number" Display="None" ValidationGroup="Register" />
                            </div>
                            <div class="span6">
                                <h4><i class="icon-envelope"></i>&nbsp;&nbsp;Billing Address</h4>
                                <label>Address 1</label>
                                <asp:TextBox ID="txtBillingAddress1" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtBillingAddress1" ErrorMessage="Billing Address 1" ValidationGroup="Register" Display="None" />
                                <asp:RegularExpressionValidator runat="server" ID="revBillingAddress" ControlToValidate="txtBillingAddress1" ErrorMessage="Billing Address 1" Display="None" ValidationGroup="Register" />
                                <label>Address 2</label>
                                <asp:TextBox ID="txtBillingAddress2" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>City</label>
                                <asp:TextBox ID="txtBillingCity" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtBillingCity" ErrorMessage="Billing City" ValidationGroup="Register" Display="None" />
                                <asp:RegularExpressionValidator runat="server" ID="revBillingCity" ControlToValidate="txtBillingCity" ErrorMessage="Billing City" Display="None" ValidationGroup="Register" />
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtBillingZip" ErrorMessage="Billing Zip" ValidationGroup="Register" Display="None" />
                                <asp:RegularExpressionValidator runat="server" ID="revBillingZip" ControlToValidate="txtBillingZip" ErrorMessage="Billing Zip" Display="None" ValidationGroup="Register" />
<asp:HiddenField ClientIDMode="Static" ID="hfEmail" runat="server" Value="" />
<asp:HiddenField ClientIDMode="Static" ID="hfName" runat="server" Value="" />
<asp:HiddenField ClientIDMode="Static" ID="hfPhone" runat="server" Value="" />
<asp:HiddenField ClientIDMode="Static" ID="hfAddress1" runat="server" Value="" />
<asp:HiddenField ClientIDMode="Static" ID="hfCity" runat="server" Value="" />
<asp:HiddenField ClientIDMode="Static" ID="hfZip" runat="server" Value="" />
<asp:HiddenField ClientIDMode="Static" ID="hfAccountNumber" runat="server" Value="" />
<asp:HiddenField ClientIDMode="Static" ID="hfRoutingNumber" runat="server" Value="" />
<asp:HiddenField ClientIDMode="Static" ID="hfPassword" runat="server" Value="" />
<asp:ValidationSummary
                                id="vsRegisterSummary"
                                ShowMessageBox="true"
                                ShowSummary="false"
                                HeaderText="The following fields are either blank or incorrectly formatted:"
                                EnableClientScript="true"
                                ValidationGroup="Register"
                                runat="server"/>
                            </div> <!-- span6 -->
                        </div> <!-- row-fluid -->
                    </div> <!-- panel6-2 -->

                </div>
            </div>
        </div>
    </div>
</div>

<%--This is the entire popup form that handles changing password--%>
<div id="PasswordModal" class="modal hide modal-form" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="row-fluid">
        <div class="span7 offset3">

            <div class="tabbable custom-tabs tabs-animated  flat flat-all hide-label-980 shadow tabs-top">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#panel6-1" data-toggle="tab" class="active "><i class="icon-user"></i>&nbsp;<span>Change Password</span></a></li>
                    <li class="pull-right"><a href="#close" data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i>&nbsp;<span></span></a></li>
                    <li class="pull-right">
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="lbtnChange_Click" ValidationGroup="ChangePassword"><i class="icon-save">&nbsp;<span>Change</span></i></asp:LinkButton>
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
    // Format name
    function jsFormatName(txt) {
        ValidateField(txt, document.getElementById('hfName').value);
    }

    // Format SSN
    function jsFormatSSN(txt) {
        ValidateField(txt, document.getElementById('hfSSN').value);
    }

    // Format EMail
    function jsFormatEmail(txt) {
        ValidateField(txt, document.getElementById('hfEmail').value);
    }

    // Format Phone
    function jsFormatPhone(txt) {
        ValidateField(txt, document.getElementById('hfPhone').value);
    }

    // Format Address
    function jsFormatAddress(txt) {
        ValidateField(txt, document.getElementById('hfAddress1').value);
    }

    // Format City
    function jsFormatCity(txt) {
        ValidateField(txt, document.getElementById('hfCity').value);
    }

    // Format Zip
    function jsFormatZip(txt) {
        ValidateField(txt, document.getElementById('hfZip').value);
    }

    // Format Account number
    function jsFormatAccount(txt) {
        ValidateField(txt, document.getElementById('hfAccountNumber').value);
    }

    // Format Account number
    function jsFormatRouting(txt) {
        ValidateField(txt, document.getElementById('hfRoutingNumber').value);
    }

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

    function switchCloseDiv() {
        if ($("#closeDiv").css("visibility") == "hidden") {
            $('a#closeBtn').text('Cancel');
            $("#closeDiv").css("visibility", "visible");
        } else {
            $('a#closeBtn').text('Close Account');
            $("#closeDiv").css("visibility", "hidden");
        }
    }
</script>