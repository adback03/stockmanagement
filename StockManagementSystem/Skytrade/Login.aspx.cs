using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DatabaseAccess;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Settings.Initialize();
        // Test comment for commit
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
                case Enums.enuType.Client:
                    Response.Redirect(Request.ApplicationPath);
                    break;
                case Enums.enuType.Staff:
                    Response.Redirect(Request.ApplicationPath + "Staff");
                    break;
                default:
                    break;
            }
        }
        else
        {
            // User login failed
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

        sFirstName += txtFirstName.Text;
        sLastName += txtLastName.Text;
        sSocialSecurity += txtSocialSecurity.Text;
        sEmail += txtEmail.Text;
        sPhone += txtPhone.Text;
        sLine1 += txtAddress1.Text;
        sLine2 += txtAddress2.Text;
        sCity += txtCity.Text;
        sState += txtState.Text;
        sZip += txtZip.Text;
        sBank += txtBankName.Text;
        sAccount += txtAcctNumber.Text;
        sRouting += txtRoutingNumber.Text;
        sBillingLine1 += txtBillingAddress1.Text;
        sBillingLine2 += txtBillingAddress2.Text;
        sBillingCity += txtBillingCity.Text;
        sBillingState += txtBillingState.Text;
        sBillingZip += txtBillingZip.Text;

        SqlCommand cmd = new SqlCommand("InsertUser");
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
        SqlHelper.ExecuteNonQuery(cmd, Settings.SkyTradeConn);
        Response.Redirect("Login.aspx?r=s");
    }
}
