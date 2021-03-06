using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MalayanEventHub.Classes;

namespace MalayanEventHub
{
    public partial class UserViewCurrentEvents : System.Web.UI.Page
    {
        DatabaseHandler dbHandler = new DatabaseHandler();
        string type = "";
        string college = "";
        string date = "";
        string now = DateTime.Now.ToString("yyyy-MM-dd");
        string startD = "";
        string endD = "";
        protected void Page_Load(object sender, EventArgs e)
        {
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
            type = ddl_type.SelectedValue;
            college = ddl_college.SelectedValue;
            date = ddl_date.SelectedValue;

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
            }

            string typeQuery = $"OrganizationTBL.organizationType = '{type}' AND";
            if (type == "All")
            {
                typeQuery = "";
            }

            string collegeQuery =  $"OrganizationTBL.college = '{college}' AND";

            if (college == "All")
            {
                collegeQuery = "";
            }
           


            string query =
                        "SELECT e.eventID, e.pubmat, e.activityTitle, e.startDateTime, e.proposedVenue, OrganizationTBL.organizationAcronym, RequestTBL.requestStatus" +
                        " FROM EventTBL as e" +
                        " INNER JOIN EventRequestTBL ON e.eventID = EventRequestTBL.eventID" +
                        " INNER JOIN RequestTBL ON EventRequestTBL.requestID = RequestTBL.requestID" +
                        " INNER JOIN OrganizationTBL ON CAST(SUBSTRING(e.organizerID,0,CHARINDEX('-',e.organizerID,0)) as INT) = OrganizationTBL.organizationID" +
                        $" WHERE {typeQuery} {collegeQuery} RequestTBL.requestStatus = 'Active' {dateQuery} " +
                        $" AND IIF(e.audienceGradeYearStart>=11,e.audienceGradeYearStart-12, e.audienceGradeYearStart ) <= {Session["yearLevel"]}" +
                        $" AND {Session["yearLevel"]} <= " +
                        $" IIF(e.audienceGradeYearEnd>=11,e.audienceGradeYearEnd-12, e.audienceGradeYearEnd ) ;";



            foreach (Dictionary<string, string> row in dbHandler.RetrieveData(query))
            {
                string eventID = row["eventID"];
                string image = row["pubmat"];

                if (!String.IsNullOrEmpty(row["pubmat"]))
                {
                    //get base 64 string of Imag
                    string queryImg = "SELECT imgBase64Str FROM EventTBL cross apply (select pubmat '*' for xml path('')) T (imgBase64Str) " +
                            $"WHERE eventID = {eventID}";
                    Dictionary<string, string> data = dbHandler.RetrieveData(queryImg)[0];
                    string base64 = data["imgBase64Str"];
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
                        EventURL = $"ViewEventPage.aspx?eventId={eventID}"
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
    }
}