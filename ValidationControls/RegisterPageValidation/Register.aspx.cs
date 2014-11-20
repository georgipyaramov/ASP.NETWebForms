// 1. Create a form to register users with fields for 
// preferred user name, password, repeat password, 
// first name, last name, age, email, local address, 
// phone and an “I accept” option. All fields are 
// required. Valid age is between 18 and 81. Display 
// error messages in a ValidationSummary. Use a 
// regular expression for the email and phone fields.
   
// 2. Separate the fields in groups and validate them 
// using Validation Groups. The Validation Groups 
// should be at least three – Logon Info, Personal Info, 
// Address Info.

namespace RegisterPageValidation
{
    using System;
    using System.Web.UI;
    using System.Web.UI.WebControls;

    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CustomValidatorUsername_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (IsPostBack)
            {
                if (args.Value.Length < 3)
                {
                    this.CustomValidatorUsername.ErrorMessage =
                        "Field should be more than 3 symbols.";
                    args.IsValid = false;
                    return;
                }

                args.IsValid = true;
            }
        }

        protected void CheckBoxRequired_ServerValidate(object sender, ServerValidateEventArgs args)
        {
            args.IsValid = this.CheckBoxAccept.Checked;
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                Page.Validate("PersonalInfo");
                Page.Validate("ContactInfo");
                Page.Validate("LoginInfo");

                ValidatePage();
            }
        }

        private void ValidatePage()
        {
            if (Page.IsValid)
            {
                LabelFinalResult.Text = "<p class=\"alert-success\">Your information has been accepted!</>";
                LabelFinalResult.CssClass = "alert-success";
            }
            else
            {
                LabelFinalResult.Text = "<p class=\"alert-danger\">Your information has NOT been accepted!</>";
                LabelFinalResult.CssClass = "alert-danger";
            }
        }

        protected void ButtonSubmitLoginInfo_Click(object sender, EventArgs e)
        {
            Page.Validate("LoginInfo");

            ValidatePage();
        }

        protected void ButtonSubmitPersonalInfo_Click(object sender, EventArgs e)
        {

            Page.Validate("PersonalInfo");

            ValidatePage();
        }

        protected void ButtonSubmitContactInfo_Click(object sender, EventArgs e)
        {
            Page.Validate("ContactInfo");

            ValidatePage();
        }
    }
}