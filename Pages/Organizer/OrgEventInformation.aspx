<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/Common/Organizer/OrganizationView.master" AutoEventWireup="true" CodeBehind="OrgEventInformation.aspx.cs" Inherits="MalayanEventHub.Pages.Organizer.OrgEventInformation" %>
<asp:Content ID ="Content_head" ContentPlaceHolderID ="head2" runat="server">
        <link rel="stylesheet" href="../../Styles/MasterStyleSheet.css" />
    <style>
        .dynamic-image{
            width: 90%;
            height: 400px;
            object-fit:contain;
            border-radius: 10px;
            margin: 0 auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="form-body">
        <p class="header">Event Information | ID #<asp:Label ID="lbl_eventID" runat="server" Text="" ></asp:Label> </p>
        <div class="card" style="font-weight: 100;">
             <div id="event-status-section" class="header" onclick="toggleFormSections(this)">
                 <p style="width: 90%;  display: inline-block;">Event Request Status</p>
                 <p id="event-status-section-indicator" style="float:right; margin-right: 15px;">-</p>
             </div>
            <div id="event-status-section-fields" class="card-body">
                <div class="card-detail" style="text-align: center;">
                    <p>Admin Response</p>
                    <asp:Label ID="lbl_status" runat="server" Text="" Font-Size="60px" style="font-weight: 300;" ></asp:Label>
                </div>
                <div class="form-section" style="margin-bottom: 0px;">
                    <div id="comment-response-section" class="sub-header" onclick="toggleFormSections(this)">
                        <p style="width: 90%;">Admin Comments</p>
                        <p id="comment-response-section-indicator" style="float: right; margin-right:15px;">-</p>
                    </div>
                    <div id="comment-response-section-fields" class="form-fields" >
                        <div class="form-field">
                             <p>Comment:</p>
                            <asp:TextBox ID="tb_commentResponse" runat="server" TextMode="MultiLine"  Height="200px"  Style="width: 100%; display: block;" Enabled="false"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class ="form-section">
            <div id="event-section" class="sub-header" onclick="toggleFormSections(this)"> 
                <p style="width: 90%;">Event Details</p>
                <p id="event-section-indicator" style="float: right; margin-right:15px;">-</p>
            </div>
            <div id="event-section-fields" class="form-fields">
                <div class="form-field">
                    <p>Event Title:</p>
                    <asp:TextBox ID="tb_eventTitle" runat="server" CssClass="text-boxs" Enabled="False" ></asp:TextBox>
                </div>
                <div class="form-field">
                    <p>Start Date & Time:</p>
                    <asp:TextBox ID="tb_startDateTime" runat="server" CssClass="text-boxs" TextMode="DateTimeLocal" Enabled="False" ></asp:TextBox>
                </div>
                 <div class="form-field">
                    <p>End Date & Time:</p>
                    <asp:TextBox ID="tb_endDateTime" runat="server" CssClass="text-boxs" TextMode="DateTimeLocal" Enabled="False" ></asp:TextBox>
                </div>
                 <div class="form-field">
                    <p>Venue:</p>
                    <asp:TextBox ID="tb_venue" runat="server" CssClass="text-boxs" Enabled="False" ></asp:TextBox>
                </div>
                <div class="form-field">
                    <p>Venue Link:</p>
                    <asp:HyperLink ID="hl_venue" runat="server" CssClass="hyper-links" >HyperLink</asp:HyperLink>
                </div>
                <div class="form-field">
                    <p>Objectives:</p>
                    <asp:TextBox ID="tb_obj" runat="server" CssClass="text-boxs" TextMode="MultiLine" Enabled="False" ></asp:TextBox>
                </div>
                <div class="form-field">
                    <p>Specific Details:</p>
                    <asp:TextBox ID="tb_specDet" runat="server" CssClass="text-boxs" TextMode="MultiLine" Enabled="False" ></asp:TextBox>
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
                                <p>College:</p>
                             </div>
                            <asp:DropDownList ID="ddl_college" CssClass="dropdown-lists" runat="server" AutoPostBack="True" Enabled="False" >
                            </asp:DropDownList>
                        </div>
                        <div class="form-field">
                             <div class="d-flex" style="flex-flow: row wrap; width: 100%; align-items: center;">
                             </div>
                            <asp:DropDownList ID="ddl_degree" CssClass="dropdown-lists" runat="server" AutoPostBack="True" Enabled="False" >
                            </asp:DropDownList>
                        </div>
                        <div class="form-field">
                            <div class="d-flex" style="flex-flow: row wrap; width: 100%; align-items: center;">
                                <p>Year:</p>
                            </div>
                            <div class="d-flex" style="width: 100%;">
                                <asp:DropDownList ID="ddl_startGradeYear" CSSClass="dropdown-lists" style="width: 20%;" runat="server" Enabled="False">
                                </asp:DropDownList>
                                <p style="margin-left: 15px;">to</p>
                                <asp:DropDownList ID="ddl_endGradeYear" CSSClass="dropdown-lists" style="width: 20%;" runat="server" Enabled="False">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="form-section" >
            <div id="participant-info" class="sub-header" onclick="toggleFormSections(this)"> 
                <p style="width: 90%;">Participants' Information</p>
                <p id="participant-info-indicator" style="float: right; margin-right:15px;">-</p>
            </div>
            <div id="participant-info-fields" class="form-fields">
                <div class="form-field">
                    <p>Preferred Information of Participants:</p>
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
                <div class="form-field">
                    <p>Participants:</p>
                    <asp:Button ID="btn_showParticipants" runat="server" Text="Show Participants"  CssClass="main-button" Width="35%" OnClick="btn_showParticipants_Click" />
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
                    <asp:Image ID="pubmatImg" runat="server" CssClass="dynamic-image" AlternateText="No Image" />
                </div>  
            </div>
        </div>
        <div class="form-section">
            <div id="report-info" class="sub-header"  onclick="toggleFormSections(this)"> 
                <p style="width: 90%;">Reports</p>
                <p id="report-info-indicator"  style="float: right; margin-right:15px;">-</p>
            </div>
             <div id="report-info-fields" class="form-fields">
                <div class="form-field">
                    <p>Accomplishment:</p>
                   <asp:Button ID="btn_genAccReport" runat="server" Text="Generate Accomplishment Report"  CssClass="main-button" OnClick="btn_genAccReport_Click" />
                </div>  
                <div class="form-field">
                    <p>Incident</p>
                   <asp:Button ID="btn_gotoIncident" runat="server" Text="Create Incident Report"  CssClass="main-button" OnClick="btn_gotoIncident_Click"  />
                </div>  
            </div>
        </div>
        <div  style="width: 60%; margin: auto; margin-top: 30px;margin-bottom: 30px; display:flex; flex-flow: row wrap; justify-content: space-around;">
           
            <asp:Button ID="btn_delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this event? Once confirmed it cannot be undone')" BackColor="Maroon" ForeColor="White" Text="Delete" Width="35%" OnClick="btn_delete_Click" />
            <asp:Button ID="btn_cancel" runat="server" CssCLass="sub-button" Text="Cancel" Width="35%" OnClick="btn_cancel_Click" />
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

        function toggleAllFormSections() {
            
            var formSections = document.getElementsByClassName("sub-header");
            for (var i = 0; i < formSections.length; i++) {
                var formfield = document.getElementById(formSections[i].id + "-fields");
                if (formfield != null) {
                    formfield.classList.toggle("hide");
                    var objectCallerIndicator = document.getElementById(formSections[i].id + "-indicator");
                    if (objectCallerIndicator.innerText == "+") {
                        objectCallerIndicator.innerText = "-";
                    }
                    else if (objectCallerIndicator.innerText == "-") {
                        objectCallerIndicator.innerText = "+";
                    }
                }


            }
        }
        toggleAllFormSections();
    </script>
</asp:Content>
