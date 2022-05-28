using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace MalayanEventHub.Layouts
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                EventData SampleEvent = new EventData
                {
                    EventImageURL = "../../Images/mcl_logo.png",
                    EventTitle = "Lorem ipsum dolor sit amet, consectetur adipiscing elit . . .",
                    EventDate = "May 27, 2022",
                    EventVenue = "Discord",
                    EventOrganizer = "MCL-ACM",
                    EventURL = "www.google.com",
                };
                List<EventData> SampleEvents = new List<EventData>();

                for(int i = 0; i < 9; i++)
                {
                    SampleEvents.Add(SampleEvent);
                }

                EventsRepeater.DataSource = SampleEvents;
                EventsRepeater.DataBind();
            }
            
        }
        public class EventData
        {
            public string EventImageURL { get; set; }
            public string EventTitle { get; set; }
            public string EventDate { get; set; }
            public string EventVenue { get; set; }
            public string EventOrganizer { get; set; }
            public string EventURL { get; set; }
        }
    }
}