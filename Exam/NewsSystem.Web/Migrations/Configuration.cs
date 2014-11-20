namespace NewsSystem.Web.Migrations
{
    using NewsSystem.Web.Models;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<ApplicationDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
            AutomaticMigrationDataLossAllowed = true;
        }

        protected override void Seed(ApplicationDbContext context)
        {
            if (context.Articles.Any())
            {
                return;
            }

            var seedData = new SeedData();

            context.Categories.AddOrUpdate(seedData.Categories.ToArray());
            context.Articles.AddOrUpdate(seedData.Articles.ToArray());

            context.SaveChanges();
        }
    }
}
