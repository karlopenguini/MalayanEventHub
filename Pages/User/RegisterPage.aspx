<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="MalayanEventHub.Pages.User.RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Styles/RegisterPage.css" rel="stylesheet" />
</head>
<body>

    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <section class="container">
                <div class="main-div">
                    <h1>Create your account</h1>
                    <p class="par">Lorem ipsum dolor sit amet, consectetur officia? Doloribus molestias </p>
                    <%--name section--%>
                    <div class="main-name-container">
                        <%--first name--%>
                        <div class="fname-container">
                            <span class="label-span">
                                <label class="fname-label">first name</label>
                                <asp:RequiredFieldValidator CssClass="req-field-validator" ID="rfv_fname" runat="server" ErrorMessage="*" ControlToValidate="tb_fname"></asp:RequiredFieldValidator>
                            </span>
                            <asp:TextBox CssClass="fname-tb textbox" ID="tb_fname" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator CssClass="regex-validator" ID="rev_fname" runat="server" ErrorMessage="invalid" ControlToValidate="tb_fname" ValidationExpression="[a-z A-Z]+"></asp:RegularExpressionValidator>
                        </div>
                        <%--middle initial--%>
                        <div class="mi-container">
                            <span class="label-span">
                                <label class="mi-label">middle initial</label>
                                <asp:RequiredFieldValidator CssClass="req-field-validator" ID="rfv_mi" runat="server" ErrorMessage="*" ControlToValidate="tb_mi"></asp:RequiredFieldValidator>
                            </span>
                            <asp:TextBox CssClass="mi-tb textbox" ID="tb_mi" runat="server" MaxLength="1"></asp:TextBox>
                            <asp:RegularExpressionValidator CssClass="regex-validator" ID="rev_mi" runat="server" ErrorMessage="invalid" ControlToValidate="tb_mi" ValidationExpression="[A-Z]{1}"></asp:RegularExpressionValidator>
                        </div>
                        <%--last name--%>
                        <div class ="lname-container">
                            <span class="label-span">
                                <label class="lname-label">last name</label>
                                <asp:RequiredFieldValidator CssClass="req-field-validator" ID="rfv_lname" runat="server" ErrorMessage="*" ControlToValidate="tb_lname"></asp:RequiredFieldValidator>
                            </span>
                            <asp:TextBox CssClass="lname-tb textbox" ID="tb_lname" runat="server"></asp:TextBox>
                             <asp:RegularExpressionValidator CssClass="regex-validator" ID="RegularExpressionValidator1" runat="server" ErrorMessage="invalid" ControlToValidate="tb_lname" ValidationExpression="[a-z A-Z]+"></asp:RegularExpressionValidator>
                        </div>
                    </div>

                    <%--section for the email contact and password--%>
                    <div class="details-container">
                        <%--email--%>
                        <span class="label-span">
                            <label class="details-label"> email address</label>
                            <asp:RequiredFieldValidator CssClass="req-field-validator" ID="rfv_email" runat="server" ErrorMessage="*" ControlToValidate="tb_email"></asp:RequiredFieldValidator>
                        </span>
                        <asp:TextBox CssClass="details-tb textbox"  ID="tb_email" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator CssClass="regex-validator" ID="rev_email" runat="server" ErrorMessage="invalid" ControlToValidate="tb_email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <%--contact number--%>
                        <span class="label-span">
                            <label class="details-label">contact number</label>
                            <asp:RequiredFieldValidator CssClass="req-field-validator" ID="rfv_contact" runat="server" ErrorMessage="*" ControlToValidate="tb_contact"></asp:RequiredFieldValidator>
                        </span>
                        <asp:TextBox CssClass="details-tb textbox" ID="tb_contact" runat="server" MaxLength="11"></asp:TextBox>
                        <asp:RegularExpressionValidator CssClass="regex-validator" ID="rev_contact" runat="server" ErrorMessage="invalid" ControlToValidate="tb_contact" ValidationExpression="[0-9]{11}"></asp:RegularExpressionValidator>
                        <%--password--%>
                        <span class="label-span">
                            <label class="details-label">password</label>
                            <asp:RequiredFieldValidator CssClass="req-field-validator" ID="rfv_password" runat="server" ErrorMessage="*" ControlToValidate="tb_password"></asp:RequiredFieldValidator>
                        </span>
                        <asp:TextBox CssClass="details-tb textbox" ID="tb_password" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RegularExpressionValidator CssClass="regex-validator" ID="rev_password" runat="server" ErrorMessage="invalid" ControlToValidate="tb_password"></asp:RegularExpressionValidator>
                    </div>

                    <%--section for the college course and year level--%>
                    <%--update panel to avoid full postback--%>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                    <div class="ddl-section-container">
                        <%--college ddl--%>
                        <div class="college-container">
                            <label class="college-label">college</label>
                            <asp:DropDownList CssClass="college-ddl ddl" ID="ddl_college" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_college_SelectedIndexChanged">
                                <asp:ListItem>CCIS</asp:ListItem>
                                <asp:ListItem>CAS</asp:ListItem>
                                <asp:ListItem>ETYCB</asp:ListItem>
                                <asp:ListItem>MITL</asp:ListItem>
                                <asp:ListItem>CMET</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <%--course ddl--%>
                        <div class="course-container">
                            <label class="course-label">course</label>
                            <asp:DropDownList CssClass="course-ddl ddl" ID="ddl_course" runat="server">
                                <asp:ListItem>BSCS</asp:ListItem>
                                <asp:ListItem>BSIT</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <%--year ddl--%>
                        <div class="year-container">
                            <label class="year-label">year</label>
                            <asp:DropDownList CssClass="year-ddl ddl" ID="ddl_year" runat="server">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    </ContentTemplate>
                    </asp:UpdatePanel>

                    <%--sing in and sign up section--%>
                    <asp:Button CssClass="button" ID="btn_signup" runat="server" Text="sign up" />
                    <p class="par">Have an account?<asp:HyperLink CssClass="hyper-link" ID="hl_signin" runat="server">Sign in</asp:HyperLink> </p>
                </div>
            </section>
        </div>
    </form>
</body>
</html>
