using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MCLEventHub.Layouts
{
    public partial class UserView : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btn_account.Text = Session["fullName"].ToString();

        }

        protected void GotoUserAccPage(object sender, EventArgs e)
        {
            Response.Redirect("UserProfilePage(update).aspx");
        }
    }
}