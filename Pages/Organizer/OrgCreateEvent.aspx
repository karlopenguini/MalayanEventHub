<%@ Page Title="Create Event" Language="C#" MasterPageFile="~/Layouts/Common/Organizer/OrganizationView.Master" AutoEventWireup="true" CodeBehind="OrgCreateEvent.aspx.cs" Inherits="MalayanEventHub.OrgCreateEvent" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="form-body">
        <p class="header">Create an Event</p>
        <div class ="form-section">
            <div id="event-section" class="sub-header" onclick="toggleFormSections(this)">
                <p style="width: 90%;">Event Details</p>
                <p id="event-section-indicator" style="float: right; margin-right:15px;">-</p>
            </div>
            <div id="event-section-fields" class="form-fields">
                <div class="form-field">
                    <asp:CustomValidator ID="CustomValidatorEventTitle" runat="server" ErrorMessage="Event Title must not be empty." Text="*" ControlToValidate="TextBoxTitle" ForeColor="Maroon" Font-Size="Large" ValidateEmptyText="true" ValidationGroup="form" OnServerValidate="RequiredValue_ServerValidate" ></asp:CustomValidator>
                    <p>Event Title:</p>
                    <asp:TextBox ID="TextBoxTitle" runat="server" CssClass="text-boxs" ></asp:TextBox>
                </div>
                <div class="form-field">
                    <asp:CustomValidator ID="CustomValidatorStartDateTime" ControlToValidate="TextBoxStartDateTime" Text="*" runat="server" ErrorMessage="Start Date & Time should be placed at present or future times." ForeColor="Maroon" Font-Size="Large" OnServerValidate="StartDateTime_Validate"  ValidateEmptyText="True" ValidationGroup="form" ></asp:CustomValidator>
                    <p>Start Date & Time:</p>
                    <asp:TextBox ID="TextBoxStartDateTime" runat="server" CssClass="text-boxs" TextMode="DateTimeLocal" CausesValidation="true"></asp:TextBox>
                </div>
                 <div class="form-field">
                      <asp:CustomValidator ID="CustomValidatorEndDateTime" ControlToValidate="TextBoxEndDateTime" Text="*" runat="server" ErrorMessage="End Date & Time should be not be eariler than start date & time and at least 30 mins duration." ForeColor="Maroon" Font-Size="Large" ValidationGroup="form" OnServerValidate="CustomValidatorEndDateTime_ServerValidate" ValidateEmptyText="true" ></asp:CustomValidator>
                    <p>End Date & Time:</p>
                    <asp:TextBox ID="TextBoxEndDateTime" runat="server" CssClass="text-boxs" TextMode="DateTimeLocal"></asp:TextBox>
                </div>
                 <div class="form-field">
                     <asp:CustomValidator ID="CustomValidatorVenue" runat="server" ErrorMessage="Venue must not be empty." Text="*" ValidateEmptyText="true" ControlToValidate="TextBoxVenue" ForeColor="Maroon" Font-Size="Large"  OnServerValidate="RequiredValue_ServerValidate" ValidationGroup="form" ></asp:CustomValidator>
                    <p>Venue:</p>
                    <asp:TextBox ID="TextBoxVenue" runat="server" CssClass="text-boxs" ></asp:TextBox>
                </div>
                <div class="form-field">
                    <p>Invitation Link:</p>
                    <asp:TextBox ID="TextBoxInvLink" runat="server" CssClass="text-boxs" TextMode="Url" placeholder="optional"></asp:TextBox>
                </div>
                <div class="form-field">
                    <asp:CustomValidator OnServerValidate="RequiredValue_ServerValidate" ID="CustomValidatorObj"  runat="server" ErrorMessage="Objectives must not be empty." Text="*" ValidateEmptyText="true" ControlToValidate="TextBoxObjectives" ForeColor="Maroon" Font-Size="Large" ValidationGroup="form"></asp:CustomValidator>
                    <p>Objectives:</p>
                    <asp:TextBox ID="TextBoxObjectives" runat="server" CssClass="text-boxs" TextMode="MultiLine" ></asp:TextBox>
                </div>
                <div class="form-field">
                    <asp:CustomValidator OnServerValidate="RequiredValue_ServerValidate" ValidateEmptyText="true" ID="CustomValidatorSpecificDet" runat="server" ErrorMessage="Specific details must not be empty." Text="*" ControlToValidate="TextBoxSpecificDet" ForeColor="Maroon" Font-Size="Large" ValidationGroup="form"></asp:CustomValidator>
                    <p>Specific Details:</p>
                    <asp:TextBox ID="TextBoxSpecificDet" runat="server" CssClass="text-boxs" TextMode="MultiLine" ></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-section">
             <div id="audience-section" class="sub-header" onclick="toggleFormSections(this)"> 
                <p style="width: 90%;">Target Audience</p>
                <p id="audience-section-indicator" style="float: right; margin-right:15px;">-</p>
            </div>
            <asp:UpdatePanel ID="UpdatePanelAudienceFormSection" runat="server">
                <ContentTemplate>
                    <div id="audience-section-fields" class="form-fields">
                        <div class="form-field">
                            <asp:CustomValidator ValidateEmptyText="true" OnServerValidate="RequiredValue_ServerValidate" ID="CustomValidatorCollege" ControlToValidate="DropDownListCollege" Text="*" runat="server" ErrorMessage="Must be picked a target college." ForeColor="Maroon" Font-Size="Large" ValidationGroup="form"></asp:CustomValidator>
                            <p>College:</p>
                            <asp:DropDownList ID="DropDownListCollege" CssClass="dropdown-lists" runat="server">
                                <asp:ListItem Value="" Selected="True"  hidden="hidden"> -- Choose a College</asp:ListItem>
                                <asp:ListItem Value="SHS">Senior High School (SHS)</asp:ListItem>
                                <asp:ListItem Value="CAS">College of Arts and Science (CAS)</asp:ListItem>
                                <asp:ListItem Value="CCIS">College of Computer and Information Science (CCIS)</asp:ListItem>
                                <asp:ListItem Value="ETYCB">E.T. Yuchengco College of Business (ETYCB)</asp:ListItem>
                                <asp:ListItem Value="MITL">Mapúa Institute of Technology at Laguna (MITL)</asp:ListItem>
                                <asp:ListItem Value="CMET">College of Maritime Education and Training (CMET)</asp:ListItem>
                                <asp:ListItem Value="All">All</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-field">
                            <asp:CustomValidator ValidateEmptyText="true" OnServerValidate="RequiredValue_ServerValidate" ID="CustomValidatorTargetDegree" ControlToValidate="DropDownListDegree" Text="*" runat="server" ErrorMessage="Must be picked a target degree." ForeColor="Maroon" Font-Size="Large" ValidationGroup="form"></asp:CustomValidator>
                            <p>Degree/Strand:</p>
                            <asp:DropDownList ID="DropDownListDegree" CssClass="dropdown-lists" runat="server">
                                <asp:ListItem Value="" Selected="True" hidden="hidden">-- Please specify a College first.</asp:ListItem>
                                <asp:ListItem Value="All" >All</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-field">
                            <div class="d-flex" style="width: 100%;">
                                <asp:CustomValidator ValidateEmptyText="true" ID="CustomValidatorGradeYear" Text="*" runat="server" ErrorMessage="Must have a Target Grade Year range value." ForeColor="Maroon" Font-Size="Large" ValidationGroup="form" OnServerValidate="CustomValidatorGradeYear_ServerValidate"></asp:CustomValidator>
                                <p>Year:</p>
                            </div>
                            <div class="d-flex" style="width: 100%;">
                                <asp:DropDownList ID="DropDownListStartGradeYear" CSSClass="dropdown-lists" style="width: 20%;" runat="server">
                                    <asp:ListItem Value="" Selected="True" hidden="hidden">--</asp:ListItem>
                                    <asp:ListItem Value="All">All</asp:ListItem>
                                </asp:DropDownList>
                                <p style="margin-left: 15px;">to</p>
                                <asp:DropDownList ID="DropDownListEndGradeYear" CSSClass="dropdown-lists" style="width: 20%;" runat="server">
                                    <asp:ListItem>--</asp:ListItem>
                                    <asp:ListItem>All</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="form-section" >
            <div id="participant-info" class="sub-header" onclick="toggleFormSections(this)"> 
                <p style="width: 90%;">Preferred Participants' Information</p>
                <p id="participant-info-indicator" style="float: right; margin-right:15px;">-</p>
            </div>
            <div id="participant-info-fields" class="form-fields">
                <div class="form-field">
                    <p>Target Participant's Data:</p>
                    <asp:CheckBoxList ID="CheckBoxListTargetData" runat="server" Width="100%" CssClass="check-boxs" RepeatLayout="UnorderedList">
                        <asp:ListItem Enabled="False" Selected="True">First Name</asp:ListItem>
                        <asp:ListItem>Middle Name</asp:ListItem>
                        <asp:ListItem Enabled="False" Selected="True">Last Name</asp:ListItem>
                        <asp:ListItem >Student No.</asp:ListItem>
                        <asp:ListItem>Contact No.</asp:ListItem>
                        <asp:ListItem>E-mail</asp:ListItem>
                        <asp:ListItem>Address</asp:ListItem>
                        <asp:ListItem>College</asp:ListItem>
                        <asp:ListItem>Course</asp:ListItem>
                        <asp:ListItem>Year Level</asp:ListItem>
                    </asp:CheckBoxList>
                 </div>
            </div>
        </div>
        <div class="form-section">
             <div id="pubmat-info" class="sub-header"  onclick="toggleFormSections(this)"> 
                <p style="width: 90%;">Publication Material</p>
                <p id="pubmat-info-indicator"  style="float: right; margin-right:15px;">-</p>
            </div>
            <div id="pubmat-info-fields" class="form-fields">
                <div class="form-field">
                    <p>Pubmat Image:</p>
                    <asp:FileUpload ID="FileUploadImg" runat="server" CssClass="text-boxs" accept="image/png, image/jpeg"  />
                </div>  
                <p>Note: (Optional) preferred to be landscape and  must be less than 10mb.</p>
            </div>
        </div>
        <div style="width: 40%; display:block; margin: auto;" >
            <asp:ValidationSummary ID="ValidationSummary" runat="server" Font-Size="Large" ForeColor="#990000" HeaderText="Invalid Submission:" ValidationGroup="form" />
        </div>
        <div  style="width: 60%; margin: auto; margin-top: 30px; margin-bottom: 30px; display:flex; flex-flow: row wrap; justify-content: space-around;">
            <asp:Button ID="ButtonSubmit" runat="server" Text="Submit"  CssClass="main-button" Width="35%" OnClick="ButtonSubmit_Click" ValidationGroup="form"  />
            <asp:Button ID="ButtonCancel" runat="server" Text="Cancel" Width="35%" />
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
