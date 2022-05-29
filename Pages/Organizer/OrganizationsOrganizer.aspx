<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/OrganizerView.Master" AutoEventWireup="true" CodeBehind="OrganizationsOrganizer.aspx.cs" Inherits="MalayanEventHub.Layouts.OrganizationsOrganizer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Styles/Organizer/organizations-organizer.css" rel="stylesheet" />
    <link rel="stylesheet" href="../../Styles/Event_Organization_Headers.css" />
    <link rel="stylesheet" href="../../Styles/EventsPage.css" />
    <link rel="stylesheet" href="../../styles/masterstylesheet.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <section class="details">
            <p class="header">My Organizations</p>
            <div class="filter-container">
                <div class="filter">
                    <p class="filter-var">Type:</p>

                    <asp:DropDownList ID="ddl_type" runat="server" CssClass="filter-ddl">
                        <asp:ListItem Selected="True">Choose</asp:ListItem>
                        <asp:ListItem>Academic</asp:ListItem>
                        <asp:ListItem>Non-Academic</asp:ListItem>
                    </asp:DropDownList>

                </div>
                <div class="filter">
                    <p class="filter-var">College:</p>
                    <asp:DropDownList ID="ddl_college" runat="server" CssClass="filter-ddl">
                        <asp:ListItem Selected="True">Choose</asp:ListItem>
                        <asp:ListItem>SHS</asp:ListItem>
                        <asp:ListItem>CAS</asp:ListItem>
                        <asp:ListItem>CCIS</asp:ListItem>
                        <asp:ListItem>ETYCB</asp:ListItem>
                        <asp:ListItem>MITL</asp:ListItem>
                        <asp:ListItem>CMET</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="filter">
                    <p class="filter-var">Status:</p>
                    <asp:DropDownList ID="ddl_Status" runat="server" CssClass="filter-ddl">
                        <asp:ListItem Selected="True">Choose</asp:ListItem>
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>Pending</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="filter" style="margin-left:10px">
                    <asp:Button ID="btnRegister" runat="server" Text="Register Organization" OnClick="btnRegister_Click"/>
                </div>
            </div>
        </section>
        <section class="general-container">
            <asp:Repeater ID="OrganizationsRepeater" runat="server">
                <ItemTemplate>
                    <div class="organization-card">
                        <asp:Image ID="img_Logo" runat="server" ImageUrl="~/Images/mcl_logo.png" CssClass="img"/>
                        <div class="info">
                            <asp:LinkButton ID="btn_Details" runat="server" CssClass="btn">DETAILS</asp:LinkButton>
                            <asp:LinkButton ID="btn_CreateEvent" runat="server" CssClass="btn">CREATE EVENT</asp:LinkButton>
                            <asp:LinkButton ID="btn_ViewEvent" runat="server" CssClass="btn">VIEW EVENT</asp:LinkButton>
                            <asp:LinkButton ID="btn_Violations" runat="server" CssClass="btn">VIOLATIONS</asp:LinkButton>
                            
                        </div>
                        <div class="name">
                            <asp:Label ID="lbl_Name" runat="server" Text="Organization Name" Font-Underline="false"></asp:Label>
                        </div>
                        <div class="sub-name">
                            <asp:Label ID="lbl_Type" runat="server" Text="Type" Font-Underline="false"></asp:Label>
                            |
                            <asp:Label ID="lbl_College" runat="server" Text="College" Font-Underline="false"></asp:Label>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </section>
    </main>
</asp:Content>