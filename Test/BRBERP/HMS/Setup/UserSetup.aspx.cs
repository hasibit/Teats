using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using BRBERP.App_Code;
using System.Security.Cryptography.X509Certificates;
using Newtonsoft.Json;

namespace BRBERP.HMS.Setup
{
    public partial class UserSetup : System.Web.UI.Page
    {
        public static DataTable dt = new DataTable(); 
        public static string Constr = ConfigurationManager.ConnectionStrings["hmsConbrb"].ConnectionString;
        static  SqlDataAccess _dba = new SqlDataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetAllData();
            }
        }
        private void GetAllData() //Get all the data and bind it in HTLM Table 
        {
            string query = "select * from TblUser order by EmpId desc";
            dt = _dba.Executedt(query);
        }
        [WebMethod]
        public static Employee[] GetData() //Show the details of the data after insert in HTML Table
        {
            var details = new List<Employee>();

            string query = "select * from TblUser order by EmpId desc";
            dt = _dba.Executedt(query);

            details.AddRange(from DataRow dtrow in dt.Rows
                select new Employee
                {
                    EmpId = Convert.ToInt32(dtrow["EmpId"]),
                    FName = dtrow["Fname"].ToString(),
                    Email = dtrow["EMail"].ToString(),
                    HomeMobile = dtrow["Telephone"].ToString(),
                    OfficeMobile = dtrow["Mobile"].ToString(),
                    Doj = dtrow["DOJ"].ToString(),
                    Dob = dtrow["DOB"].ToString()
                });

            return details.ToArray();
        }

        [WebMethod]
        public static void SaveUser(Employee objEmployee) //Insert data in database
        {
            using (var con = new SqlConnection(Constr))
            {
                using (var cmd = new SqlCommand("INSERT INTO TblUser VALUES(@Fname, @Mname,@Lname,@Gender,@Email,@Dob,@MStatus,@Hobbies,@HMobile,@OMobile," +
                                                "@Address,@Pin,@State,@Nationality,@Doj,@CreatedDate,@ModifiedDate)"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@Fname", objEmployee.FName);
                    cmd.Parameters.AddWithValue("@Mname", objEmployee.MName);
                    cmd.Parameters.AddWithValue("@Lname", objEmployee.LName);
                    cmd.Parameters.AddWithValue("@Gender", objEmployee.Gender);
                    cmd.Parameters.AddWithValue("@Email", objEmployee.Email);
                    cmd.Parameters.AddWithValue("@Dob", objEmployee.Dob);
                    cmd.Parameters.AddWithValue("@MStatus", objEmployee.MaritalStatus);
                    cmd.Parameters.AddWithValue("@Hobbies", objEmployee.Hobbies);
                    cmd.Parameters.AddWithValue("@OMobile", objEmployee.OfficeMobile);
                    cmd.Parameters.AddWithValue("@HMobile", objEmployee.HomeMobile);
                    cmd.Parameters.AddWithValue("@Address", objEmployee.Address);
                    cmd.Parameters.AddWithValue("@Pin", objEmployee.Pincode);
                    cmd.Parameters.AddWithValue("@State", objEmployee.State);
                    cmd.Parameters.AddWithValue("@Nationality", objEmployee.Nationality);
                    cmd.Parameters.AddWithValue("@Doj", objEmployee.Doj);
                    cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
                    cmd.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }

        [WebMethod]
        public static string EditData(int eid) //Show the edit clicked data in the popup window
        {
            string jsondata;
            //var details = new List<Employee>();

            string query = "select * from TblUser where EmpId='" + eid + "' order by EmpId desc";
            dt = _dba.Executedt(query);
            jsondata = JsonConvert.SerializeObject(dt);

            return jsondata;
        }

        [WebMethod]
        public static void UpdateData(Employee objEmployee, int eid) //Update data in database  
        {
            string query = "update TblUser set Hobbies='" + objEmployee.Hobbies + "',Fname='" + objEmployee.FName +
                           "',Lname='" + objEmployee.LName + "',Mname='" + objEmployee.MName + "'," +
                           "Dob='" + objEmployee.Dob + "',MaritalStatus='" + objEmployee.MaritalStatus + "',Address='" +
                           objEmployee.Address + "', Telephone='" + objEmployee.OfficeMobile + "'," +
                           "Mobile='" + objEmployee.HomeMobile + "',Pincode='" + objEmployee.Pincode + "',State='" +
                           objEmployee.State + "',Nationality='" + objEmployee.Nationality + "', " +
                           "Doj='" + objEmployee.Doj + "'where EmpId='" + eid + "'";
            _dba.ExecuteNonQuery(query);
        }

        [WebMethod]
        public static void Remove(int eid)
        {
            string query = "delete from dbo.TblUser where EmpId='" + eid + "'";
            _dba.ExecuteNonQuery(query);
        }

    }

    public class Employee
    {
        public int EmpId;
        public string FName;
        public string LName;
        public string MName;
        public string Gender;
        public string Email;
        public string Dob;
        public string MaritalStatus;
        public string Hobbies;
        public string HomeMobile;
        public string OfficeMobile;
        public string Address;
        public string Pincode;
        public string State;
        public string Nationality;
        public string Doj;
        public DateTime CreatedDateTime;
        public DateTime ModifiedDateTime;
    }


}