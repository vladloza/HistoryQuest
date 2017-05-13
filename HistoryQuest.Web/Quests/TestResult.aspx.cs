using HistoryQuest.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistoryQuest.Quests
{
    public partial class TestResult : BasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            int currentTaskId;
            List<Guid> tasksList;
            if (Session != null && Session["CurrentQuestGID"] != null && WebServices.WebService.LoadTasksFromSession(out tasksList, out currentTaskId))
            {
                HistoryQuest.Domain.CheckPointsToTry checkPointToTry = 
                    Repository.CurrentDataContext.CheckPointsToTries.SingleOrDefault(cpt => cpt.gid == new Guid(Session["CurrentCheckPointTryGID"].ToString()));

                var fullCurrentTasksList = checkPointToTry.CheckPoint.Tasks.Where(t => tasksList.Contains(t.gid)).ToList();

                int totalScore = checkPointToTry.TasksToTries.Sum(t => t.EarnedScore);
                int maxScore = fullCurrentTasksList.Sum(t => t.MaxScore);
                float taskCount = checkPointToTry.CheckPoint.TasksCount;

                RadialPercent.Attributes["data-value"] = (100 * totalScore / (float)maxScore).ToString().Replace(",", ".");
                RedialCount.Attributes["data-value"] = checkPointToTry.TasksToTries.Sum(t => t.EarnedScore / (float)t.Task.MaxScore).ToString().Replace(",", ".");
                RedialCount.Attributes["data-maxvalue"] = fullCurrentTasksList.Count.ToString().Replace(",", ".");

                ResultTitle.InnerText = checkPointToTry.CheckPoint.ThresholdScore == null || 
                    totalScore >= checkPointToTry.CheckPoint.ThresholdScore.Value ? "Тест пройдений!" : "Тест не пройдений!";
                
                WebServices.WebService.CleanCheckPointSession();
            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
        }
    }
}