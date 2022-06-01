using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MalayanEventHub.Classes;
using System.Text;
using System.IO;

namespace MalayanEventHub.Pages.Organizer
{
    public partial class OrgEventInformation : System.Web.UI.Page
    {
        DatabaseHandler dbHandler;
        string eventId;
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            eventId = Request.QueryString["eventID"];
            if (String.IsNullOrEmpty(eventId))
            {
                Response.Redirect("OrgCreateEvent.aspx");
                return;
            }

            dbHandler = new DatabaseHandler();


            if (!Page.IsPostBack)
            {
                

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
            ChangeStatusColor(eventDataList["requestStatus"]);


            tb_commentResponse.Text = String.IsNullOrEmpty(eventDataList["feedback"]) ? "No comment." : eventDataList["feedback"];

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

        private void ChangeStatusColor(string currentStatus)
        {
            if (currentStatus == "Active")
            {
                lbl_status.ForeColor = System.Drawing.Color.GreenYellow; 
            }
            else if (currentStatus == "Deleted")
            {
                lbl_status.ForeColor = System.Drawing.Color.DarkRed;
            }
        }

        protected void btn_showParticipants_Click(object sender, EventArgs e)
        {
            Response.Redirect($"OrgEventParticipants.aspx?eventID={eventId}");
        }


        protected void btn_genAccReport_Click(object sender, EventArgs e)
        {
            //get data
            string query = $"SELECT * FROM EventTBL WHERE eventID = {eventId} ";
            var recordDetails = dbHandler.RetrieveData(query)[0];
            string query2 = $"SELECT COUNT(*) as totalParticipant FROM ParticipantTBL WHERE eventId ={eventId} AND participantStatus = 'Admitted'";
            var recordParticipant = dbHandler.RetrieveData(query2)[0];
            Byte[] txtBytes;
 

            // making a text file
            MemoryStream ms = new MemoryStream();
            TextWriter tw = new StreamWriter(ms);

            //write text out put
            tw.WriteLine("======Accomplishment Report ==========");
            tw.WriteLine("Created {0}",DateTime.Now.ToString());
            tw.WriteLine("Event ID; #{0}", eventId);
            tw.WriteLine("Event Title: {0}", recordDetails["activityTitle"]);
            tw.WriteLine("DateTime: {0} to {1} ", DateTime.Parse(recordDetails["startDateTime"]).ToString(),
                DateTime.Parse(recordDetails["endDateTime"]).ToString());
            tw.WriteLine("Venue: {0}", recordDetails["proposedVenue"]);
            if (String.IsNullOrEmpty(recordDetails["invitationLink"]))
            {
                tw.WriteLine("Inv Link: {0}", recordDetails["invitationLink"]);
            }
            tw.WriteLine("No of Participants: {0}", recordParticipant["totalParticipant"]);

            //
            recordDetails.Clear();
            recordParticipant.Clear();
            tw.Flush();
            txtBytes = ms.ToArray();
            ms.Close();

            //downloading this on the web

            Response.Clear();
            Response.ContentType = "application/force-download";
            Response.AddHeader("content-disposition", $"attachment;    filename=AccReport_Event#{eventId}.txt");
            Response.BinaryWrite(txtBytes);
            Response.End();
        }

        protected void btn_gotoIncident_Click(object sender, EventArgs e)
        {
            Response.Redirect("OrgEventIncident.aspx?eventID="+eventId);
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
            string sql = $"UPDATE RequestTBL SET requestStatus='Deleted', modified ='{DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")}' "+
                        "WHERE requestID = ( "+
                        "SELECT requestID FROM EventRequestTBL "+
                        $"WHERE eventID = {eventId})";

            dbHandler.ExecuteInsertQuery(sql);
            Response.Redirect($"OrgEventInformation.aspx?eventID={eventId}");

        }
    }
}