using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using MalayanEventHub.Classes;

namespace MalayanEventHub.Layouts
{
    public partial class Events : System.Web.UI.Page
    {
        DatabaseHandler dbHandler = new DatabaseHandler();
        string type = "";
        string college = "";
        string date = "";
        string status = "";
        string now = DateTime.Now.ToString("yyyy-MM-dd");
        string startD = "";
        string endD = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                EventsRepeater.DataSource = GETEvents();
                EventsRepeater.DataBind();
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

        protected List<EventData> GETEvents()
        {
            List<EventData> Events = new List<EventData>();
            type = ddl_type.SelectedItem.Value;
            college = ddl_college.SelectedItem.Value;
            date = ddl_date.SelectedItem.Value;
            status = ddl_status.SelectedItem.Value;
            switch (date){
                case "Today":
                    startD = now;
                    endD = now;
                    break;
                case "This Week":
                    startD = now;
                    endD = DateTime.Now.AddDays(7).ToString("yyyy-MM-dd");
                    break;
                case "This Month":
                    startD = now;
                    endD = DateTime.Now.AddDays(30).ToString("yyyy-MM-dd");;
                    break;
            }

            string query =
                        "SELECT e.eventID, e.pubmat, e.activityTitle, e.startDateTime, e.proposedVenue, OrganizationTBL.organizationAcronym, RequestTBL.requestStatus" +
                        " FROM EventTBL as e" +
                        " INNER JOIN EventRequestTBL ON e.eventID = EventRequestTBL.eventID" +
                        " INNER JOIN RequestTBL ON EventRequestTBL.requestID = RequestTBL.requestID" +
                        " INNER JOIN OrganizationTBL ON CAST(SUBSTRING(e.organizerID,0,CHARINDEX('-',e.organizerID,0)) as INT) = OrganizationTBL.organizationID" +
                        $" WHERE OrganizationTBL.organizationType = '{type}' OR OrganizationTBL.college = '{college}' OR RequestTBL.requestStatus = '{status}' OR CONVERT(char(10), e.startDateTime,126) BETWEEN '{startD}' AND '{endD}';";

            foreach (Dictionary<string, string> row in dbHandler.RetrieveData(query))
            {
                string eventID = row["eventID"];

                string eventurl = "";

                switch (row["requestStatus"])
                {
                    case "Active": 
                        eventurl = $"ViewEvent.aspx?eventId={eventID}";
                        break;
                    case "Rejected":
                        eventurl = $"ViewEvent.aspx?eventId={eventID}";
                        break;
                    case "Pending":
                        eventurl = $"EventReview.aspx?eventId={eventID}";
                        break;
                }

                string image = row["pubmat"];

                if(DBNull.Value.Equals(row["pubmat"]))
                {
                    image = "~/Images/mcl_logo.png";
                }

                Events.Add(
                    new EventData()
                    {
                        EventImageURL= image,
                        EventTitle=row["activityTitle"],
                        EventDate= row["startDateTime"],
                        EventVenue= row["proposedVenue"],
                        EventOrganizer= row["organizationAcronym"],
                        EventURL= eventurl,
                    }
                );
            }
            return Events;
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