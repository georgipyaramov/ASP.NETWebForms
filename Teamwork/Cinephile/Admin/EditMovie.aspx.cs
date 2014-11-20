namespace Cinephile.Admin
{
    using Cinephile.Data;
    using System;
    using System.Collections.Generic;
    using System.IO;
    using System.Linq;

    public partial class EditMovie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string currMovieId = Request.Params["id"];
            CinephileDbEntities db = new CinephileDbEntities();
            Movie currMovie = db.Movies.FirstOrDefault(m => m.Id.ToString() == currMovieId);

            if (currMovie == null)
            {
                this.ValidationSummaryMessages.Text = "Movie with id:" + currMovieId + " was not found!";
                return;
            }

            this.LiteralMovieTitle.Text = currMovie.Title;
            this.LiteralMovieStoryline.Text = currMovie.Storyline;
            this.LiteralMovieReleaseDate.Text = currMovie.ReleseDate.ToShortDateString();
            this.LiteralMovieRunningTime.Text = currMovie.RunningTime.ToString();
            this.LiteralMovieLanguages.Text = currMovie.Language.Name;
            List<string> currMovies = currMovie.Genres.Select(x => x.Name).ToList();
            this.LiteralMovieGenres.Text = string.Join(", ", currMovies);
            List<string> currCountries = currMovie.Countries.Select(x => x.Name).ToList();
            this.LiteralMovieCountries.Text = string.Join(", ", currCountries);
            this.ImageMoviePoster.ImageUrl = currMovie.PosterPath;
        }

        protected void ButtonEditMovie_Click(object sender, EventArgs e)
        {
            string currMovieId = Request.Params["id"];
            CinephileDbEntities db = new CinephileDbEntities();
            Movie currMovie = db.Movies.FirstOrDefault(m => m.Id.ToString() == currMovieId);

            if (currMovie == null)
            {
                this.ValidationSummaryMessages.Text = "Movie with id:" + currMovieId + " was not found!";
                return;
            }

            string title = this.TextBoxNewMovieTitle.Text;
            if (!string.IsNullOrWhiteSpace(title))
            {
                currMovie.Title = title;
            }

            string storyline = this.TextBoxNewMovieStoryline.Text;
            if (!string.IsNullOrWhiteSpace(storyline))
            {
                currMovie.Storyline = storyline;
            }

            string releaseDateString = this.TextBoxNewMovieReleaseDate.Text;
            DateTime releaseDate = new DateTime();
            if (DateTime.TryParse(releaseDateString, out releaseDate))
            {
                currMovie.ReleseDate = releaseDate;
            }

            string runningTimeString = this.TextBoxNewMovieRunningTime.Text;
            int runningTime;
            if (int.TryParse(runningTimeString, out runningTime))
            {
                currMovie.RunningTime = runningTime;
            }

            int languageId;
            if (int.TryParse(this.DropDownListNewMovieLanguages.SelectedValue, out languageId))
            {
                var language = db.Languages.FirstOrDefault(lang => lang.Id == languageId);
                if (language != null)
                {
                    currMovie.LanguageId = languageId;
                }
            }

            int[] selectedCountriesIndeces = this.ListBoxNewMovieCountries.GetSelectedIndices();
            if (selectedCountriesIndeces.Length > 0)
            {
                var allCountries = this.ListBoxNewMovieCountries.Items;
                string currSelectedCountry = string.Empty;
                Country currCountry;
                currMovie.Countries.Clear();
                foreach (int country in selectedCountriesIndeces)
                {
                    currSelectedCountry = allCountries[country].Value;
                    currCountry = db.Countries.FirstOrDefault(c => c.Id.ToString() == currSelectedCountry);

                    if (currCountry == null)
                    {
                        this.ValidationSummaryMessages.Text = "Invalid Country entered!";
                        return;
                    }

                    currMovie.Countries.Add(currCountry);
                }
            }

            int[] selectedGenresIndeces = this.ListBoxNewMovieGenres.GetSelectedIndices();
            if (selectedGenresIndeces.Length > 0)
            {
                var allGenres = this.ListBoxNewMovieGenres.Items;
                string currSelectedGener = string.Empty;
                Genre currGenre;
                currMovie.Genres.Clear();
                foreach (int gener in selectedGenresIndeces)
                {
                    currSelectedGener = allGenres[gener].Value;
                    currGenre = db.Genres.FirstOrDefault(g => g.Id.ToString() == currSelectedGener);

                    if (currGenre == null)
                    {
                        this.ValidationSummaryMessages.Text = "Invalid Genre entered!";
                        return;
                    }

                    currMovie.Genres.Add(currGenre);
                }
            }

            if (FileUploadNewMoviePoster.HasFile)
            {
                try
                {
                    string contentType = FileUploadNewMoviePoster.PostedFile.ContentType;
                    if (contentType == "image/jpeg" || contentType == "image/jpg" ||
                        contentType == "image/png" || contentType == "image/gif")
                    {
                        string filename = Path.GetFileName(FileUploadNewMoviePoster.FileName);
                        FileUploadNewMoviePoster.SaveAs(Server.MapPath("~/Images/") + filename);
                    }
                    else
                    {
                        this.ValidationSummaryMessages.Text = "Upload status: Only Image files are accepted!";
                        return;
                    }
                }
                catch (Exception ex)
                {
                    this.ValidationSummaryMessages.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                    return;
                }

                currMovie.PosterPath = "~/Images/" + this.FileUploadNewMoviePoster.FileName;
            }

            db.Entry<Movie>(currMovie).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();

            Response.Redirect("~/MovieDetails.aspx?id=" + currMovie.Id);
        }
    }
}