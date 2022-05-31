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
    public partial class Events : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!Page.IsPostBack)
            //{
            //    EventData SampleEvent = new EventData
            //    {
            //        EventImageURL = "../../Images/mcl_logo.png",
            //        EventTitle = "Lorem ipsum dolor sit amet, consectetur adipiscing elit . . .",
            //        EventDate = "May 27, 2022",
            //        EventVenue = "Discord",
            //        EventOrganizer = "MCL-ACM",
            //        EventURL = "ViewEvent.aspx",
            //    };
            //    List<EventData> SampleEvents = new List<EventData>();

            //    for(int i = 0; i < 9; i++)
            //    {
            //        SampleEvents.Add(SampleEvent);
            //    }

            //    EventsRepeater.DataSource = SampleEvents;
            //    EventsRepeater.DataBind();
            //}
            
        }
        //public class eventdata
        //{
        //    public string eventimageurl { get; set; }
        //    public string eventtitle { get; set; }
        //    public string eventdate { get; set; }
        //    public string eventvenue { get; set; }
        //    public string eventorganizer { get; set; }
        //    public string eventurl { get; set; }
        //}
    }
}