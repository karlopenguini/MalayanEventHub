using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using MalayanEventHub.Classes;
using System.Web.UI.WebControls;

namespace MalayanEventHub.Layouts
{
    public partial class OrganizationsOrganizer : System.Web.UI.Page
    {
        DatabaseHandler dbHandler;
        string userID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                dbHandler = new DatabaseHandler();

                userID = Request.QueryString["userID"];

                //load event 
                Load_Organization();
            }
        }

        private void Load_Organization()
        {
            string query = "SELECT OrganizationTBL.organizationID," +
                " OrganizationTBL.organizationName, OrganizationTBL.organizationType," +
                " OrganizationTBL.college FROM OrganizationTBL" +
                " INNER JOIN MemberTBL ON OrganizationTBL.organizationID = MemberTBL.organizationID" +
                $" WHERE MemberTBL.userId = {userID}";

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
        }
    }
}