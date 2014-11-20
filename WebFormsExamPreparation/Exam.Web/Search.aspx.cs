using Exam.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Exam.Web
{
    public partial class Search : System.Web.UI.Page
    {
        private ApplicationDbContext context;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.context = new ApplicationDbContext();
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IEnumerable<Book> ListViewSearchedBooksResults_GetData()
        {
            var searchParams = Request.Params["query"];
            var books = this.context.Books.Where(b => b.Title.Contains(searchParams) || b.Author.Contains(searchParams)).ToList();
            return books;
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            this.SearchParameter.Text = Request.Params["query"];
        }
    }
}