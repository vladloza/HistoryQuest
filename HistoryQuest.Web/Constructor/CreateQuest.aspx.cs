using HistoryQuest.Domain;
using HistoryQuest.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistoryQuest.Constructor
{
    public partial class CreateQuest : ConstructorBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            if (Session != null && Session["CreatedQuest"] != null)
            {
                HistoryQuest.Domain.Quest quest = (HistoryQuest.Domain.Quest)Session["CreatedQuest"];

                var existingQuest = Repository.CurrentDataContext.Quests.SingleOrDefault(q => q.gid == quest.gid);
                if (existingQuest != null)
                {
                    ContructorTitle.InnerText = string.Format("Редагування квесту \"{0}\"", existingQuest.Name);
                }
                else
                {
                    ContructorTitle.InnerText = string.Format("Створення нового квесту");
                }

                QuestName.Value = quest.Name;
                ShortInfo.InnerText = quest.ShortInfo;
                FullInfo.InnerText = quest.FullInfo;

                if (quest.CheckPoints.Count > 0)
                {
                    var checkPointsList = quest.CheckPoints.Select(cp => new
                    {
                        id = cp.OrderId,
                        cp.gid,
                        cp.Name,
                        Info = HttpUtility.HtmlEncode(cp.Info),
                        cp.TasksCount,
                        cp.ThresholdScore,
                        cp.ParentGID
                    }).OrderBy(cp => cp.id).ToList();
                    
                    JavaScriptSerializer serializer = new JavaScriptSerializer();
                    DataManager.AddVariable("CreatedCheckPoints", serializer.Serialize(checkPointsList));
                }
            }
            else
            {
                Response.Redirect("/Constructor/QuestsList.aspx");
            }
        }
    }
}