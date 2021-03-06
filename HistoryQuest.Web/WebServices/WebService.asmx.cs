﻿using HistoryQuest.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Xml.Linq;
using HistoryQuest.Domain.Tasks;

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

        [WebMethod(EnableSession = true)]
        public object GetPupilsToTeacherRequests()
        {
            var requests = (from ptr in Repository.CurrentDataContext.PupilsToTeachersRequests
                            join fp in Repository.CurrentDataContext.Faces on ptr.PupilGID equals fp.gid
                            where ptr.TeacherGID == Repository.CurrentUser.FaceGID
                            select new { fp.gid, fp.id, fp.LastName, fp.FirstName, fp.MiddleName }).ToList();

            return requests;
        }

        [WebMethod]
        public object GetTeacherRequests()
        {
            return Repository.CurrentDataContext.TeacherRequests.ToList();
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

        [WebMethod(EnableSession = true)]
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

        [WebMethod(EnableSession = true)]
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

        [WebMethod(EnableSession = true)]
        public void DeleteStudent(Guid studentGID)
        {
            var request = Repository.CurrentDataContext.PupilsToTeachersRequests.SingleOrDefault(ptr => ptr.PupilGID == studentGID && ptr.TeacherGID == Repository.CurrentUser.FaceGID);
            if (request != null)
            {
                Repository.CurrentDataContext.PupilsToTeachersRequests.DeleteOnSubmit(request);
                Repository.CurrentDataContext.SubmitChanges();
            }
        }

        [WebMethod]
        public void AddTeacher(Guid teacherGID)
        {
            var request = Repository.CurrentDataContext.TeacherRequests.SingleOrDefault(tr => tr.gid == teacherGID);

            if (request != null)
            {
                User user = Repository.CurrentDataContext.GetUserByUserName(request.E_Mail);
                string pass = Membership.GeneratePassword(8, 0);
                if (user == null)
                {
                    Guid faceGID = Guid.NewGuid();
                    var salt = Defender.GenerateSalt();
                    user = new User()
                    {
                        gid = Guid.NewGuid(),
                        FaceGID = faceGID,
                        PasswordFormat = 1,
                        PasswordSalt = salt,
                        Password = Defender.ComputeHash(pass, salt),
                        UserName = request.E_Mail.ToString(),
                        UsersInRoles = new System.Data.Linq.EntitySet<UsersInRole>()
                        {
                            new UsersInRole
                            {
                                gid = Guid.NewGuid(),
                                User = user,
                                RoleGID = Constants.TeacherRoleGID
                            }
                        }
                    };

                    var face = new Face()
                    {
                        gid = faceGID,
                        FirstName = request.FirstName,
                        LastName = request.LastName,
                        IsTeacher = true,
                        Info = request.Institution,
                        MiddleName = request.MiddleName
                    };

                    Repository.CurrentDataContext.Faces.InsertOnSubmit(face);
                    Repository.CurrentDataContext.Users.InsertOnSubmit(user);
                }
                Repository.CurrentDataContext.TeacherRequests.DeleteOnSubmit(request);
                Repository.CurrentDataContext.SubmitChanges();

                DataService.SendResponceToTeacher(request.E_Mail, pass);
            }
        }

        [WebMethod]
        public void DeleteTeacher(Guid teacherGID)
        {
            var request = Repository.CurrentDataContext.TeacherRequests.SingleOrDefault(tr => tr.gid == teacherGID);
            if (request != null)
            {
                Repository.CurrentDataContext.TeacherRequests.DeleteOnSubmit(request);
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
        public object GetQuestCheckPoints(Guid questGID)
        {
            Dictionary<string, object> result = new Dictionary<string, object>();
            
            try
            {
                HistoryQuest.Domain.Try userTry = Repository.CurrentDataContext.Tries.SingleOrDefault(t => t.UserGID == Repository.CurrentUser.gid &&
                    t.QuestGID == questGID && !t.IsSuccessful.HasValue);
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
                            { "Info", checkPoint.Info},
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
                    List<Task> tasks = checkPoint.Tasks.OrderBy(t => Guid.NewGuid()).Take(checkPoint.TasksCount).ToList();

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
        public string OnNextButtonPressed(Guid taskGID, string userAnswer, long elapsedTime)
        {
            string url = "/Default.aspx";

            int currentTaskId;
            List<Guid> tasksList;
            if (!LoadTasksFromSession(out tasksList, out currentTaskId) || tasksList[currentTaskId] != taskGID)
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

            int score = TasksController.GetTaskValidator(task.TaskTypeGID, task.MaxScore).Validate(userAnswer, HttpContext.Current.Session["RightAnswer"]);

            HistoryQuest.Domain.TasksToTry taskToTry = new HistoryQuest.Domain.TasksToTry()
            {
                gid = Guid.NewGuid(),
                TaskGID = task.gid,
                CheckPointToTryGID = checkPointToTry.gid,
                EarnedScore = score,
                ElapsedTime = elapsedTime,
                Date = DateTime.Now
            };
            checkPointToTry.TasksToTries.Add(taskToTry);

            if (currentTaskId == Math.Min(tasksList.Count, task.CheckPoint.TasksCount) - 1)
            {
                if (task.CheckPoint.ThresholdScore == null ||
                    task.CheckPoint.ThresholdScore <= checkPointToTry.TasksToTries.Sum(t => t.EarnedScore))
                {
                    checkPointToTry.IsFailed = false;
                    if (completeQuestTry.CheckPointsToTries.Where(cpt => !cpt.IsFailed).Count() == task.CheckPoint.Quest.CheckPoints.Count())
                    {
                        completeQuestTry.IsSuccessful = true;
                    }
                }

                url = "/Quests/TestResult.aspx";
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

        public static void CleanCheckPointSession()
        {
            if (HttpContext.Current.Session != null)
            {
                HttpContext.Current.Session["CurrentCheckPointTryGID"] = null;
                HttpContext.Current.Session["CurrentTasksList"] = null;
                HttpContext.Current.Session["CurrentTaskId"] = null;
                HttpContext.Current.Session["RightAnswer"] = null;
            }
        }

        [WebMethod(EnableSession = true)]
        public object GetCheckPointLikesCount(Guid checkPointGID)
        {
            int count = Repository.CurrentDataContext.Likes.Where(l => l.CheckPointGID == checkPointGID).Count();
            bool liked = Repository.CurrentDataContext.Likes
                .SingleOrDefault(l => l.CheckPointGID == checkPointGID && l.UserGID == Repository.CurrentUser.gid) != null;

            return new { count, liked };
        }

        [WebMethod(EnableSession = true)]
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
                Like like = new Like()
                {
                    gid = Guid.NewGuid(),
                    CheckPointGID = checkPointGID,
                    UserGID = Repository.CurrentUser.gid
                };
                Repository.CurrentDataContext.Likes.InsertOnSubmit(like);
            }
            Repository.CurrentDataContext.SubmitChanges();
        }

        #region Constructor

        [WebMethod(EnableSession = true)]
        public string OpenCreateQuestPage(Guid? questGID)
        {
            string url = "/Constructor/CreateQuest.aspx";

            if (HttpContext.Current.Session != null)
            {
                HistoryQuest.Domain.Quest quest = questGID.HasValue ? Repository.CurrentDataContext.Quests.SingleOrDefault(q => q.gid == questGID.Value) : null;

                if (quest == null)
                {
                    questGID = Guid.NewGuid();
                    quest = new Domain.Quest()
                    {
                        gid = questGID.Value,
                        AuthorGID = Repository.CurrentUser.gid,
                        Name = "Новий квест",
                        ImagePath = "/libs/img/mazepa.jpg",
                        ShortInfo = "Коротенький опис нового квесту.",
                        FullInfo = "Історична довідка, що містить необхідну для проходження квесту інформацію."
                    };
                }

                Session["CreatedQuest"] = quest;
            }

            return url;
        }

        [WebMethod(EnableSession = true)]
        public string OpenCreateCheckPointPage(Guid? checkPointGID)
        {
            string url = "/Constructor/CreateCheckPoint.aspx";

            if (HttpContext.Current.Session != null && Session["CreatedQuest"] != null)
            {
                HistoryQuest.Domain.Quest quest = (HistoryQuest.Domain.Quest)Session["CreatedQuest"];

                if (!checkPointGID.HasValue)
                {
                    checkPointGID = Guid.NewGuid();
                }

                HistoryQuest.Domain.CheckPoint checkPoint = quest.CheckPoints.SingleOrDefault(cp => cp.gid == checkPointGID);

                if (checkPoint == null)
                {
                    checkPoint = new CheckPoint()
                    {
                        gid = checkPointGID.Value,
                        QuestGID = quest.gid,
                        AuthorGID = Repository.CurrentUser.gid,
                        GeoCoordinates = "0;0",
                        Name = "Новий чекпоінт",
                        Info = "Інформація необхідна для проходження завдань цього чекпоінту.",
                        IsBonus = false,
                        TasksCount = 0,
                        OrderId = 0
                    };
                }

                Session["CreatedCheckPoint"] = checkPoint;
            }
            else
            {
                url = "/Constructor/QuestsList.aspx";
            }

            return url;
        }

        [WebMethod(EnableSession = true)]
        public string OpenCreateTaskPage(Guid? taskGID)
        {
            string url = "/Constructor/CreateTask.aspx";

            if (HttpContext.Current.Session != null && Session["CreatedCheckPoint"] != null)
            {
                HistoryQuest.Domain.CheckPoint checkPoint = (HistoryQuest.Domain.CheckPoint)Session["CreatedCheckPoint"];

                if (!taskGID.HasValue)
                {
                    taskGID = Guid.NewGuid();
                }

                HistoryQuest.Domain.Task task = checkPoint.Tasks.SingleOrDefault(t => t.gid == taskGID.Value);

                if (task == null)
                {
                    task = new Task()
                    {
                        gid = taskGID.Value,
                        CheckPointGID = checkPoint.gid,
                        AuthorGID = Repository.CurrentUser.gid,
                        MaxScore = 0,
                        Text = "Текст завдання",
                        TaskTypeGID = Constants.TestTaskTypeGID,
                        SourceFile = null
                    };
                }

                Session["CreatedTask"] = task;
            }
            else
            {
                url = "/Constructor/QuestsList.aspx";
            }

            return url;
        }

        [WebMethod(EnableSession = true)]
        public string SaveQuest(string entity, bool save = true)
        {
            string url = "/Constructor/QuestsList.aspx";

            if (HttpContext.Current.Session != null && Session["CreatedQuest"] != null)
            {
                JavaScriptSerializer deserializer = new JavaScriptSerializer();
                Dictionary<string, object> data = (Dictionary<string, object>)deserializer.Deserialize(entity, typeof(object));

                HistoryQuest.Domain.Quest quest = (HistoryQuest.Domain.Quest)Session["CreatedQuest"];

                quest.Name = data["Name"].ToString();
                quest.ShortInfo = data["ShortInfo"].ToString();
                quest.FullInfo = data["FullInfo"].ToString();

                List<Dictionary<string, object>> checkPoints = (data["CheckPoints"] as IEnumerable<object>).Cast<Dictionary<string, object>>().ToList();
                var checkPointsGIDs = checkPoints.Select(cp => new Guid(cp["gid"].ToString())).ToList();
                var checkPointsToDelete = quest.CheckPoints.Where(cp => !checkPointsGIDs.Contains(cp.gid)).ToList();
                foreach (var checkPoint in checkPointsToDelete)
                {
                    quest.CheckPoints.Remove(checkPoint);
                }

                if (save)
                {
                    SaveQuestToDB(quest);
                    CleanConstructorSession();
                }
            }
            else
            {
                url = "/Constructor/QuestsList.aspx";
            }

            return url;
        }

        [WebMethod(EnableSession = true)]
        public string SaveCheckPoint(string entity, bool save = true)
        {
            string url = "/Constructor/CreateQuest.aspx";

            if (HttpContext.Current.Session != null && Session["CreatedQuest"] != null)
            {
                JavaScriptSerializer deserializer = new JavaScriptSerializer();
                Dictionary<string, object> data = (Dictionary<string, object>)deserializer.Deserialize(entity, typeof(object));

                HistoryQuest.Domain.Quest quest = (HistoryQuest.Domain.Quest)Session["CreatedQuest"];

                Guid checkPointGID = new Guid(data["gid"].ToString());
                HistoryQuest.Domain.CheckPoint checkPoint = quest.CheckPoints.SingleOrDefault(cp => cp.gid == checkPointGID);
                
                if (checkPoint == null)
                {
                    checkPoint = (HistoryQuest.Domain.CheckPoint)Session["CreatedCheckPoint"];
                    if (save)
                    {
                        quest.CheckPoints.Add(checkPoint);
                    }
                }

                List<Dictionary<string, object>> tasks = (data["Tasks"] as IEnumerable<object>).Cast<Dictionary<string, object>>().ToList();
                var tasksGIDs = tasks.Select(t => new Guid(t["gid"].ToString())).ToList();
                var tasksToDelete = checkPoint.Tasks.Where(t => !tasksGIDs.Contains(t.gid)).ToList();
                foreach (var task in tasksToDelete)
                {
                    checkPoint.Tasks.Remove(task);
                }

                checkPoint.ParentGID = data["ParentGID"].ToString() != "" ? new Guid(data["ParentGID"].ToString()) : new Guid?();
                checkPoint.Name = data["Name"].ToString();
                checkPoint.Info = data["Info"].ToString();
                checkPoint.TasksCount = int.Parse(data["TasksCount"].ToString());
                checkPoint.ThresholdScore = data["ThresholdScore"].ToString() != "" ? int.Parse(data["ThresholdScore"].ToString()) : new int?();
                checkPoint.GeoCoordinates = data["GeoCoordinates"].ToString();
            }
            else
            {
                url = "/Constructor/QuestsList.aspx";
            }

            return url;
        }

        [WebMethod(EnableSession = true)]
        public string SaveTask(string entity)
        {
            string url = "/Constructor/CreateCheckPoint.aspx";

            if (HttpContext.Current.Session != null && Session["CreatedCheckPoint"] != null)
            {
                JavaScriptSerializer deserializer = new JavaScriptSerializer();
                Dictionary<string, object> data = (Dictionary<string, object>)deserializer.Deserialize(entity, typeof(object));

                HistoryQuest.Domain.CheckPoint checkPoint = (HistoryQuest.Domain.CheckPoint)Session["CreatedCheckPoint"];

                Guid taskGID = data["TaskGID"] != null ? new Guid(data["TaskGID"].ToString()) : Guid.NewGuid();
                HistoryQuest.Domain.Task task = checkPoint.Tasks.SingleOrDefault(t => t.gid == taskGID);
                if (task == null)
                {
                    task = new Task()
                    {
                        gid = taskGID,
                        CheckPointGID = checkPoint.gid,
                        AuthorGID = Repository.CurrentUser.gid
                    };
                    checkPoint.Tasks.Add(task);
                }

                task.MaxScore = int.Parse(data["MaxScore"].ToString());
                task.TaskTypeGID = new Guid(data["TaskTypeGID"].ToString());
                task.Text = data["Text"].ToString();
                task.SourceFile = TasksController.GetXmlGenerator(task.TaskTypeGID).Generate((Dictionary<string, object>)data["Source"]);
            }
            else
            {
                url = "/Constructor/QuestsList.aspx";
            }

            return url;
        }
        
        private void SaveQuestToDB(HistoryQuest.Domain.Quest createdQuest)
        {
            var existingQuest = Repository.CurrentDataContext.Quests.SingleOrDefault(q => q.gid == createdQuest.gid);

            if (existingQuest == null)
            {
                Repository.CurrentDataContext.Quests.InsertOnSubmit(createdQuest);
            }
            else
            {
                existingQuest.Name = createdQuest.Name;
                existingQuest.ShortInfo = createdQuest.ShortInfo;
                existingQuest.FullInfo = createdQuest.FullInfo;
                existingQuest.AuthorGID = createdQuest.AuthorGID;
                
                foreach (var createdCheckPoint in createdQuest.CheckPoints)
                {
                    var existingCheckPoint = existingQuest.CheckPoints.SingleOrDefault(cp => cp.gid == createdCheckPoint.gid);
                    if (existingCheckPoint != null)
                    {
                        existingCheckPoint.Name = createdCheckPoint.Name;
                        existingCheckPoint.GeoCoordinates = createdCheckPoint.GeoCoordinates;
                        existingCheckPoint.Info = createdCheckPoint.Info;
                        existingCheckPoint.IsBonus = createdCheckPoint.IsBonus;
                        existingCheckPoint.TasksCount = createdCheckPoint.TasksCount;
                        existingCheckPoint.ThresholdScore = createdCheckPoint.ThresholdScore;
                        existingCheckPoint.AuthorGID = createdCheckPoint.AuthorGID;
                        existingCheckPoint.ParentGID = createdCheckPoint.ParentGID;
                        existingCheckPoint.OrderId = createdCheckPoint.OrderId;
                    }
                    else
                    {
                        existingCheckPoint = new CheckPoint()
                        {
                            gid = createdCheckPoint.gid,
                            QuestGID = createdQuest.gid,
                            Name = createdCheckPoint.Name,
                            GeoCoordinates = createdCheckPoint.GeoCoordinates,
                            Info = createdCheckPoint.Info,
                            IsBonus = createdCheckPoint.IsBonus,
                            TasksCount = createdCheckPoint.TasksCount,
                            ThresholdScore = createdCheckPoint.ThresholdScore,
                            AuthorGID = createdCheckPoint.AuthorGID,
                            ParentGID = createdCheckPoint.ParentGID,
                            OrderId = createdCheckPoint.OrderId
                        };
                        existingQuest.CheckPoints.Add(existingCheckPoint);
                    }

                    foreach (var createdTask in createdCheckPoint.Tasks)
                    {
                        var existingTask = existingCheckPoint.Tasks.SingleOrDefault(t => t.gid == createdTask.gid);
                        if (existingTask != null)
                        {
                            existingTask.Text = createdTask.Text;
                            existingTask.MaxScore = createdTask.MaxScore;
                            existingTask.TaskTypeGID = createdTask.TaskTypeGID;
                            existingTask.SourceFile = createdTask.SourceFile;
                            existingTask.AuthorGID = createdTask.AuthorGID;
                        }
                        else
                        {
                            var task = new HistoryQuest.Domain.Task()
                            {
                                gid = createdTask.gid,
                                Text = createdTask.Text,
                                MaxScore = createdTask.MaxScore,
                                TaskTypeGID = createdTask.TaskTypeGID,
                                SourceFile = createdTask.SourceFile,
                                AuthorGID = createdTask.AuthorGID,
                                CheckPointGID = createdTask.CheckPointGID
                            };

                            existingCheckPoint.Tasks.Add(task);
                        }
                    }

                    List<Task> deletedTasks = new List<Task>();
                    foreach (var existingTask in existingCheckPoint.Tasks)
                    {
                        if (!createdCheckPoint.Tasks.Any(t => t.gid == existingTask.gid))
                        {
                            deletedTasks.Add(existingTask);
                        }
                    }

                    foreach (var deletedTask in deletedTasks)
                    {
                        existingCheckPoint.Tasks.Remove(deletedTask);
                    }

                    Repository.CurrentDataContext.Tasks.DeleteAllOnSubmit(deletedTasks);
                }

                List<CheckPoint> deletedCheckPoints = new List<CheckPoint>();
                foreach (var existingCheckPoint in existingQuest.CheckPoints)
                {
                    if (!createdQuest.CheckPoints.Any(cp => cp.gid == existingCheckPoint.gid))
                    {
                        deletedCheckPoints.Add(existingCheckPoint);
                    }
                }
                
                foreach (var deletedCheckPoint in deletedCheckPoints)
                {
                    existingQuest.CheckPoints.Remove(deletedCheckPoint);
                }

                Repository.CurrentDataContext.CheckPoints.DeleteAllOnSubmit(deletedCheckPoints);
            }

            Repository.CurrentDataContext.SubmitChanges();
        }

        public static void CleanConstructorSession()
        {
            if (HttpContext.Current.Session != null)
            {
                HttpContext.Current.Session["CreatedQuest"] = null;
                HttpContext.Current.Session["CreatedCheckPoint"] = null;
                HttpContext.Current.Session["CreatedTask"] = null;
            }
        }

        #endregion
    }
}
