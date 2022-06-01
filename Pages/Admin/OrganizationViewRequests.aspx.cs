using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MalayanEventHub.Layouts
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                EventData SampleEvent = new EventData
                {
                    Acronym = "ACM",
                    OrganizationName = "Association for Computing Machinery",
                    OrganizationType = "Educational",
                    OrganizationCollege = "CCIS",
                    Mission = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    Vision = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    EventURL = "www.google.com",
                };
                List<EventData> SampleEvents = new List<EventData>();

                for (int i = 0; i < 9; i++)
                {
                    SampleEvents.Add(SampleEvent);
                }

                OrganizationRequests.DataSource = SampleEvents;
                OrganizationRequests.DataBind();
            }
        }
        public class EventData
        {
            public string Acronym { get; set; }
            public string OrganizationName { get; set; }
            public string OrganizationType { get; set; }
            public string OrganizationCollege { get; set; }
            public string Mission { get; set; }
            public string Vision { get; set; }
            public string EventURL { get; set; }
        }
    }
}