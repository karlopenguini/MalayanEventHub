<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/Common/Admin/OrganizationView.master" AutoEventWireup="true" CodeBehind="OrganizationViolation.aspx.cs" Inherits="MalayanEventHub.Layouts.Common.Admin.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
    <style type="text/css">
        .auto-style6 {
            margin: 20px 0px 0px 0px;
            font-size: 20px;
        }
        .auto-style7 {
            width: 100%;
        }
        .auto-style8 {
            margin: 20px 0px 50px 0px;
            font-size: 20px;
        }
        .auto-style9 {
            text-align: center;
            margin-right: 40px;
            width: 10%;
            padding: 50px;
        }
        .auto-style10 {
            font-size: 18px;
            font-weight: lighter;
        }
        .auto-style11 {
            height: 37px;
        }
        .auto-style12 {
            width: 50%;
            height: 27px;
        }
    </style>
    <link href="../../Styles/Admin/StyleSheetOrgViolation.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="auto-style2">
        <div class="auto-style6">
            Submit a Violation Report
            <div class="ContainerTxtbox">
                <div>
                    <table class="auto-style7">
                        <tr>
                            <td colspan="2">
                                Violation<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="tb_violation" ViewStateMode="Disabled"></asp:RequiredFieldValidator>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="2" class="auto-style11">
                                <asp:TextBox ID="tb_violation" runat="server" CssClass="TextBoxStyle" Width="100%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style12">Date | Time<asp:RequiredFieldValidator ID="rfv_date" runat="server" ControlToValidate="tb_dateTime" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="tb_dateTime" runat="server" CssClass="TextBoxStyle" TextMode="DateTimeLocal" Width="94%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                 Verdict<asp:RequiredFieldValidator ID="rfv_verdict" runat="server" ControlToValidate="tb_verdict" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:TextBox ID="tb_verdict" runat="server" CssClass="TextBoxStyle" Width="100%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                Description<asp:RequiredFieldValidator ID="rfv_description" runat="server" ControlToValidate="tb_description" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:TextBox ID="tb_description" runat="server" CssClass="TextBoxStyle" Width="100%" TextMode="MultiLine" Height="200px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="DivButton">
                    <asp:Button ID="Btn_submit" runat="server" Text="Submit" CssClass="StyleButton" OnClick="Btn_submit_Click"/>
                </div>
               

            </div>
        </div>
        <hr style="margin-top: 30px"/>
        <div class="auto-style8">
            Violations
            <div style="margin: 5px 0px 5px 0px">
                 <asp:Repeater ID="repeater_violation" runat="server">
                    <ItemTemplate>
                         <div class="ViolationDiv">
                            <table class="auto-style7">
                                <tr style="height: 200px">
                                    <td class="auto-style9">
                                        <asp:Label ID="label_date" runat="server" Text='<%# Eval("ShortDate")%>'></asp:Label>
                                    </td>
                                    <td style="width: 80%">
                                        <div class="DivSpacing">
                                            <strong>
                                            <asp:Label ID="label_title" runat="server" Text='<%# Eval("ViolationTitle")%>'></asp:Label>
                                            </strong>
                                        </div>
                                        <div class="DivSpacing">
                                            <asp:Label ID="label2_date" runat="server" Text='<%# Eval("ViolationDate")%>' CssClass="auto-style10"></asp:Label>
                                        </div>
                                        <div class="DivSpacing">
                                            <asp:Label ID="label_time" runat="server" Text='<%# Eval("ViolationVerdict")%>'></asp:Label>
                                        </div>
                                        <div class="DivSpacing">
                                            <asp:Label ID="label_description" runat="server" Text='<%# Eval("ViolationDetails")%>' CssClass="auto-style10"></asp:Label>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>  
        </div>
    </div>
</asp:Content>
