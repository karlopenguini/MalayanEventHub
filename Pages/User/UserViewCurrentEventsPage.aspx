<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/UserView.Master" AutoEventWireup="true" CodeBehind="UserViewCurrentEventsPage.aspx.cs" Inherits="MalayanEventHub.UserViewCurrentEventsPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Styles/Event_Organization_Headers.css" rel="stylesheet" />
    <link href="../../Styles/EventsPage.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <section class="details">
            <p class="header">Active Academic Events in <span class="selected-college">CCIS</span> This Week</p>
            <div class="filter-container">
                <div class="filter">
                    <p class="filter-var">Type:</p>
                    <asp:DropDownList ID="ddl_type" runat="server" CssClass="filter-ddl" AutoPostBack="True" OnSelectedIndexChanged="ddl_type_SelectedIndexChanged" ViewStateMode="Enabled">
                        <asp:ListItem Selected="True">Academic</asp:ListItem>
                        <asp:ListItem>Non-Academic</asp:ListItem>
                        <asp:ListItem>All</asp:ListItem>
                    </asp:DropDownList>
                    
                </div>
                <div class="filter">
                    <p class="filter-var">College:</p>

                    <asp:DropDownList ID="ddl_college" runat="server" CssClass="filter-ddl" AutoPostBack="True" OnSelectedIndexChanged="ddl_college_SelectedIndexChanged" ViewStateMode="Enabled">
                        <asp:ListItem>SHS</asp:ListItem>
                        <asp:ListItem>CAS</asp:ListItem>
                        <asp:ListItem Selected="True">CCIS</asp:ListItem>
                        <asp:ListItem>ETYCB</asp:ListItem>
                        <asp:ListItem>MITL</asp:ListItem>
                        <asp:ListItem>CMET</asp:ListItem>
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
