<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/Common/Admin/OrganizationView.master" AutoEventWireup="true" CodeBehind="EventRequests.aspx.cs" Inherits="MalayanEventHub.Layouts.Common.Admin.EventRequests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
    <style>
        .header{
            font-size:1.6em;
            font-weight:300;
            margin-bottom:1em;
        }
    </style>
    <link rel="stylesheet" href="../../Styles/Event_Violation_Card.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main>
        <p class="header">Event Requests</p>
        <section class="event-requests-container">
            <asp:Repeater ID="EventRequestsRepeater" runat="server">
            <ItemTemplate>
                <div class="card">
                    <asp:Label CssClass="date-short" ID="lbl_date_short" runat="server" Text='<%# Eval("ShortDate")  %>'></asp:Label>
                    <asp:Image CssClass="image" ID="Image1" runat="server" ImageUrl='<%#Eval("EventImageURL") %>'/>
                    <div class="details">
                        <asp:Label CssClass="title" ID="lbl_title" runat="server" Text='<%# Eval("EventTitle")  %>'></asp:Label>
                        <asp:Label CssClass="subtitle" ID="lbl_date" runat="server" Text='<%# Eval("EventDate")  %>'></asp:Label>
                        <asp:Label CssClass="subtitle" ID="lbl_link" runat="server" Text='<%# Eval("EventVenue")  %>'></asp:Label>
                        <asp:Label CssClass="subtitle2" ID="lbl_org" runat="server" Text='<%# Eval("EventOrganizer")  %>'></asp:Label>
                    </div>
                    <asp:HyperLink CssClass="link-card" ID="hl_event_page_link" runat="server"  NavigateUrl='<%#Eval("EventURL")%>'></asp:HyperLink>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        </section>
    </main>
</asp:Content>
