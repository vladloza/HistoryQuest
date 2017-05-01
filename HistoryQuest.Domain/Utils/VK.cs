using HistoryQuest.Domain.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VkNet;

namespace HistoryQuest.Domain.Utils
{
    public class VK
    {
        static string url = "https://oauth.vk.com/access_token?client_id=6009379&client_secret=VgmVKtowqz71XXwwrC1p&redirect_uri=http://localhost:64356/Login.aspx&code=";

        static User GetUserFromVKResponse(VKResponse response)
        {
            VkApi api = new VkApi();
            ApiAuthParams @params = new ApiAuthParams()
            {
                AccessToken = response.access_token,
                ApplicationId = 6009379,
                UserId = response.user_id,
                TokenExpireTime = response.expires_in
            };
            api.Authorize(@params);
            var info = api.Users.Get(response.user_id);
            var userGID = Guid.NewGuid();
            return new User()
            {
                gid = userGID,
                Face = new Face()
                {
                    gid = Guid.NewGuid(),
                    FirstName = info.FirstName,
                    LastName = info.LastName,
                    Info = info.About,
                    IsTeacher = false
                },
                IsSocial = true,
                UserName = response.email,
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
        }

        static VKResponse GetVKResponse(string token)
        {
            System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
            System.Net.WebRequest reqGET = System.Net.WebRequest.Create(url+token);
            System.Net.WebResponse resp = reqGET.GetResponse();
            System.IO.Stream stream = resp.GetResponseStream();
            System.IO.StreamReader sr = new System.IO.StreamReader(stream);
            string html = sr.ReadToEnd();
            string parsed = JObject.Parse(html).ToString();
            return JsonConvert.DeserializeObject<VKResponse>(parsed);
        }

        public static void AuthoritheVKUser(string token)
        {
            VKResponse response = GetVKResponse(token);
            User user = Repository.CurrentDataContext.Users.FirstOrDefault(u => u.UserName == response.email);
            if (user == null)
            {
                user = RegisterVKUser(response);
            }
            Repository.CurrentUser = user;
        }

        static User RegisterVKUser(VKResponse response)
        {
            User user = GetUserFromVKResponse(response);

            Repository.CurrentDataContext.Users.InsertOnSubmit(user);
            Repository.CurrentDataContext.SubmitChanges();

            return user;

        }
    }
}
