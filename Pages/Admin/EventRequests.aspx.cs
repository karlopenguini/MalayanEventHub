using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MalayanEventHub.Layouts.Common.Admin
{
    public partial class EventRequests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                EventData SampleEvent = new EventData
                {
                    ShortDate = "MAR 23",
                    EventImageURL = "../../Images/mcl_logo.png",
                    EventTitle = "Lorem ipsum dolor sit amet, consectetur adipiscing elit . . .",
                    EventDate = "May 27, 2022",
                    EventVenue = "Discord",
                    EventOrganizer = "MCL-ACM",
                    EventURL = "www.google.com",
                };
                List<EventData> SampleEvents = new List<EventData>();

                for (int i = 0; i < 9; i++)
                {
                    SampleEvents.Add(SampleEvent);
                }

                EventRequestsRepeater.DataSource = SampleEvents;
                EventRequestsRepeater.DataBind();
            }
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
    }
}