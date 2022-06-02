using MalayanEventHub.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MalayanEventHub.Layouts
{
    public partial class ViewOrganizations : System.Web.UI.Page
    {
        string organizationID;
        DatabaseHandler dbHandler = new DatabaseHandler();

        string type;
        string college;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                organizationID = Request.QueryString["organizationID"];

                OrganizationData SampleOrganization = new OrganizationData();
                GETOrganizations();

            }
        }

        protected class OrganizationData
        {
            public string OrganizationLogo { get; set; }
            public string OrganizationName { get; set; }
            public string OrganizationType { get; set; }
            public string OrganizationCollege { get; set; }
            public string OrganizationURL { get; set; }
        }

        protected void GETOrganizations()
        {
            List<OrganizationData> Organizations = new List<OrganizationData>();
            type = ddl_type.SelectedItem.Text;
            college = ddl_college.SelectedItem.Text;

            string query =
                $"Select * from OrganizationTBL where college = '{college}' and organizationType = '{type}';";


            foreach (Dictionary<string, string> row in dbHandler.RetrieveData(query))
            {
                string organizationID = row["organizationID"];
                string organizationURL = $"orgID={organizationID}";


                string logo = row["logo"];
                if (DBNull.Value.Equals(row["logo"]))
                {
                    logo = "~/Images/mcl_logo.png";
                }

                Organizations.Add(
                    new OrganizationData()
                    {
                        OrganizationLogo = logo,
                        OrganizationName = row["organizationName"],
                        OrganizationType = row["organizationType"],
                        OrganizationCollege = row["college"],
                        OrganizationURL = organizationURL,
                    }
                );
            }

            OrganizationsRepeater.DataSource = Organizations;
            OrganizationsRepeater.DataBind();
        }

        protected void ddl_type_SelectedIndexChanged(object sender, EventArgs e)
        {
            GETOrganizations();
        }

        protected void ddl_college_SelectedIndexChanged(object sender, EventArgs e)
        {
            GETOrganizations();
        }

        protected void Btn_requests_Click(object sender, EventArgs e)
        {
            Response.Redirect("OrganizationRequestsView.aspx?userID=" + organizationID);
        }
    }
}