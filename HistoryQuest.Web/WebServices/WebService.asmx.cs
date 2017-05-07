﻿using HistoryQuest.Domain;
using HistoryQuest.Domain.TasksValidation;
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
        public object GetComments(Guid questGuid, int startFrom)
        {
            var requests = (from c in Repository.CurrentDataContext.Comments
                            join u in Repository.CurrentDataContext.Users on c.AuthorGID equals u.gid
                            join f in Repository.CurrentDataContext.Faces on u.FaceGID equals f.gid
                            where c.QuestGID == questGuid 
                            select new { c.id, f.FullName, c.Text, c.Date }).OrderByDescending(com => com.id).Skip(startFrom).Take(5).ToList();

            return requests;
        }

        [WebMethod]
        public void AddComment(Guid questGuid, string text)
        {
            var comment = new Comment()
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

        [WebMethod(EnableSession = true)]
        public string StartCheckPoint(Guid checkPointGID)
        {
            string url = "/Default.aspx";

            if (Session != null)
            {
                CheckPoint checkPoint = Repository.CurrentDataContext.CheckPoints.SingleOrDefault(cp => cp.gid == checkPointGID);
                if (checkPoint != null && checkPoint.Tasks != null)
                {
                    List<Task> tasks = checkPoint.Tasks.Take(checkPoint.TasksCount).ToList();

                    Session["CurrentTasksList"] = tasks.Select(t => t.gid).ToList();
                    Session["CurrentTaskId"] = 0;

                    Guid key = tasks.Count > 0 ? tasks[0].TaskTypeGID : Guid.Empty;

                    if (Constants.TaskTypesPages.ContainsKey(key))
                    {
                        url = Constants.TaskTypesPages[key];
                    }
                }
            }

            return url;
        }

        [WebMethod(EnableSession = true)]
        public string OnNextButtonPressed(string userAnswer, long elapsedTime)
        {
            string url = "/Defaul.aspx";

            int currentTaskId;
            List<Guid> tasksList;
            if (!LoadTasksFromSession(out tasksList, out currentTaskId))
            {
                return url;
            }

            HistoryQuest.Domain.Task task = Repository.CurrentDataContext.Tasks.SingleOrDefault(t => t.gid == tasksList[currentTaskId]);

            HistoryQuest.Domain.Try completeQuestTry = Repository.CurrentDataContext.Tries.SingleOrDefault(t => t.QuestGID == task.CheckPoint.QuestGID &&
                   t.UserGID == Repository.CurrentUser.gid && !t.IsSuccessful.HasValue);

            if (completeQuestTry == null)
            {
                completeQuestTry = new HistoryQuest.Domain.Try()
                {
                    gid = Guid.NewGuid(),
                    QuestGID = task.CheckPoint.QuestGID,
                    UserGID = Repository.CurrentUser.gid,
                    CheckPointsToTries = new System.Data.Linq.EntitySet<CheckPointsToTry>()
                };
                Repository.CurrentDataContext.Tries.InsertOnSubmit(completeQuestTry);
            }

            HistoryQuest.Domain.CheckPointsToTry checkPointToTry = HttpContext.Current.Session["CurrentCheckPointTryGID"] != null ?
                completeQuestTry.CheckPointsToTries.FirstOrDefault(cpt => cpt.gid == new Guid(HttpContext.Current.Session["CurrentCheckPointTryGID"].ToString())) : null;

            if (checkPointToTry == null)
            {
                checkPointToTry = new HistoryQuest.Domain.CheckPointsToTry()
                {
                    gid = Guid.NewGuid(),
                    CheckPointGID = task.CheckPointGID,
                    TryGID = completeQuestTry.gid,
                    IsFailed = true,
                    TasksToTries = new System.Data.Linq.EntitySet<TasksToTry>()
                };
                completeQuestTry.CheckPointsToTries.Add(checkPointToTry);

                HttpContext.Current.Session["CurrentCheckPointTryGID"] = checkPointToTry.gid;
            }

            int score = TasksValidatorsFactory.GetTaskValidator(task.TaskTypeGID, (int)task.MaxScore).Validate(userAnswer, HttpContext.Current.Session["RightAnswer"]);

            HistoryQuest.Domain.TasksToTry taskToTry = new HistoryQuest.Domain.TasksToTry()
            {
                gid = Guid.NewGuid(),
                TaskGID = task.gid,
                CheckPointToTryGID = checkPointToTry.gid,
                EarnedScore = score,
                ElapsedTime = elapsedTime
            };
            checkPointToTry.TasksToTries.Add(taskToTry);

            if (currentTaskId == task.CheckPoint.TasksCount - 1)
            {
                if (task.CheckPoint.ThresholdScore == null ||
                    task.CheckPoint.ThresholdScore <= checkPointToTry.TasksToTries.Sum(t => t.EarnedScore))
                {
                    checkPointToTry.IsFailed = false;
                }

                url = "/Quests/Results.aspx";

                CleanCheckPointSession();
            }
            else
            {
                HttpContext.Current.Session["CurrentTaskId"] = currentTaskId + 1;

                HistoryQuest.Domain.Task nextTask = Repository.CurrentDataContext.Tasks.SingleOrDefault(t => t.gid == tasksList[currentTaskId + 1]);
                Guid key = nextTask != null ? nextTask.TaskTypeGID : Guid.Empty;

                if (Constants.TaskTypesPages.ContainsKey(key))
                {
                    url = Constants.TaskTypesPages[key];
                }
            }

            Repository.CurrentDataContext.SubmitChanges();

            return url;
        }

        public static bool LoadTasksFromSession(out List<Guid> tasksList, out int currentTaskId)
        {
            tasksList = new List<Guid>();
            currentTaskId = -1;

            if (HttpContext.Current.Session != null && HttpContext.Current.Session["CurrentTaskId"] != null && HttpContext.Current.Session["CurrentTasksList"] != null)
            {
                tasksList = HttpContext.Current.Session["CurrentTasksList"] as List<Guid>;
                if (int.TryParse(HttpContext.Current.Session["CurrentTaskId"].ToString(), out currentTaskId) && tasksList != null)
                {
                    return true;
                }
            }

            return false;
        }

        protected static void CleanCheckPointSession()
        {
            if (HttpContext.Current.Session != null)
            {
                HttpContext.Current.Session["CurrentCheckPointTryGID"] = null;
                HttpContext.Current.Session["CurrentTasksList"] = null;
                HttpContext.Current.Session["CurrentTaskId"] = null;
                HttpContext.Current.Session["RightAnswer"] = null;
            }
        }
    }
}
