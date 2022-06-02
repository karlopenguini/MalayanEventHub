using MalayanEventHub.Classes;
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
        string organizationID;
        string organizationName;
        string organizationAcronym;
        string organizationType;
        string college;
        string mission;
        string vision;
        
        DatabaseHandler dbHandler = new DatabaseHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetData();
            }
        }
        public class OrganizationData
        {
            public string Acronym { get; set; }
            public string OrganizationName { get; set; }
            public string OrganizationType { get; set; }
            public string OrganizationCollege { get; set; }
            public string Mission { get; set; }
            public string Vision { get; set; }
            public string OrganizationURL { get; set; }
        }

        protected void GetData()
        {
            List<OrganizationData> OrgRequests = new List<OrganizationData>();
            string query =
                "Select a.* from OrganizationTBL a inner join OrganizationRequestTBL b on a.organizationID = b.organizationId inner join RequestTBL c on b.requestId = c.requestID where c.requestStatus = 'Pending';";
            foreach (Dictionary<string, string> row in dbHandler.RetrieveData(query))
            {
                string organizationID = row["organizationID"];
                OrgRequests.Add(
                    new OrganizationData()
                    {
                        Acronym = row["organizationAcronym"],
                        OrganizationName = row["organizationName"],
                        OrganizationType = row["organizationType"],
                        OrganizationCollege = row["college"],
                        Mission = row["mission"],
                        Vision = row["vision"],
                        OrganizationURL = $"OrganizationReview.aspx?organizationID={organizationID}",
                    }
                );
            }
            OrganizationRequests.DataSource = OrgRequests;
            OrganizationRequests.DataBind();
        }
    }
}