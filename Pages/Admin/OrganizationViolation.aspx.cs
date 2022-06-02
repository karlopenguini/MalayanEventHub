using MalayanEventHub.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MalayanEventHub.Layouts.Common.Admin
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        DatabaseHandler databaseHandler = new DatabaseHandler();
        int organizationID = 80001;
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void UploadtoDB()
        {
            string violationTitle = tb_violation.Text;
            string dateTime = DateTime.Parse(tb_dateTime.Text.Trim()).ToString("yyyy-MM-dd HH:mm:ss");
            string verdict = tb_verdict.Text;
            string description = tb_description.Text;

            string query =
                "Insert into ViolationTBL Values (@organizationID,@violationDateTime, @violationTitle, @violationVerdict, @violationDescription);";
            SqlCommand cmd = new SqlCommand(query);
            cmd.Parameters.AddWithValue("@organizationID", organizationID);

            cmd.Parameters.AddWithValue("@violationDateTime", dateTime);
            cmd.Parameters.AddWithValue("@violationTitle", violationTitle);
            cmd.Parameters.AddWithValue("@violationVerdict", verdict);
            cmd.Parameters.AddWithValue("@violationDescription", description);

            databaseHandler.ExecuteInsertQuery(cmd);
        }


        public class ViolationData
        { 
            public string ShortDate { get; set; }
            public string ViolationTitle { get; set; }
            public string ViolationDate { get; set; }
            public string ViolationVerdict { get; set; }
            public string ViolationDetails { get; set; }

        }

        protected void LoadDataViolation()
        {
            List<ViolationData> ViolationList = new List<ViolationData>();
            string query =
                $"Select * from ViolationTBL where organizationID = {organizationID}";
            foreach (Dictionary<string, string> row in databaseHandler.RetrieveData(query))
            {
                ViolationList.Add(
                    new ViolationData()
                    {
                        ShortDate = DateTime.Parse(row["created"]).ToString("MMM dd").ToUpper(),
                        ViolationTitle = row["title"],
                        ViolationDetails = row["details"],
                        ViolationVerdict = row["verdict"],
                        ViolationDate = DateTime.Parse(row["created"]).ToString("yyyy-MM-dd HH:mm:ss").ToUpper(),
                    }
                    );
            }
            repeater_violation.DataSource = ViolationList;
            repeater_violation.DataBind();
        }





        protected void Btn_submit_Click(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                UploadtoDB();
                Response.Write("alert<script>Form submitted.</script>");
                tb_violation.Text = "";
                tb_dateTime.Text = "";
                tb_verdict.Text = "";
                tb_description.Text = "";

            }
        }
    }
}