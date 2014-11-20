using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Cinephile.Models;
using Cinephile.Data;

namespace Cinephile.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var user = new ApplicationUser() { UserName = Username.Text, Email = Email.Text };
            IdentityResult result = manager.Create(user, Password.Text);
            if(result.Succeeded)
            {
                // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                //string code = manager.GenerateEmailConfirmationToken(user.Id);
                //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

                using(CinephileDbEntities db = new CinephileDbEntities())
                {
                    var registeredUser = db.AspNetUsers.FirstOrDefault(u => u.Email == Email.Text);
                    var userRole = db.AspNetRoles.FirstOrDefault(r => r.Name == "user");

                    if(userRole != null)
                    {
                        registeredUser.AspNetRoles.Add(userRole);
                    }
                    else
                    {
                        db.AspNetRoles.Add(new AspNetRole()
                        {
                            Name = "user"
                        });
                        db.SaveChanges();

                        userRole = db.AspNetRoles.FirstOrDefault(r => r.Name == "user");
                        registeredUser.AspNetRoles.Add(userRole);
                    }

                    db.SaveChanges();
                }

                IdentityHelper.SignIn(manager, user, isPersistent: false);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}