<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Employee.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="content/bootstrap.css" rel="stylesheet" />
    <link href="content/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

    <title>Employee Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container pt-10 " style="width: 360px; padding-top: 50px; align-content: center;">

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 align="center">Employee Login</h3>
                </div>
                <div class="panel-body" style="padding: 10px; margin: 10px 10px 10px 10px">

                    <div style="padding: 22px">
                        <div style="padding: 10px">
                            <asp:Label ID="lblUsername" runat="server" CssClass= "fw-bolder" Font-Size="Medium">Username:</asp:Label>
                            <div class="d-flex p-2">
                                <i class="	fas fa-user-alt" style="font-size: 22px; padding-right: 5px"></i>
                                <asp:TextBox class="form-control" ID="txtUsername" placeholder="Enter Username" runat="server" Style="border-color: aquamarine" />

                            </div>
                        </div>
                        <div style="padding: 10px">
                            <asp:Label ID="lblPassword" runat="server" CssClass= "fw-bolder" Font-Size="Medium">Password:</asp:Label>
                            <div class="d-flex p-2">
                                <i class="	fas fa-key" style="font-size: 22px; padding-right: 5px"></i>
                                <asp:TextBox class="form-control" ID="txtPassword" placeholder="Enter password" runat="server" Style="border-color: aquamarine" />
                            </div>
                        </div>
                        <div style="padding: 10px">
                            <asp:Label class="check-label" runat="server">

                                <asp:CheckBox ID="CheckBox1" runat="server" class="check-input" name="remember" />Remember me
                            </asp:Label>
                            <asp:Button class="btn btn-primary btn-lg" runat="server"  ID="btnLogin" Text="Login" OnClick="btnLogin_Click" OnClientClick="return validate()"></asp:Button>

                            <a href="Registration.aspx">want To Register??> </a>
                        </div>
                    </div>
                </div>

            </div>


        </div>
    </form>
    <script type="text/javascript">
        function validate() {
            var username, password;

            username = document.getElementById('<%=txtUsername.ClientID%>').value;
            password = document.getElementById('<%=txtPassword.ClientID%>').value;


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
