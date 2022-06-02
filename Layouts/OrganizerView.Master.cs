using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MCLEventHub.Layouts
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        string orgID2;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["orgID"]))
            {
                orgID2 = Request.QueryString["orgID"];
                Session["organizationID"] = orgID2;
            }
            else if (Session["organizationID"] != null)
            {
                orgID2 = Session["organizationID"].ToString();
            }
            btn_account.Text = Session["fullName"].ToString();

        }

        protected void GotoUserAccPage(object sender, EventArgs e)
        {
            Response.Redirect("../User/UserProfilePage(update).aspx");
        }
    }
}