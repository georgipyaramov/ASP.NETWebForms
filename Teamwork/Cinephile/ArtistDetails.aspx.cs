using Cinephile.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cinephile
{
    public partial class ArtistDetails : System.Web.UI.Page
    {
        private Artist artist;
        private CinephileDbEntities db = new CinephileDbEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            string artistId;
            this.artist = db.Artists.FirstOrDefault();

            if (Request.Params["Id"] != null)
            {
                artistId = Request.Params["Id"];

                this.artist = db.Artists
                           .Where(a => a.Id == new Guid(artistId))
                           .FirstOrDefault();

            }

            this.ArtistName.Text = this.artist.FullName;
            this.HeaderArtistName.Text = this.artist.FullName;
            this.ArtistImage.ImageUrl = this.artist.PicturePath;
            this.ArtistBirthDate.Text = string.Format("{0:dd MMMMMMMMM yyyy}", this.artist.BirthDate.Value);
            this.ArtistCountry.Text = this.artist.Country.Name;

            if (!IsPostBack)
            {
                this.GridViewMovies.DataSource = this.artist.MoviesPlayedIn.OrderBy(m => m.Title).ToList();
                this.GridViewMoviesDirector.DataSource = this.artist.MoviesDirected.OrderBy(m => m.Title).ToList();
            }
            else
            {
                this.GridViewMovies.DataSource = this.artist.MoviesPlayedIn.ToList();
                this.GridViewMoviesDirector.DataSource = this.artist.MoviesDirected.ToList();
            }


            this.DataBind();
        }

        protected void GridViewMovies_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            var moviesGridView = sender as GridView;
            var dataSource = moviesGridView.DataSource as IList<Movie>;
            if (this.Session["sortDir"] == null)
            {
                moviesGridView.DataSource = dataSource.OrderBy(m => m.Title).ToList();
            }
            else if (this.Session["sortDir"] == "asc")
            {
                moviesGridView.DataSource = dataSource.OrderByDescending(m => m.Title).ToList();
            }
            else
            {
                moviesGridView.DataSource = dataSource.OrderBy(m => m.Title).ToList();
            }
            
            moviesGridView.PageIndex = e.NewPageIndex;
            
            this.DataBind();
        }

        protected void GridViewMovies_Sorting(object sender, GridViewSortEventArgs e)
        {
            var moviesGridView = sender as GridView;
            var dataSource = moviesGridView.DataSource as IList<Movie>;
            var sortDirection = this.Session["sortDir"];

            if (sortDirection == null || sortDirection == "asc")
            {
                if (e.SortExpression == "Title")
                {
                    moviesGridView.DataSource = dataSource.OrderBy(m => m.Title).ToList();
                }
                else if (e.SortExpression == "ReleseDate")
                {
                    moviesGridView.DataSource = dataSource.OrderBy(m => m.ReleseDate).ToList();

                }

                this.DataBind();

                this.Session["sortDir"] = "desc";
            }
            else if (sortDirection == "desc")
            {
                if (e.SortExpression == "Title")
                {
                    moviesGridView.DataSource = dataSource.OrderByDescending(m => m.Title).ToList();
                }
                else if (e.SortExpression == "ReleseDate")
                {
                    moviesGridView.DataSource = dataSource.OrderByDescending(m => m.ReleseDate).ToList();
                }

                this.DataBind();

                this.Session["sortDir"] = "asc";
            }
        }
    }
}