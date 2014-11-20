using NewsSystem.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace NewsSystem.Web
{
    public partial class ViewArticle : System.Web.UI.Page
    {
        private ApplicationDbContext dbContext;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.dbContext = new ApplicationDbContext();
        }

        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public Article FormViewArticleDetails_GetItem([QueryString]int? id)
        {
            var article = this.dbContext.Articles.Find(id);
            return article;
        }
    }
}