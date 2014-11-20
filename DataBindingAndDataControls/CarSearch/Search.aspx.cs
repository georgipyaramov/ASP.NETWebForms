using CarSearch.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CarSearch
{
    public partial class Search : System.Web.UI.Page
    {
        private IList<Producer> producers;
        private IList<Extra> extras;
        private string[] engines;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.producers = this.SeedProducers();
            this.extras = this.SeedExtras();
            this.engines = new[] { "Petrol", "Diesel", "Electric", "Hybrid" };
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.dropDownProducer.DataSource = this.producers;

                this.dropDownModel.Enabled = false;

                this.checkBoxExtras.DataSource = this.extras;
                this.checkBoxExtras.DataTextField = "Name";

                this.radioButtonEngineTypes.DataSource = this.engines;
                this.radioButtonEngineTypes.RepeatDirection = RepeatDirection.Horizontal;

                this.DataBind();
                
                this.dropDownProducer.Items.Insert(0, new ListItem("Choose producer", "0"));
            }
        }

        protected void dropDownProducer_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.dropDownProducer.SelectedIndex != 0)
            {
                this.dropDownModel.Enabled = true;
                this.dropDownModel.DataSource =
                    this.producers
                    .Where(p => p.Name == this.dropDownProducer.SelectedItem.Value)
                    .Select(p => p.Models)
                    .ToList()[0];

                this.DataBind();

                this.dropDownModel.Items.Insert(0, new ListItem("Choose producer", "0"));
            }
            else
            {
                this.dropDownModel.Items.Clear();
                this.dropDownModel.Enabled = false;
            }
        }

        private IList<Producer> SeedProducers()
        {
            var producers = new List<Producer>();

            var producerBmw = new Producer("BMW");
            producerBmw.Models.Add("320i");
            producerBmw.Models.Add("320d");
            producerBmw.Models.Add("535d");
            producerBmw.Models.Add("760Li");

            var producerMitsubishi = new Producer("Mitsubishi");
            producerMitsubishi.Models.Add("Colt");
            producerMitsubishi.Models.Add("Carisma");
            producerMitsubishi.Models.Add("Galant");
            producerMitsubishi.Models.Add("Outlander");

            var producerOpel = new Producer("Opel");
            producerOpel.Models.Add("Corsa");
            producerOpel.Models.Add("Astra");
            producerOpel.Models.Add("Vectra");
            producerOpel.Models.Add("Frontera");

            producers.Add(producerBmw);
            producers.Add(producerMitsubishi);
            producers.Add(producerOpel);

            return producers;
        }

        private IList<Extra> SeedExtras()
        {
            var extras = new List<Extra>();

            extras.Add(new Extra("ABS - Anti-lock Break System"));
            extras.Add(new Extra("ASC - Automatic Stability Control"));
            extras.Add(new Extra("Air conditioning"));
            extras.Add(new Extra("Sunroof"));
            extras.Add(new Extra("Cruise control"));
            extras.Add(new Extra("Electric windows"));
            extras.Add(new Extra("Electric mirrors"));

            return extras;
        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            var producerSelected = this.dropDownProducer.SelectedItem.Text;
            var modelSelected = this.dropDownModel.SelectedValue;
            var engineSelected = this.radioButtonEngineTypes.SelectedValue;

            var selectedExtras = new List<string>();

            foreach (ListItem item in this.checkBoxExtras.Items)
            {
                if (item.Selected)
                {
                    selectedExtras.Add(item.Text);
                }
            }

            var div = new HtmlGenericControl("div");
            div.Attributes.Add("class", "jumbotron");

            var heading = new HtmlGenericControl("h2");
            heading.InnerHtml = "You selected:";

            var paragraphProducer = new HtmlGenericControl("p");
            paragraphProducer.InnerHtml = "<b>Producer: </b>" + producerSelected;

            var paragraphModel = new HtmlGenericControl("p");
            paragraphModel.InnerHtml = "<b>Model: </b>" + modelSelected;

            var paragraphEngine = new HtmlGenericControl("p");
            paragraphEngine.InnerHtml = "<b>Engine: </b>" + engineSelected;

            var paragraphExtras = new HtmlGenericControl("p");
            paragraphExtras.InnerHtml = "<b>Extras: </b>" + string.Join(", ", selectedExtras);

            div.Controls.Add(heading);

            ltlSubmit.Text += paragraphProducer.InnerHtml + "</br>";
            ltlSubmit.Text += paragraphModel.InnerHtml + "</br>";
            ltlSubmit.Text += paragraphEngine.InnerHtml + "</br>";
            ltlSubmit.Text += paragraphExtras.InnerHtml + "</br>";

            div.Controls.Add(ltlSubmit);
            this.resultPanel.Controls.Add(div);
        }
    }
}