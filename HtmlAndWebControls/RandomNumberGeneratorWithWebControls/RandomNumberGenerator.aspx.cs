using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RandomNumberGeneratorWithWebControls
{
    public partial class RandomNumberGenerator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void generateNumberBtn_Click(object sender, EventArgs e)
        {
            var min = int.Parse(this.inputRangeMin.Text);
            var max = int.Parse(this.inputRangeMax.Text);

            var random = new Random();

            var generatedNum = random.Next(min, max + 1);

            this.generatedNumber.Text = generatedNum.ToString();
        }
    }
}