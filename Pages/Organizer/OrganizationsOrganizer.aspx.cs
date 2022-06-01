﻿using System;
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
        DatabaseHandler dbHandler = new DatabaseHandler();
        string userID = "2020181818";

        string name;
        string type;
        string status;
        string college;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //userID = Request.QueryString["userID"];
                GETOrganizations();

            }
        }

        protected class OrganizationData
        {
            public string OrganizationLogo { get; set; }
            public string OrganizationName { get; set; }
            public string OrganizationType { get; set; }
            public string OrganizationStatus { get; set; }
            public string OrganizationCollege { get; set; }
            public string OrganizationURL { get; set; }
        }

        protected void GETOrganizations()
        {
            List<OrganizationData> Organizations = new List<OrganizationData>();
            type = ddl_type.SelectedItem.Text;
            status = ddl_Status.SelectedItem.Text;
            college = ddl_college.SelectedItem.Text;

            string query =
                "SELECT OrganizationTBL.organizationID," +
                " OrganizationTBL.organizationName, OrganizationTBL.organizationType," +
                " OrganizationTBL.college, OrganizationTBL.logo, OrganizationTBL.organizationStatus FROM OrganizationTBL" +
                " INNER JOIN MemberTBL ON OrganizationTBL.organizationID = MemberTBL.organizationId" +
                $" WHERE MemberTBL.userId = {userID} AND (OrganizationTBL.organizationStatus = '{status}'" +
                $" AND OrganizationTBL.college = '{college}' AND OrganizationTBL.organizationType = '{type}');";

            foreach(Dictionary<string, string> row in dbHandler.RetrieveData(query))
            {
                string organizationID = row["organizationID"];
                string organizationURL = $"userID={userID}&organizationID={organizationID}";

                string logo = row["logo"];
                if (DBNull.Value.Equals(row["logo"]))
                {
                    logo = "~/Images/mcl_logo.png";
                }

                Organizations.Add(
                    new OrganizationData()
                    {
                        OrganizationLogo = logo,
                        OrganizationName = row["organizationName"],
                        OrganizationType = row ["organizationType"],
                        OrganizationStatus = row["organizationStatus"],
                        OrganizationCollege = row["college"],
                        OrganizationURL = organizationURL,
                    }
                );
            }

            OrganizationsRepeater.DataSource = Organizations;
            OrganizationsRepeater.DataBind();
        }
        protected void Organizations_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Fetch controls
                Label status = (Label)e.Item.FindControl("lbl_Status") as Label;
                LinkButton btn_Details = (LinkButton)e.Item.FindControl("btn_Details") as LinkButton;
                LinkButton btn_CreateEvent = (LinkButton)e.Item.FindControl("btn_CreateEvent") as LinkButton;
                LinkButton btn_ViewEvent = (LinkButton)e.Item.FindControl("btn_ViewEvent") as LinkButton;
                LinkButton btn_Violations = (LinkButton)e.Item.FindControl("btn_Violations") as LinkButton;

                // If pending status, disable LinkButton controls and change text of Buttons to "Pending"
                if (status.Text == "Pending")
                {
                    btn_Details.Enabled = false;
                    btn_Details.Text = "Pending";

                    btn_CreateEvent.Enabled = false;
                    btn_CreateEvent.Text = "Pending";

                    btn_ViewEvent.Enabled = false;
                    btn_ViewEvent.Text = "Pending";

                    btn_Violations.Enabled = false;
                    btn_Violations.Text = "Pending";
                }
            }
        }

        protected void ddl_type_SelectedIndexChanged(object sender, EventArgs e)
        {
            GETOrganizations();
        }

        protected void ddl_college_SelectedIndexChanged(object sender, EventArgs e)
        {
            GETOrganizations();
        }

        protected void ddl_Status_SelectedIndexChanged(object sender, EventArgs e)
        {
            GETOrganizations();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("OrgRegistration.aspx?userID=" + userID);
        }
    }
}