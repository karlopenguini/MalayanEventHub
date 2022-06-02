using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MalayanEventHub.Classes;

namespace MalayanEventHub.Pages.User
{
    public partial class LogInPage : System.Web.UI.Page
    {
        DatabaseHandler dbHandler = new DatabaseHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
               // Session["userID"] = "";
            }
        }

        private void DisplayError(string errorMsg)
        {
            Response.Write($"<div style=\"text-align: center;background-color: #E32739; color: white; margin: 0; padding: 10px\">{errorMsg}</div>");
        }

        protected void Btn_Signin_Click(object sender, EventArgs e)
        {
            try
            {
                //check if values exist in the database
                string userTBL_query = "select * from UserTBL where userID = '" + Convert.ToInt32(TB_UserName.Text) + "' and password = '" + TB_Password.Text + "' ";

                List<Dictionary<string, string>> dataList = dbHandler.RetrieveData(userTBL_query);
                //if datalist doen't contain any, it means username or password doesn't exist
                if (dataList.Count == 0)
                {
                    this.DisplayError("Incorrect username or password");
                    TB_UserName.Text = "";
                }
                else
                {
                    //store data in dictionary
                    Dictionary<string, string> eventDataList = dataList[0];

                    Session["userID"] = eventDataList["userID"];
                    Session["fullName"] = eventDataList["firstName"]+" "+eventDataList["lastName"];
                    Session["role"] = eventDataList["role"];
                    if (eventDataList["role"] == "Student")
                    {
                        Response.Redirect("UserViewCurrentEvents.aspx");                        
                    }
                    else if(eventDataList["role"] == "Admin")
                    {
                        Response.Redirect("../Admin/Events.aspx");
                    }
                }
            }
            catch (Exception)
            {
                this.DisplayError("Invalid Username");
                TB_UserName.Text = "";
            }
        }

        protected void BtnReg_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegisterPage.aspx");
        }
    }
}