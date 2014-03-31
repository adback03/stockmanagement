<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="Assets/Stylesheets/bootstrap.min.css" rel="stylesheet" />
    <link href="Assets/Stylesheets/bootstrap-responsive.min.css" rel="stylesheet" />    
    <link href="Assets/Stylesheets/style.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css' />
    <link href="Assets/Stylesheets/font-awesome.min.css" rel="stylesheet" />

    <script src="Assets/Javascript/jquery-1.9.1.min.js"></script>
    <script src="Assets/Javascript/bootstrap.min.js"></script>
    <script src="Assets/Javascript/tabs-addon.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div class="row-fluid" id="demo-2" style="padding-top:100px">
            <div class="span5 offset3">
                <asp:Panel ID="pnlThanks" runat="server" Visible="false">
                    <h2 class="heading-2">Thank you for registering.</h2>
                    <h4 class="heading-4">Your request is processing, and you will receive a response shortly.</h4>
                </asp:Panel>
                <asp:Panel ID="pnlDuplicated" runat="server" Visible="false">
                    <h2 class="heading-2">Sorry, your request can not be satisfied.</h2>
                    <h4 class="heading-4">Your ssn number already exists in our system, please check.</h4>
                </asp:Panel>
                <asp:Panel ID="pnlDeactived" runat="server" Visible="false">
                    <h2 class="heading-2">Your account has been deactived.</h2>
                </asp:Panel>
                
                <div class="tabbable custom-tabs tabs-left tabs-animated  flat flat-all hide-label-980 shadow track-url auto-scroll dark">
                    <div class="tab-content ">
                        <div class="tab-pane active" id="account">
                            <div class="row-fluid">
                                <div class="span12" style="text-align:center">
                                    <h4><i class="icon-user"></i>&nbsp;&nbsp; Login</h4>
                                    <label>Username</label>
                                    <asp:TextBox ID="txtUserName" runat="server" CssClass="input-block-level"></asp:TextBox><br />
                                    <label>Password</label>
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="input-block-level" TextMode="Password"></asp:TextBox><br />
                                    <label>User Type</label>
                                    <asp:DropDownList ID="ddlUserType" runat="server" CssClass="dropdown input-block-level">
                                        <asp:ListItem Text="Client" Value="1"/>
                                        <asp:ListItem Text="Staff" Value="2" />
                                    </asp:DropDownList>
                                    <asp:LinkButton ID="lbtnLogin" runat="server" CssClass="btn btn-large btn-inverse" OnClick="lbtnLogin_Click"><i class="icon-user">&nbsp;&nbsp;<span>Login</span></i></asp:LinkButton>
                                    <br /><br />
                                    <div class="box">
                                        Need an account? <a href="#RegisterModal" data-toggle="modal" >Register Here!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="RegisterModal" class="modal hide modal-form" tabindex="-1" role="dialog">
            <div class="row-fluid">
                <div class="span7 offset3">
                    <div class="tabbable custom-tabs tabs-animated  flat flat-all hide-label-980 shadow tabs-top">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#register-acct" data-toggle="tab" class="active "><i class="icon-user"></i>&nbsp;<span>Account Information</span></a></li>
                            <li><a href="#register-billing" data-toggle="tab"><i class="icon-money"></i>&nbsp;<span>Billing Information</span></a></li>
                            <li class="pull-right"><a href="#close" data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i>&nbsp;<span></span></a></li>
                            <li class="pull-right">
                                <asp:LinkButton ID="btnRegister" runat="server" OnClick="btnRegister_Click" ValidationGroup="Register"><i class="icon-save">&nbsp;<span>Register</span></i></asp:LinkButton>
                            </li>
                        </ul>
                        <div class="tab-content ">
                            <div class="tab-pane active" id="register-acct">
                                <div class="row-fluid">
                                    <div class="span6">
                                        <h4><i class="icon-user"></i>&nbsp;&nbsp; Account Information</h4>
                                        <label>First Name</label>
                                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="input-block-level"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name" ValidationGroup="Register" Display="None" />
                                        <asp:RegularExpressionValidator runat="server" ID="revFirstName" ControlToValidate="txtFirstName" ErrorMessage="First Name" Display="None" ValidationGroup="Register" />
                                        <label>Last Name</label>
                                        <asp:TextBox ID="txtLastName" runat="server" CssClass="input-block-level"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name" ValidationGroup="Register" Display="None" />
                                        <asp:RegularExpressionValidator runat="server" ID="revLastName" ControlToValidate="txtLastName" ErrorMessage="Last Name" Display="None" ValidationGroup="Register" />
                                        <label>Social Security Number (###-##-####)</label>
                                        <asp:TextBox ID="txtSocialSecurity" runat="server" CssClass="input-block-level"></asp:TextBox>   
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSocialSecurity" ErrorMessage="Social Security" ValidationGroup="Register" Display="None" />
                                        <asp:RegularExpressionValidator runat="server" ID="revSocialSecurity" ControlToValidate="txtSocialSecurity" ErrorMessage="Social Security" Display="None" ValidationGroup="Register" />
                                        <label>Email</label>
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="input-block-level"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email" ValidationGroup="Register" Display="None" />
                                        <asp:RegularExpressionValidator runat="server" ID="revEmail" ControlToValidate="txtEmail" ErrorMessage="Email" Display="None" ValidationGroup="Register" />
                                        <label>Phone</label>
                                        <asp:TextBox ID="txtPhone" runat="server" CssClass="input-block-level"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPhone" ErrorMessage="Phone" ValidationGroup="Register" Display="None" />
                                        <asp:RegularExpressionValidator runat="server" ID="revPhone" ControlToValidate="txtPhone" ErrorMessage="Phone" Display="None" ValidationGroup="Register" />
                                    </div>
                                    <div class="span6">
                                        <h4><i class="icon-user"></i>&nbsp;&nbsp; Mailing Address</h4>
                                        <label>Address 1</label>
                                        <asp:TextBox ID="txtAddress1" runat="server" CssClass="input-block-level"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtAddress1" ErrorMessage="Address1" ValidationGroup="Register" Display="None" />
                                        <asp:RegularExpressionValidator runat="server" ID="revAddress1" ControlToValidate="txtAddress1" ErrorMessage="Address1" Display="None" ValidationGroup="Register" />
                                        <label>Address2</label>
                                        <asp:TextBox ID="txtAddress2" runat="server" CssClass="input-block-level"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtAddress2" ErrorMessage="Address2" ValidationGroup="Register" Display="None" />
                                        <asp:RegularExpressionValidator runat="server" ID="revAddress2" ControlToValidate="txtAddress2" ErrorMessage="Address2" Display="None" ValidationGroup="Register" />
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
                                        <label>Zip</label>
                                        <asp:TextBox ID="txtZip" runat="server" CssClass="input-block-level"></asp:TextBox>             
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtZip" ErrorMessage="Zip" ValidationGroup="Register" Display="None" />
                                        <asp:RegularExpressionValidator runat="server" ID="revZip" ControlToValidate="txtZip" ErrorMessage="Zip" Display="None" ValidationGroup="Register" />                
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="register-billing">
                                <div class="row-fluid">
                                    <div class="span6">
                                        <h4><i class="icon-user"></i>&nbsp;&nbsp; Bank Information</h4>
                                        <label>Bank Name</label>
                                        <asp:TextBox ID="txtBankName" runat="server" CssClass="input-block-level"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtBankName" ErrorMessage="Bank Name" ValidationGroup="Register" Display="None" />
                                        <asp:RegularExpressionValidator runat="server" ID="revBankName" ControlToValidate="txtBankName" ErrorMessage="Bank Name" Display="None" ValidationGroup="Register" />   
                                        <label>Account Number</label>
                                        <asp:TextBox ID="txtAcctNumber" runat="server" CssClass="input-block-level"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtAcctNumber" ErrorMessage="Account Number" ValidationGroup="Register" Display="None" />
                                        <asp:RegularExpressionValidator runat="server" ID="revAccountNumber" ControlToValidate="txtAcctNumber" ErrorMessage="Account Number" Display="None" ValidationGroup="Register" />   
                                        <label>Routing Number</label>
                                        <asp:TextBox ID="txtRoutingNumber" runat="server" CssClass="input-block-level"></asp:TextBox>   
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtRoutingNumber" ErrorMessage="Routing Number" ValidationGroup="Register" Display="None" />
                                        <asp:RegularExpressionValidator runat="server" ID="revRoutingNumber" ControlToValidate="txtRoutingNumber" ErrorMessage="Routing Number" Display="None" ValidationGroup="Register" />                          
                                    </div>
                                    <div class="span6">
                                        <h4><i class="icon-user"></i>&nbsp;&nbsp; Bank Address</h4>
                                        <label>Address 1</label>
                                        <asp:TextBox ID="txtBillingAddress1" runat="server" CssClass="input-block-level"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtBillingAddress1" ErrorMessage="Billing Address 1" ValidationGroup="Register" Display="None" />
                                        <asp:RegularExpressionValidator runat="server" ID="revBillingAddress" ControlToValidate="txtBillingAddress1" ErrorMessage="Billing Address 1" Display="None" ValidationGroup="Register" />   
                                        <label>Address2</label>
                                        <asp:TextBox ID="txtBillingAddress2" runat="server" CssClass="input-block-level"></asp:TextBox> 
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtBillingAddress2" ErrorMessage="Billing Address 2" ValidationGroup="Register" Display="None" />
                                        <asp:RegularExpressionValidator runat="server" ID="revBillingAddress2" ControlToValidate="txtBillingAddress1" ErrorMessage="Billing Address 2" Display="None" ValidationGroup="Register" />
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
                                        <label>Zip</label>
                                        <asp:TextBox ID="txtBillingZip" runat="server" CssClass="input-block-level"></asp:TextBox>   
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtBillingZip" ErrorMessage="Billing Zip" ValidationGroup="Register" Display="None" />
                                        <asp:RegularExpressionValidator runat="server" ID="revBillingZip" ControlToValidate="txtBillingZip" ErrorMessage="Billing Zip" Display="None" ValidationGroup="Register" />                              
                                    </div>
                                </div>
                            </div>
                            <asp:ValidationSummary
                                id="vsRegisterSummary"
                                ShowMessageBox="true"
                                ShowSummary="false"
                                HeaderText="The following fields are either blank or incorrectly formatted:"
                                EnableClientScript="true"
                                ValidationGroup="Register"
                                runat="server"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
        
    <asp:HiddenField ID="hfSSN" runat="server" Value="" />
    <asp:HiddenField ID="hfEmail" runat="server" Value="" />
    <asp:HiddenField ID="hfName" runat="server" Value="" />
    <asp:HiddenField ID="hfPhone" runat="server" Value="" />
    <asp:HiddenField ID="hfAddress1" runat="server" Value="" />
    <asp:HiddenField ID="hfAddress2" runat="server" Value="" />
    <asp:HiddenField ID="hfCity" runat="server" Value="" />
    <asp:HiddenField ID="hfZip" runat="server" Value="" />
    <asp:HiddenField ID="hfAccountNumber" runat="server" Value="" />
    <asp:HiddenField ID="hfRoutingNumber" runat="server" Value="" />
    </form>
</body>

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

    // Format Address 1
    function jsFormatAddress(txt) {
        ValidateField(txt, document.getElementById('hfAddress1').value);
    }

    // Format Address 2
    function jsFormatAddress(txt) {
        ValidateField(txt, document.getElementById('hfAddress2').value);
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
</html>
