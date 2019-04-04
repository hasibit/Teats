using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls; 

namespace BRBERP.App_Code
{
    class Common
    {
        public void Ddl(DataTable dt, DropDownList ddl, string text, string value, string message)
        {
            try
            {
                ddl.DataSource = dt;
                ddl.DataTextField = text;
                ddl.DataValueField = value;
                ddl.DataBind();
                ddl.Items.Insert(0, new ListItem("-- Select " + message + "--", string.Empty));
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void LstBx(DataTable dt, ListBox ddl, string text, string value, string message)
        {
            try
            {
                ddl.DataSource = dt;
                ddl.DataTextField = text;
                ddl.DataValueField = value;
                ddl.DataBind();
                //ddl.Items.Insert(0, new ListItem("-- Select " + message + "--", string.Empty));
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void ChkBx(DataTable dt, CheckBoxList ddl, string text, string value, string message)
        {
            try
            {
                ddl.DataSource = dt;
                ddl.DataTextField = text;
                ddl.DataValueField = value;
                ddl.DataBind();
                //ddl.Items.Insert(0, new ListItem("-- Select " + message + "--", string.Empty));
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public double ConverStringToDouble(string str)
        {
            double dbl = 0;
            if (str.Length <= 0)
            {
                dbl = 0;
            }
            else
            {
                if (str == string.Empty || str == "NaN")
                {
                    dbl = 0;
                }
                else
                {
                    dbl = Convert.ToDouble(str);
                }
            }
            return dbl;
        }

        public double ConString2DecimalfromDouble(string str)
        {
            double dbl = 0;
            if (str == string.Empty)
            {
                dbl = 0;
            }
            if (str.Length <= 0)
            {
                dbl = 0;
            }
            else
            {
                if (str == string.Empty || str == "NaN")
                {
                    dbl = 0;
                }
                else
                {
                    dbl = Convert.ToDouble(str);
                }
            }
            dbl = Math.Round((Double)dbl, 2);
            return dbl;
        }
        
    }
}
