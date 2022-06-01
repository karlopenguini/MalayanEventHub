<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/Common/Organizer/OrganizationView.master" AutoEventWireup="true" CodeBehind="OrgEventIncident.aspx.cs" Inherits="MalayanEventHub.Pages.Organizer.OrgEventIncident" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
    <link rel="stylesheet" href="../../Styles/MasterStyleSheet.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="form-body">
        <p class="header">Incident Information | Event ID #<asp:Label ID="lbl_eventID" runat="server" Text=""></asp:Label></p>
        <div class="form-section">
            <div id="event-section" class="sub-header" onclick="toggleFormSections(this)">
                <p style="width: 90%;">Incident Details</p>
                <p id="event-section-indicator" style="float: right; margin-right: 15px;">-</p>
            </div>
            <div id="event-section-fields" class="form-fields">
                <div class="form-field">
                    <p>Event Title:</p>
                    <asp:TextBox ID="tb_eventTitle" runat="server" CssClass="text-boxs" Enabled="False"></asp:TextBox>
                </div>
                <div class="form-field">
                    <div class="d-flex" style="flex-flow: row wrap; width: 100%; align-items: center;">
                        <asp:CustomValidator ID="cv_incident" runat="server" Text="*" ValidateEmptyText="true" ErrorMessage="Incident must not be empty" ControlToValidate="tb_incident" ValidationGroup="form" OnServerValidate="RequiredValue_ServerValidate" ></asp:CustomValidator>
                        <p>Incident:</p>
                    </div>
                    <asp:TextBox ID="tb_incident" runat="server" CssClass="text-boxs"></asp:TextBox>
                </div>
                <div class="form-field">
                    <div class="d-flex" style="flex-flow: row wrap; width: 100%; align-items: center;">
                        <asp:CustomValidator ID="cv_dateTime" Text="*" ValidateEmptyText="true" runat="server" ErrorMessage="Must provide a valid date and time" ValidationGroup="form" OnServerValidate="DateTime_ServerValidate"></asp:CustomValidator>
                        <p>Date and Time of Incident:</p>
                    </div>
                    <asp:TextBox ID="tb_dateTime" runat="server" CssClass="text-boxs" TextMode="DateTimeLocal"></asp:TextBox>
                </div>
                <div class="form-field">
                    <div class="d-flex" style="flex-flow: row wrap; width: 100%; align-items: center;">
                        <asp:CustomValidator ID="cv_details" runat="server" Text="*" ValidateEmptyText="true"  ErrorMessage="Specific details must not be empty" ControlToValidate="tb_details" ValidationGroup="form" OnServerValidate="RequiredValue_ServerValidate" ></asp:CustomValidator>
                        <p>Specific Details</p>
                    </div>
                    <asp:TextBox ID="tb_details" runat="server" CssClass="text-boxs" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
            <div style="width: 40%; display: block; margin: auto;">
                <asp:ValidationSummary ID="validate_summary" runat="server" Font-Size="Large" ForeColor="#990000" HeaderText="Invalid Submission:" ValidationGroup="form" />
            </div>
            <div style="width: 60%; margin: auto; margin-top: 30px; margin-bottom: 30px; display: flex; flex-flow: row wrap; justify-content: space-around;">
                <asp:Button ID="btn_submit" runat="server" CssClass="main-button" ForeColor="White" Text="Submit" Width="35%" ValidationGroup="form" CauseValidation="true" OnClick="btn_submit_Click"/>
                <asp:Button ID="btn_cancel" runat="server" CssClass="sub-button" Text="Cancel" Width="35%" OnClick="btn_cancel_Click" CausesValidation="false" />
            </div>
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
