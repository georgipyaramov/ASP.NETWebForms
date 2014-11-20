using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WaklthroughASP.NETWebFormsProject
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            this.LabelHelloAsp.Text = "Hello from ASP.Net cs file.";
            this.LabelAssemblyPath.Text = "Current assembly location: " + Assembly.GetExecutingAssembly().Location;
        }
    }
}