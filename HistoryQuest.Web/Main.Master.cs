using HistoryQuest.Domain;
using HistoryQuest.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
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

        protected void Page_PreRender(object sender, EventArgs e)
        {
            using (HtmlGenericControl metaDataScript = new HtmlGenericControl("script"))
            {
                metaDataScript.Attributes.Add("type", "text/javascript");
                metaDataScript.InnerHtml = DataManager.GetData();
                Page.Header.Controls.AddAt(6, metaDataScript);
            }
        }
    }
}