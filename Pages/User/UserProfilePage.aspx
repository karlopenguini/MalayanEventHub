<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/Common/User/AccountDetailsView.master" AutoEventWireup="true" CodeBehind="UserProfilePage.aspx.cs" Inherits="MalayanEventHub.Layouts.Common.User.WebForm1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link href="../../../Styles/User/ProfilePage.css" rel="stylesheet" />
    <section class="main-container">
        <div class="child-container">
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
                            </span>
                    </td>
                    <td>
                        <asp:TextBox CssClass="textbox" ID="tb_fname" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        <span class="label-span">
                            <label class="labels">Email:</label>
                        </span>
                    </td>
                    <td>
                        <asp:TextBox CssClass="textbox" ID="tb_email" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                </tr>

                <tr style="border: solid">
                    <td>
                        <span class="label-span">
                            <label class="labels">Middle Initial:</label>
                            </span>
                    </td>
                    <td>
                        <asp:TextBox CssClass="textbox" ID="tb_mi" runat="server" MaxLength="1" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        <span class="label-span">
                            <label class="labels">College:</label>
                        </span>
                    </td>
                    <td>
                        <asp:TextBox CssClass="textbox" ID="tb_college" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                        <span class="label-span">
                            <label class="labels">Last Name:</label>
                        </span>
                    </td>
                    <td>
                        <asp:TextBox CssClass="textbox" ID="tb_lname" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        <span class="label-span">
                            <label class="labels">Course:</label>
                        </span>
                    </td>
                    <td>
                        <asp:TextBox CssClass="textbox" ID="tb_course" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                        <span class="label-span">
                            <label class="labels">Contact Number:</label>
                        </span>
                    </td>
                    <td>
                        <asp:TextBox CssClass="textbox" ID="tb_contact" runat="server" MaxLength="11" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        <span class="label-span">
                            <label class="labels">Year Level:</label>
                        </span>
                    </td>
                    <td>
                        <asp:TextBox CssClass="textbox" ID="tb_year" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="label-span">
                            <label class="labels">Password:</label>
                        </span>
                    </td>
                    <td>
                        <asp:TextBox CssClass="textbox" ID="tb_password" runat="server" TextMode="Password" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="100%">
                        <asp:Button CssClass="button" ID="btn_update" runat="server" Text="update" />
                    </td>
                </tr>
            </table>
        </div>
    </section>
</asp:Content>
