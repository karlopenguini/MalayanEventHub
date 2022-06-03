<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/SiteLayout.Master"  AutoEventWireup="true" CodeBehind="OrganizationsOrganizer.aspx.cs" Inherits="MalayanEventHub.Layouts.OrganizationsOrganizer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Styles/Organizer/organizations-organizer.css" rel="stylesheet" />
    <link rel="stylesheet" href="../../Styles/Event_Organization_Headers.css" />
    <link rel="stylesheet" href="../../Styles/EventsPage.css" />
    <link rel="stylesheet" href="../../styles/masterstylesheet.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <asp:ScriptManager ID="sm_Organizers" runat="server"></asp:ScriptManager>
        <section class="details">
            <p class="header">My Organizations</p>
            <div class="filter-container">
                <div class="filter" style="margin-left: 10px">
                    <asp:Button ID="btnRegister" runat="server" Text="Register Organization" OnClick="btnRegister_Click" />
                </div>
            </div>
            <div class="filter-container">
                <asp:UpdatePanel ID="up_OrganizerType" runat="server">
                    <ContentTemplate>
                        <div class="filter">
                            <p class="filter-var">Type:</p>
                            <asp:DropDownList ID="ddl_type" runat="server" CssClass="filter-ddl" AutoPostBack="True" OnSelectedIndexChanged="ddl_type_SelectedIndexChanged">
                                <asp:ListItem Selected="True">All</asp:ListItem>
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
                                <asp:ListItem>SHS</asp:ListItem>
                                <asp:ListItem>CAS</asp:ListItem>
                                <asp:ListItem Selected="True">CCIS</asp:ListItem>
                                <asp:ListItem>ETYCB</asp:ListItem>
                                <asp:ListItem>MITL</asp:ListItem>
                                <asp:ListItem>CMET</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="up_OrganizerRole" runat="server">
                    <ContentTemplate>
                        <div class="filter">
                            <p class="filter-var">Role:</p>
                            <asp:DropDownList ID="ddl_Role" runat="server" CssClass="filter-ddl" AutoPostBack="True" OnSelectedIndexChanged="ddl_Role_SelectedIndexChanged">
                                <asp:ListItem Value="All" Selected="True">All</asp:ListItem>
                                <asp:ListItem>Member</asp:ListItem>
                                <asp:ListItem Value="President">President</asp:ListItem>
                                <asp:ListItem Value="Vice President">Vice President</asp:ListItem>
                                <asp:ListItem Value="Secretary">Secretary</asp:ListItem>
                                <asp:ListItem Value="Treasurer">Treasurer</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="up_OrganizerStatus" runat="server">
                    <ContentTemplate>
                        <div class="filter">
                            <p class="filter-var">Status:</p>
                            <asp:DropDownList ID="ddl_Status" runat="server" CssClass="filter-ddl" AutoPostBack="True" OnSelectedIndexChanged="ddl_Status_SelectedIndexChanged">
                                <asp:ListItem>Choose</asp:ListItem>
                                <asp:ListItem Selected="True">Active</asp:ListItem>
                                <asp:ListItem>Inactive</asp:ListItem>
                                <asp:ListItem>Pending</asp:ListItem>
                                <asp:ListItem>Rejected</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>

            </div>
        </section>
        <section class="general-container">
            <asp:UpdatePanel ID="up_OrganizerRepeater" runat="server">
                <ContentTemplate>
                    <asp:Repeater ID="OrganizationsRepeater" runat="server" OnItemDataBound="Organizations_ItemDataBound">
                        <ItemTemplate>
                            <div class="organization-card">
                                <asp:Image ID="img_Logo" runat="server" ImageUrl='<%# Eval("OrganizationLogo") %>' CssClass="img" />
                                <div class="info">
                                    <asp:LinkButton ID="btn_Details" runat="server" CssClass="btn" PostBackUrl='<%# $"~/Pages/Organizer/OrgDetailsOrganizer.aspx{Eval("OrganizationUrl")}" %>'>DETAILS</asp:LinkButton>
                                    <asp:LinkButton ID="btn_CreateEvent" runat="server" CssClass="btn" PostBackUrl='<%# $"~/Pages/Organizer/OrgCreateEvent.aspx{Eval("OrganizationUrl")}"  %>'>CREATE EVENT</asp:LinkButton>
                                    <asp:LinkButton ID="btn_ViewEvent" runat="server" CssClass="btn" PostBackUrl='<%# $"~/Pages/Organizer/OrgEvents.aspx{Eval("OrganizationUrl")}" %>'>VIEW EVENTS</asp:LinkButton>
                                </div>
                                <div class="label-container">
                                    <div class="name">
                                        <asp:Label ID="lbl_Name" runat="server" Text='<%# Eval("OrganizationName") %>' Font-Underline="false"></asp:Label>
                                    </div>
                                    <div class="sub-name">
                                        <asp:Label ID="lbl_Type" runat="server" Text='<%# Eval("OrganizationType") %>' Font-Underline="false"></asp:Label>
                                        |
                                        <asp:Label ID="lbl_College" runat="server" Text='<%# Eval("OrganizationCollege") %>' Font-Underline="false"></asp:Label>
                                        <asp:Label ID="lbl_Status" runat="server" Text='<%# Eval("OrganizationStatus") %>' Visible="False"></asp:Label>
                                        <asp:Label ID="lbl_Role" runat="server" Text='<%# Eval("OrganizationRole") %>' Visible="False"></asp:Label>
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
