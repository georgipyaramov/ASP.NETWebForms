using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sumator
{
    public partial class Sumator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonCalculateSum_Click(object sender, EventArgs e)
        {
            var firstNum = double.Parse(this.TextBoxFirstNum.Text);
            var secondNum = double.Parse(this.TextBoxSecondNum.Text);
            var sum = firstNum + secondNum;

            this.TextBoxFirstNum.Text = "";
            this.TextBoxSecondNum.Text = "";
            this.TextBoxSum.Text = sum.ToString();
        }
    }
}