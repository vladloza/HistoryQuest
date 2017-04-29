using HistoryQuest.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistoryQuest
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void ExitButton_Click(object sender, EventArgs e)
        {
            Repository.CurrentUser = null;
            Response.Redirect("~/Login.aspx");
        }
    }
}