using HistoryQuest.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistoryQuest.Quests
{
    public partial class Task : BaseTaskPage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            
            TaskHeader.InnerText = string.Format("{0}. {1}", task.CheckPoint.Quest.Name, task.CheckPoint.Name);
            QuestionText.InnerText = task.Name;

            //Load Xml file with task sources
            List<string> answers = new List<string>() { "Answer1", "Answer2", "Answer3", "Answer4" };
        }
    }
}