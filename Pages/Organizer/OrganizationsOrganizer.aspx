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
                        <asp:ListItem>Academic</asp:ListItem>
                        <asp:ListItem>Non-Academic</asp:ListItem>
                    </asp:DropDownList>

                </div>
                <div class="filter">
                    <p class="filter-var">College:</p>

                    <asp:DropDownList ID="ddl_college" runat="server" CssClass="filter-ddl">
                        <asp:ListItem>SHS</asp:ListItem>
                        <asp:ListItem>CAS</asp:ListItem>
                        <asp:ListItem>CCIS</asp:ListItem>
                        <asp:ListItem>ETYCB</asp:ListItem>
                        <asp:ListItem>MITL</asp:ListItem>
                        <asp:ListItem>CMET</asp:ListItem>
                    </asp:DropDownList>

                </div>

                <div class="filter">
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


<%--    <div class="wrapper">
        <div id="title">My Organizations</div>
        <div class="controls">
            <div>
                <asp:Label ID="lbl_Type" runat="server" Text="Type:"></asp:Label>
                <asp:DropDownList ID="ddlType" runat="server" Width="120px">
                    <asp:ListItem>Academic</asp:ListItem>
                    <asp:ListItem>Non-Academic</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div>
                <asp:Label ID="lbl_College" runat="server" Text="College:"></asp:Label>
                <asp:DropDownList ID="ddl_College" runat="server" Width="80px">
                    <asp:ListItem>CAS</asp:ListItem>
                    <asp:ListItem>CCIS</asp:ListItem>
                    <asp:ListItem>ETYCB</asp:ListItem>
                    <asp:ListItem>MITL</asp:ListItem>
                    <asp:ListItem>CMET</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div>
                <asp:Button ID="btn_Register" runat="server" Text="Register Organization" />
            </div>
        </div>

        <asp:DataList ID="dl_Organizations" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" CellSpacing="20">
            <ItemTemplate>
                <div class="card">
                    <img src="../../Images/mcl_logo.png" />
                    <div class="info">
                        <a href="#" class="btn">DETAILS</a>
                        <a href="#" class="btn">CREATE EVENT</a>
                        <a href="#" class="btn">VIEW EVENTS</a>
                        <a href="#" class="btn">VIOLATIONS</a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>--%>
</asp:Content>