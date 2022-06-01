﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MalayanEventHub.Classes;

namespace MalayanEventHub.Layouts.Common.Admin
{
    public partial class EventReview : System.Web.UI.Page
    {
        string eventID = "";
        string OrgID = "";
        string Title = "";
        string AudienceCollege = "";
        string AudienceDegree = "";
        string GradeYearStart = "";
        string GradeYearEnd = "";
        string StartDateTime = "";
        string EndDateTime = "";
        string Venue = "";
        string Objectives = "";
        string Details = "";
        string Pubmat = "";
        string InvitationLink = "";

        DatabaseHandler dbHandler;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                eventID = Request.QueryString["eventID"];
                dbHandler = new DatabaseHandler();
                LoadEventData();

            }
        }
        protected void LoadEventData()
        {
            string query = $"SELECT * FROM EventTBL WHERE eventID = {eventID}";
            Dictionary<string, string> data = dbHandler.RetrieveData(query)[0];

            OrgID = data["organizerID"];
            Title = data["activityTitle"];
            AudienceCollege = data["audienceCollege"];
            AudienceDegree = data["audienceDegree"];
            GradeYearStart = data["audienceGradeYearStart"];
            GradeYearEnd = data["audienceGradeYearEnd"];
            StartDateTime = data["startDateTime"];
            EndDateTime = data["endDateTime"];
            Venue = data["proposedVenue"];
            Objectives = data["objectives"];
            Details = data["details"];
            Pubmat = data["pubmat"];
            InvitationLink = data["invitationLink"];

            TextBoxTitle.Text = Title;
            TextBoxStartDateTime.Text = StartDateTime;
            TextBoxEndDateTime.Text = EndDateTime;
            TextBoxVenue.Text = Venue;
            TextBoxInvLink.Text = InvitationLink;
            TextBoxObjectives.Text = Objectives;
            TextBoxSpecificDet.Text = Details;
        }
    }
}