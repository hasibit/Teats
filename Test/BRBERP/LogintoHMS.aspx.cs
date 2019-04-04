using BRBERP.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.VisualBasic;
using Microsoft.VisualBasic.CompilerServices;

namespace BRBERP
{
    public partial class LogintoHMS : System.Web.UI.Page
    {
        SqlDataAccess _dba = new SqlDataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Abandon();
                Session.Clear();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Checkuser())
            {
                Response.Redirect("./HMS/Dash/DashBoard.aspx");
            }
            else
            {
                lblMsg.Text = "Wrong UserName or Password";
                //Response.Redirect("LoginToLabReport.aspx");
            }
        }

        protected bool Checkuser()
        {
            string username = txtUserName.Text.Replace("'", "").Replace("=", "").Replace("-", "").Trim();
            string password = txtPassword.Text.Replace("'", "").Replace("=", "").Replace("-", "").Trim();

            bool status = false;

            string sql = "select UserId, FullName, Password from UserMaster where ShortName = '" + username + "' and IsActive = 'A'";

            DataTable dtuser = _dba.Executedt(sql);
            if (dtuser != null && dtuser.Rows.Count > 0)
            {
                string passd = dtuser.Rows[0]["password"].ToString();

                if (DecryptPwd(ref passd) == password)
                {
                    Session["uid"] = dtuser.Rows[0]["UserId"].ToString();
                    Session["uname"] = dtuser.Rows[0]["FullName"].ToString();
                    Session["uFullname"] = dtuser.Rows[0]["FullName"].ToString();
                    status = true;
                }
            }
            return status;
        }
        public string DecryptPwd(ref string strPwd)
        {
            string str = "";
            int num1 = 1;
            short num2 = checked((short)Strings.Len(strPwd));
            short num3 = (short)num1;
            while ((int)num3 <= (int)num2)
            {
                str += Conversions.ToString(Strings.Chr(checked(Strings.Asc(Strings.Mid(strPwd, (int)num3, 1)) - 10)));
                checked { ++num3; }
            }
            return str;
        }

        public string EncryptPwd(ref string strPwd)
        {
            string str = "";
            int num1 = 1;
            short num2 = checked((short)Strings.Len(strPwd));
            short num3 = (short)num1;
            while ((int)num3 <= (int)num2)
            {
                str += Conversions.ToString(Strings.Chr(checked(Strings.Asc(Strings.Mid(strPwd, (int)num3, 1)) + 10)));
                checked { ++num3; }
            }
            return str;
        }

    }
}