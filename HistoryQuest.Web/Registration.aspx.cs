using HistoryQuest.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistoryQuest
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Repository.CurrentUser != null)
            {
                Response.Redirect(FormsAuthentication.DefaultUrl);
            }
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            User user = Repository.CurrentDataContext.GetUserByUserName(login_box.Value);
            if (user == null)
            {
                Guid faceGID = Guid.NewGuid();
                var salt = Defender.GenerateSalt();
                user = new User()
                {
                    gid = Guid.NewGuid(),
                    FaceGID = faceGID,
                    PasswordFormat = 1,
                    PasswordSalt = salt,
                    Password = Defender.ComputeHash(pass_box.Value, salt),
                    UserName = login_box.Value.ToString(),
                    UsersInRoles = new System.Data.Linq.EntitySet<UsersInRole>()
                    {
                        new UsersInRole
                        {
                            gid = Guid.NewGuid(),
                            User = user,
                            RoleGID = Constants.StudentRoleGID
                        }
                    }
                };

                var face = new Face()
                {
                    gid = faceGID,
                    FirstName = name_box.Value,
                    LastName = sur_box.Value,
                    IsTeacher = false,
                    MiddleName = mid_box.Value
                };

                if (!string.IsNullOrEmpty(selectedTeacher.Value))
                {
                    var request = new PupilsToTeachersRequest()
                    {
                        gid = Guid.NewGuid(),
                        PupilGID = user.FaceGID.Value,
                        TeacherGID = new Guid(selectedTeacher.Value)
                    };

                    Repository.CurrentDataContext.PupilsToTeachersRequests.InsertOnSubmit(request);
                }

                Repository.CurrentDataContext.Faces.InsertOnSubmit(face);
                Repository.CurrentDataContext.Users.InsertOnSubmit(user);
                Repository.CurrentDataContext.SubmitChanges();
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                error_box.Text = "Вибачте, користувач з таким Логіном вже існує";
            }
        }

        protected void TeacherButton_Click(object sender, EventArgs e)
        {
            TeacherRequest request = Repository.CurrentDataContext.TeacherRequests.FirstOrDefault(tr => tr.E_Mail == email.Value && tr.City == city.Value && 
                tr.FirstName == t_first.Value && tr.LastName == t_last.Value && tr.MiddleName == t_mid.Value && tr.Telephone == tel.Value && tr.Institution == zaklName.Value);
            if (request == null)
            {
                request = new TeacherRequest()
                {
                    gid = Guid.NewGuid(),
                    FirstName = t_first.Value,
                    LastName = t_last.Value,
                    MiddleName = t_mid.Value,
                    City = city.Value,
                    E_Mail = email.Value,
                    Telephone = tel.Value,
                    Institution = zaklName.Value
                };

                Repository.CurrentDataContext.TeacherRequests.InsertOnSubmit(request);
                Repository.CurrentDataContext.SubmitChanges();
                Response.Redirect("~/Login.aspx");
            }
        }
    }
}