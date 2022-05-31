<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/Common/Organizer/OrganizationView.master" AutoEventWireup="true" CodeBehind="OrgEventParticipants.aspx.cs" Inherits="MalayanEventHub.Pages.Organizer.OrgEventParticipants" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
    <link rel="stylesheet" href="../../Styles/MasterStyleSheet.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <div class="form-body">
        <div class="form-section">
            <div class="form-fields">
                <p class="header">View Participant</p>
                <div class="form-field">
                    <p>Event Title</p>
                    <asp:TextBox ID="TextBoxEventTitle" runat="server" CssClass="text-boxs" Enabled="false"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="mymodel-container" style="margin-bottom: 30px;">
                        <div style="width: 35%; padding: 20px; ">
                            <div class="mymodel-participant-card">
                                <div class="header">
                                     <p>Participant List</p>
                                </div>
                                <div style="width: 100%;">
                                    <asp:RadioButtonList ID="RadioButtonListParticipants" runat="server" style="display: block;" AutoPostBack="True" CssClass="list-view" Height="360px" RepeatLayout="Flow">
                                        <asp:ListItem>James Michael Paz</asp:ListItem>
                                        <asp:ListItem>Karlo Palisoc</asp:ListItem>
                                        <asp:ListItem>Student</asp:ListItem>
                                        <asp:ListItem>Student</asp:ListItem>
                                        <asp:ListItem>Student</asp:ListItem>
                                        <asp:ListItem>Student</asp:ListItem>
                                        <asp:ListItem>Student</asp:ListItem>
                                        <asp:ListItem>Student</asp:ListItem>
                                        <asp:ListItem>Student</asp:ListItem>
                                        <asp:ListItem>Student</asp:ListItem>
                                        <asp:ListItem>Student</asp:ListItem>
                                        <asp:ListItem>Student</asp:ListItem>
                                        <asp:ListItem>Student</asp:ListItem>
                                        <asp:ListItem>Student</asp:ListItem>
                                         <asp:ListItem>Student</asp:ListItem>
                                        <asp:ListItem>Student</asp:ListItem>
                                        <asp:ListItem>Student</asp:ListItem>
                                        <asp:ListItem>Student</asp:ListItem>
                                        <asp:ListItem>Student</asp:ListItem>
                                        
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                        </div>
                        <div style="width:55%; height: 600px;" class="mymodel-participant-card">
                             <div style="height:100%;">
                                <div class="header">
                                     <p>Participant Info</p>
                                </div>
                                <div style="height:90%; overflow-y: scroll;">
                                    <div class="form-fields" >
                                        <div class="form-field">
                                            <p>First Name:</p>
                                            <asp:TextBox ID="TextBoxFirstName" CssClass="text-boxs" runat="server" Enabled="false"></asp:TextBox>
                                        </div>
                                        <div class="form-field">
                                            <p>Middle Name:</p>
                                            <asp:TextBox ID="TextBoxMiddleName" CssClass="text-boxs" runat="server" Enabled="false"></asp:TextBox>
                                        </div>
                                        <div class="form-field">
                                            <p>Last Name:</p>
                                            <asp:TextBox ID="TextBoxLastName" CssClass="text-boxs" runat="server" Enabled="false"></asp:TextBox>
                                        </div>
                                        <div class="form-field">
                                            <p>Student No.</p>
                                            <asp:TextBox ID="TextBoxStudentNo" CssClass="text-boxs" runat="server" Enabled="false"></asp:TextBox>
                                        </div>
                                        <div class="form-field">
                                            <p>Contact No</p>
                                            <asp:TextBox ID="TextBoxContactNo" CssClass="text-boxs" runat="server" Enabled="false"></asp:TextBox>
                                        </div>
                                        <div class="form-field">
                                            <p>E-mail</p>
                                            <asp:TextBox ID="TextBoxEmail" CssClass="text-boxs" runat="server" Enabled="false"></asp:TextBox>
                                        </div>
                                         <div class="form-field">
                                            <p>College</p>
                                            <asp:TextBox ID="TextBoxCollege" CssClass="text-boxs" runat="server" Enabled="false"></asp:TextBox>
                                        </div>
                                        <div class="form-field">
                                            <p>Major</p>
                                            <asp:TextBox ID="TextBoxMajor" CssClass="text-boxs" runat="server" Enabled="false"></asp:TextBox>
                                        </div>
                                         <div class="form-field">
                                            <p>Year Level</p>
                                            <asp:TextBox ID="TextBoxYearLvl" CssClass="text-boxs" runat="server" Enabled="false"></asp:TextBox>
                                        </div>
                                    </div>
                                  </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
</asp:Content>
