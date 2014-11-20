using NewsSystem.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewsSystem.Web.Administration
{
    public partial class EditCategories : System.Web.UI.Page
    {
        private ApplicationDbContext dbContext;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.dbContext = new ApplicationDbContext();
        }


        public IQueryable<Category> ListViewAllCategories_GetData()
        {
            var categories = this.dbContext.Categories;
            return categories;
        }

        public void ListViewAllCategories_UpdateItem(int id)
        {
            Category item = null;
            item = this.dbContext.Categories.Find(id);

            if (item == null)
            {
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                return;
            }

            TryUpdateModel(item);

            if (ModelState.IsValid)
            {
                this.dbContext.SaveChanges();
            }
        }

        public void ListViewAllCategories_DeleteItem(int id)
        {
            Category item = null;
            item = this.dbContext.Categories.Find(id);

            if (item == null)
            {
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                return;
            }

            this.dbContext.Categories.Remove(item);

            if (ModelState.IsValid)
            {
                this.dbContext.SaveChanges();
            }
        }

        public void ListViewAllCategories_InsertItem()
        {
            var item = new Category();

            TryUpdateModel(item);

            this.dbContext.Categories.Add(item);

            if (ModelState.IsValid)
            {
                this.dbContext.SaveChanges();
            }
        }
    }
}