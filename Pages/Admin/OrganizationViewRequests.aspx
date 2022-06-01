<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/AdminView.Master" AutoEventWireup="true" CodeBehind="OrganizationViewRequests.aspx.cs" Inherits="MalayanEventHub.Layouts.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .header{
            font-size:1.6em;
            font-weight:300;
            margin-bottom:1em;
        }
    </style>
    <link href="../../Styles/Admin/StyleSheetOrgViewRequests.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main style="margin-bottom: 80px">
        <p class="header">Organization Requests</p>
        <section class="org-requests-container">
            <asp:Repeater ID="OrganizationRequests" runat="server">
            <ItemTemplate>
                <div class="card">
                    <asp:Label CssClass="org-acronym" ID="lbl_org_acronym" runat="server" Text='<%# Eval("Acronym")  %>'></asp:Label>
                    <div class="details">
                        <asp:Label CssClass="org-name" ID="lbl_org_name" runat="server" Text='<%# Eval("OrganizationName")  %>'></asp:Label>
                        <asp:Label CssClass="subtitle" ID="lbl_type" runat="server" Text='<%# Eval("OrganizationType")  %>'></asp:Label>
                        <asp:Label CssClass="subtitle" ID="lbl_college" runat="server" Text='<%# Eval("OrganizationCollege")  %>'></asp:Label>
                        <asp:Label CssClass="subtitle2" ID="lbl_mission" runat="server" Text='<%# Eval("Mission")  %>'></asp:Label>
                        <asp:Label CssClass="subtitle2" ID="lbl_vision" runat="server" Text='<%# Eval("Vision")  %>'></asp:Label>
                    </div>
                    <asp:HyperLink CssClass="link-card" ID="hl_requests_page_link" runat="server"  NavigateUrl='<%#Eval("EventURL")%>'></asp:HyperLink>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        </section>
    </main>
</asp:Content>
