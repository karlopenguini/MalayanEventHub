using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using MalayanEventHub.Classes;
using System.Web.UI.WebControls;

namespace MalayanEventHub.Layouts
{
    public partial class OrganizationsOrganizer : System.Web.UI.Page
    {
        DatabaseHandler dbHandler;
        string userID;

        string name;
        string type;
        string status;
        string college;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                dbHandler = new DatabaseHandler();
                userID = Request.QueryString["userID"];
            }
        }

        protected class OrganizationData
        {
            public string OrganizationLogo { get; set; }
            public string OrganizationName { get; set; }
            public string OrganizationType { get; set; }
            public string OrganizationStatus { get; set; }
            public string OrganizationCollege { get; set; }
        }

        protected void GETOrganizations()
        {
            List<OrganizationData> Organizations = new List<OrganizationData>();
            type = ddl_type.SelectedItem.Text;
            status = ddl_Status.SelectedItem.Text;
            college = ddl_college.SelectedItem.Text;

            string query =
                "SELECT OrganizationTBL.organizationID," +
                " OrganizationTBL.organizationName, OrganizationTBL.organizationType," +
                " OrganizationTBL.college FROM OrganizationTBL" +
                " INNER JOIN MemberTBL ON OrganizationTBL.organizationID = MemberTBL.organizationId" +
                $" WHERE MemberTBL.userId = {userID} AND (OrganizationTBL.organizationStatus = '{status}'" +
                $" AND OrganizationTBL.college = '{college}');";

            foreach(Dictionary<string, string> row in dbHandler.RetrieveData(query))
            {
                string organizationID = row["organizationID"];

                string logo = row["logo"];
                if (DBNull.Value.Equals(row["pubmat"]))
                {
                    logo = "~/Images/mcl_logo.png";
                }

                Organizations.Add(
                    new OrganizationData()
                    {
                        OrganizationLogo = logo,
                        OrganizationName = row["organizationName"],
                        OrganizationType = row ["organizationType"],
                        OrganizationStatus = row["organizationStatus"],
                        OrganizationCollege = row["college"],
                    }
                );
            }

            OrganizationsRepeater.DataSource = Organizations;
            OrganizationsRepeater.DataBind();
        }
        private void Load_ActiveOrganization()
        {
            string query = "SELECT OrganizationTBL.organizationID," +
                " OrganizationTBL.organizationName, OrganizationTBL.organizationType," +
                " OrganizationTBL.college FROM OrganizationTBL" +
                " INNER JOIN MemberTBL ON OrganizationTBL.organizationID = MemberTBL.organizationID" +
                $" WHERE MemberTBL.userId = {userID} AND OrganizationTBL.organizationStatus = 'Active'" +
                " AND MemberTBL.memberRole = 'President';";
        }

        private void Load_MemberOrganization()
        {
            string query = "SELECT OrganizationTBL.organizationID," +
                " OrganizationTBL.organizationName, OrganizationTBL.organizationType," +
                " OrganizationTBL.college FROM OrganizationTBL" +
                " INNER JOIN MemberTBL ON OrganizationTBL.organizationID = MemberTBL.organizationID" +
                $" WHERE MemberTBL.userId = {userID} AND OrganizationTBL.organizationStatus = 'Active'" +
                " AND MemberTBL.memberRole = 'Member';";
        }

        private void Load_PendingOrganization()
        {
            string query = "SELECT OrganizationTBL.organizationID," +
                " OrganizationTBL.organizationName, OrganizationTBL.organizationType," +
                " OrganizationTBL.college FROM OrganizationTBL" +
                " INNER JOIN MemberTBL ON OrganizationTBL.organizationID = MemberTBL.organizationID" +
                $" WHERE MemberTBL.userId = {userID} AND OrganizationTBL.organizationStatus = 'Pending';";
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
        }
    }
}