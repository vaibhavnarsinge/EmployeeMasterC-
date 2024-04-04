using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessObject;
using DataAccess;
using BusinessLogic;
using System.Data;
using System.Data.SqlClient;


namespace Employee
{
    public partial class Login : System.Web.UI.Page
    {
        EmployeeBAL objBAL = new EmployeeBAL();
        EmployeeMasterBO objBO = new EmployeeMasterBO();
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            objBO.mode = 10;
            objBO.Username = txtUsername.Text;
            objBO.password = txtPassword.Text;

            DataTable dt = objBAL.FetchData(objBO);


            //if (dt.Rows.Count > 0)
            //{
            //    if (dt.Rows[0]["status1"].ToString() == "True")
            //    {
            //        Session["username"] = dt.Rows[0]["Username"].ToString();
            //        Session["empID"] = dt.Rows[0]["pk_empID"];

                   Response.Redirect("AddEmp.aspx");
            //    }

            //    else if (dt.Rows[0]["status1"].ToString() == "False")
            //    {
            //        ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('Inactive Accout');", true);
            //    }
            //    else
            //    {
            //        ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('Login Fail!!!!!');", true);
            //    }
            //}

        }
    }
}