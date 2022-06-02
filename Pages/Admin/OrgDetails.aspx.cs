using MalayanEventHub.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MalayanEventHub.Layouts.Common.Admin
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        string userID;
        string logo;
        int organizationID = 80001;
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
            if (!Page.IsPostBack)
            {
                LoadDataDetails();
                LoadPresident();
                LoadVice();
                LoadTreasurer();
                LoadSecretary();
                LoadImage();
                LoadAdviser();
            }
        }

        protected void LoadDataDetails()
        {
            string query =
                $"SELECT * FROM OrganizationTBL where organizationID = {organizationID}";
            Dictionary<string, string> data = dbHandler.RetrieveData(query)[0];


            //organizationName = data["organizationName"];
            //organizationType = data["organizationType"];
            //college = data["college"];
            //organizationStatus = data["organizationStatus"];

            mission = data["mission"];
            vision = data["vision"];
            organizationContact = data["organizationContact"];


            mission_desc.InnerText = mission;
            vision_desc.InnerText = vision;
            contact_details.InnerText = organizationContact;

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
    }
}