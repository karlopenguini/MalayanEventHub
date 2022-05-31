<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/AdminView.Master" AutoEventWireup="true" CodeBehind="OrgReview.aspx.cs" Inherits="MalayanEventHub.Layouts.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Styles/Admin/StyleSheetOrgReview.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Title-->
    <div class="title-container">
        Review Organization
    </div>
    <!--container for the content-->
    <div class="content-container">
        organization name
        <div>
            <asp:TextBox ID="tb_orgname" runat="server" CssClass="text-boxs" Width="100%" Enabled="false"></asp:TextBox>
        </div>
        logo
        <div>
            <asp:Image ID="img_logo" runat="server" CssClass="img-style"/>
        </div>
        organization acronym
        <div>
            <asp:TextBox ID="tb_acronym" runat="server" CssClass="text-boxs" Width="100%" Enabled="false"></asp:TextBox>
        </div>
        type
        <div>
            <asp:TextBox ID="tb_type" runat="server" CssClass="text-boxs" Width="100%" Enabled="false"></asp:TextBox>
        </div>
        contact
        <div>
            <asp:TextBox ID="tb_contact" runat="server" CssClass="text-boxs" Width="100%" Enabled="false"></asp:TextBox>
        </div>
        mission
        <div>
            <asp:TextBox ID="tb_mission" runat="server" CssClass="text-boxs" Width="100%" Enabled="false" TextMode="MultiLine" Height="120px"></asp:TextBox>
        </div>
        vision
        <div>
            <asp:TextBox ID="tb_vision" runat="server" CssClass="text-boxs" Width="100%" Enabled="false" TextMode="MultiLine" Height="120px" ></asp:TextBox>
        </div>
        college
        <div>
            <asp:TextBox ID="tb_college" runat="server" CssClass="text-boxs" Width="100%" Enabled="false"></asp:TextBox>
        </div>
        adviser employee number
        <div>
            <asp:TextBox ID="tb_adviser" runat="server" CssClass="text-boxs" Width="100%" Enabled="false"></asp:TextBox>
        </div>
        vice-president employee number
        <div>
            <asp:TextBox ID="tb_vice" runat="server" CssClass="text-boxs" Width="100%" Enabled="false"></asp:TextBox>
        </div>
        secretary
        <div>
            <asp:TextBox ID="tb_secretary" runat="server" CssClass="text-boxs" Width="100%" Enabled="false"></asp:TextBox>
        </div>
        treasurer
        <div>
            <asp:TextBox ID="tb_treasurer" runat="server" CssClass="text-boxs" Width="100%" Enabled="false"></asp:TextBox>
        </div>
        Members
        <div style="margin-top: 30px; margin-bottom: 40px">
            <asp:Repeater ID="member_lists" runat="server">
                <ItemTemplate>
                    <div style="margin-left: 30px">
                        <asp:Label ID="member_name" runat="server" Text=""><%# Eval("MemberName")%></asp:Label>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <hr style="color: #1C3A63" />
    <!--container for buttons-->
    <div class="btn-container">
        <div>
            <asp:Button ID="Btn_accept" runat="server" Text="Accept" CssClass="accept-btn" />
        </div>
        <div>
            <asp:Button ID="Btn_reject" runat="server" Text="Reject" CssClass="reject-btn" />
        </div>
    </div>
</asp:Content>
