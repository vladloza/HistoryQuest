using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HistoryQuest.Domain.Models
{
    public class VKResponse
    {
        public VKResponse()
        {
        }

        public VKResponse(string url)
        {
            System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
            System.Net.WebRequest reqGET = System.Net.WebRequest.Create(url);
            System.Net.WebResponse resp = reqGET.GetResponse();
            System.IO.Stream stream = resp.GetResponseStream();
            System.IO.StreamReader sr = new System.IO.StreamReader(stream);
            string html = sr.ReadToEnd();
            string parsed = JObject.Parse(html).ToString();
            var result = JsonConvert.DeserializeObject<VKResponse>(parsed);

            access_token = result.access_token;
            expires_in = result.expires_in;
            user_id = result.user_id;
            email = result.email;
        }

        public string access_token;
        public int expires_in;
        public int user_id;
        public string email;
    }
}
