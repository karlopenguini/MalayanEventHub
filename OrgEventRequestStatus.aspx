<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/OrganizerView.Master" AutoEventWireup="true" CodeBehind="OrgEventRequestStatus.aspx.cs" Inherits="MalayanEventHub.OrgEventRequestStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style type="text/css">
        body{
            margin:0;
            padding:0;
            width: 100%;
            font-family: 'Franklin Gothic',sans-serif;
            font-weight: 300;
        }
        .form-body{
           width: 60%;
           margin:0 auto;
           padding: 10px;
        }

        .form-section{
            width: 100%;
            margin-bottom: 60px;
        }

        .form-body .header{
            font-size: 35px;
            font-weight: bold;
        }

        .form-body .sub-header{
            
            font-size: 30px;
            padding-left: 10px;
            padding-top: 5px;
            padding-bottom: 5px;
            color: white;
            background-color: #07084a;
            border-radius: 5px;
        }
        .form-body .sub-header p{
           margin:0;
           display: inline-block;
        }
        .form-fields{
            width: 70%;
            margin: auto;
        }
        .sub-header:hover{
            cursor: pointer;
        }
        .form-field{
            display: flex;
            flex-flow: row wrap;
            align-items: center;
            align-self: center;
        }

     
        .form-field p{
            font-size: 26px;
            font-weight: 100;
        }

        .hide{
           display: none;
        }
        
        /*html form elements*/
        .text-boxs {
            margin-left: 16px;
            border-radius: 7px;
            font-size: 22px;
            flex-grow: 1;
            padding: 5px;
        }
        .dropdown-lists{
            margin-left: 16px;
            border-radius: 7px;
            font-size: 22px;
            flex-grow: 1;
            padding: 5px;
        }
        .check-boxs{
            list-style:none;
            margin-left: 16px;
            display:flex;
            flex-flow: row wrap;
            justify-content: flex-start;
            align-content: space-between;
        }
        .check-boxs li{
            flex-basis: 33%;
            font-size: 22px;
              margin-bottom: 15px;
        }
        label{
            margin: 16px 16px 30px 16px;
            border-radius: 7px;
            font-size: 22px;
            flex-grow: 1;
            padding: 5px;
            font-weight: 100;
        }
        input[type='checkbox']{
            /*//font-size: 30px;*/
            transform: scale(1.5);
          
        }

        textarea{
            flex-basis: 100%;
            height: 200px;
        }
        .main-button{
            background-color: #07084a;
            color: white;
        }
        .sub-button{
           width: 40%;
           margin-left: 20px;
        }
        input[type='submit']{
            padding-top: 8px;
            padding-bottom: 8px;
            font-size: 22px;
            border-radius: 5px;
        }

        input[type='submit']:hover,input[type='checkbox']:hover,input[type='file']:hover{
            text-decoration: underline;
            cursor: pointer;
        }

        .year-dropdown-lists{
            margin-left: 16px;
            margin-right: 10px;
            border-radius: 7px;
            font-size: 22px;
            width: 20%;
            padding: 5px;
        }
        .mleft-auto{
            margin-left: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                    <p>Event Title:</p>
                    <asp:TextBox ID="TextBoxTitle" runat="server" CssClass="text-boxs" Enabled="False" ></asp:TextBox>
                </div>
                <div class="form-field">
                    <p>Start Date & Time:</p>
                    <asp:TextBox ID="TextBoxStartDateTime" runat="server" CssClass="text-boxs" TextMode="DateTimeLocal" Enabled="False" ></asp:TextBox>
                </div>
                 <div class="form-field">
                    <p>End Date & Time:</p>
                    <asp:TextBox ID="TextBoxEndDateTime" runat="server" CssClass="text-boxs" TextMode="DateTimeLocal" Enabled="False" ></asp:TextBox>
                </div>
                 <div class="form-field">
                    <p>Venue:</p>
                    <asp:TextBox ID="TextBoxVenue" runat="server" CssClass="text-boxs" Enabled="False" ></asp:TextBox>
                </div>
                 <div class="form-field">
                    <p>Invitation Link:</p>
                    <asp:TextBox ID="TextBoxInvLink" runat="server" CssClass="text-boxs" TextMode="Url" Enabled="false"></asp:TextBox>
                </div>
                <div class="form-field">
                    <p>Objectives:</p>
                    <asp:TextBox ID="TextBoxObjectives" runat="server" CssClass="text-boxs" TextMode="MultiLine" Enabled="False" ></asp:TextBox>
                </div>
                <div class="form-field">
                    <p>Specific Details:</p>
                    <asp:TextBox ID="TextBoxSpecificDet" runat="server" CssClass="text-boxs" TextMode="MultiLine" Enabled="False" ></asp:TextBox>
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
                            <p>College:</p>
                            <asp:DropDownList ID="DropDownListCollege" CssClass="dropdown-lists" Enabled="False"  runat="server">
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
                            <asp:DropDownList ID="DropDownListDegree" CssClass="dropdown-lists" Enabled="False"  runat="server">
                                <asp:ListItem Value="" Selected="True" hidden="hidden">-- Please specify a College first.</asp:ListItem>
                                <asp:ListItem Value="All" >All</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-field">
                            <p>Year:</p>
                            <asp:DropDownList ID="DropDownListStartGradeYear" CSSClass="year-dropdown-lists" Enabled="False"  runat="server">
                                <asp:ListItem>--</asp:ListItem>
                                <asp:ListItem>All</asp:ListItem>
                            </asp:DropDownList>
                            <p>to</p>
                            <asp:DropDownList ID="DropDownListEndGradeYear" CSSClass="year-dropdown-lists" Enabled="False"  runat="server">
                                <asp:ListItem>--</asp:ListItem>
                                <asp:ListItem>All</asp:ListItem>
                            </asp:DropDownList>
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
                <p style="font-size: 24px;">Target Information of Participants:</p>
                <asp:CheckBoxList ID="CheckBoxListTargetData" runat="server" Width="100%" CssClass="check-boxs" Enabled="False"  RepeatLayout="UnorderedList">
                    <asp:ListItem >Student No.</asp:ListItem>
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
        <div class="form-section">
             <div id="pubmat-info" class="sub-header"  onclick="toggleFormSections(this)"> 
                <p style="width: 90%;">Publication Material</p>
                <p id="pubmat-info-indicator"  style="float: right; margin-right:15px;">-</p>
            </div>
            <div id="pubmat-info-fields" class="form-fields">
                <div class="form-field">
                    <p>Pubmat Image:</p>
                    <asp:FileUpload ID="FileUploadImg" runat="server" CssClass="text-boxs" accept="image/png, image/jpeg"  Enabled="False"  />
                </div>  
            </div>
        </div>
        <div  style="width: 60%; margin: auto; margin-top: 30px; display:flex; flex-flow: row wrap; justify-content: space-around;">
            <asp:Button ID="ButtonShowParticipants" runat="server" Text="Show Participants"  CssClass="main-button" Width="35%" />
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
