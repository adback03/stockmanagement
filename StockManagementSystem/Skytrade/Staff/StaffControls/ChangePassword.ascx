<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.ascx.cs" Inherits="Staff_StaffControls_ChangePassword" %>

<div class="tab-pane" id="changePassword">
    <div class="row-fluid">
        <div class="span12">
            <h4><i class="icon-users"></i>&nbsp;&nbsp;Requests to Register</h4>
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
            <asp:Button ID="btnChangePassword" runat="server" Text="Change" CssClass="btn-inverse" OnClick="lbtnChange_Click"/>
            <br />
            <asp:HiddenField ClientIDMode="Static" ID="hfPassword" runat="server" Value="" />
            
            <br />

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