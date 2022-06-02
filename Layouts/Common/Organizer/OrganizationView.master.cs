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
        string orgID;
        DatabaseHandler dbHandler = new DatabaseHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["organizationID"] = Request.QueryString["orgID"];
            orgID = Session["organizationID"].ToString();
            if (!Page.IsPostBack)
            {
                //orgID = SessionThing? 
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
    }
}