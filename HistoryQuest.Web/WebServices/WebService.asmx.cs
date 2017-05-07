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
        public object GetTeachersByPrefix(string prefix)
        {
            if (prefix.Length > 1)
            {
                return (from f in Repository.CurrentDataContext.Faces
                        where f.IsTeacher && (f.LastName + " " + f.LastName[0] + "." + f.MiddleName[0] + "." + f.id + "").Contains(prefix)
                        select new { f.gid, f.id, f.LastName, f.FirstName, f.MiddleName }).ToList();
            }

            return null;
        }

        [WebMethod]
        public object GetTeacherRequests()
        {
            var requests = (from ptr in Repository.CurrentDataContext.PupilsToTeachersRequests
                            join fp in Repository.CurrentDataContext.Faces on ptr.PupilGID equals fp.gid
                            where ptr.TeacherGID == Repository.CurrentUser.FaceGID
                            select new { fp.gid, fp.id, fp.LastName, fp.FirstName, fp.MiddleName }).ToList();

            return requests;
        }

        [WebMethod]
        public object GetComments(Guid questGuid, int startFrom, int countToTake = 5)
        {
            var requests = (from c in Repository.CurrentDataContext.Comments
                            join u in Repository.CurrentDataContext.Users on c.AuthorGID equals u.gid
                            join f in Repository.CurrentDataContext.Faces on u.FaceGID equals f.gid
                            where c.QuestGID == questGuid 
                            select new { c.id, f.FullName, c.Text, c.Date }).OrderByDescending(com => com.id).Skip(startFrom).Take(countToTake).ToList();

            return requests;
        }

        [WebMethod]
        public void AddComment(Guid questGuid, string text)
        {
            Comment comment = new Comment()
            {
                gid = Guid.NewGuid(),
                QuestGID = questGuid,
                Text = text,
                Date = DateTime.Now,
                AuthorGID = Repository.CurrentUser.gid
            };
            Repository.CurrentDataContext.Comments.InsertOnSubmit(comment);
            Repository.CurrentDataContext.SubmitChanges();
        }

        [WebMethod]
        public void AddStudent(Guid studentGID)
        {
            var request = Repository.CurrentDataContext.PupilsToTeachersRequests.SingleOrDefault(ptr => ptr.PupilGID == studentGID && ptr.TeacherGID == Repository.CurrentUser.FaceGID);

            if (request != null)
            {
                Repository.CurrentDataContext.Faces.Where(f => f.gid == studentGID).Single().TeacherGID = Repository.CurrentUser.FaceGID;
                Repository.CurrentDataContext.PupilsToTeachersRequests.DeleteOnSubmit(request);
                Repository.CurrentDataContext.SubmitChanges();
            }
        }

        [WebMethod]
        public void DeleteStudent(Guid studentGID)
        {
            var request = Repository.CurrentDataContext.PupilsToTeachersRequests.SingleOrDefault(ptr => ptr.PupilGID == studentGID && ptr.TeacherGID == Repository.CurrentUser.FaceGID);
            if (request != null)
            {
                Repository.CurrentDataContext.PupilsToTeachersRequests.DeleteOnSubmit(request);
                Repository.CurrentDataContext.SubmitChanges();
            }
        }

        [WebMethod(EnableSession = true)]
        public string OpenQuestPage(Guid questGID)
        {
            string url = "/Quests/QuestInfo.aspx";

            if ((Session["CurrentQuestGID"] != null && Guid.Parse(Session["CurrentQuestGID"].ToString()) == questGID) ||
                Repository.CurrentUser.Tries.Any(t => t.QuestGID == questGID && !t.IsSuccessful.HasValue))
            {
                url = "/Quests/Quest.aspx";
            }

            Session["CurrentQuestGID"] = questGID;

            return url;
        }

        [WebMethod(EnableSession = true)]
        public string StartCheckPoint(Guid checkPointGID)
        {
            string url = "/Quests/Task.aspx";
            
            Session["CurrentCheckPointGID"] = checkPointGID;

            return url;
        }

        [WebMethod]
        public object GetQuestCheckPoints(Guid questGID)
        {
            Dictionary<string, object> result = new Dictionary<string, object>();

            try
            {
                HistoryQuest.Domain.Try userTry = Repository.CurrentUser.Tries.SingleOrDefault(t => t.QuestGID == questGID && !t.IsSuccessful.HasValue);
                HistoryQuest.Domain.Quest quest = userTry != null ? userTry.Quest : null;

                List<Guid> completedCheckPoints = new List<Guid>();
                List<CheckPoint> allCheckPoints = new List<CheckPoint>();

                if (quest != null)
                {
                    completedCheckPoints = (from cp in Repository.CurrentDataContext.CheckPoints
                                 join cpt in Repository.CurrentDataContext.CheckPointsToTries on cp.gid equals cpt.CheckPointGID
                                 where cpt.TryGID == userTry.gid && !cpt.IsFailed
                                 select cp.gid).Distinct().ToList();
                }
                else
                {
                    quest = Repository.CurrentDataContext.Quests.SingleOrDefault(q => q.gid == questGID);
                }

                if (quest != null)
                {
                    allCheckPoints = quest.CheckPoints.ToList();

                    List<Dictionary<string, object>> checkPointsList = new List<Dictionary<string, object>>();
                    foreach (var checkPoint in allCheckPoints)
                    {
                        bool isCompleted = completedCheckPoints.Contains(checkPoint.gid);
                        Dictionary<string, object> checkPointData = new Dictionary<string, object>
                        {
                            { "id", checkPoint.id },
                            { "gid", checkPoint.gid },
                            { "Name", checkPoint.Name },
                            { "IsBonus", checkPoint.IsBonus },
                            { "OrderId", checkPoint.OrderId },
                            { "GeoCoordinates", checkPoint.GeoCoordinates },
                            { "IsCompleted", isCompleted },
                            { "IsCurrent", !isCompleted && (!checkPoint.ParentGID.HasValue || completedCheckPoints.Contains(checkPoint.ParentGID.Value)) }
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

            return result;
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

        [WebMethod]
        public object GetCheckPointLikesCount(Guid checkPointGID)
        {
            int count = Repository.CurrentDataContext.Likes.Where(l => l.CheckPointGID == checkPointGID).Count();
            bool liked = Repository.CurrentDataContext.Likes
                .SingleOrDefault(l => l.CheckPointGID == checkPointGID && l.UserGID == Repository.CurrentUser.gid) != null;

            return new { count, liked };
        }

        [WebMethod]
        public void UpdateCheckPointLikesCount(Guid checkPointGID)
        {
            var request = Repository.CurrentDataContext.Likes
                .SingleOrDefault(l=> l.CheckPointGID == checkPointGID && l.UserGID == Repository.CurrentUser.gid);

            if(request != null)
            {
                Repository.CurrentDataContext.Likes.DeleteOnSubmit(request);
            }
            else
            {
                Likes like = new Likes()
                {
                    gid = Guid.NewGuid(),
                    CheckPointGID = checkPointGID,
                    UserGID = Repository.CurrentUser.gid
                };
                Repository.CurrentDataContext.Likes.InsertOnSubmit(like);
            }
            Repository.CurrentDataContext.SubmitChanges();
        }
    }
}
