<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/UserView.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="MalayanEventHub.Layouts.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container">
        <div class="first-row">
            <asp:Image class="image" id="img_event" runat="server" ImageUrl="~/imgs/coverExample.jpg"></asp:Image>
        </div>

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
                <button class="button" type="button">Register</button>
            </div>
        </div>
        <div><hr class="hr"></div>
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
    </section>
</asp:Content>
