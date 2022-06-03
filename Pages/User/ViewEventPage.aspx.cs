using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MalayanEventHub.Classes;


namespace MalayanEventHub.Layouts
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        private string eventID = "";
        private string userID;
        DatabaseHandler dbHandler = new DatabaseHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            eventID = Request.QueryString["eventID"];
            userID = Session["userID"].ToString();
            if (!Page.IsPostBack)
            {
                this.LoadData();

                if (!CheckUserParticipant())
                {
                    btn_register.Attributes.Add("style", "font-size: 20px; padding: 20px; border-color: #0070EE; border-radius: 7px; border-width: thin; color: #0070EE; background-color: white;");
                    btn_register.Text = "Register";
                }
                else
                {
                    btn_register.Attributes.Add("style", "font-size: 20px; padding: 20px; border-color: red; border-radius: 7px; border-width: thin; color: red; background-color: white;");
                    btn_register.Text = "Unregister";
                }
            }
        }

        private void LoadData()
        {
            string query = "SELECT e.*, o.organizationName FROM EventTBL as e INNER JOIN OrganizationTBL as o " +
                "ON  o.organizationID =  CAST(SUBSTRING(e.organizerID,0,CHARINDEX('-',e.organizerID,0)) as INT)" +
                $"WHERE e.eventID ={eventID}";
            List<Dictionary<string, string>> dataList = dbHandler.RetrieveData(query);
            if (dataList.Count == 0)
            {
                return;
            }
            Dictionary<string, string> eventDataList = dataList[0];

            //set the values to the controls
            //format the dates
            DateTime startDT = DateTime.Parse(eventDataList["startDateTime"]);
            DateTime endDT = DateTime.Parse(eventDataList["endDateTime"]);

            lbl_title.Text = eventDataList["activityTitle"];
            lbl_startDate.Text = startDT.ToString("MM/dd/yyyy");
            lbl_endDate.Text = endDT.ToString("MM/dd/yyyy");
            p_about.InnerText = eventDataList["details"];
            p_venue.InnerText = eventDataList["proposedVenue"];
            lbl_org.Text = eventDataList["organizationName"];

            //image
            if (!String.IsNullOrEmpty(eventDataList["pubmat"]))
            {
                eventDataList.Clear();
                string queryImg = "SELECT imgBase64Str FROM EventTBL cross apply (select pubmat '*' for xml path('')) T (imgBase64Str) " +
                               $"WHERE eventID = {eventID}";
                Dictionary<string, string> data = dbHandler.RetrieveData(queryImg)[0];
                string base64 = data["imgBase64Str"];
                img_event.ImageUrl = "data:image/png;base64, " + base64;
            }
            else
            {
                img_event.ImageUrl = "~/Images/mcl_logo.png";
            }
        }

        protected void btn_register_Click(object sender, EventArgs e)
        {

            if (CheckUserParticipant())
            {
                UnRegiser_User();
                btn_register.Attributes.Add("style", "font-size: 20px; padding: 20px; border-color: #0070EE; border-radius: 7px; border-width: thin; color: #0070EE; background-color: white;");
                btn_register.Text = "Register";
            }
            else
            {
                Register_User();
                btn_register.Attributes.Add("style", "font-size: 20px; padding: 20px; border-color: red; border-radius: 7px; border-width: thin; color: red; background-color: white;");
                btn_register.Text = "Unregister";
            }
        }

        private bool CheckUserParticipant()
        {
            string query = $"SELECT * FROM ParticipantTBL WHERE userId = '{userID}' AND eventId ='{eventID}'";
            var record = dbHandler.RetrieveData(query);
            return record.Count  >  0;
        }


        private void Register_User()
        {
            if (!CheckUserParticipant())
            {
                string query = $"INSERT INTO ParticipantTBL VALUES({userID},{eventID},'Admitted', '{DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")}')";
                dbHandler.ExecuteInsertQuery(query);
            }
        }

        private void UnRegiser_User()
        {
            string query = $"DELETE FROM ParticipantTBL where userId = {userID} AND eventID = {eventID}";
            dbHandler.ExecuteUpdateQuery(query);
        }
    }
}