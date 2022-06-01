using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MalayanEventHub.Pages.User
{
    public partial class RegisterPage : System.Web.UI.Page
    {
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
    }
}