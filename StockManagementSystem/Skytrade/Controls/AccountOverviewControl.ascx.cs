using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Google;
using System.Data.SqlClient;
using System.Data;
using DatabaseAccess;

public partial class Controls_AccountOverviewControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            GenerateQuickStats();
            Bind_Data();
        }
    }

    protected void Bind_Data()
    {
        DataRow user = GetUser();
        DataRow account = GetAccount();
        DataRow address = GetAddress(Convert.ToInt32(user["address_id"]));
        txtUsername.Text = lblUsername.Text = (String)user["username"];
        txtFirstName.Text = lblFirstName.Text = (String)user["firstname"];
        txtLastName.Text = lblLastName.Text = (String)user["lastname"];
        txtEmail.Text = lblEmail.Text = (String)user["email"];
        txtPhone.Text = lblPhone.Text = (String)user["phone"];
        txtSSN.Text = lblSSN.Text = ((String)user["ssn"]).Substring(0, 7) + "****";
        txtBank.Text = lblBank.Text = (String)account["bank_name"];
        txtRouting.Text = lblRouting.Text = (String)account["routing_number"];
        txtAccountNumber.Text = lblAccount.Text = (String)account["account_number"];
        lblBillingName.Text = (String)user["firstname"] + " " + (String)user["lastname"];
        txtBillingAddress1.Text = lblBillingLine1.Text = (String)account["billing_line1"];
        txtBillingAddress2.Text = lblBillingLine2.Text = (String)account["billing_line2"];
        txtAddress2.Text = lblMailingLine2.Text = (String)address["line2"];
        txtBillingCity.Text = (String)account["billing_city"];
        ddlBillingState.SelectedValue = (String)account["billing_state"];
        txtBillingZip.Text = (String)account["billing_zip"];
        lblBillingLineExtra.Text = (String)account["billing_city"] + ", " + (String)account["billing_state"] + ", " + (String)account["billing_zip"];
        lblMailingName.Text = (String)user["firstname"] + " " + (String)user["lastname"];
        txtAddressId.Text = Convert.ToString(user["address_id"]);
        txtAddress1.Text = lblMailingLine1.Text = (String)address["line1"];
        txtAddress2.Text = lblMailingLine2.Text = (String)address["line2"];
        txtCity.Text = (String)address["city"];
        ddlState.Text = (String)address["state"];
        txtZip.Text = (String)address["zip"];
        lblMailingLineExtra.Text = (String)address["city"] + ", " + (String)address["state"] + ", " + (String)address["zip"];
    }

    private DataRow GetUser()
    {
        int id = Account.CurrentUser().UserId;
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM Users WHERE user_id = @user_id";
        cmd.Parameters.Add("@user_id", SqlDbType.Int).Value = id;
        DataTable dt = SqlHelper.ReturnAsTable(cmd, Settings.SkyTradeConn);
        return dt.Rows[0];
    }

    private DataRow GetAccount()
    {
        int id = Account.CurrentUser().UserId;
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

    protected void lbtnUpdate_Click(object sender, EventArgs e)
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
        int sAddressId = Convert.ToInt32(txtAddressId.Text);

        sFirstName += txtFirstName.Text;
        sLastName += txtLastName.Text;
        sSocialSecurity += txtSSN.Text;
        sEmail += txtEmail.Text;
        sPhone += txtPhone.Text;
        sLine1 += txtAddress1.Text;
        sLine2 += txtAddress2.Text;
        sCity += txtCity.Text;
        sState += ddlState.SelectedValue;
        sZip += txtZip.Text;
        sBank += txtBank.Text;
        sAccount += txtAccountNumber.Text;
        sRouting += txtRouting.Text;
        sBillingLine1 += txtBillingAddress1.Text;
        sBillingLine2 += txtBillingAddress2.Text;
        sBillingCity += txtBillingCity.Text;
        sBillingState += ddlBillingState.SelectedValue;
        sBillingZip += txtBillingZip.Text;

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "UPDATE Users SET firstname=@firstname, lastname=@lastname, email=@email, phone=@phone WHERE user_id=@user_id";
        cmd.Parameters.Add("@user_id", SqlDbType.Int).Value = Account.CurrentUser().UserId;
        cmd.Parameters.Add("@firstname", SqlDbType.VarChar).Value = sFirstName;
        cmd.Parameters.Add("@lastname", SqlDbType.VarChar).Value = sLastName;
        cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = sEmail;
        cmd.Parameters.Add("@phone", SqlDbType.VarChar).Value = sPhone;
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
        Response.Redirect("/");
    }

    private void GenerateQuickStats()
    {
        GoogleChart chart = new GoogleChart();
        chart.title = "Quick Stats";
        chart.width = 250;
        chart.height = 200;
        chart.addColumn("string", "Year");
        chart.addColumn("number", "Value");
        chart.addColumn("number", "Profit");
        chart.addRow("'2014', 2000, 1000");
        ltChart.Text = chart.generateChart(GoogleChart.ChartType.ColumnChart);
    }
}