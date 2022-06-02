using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MalayanEventHub.Layouts
{
    public partial class SiteLayout : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string role = Session["role"].ToString();
            btn_account.Text = Session["fullName"].ToString();
            List<Link> links = new List<Link>();

            if (role == "Admin")
            {
                links.Add(new Link() { url = "~/Pages/Admin/Events.aspx", lbl = "events" });
                links.Add(new Link() { url = "~/Pages/Admin/ViewOrganizations.aspx", lbl = "orgs" });
            }
            else
            {
                links.Add(new Link() { url = "~/Pages/User/UserViewCurrentEvents.aspx", lbl = "events" });
                links.Add(new Link() { url = "~/Pages/User/ViewTickets.aspx", lbl = "tickets" });
                links.Add(new Link() { url = "~/Pages/Organizer/OrganizationsOrganizer.aspx", lbl = "my orgs" });
            }
            linksrepeater.DataSource = links;
            linksrepeater.DataBind();
        }

        protected class Link
        {
            public string url { get; set; }
            public string lbl { get; set; }
        }
        protected void GotoUserAccPage(object sender, EventArgs e)
        {
            Response.Redirect("../User/UserProfilePage(update).aspx");
        }
    }
}