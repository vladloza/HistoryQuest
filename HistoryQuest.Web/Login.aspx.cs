using HistoryQuest.Domain;
using HistoryQuest.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using HistoryQuest.Domain.Utils;

namespace HistoryQuest
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Repository.CurrentUser != null)
            {
                Response.Redirect(FormsAuthentication.DefaultUrl);
            }
            if (Request.QueryString["state"] != null)
            {
                Socials.AuthoritheSocialUser(Request.QueryString);
                Response.Redirect(FormsAuthentication.DefaultUrl);
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            User user = Repository.CurrentDataContext.GetUserByUserName(log_box.Value.ToString());

            if (user != null)
            {
                if (user.Validate(pass_box.Value.ToString()))
                {
                    Repository.CurrentUser = user;
                }
            }

            if (Repository.CurrentUser != null)
            {
                Response.Redirect(FormsAuthentication.DefaultUrl);
            }
            else
            {
                error_text.Text = "Невірний логін або пароль!";
            }
        }

        protected void vkLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect(Socials.vkUrl);
        }
        protected void fbLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect(Socials.fbUrl);
        }

    }
}