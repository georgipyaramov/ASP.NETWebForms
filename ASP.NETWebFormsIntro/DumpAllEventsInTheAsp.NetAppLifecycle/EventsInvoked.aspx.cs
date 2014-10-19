using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DumpAllEventsInTheAsp.NetAppLifecycle
{
    public partial class EventsInvoked : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            Response.Write("Page PreInit invoked!" + "<br/>");
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            Response.Write("Page Init invoked!" + "<br/>");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write("Page Load invoked!" + "<br/>");
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            Response.Write("Page PreRender invoked!" + "<br/>");
        }

        protected void Page_Unload(object sender, EventArgs e)
        {
            //Response is not avaiable in Unload
        }


        protected void btn_Init(object sender, EventArgs e)
        {
            Response.Write("Button Init invoked!" + "<br/>");
        }

        protected void btn_Load(object sender, EventArgs e)
        {
            Response.Write("Button Load invoked!" + "<br/>");
        }

        protected void btn_PreRender(object sender, EventArgs e)
        {
            Response.Write("Button PreRender invoked!" + "<br/>");
        }

        protected void btn_Unload(object sender, EventArgs e)
        {
            //Response is not avaiable in Unload
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            Response.Write("Button Click invoked!" + "<br/>");
        }
    }
}