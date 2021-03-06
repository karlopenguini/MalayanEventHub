using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MalayanEventHub.Classes;

namespace MalayanEventHub.Pages.Organizer
{
    public partial class OrgEvents : System.Web.UI.Page
    {
        DatabaseHandler dbHandler = new DatabaseHandler();
        string organizationID;
        string type = "";
        string college = "";
        string date = "";
        string status = "";
        string now = DateTime.Now.ToString("yyyy-MM-dd");
        string startD = "";
        string endD = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["orgID"]))
            {
                Session["organizationID"] = Request.QueryString["orgID"];
            }
           
            organizationID = Session["organizationID"].ToString();
            if (!Page.IsPostBack)
            {
                GETEvents();
            }

        }
        protected class EventData
        {
            public string EventImageURL { get; set; }
            public string EventTitle { get; set; }
            public string EventDate { get; set; }
            public string EventVenue { get; set; }
            public string EventOrganizer { get; set; }
            public string EventURL { get; set; }
        }

        protected void GETEvents()
        {
            List<EventData> Events = new List<EventData>();
            college = ddl_college.SelectedValue;
            date = ddl_date.SelectedValue;
            status = ddl_status.SelectedValue;

            string dateQuery = "";
            switch (date)
            {

                case "All":
                    break;

                case "Today":
                    startD = now;
                    endD = now;
                    dateQuery += $"AND CONVERT(char(10), e.startDateTime,126) BETWEEN '{startD}' AND '{endD}'";

                    break;
                case "This Week":
                    startD = now;
                    endD = DateTime.Now.AddDays(7).ToString("yyyy-MM-dd");
                    dateQuery += $"AND CONVERT(char(10), e.startDateTime,126) BETWEEN '{startD}' AND '{endD}'";
                    break;
                case "This Month":
                    startD = now;
                    endD = DateTime.Now.AddDays(30).ToString("yyyy-MM-dd"); ;
                    dateQuery += $"AND CONVERT(char(10), e.startDateTime,126) BETWEEN '{startD}' AND '{endD}'";
                    break;
                case "Upcoming":
                    startD = now;
                    dateQuery += $"AND e.endDateTime > '{startD}'";
                    break;
                case "Past":
                     startD = now;
                     dateQuery += $"AND e.endDateTime < '{startD}'";
                     break;
                

            }


            string typeCollegeQuery = "";
            if (college != "All")
            {
                typeCollegeQuery = $"e.audienceCollege = '{college}' AND";
            }
            string query =
                        "SELECT e.eventID, e.pubmat, e.activityTitle, e.startDateTime, e.proposedVenue, OrganizationTBL.organizationAcronym, RequestTBL.requestStatus" +
                        " FROM EventTBL as e" +
                        " INNER JOIN EventRequestTBL ON e.eventID = EventRequestTBL.eventID" +
                        " INNER JOIN RequestTBL ON EventRequestTBL.requestID = RequestTBL.requestID" +
                        " INNER JOIN OrganizationTBL ON CAST(SUBSTRING(e.organizerID,0,CHARINDEX('-',e.organizerID,0)) as INT) = OrganizationTBL.organizationID" +
                        $" WHERE OrganizationTBL.organizationID ={organizationID}  AND {typeCollegeQuery} RequestTBL.requestStatus = '{status}' {dateQuery} " +
                        $" ORDER BY e.startDateTime ASC";



            foreach (Dictionary<string, string> row in dbHandler.RetrieveData(query))
            {
                string eventID = row["eventID"];

                string eventurl = "";

                switch (row["requestStatus"])
                {
                    case "Active":
                        eventurl = $"OrgEventInformation.aspx?eventId={eventID}";
                        break;
                    case "Rejected":
                        eventurl = $"OrgEventInformation.aspx?eventId={eventID}";
                        break;
                    case "Pending":
                        eventurl = $"OrgEventInformation.aspx?eventId={eventID}";
                        break;
                }



                string image;
                if (!String.IsNullOrEmpty(row["pubmat"]))
                {
                    //get base 64 string of Image
                    string queryImg = "SELECT imgBase64Str FROM EventTBL cross apply (select pubmat '*' for xml path('')) T (imgBase64Str) " +
                            $"WHERE eventID = {eventID}";
                    Dictionary<string, string> data2 = dbHandler.RetrieveData(queryImg)[0];
                    string base64 = data2["imgBase64Str"];
                    image = "data:image/png;base64, " + base64;
                }
                else
                {
                    image = "~/Images/mcl_logo.png";
                }

                Events.Add(
                    new EventData()
                    {
                        EventImageURL = image,
                        EventTitle = row["activityTitle"],
                        EventDate = row["startDateTime"],
                        EventVenue = row["proposedVenue"],
                        EventOrganizer = row["organizationAcronym"],
                        EventURL = eventurl,
                    }
                );
            }
            EventsRepeater.DataSource = Events;
            EventsRepeater.DataBind();
        }



        protected void ddl_type_SelectedIndexChanged(object sender, EventArgs e)
        {

            GETEvents();
        }

        protected void ddl_college_SelectedIndexChanged(object sender, EventArgs e)
        {

            GETEvents();
        }

        protected void ddl_date_SelectedIndexChanged(object sender, EventArgs e)
        {

            GETEvents();
        }

        protected void ddl_status_SelectedIndexChanged(object sender, EventArgs e)
        {

            GETEvents();
        }

        protected void btn_create_event_Click(object sender, EventArgs e)
        {
            Response.Redirect("OrgCreateEvent.aspx");
        }
    }
}