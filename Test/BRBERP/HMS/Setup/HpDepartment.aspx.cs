using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using BRBERP.App_Code;
using Newtonsoft.Json;

namespace BRBERP.HMS.Setup
{
    public partial class HpDepartment : System.Web.UI.Page
    {
        public static DataTable dt = new DataTable(); 
        public static string Constr = ConfigurationManager.ConnectionStrings["hmsConbrb"].ConnectionString;
        static  SqlDataAccess _dba = new SqlDataAccess();
        private static string uid = "1";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetAllData();
            }
        }
        private void GetAllData() //Get all the data and bind it in HTLM Table 
        {
            string query = "select * from SetupDepartment order by DepartmentID desc";
            dt = _dba.Executedt(query);
        }
        [WebMethod]
        public static Department[] GetData() //Show the details of the data after insert in HTML Table
        {
            var details = new List<Department>();

            string query = "select * from SetupDepartment order by DepartmentID desc";
            dt = _dba.Executedt(query);

            details.AddRange(from DataRow dtrow in dt.Rows
                select new Department()
                {
                    DepartmentID = Convert.ToInt32(dtrow["DepartmentID"]),
                    DepartmentName = dtrow["DepartmentName"].ToString(),
                    Status = dtrow["Status"].ToString()
                });

            return details.ToArray();
        }

        [WebMethod]
        public static void SaveData(Department objAdd) //Insert data in database 
        {
            string dateTody = DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");
            string addedDate = DateTime.ParseExact(dateTody, "dd-MM-yyyy HH:mm:ss", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd HH:mm:ss", CultureInfo.InvariantCulture);

            string query = "INSERT INTO SetupDepartment (DepartmentName,Status,CreateBy,CreateDate) " +
                           "VALUES('" + objAdd.DepartmentName + "', '" + objAdd.Status + "', '" + objAdd.CreateBy + "', '" + addedDate + "')";
            dt = _dba.Executedt(query);
        }

        [WebMethod]
        public static string EditData(int id) //Show the edit clicked data in the popup window 
        {
            string jsondata;
            //var details = new List<Employee>();

            string query = "select * from SetupDepartment where DepartmentID='" + id + "' order by DepartmentID desc";
            dt = _dba.Executedt(query);
            jsondata = JsonConvert.SerializeObject(dt);

            return jsondata;
        }

        [WebMethod]
        public static void UpdateData(Department objUpd, int id) //Update data in database   
        {
            string dateTody = DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");
            string updateDate = DateTime.ParseExact(dateTody, "dd-MM-yyyy HH:mm:ss", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd HH:mm:ss", CultureInfo.InvariantCulture);

            string query = "update SetupDepartment set DepartmentName='" + objUpd.DepartmentName + "',Status='" + objUpd.Status + "'," +
                           "UpdateBy='" + uid + "', UpdateDate='" + updateDate + "'where DepartmentID='" + id + "'";
            _dba.ExecuteNonQuery(query);
        }

        [WebMethod]
        public static void Remove(int id) 
        {
            string query = "delete from dbo.SetupDepartment where DepartmentID='" + id + "'";
            _dba.ExecuteNonQuery(query);
        }
    }

    public class Department
    {
        public int DepartmentID;
        public string DepartmentName;
        public string Status;
        public int CreateBy;
        public DateTime CreateDate;
        public int UpdateBy;
        public DateTime UpdateDate;

    }
}