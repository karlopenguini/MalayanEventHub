using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using MalayanEventHub.Classes;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace MalayanEventHub.Pages.Organizer
{
    public partial class OrgDetailsOrganizer : System.Web.UI.Page
    {
        string userID;
        string logo;
        string organizationID;
        string organizationName;
        string organizationType;
        string organizationContact;
        string mission;
        string vision;
        string college;
        string organizationStatus;
        string president;
        string adviser;
        string vice;
        string secretary;
        string treasurer;

        DatabaseHandler dbHandler = new DatabaseHandler();

        protected void Page_Load(object sender, EventArgs e)
        {
            organizationID = Request.QueryString["orgID"];
            userID = Session["userID"].ToString();
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!Page.IsPostBack)
            {
                LoadDataDetails();
                LoadPresident();
                LoadVice();
                LoadTreasurer();
                LoadSecretary();
                LoadAdviser();
                LoadImage();
                LoadMembers();
            }
        }

        protected void LoadDataDetails()
        {
            string query =
                $"SELECT * FROM OrganizationTBL where organizationID = {organizationID}";
            Dictionary<string, string> data = dbHandler.RetrieveData(query)[0];

            mission = data["mission"];
            vision = data["vision"];
            organizationContact = data["organizationContact"];

            mission_desc.InnerText = mission;
            vision_desc.InnerText = vision;
            contact_details.InnerText = organizationContact;
        }

        protected class MemberData
        {
            public string MemberName { get; set; }
        }

        protected void LoadPresident()
        {
            string query =
                "select CONCAT(a.firstName,' ',a.lastName) as full_name from UserTBL a inner join MemberTBL b on a.userID" +
                $"= b.userID where b.organizationID = {organizationID} and b.memberRole = 'President'";
            Dictionary<string, string> data = dbHandler.RetrieveData(query)[0];

            president = data["full_name"];
            president_name.InnerText = president;
        }

        protected void LoadVice()
        {
            string query =
                "select CONCAT(a.firstName,' ',a.lastName) as full_name from UserTBL a inner join MemberTBL b on a.userID" +
                $"= b.userID where b.organizationID = {organizationID} and b.memberRole = 'Vice-President'";
            Dictionary<string, string> data = dbHandler.RetrieveData(query)[0];

            vice = data["full_name"];
            vice_name.InnerText = vice;
        }

        protected void LoadSecretary()
        {
            string query =
                "select CONCAT(a.firstName,' ',a.lastName) as full_name from UserTBL a inner join MemberTBL b on a.userID" +
                $"= b.userID where b.organizationID = {organizationID} and b.memberRole = 'Secretary'";
            Dictionary<string, string> data = dbHandler.RetrieveData(query)[0];

            secretary = data["full_name"];
            secretary_name.InnerText = secretary;
        }

        protected void LoadTreasurer()
        {
            string query =
                "select CONCAT(a.firstName,' ',a.lastName) as full_name from UserTBL a inner join MemberTBL b on a.userID" +
                $"= b.userID where b.organizationID = {organizationID} and b.memberRole = 'Treasurer'";
            Dictionary<string, string> data = dbHandler.RetrieveData(query)[0];

            treasurer = data["full_name"];
            treasurer_name.InnerText = treasurer;
        }

        protected void LoadAdviser()
        {
            string query =
                "select CONCAT(a.firstName,' ',a.lastName) as full_name from AdviserTBL a inner join OrganizationTBL b on a.adviserID" +
                $"= b.organizationAdviser where b.organizationID = {organizationID}";
            Dictionary<string, string> data = dbHandler.RetrieveData(query)[0];

            adviser = data["full_name"];
            adviser_name.InnerText = adviser;
        }

        private void LoadImage()
        {
            //get base 64 string of Imag
            string queryImg = "SELECT imgBase64Str FROM OrganizationTBL cross apply (select logo '*' for xml path('')) T (imgBase64Str) " +
                         $"WHERE organizationID = {organizationID}";
            Dictionary<string, string> data = dbHandler.RetrieveData(queryImg)[0];
            string base64 = data["imgBase64Str"];
            if (!String.IsNullOrEmpty(base64))
            {
                image_logo.Src = "data:image/png;base64, " + base64;
            }
        }

        protected void LoadMembers()
        {
            List<MemberData> Members = new List<MemberData>();

            string query =
                "select CONCAT(a.firstName,' ',a.lastName) as full_name from UserTBL a inner join MemberTBL b on a.userID" +
                $"= b.userID where b.organizationID = '{organizationID}' and b.memberRole = 'Member';";

            foreach (Dictionary<string, string> row in dbHandler.RetrieveData(query))
            {
                Members.Add(
                    new MemberData()
                    {
                        MemberName = row["full_name"]
                    }
                );
            }

            repeater_Members.DataSource = Members;
            repeater_Members.DataBind();
        }

        protected void Member_IsExist(object source, ServerValidateEventArgs args)
        {
            SqlConnection dbConn;
            string cmdText = "SELECT COUNT(*) FROM StudentTBL WHERE userID LIKE '%' + @studentID + '%'";
            string[] members = tb_MemberList.Text.Split(
                    new string[] { "\r\n", "\r", "\n" },
                    StringSplitOptions.None);

            try
            {
                dbConn = new SqlConnection("Server = tcp:mcleventhub.database.windows.net, 1433; Initial Catalog = MalayanEventHubDB; Persist Security Info = False; User ID = group2; Password = !Malayaneventhub1234; MultipleActiveResultSets = False; Encrypt = True; TrustServerCertificate = False; Connection Timeout = 30;");
            }
            catch (Exception ex)
            {
                throw ex;
            }

            using (dbConn)
            {
                dbConn.Open();

                using (SqlCommand cmd = new SqlCommand(cmdText, dbConn))
                {
                    foreach (string member in members)
                    {
                        cmd.Parameters.AddWithValue("@studentID", member);

                        int count = (int)cmd.ExecuteScalar();

                        if (count <= 0)
                        {
                            args.IsValid = false;
                            break;
                        }
                    }
                }
            }
        }

        protected void btn_Add_Click(object sender, EventArgs e)
        {
            if (tb_Member.Text.Length == 10)
            {
                string[] members = tb_MemberList.Text.Split(
                    new string[] { "\r\n", "\r", "\n" },
                    StringSplitOptions.None);

                if (!members.Contains(tb_Member.Text))
                {
                    string toAdd = tb_Member.Text + "\n";

                    tb_Member.Text = "";
                    tb_MemberList.Text += toAdd;
                }
            }
        }

        protected void btn_Delete_Click(object sender, EventArgs e)
        {
            if (tb_Member.Text.Length == 10)
            {
                string[] members = tb_MemberList.Text.Split(
                    new string[] { "\r\n", "\r", "\n" },
                    StringSplitOptions.None);

                if (members.Contains(tb_Member.Text))
                {
                    members = members.Where(val => val != tb_Member.Text).ToArray();
                    tb_MemberList.Text = "";
                }

                foreach (string member in members)
                {
                    string toAdd = member;
                    tb_MemberList.Text += toAdd;
                }
            }

        }
    }
}