namespace TextFiles.Data
{
    using System.Data.Entity;

    using TextFiles.Model;

    public class TextFilesDbContext:DbContext
    {
        public TextFilesDbContext()
            : base("TextFilesConnection")
        {
        }

        public IDbSet<TextFile> TextFiles { get; set; }
    }
}
