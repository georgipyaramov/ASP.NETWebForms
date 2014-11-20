using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SaveAllImputMessagesForTheSession
{
    public partial class InputMessages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ButtonSaveMessage_Click(object sender, EventArgs e)
        {
            if (this.Session["inputMessages"] == null)
            {
                this.Session["inputMessages"] = new List<string>();
            }

            (this.Session["inputMessages"] as IList<string>).Add(this.TextBoxInputMessages.Text);
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            this.MessagesContainer.InnerHtml = "";

            if (this.Session["inputMessages"] != null)
            {
                foreach (var message in (this.Session["inputMessages"] as IList<string>))
                {
                    this.MessagesContainer.InnerHtml += "<p>" + message + "</p>";                
                }
            }
        }
    }
}