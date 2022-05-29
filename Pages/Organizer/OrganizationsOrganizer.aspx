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
                    <img src="../../Images/mcl_logo.png" />
                        <div class="info">
                            <a href="#" class="btn">DETAILS</a>
                            <a href="#" class="btn">CREATE EVENT</a>
                            <a href="#" class="btn">VIEW EVENTS</a>
                            <a href="#" class="btn">VIOLATIONS</a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </section>
    </main>
</asp:Content>