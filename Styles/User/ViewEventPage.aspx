<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/UserView.Master" AutoEventWireup="true" CodeBehind="ViewEventPage.aspx.cs" Inherits="MalayanEventHub.Layouts.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Styles/User/ViewEventPage.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <section class="container">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <%--first row containing the image--%>
        <div class="first-row">
            <asp:Image class="image" id="img_event" runat="server" ImageUrl="~/Images/dummyImg.jp"></asp:Image>
        </div>

        <%--second row containing the event name, register button, org name and date--%>
        <div class="second-row">
            <div class=details-container>
                <asp:Label id="lbl_title" class="title-label" runat="server" Text="Event Title"></asp:Label>
                <span class="org-label">
                    by&nbsp
                    <asp:Label id="lbl_org" runat="server" Text="Organization"></asp:Label>
                </span>
                <span class="date-label">
                    <asp:Label id="lbl_startDate" runat="server" Text="MM/DD/YY"></asp:Label>
                    -
                    <asp:Label id="lbl_endDate" runat="server" Text="MM/DD/YY"></asp:Label>
                </span>
            </div>
            <div class="register-container">
                <asp:Button CssClass="button" ID="btn_register" runat="server" Text="Register" OnClick="btn_register_Click" />
            </div>
        </div>
        <%--hr to separate--%>
        <div><hr class="hr"></div>

        <%--third row containing the about this event and venue--%>
        <div class="third-row">
            <div class="about-div">
                <label class="aboutAndVenue-label">About this Event</label>
                <p id="p_about" class="par" runat="server">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Animi iusto, dolorem tempora dolore deleniti quas reprehenderit sint, beatae aperiam quod, quasi itaque placeat similique! Quos quas esse praesentium eligendi voluptas!
                A totam harum aperiam iusto itaque voluptatum voluptatem exercitationem repellendus alias placeat, offi est? Repellat dolores ex, perferendis non aliquid aperiam?</p>
            </div>
            <div class="venue-div">
                <label class="aboutAndVenue-label">Venue</label>
                <p id="p_venue" class="par" runat="server">SMX Convention Center, Mall of Asia Complex, Seashell Lane, Pasay, Metro Manila 1300</p>

            </div>
        </div>
    </ContentTemplate>
    </asp:UpdatePanel>
    </section>
</asp:Content>
