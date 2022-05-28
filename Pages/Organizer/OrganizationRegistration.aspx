<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/OrganizerView.Master" AutoEventWireup="true" CodeBehind="OrganizationRegistration.aspx.cs" Inherits="MalayanEventHub.Layouts.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Styles/Organizer/organization-registration.css" rel="stylesheet" />
    <link href="../../Styles/MasterStyleSheet.css" rel="stylesheet" />
    <script type="text/javascript">
        function toggleFormSections(e) {
        var objectCaller = document.getElementById(e.id + "-fields");
        var objectCallerIndicator = document.getElementById(e.id + "-indicator");
 
        //set action
        objectCaller.classList.toggle("hide");
        if (objectCallerIndicator.innerText == "+") {
        objectCallerIndicator.innerText = "-";
        }
        else if (objectCallerIndicator.innerText == "-") {
        objectCallerIndicator.innerText = "+";
        }
 
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-body">
        <div class="wrapper">
            <p class="header">Register</p>
            <div class="form">
                <div>
                    <asp:Label ID="lbl_Name" runat="server" Text="Organization Name"></asp:Label>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="*" ControlToValidate="tb_Name" CssClass="validator"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:TextBox ID="tb_Name" runat="server" Width="500px" CssClass="text-boxs"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="lbl_Logo" runat="server" Text="Logo"></asp:Label>
                    <asp:RequiredFieldValidator ID="rfvLogo" runat="server" ErrorMessage="*" ControlToValidate="tb_Logo" CssClass="validator"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:TextBox ID="tb_Logo" runat="server" Width="500px" CssClass="text-boxs"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="lbl_Acronym" runat="server" Text="Organization Acronym"></asp:Label>
                    <asp:RequiredFieldValidator ID="rfvAcronym" runat="server" ErrorMessage="*" ControlToValidate="tb_Acronym" CssClass="validator"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:TextBox ID="tb_Acronym" runat="server" Width="500px" CssClass="text-boxs"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="lbl_Type" runat="server" Text="Type"></asp:Label>
                    <asp:RequiredFieldValidator ID="rfvType" runat="server" ErrorMessage="*" ControlToValidate="tb_Type" CssClass="validator"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:TextBox ID="tb_Type" runat="server" Width="500px" CssClass="text-boxs"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="lbl_Contact" runat="server" Text="Contact"></asp:Label>
                    <asp:RequiredFieldValidator ID="rfvContact" runat="server" ErrorMessage="*" ControlToValidate="tb_Contact" CssClass="validator"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:TextBox ID="tb_Contact" runat="server" Width="500px" CssClass="text-boxs"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="lbl_Mission" runat="server" Text="Mission"></asp:Label>
                    <asp:RequiredFieldValidator ID="rfvMission" runat="server" ErrorMessage="*" ControlToValidate="tb_Mission" CssClass="validator"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:TextBox ID="tb_Mission" runat="server" Width="500px" Height="120px" CssClass="text-boxs" style="overflow:auto; resize:none; " TextMode="MultiLine"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="lbl_Vision" runat="server" Text="Vision"></asp:Label>
                    <asp:RequiredFieldValidator ID="rfvVision" runat="server" ErrorMessage="*" ControlToValidate="tb_Vision" CssClass="validator"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:TextBox ID="tb_Vision" runat="server" Width="500px" Height="120px" CssClass="text-boxs" class ="textbox" style="overflow:auto; resize:none;" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="lbl_College" runat="server" Text="College"></asp:Label>
                    <asp:RequiredFieldValidator ID="rfvCollege" runat="server" ErrorMessage="*" ControlToValidate="ddl_College" CssClass="validator" InitialValue="Choose"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:DropDownList ID="ddl_College" runat="server" Width ="100px" CssClass="dropdown-lists">
                        <asp:ListItem Selected="True">Choose</asp:ListItem>
                        <asp:ListItem>CAS</asp:ListItem>
                        <asp:ListItem>CCIS</asp:ListItem>
                        <asp:ListItem>MITL</asp:ListItem>
                        <asp:ListItem>CMET</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div>
                    <asp:Label ID="lbl_AdviserNum" runat="server" Text="Adviser Employee Number"></asp:Label>
                    <asp:RequiredFieldValidator ID="rfvAdviserNum" runat="server" ErrorMessage="*" ControlToValidate="tb_AdviserNum" CssClass="validator"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:TextBox ID="tb_AdviserNum" runat="server" Width="500px" CssClass="text-boxs"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="lbl_VicePresNum" runat="server" Text="Vice President Student Number"></asp:Label>
                    <asp:RequiredFieldValidator ID="rfvVicePresNum" runat="server" ErrorMessage="*" ControlToValidate="tb_VicePresNum" CssClass="validator"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:TextBox ID="tb_VicePresNum" runat="server" Width="500px" CssClass="text-boxs"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="lbl_Members" runat="server" Text="Members"></asp:Label>
                    <asp:RequiredFieldValidator ID="rfvMembers" runat="server" ErrorMessage="*" ControlToValidate="tb_Members" CssClass="validator"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:TextBox ID="tb_Members" runat="server" Width="500px" Height="120px" CssClass="text-boxs" style="overflow:auto; resize:none;" TextMode="MultiLine" ></asp:TextBox>
                </div>
                <div style = "margin: 15px auto">
                    <asp:Button ID="btn_Register" runat="server" Text="Register" CssClass="main-button"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
