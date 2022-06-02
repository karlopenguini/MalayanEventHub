using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using MalayanEventHub.Classes;
using System.Web.UI.WebControls;

namespace MalayanEventHub.Pages.Organizer
{
    public partial class OrgDetailsOrganizer : System.Web.UI.Page
    {
        DatabaseHandler dbHandler = new DatabaseHandler();
        string organizationID;
        string userID;

        protected void Page_Load(object sender, EventArgs e)
        {
            organizationID = Request.QueryString["organizationID"];
            userID = Request.QueryString["userID"];
        }

        protected class OrganizationData
        {
            public string OrganizationLogo { get; set; }
            public string OrganizationName { get; set; }
            public string OrganizationType { get; set; }
            public string OrganizationStatus { get; set; }
            public string OrganizationCollege { get; set; }
            public string OrganizationURL { get; set; }
            public string OrganizationRole { get; set; }
        }

        protected void InsertData()
        {
            List<OrganizationData> Organizations = new List<OrganizationData>();

            string query =
                "SELECT OrganizationTBL.organizationID," +
                " OrganizationTBL.organizationName, OrganizationTBL.organizationType," +
                " OrganizationTBL.college, OrganizationTBL.logo, OrganizationTBL.organizationStatus FROM OrganizationTBL" +
                " INNER JOIN MemberTBL ON OrganizationTBL.organizationID = MemberTBL.organizationId" +
                $" WHERE MemberTBL.userId = {userID} AND OrganizationTBL.organizationID = {organizationID});";

            foreach (Dictionary<string, string> row in dbHandler.RetrieveData(query))
            {
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
                        OrganizationStatus = row["organizationStatus"],
                        OrganizationCollege = row["college"],
                        OrganizationRole = row["memberRole"],
                    }
                );
            }
        }
    }
}