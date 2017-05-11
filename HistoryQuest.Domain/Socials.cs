using HistoryQuest.Domain.Utils;
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

namespace HistoryQuest.Domain
{
    public class Socials
    {
        public const string redirect_uri = "http://localhost:64356/Login.aspx";
        public const string scope = "email";

        public const string fbID = "126671031222882";
        public const string fbSecret = "0e86a47832a37c7287b3407b155fb662";
        public const string fbUrl = "https://www.facebook.com/dialog/oauth?client_id=" + fbID+"&redirect_uri=" + redirect_uri + "&state=fb&scope="+scope;

        public const string vkID = "6009379";
        public const string vkSecret = "VgmVKtowqz71XXwwrC1p";
        public const string vkUrl = "https://oauth.vk.com/authorize?client_id="+vkID+"&display=page&redirect_uri="+redirect_uri+"&scope="+scope+ "&response_type=code&v=5.63&state=vk";

        public static void AuthoritheSocialUser(NameValueCollection request)
        {
            switch (request["state"])
            {
                case "vk":
                    VK.AuthoritheUser(request["code"].ToString());
                    break;
                case "fb":
                    FaceBook.AuthoritheUser(request["code"].ToString());
                    break;
            }
        }

        public static T GetResponse<T>(string token, string url)
        {
            System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
            System.Net.WebRequest reqGET = System.Net.WebRequest.Create(url + token);
            System.Net.WebResponse resp = reqGET.GetResponse();
            System.IO.Stream stream = resp.GetResponseStream();
            System.IO.StreamReader sr = new System.IO.StreamReader(stream);
            string html = sr.ReadToEnd();
            string parsed = JObject.Parse(html).ToString();
            return JsonConvert.DeserializeObject<T>(parsed);
        }
    }
}
