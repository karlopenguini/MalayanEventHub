using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MalayanEventHub.Layouts.Common.Admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!Page.IsPostBack)
            {
                EventData SampleEvent = new EventData
                {
                    ViolationDate = "MAR 23",
                    title = "ExampleA",
                    DateCreated = "02/18/22",
                    time = "8:34",
                    verdict = "VerdictA",
                    details = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                };
                List<EventData> SampleEvents = new List<EventData>();

                for (int i = 0; i < 9; i++)
                {
                    SampleEvents.Add(SampleEvent);
                }

                repeater_violation.DataSource = SampleEvents;
                repeater_violation.DataBind();
            }
        }
        public class EventData
        {
            public string ViolationDate { get; set; }
            public string title { get; set; }
            public string DateCreated { get; set; }
            public string time { get; set; }
            public string verdict { get; set; }
            public string details { get; set; }
            

        }
    }
}