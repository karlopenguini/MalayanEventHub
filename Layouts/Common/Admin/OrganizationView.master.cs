using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MalayanEventHub.Classes;
namespace MalayanEventHub.Layouts.Common.Admin
{
    public partial class OrganizationView : System.Web.UI.MasterPage
    {
        string orgID;
        DatabaseHandler dbHandler = new DatabaseHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["orgID"]))
            {
                orgID = Request.QueryString["orgID"];
                Session["organizationID"] = orgID;
            }
            else if (Session["organizationID"] != null)
            {
                orgID = Session["organizationID"].ToString();
            }

            List<NavItems> items = new List<NavItems>();
            items.Add(new NavItems()
            {
                url= $"~/Pages/Admin/OrgDetails.aspx?orgID={orgID}",
                lbl="Org Details",
            });
            items.Add(new NavItems()
            {
                url = $"~/Pages/Admin/EventRequests.aspx?orgID={orgID}",
                lbl = "Event Requests",
            });
            items.Add(new NavItems()
            {
                url = $"~/Pages/Admin/OrganizationViolation.aspx?orgID={orgID}",
                lbl = "Org Violations",
            });

            string query = $"SELECT organizationStatus FROM OrganizationTBL WHERE organizationID = {orgID}";
            string status = dbHandler.RetrieveData(query)[0]["organizationStatus"];
           
            if(status == "Inactive")
            {
                btn_inactive.Visible = false;
            }

            linksrepeater.DataSource = items;
            linksrepeater.DataBind();

            if (!Page.IsPostBack)
            {
                GETOrg();
            }
        }

        protected void GETOrg()
        {
            string query = $"SELECT organizationName, organizationType, college, organizationStatus FROM OrganizationTBL WHERE organizationID = {orgID}";
            Dictionary<string, string> data = dbHandler.RetrieveData(query)[0];
            lbl_org_name.Text = data["organizationName"];
            lbl_org_type.Text = data["organizationType"];
            lbl_org_college.Text = data["college"];
            lbl_org_status.Text = data["organizationStatus"];
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
            string query = $"UPDATE OrganizationTBL SET organizationStatus = 'Deleted'  WHERE organizationID = {orgID}";
            dbHandler.ExecuteUpdateQuery(query);
        }

        protected void btn_inactive_Click(object sender, EventArgs e)
        {
            string query = $"UPDATE OrganizationTBL SET organizationStatus = 'Inactive'  WHERE organizationID = {orgID}";
            dbHandler.ExecuteUpdateQuery(query);
        }

        protected class NavItems
        {
            public string url { get; set; }
            public string lbl { get; set; }
        }
    }
}