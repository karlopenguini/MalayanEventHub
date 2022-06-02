using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MalayanEventHub.Classes;

namespace MalayanEventHub
{
    public partial class ViewTickets : System.Web.UI.Page
    {
        DatabaseHandler dbHandler = new DatabaseHandler();
        int userID;
        protected void Page_Load(object sender, EventArgs e)
        {
            userID = Int32.Parse(Session["userID"].ToString());
            if (!Page.IsPostBack)
            {
                GETEvents();
            }
        }
        public class EventData
        {
            public string ShortDate { get; set; }
            public string EventImageURL { get; set; }
            public string EventTitle { get; set; }
            public string EventDate { get; set; }
            public string EventVenue { get; set; }
            public string EventInvitationText { get; set; }
            public string EventURL { get; set; }
        }

        protected void GETEvents()
        {
            List<EventData> Events = new List<EventData>();
            string query = "SELECT e.* FROM ParticipantTBL as p INNER JOIN EventTBL as e "+
                            $"ON p.eventId = e.eventID WHERE p.userId = {userID} " +
                            "ORDER BY p.dateRegistered DESC";
            foreach (Dictionary<string, string> row in dbHandler.RetrieveData(query))
            {
                string eventID = row["eventID"];

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
                    image = "";
                }
                if (String.IsNullOrEmpty(row["invitationLink"]))
                {
                    row["invitationLink"] = "None";
                }
                Events.Add(
                    new EventData()
                    {
                        ShortDate = DateTime.Parse(row["startDateTime"]).ToString("MMM dd").ToUpper(),
                        EventImageURL = image,
                        EventTitle = row["activityTitle"],
                        EventDate = row["startDateTime"],
                        EventVenue = row["proposedVenue"],
                        EventInvitationText = row["invitationLink"],
                        EventURL = $"ViewEventPage.aspx?eventId={eventID}",
                    }
                );
            }
            EventRequestsRepeater.DataSource = Events;
            EventRequestsRepeater.DataBind();
        }
    }
}