using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(IntrolToASP.NETWebForms.Startup))]
namespace IntrolToASP.NETWebForms
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
