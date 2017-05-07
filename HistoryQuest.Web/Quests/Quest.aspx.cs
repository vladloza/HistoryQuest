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

            Guid queryGID = Guid.Empty;
            if (Session != null && Session["CurrentQuestGID"] != null && Guid.TryParse(Session["CurrentQuestGID"].ToString(), out queryGID))
            {
                DataManager.AddStringVariable("CurrentQuestGID", queryGID.ToString());
            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
        }
    }
}