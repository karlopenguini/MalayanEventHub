using System;
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
        string requestID = "";

        DatabaseHandler dbHandler = new DatabaseHandler();

        protected void Page_Load(object sender, EventArgs e)
        {
            eventID = Request.QueryString["eventId"];
            
            LoadEventData();
            LoadCheckBoxData();
            
            requestID = GetRequestID();
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
            TextBoxCollege.Text = AudienceCollege;
            TextBoxDegree.Text = AudienceDegree;
            TextBoxStartYear.Text = GradeYearStart;
            TextBoxEndYear.Text = GradeYearEnd;



            if (!String.IsNullOrEmpty(data["pubmat"]))
            {
                //get base 64 string of Imag
                string queryImg = "SELECT imgBase64Str FROM EventTBL cross apply (select pubmat '*' for xml path('')) T (imgBase64Str) " +
                        $"WHERE eventID = {eventID}";
                Dictionary<string, string> data2 = dbHandler.RetrieveData(queryImg)[0];
                string base64 = data2["imgBase64Str"];
                pubmatImg.ImageUrl = "data:image/png;base64, " + base64;
            }
        }



        protected string GetRequestID()
        {

            string query =
                "SELECT EventRequestTBL.requestID" +
                " FROM EventRequestTBL" +
                " INNER JOIN EventTBL ON EventTBL.eventID = EventRequestTBL.eventID" +
                $" WHERE {eventID} = EventRequestTBL.eventID;";
            requestID = dbHandler.RetrieveData(query)[0]["requestID"];
            return requestID;
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            string organizationID = OrgID.Split('-')[0];
            string query2 =
                "UPDATE OrganizationTBL" +
                $" SET organizationStatus = 'Active'" +
                $" WHERE {organizationID} = organizationID";
            dbHandler.ExecuteUpdateQuery(query2);

            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + requestID + "');", true);
            string now = DateTime.Now.ToString("dd-MM-yy hh:mm:ss");
            string query =
                "UPDATE RequestTBL" +
                $" SET requestStatus = 'Active', modified='{now}', feedback='{tb_comment.Text}'" +
                $" WHERE {requestID} = RequestTBL.requestID";
            dbHandler.ExecuteUpdateQuery(query);


            

            Response.Redirect($"ViewEvent.aspx?eventId={eventID}");
            
        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            string now = DateTime.Now.ToString("dd-MM-yy hh:mm:ss");
            string query =
                "UPDATE RequestTBL" +
                $" SET requestStatus = 'Rejected', modified='{now}', feedback='{tb_comment.Text}'" +
                $" WHERE {requestID} = RequestTBL.requestID";
            dbHandler.ExecuteUpdateQuery(query);
            Response.Redirect($"ViewEvent.aspx?eventId={eventID}");
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