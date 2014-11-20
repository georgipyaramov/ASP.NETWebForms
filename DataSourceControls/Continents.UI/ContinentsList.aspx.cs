using Continents.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Continents.UI
{
    public partial class ContinentsList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ListViewTowns.InsertItemPosition = InsertItemPosition.None;
        }

        protected void ButtonDisplayAddCountry_Click(object sender, EventArgs e)
        {
            this.GridViewCountries.ShowFooter = !this.GridViewCountries.ShowFooter;
        }

        protected void ButtonUpdateCountry_Click(object sender, EventArgs e)
        {
            var btn = sender as LinkButton;
            var area = btn.Parent;
            int? countryId = Convert.ToInt32(btn.CommandArgument);

            if (countryId != null && countryId > 0)
            {
                ContinentsEntities context = new ContinentsEntities();
                Country country = context.Countries.Find(countryId);

                if (country != null)
                {
                    country.Name = (area.FindControl("TextBoxCountryName") as TextBox).Text;
                    country.Population = long.Parse((area.FindControl("TextBoxCountryPopulation") as TextBox).Text);
                    country.LanguageId = int.Parse((area.FindControl("DropDownListLanguage") as DropDownList).SelectedValue);
                    country.ContinentId = int.Parse((area.FindControl("DropDownListContinent") as DropDownList).SelectedValue);

                    context.SaveChanges();
                    GridViewCountries.EditIndex = -1;
                    GridViewCountries.DataBind();
                }
            }
        }


        protected void ButtonAddCountry_Click(object sender, EventArgs e)
        {
            var fileUpload = this.GridViewCountries.FooterRow.FindControl("AddFlagPicture") as FileUpload;
            string validationCheckMessage = "";
            if (fileUpload.HasFile)
            {
                validationCheckMessage = ValidateUploadFile(fileUpload.PostedFile.FileName);
            }
            if (validationCheckMessage == "")
            {
                Byte[] imgByte = null;
                if (fileUpload.HasFile)
                {
                    HttpPostedFile file = fileUpload.PostedFile;
                    imgByte = new Byte[file.ContentLength];
                    file.InputStream.Read(imgByte, 0, file.ContentLength);
                }

                var context = new ContinentsEntities();
                using (context)
                {
                    var btn = sender as LinkButton;
                    var area = btn.Parent;
                    Country country = new Country();
                    country.Name = (area.FindControl("CountryNameInsert") as TextBox).Text;
                    country.Population = long.Parse((area.FindControl("CountryPopulationInsert") as TextBox).Text);
                    country.LanguageId = int.Parse((area.FindControl("DropDownListLanguageInsert") as DropDownList).SelectedValue);
                    country.ContinentId = int.Parse((area.FindControl("DropDownListContinentInsert") as DropDownList).SelectedValue);
                    context.Countries.Add(country);
                    context.SaveChanges();
                    this.GridViewCountries.DataBind();
                    this.GridViewCountries.ShowFooter = false;
                }

            }
            else
            {
                var label = this.GridViewCountries.FooterRow.FindControl("LabelAddFlagPictureValidate") as Label;
                label.ForeColor = System.Drawing.Color.Red;
                label.Text = validationCheckMessage;
            }
        }

        protected void ButtonAddTown_Click(object sender, EventArgs e)
        {
            ListViewTowns.InsertItemPosition = InsertItemPosition.FirstItem;
        }

        protected void ButtonInsert_Click(object sender, EventArgs e)
        {
            var context = new ContinentsEntities();
            var area = (sender as LinkButton).Parent;

            Town town = new Town();
            var countryId = int.Parse((area.FindControl("DropDownListCountryInsert") as DropDownList).SelectedValue);
            town.Country = context.Countries.Where(c => c.Id == countryId).First();
            town.CountryId = town.Country.Id;
            town.Name = (area.FindControl("TextBoxNameInsert") as TextBox).Text;
            town.Population = long.Parse((area.FindControl("TextBoxPopulationInsert") as TextBox).Text);

            context.Towns.Add(town);
            var reslut = context.SaveChanges();
        }

        protected string GetImage(object img)
        {
            string result = "";
            if (img != null)
            {
                result = "data:image/jpg;base64," + Convert.ToBase64String((byte[])img);
            }
            return result;
        }

        protected void ImageButtonChangeFlag_Click(object sender, EventArgs e)
        {
            int editIndex = this.GridViewCountries.EditIndex;
            var fileUpload = this.GridViewCountries.Rows[editIndex].FindControl("ChangeFlagPicture") as FileUpload;
            string validationCheckMessage = "";
            if (fileUpload.HasFile)
            {
                validationCheckMessage = ValidateUploadFile(fileUpload.PostedFile.FileName);
            }
            if (validationCheckMessage == "")
            {
                if (fileUpload.HasFile)
                {
                    Byte[] imgByte = null;
                    HttpPostedFile File = fileUpload.PostedFile;
                    imgByte = new Byte[File.ContentLength];
                    File.InputStream.Read(imgByte, 0, File.ContentLength);

                    int selectedCountry;
                    if (int.TryParse(this.GridViewCountries.DataKeys[editIndex].Value.ToString(), out selectedCountry))
                    {
                        var context = new ContinentsEntities();
                        using (context)
                        {
                            var country = context.Countries.Find(selectedCountry);
                            if (country != null)
                            {
                                country.Flag = imgByte;
                                context.SaveChanges();
                                this.GridViewCountries.DataBind();
                            }
                        }
                    }
                }
               
            } else
                {
                    var label = this.GridViewCountries.Rows[editIndex].FindControl("LabelChangeFlagPictureValidate") as Label;
                    label.ForeColor = System.Drawing.Color.Red;
                    label.Text = validationCheckMessage;
                }


        }

        protected string ValidateUploadFile(string fileName)
        {
            string[] validFileTypes = { "bmp", "gif", "png", "jpg", "jpeg", "tiff" };
            string ext = System.IO.Path.GetExtension(fileName);

            for (int i = 0; i < validFileTypes.Length; i++)
            {
                if (ext == "." + validFileTypes[i])
                {
                    return "";
                }
            }

            return "Invalid File. Please upload a File with extension " +
                                   string.Join(", ", validFileTypes);
        }

    }
}