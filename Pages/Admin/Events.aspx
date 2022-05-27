﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/AdminView.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="MalayanEventHub.Layouts.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../../Styles/Event_Organization_Headers.css" />
    <link rel="stylesheet" href="../../Styles/EventsPage.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <section class="details">
            <p class="header">Active Academic Events in <span class="selected-college">CCIS</span> This Week</p>
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
                    <p class="filter-var">Date:</p>

                    <asp:DropDownList ID="ddl_date" runat="server" CssClass="filter-ddl">
                        <asp:ListItem>This Week</asp:ListItem>
                        <asp:ListItem>This Month</asp:ListItem>
                    </asp:DropDownList>

                </div>
                <div class="filter">
                    <p class="filter-var">Status:</p>

                    <asp:DropDownList ID="ddl_status" runat="server" CssClass="filter-ddl">
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>Finished</asp:ListItem>
                        <asp:ListItem>Cancelled</asp:ListItem>
                    </asp:DropDownList>

                </div>

            </div>
        </section>
        <section class="events-container">
            <asp:Repeater ID="EventsRepeater" runat="server">
                <ItemTemplate>
                    <div class="event-card">
                        <asp:Image CssClass="event-image" ID="img_event" runat="server" ImageUrl='<%#Eval("EventImageURL")%>' />
                        <div class="event-details">
                            <asp:Label CssClass="event-title" ID="lbl_event_title" runat="server" Text='<%#Eval("EventTitle")%>'></asp:Label>
                            <asp:Label CssClass="event-subtitle" ID="lbl_event_date" runat="server" Text='<%#Eval("EventDate")%>'></asp:Label>
                            <asp:Label CssClass="event-subtitle" ID="lbl_event_venue" runat="server" Text='<%#Eval("EventVenue")%>'></asp:Label>
                            <asp:Label CssClass="event-org" ID="lbl_event_organization" runat="server" Text='<%#Eval("EventOrganizer")%>'></asp:Label>
                            <asp:HyperLink ID="hl_event_page_link" runat="server" NavigateUrl='<%#Eval("EventURL")%>'></asp:HyperLink>
                        </div>

                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </section>
    </main>
</asp:Content>