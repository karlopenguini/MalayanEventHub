using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MalayanEventHub.Layouts
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                EventData SampleEvent = new EventData
                {
                    MemberName = "Marvin Allen N. Requintina"
                };
                List<EventData> SampleEvents = new List<EventData>();

                for (int i = 0; i < 5; i++)
                {
                    SampleEvents.Add(SampleEvent);
                }

                member_lists.DataSource = SampleEvents;
                member_lists.DataBind();
            }
        }
        public class EventData
        {
            public string MemberName { get; set; }
        }
    }
}