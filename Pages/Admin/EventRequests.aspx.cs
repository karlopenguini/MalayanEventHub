using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MalayanEventHub.Classes;

namespace MalayanEventHub.Layouts.Common.Admin
{
    public partial class EventRequests : System.Web.UI.Page
    {
        DatabaseHandler dbHandler = new DatabaseHandler();
        string organizerID = "80001";
        string type = "";
        string college = "";
        string date = "";
        string status = "";
        string now = DateTime.Now.ToString("yyyy-MM-dd");
        string startD = "";
        string endD = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            GETEvents();
        }
        public class EventData
        {
            public string ShortDate { get; set; }
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
            string query =
                        "SELECT e.eventID, e.pubmat, e.activityTitle, e.startDateTime, e.proposedVenue, OrganizationTBL.organizationAcronym, RequestTBL.requestStatus" +
                        " FROM EventTBL as e" +
                        " INNER JOIN EventRequestTBL ON e.eventID = EventRequestTBL.eventID" +
                        " INNER JOIN RequestTBL ON EventRequestTBL.requestID = RequestTBL.requestID" +
                        $" INNER JOIN OrganizationTBL ON {organizerID} = OrganizationTBL.organizationID";
            foreach (Dictionary<string, string> row in dbHandler.RetrieveData(query))
            {
                string eventID = row["eventID"];

                string eventurl = "";

                string image;

                if (!String.IsNullOrEmpty(row["pubmat"]))
                {
                    //get base 64 string of Imag
                    string queryImg = "SELECT imgBase64Str FROM EventTBL cross apply (select pubmat '*' for xml path('')) T (imgBase64Str) " +
                            $"WHERE eventID = {eventID}";
                    Dictionary<string, string> data2 = dbHandler.RetrieveData(queryImg)[0];
                    string base64 = data2["imgBase64Str"];
                    image = "data:image/png;base64, " + base64;
                }
                else
                {
                    image = "";
                }

                Events.Add(
                    new EventData()
                    {
                        ShortDate = DateTime.Parse(row["startDateTime"]).ToString("MMM dd").ToUpper(),
                        EventImageURL = image,
                        EventTitle = row["activityTitle"],
                        EventDate = row["startDateTime"],
                        EventVenue = row["proposedVenue"],
                        EventOrganizer = row["organizationAcronym"],
                        EventURL = $"EventReview.aspx?eventId={eventID}",
                    }
                );
            }
            EventRequestsRepeater.DataSource = Events;
            EventRequestsRepeater.DataBind();
        }
    }
}