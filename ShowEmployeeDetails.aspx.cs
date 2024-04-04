using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using BusinessObject;
using DataAccess;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace EmployeeMaster
{
    public partial class ShowEmployeeDetails : System.Web.UI.Page
    {
        EmployeeBAL objBAL = new EmployeeBAL();
        EmployeeMasterBO objBO = new EmployeeMasterBO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindddlEmployee();
            }
        }

        protected void BindddlEmployee()
        {
            objBO.mode = 6;

            DataTable dtEmp = objBAL.FetchData(objBO);
            if (dtEmp.Rows.Count > 0)
            {

                ddlShowEmp.DataSource = dtEmp;
                ddlShowEmp.DataTextField = "Name";
                ddlShowEmp.DataValueField = "ID";
                ddlShowEmp.DataBind();
                ddlShowEmp.Items.Insert(0, new ListItem("Select", "0"));

            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            objBO.mode = 5;

            objBO.fk_personalinfoId =Convert.ToInt32(ddlShowEmp.SelectedValue);
            DataSet dtEmp = objBAL.FetchAll(objBO);

            if (dtEmp.Tables.Count > 0)
            {
                if (dtEmp.Tables[0].Rows.Count > 0)
                {
                       string s = " "+dtEmp.Tables[0].Rows[0]["FirstName"].ToString()+ " " + dtEmp.Tables[0].Rows[0]["MiddleName"].ToString()+" "+ dtEmp.Tables[0].Rows[0]["LastName"].ToString();
                    lblfirstname.Text = s;
                        //dtEmp.Tables[0].Rows[0]["FirstName"].ToString();
                    //lblmiddlename.Text = dtEmp.Tables[0].Rows[0]["MiddleName"].ToString();
                    //lbllastname.Text = dtEmp.Tables[0].Rows[0]["LastName"].ToString();
                    lblsdob.Text = dtEmp.Tables[0].Rows[0]["DOB"].ToString();
                    lblsidentity.Text = dtEmp.Tables[0].Rows[0]["IdentityMark"].ToString();
                    lblsemail.Text = dtEmp.Tables[0].Rows[0]["Email"].ToString();
                    lblsbloodgroup.Text = dtEmp.Tables[0].Rows[0]["BloodGroup"].ToString();
                    lblsgender.Text = dtEmp.Tables[0].Rows[0]["Gender"].ToString();
                    lblsmaritialstatus.Text = dtEmp.Tables[0].Rows[0]["MarriedStatus"].ToString();
                    lblscountry.Text = dtEmp.Tables[0].Rows[0]["Country_Name"].ToString();
                    lblsstate.Text = dtEmp.Tables[0].Rows[0]["State_Name"].ToString();
                    lblsdistrict.Text = dtEmp.Tables[0].Rows[0]["District_Name"].ToString();
                    lblsaddhar.Text = dtEmp.Tables[0].Rows[0]["AddharNo"].ToString();
                    lblsmobile.Text = dtEmp.Tables[0].Rows[0]["MobileNo"].ToString();
                    lblscaddress.Text = dtEmp.Tables[0].Rows[0]["CAddress"].ToString();
                    lblspaddress.Text = dtEmp.Tables[0].Rows[0]["PAddress"].ToString();
                    sImage.ImageUrl = dtEmp.Tables[0].Rows[0]["Photo"].ToString();


                }
                if (dtEmp.Tables[1].Rows.Count > 0)
                {
                    lblsspouseName.Text = dtEmp.Tables[1].Rows[0]["SpouseName"].ToString();
                    lblsspouseage.Text = dtEmp.Tables[1].Rows[0]["SpouseAge"].ToString();
                    lblsmothername.Text = dtEmp.Tables[1].Rows[0]["MotherName"].ToString();
                    lblsmotherage.Text = dtEmp.Tables[1].Rows[0]["MotherAge"].ToString();
                    lblsfathername.Text = dtEmp.Tables[1].Rows[0]["FatherName"].ToString();
                    lblsfatherage.Text = dtEmp.Tables[1].Rows[0]["FatherAge"].ToString();


                }
                if (dtEmp.Tables[2].Rows.Count > 0)
                {
                    lblsschoolname.Text = dtEmp.Tables[2].Rows[0]["SSCName"].ToString();
                    lblsschoolpercentage.Text = dtEmp.Tables[2].Rows[0]["SSCPercentage"].ToString();
                    lblscollegename.Text = dtEmp.Tables[2].Rows[0]["HSCName"].ToString();
                    lblscollegepercentage.Text = dtEmp.Tables[2].Rows[0]["HSCPercentage"].ToString();
                    lblsdiplomacollege.Text = dtEmp.Tables[2].Rows[0]["DiplomaCollegeName"].ToString();
                    lblsdiplomapercentage.Text = dtEmp.Tables[2].Rows[0]["DiplomaPercentage"].ToString();
                    lblsdiplomagrade.Text = dtEmp.Tables[2].Rows[0]["DiplomaGrade"].ToString();
                    lblsgraduationcollege.Text = dtEmp.Tables[2].Rows[0]["UGCollegeName"].ToString();
                    lblsgraduationpercentage.Text = dtEmp.Tables[2].Rows[0]["UGPercentage"].ToString();
                    lblsgraduationgrade.Text = dtEmp.Tables[2].Rows[0]["UGGrade"].ToString();
                    lblspostgraduationcollege.Text = dtEmp.Tables[2].Rows[0]["PGCollegeName"].ToString();
                    lblspostgraduationpercentage.Text = dtEmp.Tables[2].Rows[0]["PGPercentge"].ToString();
                    lblspggrade.Text = dtEmp.Tables[2].Rows[0]["PGGrade"].ToString();
                }

                if (dtEmp.Tables[3].Rows.Count > 0) //Professional Details 
                {
                   
                    lblsappoinment.Text = Convert.ToDateTime(dtEmp.Tables[3].Rows[0]["DateOfAppoinment"]).ToString("yyyy-MM-dd");
                    lblsrecruitment.Text = dtEmp.Tables[3].Rows[0]["ModeOfRecruitment"].ToString();
                    lblsdesignation.Text = dtEmp.Tables[3].Rows[0]["Designation"].ToString();
                    lblsemptype.Text = dtEmp.Tables[3].Rows[0]["EmployeeType"].ToString();
                }
                if (dtEmp.Tables[4].Rows.Count > 0) //prevComp
                {
                    lblsprecompany.Text = dtEmp.Tables[4].Rows[0]["PrevCompanyName"].ToString();
                    lblsprevdesignation.Text = dtEmp.Tables[4].Rows[0]["PrevDesignation"].ToString();
                    lblsdoj.Text = dtEmp.Tables[4].Rows[0]["DateOfJoining"].ToString();
                    lblsdol.Text = dtEmp.Tables[4].Rows[0]["DateOfLeaving"].ToString();
                    lblsservicemonth.Text = dtEmp.Tables[4].Rows[0]["TotalServiceMonths"].ToString();
                }

                if (dtEmp.Tables[5].Rows.Count > 0)
                {
                    //Insurance Details
                    lblsinsurancetype.Text = dtEmp.Tables[5].Rows[0]["InsuranceType"].ToString();
                    lblsinsurancecompany.Text = dtEmp.Tables[5].Rows[0]["InsuranceCompany"].ToString();
                    lblsinsurancestartdate.Text = dtEmp.Tables[5].Rows[0]["InsuranceStartDate"].ToString();
                    lblsinsuranceduedate.Text = dtEmp.Tables[5].Rows[0]["InsuranceDueDate"].ToString();
                }

                if (dtEmp.Tables[6].Rows.Count > 0) //Loan
                {
                    lblsloantype.Text = dtEmp.Tables[6].Rows[0]["LoanType"].ToString();
                    lblsloanaccno.Text = dtEmp.Tables[6].Rows[0]["LoanAccountNo"].ToString();
                    lblssantionamount.Text = dtEmp.Tables[6].Rows[0]["SanctionAmount"].ToString();
                    lblssantiondate.Text = dtEmp.Tables[6].Rows[0]["SanctionDate"].ToString();
                    lblsreturndate.Text = dtEmp.Tables[6].Rows[0]["ReturnDate"].ToString();
                }
                if(dtEmp.Tables[7].Rows.Count > 0) //Doc
                {
                    lblsadhar.Text = dtEmp.Tables[7].Rows[0]["AdharNo"].ToString();
                    sadhar.HRef = lblsadhar.Text;
                    lblsPanCardImage.Text = dtEmp.Tables[7].Rows[0]["PanNo"].ToString();
                    sPanCardImage.HRef = lblsadhar.Text;
                    lblsFitnessCertificate.Text = dtEmp.Tables[7].Rows[0]["MedicalFitnessCertificate"].ToString();
                    sFitnessCertificate.HRef = lblsadhar.Text;
                    lblsDomicile.Text = dtEmp.Tables[7].Rows[0]["DomicileCertificate"].ToString();
                    sDomicile.HRef = lblsadhar.Text;
                    lblsPreviousOfferLetter.Text = dtEmp.Tables[7].Rows[0]["PreviousOfferLetter"].ToString();
                    sPreviousOfferLetter.HRef = lblsadhar.Text;
                    lblsExperienceLetter.Text = dtEmp.Tables[7].Rows[0]["experienceLetter"].ToString();
                    sExperienceLetter.HRef = lblsadhar.Text;
                    lblsSalarySlip.Text = dtEmp.Tables[7].Rows[0]["SalarySlip"].ToString();
                    sSalarySlip.HRef = lblsadhar.Text;
                    lblsVoterID.Text = dtEmp.Tables[7].Rows[0]["VoterId"].ToString();
                    sVoterID.HRef = lblsadhar.Text;
                }
            }

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddEmp.aspx?EmployeeID=" +  Convert.ToInt32(ddlShowEmp.SelectedValue) );
        }

        protected void btn_Audio_Click(object sender, EventArgs e)
        {
            if (flupvoiceClip.HasFile)
            {
                string path = Path.GetFileName(flupvoiceClip.FileName);
                path = path.Replace(" ", "");
                flupvoiceClip.SaveAs((Server.MapPath("~/Image/") + path));
                string link = "Image/" + path;
                //SoundPlayer x = new SoundPlayer();
                //x.SoundLocation = "G:/GitRepository/sms123/SMS123/VoiceUpload/file_example_MP3_700KB.mp3";
                ////x.Play();
                //x.PlaySync(); 

                link = "<audio controls><Source src=" + link + " type=audio/mp3></audio>";
                ltrVoice.Text = link;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please Select Audio File')", true);
            }
        }
    }
}