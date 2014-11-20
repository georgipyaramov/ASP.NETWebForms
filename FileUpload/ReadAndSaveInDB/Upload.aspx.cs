namespace ReadAndSaveInDB
{
    using System;
    using System.IO;
    using System.Web;

    using Ionic.Zip;

    using TextFiles.Data;
    using TextFiles.Model;

    public partial class Upload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Expires = -1;
            try
            {
                HttpPostedFile zipFile = Request.Files["uploaded"];
                if (zipFile.ContentType != "application/octet-stream")
                {
                    Response.Write("This form accepts only .zip files!");
                    return;
                }

                if (!zipFile.FileName.EndsWith(".zip"))
                {
                    Response.Write("This form accepts only .zip files!");
                    return;
                }

                var context = new TextFilesDbContext();

                using (ZipFile filesInZip = ZipFile.Read(zipFile.InputStream))
                {
                    foreach (var item in filesInZip.Entries)
                    {
                        if (item.FileName.EndsWith("txt"))
                        {
                            MemoryStream stream = new MemoryStream();
                            item.Extract(stream);
                            stream.Position = 0;

                            StreamReader reader = new StreamReader(stream);
                            string fileContent = reader.ReadToEnd().ToString();
                            reader.Close();

                            TextFile textFile = new TextFile()
                            {
                                Name = Path.GetFileName(item.FileName),
                                Content = fileContent
                            };

                            context.TextFiles.Add(textFile);
                            context.SaveChanges();
                        }
                    }
                }
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }

        }
    }
}