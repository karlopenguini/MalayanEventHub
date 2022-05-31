using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MalayanEventHub.Layouts
{
    public partial class OrganizationsOrganizer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!Page.IsPostBack)
            //{
            //    OrganizationData SampleOrganization = new OrganizationData
            //    {
            //        OrganizationImageURL = "../../Images/mcl_logo.png",
            //    };
            //    List<OrganizationData> SampleOrganizations = new List<OrganizationData>();

            //    for (int i = 0; i < 9; i++)
            //    {
            //        SampleOrganizations.Add(SampleOrganization);
            //    }

            //    OrganizationsRepeater.DataSource = SampleOrganizations;
            //    OrganizationsRepeater.DataBind();
            //}
        }

        //public class OrganizationData
        //{
        //    public string OrganizationImageURL { get; set; }
        //}

        protected void btnRegister_Click(object sender, EventArgs e)
        {
        }
    }
}