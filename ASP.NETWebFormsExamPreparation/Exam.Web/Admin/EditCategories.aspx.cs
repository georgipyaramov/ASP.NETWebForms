using Exam.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Exam.Web.Admin
{
    public partial class EditCategory : System.Web.UI.Page
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
        public IQueryable<Category> ListView1_GetData()
        {
            var categories = this.context.Categories.OrderBy(c => c.Id);
            return categories;
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void ListView1_UpdateItem(int id)
        {
            Category item = null;
            item = this.context.Categories.Find(id);

            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                return;
            }

            TryUpdateModel(item);

            if (ModelState.IsValid)
            {
                // Save changes here, e.g. MyDataLayer.SaveChanges();
                this.context.SaveChanges();
            }
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void ListView1_DeleteItem(int id)
        {
            Category item = null;
            item = this.context.Categories.Find(id);

            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                return;
            }

            this.context.Categories.Remove(item);

            if (ModelState.IsValid)
            {
                // Save changes here, e.g. MyDataLayer.SaveChanges();
                this.context.SaveChanges();
            }
            this.context.SaveChanges();
        }
    }
}