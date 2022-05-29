<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/Common/Admin/OrganizationView.master" AutoEventWireup="true" CodeBehind="ViewEvent.aspx.cs" Inherits="MalayanEventHub.Layouts.Common.Admin.ViewEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
    <link rel="stylesheet" href="../../Styles/MasterStyleSheet.css" />
    <style>
        .event-status{
            font-size: 1.6em;
            padding:0.5em 2em;
            background-color:#00ff21;
            border-radius: 24px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="form-body">
        <p class="header">Review Event</p>
        <div class="form-section">
            <div id="event-section" class="sub-header" onclick="toggleFormSections(this)">
                <p style="width: 90%;">Event Details</p>
                <p id="event-section-indicator" style="float: right; margin-right: 15px;">-</p>
            </div>
            <div id="event-section-fields" class="form-fields">
                <div class="form-field">
                    <p>Event Title:</p>
                    <asp:TextBox ID="TextBoxTitle" runat="server" CssClass="text-boxs" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-field">
                    <p>Start Date & Time:</p>
                    <asp:TextBox ID="TextBoxStartDateTime" runat="server" CssClass="text-boxs" TextMode="DateTimeLocal" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-field">
                    <p>End Date & Time:</p>
                    <asp:TextBox ID="TextBoxEndDateTime" runat="server" CssClass="text-boxs" TextMode="DateTimeLocal" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-field">
                    <p>Venue:</p>
                    <asp:TextBox ID="TextBoxVenue" runat="server" CssClass="text-boxs" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-field">
                    <p>Invitation Link:</p>
                    <asp:TextBox ID="TextBoxInvLink" runat="server" CssClass="text-boxs" TextMode="Url" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-field">
                    <p>Objectives:</p>
                    <asp:TextBox ID="TextBoxObjectives" runat="server" CssClass="text-boxs" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-field">
                    <p>Specific Details:</p>
                    <asp:TextBox ID="TextBoxSpecificDet" runat="server" CssClass="text-boxs" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-section">
            <div id="audience-section" class="sub-header" onclick="toggleFormSections(this)">
                <p style="width: 90%;">Target Audience</p>
                <p id="audience-section-indicator" style="float: right; margin-right: 15px;">-</p>
            </div>
            <div id="audience-section-fields" class="form-fields">
                <div class="form-field">
                    <p>College:</p>
                    <asp:DropDownList ID="DropDownListCollege" CssClass="dropdown-lists" runat="server" Enabled="False">
                        <asp:ListItem Value="SHS">Senior High School (SHS)</asp:ListItem>
                        <asp:ListItem Value="CAS">College of Arts and Science (CAS)</asp:ListItem>
                        <asp:ListItem Value="CCIS">College of Computer and Information Science (CCIS)</asp:ListItem>
                        <asp:ListItem Value="ETYCB">E.T. Yuchengco College of Business (ETYCB)</asp:ListItem>
                        <asp:ListItem Value="MITL">Mapúa Institute of Technology at Laguna (MITL)</asp:ListItem>
                        <asp:ListItem Value="CMET">Mapúa-PTC College of Maritime Education and Training (CMET)</asp:ListItem>
                        <asp:ListItem Value="All" Selected="True">All</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-field">
                    <p>Degree/Strand:</p>
                    <asp:DropDownList ID="DropDownListDegree" CssClass="dropdown-lists" runat="server" Enabled="False">
                        <asp:ListItem Value="" Selected="True" hidden="hidden">-- Please specify a College first.</asp:ListItem>
                        <asp:ListItem Value="All">All</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-field">
                    <p>Year:</p>
                    <asp:DropDownList ID="DropDownListStartGradeYear" CssClass="year-dropdown-lists" runat="server" Enabled="False">
                        <asp:ListItem>--</asp:ListItem>
                        <asp:ListItem>All</asp:ListItem>
                    </asp:DropDownList>
                    <p>to</p>
                    <asp:DropDownList ID="DropDownListEndGradeYear" CssClass="year-dropdown-lists" runat="server" Enabled="False">
                        <asp:ListItem>--</asp:ListItem>
                        <asp:ListItem>All</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <div class="form-section">
            <div id="participant-info" class="sub-header" onclick="toggleFormSections(this)">
                <p style="width: 90%;">Preferred Participants' Information</p>
                <p id="participant-info-indicator" style="float: right; margin-right: 15px;">-</p>
            </div>
            <div id="participant-info-fields" class="form-fields">
                <div class="form-field">
                    <p>Target Information of Participants:</p>
                    <asp:CheckBoxList ID="CheckBoxListTargetData" runat="server" Width="100%" CssClass="check-boxs" RepeatLayout="UnorderedList" Enabled="False">
                        <asp:ListItem>Student No.</asp:ListItem>
                        <asp:ListItem Enabled="False" Selected="True">First Name</asp:ListItem>
                        <asp:ListItem>Middle Name</asp:ListItem>
                        <asp:ListItem Enabled="False" Selected="True">Last Name</asp:ListItem>
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
            <div id="pubmat-info" class="sub-header" onclick="toggleFormSections(this)">
                <p style="width: 90%;">Publication Material</p>
                <p id="pubmat-info-indicator" style="float: right; margin-right: 15px;">-</p>
            </div>
            <div id="pubmat-info-fields" class="form-fields">
                <div class="form-field">
                    <p>Pubmat Image:</p>
                    <asp:Image ID="Image1" runat="server" />
                </div>
            </div>
        </div>
        <div class="form-section">
            <div id="incident-report" class="sub-header" onclick="toggleFormSections(this)">
                <p style="width: 90%;">Incident Report</p>
                <p id="incident-report-indicator" style="float: right; margin-right: 15px;">-</p>
            </div>
            <div id="incident-report-fields" class="form-fields">
                <div class="form-field">
                    <p>Incident:</p>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="text-boxs" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-section">
            <div id="comments-admin" class="sub-header" onclick="toggleFormSections(this)">
                <p style="width: 90%;">Comment</p>
                <p id="comments-admin-indicator" style="float: right; margin-right: 15px;">-</p>
            </div>
            <div id="comments-admin-fields" class="form-fields">
                <div class="form-field">
                    <p>Comments about this event:</p>
                    <asp:TextBox ID="tb_comment" runat="server" CssClass="text-boxs" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
                </div>
            </div>
        </div>
        <div style="width: 60%; margin: auto; margin-top: 30px; display: flex; flex-flow: row wrap; justify-content: space-around;">
            <p class="event-status">On-Going</p>
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
