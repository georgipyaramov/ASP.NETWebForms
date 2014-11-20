using Cinephile.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace Cinephile
{
    public partial class ReviewMovie : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CinephileDbEntities db = new CinephileDbEntities();
            var movieId = Request.Params["Id"];
            var movie = db.Movies
                .Where(m => m.Id.ToString() == movieId)
                .FirstOrDefault();
            this.MovieName.Text = movie.Title;
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            CinephileDbEntities db = new CinephileDbEntities();
            var title = this.UserTitle.Text;
            var reviewtext = this.UserReview.Text;
            var userId = Page.User.Identity.GetUserId();
            var movieId = new Guid(Request.Params["id"]);
            Review review = new Review()
            {
                UserId = userId,
                MovieId = movieId,
                Body = reviewtext,
                Title = title,
                DatePosted = DateTime.Now
            };

            db.Reviews.Add(review);

            var rate = this.DropDownListRating.SelectedValue;
            var rating = new Rating()
            {
                MovieId = movieId,
                UserId = userId,
                RatingValue = int.Parse(rate)
            };
            db.Ratings.Add(rating);

            db.SaveChanges();
            Response.Redirect("~/MovieDetails?id=" + movieId);
        }
    }
}