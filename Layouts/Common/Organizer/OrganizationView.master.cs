using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MalayanEventHub.Classes;

namespace MalayanEventHub.Layouts.Common.Organizer
{
    public partial class OrganizationView : System.Web.UI.MasterPage
    {
        string orgID2 = "";
        DatabaseHandler dbHandler2 = new DatabaseHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["orgID"]))
            {
                orgID2 = Request.QueryString["orgID"];
                Session["organizationID"] = orgID2;
            }
            else if(Session["organizationID"]!=null)
            {
                orgID2 = Session["organizationID"].ToString();
            }


            string query = $"SELECT MemberTBL.memberRole FROM MemberTBL INNER JOIN UserTBL ON UserTBL.userID = MemberTBL.userID WHERE MemberTBL.organizationID = {orgID2} AND MemberTBL.userID = {Session["userID"]}";
            string role = dbHandler2.RetrieveData(query)[0]["memberRole"];

            List<NavItems> items = new List<NavItems>();
            items.Add(new NavItems()
            {
                url = $"~/Pages/Organizer/OrgDetailsOrganizer.aspx?orgID={orgID2}&role='{role}'",
                lbl = "Org Details",
            });
            if(!role.Contains("Member")) 
            {
                items.Add(new NavItems()
                {
                    url = $"~/Pages/Organizer/OrgCreateEvent.aspx?orgID={orgID2}&role='{role}'",
                    lbl = "Create an Event",
                });
                items.Add(new NavItems()
                {
                    url = $"~/Pages/Organizer/OrgEvents.aspx?orgID={orgID2}&role='{role}'",
                    lbl = "See Events",
                });
            }
            linksrepeater.DataSource = items;
            linksrepeater.DataBind();

            if (!Page.IsPostBack)
            {
                //orgID = SessionThing? 
                if (!String.IsNullOrEmpty(orgID2))
                {
                    GETOrg();
                }
            }
        }
        protected void GETOrg()
        {
            string query = $"SELECT organizationName, organizationType, college, organizationStatus FROM OrganizationTBL WHERE organizationID = {orgID2}";
            Dictionary<string, string> data = dbHandler2.RetrieveData(query)[0];
            lbl_org_name.Text = data["organizationName"];
            lbl_org_type.Text = data["organizationType"];
            lbl_org_college.Text = data["college"];
            lbl_org_status.Text = data["organizationStatus"];
        }
        protected class NavItems
        {
            public string url { get; set; }
            public string lbl { get; set; }
        }
    }
}