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
using System.IO;

namespace EmployeeMaster
{
    public partial class AddEmp : System.Web.UI.Page
    {
        EmployeeBAL objBAL = new EmployeeBAL();
        EmployeeMasterBO objBO = new EmployeeMasterBO();
        string EmployeeID=null;
        protected void Page_Load(object sender, EventArgs e)
        {
            EmployeeID = Request.QueryString["EmployeeID"];
            if (!IsPostBack)
            {
                BindddlCountry();
                if (EmployeeID != null)
                {
                    editEmployee(EmployeeID);
                }
            }     
        }

        //protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        //{
        //    int index = Int32.Parse(e.Item.Value);
        //    MultiView1.ActiveViewIndex = index;
        //}

        protected void NextTab_Click(object sender, EventArgs e)
        {
            // if (MultiView1.ActiveViewIndex < 7)
            // {
            //     int index = Int32.Parse(MultiView1.ActiveViewIndex.ToString());
            //     MultiView1.ActiveViewIndex = index + 1;
            //     Menu1.Items[index + 1].Selected = true;
            //}
          
            if (NextTab.Text == "Submit")
            {
                

            }
            //if (MultiView1.ActiveViewIndex == 7)
            //{
            //    NextTab.Text = "Submit";
            //}
            //else
            //{
            //    NextTab.Text = "Next";
            //}
        }

        protected void btnPrevTab_Click(object sender, EventArgs e)
        {
            //if (MultiView1.ActiveViewIndex > 0)
            //{
            //    int index = Int32.Parse(MultiView1.ActiveViewIndex.ToString());
            //    MultiView1.ActiveViewIndex = index - 1;
            //    Menu1.Items[index - 1].Selected = true;
            //}
            //if (MultiView1.ActiveViewIndex == 7)
            //{
            //    NextTab.Text = "Submit";
            //}
            //else
            //{
            //    NextTab.Text = "Next";
            //}
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {

        }

        protected void BindddlCountry()
        {
            objBO.mode = 2;

            DataSet dtEmp = objBAL.FetchAll(objBO);
            if (dtEmp.Tables.Count > 0)
            {
                if (dtEmp.Tables[0].Rows.Count > 0)
                {

                    ddlCountry.DataSource = dtEmp.Tables[0];
                    ddlCountry.DataTextField = "Country_Name";
                    ddlCountry.DataValueField = "CountryID";
                    ddlCountry.DataBind();
                    //ddlCountry.Items.Insert(0, new ListItem("Select", "0"));

                }
                if (dtEmp.Tables[1].Rows.Count > 0)
                {
                    ddlState.DataSource = dtEmp.Tables[1];
                    ddlState.DataTextField = "State_Name";
                    ddlState.DataValueField = "stateID";
                    ddlState.DataBind();
                    ddlState.Items.Insert(0, new ListItem("Select", "0"));
                }
            }
        }

        public void BindState(int Mode)
        {
            objBO.mode = 2;

            DataTable dtEmp = objBAL.FetchData(objBO);
            if (dtEmp.Rows.Count > 0)
            {
                ddlState.DataSource = dtEmp;
                ddlState.DataTextField = "State_Name";
                ddlState.DataValueField = "stateID";
                ddlState.DataBind();
                ddlState.Items.Insert(0, new ListItem("Select", "0"));
            }
        }

        public void BindDistrict(int Mode, int stateID)
        {
            objBO.mode = Mode;
            objBO.pk_stateID = Convert.ToInt32(stateID);

            DataTable dtEmp = objBAL.FetchData(objBO);
            if (dtEmp.Rows.Count > 0)
            {
                ddlDistrict.DataSource = dtEmp;
                ddlDistrict.DataTextField = "District_Name";
                ddlDistrict.DataValueField = "districtID";
                ddlDistrict.DataBind();
                ddlDistrict.Items.Insert(0, new ListItem("Select", "0"));
            }

        }
        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindState(2);
        }

        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindDistrict(4, Convert.ToInt32(ddlState.SelectedValue));
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            objBO.FirstName = txtFname.Text;
            objBO.MiddleName = txtMname.Text;
            objBO.LastName = txtLname.Text;
            objBO.DOB = Convert.ToDateTime(txtDob.Text);
            objBO.IdentityMark = txtIdentityM.Text;
            objBO.Email = txtEmail.Text;
            objBO.BloodGroup = ddlBloodGroup.SelectedValue;
            objBO.Gender = Convert.ToInt32(rblGender.SelectedValue);
            objBO.MarriedStatus = Convert.ToInt32(rblMarritialStatus.SelectedValue);
            objBO.fk_CountryId = Convert.ToInt32(ddlCountry.SelectedValue);
            objBO.fk_State = Convert.ToInt32(ddlState.SelectedValue);
            objBO.fk_DistrictId = Convert.ToInt32(ddlDistrict.SelectedValue);
            objBO.AddharNo = Convert.ToInt64(txtAddhar.Text);
            objBO.MobileNo = Convert.ToInt64(txtMobile.Text);
            objBO.EmpCode = txtEmpCode.Text;
            objBO.CAddress = txtcAddress.Text;
            objBO.PAddress = txtpAddress.Text;
            if (FileUpload1.HasFile)
            {
                string path = Path.GetFileName(FileUpload1.FileName);
                //string filename = Path.GetFileName(uploadImage.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("~/Assets/Image/" + path));

                objBO.photo = "~/Assets/Image/" + path;
                hdfdPhoto.Value = "~/Assets/Image/" + path;
            }
            else
            {
                if (hdfdPhoto.Value != "")
                {
                    objBO.photo = hdfdPhoto.Value;
                }
            }

            //family

            objBO.SpouseName = txtSpouseName.Text;
            objBO.SpouseAge = Convert.ToInt32(txtSpouseAge.Text);
            objBO.MotherName = txtMotherName.Text;
            objBO.MotherAge = Convert.ToInt32(txtMotherAge.Text);
            objBO.FatherName = txtfatherName.Text;
            objBO.FatherAge = Convert.ToInt32(txtfatherAge.Text);

            //education

            objBO.SSCName = txtSchoolName.Text;
            objBO.SSCPercentage = float.Parse(txtSchoolPercentage.Text);
            objBO.HSCName = txtCollegeName.Text;
            objBO.HSCPercentage = float.Parse(txtCollegePercentage.Text);
            objBO.DiplomaCollegeName = txtDiplomaCollege.Text;
            objBO.DiplomaPercentage = float.Parse(txtDiplomaPercentage.Text);
            objBO.DiplomaGrade = ddlDiplomaGrade.SelectedValue;
            objBO.UGCollegeName = txtGraduationCollege.Text;
            objBO.UGPercentage = float.Parse(txtGraduationPercentage.Text);
            objBO.UGGrade = ddlGraduationGrade.SelectedValue;
            objBO.PGCollegeName = txtPostGraduationCollege.Text;
            objBO.PGPercentge = float.Parse(txtPostGraduationPercentage.Text);
            objBO.PGGrade = ddlPGGrade.SelectedValue;

            //professional

            objBO.DateOfAppoinment = Convert.ToDateTime(txtAppoinment.Text);
            objBO.ModeOfRecruitment = ddlRecruitment.SelectedValue;
            objBO.Designation = ddlDesignation.SelectedValue;
            objBO.EmployeeType = ddlEmpType.SelectedValue;

            //prevCompany

            objBO.PrevCompanyName = txtPreCompany.Text;
            objBO.PrevDesignation = ddlPrevDesignation.SelectedValue;
            objBO.DateOfJoining = Convert.ToDateTime(txtDoj.Text);
            objBO.DateOfLeaving = Convert.ToDateTime(txtDol.Text);
            objBO.TotalServiceMonths = Convert.ToInt32(txtServiceMonth.Text);

            //Insurance

            objBO.InsuranceType = ddlInsuranceType.SelectedValue;
            objBO.InsuranceCompany = txtInsuranceCompany.Text;
            objBO.InsuranceStartDate = Convert.ToDateTime(txtInsuranceStartDate.Text);
            objBO.InsuranceDueDate = Convert.ToDateTime(txtInsuranceDueDate.Text);

            //loan

            objBO.LoanType = ddlLoanType.SelectedValue;
            objBO.LoanAccountNo = Convert.ToInt32(txtLoanAccNo.Text);
            objBO.SanctionAmount = Convert.ToInt64(txtSantionAmount.Text);
            objBO.SanctionDate = Convert.ToDateTime(txtSantionDate.Text);
            objBO.ReturnDate = Convert.ToDateTime(txtReturnDate.Text);

            //documents

            if (AdharCardImage.HasFile)
            {
                string path = Path.GetFileName(AdharCardImage.FileName);
                AdharCardImage.SaveAs(Server.MapPath("~/Assets/Image/" + path));

                objBO.AdharNo = "~/Assets/Image/" + path;
                hdfdAdharNo.Value = "~/Assets/Image/" + path;
            }
            else
            {
                if (hdfdAdharNo.Value != "")
                {
                    objBO.AdharNo = hdfdAdharNo.Value;
                }
            }

            if (PanCardImage.HasFile)
            {
                string path = Path.GetFileName(PanCardImage.FileName);
                PanCardImage.SaveAs(Server.MapPath("~/Assets/Image/" + path));

                objBO.PanNo = "~/Assets/Image/" + path;
                hdfdPanNo.Value = "~/Assets/Image/" + path;
            }
            else
            {
                if (hdfdPanNo.Value != "")
                {
                    objBO.PanNo = hdfdPanNo.Value;
                }
            }

            if (FitnessCertificate.HasFile)
            {
                string path = Path.GetFileName(FitnessCertificate.FileName);
                FitnessCertificate.SaveAs(Server.MapPath("~/Assets/Image/" + path));

                objBO.MedicalFitnessCertificate = "~/Assets/Image/" + path;
                hdfdMedicalFitnessNo.Value = "~/Assets/Image/" + path;
            }
            else
            {
                if (hdfdMedicalFitnessNo.Value != "")
                {
                    objBO.MedicalFitnessCertificate = hdfdMedicalFitnessNo.Value;
                }
            }

            if (Domicile.HasFile)
            {
                string path = Path.GetFileName(Domicile.FileName);
                Domicile.SaveAs(Server.MapPath("~/Assets/Image/" + path));

                objBO.DomicileCertificate = "~/Assets/Image/" + path;
                hdfdDomicileNo.Value = "~/Assets/Image/" + path;
            }
            else
            {
                if (hdfdDomicileNo.Value != "")
                {
                    objBO.DomicileCertificate = hdfdDomicileNo.Value;
                }
            }

            if (ExperienceLetter.HasFile)
            {
                string path = Path.GetFileName(ExperienceLetter.FileName);
                ExperienceLetter.SaveAs(Server.MapPath("~/Assets/Image/" + path));

                objBO.experienceLetter = "~/Assets/Image/" + path;
                hdfdExperienceNo.Value = "~/Assets/Image/" + path;
            }
            else
            {
                if (hdfdExperienceNo.Value != "")
                {
                    objBO.experienceLetter = hdfdExperienceNo.Value;
                }
            }

            if (PreviousOfferLetter.HasFile)
            {
                string path = Path.GetFileName(PreviousOfferLetter.FileName);
                PreviousOfferLetter.SaveAs(Server.MapPath("~/Assets/Image/" + path));

                objBO.PreviousOfferLetter = "~/Assets/Image/" + path;
                hdfdPrevOfferNo.Value = "~/Assets/Image/" + path;
            }
            else
            {
                if (hdfdPrevOfferNo.Value != "")
                {
                    objBO.PreviousOfferLetter = hdfdPrevOfferNo.Value;
                }
            }

            if (SalarySlip.HasFile)
            {
                string path = Path.GetFileName(SalarySlip.FileName);
                SalarySlip.SaveAs(Server.MapPath("~/Assets/Image/" + path));

                objBO.SalarySlip = "~/Assets/Image/" + path;
                hdfdSalaryNo.Value = "~/Assets/Image/" + path;
            }
            else
            {
                if (hdfdSalaryNo.Value != "")
                {
                    objBO.SalarySlip = hdfdSalaryNo.Value;
                }
            }

            if (VoterID.HasFile)
            {
                string path = Path.GetFileName(VoterID.FileName);
                VoterID.SaveAs(Server.MapPath("~/Assets/Image/" + path));

                objBO.VoterId = "~/Assets/Image/" + path;
                hdfdVoterID.Value = "~/Assets/Image/" + path;
            }
            else
            {
                if (hdfdVoterID.Value != "")
                {
                    objBO.VoterId = hdfdVoterID.Value;
                }
            }

            if (btnSubmit.Text == "Submit")
            {
                objBO.mode = 1;

                //personal info
               
                int result = objBAL.OpData(objBO);
                if (result > 0)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('records inserted successfully!!!');", true);
                }
            }
            if (btnSubmit.Text == "Update")
            {
                
                //Submit(7);

                objBO.mode = 7;

              

                objBO.pk_personalinfoId =Convert.ToInt32(EmployeeID);
                objBO.fk_personalinfoId = Convert.ToInt32(EmployeeID);
                int result = objBAL.OpData(objBO);
                if (result > 0)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('records updated successfully!!!');", true);
                }
            }
        }
        public void editEmployee(string s)
        {
            btnSubmit.Text = "Update"; 
            objBO.pk_personalinfoId = Convert.ToInt32(s);
            objBO.fk_personalinfoId = Convert.ToInt32(s);
            objBO.mode = 8;
            DataSet dtEmp = objBAL.FetchAll(objBO);

            if (dtEmp.Tables.Count > 0)
            {
                if (dtEmp.Tables[0].Rows.Count > 0)
                {
                    //string s = " " + dtEmp.Tables[0].Rows[0]["FirstName"].ToString() + " " + dtEmp.Tables[0].Rows[0]["MiddleName"].ToString() + " " + dtEmp.Tables[0].Rows[0]["LastName"].ToString();
                    //lblfirstname.Text = s;

                    txtFname.Text = dtEmp.Tables[0].Rows[0]["FirstName"].ToString();
                    txtDob.Text= Convert.ToDateTime(dtEmp.Tables[0].Rows[0]["DOB"]).ToString("yyyy-MM-dd");
                    txtMname.Text = dtEmp.Tables[0].Rows[0]["MiddleName"].ToString();

                    txtIdentityM.Text=dtEmp.Tables[0].Rows[0]["IdentityMark"].ToString();
                    txtLname.Text = dtEmp.Tables[0].Rows[0]["LastName"].ToString();
                    txtEmail.Text= dtEmp.Tables[0].Rows[0]["Email"].ToString();
                    ddlBloodGroup.SelectedValue = dtEmp.Tables[0].Rows[0]["BloodGroup"].ToString();
                    rblGender.SelectedValue = dtEmp.Tables[0].Rows[0]["Gender"].ToString();
                    rblMarritialStatus.SelectedValue = dtEmp.Tables[0].Rows[0]["MarriedStatus"].ToString();
                    ddlCountry.SelectedValue = dtEmp.Tables[0].Rows[0]["fk_CountryId"].ToString();
                    ddlState.SelectedValue = dtEmp.Tables[0].Rows[0]["fk_State"].ToString();
                    BindDistrict(4,Convert.ToInt32(ddlState.SelectedValue));
                    ddlDistrict.SelectedValue = dtEmp.Tables[0].Rows[0]["fk_DistrictId"].ToString();
                    txtAddhar.Text = dtEmp.Tables[0].Rows[0]["AddharNo"].ToString();
                    txtMobile.Text = dtEmp.Tables[0].Rows[0]["MobileNo"].ToString();
                    txtEmpCode.Text= dtEmp.Tables[0].Rows[0]["EmpCode"].ToString();
                    txtcAddress.Text = dtEmp.Tables[0].Rows[0]["CAddress"].ToString();
                    txtpAddress.Text = dtEmp.Tables[0].Rows[0]["PAddress"].ToString();
                    imgEmp.ImageUrl = dtEmp.Tables[0].Rows[0]["Photo"].ToString();
                }

                if (dtEmp.Tables[1].Rows.Count > 0)
                {
                    txtSpouseName.Text = dtEmp.Tables[1].Rows[0]["SpouseName"].ToString();
                    txtSpouseAge.Text = dtEmp.Tables[1].Rows[0]["SpouseAge"].ToString();
                    txtMotherName.Text = dtEmp.Tables[1].Rows[0]["MotherName"].ToString();
                    txtMotherAge.Text = dtEmp.Tables[1].Rows[0]["MotherAge"].ToString();
                    txtfatherName.Text = dtEmp.Tables[1].Rows[0]["FatherName"].ToString();
                    txtfatherAge.Text = dtEmp.Tables[1].Rows[0]["FatherAge"].ToString();
                }

                if (dtEmp.Tables[2].Rows.Count > 0)
                {
                    txtSchoolName.Text = dtEmp.Tables[2].Rows[0]["SSCName"].ToString();
                    txtSchoolPercentage.Text = dtEmp.Tables[2].Rows[0]["SSCPercentage"].ToString();
                    txtCollegeName.Text = dtEmp.Tables[2].Rows[0]["HSCName"].ToString();
                    txtCollegePercentage.Text = dtEmp.Tables[2].Rows[0]["HSCPercentage"].ToString();
                    txtDiplomaCollege.Text = dtEmp.Tables[2].Rows[0]["DiplomaCollegeName"].ToString();
                    txtDiplomaPercentage.Text = dtEmp.Tables[2].Rows[0]["DiplomaPercentage"].ToString();
                    ddlDiplomaGrade.SelectedValue = dtEmp.Tables[2].Rows[0]["DiplomaGrade"].ToString();
                    txtGraduationCollege.Text = dtEmp.Tables[2].Rows[0]["UGCollegeName"].ToString();
                    txtGraduationPercentage.Text = dtEmp.Tables[2].Rows[0]["UGPercentage"].ToString();
                    ddlGraduationGrade.SelectedValue = dtEmp.Tables[2].Rows[0]["UGGrade"].ToString();
                    txtPostGraduationCollege.Text = dtEmp.Tables[2].Rows[0]["PGCollegeName"].ToString();
                    txtPostGraduationPercentage.Text = dtEmp.Tables[2].Rows[0]["PGPercentge"].ToString();
                    ddlPGGrade.SelectedValue = dtEmp.Tables[2].Rows[0]["PGGrade"].ToString();
                }

                if (dtEmp.Tables[3].Rows.Count > 0) //Professional Details 
                {

                    txtAppoinment.Text = Convert.ToDateTime(dtEmp.Tables[3].Rows[0]["DateOfAppoinment"]).ToString("yyyy-MM-dd");
                    ddlRecruitment.SelectedValue = dtEmp.Tables[3].Rows[0]["ModeOfRecruitment"].ToString();
                    ddlDesignation.SelectedValue = dtEmp.Tables[3].Rows[0]["Designation"].ToString();
                    ddlEmpType.SelectedValue = dtEmp.Tables[3].Rows[0]["EmployeeType"].ToString();
                }
                if (dtEmp.Tables[4].Rows.Count > 0) //prevComp
                {
                    txtPreCompany.Text = dtEmp.Tables[4].Rows[0]["PrevCompanyName"].ToString();
                    ddlPrevDesignation.SelectedValue = dtEmp.Tables[4].Rows[0]["PrevDesignation"].ToString();
                    txtDoj.Text =Convert.ToDateTime(dtEmp.Tables[4].Rows[0]["DateOfJoining"]).ToString("yyyy-MM-dd");
                    txtDol.Text =Convert.ToDateTime(dtEmp.Tables[4].Rows[0]["DateOfLeaving"]).ToString("yyyy-MM-dd");
                    txtServiceMonth.Text = dtEmp.Tables[4].Rows[0]["TotalServiceMonths"].ToString();
                }
                if (dtEmp.Tables[5].Rows.Count > 0)
                {
                    //Insurance Details
                    ddlInsuranceType.SelectedValue = dtEmp.Tables[5].Rows[0]["InsuranceType"].ToString();
                    txtInsuranceCompany.Text = dtEmp.Tables[5].Rows[0]["InsuranceCompany"].ToString();
                    txtInsuranceStartDate.Text =Convert.ToDateTime( dtEmp.Tables[5].Rows[0]["InsuranceStartDate"]).ToString("yyyy-MM-dd");
                    txtInsuranceDueDate.Text =Convert.ToDateTime( dtEmp.Tables[5].Rows[0]["InsuranceDueDate"]).ToString("yyyy-MM-dd");
                }

                if (dtEmp.Tables[6].Rows.Count > 0) //Loan
                {
                    ddlLoanType.SelectedValue = dtEmp.Tables[6].Rows[0]["LoanType"].ToString();
                    txtLoanAccNo.Text = dtEmp.Tables[6].Rows[0]["LoanAccountNo"].ToString();
                    txtSantionAmount.Text = dtEmp.Tables[6].Rows[0]["SanctionAmount"].ToString();
                    txtSantionDate.Text =Convert.ToDateTime(dtEmp.Tables[6].Rows[0]["SanctionDate"]).ToString("yyyy-MM-dd");
                    txtReturnDate.Text =Convert.ToDateTime(dtEmp.Tables[6].Rows[0]["ReturnDate"]).ToString("yyyy-MM-dd");
                }

                if (dtEmp.Tables[7].Rows.Count > 0) //Doc
                {

                    sadhar.HRef = dtEmp.Tables[7].Rows[0]["AdharNo"].ToString();
                    sPanCardImage.HRef = dtEmp.Tables[7].Rows[0]["PanNo"].ToString();
                    sFitnessCertificate.HRef= dtEmp.Tables[7].Rows[0]["MedicalFitnessCertificate"].ToString();
                    sDomicile.HRef = dtEmp.Tables[7].Rows[0]["DomicileCertificate"].ToString();
                    sPreviousOfferLetter.HRef = dtEmp.Tables[7].Rows[0]["PreviousOfferLetter"].ToString();
                    sExperienceLetter.HRef = dtEmp.Tables[7].Rows[0]["experienceLetter"].ToString();
                    sSalarySlip.HRef = dtEmp.Tables[7].Rows[0]["SalarySlip"].ToString();
                    sVoterID.HRef = dtEmp.Tables[7].Rows[0]["VoterId"].ToString();
                }

            }
        }

        public void Submit(int mode)
        {
            objBO.mode = mode;

            //personal info
            objBO.FirstName = txtFname.Text;
            objBO.MiddleName = txtMname.Text;
            objBO.LastName = txtLname.Text;
           // objBO.DOB = Convert.ToDateTime(txtDob.Text);
            objBO.IdentityMark = txtIdentityM.Text;
            objBO.Email = txtEmail.Text;
            objBO.BloodGroup = ddlBloodGroup.SelectedValue;
            objBO.Gender = Convert.ToInt32(rblGender.SelectedValue);
            objBO.MarriedStatus = Convert.ToInt32(rblMarritialStatus.SelectedValue);
            objBO.fk_CountryId = Convert.ToInt32(ddlCountry.SelectedValue);
            objBO.fk_State = Convert.ToInt32(ddlState.SelectedValue);
            objBO.fk_DistrictId = Convert.ToInt32(ddlDistrict.SelectedValue);
            objBO.AddharNo = Convert.ToInt64(txtAddhar.Text);
            objBO.MobileNo = Convert.ToInt64(txtMobile.Text);
            objBO.EmpCode = txtEmpCode.Text;
            objBO.CAddress = txtcAddress.Text;
            objBO.PAddress = txtpAddress.Text;
            if (FileUpload1.HasFile)
            {
                string path = Path.GetFileName(FileUpload1.FileName);
                //string filename = Path.GetFileName(uploadImage.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("~/Assets/Image/" + path));

                objBO.photo = "~/Assets/Image/" + path;
                hdfdPhoto.Value = "~/Assets/Image/" + path;
            }
            else
            {
                if (hdfdPhoto.Value != "")
                {
                    objBO.photo = hdfdPhoto.Value;
                }
            }

            //family

            objBO.SpouseName = txtSpouseName.Text;
            objBO.SpouseAge = Convert.ToInt32(txtSpouseAge.Text);
            objBO.MotherName = txtMotherName.Text;
            objBO.MotherAge = Convert.ToInt32(txtMotherAge.Text);
            objBO.FatherName = txtfatherName.Text;
            objBO.FatherAge = Convert.ToInt32(txtfatherAge.Text);

            //education

            objBO.SSCName = txtSchoolName.Text;
            objBO.SSCPercentage = float.Parse(txtSchoolPercentage.Text);
            objBO.HSCName = txtCollegeName.Text;
            objBO.HSCPercentage = float.Parse(txtCollegePercentage.Text);
            objBO.DiplomaCollegeName = txtDiplomaCollege.Text;
            objBO.DiplomaPercentage = float.Parse(txtDiplomaPercentage.Text);
            objBO.DiplomaGrade = ddlDiplomaGrade.SelectedValue;
            objBO.UGCollegeName = txtGraduationCollege.Text;
            objBO.UGPercentage = float.Parse(txtGraduationPercentage.Text);
            objBO.UGGrade = ddlGraduationGrade.SelectedValue;
            objBO.PGCollegeName = txtPostGraduationCollege.Text;
            objBO.PGPercentge = float.Parse(txtPostGraduationPercentage.Text);
            objBO.PGGrade = ddlPGGrade.SelectedValue;

            //professional

            objBO.DateOfAppoinment = Convert.ToDateTime(txtAppoinment.Text);
            objBO.ModeOfRecruitment = ddlRecruitment.SelectedValue;
            objBO.Designation = ddlDesignation.SelectedValue;
            objBO.EmployeeType = ddlEmpType.SelectedValue;

            //prevCompany

            objBO.PrevCompanyName = txtPreCompany.Text;
            objBO.PrevDesignation = ddlPrevDesignation.SelectedValue;
            objBO.DateOfJoining = Convert.ToDateTime(txtDoj.Text);
            objBO.DateOfLeaving = Convert.ToDateTime(txtDol.Text);
            objBO.TotalServiceMonths = Convert.ToInt32(txtServiceMonth.Text);

            //Insurance

            objBO.InsuranceType = ddlInsuranceType.SelectedValue;
            objBO.InsuranceCompany = txtInsuranceCompany.Text;
            objBO.InsuranceStartDate = Convert.ToDateTime(txtInsuranceStartDate.Text);
            objBO.InsuranceDueDate = Convert.ToDateTime(txtInsuranceDueDate.Text);

            //loan

            objBO.LoanType = ddlLoanType.SelectedValue;
            objBO.LoanAccountNo = Convert.ToInt32(txtLoanAccNo.Text);
            objBO.SanctionAmount = Convert.ToInt64(txtSantionAmount.Text);
            objBO.SanctionDate = Convert.ToDateTime(txtSantionDate.Text);
            objBO.ReturnDate = Convert.ToDateTime(txtReturnDate.Text);

            //documents

            if (AdharCardImage.HasFile)
            {
                string path = Path.GetFileName(AdharCardImage.FileName);
                AdharCardImage.SaveAs(Server.MapPath("~/Assets/Image/" + path));

                objBO.AdharNo = "~/Assets/Image/" + path;
                hdfdAdharNo.Value = "~/Assets/Image/" + path;
            }
            else
            {
                if (hdfdAdharNo.Value != "")
                {
                    objBO.AdharNo = hdfdAdharNo.Value;
                }
            }

            if (PanCardImage.HasFile)
            {
                string path = Path.GetFileName(PanCardImage.FileName);
                PanCardImage.SaveAs(Server.MapPath("~/Assets/Image/" + path));

                objBO.PanNo = "~/Assets/Image/" + path;
                hdfdPanNo.Value = "~/Assets/Image/" + path;
            }
            else
            {
                if (hdfdPanNo.Value != "")
                {
                    objBO.PanNo = hdfdPanNo.Value;
                }
            }

            if (FitnessCertificate.HasFile)
            {
                string path = Path.GetFileName(FitnessCertificate.FileName);
                FitnessCertificate.SaveAs(Server.MapPath("~/Assets/Image/" + path));

                objBO.MedicalFitnessCertificate = "~/Assets/Image/" + path;
                hdfdMedicalFitnessNo.Value = "~/Assets/Image/" + path;
            }
            else
            {
                if (hdfdMedicalFitnessNo.Value != "")
                {
                    objBO.MedicalFitnessCertificate = hdfdMedicalFitnessNo.Value;
                }
            }

            if (Domicile.HasFile)
            {
                string path = Path.GetFileName(Domicile.FileName);
                Domicile.SaveAs(Server.MapPath("~/Assets/Image/" + path));

                objBO.DomicileCertificate = "~/Assets/Image/" + path;
                hdfdDomicileNo.Value = "~/Assets/Image/" + path;
            }
            else
            {
                if (hdfdDomicileNo.Value != "")
                {
                    objBO.DomicileCertificate = hdfdDomicileNo.Value;
                }
            }

            if (ExperienceLetter.HasFile)
            {
                string path = Path.GetFileName(ExperienceLetter.FileName);
                ExperienceLetter.SaveAs(Server.MapPath("~/Assets/Image/" + path));

                objBO.experienceLetter = "~/Assets/Image/" + path;
                hdfdExperienceNo.Value = "~/Assets/Image/" + path;
            }
            else
            {
                if (hdfdExperienceNo.Value != "")
                {
                    objBO.experienceLetter = hdfdExperienceNo.Value;
                }
            }

            if (PreviousOfferLetter.HasFile)
            {
                string path = Path.GetFileName(PreviousOfferLetter.FileName);
                PreviousOfferLetter.SaveAs(Server.MapPath("~/Assets/Image/" + path));

                objBO.PreviousOfferLetter = "~/Assets/Image/" + path;
                hdfdPrevOfferNo.Value = "~/Assets/Image/" + path;
            }
            else
            {
                if (hdfdPrevOfferNo.Value != "")
                {
                    objBO.PreviousOfferLetter = hdfdPrevOfferNo.Value;
                }
            }

            if (SalarySlip.HasFile)
            {
                string path = Path.GetFileName(SalarySlip.FileName);
                SalarySlip.SaveAs(Server.MapPath("~/Assets/Image/" + path));

                objBO.SalarySlip = "~/Assets/Image/" + path;
                hdfdSalaryNo.Value = "~/Assets/Image/" + path;
            }
            else
            {
                if (hdfdSalaryNo.Value != "")
                {
                    objBO.SalarySlip = hdfdSalaryNo.Value;
                }
            }

            if (VoterID.HasFile)
            {
                string path = Path.GetFileName(VoterID.FileName);
                VoterID.SaveAs(Server.MapPath("~/Assets/Image/" + path));

                objBO.VoterId = "~/Assets/Image/" + path;
                hdfdVoterID.Value = "~/Assets/Image/" + path;
            }
            else
            {
                if (hdfdVoterID.Value != "")
                {
                    objBO.VoterId = hdfdVoterID.Value;
                }
            }

           
        }
    }
}