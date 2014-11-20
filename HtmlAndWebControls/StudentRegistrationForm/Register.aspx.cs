using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace StudentRegistrationForm
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void buttonRegister_Click(object sender, EventArgs e)
        {
            if (this.IsValid)
            {
                var mainContentSecondCol = new HtmlGenericControl("div");
                mainContentSecondCol.Attributes["class"] = "col-md-6";

                var studentNamesLabel = new HtmlGenericControl("span");
                studentNamesLabel.InnerText = "Student names: ";

                var studentNames = new HtmlGenericControl("h2");
                studentNames.InnerText = this.textBoxFirstNameInput.Text + " " + this.textBoxLastNameInput.Text;

                var facultyNumberLabel = new HtmlGenericControl("span");
                facultyNumberLabel.InnerText = "Faculty number: ";

                var facultyNumber = new HtmlGenericControl("h2");
                facultyNumber.InnerText = this.textBoxFacultyNumberInput.Text;

                var universityLabel = new HtmlGenericControl("span");
                universityLabel.InnerText = "University: ";

                var universityName = new HtmlGenericControl("h2");
                universityName.InnerText = this.dropDownListUniversityInput.SelectedValue;

                var specialtyLabel = new HtmlGenericControl("span");
                specialtyLabel.InnerText = "Specialty: ";

                var specialty = new HtmlGenericControl("h2");
                specialty.InnerText = this.dropDownListSpecialtyInput.SelectedValue;

                var coursesLabel = new HtmlGenericControl("span");
                coursesLabel.InnerText = "Courses: ";

                var courses = new HtmlGenericControl("h2");
                var allCourses = new List<string>();
                foreach (ListItem item in this.dropDownCoursesInput.Items)
                {
                    if (item.Selected == true)
                    {
                        allCourses.Add(item.ToString());
                    }
                }

                courses.InnerText = string.Join(", ", allCourses.ToArray());

                mainContentSecondCol.Controls.Add(studentNamesLabel);
                mainContentSecondCol.Controls.Add(studentNames);
                mainContentSecondCol.Controls.Add(facultyNumberLabel);
                mainContentSecondCol.Controls.Add(facultyNumber);
                mainContentSecondCol.Controls.Add(universityLabel);
                mainContentSecondCol.Controls.Add(universityName);
                mainContentSecondCol.Controls.Add(specialtyLabel);
                mainContentSecondCol.Controls.Add(specialty);
                mainContentSecondCol.Controls.Add(coursesLabel);
                mainContentSecondCol.Controls.Add(courses);

                this.main.Controls.Add(mainContentSecondCol);
            }
            
        }

        protected void ValidateUniversity(object sender, ServerValidateEventArgs args)
        {
            if (args.Value == "0")
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }
    }
}