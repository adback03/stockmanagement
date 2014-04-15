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
                                    <div class="box">
                                        Forget your password? <a href="#ResetModal" data-toggle="modal" >Find Here!</a>
                                    </div>
                                    <div class="box">
                                        Reactivate your account? <a href="#ReactiveModal" data-toggle="modal" >Click Here!</a>
                                    </div>
                                    <a href="#TermModal" data-toggle="modal">Terms and condition</a>
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
                                        <div>
                                            <p class="alert-info">If you are a staff member at SkyTrade, by signing up as employee you can receive additional benefits.</p>
                                            <label style="font-weight:bold">I Work for SkyTrade <asp:CheckBox ID="chkIsStaff" runat="server" /></label>
                                        </div>
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
                                        <asp:RegularExpressionValidator runat="server" ID="revBillingAddress2" ControlToValidate="txtBillingAddress2" ErrorMessage="Billing Address 2" Display="None" ValidationGroup="Register" />
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

        <%--This is the entire popup form that handles reactivate--%>
<div id="ReactiveModal" class="modal hide modal-form" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="row-fluid">
        <div class="span3 offset4">

            <div class="tabbable custom-tabs tabs-animated  flat flat-all hide-label-980 shadow tabs-top">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#panel6-1" data-toggle="tab" class="active "><i class="icon-user"></i>&nbsp;<span>Reactivate </span></a></li>
                    <li class="pull-right"><a href="#close" data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i>&nbsp;<span></span></a></li>
                    <li class="pull-right">
                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="btnReactive_Click" ValidationGroup="Reactive"><i class="icon-save">&nbsp;<span>Reactivate</span></i></asp:LinkButton>
                    </li>
                </ul>
                <div class="tab-content ">
                    <div class="tab-pane active" id="panel8-1">
                        <div class="row-fluid">
                            <div class="span12">
                                <h4><i class="icon-user"></i>&nbsp;&nbsp; Reactive</h4>

                                <label>Account</label>

                                <asp:TextBox ID="txtReactiveAccount" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="txtReactiveAccount" ForeColor="Red" ErrorMessage="Account can not be none." ValidationGroup="Reactive" Display="Dynamic"/>
                                
                                <label>SSN</label>

                                <asp:TextBox ID="txtReactveSSN" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ControlToValidate="txtReactveSSN" ForeColor="Red" ErrorMessage="SSN can not be none." ValidationGroup="Reactive" Display="Dynamic"/>
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

                <%--This is the entire popup form that handles reactive--%>
<div id="ResetModal" class="modal hide modal-form" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="row-fluid">
        <div class="span3 offset4">

            <div class="tabbable custom-tabs tabs-animated  flat flat-all hide-label-980 shadow tabs-top">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#panel6-1" data-toggle="tab" class="active "><i class="icon-user"></i>&nbsp;<span>Reset</span></a></li>
                    <li class="pull-right"><a href="#close" data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i>&nbsp;<span></span></a></li>
                    <li class="pull-right">
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="btnReset_Click" ValidationGroup="Reset"><i class="icon-save">&nbsp;<span>Reset</span></i></asp:LinkButton>
                    </li>
                </ul>
                <div class="tab-content ">
                    <div class="tab-pane active" id="panel8-2">
                        <div class="row-fluid">
                            <div class="span12">
                                <h4><i class="icon-user"></i>&nbsp;&nbsp; Reset</h4>

                                <label>Username</label>

                                <asp:TextBox ID="resetAccount" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ControlToValidate="resetAccount" ForeColor="Red" ErrorMessage="Account can not be none." ValidationGroup="Reset" Display="Dynamic"/>
                                
                                <label>SSN</label>

                                <asp:TextBox ID="resetSSN" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ControlToValidate="resetSSN" ForeColor="Red" ErrorMessage="SSN can not be none." ValidationGroup="Reset" Display="Dynamic"/>
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

<div id="TermModal" class="modal hide modal-form" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="row-fluid">
        <div class="span7 offset3">

            <div class="tabbable custom-tabs tabs-animated  flat flat-all hide-label-980 shadow tabs-top">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#panel6-1" data-toggle="tab" class="active "><i class="icon-user"></i>&nbsp;<span>Term and condition</span></a></li>
                    <li class="pull-right"><a href="#close" data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i>&nbsp;<span></span></a></li>
                </ul>
                <div class="tab-content ">
                <b>    
                    The fund's prospectus contains its investment objectives, risks, charges, expenses and other important information and should be read and considered carefully before investing. For a current prospectus, please contact us.
                </b>
                <br />
                <b>
                    SkyTrade credits and offers may be subject to U.S. withholding taxes and reporting at retail value. Taxes related to these credits and offers are the customer's responsibility.
                </b>
                <br />
                1. All transaction will be calculated with an additional $1.00 to make the trade for each stock bought.
                <br />
                SkyTrade Securities ratings for Online Broker by SmartMoney Magazine, May 2012 Broker Survey, based on the following categories: Trading Tools (5 stars), Customer Service (4 stars), 
                Banking Services (4 stars), Mutual Funds & Investment Products (4 stars), Research (5 stars), and Commissions and Fees (2 stars). SmartMoney is a registered trademark, a joint publishing 
                venture between Dow Jones & Company, Inc. and HearstSM Partnership. SkyTrade Securities ratings for Barron's annual ranking of the Best Online Brokers (March 12, 2012), based on Trade 
                Experience and Technology, Usability, Mobile, Range of Offerings, Research Amenities, Portfolio Analysis & Reports, Customer Service & Education and Costs. SkyTrade overall ranked #10.
                SkyTrade Securities ratings for Online Broker by Kiplinger's Personal Finance, November 2012 Online Broker Survey, based on the following categories: Investment Choices (5 stars), Customer Service (5 stars), User Experience (4.5 stars), 
                Research and Tools (4 stars), Banking (3.5 stars), and Fees & Commissions (2.5 stars). © 2012 The Kiplinger Washington Editors. All rights reserved.

                </div>
            </div>
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
                        <asp:LinkButton ID="lbtnUpdate" runat="server" OnClick="lbtnUpdate_Click" ValidationGroup="Reactivate"><i class="icon-save">&nbsp;<span>Save</span></i></asp:LinkButton>
                    </li>
                </ul>
                <div class="tab-content ">
                    <div class="tab-pane active" id="panel6-1">
                        <div class="row-fluid">
                            <div class="span6">
                                <h4><i class="icon-user"></i>&nbsp;&nbsp; Account Information</h4>

                                <asp:Label Visible="false" ID="reUserId" runat="server"></asp:Label>
                                <label>Username</label>
                                <asp:Label ID="reUsername" runat="server" CssClass="input-block-level"></asp:Label>
                                <label>First Name</label>
                                <asp:TextBox ID="reFirstName" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="reFirstName" ErrorMessage="First Name" ValidationGroup="Reactivate" Display="None" />
                                <asp:RegularExpressionValidator runat="server" ID="revReFirstName" ControlToValidate="reFirstName" ErrorMessage="First Name" Display="None" ValidationGroup="Reactivate" />
                                <label>Last Name</label>
                                <asp:TextBox ID="reLastName" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="reLastName" ErrorMessage="Last Name" ValidationGroup="Reactivate" Display="None" />
                                <asp:RegularExpressionValidator runat="server" ID="revReLastName" ControlToValidate="reLastName" ErrorMessage="Last Name" Display="None" ValidationGroup="Reactivate" />
                                <label>Email Address</label>
                                <asp:TextBox ID="reEmail" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="reEmail" ErrorMessage="Email" ValidationGroup="Reactivate" Display="None" />
                                <asp:RegularExpressionValidator runat="server" ID="revReEmail" ControlToValidate="reEmail" ErrorMessage="Email" Display="None" ValidationGroup="Reactivate" />
                                <label>Phone Number</label>
                                <asp:TextBox ID="rePhone" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="rePhone" ErrorMessage="Phone" ValidationGroup="Reactivate" Display="None" />
                                <asp:RegularExpressionValidator runat="server" ID="revRePhone" ControlToValidate="rePhone" ErrorMessage="Phone" Display="None" ValidationGroup="Reactivate" />
                                <label>Social Security</label>
                                <asp:Label ID="reSSN" runat="server" CssClass="input-block-level"></asp:Label>
                            </div>
                            <div class="span6">
                                <h4><i class="icon-envelope"></i>&nbsp;&nbsp;Mailing Address</h4>
                                <asp:Label Visible="false" ID="reAddressId" runat="server"></asp:Label>
                                <label>Address 1</label>
                                <asp:TextBox ID="reAddress1" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="reAddress1" ErrorMessage="Address1" ValidationGroup="Reactivate" Display="None" />
                                <asp:RegularExpressionValidator runat="server" ID="revReAddress1" ControlToValidate="reAddress1" ErrorMessage="Address1" Display="None" ValidationGroup="Reactivate" />
                                <label>Address 2</label>
                                <asp:TextBox ID="reAddress2" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>City</label>
                                <asp:TextBox ID="reCity" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="reCity" ErrorMessage="City" ValidationGroup="Reactivate" Display="None" />
                                <asp:RegularExpressionValidator runat="server" ID="revReCity" ControlToValidate="reCity" ErrorMessage="City" Display="None" ValidationGroup="Reactivate" />
                                <label>State</label>
                                <asp:DropDownList id="ddlReState" runat="server" CssClass="input-block-level">
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
                                <asp:TextBox ID="reZip" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="reZip" ErrorMessage="Zip" ValidationGroup="Reactivate" Display="None" />
                                <asp:RegularExpressionValidator runat="server" ID="revReZip" ControlToValidate="reZip" ErrorMessage="Zip" Display="None" ValidationGroup="Reactivate" />                                        <br />
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
                                <asp:TextBox ID="reBank" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="reBank" ErrorMessage="Bank Name" ValidationGroup="Reactivate" Display="None" />
                                <asp:RegularExpressionValidator runat="server" ID="revReBankName" ControlToValidate="reBank" ErrorMessage="Bank Name" Display="None" ValidationGroup="Reactivate" />
                                <label>Routing Number</label>
                                <asp:TextBox ID="reRouting" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="reRouting" ErrorMessage="Routing Number" ValidationGroup="Reactivate" Display="None" />
                                <asp:RegularExpressionValidator runat="server" ID="revReRoutingNumber" ControlToValidate="reRouting" ErrorMessage="Routing Number" Display="None" ValidationGroup="Reactivate" />
                                <label>Account Number</label>
                                <asp:TextBox ID="reAccountNumber" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="reAccountNumber" ErrorMessage="Account Number" ValidationGroup="Reactivate" Display="None" />
                                <asp:RegularExpressionValidator runat="server" ID="revReAccountNumber" ControlToValidate="reAccountNumber" ErrorMessage="Account Number" Display="None" ValidationGroup="Reactivate" />
                            </div>
                            <div class="span6">
                                <h4><i class="icon-envelope"></i>&nbsp;&nbsp;Billing Address</h4>
                                <label>Address 1</label>
                                <asp:TextBox ID="reBillingAddress1" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="reBillingAddress1" ErrorMessage="Billing Address 1" ValidationGroup="Reactivate" Display="None" />
                                <asp:RegularExpressionValidator runat="server" ID="revReBillingAddress" ControlToValidate="reBillingAddress1" ErrorMessage="Billing Address 1" Display="None" ValidationGroup="Reactivate" />
                                <label>Address 2</label>
                                <asp:TextBox ID="reBillingAddress2" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>City</label>
                                <asp:TextBox ID="reBillingCity" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="reBillingCity" ErrorMessage="Billing City" ValidationGroup="Reactivate" Display="None" />
                                <asp:RegularExpressionValidator runat="server" ID="revReBillingCity" ControlToValidate="reBillingCity" ErrorMessage="Billing City" Display="None" ValidationGroup="Reactivate" />
                                <label>State</label>
                                <asp:DropDownList id="ddlReBillingState" runat="server" CssClass="input-block-level">
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
                                <asp:TextBox ID="reBillingZip" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ControlToValidate="reBillingZip" ErrorMessage="Billing Zip" ValidationGroup="Reactivate" Display="None" />
                                <asp:RegularExpressionValidator runat="server" ID="revReBillingZip" ControlToValidate="reBillingZip" ErrorMessage="Billing Zip" Display="None" ValidationGroup="Reactivate" />
                                <asp:ValidationSummary
                                    id="ValidationSummary1"
                                    ShowMessageBox="true"
                                    ShowSummary="false"
                                    HeaderText="The following fields are either blank or incorrectly formatted:"
                                    EnableClientScript="true"
                                    ValidationGroup="Reactivate"
                                    runat="server"/>
                            </div> <!-- span6 -->
                        </div> <!-- row-fluid -->
                    </div> <!-- panel6-2 -->

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

    function showEditModal()
    {
        $("#TabsModal").modal("show");
    }
</script>
</html>
