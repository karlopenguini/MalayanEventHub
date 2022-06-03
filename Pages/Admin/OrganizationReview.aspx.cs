using MalayanEventHub.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MalayanEventHub.Layouts
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        string organizationID;
        string requestID;
        string organizationName;
        string organizationAcronym;
        string organizationType;
        string organizationContact;
        string mission;
        string vision;
        string college;
        string adviser;
        string vice;
        string treasurer;
        string secretary;

        DatabaseHandler dbHandler = new DatabaseHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            organizationID = Request.QueryString["orgID"].ToString();
            requestID = GetRequestID();
            if (!Page.IsPostBack)
            {
                LoadOrgData();
                LoadVice();
                LoadSecretary();
                LoadTreasurer();
                LoadImage();
                LoadMembers();
            }
            
        }

        protected void LoadOrgData()
        {
            string query = $"Select * from OrganizationTBL where organizationID = {organizationID}";
            Dictionary<string, string> data = dbHandler.RetrieveData(query)[0];

            organizationName = data["organizationName"];
            organizationAcronym = data["organizationAcronym"];
            organizationType = data["organizationType"];
            organizationContact = data["organizationContact"];
            mission = data["mission"];
            vision = data["vision"];
            college = data["college"];
            adviser = data["organizationAdviser"];


            tb_orgname.Text = organizationName;
            tb_acronym.Text = organizationAcronym;
            tb_type.Text = organizationType;
            tb_contact.Text = organizationContact;
            tb_mission.Text = mission;
            tb_college.Text = college;
            tb_vision.Text = vision;
            tb_adviser.Text = adviser;

        }

        protected void LoadVice()
        {
            string query = "select a.userId from MemberTBL as a inner join OrganizationRequestTBL as b on a.organizationId = b.organizationId " +
                $"where a.memberRole = 'Vice President' and b.requestId = {requestID}";
            Dictionary<string, string> data = dbHandler.RetrieveData(query)[0];
            vice = data["userId"];
            tb_vice.Text = vice;
        }

        protected void LoadSecretary()
        {
            string query = "select a.userId from MemberTBL as a inner join OrganizationRequestTBL as b on a.organizationId = b.organizationId " +
                $"where a.memberRole = 'Secretary' and b.requestId = {requestID}";
            Dictionary<string, string> data = dbHandler.RetrieveData(query)[0];
            secretary = data["userId"];
            tb_secretary.Text = secretary;
        }

        protected void LoadTreasurer()
        {
            string query = "select a.userId from MemberTBL as a inner join OrganizationRequestTBL as b on a.organizationId = b.organizationId " +
                $"where a.memberRole = 'Treasurer' and b.requestId = {requestID}";
            Dictionary<string, string> data = dbHandler.RetrieveData(query)[0];
            treasurer = data["userId"];
            tb_treasurer.Text = treasurer;
        }

        protected void LoadMembers()
        {
            List<MemberData> Members = new List<MemberData>();

            string query =
                "select CONCAT(a.firstName,' ',a.lastName) as full_name from UserTBL a inner join MemberTBL b on a.userID" +
                $"= b.userID where b.organizationID = '{organizationID}' and b.memberRole = 'Member';";

            foreach (Dictionary<string, string> row in dbHandler.RetrieveData(query))
            {
                Members.Add(
                    new MemberData()
                    {
                        MemberName = row["full_name"]
                    }
                );
            }

            member_lists.DataSource = Members;
            member_lists.DataBind();
        }

        protected class MemberData
        {
            public string MemberName { get; set; }
        }
        


        protected string GetRequestID()
        {

            string query =
                "SELECT OrganizationRequestTBL.requestID" +
                " FROM OrganizationRequestTBL" +
                " INNER JOIN OrganizationTBL ON OrganizationTBL.organizationID = OrganizationRequestTBL.organizationID" +
                $" WHERE {organizationID} = OrganizationRequestTBL.organizationID;";
            requestID = dbHandler.RetrieveData(query)[0]["requestID"];
            return requestID;
        }

        protected void LoadImage()
        {
            string queryImg = "SELECT imgBase64Str FROM OrganizationTBL cross apply (select logo '*' for xml path('')) T (imgBase64Str) " +
                        $"WHERE organizationID = {organizationID}";
            Dictionary<string, string> data2 = dbHandler.RetrieveData(queryImg)[0];
            string base64 = data2["imgBase64Str"];
            if (!String.IsNullOrEmpty(base64))
            {
                img_logo.ImageUrl = "data:image/png;base64, " + base64;
            }
        }

        protected void Btn_accept_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + requestID + "');", true);
            string now = DateTime.Now.ToString("dd-MM-yy hh:mm:ss");
            string query =
                "UPDATE RequestTBL" +
                $" SET requestStatus = 'Active', modified='{now}', feedback='{tb_comment.Text}'" +
                $" WHERE '{requestID}' = RequestTBL.requestID";
            dbHandler.ExecuteUpdateQuery(query);
            Response.Redirect($"ViewOrganizations.aspx?eventId={organizationID}");
        }

        protected void Btn_reject_Click(object sender, EventArgs e)
        {
            string now = DateTime.Now.ToString("dd-MM-yy hh:mm:ss");
            string query =
                "UPDATE RequestTBL" +
                $" SET requestStatus = 'Rejected', modified='{now}', feedback='{tb_comment.Text}'" +
                $" WHERE '{requestID}' = RequestTBL.requestID";
            dbHandler.ExecuteUpdateQuery(query);
            Response.Redirect($"ViewOrganizations.aspx?eventId={organizationID}");
        }
    }
}