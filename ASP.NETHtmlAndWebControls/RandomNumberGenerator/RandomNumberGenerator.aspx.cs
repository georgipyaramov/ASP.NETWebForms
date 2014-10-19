using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RandomNumberGenerator
{
    public partial class RandomNumberGenerator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void generateNumberBtn_Click(object sender, EventArgs e)
        {
            var min = int.Parse(this.inputRangeMin.Value);
            var max = int.Parse(this.inputRangeMax.Value);

            var random = new Random();

            var randNum = random.Next(min, max + 1);

            this.generatedNumber.InnerText = randNum.ToString();
        }
    }
}