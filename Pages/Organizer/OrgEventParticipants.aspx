<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/Common/Organizer/OrganizationView.master" AutoEventWireup="true" CodeBehind="OrgEventParticipants.aspx.cs" Inherits="MalayanEventHub.Pages.Organizer.OrgEventParticipants" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
    <link rel="stylesheet" href="../../Styles/MasterStyleSheet.css" />
    <style>
         .mymodel-container{
            width: 95%;
            margin: 0 auto;
            padding: 5px;
            display: flex;
            flex-flow: row wrap;
            align-content: center;
            justify-content: space-around;
        }
        .mymodel-participant-card{
            width: 100%;
            height: 400px;
            box-shadow: 5px 8px 6px 8px #888888;
            border-radius: 5px;
        }
        .mymodel-participant-card .header p{
            margin:0;
        }
        .mymodel-participant-card .header{
            font-size: 25px;
            text-align: center;
            background-color:  #07084a;
            color: white;
            border-radius: 5px;
            padding: 5px 5px 5px 5px;
        }
        .mymodel-card-body{
            width: 100%;
            padding: 5px 10px 5px 10px;

        }
        .list-view{
            width: 95%;
            margin-left:auto;
            overflow-y: scroll;
            padding:5px;
        }
        .list-view label{
            display: inline-block;
            font-size: 24px;
            margin-bottom: 5px;
        }
        .list-view input[type='radio']{
            margin-bottom: 5px;
        }
        .dflex{
            flex-flow: row wrap;
        }
        .dflex div{
           width: 30%;
        }
        .vert-container{
            width: 45%;
           flex-basis: 45%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="form-body" >
        <asp:Button ID="btn_back" runat="server" Width="15%" CssClass="sub-button" style="margin-bottom: 35px;" Text="Back" OnClick="btn_back_Click" />
        <div class="form-section" style="margin-bottom: 35px;">
            <div class="form-fields">
                <p class="header">View Participant of Event ID# <asp:Label ID="lbl_eventID" runat="server" Text="00011"></asp:Label> </p>
                <div class="form-field">
                    <p>Event Title</p>
                    <asp:TextBox ID="tb_eventTitle" runat="server" CssClass="text-boxs" Enabled="false"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="mymodel-container" style="margin-bottom: 30px;">
                        <div style="width: 35%; ">
                             <asp:Button ID="btn_refresh" runat="server" CssClass="main-button" style="margin-bottom: 15px;" Text="Refresh" OnClick="btn_refresh_Click" />
                            <div class="mymodel-participant-card">
                                <div class="header">
                                     <p>Participant List</p>
                                </div>
                                <div style="width: 100%;">
                                    <asp:RadioButtonList ID="rb_listParticipants" runat="server" style="display: block;" AutoPostBack="True" CssClass="list-view" Height="360px" RepeatLayout="Flow" OnSelectedIndexChanged="rb_listParticipants_SelectedIndexChanged">
                                        
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                        </div>
                        <div style="width:58%; height: 600px;" class="mymodel-participant-card">
                             <div style="height:100%;">
                                <div class="header">
                                     <p>Participant Info</p>
                                </div>
                                <div style="height:90%; overflow-y: scroll;">
                                    <div class="form-fields"  style="width: 95%;">
                                        <div class="form-field d-flex" style="flex-flow: row wrap; justify-content: space-around;">
                                            <div class="vert-container">
                                                <p>First Name:</p>
                                                <asp:TextBox ID="tb_firstName" CssClass="text-boxs" Width="100%" runat="server" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div  class="vert-container">
                                                 <p>Last Name:</p>
                                                <asp:TextBox ID="tb_lastName" CssClass="text-boxs" Width="100%" runat="server" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div id="form_field_middleName" runat="server"   class="vert-container">
                                                <p>Middle Name:</p>
                                                <asp:TextBox ID="tb_middleName" CssClass="text-boxs" Width="100%" runat="server" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div id="form_field_studentNo"  runat="server" class="form-field">
                                            <p>Student No.</p>
                                            <asp:TextBox ID="tb_studentNo" CssClass="text-boxs" runat="server" Enabled="false"></asp:TextBox>
                                        </div>
                                        <div id="form_field_contactNo"   runat="server" class="form-field">
                                            <p>Contact No</p>
                                            <asp:TextBox ID="tb_contactNo" CssClass="text-boxs" runat="server" Enabled="false"></asp:TextBox>
                                        </div>
                                  
                                        <div id="form_field_email"  runat="server" class="form-field">
                                            <p>E-mail</p>
                                            <asp:TextBox ID="tb_email" CssClass="text-boxs" runat="server" Enabled="false"></asp:TextBox>
                                        </div>
                                         <div id="form_field_college"  runat="server" class="form-field">
                                            <p>College</p>
                                            <asp:TextBox ID="tb_college" CssClass="text-boxs" runat="server" Enabled="false"></asp:TextBox>
                                        </div>
                                        <div id="form_field_degree"  runat="server"  class="form-field">
                                            <p>Degree</p>
                                            <asp:TextBox ID="tb_degree" CssClass="text-boxs" runat="server" Enabled="false"></asp:TextBox>
                                        </div>
                                         <div id="form_field_year"  runat="server"  class="form-field">
                                            <p>Year Level</p>
                                            <asp:TextBox ID="tb_year" CssClass="text-boxs" runat="server" Enabled="false"></asp:TextBox>
                                        </div>
                                    </div>
                                  </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
</asp:Content>
