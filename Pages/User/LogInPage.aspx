<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogInPage.aspx.cs" Inherits="MalayanEventHub.Pages.User.LogInPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Styles/User/LogInPage.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="parent-container">
            <main>
                <%--MCL header--%>
                <h1 style="font-size:56px;">Malayan Colleges Laguna <br /> Event Hub</h1>
                <div class="par-div">
                    <p class="par">
                        MCL Event HUB provides students of Malayan Colleges Laguna a medium for them to easily register for events hosted by MCL. It also offers a solution for Malayan Colleges of Laguna to organize events efficiently.
                    </p>
                </div>
                <section class="container">
                    <%--div containing the log in part--%>
                    <div class="login-div">
                        <p class="main-label">LOGIN</p>
                        <label class="userAndPass-label">User ID</label>
                        <asp:TextBox CssClass="textbox" ID="TB_UserName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter username" ControlToValidate="TB_UserName" CssClass="req-field" ForeColor="Red"></asp:RequiredFieldValidator>
                        <label class="userAndPass-label">Password</label>
                        <asp:TextBox CssClass="textbox" ID="TB_Password" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter password" ControlToValidate="TB_Password" CssClass="req-field" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:Button CssClass="signIn-button" ID="Btn_Signin" runat="server" Text="sign in" OnClick="Btn_Signin_Click" />
                    </div>
                    <%--div containing the register part--%>
                    <div class="register-div">
                        <p class="main-label" style="font-weight:300;">REGISTER</p>
                        <label class="as-label">as</label>
                        <asp:Button class="reg-button" ID="BtnReg" runat="server" Text="student" CausesValidation="False" OnClick="BtnReg_Click"/>
                    </div>
                </section>
            </main>
        </div>
    </form>
</body>
</html>
