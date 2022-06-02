using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MalayanEventHub.Classes;

namespace MalayanEventHub.Pages.User
{
    public partial class RegisterPage : System.Web.UI.Page
    {
        DatabaseHandler dbHandler = new DatabaseHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
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
        }
        protected void btn_signup_Click(object sender, EventArgs e)
        {
            //checker query
            string idChecker_query = "select * from UserTBL where userID='" + Convert.ToInt32(tb_studno.Text) + "';";
            List<Dictionary<string, string>> checker = dbHandler.RetrieveData(idChecker_query);

            if (checker.Count != 0)
            {
                Response.Write("<div style=\"text-align: center;background-color: #E32739; color: white; margin: 0; padding: 10px\">Student number already been used</div>");
            }
            else
            {
                //insert queries
                string userTBL_query = "insert into UserTBL values('" + Convert.ToInt32(tb_studno.Text) + "', '" + tb_fname.Text
                + "', '" + tb_mname.Text + "', '" + tb_lname.Text + "', '" + tb_password.Text
                + "', '" + tb_email.Text + "',  '" + tb_contact.Text + "', 'Student');";

                string studentTBL_query = "insert into StudentTBL values('" + Convert.ToInt32(tb_studno.Text)
                    + "', '" + ddl_course.SelectedValue + "', '" + ddl_college.SelectedValue + "', '" + Convert.ToInt32(ddl_year.SelectedValue) + "');";

                //execute queries
                dbHandler.ExecuteInsertQuery(userTBL_query);
                dbHandler.ExecuteInsertQuery(studentTBL_query);

                //redirect to the log in page if account is successfully created
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert",
                "alert('Account successfully created');window.location ='LogInPage.aspx';",
                true);
            }

        }
    }
}