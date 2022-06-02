<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/Common/Organizer/OrganizationView.master" AutoEventWireup="true" CodeBehind="OrgEvents.aspx.cs" Inherits="MalayanEventHub.Pages.Organizer.OrgEvents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
    <link rel="stylesheet" href="../../Styles/MasterStyleSheet.css" />
    <link rel="stylesheet" href="../../Styles/Event_Organization_Headers.css" />
    <link rel="stylesheet" href="../../Styles/EventsPage.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <main>
        <section class="details">
            <p class="header">My Organization's Events</p>
            <div class="filter-container">
                <div class="filter">
                    <p class="filter-var">Target College:</p>
                    <asp:DropDownList ID="ddl_college" runat="server" CssClass="filter-ddl" AutoPostBack="True" OnSelectedIndexChanged="ddl_college_SelectedIndexChanged" ViewStateMode="Enabled">
                        <asp:ListItem>SHS</asp:ListItem>
                        <asp:ListItem>CAS</asp:ListItem>
                        <asp:ListItem>CCIS</asp:ListItem>
                        <asp:ListItem>ETYCB</asp:ListItem>
                        <asp:ListItem>MITL</asp:ListItem>
                        <asp:ListItem>CMET</asp:ListItem>
                         <asp:ListItem Selected="True">All</asp:ListItem>
                    </asp:DropDownList>

                </div>
                <div class="filter">
                    <p class="filter-var">Date:</p>

                    <asp:DropDownList ID="ddl_date" runat="server" CssClass="filter-ddl" AutoPostBack="True" OnSelectedIndexChanged="ddl_date_SelectedIndexChanged" ViewStateMode="Enabled">
                        <asp:ListItem Selected="True">All</asp:ListItem>
                        <asp:ListItem >Today</asp:ListItem>
                        <asp:ListItem >This Week</asp:ListItem>
                        <asp:ListItem>This Month</asp:ListItem>
                    </asp:DropDownList>

                </div>
                <div class="filter">
                    <p class="filter-var">Status:</p>

                    <asp:DropDownList ID="ddl_status" runat="server" CssClass="filter-ddl" AutoPostBack="True" OnSelectedIndexChanged="ddl_status_SelectedIndexChanged" ViewStateMode="Enabled">
                        <asp:ListItem >Active</asp:ListItem>
                        <asp:ListItem Selected="True">Pending</asp:ListItem>
                        <asp:ListItem>Rejected</asp:ListItem>
                        <asp:ListItem>Deleted</asp:ListItem>
                    </asp:DropDownList>

                </div>
                <div class="filter">
                  <asp:Button ID="btn_create_event" CssClass="main-button" runat="server" Text="Create Event" OnClick="btn_create_event_Click"/>
                </div>

            </div>
        </section>
        <section class="general-container">
            <asp:Repeater ID="EventsRepeater" runat="server">
                <ItemTemplate>
                    <div class="event-card">
                        <asp:Image CssClass="event-image" ID="img_event" runat="server" ImageUrl='<%# Eval("EventImageURL") %>' />
                        <div class="event-details">
                            <asp:Label CssClass="event-title" ID="lbl_event_title" runat="server" Text='<%#Eval("EventTitle")%>'></asp:Label>
                            <asp:Label CssClass="event-subtitle" ID="lbl_event_date" runat="server" Text='<%#Eval("EventDate")%>'></asp:Label>
                            <asp:Label CssClass="event-subtitle" ID="lbl_event_venue" runat="server" Text='<%#Eval("EventVenue")%>'></asp:Label>
                            <asp:Label CssClass="event-org" ID="lbl_event_organization" runat="server" Text='<%#Eval("EventOrganizer")%>'></asp:Label>
                        </div>
                        <asp:HyperLink CssClass="link-wrap" ID="hl_event_page_link" runat="server" NavigateUrl='<%#Eval("EventURL")%>' Text=" "></asp:HyperLink>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </section>
    </main>
</asp:Content>
