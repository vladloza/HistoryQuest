using HistoryQuest.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Services;


namespace HistoryQuest.WebServices
{
    /// <summary>
    /// Summary description for WebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class WebService : System.Web.Services.WebService
    {
        [WebMethod]
        public List<Face> GetTeachersByPrefix(string prefix)
        {
            return Repository.CurrentDataContext.Faces.Where(f => f.IsTeacher && (f.LastName + " " + f.LastName[0]+"."+f.MiddleName[0]+". ("+f.id+")").Contains(prefix)).ToList();
        }
    }
}
