using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HeloPesho
{
    public partial class Hello : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void WriteNameButton_Click(object sender, EventArgs e)
        {
            this.LabelHello.Text = "Hello, " + this.TextBoxNameInput.Text;
        }
    }
}