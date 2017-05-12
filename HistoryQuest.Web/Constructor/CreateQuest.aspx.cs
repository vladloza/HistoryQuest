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
    public partial class CreateQuest : BasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            if (Session != null && Session["CreatedQuestGID"] != null)
            {
                Guid questGID = new Guid(Session["CreatedQuestGID"].ToString());
                HistoryQuest.Domain.Quest quest = Repository.CurrentDataContext.Quests.SingleOrDefault(q => q.gid == questGID);

                if (quest != null)
                {
                    QuestName.Value = quest.Name;
                    ShortInfo.InnerText = quest.ShortInfo;

                    if (quest.CheckPoints.Count > 0)
                    {
                        var checkPointsList = quest.CheckPoints.Select(cp => new { id = cp.OrderId,
                            cp.gid,
                            cp.Name,
                            cp.Info,
                            cp.TasksCount,
                            cp.ThresholdScore
                        }).OrderBy(cp => cp.id).ToList();

                        JavaScriptSerializer serializer = new JavaScriptSerializer();
                        DataManager.AddVariable("CreatedCheckPoints", serializer.Serialize(checkPointsList));
                    }
                }
                else
                {
                    Response.Redirect("/Default.aspx");
                }
            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
        }
    }
}