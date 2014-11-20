using NewsSystem.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace NewsSystem.Web.Administration
{
    public partial class EditArticles : System.Web.UI.Page
    {
        private ApplicationDbContext dbContext;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.dbContext = new ApplicationDbContext();
        }

        public IQueryable<Article> ListViewAllArticles_GetData()
        {

            var articles = this.dbContext.Articles;
            return articles;
        }

        public IQueryable<Category> DropDownListCategoriesArticlesEdit_GetData()
        {
            if (this.dbContext == null)
            {
                this.dbContext = new ApplicationDbContext();
            }
            var categories = this.dbContext.Categories;
            return categories;
        }

        public void ListViewAllArticles_UpdateItem(int id)
        {
            Article item = null;
            item = this.dbContext.Articles.Find(id);

            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                return;
            }

            TryUpdateModel(item);

            if (ModelState.IsValid)
            {
                this.dbContext.SaveChanges();
            }
        }

        public void ListViewAllArticles_DeleteItem(int id)
        {
            Article item = null;
            item = this.dbContext.Articles.Find(id);

            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                return;
            }

            this.dbContext.Articles.Remove(item);

            if (ModelState.IsValid)
            {
                this.dbContext.SaveChanges();
            }
        }

        public void ListViewAllArticles_InsertItem()
        {
            var userId = this.User.Identity.GetUserId();
            var item = new Article();

            item.Author = this.dbContext.Users.Find(userId);
            item.DateCreated = DateTime.Now;
            item.Likes = 0;

            TryUpdateModel(item);

            this.dbContext.Articles.Add(item);

            if (ModelState.IsValid)
            {
                this.dbContext.SaveChanges();
            }
        }

        protected void LinkButtonShowInsertForm_Click(object sender, EventArgs e)
        {
            this.ListViewAllArticles.InsertItemPosition = InsertItemPosition.LastItem;
            this.LinkButtonShowInsertForm.Visible = false;
        }

        protected void LinkButtonCancelInsertForm_Click(object sender, EventArgs e)
        {
            this.ListViewAllArticles.InsertItemPosition = InsertItemPosition.None;
            this.LinkButtonShowInsertForm.Visible = true;
        }

    }
}