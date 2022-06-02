<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/SiteLayout.Master"  AutoEventWireup="true" CodeBehind="ViewTickets.aspx.cs" Inherits="MalayanEventHub.ViewTickets" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Styles/User/ViewTickets.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <p class="header">My Tickets</p>
        <section class="event-requests-container">
            <asp:Repeater ID="EventRequestsRepeater" runat="server">
            <ItemTemplate>
                <div class="card">
                    <asp:Label CssClass="date-short" ID="lbl_date_short" runat="server" Text='<%# Eval("ShortDate")  %>'></asp:Label>
                    <asp:Image CssClass="image" style="height:100%;" ID="Image1" runat="server" ImageUrl='<%#Eval("EventImageURL") %>'/>
                    <div class="details">
                        <asp:Label CssClass="title" ID="lbl_title" runat="server" Text='<%# Eval("EventTitle")  %>'></asp:Label>
                        <asp:Label CssClass="subtitle" ID="lbl_date" runat="server" Text='<%# Eval("EventDate")  %>'></asp:Label>
                        <asp:Label CssClass="subtitle" ID="lbl_link" runat="server" Text='<%# Eval("EventVenue")  %>'></asp:Label>
                        <asp:HyperLink CssClass="subtitle" ID="invitationLink" runat="server" Text='<%#"Invitation Link: " + Eval("EventInvitationText")  %>' NavigateUrl='<%# Eval("EventInvitationText")  %>'></asp:HyperLink>
                    </div>
                    <asp:HyperLink CssClass="link-card" ID="hl_event_page_link" runat="server"  NavigateUrl='<%#Eval("EventURL")%>'></asp:HyperLink>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        </section>
    </main>
</asp:Content>



