﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MalayanEventHub.Pages.Organizer
{
    public partial class OrgEventInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string eventId = Request.QueryString["eventID"];
            LabelTxtInfo.Text = eventId;
        }
    }
}