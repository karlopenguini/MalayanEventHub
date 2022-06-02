using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MalayanEventHub.Classes;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

namespace MalayanEventHub.Layouts
{
    public partial class OrgRegistration : System.Web.UI.Page
    {
        DatabaseHandler dbHandler;
        string userID;

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            userID = Session["userID"].ToString();
            // Create a handler
            dbHandler = new DatabaseHandler();

            // Fetch user
            if (!Page.IsPostBack)
            {
                //userID = Request.QueryString["userID"].ToString();
            }
        }

        protected void btn_Register_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                UploadDataToServer();
            }
        }

        private void UploadDataToServer()
        {
            #region OrganizationTBL Insert Data
            // Information
            string orgName = tb_Name.Text.Trim();
            string orgAcronym = tb_Acronym.Text.Trim();
            string orgType = ddl_Type.SelectedValue.Trim();
            int orgAdviser = int.Parse(tb_AdviserNumber.Text.Trim());
            int orgContact = int.Parse(tb_Contact.Text.Trim());
            string orgStatus = "Pending";
            string orgMission = tb_Mission.Text.Trim();
            string orgVision = tb_Vision.Text.Trim();
            string orgCollege = ddl_College.SelectedValue.Trim();

            // Logo
            bool hasUploadImg = fu_Logo.HasFile;

            // Connect to SQL
            string OrganizationTBL_query = "INSERT INTO OrganizationTBL (organizationName, organizationAcronym, organizationType, organizationAdviser, organizationContact," +
                " organizationStatus, mission, vision, college, logo)" +
                " VALUES (@orgName, @orgAcronym, @orgType, @orgAdviser, @orgContact, @orgStatus, @orgMission, @orgVision, @orgCollege, @orgLogo);";
            SqlCommand cmd = new SqlCommand(OrganizationTBL_query);

            // Add values
            // Information
            cmd.Parameters.AddWithValue("@orgName", orgName);
            cmd.Parameters.AddWithValue("@orgAcronym", orgAcronym);
            cmd.Parameters.AddWithValue("@orgType", orgType);
            cmd.Parameters.AddWithValue("@orgAdviser", orgAdviser);
            cmd.Parameters.AddWithValue("@orgContact", orgContact);
            cmd.Parameters.AddWithValue("@orgStatus", orgStatus);
            cmd.Parameters.AddWithValue("@orgMission", orgMission);
            cmd.Parameters.AddWithValue("@orgVision", orgVision);
            cmd.Parameters.AddWithValue("@orgCollege", orgCollege);
            
            // Logo
            if (hasUploadImg)
            {
                cmd.Parameters.AddWithValue("@orgLogo", GetImageBytes());
            }
            else
            {
                cmd.Parameters.AddWithValue("@orgLogo", System.Data.SqlTypes.SqlBinary.Null);
            }

            // Execute command & fetch organizationID
            string organizationID = dbHandler.ExecuteInsertQueryInReturn(cmd);
            #endregion

            #region MemberTBL Insert Data
            // Collect Key Members
            //int president_ID = int.Parse(Request.QueryString["userID"]);
            int vicepresident_ID = int.Parse(tb_VicePresidentNumber.Text);
            int secretary_ID = int.Parse(tb_SecretaryNumber.Text);
            int treasurer_ID = int.Parse(tb_TreasurerNumber.Text);

            // Collect Members
            string[] members = tb_MemberList.Text.Trim().Split(
                    new string[] { "\n" },
                    StringSplitOptions.None);

            // MemberTBL queries
            // Key Member
            // Execute queries
            string president_query = $"INSERT INTO MemberTBL (organizationID, userId, membershipStatus, memberRole) VALUES ({organizationID}, {userID}, 'Pending', 'President');";
            dbHandler.ExecuteInsertQuery(president_query);

            string vicepresident_query = $"INSERT INTO MemberTBL (organizationID, userId, membershipStatus, memberRole) VALUES ({organizationID}, {vicepresident_ID}, 'Pending', 'Vice President');";
            dbHandler.ExecuteInsertQuery(vicepresident_query);

            string secretary_query = $"INSERT INTO MemberTBL (organizationID, userId, membershipStatus, memberRole) VALUES ({organizationID}, {secretary_ID}, 'Pending', 'Secretary');";
            dbHandler.ExecuteInsertQuery(secretary_query);

            string treasurer_query = $"INSERT INTO MemberTBL (organizationID, userId, membershipStatus, memberRole) VALUES ({organizationID}, {treasurer_ID}, 'Pending', 'Treasurer');";
            dbHandler.ExecuteInsertQuery(treasurer_query);

            // Members
            string members_query;

            // Iterate over each member and add to query
            foreach (string member in members)
            {
                members_query = $"INSERT INTO MemberTBL (organizationID, userId, membershipStatus, memberRole) VALUES ({organizationID}, {member}, 'Pending', 'Member');";
                dbHandler.ExecuteInsertQuery(members_query);
            }
            #endregion

            #region OrganizationRequestTBL & RequestTBL Insert Data
            //// Insert into OrganizationRequestTBL
            DateTime now = DateTime.Now;
            string OrganizationRequestTBL_query = "INSERT INTO OrganizationRequestTBL (organizationId, userId, created)" +
                $" VALUES ({organizationID}, {userID}, '{now.ToString("yyyy-MM-dd")}'); ";

            // Execute command & fetch requestID
            string requestID = dbHandler.ExecuteInsertQueryInReturn(OrganizationRequestTBL_query);

            // Insert into RequestsTBL
            string RequestTBL_query = "INSERT INTO RequestTBL (requestID, requestStatus, requestType)" +
                $"VALUES ({requestID}, '{"Pending"}', '{"Organization-Request"}');";

            dbHandler.ExecuteInsertQuery(RequestTBL_query);
            #endregion

            // Redirect to Organization page
            Response.Redirect("OrganizationsOrganizer.aspx");
        }

        private Byte[] GetImageBytes()
        {
            Byte[] imageBytes;

            using (Stream stream = fu_Logo.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(stream))
                {
                    imageBytes = br.ReadBytes((Int32)stream.Length);
                }
            }
            return imageBytes;
        }

        #region CustomValidators
        protected void Adviser_IsExist(object source, ServerValidateEventArgs args)
        {
            SqlConnection dbConn;
            string cmdText = "SELECT COUNT(*) FROM AdviserTBL WHERE adviserID LIKE '%' + @adviserID + '%'";
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
                    cmd.Parameters.AddWithValue("@adviserID", tb_AdviserNumber.Text);

                    int count = (int)cmd.ExecuteScalar();

                    if (count <= 0)
                    {
                        args.IsValid = false;
                    }
                }
            }
        }

        protected void VicePresident_IsExist(object source, ServerValidateEventArgs args)
        {
            SqlConnection dbConn;
            string cmdText = "SELECT COUNT(*) FROM StudentTBL WHERE userID LIKE '%' + @studentID + '%'";
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
                    cmd.Parameters.AddWithValue("@studentID", tb_VicePresidentNumber.Text);

                    int count = (int)cmd.ExecuteScalar();

                    if (count <= 0)
                    {
                        args.IsValid = false;
                    }
                }
            }
        }

        protected void Secretary_IsExist(object source, ServerValidateEventArgs args)
        {
            SqlConnection dbConn;
            string cmdText = "SELECT COUNT(*) FROM StudentTBL WHERE userID LIKE '%' + @studentID + '%'";
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
                    cmd.Parameters.AddWithValue("@studentID", tb_SecretaryNumber.Text);

                    int count = (int)cmd.ExecuteScalar();

                    if (count <= 0)
                    {
                        args.IsValid = false;
                    }
                }
            }
        }

        protected void Treasurer_IsExist(object source, ServerValidateEventArgs args)
        {
            SqlConnection dbConn;
            string cmdText = "SELECT COUNT(*) FROM StudentTBL WHERE userID LIKE '%' + @studentID + '%'";
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
                    cmd.Parameters.AddWithValue("@studentID", tb_TreasurerNumber.Text);

                    int count = (int)cmd.ExecuteScalar();

                    if (count <= 0)
                    {
                        args.IsValid = false;
                    }
                }
            }
        }

        protected void Member_IsExist(object source, ServerValidateEventArgs args)
        {
            SqlConnection dbConn;
            string cmdText = "SELECT COUNT(*) FROM StudentTBL WHERE userID LIKE '%' + @studentID + '%'";
            string[] members = tb_MemberList.Text.Split(
                    new string[] { "\r\n", "\r", "\n" },
                    StringSplitOptions.None);

            // 16
            if (members.Count() < 0)
            {
                args.IsValid = false;
            }
            else
            {
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
                            cmd.Parameters.Clear();

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
        }
        #endregion

        #region Add and Delete Member buttons
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
        #endregion
    }
}