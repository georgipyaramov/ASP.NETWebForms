using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EscapeAndShowEnteredMessage
{
    public partial class EscapeAndShowMessage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void showMessageBtn_Click(object sender, EventArgs e)
        {
            var message = this.textBoxMessageInput.Text;

            var newPanel = new Panel();
            newPanel.CssClass = "form-group";

            var newMessageBox = new Label();
            newMessageBox.Text = Server.HtmlEncode(message); 
            newMessageBox.CssClass = "form-control";

            newPanel.Controls.Add(newMessageBox);

            this.formCotrolContainer.Controls.Add(newPanel);

        }
    }
}