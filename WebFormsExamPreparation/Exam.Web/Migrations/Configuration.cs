namespace Exam.Web.Migrations
{
    using Exam.Web.Models;
    using System;
    using System.Collections.Generic;
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
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method 
            //  to avoid creating duplicate seed data. E.g.
            //
            //    context.People.AddOrUpdate(
            //      p => p.FullName,
            //      new Person { FullName = "Andrew Peters" },
            //      new Person { FullName = "Brice Lambson" },
            //      new Person { FullName = "Rowan Miller" }
            //    );
            //

            if (!context.Categories.Any())
            {
                var booksToGo = new List<Book>();

                var firstCategory = new Category() { Name = "First category" };
                var secondCategory = new Category() { Name = "Second category" };
                var thirdCategory = new Category() { Name = "Third category" };

                for (int i = 1; i <= 12; i++)
                {
                    var book = new Book() { Title = ("Book" + i), Author = ("Author" + i) };
                    booksToGo.Add(book);
                }

                for (int i = 0; i < booksToGo.Count; i++)
                {
                    if (i < 4)
                    {
                        firstCategory.Books.Add(booksToGo[i]);
                    }
                    else if (i < 7)
                    {
                        secondCategory.Books.Add(booksToGo[i]);
                    }
                    else
                    {
                        thirdCategory.Books.Add(booksToGo[i]);
                    }
                }

                context.Categories.Add(firstCategory);
                context.Categories.Add(secondCategory);
                context.Categories.Add(thirdCategory);

                context.SaveChanges();
            }
        }
    }
}
