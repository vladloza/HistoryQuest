using HistoryQuest.Domain.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace HistoryQuest.Domain.Utils
{
    class FaceBook
    {
        static string url = "https://graph.facebook.com/oauth/access_token?client_id="+Socials.fbID+"&redirect_uri="+Socials.redirect_uri+"&client_secret="+Socials.fbSecret+"&code=";
        static WebClient client = new WebClient();

        public static void AuthoritheUser(string token)
        {
            FaceBookResponce response = Socials.GetResponse<FaceBookResponce>(token, url);

            string newUrl = "https://graph.facebook.com/me/" + "?access_token=" + response.access_token;
            string result = client.DownloadString(newUrl);

            Regex getValues = new Regex("(?<=\"email\":\")(.+?)(?=\")");
            Match infoMatch = getValues.Match(result);

            var email = infoMatch.Value;
            var CorrectEmail = email.Replace("\\u0040", "@");

            getValues = new Regex("(?<=\"id\":\")(.+?)(?=\")");
            infoMatch = getValues.Match(result);
            var id = infoMatch.Value;

            getValues = new Regex("(?<=\"name\":\")(.+?)(?=\")");
            infoMatch = getValues.Match(result);
            var name = infoMatch.Value;

            var userName = string.IsNullOrEmpty(email) ? id : email;
            User user = Repository.CurrentDataContext.Users.FirstOrDefault(u => u.UserName == userName && u.SocialName == "fb");
            if (user == null)
            {
                user = RegisterUser(name, userName);
            }
            Repository.CurrentUser = user;
        }

        static User RegisterUser(string name, string userName)
        {
            Guid userGID = Guid.NewGuid();
            User user = new User()
            {
                gid = userGID,
                Face = new Face()
                {
                    gid = Guid.NewGuid(),
                    FirstName = name.Split(new char[] { ' ' }).FirstOrDefault(),
                    LastName = name.Split(new char[] { ' ' }).LastOrDefault(),
                    IsTeacher = false
                },
                SocialName = "fb",
                UserName = userName,
                UsersInRoles = new System.Data.Linq.EntitySet<UsersInRole>()
                {
                    new UsersInRole
                    {
                        gid = Guid.NewGuid(),
                        UserGID = userGID,
                        RoleGID = new Guid(Constants.StudentRoleGID)
                    }
                }
            };

            Repository.CurrentDataContext.Users.InsertOnSubmit(user);
            Repository.CurrentDataContext.SubmitChanges();

            return user;

        }
    }
}
