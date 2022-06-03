using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MalayanEventHub.Classes;
namespace MalayanEventHub.Layouts.Common.Admin
{
    public partial class ViewEvent : System.Web.UI.Page
    {
        string eventID = "";
        string OrgID = "";
        string Title = "";
        string Status = "";
        string Feedback = "";
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
            eventID = Request.QueryString["eventId"];
            dbHandler = new DatabaseHandler();
            if (!Page.IsPostBack)
            {
                LoadEventData();
                LoadEventIncident();
                LoadCheckBoxData();
            }
        }
        private void LoadEventIncident()
        {
            string query = $"SELECT * FROM IncidentReportTBL WHERE eventID={eventID}";
            var records = dbHandler.RetrieveData(query);
            if (records.Count == 0)
            {
                tb_incident_report.Text = "No incident reported.";
                return;
            }
            List<string> list = new List<string>();
            foreach(var record in records)
            {
                string incident = $"Incident Report: ({record["title"]})\n" +
                      $"DateTime: {record["reportDate"]}\n" +
                      $"Details: {record["details"]}\n";
                list.Add(incident);
            }
            tb_incident_report.Text = String.Join("==========================================\n\n", list);
        } 


        protected void LoadEventData()
        {
            string query = $"SELECT e.*, RequestTBL.feedback, RequestTBL.requestStatus FROM EventTBL as e" +
                $" INNER JOIN EventRequestTBL ON e.eventID = EventRequestTBL.eventID" +
                $" INNER JOIN RequestTBL ON EventRequestTBL.requestID = RequestTBL.requestID" +
                $" WHERE EventRequestTBL.eventID = {eventID}";
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
            Status = data["requestStatus"];
            Feedback = data["feedback"];
            InvitationLink = data["invitationLink"];

            TextBoxTitle.Text = Title;
            TextBoxStartDateTime.Text = StartDateTime;
            TextBoxEndDateTime.Text = EndDateTime;
            TextBoxVenue.Text = Venue;
            TextBoxInvLink.Text = InvitationLink;
            TextBoxObjectives.Text = Objectives;
            TextBoxSpecificDet.Text = Details;
            TextBoxCollege.Text = AudienceCollege;
            TextBoxDegree.Text = AudienceDegree;
            TextBoxStartYear.Text = GradeYearStart;
            TextBoxEndYear.Text = GradeYearEnd;
            tb_status.Text = Status;
            tb_comment.Text = Feedback;


            if (!String.IsNullOrEmpty(data["pubmat"]))
            {
                //get base 64 string of Imag
                string queryImg = "SELECT imgBase64Str FROM EventTBL cross apply (select pubmat '*' for xml path('')) T (imgBase64Str) " +
                        $"WHERE eventID = {eventID}";
                Dictionary<string, string> data2 = dbHandler.RetrieveData(queryImg)[0];
                string base64 = data2["imgBase64Str"];
                pubmatImg.ImageUrl = "data:image/png;base64, " + base64;
            }
            else
            {
                pubmatImg.ImageUrl = "~/Images/mcl_logo.png";
            }
        }
    
        private void LoadCheckBoxData()
        {
            string query2 = $"SELECT * FROM RequiredInformationTBL Where eventID = {eventID}";
            List<Dictionary<string, string>> dl_targetData = dbHandler.RetrieveData(query2);

            foreach (Dictionary<string, string> record in dl_targetData)
            {
                ListItem item = cbl_targetData.Items.FindByValue(record["dataOfParticipant"]);
                item.Selected = true;
                item.Enabled = false;
            }
        }
    }
}