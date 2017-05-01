using HistoryQuest.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistoryQuest.Controls
{
    public partial class ChangePassword : System.Web.UI.UserControl
    {
        protected void ChangePasswordButton_Click(object sender, EventArgs e)
        {
            var user = Repository.CurrentDataContext.Users.Single(f => f.gid == Repository.CurrentUser.gid);

            var salt = Defender.GenerateSalt();
            user.PasswordFormat = 1;
            user.PasswordSalt = salt;
            user.Password = Defender.ComputeHash(password.Value, salt);

            Repository.CurrentDataContext.SubmitChanges();
        }
    }
}