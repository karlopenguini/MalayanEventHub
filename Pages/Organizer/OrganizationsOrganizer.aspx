<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/OrganizerView.Master" AutoEventWireup="true" CodeBehind="OrganizationsOrganizer.aspx.cs" Inherits="MalayanEventHub.Layouts.OrganizationsOrganizer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Styles/Organizer/organizations-organizer.css" rel="stylesheet" />
    <link rel="stylesheet" href="../../Styles/Event_Organization_Headers.css" />
    <link rel="stylesheet" href="../../Styles/EventsPage.css" />
    <link rel="stylesheet" href="../../styles/masterstylesheet.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <section class="details">
            <p class="header">My Organizations</p>
            <div class="filter-container">
                <div class="filter">
                    <asp:UpdatePanel ID="up_Type" runat="server">
                        <ContentTemplate>
                            <p class="filter-var">Type:</p>
                            <asp:DropDownList ID="ddl_type" runat="server" CssClass="filter-ddl" AutoPostBack="True" OnSelectedIndexChanged="ddl_type_SelectedIndexChanged">
                                <asp:ListItem Selected="True">Choose</asp:ListItem>
                                <asp:ListItem>Academic</asp:ListItem>
                                <asp:ListItem>Non-Academic</asp:ListItem>
                            </asp:DropDownList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="filter">
                    <asp:UpdatePanel ID="up_College" runat="server">
                        <ContentTemplate>
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
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="filter">
                    <asp:UpdatePanel ID="up_Status" runat="server">
                        <ContentTemplate>
                            <p class="filter-var">Status:</p>
                            <asp:DropDownList ID="ddl_Status" runat="server" CssClass="filter-ddl" AutoPostBack="True" OnSelectedIndexChanged="ddl_Status_SelectedIndexChanged">
                                <asp:ListItem Selected="True">Choose</asp:ListItem>
                                <asp:ListItem>Active</asp:ListItem>
                                <asp:ListItem>Pending</asp:ListItem>
                            </asp:DropDownList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </div>

                <div class="filter" style="margin-left: 10px">
                    <asp:Button ID="btnRegister" runat="server" Text="Register Organization" OnClick="btnRegister_Click" />
                </div>
            </div>
        </section>
        <section class="general-container">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:Repeater ID="OrganizationsRepeater" runat="server">
                        <ItemTemplate>
                            <div class="organization-card">
                                <asp:Image ID="img_Logo" runat="server" ImageUrl='<%#Eval("OrganizationLogo") != null ? "~/Images/mcl_logo.png"  : "data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("OrganizationLogo"))%>' CssClass="img" />
                                <div class="info">
                                    <asp:LinkButton ID="btn_Details" runat="server" CssClass="btn" PostBackUrl='<%# Eval("OrganizationURL") %>'>DETAILS</asp:LinkButton>
                                    <asp:LinkButton ID="btn_CreateEvent" runat="server" CssClass="btn">CREATE EVENT</asp:LinkButton>
                                    <asp:LinkButton ID="btn_ViewEvent" runat="server" CssClass="btn">VIEW EVENT</asp:LinkButton>
                                    <asp:LinkButton ID="btn_Violations" runat="server" CssClass="btn">VIOLATIONS</asp:LinkButton>
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
