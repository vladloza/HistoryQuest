using HistoryQuest.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistoryQuest
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            User user = Repository.CurrentDataContext.GetUserByUserName(login_box.Value.ToString());
            if (user == null)
            {
                var salt = Defender.GenerateSalt();
                user = new User()
                {
                    gid = Guid.NewGuid(),
                    Face = new Face()
                    {
                        gid = Guid.NewGuid(),
                        FirstName = name_box.Value.ToString(),
                        LastName = sur_box.Value.ToString(),
                        IsTeacher = false,
                        MiddleName = mid_box.Value.ToString()
                    },
                    PasswordFormat = 1,
                    PasswordSalt = salt,
                    Password = Defender.ComputeHash(pass_box.Value.ToString(), salt),
                    UserName = login_box.Value.ToString(),
                    UsersInRoles = new System.Data.Linq.EntitySet<UsersInRole>()
                    {
                        new UsersInRole
                        {
                            gid = Guid.NewGuid(),
                            User = user,
                            RoleGID = new Guid("024900db-2a68-4959-a0e9-10069608d923")
                        }
                    }
                };

                Repository.CurrentDataContext.Users.InsertOnSubmit(user);
                Repository.CurrentDataContext.SubmitChanges();
            }
            else
            {
                error_box.Text = "Вибачте, користувач з таким Логіном все існує";
            }
        }
    }
}