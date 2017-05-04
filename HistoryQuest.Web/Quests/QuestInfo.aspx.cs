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
            if (Session["CurrentQuestGID"] != null)
            {
                QuestGID = new Guid(Session["CurrentQuestGID"].ToString());
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }

            base.Page_Load(sender, e);
        }
    }
}