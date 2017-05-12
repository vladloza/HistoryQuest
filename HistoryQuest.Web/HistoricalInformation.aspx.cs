using HistoryQuest.Domain;
using HistoryQuest.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistoryQuest
{
    public partial class HistoricalInformation : BasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            Guid QuestGID = Guid.Empty;
            if (Session != null && Session["CurrentQuestGID"] != null && Guid.TryParse(Session["CurrentQuestGID"].ToString(), out QuestGID))
            {
                DataManager.AddStringVariable("CurrentQuestGID", QuestGID.ToString());

                HistoryQuest.Domain.Quest quest = Repository.CurrentDataContext.Quests.SingleOrDefault(q => q.gid == QuestGID);

                if (quest != null)
                {
                    questFullInfo.InnerHtml = quest.FullInfo;
                }
            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
        }
    }
}