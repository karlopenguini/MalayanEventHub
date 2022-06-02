using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MalayanEventHub.Classes;

namespace MalayanEventHub.Layouts.Common.User
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        DatabaseHandler dbHandler = new DatabaseHandler();
        int userID;
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            userID = Int32.Parse(Session["userID"].ToString());
            if (!IsPostBack)
            {
                //get student data and set it to the controls
                this.GetCurrentData();
            }
        }

        private void GetCurrentData()
        {
            //select queries to retrieve data
            string userTBL_query = "select userID, firstName, middleName, lastName, password, email, contactNo from UserTBL where userID='" + userID + "'";
            string studentTBL_query = "select course, college, yearLevel from StudentTBL where userID='" + userID + "'";
            List<Dictionary<string, string>> UserTBL = dbHandler.RetrieveData(userTBL_query);
            List<Dictionary<string, string>> StudentTBL = dbHandler.RetrieveData(studentTBL_query);
            if (UserTBL.Count == 0 && StudentTBL.Count == 0)
            {
                return;
            }
            else
            {
                Dictionary<string, string> userData = UserTBL[0];
                Dictionary<string, string> studentData = StudentTBL[0];
                //set the values retrieved from the database to the controls
                tb_fname.Text = userData["firstName"];
                tb_mname.Text = userData["middleName"];
                tb_lname.Text = userData["lastName"];
                tb_password.Text = userData["password"];
                tb_email.Text = userData["email"];
                tb_contact.Text = userData["contactNo"];
                ddl_course.SelectedValue = studentData["course"];
                ddl_college.SelectedValue = studentData["college"];
                ddl_yearLevel.SelectedValue = studentData["yearLevel"];
            }
        }

        protected void ddl_college_SelectedIndexChanged(object sender, EventArgs e)
        {
            string[] colleges = { "CCIS", "CAS", "ETYCB", "MITL", "CMET" };
            string[][] courses =
            {
                new string[] {"BSCS", "BSIT" },
                new string[] {"BACom", "AB MMA", "BSc(Psych)" },
                new string[] {"BSA", "BSBA", "BSTM" },
                new string[] {"BArch", "BSChe", "BCE", "BSCE", "BSEE", "BSECE", "BSIE", "BSME"},
                new string[] {"BSMarE", "BSMT" }
            };

            //Change current items of ddl_course based on the selected value in ddl_college
            ddl_course.Items.Clear();
            for (var i = 0; i < colleges.Length; i++)
            {
                if (ddl_college.SelectedValue == colleges[i])
                {
                    for (var x = 0; x < courses[i].Length; x++)
                    {
                        ddl_course.Items.Insert(x, new ListItem(courses[i][x], courses[i][x]));
                    }
                    break;
                }
            }
            //update the ddl_course 
            UpdatePanelCourse.Update();
        }

        protected void update_Click(object sender, EventArgs e)
        {
            //arrays containing the ids of the controls
            TextBox[] textboxes = { tb_fname, tb_mname, tb_lname, tb_contact, tb_email, tb_password };
            DropDownList[] ddls = { ddl_college, ddl_course, ddl_yearLevel };

            //make textboxes and ddls enabled when update button is pressed
            if (btn_update.Text == "update")
            {
                foreach (var i in textboxes)
                {
                    i.Enabled = true;
                }
                foreach (var i in ddls)
                {
                    i.Enabled = true;
                }
                btn_update.Text = "apply changes";
                btn_update.Attributes.Add("style", "display: block; margin-left: 350px; width: 200px; padding: 12px; background-color: red; font-size: 22px; font-weight: 300; color: white; border: none; border-radius: 7px; margin-top: 50px; margin-bottom: 40px; cursor: pointer;");
                btn_update.CausesValidation = true;
            }
            else
            {
                //update query for the UserTBL and StudentTBL
                string userUpdate_query = "update UserTBL set firstName = '" + tb_fname.Text
                    + "', middleName = '" + tb_mname.Text + "', lastName = '" + tb_lname.Text
                    + "', password = '" + tb_password.Text + "', email = '" + tb_email.Text
                    + "', contactNo = '" + tb_contact.Text + "' where userID = '" + userID + "' ";

                string studentUpdate_query = "update StudentTBL set course = '" + ddl_course.SelectedValue
                    + "', college = '" + ddl_college.SelectedValue + "', yearLevel = '" + Convert.ToInt32(ddl_yearLevel.Text) 
                    + "' where userID = '" + userID + "'";

                dbHandler.ExecuteUpdateQuery(userUpdate_query);
                dbHandler.ExecuteUpdateQuery(studentUpdate_query);

                //disable buttons again after update
                foreach (var i in textboxes)
                {
                    i.Enabled = false;
                }
                foreach (var i in ddls)
                {
                    i.Enabled = false;
                }
                btn_update.Text = "update";
                btn_update.Attributes.Add("style", "display: block; width: 200px; padding: 12px; background-color: #1C3A63; font-size: 22px; font-weight: 300; color: white; border: none; border-radius: 7px; margin-top: 50px; margin-bottom: 40px; cursor: pointer;");
                btn_update.CausesValidation = false;
            }
        }

        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogInPage.aspx");
        }
    }
}