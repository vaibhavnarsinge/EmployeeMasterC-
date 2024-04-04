<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Employee.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="content/bootstrap.css" rel="stylesheet" />
    <link href="content/bootstrap.min.css" rel="stylesheet" />
    <title>Employee Registration</title>
</head>
<body>
    <center>
        <h1 align="center">Employee Registration</h1>
        <form id="form" runat="server" name="registration">
            <div class="container-fluid " style="width: 800px">
                <div class="row" style="padding: 22px">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-4">
                        <asp:Label ID="lblEmpName" runat="server" Text="Employee Name"></asp:Label>
                        <asp:TextBox ID="txtEmpName" runat="server" placeholder="Enter Employee Name" class="form-inline" CssClass="form-control" Style="border-color: aquamarine"></asp:TextBox>
                    </div>
                    <div class="col-sm-4">
                        <asp:Label ID="lblEmpMobile" runat="server" Text="Employee Mobile"></asp:Label>
                        <asp:TextBox ID="txtEmpMobile" runat="server" placeholder="Enter Employee Mobile Number" MaxLength="10" TextMode="Phone" class="form-control" Style="border-color: aquamarine"></asp:TextBox>
                    </div>
                    <div class="col-sm-2"></div>
                </div>
                <%-- <div class="row" style="padding-top:22px">
                <div class="col-sm-2"></div>
                <div class="col-sm-4">
                    <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                    <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control">
                        <asp:ListItem Selected="True">Maharashtra</asp:ListItem>
                        <asp:ListItem>Goa</asp:ListItem>
                    </asp:DropDownList>

                </div>
                <div class="col-sm-4">
                    <asp:Label ID="lblDistrict" runat="server" Text="District" ></asp:Label>
                    <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control">
                        <asp:ListItem Selected="True">Pune</asp:ListItem>
                        <asp:ListItem>Panji</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-sm-2"></div>
            </div>--%>
                <div class="row" style="padding: 20px">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-4">
                        <asp:Label ID="lblusername" runat="server" Text="Username"></asp:Label>
                        <asp:TextBox ID="txtusername" runat="server" placeholder="Enter Username" class="form-inline" CssClass="form-control" Style="border-color: aquamarine"></asp:TextBox>
                    </div>
                    <div class="col-sm-4">
                        <asp:Label ID="lblpassword" runat="server" Text="Password"></asp:Label>
                        <asp:TextBox ID="txtpassword" runat="server" placeholder="Enter Password" MaxLength="10" TextMode="Password" class="form-control" Style="border-color: aquamarine"></asp:TextBox>
                    </div>
                    <div class="col-sm-2"></div>
                </div>

                <div class="row" style="padding: 20px">
                    <div class="col-sm-4"></div>
                    <div class="col-sm-2 text-center">
                        <asp:Button ID="btnSave" Text="Submit" runat="server" CssClass="btn btn-block btn-success text-center" CausesValidation="true" OnClientClick="return validate()" OnClick="btnSave_Click" />
                    </div>
                    <div class="col-sm-2">
                        <asp:Button ID="btnClear" runat="server" Text="clear" CssClass="btn btn-block btn-danger text-center" />
                    </div>

                    <div class="col-sm-4"></div>
                </div>
            </div>

        </form>
    </center>
    <script type="text/javascript">
        function validate() {
            var empname, empmobile, username, password;
            empname = document.getElementById('<%=txtEmpName.ClientID%>').value;
            empmobile = document.getElementById('<%=txtEmpMobile.ClientID%>').value;
            username = document.getElementById('<%=txtusername.ClientID%>').value;
            password = document.getElementById('<%=txtpassword.ClientID%>').value;

            if (empname == "" || empmobile == "" || username == "" || password == "") {
                alert("All Fields are Mandatory!!!");
                return false;
            }

            if (empname == "") {
                alert("Enter Employee Name!!!");
                return false;
            }
            if (empmobile == "") {
                alert("Enter Employee Mobile Number!!!");
                return false;
            }
            if (username == "") {
                alert("Enter Username!!!");
                return false;
            }

            if (password == "") {
                alert("Enter Password!!!");
                return false;
            }
        }

    </script>

</body>
</html>
