using HistoryQuest.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace HistoryQuest.Quests
{
    public abstract class BaseTaskPage : BasePage
    {
        protected HistoryQuest.Domain.Task task;
        protected int currentTaskId;

        protected List<Guid> tasksList;

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            if (WebServices.WebService.LoadTasksFromSession(out tasksList, out currentTaskId))
            {
                task = Repository.CurrentDataContext.Tasks.SingleOrDefault(t => t.gid == tasksList[currentTaskId]);

                Tasks tasksMaster = Master as Tasks;
                if (tasksMaster != null)
                {
                    tasksMaster.TaskHeaderControl.InnerText = string.Format("{0}. {1}", task.CheckPoint.Quest.Name, task.CheckPoint.Name);
                    tasksMaster.QuestionTextControl.InnerText = task.Text;
                    tasksMaster.TaskDivControl.Attributes["TaskGID"] = task.gid.ToString();
                    tasksMaster.TaskDivControl.Attributes["TaskTypeGID"] = task.TaskTypeGID.ToString();
                    tasksMaster.TaskNumberControl.InnerText = string.Format("{0} из {1}", currentTaskId + 1, tasksList.Count);
                    tasksMaster.ProgressBarControl.Attributes["style"] = string.Format("width: {0}%", 100 * (currentTaskId) / (float)tasksList.Count).Replace(",", ".");
                }
            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
        }
    }
}