using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessObject;
using BusinessLogic;
using DataAccess;
using System.Data;
using System.Data.SqlClient;

namespace Employee
{
    public partial class Registration : System.Web.UI.Page
    {
        EmployeeBAL objBAL = new EmployeeBAL();
        EmployeeMasterBO objBO = new EmployeeMasterBO();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            objBO.mode = 9;
            objBO.EmpName1 = txtEmpName.Text;
            objBO.mobile = Convert.ToInt64(txtEmpMobile.Text);
            objBO.Username = txtusername.Text;
            objBO.password = txtpassword.Text;
            objBO.status1 = true;

            int result = objBAL.OpData(objBO);
            if (result > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('records inserted successfully!!!');", true);
            }
        }
    }
}