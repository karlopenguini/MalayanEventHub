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

        // TODO: INSERT TO ADVISER TABLE AND MEMBERS TABLE
        private void UploadDataToServer()
        {
            // Collect data fields
            #region OrganizationTBL Insert Data
            // Information
            string orgName = tb_Name.Text.Trim();
            string orgAcronym = tb_Acronym.Text.Trim();
            string orgType = ddl_Type.SelectedValue.Trim();
            int orgContact = int.Parse(tb_Contact.Text.Trim());
            string orgStatus = "Pending";
            string orgMission = tb_Mission.Text.Trim();
            string orgVision = tb_Vision.Text.Trim();
            string orgCollege = ddl_College.SelectedValue.Trim();

            // Logo
            bool hasUploadImg = fu_Logo.HasFile;

            // Organization Members
            int orgAdviser = int.Parse(tb_AdviserNumber.Text.Trim());

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

            // Members
            cmd.Parameters.AddWithValue("@orgAdviser", orgAdviser);

            // Execute command & fetch organizationID
            string organizationID = dbHandler.ExecuteInsertQueryInReturn(cmd);
            #endregion

            #region OrganizationRequestTBL & RequestTBL Insert Data
            // Insert into OrganizationRequestTBL
            DateTime now = DateTime.Now;
            string OrganizationRequestTBL_query = "INSERT INTO OrganizationRequestTBL (organizationId, userId, created)" +
                $"VALUES ({organizationID}, {userID}, {now.ToString("yyyy-MM-dd HH:mm:ss")}')";

            // Execute command & fetch requestID
            string requestID = dbHandler.ExecuteInsertQueryInReturn(OrganizationRequestTBL_query);

            // Insert into RequestsTBL
            string RequestTBL_query = "INSERT INTO RequestTBL (requestID, requestStatus, requestType)" +
                $"VALUES ({requestID}, '{"Pending"}', '{"Organization-Request"}')";

            dbHandler.ExecuteInsertQuery(RequestTBL_query);
            #endregion

            // Redirect to Organization page
            // NONE YET
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
        protected void VicePresident_IsExist(object source, ServerValidateEventArgs args)
        {
            SqlConnection dbConn;
            string cmdText = "SELECT COUNT(*) FROM StudentTBL WHERE userID LIKE '%' + @studentID + '%'";
            try
            {
                dbConn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString);
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
                dbConn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString);
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
                dbConn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString);
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
            try
            {
                dbConn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString);
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