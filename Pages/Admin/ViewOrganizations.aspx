<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/AdminView.Master" AutoEventWireup="true" CodeBehind="ViewOrganizations.aspx.cs" Inherits="MalayanEventHub.Layouts.ViewOrganizations" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
    <link href="../../Styles/Admin/StyleSheetViewOrgs.css" rel="stylesheet" />
    <link rel="stylesheet" href="../../Styles/Event_Organization_Headers.css" />
    <link rel="stylesheet" href="../../Styles/EventsPage.css" />
    <link rel="stylesheet" href="../../styles/masterstylesheet.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <main>
        <asp:ScriptManager ID="sm_Organizers" runat="server"></asp:ScriptManager>
        <section class="details">
            <p class="header">Student Organizations</p>
            <div class="filter-container">
                <asp:UpdatePanel ID="up_OrganizerType" runat="server">
                    <ContentTemplate>
                        <div class="filter">
                            <p class="filter-var">Type:</p>
                            <asp:DropDownList ID="ddl_type" runat="server" CssClass="filter-ddl" AutoPostBack="True" OnSelectedIndexChanged="ddl_type_SelectedIndexChanged">
                                <asp:ListItem Selected="True">Choose</asp:ListItem>
                                <asp:ListItem>Academic</asp:ListItem>
                                <asp:ListItem>Non-Academic</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="up_OrganizerCollege" runat="server">
                    <ContentTemplate>
                        <div class="filter">
                            <p class="filter-var">College:</p>
                            <asp:DropDownList ID="ddl_college" runat="server" CssClass="filter-ddl" AutoPostBack="True" OnSelectedIndexChanged="ddl_college_SelectedIndexChanged">
                                <asp:ListItem Selected="True">Choose</asp:ListItem>
                                <asp:ListItem>SHS</asp:ListItem>
                                <asp:ListItem>CAS</asp:ListItem>
                                <asp:ListItem>CCIS</asp:ListItem>
                                <asp:ListItem>ETYCB</asp:ListItem>
                                <asp:ListItem>MITL</asp:ListItem>
                                <asp:ListItem>CMET</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </section>
        <section class="general-container">
            <asp:UpdatePanel ID="up_OrganizerRepeater" runat="server">
                <ContentTemplate>
                    <asp:Repeater ID="OrganizationsRepeater" runat="server">
                        <ItemTemplate>
                            <div class="organization-card">
                                <asp:Image ID="img_Logo" runat="server" ImageUrl='<%#Eval("OrganizationLogo") != null ? "~/Images/mcl_logo.png"  : "data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("OrganizationLogo"))%>' CssClass="img" />
                                <div class="info">
                                    <asp:LinkButton ID="btn_Details" runat="server" CssClass="btn" PostBackUrl='<%# "~/Pages/Admin/OrgDetails.aspx?" + Eval("OrganizationURL") %>'>DETAILS</asp:LinkButton>
                                    <asp:LinkButton ID="btn_Requests" runat="server" CssClass="btn" PostBackUrl='<%# "~/Pages/Admin/OrganizationRequestView.aspx?" + Eval("OrganizationURL") %>'>REQUESTS</asp:LinkButton>
                                    <asp:LinkButton ID="btn_Violations" runat="server" CssClass="btn" PostBackUrl='<%# "~/Pages/Admin/OrganizationViolation.aspx?" + Eval("OrganizationURL") %>'>VIOLATIONS</asp:LinkButton>
                                </div>
                                <div class="label-container">
                                    <div class="name">
                                        <asp:Label ID="lbl_Name" runat="server" Text='<%# Eval("OrganizationName") %>' Font-Underline="false"></asp:Label>
                                    </div>
                                    <div class="sub-name">
                                        <asp:Label ID="lbl_Type" runat="server" Text='<%# Eval("OrganizationType") %>' Font-Underline="false"></asp:Label>
                                        |
                                        <asp:Label ID="lbl_College" runat="server" Text='<%# Eval("OrganizationCollege") %>' Font-Underline="false"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </ContentTemplate>
            </asp:UpdatePanel>
        </section>
    </main>
</asp:Content>
