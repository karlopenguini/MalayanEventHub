<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/OrganizerView.Master" AutoEventWireup="true" CodeBehind="OrgRegistration.aspx.cs" Inherits="MalayanEventHub.Layouts.OrgRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Styles/Organizer/organization-registration.css" rel="stylesheet" />
    <link href="../../Styles/MasterStyleSheet.css" rel="stylesheet" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="form-body">
        <p class="header">Register Organization</p>
        <div class="form-section">
            <div id="information-section" class="sub-header" onclick="toggleFormSections(this)">
                <p style="width: 90%;">Information</p>
                <p id="information-section-indicator" style="float: right; margin-right:15px;">-</p>
            </div>

            <div id="information-section-fields" class="form-fields">
                <div class="form-field">
                     <p>Name<asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="*" ControlToValidate="tb_Name" ForeColor="Red"></asp:RequiredFieldValidator></p>
                     <asp:TextBox ID="tb_Name" runat="server" CssClass="text-boxs"></asp:TextBox>
                </div>
                <div class="form-field">
                     <p>Logo<asp:RequiredFieldValidator ID="rfvLogo" runat="server" ErrorMessage="*" ControlToValidate="fu_Logo" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator></p>
                     <asp:FileUpload ID="fu_Logo" runat="server" accept="image/png, image/jpeg"  />
                </div>
                
                <div class="form-field">
                     <p>Acronym<asp:RequiredFieldValidator ID="rfv_Acronym" runat="server" ErrorMessage="*" ControlToValidate="tb_Acronym" CssClass="validator"></asp:RequiredFieldValidator></p>
                     <asp:TextBox ID="tb_Acronym" runat="server" CssClass="text-boxs"></asp:TextBox>
                </div>
                <div class="form-field">
                     <p>Type<asp:RequiredFieldValidator ID="rfv_Type" runat="server" ErrorMessage="*" ControlToValidate="ddl_Type" ForeColor="Red" InitialValue="Choose"></asp:RequiredFieldValidator></p>
                     <asp:DropDownList ID="ddl_Type" runat="server" CssClass="dropdown-lists" Width="200px">
                        <asp:ListItem Selected="True">Choose</asp:ListItem>
                        <asp:ListItem>Non-Academic</asp:ListItem>
                        <asp:ListItem>Academic</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-field">
                     <p>Contact<asp:RequiredFieldValidator ID="rfv_Contact" runat="server" ErrorMessage="*" ControlToValidate="tb_Contact" ForeColor="Red"></asp:RequiredFieldValidator></p>
                     <asp:TextBox ID="tb_Contact" runat="server" CssClass="text-boxs"></asp:TextBox>
                </div>
                <div class="form-field">
                     <p>Mission<asp:RequiredFieldValidator ID="rfv_Mission" runat="server" ErrorMessage="*" ControlToValidate="tb_Mission" ForeColor="Red"></asp:RequiredFieldValidator></p>
                </div>
                <asp:TextBox ID="tb_Mission" runat="server" CssClass="text-boxs" Height="200px" TextMode="MultiLine" Width="890px"></asp:TextBox>
                <div class="form-field">
                     <p>Vision<asp:RequiredFieldValidator ID="rfv_Vision" runat="server" ErrorMessage="*" ControlToValidate="tb_Vision" ForeColor="Red"></asp:RequiredFieldValidator></p>
                </div>
                <asp:TextBox ID="tb_Vision" runat="server" CssClass="text-boxs" Height="200px" TextMode="MultiLine" Width="890px"></asp:TextBox>
                <div class="form-field">
                     <p>College<asp:RequiredFieldValidator ID="rfv_College" runat="server" ErrorMessage="*" ControlToValidate="ddl_College" ForeColor="Red" InitialValue="Choose"></asp:RequiredFieldValidator></p>
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
            <div id="adviser-section" class="sub-header" onclick="toggleFormSections(this)">
                <p style="width: 90%;">Adviser</p>
                <p id="adviser-section-indicator" style="float: right; margin-right:15px;">-</p>
            </div>
            <div id="adviser-section-fields" class="form-fields">
                <div class="form-field">
                     <p>Adviser Employee Number<asp:RequiredFieldValidator ID="rfv_AdviserNumber" runat="server" ErrorMessage="*" ControlToValidate="tb_AdviserNumber" ForeColor="Red"></asp:RequiredFieldValidator></p>
                     <asp:TextBox ID="tb_AdviserNumber" runat="server" CssClass="text-boxs"></asp:TextBox>
                </div>
                <div class="form-field">
                     <p>First Name<asp:RequiredFieldValidator ID="rfv_AdviserFName" runat="server" ErrorMessage="*" ControlToValidate="tb_AdviserFName" ForeColor="Red"></asp:RequiredFieldValidator></p>
                     <asp:TextBox ID="tb_AdviserFName" runat="server" CssClass="text-boxs"></asp:TextBox>
                </div>
                <div class="form-field">
                     <p>Last Name<asp:RequiredFieldValidator ID="rfv_AdviserLName" runat="server" ErrorMessage="*" ControlToValidate="tb_AdviserLName" ForeColor="Red"></asp:RequiredFieldValidator></p>
                     <asp:TextBox ID="tb_AdviserLName" runat="server" CssClass="text-boxs"></asp:TextBox>
                </div>
                <div class="form-field">
                     <p>College<asp:RequiredFieldValidator ID="rfv_AdviserCollege" runat="server" ErrorMessage="*" ControlToValidate="ddl_AdviserCollege" ForeColor="Red" InitialValue="Choose"></asp:RequiredFieldValidator></p>
                     <asp:DropDownList ID="ddl_AdviserCollege" runat="server" CssClass="dropdown-lists" Width="200px">
                        <asp:ListItem Selected="True">Choose</asp:ListItem>
                        <asp:ListItem>SHS</asp:ListItem>
                        <asp:ListItem>CAS</asp:ListItem>
                        <asp:ListItem>CCIS</asp:ListItem>
                        <asp:ListItem>ETYCB</asp:ListItem>
                        <asp:ListItem>MITL</asp:ListItem>
                        <asp:ListItem>CMET</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-field">
                     <p>E-mail<asp:RequiredFieldValidator ID="rfv_AdviserEmail" runat="server" ErrorMessage="*" ControlToValidate="tb_AdviserEmail" ForeColor="Red"></asp:RequiredFieldValidator></p>
                     <asp:TextBox ID="tb_AdviserEmail" runat="server" CssClass="text-boxs"></asp:TextBox>
                </div>
                <div class="form-field">
                     <p>Contact<asp:RequiredFieldValidator ID="rfv_AdviserContact" runat="server" ErrorMessage="*" ControlToValidate="tb_AdviserContact" ForeColor="Red"></asp:RequiredFieldValidator></p>
                     <asp:TextBox ID="tb_AdviserContact" runat="server" CssClass="text-boxs"></asp:TextBox>
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
                    <p>Vice President Student Number<asp:RequiredFieldValidator ID="rfv_VicePresidentNumber" runat="server" ErrorMessage="*" ControlToValidate="tb_VicePresidentNumber" ForeColor="Red"></asp:RequiredFieldValidator></p>
                    <asp:TextBox ID="tb_VicePresidentNumber" runat="server" CssClass="text-boxs"></asp:TextBox>
                    <asp:CustomValidator ID="cv_VicePresidentNumber" runat="server" ErrorMessage="Student Does Not Exist" ForeColor="Red" OnServerValidate="VicePresident_IsExist"></asp:CustomValidator>
                </div>
                <div class="form-field">
                    <p>Secretary Student Number<asp:RequiredFieldValidator ID="rfv_" runat="server" ErrorMessage="*" ControlToValidate="tb_SecretaryNumber" ForeColor="Red"></asp:RequiredFieldValidator></p>
                    <asp:TextBox ID="tb_SecretaryNumber" runat="server" CssClass="text-boxs"></asp:TextBox>
                    <asp:CustomValidator ID="cv_SecretaryNumber" runat="server" ErrorMessage="Student Does Not Exist" ForeColor="Red" OnServerValidate="Secretary_IsExist"></asp:CustomValidator>
                </div>
                <div class="form-field">
                    <p>Treasurer Student Number<asp:RequiredFieldValidator ID="rfv_TreasurerNumber" runat="server" ErrorMessage="*" ControlToValidate="tb_TreasurerNumber" ForeColor="Red"></asp:RequiredFieldValidator></p>
                    <asp:TextBox ID="tb_TreasurerNumber" runat="server" CssClass="text-boxs"></asp:TextBox>
                    <asp:CustomValidator ID="cv_TreasurerNumber" runat="server" ErrorMessage="Student Does Not Exist" ForeColor="Red" OnServerValidate="Treasurer_IsExist"></asp:CustomValidator>
                </div>
                <div class="form-field">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <p>Members<asp:RequiredFieldValidator ID="rfv_MemberList" runat="server" ErrorMessage="*" ControlToValidate="tb_Member" ForeColor="Red"></asp:RequiredFieldValidator></p>
                            <div>
                                <asp:TextBox ID="tb_Member" runat="server" CssClass="text-boxs" Width="200px"></asp:TextBox>
                                <asp:Button ID="btn_Add" runat="server" Text="Add" CssClass="sub-button" Width="100px" OnClick="btn_Add_Click"/>
                                <asp:Button ID="btn_Delete" runat="server" Text="Delete" CssClass="sub-button" Width="100px" OnClick="btn_Delete_Click"/>
                            </div>
                            <asp:CustomValidator ID="cv_Member" runat="server" ErrorMessage="Student Does Not Exist" ControlToValidate="tb_Member" ForeColor="Red" OnServerValidate="Member_IsExist"></asp:CustomValidator>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="tb_MemberList" runat="server" CssClass="text-boxs" Height="200px" TextMode="MultiLine" Width="890px"></asp:TextBox>
                    </ContentTemplate>
                </asp:UpdatePanel>
                
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
