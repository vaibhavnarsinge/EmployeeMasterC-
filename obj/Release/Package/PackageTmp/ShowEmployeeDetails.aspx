<%@ Page Title="" Language="C#" MasterPageFile="~/EmpMaster.Master" AutoEventWireup="true" CodeBehind="ShowEmployeeDetails.aspx.cs" Inherits="EmployeeMaster.ShowEmployeeDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="plugins/datatables/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="plugins/datatables/DT_bootstrap.js"></script>
    <script type="text/javascript" src="plugins/datatables/responsive/datatables.responsive.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="container" runat="server" id="PersonalDetails" style="padding-left: 25px">

        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="row" style="padding-top: 10px">
                    <div class="col-lg-3">
                        <b>Search Employee Details</b>
                    </div>

                    <div class="col-lg-3">
                        <asp:DropDownList ID="ddlShowEmp" runat="server" AutoPostBack="true" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-lg-2">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
                    </div>
                    <div class="col-lg-2">
                        <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-primary" OnClick="btnEdit_Click" />
                    </div>
                </div>
            </div>
            <div class="panel-body">
                <h3>Personal Information</h3>
                <div>
                    <div class="row" style="padding-top: 10px">
                        <div class="col-lg-2">

                            <asp:Label ID="lblFName" runat="server" Text="First Name : " Font-Bold="true"></asp:Label>
                        </div>
                        <div class="col-lg-4">
                            <asp:Label ID="lblfirstname" runat="server" Text=""></asp:Label>
                        </div>

                    </div>
                    <div class="row" style="padding-top: 10px">
                        <div class="col-lg-2">
                            <asp:Label ID="lblDob" runat="server" Text="Date Of Birth : " Font-Bold="true"></asp:Label>
                        </div>
                        <div class="col-lg-2">
                            <asp:Label ID="lblsdob" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="col-lg-2">
                            <asp:Label ID="lblIdentity" runat="server" Text="Identity Mark : " Font-Bold="true"></asp:Label>
                        </div>
                        <div class="col-lg-2">
                            <asp:Label ID="lblsidentity" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="col-lg-2">
                            <asp:Label ID="lblEmail" runat="server" Text="EmailID : " Font-Bold="true"></asp:Label>
                        </div>
                        <div class="col-lg-2">
                            <asp:Label ID="lblsemail" runat="server" Text=""></asp:Label>
                        </div>
                    </div>

                    <div class="row" style="padding-top: 10px">
                        <div class="col-lg-2">
                            <asp:Label ID="lblBloodGroup" runat="server" Text="BloodGroup : " Font-Bold="true"></asp:Label>
                        </div>
                        <div class="col-lg-2">
                            <asp:Label ID="lblsbloodgroup" runat="server" Text=""></asp:Label>
                        </div>

                        <div class="col-lg-2">
                            <asp:Label ID="lblGender" runat="server" Text="Gender : " Font-Bold="true"></asp:Label>
                        </div>
                        <div class="col-lg-2">
                            <asp:Label ID="lblsgender" runat="server"></asp:Label>
                        </div>

                        <div class="col-lg-2">
                            <asp:Label ID="lblMarritialStatus" runat="server" Text="Marritial Status : " Font-Bold="true"></asp:Label>
                        </div>
                        <div class="col-lg-2">
                            <asp:Label ID="lblsmaritialstatus" runat="server" Text=""></asp:Label>
                        </div>
                    </div>

                    <div class="row" style="padding-top: 10px">
                        <div class="col-lg-2">
                            <asp:Label ID="lblCountry" runat="server" Text="Country : " Font-Bold="true"></asp:Label>
                        </div>
                        <div class="col-lg-2">
                            <asp:Label ID="lblscountry" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="col-lg-2">
                            <asp:Label ID="lblState" runat="server" Text="State : " Font-Bold="true"></asp:Label>
                        </div>
                        <div class="col-lg-2">
                            <asp:Label ID="lblsstate" runat="server" Text=""></asp:Label>

                        </div>
                        <div class="col-lg-2">
                            <asp:Label ID="lblDistrict" runat="server" Text="District : " Font-Bold="true"></asp:Label>
                        </div>
                        <div class="col-lg-2">
                            <asp:Label ID="lblsdistrict" runat="server" Text=""></asp:Label>
                        </div>
                    </div>

                    <div class="row" style="padding-top: 10px">
                        <div class="col-lg-2">
                            <asp:Label ID="lblAddhar" runat="server" Text="Addhar Number : " Font-Bold="true"></asp:Label>
                        </div>
                        <div class="col-lg-2">
                            <asp:Label ID="lblsaddhar" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="col-lg-2">
                            <asp:Label ID="lblMobile" runat="server" Text="Mobile : " Font-Bold="true"></asp:Label>
                        </div>
                        <div class="col-lg-2">
                            <asp:Label ID="lblsmobile" runat="server" Text=""></asp:Label>

                        </div>

                    </div>

                    <div class="row" style="padding-top: 10px">
                        <div class="col-lg-2">
                            <asp:Label ID="lblcAddress" runat="server" Text="Currunt Address : " Font-Bold="true"></asp:Label>
                        </div>
                        <div class="col-lg-2">
                            <asp:Label ID="lblscaddress" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="col-lg-2">
                            <asp:Label ID="lblpAddress" runat="server" Text="Permanent Address : " Font-Bold="true"></asp:Label>
                        </div>
                        <div class="col-lg-2">
                            <asp:Label ID="lblspaddress" runat="server" Text=""></asp:Label>

                        </div>
                        <div class="col-lg-2">
                            <asp:Label ID="lblImage" runat="server" Text="Photo : " Font-Bold="true"></asp:Label>
                        </div>
                        <div class="col-lg-2">
                            <asp:Image ID="sImage" runat="server" Height="50" Width="50" />
                        </div>
                    </div>
                </div>

                <hr>
                <h3>Family Details</h3>
                <div class="row" style="padding-top: 10px">
                    <div class="col-lg-3">
                        <asp:Label ID="lblSpouseName" runat="server" Text="Spouse Name : " Font-Bold="true"></asp:Label>

                        <asp:Label ID="lblsspouseName" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-lg-1">
                        <asp:Label ID="lblSpouseAge" runat="server" Text="Age : " Font-Bold="true"></asp:Label>

                        <asp:Label ID="lblsspouseage" runat="server" Text=""></asp:Label>
                    </div>


                    <div class="col-lg-3">
                        <asp:Label ID="lblMotherName" runat="server" Text="Mother Name : " Font-Bold="true"></asp:Label>

                        <asp:Label ID="lblsmothername" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-lg-1">
                        <asp:Label ID="lblMotherAge" runat="server" Text="Age : " Font-Bold="true"></asp:Label>
                        <asp:Label ID="lblsmotherage" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-lg-3">
                        <asp:Label ID="lblFatherName" runat="server" Text="father's Name : " Font-Bold="true"></asp:Label>
                        <asp:Label ID="lblsfathername" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-lg-1">
                        <asp:Label ID="lblFatherAge" runat="server" Text="Age : " Font-Bold="true"></asp:Label>
                        <asp:Label ID="lblsfatherage" runat="server" Text=""></asp:Label>
                    </div>
                </div>

                <hr>
                <h3>Educational Details </h3>
                <div class="row" style="padding-top: 10px">
                    <div class="col-lg-2">
                        <asp:Label ID="lblSchoolName" runat="server" Text="SSC Name : " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblsschoolname" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblSchoolPercentage" runat="server" Text="SSC Percentage : " Font-Bold="true" />
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblsschoolpercentage" runat="server" Text="" />
                    </div>
                </div>

                <div class="row" style="padding-top: 10px">
                    <div class="col-lg-2">
                        <asp:Label ID="lblCollegeName" runat="server" Text="HSC Name : " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblscollegename" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblCollegePercentage" runat="server" Text="HSC Percentage : " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblscollegepercentage" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div class="row" id="divDiploma" style="padding-top: 10px">
                    <div class="col-lg-2">
                        <asp:Label ID="lblDiplomaCollege" runat="server" Text="Diploma College : " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblsdiplomacollege" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblDiplomaPercentage" runat="server" Text="Diploma Percentage : " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblsdiplomapercentage" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblDiplomaGrade" runat="server" Text="Grade : " Font-Bold="true"></asp:Label>

                        <asp:Label ID="lblsdiplomagrade" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div class="row" style="padding-top: 10px">
                    <div class="col-lg-2">
                        <asp:Label ID="lblGraduationCollege" runat="server" Text="Graduation College : " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblsgraduationcollege" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblGraduationPercentage" runat="server" Text="Graduation Percentage: " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblsgraduationpercentage" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblGraduationGrade" runat="server" Text="Grade : " Font-Bold="true"></asp:Label>

                        <asp:Label ID="lblsgraduationgrade" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div class="row" id="divPostGraduation" style="padding-top: 10px">
                    <div class="col-lg-2">
                        <asp:Label ID="lblPostGraduationCollege" runat="server" Text="PG College : " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblspostgraduationcollege" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblPostGraduationPercentage" runat="server" Text="PG Percentage : " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblspostgraduationpercentage" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblPGGrade" runat="server" Text="Grade : " Font-Bold="true"></asp:Label>
                        <asp:Label ID="lblspggrade" runat="server" Text=""></asp:Label>
                    </div>
                </div>

                <hr>
                <h3>Professional Details </h3>

                <div class="row" style="padding-top: 10px">
                    <div class="col-lg-3">
                        <asp:Label ID="lblAppoinment" runat="server" Text="Date Of Appoinment : " Font-Bold="true"></asp:Label>
                        <asp:Label ID="lblsappoinment" runat="server" Text=""></asp:Label>
                    </div>

                    <div class="col-lg-3">
                        <asp:Label ID="lblRecruitment" runat="server" Text="Mode Of Recruitment : " Font-Bold="true"></asp:Label>
                        <asp:Label ID="lblsrecruitment" runat="server" Text=""></asp:Label>
                    </div>

                    <div class="col-lg-3">
                        <asp:Label ID="lblDesignation" runat="server" Text=" Designation : " Font-Bold="true"></asp:Label>
                        <asp:Label ID="lblsdesignation" runat="server" Text=" "></asp:Label>

                    </div>
                    <div class="col-lg-3">
                        <asp:Label ID="lblEmpType" runat="server" Text="EmployeeType : " Font-Bold="true"></asp:Label>
                        <asp:Label ID="lblsemptype" runat="server" Text=""></asp:Label>
                    </div>
                </div>

                <hr>
                <h3>Previous Company Details </h3>
                <div class="row" style="padding-top: 10px">
                    <div class="col-lg-2">
                        <asp:Label ID="lblPreCompany" runat="server" Text="Previous Company : " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblsprecompany" runat="server" Text=""></asp:Label>
                    </div>

                    <div class="col-lg-2">
                        <asp:Label ID="lblPrevDesignation" runat="server" Text="Designation : " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblsprevdesignation" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblServiceMonth" runat="server" Text="Total Service Month: " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblsservicemonth" runat="server" Text=""></asp:Label>
                    </div>

                </div>
                <div class="row" style="padding-top: 10px">

                    <div class="col-lg-2">
                        <asp:Label ID="lblDoj" runat="server" Text="Date OF Joining : " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblsdoj" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblDol" runat="server" Text="Date OF Leaving : " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblsdol" runat="server" Text=""></asp:Label>
                    </div>
                </div>

                <hr>
                <h3>Insurance Details </h3>
                <div class="row" style="padding-top: 10px">
                    <div class="col-lg-2">
                        <asp:Label ID="lblInsuranceType" runat="server" Text="Insurance Type : " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblsinsurancetype" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblInsuranceCompany" runat="server" Text="Insurance Company :" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblsinsurancecompany" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div class="row" style="padding-top: 10px">
                    <div class="col-lg-2">
                        <asp:Label ID="lblInsuranceStartDate" runat="server" Text="Insurance Start Date : " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblsinsurancestartdate" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblInsuranceDueDate" runat="server" Text="Insurance Due Date : " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblsinsuranceduedate" runat="server" Text=""></asp:Label>
                    </div>
                </div>

                <hr>
                <h3>Loan Details</h3>
                <div class="row" style="padding-top: 10px">
                    <div class="col-lg-2">
                        <asp:Label ID="lblLoanType" runat="server" Text="Loan Type : " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblsloantype" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblLoanAccNo" runat="server" Text="Loan Account No : " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblsloanaccno" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblSantionAmount" runat="server" Text="Santion Amount : " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblssantionamount" runat="server" Text=""></asp:Label>
                    </div>

                </div>

                <div class="row" style="padding-top: 10px">

                    <div class="col-lg-2">
                        <asp:Label ID="lblSantionDate" runat="server" Text="Santion Date : " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblssantiondate" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblReturnDate" runat="server" Text="Return Date : " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblsreturndate" runat="server" Text=""></asp:Label>
                    </div>
                </div>

                <hr>
                <h3>Documents</h3>
                <div class="row" style="padding-top: 10px">
                    <div class="col-lg-2">
                        <asp:Label ID="lblAdharImage" runat="server" Text="AdharCard :" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-1">
                        <asp:Label ID="lblsadhar" runat="server" Visible="false"></asp:Label>
                        <a id="sadhar" runat="server" target="_blank">View</a>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblPanCardImage" runat="server" Text="PanCard  : " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-1">
                        <asp:Label ID="lblsPanCardImage" runat="server" Visible="false"></asp:Label>
                        <a id="sPanCardImage" runat="server">View</a>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblFitnessCertificate" runat="server" Text="FitnessCertificate : " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-1">
                        <asp:Label ID="lblsFitnessCertificate" runat="server" Visible="false"></asp:Label>
                        <a id="sFitnessCertificate" runat="server">View</a>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblDomicile" runat="server" Text="Domicile : " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-1">
                        <asp:Label ID="lblsDomicile" runat="server" Visible="false"></asp:Label>
                        <a id="sDomicile" runat="server">View</a>
                    </div>

                </div>

                <div class="row" style="padding-top: 10px">

                    <div class="col-lg-2">
                        <asp:Label ID="lblPreviousOfferLetter" runat="server" Text="Previous Offer Letter : " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-1">
                        <asp:Label ID="lblsPreviousOfferLetter" runat="server" Visible="false"></asp:Label>
                        <a id="sPreviousOfferLetter" runat="server">View</a>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblExperienceLetter" runat="server" Text="Experience Letter : " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-1">
                        <asp:Label ID="lblsExperienceLetter" runat="server" Visible="false"></asp:Label>
                        <a id="sExperienceLetter" runat="server">View</a>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblSalarySlip" runat="server" Text="SalarySlip : " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-1">
                        <asp:Label ID="lblsSalarySlip" runat="server" Visible="false"></asp:Label>
                        <a id="sSalarySlip" runat="server">View</a>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblVoterID" runat="server" Text="VoterID : " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-1">
                        <asp:Label ID="lblsVoterID" runat="server" Visible="false"></asp:Label>
                        <a id="sVoterID" runat="server" target="_blank">View</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>

        $(function () {
            $("[id*=ddlShowEmp]").select2();

        }
        );

    </script>
</asp:Content>
