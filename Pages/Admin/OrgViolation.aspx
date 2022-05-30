<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/Common/Admin/OrganizationView.master" AutoEventWireup="true" CodeBehind="OrgViolation.aspx.cs" Inherits="MalayanEventHub.Layouts.Common.Admin.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
    <link href="../../Styles/Admin/StyleSheetOrgViolation.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style6 {
            margin: 25px 200px 0px 200px;
            font-size: 20px;
        }
        .auto-style7 {
            width: 100%;
        }
        .auto-style8 {
            margin: 70px 200px 0px 200px;
            font-size: 20px;
        }
        .auto-style9 {
            text-align: center;
            margin-right: 40px;
            width: 20%;
        }
        .auto-style10 {
            font-size: small;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="auto-style2">
        <div class="auto-style6">
            Submit a Violation Report
            <div class="ContainerTxtbox">
                <div>
                    Violation<asp:RequiredFieldValidator ID="rfv_violation" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="tb_violation" ViewStateMode="Disabled"></asp:RequiredFieldValidator>
&nbsp;<asp:TextBox ID="tb_violation" runat="server" CssClass="TextBoxStyle" Width="100%"></asp:TextBox>
                </div>
                <div>
                    <table class="auto-style7">
                        <tr>
                            <td style="width: 50%">Date<asp:RequiredFieldValidator ID="rfv_date" runat="server" ControlToValidate="tb_date" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                            <td style="width: 50%">Time<asp:RequiredFieldValidator ID="rfv_time" runat="server" ControlToValidate="tb_time" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="tb_date" runat="server" CssClass="TextBoxStyle" Width="95%"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="tb_time" runat="server" CssClass="TextBoxStyle" Width="100%"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="DivSpacing">
                    Verdict<asp:RequiredFieldValidator ID="rfv_verdict" runat="server" ControlToValidate="tb_verdict" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<asp:TextBox ID="tb_verdict" runat="server" CssClass="TextBoxStyle" Width="100%"></asp:TextBox>
                </div>
                <div class="DivSpacing">
                    Description<asp:RequiredFieldValidator ID="rfv_description" runat="server" ControlToValidate="tb_description" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<asp:TextBox ID="tb_description" runat="server" CssClass="TextBoxStyle" Width="100%" TextMode="MultiLine" Height="200px"></asp:TextBox>
                </div>

                <div class="DivButton">
                    <asp:Button ID="Btn_submit" runat="server" Text="Submit" CssClass="StyleButton"/>
                </div>
               

            </div>
        </div>
        <hr style="margin-top: 30px"/>
        <div class="auto-style8">
            Violations
            <asp:Repeater ID="repeater_violation" runat="server">
                <ItemTemplate>
                     <div class="ViolationDiv">
                        <table class="auto-style7">
                            <tr style="height: auto">
                                <td class="auto-style9">
                                    <asp:Label ID="label_date" runat="server" Text=""><%# Eval("ViolationDate")%></asp:Label>
                                </td>
                                <td style="width: 80%">
                                    <div class="DivSpacing">
                                        <strong>
                                        <asp:Label ID="label_title" runat="server" Text=""><%# Eval("title")%></asp:Label>
                                        </strong>
                                    </div>
                                    <div class="DivSpacing">
                                        <asp:Label ID="label2_date" runat="server" Text="" CssClass="auto-style10"><%# Eval("ViolationDate")%></asp:Label>|<asp:Label ID="Label6" runat="server" Text="" CssClass="auto-style10"><%# Eval("ViolationTIme")%></asp:Label>
                                    </div>
                                    <div class="DivSpacing">
                                        <asp:Label ID="label_time" runat="server" Text=""><%# Eval("verdict")%></asp:Label>
                                    </div>
                                    <div class="DivSpacing">
                                        <asp:Label ID="label_description" runat="server" Text="" CssClass="auto-style10"><%# Eval("details")%></asp:Label>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
