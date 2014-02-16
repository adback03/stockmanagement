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
                
                <div class="tabbable custom-tabs tabs-left tabs-animated  flat flat-all hide-label-980 shadow track-url auto-scroll grey">
                    <div class="tab-content ">
                        <div class="tab-pane active" id="account">
                            <div class="row-fluid">
                                <div class="span12" style="text-align:center">
                                    <h4><i class="icon-user"></i>&nbsp;&nbsp; Stock Market Administration</h4>
                                    <label>Username</label>
                                    <asp:TextBox ID="txtUserName" runat="server" CssClass="input-block-level"></asp:TextBox><br />
                                    <label>Password</label>
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="input-block-level" TextMode="Password"></asp:TextBox><br />
                                    <asp:LinkButton ID="lbtnLogin" runat="server" CssClass="btn btn-large btn-inverse" OnClick="lbtnLogin_Click"><i class="icon-user">&nbsp;&nbsp;<span>Login</span></i></asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
