using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ToDos.UI
{
    public partial class ToDosList : System.Web.UI.Page
    {
        private ToDosEntities1 context = new ToDosEntities1();

        protected void Page_Load(object sender, EventArgs e)
        {
            this.ListViewTasks.InsertItemPosition = InsertItemPosition.None;
            this.DivCreateCategory.Visible = false;
            this.DivUpdateCategory.Visible = false;
        }


        protected void InsertButton_Click(object sender, EventArgs e)
        {
            var area = (sender as Button).Parent;


            Task task = new Task();
            task.Title = (area.FindControl("TitleTextBox") as TextBox).Text;
            task.Body = (area.FindControl("BodyTextBox") as TextBox).Text;
            task.CategoryId = int.Parse((area.FindControl("DDLCategoryInsert") as DropDownList).SelectedValue);

            context.Tasks.Add(task);
            context.SaveChanges();

            this.ListViewTasks.InsertItemPosition = InsertItemPosition.None;
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            var area = (sender as Button).Parent;
            var requestedId = int.Parse((sender as Button).CommandArgument);

            var taskToEdit = context.Tasks.Where(t => t.Id == requestedId).First();

            taskToEdit.Title = (area.FindControl("TitleTextBox") as TextBox).Text;
            taskToEdit.Body = (area.FindControl("BodyTextBox") as TextBox).Text;
            taskToEdit.DateOfLastChange = DateTime.Now;
            taskToEdit.CategoryId = int.Parse((area.FindControl("DDLCategoryInsert") as DropDownList).SelectedValue);

            context.SaveChanges();
        }

        protected void ButtonShowAddNewTask_Click(object sender, EventArgs e)
        {
            this.ListViewTasks.InsertItemPosition = InsertItemPosition.LastItem;
        }

        protected void ButtonCreateCategory_Click(object sender, EventArgs e)
        {
            this.DivCreateCategory.Visible = true;
        }

        protected void ButtonUpdateCategory_Click(object sender, EventArgs e)
        {
            DivUpdateCategory.Visible = true;
        }

        protected void ButtonCancelUpdate_Click(object sender, EventArgs e)
        {
            DivUpdateCategory.Visible = false;
        }

        protected void ButtonCancelCategoryCreate_Click(object sender, EventArgs e)
        {
            this.DivCreateCategory.Visible = false;
        }

        protected void ButtonSaveCategoryCreate_Click(object sender, EventArgs e)
        {
            Category category = new Category();
            category.Name = this.TextBoxCreateCategory.Text;

            context.Categories.Add(category);

            if (!string.IsNullOrEmpty(category.Name))
            {
                context.SaveChanges();
            }
            else
            {
                this.TextBoxCreateCategory.Text = "Invalid category name!";
            }
            DropDownListCategories.DataBind();
        }

        protected void ButtonSaveCategoryUpdate_Click(object sender, EventArgs e)
        {
            var categoryId = int.Parse(this.DropDownListCategories.SelectedValue);

            var category = context.Categories.Where(c => c.Id == categoryId).First();

            category.Name = this.TextBoxUpdateCategory.Text;

            if (!string.IsNullOrEmpty(category.Name))
            {
                context.SaveChanges();
            }
            else
            {
                this.TextBoxCreateCategory.Text = "Invalid category name!";
            }
            DropDownListCategories.DataBind();
        }

        protected void ButtonDeleteCategory_Click(object sender, EventArgs e)
        {
            var categoryId = int.Parse(this.DropDownListCategories.SelectedValue);

            var category = context.Categories.Where(c => c.Id == categoryId).First();

            context.Categories.Remove(category);
            context.SaveChanges();
            DropDownListCategories.DataBind();
        }
    }
}