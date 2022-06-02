using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MalayanEventHub.Classes;
using System.Data.SqlClient;

namespace MalayanEventHub.Pages.Organizer
{
    public partial class OrgEventIncident : System.Web.UI.Page
    {

        DatabaseHandler dbHandler;
        string eventID;
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            dbHandler = new DatabaseHandler();
            eventID = Request.QueryString["eventID"];
            if (String.IsNullOrEmpty(eventID))
            {
                Response.Redirect("OrgCreateEvent.aspx");
                return;
            }
            if (!Page.IsPostBack)
            {

                string query = $"SELECT activityTitle FROM EventTBL WHERE eventID = {eventID};";
                var record = dbHandler.RetrieveData(query)[0];
                lbl_eventID.Text = eventID;
                tb_eventTitle.Text = record["activityTitle"];
            }
        }

        protected void RequiredValue_ServerValidate(object source, ServerValidateEventArgs args)
        {//for empty

            if (args.Value == "")
            {
                args.IsValid = false;
                return;
            }
        }

        protected void DateTime_ServerValidate(object source, ServerValidateEventArgs args)
        {
         
            if (tb_dateTime.Text == "")
            {
                args.IsValid = false;
                return;
            }

            DateTime dateTime;
            if(DateTime.TryParse(tb_dateTime.Text, out dateTime))
            {
                dateTime = DateTime.Parse(tb_dateTime.Text);
                if (dateTime > DateTime.Now)
                {
                    cv_dateTime.ErrorMessage = "Datetime should not be on future";
                    args.IsValid = false;
                }
                else
                {
                    args.IsValid = true;
                }
           
            }
            else
            {
                args.IsValid = false;
            }



        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string query = "INSERT INTO IncidentReportTBL (eventID, reportDate, title, details) " +
                    "VALUES(@eventID, @reportDate, @title, @details)";

                SqlCommand sqlCom = new SqlCommand(query);
                sqlCom.Parameters.AddWithValue("@eventID", eventID);
                sqlCom.Parameters.AddWithValue("@reportDate", DateTime.Parse(tb_dateTime.Text.Trim()).ToString("yyyy-MM-dd HH:mm:ss"));
                sqlCom.Parameters.AddWithValue("@title", tb_incident.Text.Trim());
                sqlCom.Parameters.AddWithValue("@details", tb_details.Text.Trim());
                string reportID = dbHandler.ExecuteInsertQueryInReturn(sqlCom);
                //
                string msg = $"Incident Report ID:{reportID} Successfully Submitted";
                Response.Redirect($"OrgMessage.aspx?Msg={msg}");
            }

        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect($"OrgEventInformation.aspx?eventID={eventID}");
        }
    }
}