namespace Cinephile.DataSeeder
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;

    using Cinephile.Data;

    public class DataSeeder
    {
        static Random rand = new Random();

        public static void Main()
        {
            CinephileDbEntities dbContext = new CinephileDbEntities();

            if(dbContext.AspNetRoles.Count() == 0)
            {
                SeedRoles(dbContext);
            }

            if(dbContext.Countries.Count() == 0)
            {
                SeedCoutries(dbContext);
            }

            if(dbContext.Languages.Count() == 0)
            {
                SeedLanguages(dbContext);
            }

            if(dbContext.Genres.Count() == 0)
            {
                SeedGenres(dbContext);
            }

            if(dbContext.Artists.Count() == 0)
            {
                SeedArtists(dbContext);
            }

            if(dbContext.Movies.Count() == 0)
            {
                SeedMovies(dbContext);
            }
        }

        private static void SeedRoles(CinephileDbEntities dbContext)
        {
            dbContext.AspNetRoles.AddRange(new AspNetRole[] {
                new AspNetRole() { Name = "user" },
                new AspNetRole() { Name = "moderator" },
                new AspNetRole() { Name = "admin" },
                new AspNetRole() { Name = "banned" }
            });

            dbContext.SaveChanges();
        }

        private static void SeedMovies(CinephileDbEntities dbContext)
        {
            var countries = dbContext.Countries.ToList();
            var languagesIds = dbContext.Languages.Select(l => l.Id).ToList();
            var artists = dbContext.Artists.ToList();
            var genres = dbContext.Genres.ToList();

            for(int i = 0 ; i < 30 ; i++)
            {
                dbContext.Movies.Add(new Movie()
                {
                    Title = GetRandomMovieTitle(),
                    Storyline = GetRandomStoryline(),
                    Countries = AssignRandomCountries(countries),
                    Actors = AssignRandomActors(artists),
                    Directors = AssignRandomDirectors(artists),
                    Genres = AssignRandomGenres(genres),
                    LanguageId = languagesIds[rand.Next(0, languagesIds.Count)],
                    ReleseDate = GetRandomDate(1950, 1990),
                    RunningTime = rand.Next(60, 200),
                    PosterPath = "~/Images/default-poster.jpg"
                });

                dbContext.SaveChanges();
            }

            Console.WriteLine("Movies seeded");
        }

        private static ICollection<Genre> AssignRandomGenres(List<Genre> genres)
        {
            var genresCount = rand.Next(1, 4);

            var genresList = new HashSet<Genre>();

            while(genresList.Count < genresCount)
            {
                genresList.Add(genres[rand.Next(0, genres.Count)]);
            }

            return genresList;
        }

        private static ICollection<Artist> AssignRandomActors(List<Artist> artists)
        {
            var actorsCount = rand.Next(3, 11);

            var actorsList = new HashSet<Artist>();

            while(actorsList.Count < actorsCount)
            {
                actorsList.Add(artists[rand.Next(0, artists.Count)]);
            }

            return actorsList;
        }

        private static ICollection<Artist> AssignRandomDirectors(List<Artist> artists)
        {
            var directorsCount = rand.Next(1, 4);

            var directorsList = new HashSet<Artist>();

            while(directorsList.Count < directorsCount)
            {
                directorsList.Add(artists[rand.Next(0, artists.Count)]);
            }

            return directorsList;
        }

        private static ICollection<Country> AssignRandomCountries(List<Country> countries)
        {
            var countriesCount = rand.Next(1, 4);

            var countriesList = new HashSet<Country>();

            while(countriesList.Count < countriesCount)
            {
                countriesList.Add(countries[rand.Next(0, countries.Count)]);
            }

            return countriesList;
        }

        private static string GetRandomStoryline()
        {
            var charactersPermitted = "qwertyuiop asdfghjkl zxcvbnm.,- ";
            var storyline = new StringBuilder();
            var storylineLength = rand.Next(50, 1000);

            for(int i = 0 ; i < storylineLength ; i++)
            {
                storyline.Append(charactersPermitted[rand.Next(0, charactersPermitted.Length)]);
            }

            return storyline.ToString().Substring(0, 1).ToUpper() + storyline.ToString().Substring(1);
        }

        private static string GetRandomMovieTitle()
        {
            var charactersPermitted = "qwertyuiopasdfghjklzxcvbnm ";
            var title = new StringBuilder();
            var titleLength = rand.Next(3, 40);

            for(int i = 0 ; i < titleLength ; i++)
            {
                title.Append(charactersPermitted[rand.Next(0, charactersPermitted.Length)]);
            }

            return title.ToString().Substring(0, 1).ToUpper() + title.ToString().Substring(1);
        }

        private static void SeedArtists(CinephileDbEntities dbContext)
        {
            var coutriesIds = dbContext.Countries.Select(c => c.Id).ToList();
            var rand = new Random();


            for(int i = 0 ; i < 30 ; i++)
            {
                dbContext.Artists.Add(new Artist()
                {
                    FullName = GetRandomArtistName(),
                    BirthDate = GetRandomDate(1950, 1990),
                    CounryId = coutriesIds[rand.Next(0, coutriesIds.Count)],
                    PicturePath = "~/Images/missing-image-artist.png"
                });

                dbContext.SaveChanges();
            }

            dbContext.SaveChanges();
            Console.WriteLine("Artists seeded");
        }

        private static string GetRandomArtistName()
        {
            var charactersPermitted = "qwertyuiopasdfghjklzxcvbnm-";

            var firstName = GetRandomName(charactersPermitted);
            var lastName = GetRandomName(charactersPermitted);

            return firstName + " " + lastName;
        }

        private static string GetRandomName(string charactersPermitted)
        {
            var name = new StringBuilder();
            var nameLength = rand.Next(2, 16);

            for(int i = 0 ; i < nameLength ; i++)
            {
                name.Append(charactersPermitted[rand.Next(0, charactersPermitted.Length)]);
            }

            return name.ToString().Substring(0, 1).ToUpper() + name.ToString().Substring(1);
        }

        private static DateTime GetRandomDate(int startYear, int endYear)
        {
            return new DateTime(rand.Next(startYear, endYear), rand.Next(1, 12), rand.Next(1, 29));
        }

        private static void SeedGenres(CinephileDbEntities dbContext)
        {
            dbContext.Genres.AddRange(new List<Genre>()
            {
                new Genre() { Name = "Action" },
                new Genre() { Name = "Adult" },
                new Genre() { Name = "Adventure" },
                new Genre() { Name = "Avant-garde/Experimental" },
                new Genre() { Name = "Animation" },
                new Genre() { Name = "Comedy" },
                new Genre() { Name = "Crime" },
                new Genre() { Name = "Culture/Society" },
                new Genre() { Name = "Dance" },
                new Genre() { Name = "Drama" },
                new Genre() { Name = "Education" },
                new Genre() { Name = "Epic" },
                new Genre() { Name = "Fantasy" },
                new Genre() { Name = "Health/Fitness" },
                new Genre() { Name = "Historical" },
                new Genre() { Name = "Horror" },
                new Genre() { Name = "Musical" },
                new Genre() { Name = "Mystery" },
                new Genre() { Name = "Nature" },
                new Genre() { Name = "Romance" },
                new Genre() { Name = "Science Fiction" },
                new Genre() { Name = "Theater" },
                new Genre() { Name = "Biography" },
                new Genre() { Name = "Thriller" },
                new Genre() { Name = "Travel" },
                new Genre() { Name = "War" },
                new Genre() { Name = "Western" }
            });

            dbContext.SaveChanges();
            Console.WriteLine("Genres seeded");
        }

        private static void SeedLanguages(CinephileDbEntities dbContext)
        {
            dbContext.Languages.AddRange(new List<Language>()
            {    
                new Language() { Name = "Mandarin" },
                new Language() { Name = "Spanish" },
                new Language() { Name = "English" },
                new Language() { Name = "Hindi" },
                new Language() { Name = "Arabic" },
                new Language() { Name = "Portuguese" },
                new Language() { Name = "Bengali" },
                new Language() { Name = "Russian" },
                new Language() { Name = "Japanese" },
                new Language() { Name = "Punjabi" },
                new Language() { Name = "German" },
                new Language() { Name = "Javanese" },
                new Language() { Name = "Wu" },
                new Language() { Name = "Malay/Indonesian" },
                new Language() { Name = "Telugu" },
                new Language() { Name = "Vietnamese" },
                new Language() { Name = "Korean" },
                new Language() { Name = "French" },
                new Language() { Name = "Marathi" },
                new Language() { Name = "Tamil" },
                new Language() { Name = "Urdu" },
                new Language() { Name = "Turkish" },
                new Language() { Name = "Italian" },
                new Language() { Name = "Cantonese" },
                new Language() { Name = "Persian" },
                new Language() { Name = "Thai" },
                new Language() { Name = "Gujarati" },
                new Language() { Name = "Jin" },
                new Language() { Name = "Min Nan" },
                new Language() { Name = "Polish" },
                new Language() { Name = "Pashto" },
                new Language() { Name = "Kannada" },
                new Language() { Name = "Xiang" },
                new Language() { Name = "Malayalam" },
                new Language() { Name = "Sundanese" },
                new Language() { Name = "Hausa" },
                new Language() { Name = "Oriya" },
                new Language() { Name = "Burmese" },
                new Language() { Name = "Hakka" },
                new Language() { Name = "Ukrainian" },
                new Language() { Name = "Bhojpuri" },
                new Language() { Name = "Tagalog" },
                new Language() { Name = "Yoruba" },
                new Language() { Name = "Maithili" },
                new Language() { Name = "Swahili" },
                new Language() { Name = "Uzbek" },
                new Language() { Name = "Sindhi" },
                new Language() { Name = "Amharic" },
                new Language() { Name = "Fula" },
                new Language() { Name = "Romanian" },
                new Language() { Name = "Oromo" },
                new Language() { Name = "Igbo" },
                new Language() { Name = "Azerbaijani" },
                new Language() { Name = "Awadhi" },
                new Language() { Name = "Gan" },
                new Language() { Name = "Cebuano" },
                new Language() { Name = "Dutch" },
                new Language() { Name = "Kurdish" },
                new Language() { Name = "Lao" },
                new Language() { Name = "Serbo-Croatian" },
                new Language() { Name = "Malagasy" },
                new Language() { Name = "Saraiki" },
                new Language() { Name = "Nepali" },
                new Language() { Name = "Sinhalese" },
                new Language() { Name = "Chittagonian" },
                new Language() { Name = "Zhuang" },
                new Language() { Name = "Khmer" },
                new Language() { Name = "Assamese" },
                new Language() { Name = "Madurese" },
                new Language() { Name = "Somali" },
                new Language() { Name = "Marwari" },
                new Language() { Name = "Magahi" },
                new Language() { Name = "Haryanvi" },
                new Language() { Name = "Hungarian" },
                new Language() { Name = "Chhattisgarhi" },
                new Language() { Name = "Greek" },
                new Language() { Name = "Chewa" },
                new Language() { Name = "Deccan" },
                new Language() { Name = "Akan" },
                new Language() { Name = "Kazakh" },
                new Language() { Name = "Min Bei" },
                new Language() { Name = "Sylheti" },
                new Language() { Name = "Zulu" },
                new Language() { Name = "Czech" },
                new Language() { Name = "Kinyarwanda" },
                new Language() { Name = "Dhundhari" },
                new Language() { Name = "Haitian Creole" },
                new Language() { Name = "Min Dong" },
                new Language() { Name = "Ilokano" },
                new Language() { Name = "Quechua" },
                new Language() { Name = "Kirundi" },
                new Language() { Name = "Swedish" },
                new Language() { Name = "Hmong" },
                new Language() { Name = "Shona" },
                new Language() { Name = "Uyghur" },
                new Language() { Name = "Hiligaynon" },
                new Language() { Name = "Mossi" },
                new Language() { Name = "Xhosa" },
                new Language() { Name = "Belarusian" },
                new Language() { Name = "Balochi" },
                new Language() { Name = "Bulgarian" }
            });

            dbContext.SaveChanges();
            Console.WriteLine("Languages seeded.");
        }

        private static void SeedCoutries(CinephileDbEntities dbContext)
        {

            dbContext.Countries.AddRange(new List<Country>()
            {
                new Country() { Name = "Afghanistan" },
                new Country() { Name = "Albania" },
                new Country() { Name = "Algeria" },
                new Country() { Name = "American Samoa" },
                new Country() { Name = "Andorra" },
                new Country() { Name = "Angola" },
                new Country() { Name = "Anguilla" },
                new Country() { Name = "Antarctica" },
                new Country() { Name = "Antigua and Barbuda" },
                new Country() { Name = "Argentina" },
                new Country() { Name = "Armenia" },
                new Country() { Name = "Aruba" },
                new Country() { Name = "Australia" },
                new Country() { Name = "Austria" },
                new Country() { Name = "Azerbaijan" },
                new Country() { Name = "Bahamas" },
                new Country() { Name = "Bahrain" },
                new Country() { Name = "Bangladesh" },
                new Country() { Name = "Barbados" },
                new Country() { Name = "Belarus" },
                new Country() { Name = "Belgium" },
                new Country() { Name = "Belize" },
                new Country() { Name = "Benin" },
                new Country() { Name = "Bermuda" },
                new Country() { Name = "Bhutan" },
                new Country() { Name = "Bolivia" },
                new Country() { Name = "Bosnia and Herzegovina" },
                new Country() { Name = "Botswana" },
                new Country() { Name = "Brazil" },
                new Country() { Name = "Brunei Darussalam" },
                new Country() { Name = "Bulgaria" },
                new Country() { Name = "Burkina Faso" },
                new Country() { Name = "Burundi" },
                new Country() { Name = "Cambodia" },
                new Country() { Name = "Cameroon" },
                new Country() { Name = "Canada" },
                new Country() { Name = "Cape Verde" },
                new Country() { Name = "Cayman Islands" },
                new Country() { Name = "Central African Republic" },
                new Country() { Name = "Chad" },
                new Country() { Name = "Chile" },
                new Country() { Name = "China" },
                new Country() { Name = "Christmas Island" },
                new Country() { Name = "Cocos (Keeling) Islands" },
                new Country() { Name = "Colombia" },
                new Country() { Name = "Comoros" },
                new Country() { Name = "Democratic Republic of the Congo" },
                new Country() { Name = "Republic of Congo" },
                new Country() { Name = "Cook Islands" },
                new Country() { Name = "Costa Rica" },
                new Country() { Name = "Ivory Coast" },
                new Country() { Name = "Croatia" },
                new Country() { Name = "Cuba" },
                new Country() { Name = "Cyprus" },
                new Country() { Name = "Czech Republic" },
                new Country() { Name = "Denmark" },
                new Country() { Name = "Djibouti" },
                new Country() { Name = "Dominica" },
                new Country() { Name = "Dominican Republic" },
                new Country() { Name = "East Timor" },
                new Country() { Name = "Ecuador" },
                new Country() { Name = "Egypt" },
                new Country() { Name = "El Salvador" },
                new Country() { Name = "Equatorial Guinea" },
                new Country() { Name = "Eritrea" },
                new Country() { Name = "Estonia" },
                new Country() { Name = "Ethiopia" },
                new Country() { Name = "Falkland Islands" },
                new Country() { Name = "Faroe Islands" },
                new Country() { Name = "Fiji" },
                new Country() { Name = "Finland" },
                new Country() { Name = "France" },
                new Country() { Name = "French Guiana" },
                new Country() { Name = "French Polynesia" },
                new Country() { Name = "French Southern Territories" },
                new Country() { Name = "Gabon" },
                new Country() { Name = "Gambia" },
                new Country() { Name = "Georgia" },
                new Country() { Name = "Germany" },
                new Country() { Name = "Ghana" },
                new Country() { Name = "Gibraltar" },
                new Country() { Name = "Greece" },
                new Country() { Name = "Greenland" },
                new Country() { Name = "Grenada" },
                new Country() { Name = "Guadeloupe" },
                new Country() { Name = "Guam" },
                new Country() { Name = "Guatemala" },
                new Country() { Name = "Guinea" },
                new Country() { Name = "Guinea-Bissau" },
                new Country() { Name = "Guyana" },
                new Country() { Name = "Haiti" },
                new Country() { Name = "Honduras" },
                new Country() { Name = "Hong Kong" },
                new Country() { Name = "Hungary" },
                new Country() { Name = "Iceland" },
                new Country() { Name = "India" },
                new Country() { Name = "Indonesia" },
                new Country() { Name = "Iran" },
                new Country() { Name = "Iraq" },
                new Country() { Name = "Ireland" },
                new Country() { Name = "Israel" },
                new Country() { Name = "Italy" },
                new Country() { Name = "Jamaica" },
                new Country() { Name = "Japan" },
                new Country() { Name = "Jordan" },
                new Country() { Name = "Kazakhstan" },
                new Country() { Name = "Kenya" },
                new Country() { Name = "Kiribati" },
                new Country() { Name = "North Korea" },
                new Country() { Name = "South Korea" },
                new Country() { Name = "Kosovo" },
                new Country() { Name = "Kuwait" },
                new Country() { Name = "Kyrgyzstan" },
                new Country() { Name = "Lao" },
                new Country() { Name = "Latvia" },
                new Country() { Name = "Lebanon" },
                new Country() { Name = "Lesotho" },
                new Country() { Name = "Liberia" },
                new Country() { Name = "Libya" },
                new Country() { Name = "Liechtenstein" },
                new Country() { Name = "Lithuania" },
                new Country() { Name = "Luxembourg" },
                new Country() { Name = "Macau" },
                new Country() { Name = "FYR Macedonia" },
                new Country() { Name = "Madagascar" },
                new Country() { Name = "Malawi" },
                new Country() { Name = "Malaysia" },
                new Country() { Name = "Maldives" },
                new Country() { Name = "Mali" },
                new Country() { Name = "Malta" },
                new Country() { Name = "Marshall Islands" },
                new Country() { Name = "Martinique" },
                new Country() { Name = "Mauritania" },
                new Country() { Name = "Mauritius" },
                new Country() { Name = "Mayotte" },
                new Country() { Name = "Mexico" },
                new Country() { Name = "Micronesia" },
                new Country() { Name = "Moldova" },
                new Country() { Name = "Monaco" },
                new Country() { Name = "Mongolia" },
                new Country() { Name = "Montenegro" },
                new Country() { Name = "Montserrat" },
                new Country() { Name = "Morocco" },
                new Country() { Name = "Mozambique" },
                new Country() { Name = "Myanmar" },
                new Country() { Name = "Namibia" },
                new Country() { Name = "Nauru" },
                new Country() { Name = "Nepal" },
                new Country() { Name = "Netherlands" },
                new Country() { Name = "Netherlands Antilles" },
                new Country() { Name = "New Caledonia" },
                new Country() { Name = "New Zealand" },
                new Country() { Name = "Nicaragua" },
                new Country() { Name = "Niger" },
                new Country() { Name = "Nigeria" },
                new Country() { Name = "Niue" },
                new Country() { Name = "Northern Mariana Islands" },
                new Country() { Name = "Norway" },
                new Country() { Name = "Oman" },
                new Country() { Name = "Pakistan" },
                new Country() { Name = "Palau" },
                new Country() { Name = "Palestinian territories" },
                new Country() { Name = "Panama" },
                new Country() { Name = "Papua New Guinea" },
                new Country() { Name = "Paraguay" },
                new Country() { Name = "Peru" },
                new Country() { Name = "Philippines" },
                new Country() { Name = "Pitcairn Island" },
                new Country() { Name = "Poland" },
                new Country() { Name = "Portugal" },
                new Country() { Name = "Puerto Rico" },
                new Country() { Name = "Qatar" },
                new Country() { Name = "Reunion Island" },
                new Country() { Name = "Romania" },
                new Country() { Name = "Russian Federation" },
                new Country() { Name = "Rwanda" },
                new Country() { Name = "Saint Kitts and Nevis" },
                new Country() { Name = "Saint Lucia" },
                new Country() { Name = "Saint Vincent and the Grenadines" },
                new Country() { Name = "Samoa" },
                new Country() { Name = "San Marino" },
                new Country() { Name = "Sao Tome and Principe" },
                new Country() { Name = "Saudi Arabia" },
                new Country() { Name = "Senegal" },
                new Country() { Name = "Serbia" },
                new Country() { Name = "Seychelles" },
                new Country() { Name = "Sierra Leone" },
                new Country() { Name = "Singapore" },
                new Country() { Name = "Slovakia" },
                new Country() { Name = "Slovenia" },
                new Country() { Name = "Solomon Islands" },
                new Country() { Name = "Somalia" },
                new Country() { Name = "South Africa" },
                new Country() { Name = "South Sudan" },
                new Country() { Name = "Spain" },
                new Country() { Name = "Sri Lanka" },
                new Country() { Name = "Sudan" },
                new Country() { Name = "Suriname" },
                new Country() { Name = "Swaziland" },
                new Country() { Name = "Sweden" },
                new Country() { Name = "Switzerland" },
                new Country() { Name = "Syria" },
                new Country() { Name = "Taiwan" },
                new Country() { Name = "Tajikistan" },
                new Country() { Name = "Tanzania" },
                new Country() { Name = "Thailand" },
                new Country() { Name = "Tibet" },
                new Country() { Name = "Timor-Leste" },
                new Country() { Name = "Togo" },
                new Country() { Name = "Tokelau" },
                new Country() { Name = "Tonga" },
                new Country() { Name = "Trinidad and Tobago" },
                new Country() { Name = "Tunisia" },
                new Country() { Name = "Turkey" },
                new Country() { Name = "Turkmenistan" },
                new Country() { Name = "Turks and Caicos Islands" },
                new Country() { Name = "Tuvalu" },
                new Country() { Name = "Uganda" },
                new Country() { Name = "Ukraine" },
                new Country() { Name = "United Arab Emirates" },
                new Country() { Name = "United Kingdom" },
                new Country() { Name = "United States" },
                new Country() { Name = "Uruguay" },
                new Country() { Name = "Uzbekistan" },
                new Country() { Name = "Vanuatu" },
                new Country() { Name = "Venezuela" },
                new Country() { Name = "Vietnam" },
                new Country() { Name = "Vatican City State" },
                new Country() { Name = "Virgin Islands (British)" },
                new Country() { Name = "Virgin Islands (U.S.)" },
                new Country() { Name = "Wallis and Futuna Islands" },
                new Country() { Name = "Western Sahara" },
                new Country() { Name = "Yemen" },
                new Country() { Name = "Zambia" },
                new Country() { Name = "Zimbabwe" }
            });

            dbContext.SaveChanges();
            Console.WriteLine("Coutries seeded.");
        }
    }
}
