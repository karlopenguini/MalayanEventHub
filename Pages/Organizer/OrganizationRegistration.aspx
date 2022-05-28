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
        <p class="header">Register</p>
        <div class="form-section">
            <div id="category-section" class="sub-header" onclick="toggleFormSections(this)">
                <p style="width: 90%;">Information</p>
                <p id="category-section-indicator" style="float: right; margin-right:15px;">-</p>
            </div>

            <div id="category-section-fields" class="form-fields">
                <div class="form-field">
                     <p>Name<asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="*" ControlToValidate="tb_Name" CssClass="validator"></asp:RequiredFieldValidator></p>
                     <asp:TextBox ID="tb_Name" runat="server" Width="500px" CssClass="text-boxs"></asp:TextBox>
                </div>
                <div class="form-field">
                     <p>Logo<asp:RequiredFieldValidator ID="rfvLogo" runat="server" ErrorMessage="*" ControlToValidate="tb_Logo" CssClass="validator"></asp:RequiredFieldValidator></p>
                     <asp:TextBox ID="tb_Logo" runat="server" Width="500px" CssClass="text-boxs"></asp:TextBox>
                </div>
                <div class="form-field">
                     <p>Acronym<asp:RequiredFieldValidator ID="rfv_Acronym" runat="server" ErrorMessage="*" ControlToValidate="tb_Acronym" CssClass="validator"></asp:RequiredFieldValidator></p>
                     <asp:TextBox ID="tb_Acronym" runat="server" Width="500px" CssClass="text-boxs"></asp:TextBox>
                </div>
                <div class="form-field">
                     <p>Type<asp:RequiredFieldValidator ID="rfv_Type" runat="server" ErrorMessage="*" ControlToValidate="ddl_Type" CssClass="validator" InitialValue="Choose"></asp:RequiredFieldValidator></p>
                     <asp:DropDownList ID="ddl_Type" runat="server" CssClass="dropdown-lists">
                        <asp:ListItem Selected="True">Choose</asp:ListItem>
                        <asp:ListItem>Non-Academic</asp:ListItem>
                        <asp:ListItem>Academic</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-field">
                     <p>Contact<asp:RequiredFieldValidator ID="rfv_Contact" runat="server" ErrorMessage="*" ControlToValidate="tb_Contact" CssClass="validator"></asp:RequiredFieldValidator></p>
                     <asp:TextBox ID="tb_Contact" runat="server" Width="500px" CssClass="text-boxs"></asp:TextBox>
                </div>
             </div>

            <%--<div>
                <asp:Label ID="lbl_College" runat="server" Text="College"></asp:Label>
                <asp:RequiredFieldValidator ID="rfvCollege" runat="server" ErrorMessage="*" ControlToValidate="ddl_College" CssClass="validator" InitialValue="Choose"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:DropDownList ID="ddl_College" runat="server" CssClass="dropdown-lists">
                    <asp:ListItem Selected="True">Choose</asp:ListItem>
                    <asp:ListItem>SHS</asp:ListItem>
                    <asp:ListItem>CAS</asp:ListItem>
                    <asp:ListItem>CCIS</asp:ListItem>
                    <asp:ListItem>MITL</asp:ListItem>
                    <asp:ListItem>CMET</asp:ListItem>
                </asp:DropDownList>
            </div>--%>
         
            <div style = "margin: 15px auto">
                <asp:Button ID="btn_Register" runat="server" Text="Register" CssClass="main-button"/>
            </div>
        </div>
    </div>
</asp:Content>
