using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MalayanEventHub
{
    public partial class OrgCreateEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }


        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            
        }

        //validations control
        protected void RequiredValue_ServerValidate(object source, ServerValidateEventArgs args)
        {

            if (args.Value == "")
            {
                args.IsValid = false;
                return;
            }
        }

        protected void StartDateTime_Validate(object source, ServerValidateEventArgs args)
        {
            try
            {
                if (args.Value == "")
                {
                    args.IsValid = false;
                    return;
                }
                DateTime start = DateTime.Parse(args.Value);
                DateTime today = DateTime.Now;
                if (start >= today)
                {
                    args.IsValid = true;
                }
                else
                {
                    args.IsValid = false;
                }
            }
            catch (Exception e)
            {
                args.IsValid = false;
            }
            // write your code here


        }
        protected void CustomValidatorEndDateTime_ServerValidate(object source, ServerValidateEventArgs args)
        {
            try
            {
                if (TextBoxStartDateTime.Text == "" || TextBoxEndDateTime.Text=="")
                {
                    args.IsValid = false;
                    return;
                }
                DateTime start = DateTime.Parse(TextBoxStartDateTime.Text);
                DateTime end = DateTime.Parse(TextBoxEndDateTime.Text);
                if (start.Date < end.Date)
                {
                    args.IsValid = true;
                }
                else if (start.Date==end.Date && (end.TimeOfDay-start.TimeOfDay).Duration().TotalMinutes>=30)
                {
                    args.IsValid = true;
                }
                else
                {
                    args.IsValid = false;
                }
            }
            catch (Exception e)
            {
                args.IsValid = false;
            }
        }

        protected void CustomValidatorGradeYear_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if(DropDownListStartGradeYear.SelectedValue=="" || DropDownListEndGradeYear.SelectedValue == "")
            {
                args.IsValid = false;
            }
        }
    }
}