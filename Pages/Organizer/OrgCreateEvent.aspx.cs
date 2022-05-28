using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MalayanEventHub.Classes;
namespace MalayanEventHub
{
    public partial class OrgCreateEvent : System.Web.UI.Page
    {
        DatabaseHandler dbHandler;
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            //populate dropdownlist
            dbHandler = new DatabaseHandler();
            Announce("Running Main...");
            //populate
            if (!Page.IsPostBack)
            {
                //appenddatabound
                ddl_college.AppendDataBoundItems = false;
                ddl_degree.AppendDataBoundItems = false;
                Populate_CollegeList();
            }

          
        }


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

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            
        }

        //validations controls method
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
                {
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
                args.IsValid = false;
                return;
            }

            int startYear = Int32.Parse(ddl_startGradeYear.SelectedValue);
            int endYear = Int32.Parse(ddl_endGradeYear.SelectedValue);
            if (startYear > endYear)
            {
                args.IsValid = false;
                
            }
        }


    }
}