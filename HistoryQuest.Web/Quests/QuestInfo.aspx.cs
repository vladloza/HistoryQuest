using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistoryQuest.Quests
{
    public partial class QuestInfo : BasePage
    {
        protected Guid QuestGID;

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            if (Session == null || Session["CurrentQuestGID"] == null || !Guid.TryParse(Session["CurrentQuestGID"].ToString(), out QuestGID))
            {
                Response.Redirect("~/Default.aspx");
            }
        }
    }
}