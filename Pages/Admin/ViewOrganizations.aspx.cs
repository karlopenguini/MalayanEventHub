using MalayanEventHub.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MalayanEventHub.Layouts
{
    public partial class WebForm4 : System.Web.UI.Page
    {

        DatabaseHandler dbHandler;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                dbHandler = new DatabaseHandler();
                LoadOrganizations();
            }
        }

        protected void LoadOrgData()
        {
            string query = "Select * from OrganizationTBL where college = "
        }
            


            //{

            //    SqlConnection connect = new SqlConnection("Server = tcp:mcleventhub.database.windows.net, 1433; Initial Catalog = MalayanEventHubDB; Persist Security Info = False; User ID = group2; Password = !Malayaneventhub1234; MultipleActiveResultSets = False; Encrypt = True; TrustServerCertificate = False; Connection Timeout = 30;");
            //    SqlCommand cmd = new SqlCommand("select * from OrganizationTBL where college = @college", connect);
            //    connect.Open();
            //    cmd.Parameters.AddWithValue("@college", ddlCollege.SelectedItem.Text.ToString());
            //    SqlDataReader sdr = cmd.ExecuteReader();
            //    if (sdr.HasRows)
            //    {
            //        DataList1.DataSource = sdr;
            //        DataList1.DataBind();
            //    }
            //    else
            //    {
            //        DataList1.DataSource = "";
            //        DataList1.DataBind();
            //    }
            //    connect.Close();
            //}
        protected string FormatUrl(string site, int orgID)
        {
            return site + "?organizationID=" + orgID;
        }
    }
}