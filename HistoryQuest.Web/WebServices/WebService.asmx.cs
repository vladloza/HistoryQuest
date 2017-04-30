using HistoryQuest.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
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
            return prefix.Length > 1 ? Repository.CurrentDataContext.Faces.Where(f => f.IsTeacher && (f.LastName + " " + f.LastName[0] + "." + f.MiddleName[0] + "." + f.id + "").Contains(prefix)).ToList() : null;
        }

        [WebMethod]
        public object GetQuestCheckPoints(Guid questGID)
        {
            Dictionary<string, object> result = new Dictionary<string, object>();

            try
            {
                HistoryQuest.Domain.Try userTry = Repository.CurrentUser.Tries.SingleOrDefault(t => t.QuestGID == questGID && !t.IsSuccessful.HasValue);
                HistoryQuest.Domain.Quest quest = userTry != null ? userTry.Quest : null;

                List<CheckPoint> completedCheckPoints = new List<CheckPoint>();
                List<CheckPoint> allCheckPoints = new List<CheckPoint>();

                if (quest != null)
                {
                    completedCheckPoints = (from cp in Repository.CurrentDataContext.CheckPoints
                                 join t in Repository.CurrentDataContext.Tasks on cp.gid equals t.CheckPointGID
                                 join ttt in Repository.CurrentDataContext.TasksToTries on t.gid equals ttt.TaskGID
                                 where ttt.TryGID == userTry.gid
                                 select cp).Distinct().ToList();
                }
                else
                {
                    quest = Repository.CurrentDataContext.Quests.SingleOrDefault(q => q.gid == questGID);
                }

                allCheckPoints = quest.CheckPoints.ToList();

                if (quest != null)
                {
                    List<Dictionary<string, object>> checkPointsList = new List<Dictionary<string, object>>();
                    foreach (var checkPoint in allCheckPoints)
                    {
                        Dictionary<string, object> checkPointData = new Dictionary<string, object>
                        {
                            { "id", checkPoint.id },
                            { "gid", checkPoint.gid },
                            { "Name", checkPoint.Name },
                            { "IsBonus", checkPoint.IsBonus },
                            { "OrderId", checkPoint.OrderId },
                            { "GeoCoordinates", checkPoint.GeoCoordinates },
                            { "IsCompleted", completedCheckPoints.Any(cp => cp.gid == checkPoint.gid) }
                        };
                        checkPointsList.Add(checkPointData);
                    }
                    result.Add("CheckPoints", checkPointsList);
                }
            }
            catch (Exception ex)
            {
                //HandleError
            }

            return new JavaScriptSerializer().Serialize(result);
        }

        [WebMethod]
        public object TestGetQuestCheckPoints(Guid questGID)
        {
            Dictionary<string, object> result = new Dictionary<string, object>();

            List<CheckPoint> checkPoints = new List<CheckPoint>()
                        {
                            new CheckPoint()
                            {
                                gid = Guid.NewGuid(),
                                Name = "First CP",
                                IsBonus = false,
                                OrderId = 1,
                                GeoCoordinates = "49.0;32.0"
                            },
                            new CheckPoint()
                            {
                                gid = Guid.NewGuid(),
                                Name = "Second CP",
                                IsBonus = false,
                                OrderId = 2,
                                GeoCoordinates = "49.5;32.5"
                            }
                        };

            checkPoints[1].ParentGID = checkPoints[0].gid;

            List<Dictionary<string, object>> checkPointsList = new List<Dictionary<string, object>>();
            foreach (var checkPoint in checkPoints)
            {
                Dictionary<string, object> checkPointData = new Dictionary<string, object>
                            {
                                { "id", checkPoint.id },
                                { "gid", checkPoint.gid },
                                { "Name", checkPoint.Name },
                                { "IsBonus", checkPoint.IsBonus },
                                { "OrderId", checkPoint.OrderId },
                                { "GeoCoordinates", checkPoint.GeoCoordinates },
                                { "ParentId", checkPoint.ParentGID },
                                { "IsCompleted", true }
                            };
                checkPointsList.Add(checkPointData);
            }
            result.Add("CheckPoints", checkPointsList);

            return result;
        }
    }
}
