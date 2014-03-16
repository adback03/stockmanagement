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

        if (Request.Params["r"] != null)
        {
            pnlThanks.Visible = true;
        }
        else
        {
            pnlThanks.Visible = false;
        }
    }

    protected void lbtnLogin_Click(object sender, EventArgs e)
    {
        if (Account.Login(txtUserName.Text, txtPassword.Text, int.Parse(ddlUserType.SelectedValue)))
        {
            switch (Account.CurrentUser().Type)
            {
                case Enums.StockMarketType.Company:
                    App.Redirect("Company");
                    break;
                case Enums.StockMarketType.Admin:
                    App.RedirectToRoot();
                    break;
                default:
                    break;
            }
        }
        else
        {
            // User login failed
            App.ShowAlertMessage("We're sorry, the login information your provided is incorrect. Please try again.");
        }
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        string sCompanyName = "";
        string sFirstName = "";
        string sLastName = "";
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

        sCompanyName += txtCompanyName.Text;
        sFirstName += txtFirstName.Text;
        sLastName += txtLastName.Text;
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

        SqlCommand cmd = new SqlCommand("InsertCompany");
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@companyname", SqlDbType.VarChar).Value = sCompanyName;
        cmd.Parameters.Add("@firstname", SqlDbType.VarChar).Value = sFirstName;
        cmd.Parameters.Add("@lastname", SqlDbType.VarChar).Value = sLastName;
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
        SqlHelper.ExecuteNonQuery(cmd, Settings.StockMarketConn);
        App.Redirect("Login.aspx?r=s");
    }

    /// <summary>
    /// Initialize all hidden fields.
    /// These fields all used so that the values of our regexes can be determined
    /// at runtime and used within our javascript, so we don't have to repeat the 
    /// same regex multiple times in different areas of the program.
    /// </summary>
    private void InitHiddenFields()
    {
        // Company Name
        revCompanyName.ValidationExpression = Regex.Name;

        // Email
        hfEmail.Value = Regex.Email;
        revEmail.ValidationExpression = Regex.Email;

        //Name
        hfName.Value = Regex.Name;
        revFirstName.ValidationExpression = Regex.Name;
        revLastName.ValidationExpression = Regex.Name;

        // Phone
        hfPhone.Value = Regex.Phone;
        revPhone.ValidationExpression = Regex.Phone;

        // Address1
        hfAddress1.Value = Regex.Address;
        revAddress1.ValidationExpression = Regex.Address;

        // City
        hfCity.Value = Regex.City;
        revCity.ValidationExpression = Regex.City;

        // Zip
        hfZip.Value = Regex.Zip;
        revZip.ValidationExpression = Regex.Zip;

        // Bank name
        revBankName.ValidationExpression = Regex.Name;

        // Account Number
        hfAccountNumber.Value = Regex.AccountNumber;
        revAccountNumber.ValidationExpression = Regex.AccountNumber;

        // Routing Number
        hfRoutingNumber.Value = Regex.RoutingNumber;
        revRoutingNumber.ValidationExpression = Regex.RoutingNumber;

        // Bank Address
        revBillingAddress.ValidationExpression = Regex.Address;

        // Billing City
        revBillingCity.ValidationExpression = Regex.City;

        // Billing Zip
        hfZip.Value = Regex.Zip;
        revBillingZip.ValidationExpression = Regex.Zip;
    }

    /// <summary>
    /// Add key up events to all our fields that require validation,
    /// so client side validation can also take place.
    /// </summary>
    private void InitJavascript()
    {
        // Account information
        txtCompanyName.Attributes.Add("onkeyup", "jsFormatName(this);");
        txtFirstName.Attributes.Add("onkeyup", "jsFormatName(this);");
        txtLastName.Attributes.Add("onkeyup", "jsFormatName(this);");
        txtEmail.Attributes.Add("onkeyup", "jsFormatEmail(this);");
        txtPhone.Attributes.Add("onkeyup", "jsFormatPhone(this);");
        txtAddress1.Attributes.Add("onkeyup", "jsFormatAddress(this);");
        txtCity.Attributes.Add("onkeyup", "jsFormatCity(this);");
        txtZip.Attributes.Add("onkeyup", "jsFormatZip(this);");

        // Billing information
        txtBankName.Attributes.Add("onkeyup", "jsFormatName(this);");
        txtAcctNumber.Attributes.Add("onkeyup", "jsFormatAccount(this);");
        txtRoutingNumber.Attributes.Add("onkeyup", "jsFormatRouting(this);");
        txtBillingAddress1.Attributes.Add("onkeyup", "jsFormatAddress(this);");
        txtBillingCity.Attributes.Add("onkeyup", "jsFormatCity(this);");
        txtBillingZip.Attributes.Add("onkeyup", "jsFormatZip(this);");
    }
}