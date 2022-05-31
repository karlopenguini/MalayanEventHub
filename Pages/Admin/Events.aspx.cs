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
            string query = "SELECT" +
                "r.Re.eventID, o.organizationAcronym, e.startDateTime, e.activityTitle, e.proposedVenue, e.pubmat" +
                "FROM EventTBL as e" +
                "INNER JOIN OrganizationTBL as o ON" +
                "e.organizerID = o.OrganizationID" +
                "INNER JOIN Req";

            foreach(Dictionary<string, string> row in dbHandler.RetrieveData(query))
            {
                string eventID = row["eventID"];
                Events.Add(
                    new EventData()
                    {
                        EventImageURL=row["pubmat"],
                        EventTitle=row["activityTitle"],
                        EventDate= row["startDateTime"],
                        EventVenue= row["proposedVenue"],
                        EventOrganizer= row["organizationAcronym"],
                        EventURL= $"ViewEvent.aspx?eventId={eventID}",
                    }
                );
            }
        }

    }
}