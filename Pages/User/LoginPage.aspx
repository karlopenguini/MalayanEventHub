<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="MalayanEventHub.Pages.User.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <link href="../../Styles/User/loginPage.css" rel="stylesheet" />
            <img class="logo" src="../../Images/mcl_logo.png" />
            <h1>Malayan Colleges Laguna</h1>
            <h1>Event Hub</h1>
            <section class="container">
                <div class="login-div">
                    <label class="main-label">LOGIN</label>
                    <label class="userAndPass-label">username</label>
                    <asp:TextBox CssClass="textbox" ID="TB_UserName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter username" ControlToValidate="TB_UserName" CssClass="req-field" ForeColor="Red"></asp:RequiredFieldValidator>
                    <label class="userAndPass-label">password</label>
                    <asp:TextBox CssClass="textbox" ID="TB_Password" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter password" ControlToValidate="TB_Password" CssClass="req-field" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:Button CssClass="signIn-button" ID="Btn_Signin" runat="server" Text="sign in" />
                </div>

                <div class="register-div">
                    <label class="main-label">REGISTER</label>
                    <label class="as-label">as</label>
                    <asp:Button class="reg-button" ID="BtnReg" runat="server" Text="student" CausesValidation="False" />
                </div>
            </section>
        </div>
    </form>
</body>
</html>
