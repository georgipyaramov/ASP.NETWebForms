using Exam.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Exam.Web
{
    public partial class _Default : Page
    {
        private ApplicationDbContext context;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.context = new ApplicationDbContext();
        }

        public IEnumerable<Category> RepeaterCategories_GetData()
        {
            var categories = this.context.Categories.OrderBy(c => c.Id).ToList();
            return categories;
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            var searchParameter = this.TextBoxSearch.Text;
            Response.Redirect("Search.aspx?query=" + searchParameter);
        }
    }
}