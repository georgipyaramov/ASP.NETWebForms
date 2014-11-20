using Cinephile.Data;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace Cinephile
{
    public partial class MovieDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CinephileDbEntities db = new CinephileDbEntities();
            var movieId = Request.Params["Id"];
            // Warning: Possible n+1 queries problem
            var movie = db.Movies
                .Where(m => m.Id.ToString() == movieId)
                .Select(m => new
                {
                    PosterPath = m.PosterPath,
                    Title = m.Title,
                    Storyline = m.Storyline,
                    ReleaseDate = m.ReleseDate,
                    TimeLength = m.RunningTime,
                    Language = m.Language,
                    Genres = m.Genres,
                    Directors = m.Directors,
                    Actors = m.Actors,
                    Reviews = m.Reviews,
                    Ratings = m.Ratings,
                    Countries = m.Countries
                })
                .FirstOrDefault();

            //var movie = db.Movies.Find(movieId);

            this.PageTitle.Text = movie.Title;
            this.MovieImage.ImageUrl = movie.PosterPath;
            this.StoryLine.Text = movie.Storyline;
            this.ReleaseDate.Text = movie.ReleaseDate.ToShortDateString();
            this.Language.Text = movie.Language.Name;
            this.Length.Text = movie.TimeLength.ToString() + " min";
            double rating = 0;

            foreach (var rate in movie.Ratings)
            {
                rating += rate.RatingValue;
            }

            rating = rating / movie.Ratings.Count;
            if (double.IsNaN(rating))
            {
                rating = 0;
            }
            this.AddRating(rating);

            if (movie.Countries.Count > 1)
            {
                this.Countries.Text = "Countries";
            }
            else
            {
                this.Countries.Text = "Country";
            }
            this.RepeaterCountries.DataSource = movie.Countries;

            if (movie.Genres.Count > 1)
            {
                this.Genres.Text = "Genres";
            }
            else
            {
                this.Genres.Text = "Genre";
            }
            this.RepeaterGenres.DataSource = movie.Genres;
            this.RepeaterDirectors.DataSource = movie.Directors;
            var dt = this.ConvertToDataTable(movie.Actors.ToList());
            this.GridViewActors.DataSource = dt;

            Page.DataBind();
        }

        private void AddRating(double rating)
        {
            var fullStars = Math.Floor(rating);
            var emptyStars = Math.Floor(10 - rating);

            for (int i = 0; i < fullStars; i++)
            {
                var rateStar = new Image();
                rateStar.ImageUrl = "~/Images/star.png";
                this.Rating.Controls.Add(rateStar);
            }

            if (emptyStars + fullStars != 10)
            {
                var halfStar = new Image();
                halfStar.ImageUrl = "~/Images/star-half.png";
                this.Rating.Controls.Add(halfStar);
            }

            for (int i = 0; i < emptyStars; i++)
            {
                var rateStar = new Image();
                rateStar.ImageUrl = "~/Images/star-empty.png";
                this.Rating.Controls.Add(rateStar);
            }
        }

        private string GetSortDirection(string column)
        {
            string sortDirection = "ASC";

            string sortExpression = ViewState["SortExpression"] as string;

            if (sortExpression != null)
            {
                if (sortExpression == column)
                {
                    string lastDirection = ViewState["SortDirection"] as string;
                    if ((lastDirection != null) && (lastDirection == "ASC"))
                    {
                        sortDirection = "DESC";
                    }
                }
            }

            ViewState["SortDirection"] = sortDirection;
            ViewState["SortExpression"] = column;

            return sortDirection;
        }


        protected void GridViewActors_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dataTable = this.GridViewActors.DataSource as DataTable;

            if (dataTable != null)
            {
                DataView dataView = new DataView(dataTable);
                dataView.Sort = e.SortExpression + " " + GetSortDirection(e.SortExpression);

                this.GridViewActors.DataSource = dataView;
                this.GridViewActors.DataBind();
            }
        }

        protected bool HasReviewed()
        {
            CinephileDbEntities db = new CinephileDbEntities();            
            var movieId = Request.Params["Id"];
            var userId = Page.User.Identity.GetUserId();

            var result = db.Reviews.Any(r => r.MovieId.ToString() == movieId && r.UserId == userId);
            return result;
        }

        protected string GetUsername(Review item)
        {
            CinephileDbEntities db = new CinephileDbEntities();
            return db.AspNetUsers.FirstOrDefault(u => u.Id == item.UserId).UserName;
        }

        protected void GridViewActors_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.GridViewActors.PageIndex = e.NewPageIndex;
            this.GridViewActors.DataBind();
        }

        private DataTable ConvertToDataTable<T>(IList<T> data)
        {
            PropertyDescriptorCollection properties =
               TypeDescriptor.GetProperties(typeof(T));
            DataTable table = new DataTable();
            foreach (PropertyDescriptor prop in properties)
                table.Columns.Add(prop.Name, Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType);
            foreach (T item in data)
            {
                DataRow row = table.NewRow();
                foreach (PropertyDescriptor prop in properties)
                    row[prop.Name] = prop.GetValue(item) ?? DBNull.Value;
                table.Rows.Add(row);
            }
            return table;
        }
    }
}