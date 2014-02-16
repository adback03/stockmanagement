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
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First Name" Display="None" ControlToValidate="txtFirstName" ValidationGroup="Register"/>
                                        <label>Last Name</label>
                                        <asp:TextBox ID="txtLastName" runat="server" CssClass="input-block-level"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Last Name" Display="None" ControlToValidate="txtLastName" ValidationGroup="Register"/>
                                        <label>Social Security Number (###-##-####)</label>
                                        <asp:TextBox ID="txtSocialSecurity" runat="server" CssClass="input-block-level"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Social Security" Display="None" ControlToValidate="txtSocialSecurity" ValidationGroup="Register"/>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Social Security Number must be in format XXX-XX-XXXX" Display="None" ControlToValidate="txtSocialSecurity" ValidationExpression="^\d{3}-\d{2}-\d{4}$" ValidationGroup="Register"/>    
                                        <label>Email</label>
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="input-block-level" TextMode="Email"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Email" Display="None" ControlToValidate="txtEmail" ValidationGroup="Register"/>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Email address not in a valid format." Display="None" ControlToValidate="txtEmail" ValidationExpression="^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$" ValidationGroup="Register"/> 
                                        <label>Phone</label>
                                        <asp:TextBox ID="txtPhone" runat="server" CssClass="input-block-level"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Phone" Display="None" ControlToValidate="txtPhone" ValidationGroup="Register"/>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Phone Number not in a valid format." Display="None" ControlToValidate="txtPhone" ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$" ValidationGroup="Register"/>  
                                    </div>
                                    <div class="span6">
                                        <h4><i class="icon-user"></i>&nbsp;&nbsp; Mailing Address</h4>
                                        <label>Address 1</label>
                                        <asp:TextBox ID="txtAddress1" runat="server" CssClass="input-block-level"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Address 1" Display="None" ControlToValidate="txtAddress1" ValidationGroup="Register"/>
                                        <label>Address2</label>
                                        <asp:TextBox ID="txtAddress2" runat="server" CssClass="input-block-level"></asp:TextBox>
                                        <label>City</label>
                                        <asp:TextBox ID="txtCity" runat="server" CssClass="input-block-level"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="City" Display="None" ControlToValidate="txtCity" ValidationGroup="Register"/>
                                        <label>State</label>
                                        <asp:TextBox ID="txtState" runat="server" CssClass="input-block-level"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="State" Display="None" ControlToValidate="txtState" ValidationGroup="Register"/>
                                        <label>Zip</label>
                                        <asp:TextBox ID="txtZip" runat="server" CssClass="input-block-level"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Zip code" Display="None" ControlToValidate="txtZip" ValidationExpression="[0-9]+" ValidationGroup="Register"/>                                
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="register-billing">
                                <div class="row-fluid">
                                    <div class="span6">
                                        <h4><i class="icon-user"></i>&nbsp;&nbsp; Bank Information</h4>
                                        <label>Bank Name</label>
                                        <asp:TextBox ID="txtBankName" runat="server" CssClass="input-block-level"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Bank Name" Display="None" ControlToValidate="txtBankName" ValidationGroup="Register"/>
                                        <label>Account Number</label>
                                        <asp:TextBox ID="txtAcctNumber" runat="server" CssClass="input-block-level"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Account Number" Display="None" ControlToValidate="txtAcctNumber" ValidationGroup="Register"/>
                                        <label>Routing Number</label>
                                        <asp:TextBox ID="txtRoutingNumber" runat="server" CssClass="input-block-level"></asp:TextBox>  
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Routing Number" Display="None" ControlToValidate="txtRoutingNumber" ValidationGroup="Register"/>                                
                                    </div>
                                    <div class="span6">
                                        <h4><i class="icon-user"></i>&nbsp;&nbsp; Billing Address</h4>
                                        <label>Address 1</label>
                                        <asp:TextBox ID="txtBillingAddress1" runat="server" CssClass="input-block-level"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Billing Address 1" Display="None" ControlToValidate="txtBillingAddress1" ValidationGroup="Register"/>
                                        <label>Address2</label>
                                        <asp:TextBox ID="txtBillingAddress2" runat="server" CssClass="input-block-level"></asp:TextBox>
                                        <label>City</label>
                                        <asp:TextBox ID="txtBillingCity" runat="server" CssClass="input-block-level"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="Billing City" Display="None" ControlToValidate="txtBillingCity" ValidationGroup="Register"/>
                                        <label>State</label>
                                        <asp:TextBox ID="txtBillingState" runat="server" CssClass="input-block-level"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="Billing State" Display="None" ControlToValidate="txtBillingState" ValidationGroup="Register"/>
                                        <label>Zip</label>
                                        <asp:TextBox ID="txtBillingZip" runat="server" CssClass="input-block-level"></asp:TextBox>  
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="Billing Zip" Display="None" ControlToValidate="txtBillingZip" ValidationGroup="Register"/>                                
                                    </div>
                                </div>
                            </div>
                            <asp:ValidationSummary
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
    </form>
</body>
</html>
