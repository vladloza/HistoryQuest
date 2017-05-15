
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Security;
using System.Configuration;
using System.Net;
using System.IO;
using HistoryQuest.Domain.Models;

namespace HistoryQuest.Domain
{
    public class Socials
    {
        public static string redirect_uri = ConfigurationManager.AppSettings["redirectUrl"];

        public static void AuthoritheSocialUser(string token, string sname)
        {
            string link = string.Format("http://ulogin.ru/token.php?token={0}&host={1}", token,
              sname);

            WebRequest reqGET = WebRequest.Create(link);

            System.Net.WebResponse resp = reqGET.GetResponse();
            System.IO.Stream stream = resp.GetResponseStream();
            System.IO.StreamReader sr = new System.IO.StreamReader(stream);
            string html = sr.ReadToEnd();
            string parsed = JObject.Parse(html).ToString();
            var data = JsonConvert.DeserializeObject<SocialsResponce>(parsed);

            var user = Repository.CurrentDataContext.Users.FirstOrDefault(u => (u.UserName == data.email || u.UserName == data.uid) && u.SocialName == data.network);

            if (user == null)
            {
                Guid userGID = Guid.NewGuid();
                user = new User()
                {
                    gid = userGID,
                    Face = new Face()
                    {
                        gid = Guid.NewGuid(),
                        FirstName = data.first_name,
                        LastName = data.last_name,
                        Info = data.profile,
                        IsTeacher = false
                    },
                    SocialName = data.network,
                    UserName = !String.IsNullOrEmpty(data.email) ? data.email : data.uid,
                    UsersInRoles = new System.Data.Linq.EntitySet<UsersInRole>()
                    {
                        new UsersInRole
                        {
                            gid = Guid.NewGuid(),
                            UserGID = userGID,
                            RoleGID = Constants.StudentRoleGID
                        }
                    }
                };

                Repository.CurrentDataContext.Users.InsertOnSubmit(user);
                Repository.CurrentDataContext.SubmitChanges();
            }

            Repository.CurrentUser = user;
        }
    }
}
