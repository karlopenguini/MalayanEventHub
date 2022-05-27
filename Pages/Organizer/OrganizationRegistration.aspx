<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/OrganizerView.Master" AutoEventWireup="true" CodeBehind="OrganizationRegistration.aspx.cs" Inherits="MalayanEventHub.Layouts.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Styles/Organizer/organization-registration.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper">
        <div id="title">Register Organization</div>
        <div class="form">
            <div>
                <asp:Label ID="lbl_Name" runat="server" Text="Organization Name"></asp:Label>
                <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="*" ControlToValidate="txtName" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:TextBox ID="tb_Name" runat="server" Width="500px" class ="textbox"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lbl_Logo" runat="server" Text="Logo"></asp:Label>
                <asp:RequiredFieldValidator ID="rfvLogo" runat="server" ErrorMessage="*" ControlToValidate="txtLogo" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:TextBox ID="tb_Logo" runat="server" Width="500px" class ="textbox"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lbl_Acronym" runat="server" Text="Organization Acronym"></asp:Label>
                <asp:RequiredFieldValidator ID="rfvAcronym" runat="server" ErrorMessage="*" ControlToValidate="txtAcronym" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:TextBox ID="tb_Acronym" runat="server" Width="500px" class ="textbox"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lbl_Type" runat="server" Text="Type"></asp:Label>
                <asp:RequiredFieldValidator ID="rfvType" runat="server" ErrorMessage="*" ControlToValidate="txtType" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:TextBox ID="tb_Type" runat="server" Width="500px" class ="textbox"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lbl_Contact" runat="server" Text="Contact"></asp:Label>
                <asp:RequiredFieldValidator ID="rfvContact" runat="server" ErrorMessage="*" ControlToValidate="txtContact" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:TextBox ID="tb_Contact" runat="server" Width="500px" class ="textbox"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lbl_Mission" runat="server" Text="Mission"></asp:Label>
                <asp:RequiredFieldValidator ID="rfvMission" runat="server" ErrorMessage="*" ControlToValidate="txtMission" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:TextBox ID="tb_Mission" runat="server" Width="500px" Height="120px" class ="textbox" style="overflow:auto; resize:none; " TextMode="MultiLine"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lbl_Vision" runat="server" Text="Vision"></asp:Label>
                <asp:RequiredFieldValidator ID="rfvVision" runat="server" ErrorMessage="*" ControlToValidate="txtVision" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:TextBox ID="tb_Vision" runat="server" Width="500px" Height="120px" class ="textbox" style="overflow:auto; resize:none;" TextMode="MultiLine"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lbl_College" runat="server" Text="College"></asp:Label>
                <asp:RequiredFieldValidator ID="rfvCollege" runat="server" ErrorMessage="*" ControlToValidate="ddlCollege" CssClass="validator" InitialValue="Choose"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:DropDownList ID="ddl_College" runat="server" Width ="100px">
                    <asp:ListItem Selected="True">Choose</asp:ListItem>
                    <asp:ListItem>CAS</asp:ListItem>
                    <asp:ListItem>CCIS</asp:ListItem>
                    <asp:ListItem>MITL</asp:ListItem>
                    <asp:ListItem>CMET</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div>
                <asp:Label ID="lbl_AdviserNum" runat="server" Text="Adviser Employee Number"></asp:Label>
                <asp:RequiredFieldValidator ID="rfvAdviserNum" runat="server" ErrorMessage="*" ControlToValidate="txtAdviserNum" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:TextBox ID="tb_AdviserNum" runat="server" Width="500px" class ="textbox"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lbl_VicePresNum" runat="server" Text="Vice President Student Number"></asp:Label>
                <asp:RequiredFieldValidator ID="rfvVicePresNum" runat="server" ErrorMessage="*" ControlToValidate="txtVicePresNum" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:TextBox ID="tb_VicePresNum" runat="server" Width="500px" class ="textbox"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lbl_Members" runat="server" Text="Members"></asp:Label>
                <asp:RequiredFieldValidator ID="rfvMembers" runat="server" ErrorMessage="*" ControlToValidate="txtMembers" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:TextBox ID="tb_Members" runat="server" Width="500px" Height="120px" class ="textbox" style="overflow:auto; resize:none;" TextMode="MultiLine" ></asp:TextBox>
            </div>
            <di style = "margin: 15px auto">
                <asp:Button ID="btn_Register" runat="server" Text="Register" style="border-radius: 50px; border-width: 1px; border-color: black;"/>
            </di>
        </div>
    </div>
</asp:Content>
