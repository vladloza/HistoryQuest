using HistoryQuest.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HistoryQuest
{
    public class BasePage : System.Web.UI.Page
    {
        protected virtual void Page_Load(object sender, EventArgs e)
        {
            if (Repository.CurrentUser == null)
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void ShowInfoButton(bool show = true)
        {
            HistoryQuest.Main master = (Master as HistoryQuest.Main);

            if (master != null)
            {
                master.MainMenuHistoricalInfoButton.Attributes["style"] = show ? "" : "display: none";
            }
        }
    }
}