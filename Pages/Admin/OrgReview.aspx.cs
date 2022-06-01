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
        string organizationAdviser;
        string organizationContact;
        string organizationStatus;
        string mission;
        string vision;
        string college;
        string logo;
        string requestID;

        DatabaseHandler dbHandler = new DatabaseHandler();
        

        //di nag rereference dito yung mga textbox na ginawa ko
        protected void Page_Load(object sender, EventArgs e)
        {
            organizationID = Request.QueryString["organizationID"];
        }
       

        protected void LoadOrganizationData()
        {
            //kulang ng  query for vice, treasurer, secretary
            string query = $"SELECT * FROM OrganizationTBL WHERE organizationID = {organizationID}";
            Dictionary<string, string> data = dbHandler.RetrieveData(query)[0];

            organizationName = data["organizationName"];
            organizationAcronym = data["organizationAcronym"];
            organizationType = data["organizationType"];
            organizationAdviser = data["organizationAdviser"];
            organizationContact = data["organizationContact"];
            organizationStatus = data["organizationStatus"];
            //vicenName=data['di ko pa alam'];
            //treasusrerName=data['di ko pa alam'];
            //secretaryName=data['di ko pa alam'];
            mission = data["mission"];
            vision = data["vision"];
            college = data["college"];

            tb_orgname.Text = organizationName;
          //tb_vice.Text = viceName;
          //tb_treasurer.Text = treasurerName;
          //tb_secretary.Text= secretaryName;
            tb_acronym.Text = organizationAcronym;
            tb_type.Text = organizationType;
            tb_contact.Text = organizationContact;
            tb_adviser.Text = organizationAdviser;
            tb_mission.Text = mission;
            tb_vision.Text = vision;
            tb_college.Text = college;
        }

        protected string GetRequestID()
        {

            string query =
                "SELECT OrganizationRequestTBL.requestID" +
                " FROM OrganizationRequestTBL" +
                " INNER JOIN OrganizationTBL ON OrganizationTBL.organizationID = OrganizationRequestTBL.organizationID" +
                $"WHERE {organizationID} = OrganizationRequestTBL.organizationID;";

            requestID = dbHandler.RetrieveData(query)[0]["requestID"];
            return requestID;
        }


        //wala akong feedback. Accept and Reject lang.
        protected void Btn_accept_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + requestID + "');", true);
            string now = DateTime.Now.ToString("dd-MM-yy hh:mm:ss");
            string query =
                "UPDATE RequestTBL" +
                $" SET requestStatus = 'Active', modified='{now}'" +
                $" WHERE '{requestID}' = RequestTBL.requestID";
            dbHandler.ExecuteUpdateQuery(query);
        }

        protected void Btn_reject_Click(object sender, EventArgs e)
        {
            string now = DateTime.Now.ToString("dd-MM-yy hh:mm:ss");
            string query =
                "UPDATE RequestTBL" +
                $" SET requestStatus = 'Rejected', modified='{now}'" +
                $" WHERE '{requestID}' = RequestTBL.requestID";
            dbHandler.ExecuteUpdateQuery(query);
        }
    }
}