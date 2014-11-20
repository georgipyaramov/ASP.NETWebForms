using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cinephile.Data;

namespace Cinephile.Admin
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Message.Text = "";

                string searched = Request.Params["search"];
                SearchBox.Text = searched != null ? searched : string.Empty;
                
                using(CinephileDbEntities db = new CinephileDbEntities())
                {
                    var selected = db.AspNetUsers.Where(u => u.UserName == this.User.Identity.Name).FirstOrDefault();

                    if(selected != null)
                    {
                        UserId.Text = selected.Id;
                        UserName.Text = selected.UserName;
                        UserEmail.Text = selected.UserName;
                        UserRole.Text = selected.AspNetRoles.FirstOrDefault() != null
                            ? selected.AspNetRoles.FirstOrDefault().Name
                            : "BURN THE WITCH!!1!11!";
                    }
                }
            }
        }

        public IQueryable<AspNetRole> RolesDropDownList_GetData()
        {
            CinephileDbEntities db = new CinephileDbEntities();

            return db.AspNetRoles.OrderBy(m => m.Name.ToLower());
        }

        protected void NewRoleButton_Click(object sender, EventArgs e)
        {
            CinephileDbEntities db = new CinephileDbEntities();

            var user = db.AspNetUsers.FirstOrDefault(u => u.Id == UserId.Text);
            user.AspNetRoles.Clear();
            db.SaveChanges();

            var newRole = db.AspNetRoles.FirstOrDefault(r => r.Name == RolesDropDownList.SelectedItem.Text);

            if(newRole == null)
            {
                newRole = new AspNetRole()
                {
                    Name = RolesDropDownList.SelectedItem.Text
                };

                db.AspNetRoles.Add(newRole);
                db.SaveChanges();
            }

            user.AspNetRoles.Add(newRole);
            db.SaveChanges();

            UserRole.Text = newRole.Name;
        }

        protected void ShowAll_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/Users");
        }

        protected void SearchSubmitBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/Users.aspx?search=" + SearchBox.Text);
        }

        public IQueryable<AspNetUser> UsersListView_GetData()
        {
            CinephileDbEntities db = new CinephileDbEntities();

            string searched = string.IsNullOrEmpty(Request.Params["search"])
                ? string.Empty
                : Request.Params["search"].ToLower();

            SearchBox.Text = searched;

            return db.AspNetUsers
                .OrderBy(m => m.UserName.ToLower())
                .Where(m => m.UserName.ToLower().Contains(searched) || m.Email.ToLower().Contains(searched));
        }

        protected void UsersListView_SelectedIndexChanged(object sender, ListViewSelectEventArgs e)
        {
            UsersListView.SelectedIndex = e.NewSelectedIndex;
        }

        protected void UsersListView_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            UsersListView.SelectedIndex = -1;
        }

        protected void UsersListView_SelectedIndexChanged(object sender, EventArgs e)
        {
            var selectedId = UsersListView.SelectedDataKey.Value.ToString();

            using(CinephileDbEntities db = new CinephileDbEntities())
            {
                var selected = db.AspNetUsers.Where(u => u.Id == selectedId).FirstOrDefault();

                if(selected != null)
                {
                    UserId.Text = selected.Id;
                    UserName.Text = selected.UserName;
                    UserEmail.Text = selected.UserName;
                    UserRole.Text = selected.AspNetRoles.FirstOrDefault() != null
                        ? selected.AspNetRoles.FirstOrDefault().Name
                        : "HACKER";
                }
            }
        }

        protected void SortButton_Click(object sender, EventArgs e)
        {
            String expression = SortList.SelectedValue;

            SortDirection direction = SortDirectionList.SelectedValue == "DESC"
                ? SortDirection.Descending
                : SortDirection.Ascending;

            UsersListView.Sort(expression, direction);
        }
    }
}