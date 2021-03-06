<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/Common/Admin/OrganizationView.master" AutoEventWireup="true" CodeBehind="EventReview.aspx.cs" Inherits="MalayanEventHub.Layouts.Common.Admin.EventReview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
    <link rel="stylesheet" href="../../Styles/MasterStyleSheet.css" />
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
                    <asp:TextBox ID="TextBoxStartDateTime" runat="server" CssClass="text-boxs" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-field">
                    <p>End Date & Time:</p>
                    <asp:TextBox ID="TextBoxEndDateTime" runat="server" CssClass="text-boxs" ReadOnly="true"></asp:TextBox>
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
                    <asp:TextBox ID="TextBoxCollege" CssClass="text-boxs" runat="server" ReadOnly="true">
                    </asp:TextBox>
                </div>
                <div class="form-field">
                    <p>Degree/Strand:</p>
                    <asp:TextBox ID="TextBoxDegree" CssClass="text-boxs" runat="server" ReadOnly="true">
                    </asp:TextBox>
                </div>
                <div class="form-field">
                    <p>Year:</p>
                    <asp:TextBox ID="TextBoxStartYear" CssClass="text-boxs" runat="server" ReadOnly="true">
                    </asp:TextBox>
                    <p>to</p>
                    <asp:TextBox ID="TextBoxEndYear" CssClass="text-boxs" runat="server" ReadOnly="true">
                    </asp:TextBox>
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
                <asp:CheckBoxList ID="cbl_targetData" runat="server" Width="100%" CssClass="check-boxs" RepeatLayout="UnorderedList" Enabled="False">
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
            <div id="pubmat-info" class="sub-header" onclick="toggleFormSections(this)">
                <p style="width: 90%;">Publication Material</p>
                <p id="pubmat-info-indicator" style="float: right; margin-right: 15px;">-</p>
            </div>
            <div id="pubmat-info-fields" class="form-fields">
                <div class="form-field">
                    <p>Pubmat Image:</p>
                    <asp:Image ID="pubmatImg" runat="server" />
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
                    <asp:TextBox ID="tb_comment" runat="server" CssClass="text-boxs" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
        </div>
        <div style="width: 60%; margin: auto; margin-top: 30px; margin-bottom: 30px;display: flex; flex-flow: row wrap; justify-content: space-around;">
            <asp:Button ID="ButtonSubmit" runat="server" Text="Accept"  BackColor="Green" CssClass="main-button" Width="35%" OnClick="ButtonSubmit_Click" ViewStateMode="Enabled" />
            <asp:Button ID="ButtonCancel" runat="server" Text="Reject" BackColor="Maroon" ForeColor="White" Width="35%" OnClick="ButtonCancel_Click" ViewStateMode="Enabled" />
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
