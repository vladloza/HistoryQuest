using HistoryQuest.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistoryQuest
{
    public partial class Quest : BasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            (Master as HistoryQuest.Main).MainMenuHistoricalInfoButton.Attributes["style"] = "";

            Guid queryGID = Guid.Empty;
            if (Guid.TryParse(Session["CurrentQuestGID"].ToString(), out queryGID))
            {
                DataManager.AddStringVariable("CurrentQuestGID", queryGID.ToString());
            }
        }
    }
}