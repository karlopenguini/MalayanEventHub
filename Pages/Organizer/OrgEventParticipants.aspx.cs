using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MalayanEventHub.Classes;

namespace MalayanEventHub.Pages.Organizer
{
    public partial class OrgEventParticipants : System.Web.UI.Page
    {
        string eventID;
        DatabaseHandler dbHandler;
        protected void Page_Load(object sender, EventArgs e)
        {
            dbHandler = new DatabaseHandler();
            eventID = Request.QueryString["eventID"];

            if (String.IsNullOrEmpty(eventID))
            {
                Response.Redirect("OrgCreateEvent.aspx");
                return;
            }

            if (!Page.IsPostBack)
            {

                lbl_eventID.Text = eventID;
                LoadEventInfo();
                LoadParticipantsList();
            }
        }

        private void LoadEventInfo()
        {
            string query = $"SELECT activityTitle FROM EventTBL WHERE eventID = {eventID}";
            var record = dbHandler.RetrieveData(query)[0];
            tb_eventTitle.Text = record["activityTitle"];
        }

        private void LoadParticipantsList()
        {
            string query = "SELECT stud.firstName, stud.lastName, stud.userID  FROM EventTBL as evnt " +
                 "INNER JOIN ParticipantTBL as part ON evnt.eventID = part.eventId " +
                 "INNER JOIN UserTBL as stud ON part.userId = stud.userID " +
                 $"WHERE evnt.eventID = {eventID} AND part.participantStatus='Admitted';";

            List<Dictionary<string, string>> dataList = dbHandler.RetrieveData(query);
            if (dataList.Count == 0)
            {
                ListItem item = new ListItem("No Participants", "");
                item.Selected = true;
                item.Enabled = false;
                rb_listParticipants.Items.Add(item);
            }
            else {
                foreach (var record in dataList)
                {
                    string fullName = record["firstName"] + " " + record["lastName"];
                    ListItem item = new ListItem(fullName, record["userID"]);
                    item.Enabled = true;
                    rb_listParticipants.Items.Add(item);
                }
            }

            
        }

        protected void rb_listParticipants_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rb_listParticipants.SelectedValue.Trim() == "")
            {
                return;
            }

            string query1 = "SELECT userT.*, stud.* FROM ParticipantTBL as part INNER JOIN StudentTBL as stud " +
                "ON part.userId = stud.userID INNER JOIN UserTBL as userT ON stud.userID = userT.userID " +
                $"WHERE part.eventId = {eventID} AND part.userId = {rb_listParticipants.SelectedValue}";
            DebugWrite($"{eventID} {rb_listParticipants.SelectedValue}");
            
            var records = dbHandler.RetrieveData(query1);
            if (records.Count <= 0)
            {
                //not found
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                 "alert",
                 "alert('User not found!');",
                 true);
                return;
            }

            var recordUser = records[0];

            string query2 = "SELECT dataOfParticipant FROM RequiredInformationTBL " +
                    $"WHERE eventID = {eventID}; ";
            var targetData = dbHandler.RetrieveData(query2);
            HashSet<string> targetDataSet = new HashSet<string>();
            foreach(var dataRecord in targetData){
                var fieldName = dataRecord["dataOfParticipant"];
                targetDataSet.Add(fieldName);
            }
            targetData.Clear();

            //invidually set data
            tb_firstName.Text = recordUser["firstName"];
            tb_lastName.Text = recordUser["lastName"];
            if (targetDataSet.Contains("middleName"))
            {
                tb_middleName.Text = recordUser["middleName"];
                form_field_middleName.Visible = true;
            }
            else
            {
                form_field_middleName.Visible = false;
            }

            if (targetDataSet.Contains("userID"))
            {
                tb_studentNo.Text = recordUser["userID"];
                form_field_studentNo.Visible = true;
            }
            else
            {
                form_field_studentNo.Visible = false;
            }

            if (targetDataSet.Contains("contactNo"))
            {
                tb_contactNo.Text = recordUser["contactNo"];
                form_field_contactNo.Visible = true;
            }
            else
            {
                form_field_contactNo.Visible = false;
            }

            if (targetDataSet.Contains("email"))
            {
                tb_email.Text = recordUser["email"];
                form_field_email.Visible = true;
            }
            else
            {
                form_field_email.Visible = false;
            }

            if (targetDataSet.Contains("college"))
            {
                tb_college.Text = recordUser["college"];
                form_field_college.Visible = true;
            }
            else
            {
                form_field_college.Visible = false;
            }
            if (targetDataSet.Contains("course"))
            {
                tb_degree.Text = recordUser["course"];
                form_field_degree.Visible = true;
            }
            else
            {
                form_field_degree.Visible = false;
            }
            if (targetDataSet.Contains("year"))
            {
                tb_year.Text = recordUser["yearLevel"];
                form_field_year.Visible = true;
            }
            else
            {
                form_field_year.Visible = false;
            }
        }

        private void DebugWrite(string message)
        {
            System.Diagnostics.Debug.WriteLine(message);
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect($"OrgEventInformation.aspx?eventID={eventID}");
        }

        protected void btn_refresh_Click(object sender, EventArgs e)
        {
            rb_listParticipants.Items.Clear();
            LoadParticipantsList();

        }
    }
}