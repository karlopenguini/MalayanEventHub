using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MalayanEventHub.Classes;

namespace MalayanEventHub.Layouts.Common.User
{
    public partial class AccountDetailsView : System.Web.UI.MasterPage
    {
        string _Name = "";
        string _Department = "";
        string _Position = "";
        string _Role = "";
        string _UserID = "";
        string query = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string UserID = Session["userID"].ToString();
            string FullName = Session["fullname"].ToString();
            string Role = Session["role"].ToString();
            DatabaseHandler dbHandler = new DatabaseHandler();
            switch (Role)
            {
                case "Admin":
                    query = $"select position from AdminTBL WHERE {UserID} = userID";
                    string position = dbHandler.RetrieveData(query)[0]["position"];

                    _Name = FullName;
                    _UserID = UserID;
                    _Role = Role;
                    _Position = position;
                    _Department = "SAO";
                    break;

                case "Student":
                    query = $"select course, college, yearLevel from StudentTBL WHERE {UserID} = userID";
                    Dictionary<string, string> data = dbHandler.RetrieveData(query)[0];
                    _Name = FullName;
                    _UserID = UserID;
                    _Role = data["course"];
                    _Position = data["yearLevel"];
                    _Department = data["college"];
                    break;
            }
            lbl_acc_name.Text = _Name;
            lbl_acc_num.Text = _UserID;
            lbl_acc_position.Text = _Position;
            lbl_acc_type.Text = _Role;
            lbl_acc_department.Text = _Department;

        }
    }
}