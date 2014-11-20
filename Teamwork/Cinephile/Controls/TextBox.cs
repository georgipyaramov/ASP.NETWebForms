using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cinephile.Controls
{
    public class TextBox : System.Web.UI.WebControls.TextBox
    {
        public string PlaceHolder { get; set; }

        protected override void OnLoad(EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(PlaceHolder))
                this.Attributes.Add("placeholder", PlaceHolder);

            base.OnLoad(e);
        }
    }
}