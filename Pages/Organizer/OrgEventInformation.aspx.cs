using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MalayanEventHub.Classes;
using System.Text;

namespace MalayanEventHub.Pages.Organizer
{
    public partial class OrgEventInformation : System.Web.UI.Page
    {
        DatabaseHandler dbHandler;
        string eventId;
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;


            if (!Page.IsPostBack)
            {
                dbHandler = new DatabaseHandler();

                eventId = Request.QueryString["eventID"];
                if (String.IsNullOrEmpty(eventId))
                {
                    Response.Redirect("OrgCreateEvent.aspx");
                    return;
                }

                lbl_eventID.Text = eventId;

                //load event 
                Load_EventInfo();
            }
        }

        private void Load_EventInfo()
        {
            string query = "SELECT e.*, e_req.*,req.*  FROM EventTBL as e " +
            "INNER JOIN EventRequestTBL as e_req " +
            "ON e.eventID = e_req.eventID " +
            "INNER JOIN RequestTBL as req " +
            "ON e_req.requestID = req.requestID " +
            $"WHERE e.eventID = {eventId}; ";


            List<Dictionary<string, string>> dataList = dbHandler.RetrieveData(query);
            if (dataList.Count == 0)
            {
                return;
            }

            Dictionary<string, string> eventDataList = dataList[0];

            //set by status card
            lbl_status.Text = eventDataList["requestStatus"].ToUpper();
            tb_commentResponse.Text = String.IsNullOrEmpty(eventDataList["feedback"]) ? "No comment yet." : eventDataList["feedback"];

            //set eventDetails
            tb_eventTitle.Text = eventDataList["activityTitle"];
            DateTime startDT = DateTime.Parse(eventDataList["startDateTime"]);
            tb_startDateTime.Text = startDT.ToString("yyyy-MM-ddTHH:mm");
            DateTime endDT = DateTime.Parse(eventDataList["endDateTime"]);
            tb_endDateTime.Text = endDT.ToString("yyyy-MM-ddTHH:mm");
            tb_venue.Text = eventDataList["proposedVenue"];
            tb_obj.Text = eventDataList["objectives"];
            tb_specDet.Text = eventDataList["details"];
            hl_venue.Text = String.IsNullOrEmpty(eventDataList["invitationLink"]) ? "None" : eventDataList["invitationLink"];

            //audience target
            ListItem collegeItem = new ListItem();
            if (eventDataList["audienceCollege"] == "All")
            {
                collegeItem.Text = "All";
                collegeItem.Value = "All";
            }
            else
            {
                string queryLocal = $"SELECT name FROM CollegeTBL WHERE id='{eventDataList["audienceCollege"]}'";
                Dictionary<string, string> collegeData = dbHandler.RetrieveData(queryLocal)[0];
                collegeItem.Text = collegeData["name"];
                collegeItem.Value = collegeData["name"];
            }
            ddl_college.Items.Add(collegeItem);

            ListItem degreeItem = new ListItem();
            if (eventDataList["audienceDegree"] == "All")
            {
                degreeItem.Text = "All";
                degreeItem.Value = "All";
            }
            else
            {
                string queryLocal = $"SELECT name FROM DegreeTBL WHERE id='{eventDataList["audienceDegree"]}'";
                Dictionary<string, string> collegeData = dbHandler.RetrieveData(queryLocal)[0];
                degreeItem.Text = collegeData["name"];
                degreeItem.Value = collegeData["name"];
            }
            ddl_degree.Items.Add(degreeItem);

            ddl_startGradeYear.Items.Add(new ListItem(eventDataList["audienceGradeYearStart"], ""));
            ddl_endGradeYear.Items.Add(new ListItem(eventDataList["audienceGradeYearEnd"], ""));

            // for check list
            string query2 = $"SELECT * FROM RequiredInformationTBL Where eventID = {eventId}";
            List<Dictionary<string, string>> dl_targetData = dbHandler.RetrieveData(query2);

            foreach (Dictionary<string, string> record in dl_targetData)
            {
                ListItem item = cbl_targetData.Items.FindByValue(record["dataOfParticipant"]);
                item.Selected = true;
                item.Enabled = false;
            }

            if (!String.IsNullOrEmpty(eventDataList["pubmat"]))
            {
                //get base 64 string of Imag
                string queryImg = "SELECT imgBase64Str FROM EventTBL cross apply (select pubmat '*' for xml path('')) T (imgBase64Str) " +
                        $"WHERE eventID = {eventId}";
                Dictionary<string, string> data = dbHandler.RetrieveData(queryImg)[0];
                string base64 = data["imgBase64Str"];
                pubmatImg.ImageUrl = "data:image/png;base64, " + base64;
            }
        }
}
}