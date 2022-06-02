using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MalayanEventHub.Classes;
using System.IO;
using System.Data.SqlClient;

namespace MalayanEventHub
{
    public partial class OrgCreateEvent : System.Web.UI.Page
    {
        DatabaseHandler dbHandler;
        string organizerID;
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            //create a dbHandler
            dbHandler = new DatabaseHandler();
            organizerID = Session["organizationID"] + "-"+ Session["userID"];

            if (!Page.IsPostBack)
            {

                //appenddatabound
                ddl_college.AppendDataBoundItems = false;
                ddl_degree.AppendDataBoundItems = false;
                Populate_CollegeList();
            }

          
        }

        #region Submitting Form
        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                UploadDataToServer();
            }
        }
        private void UploadDataToServer()
        {
            // collect all data fields
            //for event TBL
            #region Event TBL Insert Data
            //eventD_section
            string eventD_Title = tb_eventTitle.Text.Trim();
            DateTime startDT = DateTime.Parse(tb_startDateTime.Text.Trim());
            DateTime endDT = DateTime.Parse(tb_endDateTime.Text.Trim());
            string eventD_startDT = startDT.ToString("yyyy-MM-dd HH:mm:ss");
            string eventD_endDT = endDT.ToString("yyyy-MM-dd HH:mm:ss");
            string eventD_venue = tb_venue.Text.Trim();
            string eventD_InvLink = tb_invLink.Text.Trim();
            string eventD_obj = tb_objectives.Text.Trim();
            string eventD_det = tb_specificDet.Text.Trim();

            //audience_section
            string audD_college = ddl_college.SelectedValue.Trim();
            string audD_degree = ddl_degree.SelectedValue.Trim();
            int audD_startGradeYear = Int32.Parse(ddl_startGradeYear.SelectedValue.Trim());
            int audD_endGradeYear = Int32.Parse(ddl_endGradeYear.SelectedValue.Trim());

            //pubmat section
            bool hasUploadImg = f_uploadImg.HasFile;


            //connect to sql
            string query = "INSERT INTO EventTBL (organizerID, activityTitle, startDateTime, endDateTime, proposedVenue, objectives, details," +
                " invitationLink, audienceCollege, audienceDegree, audienceGradeYearStart, audienceGradeYearEnd, pubmat)" +
                " VALUES(@organizerID, @eventTitle, @startDateTime, @endDateTime, @venue, @obj, @det,@invLink, @audCollege, @audDegree, @audGradeYearStart, " +
                "@audGradeYearEnd, @imgPubmat );";
            SqlCommand cmd = new SqlCommand(query);

            //add values
            cmd.Parameters.AddWithValue("@organizerID", organizerID);
            //event section
            cmd.Parameters.AddWithValue("@eventTitle", eventD_Title);
            cmd.Parameters.AddWithValue("@startDateTime", eventD_startDT);
            cmd.Parameters.AddWithValue("@endDateTime", eventD_endDT);
            cmd.Parameters.AddWithValue("@venue", eventD_venue);
            cmd.Parameters.AddWithValue("@obj", eventD_obj);
            cmd.Parameters.AddWithValue("@det", eventD_det);
            if (eventD_InvLink == "")
            {
                cmd.Parameters.AddWithValue("@invLink", DBNull.Value);
            }
            else
            {
                cmd.Parameters.AddWithValue("@invLink", eventD_InvLink);
            }
            //audtarget section
            cmd.Parameters.AddWithValue("@audCollege", audD_college);
            cmd.Parameters.AddWithValue("@audDegree", audD_degree);
            cmd.Parameters.AddWithValue("@audGradeYearStart", audD_startGradeYear);
            cmd.Parameters.AddWithValue("@audGradeYearEnd", audD_endGradeYear);

            //pubmat
            if (hasUploadImg)
            {
                cmd.Parameters.AddWithValue("@imgPubmat", GetImageBytes());
            }
            else
            {
                cmd.Parameters.AddWithValue("@imgPubmat", System.Data.SqlTypes.SqlBinary.Null);
             
            }
            #endregion Event TBL 

            //execute thru database
            string eventID = dbHandler.ExecuteInsertQueryInReturn(cmd);

            #region for Required Information TBL
            string query2 = "INSERT INTO RequiredInformationTBL (eventID, dataOfParticipant) VALUES";
            List<string> cbl_targetDatavalues = new List<string>();
            foreach(ListItem item in cbl_targetData.Items)
            {
                if (item.Selected)
                {
                    cbl_targetDatavalues.Add($"({eventID}, '{item.Value}')");
                }
            }

            query2 = query2 + String.Join(",", cbl_targetDatavalues)+";";
            dbHandler.ExecuteInsertQuery(query2);
            #endregion

            #region For Event Request TBL & requestTBL
            string[] id_parts = organizerID.Split('-');
            int organizationID = Int32.Parse(id_parts[0]);
            int userID = Int32.Parse(id_parts[1]);
            DateTime now = DateTime.Now;
            string query3 = "INSERT INTO EventRequestTBL (organizationID, userID, eventID, created)" +
                $"VALUES({organizationID}, {userID}, {eventID}, '{now.ToString("yyyy-MM-dd HH:mm:ss")}')";

            string requestID = dbHandler.ExecuteInsertQueryInReturn(query3);

            string query4 = "INSERT INTO RequestTBL (requestID, requestStatus, requestType)" +
                $"VALUES({requestID}, '{"Pending"}', '{"Event-Request"}')";
            dbHandler.ExecuteInsertQuery(query4);
            #endregion
           



            //go to new Page
            Response.Redirect($"OrgEventInformation.aspx?eventId={eventID}");

        }


        #endregion

        #region Submitting Form Helper functions
        private Byte[] GetImageBytes()
        {
            Byte[] imageBytes;
        
            using (Stream stream = f_uploadImg.PostedFile.InputStream)
            {
                using(BinaryReader br = new BinaryReader(stream))
                {
                    imageBytes = br.ReadBytes((Int32)stream.Length); 
                }
            }
           return imageBytes;
        }

            
        #endregion


        #region  Dropdownlist events
        private void Populate_CollegeList()
        {
            //clear list
            ddl_college.Items.Clear();
            //add the item first
            ListItem itemFirst = new ListItem("--Please choose a college", "");
            itemFirst.Selected = true;
            ddl_college.Items.Add(itemFirst);

            //connect to db
            string query = "SELECT * FROM CollegeTBL";
            List<Dictionary<string, string>> dataList = dbHandler.RetrieveData(query);
            if (dataList.Count == 0)
            {
                System.Diagnostics.Debug.WriteLine("Datalist is empty.");
                return;
            }
  
            //populate data
            foreach (var dataRow in dataList)
            {
                string collegeName = dataRow["name"];
                string collegeAcronym = dataRow["id"];
                ListItem item = new ListItem($"{collegeName} ({collegeAcronym})", collegeAcronym);
               //add to droplist
                ddl_college.Items.Add(item);
            }
            ListItem itemEnd = new ListItem("All", "All");
            ddl_college.Items.Add(itemEnd);
        }

        protected void ddl_college_SelectedIndexChanged(object sender, EventArgs e)
        {
            //clear all drop down
            ddl_degree.Items.Clear();
            ddl_startGradeYear.Items.Clear();
            ddl_endGradeYear.Items.Clear();

            //default list item
            ListItem itemDefault = new ListItem("", "");
            ListItem itemAll = new ListItem("All", "All");
            ListItem yearDefault = new ListItem("--", "");

            //conditional
            if (ddl_college.SelectedValue == "All")
            {
                //degree
                itemAll.Selected = true;
                ddl_degree.Items.Add(itemAll);


                // year

                ListItem[] items = new ListItem[] {new ListItem ("Grade 11", "11"),
                 new ListItem("Grade 12", "12"),
                 new ListItem("1st year", "1"),
                 new ListItem("2nd year", "2"),
                 new ListItem("3rd year", "3"),
                 new ListItem("4th year", "4"),
                new ListItem("5th year", "5") };

                ListItem lastItem = new ListItem();
                foreach (var item in items)
                {
                    lastItem = item;
                    ddl_startGradeYear.Items.Add(item);
                    ddl_endGradeYear.Items.Add(item);
                }


                return;
            }
            ddl_startGradeYear.Items.Add(yearDefault);
            ddl_endGradeYear.Items.Add(yearDefault);

            itemDefault.Selected = true;
            if (ddl_college.SelectedValue == "")
            {
                itemDefault.Text = "--Please specify a college first";
                ddl_degree.Items.Add(itemDefault);
                return;
            }
            else
            {
                itemDefault.Text = $"Choose a major from {ddl_college.SelectedValue}";
            }



            //set all list item
            ddl_degree.Items.Add(itemDefault);
          


            //populate ddl
            string selectedCollege = ddl_college.SelectedValue;
            string sqlQuery = $"SELECT id, name FROM DegreeTBL WHERE collegeID = '{selectedCollege}'";
            List<Dictionary<string, string>> dataList = dbHandler.RetrieveData(sqlQuery);
            if (dataList.Count == 0)
            {
                return;
            }
            foreach (var dataRow in dataList)
            {
                string degreeName = dataRow["name"];
                string degreeAcronym = dataRow["id"];
                ListItem item = new ListItem($"{degreeName} ({degreeAcronym})", degreeAcronym);
                ddl_degree.Items.Add(item);
            }

            //add a all item
            ddl_degree.Items.Add(itemAll);
        }
        protected void ddl_degree_SelectedIndexChanged(object sender, EventArgs e)
        {
            //clear
            ddl_startGradeYear.Items.Clear();
            ddl_endGradeYear.Items.Clear();
            //
            string selectedDegree = ddl_degree.SelectedValue;

            if (selectedDegree == "")
            {
                ListItem yearDefault = new ListItem("--", "");
                yearDefault.Selected = true;
                ddl_startGradeYear.Items.Add(yearDefault);
                ddl_endGradeYear.Items.Add(yearDefault);
                return;
            }

            Announce(selectedDegree);
            string sqlQuery;
            if (selectedDegree == "All")
            {
                sqlQuery = $"SELECT  MIN(gradeStartYear) AS gradeStartYear, MAX(gradeEndYear) AS gradeEndYear FROM DegreeTBL WHERE collegeID = '{ddl_college.SelectedValue}'";
            }
            else
            {
                sqlQuery = $"SELECT collegeID, gradeStartYear, gradeEndYear FROM DegreeTBL WHERE id = '{selectedDegree}'";
                
            }
            List<Dictionary<string, string>> dataList = dbHandler.RetrieveData(sqlQuery);
            if (dataList.Count == 0)
            {
                return;
            }
            int startYear = Int32.Parse(dataList[0]["gradeStartYear"]);
            int endYear = Int32.Parse(dataList[0]["gradeEndYear"]);
            ListItem item = new ListItem();
            string keyYear = "";
            for (int year = startYear; year <= endYear; year++)
            {
                keyYear = year.ToString();
                if (startYear>=11)
                {
                    keyYear = "Grade " + keyYear;
                }
                else
                {
                    keyYear = ConvertToOrdinal(year) + " year";
                }
                item = new ListItem(keyYear, year.ToString());
                ddl_startGradeYear.Items.Add(item);
                ddl_endGradeYear.Items.Add(item);
            }
        }

        #endregion

        #region Helper Functions
        private string ConvertToOrdinal(int year)
        {
            if (year == 1)
            {
                return "1st";
            }
            else if (year == 2)
            {
                return "2nd";
            }
            else if (year == 3)
            {
                return "3rd";
            }
            else if (year == 4)
            {
                return "4th";
            }
            else if (year == 5)
            {
                return "5th";
            }
            return null;
        }
        private void Announce(string message)
        {
            System.Diagnostics.Debug.WriteLine(message);
        }

        private void Announce(bool message)
        {
            System.Diagnostics.Debug.WriteLine(message);
        }

     
        #endregion

        //validations controls method
        #region Validation Controls
        protected void RequiredValue_ServerValidate(object source, ServerValidateEventArgs args)
        {//for empty

            if (args.Value == "")
            {
                args.IsValid = false;
                return;
            }
        }

        protected void StartDateTime_Validate(object source, ServerValidateEventArgs args)
        {
            try
            {
                if (args.Value == "")
                {
                    args.IsValid = false;
                    return;
                }
                DateTime start = DateTime.Parse(args.Value);
                DateTime today = DateTime.Now;
                if (start >= today)
                {
                    args.IsValid = true;
                }
                else
                {
                    args.IsValid = false;
                }
            }
            catch (Exception e)
            {
                args.IsValid = false;
            }
            // write your code here


        }
        protected void CustomValidatorEndDateTime_ServerValidate(object source, ServerValidateEventArgs args)
        {
            try
            {
                if (tb_startDateTime.Text == "" || tb_endDateTime.Text=="")
                {
                    cv_endDateTime.ErrorMessage = "End date time must not be empty.";  
                    args.IsValid = false;
                    return;
                }
                DateTime start = DateTime.Parse(tb_startDateTime.Text);
                DateTime end = DateTime.Parse(tb_endDateTime.Text);
                if (start.Date < end.Date)
                {
                   
                    args.IsValid = true;
                }
                else if (start.Date==end.Date && (end.TimeOfDay-start.TimeOfDay).Duration().TotalMinutes>=30)
                {
                    args.IsValid = true;
                }
                else
                {cv_gradeYear.ErrorMessage = "Target Grade Year Must not be earlier than start date time and duration should be at least 30 mins";
                    args.IsValid = false;
                }
            }
            catch (Exception e)
            {
                args.IsValid = false;
            }
        }

        protected void CustomValidatorGradeYear_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if(ddl_startGradeYear.SelectedValue=="" || ddl_endGradeYear.SelectedValue == "")
            {
                cv_gradeYear.ErrorMessage = "Target Grade Year Must not be empty";
                args.IsValid = false;
                return;
            }

            int startYear = Int32.Parse(ddl_startGradeYear.SelectedValue);
            int endYear = Int32.Parse(ddl_endGradeYear.SelectedValue);

            //recalibating 
            if (startYear >= 11)
            {
                startYear = startYear-12;
            }
            if (endYear >= 12)
            {
                endYear = endYear-12;
            }
            //validating
            if (startYear > endYear)
            {
                cv_gradeYear.ErrorMessage = "Target Grade Year must have a valid range";
                args.IsValid = false;
                
            }
        }

        protected void cv_pubmatImg_ServerValidate(object source, ServerValidateEventArgs args)
        {
            int fileSizeInBytes = f_uploadImg.PostedFile.ContentLength;
            int maxFileSizeInBytes = 4194304; 
            if (fileSizeInBytes > maxFileSizeInBytes)
            {
                cv_pubmatImg.ErrorMessage = "File upload pubmat image should be less than 4mb";
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
          
        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("OrgEvents.aspx");
        }
    }
    #endregion
}