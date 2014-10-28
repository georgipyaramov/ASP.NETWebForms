using Exam.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Exam.Web
{
    public partial class BookDetails : System.Web.UI.Page
    {
        private ApplicationDbContext context;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.context = new ApplicationDbContext();
        }

        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public object BookDetails_GetItem([QueryString]int id)
        {
            var book = this.context.Books.Find(id);
            return book;
        }

    }
}