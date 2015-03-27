using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(taskForROI.Startup))]
namespace taskForROI
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
