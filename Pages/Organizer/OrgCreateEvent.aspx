<%@ Page Title="Create Event" Language="C#" MasterPageFile="~/Layouts/Common/Organizer/OrganizationView.Master" AutoEventWireup="true" CodeBehind="OrgCreateEvent.aspx.cs" Inherits="MalayanEventHub.OrgCreateEvent" %>
<asp:Content ID ="Content1" ContentPlaceHolderID ="head2" runat="server">
        <link rel="stylesheet" href="../../Styles/MasterStyleSheet.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [AdminTBL]"></asp:SqlDataSource>
    <div class="form-body">
        <p class="header">Create an Event</p>
        <div class ="form-section">
            <div id="event-section" class="sub-header" onclick="toggleFormSections(this)">
                <p style="width: 90%;">Event Details</p>
                <p id="event-section-indicator" style="float: right; margin-right:15px;">-</p>
            </div>
            <div id="event-section-fields" class="form-fields">
                <div class="form-field">
                    <div class="d-flex" style="flex-flow: row wrap; width: 100%; align-items: center;">
                        <asp:CustomValidator ID="cv_eventTitle" runat="server" ErrorMessage="Event Title must not be empty." Text="*" ControlToValidate="tb_eventTitle" ForeColor="Maroon" Font-Size="Large" ValidateEmptyText="true" ValidationGroup="form" OnServerValidate="RequiredValue_ServerValidate" ></asp:CustomValidator>
                        <p>Event Title:</p>
                    </div>
                    <asp:TextBox ID="tb_eventTitle" runat="server" CssClass="text-boxs" MaxLength="170" ></asp:TextBox>
                </div>
                <div class="form-field">
                    <div class="d-flex" style="flex-flow: row wrap; width: 100%; align-items: center;">
                        <asp:CustomValidator ID="cv_startDateTime" ControlToValidate="tb_startDateTime" Text="*" runat="server" ErrorMessage="Start Date & Time should be placed at present or future times." ForeColor="Maroon" Font-Size="Large" OnServerValidate="StartDateTime_Validate"  ValidateEmptyText="True" ValidationGroup="form" ></asp:CustomValidator>
                        <p>Start Date & Time:</p>
                    </div>
                    <asp:TextBox ID="tb_startDateTime" runat="server" CssClass="text-boxs" TextMode="DateTimeLocal" CausesValidation="true"></asp:TextBox>
                </div>
                 <div class="form-field">
                     <div class="d-flex" style="flex-flow: row wrap; width: 100%; align-items: center;">
                        <asp:CustomValidator ID="cv_endDateTime" ControlToValidate="tb_endDateTime" Text="*" runat="server" ErrorMessage="End Date & Time should be not be eariler than start date & time and at least 30 mins duration." ForeColor="Maroon" Font-Size="Large" ValidationGroup="form" OnServerValidate="CustomValidatorEndDateTime_ServerValidate" ValidateEmptyText="true" ></asp:CustomValidator>
                        <p>End Date & Time:</p>
                     </div>
                    <asp:TextBox ID="tb_endDateTime" runat="server" CssClass="text-boxs" TextMode="DateTimeLocal"></asp:TextBox>
                </div>
                 <div class="form-field">
                     <div class="d-flex" style="flex-flow: row wrap; width: 100%; align-items: center;">
                         <asp:CustomValidator ID="cv_venue" runat="server" ErrorMessage="Venue must not be empty." Text="*" ValidateEmptyText="true" ControlToValidate="tb_venue" ForeColor="Maroon" Font-Size="Large"  OnServerValidate="RequiredValue_ServerValidate" ValidationGroup="form" ></asp:CustomValidator>
                        <p>Venue:</p>
                     </div>
                    <asp:TextBox ID="tb_venue" runat="server" CssClass="text-boxs" MaxLength="255" ></asp:TextBox>
                </div>
                <div class="form-field">
                    <p>Invitation Link:</p>
                    <asp:TextBox ID="tb_invLink" runat="server" CssClass="text-boxs" TextMode="Url" placeholder="optional" MaxLength="500"></asp:TextBox>
                </div>
                <div class="form-field">
                    <div class="d-flex" style="flex-flow: row wrap; width: 100%; align-items: center;">
                        <asp:CustomValidator OnServerValidate="RequiredValue_ServerValidate" ID="cv_obj"  runat="server" ErrorMessage="Objectives must not be empty." Text="*" ValidateEmptyText="true" ControlToValidate="tb_objectives" ForeColor="Maroon" Font-Size="Large" ValidationGroup="form"></asp:CustomValidator>
                        <p>Objectives:</p>
                    </div>
                    <asp:TextBox ID="tb_objectives" runat="server" CssClass="text-boxs" TextMode="MultiLine" MaxLength="500" ></asp:TextBox>
                </div>
                <div class="form-field">
                     <div class="d-flex" style="flex-flow: row wrap; width: 100%; align-items: center;">
                        <asp:CustomValidator OnServerValidate="RequiredValue_ServerValidate" ValidateEmptyText="true" ID="cv_specificDet" runat="server" ErrorMessage="Specific details must not be empty." Text="*" ControlToValidate="tb_specificDet" ForeColor="Maroon" Font-Size="Large" ValidationGroup="form"></asp:CustomValidator>
                        <p>Specific Details:</p>
                    </div>
                    <asp:TextBox ID="tb_specificDet" runat="server" CssClass="text-boxs" TextMode="MultiLine" MaxLength="500" ></asp:TextBox>
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
                             <div class="d-flex" style="flex-flow: row wrap; width: 100%; align-items: center;">
                                <asp:CustomValidator ValidateEmptyText="true" OnServerValidate="RequiredValue_ServerValidate" ID="cv_college" ControlToValidate="ddl_college" Text="*" runat="server" ErrorMessage="Must be picked a target college." ForeColor="Maroon" Font-Size="Large" ValidationGroup="form"></asp:CustomValidator>
                                <p>College:</p>
                             </div>
                            <asp:DropDownList ID="ddl_college" CssClass="dropdown-lists" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_college_SelectedIndexChanged">
                                <asp:ListItem Value="" Selected="True"  hidden="hidden"> -- Choose a College</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-field">
                             <div class="d-flex" style="flex-flow: row wrap; width: 100%; align-items: center;">
                                <asp:CustomValidator ValidateEmptyText="true" OnServerValidate="RequiredValue_ServerValidate" ID="cv_targetDegree" ControlToValidate="ddl_degree" Text="*" runat="server" ErrorMessage="Must be picked a target degree." ForeColor="Maroon" Font-Size="Large" ValidationGroup="form"></asp:CustomValidator>
                                <p>Degree/Strand:</p>
                             </div>
                            <asp:DropDownList ID="ddl_degree" CssClass="dropdown-lists" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_degree_SelectedIndexChanged">
                                <asp:ListItem Value="" Selected="True" hidden="hidden">-- Please specify a College first.</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-field">
                            <div class="d-flex" style="flex-flow: row wrap; width: 100%; align-items: center;">
                                <asp:CustomValidator ValidateEmptyText="true" ID="cv_gradeYear" Text="*" runat="server" ErrorMessage="Must have an valid range of target year" ForeColor="Maroon" Font-Size="Large" ValidationGroup="form" OnServerValidate="CustomValidatorGradeYear_ServerValidate"></asp:CustomValidator>
                                <p>Year:</p>
                            </div>
                            <div class="d-flex" style="width: 100%;">
                                <asp:DropDownList ID="ddl_startGradeYear" CSSClass="dropdown-lists" style="width: 20%;" runat="server">
                                    <asp:ListItem Value="" Selected="True" hidden="hidden">--</asp:ListItem>
                                    <asp:ListItem Value="All">All</asp:ListItem>
                                </asp:DropDownList>
                                <p style="margin-left: 15px;">to</p>
                                <asp:DropDownList ID="ddl_endGradeYear" CSSClass="dropdown-lists" style="width: 20%;" runat="server">
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
                    <asp:CheckBoxList ID="cbl_targetData" runat="server" Width="100%" CssClass="check-boxs" RepeatLayout="UnorderedList">
                        <asp:ListItem Enabled="False" Selected="True" Value="firstName">First Name</asp:ListItem>
                        <asp:ListItem Value="middleName">Middle Name</asp:ListItem>
                        <asp:ListItem Enabled="False" Selected="True" Value="lastName">Last Name</asp:ListItem>
                        <asp:ListItem Value="userID" >Student No.</asp:ListItem>
                        <asp:ListItem Value="contactNo">Contact No.</asp:ListItem>
                        <asp:ListItem Value="email">E-mail</asp:ListItem>
                        <asp:ListItem Value="college">College</asp:ListItem>
                        <asp:ListItem Value="course">Course</asp:ListItem>
                        <asp:ListItem Value="year">Year Level</asp:ListItem>
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
                    <asp:FileUpload ID="f_uploadImg" runat="server" CssClass="text-boxs" accept="image/png, image/jpeg"  />
                </div>  
                <p>Note: (Optional) preferred to be landscape and  must be less than 10mb.</p>
            </div>
        </div>
        <div style="width: 40%; display:block; margin: auto;" >
            <asp:ValidationSummary ID="validate_summary"  runat="server" Font-Size="Large" ForeColor="#990000" HeaderText="Invalid Submission:" ValidationGroup="form" />
        </div>
        <div  style="width: 60%; margin: auto; margin-top: 30px; margin-bottom: 30px; display:flex; flex-flow: row wrap; justify-content: space-around;">
            <asp:Button ID="btn_submit" runat="server" Text="Submit"  CssClass="main-button" Width="35%" OnClick="ButtonSubmit_Click" ValidationGroup="form"  />
            <asp:Button ID="btn_cancel" runat="server" Text="Cancel" Width="35%" />
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
