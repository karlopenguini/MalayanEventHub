<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/OrganizerView.Master" AutoEventWireup="true" CodeBehind="OrganizationRegistration.aspx.cs" Inherits="MalayanEventHub.Layouts.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Styles/Organizer/organization-registration.css" rel="stylesheet" />
    <link href="../../Styles/MasterStyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-body">
        <p class="header">Register Organization</p>
        <div class="form-section">
            <div id="information-section" class="sub-header" onclick="toggleFormSections(this)">
                <p style="width: 90%;">Information</p>
                <p id="information-section-indicator" style="float: right; margin-right:15px;">-</p>
            </div>

            <div id="information-section-fields" class="form-fields">
                <div class="form-field">
                     <p>Name<asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="*" ControlToValidate="tb_Name" CssClass="validator"></asp:RequiredFieldValidator></p>
                     <asp:TextBox ID="tb_Name" runat="server" CssClass="text-boxs"></asp:TextBox>
                </div>
                <div class="form-field">
                     <p>Logo<asp:RequiredFieldValidator ID="rfvLogo" runat="server" ErrorMessage="*" ControlToValidate="tb_Logo" CssClass="validator"></asp:RequiredFieldValidator></p>
                     <asp:TextBox ID="tb_Logo" runat="server" CssClass="text-boxs"></asp:TextBox>
                </div>
                <div class="form-field">
                     <p>Acronym<asp:RequiredFieldValidator ID="rfv_Acronym" runat="server" ErrorMessage="*" ControlToValidate="tb_Acronym" CssClass="validator"></asp:RequiredFieldValidator></p>
                     <asp:TextBox ID="tb_Acronym" runat="server" CssClass="text-boxs"></asp:TextBox>
                </div>
                <div class="form-field">
                     <p>Type<asp:RequiredFieldValidator ID="rfv_Type" runat="server" ErrorMessage="*" ControlToValidate="ddl_Type" CssClass="validator" InitialValue="Choose"></asp:RequiredFieldValidator></p>
                     <asp:DropDownList ID="ddl_Type" runat="server" CssClass="dropdown-lists" Width="200px">
                        <asp:ListItem Selected="True">Choose</asp:ListItem>
                        <asp:ListItem>Non-Academic</asp:ListItem>
                        <asp:ListItem>Academic</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-field">
                     <p>Contact<asp:RequiredFieldValidator ID="rfv_Contact" runat="server" ErrorMessage="*" ControlToValidate="tb_Contact" CssClass="validator"></asp:RequiredFieldValidator></p>
                     <asp:TextBox ID="tb_Contact" runat="server" CssClass="text-boxs"></asp:TextBox>
                </div>
                <div class="form-field">
                     <p>Mission<asp:RequiredFieldValidator ID="rfv_Mission" runat="server" ErrorMessage="*" ControlToValidate="tb_Mission" CssClass="validator"></asp:RequiredFieldValidator></p>
                </div>
                <asp:TextBox ID="tb_Mission" runat="server" CssClass="text-boxs" Height="200px" TextMode="MultiLine" Width="890px"></asp:TextBox>
                <div class="form-field">
                     <p>Vision<asp:RequiredFieldValidator ID="rfv_Vision" runat="server" ErrorMessage="*" ControlToValidate="tb_Vision" CssClass="validator"></asp:RequiredFieldValidator></p>
                </div>
                <asp:TextBox ID="tb_Vision" runat="server" CssClass="text-boxs" Height="200px" TextMode="MultiLine" Width="890px"></asp:TextBox>
                <div class="form-field">
                     <p>College<asp:RequiredFieldValidator ID="rfv_College" runat="server" ErrorMessage="*" ControlToValidate="ddl_College" CssClass="validator" InitialValue="Choose"></asp:RequiredFieldValidator></p>
                     <asp:DropDownList ID="ddl_College" runat="server" CssClass="dropdown-lists" Width="200px">
                        <asp:ListItem Selected="True">Choose</asp:ListItem>
                        <asp:ListItem>SHS</asp:ListItem>
                        <asp:ListItem>CAS</asp:ListItem>
                        <asp:ListItem>CCIS</asp:ListItem>
                        <asp:ListItem>ETYCB</asp:ListItem>
                        <asp:ListItem>MITL</asp:ListItem>
                        <asp:ListItem>CMET</asp:ListItem>
                    </asp:DropDownList>
                </div>
             </div>
        </div>
        <div class="form-section">
            <div id="members-section" class="sub-header" onclick="toggleFormSections(this)">
                <p style="width: 90%;">Members</p>
                <p id="members-section-indicator" style="float: right; margin-right:15px;">-</p>
            </div>

            <div id="members-section-fields" class="form-fields">
                <div class="form-field">
                     <p>Adviser Employee Number<asp:RequiredFieldValidator ID="rfv_AdviserNumber" runat="server" ErrorMessage="*" ControlToValidate="tb_AdviserNumber" CssClass="validator"></asp:RequiredFieldValidator></p>
                     <asp:TextBox ID="tb_AdviserNumber" runat="server" CssClass="text-boxs"></asp:TextBox>
                </div>
                <div class="form-field">
                     <p>Vice President Student Number<asp:RequiredFieldValidator ID="rfv_StudentNumber" runat="server" ErrorMessage="*" ControlToValidate="tb_StudentNumber" CssClass="validator"></asp:RequiredFieldValidator></p>
                     <asp:TextBox ID="tb_StudentNumber" runat="server" CssClass="text-boxs"></asp:TextBox>
                </div>
                <div class="form-field">
                     <p>Members<asp:RequiredFieldValidator ID="rfv_Members" runat="server" ErrorMessage="*" ControlToValidate="tb_Members" CssClass="validator"></asp:RequiredFieldValidator></p>
                </div>
                <asp:TextBox ID="tb_Members" runat="server" CssClass="text-boxs" Height="200px" TextMode="MultiLine" Width="890px"></asp:TextBox>
            </div>
        </div>
        <div  style="width: 60%; margin: auto; margin-top: 30px; display:flex; flex-flow: row wrap; justify-content: space-around;">
            <asp:Button ID="btn_Register" runat="server" Text="Register" CssClass="main-button" style="margin-bottom:25px;" OnClick="btn_Register_Click"/>
        </div>
    </div>
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
