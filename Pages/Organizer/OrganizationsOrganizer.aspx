<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/OrganizerView.Master" AutoEventWireup="true" CodeBehind="OrganizationsOrganizer.aspx.cs" Inherits="MalayanEventHub.Layouts.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Styles/Organizer/organizations-organizer.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper">
        <div id="title">My Organizations</div>
        <div class="controls">
            <div>
                <asp:Label ID="lblType" runat="server" Text="Type:"></asp:Label>
                <asp:DropDownList ID="ddlType" runat="server" Width="120px">
                    <asp:ListItem>Academic</asp:ListItem>
                    <asp:ListItem>Non-Academic</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div>
                <asp:Label ID="lblCollege" runat="server" Text="College:"></asp:Label>
                <asp:DropDownList ID="ddlCollege" runat="server" Width="80px">
                    <asp:ListItem>CAS</asp:ListItem>
                    <asp:ListItem>CCIS</asp:ListItem>
                    <asp:ListItem>ETYCB</asp:ListItem>
                    <asp:ListItem>MITL</asp:ListItem>
                    <asp:ListItem>CMET</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div>
                <asp:Button ID="btnRegister" runat="server" Text="Register Organization" />
            </div>
        </div>
    </div>

    <%-- DataList of Organizations --%>
    <asp:DataList ID="dlOrganizations" runat="server" DataSourceID="Organizations">
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
<asp:SqlDataSource ID="Organizations" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [OrganizationTBL]"></asp:SqlDataSource>
</asp:Content>