using Common;
using DatabaseAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Staff_StaffControls_ChangePassword : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }

    protected void lbtnChange_Click(object sender, EventArgs e)
    {
        string password = txtNewPassword.Text;
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "UPDATE Users SET password=@password WHERE user_id=@user_id";
        cmd.Parameters.Add("@user_id", SqlDbType.Int).Value = Account.CurrentUser().UserId;
        cmd.Parameters.Add("@password", SqlDbType.VarChar).Value = password;
        SqlHelper.ExecuteNonQuery(cmd, Settings.SkyTradeConn);
    }

    protected void BindData()
    {
        hfPassword.Value = Regex.Password;
        revNewPassword.ValidationExpression = Regex.Password;
        CompareValidator2.ValueToCompare = Account.CurrentUser().Password;
    }
}