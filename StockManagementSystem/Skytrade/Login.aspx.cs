using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DatabaseAccess;
using Common;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Settings.Initialize();
        InitHiddenFields();
        InitJavascript();
        // Test comment for commit
        pnlThanks.Visible = false;
        pnlDuplicated.Visible = false;
        if (Request.Params["r"] != null)
        {
            pnlThanks.Visible = true;
        }
        else if(Request.Params["e"] != null)
        {
            pnlDuplicated.Visible = true;
        }
        else if (Request.Params["d"] != null)
        {
            pnlDeactived.Visible = true;
        }
        else if (Request.Params["reactive"] != null)
        {
            
        }
    }

    protected void lbtnLogin_Click(object sender, EventArgs e)
    {
        if (Account.Login(txtUserName.Text, txtPassword.Text, int.Parse(ddlUserType.SelectedValue)))
        {
            switch (Account.CurrentUser().Type)
            {
                case Enums.SkyTradeType.Client:
                    App.RedirectToRoot();
                    break;
                case Enums.SkyTradeType.Staff:
                    App.Redirect("Staff");
                    break;
                default:
                    break;
            }
        }
        else
        {
            // User login failed
            App.ShowAlertMessage("We're sorry, the login information you provided is incorrect. Please try again.");
        }
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        string sFirstName = "";
        string sLastName = "";
        string sSocialSecurity = "";
        string sEmail = "";
        string sPhone = "";
        string sLine1 = "";
        string sLine2 = "";
        string sCity = "";
        string sState = "";
        string sZip = "";
        string sBank = "";
        string sAccount = "";
        string sRouting = "";
        string sBillingLine1 = "";
        string sBillingLine2 = "";
        string sBillingCity = "";
        string sBillingState = "";
        string sBillingZip = "";
        int userType = (int)Enums.SkyTradeType.Client;

        sFirstName += txtFirstName.Text;
        sLastName += txtLastName.Text;
        sSocialSecurity += txtSocialSecurity.Text;
        sEmail += txtEmail.Text;
        sPhone += txtPhone.Text;
        sLine1 += txtAddress1.Text;
        sLine2 += txtAddress2.Text;
        sCity += txtCity.Text;
        sState += ddlState.SelectedValue;
        sZip += txtZip.Text;
        sBank += txtBankName.Text;
        sAccount += txtAcctNumber.Text;
        sRouting += txtRoutingNumber.Text;
        sBillingLine1 += txtBillingAddress1.Text;
        sBillingLine2 += txtBillingAddress2.Text;
        sBillingCity += txtBillingCity.Text;
        sBillingState += ddlBillingState.SelectedValue;
        sBillingZip += txtBillingZip.Text;
        userType = (chkIsStaff.Checked == true) ? (int)Enums.SkyTradeType.Staff : (int)Enums.SkyTradeType.Client;

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM Users WHERE ssn=@ssn";
        cmd.Parameters.Add("@ssn", SqlDbType.VarChar).Value = sSocialSecurity;
        DataTable dt = SqlHelper.ReturnAsTable(cmd, Settings.SkyTradeConn);
        if (dt.Rows.Count != 0)
        {
            App.Redirect("Login.aspx?e=s");
        }
        else
        {

            cmd = new SqlCommand("InsertUser");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@firstname", SqlDbType.VarChar).Value = sFirstName;
            cmd.Parameters.Add("@lastname", SqlDbType.VarChar).Value = sLastName;
            cmd.Parameters.Add("@ssn", SqlDbType.VarChar).Value = sSocialSecurity;
            cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = sEmail;
            cmd.Parameters.Add("@phone", SqlDbType.VarChar).Value = sPhone;
            cmd.Parameters.Add("@line1", SqlDbType.VarChar).Value = sLine1;
            cmd.Parameters.Add("@line2", SqlDbType.VarChar).Value = sLine2;
            cmd.Parameters.Add("@city", SqlDbType.VarChar).Value = sCity;
            cmd.Parameters.Add("@state", SqlDbType.VarChar).Value = sState;
            cmd.Parameters.Add("@zip", SqlDbType.VarChar).Value = sZip;
            cmd.Parameters.Add("@bank_name", SqlDbType.VarChar).Value = sBank;
            cmd.Parameters.Add("@billing_line1", SqlDbType.VarChar).Value = sBillingLine1;
            cmd.Parameters.Add("@billing_line2", SqlDbType.VarChar).Value = sBillingLine2;
            cmd.Parameters.Add("@billing_city", SqlDbType.VarChar).Value = sBillingCity;
            cmd.Parameters.Add("@billing_state", SqlDbType.VarChar).Value = sBillingState;
            cmd.Parameters.Add("@billing_zip", SqlDbType.VarChar).Value = sBillingZip;
            cmd.Parameters.Add("@account_number", SqlDbType.VarChar).Value = sAccount;
            cmd.Parameters.Add("@routing_number", SqlDbType.VarChar).Value = sRouting;
            cmd.Parameters.Add("@user_type", SqlDbType.Int).Value = userType;
            SqlHelper.ExecuteNonQuery(cmd, Settings.SkyTradeConn);
            App.Redirect("Login.aspx?r=s");
        }
    }

    protected void btnReactive_Click(object sender, EventArgs e)
    {
        string username = "" + txtReactiveAccount.Text;
        string ssn = "" + txtReactveSSN.Text;
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM Users WHERE username=@username AND ssn=@ssn";
        cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = username;
        cmd.Parameters.Add("@ssn", SqlDbType.VarChar).Value = ssn;
        DataTable dt = SqlHelper.ReturnAsTable(cmd, Settings.SkyTradeConn);
        if (dt.Rows.Count != 0)
        {
            DataRow dr = dt.Rows[0];
            int status_id = Convert.ToInt32(dr["status_id"]);
            if(status_id == 1 || status_id == 4)
                App.ShowAlertMessage("Your request is processing, please check your email later.");
            else if (status_id == 3)
            {
                int id = Convert.ToInt32(dt.Rows[0]["user_id"]);
                Bind_Data(id);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "showEditModal", "$(function() { showEditModal(); });", true);
            }
            else
            {
                App.ShowAlertMessage("We're sorry, the username and ssn information you provided is incorrect, or this account is not deactivated.");
            }
        }
        else
        {
            App.ShowAlertMessage("We're sorry, the username and ssn information you provided is incorrect, or this account is not deactivated.");
        }
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        string username = "" + resetAccount.Text;
        string ssn = "" + resetSSN.Text;
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM Users WHERE username=@username AND ssn=@ssn";
        cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = username;
        cmd.Parameters.Add("@ssn", SqlDbType.VarChar).Value = ssn;
        DataTable dt = SqlHelper.ReturnAsTable(cmd, Settings.SkyTradeConn);
        if (dt.Rows.Count != 0)
        {
            DataRow dr = dt.Rows[0];
            if (Convert.ToInt32(dr["status_id"]) != 2)
            {
                App.ShowAlertMessage("Your account is not activated.");
            }
            else
            {
                String password = SkyTrade.generatePassword();
                SqlCommand update = new SqlCommand("UPDATE Users SET password=@password WHERE user_id = @user_id");
                update.Parameters.Add("@user_id", SqlDbType.Int).Value = Convert.ToInt32(dr["user_id"]);
                update.Parameters.Add("@password", SqlDbType.VarChar).Value = password;
                SqlHelper.ExecuteNonQuery(update, Settings.SkyTradeConn);
                String head = "Your new password!";
                String body = "Username: \n" + username + "\nPassword: \n" + password;
                SkyTrade.sendMail((string)dr["email"], head, body);
                App.ShowAlertMessage("Your new password has been sent to your email, please check.");
            }
        }
        else
        {
            App.ShowAlertMessage("We're sorry, the username and ssn information you provided is incorrect.");
        }
    }

    protected void lbtnUpdate_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(reUserId.Text);
        string sFirstName = "";
        string sLastName = "";
        string sSocialSecurity = "";
        string sEmail = "";
        string sPhone = "";
        string sLine1 = "";
        string sLine2 = "";
        string sCity = "";
        string sState = "";
        string sZip = "";
        string sBank = "";
        string sAccount = "";
        string sRouting = "";
        string sBillingLine1 = "";
        string sBillingLine2 = "";
        string sBillingCity = "";
        string sBillingState = "";
        string sBillingZip = "";
        int sAddressId = Convert.ToInt32(reAddressId.Text);

        sFirstName += reFirstName.Text;
        sLastName += reLastName.Text;
        sSocialSecurity += reSSN.Text;
        sEmail += reEmail.Text;
        sPhone += rePhone.Text;
        sLine1 += reAddress1.Text;
        sLine2 += reAddress2.Text;
        sCity += reCity.Text;
        sState += ddlReState.SelectedValue;
        sZip += reZip.Text;
        sBank += reBank.Text;
        sAccount += reAccountNumber.Text;
        sRouting += reRouting.Text;
        sBillingLine1 += reBillingAddress1.Text;
        sBillingLine2 += reBillingAddress2.Text;
        sBillingCity += reBillingCity.Text;
        sBillingState += ddlReBillingState.SelectedValue;
        sBillingZip += reBillingZip.Text;

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "UPDATE Users SET firstname=@firstname, lastname=@lastname, email=@email, phone=@phone, status_id=@status_id WHERE user_id=@user_id";
        cmd.Parameters.Add("@user_id", SqlDbType.Int).Value = id;
        cmd.Parameters.Add("@firstname", SqlDbType.VarChar).Value = sFirstName;
        cmd.Parameters.Add("@lastname", SqlDbType.VarChar).Value = sLastName;
        cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = sEmail;
        cmd.Parameters.Add("@phone", SqlDbType.VarChar).Value = sPhone;
        cmd.Parameters.Add("@status_id", SqlDbType.Int).Value = 4;
        SqlHelper.ExecuteNonQuery(cmd, Settings.SkyTradeConn);
        cmd.CommandText = "UPDATE Address SET line1=@line1, line2=@line2, city=@city, state=@state, zip=@zip WHERE address_id=@address_id";
        cmd.Parameters.Add("@address_id", SqlDbType.Int).Value = sAddressId;
        cmd.Parameters.Add("@line1", SqlDbType.VarChar).Value = sLine1;
        cmd.Parameters.Add("@line2", SqlDbType.VarChar).Value = sLine2;
        cmd.Parameters.Add("@city", SqlDbType.VarChar).Value = sCity;
        cmd.Parameters.Add("@state", SqlDbType.VarChar).Value = sState;
        cmd.Parameters.Add("@zip", SqlDbType.VarChar).Value = sZip;
        SqlHelper.ExecuteNonQuery(cmd, Settings.SkyTradeConn);
        cmd.CommandText = "UPDATE BankAccount SET bank_name=@bank_name, billing_line1=@billing_line1, billing_line2=@billing_line2, billing_city=@billing_city, billing_state=@billing_state, billing_zip=@billing_zip, account_number=@account_number, routing_number=@routing_number WHERE user_id=@user_id";
        cmd.Parameters.Add("@bank_name", SqlDbType.VarChar).Value = sBank;
        cmd.Parameters.Add("@billing_line1", SqlDbType.VarChar).Value = sBillingLine1;
        cmd.Parameters.Add("@billing_line2", SqlDbType.VarChar).Value = sBillingLine2;
        cmd.Parameters.Add("@billing_city", SqlDbType.VarChar).Value = sBillingCity;
        cmd.Parameters.Add("@billing_state", SqlDbType.VarChar).Value = sBillingState;
        cmd.Parameters.Add("@billing_zip", SqlDbType.VarChar).Value = sBillingZip;
        cmd.Parameters.Add("@account_number", SqlDbType.VarChar).Value = sAccount;
        cmd.Parameters.Add("@routing_number", SqlDbType.VarChar).Value = sRouting;
        SqlHelper.ExecuteNonQuery(cmd, Settings.SkyTradeConn);
        App.ShowAlertMessage("Your reactivation request has been sent. Please check your email.");
    }

    /// <summary>
    /// Initialize all hidden fields.
    /// These fields all used so that the values of our regexes can be determined
    /// at runtime and used within our javascript, so we don't have to repeat the 
    /// same regex multiple times in different areas of the program.
    /// </summary>
    private void InitHiddenFields()
    {
        // Social Security
        hfSSN.Value = Regex.SSN;
        revSocialSecurity.ValidationExpression = Regex.SSN;
        revResetSSN.ValidationExpression = Regex.SSN;
        revReactiveSSN.ValidationExpression = Regex.SSN;

        // Email
        hfEmail.Value = Regex.Email;
        revEmail.ValidationExpression = revReEmail.ValidationExpression = Regex.Email;

        //Name
        hfName.Value = Regex.Name;
        revFirstName.ValidationExpression = revReFirstName.ValidationExpression = Regex.Name;
        revLastName.ValidationExpression = revReLastName.ValidationExpression = Regex.Name;

        // Phone
        hfPhone.Value = Regex.Phone;
        revPhone.ValidationExpression = revRePhone.ValidationExpression = Regex.Phone;

        // Address1
        hfAddress1.Value = Regex.Address;
        revAddress1.ValidationExpression = revReAddress1.ValidationExpression = Regex.Address;

        // Address2
        hfAddress2.Value = Regex.Address;
        revAddress2.ValidationExpression = Regex.Address;

        // City
        hfCity.Value = Regex.City;
        revCity.ValidationExpression = revReCity.ValidationExpression = Regex.City;

        // Zip
        hfZip.Value = Regex.Zip;
        revZip.ValidationExpression = revReZip.ValidationExpression = Regex.Zip;

        // Bank name
        revBankName.ValidationExpression = revReBankName.ValidationExpression = Regex.Name;

        // Account Number
        hfAccountNumber.Value = Regex.AccountNumber;
        revAccountNumber.ValidationExpression = revReAccountNumber.ValidationExpression = Regex.AccountNumber;

        // Routing Number
        hfRoutingNumber.Value = Regex.RoutingNumber;
        revRoutingNumber.ValidationExpression = revReRoutingNumber.ValidationExpression = Regex.RoutingNumber;

        // Bank Address1
        revBillingAddress.ValidationExpression = revReBillingAddress.ValidationExpression = Regex.Address;

        // Bank Address2
        revBillingAddress2.ValidationExpression = Regex.Address;
        
        // Billing City
        revBillingCity.ValidationExpression = revReBillingCity.ValidationExpression = Regex.City;

        // Billing Zip
        hfZip.Value = Regex.Zip;
        revBillingZip.ValidationExpression = revReBillingZip.ValidationExpression = Regex.Zip;
    }

    /// <summary>
    /// Add key up events to all our fields that require validation,
    /// so client side validation can also take place.
    /// </summary>
    private void InitJavascript()
    {
        // Account information
        txtFirstName.Attributes.Add("onkeyup", "jsFormatName(this);");
        txtLastName.Attributes.Add("onkeyup", "jsFormatName(this);");
        txtSocialSecurity.Attributes.Add("onkeyup", "jsFormatSSN(this);");
        txtEmail.Attributes.Add("onkeyup", "jsFormatEmail(this);");
        txtPhone.Attributes.Add("onkeyup", "jsFormatPhone(this);");
        txtAddress1.Attributes.Add("onkeyup", "jsFormatAddress(this);");
        txtAddress2.Attributes.Add("onkeyup", "jsFormatAddress(this);");
        txtCity.Attributes.Add("onkeyup", "jsFormatCity(this);");
        txtZip.Attributes.Add("onkeyup", "jsFormatZip(this);");

        // Billing information
        txtBankName.Attributes.Add("onkeyup", "jsFormatName(this);");
        txtAcctNumber.Attributes.Add("onkeyup", "jsFormatAccount(this);");
        txtRoutingNumber.Attributes.Add("onkeyup", "jsFormatRouting(this);");
        txtBillingAddress1.Attributes.Add("onkeyup", "jsFormatAddress(this);");
        txtBillingAddress2.Attributes.Add("onkeyup", "jsFormatAddress(this);");
        txtBillingCity.Attributes.Add("onkeyup", "jsFormatCity(this);");
        txtBillingZip.Attributes.Add("onkeyup", "jsFormatZip(this);");
    }

    protected void Bind_Data(int id)
    {
        DataRow user = GetUser(id);
        DataRow account = GetAccount(id);
        DataRow address = GetAddress(Convert.ToInt32(user["address_id"]));
        reUserId.Text = id.ToString();
        reUsername.Text = (String)user["username"];
        reFirstName.Text = (String)user["firstname"];
        reLastName.Text = (String)user["lastname"];
        reEmail.Text = (String)user["email"];
        rePhone.Text = (String)user["phone"];
        reSSN.Text = "***-**-" + ((String)user["ssn"]).Substring(7);
        reBank.Text = (String)account["bank_name"];
        reRouting.Text = (String)account["routing_number"];
        reAccountNumber.Text = (String)account["account_number"];
        reBillingAddress1.Text = (String)account["billing_line1"];
        reBillingAddress2.Text = (String)account["billing_line2"];
        reBillingCity.Text = (String)account["billing_city"];
        ddlReBillingState.SelectedValue = (String)account["billing_state"];
        reBillingZip.Text = (String)account["billing_zip"];
        reAddressId.Text = Convert.ToString(user["address_id"]);
        reAddress1.Text = (String)address["line1"];
        reAddress2.Text = (String)address["line2"];
        reCity.Text = (String)address["city"];
        ddlReState.Text = (String)address["state"];
        reZip.Text = (String)address["zip"];
    }

    private DataRow GetUser(int id)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM Users WHERE user_id = @user_id";
        cmd.Parameters.Add("@user_id", SqlDbType.Int).Value = id;
        DataTable dt = SqlHelper.ReturnAsTable(cmd, Settings.SkyTradeConn);
        return dt.Rows[0];
    }

    private DataRow GetAccount(int id)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM BankAccount WHERE user_id = @user_id";
        cmd.Parameters.Add("@user_id", SqlDbType.Int).Value = id;
        DataTable dt = SqlHelper.ReturnAsTable(cmd, Settings.SkyTradeConn);
        return dt.Rows[0];
    }

    private DataRow GetAddress(int aid)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM Address WHERE address_id = @address_id";
        cmd.Parameters.Add("@address_id", SqlDbType.Int).Value = aid;
        DataTable dt = SqlHelper.ReturnAsTable(cmd, Settings.SkyTradeConn);
        return dt.Rows[0];
    }
}
