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
        string logo;
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
        string member;

        DatabaseHandler dbHandler = new DatabaseHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            organizationID = Request.QueryString["organizationID"];
            if (!Page.IsPostBack)
            {
                LoadOrgData();
                LoadVice();
            }
            requestID = GetRequestID();
        }

        protected void LoadOrgData()
        {
            string query = $"Select * from OrganizationTBL where organizationID = {organizationID}";
            Dictionary<string, string> data = dbHandler.RetrieveData(query)[0];

            organizationName = data["organizationName"];
            //logo = data["logo"];
            organizationAcronym = data["organizationAcronym"];
            organizationType = data["organizationType"];
            organizationContact = data["organizationContact"];
            mission = data["mission"];
            vision = data["vision"];
            college = data["college"];
            adviser = data["adviser"];

            //img_logo.ImageUrl = data["logo"];
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
            string query = "select a.userId from MemberTBL a inner join OrganizationRequestTBL b on a.organizationId = b.organizationId " +
                $"where a.memberRole = 'President' and b.requestId = {requestID}; ";
            Dictionary<string, string> data = dbHandler.RetrieveData(query)[0];
            vice = data["userId"];
            tb_vice.Text = vice;
        }


        protected string GetRequestID()
        {

            string query =
                "SELECT OrgaizationRequestTBL.requestID" +
                " FROM OrgaizationRequestTBL" +
                " INNER JOIN OrganizationTBL ON OrganizationTBL.organizationID = OrgaizationRequestTBL.organizationID" +
                $" WHERE {organizationID} = OrgaizationRequestTBL.organizationID;";
            requestID = dbHandler.RetrieveData(query)[0]["requestID"];
            return requestID;
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