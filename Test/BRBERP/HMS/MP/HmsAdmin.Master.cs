using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BRBERP.App_Code;

namespace BRBERP.HMS.MP
{
    public partial class HmsAdmin : System.Web.UI.MasterPage
    {
        SqlDataAccess _dba = new SqlDataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uFullname"] != null)
            {
                lblUserName.Text = Session["uFullname"].ToString();
            }
            else
            {
                Response.Redirect("~/LoginToHMS.aspx");
            }
        }

    }
}