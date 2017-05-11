using HistoryQuest.Domain.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using VkNet;

namespace HistoryQuest.Domain.Utils
{
    public class VK
    {
        static string url = "https://oauth.vk.com/access_token?client_id="+Socials.vkID+"&client_secret="+Socials.vkSecret+"&redirect_uri="+Socials.redirect_uri+"&code=";
        static WebClient client = new WebClient();

        static User GetUserFromResponse(VKResponse response)
        {
            VkApi api = new VkApi();
            ApiAuthParams @params = new ApiAuthParams()
            {
                AccessToken = response.access_token,
                ApplicationId = Convert.ToUInt64(Socials.vkID),
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
                SocialName = "vk",
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

        public static void AuthoritheUser(string token)
        {
            VKResponse response = Socials.GetResponse<VKResponse>(token, url);

            User user = Repository.CurrentDataContext.Users.FirstOrDefault(u => u.UserName == response.email && u.SocialName == "vk");
            if (user == null)
            {
                user = RegisterUser(response);
            }
            Repository.CurrentUser = user;
        }

        static User RegisterUser(VKResponse response)
        {
            User user = GetUserFromResponse(response);

            Repository.CurrentDataContext.Users.InsertOnSubmit(user);
            Repository.CurrentDataContext.SubmitChanges();

            return user;

        }
    }
}
