using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Cinephile.Startup))]
namespace Cinephile
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
