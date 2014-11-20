namespace Cinephile
{
    using System;
    using System.Data.Entity;
    using System.Linq;
    using System.Web.UI;
    using System.Web.UI.WebControls;

    using Cinephile.Data;

    public partial class Movies : Page
    {
        private const int ItemsPerPage = 8;

        protected void Page_Load(object sender, EventArgs e)
        {
            Message.Text = "";

            if (!IsPostBack)
            {
                string searched = Request.Params["search"];
                SearchBox.Text = Request.Params["search"] != null ? Request.Params["search"] : string.Empty;
            }
        }

        protected void SearchSubmitBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Movies.aspx?search=" + SearchBox.Text);
        }

        protected void ShowAll_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Movies");
        }

        public IQueryable<Movie> MoviesListView_GetData()
        {
            CinephileDbEntities db = new CinephileDbEntities();
            string searched = string.IsNullOrEmpty(Request.Params["search"])
                ? string.Empty
                : Request.Params["search"].ToLower();

            SearchBox.Text = searched;

            return db.Movies
                .OrderBy(m => m.Title.ToLower())
                .Where(m => m.Title.ToLower().Contains(searched));
        }

        protected void MoviesListView_SelectedIndexChanging(object sender, ListViewSelectEventArgs e)
        {
            MoviesListView.SelectedIndex = e.NewSelectedIndex;
        }

        protected void MoviesListView_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            MoviesListView.SelectedIndex = -1;
        }

        protected void CreateButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/CreateMovie");
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            if (MoviesListView.SelectedIndex >= 0)
            {
                string id = MoviesListView.SelectedDataKey.Value.ToString();
                Response.Redirect("~/Admin/EditMovie?id=" + id);
                MoviesListView.DeleteItem(MoviesListView.SelectedIndex);

                MoviesListView.SelectedIndex = -1;
            }
            else
            {
                Message.Text = "No movie was selected.";
            }
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            if (MoviesListView.SelectedIndex >= 0)
            {
                MoviesListView.DeleteItem(MoviesListView.SelectedIndex);
                MoviesListView.SelectedIndex = -1;
            }
            else
            {
                Message.Text = "No movie was selected.";
            }
        }

        public void MoviesListView_DeleteItem(string id)
        {
            CinephileDbEntities db = new CinephileDbEntities();

            // Get everything the movie is connected to avoid error due to FK_... constraint
            var movie = db.Set<Movie>()
                .Include(m => m.Actors)
                .Include(m => m.Directors)
                .Include(m => m.Countries)
                .Include(m => m.Genres)
                .Include(m => m.Language)
                .Include(m => m.Ratings)
                .Include(m => m.Reviews)
                .FirstOrDefault(m => m.Id.ToString() == id);

            db.Set<Movie>().Remove(movie);
            db.SaveChanges();
        }

        protected void SortButton_Click(object sender, EventArgs e)
        {
            String expression = SortList.SelectedValue;

            SortDirection direction = SortDirectionList.SelectedValue == "DESC"
                ? SortDirection.Descending
                : SortDirection.Ascending;

            MoviesListView.Sort(expression, direction);
        }
    }
}
