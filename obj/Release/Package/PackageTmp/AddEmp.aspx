<%@ Page Title="" Language="C#" MasterPageFile="~/EmpMaster.Master" AutoEventWireup="true" CodeBehind="AddEmp.aspx.cs" Inherits="EmployeeMaster.AddEmp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="plugins/datatables/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="plugins/datatables/DT_bootstrap.js"></script>
    <script type="text/javascript" src="plugins/datatables/responsive/datatables.responsive.js"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.min.js"></script>

    <script>
       ('.btnNext').click(function(){
       $('.nav-tabs > .active').next('li').find('a').trigger('click');
       });

       $('.btnPrevious').click(function(){
       $('.nav-tabs > .active').prev('li').find('a').trigger('click');
                });
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h4 style="padding: 10px 10px 10px 10px">Employee Information</h4>

    <div id="tabs" role="tabpanel">
    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist">
        <li><a href="#personal" aria-controls="personal" role="tab" data-toggle="tab">Personal</a></li>
        <li><a href="#family" aria-controls="Family" role="tab" data-toggle="tab">Family</a></li>
        <li><a href="#education" aria-controls="Education" role="tab" data-toggle="tab">Education</a></li>
        <li><a href="#Professional" aria-controls="Professional" role="tab" data-toggle="tab">Professional</a></li>
        <li><a href="#PreviousCompany" aria-controls="Previous Company" role="tab" data-toggle="tab">Previous Company</a></li>
        <li><a href="#insurance" aria-controls="Insurance" role="tab" data-toggle="tab">Insurance</a></li>
        <li><a href="#loan" aria-controls="Loan" role="tab" data-toggle="tab">Loan</a></li>
        <li><a href="#documents" aria-controls="Documents" role="tab" data-toggle="tab">Documents</a></li>
    </ul>    
        </div>
   
        <div class="tab-content" style="padding-top: 20px">
            <div role="tabpanel" class="tab-pane active" id="personal">
                <div class="container" runat="server" id="PersonalDetails" style="padding-left:25px">

                    <div class="panel panel-info">
                        <div class="panel-heading"><b>Personal Details</b></div>
                        <div class="panel-body">
                            <div class="row" style="padding-top: 10px">
                                <div class="col-lg-4">
                                    <asp:Label ID="lblFName" runat="server" Text="First Name"></asp:Label><span class="required" style="color: red">*</span>
                                    <asp:TextBox ID="txtFname" runat="server" placeholder="Enter First Name" CssClass="form-control" TabIndex="1"></asp:TextBox>
                                </div>
                                <div class="col-lg-4">
                                    <asp:Label ID="lblMName" runat="server" Text="Middle Name"></asp:Label><span class="required" style="color: red">*</span>
                                    <asp:TextBox ID="txtMname" runat="server" placeholder="Enter Middle Name" CssClass="form-control" TabIndex="2"></asp:TextBox>
                                </div>
                                <div class="col-lg-4">
                                    <asp:Label ID="lblLName" runat="server" Text="Last Name"></asp:Label><span class="required" style="color: red">*</span>
                                    <asp:TextBox ID="txtLname" runat="server" placeholder="Enter Last Name" CssClass="form-control" TabIndex="3"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row" style="padding-top: 10px">
                                <div class="col-lg-4">
                                    <asp:Label ID="lblDob" runat="server" Text="Date Of Birth"></asp:Label><span class="required" style="color: red">*</span>
                                    <asp:TextBox ID="txtDob" runat="server" CssClass="form-control" TextMode="Date" TabIndex="4"></asp:TextBox>
                                </div>
                                <div class="col-lg-4">
                                    <asp:Label ID="lblIdentityM" runat="server" Text="Identity Mark"></asp:Label>
                                    <asp:TextBox ID="txtIdentityM" runat="server" placeholder="Enter Identity Mark" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-lg-4">
                                    <asp:Label ID="lblEmail" runat="server" Text="EmailID"></asp:Label><span class="required" style="color: red">*</span>
                                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter emailId" CssClass="form-control" TextMode="email" TabIndex="5"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row" style="padding-top: 10px">
                                <div class="col-lg-4">
                                    <asp:Label ID="lblBloodGroup" runat="server" Text="BloodGroup"></asp:Label><span class="required" style="color: red">*</span>
                                    <asp:DropDownList ID="ddlBloodGroup" runat="server" RepeatDirection="Horizontal" CssClass="form-control" TabIndex="6">
                                        <asp:ListItem Text="A+ve" Selected="True" Value="1"></asp:ListItem>
                                         <asp:ListItem Text="A-ve" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="B+ve" Value="3"></asp:ListItem>
                                         <asp:ListItem Text="B-ve" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="O+ve" Value="5"></asp:ListItem>
                                         <asp:ListItem Text="O-ve" Value="6"></asp:ListItem>
                                        <asp:ListItem Text="AB+ve" Value="7"></asp:ListItem>
                                         <asp:ListItem Text="AB-ve" Value="8"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div class="col-lg-4">
                                    <asp:Label ID="lblgender" runat="server" Text="Gender"></asp:Label><span class="required" style="color: red">*</span>
                                    <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal" TabIndex="7" CellSpacing="2" CellPadding="2">
                                        <asp:ListItem Text="Male" Selected="True" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="TransGender" Value="3"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>

                                <div class="col-lg-4">
                                    <asp:Label ID="lblMarritialStatus" runat="server" Text="Marritial Status"></asp:Label><span class="required" style="color: red">*</span>
                                    <asp:RadioButtonList ID="rblMarritialStatus" runat="server" RepeatDirection="Horizontal" TabIndex="8" CellSpacing="2" CellPadding="2">
                                        <asp:ListItem Text="Single" Selected="True" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Married" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Divorced" Value="3"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>

                            <div class="row" style="padding-top: 10px">
                                <div class="col-lg-4">
                                    <asp:Label ID="lblCountry" runat="server" Text="Country"></asp:Label><span class="required" style="color: red">*</span>
                                    <asp:DropDownList ID="ddlCountry" runat="server" AutoPostBack="true" CssClass="form-control" TabIndex="9" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <div class="col-lg-4">
                                    <asp:Label ID="lblState" runat="server" Text="State"></asp:Label><span class="required" style="color: red">*</span>
                                    <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="true" CssClass="form-control" TabIndex="10" OnSelectedIndexChanged="ddlState_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <div class="col-lg-4">
                                    <asp:Label ID="lblDistrict" runat="server" Text="District"></asp:Label><span class="required" style="color: red">*</span>
                                    <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control" TabIndex="11"></asp:DropDownList>
                                </div>
                            </div>

                            <div class="row" style="padding-top: 10px">
                                <div class="col-lg-4">
                                    <asp:Label ID="lblAddhar" runat="server" Text="Addhar Number"></asp:Label><span class="required" style="color: red">*</span>
                                    <asp:TextBox ID="txtAddhar" runat="server" placeholder="Enter Addhar Number" CssClass="form-control" MaxLength="16" TabIndex="12"></asp:TextBox>
                                </div>
                                <div class="col-lg-4">
                                    <asp:Label ID="lblMobile" runat="server" Text="Mobile"></asp:Label><span class="required" style="color: red">*</span>
                                    <asp:TextBox ID="txtMobile" runat="server" placeholder="Enter Mobile Number" CssClass="form-control" TextMode="phone" MaxLength="10" TabIndex="13"></asp:TextBox>
                                </div>
                                  <div class="col-lg-4">
                                    <asp:Label ID="lblEmpCode" runat="server" Text="Employee Code"></asp:Label><span class="required" style="color: red">*</span>
                                    <asp:TextBox ID="txtEmpCode" runat="server" placeholder="Enter Employee code" CssClass="form-control" ></asp:TextBox>
                                </div>

                            </div>

                            <div class="row" style="padding-top: 10px">
                                <div class="col-lg-4">
                                    <asp:Label ID="lblcAddress" runat="server" Text="Currunt Address"></asp:Label><span class="required" style="color: red">*</span><asp:CheckBox ID="cbCadd" runat="server"
                                        AutoPostBack="true" />
                                    <asp:TextBox ID="txtcAddress" runat="server" placeholder="Enter Current Address" CssClass="form-control" TextMode="MultiLine" TabIndex="14"></asp:TextBox>
                                </div>
                                <div class="col-lg-4">
                                    <asp:Label ID="lblpAddress" runat="server" Text="Permanent Address"></asp:Label><span class="required" style="color: red">*</span>
                                    <asp:TextBox ID="txtpAddress" runat="server" placeholder="Enter Permanent Address" CssClass="form-control" TextMode="MultiLine" TabIndex="15"></asp:TextBox>
                                </div>
                                <div class="col-lg-4">
                                    <asp:Label ID="lblImage" runat="server" Text="Upload Photo"></asp:Label><span class="required" style="color: red">*</span>
                                    <asp:Image ID="imgEmp" runat="server" Height="40" Width="40" />
                                    <asp:FileUpload ID="FileUpload1" runat="server" TabIndex="16"/>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="family">
                <div class="container" runat="server" id="FamilyDetails">
                    <div class="panel panel-info">
                        <div class="panel-heading"><b>Family Details</b></div>
                        <div class="panel-body">
                            <div class="row" style="padding-top: 10px">
                                <div class="col-lg-3">
                                    <asp:Label ID="lblSpouseName" runat="server" Text="Spouse Name"></asp:Label>
                                    <asp:TextBox ID="txtSpouseName" runat="server" placeholder="Enter Spouse's Name" CssClass="form-control" TabIndex="1"></asp:TextBox>
                                </div>
                                <div class="col-lg-1">
                                    <asp:Label ID="lblSpouseAge" runat="server" Text="Age"></asp:Label>
                                    <asp:TextBox ID="txtSpouseAge" runat="server" placeholder="Spouse's" CssClass="form-control" TabIndex="2"></asp:TextBox>
                                </div>


                                <div class="col-lg-3">
                                    <asp:Label ID="lblMotherName" runat="server" Text="Mother Name"></asp:Label>
                                    <asp:TextBox ID="txtMotherName" runat="server" placeholder="Enter Mother Name" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-lg-1">
                                    <asp:Label ID="lblMotherAge" runat="server" Text="Age"></asp:Label>
                                    <asp:TextBox ID="txtMotherAge" runat="server" placeholder="Mother's" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-lg-3">
                                    <asp:Label ID="lblfatherName" runat="server" Text="father's Name"></asp:Label>
                                    <asp:TextBox ID="txtfatherName" runat="server" placeholder="Enter Father's Name" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-lg-1">
                                    <asp:Label ID="lblfatherAge" runat="server" Text="Age"></asp:Label>
                                    <asp:TextBox ID="txtfatherAge" runat="server" placeholder="father's" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="education">
                <div class="container" runat="server" id="EducationalDetails">

                    <div class="panel panel-info">
                        <div class="panel-heading"><b>Educational Details</b></div>
                        <div class="panel-body">
                            <div class="row" style="padding-top: 10px">
                                <div class="col-lg-4">
                                    <asp:Label ID="lblSchoolName" runat="server" Text="SSC Name"></asp:Label><span class="required" style="color: red">*</span>
                                    <asp:TextBox ID="txtSchoolName" runat="server" TabIndex="21" placeholder="Enter SSC Name"  CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-lg-2">
                                    <asp:Label ID="lblSchoolPercentage" runat="server" Text="SSC Percentage"></asp:Label><span class="required" style="color: red">*</span>
                                    <asp:TextBox ID="txtSchoolPercentage" runat="server" TabIndex="22" placeholder="Enter Percent"  CssClass="form-control"></asp:TextBox>
                                </div>

                                <div class="col-lg-4">
                                    <asp:Label ID="lblCollegeName" runat="server" Text="HSC Name"></asp:Label><span class="required" style="color: red">*</span>
                                    <asp:TextBox ID="txtCollegeName" runat="server" TabIndex="23" placeholder="Enter HSC Name" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-lg-2">
                                    <asp:Label ID="lblCollegePercentage" runat="server" Text="HSC Percentage"></asp:Label><span class="required" style="color: red">*</span>
                                    <asp:TextBox ID="txtCollegePercentage" runat="server" TabIndex="24" placeholder="Enter Percent"  CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row" id="divDiploma" style="padding-top: 10px">
                                <div class="col-lg-4">
                                    <asp:Label ID="lblDiplomaCollege" runat="server" Text="Diploma College"></asp:Label>
                                    <asp:TextBox ID="txtDiplomaCollege" runat="server" placeholder="Enter Diploma College Name"  CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-lg-2">
                                    <asp:Label ID="lblDiplomaPercentage" runat="server" Text="Diploma Percentage"></asp:Label>
                                    <asp:TextBox ID="txtDiplomaPercentage" runat="server" placeholder="Enter Percent"  CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-lg-2">
                                    <asp:Label ID="lblDiplomaGrade" runat="server" Text="Grade"></asp:Label>
                                    <asp:DropDownList ID="ddlDiplomaGrade" runat="server" RepeatDirection="Horizontal" CssClass="form-control">
                                        <asp:ListItem Text="A" Selected="True" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="B" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="C" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="D" Value="4"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row" style="padding-top: 10px">
                                <div class="col-lg-4">
                                    <asp:Label ID="lblGraduationCollege" runat="server" Text="Graduation College"></asp:Label>
                                    <asp:TextBox ID="txtGraduationCollege" runat="server" placeholder="Enter GraduationCollege"  CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-lg-2">
                                    <asp:Label ID="lblGraduationPercentage" runat="server" Text="Graduation Percentage"></asp:Label>
                                    <asp:TextBox ID="txtGraduationPercentage" runat="server" placeholder="Enter Percent"  CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-lg-2">
                                    <asp:Label ID="lblGraduationGrade" runat="server" Text="Grade"></asp:Label>
                                    <asp:DropDownList ID="ddlGraduationGrade" runat="server" RepeatDirection="Horizontal" CssClass="form-control">
                                        <asp:ListItem Text="A" Selected="True" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="B" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="C" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="D" Value="4"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            
                            <div class="row" id="divPostGraduation" style="padding-top: 10px">
                                <div class="col-lg-4">
                                    <asp:Label ID="lblPostGraduationCollege" runat="server" Text="Post Graduation College"></asp:Label>
                                    <asp:TextBox ID="txtPostGraduationCollege" runat="server" placeholder="Enter PostGraduationCollege"  CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-lg-2">
                                    <asp:Label ID="lblPostGraduationPercentage" runat="server" Text="PG Percentage"></asp:Label>
                                    <asp:TextBox ID="txtPostGraduationPercentage" runat="server" placeholder="Enter Percent"  CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-lg-2">
                                    <asp:Label ID="lblPGGrade" runat="server" Text="Grade"></asp:Label>
                                    <asp:DropDownList ID="ddlPGGrade" runat="server" RepeatDirection="Horizontal" CssClass="form-control">
                                        <asp:ListItem Text="A" Selected="True" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="B" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="C" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="D" Value="4"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="Professional">
                <div class="container" runat="server" id="ProfessionalDetails">

                    <div class="panel panel-info">
                        <div class="panel-heading"><b>Profesional Details</b></div>
                        <div class="panel-body">
                            <div class="row" style="padding-top: 10px">
                                <div class="col-lg-2">
                                    <asp:Label ID="lblAppoinment" runat="server" Text="Date Of Appoinment"></asp:Label><span class="required" style="color: red">*</span>
                                    <asp:TextBox ID="txtAppoinment" runat="server" TextMode="Date" CssClass="form-control" TabIndex="17"></asp:TextBox>
                                </div>

                                <div class="col-lg-3">
                                    <asp:Label ID="lblRecruitment" runat="server" Text="Mode Of Recruitment"></asp:Label><span class="required" style="color: red">*</span>
                                    <asp:DropDownList ID="ddlRecruitment" runat="server" RepeatDirection="Horizontal" CssClass="form-control" TabIndex="18">
                                        <asp:ListItem Text="Off-Campus" Selected="True" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="On-Campus" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Consultancy" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div class="col-lg-3">
                                    <asp:Label ID="lblDesignation" runat="server" Text=" Designation"></asp:Label><span class="required" style="color: red">*</span>
                                    <asp:DropDownList ID="ddlDesignation" runat="server" RepeatDirection="Horizontal" CssClass="form-control" TabIndex="19">
                                        <asp:ListItem Text="Trainee" Selected="True" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Junior Developer" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Senior Developer" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Full Stack Developer" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="Database Administrator" Value="5"></asp:ListItem>
                                        <asp:ListItem Text="Software Tester" Value="6"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-lg-3">
                                    <asp:Label ID="lblEmpType" runat="server" Text="EmployeeType"></asp:Label><span class="required" style="color: red">*</span>
                                    <asp:DropDownList ID="ddlEmpType" runat="server" RepeatDirection="Horizontal" CssClass="form-control" TabIndex="20">
                                        <asp:ListItem Text="Full Time" Selected="True" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Part Time" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Temporary" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
           </div>
            <div role="tabpanel" class="tab-pane" id="PreviousCompany">
                <div class="container" runat="server" id="PreviousCompanyDetails">

                    <div class="panel panel-info">
                        <div class="panel-heading"><b>Previous Company Details</b></div>
                        <div class="panel-body">
                            <div class="row" style="padding-top: 10px">
                                <div class="col-lg-4">
                                    <asp:Label ID="lblPreCompany" runat="server" Text="Previous Company"></asp:Label>
                                    <asp:TextBox ID="txtPreCompany" runat="server" placeholder="Enter Previous Company" CssClass="form-control" TabIndex="1"></asp:TextBox>
                                </div>

                                <div class="col-lg-3">
                                    <asp:Label ID="lblPrevDesignation" runat="server" Text="Designation"></asp:Label>
                                    <asp:DropDownList ID="ddlPrevDesignation" runat="server" RepeatDirection="Horizontal" CssClass="form-control" TabIndex="14">
                                        <asp:ListItem Text="Trainee" Selected="True" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Junior Developer" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Senior Developer" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Full Stack Developer" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="Database Administrator" Value="5"></asp:ListItem>
                                        <asp:ListItem Text="Software Tester" Value="6"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div class="col-lg-2">
                                    <asp:Label ID="lblDoj" runat="server" Text="Date OF Joining"></asp:Label>
                                    <asp:TextBox ID="txtDoj" runat="server" placeholder="Enter Date OF Joining" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                </div>
                                <div class="col-lg-2">
                                    <asp:Label ID="lblDol" runat="server" Text="Date OF Leaving"></asp:Label>
                                    <asp:TextBox ID="txtDol" runat="server" placeholder="Enter Date OF Leaving" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row" style="padding-top: 10px">
                                <div class="col-lg-2">
                                    <asp:Label ID="lblServiceMonth" runat="server" Text="Total Service Month"></asp:Label>
                                    <asp:TextBox ID="txtServiceMonth" runat="server" TextMode="Number" CssClass="form-control" TabIndex="1"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
             </div>
            <div role="tabpanel" class="tab-pane" id="insurance">
                <div class="container" runat="server" id="InsuranceDetails">

                    <div class="panel panel-info">
                        <div class="panel-heading"><b>Insurance Details</b></div>
                        <div class="panel-body">
                            <div class="row" style="padding-top: 10px">
                                <div class="col-lg-3">
                                    <asp:Label ID="lblInsuranceType" runat="server" Text="Insurance Type"></asp:Label>
                                    <asp:DropDownList ID="ddlInsuranceType" runat="server" RepeatDirection="Horizontal" CssClass="form-control" TabIndex="14">
                                        <asp:ListItem Text="Life Insurance" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Health Insurance" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-lg-3">
                                    <asp:Label ID="lblInsuranceCompany" runat="server" Text="Insurance Company Name"></asp:Label>
                                    <asp:TextBox ID="txtInsuranceCompany" runat="server" placeholder="Enter Insurance Company Name" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-lg-3">
                                    <asp:Label ID="lblInsuranceStartDate" runat="server" Text="Insurance Start Date"></asp:Label>
                                    <asp:TextBox ID="txtInsuranceStartDate" runat="server" placeholder="Enter Insurance Start Date" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                </div>
                                <div class="col-lg-3">
                                    <asp:Label ID="lblInsuranceDueDate" runat="server" Text="Insurance Due Date"></asp:Label>
                                    <asp:TextBox ID="txtInsuranceDueDate" runat="server" placeholder="Enter Insurance Due Date" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="loan">
                <div class="container" runat="server" id="LoanDetails">

                    <div class="panel panel-info">
                        <div class="panel-heading"><b>Loan Details</b></div>
                        <div class="panel-body">
                            <div class="row" style="padding-top: 10px">
                                <div class="col-lg-3">
                                    <asp:Label ID="rblLoanType" runat="server" Text="Loan Type"></asp:Label>
                                    <asp:DropDownList ID="ddlLoanType" runat="server" RepeatDirection="Horizontal" CssClass="form-control" TabIndex="14">
                                        <asp:ListItem Text="Personal Loan" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Home Loan" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Gold Loan" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-lg-3">
                                    <asp:Label ID="lblLoanAccNo" runat="server" Text="Loan Account No"></asp:Label>
                                    <asp:TextBox ID="txtLoanAccNo" runat="server" placeholder="Enter Loan Account No" MaxLength="15" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-lg-3">
                                    <asp:Label ID="lblSantionAmount" runat="server" Text="Santion Amount"></asp:Label>
                                    <asp:TextBox ID="txtSantionAmount" runat="server" placeholder="Enter Santion Amount" CssClass="form-control"></asp:TextBox>
                                </div>

                            </div>

                            <div class="row" style="padding-top: 10px">

                                <div class="col-lg-3">
                                    <asp:Label ID="lblSantionDate" runat="server" Text="Santion Date"></asp:Label>
                                    <asp:TextBox ID="txtSantionDate" runat="server" placeholder="Santion Date" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                </div>
                                <div class="col-lg-3">
                                    <asp:Label ID="lblReturnDate" runat="server" Text="Return Date"></asp:Label>
                                    <asp:TextBox ID="txtReturnDate" runat="server" placeholder="Return Date" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="documents">
                <div class="container" runat="server" id="Documents">

                    <div class="panel panel-info">
                        <div class="panel-heading"><b>Documents</b></div>
                        <div class="panel-body">
                            <div class="row" style="padding-top: 10px">
                                <div class="col-lg-3">                             
                                    <asp:Label ID="lblAdharImage" runat="server" Text="Upload AdharCard "></asp:Label><span class="required" style="color: red">*</span>                                  
                                     <a id="sadhar" runat="server" target="_blank">View</a>
                                    <asp:FileUpload ID="AdharCardImage" runat="server"  />
                                </div>                      
                                <div class="col-lg-3">
                                    <asp:Label ID="lblPanCardImage" runat="server" Text="Upload PanCard "></asp:Label><span class="required" style="color: red">*</span>                                  
                                    <a id="sPanCardImage" runat="server">View</a>
                                    <asp:FileUpload ID="PanCardImage" runat="server"/>
                                </div>
                                <div class="col-lg-3">
                                    <asp:Label ID="lblFitnessCertificate" runat="server" Text="Upload FitnessCertificate"></asp:Label> 
                                     <a id="sFitnessCertificate" runat="server">View</a>
                                    <asp:FileUpload ID="FitnessCertificate" runat="server"/>
                                </div>
                                <div class="col-lg-3">                             
                                    <asp:Label ID="lblDomicile" runat="server" Text="Upload Domicile"></asp:Label>   
                                     <a id="sDomicile" runat="server">View</a>
                                    <asp:FileUpload ID="Domicile" runat="server"  />
                                </div> 

                            </div>

                            <div class="row" style="padding-top: 10px">
                                                 
                                <div class="col-lg-3">
                                    <asp:Label ID="lblPreviousOfferLetter" runat="server" Text="Upload Previous Offer Letter"></asp:Label>   
                                      <a id="sPreviousOfferLetter" runat="server">View</a>
                                    <asp:FileUpload ID="PreviousOfferLetter" runat="server"/>
                                </div>
                                <div class="col-lg-3">
                                    <asp:Label ID="lblExperienceLetter" runat="server" Text="Upload Experience Letter"></asp:Label> 
                                     <a id="sExperienceLetter" runat="server">View</a>
                                    <asp:FileUpload ID="ExperienceLetter" runat="server"/>
                                </div>
                                <div class="col-lg-3">                             
                                    <asp:Label ID="lblSalarySlip" runat="server" Text="Upload SalarySlip"></asp:Label> 
                                    <a id="sSalarySlip" runat="server">View</a>
                                    <asp:FileUpload ID="SalarySlip" runat="server"  />
                                </div>                      
                                <div class="col-lg-3">
                                    <asp:Label ID="lblVoterID" runat="server" Text="Upload VoterID"></asp:Label>  
                                    <a id="sVoterID" runat="server" target="_blank">View</a>
                                    <asp:FileUpload ID="VoterID" runat="server"/>
                                </div>    
                            </div>

                        </div>
                    </div>
                </div>

           </div>
            </div>

        <div class="tab-content">
    <div class="tab-pane active" id="tab1">
        <a class="btn btn-primary btnNext" >Next</a>
    </div>
    <div class="tab-pane" id="tab2">
        <a class="btn btn-primary btnNext" >Next</a>
        <a class="btn btn-primary btnPrevious" >Previous</a>
    </div>
    <div class="tab-pane" id="tab3">
        <a class="btn btn-primary btnPrevious" >Previous</a>
    </div>



          </div>


    <center>
        <asp:Button ID="btnPrevTab" runat="server" Text="Previous" class="btn btn-info" OnClick="btnPrevTab_Click" Width="80"/>
        <asp:Button ID="NextTab" runat="server" Text="Next" class="btn btn-info" OnClick="NextTab_Click" Width="80" OnClientClick="return Validation()"/>
        <asp:Button ID="btnReset" runat="server" Text="Reset" class="btn btn-danger" OnClick="btnReset_Click" Width="80"/>
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="btn btn-success" OnClick="btnSubmit_Click" Width="80" />
    </center>

          

<script>

    $(function () {
            $("[id*=ddlCountry]").select2();
            $("[id*=ddlState]").select2();
            $("[id*=ddlDistrict]").select2();
            $("[id*=ddlRecruitment]").select2();
            $("[id*=ddlDesignation]").select2();
            $("[id*=ddlEmpType]").select2();
            $("[id*=ddlPrevDesignation]").select2();
            $("[id*=ddlInsuranceType]").select2();
            $("[id*=ddlLoanType]").select2();
            $("[id*=ddlDiplomaGrade]").select2();
            $("[id*=ddlGraduationGrade]").select2();
            $("[id*=ddlPGGrade]").select2();
            $("[id*=ddlBloodGroup]").select2();
        }
    );

    function Validation()
    {
        //Personal Details
        var FName;
        var MName;
        var LName;
        var DOB;
        var Email;
        var BloodGroup;
        var Gender;
        var MarritialStatus;
        var Country;
        var State;
        var District;
        var AdharNo;
        var Mobile;
        var CAddress;
        var PAddress;
        var Image;

        //Educational Details
        var SchoolName;
        var SchoolPercentage;
        var CollegeName;
        var CollegePercentage;

        //Professional Details
        var Appoinment;
        var Recruitment;
        var InitialDesignation;
        var EmployeeType;

        //Personal Details
        FName = document.getElementById('<%=txtFname.ClientID%>').value;
        MName=document.getElementById('<%=txtMname.ClientID%>').value;
        LName=document.getElementById('<%=txtLname.ClientID%>').value;
        DOB=document.getElementById('<%=txtDob.ClientID%>').value;
        Email=document.getElementById('<%=txtEmail.ClientID%>').value;
        BloodGroup = document.getElementById('<%=ddlBloodGroup.ClientID%>').value;
        Gender=document.getElementById('<%=rblGender.ClientID%>').value;
        MarritialStatus = document.getElementById('<%=rblMarritialStatus.ClientID%>').value
        Country=document.getElementById('<%=ddlCountry.ClientID%>').value;
        State=document.getElementById('<%=ddlState.ClientID%>').value;
        District = document.getElementById('<%=ddlDistrict.ClientID%>').value;
        AdharNo=document.getElementById('<%=txtAddhar.ClientID%>').value;
        Mobile=document.getElementById('<%=txtMobile.ClientID%>').value;
        CAddress=document.getElementById('<%=txtcAddress.ClientID%>').value;
        PAddress=document.getElementById('<%=txtpAddress.ClientID%>').value;
        Image=document.getElementById('<%=FileUpload1.ClientID%>').value;

        //Educational Details
        SchoolName = document.getElementById('<%=txtSchoolName.ClientID%>').value;
        SchoolPercentage = document.getElementById('<%=txtSchoolPercentage.ClientID%>').value;
        CollegeName=document.getElementById('<%=txtCollegeName.ClientID%>').value;
        CollegePercentage = document.getElementById('<%=txtCollegePercentage.ClientID%>').value;

        //Professional Details
        Appoinment = document.getElementById('<%=txtAppoinment.ClientID%>').value;
        Recruitment = document.getElementById('<%=ddlRecruitment.ClientID%>').value;
        InitialDesignation=document.getElementById('<%=ddlDesignation.ClientID%>').value;
        EmployeeType = document.getElementById('<%=ddlEmpType.ClientID%>').value;

  
        //Personal Details
        if (FName == "") {
            alert("Enter Your First Name");
            return false;
        }

        if (MName == "") {
            alert("Enter Your Middle Name");
            return false;
        }

        if (LName == "") {
            alert("Enter Your Last Name");
            return false;
        }

        if (DOB == "") {
            alert("Enter Your Date Of Birth");
            return false;
        }

        if (Email == "") {
            alert("Enter Your Email-ID");
            return false;
        }
        if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(EmailID))
        {
            return true;
        }
        else
        {
            alert("Invalid Email-ID");
            return false;
        }

        if (BloodGroup == "")
        {
            alert("Enter Your Blood Group");
            return false;
        }

        if (Gender == "") {
            alert("Enter Your Gender");
            return false;
        }

        if (MarritialStatus == "") {
            alert("Enter Your Marritial Status");
            return false;
        }

        if (Country == "") {
            alert("Please Select Country");
            return false;
        }

        if (State == "") {
            alert("Please Select State");
            return false;
        }

        if (District == "") {
            alert("Please Select District");
            return false;
        }

        if (AdharNo == "") {
            alert("Enter Your Adhar Number");
            return false;
        }
        if ((AdharNo.length) != 16)
        {
            alert("AdharCard Number Must Have 16 Digits");
            return false;
        }

        if (Mobile == "") {
            alert("Enter Your Mobile Number");
            return false;
        }
        if ((Mobile.length) != 10) {
            alert("Mobile Number Must Have 10 Digits");
            return false;
        }

        if (CAddress == "") {
            alert("Enter Your Current Address");
            return false;
        }

        if (PAddress == "") {
            alert("Enter Your Permanant Address");
            return false;
        }

        if (Image == "") {
            alert("Please Upload Your Photo");
            return false;
        }

        //Educational Details
        if (SchoolName == "") {
            alert("Enter Your School Name");
            return false;
        }

        if (SchoolPercentage == "") {
            alert("Enter Your School Percentage");
            return false;
        }

        if (CollegeName == "") {
            alert("Enter Your College Name");
            return false;
        }

        if (CollegePercentage == "") {
            alert("Enter Your College Percentage");
            return false;
        }

        //Professional Details
        if (Appoinment == "") {
            alert("Enter Your School Date Of Appoinment");
            return false;
        }

        if (Recruitment == "") {
            alert("Enter Your Mode Of Recruitment");
            return false;
        }

        if (InitialDesignation == "") {
            alert("Enter Your Initial Designation");
            return false;
        }

        if (EmployeeType == "") {
            alert("Enter Your Employee Type");
            return false;
        }




</script>

    <asp:HiddenField ID="hdfd" runat="server" />

    <asp:HiddenField ID="hdfdPhoto" runat="server" />
    <asp:HiddenField ID="hdfdAdharNo" runat="server" />
    <asp:HiddenField ID="hdfdPanNo" runat="server" />
    <asp:HiddenField ID="hdfdMedicalFitnessNo" runat="server" />
    <asp:HiddenField ID="hdfdDomicileNo" runat="server" />
    <asp:HiddenField ID="hdfdExperienceNo" runat="server" />
    <asp:HiddenField ID="hdfdPrevOfferNo" runat="server" />
    <asp:HiddenField ID="hdfdSalaryNo" runat="server" />
    <asp:HiddenField ID="hdfdVoterID" runat="server" />

</asp:Content>
