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
        string userID;
        DatabaseHandler dbHandler = new DatabaseHandler();

        string type;
        string status;
        string college;
        string role;
        protected void Page_Load(object sender, EventArgs e)
        {
            userID = Session["userID"].ToString();
            if (!Page.IsPostBack)
            {
                OrganizationData SampleOrganization = new OrganizationData();
                GETOrganizations();
            }
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

        protected void GETOrganizations()
        {
            List<OrganizationData> Organizations = new List<OrganizationData>();
            type = ddl_type.SelectedItem.Text;
            status = ddl_Status.SelectedItem.Text;
            college = ddl_college.SelectedItem.Text;
            role = ddl_Role.SelectedItem.Text;

            string typeQuery = $" AND OrganizationTBL.organizationType = '{type}'";
            string roleQuery = $" AND MemberTBL.memberRole = '{role}'";

            if (type == "All")
            {
                typeQuery = "";
            }

            if (role == "All")
            {
                roleQuery = "";
            }

            string query =
                "SELECT OrganizationTBL.organizationID," +
                " OrganizationTBL.organizationName, OrganizationTBL.organizationType," +
                " OrganizationTBL.college, OrganizationTBL.logo, OrganizationTBL.organizationStatus, MemberTBL.memberRole FROM OrganizationTBL" +
                " INNER JOIN MemberTBL ON OrganizationTBL.organizationID = MemberTBL.organizationId" +
                $" WHERE MemberTBL.userId = {userID} AND (OrganizationTBL.organizationStatus = '{status}'" +
                $" AND OrganizationTBL.college = '{college}'{typeQuery}{roleQuery});";

            foreach(Dictionary<string, string> row in dbHandler.RetrieveData(query))
            {
                string organizationID = row["organizationID"];
                string role = row["memberRole"];
                string organizationURL = $"?orgID={organizationID}&role={role}";
   

                string logo = row["logo"];
                if (!String.IsNullOrEmpty(row["logo"]))
                {
                    //get base 64 string of Imag
                    string queryImg = "SELECT imgBase64Str FROM OrganizationTBL cross apply (select logo '*' for xml path('')) T (imgBase64Str) " +
                            $"WHERE organizationID = {organizationID}";
                    Dictionary<string, string> data = dbHandler.RetrieveData(queryImg)[0];
                    string base64 = data["imgBase64Str"];
                    logo = "data:image/png;base64, " + base64;
                }

                Organizations.Add(
                    new OrganizationData()
                    {
                        OrganizationLogo = logo,
                        OrganizationName = row["organizationName"],
                        OrganizationType = row ["organizationType"],
                        OrganizationStatus = row["organizationStatus"],
                        OrganizationCollege = row["college"],
                        OrganizationURL = organizationURL,
                        OrganizationRole = row["memberRole"],
                    }
                );
            }

            OrganizationsRepeater.DataSource = Organizations;
            OrganizationsRepeater.DataBind();
        }

        protected void Organizations_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Fetch controls
                Label status = (Label)e.Item.FindControl("lbl_Status") as Label;
                Label role = (Label)e.Item.FindControl("lbl_Role") as Label;
                LinkButton btn_Details = (LinkButton)e.Item.FindControl("btn_Details") as LinkButton;
                LinkButton btn_CreateEvent = (LinkButton)e.Item.FindControl("btn_CreateEvent") as LinkButton;
                LinkButton btn_ViewEvent = (LinkButton)e.Item.FindControl("btn_ViewEvent") as LinkButton;
                LinkButton btn_Violations = (LinkButton)e.Item.FindControl("btn_Violations") as LinkButton;

                // If pending status, disable LinkButton controls and change text of Buttons to "Pending"
                if (status.Text == "Pending" || status.Text == "Rejected")
                {
                    btn_Details.Enabled = false;
                    btn_Details.Text = status.Text;

                    btn_CreateEvent.Enabled = false;
                    btn_CreateEvent.Text = status.Text;

                    btn_ViewEvent.Enabled = false;
                    btn_ViewEvent.Text = status.Text;


                }
                else if (role.Text == "Member") {

                    btn_CreateEvent.Enabled = false;
                    btn_CreateEvent.Text = "-----";

                    btn_ViewEvent.Enabled = false;
                    btn_ViewEvent.Text = "-----";
                }
            }
        }

        protected void ddl_type_SelectedIndexChanged(object sender, EventArgs e)
        {
            GETOrganizations();
        }

        protected void ddl_college_SelectedIndexChanged(object sender, EventArgs e)
        {
            GETOrganizations();
        }

        protected void ddl_Status_SelectedIndexChanged(object sender, EventArgs e)
        {
            GETOrganizations();
        }
        
        protected void ddl_Role_SelectedIndexChanged(object sender, EventArgs e)
        {
            GETOrganizations();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("OrgRegistration.aspx");
        }
    }
}