<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/Common/User/AccountDetailsView.master" AutoEventWireup="true" CodeBehind="UserProfilePage(update).aspx.cs" Inherits="MalayanEventHub.Layouts.Common.User.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <link href="../../../Styles/User/UserProfilePage(update).css" rel="stylesheet" />
    <section class="main-container">
        <div class="child-container">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            <table class="table">
                <tr>
                    <th colspan="2">
                        <label class="main-label">Personal Details</label>
                    </th>
                    <th colspan="2">
                        <label class="main-label">Student Information</label>
                    </th>
                </tr>
                <tr>
                    <td>
                        <span class="label-span">
                            <label class="labels">First Name:</label>
                            <asp:RequiredFieldValidator CssClass="req-validator" ID="rfv_fname" runat="server" ErrorMessage="*" ControlToValidate="tb_fname"></asp:RequiredFieldValidator>
                        </span>
                    </td>
                    <td>
                        <asp:TextBox CssClass="textbox" ID="tb_fname" runat="server" Enabled="False"></asp:TextBox>
                        <asp:RegularExpressionValidator CssClass="regex-validator" ID="rev_fname" runat="server" ErrorMessage="invalid" ControlToValidate="tb_fname" ValidationExpression="[a-z A-Z]+"></asp:RegularExpressionValidator>
                    </td>
                    <td>
                        <span class="label-span">
                            <label class="labels">Email:</label>
                             <asp:RequiredFieldValidator CssClass="req-validator" ID="rfv_email" runat="server" ErrorMessage="*" ControlToValidate="tb_email"></asp:RequiredFieldValidator>
                        </span>
                    </td>
                    <td>
                        <asp:TextBox CssClass="textbox" ID="tb_email" runat="server" Enabled="False"></asp:TextBox>
                        <asp:RegularExpressionValidator CssClass="regex-validator" ID="rev_email" runat="server" ErrorMessage="invalid" ControlToValidate="tb_email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>

                <tr style="border: solid">
                    <td>
                        <span class="label-span">
                            <label class="labels">Middle Name:</label>
                            <asp:RequiredFieldValidator CssClass="req-validator" ID="rfv_mname" runat="server" ErrorMessage="*" ControlToValidate="tb_mname"></asp:RequiredFieldValidator>
                        </span>
                    </td>
                    <td>
                        <asp:TextBox CssClass="textbox" ID="tb_mname" runat="server" Enabled="False"></asp:TextBox>
                        <asp:RegularExpressionValidator CssClass="regex-validator" ID="rev_mname" runat="server" ErrorMessage="invalid" ControlToValidate="tb_mname" ValidationExpression="[A-Z a-z]+"></asp:RegularExpressionValidator>
                    </td>
                    <td>
                        <span class="label-span">
                            <label class="labels">College:</label>
                        </span>
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanelCollege" runat="server">
                        <ContentTemplate>
                        <asp:DropDownList CssClass="ddl" ID="ddl_college" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_college_SelectedIndexChanged" Enabled="False">
                            <asp:ListItem>CCIS</asp:ListItem>
                            <asp:ListItem>CAS</asp:ListItem>
                            <asp:ListItem>ETYCB</asp:ListItem>
                            <asp:ListItem>MITL</asp:ListItem>
                            <asp:ListItem>CMET</asp:ListItem>
                        </asp:DropDownList>
                        </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>

                <tr>
                    <td>
                        <span class="label-span">
                            <label class="labels">Last Name:</label>
                            <asp:RequiredFieldValidator CssClass="req-validator" ID="rfv_lname" runat="server" ErrorMessage="*" ControlToValidate="tb_lname"></asp:RequiredFieldValidator>
                        </span>
                    </td>
                    <td>
                        <asp:TextBox CssClass="textbox" ID="tb_lname" runat="server" Enabled="False"></asp:TextBox>
                        <asp:RegularExpressionValidator CssClass="regex-validator" ID="rev_lname" runat="server" ErrorMessage="invalid" ControlToValidate="tb_lname" ValidationExpression="[a-z A-Z]+"></asp:RegularExpressionValidator>
                    </td>
                    <td>
                        <span class="label-span">
                            <label class="labels">Course:</label>
                        </span>
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanelCourse" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                        <asp:DropDownList CssClass="ddl" ID="ddl_course" runat="server" Enabled="False">
                            <asp:ListItem>BSCS</asp:ListItem>
                            <asp:ListItem>BSIT</asp:ListItem>
                        </asp:DropDownList>
                        </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>

                <tr>
                    <td>
                        <span class="label-span">
                            <label class="labels">Contact Number:</label>
                            <asp:RequiredFieldValidator CssClass="req-validator" ID="rfv_contact" runat="server" ErrorMessage="*" ControlToValidate="tb_contact"></asp:RequiredFieldValidator>
                        </span>
                    </td>
                    <td>
                        <asp:TextBox CssClass="textbox" ID="tb_contact" runat="server" MaxLength="11" Enabled="False"></asp:TextBox>
                        <asp:RegularExpressionValidator CssClass="regex-validator" ID="rev_contact" runat="server" ErrorMessage="invalid" ControlToValidate="tb_contact" ValidationExpression="[0-9]{11}"></asp:RegularExpressionValidator>
                    </td>
                    <td>
                        <span class="label-span">
                            <label class="labels">Year Level:</label>
                        </span>
                    </td>
                    <td>
                        <asp:DropDownList CssClass="ddl" ID="ddl_yearLevel" runat="server" Enabled="False">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="label-span">
                            <label class="labels">Password:</label>
                            <asp:RequiredFieldValidator CssClass="req-validator" ID="rfv_password" runat="server" ErrorMessage="*" ControlToValidate="tb_password"></asp:RequiredFieldValidator>
                        </span>
                    </td>
                    <td>
                        <asp:TextBox CssClass="textbox" ID="tb_password" runat="server" TextMode="Password" Enabled="False"></asp:TextBox>
                        <%--<asp:RegularExpressionValidator CssClass="regex-validator" ID="rev_password" runat="server" ErrorMessage="invalid" ControlToValidate="tb_password"></asp:RegularExpressionValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button CssClass="button btn-update-margin" ID="btn_update" runat="server" Text="update" CausesValidation="False" OnClick="update_Click" />
                    </td>
                    <td colspan="2">
                        <asp:Button CssClass="button" ID="btn_logout" runat="server" Text="logout" CausesValidation="False" OnClick="btn_logout_Click"/>
                    </td>
                </tr>
            </table>
            </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </section>
</asp:Content>
